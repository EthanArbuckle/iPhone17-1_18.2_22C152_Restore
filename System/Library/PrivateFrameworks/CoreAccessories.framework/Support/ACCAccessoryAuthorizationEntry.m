@interface ACCAccessoryAuthorizationEntry
- (ACCAccessoryAuthorizationEntry)init;
- (BOOL)authorized;
- (NSString)certSerialString;
- (NSString)displayName;
- (id)description;
- (void)setAuthorized:(BOOL)a3;
- (void)setCertSerialString:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation ACCAccessoryAuthorizationEntry

- (ACCAccessoryAuthorizationEntry)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACCAccessoryAuthorizationEntry;
  v2 = [(ACCAccessoryAuthorizationEntry *)&v7 init];
  v3 = v2;
  if (v2)
  {
    certSerialString = v2->_certSerialString;
    v2->_certSerialString = 0;

    displayName = v3->_displayName;
    v3->_displayName = 0;

    v3->_authorized = 0;
  }
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACCAccessoryAuthorizationEntry *)self displayName];
  v6 = [(ACCAccessoryAuthorizationEntry *)self certSerialString];
  objc_super v7 = +[NSString stringWithFormat:@"<%@: %p, displayName: %@, certSerialString: %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)certSerialString
{
  return self->_certSerialString;
}

- (void)setCertSerialString:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (void)setAuthorized:(BOOL)a3
{
  self->_authorized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_certSerialString, 0);
}

@end