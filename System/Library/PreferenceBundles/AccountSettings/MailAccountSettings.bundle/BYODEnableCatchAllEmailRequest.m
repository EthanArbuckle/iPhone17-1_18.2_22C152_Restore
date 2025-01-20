@interface BYODEnableCatchAllEmailRequest
+ (Class)responseClass;
- (BYODEnableCatchAllEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODEnableCatchAllEmailRequest

- (BYODEnableCatchAllEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BYODEnableCatchAllEmailRequest *)self urlString];
  v14.receiver = self;
  v14.super_class = (Class)BYODEnableCatchAllEmailRequest;
  v12 = [(BYODRequest *)&v14 initWithURLString:v11 accountStore:v9 appleAccount:v8 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v12) {
    objc_storeStrong((id *)&_domainName, a5);
  }

  return v12;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"enableCatchAllURL"];

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
  v5[2] = sub_5E144;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setValue:_domainName forKey:@"domain"];

  return v2;
}

@end