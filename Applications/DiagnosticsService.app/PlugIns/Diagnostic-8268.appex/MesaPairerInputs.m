@interface MesaPairerInputs
- (BOOL)useAppleConnect;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSData)signingKeyBlob;
- (NSString)FDRCAURL;
- (NSString)FDRDSURL;
- (NSString)trustObjectURL;
- (NSURL)SCPairURL;
- (NSURL)TatsuURL;
- (id)_filterSeaCookieServerUrl:(id)a3;
- (void)_validateURL:(id)a3 failed:(BOOL *)a4;
@end

@implementation MesaPairerInputs

- (id)_filterSeaCookieServerUrl:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if (MGGetBoolAnswer())
  {
    v5 = objc_opt_new();
    unsigned __int8 v6 = [v5 hasEntitlementBoolForTag:1633776739 inAPTicket:0];

    v4 = v3;
    if ((v6 & 1) == 0)
    {

      v7 = handleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        CFStringRef v10 = @"https://shps.apple.com/hps/processor";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prod fused device, force to set SeaCookie server as %@", (uint8_t *)&v9, 0xCu);
      }

      v4 = @"https://shps.apple.com/hps/processor";
    }
  }

  return v4;
}

- (void)_validateURL:(id)a3 failed:(BOOL *)a4
{
  id v5 = a3;
  if (v5)
  {
    unsigned __int8 v6 = +[NSURL URLWithString:v5];
    v7 = v6;
    if (v6 && ([v6 host], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      int v9 = [v7 scheme];
      if (![v9 caseInsensitiveCompare:@"http"])
      {

        goto LABEL_11;
      }
      CFStringRef v10 = [v7 scheme];
      id v11 = [v10 caseInsensitiveCompare:@"https"];

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000FE5C((uint64_t)v5, v12);
      }
    }
    else
    {
      v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000FDE4((uint64_t)v5, v12);
      }
    }

    *a4 = 1;
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v6 = a3;
  unsigned __int8 v50 = 0;
  v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[MesaPairerInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8 = [v6 dk_stringFromKey:@"SCPairURL" maxLength:256 defaultValue:@"https://shps.apple.com/hps/processor" failed:&v50];
  int v9 = [(MesaPairerInputs *)self _filterSeaCookieServerUrl:v8];

  CFStringRef v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SC Pairing URL: %@", buf, 0xCu);
  }

  id v11 = +[NSURL URLWithString:v9];
  SCPairURL = self->_SCPairURL;
  self->_SCPairURL = v11;

  v13 = self->_SCPairURL;
  v14 = v13;
  if (!v13) {
    goto LABEL_13;
  }
  v15 = [(NSURL *)v13 scheme];
  id v4 = [v15 caseInsensitiveCompare:@"http"];
  if (!v4)
  {
    v3 = [(NSURL *)v14 scheme];
    if (![v3 caseInsensitiveCompare:@"https"])
    {

LABEL_13:
      v17 = handleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10000FED4(v17);
      }

      unsigned __int8 v50 = 1;
      goto LABEL_16;
    }
  }
  v16 = [(NSURL *)v14 host];

  if (!v4) {
  if (!v16)
  }
    goto LABEL_13;
LABEL_16:
  v18 = [v6 NSStringFromKey:@"CAURL" defaultValue:0 failed:&v50];
  FDRCAURL = self->_FDRCAURL;
  self->_FDRCAURL = v18;

  v20 = handleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_FDRCAURL;
    *(_DWORD *)buf = 138412290;
    v52 = (const char *)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FDR CA URL: %@", buf, 0xCu);
  }

  [(MesaPairerInputs *)self _validateURL:self->_FDRCAURL failed:&v50];
  v22 = [v6 NSStringFromKey:@"DSURL" defaultValue:0 failed:&v50];
  FDRDSURL = self->_FDRDSURL;
  self->_FDRDSURL = v22;

  v24 = handleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_FDRDSURL;
    *(_DWORD *)buf = 138412290;
    v52 = (const char *)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FDR DS URL: %@", buf, 0xCu);
  }

  [(MesaPairerInputs *)self _validateURL:self->_FDRDSURL failed:&v50];
  v26 = [v6 NSStringFromKey:@"TrustObjectURL" defaultValue:0 failed:&v50];
  trustObjectURL = self->_trustObjectURL;
  self->_trustObjectURL = v26;

  v28 = handleForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_trustObjectURL;
    *(_DWORD *)buf = 138412290;
    v52 = (const char *)v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "FDR Trust Object URL: %@", buf, 0xCu);
  }

  [(MesaPairerInputs *)self _validateURL:self->_trustObjectURL failed:&v50];
  self->_useAppleConnect = [v6 dk_BOOLFromKey:@"UseAppleConnect" defaultValue:0 failed:&v50];
  v30 = handleForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v31 = @"YES";
    if (!self->_useAppleConnect) {
      CFStringRef v31 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v52 = (const char *)v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Use AppleConnect: %@", buf, 0xCu);
  }

  [v6 dk_stringFromKey:@"TatsuURL" maxLength:256 defaultValue:0 failed:&v50];
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    if (self->_useAppleConnect) {
      v33 = @"https://gs.apple.com:443";
    }
    else {
      v33 = @"https://ac-gs.apple.com:443";
    }
    v32 = v33;
  }
  v34 = handleForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = (const char *)v32;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "TATSU server URL: %@", buf, 0xCu);
  }

  v35 = +[NSURL URLWithString:v32];
  TatsuURL = self->_TatsuURL;
  self->_TatsuURL = v35;

  v37 = self->_TatsuURL;
  if (!v37) {
    goto LABEL_41;
  }
  v38 = [(NSURL *)v37 scheme];
  id v39 = [v38 caseInsensitiveCompare:@"http"];
  if (!v39)
  {
    id v4 = [(NSURL *)v37 scheme];
    if (![v4 caseInsensitiveCompare:@"https"])
    {

LABEL_41:
      v41 = handleForCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10000FED4(v41);
      }

      unsigned __int8 v50 = 1;
      goto LABEL_44;
    }
  }
  v40 = [(NSURL *)v37 host];

  if (!v39) {
  if (!v40)
  }
    goto LABEL_41;
LABEL_44:
  v42 = [v6 dk_stringFromKey:@"keyBlob" maxLength:1024 defaultValue:0 failed:&v50];
  if (v42)
  {
    v43 = handleForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Parsing RIK", buf, 2u);
    }

    v44 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v42 options:0];
    signingKeyBlob = self->_signingKeyBlob;
    self->_signingKeyBlob = v44;
  }
  if (!self->_signingKeyBlob)
  {
    v46 = handleForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "No RIK", buf, 2u);
    }
  }
  v47 = handleForCategory();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v52) = v50;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "validationFailed is %d", buf, 8u);
  }

  BOOL v48 = v50 == 0;
  return v48;
}

- (NSURL)SCPairURL
{
  return self->_SCPairURL;
}

- (NSURL)TatsuURL
{
  return self->_TatsuURL;
}

- (BOOL)useAppleConnect
{
  return self->_useAppleConnect;
}

- (NSData)signingKeyBlob
{
  return self->_signingKeyBlob;
}

- (NSString)FDRCAURL
{
  return self->_FDRCAURL;
}

- (NSString)FDRDSURL
{
  return self->_FDRDSURL;
}

- (NSString)trustObjectURL
{
  return self->_trustObjectURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustObjectURL, 0);
  objc_storeStrong((id *)&self->_FDRDSURL, 0);
  objc_storeStrong((id *)&self->_FDRCAURL, 0);
  objc_storeStrong((id *)&self->_signingKeyBlob, 0);
  objc_storeStrong((id *)&self->_TatsuURL, 0);

  objc_storeStrong((id *)&self->_SCPairURL, 0);
}

@end