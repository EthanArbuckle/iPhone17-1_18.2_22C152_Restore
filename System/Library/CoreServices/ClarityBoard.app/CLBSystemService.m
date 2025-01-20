@interface CLBSystemService
- (CLBSystemService)initWithDelegate:(id)a3;
- (CLBSystemServiceDelegate)delegate;
- (NSObject)lockScreenDidCompleteToken;
- (id)systemServiceApplicationInfoProvider:(id)a3;
- (void)_attemptToDismissLockScreenWithCompletion:(id)a3;
- (void)_finishHandlingOpenApplicationRequest:(id)a3 verifierResult:(id)a4 completion:(id)a5;
- (void)_handleUpdatedScreenSizeForApplication:(id)a3 completion:(id)a4;
- (void)_performSceneUpdateForRequest:(id)a3;
- (void)_reportInsecureProcessesForAction:(id)a3;
- (void)dealloc;
- (void)setLockScreenDidCompleteToken:(id)a3;
- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5;
- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6;
- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5;
- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4;
@end

@implementation CLBSystemService

- (CLBSystemService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLBSystemService;
  v5 = [(CLBSystemService *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[FBSystemService sharedInstance];
    [v7 setDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(CLBSystemService *)self lockScreenDidCompleteToken];

  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    v5 = [(CLBSystemService *)self lockScreenDidCompleteToken];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)CLBSystemService;
  [(CLBSystemService *)&v6 dealloc];
}

- (id)systemServiceApplicationInfoProvider:(id)a3
{
  return objc_msgSend((id)qword_100186478, "appLibrary", a3);
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void *))a5;
  BSDispatchQueueAssertMain();
  objc_super v9 = +[CLFLog commonLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 systemServiceDescription];
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handle open application request (%@)", buf, 0xCu);
  }
  v11 = [(CLBSystemService *)self lockScreenDidCompleteToken];

  if (v11)
  {
    v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100100754(v12);
    }

    v13 = FBSOpenApplicationErrorCreate();
    v8[2](v8, v13);
  }
  else
  {
    v14 = +[CLBOpenApplicationVerifier sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002334C;
    v15[3] = &unk_10015CD10;
    id v16 = v7;
    v17 = self;
    v18 = v8;
    [v14 verifyRequest:v16 completionHandler:v15];

    v13 = v16;
  }
}

- (void)_attemptToDismissLockScreenWithCompletion:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to dismiss lock screen.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  objc_initWeak(&location, v6);

  id v7 = objc_loadWeakRetained(&location);
  v8 = +[NSOperationQueue mainQueue];
  uint64_t v9 = CLBLockScreenDidCompleteNotification;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100023780;
  v17 = &unk_10015CD38;
  objc_copyWeak(&v19, buf);
  id v10 = v4;
  id v18 = v10;
  objc_copyWeak(&v20, &location);
  v11 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:&v14];
  -[CLBSystemService setLockScreenDidCompleteToken:](self, "setLockScreenDidCompleteToken:", v11, v14, v15, v16, v17);

  v12 = (void *)qword_100186478;
  v13 = +[CLBEvent eventWithType:7 context:0];
  [v12 handleEvent:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);
}

- (void)_finishHandlingOpenApplicationRequest:(id)a3 verifierResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))objc_retainBlock(a5);
  v11 = [v9 error];
  v12 = v11;
  if (v11)
  {
    [v11 code];
    id v20 = [v12 errorDescription];
    v13 = FBSOpenApplicationErrorCreate();

    v14 = +[CLFLog commonLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not handling open application request: %@", buf, 0xCu);
    }

    if (v10)
    {
LABEL_5:
      v10[2](v10, v13);
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v15 = [v9 pptTestURL];
    if (v15)
    {
      [UIApp handleTestURL:v15];
    }
    else
    {
      id v16 = [[CLBOpenApplicationRequest alloc] initWithRequest:v8 completion:v10];
      uint64_t v17 = qword_100186478;
      id v18 = +[CLBEvent eventWithType:4 context:v16];
      LOBYTE(v17) = [(id)v17 handleEvent:v18];

      if ((v17 & 1) == 0) {
        [(CLBSystemService *)self _performSceneUpdateForRequest:v16];
      }

      id v10 = 0;
    }

    v13 = 0;
    if (v10) {
      goto LABEL_5;
    }
  }
  id v19 = +[CLBSiriPresentationController sharedPresentationController];
  if ([v19 isPresented]) {
    [v19 dismissSiri:29];
  }

LABEL_15:
}

- (void)_handleUpdatedScreenSizeForApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [v6 bundleIdentifier];
  id v9 = [(CLBSystemService *)self delegate];
  id v10 = [v9 systemService:self displayStyleForBundleIdentifier:v8];

  v11 = [(CLBSystemService *)self delegate];
  v12 = [v11 systemService:self lastUsedDisplayStyleForBundleIdentifier:v8];

  if (!v12 || [v12 integerValue] == v10) {
    goto LABEL_13;
  }
  v13 = +[CLFLog commonLog];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = sub_10001DCB8((uint64_t)[v12 integerValue]);
    uint64_t v15 = sub_10001DCB8((uint64_t)v10);
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Display style for %@ changed: last %@, current %@", buf, 0x20u);
  }
  id v16 = +[FBProcessManager sharedInstance];
  uint64_t v17 = [v16 applicationProcessesForBundleIdentifier:v8];

  if ((unint64_t)[v17 count] >= 2)
  {
    id v18 = +[CLFLog commonLog];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100100798((uint64_t)v8, v18);
    }
  }
  id v19 = [v17 firstObject];

  if (v19)
  {
    id v20 = +[CLFLog commonLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Terminating to handle updated screen size: %@", buf, 0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100023DAC;
    v21[3] = &unk_10015CD60;
    id v22 = v6;
    id v23 = v7;
    [v19 killForReason:5 andReport:0 withDescription:@"scene frame changed" completion:v21];
  }
  else
  {
LABEL_13:
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_performSceneUpdateForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 systemRequest];
  id v6 = [v5 bundleIdentifier];

  if (v6)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000240A0;
    v16[3] = &unk_10015CD88;
    id v7 = v4;
    uint64_t v17 = v7;
    id v18 = self;
    id v8 = v6;
    id v19 = v8;
    id v9 = objc_retainBlock(v16);
    id v10 = [v7 application];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100024130;
    v13[3] = &unk_10015CD60;
    id v14 = v8;
    id v15 = v9;
    v11 = v9;
    [(CLBSystemService *)self _handleUpdatedScreenSizeForApplication:v10 completion:v13];

    v12 = v17;
  }
  else
  {
    v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100100810(v12);
    }
  }
}

- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    char v13 = 1;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CLBSystemService *)self _reportInsecureProcessesForAction:v15];
        }
        else {
          char v13 = 0;
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
    if (v9)
    {
      if (v13) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = 8;
      }
      goto LABEL_17;
    }
  }
  else if (v9)
  {
    uint64_t v16 = 0;
LABEL_17:
    v9[2](v9, v16);
  }
}

- (void)_reportInsecureProcessesForAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 secureModeViolations];
  v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v83 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received insecure drawing action %@", buf, 0xCu);
  }
  id v48 = v3;

  unsigned int v54 = getpid();
  id v52 = objc_alloc_init((Class)NSMutableSet);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v4;
  id v55 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v75;
    id v50 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v75 != v53) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v74 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "layerNamesByContext", v48);
        id v10 = [v9 count];

        uint64_t v56 = v7;
        if (v10)
        {
          id v11 = [v8 layerNamesByContext];
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_100024A00;
          v70[3] = &unk_10015CDB0;
          id v71 = v52;
          id v72 = v6;
          v73 = v8;
          [v11 enumerateKeysAndObjectsUsingBlock:v70];

          uint64_t v12 = v71;
        }
        else
        {
          uint64_t v12 = [v8 processId];
          [v6 addObject:v12];
        }

        char v13 = [v8 processId];
        id v14 = +[NSNumber numberWithInt:v54];
        unsigned int v15 = [v13 isEqualToNumber:v14];

        if (v15)
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v16 = [v8 contextIds];
          id v17 = [v16 countByEnumeratingWithState:&v66 objects:v80 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v67;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v67 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                id v22 = +[CLFLog commonLog];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  id v23 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", [v21 intValue]);
                  *(_DWORD *)buf = 138412290;
                  id v83 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Violating window: %@", buf, 0xCu);
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v66 objects:v80 count:16];
            }
            while (v18);
          }

          id v6 = v50;
        }
        ++v7;
      }
      while ((id)(v56 + 1) != v55);
      id v55 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v55);
  }

  if ([v52 count])
  {
    id v24 = v6;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v25 = v52;
    id v26 = [v25 countByEnumeratingWithState:&v62 objects:v79 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v63;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v63 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
          v31 = +[CLFLog commonLog];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v83 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Insecure layer: %@", buf, 0xCu);
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v62 objects:v79 count:16];
      }
      while (v27);
    }

    id v6 = v24;
  }
  v32 = objc_msgSend(obj, "bs_map:", &stru_10015CDF0, v48);
  v33 = +[NSSet setWithArray:v32];

  v57 = +[FBProcessManager sharedInstance];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v34 = obj;
  id v35 = [v34 countByEnumeratingWithState:&v58 objects:v78 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v59;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)k) processId];
        id v40 = [v39 intValue];

        if ((int)v40 >= 1)
        {
          v41 = +[NSNumber numberWithInt:v40];
          unsigned int v42 = [v33 containsObject:v41];

          if (v42)
          {
            v43 = v33;
            v44 = [v57 processForPID:v40];
            v45 = v44;
            if (v44)
            {
              v46 = [v44 bundleIdentifier];
              v47 = +[CLFLog commonLog];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v83 = v46;
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Process had insecure drawing: %@", buf, 0xCu);
              }
            }
            v33 = v43;
          }
        }
      }
      id v36 = [v34 countByEnumeratingWithState:&v58 objects:v78 count:16];
    }
    while (v36);
  }
}

- (CLBSystemServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLBSystemServiceDelegate *)WeakRetained;
}

- (NSObject)lockScreenDidCompleteToken
{
  return self->_lockScreenDidCompleteToken;
}

- (void)setLockScreenDidCompleteToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenDidCompleteToken, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end