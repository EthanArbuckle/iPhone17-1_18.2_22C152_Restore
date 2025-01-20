@interface CalendarUpdateSettingsRequest
+ (Class)responseClass;
- (CalendarUpdateSettingsRequest)initWithAccount:(id)a3 accountStore:(id)a4 emailList:(id)a5;
- (NSMutableArray)inviteEmailArray;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
- (void)setInviteEmailArray:(id)a3;
@end

@implementation CalendarUpdateSettingsRequest

- (CalendarUpdateSettingsRequest)initWithAccount:(id)a3 accountStore:(id)a4 emailList:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(CalendarUpdateSettingsRequest *)self urlString];
  v15.receiver = self;
  v15.super_class = (Class)CalendarUpdateSettingsRequest;
  v13 = [(CalendarBaseRequest *)&v15 initWithURLString:v12 accountStore:v10 appleAccount:v11 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v13) {
    objc_storeStrong((id *)&v13->_inviteEmailArray, a5);
  }

  return v13;
}

- (id)urlString
{
  v3 = [(CalendarBaseRequest *)self iCloudAppleAccount];
  v4 = [v3 propertiesForDataclass:@"com.apple.Dataclass.Calendars"];
  v5 = [v4 objectForKeyedSubscript:@"sendReceiveURL"];

  if (!v5)
  {
    v6 = [(CalendarBaseRequest *)self iCloudAppleAccount];
    v7 = [v6 propertiesForDataclass:@"com.apple.Dataclass.Calendars"];
    v8 = [v7 objectForKeyedSubscript:@"url"];

    v5 = +[NSString stringWithFormat:@"%@/api/settings/sendreceive", v8];
    id v9 = _CalLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "returning constructed URL %@", buf, 0xCu);
    }
  }

  return v5;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)performRequestWithCallback:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_639C;
  v5[3] = &unk_10510;
  id v6 = a3;
  id v4 = v6;
  [(CalendarBaseRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_inviteEmailArray;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toDictionary", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setValue:v4 forKey:@"email"];

  return v3;
}

- (NSMutableArray)inviteEmailArray
{
  return self->_inviteEmailArray;
}

- (void)setInviteEmailArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end