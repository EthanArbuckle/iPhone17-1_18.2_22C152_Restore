@interface HKDeviceKeyValueStorageEntry
+ (BOOL)supportsSecureCoding;
- (HKDeviceKeyValueStorageEntry)initWithCoder:(id)a3;
- (HKDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6;
- (NSData)value;
- (NSDate)modificationDate;
- (NSString)domain;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateValue:(id *)a3;
- (id)description;
- (id)numberValue:(id *)a3;
- (id)stringValue:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDeviceKeyValueStorageEntry

- (HKDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKDeviceKeyValueStorageEntry;
  v15 = [(HKDeviceKeyValueStorageEntry *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domain, a3);
    objc_storeStrong((id *)&v16->_key, a4);
    objc_storeStrong((id *)&v16->_value, a5);
    objc_storeStrong((id *)&v16->_modificationDate, a6);
  }

  return v16;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p domain:%@ key:%@ value:%@ modification date:%@", objc_opt_class(), self, self->_domain, self->_key, self->_value, self->_modificationDate];
}

- (id)dateValue:(id *)a3
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (id)numberValue:(id *)a3
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (id)stringValue:(id *)a3
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  value = self->_value;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:value error:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKDeviceKeyValueStorageEntry allocWithZone:a3];
  domain = self->_domain;
  key = self->_key;
  value = self->_value;
  modificationDate = self->_modificationDate;

  return [(HKDeviceKeyValueStorageEntry *)v4 initWithDomain:domain key:key value:value modificationDate:modificationDate];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"Key"];
  [v5 encodeObject:self->_domain forKey:@"Domain"];
  [v5 encodeObject:self->_value forKey:@"Value"];
  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
}

- (HKDeviceKeyValueStorageEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Key"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Domain"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0)
  {
    id v12 = 0;
  }
  else
  {
    self = [(HKDeviceKeyValueStorageEntry *)self initWithDomain:v6 key:v5 value:v7 modificationDate:v8];
    id v12 = self;
  }

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end