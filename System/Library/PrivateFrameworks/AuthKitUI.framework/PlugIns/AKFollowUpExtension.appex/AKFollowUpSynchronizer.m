@interface AKFollowUpSynchronizer
+ (void)updateSynchronizeTimeForAccount:(id)a3 inStore:(id)a4;
+ (void)updateSynchronizeTimeNoSaveForAccount:(id)a3;
- (AKAppleIDAuthenticationController)controller;
- (AKFollowUpProvider)followupProvider;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)shouldSynchronizeForAccount:(id)a3;
- (BOOL)synchronizeFollowUpsForAccount:(id)a3 error:(id *)a4;
- (BOOL)synchronizeFollowUpsForAccount:(id)a3 inStore:(id)a4 error:(id *)a5;
- (id)_authController;
- (void)setController:(id)a3;
- (void)setFollowupProvider:(id)a3;
@end

@implementation AKFollowUpSynchronizer

- (BOOL)synchronizeFollowUpsForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007C74(v7);
    }

    v8 = +[AKAccountManager sharedInstance];
    id v6 = [v8 primaryiCloudAccount];
  }
  v9 = +[AKAccountManager sharedInstance];
  v10 = [v9 store];
  BOOL v11 = [(AKFollowUpSynchronizer *)self synchronizeFollowUpsForAccount:v6 inStore:v10 error:a4];

  return v11;
}

- (BOOL)synchronizeFollowUpsForAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(AKFollowUpSynchronizer *)self shouldSynchronizeForAccount:v8])
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100007CB8(v8, v10);
    }

    BOOL v11 = objc_opt_new();
    v12 = +[AKAccountManager sharedInstance];
    v13 = [v12 altDSIDForAccount:v8];
    [v11 setAltDSID:v13];

    v14 = [(AKFollowUpSynchronizer *)self _authController];
    id v18 = 0;
    unsigned __int8 v15 = [v14 synchronizeFollowUpItemsForContext:v11 error:&v18];
    id v16 = v18;

    if (v15)
    {
      +[AKFollowUpSynchronizer updateSynchronizeTimeForAccount:v8 inStore:v9];
    }
    else if (a5)
    {
      *a5 = v16;
    }
  }
  else if (a5)
  {
    +[NSError ak_errorWithCode:-7064];
    unsigned __int8 v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)_authController
{
  controller = self->_controller;
  if (!controller)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v5 = self->_controller;
    self->_controller = v4;

    [(AKAppleIDAuthenticationController *)self->_controller setDelegate:self];
    controller = self->_controller;
  }

  return controller;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (BOOL)shouldSynchronizeForAccount:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 accountPropertyForKey:@"AKFollowUpAccountRefreshTimestamp"];
    if (!v6) {
      goto LABEL_13;
    }
    v7 = +[NSDate date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = +[NSNumber numberWithDouble:v9];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last follow up refresh occured %@ seconds ago", (uint8_t *)&buf, 0xCu);
    }
    if (v9 < 86400.0)
    {
      v12 = [(AKFollowUpSynchronizer *)self followupProvider];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        BOOL v19 = 0;
      }
      else
      {
        v14 = _AKLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Checking for sparse follow ups", (uint8_t *)&buf, 2u);
        }

        unsigned __int8 v15 = [(AKFollowUpSynchronizer *)self followupProvider];
        id v27 = 0;
        id v16 = [v15 pendingFollowUpItems:&v27];
        id v17 = v27;

        if (v17)
        {
          id v18 = _AKLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100007D94(v18);
          }

          BOOL v19 = 1;
        }
        else
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v31 = 0x2020000000;
          char v32 = 0;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_100003158;
          v26[3] = &unk_10000C350;
          v26[4] = &buf;
          [v16 enumerateObjectsUsingBlock:v26];
          int v20 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
          BOOL v19 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
          v21 = _AKLogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v22 = @"NO";
            if (v20) {
              CFStringRef v22 = @"YES";
            }
            *(_DWORD *)v28 = 138412290;
            CFStringRef v29 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sparse followup item detected: %@", v28, 0xCu);
          }

          _Block_object_dispose(&buf, 8);
        }
      }
    }
    else
    {
LABEL_13:
      BOOL v19 = 1;
    }
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = @"NO";
      if (v19) {
        CFStringRef v24 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Will synchronize followups %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

+ (void)updateSynchronizeTimeForAccount:(id)a3 inStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 updateSynchronizeTimeNoSaveForAccount:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000032E8;
  v9[3] = &unk_10000C378;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  double v8 = v10;
  [v6 saveAccount:v7 withCompletionHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)updateSynchronizeTimeNoSaveForAccount:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating follow up synchronization for %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = +[NSDate date];
  [v3 setAccountProperty:v5 forKey:@"AKFollowUpAccountRefreshTimestamp"];
}

- (AKFollowUpProvider)followupProvider
{
  return self->_followupProvider;
}

- (void)setFollowupProvider:(id)a3
{
}

- (AKAppleIDAuthenticationController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_followupProvider, 0);
}

@end