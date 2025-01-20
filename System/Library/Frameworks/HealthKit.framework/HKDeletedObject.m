@interface HKDeletedObject
+ (BOOL)supportsSecureCoding;
+ (id)_deletedObjectWithUUID:(id)a3 metadata:(id)a4;
+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKDeletedObject)initWithCoder:(id)a3;
- (NSDictionary)metadata;
- (NSUUID)UUID;
- (id)_init;
- (id)description;
- (int64_t)externalSyncObjectCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExternalSyncObjectCode:(int64_t)a3;
- (void)setMetadata:(id)a3;
@end

@implementation HKDeletedObject

+ (id)_deletedObjectWithUUID:(id)a3 metadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [objc_alloc((Class)a1) _init];
  objc_storeStrong((id *)(v10 + 8), a3);
  uint64_t v11 = [v9 copy];
  v12 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v11;

  if (v9)
  {
    id v22 = 0;
    char v13 = objc_msgSend(v9, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", 0, HKApplicationSDKVersionToken(), &v22);
    id v14 = v22;
    if ((v13 & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 34, @"Error: %@", v14 object file lineNumber description];
    }
    if ([v9 count] != 2)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 35, @"Invalid parameter not satisfying: %@", @"[metadata count] == 2" object file lineNumber description];
    }
    v15 = [v9 objectForKeyedSubscript:@"HKMetadataKeySyncIdentifier"];

    if (!v15)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 36, @"Invalid parameter not satisfying: %@", @"metadata[HKMetadataKeySyncIdentifier] != nil" object file lineNumber description];
    }
    v16 = [v9 objectForKeyedSubscript:@"HKMetadataKeySyncVersion"];

    if (!v16)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 37, @"Invalid parameter not satisfying: %@", @"metadata[HKMetadataKeySyncVersion] != nil" object file lineNumber description];
    }
  }

  return (id)v10;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKDeletedObject;
  return [(HKDeletedObject *)&v3 init];
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = (void *)v8;
  if (!(v7 | v8))
  {
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 54, @"Invalid parameter not satisfying: %@", @"syncIdentifier != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
LABEL_10:
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HKDeletedObject.m", 55, @"Invalid parameter not satisfying: %@", @"syncVersion != nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v10 = objc_opt_new();
  [v10 setObject:v7 forKeyedSubscript:@"HKMetadataKeySyncIdentifier"];
  [v10 setObject:v9 forKeyedSubscript:@"HKMetadataKeySyncVersion"];
LABEL_6:

  return v10;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    UUID = self->_UUID;
    v6 = [v4 UUID];
    char v7 = [(NSUUID *)UUID isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  metadata = self->_metadata;
  if (metadata && [(NSDictionary *)metadata count])
  {
    id v4 = [NSString stringWithFormat:@" %@", self->_metadata];
  }
  else
  {
    id v4 = 0;
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(NSUUID *)self->_UUID UUIDString];
  unint64_t v8 = (void *)v7;
  id v9 = &stru_1EEC60288;
  if (v4) {
    id v9 = v4;
  }
  uint64_t v10 = [v5 stringWithFormat:@"<%@ %@%@>", v6, v7, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKDeletedObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDeletedObject *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v9;
  }
  return v5;
}

- (void)setMetadata:(id)a3
{
}

- (int64_t)externalSyncObjectCode
{
  return self->_externalSyncObjectCode;
}

- (void)setExternalSyncObjectCode:(int64_t)a3
{
  self->_externalSyncObjectCode = a3;
}

@end