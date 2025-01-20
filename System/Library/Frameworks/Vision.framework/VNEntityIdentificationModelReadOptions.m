@interface VNEntityIdentificationModelReadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSIndexSet)acceptableVersions;
- (VNEntityIdentificationModelReadOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptableVersions:(id)a3;
@end

@implementation VNEntityIdentificationModelReadOptions

- (void).cxx_destruct
{
}

- (void)setAcceptableVersions:(id)a3
{
}

- (NSIndexSet)acceptableVersions
{
  return (NSIndexSet *)objc_getProperty(self, a2, 8, 1);
}

- (VNEntityIdentificationModelReadOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VNEntityIdentificationModelReadOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptableVersions"];
    acceptableVersions = v5->_acceptableVersions;
    v5->_acceptableVersions = (NSIndexSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4) {
    [v4 setAcceptableVersions:self->_acceptableVersions];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNEntityIdentificationModelReadOptions *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(VNEntityIdentificationModelReadOptions *)self acceptableVersions];
      v7 = [(VNEntityIdentificationModelReadOptions *)v5 acceptableVersions];

      char v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSIndexSet *)self->_acceptableVersions hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end