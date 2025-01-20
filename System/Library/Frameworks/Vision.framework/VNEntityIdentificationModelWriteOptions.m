@interface VNEntityIdentificationModelWriteOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readOnly;
- (VNEntityIdentificationModelWriteOptions)init;
- (VNEntityIdentificationModelWriteOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation VNEntityIdentificationModelWriteOptions

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (VNEntityIdentificationModelWriteOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VNEntityIdentificationModelWriteOptions *)self init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    v5->_readOnly = [v4 decodeBoolForKey:@"readonly"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeBool:self->_readOnly forKey:@"readonly"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4)
  {
    [v4 setVersion:self->_version];
    [v5 setReadOnly:self->_readOnly];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNEntityIdentificationModelWriteOptions *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(VNEntityIdentificationModelWriteOptions *)self version];
      if (v6 == [(VNEntityIdentificationModelWriteOptions *)v5 version])
      {
        BOOL v7 = [(VNEntityIdentificationModelWriteOptions *)self readOnly];
        BOOL v8 = v7 ^ [(VNEntityIdentificationModelWriteOptions *)v5 readOnly] ^ 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = 357908480;
  if (!self->_readOnly) {
    uint64_t v2 = 178954240;
  }
  return v2 ^ self->_version;
}

- (VNEntityIdentificationModelWriteOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)VNEntityIdentificationModelWriteOptions;
  result = [(VNEntityIdentificationModelWriteOptions *)&v3 init];
  if (result)
  {
    result->_unint64_t version = 0;
    result->_readOnly = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end