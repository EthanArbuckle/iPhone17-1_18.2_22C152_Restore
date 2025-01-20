@interface BYODUpdateWelcomeFlagRequest
+ (Class)responseClass;
- (BYODUpdateWelcomeFlagRequest)initWithAccount:(id)a3 accountStore:(id)a4;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODUpdateWelcomeFlagRequest

- (BYODUpdateWelcomeFlagRequest)initWithAccount:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BYODUpdateWelcomeFlagRequest *)self urlString];
  v11.receiver = self;
  v11.super_class = (Class)BYODUpdateWelcomeFlagRequest;
  v9 = [(BYODRequest *)&v11 initWithURLString:v8 accountStore:v7 appleAccount:v6 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  return v9;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"updateWelcomeFlagURL"];

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
  v5[2] = sub_5FA34;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

@end