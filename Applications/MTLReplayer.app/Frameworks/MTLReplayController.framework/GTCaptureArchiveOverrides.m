@interface GTCaptureArchiveOverrides
+ (BOOL)supportsSecureCoding;
+ (id)allowedClasses;
- (GTCaptureArchiveOverrides)init;
- (GTCaptureArchiveOverrides)initWithCoder:(id)a3;
- (NSDictionary)filenameOverrides;
- (void)encodeWithCoder:(id)a3;
- (void)setFilenameOverrides:(id)a3;
@end

@implementation GTCaptureArchiveOverrides

- (void).cxx_destruct
{
}

- (void)setFilenameOverrides:(id)a3
{
}

- (NSDictionary)filenameOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (GTCaptureArchiveOverrides)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTCaptureArchiveOverrides;
  v5 = [(GTCaptureArchiveOverrides *)&v11 init];
  if (v5)
  {
    v6 = [v4 allowedClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"filenameOverrides"];
    filenameOverrides = v5->_filenameOverrides;
    v5->_filenameOverrides = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (GTCaptureArchiveOverrides)init
{
  v7.receiver = self;
  v7.super_class = (Class)GTCaptureArchiveOverrides;
  v2 = [(GTCaptureArchiveOverrides *)&v7 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    filenameOverrides = v2->_filenameOverrides;
    v2->_filenameOverrides = v3;

    v5 = v2;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (id)allowedClasses
{
  if (allowedClasses_onceToken != -1) {
    dispatch_once(&allowedClasses_onceToken, &__block_literal_global_9818);
  }
  v2 = (void *)allowedClasses_allowedClasses;

  return v2;
}

void __43__GTCaptureArchiveOverrides_allowedClasses__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  objc_super v7 = (void *)allowedClasses_allowedClasses;
  allowedClasses_allowedClasses = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end