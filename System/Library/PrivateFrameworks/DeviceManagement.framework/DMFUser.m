@interface DMFUser
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDataToSync;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (DMFUser)initWithCoder:(id)a3;
- (DMFUser)initWithUsername:(id)a3 dataQuota:(unint64_t)a4 dataUsed:(unint64_t)a5 hasDataToSync:(BOOL)a6 isCurrentUser:(BOOL)a7;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)dataQuota;
- (unint64_t)dataUsed;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFUser

- (DMFUser)initWithUsername:(id)a3 dataQuota:(unint64_t)a4 dataUsed:(unint64_t)a5 hasDataToSync:(BOOL)a6 isCurrentUser:(BOOL)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFUser;
  v13 = [(DMFUser *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    username = v13->_username;
    v13->_username = (NSString *)v14;

    v13->_dataQuota = a4;
    v13->_dataUsed = a5;
    v13->_hasDataToSync = a6;
    v13->_isCurrentUser = a7;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(DMFUser *)self username];
  v6 = objc_msgSend(v4, "initWithUsername:dataQuota:dataUsed:hasDataToSync:isCurrentUser:", v5, -[DMFUser dataQuota](self, "dataQuota"), -[DMFUser dataUsed](self, "dataUsed"), -[DMFUser hasDataToSync](self, "hasDataToSync"), -[DMFUser isCurrentUser](self, "isCurrentUser"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFUser;
  v5 = [(DMFUser *)&v14 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataQuota"];
    v5->_dataQuota = [v9 unsignedLongLongValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataUsed"];
    v5->_dataUsed = [v10 unsignedLongLongValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasDataToSync"];
    v5->_hasDataToSync = [v11 BOOLValue];

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCurrentUser"];
    v5->_isCurrentUser = [v12 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFUser *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[DMFUser dataQuota](self, "dataQuota"));
  [v4 encodeObject:v6 forKey:@"dataQuota"];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[DMFUser dataUsed](self, "dataUsed"));
  [v4 encodeObject:v7 forKey:@"dataUsed"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFUser hasDataToSync](self, "hasDataToSync"));
  [v4 encodeObject:v8 forKey:@"hasDataToSync"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFUser isCurrentUser](self, "isCurrentUser"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"isCurrentUser"];
}

- (unint64_t)hash
{
  v3 = [(DMFUser *)self username];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DMFUser *)self dataQuota];
  unint64_t v6 = v5 ^ [(DMFUser *)self dataUsed] ^ v4;
  unint64_t v7 = v6 ^ [(DMFUser *)self hasDataToSync];
  unint64_t v8 = v7 ^ [(DMFUser *)self isCurrentUser];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFUser *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(DMFUser *)self username];
      unint64_t v7 = [(DMFUser *)v5 username];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      if ((!(v8 | v9) || (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, v10))
        && (unint64_t v11 = [(DMFUser *)self dataQuota], v11 == [(DMFUser *)v5 dataQuota])
        && (unint64_t v12 = [(DMFUser *)self dataUsed], v12 == [(DMFUser *)v5 dataUsed])
        && (BOOL v13 = [(DMFUser *)self hasDataToSync], v13 == [(DMFUser *)v5 hasDataToSync]))
      {
        BOOL v16 = [(DMFUser *)self isCurrentUser];
        BOOL v14 = v16 ^ [(DMFUser *)v5 isCurrentUser] ^ 1;
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFUser *)self username];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    unint64_t v6 = [(DMFUser *)self username];
    [v3 appendFormat:@"\tUsername         : “%@”\n", v6];
  }
  objc_msgSend(v3, "appendFormat:", @"\tData Quota       : %llu\n", -[DMFUser dataQuota](self, "dataQuota"));
  objc_msgSend(v3, "appendFormat:", @"\tData Used        : %llu\n", -[DMFUser dataUsed](self, "dataUsed"));
  if ([(DMFUser *)self hasDataToSync]) {
    unint64_t v7 = @"YES";
  }
  else {
    unint64_t v7 = @"NO";
  }
  [v3 appendFormat:@"\tHas Data to Sync : %@\n", v7];
  if ([(DMFUser *)self isCurrentUser]) {
    unint64_t v8 = @"YES";
  }
  else {
    unint64_t v8 = @"NO";
  }
  [v3 appendFormat:@"\tIs Current User  : %@\n", v8];
  [v3 appendString:@"}>"];
  unint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (NSString)username
{
  return self->_username;
}

- (unint64_t)dataQuota
{
  return self->_dataQuota;
}

- (unint64_t)dataUsed
{
  return self->_dataUsed;
}

- (BOOL)hasDataToSync
{
  return self->_hasDataToSync;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void).cxx_destruct
{
}

@end