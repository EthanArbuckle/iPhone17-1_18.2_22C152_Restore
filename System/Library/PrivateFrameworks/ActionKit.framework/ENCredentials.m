@interface ENCredentials
- (BOOL)areValid;
- (BOOL)saveToKeychain;
- (ENCredentials)initWithCoder:(id)a3;
- (ENCredentials)initWithHost:(id)a3 authenticationResult:(id)a4;
- (ENCredentials)initWithHost:(id)a3 edamUserId:(id)a4 noteStoreUrl:(id)a5 webApiUrlPrefix:(id)a6 authenticationToken:(id)a7 expirationDate:(id)a8;
- (NSDate)expirationDate;
- (NSString)authenticationToken;
- (NSString)edamUserId;
- (NSString)host;
- (NSString)noteStoreUrl;
- (NSString)webApiUrlPrefix;
- (id)keychainQuery;
- (void)deleteFromKeychain;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setEdamUserId:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHost:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation ENCredentials

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_edamUserId, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (void)setWebApiUrlPrefix:(id)a3
{
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setNoteStoreUrl:(id)a3
{
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setEdamUserId:(id)a3
{
}

- (NSString)edamUserId
{
  return self->_edamUserId;
}

- (void)setHost:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (ENCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENCredentials;
  v5 = [(ENCredentials *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"host"];
    [(ENCredentials *)v5 setHost:v6];

    v7 = [v4 decodeObjectForKey:@"edamUserId"];
    [(ENCredentials *)v5 setEdamUserId:v7];

    v8 = [v4 decodeObjectForKey:@"noteStoreUrl"];
    [(ENCredentials *)v5 setNoteStoreUrl:v8];

    v9 = [v4 decodeObjectForKey:@"webApiUrlPrefix"];
    [(ENCredentials *)v5 setWebApiUrlPrefix:v9];

    v10 = [v4 decodeObjectForKey:@"expirationDate"];
    [(ENCredentials *)v5 setExpirationDate:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ENCredentials *)self host];
  [v4 encodeObject:v5 forKey:@"host"];

  v6 = [(ENCredentials *)self edamUserId];
  [v4 encodeObject:v6 forKey:@"edamUserId"];

  v7 = [(ENCredentials *)self noteStoreUrl];
  [v4 encodeObject:v7 forKey:@"noteStoreUrl"];

  v8 = [(ENCredentials *)self webApiUrlPrefix];
  [v4 encodeObject:v8 forKey:@"webApiUrlPrefix"];

  id v9 = [(ENCredentials *)self expirationDate];
  [v4 encodeObject:v9 forKey:@"expirationDate"];
}

- (id)keychainQuery
{
  +[ENSSKeychain setAccessibilityType:*MEMORY[0x263F16EA0]];
  v3 = objc_alloc_init(ENSSKeychainQuery);
  id v4 = [(ENCredentials *)self host];
  [(ENSSKeychainQuery *)v3 setService:v4];

  v5 = [(ENCredentials *)self edamUserId];
  [(ENSSKeychainQuery *)v3 setAccount:v5];

  v6 = +[ENSession keychainAccessGroup];

  if (v6)
  {
    v7 = +[ENSession keychainAccessGroup];
    [(ENSSKeychainQuery *)v3 setAccessGroup:v7];
  }
  return v3;
}

- (BOOL)areValid
{
  v3 = [(ENCredentials *)self expirationDate];

  if (!v3) {
    return 1;
  }
  id v4 = [MEMORY[0x263EFF910] date];
  v5 = [(ENCredentials *)self expirationDate];
  BOOL v6 = [v4 compare:v5] == -1;

  return v6;
}

- (NSString)authenticationToken
{
  v2 = [(ENCredentials *)self keychainQuery];
  id v6 = 0;
  [v2 fetch:&v6];
  id v3 = v6;
  id v4 = [v2 password];
  if (!v4) {
    NSLog(&cfstr_ErrorGettingPa.isa, v3);
  }

  return (NSString *)v4;
}

- (void)deleteFromKeychain
{
  id v2 = [(ENCredentials *)self keychainQuery];
  [v2 deleteItem:0];
}

- (BOOL)saveToKeychain
{
  id v3 = [(ENCredentials *)self keychainQuery];
  [v3 setPassword:self->_authenticationToken];
  id v8 = 0;
  char v4 = [v3 save:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0) {
    NSLog(&cfstr_ErrorSavingToK.isa, v5, [v5 code]);
  }

  return v4;
}

- (ENCredentials)initWithHost:(id)a3 authenticationResult:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 user];
  id v9 = [v8 id];
  v10 = objc_msgSend(v5, "stringWithFormat:", @"%d", objc_msgSend(v9, "intValue"));
  v11 = [v6 noteStoreUrl];
  objc_super v12 = [v6 webApiUrlPrefix];
  v13 = [v6 authenticationToken];
  v14 = (void *)MEMORY[0x263EFF910];
  v15 = [v6 expiration];

  v16 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v15, "longLongValue") / 1000.0);
  v17 = [(ENCredentials *)self initWithHost:v7 edamUserId:v10 noteStoreUrl:v11 webApiUrlPrefix:v12 authenticationToken:v13 expirationDate:v16];

  return v17;
}

- (ENCredentials)initWithHost:(id)a3 edamUserId:(id)a4 noteStoreUrl:(id)a5 webApiUrlPrefix:(id)a6 authenticationToken:(id)a7 expirationDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ENCredentials;
  v20 = [(ENCredentials *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(ENCredentials *)v20 setHost:v14];
    [(ENCredentials *)v21 setEdamUserId:v15];
    [(ENCredentials *)v21 setNoteStoreUrl:v16];
    [(ENCredentials *)v21 setWebApiUrlPrefix:v17];
    [(ENCredentials *)v21 setAuthenticationToken:v18];
    [(ENCredentials *)v21 setExpirationDate:v19];
  }

  return v21;
}

@end