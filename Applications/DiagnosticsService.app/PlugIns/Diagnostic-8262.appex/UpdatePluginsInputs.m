@interface UpdatePluginsInputs
- (BOOL)needRequestURL;
- (BOOL)useAppleConnect;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)timeoutPeriod;
- (NSString)PDIDigest;
- (NSString)ast2RequestURL;
- (NSURL)PDIURL;
- (NSURL)tatsuURL;
@end

@implementation UpdatePluginsInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v5 = a3;
  char v41 = 0;
  self->needRequestURL = [v5 BOOLFromKey:@"needRequestURL" defaultValue:0 failed:&v41];
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->needRequestURL) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v43 = (void *)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Get repair update PDI URL & digest from AST2: %@", buf, 0xCu);
  }

  if (self->needRequestURL)
  {
    v8 = [v5 NSStringFromKey:@"ast2RequestURL" defaultValue:@"https://diagnostics-mdn1.apple.com/api/v1/ast2-companion/public/services/assets/plugin" failed:&v41];
    ast2RequestURL = self->ast2RequestURL;
    self->ast2RequestURL = v8;

    v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->ast2RequestURL;
      *(_DWORD *)buf = 138412290;
      v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting repair update PDI URL and digest from: %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v10 = [v5 NSStringFromRequiredKey:@"pdiURL" maxLength:1024 failed:&v41];
  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDIURL: %@", buf, 0xCu);
  }

  v13 = +[NSURL URLWithString:v10];
  PDIURL = self->PDIURL;
  self->PDIURL = v13;

  v15 = self->PDIURL;
  if (v15)
  {
    v16 = [(NSURL *)v15 scheme];
    id v17 = [v16 caseInsensitiveCompare:@"http"];
    if (v17
      || ([(NSURL *)self->PDIURL scheme],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 caseInsensitiveCompare:@"https"]))
    {
      v18 = [(NSURL *)self->PDIURL host];

      if (!v17) {
      if (v18)
      }
        goto LABEL_22;
    }
    else
    {
    }
  }
  v19 = handleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1000058E0(v19);
  }

  char v41 = 1;
LABEL_22:
  v20 = [v5 NSStringFromRequiredKey:@"pdiDigest" maxLength:1024 failed:&v41];
  PDIDigest = self->PDIDigest;
  self->PDIDigest = v20;

  v22 = handleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->PDIDigest;
    *(_DWORD *)buf = 138412290;
    v43 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PDIDigest: %@", buf, 0xCu);
  }

LABEL_25:
  v24 = [v5 NSNumberFromKey:@"timeoutPeriod" lowerBound:&off_100008960 upperBound:&off_100008978 defaultValue:&off_100008990 failed:&v41];
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v24;

  v26 = handleForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v28 = [v5 NSStringFromKey:@"tatsuURL" defaultValue:@"https://gs.apple.com" failed:&v41];
  v29 = handleForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "tatsuURL: %@", buf, 0xCu);
  }

  v30 = +[NSURL URLWithString:v28];
  tatsuURL = self->tatsuURL;
  self->tatsuURL = v30;

  v32 = self->tatsuURL;
  if (!v32) {
    goto LABEL_37;
  }
  v33 = [(NSURL *)v32 scheme];
  id v34 = [v33 caseInsensitiveCompare:@"http"];
  if (!v34)
  {
    v3 = [(NSURL *)self->tatsuURL scheme];
    if (![v3 caseInsensitiveCompare:@"https"])
    {

LABEL_37:
      v36 = handleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10000589C(v36);
      }

      char v41 = 1;
      goto LABEL_40;
    }
  }
  v35 = [(NSURL *)self->tatsuURL host];

  if (!v34) {
  if (!v35)
  }
    goto LABEL_37;
LABEL_40:
  self->useAppleConnect = [v5 BOOLFromKey:@"useAppleConnect" defaultValue:0 failed:&v41];
  v37 = handleForCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (self->useAppleConnect) {
      CFStringRef v38 = @"YES";
    }
    else {
      CFStringRef v38 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v43 = (void *)v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "useAppleConnect: %@", buf, 0xCu);
  }

  BOOL v39 = v41 == 0;
  return v39;
}

- (NSURL)PDIURL
{
  return self->PDIURL;
}

- (NSString)PDIDigest
{
  return self->PDIDigest;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (BOOL)useAppleConnect
{
  return self->useAppleConnect;
}

- (NSURL)tatsuURL
{
  return self->tatsuURL;
}

- (BOOL)needRequestURL
{
  return self->needRequestURL;
}

- (NSString)ast2RequestURL
{
  return self->ast2RequestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ast2RequestURL, 0);
  objc_storeStrong((id *)&self->tatsuURL, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->PDIDigest, 0);

  objc_storeStrong((id *)&self->PDIURL, 0);
}

@end