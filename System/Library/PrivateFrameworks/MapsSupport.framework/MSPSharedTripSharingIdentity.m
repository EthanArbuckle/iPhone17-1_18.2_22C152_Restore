@interface MSPSharedTripSharingIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValidAccount;
- (MSPSharedTripSharingIdentity)initWithCoder:(id)a3;
- (MSPSharedTripSharingIdentity)initWithValidAccount:(BOOL)a3 name:(id)a4 handle:(id)a5 aliases:(id)a6;
- (NSArray)aliases;
- (NSString)handle;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSPSharedTripSharingIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSPSharedTripSharingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripSharingIdentity;
  v5 = [(MSPSharedTripSharingIdentity *)&v16 init];
  if (v5)
  {
    v5->_validAccount = [v4 decodeBoolForKey:@"_validAccount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_aliases"];
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v13;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)hasValidAccount
{
  return self->_validAccount;
}

- (MSPSharedTripSharingIdentity)initWithValidAccount:(BOOL)a3 name:(id)a4 handle:(id)a5 aliases:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSPSharedTripSharingIdentity;
  v14 = [(MSPSharedTripSharingIdentity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_validAccount = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    objc_storeStrong((id *)&v15->_handle, a5);
    objc_storeStrong((id *)&v15->_aliases, a6);
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL validAccount = self->_validAccount;
  id v5 = a3;
  [v5 encodeBool:validAccount forKey:@"_validAccount"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_handle forKey:@"_handle"];
  [v5 encodeObject:self->_aliases forKey:@"_aliases"];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripSharingIdentity;
  uint64_t v4 = [(MSPSharedTripSharingIdentity *)&v9 description];
  id v5 = (void *)v4;
  if (self->_validAccount) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  v7 = [v3 stringWithFormat:@"%@ (valid:%s, name:%@, handle:%@, aliases:%@)", v4, v6, self->_name, self->_handle, self->_aliases];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSArray)aliases
{
  return self->_aliases;
}

@end