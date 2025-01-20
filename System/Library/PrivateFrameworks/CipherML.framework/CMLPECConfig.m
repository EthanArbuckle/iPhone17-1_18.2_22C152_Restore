@interface CMLPECConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPECConfig:(id)a3;
- (CMLPECConfig)initWithCoder:(id)a3;
- (CMLPECConfig)initWithPECConfig:(id)a3 keyStatus:(id)a4;
- (NSData)serializedKeyStatus;
- (NSData)serializedPECConfig;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLPECConfig

- (CMLPECConfig)initWithPECConfig:(id)a3 keyStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMLPECConfig;
  v8 = [(CMLPECConfig *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    serializedPECConfig = v8->_serializedPECConfig;
    v8->_serializedPECConfig = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    serializedKeyStatus = v8->_serializedKeyStatus;
    v8->_serializedKeyStatus = (NSData *)v11;
  }
  return v8;
}

- (BOOL)isEqualToPECConfig:(id)a3
{
  id v4 = a3;
  v5 = [(CMLPECConfig *)self serializedPECConfig];
  id v6 = [v4 serializedPECConfig];
  if ([v5 isEqualToData:v6])
  {
    id v7 = [(CMLPECConfig *)self serializedKeyStatus];
    v8 = [v4 serializedKeyStatus];
    char v9 = [v7 isEqualToData:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CMLPECConfig *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLPECConfig *)self isEqualToPECConfig:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(CMLPECConfig *)self serializedPECConfig];
  uint64_t v4 = [v3 hash];
  v5 = [(CMLPECConfig *)self serializedKeyStatus];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLPECConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedPECConfig"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedKeyStatus"];

  id v7 = [(CMLPECConfig *)self initWithPECConfig:v5 keyStatus:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CMLPECConfig *)self serializedPECConfig];
  [v4 encodeObject:v5 forKey:@"serializedPECConfig"];

  id v6 = [(CMLPECConfig *)self serializedKeyStatus];
  [v4 encodeObject:v6 forKey:@"serializedKeyStatus"];
}

- (NSData)serializedPECConfig
{
  return self->_serializedPECConfig;
}

- (NSData)serializedKeyStatus
{
  return self->_serializedKeyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedKeyStatus, 0);
  objc_storeStrong((id *)&self->_serializedPECConfig, 0);
}

@end