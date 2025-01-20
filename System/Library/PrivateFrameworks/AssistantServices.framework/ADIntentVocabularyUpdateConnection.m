@interface ADIntentVocabularyUpdateConnection
- (ADIntentVocabularyUpdateConnection)initWithBundleID:(id)a3 path:(id)a4 canDonateOnBehalfOfApps:(BOOL)a5;
- (id)_datastoreManager;
- (id)_datastoreManagerFor:(id)a3 bundlePath:(id)a4;
- (void)_askToSyncSlot:(id)a3 onBehalfOf:(id)a4;
- (void)_deleteEverythingOnBehalfOf:(id)a3 withDataStorageManager:(id)a4;
- (void)_recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withDataStorageManager:(id)a6 withValidationCompletion:(id)a7;
- (void)_triggerUserVocabularySyncAttributingApp:(id)a3 vocabType:(id)a4;
- (void)askToSyncSlot:(id)a3;
- (void)askToSyncSlot:(id)a3 onBehalfOf:(id)a4;
- (void)deleteEverything;
- (void)deleteEverythingOnBehalfOf:(id)a3;
- (void)fetchCurrentSiriLanguageCode:(id)a3;
- (void)fetchSiriAuthorization:(id)a3;
- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withValidationCompletion:(id)a6;
- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 withValidationCompletion:(id)a5;
- (void)requestSiriAuthorization:(id)a3;
- (void)verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4;
@end

@implementation ADIntentVocabularyUpdateConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastoreManager, 0);
  objc_storeStrong((id *)&self->_appPath, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

- (void)fetchCurrentSiriLanguageCode:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10030A9A8;
    v6[3] = &unk_10050C7A0;
    id v7 = v4;
    [(ADIntentVocabularyUpdateConnection *)self fetchSiriAuthorization:v6];
  }
}

- (void)verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    uint64_t CanDonateIntent = INAppCanDonateIntent();
    (*((void (**)(id, uint64_t))a4 + 2))(v6, CanDonateIntent);
  }
}

- (void)requestSiriAuthorization:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)BKSApplicationStateMonitor);
    unsigned int v6 = [v5 applicationStateForApplication:self->_appBundleID];
    [v5 invalidate];
    if (v6 == 8)
    {
      id v7 = +[NSXPCConnection currentConnection];
      v8 = v7;
      if (v7) {
        [v7 auditToken];
      }
      else {
        memset(v11, 0, sizeof(v11));
      }
      +[_INSiriAuthorizationManager _requestSiriAuthorization:v4 auditToken:v11];
    }
    else
    {
      v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        appBundleID = self->_appBundleID;
        *(_DWORD *)buf = 136315394;
        v13 = "-[ADIntentVocabularyUpdateConnection requestSiriAuthorization:]";
        __int16 v14 = 2114;
        v15 = appBundleID;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Ignoring attempt by %{public}@ to request Siri authorization while not in the foreground", buf, 0x16u);
      }
      [(ADIntentVocabularyUpdateConnection *)self fetchSiriAuthorization:v4];
    }
  }
}

- (void)fetchSiriAuthorization:(id)a3
{
  if (a3)
  {
    appBundleID = self->_appBundleID;
    id v5 = a3;
    (*((void (**)(id, id))a3 + 2))(v5, +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:appBundleID]);
  }
}

- (void)deleteEverythingOnBehalfOf:(id)a3
{
  id v4 = a3;
  if (self->_canDonateOnBehalfOfApps)
  {
    id v5 = [(ADIntentVocabularyUpdateConnection *)self _datastoreManagerFor:v4 bundlePath:0];
    [(ADIntentVocabularyUpdateConnection *)self _deleteEverythingOnBehalfOf:v4 withDataStorageManager:v5];
  }
  else
  {
    unsigned int v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[ADIntentVocabularyUpdateConnection deleteEverythingOnBehalfOf:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Process tried to delete vocabulary on behalf of apps but not authorized", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)deleteEverything
{
  appBundleID = self->_appBundleID;
  id v4 = [(ADIntentVocabularyUpdateConnection *)self _datastoreManager];
  [(ADIntentVocabularyUpdateConnection *)self _deleteEverythingOnBehalfOf:appBundleID withDataStorageManager:v4];
}

- (void)_deleteEverythingOnBehalfOf:(id)a3 withDataStorageManager:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = [v6 deleteEverything];
  v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ADIntentVocabularyUpdateConnection _deleteEverythingOnBehalfOf:withDataStorageManager:]";
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Removed all local user-vocabulary for %{public}@", buf, 0x16u);
  }
  v10 = +[ADSyncBlacklist sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10030AF50;
  v12[3] = &unk_10050C9E0;
  id v13 = v7;
  __int16 v14 = self;
  id v11 = v7;
  [v10 checkIfAnyUserVocabularyIsBlacklistedForApp:v11 completion:v12];
}

- (void)askToSyncSlot:(id)a3 onBehalfOf:(id)a4
{
}

- (void)askToSyncSlot:(id)a3
{
}

- (void)_askToSyncSlot:(id)a3 onBehalfOf:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  id v8 = +[ADSyncBlacklist sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _OWORD v11[2] = sub_10030B14C;
  v11[3] = &unk_10050BD80;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 checkPermissionToSyncSlot:v9 forApp:v10 completion:v11];
}

- (void)_triggerUserVocabularySyncAttributingApp:(id)a3 vocabType:(id)a4
{
  id v4 = +[NSString stringWithFormat:@"Synapse.%@#%@", a3, a4];
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[ADIntentVocabularyUpdateConnection _triggerUserVocabularySyncAttributingApp:vocabType:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Posting sync notification for reason: %@", buf, 0x16u);
  }
  notify_post("com.apple.assistant.app_vocabulary");
}

- (void)_recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withDataStorageManager:(id)a6 withValidationCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10030B474;
  v20[3] = &unk_10050BD58;
  id v21 = a6;
  id v22 = v12;
  id v23 = v13;
  v24 = self;
  id v25 = v14;
  id v26 = a7;
  id v15 = v26;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v21;
  [v19 checkIfSyncSlot:v17 isAllowedWithCompletion:v20];
}

- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withValidationCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = AFSiriLogContextDaemon;
  if (!self->_canDonateOnBehalfOfApps)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Process tried to donate vocabulary on behalf of apps but not authorized", (uint8_t *)&v20, 0xCu);
      if (!v13) {
        goto LABEL_8;
      }
    }
    else if (!v13)
    {
      goto LABEL_8;
    }
    v13[2](v13, 0);
    goto LABEL_8;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v15 = v14;
    id v16 = [v12 copy];
    id v17 = v16;
    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
    int v20 = 136315906;
    id v21 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:]";
    __int16 v22 = 2112;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v18;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s On behalf of %@ got %@ items for %@", (uint8_t *)&v20, 0x2Au);
  }
  id v19 = [(ADIntentVocabularyUpdateConnection *)self _datastoreManagerFor:v12 bundlePath:0];
  [(ADIntentVocabularyUpdateConnection *)self _recordVocabulary:v10 forIntentSlot:v11 onBehalfOf:v12 withDataStorageManager:v19 withValidationCompletion:v13];

LABEL_8:
}

- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 withValidationCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    id v14 = [(NSString *)self->_appBundleID copy];
    int v16 = 136315906;
    id v17 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:withValidationCompletion:]";
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s got %@ items for %@ from %@", (uint8_t *)&v16, 0x2Au);
  }
  id v15 = [(ADIntentVocabularyUpdateConnection *)self _datastoreManager];
  [(ADIntentVocabularyUpdateConnection *)self _recordVocabulary:v8 forIntentSlot:v9 onBehalfOf:self->_appBundleID withDataStorageManager:v15 withValidationCompletion:v10];
}

- (id)_datastoreManagerFor:(id)a3 bundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = (NSString *)v7;
    goto LABEL_18;
  }
  unsigned __int8 v10 = [v6 isEqualToString:@"com.apple.siriactionsd"];
  id v24 = 0;
  id v11 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v24];
  id v12 = (__CFString *)v24;
  if (!v11)
  {
    id v13 = AFSiriLogContextDaemon;
    if (v10)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        CFStringRef v14 = &stru_10050F7D8;
        *(_DWORD *)buf = 136315650;
        __int16 v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
        __int16 v27 = 2112;
        if (v12) {
          CFStringRef v14 = v12;
        }
        id v28 = v6;
        __int16 v29 = 2112;
        CFStringRef v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Could not get bundle record for app bundle ID %@ %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v22 = &stru_10050F7D8;
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
      __int16 v27 = 2112;
      if (v12) {
        CFStringRef v22 = v12;
      }
      id v28 = v6;
      __int16 v29 = 2112;
      CFStringRef v30 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Could not get bundle record for app bundle ID %@ %@", buf, 0x20u);
    }
  }
  id v15 = [v11 URL];
  id v9 = [v15 path];

  if (!v9)
  {
    int v16 = (void *)AFSiriLogContextDaemon;
    if (v10)
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        id v9 = self->_appPath;
        goto LABEL_17;
      }
      appPath = self->_appPath;
      __int16 v18 = v16;
      id v19 = (__CFString *)[(NSString *)appPath copy];
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      CFStringRef v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s App bundle path for app bundle ID %@ is nil, using %@", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      id v23 = self->_appPath;
      __int16 v18 = v16;
      id v19 = (__CFString *)[(NSString *)v23 copy];
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      CFStringRef v30 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s App bundle path for app bundle ID %@ is nil, using %@", buf, 0x20u);
    }

    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  __int16 v20 = +[_INVocabularyStoreManager managerForBundleID:v6 bundlePath:v9];

  return v20;
}

- (id)_datastoreManager
{
  datastoreManager = self->_datastoreManager;
  if (!datastoreManager)
  {
    id v4 = [(ADIntentVocabularyUpdateConnection *)self _datastoreManagerFor:self->_appBundleID bundlePath:self->_appPath];
    id v5 = self->_datastoreManager;
    self->_datastoreManager = v4;

    datastoreManager = self->_datastoreManager;
  }
  return datastoreManager;
}

- (ADIntentVocabularyUpdateConnection)initWithBundleID:(id)a3 path:(id)a4 canDonateOnBehalfOfApps:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)ADIntentVocabularyUpdateConnection;
    unsigned __int8 v10 = [(ADIntentVocabularyUpdateConnection *)&v18 init];
    if (v10)
    {
      id v11 = (NSString *)[v8 copy];
      appBundleID = v10->_appBundleID;
      v10->_appBundleID = v11;

      id v13 = (NSString *)[v9 copy];
      appPath = v10->_appPath;
      v10->_appPath = v13;

      v10->_canDonateOnBehalfOfApps = a5;
    }
    self = v10;
    id v15 = self;
  }
  else
  {
    int v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v20 = "-[ADIntentVocabularyUpdateConnection initWithBundleID:path:canDonateOnBehalfOfApps:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s no bundleID!", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

@end