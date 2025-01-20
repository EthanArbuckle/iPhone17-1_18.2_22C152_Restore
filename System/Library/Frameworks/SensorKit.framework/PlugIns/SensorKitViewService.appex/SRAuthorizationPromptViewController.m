@interface SRAuthorizationPromptViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)initialize;
- (BOOL)migrationMode;
- (NSBundle)appBundle;
- (NSError)error;
- (NSSet)requestedServices;
- (SRAuthorizationStore)authorizationStore;
- (id)authorizationTableCompletedPromptSuccessfully:(id)result;
- (void)authorizationTable:(id)a3 foundIssueWithApp:(id)a4;
- (void)authorizationTable:(id)a3 openURL:(id)a4;
- (void)dealloc;
- (void)requestAuthorizationForBundle:(id)a3 services:(id)a4;
- (void)requestAuthorizationMigrationForBundle:(id)a3 services:(id)a4;
- (void)setAppBundle:(id)a3;
- (void)setAuthorizationStore:(id)a3;
- (void)setError:(id)a3;
- (void)setMigrationMode:(BOOL)a3;
- (void)setRequestedServices:(id)a3;
- (void)showAppsAndStudies;
- (void)showFirstRunOnboarding;
- (void)showResearchData;
- (void)showStudyAuthorizationForBundlePath:(id)a3;
@end

@implementation SRAuthorizationPromptViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000161F0 = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationPromptViewController");
  }
}

- (void)dealloc
{
  [(SRAuthorizationPromptViewController *)self setError:0];
  [(SRAuthorizationPromptViewController *)self setRequestedServices:0];
  [(SRAuthorizationPromptViewController *)self setAuthorizationStore:0];
  [(SRAuthorizationPromptViewController *)self setAppBundle:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationPromptViewController;
  [(SRAuthorizationPromptViewController *)&v3 dealloc];
}

- (void)requestAuthorizationForBundle:(id)a3 services:(id)a4
{
  if (![a3 length])
  {
    v30 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Empty bundle identifier", buf, 2u);
    }
    [(SRAuthorizationPromptViewController *)self setError:+[SRError errorWithCode:8200]];
    v31 = self;
    goto LABEL_60;
  }
  id v41 = a3;
  v42 = self;
  id v7 = +[NSMutableSet set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v46;
    uint64_t v11 = SRSensorDeletionRecordsSuffix;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(a4);
        }
        v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v13 hasSuffix:v11] & 1) == 0)
        {
          id v15 = +[SRSensorDescription sensorDescriptionForSensor:v13];
          if (v15)
          {
            objc_msgSend(v7, "addObject:", objc_msgSend(v15, "name"));
          }
          else
          {
            v16 = qword_1000161F0;
            if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v57 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Ignoring request to authorize for %{public}@ because sensor description could not be found", buf, 0xCu);
            }
          }
        }
      }
      id v9 = [a4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v9);
  }
  v17 = v42;
  if (!v42) {
    goto LABEL_56;
  }
  id v18 = objc_msgSend(-[SRAuthorizationPromptViewController extensionContext](v42, "extensionContext"), "_auxiliaryConnection");
  if ([(SRAuthorizationPromptViewController *)v42 migrationMode])
  {
    v19 = &off_100010578;
LABEL_18:
    id v20 = [v18 valueForEntitlement:*v19];
    goto LABEL_19;
  }
  if ([v18 valueForEntitlement:@"com.apple.private.sensorkit.reader.wildcard.allow"]) {
    goto LABEL_38;
  }
  id v20 = [v18 valueForEntitlement:@"com.apple.sensorkit.reader.allow"];
  if (!v20)
  {
    id v20 = [v18 valueForEntitlement:@"com.apple.developer.sensorkit.reader.allow"];
    if (!v20)
    {
      v19 = &off_100010560;
      goto LABEL_18;
    }
  }
LABEL_19:
  id v21 = [v7 count];
  if (v20 && !v21) {
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_56:
    v40 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Lacking entitlement to request authorization", buf, 2u);
    }
    uint64_t v38 = 0;
    goto LABEL_59;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v22 = [v7 countByEnumeratingWithState:&v49 objects:buf count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v50;
    while (2)
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v7);
        }
        uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
        id v28 = +[SRSensorDescription sensorDescriptionForSensor:v26];
        if (!v28)
        {
          v39 = qword_1000161F0;
          if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v54 = 138543362;
            uint64_t v55 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to find sensor description for %{public}@", v54, 0xCu);
          }
LABEL_55:
          v17 = v42;
          goto LABEL_56;
        }
        v29 = v28;
        if (([v20 containsObject:v26] & 1) == 0
          && (objc_msgSend(v20, "containsObject:", objc_msgSend(v29, "legacyName")) & 1) == 0
          && !objc_msgSend(v20, "containsObject:", objc_msgSend(v29, "publicEntitlementValue")))
        {
          goto LABEL_55;
        }
      }
      id v23 = [v7 countByEnumeratingWithState:&v49 objects:buf count:16];
      v17 = v42;
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_38:
  [(SRAuthorizationPromptViewController *)v17 setRequestedServices:v7];
  [(SRAuthorizationPromptViewController *)v17 setAppBundle:+[NSBundle sk_bundleWithIdentifier:v41]];
  v32 = [(SRAuthorizationPromptViewController *)v17 appBundle];
  if (!v32)
  {
    id v33 = objc_msgSend(-[SRAuthorizationPromptViewController extensionContext](v17, "extensionContext"), "_auxiliaryConnection");
    if (v33) {
      [v33 auditToken];
    }
    else {
      memset(v44, 0, sizeof(v44));
    }
    v32 = sub_100003264((uint64_t)NSBundle, v44);
  }
  [(SRAuthorizationPromptViewController *)v17 setAppBundle:v32];
  v34 = [(SRAuthorizationPromptViewController *)v17 appBundle];
  v35 = qword_1000161F0;
  BOOL v36 = os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_DEFAULT);
  if (!v34)
  {
    if (v36)
    {
      *(_DWORD *)buf = 138543362;
      id v57 = v41;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Bundle not found for %{public}@, Exiting prompt", buf, 0xCu);
    }
    uint64_t v38 = 8200;
LABEL_59:
    [(SRAuthorizationPromptViewController *)v17 setError:+[SRError errorWithCode:v38]];
    v31 = v17;
LABEL_60:
    -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(v31);
    return;
  }
  if (v36)
  {
    *(_DWORD *)buf = 138543618;
    id v57 = a4;
    __int16 v58 = 2114;
    id v59 = v41;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Got prompt request %{public}@ for %{public}@", buf, 0x16u);
  }
  id v37 = [objc_alloc((Class)SRAuthorizationStore) initWithSensors:a4];
  [(SRAuthorizationPromptViewController *)v17 setAuthorizationStore:v37];

  [(SRAuthorizationStore *)[(SRAuthorizationPromptViewController *)v17 authorizationStore] listenForAuthorizationUpdates:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064A4;
  block[3] = &unk_100010458;
  block[4] = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)authorizationTableCompletedPromptSuccessfully:(id)result
{
  if (result)
  {
    v1 = result;
    v2 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_INFO))
    {
      int v5 = 138543362;
      id v6 = [v1 error];
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Telling host application that the prompt is complete with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    id v3 = [v1 error];
    id v4 = [v1 _remoteViewControllerProxy];
    if (v3) {
      return objc_msgSend(v4, "authorizationRequestFailedWithError:", objc_msgSend(v1, "error"));
    }
    else {
      return [v4 authorizationRequestCompleted];
    }
  }
  return result;
}

- (void)requestAuthorizationMigrationForBundle:(id)a3 services:(id)a4
{
  [(SRAuthorizationPromptViewController *)self setMigrationMode:1];

  [(SRAuthorizationPromptViewController *)self requestAuthorizationForBundle:a3 services:a4];
}

- (void)showAppsAndStudies
{
  uint64_t v5 = 0;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openSensitiveURL:withOptions:error:", sub_1000035D0(), 0, &v5);
  uint64_t v3 = v5;
  if (v5)
  {
    id v4 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to open settings because %{public}@", buf, 0xCu);
    }
  }
  -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(self);
}

- (void)showStudyAuthorizationForBundlePath:(id)a3
{
  uint64_t v6 = 0;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace", a3), "openSensitiveURL:withOptions:error:", sub_1000035D0(), 0, &v6);
  uint64_t v4 = v6;
  if (v6)
  {
    uint64_t v5 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to open settings because %{public}@", buf, 0xCu);
    }
  }
  -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(self);
}

- (void)showResearchData
{
  uint64_t v5 = 0;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openSensitiveURL:withOptions:error:", sub_1000035D0(), 0, &v5);
  uint64_t v3 = v5;
  if (v5)
  {
    uint64_t v4 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to open settings because %{public}@", buf, 0xCu);
    }
  }
  -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(self);
}

- (void)showFirstRunOnboarding
{
  id v3 = objc_msgSend(-[SRAuthorizationPromptViewController extensionContext](self, "extensionContext"), "_auxiliaryConnection");
  if (self) {
    id v4 = [v3 valueForEntitlement:@"com.apple.private.sensorkit.firstRunOnboarding.allow"];
  }
  else {
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue])
  {
    uint64_t v5 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got prompt request for first run onboarding", buf, 2u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006EF4;
    block[3] = &unk_100010458;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v6 = qword_1000161F0;
    if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Lacking entitlement to request first run onboarding", buf, 2u);
    }
    [(SRAuthorizationPromptViewController *)self setError:+[SRError errorWithCode:0]];
    -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(self);
  }
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRAuthorizationPromptServiceInterface];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRAuthorizationPromptClientInterface];
}

- (void)authorizationTable:(id)a3 foundIssueWithApp:(id)a4
{
  if (![(SRAuthorizationPromptViewController *)self error])
  {
    [(SRAuthorizationPromptViewController *)self setError:a4];
  }
}

- (void)authorizationTable:(id)a3 openURL:(id)a4
{
  id v5 = [(SRAuthorizationPromptViewController *)self extensionContext];

  [v5 openURL:a4 completionHandler:&stru_1000104E8];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSSet)requestedServices
{
  return self->_requestedServices;
}

- (void)setRequestedServices:(id)a3
{
}

- (SRAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
}

- (BOOL)migrationMode
{
  return self->_migrationMode;
}

- (void)setMigrationMode:(BOOL)a3
{
  self->_migrationMode = a3;
}

@end