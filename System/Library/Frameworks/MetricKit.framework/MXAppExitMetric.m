@interface MXAppExitMetric
+ (BOOL)supportsSecureCoding;
- (MXAppExitMetric)initWithCoder:(id)a3;
- (MXAppExitMetric)initWithForegroundExitData:(id)a3 backgroundExitData:(id)a4;
- (MXBackgroundExitData)backgroundExitData;
- (MXForegroundExitData)foregroundExitData;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXAppExitMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  foregroundExitData = self->_foregroundExitData;
  id v5 = a3;
  [v5 encodeObject:foregroundExitData forKey:@"foregroundExitData"];
  [v5 encodeObject:self->_backgroundExitData forKey:@"backgroundExitData"];
}

- (MXAppExitMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXAppExitMetric;
  id v5 = [(MXMetric *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundExitData"];
    foregroundExitData = v5->_foregroundExitData;
    v5->_foregroundExitData = (MXForegroundExitData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundExitData"];
    backgroundExitData = v5->_backgroundExitData;
    v5->_backgroundExitData = (MXBackgroundExitData *)v8;
  }
  return v5;
}

- (MXAppExitMetric)initWithForegroundExitData:(id)a3 backgroundExitData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MXAppExitMetric;
  v9 = [(MXMetric *)&v13 init];
  p_isa = (id *)&v9->super.super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  objc_super v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_foregroundExitData, a3);
    objc_storeStrong(p_isa + 3, a4);
LABEL_5:
    objc_super v11 = p_isa;
  }

  return v11;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  foregroundExitData = self->_foregroundExitData;
  if (foregroundExitData)
  {
    id v5 = [(MXForegroundExitData *)foregroundExitData toDictionary];
    [v3 setObject:v5 forKey:@"foregroundExitData"];
  }
  backgroundExitData = self->_backgroundExitData;
  if (backgroundExitData)
  {
    id v7 = [(MXBackgroundExitData *)backgroundExitData toDictionary];
    [v3 setObject:v7 forKey:@"backgroundExitData"];
  }

  return v3;
}

- (MXForegroundExitData)foregroundExitData
{
  return (MXForegroundExitData *)objc_getProperty(self, a2, 16, 1);
}

- (MXBackgroundExitData)backgroundExitData
{
  return (MXBackgroundExitData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundExitData, 0);

  objc_storeStrong((id *)&self->_foregroundExitData, 0);
}

@end