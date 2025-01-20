@interface PearlPairerInputs
- (BOOL)skipScPairingTicket;
- (BOOL)useAppleConnect;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSString)FDRCAURL;
- (NSString)FDRDSURL;
- (NSString)SCPairURL;
- (NSString)rikKeyBlob;
- (NSString)tatsuURL;
- (NSString)trustObjectURL;
- (void)_validateURL:(id)a3 failed:(BOOL *)a4;
@end

@implementation PearlPairerInputs

- (void)_validateURL:(id)a3 failed:(BOOL *)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = +[NSURL URLWithString:v5];
    v7 = v6;
    if (v6 && ([v6 host], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      v9 = [v7 scheme];
      if (![v9 caseInsensitiveCompare:@"http"])
      {

        goto LABEL_11;
      }
      v10 = [v7 scheme];
      id v11 = [v10 caseInsensitiveCompare:@"https"];

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000EE74((uint64_t)v5, v12);
      }
    }
    else
    {
      v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000EDFC((uint64_t)v5, v12);
      }
    }

    *a4 = 1;
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  unsigned __int8 v38 = 0;
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[PearlPairerInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  self->_useAppleConnect = [v4 BOOLFromKey:@"UseAppleConnect" defaultValue:0 failed:&v38];
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_useAppleConnect) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Use AppleConnect: %@", buf, 0xCu);
  }

  v8 = [v4 NSStringFromKey:@"SCPairURL" defaultValue:@"https://shps.apple.com/hps/pearl" failed:&v38];
  SCPairURL = self->_SCPairURL;
  self->_SCPairURL = v8;

  v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = self->_SCPairURL;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SC Pairing URL: %@", buf, 0xCu);
  }

  [(PearlPairerInputs *)self _validateURL:self->_SCPairURL failed:&v38];
  v12 = [v4 NSStringFromKey:@"CAURL" defaultValue:0 failed:&v38];
  FDRCAURL = self->_FDRCAURL;
  self->_FDRCAURL = v12;

  v14 = handleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_FDRCAURL;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FDR CA URL: %@", buf, 0xCu);
  }

  [(PearlPairerInputs *)self _validateURL:self->_FDRCAURL failed:&v38];
  v16 = [v4 NSStringFromKey:@"DSURL" defaultValue:0 failed:&v38];
  FDRDSURL = self->_FDRDSURL;
  self->_FDRDSURL = v16;

  v18 = handleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_FDRDSURL;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FDR DS URL: %@", buf, 0xCu);
  }

  [(PearlPairerInputs *)self _validateURL:self->_FDRDSURL failed:&v38];
  v20 = [v4 NSStringFromKey:@"TrustObjectURL" defaultValue:0 failed:&v38];
  trustObjectURL = self->_trustObjectURL;
  self->_trustObjectURL = v20;

  v22 = handleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_trustObjectURL;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FDR Trust Object URL: %@", buf, 0xCu);
  }

  [(PearlPairerInputs *)self _validateURL:self->_trustObjectURL failed:&v38];
  v24 = [v4 NSStringFromKey:@"TatsuURL" defaultValue:0 failed:&v38];
  tatsuURL = self->_tatsuURL;
  self->_tatsuURL = v24;

  if (!self->_tatsuURL)
  {
    if (self->_useAppleConnect) {
      v26 = @"https://gs.apple.com:443";
    }
    else {
      v26 = @"https://ac-gs.apple.com:443";
    }
    objc_storeStrong((id *)&self->_tatsuURL, v26);
  }
  v27 = handleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->_tatsuURL;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "TATSU URL: %@", buf, 0xCu);
  }

  [(PearlPairerInputs *)self _validateURL:self->_tatsuURL failed:&v38];
  v29 = [v4 NSStringFromKey:@"keyBlob" defaultValue:0 failed:0];
  rikKeyBlob = self->_rikKeyBlob;
  self->_rikKeyBlob = v29;

  v31 = handleForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = self->_rikKeyBlob;
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "keyBlob: %@", buf, 0xCu);
  }

  self->_skipScPairingTicket = [v4 BOOLFromKey:@"SkipScPairingTicket" defaultValue:0 failed:&v38];
  v33 = handleForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_skipScPairingTicket) {
      CFStringRef v34 = @"YES";
    }
    else {
      CFStringRef v34 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v40 = (const char *)v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Skip SC pairing ticket: %@", buf, 0xCu);
  }

  v35 = handleForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = v38;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "validationFailed is %d", buf, 8u);
  }

  BOOL v36 = v38 == 0;
  return v36;
}

- (NSString)SCPairURL
{
  return self->_SCPairURL;
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

- (NSString)tatsuURL
{
  return self->_tatsuURL;
}

- (NSString)rikKeyBlob
{
  return self->_rikKeyBlob;
}

- (BOOL)useAppleConnect
{
  return self->_useAppleConnect;
}

- (BOOL)skipScPairingTicket
{
  return self->_skipScPairingTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rikKeyBlob, 0);
  objc_storeStrong((id *)&self->_tatsuURL, 0);
  objc_storeStrong((id *)&self->_trustObjectURL, 0);
  objc_storeStrong((id *)&self->_FDRDSURL, 0);
  objc_storeStrong((id *)&self->_FDRCAURL, 0);

  objc_storeStrong((id *)&self->_SCPairURL, 0);
}

@end