@interface CMLPIRConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPIRConfig:(id)a3;
- (CMLPIRConfig)initWithCoder:(id)a3;
- (CMLPIRConfig)initWithPIRConfig:(id)a3 keyStatus:(id)a4;
- (NSData)serializedKeyStatus;
- (NSData)serializedPIRConfig;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLPIRConfig

- (CMLPIRConfig)initWithPIRConfig:(id)a3 keyStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMLPIRConfig;
  v8 = [(CMLPIRConfig *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    serializedPIRConfig = v8->_serializedPIRConfig;
    v8->_serializedPIRConfig = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    serializedKeyStatus = v8->_serializedKeyStatus;
    v8->_serializedKeyStatus = (NSData *)v11;
  }
  return v8;
}

- (BOOL)isEqualToPIRConfig:(id)a3
{
  id v4 = a3;
  v5 = [(CMLPIRConfig *)self serializedPIRConfig];
  id v6 = [v4 serializedPIRConfig];
  if ([v5 isEqualToData:v6])
  {
    id v7 = [(CMLPIRConfig *)self serializedKeyStatus];
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
  id v4 = (CMLPIRConfig *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLPIRConfig *)self isEqualToPIRConfig:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(CMLPIRConfig *)self serializedPIRConfig];
  uint64_t v4 = [v3 hash];
  v5 = [(CMLPIRConfig *)self serializedKeyStatus];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLPIRConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedPIRConfig"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedKeyStatus"];

  id v7 = [(CMLPIRConfig *)self initWithPIRConfig:v5 keyStatus:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CMLPIRConfig *)self serializedPIRConfig];
  [v4 encodeObject:v5 forKey:@"serializedPIRConfig"];

  id v6 = [(CMLPIRConfig *)self serializedKeyStatus];
  [v4 encodeObject:v6 forKey:@"serializedKeyStatus"];
}

- (NSData)serializedPIRConfig
{
  return self->_serializedPIRConfig;
}

- (NSData)serializedKeyStatus
{
  return self->_serializedKeyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedKeyStatus, 0);
  objc_storeStrong((id *)&self->_serializedPIRConfig, 0);
}

@end