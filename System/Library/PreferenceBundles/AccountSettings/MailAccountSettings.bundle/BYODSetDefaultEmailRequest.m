@interface BYODSetDefaultEmailRequest
+ (Class)responseClass;
- (BYODSetDefaultEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 email:(id)a5 domain:(id)a6;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODSetDefaultEmailRequest

- (BYODSetDefaultEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 email:(id)a5 domain:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(BYODSetDefaultEmailRequest *)self urlString];
  v17.receiver = self;
  v17.super_class = (Class)BYODSetDefaultEmailRequest;
  v15 = [(BYODRequest *)&v17 initWithURLString:v14 accountStore:v11 appleAccount:v10 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_email, a5);
    objc_storeStrong((id *)&v15->_domainName, a6);
  }

  return v15;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"setDefaultSendFromURL"];

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
  v5[2] = sub_5C408;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:self->_email forKey:@"email"];
  [v3 setValue:self->_domainName forKey:@"domain"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end