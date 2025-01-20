@interface CalendarBaseRequest
- (ACAccount)iCloudAppleAccount;
- (CalendarBaseRequest)initWithURLString:(id)a3 accountStore:(id)a4 appleAccount:(id)a5 httpRequestType:(id)a6 requestBody:(id)a7 httpHeader:(id)a8;
- (NSDictionary)requestBody;
- (id)_errorDictionaryFromServerResponse:(id)a3;
- (id)bodyDictionary;
- (id)urlRequest;
- (id)urlString;
- (void)_performRequestWithHandler:(id)a3 renewToken:(BOOL)a4;
- (void)performRequestWithHandler:(id)a3;
- (void)setRequestBody:(id)a3;
@end

@implementation CalendarBaseRequest

- (CalendarBaseRequest)initWithURLString:(id)a3 accountStore:(id)a4 appleAccount:(id)a5 httpRequestType:(id)a6 requestBody:(id)a7 httpHeader:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id obj = a5;
  id v17 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CalendarBaseRequest;
  v18 = [(CalendarBaseRequest *)&v34 initWithURLString:v15];
  if (v18)
  {
    id v28 = a4;
    v29 = objc_msgSend(v16, "aida_accountForPrimaryiCloudAccount");
    v19 = _CalLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [v29 accountType];
      v20 = id v27 = v15;
      v21 = [v17 accountType];
      *(_DWORD *)buf = 138412546;
      v36 = v20;
      __int16 v37 = 2112;
      v38 = v21;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "adding aida account type %@ and apple account type %@", buf, 0x16u);

      id v15 = v27;
    }

    id v22 = objc_alloc((Class)AAGrandSlamSigner);
    v23 = objc_msgSend(v16, "aida_accountForiCloudAccount:", v17);
    id v24 = [v22 initWithAccountStore:v16 grandSlamAccount:v23 appTokenID:AAGrandSlamAppTokenIDiCloudSettings];
    v25 = (void *)_grandSlamSigner;
    _grandSlamSigner = (uint64_t)v24;

    objc_storeStrong((id *)&_requestType, a6);
    objc_storeStrong((id *)&_requestUrl, a3);
    objc_storeStrong(&_headers, a8);
    objc_storeStrong((id *)&v18->_requestBody, a7);
    objc_storeStrong((id *)&v18->_iCloudAppleAccount, obj);
    objc_storeStrong((id *)&_accountStore, v28);
  }
  return v18;
}

- (id)urlString
{
  return (id)_requestUrl;
}

- (id)urlRequest
{
  v18.receiver = self;
  v18.super_class = (Class)CalendarBaseRequest;
  v3 = [(CalendarBaseRequest *)&v18 urlRequest];
  id v4 = [v3 mutableCopy];

  [(id)_grandSlamSigner setUseAltDSID:1];
  if (([(id)_grandSlamSigner signURLRequest:v4 isUserInitiated:1] & 1) == 0)
  {
    v5 = _CalLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_A5C4(v5);
    }
  }
  v6 = [(CalendarBaseRequest *)self bodyDictionary];
  if (v6)
  {
    uint64_t v17 = 0;
    v7 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:&v17];
    [v4 setHTTPBody:v7];
  }
  [v4 setHTTPMethod:_requestType];
  [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_iCloudAppleAccount, 0);
  v8 = +[AADeviceInfo udid];
  [v4 setValue:v8 forHTTPHeaderField:@"X-Client-UDID"];

  v9 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 infoDictionary];

  v12 = [v9 objectForKey:@"ProductVersion"];
  v13 = [v11 objectForKey:@"CFBundleName"];
  v14 = [v11 objectForKey:@"CFBundleVersion"];
  id v15 = +[NSString stringWithFormat:@"%@/%@ iOS/%@", v13, v14, v12];
  [v4 setValue:v15 forHTTPHeaderField:@"User-agent"];

  return v4;
}

- (id)bodyDictionary
{
  return self->_requestBody;
}

- (void)performRequestWithHandler:(id)a3
{
}

- (void)_performRequestWithHandler:(id)a3 renewToken:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_571C;
  v6[3] = &unk_104E8;
  BOOL v9 = a4;
  v7 = self;
  id v8 = a3;
  v5.receiver = v7;
  v5.super_class = (Class)CalendarBaseRequest;
  id v4 = v8;
  [(CalendarBaseRequest *)&v5 performRequestWithHandler:v6];
}

- (id)_errorDictionaryFromServerResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 calError];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v3 calError];
    id v8 = [v7 errorTitle];

    if (v8)
    {
      BOOL v9 = [v3 calError];
      v10 = [v9 errorTitle];
      [v4 setObject:v10 forKey:@"errorTitle"];
    }
  }
  uint64_t v11 = [v3 calError];
  if (!v11) {
    goto LABEL_7;
  }
  v12 = (void *)v11;
  v13 = [v3 calError];
  v14 = [v13 errorMessage];

  if (v14)
  {
    id v15 = [v3 calError];
    uint64_t v16 = [v15 errorMessage];
  }
  else
  {
LABEL_7:
    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"CALENDAR_GENERIC_ERROR_MESSAGE" value:&stru_10750 table:@"calendarSettings"];
  }
  uint64_t v17 = (void *)v16;
  [v4 setObject:v16 forKey:@"errorDescription"];

  return v4;
}

- (ACAccount)iCloudAppleAccount
{
  return self->_iCloudAppleAccount;
}

- (NSDictionary)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestBody, 0);

  objc_storeStrong((id *)&self->_iCloudAppleAccount, 0);
}

@end