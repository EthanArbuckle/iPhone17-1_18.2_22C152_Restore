@interface GTCaptureArchiveOverrideKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GTCaptureArchiveOverrideKey)initWithCoder:(id)a3;
- (NSNumber)riaGeneration;
- (NSString)platform;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRiaGeneration:(id)a3;
@end

@implementation GTCaptureArchiveOverrideKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_riaGeneration, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

- (void)setRiaGeneration:(id)a3
{
}

- (NSNumber)riaGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 platform];
    platform = self->_platform;
    if (v7 == platform
      || ([v6 platform],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:self->_platform]))
    {
      v10 = [v6 riaGeneration];
      if (v10 == self->_riaGeneration)
      {
        unsigned __int8 v9 = 1;
      }
      else
      {
        v11 = [v6 riaGeneration];
        unsigned __int8 v9 = [v11 isEqualToNumber:self->_riaGeneration];
      }
      if (v7 == platform) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  unsigned __int8 v9 = 0;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_platform hash];
  return (unint64_t)[(NSNumber *)self->_riaGeneration hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(GTCaptureArchiveOverrideKey);
  [(GTCaptureArchiveOverrideKey *)v4 setPlatform:self->_platform];
  [(GTCaptureArchiveOverrideKey *)v4 setRiaGeneration:self->_riaGeneration];
  return v4;
}

- (GTCaptureArchiveOverrideKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTCaptureArchiveOverrideKey;
  id v5 = [(GTCaptureArchiveOverrideKey *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    platform = v5->_platform;
    v5->_platform = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"riaGeneration"];
    riaGeneration = v5->_riaGeneration;
    v5->_riaGeneration = (NSNumber *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  platform = self->_platform;
  id v5 = a3;
  [v5 encodeObject:platform forKey:@"platform"];
  [v5 encodeObject:self->_riaGeneration forKey:@"riaGeneration"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end