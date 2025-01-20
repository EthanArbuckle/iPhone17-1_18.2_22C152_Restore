@interface AKPCSAuthPushHandler
- (AKPCSAuthPushHandler)initWithAccountManager:(id)a3 webSessionPCSKeyProvider:(id)a4;
- (BOOL)_isPrimaryAccountAltDSID:(id)a3;
- (double)_safeTTL:(double)a3;
- (id)_teardownPayloadWithPushMessage:(id)a3 isArmed:(BOOL)a4;
- (void)armDeviceWithPCSAuthorizationContextForMessage:(id)a3 completion:(id)a4;
@end

@implementation AKPCSAuthPushHandler

- (AKPCSAuthPushHandler)initWithAccountManager:(id)a3 webSessionPCSKeyProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPCSAuthPushHandler;
  v9 = [(AKPCSAuthPushHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_webSessionKeyProvider, a4);
  }

  return v10;
}

- (void)armDeviceWithPCSAuthorizationContextForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 webSessionUUID];
  if (!v8
    || (v9 = (void *)v8,
        [v6 timestamp],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    v25 = _AKLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Incoming push does not contain walrus web access info, abandoning device arming", buf, 2u);
    }
    goto LABEL_11;
  }
  v11 = [v6 altDSID];
  unsigned __int8 v12 = [(AKPCSAuthPushHandler *)self _isPrimaryAccountAltDSID:v11];

  if ((v12 & 1) == 0)
  {
    v25 = _AKLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100189EB0(v25);
    }
LABEL_11:

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_12;
  }
  v13 = [v6 ttlInMinutes];
  [v13 doubleValue];
  [(AKPCSAuthPushHandler *)self _safeTTL:v14 * 60.0];
  double v16 = v15;

  v17 = +[NSDate dateWithTimeIntervalSinceNow:v16];
  id v18 = objc_alloc((Class)AKPCSAuthContext);
  v19 = [v6 webSessionUUID];
  id v20 = [v18 initWithWebSessionIdentifier:v19 expiryDate:v17 userInfo:0];

  v21 = _AKLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v20 description];
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Begin arming device with context %@.", buf, 0xCu);
  }
  webSessionKeyProvider = self->_webSessionKeyProvider;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000896BC;
  v26[3] = &unk_100229D70;
  id v27 = v20;
  id v30 = v7;
  v28 = self;
  id v29 = v6;
  id v24 = v20;
  [(AKWebSessionPCSKeyProvider *)webSessionKeyProvider saveContext:v24 completion:v26];

LABEL_12:
}

- (BOOL)_isPrimaryAccountAltDSID:(id)a3
{
  accountManager = self->_accountManager;
  id v4 = a3;
  v5 = [(AKAccountManager *)accountManager altDSIDforPrimaryiCloudAccount];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (id)_teardownPayloadWithPushMessage:(id)a3 isArmed:(BOOL)a4
{
  BOOL v4 = a4;
  v14[0] = @"idmsdata";
  id v5 = a3;
  unsigned __int8 v6 = [v5 idmsData];
  v15[0] = v6;
  v14[1] = @"srdwa";
  v12[0] = @"wscUUID";
  id v7 = [v5 webSessionUUID];

  v13[0] = v7;
  v12[1] = @"PCSKeysArmedEligible";
  uint64_t v8 = +[NSNumber numberWithBool:v4];
  v13[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

- (double)_safeTTL:(double)a3
{
  double v4 = 3600.0;
  if (a3 <= 3600.0) {
    return a3;
  }
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    double v8 = a3;
    __int16 v9 = 2048;
    uint64_t v10 = 0x40AC200000000000;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested PCS auth TTL [%f] over max [%f]", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_webSessionKeyProvider, 0);
}

@end