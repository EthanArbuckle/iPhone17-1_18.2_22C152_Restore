@interface MXSignpostMetric
+ (BOOL)supportsSecureCoding;
- (MXSignpostIntervalData)signpostIntervalData;
- (MXSignpostMetric)initWithCoder:(id)a3;
- (MXSignpostMetric)initWithSignpostName:(id)a3 withSignpostCategory:(id)a4 withTotalCount:(unint64_t)a5 withSignpostIntervalData:(id)a6;
- (NSString)signpostCategory;
- (NSString)signpostName;
- (NSUInteger)totalCount;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXSignpostMetric

- (MXSignpostMetric)initWithSignpostName:(id)a3 withSignpostCategory:(id)a4 withTotalCount:(unint64_t)a5 withSignpostIntervalData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MXSignpostMetric;
  v14 = [(MXMetric *)&v18 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_5;
  }
  v16 = 0;
  if (v11 && v12)
  {
    objc_storeStrong((id *)&v14->_signpostName, a3);
    objc_storeStrong((id *)&v15->_signpostCategory, a4);
    v15->_totalCount = a5;
    objc_storeStrong((id *)&v15->_signpostIntervalData, a6);
LABEL_5:
    v16 = v15;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  signpostName = self->_signpostName;
  id v5 = a3;
  [v5 encodeObject:signpostName forKey:@"signpostName"];
  [v5 encodeObject:self->_signpostCategory forKey:@"signpostCategory"];
  [v5 encodeInteger:self->_totalCount forKey:@"totalSignpostCount"];
  [v5 encodeObject:self->_signpostIntervalData forKey:@"signpostIntervalData"];
}

- (MXSignpostMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXSignpostMetric;
  id v5 = [(MXMetric *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostName"];
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostCategory"];
    signpostCategory = v5->_signpostCategory;
    v5->_signpostCategory = (NSString *)v8;

    v5->_totalCount = [v4 decodeIntegerForKey:@"totalSignpostCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostIntervalData"];
    signpostIntervalData = v5->_signpostIntervalData;
    v5->_signpostIntervalData = (MXSignpostIntervalData *)v10;
  }
  return v5;
}

- (id)toDictionary
{
  if (self->_signpostName && self->_signpostCategory)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:self->_signpostName forKey:@"signpostName"];
    [v3 setObject:self->_signpostCategory forKey:@"signpostCategory"];
    id v4 = [NSNumber numberWithUnsignedInteger:self->_totalCount];
    [v3 setObject:v4 forKey:@"totalSignpostCount"];

    signpostIntervalData = self->_signpostIntervalData;
    if (signpostIntervalData)
    {
      uint64_t v6 = [(MXSignpostIntervalData *)signpostIntervalData toDictionary];
      [v3 setObject:v6 forKey:@"signpostIntervalData"];
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x263EFFA78];
  }

  return v3;
}

- (NSString)signpostName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)signpostCategory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (MXSignpostIntervalData)signpostIntervalData
{
  return (MXSignpostIntervalData *)objc_getProperty(self, a2, 32, 1);
}

- (NSUInteger)totalCount
{
  return self->_totalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostIntervalData, 0);
  objc_storeStrong((id *)&self->_signpostCategory, 0);

  objc_storeStrong((id *)&self->_signpostName, 0);
}

@end