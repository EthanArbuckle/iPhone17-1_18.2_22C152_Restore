@interface BYODAddAliasRequest
+ (Class)responseClass;
- (BYODAddAliasRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7;
- (NSArray)emailArray;
- (NSString)domainName;
- (NSString)dsid;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEmailArray:(id)a3;
@end

@implementation BYODAddAliasRequest

- (BYODAddAliasRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(BYODAddAliasRequest *)self urlString];
  v20.receiver = self;
  v20.super_class = (Class)BYODAddAliasRequest;
  v18 = [(BYODRequest *)&v20 initWithURLString:v17 accountStore:v13 appleAccount:v12 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_domainName, a5);
    objc_storeStrong((id *)&v18->_emailArray, a6);
    objc_storeStrong((id *)&v18->_dsid, a7);
  }

  return v18;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"addCustomEmailAliasURL"];

  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)performRequestWithCallback:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5DC80;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:self->_domainName forKey:@"domain"];
  [v3 setValue:self->_dsid forKey:@"dsid"];
  [v3 setValue:self->_emailArray forKey:@"email"];

  return v3;
}

- (NSArray)emailArray
{
  return self->_emailArray;
}

- (void)setEmailArray:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_emailArray, 0);
}

@end