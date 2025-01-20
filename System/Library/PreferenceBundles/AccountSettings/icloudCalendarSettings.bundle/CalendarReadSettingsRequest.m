@interface CalendarReadSettingsRequest
+ (Class)responseClass;
- (CalendarReadSettingsRequest)initWithAccount:(id)a3 accountStore:(id)a4;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation CalendarReadSettingsRequest

- (CalendarReadSettingsRequest)initWithAccount:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CalendarReadSettingsRequest *)self urlString];
  v11.receiver = self;
  v11.super_class = (Class)CalendarReadSettingsRequest;
  v9 = [(CalendarBaseRequest *)&v11 initWithURLString:v8 accountStore:v6 appleAccount:v7 httpRequestType:@"GET" requestBody:0 httpHeader:0];

  return v9;
}

- (id)urlString
{
  v2 = [(CalendarBaseRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.Calendars"];
  v4 = [v3 objectForKeyedSubscript:@"getSettingsUrl"];

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
  v5[2] = sub_602C;
  v5[3] = &unk_10510;
  id v6 = a3;
  id v4 = v6;
  [(CalendarBaseRequest *)self performRequestWithHandler:v5];
}

@end