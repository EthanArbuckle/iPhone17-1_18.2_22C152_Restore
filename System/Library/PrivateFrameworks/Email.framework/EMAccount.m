@interface EMAccount
+ (BOOL)supportsSecureCoding;
+ (id)predicateForDeliveryAccounts;
+ (id)predicateForReceivingAccounts;
+ (id)sortDescriptorForNameAscending:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryiCloudAccount;
- (NSString)hostname;
- (NSString)name;
- (NSString)username;
- (id)ef_publicDescription;
@end

@implementation EMAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)ef_publicDescription
{
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    v5 = [(EMObject *)self debugDescription];
  }
  else
  {
    v6 = [(EMObject *)self objectID];
    v7 = [v6 stringHash];

    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "ef_publicDescription");
    v5 = [v8 stringWithFormat:@"<%@: %p>\n\tObjectID:%@", v9, self, v10];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if (([v5 isEqual:objc_opt_class()] & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v4;
    v7 = [(EMObject *)self objectID];
    v8 = [v6 objectID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

+ (id)predicateForReceivingAccounts
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
}

+ (id)predicateForDeliveryAccounts
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
}

+ (id)sortDescriptorForNameAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F60F30] sortDescriptorWithKey:@"name" ascending:a3];
}

@end