@interface IDSAppleUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppleUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSAppleUser)initWithCoder:(id)a3;
- (IDSAppleUser)initWithUserName:(id)a3 DSID:(id)a4;
- (NSString)DSID;
- (NSString)description;
- (NSString)userName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)uniqueIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSAppleUser

- (IDSAppleUser)initWithUserName:(id)a3 DSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSAppleUser;
  v9 = [(IDSAppleUser *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userName, a3);
    objc_storeStrong((id *)&v10->_DSID, a4);
  }

  return v10;
}

- (id)uniqueIdentifier
{
  return +[NSString stringWithFormat:@"%@-%@", self->_userName, self->_DSID];
}

- (int64_t)realm
{
  return 1;
}

- (id)realmPrefixedIdentifier
{
  v3 = [(IDSAppleUser *)self unprefixedIdentifier];
  if (v3)
  {
    v4 = [(IDSAppleUser *)self unprefixedIdentifier];
    v5 = +[NSString stringWithFormat:@"%@%@", @"D:", v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldReplace:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(IDSAppleUser *)self uniqueIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSAppleUser *)self isEqualToAppleUser:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAppleUser:(id)a3
{
  id v4 = (IDSAppleUser *)a3;
  BOOL v5 = v4;
  if (self != v4)
  {
    v6 = [(IDSAppleUser *)v4 uniqueIdentifier];
    id v7 = [(IDSAppleUser *)self uniqueIdentifier];
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    id v8 = [(IDSAppleUser *)v5 userName];
    v9 = [(IDSAppleUser *)self userName];
    if (v8 == v9)
    {
      [(IDSAppleUser *)v5 DSID];
    }
    else
    {
      v10 = [(IDSAppleUser *)v5 userName];
      v11 = [(IDSAppleUser *)self userName];
      if (![v10 isEqual:v11])
      {
        unsigned __int8 v12 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      [(IDSAppleUser *)v5 DSID];
    v13 = };
    uint64_t v14 = [(IDSAppleUser *)self DSID];
    if (v13 == (void *)v14)
    {

      unsigned __int8 v12 = 1;
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(IDSAppleUser *)v5 DSID];
      v17 = [(IDSAppleUser *)self DSID];
      unsigned __int8 v12 = [v16 isEqual:v17];
    }
    v11 = v20;
    v10 = v22;
    if (v8 == v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  unsigned __int8 v12 = 1;
LABEL_17:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSAppleUser)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];

  id v7 = [(IDSAppleUser *)self initWithUserName:v5 DSID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  userName = self->_userName;
  id v5 = a3;
  [v5 encodeObject:userName forKey:@"username"];
  [v5 encodeObject:self->_DSID forKey:@"dsid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSAppleUser alloc];
  id v5 = [(NSString *)self->_userName copy];
  id v6 = [(NSString *)self->_DSID copy];
  id v7 = [(IDSAppleUser *)v4 initWithUserName:v5 DSID:v6];

  return v7;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSAppleUser *)self uniqueIdentifier];
  id v5 = [(IDSAppleUser *)self realmPrefixedIdentifier];
  id v6 = +[NSString stringWithFormat:@"<%@:%p> uid: %@ rpi: %@", v3, self, v4, v5];

  return (NSString *)v6;
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_userName, 0);
}

@end