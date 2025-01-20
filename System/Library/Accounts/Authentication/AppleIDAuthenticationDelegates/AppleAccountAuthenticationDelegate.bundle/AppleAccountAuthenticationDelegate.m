void sub_3598(uint64_t a1)
{
  id v2;
  uint64_t vars8;

  v2 = +[FMDFMIPManager sharedInstance];
  [v2 didReceiveLostModeExitAuthToken:*(void *)(a1 + 32)];
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_needsLostModeExitAuth(void *a1, const char *a2, ...)
{
  return [a1 needsLostModeExitAuth];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}
 *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "The account that initiated the auth is an AppleAccount, set the tokens on it", buf, 2u);
      }

      v25 = v12;
      if (!v25) {
        goto LABEL_5;
      }
    }
    else
    {
      v26 = [v11 accountsWithAccountTypeIdentifier:v22];
      v27 = _AALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v18;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate: Looking for account with personID: %@", buf, 0xCu);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v26;
      v25 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v25)
      {
        v34 = self;
        v35 = v12;
        v36 = v11;
        v29 = *(void *)v38;
        while (2)
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v28);
            }
            v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v32 = objc_msgSend(v31, "aa_personID");
            v33 = [v32 isEqualToString:v18];

            if (v33)
            {
              v25 = v31;
              goto LABEL_25;
            }
          }
          v25 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v25) {
            continue;
          }
          break;
        }
LABEL_25:
        v12 = v35;
        v11 = v36;
        self = v34;
      }

      if (!v25) {
        goto LABEL_5;
      }
    }
    [(AppleAccountAuthenticationDelegate *)self _updateAccount:v25 accountStore:v11 withProvisioningResponse:v10];
    v13[2](v13);

    goto LABEL_28;
  }
  v16 = [v10 objectForKeyedSubscript:@"status-message"];
  v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v16;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate: Auth ERROR: %@", buf, 0xCu);
  }

  v18 = 0;
LABEL_5:
  v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate: Couldn't find an matching AppleAccount", buf, 2u);
  }

  v13[2](v13);
LABEL_28:
}

- (void)_updateAccount:(id)a3 accountStore:(id)a4 withProvisioningResponse:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate: Updating Account tokens", buf, 2u);
  }

  id v11 = [objc_alloc((Class)AAProvisioningResponse) initWithDictionary:v9];
  if (objc_msgSend(v7, "aa_updateTokensWithProvisioningResponse:", v11))
  {
    v12 = [v7 objectID];

    if (v12)
    {
      uint64_t v23 = 0;
      if (([v8 saveVerifiedAccount:v7 error:&v23] & 1) == 0)
      {
        v13 = _AALogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "AAAuthenticationDelegate - Account save failed", buf, 2u);
        }
      }
    }
  }
  v14 = [v9 objectForKeyedSubscript:@"tokens"];
  v15 = [v14 objectForKeyedSubscript:kAAProtocolFMIPLostModeTokenKey];

  if (v15)
  {
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "AppleAccountAuthenticationDelegate received FMIP lost-mode token.", buf, 2u);
    }

    v17 = +[FMDFMIPManager sharedInstance];
    unsigned int v18 = [v17 needsLostModeExitAuth];

    if (v18)
    {
      v19 = _AALogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Sending lost-mode token to FMDFMIPManager didReceiveLostModeExitAuthToken...", buf, 2u);
      }

      v20 = dispatch_get_global_queue(0, 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_3598;
      v21[3] = &unk_4130;
      id v22 = v15;
      dispatch_async(v20, v21);
    }
  }
}

@end