@interface User
- (NSString)DSID;
- (NSString)biometricsToken;
- (NSString)password;
- (NSString)username;
- (User)initWithDSID:(id)a3 username:(id)a4 password:(id)a5 biometricsToken:(id)a6;
- (User)initWithDictionary:(id)a3;
- (id)compile;
- (id)description;
@end

@implementation User

- (User)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"DSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [v4 objectForKeyedSubscript:@"username"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [v4 objectForKeyedSubscript:@"password"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v4 objectForKeyedSubscript:@"biometricsToken"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  v13 = 0;
  if (v6 && v8)
  {
    self = [(User *)self initWithDSID:v6 username:v8 password:v10 biometricsToken:v12];
    v13 = self;
  }

  return v13;
}

- (User)initWithDSID:(id)a3 username:(id)a4 password:(id)a5 biometricsToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)User;
  v15 = [(User *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DSID, a3);
    objc_storeStrong((id *)&v16->_username, a4);
    objc_storeStrong((id *)&v16->_password, a5);
    objc_storeStrong((id *)&v16->_biometricsToken, a6);
  }

  return v16;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(User *)self biometricsToken];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, @"biometricsToken");

  v5 = [(User *)self DSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"DSID");

  id v6 = [(User *)self password];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, @"password");

  v7 = [(User *)self username];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, @"username");

  return v3;
}

- (id)description
{
  id v3 = [(User *)self compile];
  id v4 = [(User *)self ap_generateDescriptionWithSubObjects:v3];

  return v4;
}

- (NSString)biometricsToken
{
  return self->_biometricsToken;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)username
{
  return self->_username;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_biometricsToken, 0);
}

@end