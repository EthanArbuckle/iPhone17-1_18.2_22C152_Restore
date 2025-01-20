@interface APSUser
- (APSUser)initWithUserName:(id)a3;
- (BOOL)isDefaultUser;
- (BOOL)isLoggedIn;
- (NSString)description;
- (NSString)name;
- (NSString)pubSubName;
- (NSString)storageName;
- (id)_representedSystemUser;
- (id)aps_prettyDescription;
- (id)initUserWithSystemMode:(unint64_t)a3;
- (int)bootstrapLookupForPortName:(const char *)a3 outConnectionPort:(unsigned int *)a4;
@end

@implementation APSUser

- (id)initUserWithSystemMode:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)APSUser;
  v4 = [(APSUser *)&v10 init];
  v5 = v4;
  if (v4)
  {
    BOOL v6 = a3 == 0;
    if (v6) {
      v7 = (__CFString *)APSDefaultUserName;
    }
    else {
      v7 = @"User";
    }
    objc_storeStrong((id *)&v4->_name, v7);
    v5->_isDefaultUser = v6;
    v8 = (id *)CUTWeakLinkSymbol();
    objc_storeStrong((id *)&v5->_pubSubName, *v8);
  }
  return v5;
}

- (APSUser)initWithUserName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSUser;
  BOOL v6 = [(APSUser *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_isDefaultUser = [v5 isEqualToString:APSDefaultUserName];
    objc_storeStrong((id *)&v7->_pubSubName, a3);
  }

  return v7;
}

- (id)_representedSystemUser
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; name: %@>",
           objc_opt_class(),
           self,
           self->_name);
}

- (id)aps_prettyDescription
{
  return +[NSString stringWithFormat:@"<\"%@\">", self->_name];
}

- (NSString)storageName
{
  return 0;
}

- (BOOL)isLoggedIn
{
  return 1;
}

- (int)bootstrapLookupForPortName:(const char *)a3 outConnectionPort:(unsigned int *)a4
{
  mach_port_t sp = 0;
  int result = bootstrap_look_up(bootstrap_port, a3, &sp);
  if (a4) {
    *a4 = sp;
  }
  return result;
}

- (BOOL)isDefaultUser
{
  return self->_isDefaultUser;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)pubSubName
{
  return self->_pubSubName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pubSubName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end