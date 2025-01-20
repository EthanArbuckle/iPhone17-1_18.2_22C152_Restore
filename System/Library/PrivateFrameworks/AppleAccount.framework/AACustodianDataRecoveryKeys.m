@interface AACustodianDataRecoveryKeys
+ (BOOL)supportsSecureCoding;
- (AACustodianDataRecoveryKeys)initWithCoder:(id)a3;
- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5;
- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5 recordBuildVersion:(id)a6;
- (NSData)wrappedRKC;
- (NSData)wrappingKey;
- (NSString)recordBuildVersion;
- (NSUUID)custodianUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCustodianUUID:(id)a3;
- (void)setRecordBuildVersion:(id)a3;
- (void)setWrappedRKC:(id)a3;
- (void)setWrappingKey:(id)a3;
@end

@implementation AACustodianDataRecoveryKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianDataRecoveryKeys)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AACustodianDataRecoveryKeys *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappedRKC"];
    wrappedRKC = v5->_wrappedRKC;
    v5->_wrappedRKC = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrappingKey"];
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianUUID"];
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordBuildVersion"];
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  wrappedRKC = self->_wrappedRKC;
  id v5 = a3;
  [v5 encodeObject:wrappedRKC forKey:@"_wrappedRKC"];
  [v5 encodeObject:self->_wrappingKey forKey:@"_wrappingKey"];
  [v5 encodeObject:self->_custodianUUID forKey:@"_custodianUUID"];
  [v5 encodeObject:self->_recordBuildVersion forKey:@"_recordBuildVersion"];
}

- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5
{
  return [(AACustodianDataRecoveryKeys *)self initWithWrappedRKC:a3 wrappingKey:a4 custodianUUID:a5 recordBuildVersion:0];
}

- (AACustodianDataRecoveryKeys)initWithWrappedRKC:(id)a3 wrappingKey:(id)a4 custodianUUID:(id)a5 recordBuildVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AACustodianDataRecoveryKeys;
  v15 = [(AACustodianDataRecoveryKeys *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_wrappedRKC, a3);
    objc_storeStrong((id *)&v16->_wrappingKey, a4);
    objc_storeStrong((id *)&v16->_custodianUUID, a5);
    objc_storeStrong((id *)&v16->_recordBuildVersion, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AACustodianDataRecoveryKeys allocWithZone:a3] init];
  uint64_t v5 = [(NSData *)self->_wrappedRKC copy];
  wrappedRKC = v4->_wrappedRKC;
  v4->_wrappedRKC = (NSData *)v5;

  uint64_t v7 = [(NSData *)self->_wrappingKey copy];
  wrappingKey = v4->_wrappingKey;
  v4->_wrappingKey = (NSData *)v7;

  uint64_t v9 = [(NSUUID *)self->_custodianUUID copy];
  custodianUUID = v4->_custodianUUID;
  v4->_custodianUUID = (NSUUID *)v9;

  uint64_t v11 = [(NSString *)self->_recordBuildVersion copy];
  recordBuildVersion = v4->_recordBuildVersion;
  v4->_recordBuildVersion = (NSString *)v11;

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSUUID *)self->_custodianUUID UUIDString];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> for UUID: %@ recordBuildVersion: %@", v4, self, v5, self->_recordBuildVersion];

  return v6;
}

- (NSData)wrappedRKC
{
  return self->_wrappedRKC;
}

- (void)setWrappedRKC:(id)a3
{
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (void)setWrappingKey:(id)a3
{
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);

  objc_storeStrong((id *)&self->_wrappedRKC, 0);
}

@end