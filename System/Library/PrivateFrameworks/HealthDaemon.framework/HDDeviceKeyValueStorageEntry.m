@interface HDDeviceKeyValueStorageEntry
- (BOOL)isEqual:(id)a3;
- (HDDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6 syncIdentity:(id)a7 category:(int64_t)a8;
- (HDSyncIdentity)syncIdentity;
- (NSData)value;
- (NSDate)modificationDate;
- (NSString)domain;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateValue:(id *)a3;
- (id)description;
- (id)numberValue:(id *)a3;
- (id)stringValue:(id *)a3;
- (int64_t)protectionCategory;
- (unint64_t)hash;
@end

@implementation HDDeviceKeyValueStorageEntry

- (HDDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6 syncIdentity:(id)a7 category:(int64_t)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDDeviceKeyValueStorageEntry;
  v18 = [(HDDeviceKeyValueStorageEntry *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a3);
    objc_storeStrong((id *)&v19->_key, a4);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_modificationDate, a6);
    objc_storeStrong((id *)&v19->_syncIdentity, a7);
    v19->_protectionCategory = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HDDeviceKeyValueStorageEntry allocWithZone:a3];
  domain = self->_domain;
  key = self->_key;
  value = self->_value;
  modificationDate = self->_modificationDate;
  syncIdentity = self->_syncIdentity;
  int64_t protectionCategory = self->_protectionCategory;

  return [(HDDeviceKeyValueStorageEntry *)v4 initWithDomain:domain key:key value:value modificationDate:modificationDate syncIdentity:syncIdentity category:protectionCategory];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HDDeviceKeyValueStorageEntry *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      domain = self->_domain;
      v8 = [(HDDeviceKeyValueStorageEntry *)v6 domain];
      if (domain != v8)
      {
        uint64_t v9 = [(HDDeviceKeyValueStorageEntry *)v6 domain];
        if (!v9)
        {
          char v12 = 0;
          goto LABEL_28;
        }
        v3 = (void *)v9;
        v10 = self->_domain;
        v11 = [(HDDeviceKeyValueStorageEntry *)v6 domain];
        if (![(NSString *)v10 isEqualToString:v11])
        {
          char v12 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v34 = v11;
      }
      key = self->_key;
      id v14 = [(HDDeviceKeyValueStorageEntry *)v6 key];
      if (key != v14)
      {
        uint64_t v15 = [(HDDeviceKeyValueStorageEntry *)v6 key];
        if (!v15) {
          goto LABEL_25;
        }
        id v16 = (void *)v15;
        id v17 = self->_key;
        uint64_t v18 = [(HDDeviceKeyValueStorageEntry *)v6 key];
        v19 = v17;
        v20 = (void *)v18;
        if (![(NSString *)v19 isEqualToString:v18])
        {

          goto LABEL_25;
        }
        v30 = v20;
        v32 = v16;
      }
      value = self->_value;
      id v22 = [(HDDeviceKeyValueStorageEntry *)v6 value];
      if (![(NSData *)value isEqual:v22])
      {

        if (key == v14) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      v33 = v3;
      modificationDate = self->_modificationDate;
      v24 = [(HDDeviceKeyValueStorageEntry *)v6 modificationDate];
      if ([(NSDate *)modificationDate isEqualToDate:v24])
      {
        int64_t protectionCategory = self->_protectionCategory;
        if (protectionCategory == [(HDDeviceKeyValueStorageEntry *)v6 protectionCategory])
        {
          syncIdentity = self->_syncIdentity;
          v27 = [(HDDeviceKeyValueStorageEntry *)v6 syncIdentity];
          char v12 = [(HDSyncIdentity *)syncIdentity isEqual:v27];

          if (key == v14)
          {
          }
          else
          {
          }
          BOOL v28 = domain == v8;
          v3 = v33;
LABEL_26:
          v11 = v34;
          if (!v28) {
            goto LABEL_27;
          }
LABEL_28:

          goto LABEL_29;
        }
      }

      v3 = v33;
      if (key != v14)
      {
LABEL_23:
      }
LABEL_25:

      char v12 = 0;
      BOOL v28 = domain == v8;
      goto LABEL_26;
    }
    char v12 = 0;
  }
LABEL_29:

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: %@, date modified: %@, protected entry: %d", self->_key, self->_value, self->_modificationDate, self->_protectionCategory == 0];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_domain hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_value hash];
  unint64_t v6 = v4 ^ v5 ^ [(HDSyncIdentity *)self->_syncIdentity hash];
  uint64_t v7 = v6 ^ [(NSDate *)self->_modificationDate hash];
  v8 = [NSNumber numberWithInteger:self->_protectionCategory];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (id)dateValue:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (id)numberValue:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (id)stringValue:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (NSData)value
{
  return self->_value;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end