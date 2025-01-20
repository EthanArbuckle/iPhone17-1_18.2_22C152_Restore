@interface VeridianFWUpdaterInputs
- (BOOL)needRequestURL;
- (BOOL)useAppleConnect;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)timeoutPeriod;
- (NSString)FWDigest;
- (NSString)ast2RequestURL;
- (NSString)mountPath;
- (NSURL)FWURL;
@end

@implementation VeridianFWUpdaterInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v5 = a3;
  char v36 = 0;
  self->needRequestURL = [v5 BOOLFromKey:@"needRequestURL" defaultValue:0 failed:&v36];
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
    v38 = (void *)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Need to request FWURL from AST2: %@", buf, 0xCu);
  }

  if (self->needRequestURL)
  {
    v8 = [v5 NSStringFromKey:@"ast2RequestURL" defaultValue:@"https://diagnostics-mdn1.apple.com/api/v1/ast2-companion/public/services/firmware/batteries" failed:&v36];
    ast2RequestURL = self->ast2RequestURL;
    self->ast2RequestURL = v8;

    v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->ast2RequestURL;
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting Veridian FW URL and digest from: %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v10 = [v5 NSStringFromKey:@"fwURL" defaultValue:0 failed:&v36];
  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FWURL: %@", buf, 0xCu);
  }

  v13 = +[NSURL URLWithString:v10];
  FWURL = self->FWURL;
  self->FWURL = v13;

  v15 = self->FWURL;
  if (v15)
  {
    v16 = [(NSURL *)v15 scheme];
    id v17 = [v16 caseInsensitiveCompare:@"http"];
    if (v17
      || ([(NSURL *)self->FWURL scheme],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 caseInsensitiveCompare:@"https"]))
    {
      v18 = [(NSURL *)self->FWURL host];

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
    sub_100005AC4(v19);
  }

  char v36 = 1;
LABEL_22:
  v20 = [v5 NSStringFromKey:@"fwDigest" defaultValue:0 failed:&v36];
  FWDigest = self->FWDigest;
  self->FWDigest = v20;

  v22 = handleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->FWDigest;
    *(_DWORD *)buf = 138412290;
    v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "fwDigest: %@", buf, 0xCu);
  }

LABEL_25:
  v24 = [v5 NSNumberFromKey:@"timeoutPeriod" lowerBound:&off_1000088C0 upperBound:&off_1000088D8 defaultValue:&off_1000088C0 failed:&v36];
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v24;

  v26 = handleForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v38 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v28 = [v5 NSStringFromKey:@"MountPath" defaultValue:0 failed:0];
  mountPath = self->mountPath;
  self->mountPath = v28;

  v30 = handleForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = self->mountPath;
    *(_DWORD *)buf = 138412290;
    v38 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "PDI mountPath is %@", buf, 0xCu);
  }

  self->useAppleConnect = [v5 BOOLFromKey:@"UseAppleConnect" defaultValue:0 failed:&v36];
  v32 = handleForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if (self->useAppleConnect) {
      CFStringRef v33 = @"YES";
    }
    else {
      CFStringRef v33 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v38 = (void *)v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "useAppleConnect: %@", buf, 0xCu);
  }

  BOOL v34 = v36 == 0;
  return v34;
}

- (NSURL)FWURL
{
  return self->FWURL;
}

- (NSString)FWDigest
{
  return self->FWDigest;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (NSString)mountPath
{
  return self->mountPath;
}

- (BOOL)useAppleConnect
{
  return self->useAppleConnect;
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
  objc_storeStrong((id *)&self->mountPath, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->FWDigest, 0);

  objc_storeStrong((id *)&self->FWURL, 0);
}

@end