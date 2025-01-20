@interface ADExtensionService
- (ADCommandCenterClient)commandCenterClient;
- (ADExtensionService)init;
- (BOOL)_intentNeedsPreparation:(id)a3;
- (BOOL)_prepareNameComponents:(id)a3 meCardCache:(id *)a4;
- (BOOL)_preparePerson:(id)a3 meCardCache:(id *)a4;
- (BOOL)_replacement:(id *)a3 forString:(id)a4 meCardCache:(id *)a5;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_meCard;
- (id)_meCardWithCache:(id *)a3;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (id)extensionService:(id)a3 contextDictionaryForCommand:(id)a4;
- (id)extensionService:(id)a3 contextDictionaryForError:(id)a4;
- (id)siriLanguageCodeForExtensionService:(id)a3;
- (void)_logUUFRConditionally:(id)a3 executionContext:(id)a4;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)extensionService:(id)a3 extensionRequestDidFinishForApplication:(id)a4 error:(id)a5;
- (void)extensionService:(id)a3 extensionRequestWillStartForApplication:(id)a4;
- (void)extensionService:(id)a3 handleFailedStartPlaybackWithDestination:(int64_t)a4 completion:(id)a5;
- (void)extensionService:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 logEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6;
- (void)extensionService:(id)a3 prepareForStartPlaybackWithDestination:(int64_t)a4 intent:(id)a5 completion:(id)a6;
- (void)extensionService:(id)a3 prepareIntent:(id)a4;
- (void)extensionService:(id)a3 processData:(id)a4 usingSecurityProcedure:(int64_t)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 processDataUsingSHA256WithInMemorySalt:(id)a4 completionHandler:(id)a5;
- (void)extensionService:(id)a3 requiresHandlingCommand:(id)a4 completion:(id)a5;
- (void)extensionService:(id)a3 suspendTimeout:(BOOL)a4;
- (void)extensionService:(id)a3 wantsToCacheImage:(id)a4;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)resetExternalResources;
- (void)setCommandCenterClient:(id)a3;
@end

@implementation ADExtensionService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandCenterClient);
  objc_storeStrong((id *)&self->_extensionService, 0);
}

- (void)setCommandCenterClient:(id)a3
{
}

- (ADCommandCenterClient)commandCenterClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandCenterClient);
  return (ADCommandCenterClient *)WeakRetained;
}

- (void)_logUUFRConditionally:(id)a3 executionContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    kdebug_trace();
    v7 = [v6 info];
    v8 = [v7 turnId];

    if (v8)
    {
      id v9 = objc_alloc_init((Class)SISchemaUEIUUFRReady);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v9 setAceCommandClass:v11];

      id v12 = objc_alloc((Class)NSUUID);
      v13 = [v5 aceId];
      id v14 = [v12 initWithUUIDString:v13];

      if (v14)
      {
        id v15 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v14];
        [v9 setAceCommandId:v15];
      }
      v16 = +[AFDialogPhase completionDialogPhase];
      objc_msgSend(v9, "setDialogPhase:", objc_msgSend(v16, "UEIUUFRReadyDialogPhase"));

      [v9 setUufrReadySource:3];
      v17 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v20 = v17;
        v21 = [v5 encodedClassName];
        int v22 = 136315650;
        v23 = "-[ADExtensionService _logUUFRConditionally:executionContext:]";
        __int16 v24 = 2112;
        v25 = v21;
        __int16 v26 = 2112;
        v27 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Logging UUFR ready for %@ with turnId: %@", (uint8_t *)&v22, 0x20u);
      }
      v18 = +[AFAnalytics sharedAnalytics];
      [v18 logInstrumentation:v9 machAbsoluteTime:mach_absolute_time() turnIdentifier:v8];
    }
    else
    {
      v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        v23 = "-[ADExtensionService _logUUFRConditionally:executionContext:]";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Failed to find turnId for UUFR", (uint8_t *)&v22, 0xCu);
      }
    }
  }
}

- (BOOL)_intentNeedsPreparation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_10:
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_prepareNameComponents:(id)a3 meCardCache:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    id v36 = 0;
    v8 = [v6 namePrefix];
    unsigned int v9 = [(ADExtensionService *)self _replacement:&v36 forString:v8 meCardCache:a4];
    id v10 = v36;

    if (v9)
    {
      v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s setting nameComponents.namePrefix to %@", buf, 0x16u);
      }
      [v6 setNamePrefix:v10];
    }
    id v35 = v10;
    id v12 = [v6 givenName];
    unsigned int v13 = [(ADExtensionService *)self _replacement:&v35 forString:v12 meCardCache:a4];
    id v14 = v35;

    if (v13)
    {
      id v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s setting nameComponents.givenName to %@", buf, 0x16u);
      }
      [v6 setGivenName:v14];
      LOBYTE(v9) = 1;
    }
    id v34 = v14;
    v16 = [v6 middleName];
    unsigned int v17 = [(ADExtensionService *)self _replacement:&v34 forString:v16 meCardCache:a4];
    id v18 = v34;

    if (v17)
    {
      v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s setting nameComponents.middleName to %@", buf, 0x16u);
      }
      [v6 setMiddleName:v18];
      LOBYTE(v9) = 1;
    }
    id v33 = v18;
    v20 = [v6 nameSuffix];
    unsigned int v21 = [(ADExtensionService *)self _replacement:&v33 forString:v20 meCardCache:a4];
    id v22 = v33;

    if (v21)
    {
      v23 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s setting nameComponents.nameSuffix to %@", buf, 0x16u);
      }
      [v6 setNameSuffix:v22];
      LOBYTE(v9) = 1;
    }
    id v32 = v22;
    __int16 v24 = [v6 nickname];
    unsigned int v25 = [(ADExtensionService *)self _replacement:&v32 forString:v24 meCardCache:a4];
    id v26 = v32;

    if (v25)
    {
      v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s setting nameComponents.nickname to %@", buf, 0x16u);
      }
      [v6 setNickname:v26];
      LOBYTE(v9) = 1;
    }
    v28 = [v6 phoneticRepresentation];
    unsigned __int8 v29 = [(ADExtensionService *)self _prepareNameComponents:v28 meCardCache:a4];

    char v30 = v29 | v9;
  }
  else
  {
    char v30 = 0;
  }

  return v30;
}

- (BOOL)_preparePerson:(id)a3 meCardCache:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v30 = 0;
  v8 = [v6 contactIdentifier];
  unsigned int v9 = [(ADExtensionService *)self _replacement:&v30 forString:v8 meCardCache:a4];
  id v10 = v30;

  if (v9)
  {
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s setting contactIdentifier to %@", buf, 0x16u);
    }
    [v6 setContactIdentifier:v10];
  }
  id v29 = v10;
  id v12 = [v6 displayName];
  unsigned int v13 = [(ADExtensionService *)self _replacement:&v29 forString:v12 meCardCache:a4];
  id v14 = v29;

  if (v13)
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s setting displayName to %@", buf, 0x16u);
    }
    [v6 setDisplayName:v14];
    unsigned int v9 = 1;
  }
  v16 = [v6 nameComponents];
  unsigned int v17 = [(ADExtensionService *)self _prepareNameComponents:v16 meCardCache:a4];

  int v18 = v17 | v9;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = objc_msgSend(v6, "siriMatches", 0);
  id v20 = [v19 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        v18 |= [(ADExtensionService *)self _preparePerson:*(void *)(*((void *)&v25 + 1) + 8 * (void)v23) meCardCache:a4];
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v21);
  }

  return v18 & 1;
}

- (BOOL)_replacement:(id *)a3 forString:(id)a4 meCardCache:(id *)a5
{
  id v8 = a4;
  if ([v8 isEqualToString:_AFSUPRedactedUserFirstName])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 firstName];
LABEL_13:
    *a3 = v10;

    goto LABEL_14;
  }
  if ([v8 isEqualToString:_AFSUPRedactedUserMiddleName])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 middleName];
    goto LABEL_13;
  }
  if ([v8 isEqualToString:_AFSUPRedactedUserLastName])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 lastName];
    goto LABEL_13;
  }
  if ([v8 isEqualToString:_AFSUPRedactedUserFullName])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 fullName];
    goto LABEL_13;
  }
  if ([v8 isEqualToString:_AFSUPRedactedUserNickName])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 nickName];
    goto LABEL_13;
  }
  if ([v8 isEqualToString:_AFSUPRedactedMeCardInternalGUID])
  {
    unsigned int v9 = [(ADExtensionService *)self _meCardWithCache:a5];
    id v10 = [v9 internalGUID];
    goto LABEL_13;
  }
  if (![v8 isEqualToString:_AFSUPRedactedRelationName])
  {
    BOOL v11 = 0;
    goto LABEL_15;
  }
  unsigned int v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    id v15 = "-[ADExtensionService _replacement:forString:meCardCache:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s No replacement for %@, but there should be one", (uint8_t *)&v14, 0x16u);
  }
LABEL_14:
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (id)_meCard
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10015BB14;
  int v18 = sub_10015BB24;
  id v19 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[ADAssistantDataManager sharedDataManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015BB2C;
  v11[3] = &unk_100503C70;
  unsigned int v13 = &v14;
  v4 = v2;
  id v12 = v4;
  [v3 getMeCardsWithCompletion:v11];

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  v7 = AFSiriLogContextConnection;
  if (v6 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ADExtensionService _meCard]";
    __int16 v22 = 2048;
    uint64_t v23 = 0x4000000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Timed out fetching meCard  after waiting %0.1g seconds", buf, 0x16u);
    v7 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v15[5]) {
      CFStringRef v8 = @"a meCard";
    }
    else {
      CFStringRef v8 = @"(null)";
    }
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ADExtensionService _meCard]";
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Got %@", buf, 0x16u);
  }
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)_meCardWithCache:(id *)a3
{
  id v5 = *a3;
  if (!v5)
  {
    id v5 = [(ADExtensionService *)self _meCard];
    *a3 = v5;
  }
  return v5;
}

- (void)extensionService:(id)a3 handleFailedStartPlaybackWithDestination:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  CFStringRef v8 = (void (**)(void))a5;
  if ((unint64_t)a4 < 3)
  {
    id v10 = +[ADCommandCenter sharedCommandCenter];
    [v10 handleFailedStartPlaybackWithDestination:a4 completion:v8];
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[ADExtensionService extensionService:handleFailedStartPlaybackWithDestination:completion:]";
      __int16 v13 = 2048;
      int64_t v14 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unexpected value for startPlaybackType: %ld, ignoring.", (uint8_t *)&v11, 0x16u);
    }
    v8[2](v8);
  }
}

- (void)extensionService:(id)a3 prepareForStartPlaybackWithDestination:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  int v11 = (void (**)(id, void))a6;
  if ((unint64_t)a4 < 3)
  {
    __int16 v13 = +[ADCommandCenter sharedCommandCenter];
    [v13 prepareForStartPlaybackWithDestination:a4 intent:v10 completion:v11];
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[ADExtensionService extensionService:prepareForStartPlaybackWithDestination:intent:completion:]";
      __int16 v16 = 2048;
      int64_t v17 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unexpected value for startPlaybackType: %ld, ignoring.", (uint8_t *)&v14, 0x16u);
    }
    v11[2](v11, 0);
  }
}

- (id)extensionService:(id)a3 contextDictionaryForError:(id)a4
{
  return (id)AFAnalyticsContextCreateWithError();
}

- (id)extensionService:(id)a3 contextDictionaryForCommand:(id)a4
{
  return (id)AFAnalyticsContextCreateWithCommand();
}

- (void)extensionService:(id)a3 requiresHandlingCommand:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  CFStringRef v8 = +[ADCommandCenter sharedCommandCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015BF10;
  v10[3] = &unk_10050CF00;
  id v11 = v6;
  id v9 = v6;
  [v8 handleCommand:v7 completion:v10];
}

- (id)siriLanguageCodeForExtensionService:(id)a3
{
  id v3 = +[AFPreferences sharedPreferences];
  v4 = [v3 languageCode];

  return v4;
}

- (void)extensionService:(id)a3 logEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a5;
  id v9 = +[AFAnalytics sharedAnalytics];
  id v11 = v9;
  if ((unint64_t)(a4 - 601) >= 0x29) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = a4;
  }
  [v9 logEventWithType:v10 context:v8 contextNoCopy:v6];
}

- (void)extensionService:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[AFSiriActivationConnection sharedConnection];
  [v11 handleIntentForwardingAction:v10 inBackgroundApplicationWithBundleIdentifier:v9 completionHandler:v8];
}

- (void)extensionService:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[AFSiriActivationConnection sharedConnection];
  [v11 handleIntent:v10 inBackgroundAppWithBundleId:v9 reply:v8];
}

- (void)extensionService:(id)a3 extensionRequestDidFinishForApplication:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ADExtensionService *)self commandCenterClient];
  [v9 adExtensionRequestFinishedForApplication:v8 error:v7];
}

- (void)extensionService:(id)a3 extensionRequestWillStartForApplication:(id)a4
{
  id v5 = a4;
  id v6 = [(ADExtensionService *)self commandCenterClient];
  [v6 adExtensionRequestWillStartForApplication:v5];
}

- (void)extensionService:(id)a3 wantsToCacheImage:(id)a4
{
  id v5 = a4;
  id v6 = [(ADExtensionService *)self commandCenterClient];
  [v6 adWantsToCacheImage:v5];
}

- (void)extensionService:(id)a3 processDataUsingSHA256WithInMemorySalt:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[ADSecurityService sharedService];
  [v8 processData:v7 usingProcedure:5 completion:v6];
}

- (void)extensionService:(id)a3 processData:(id)a4 usingSecurityProcedure:(int64_t)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = +[ADSecurityService sharedService];
  [v10 processData:v9 usingProcedure:a5 completion:v8];
}

- (void)extensionService:(id)a3 suspendTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 _setIsTimeoutSuspended:v4];
}

- (void)extensionService:(id)a3 prepareIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ADExtensionService *)self _intentNeedsPreparation:v7])
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADExtensionService extensionService:prepareIntent:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Preparing INPerson in %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v14 = sub_10015BB14;
    id v15 = sub_10015BB24;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10015C5E4;
    v10[3] = &unk_100503C48;
    void v10[4] = self;
    v10[5] = buf;
    objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", objc_opt_class(), v10);
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v11 = 136315138;
      id v12 = "-[ADExtensionService extensionService:prepareIntent:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Finished", v11, 0xCu);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[ADExtensionService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s requestID = %@, fromRemote = %d", (uint8_t *)&v12, 0x1Cu);
  }
  if (!v6) {
    [(INSExtensionService *)self->_extensionService resetExternalResources];
  }
}

- (void)resetExternalResources
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADExtensionService resetExternalResources]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(INSExtensionService *)self->_extensionService resetExternalResources];
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10015CCA8;
  v48[3] = &unk_10050E1D8;
  v48[4] = self;
  id v11 = v9;
  id v49 = v11;
  id v35 = v10;
  id v50 = v35;
  id v12 = a5;
  __int16 v13 = objc_retainBlock(v48);
  [(ADExtensionService *)self _logUUFRConditionally:v11 executionContext:v12];
  __int16 v14 = dispatch_group_create();
  id v15 = [(INSExtensionService *)self->_extensionService extensionContext];
  __int16 v16 = [v12 originPeerInfo];

  uint64_t v17 = [v16 airPlayRouteIdentifiers];

  int v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[ADExtensionService handleCommand:forDomain:executionContext:reply:]";
    __int16 v53 = 2112;
    uint64_t v54 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s airPlayRouteIdentifiers = %@", buf, 0x16u);
  }
  objc_msgSend(v15, "_setAirPlayRouteIdentifiers:", v17, v17);
  id v19 = +[ADCommandCenter sharedCommandCenter];
  dispatch_group_enter(v14);
  id v20 = objc_alloc((Class)AFSafetyBlock);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10015CDD8;
  v46[3] = &unk_10050C0A8;
  id v21 = v14;
  v47 = v21;
  id v22 = [v20 initWithBlock:v46];
  uint64_t v23 = [v19 _speechManager];
  __int16 v24 = [v23 audioSessionController];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10015CEA8;
  v43[3] = &unk_100503BF8;
  id v25 = v15;
  id v44 = v25;
  id v26 = v22;
  id v45 = v26;
  [v24 getAudioSessionIDWithCompletion:v43];

  long long v27 = [v19 _speechCapturingContext];
  if (v27)
  {
    dispatch_group_enter(v21);
    id v28 = objc_alloc((Class)AFSafetyBlock);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10015CFA8;
    v41[3] = &unk_10050C0A8;
    v42 = v21;
    id v29 = [v28 initWithBlock:v41];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10015D078;
    v38[3] = &unk_100503C20;
    id v39 = v25;
    id v40 = v29;
    id v30 = v29;
    [v27 getAudioRecordRouteAndDeviceIdentificationWithCompletion:v38];
  }
  v31 = +[ADCommandCenter sharedCommandCenter];
  id v32 = [v31 _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D1B4;
  block[3] = &unk_10050D0D0;
  id v37 = v13;
  id v33 = v13;
  dispatch_group_notify(v21, v32, block);
}

- (id)controlCenterLockRestrictedCommands
{
  return 0;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = [(ADExtensionService *)self commandsForDomain:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (id)commandsForDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(ADExtensionService *)self domains];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(ADExtensionService *)self domains];
    if ([v7 containsObject:v4])
    {
      id v8 = [(INSExtensionService *)self->_extensionService commandIdentifiers];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)domains
{
  dispatch_semaphore_t v2 = [(INSExtensionService *)self->_extensionService groupIdentifier];
  id v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (ADExtensionService)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADExtensionService;
  dispatch_semaphore_t v2 = [(ADExtensionService *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    [(ADService *)v2 setIdentifier:@"ADExtensionServiceIdentifier"];
    id v4 = (INSExtensionService *)[objc_alloc((Class)INSExtensionService) initWithOptions:&__NSDictionary0__struct];
    extensionService = v3->_extensionService;
    v3->_extensionService = v4;

    [(INSExtensionService *)v3->_extensionService setDelegate:v3];
  }
  return v3;
}

@end