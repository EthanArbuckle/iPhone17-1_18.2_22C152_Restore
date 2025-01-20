@interface AKGrandslamTokenUpdater
+ (BOOL)shouldUpdateSynchronouslyWith:(id)a3;
- (BOOL)_isTouchIDRequiredForGrandSlamServiceTokenWithID:(id)a3;
- (void)_updateCredentialForSavedAIDAAccount:(id)a3 accountStore:(id)a4 withNewTokens:(id)a5;
- (void)_updateWithRequest:(id)a3 error:(id *)a4;
- (void)updateGrandSlamServiceTokensWithRequest:(id)a3 error:(id *)a4;
@end

@implementation AKGrandslamTokenUpdater

- (void)updateGrandSlamServiceTokensWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(id)objc_opt_class() shouldUpdateSynchronouslyWith:v6])
  {
    [(AKGrandslamTokenUpdater *)self _updateWithRequest:v6 error:a4];
  }
  else
  {
    v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BE774;
    block[3] = &unk_10022B1C0;
    block[4] = self;
    id v9 = v6;
    v10 = a4;
    dispatch_async(v7, block);
  }
}

+ (BOOL)shouldUpdateSynchronouslyWith:(id)a3
{
  id v3 = a3;
  v4 = [v3 context];
  v5 = [v4 serviceIdentifier];
  if (v5)
  {
    id v6 = [v3 aidaAccount];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = _AKSignpostLogSystem();
  os_signpost_id_t v8 = _AKSignpostCreate();

  id v9 = _AKSignpostLogSystem();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PersistGrandslamTokens", " enableTelemetry=YES ", buf, 2u);
  }

  v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PersistGrandslamTokens  enableTelemetry=YES ", buf, 0xCu);
  }

  id v12 = [v6 aidaAccount];
  if (!v12)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v6 altDSID];
      v15 = [v6 appleIDUsername];
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v50 = (os_signpost_id_t)v14;
      __int16 v51 = 2112;
      double v52 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No AIDA account for altDSID %@ was found. Searching by Apple ID: %@", buf, 0x16u);
    }
    v16 = [v6 accountManager];
    v17 = [v6 appleIDUsername];
    id v12 = [v16 appleIDAccountWithAppleID:v17];

    if (!v12)
    {
      v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v6 appleIDUsername];
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v50 = (os_signpost_id_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating new AIDA account for Apple ID: %@", buf, 0xCu);
      }
      id v20 = objc_alloc((Class)ACAccount);
      v21 = [v6 accountManager];
      v22 = [v21 appleIDAccountType];
      id v12 = [v20 initWithAccountType:v22];

      v23 = [v6 appleIDUsername];
      [v12 setUsername:v23];

      v24 = +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated];
      if (v24) {
        [v12 setObject:v24 forKeyedSubscript:ACAccountPropertyPersonaIdentifier];
      }
    }
  }
  v25 = objc_msgSend(v6, "accountManager", v8 - 1);
  v26 = [v6 altDSID];
  v27 = [v25 authKitAccountWithAltDSID:v26 error:0];

  if (v27)
  {
    v28 = [v6 accountManager];
    objc_msgSend(v28, "setCredentialStorageOption:forAccount:", objc_msgSend(v27, "credentialLocation"), v12);
  }
  v29 = _AKLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v50 = (os_signpost_id_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updating AIDA account %@ with properties and tokens.", buf, 0xCu);
  }

  [v12 setCredential:0];
  [v12 setAuthenticated:1];
  v30 = [v6 accountManager];
  v31 = [v6 altDSID];
  [v30 setAltDSID:v31 forAccount:v12];

  v32 = [v6 dsid];

  if (v32)
  {
    v33 = [v6 dsid];
    [v12 setAccountProperty:v33 forKey:AKPropertyLegacyDSIDKey];
  }
  v34 = [v6 accountManager];
  id v48 = 0;
  unsigned int v35 = [v34 saveAccount:v12 error:&v48];
  id v36 = v48;

  if (v35)
  {
    v37 = _AKLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Successfully saved AIDA account.", buf, 2u);
    }

    v38 = [v6 accountManager];
    v39 = [v38 store];
    v40 = [v6 tokensById];
    [(AKGrandslamTokenUpdater *)self _updateCredentialForSavedAIDAAccount:v12 accountStore:v39 withNewTokens:v40];
  }
  else
  {
    if (a4) {
      *a4 = v36;
    }
    v38 = _AKLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100193024((uint64_t)v36, v38);
    }
  }

  uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
  v42 = _AKSignpostLogSystem();
  v43 = v42;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    unsigned int v44 = [v36 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v50) = v44;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v8, "PersistGrandslamTokens", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }

  v45 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v46 = [v36 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v50 = v8;
    __int16 v51 = 2048;
    double v52 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v53 = 1026;
    unsigned int v54 = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PersistGrandslamTokens  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }
}

- (void)_updateCredentialForSavedAIDAAccount:(id)a3 accountStore:(id)a4 withNewTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(33, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BEF90;
  v15[3] = &unk_10022A4D0;
  id v16 = v10;
  v17 = self;
  id v18 = v9;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(v11, v15);
}

- (BOOL)_isTouchIDRequiredForGrandSlamServiceTokenWithID:(id)a3
{
  return [a3 isEqualToString:@"com.apple.gs.icloud.storage.buy"];
}

@end