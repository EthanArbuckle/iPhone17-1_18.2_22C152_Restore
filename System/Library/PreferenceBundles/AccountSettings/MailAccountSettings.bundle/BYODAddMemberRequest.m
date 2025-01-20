@interface BYODAddMemberRequest
+ (Class)responseClass;
- (BYODAddMemberRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 email:(id)a6 phone:(id)a7;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODAddMemberRequest

- (BYODAddMemberRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 email:(id)a6 phone:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(BYODAddMemberRequest *)self urlString];
  v20.receiver = self;
  v20.super_class = (Class)BYODAddMemberRequest;
  v18 = [(BYODRequest *)&v20 initWithURLString:v17 accountStore:v13 appleAccount:v12 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v18)
  {
    objc_storeStrong((id *)&_domainName, a5);
    objc_storeStrong((id *)&v18->_email, a6);
    objc_storeStrong((id *)&v18->_phone, a7);
  }

  return v18;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"domainAddMemberURL"];

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
  v5[2] = sub_5FE48;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:_domainName forKey:@"domain"];
  [v3 setValue:self->_email forKey:@"email"];
  [v3 setValue:self->_phone forKey:@"phoneNumber"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_email, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end