void sub_5444(uint64_t a1)
{
  void block[5];

  [*(id *)(a1 + 32) saveNotesInBackground:*(void *)(a1 + 40)];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54D4;
  block[3] = &unk_307B8;
  block[4] = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_54D4(uint64_t a1)
{
  [*(id *)(a1 + 32) _enableButtons];
  id v2 = [*(id *)(a1 + 32) parentController];
  [v2 dismiss];
}

uint64_t sub_6D00(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

id sub_727C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didConfirmTryWithoutSSL:a2 != 0];
}

id sub_75EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didConfirmSaveUnvalidatedAccount:a2 == 0];
}

void sub_7E9C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, long long a12)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    v13 = DALoggingwithCategory();
    os_log_type_t v14 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v13, v14))
    {
      buf = 138412546;
      WORD2(a12) = 2112;
      *(void *)((char *)&a12 + 6) = v12;
      _os_log_impl(&dword_0, v13, v14, "Parsing host string \"%@\" led to exception %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x7DBCLL);
  }
  _Unwind_Resume(a1);
}

id sub_8754(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    id v2 = DALoggingwithCategory();
    os_log_type_t v3 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_0, v2, v3, "Couldn't remove the account: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setTaskCompletionAssertionEnabled:0];
  return [*(id *)(a1 + 40) performSelector:"_dismissAndUpdateParent" withObject:0 afterDelay:1.0];
}

id sub_8B48(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  os_log_type_t v3 = DALoggingwithCategory();
  uint64_t v4 = v3;
  if (v2)
  {
    os_log_type_t v5 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v3, v5))
    {
      LOWORD(v13) = 0;
      int v6 = "ACAccountStore saved my account, dismissing";
      uint64_t v7 = v4;
      os_log_type_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_0, v7, v8, v6, (uint8_t *)&v13, v9);
    }
  }
  else
  {
    int v10 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v3, (os_log_type_t)_CPLog_to_os_log_type[3]))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v11;
      int v6 = "Couldn't save the account: %@";
      uint64_t v7 = v4;
      os_log_type_t v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }

  return [*(id *)(a1 + 40) _finishSaveAccountDismissWhenDone:1];
}

id *sub_9288(id *result, uint64_t a2)
{
  if (!a2) {
    return (id *)[result[4] _deleteAccount];
  }
  return result;
}

id DAAccountDescriptionFromHostname(void *a1)
{
  id v1 = a1;
  int v2 = [v1 componentsSeparatedByString:@"."];
  if ([v2 count] == (char *)&dword_0 + 1 || objc_msgSend(v2, "count") != (char *)&dword_0 + 2)
  {
    id v4 = v1;
  }
  else
  {
    os_log_type_t v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 capitalizedString];
  }

  return v4;
}

id sub_EC08(void *a1)
{
  id v1 = a1;
  int v2 = +[NSFileManager defaultManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v13 = 0;
        if (([v2 fileExistsAtPath:v9 isDirectory:&v13] & 1) == 0)
        {
          if (!v6) {
            id v6 = [v3 mutableCopy];
          }
          [v6 removeObject:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  if (v6) {
    int v10 = v6;
  }
  else {
    int v10 = v3;
  }
  id v11 = v10;

  return v11;
}

void sub_ED70(uint64_t a1)
{
  int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DIAG_LOG_SAVED_MESSAGE" value:&stru_30C50 table:@"Diagnostic"];
  id v4 = [*(id *)(a1 + 32) lastPathComponent];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = *(void **)(a1 + 40);
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"DIAG_LOG_SAVED_TITLE" value:&stru_30C50 table:@"Diagnostic"];
  [v5 runSimpleAlertWithTitle:v7 message:v8];
}

void sub_11050(id a1, __SecTrust *a2, CertUITrustManager *a3, NSString *a4)
{
  uint64_t v7 = a3;
  id v6 = a4;
  if ([(CertUITrustManager *)v7 actionForSMIMETrust:a2 sender:v6] == 2) {
    [(CertUITrustManager *)v7 addSMIMETrust:a2 sender:v6];
  }
}

void sub_11920(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  [a3 statusCode];
  id v8 = [v6 copy];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = [*(id *)(a1 + 32) autoDV2RedirectSession];
  [v7 invalidateAndCancel];

  [*(id *)(a1 + 32) setAutoDV2RedirectSession:0];
}

id sub_1382C(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

void sub_13D70(uint64_t a1)
{
  ADClientAddValueForScalarKey();
  int v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, v3, "Trying on-prem AutoDiscvoer-V2", v5, 2u);
  }

  *(void *)(*(void *)(a1 + 32) + 209) = 1;
  id v4 = [*(id *)(a1 + 32) account];
  [v4 autodiscoverOnPremOAuthAccountWithConsumer:*(void *)(a1 + 32)];
}

id sub_13E34(uint64_t a1)
{
  ADClientAddValueForScalarKey();
  int v2 = *(void **)(a1 + 32);

  return [v2 _reallyStartAutoDiscoverAccount];
}

id sub_13E78(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

void sub_140BC(uint64_t a1, uint64_t a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14160;
  block[3] = &unk_30950;
  id v7 = a3;
  uint64_t v8 = a2;
  block[4] = *(void *)(a1 + 32);
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_14160(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 302)
  {
    int v2 = DALoggingwithCategory();
    os_log_type_t v3 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, v3, "#EASTrafficSuccessful Re-direct response received. Starting AutoDV2 flow...", buf, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 209);
    if (v5 == 1)
    {
      id v6 = [(id)v4 account];
      [v6 autodiscoverOnPremOAuthAccountWithConsumer:*(void *)(a1 + 32)];
      goto LABEL_15;
    }
    if (!v5)
    {
      id v6 = [(id)v4 account];
      [v6 autodiscoverOAuthAccountWithConsumer:*(void *)(a1 + 32)];
LABEL_15:

      return;
    }
    id v11 = DALoggingwithCategory();
    os_log_type_t v12 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_0, v11, v12, "Invalid state. Not performing AutoDV2.", v15, 2u);
    }
  }
  else
  {
    unsigned int v7 = [*(id *)(a1 + 32) _isNetworkOfflineError:*(void *)(a1 + 40)];
    uint64_t v8 = DALoggingwithCategory();
    os_log_type_t v9 = _CPLog_to_os_log_type[6];
    BOOL v10 = os_log_type_enabled(v8, v9);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)long long v14 = 0;
        _os_log_impl(&dword_0, v8, v9, "Received an Internet Offline Error duing AutoDV2. Presenting Internet Offline Alert", v14, 2u);
      }

      +[DAEASOAuthWebViewController presentInternetOfflineError];
      [*(id *)(a1 + 32) stopValidationWithPrompt:0 showButtons:1];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)char v13 = 0;
        _os_log_impl(&dword_0, v8, v9, "#EASTrafficRe-direct Failed. Falling-back to AutoDV1 flow...", v13, 2u);
      }

      [*(id *)(a1 + 32) _fallBackToAutoDiscoverV1];
    }
  }
}

void sub_15510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1553C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15628;
  block[3] = &unk_309A0;
  objc_copyWeak(v15, (id *)(a1 + 40));
  unsigned int v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  v15[1] = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v15);
}

void sub_15628(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [*(id *)(a1 + 32) accessToken];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [*(id *)(a1 + 32) refreshToken],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [*(id *)(a1 + 32) oauthURI];
    if (!v6
      || (unsigned int v7 = (void *)v6,
          [*(id *)(a1 + 32) tokenRequestURI],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      id v9 = +[NSAssertionHandler currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"ASSettingsAccountsUIController.m", 704, @"We have used these objects to fetch and verify the tokens, neither of these should be empty" object file lineNumber description];
    }
    id v10 = [*(id *)(a1 + 32) oauthURI];
    id v11 = [WeakRetained account];
    id v12 = [v11 backingAccountInfo];
    [v12 setObject:v10 forKeyedSubscript:kESExchangeOAuthURI];

    uint64_t v13 = [*(id *)(a1 + 32) tokenRequestURI];
    id v14 = [WeakRetained account];
    long long v15 = [v14 backingAccountInfo];
    [v15 setObject:v13 forKeyedSubscript:kESExchangeTokenRequestURI];

    long long v16 = [*(id *)(a1 + 32) jwksURI];

    if (v16)
    {
      long long v17 = [*(id *)(a1 + 32) jwksURI];
      v18 = [WeakRetained account];
      v19 = [v18 backingAccountInfo];
      [v19 setObject:v17 forKeyedSubscript:kESExchangeOAuthJWKSURI];
    }
    v20 = [*(id *)(a1 + 32) issuer];

    if (v20)
    {
      v21 = [*(id *)(a1 + 32) issuer];
      v22 = [WeakRetained account];
      v23 = [v22 backingAccountInfo];
      [v23 setObject:v21 forKeyedSubscript:kESExchangeOAuthTokenIssuer];
    }
    v24 = [WeakRetained account];
    v25 = [v24 backingAccountInfo];
    [v25 setObject:@"2" forKeyedSubscript:kESExchangeOAuthVersion];

    v26 = [*(id *)(a1 + 32) jwksData];

    if (v26)
    {
      v27 = [*(id *)(a1 + 32) jwksData];
      v28 = [WeakRetained account];
      v29 = [v28 backingAccountInfo];
      [v29 setObject:v27 forKeyedSubscript:kESExchangeOAuthJWKSData];
    }
    v30 = +[NSDate date];
    [v30 timeIntervalSince1970];
    v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v32 = [WeakRetained account];
    v33 = [v32 backingAccountInfo];
    [v33 setObject:v31 forKeyedSubscript:kESExchangeOAuthJWKSDataCacheDate];

    if (*(void *)(*(void *)(a1 + 40) + 209) == 1)
    {
      v34 = [WeakRetained account];
      v35 = [v34 backingAccountInfo];
      [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:kESExchangeOAuthOnPremKey];
    }
    v36 = [WeakRetained account];
    v37 = [v36 backingAccountInfo];
    [v37 setObject:&stru_30C50 forKeyedSubscript:kESExchangePasswordPromptDate];

    v38 = [WeakRetained account];
    v39 = [v38 backingAccountInfo];
    [v39 setObject:&stru_30C50 forKeyedSubscript:kESExchangePendingClaimsChallenge];

    v40 = [*(id *)(a1 + 32) username];
    v41 = v40;
    if (!v40)
    {
      v39 = [WeakRetained account];
      v41 = [v39 emailAddress];
    }
    v42 = [WeakRetained account];
    [v42 setUsername:v41];

    if (!v40)
    {
    }
    v43 = [WeakRetained account];
    v44 = [v43 backingAccountInfo];
    v45 = [WeakRetained account];
    v46 = [v45 username];
    v47 = [*(id *)(a1 + 32) accessToken];
    v48 = [*(id *)(a1 + 32) refreshToken];
    [WeakRetained _validateUniquenessAndAddAccount:v44 username:v46 token:v47 refreshToken:v48 completion:0];
  }
  else
  {
    v49 = DALoggingwithCategory();
    os_log_type_t v50 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = *(void *)(a1 + 48);
      int v54 = 138412290;
      uint64_t v55 = v51;
      _os_log_impl(&dword_0, v49, v50, "Error retrieving an OAuth identity. Error %@", (uint8_t *)&v54, 0xCu);
    }

    v52 = +[NSError errorWithDomain:DAAccountValidationDomain code:100 userInfo:0];
    v53 = [WeakRetained account];
    [WeakRetained account:v53 isValid:0 validationError:v52];

    [WeakRetained _fallBackToAutoDiscoverV1];
  }
}

void sub_16174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_161D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v2, v3))
  {
    int v5 = 134217984;
    id v6 = [WeakRetained backgroundTaskID];
    _os_log_impl(&dword_0, v2, v3, "Background task %lu expired. End task", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = +[UIApplication sharedApplication];
  objc_msgSend(v4, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskID"));

  [WeakRetained setBackgroundTaskID:UIBackgroundTaskInvalid];
}

void sub_162E4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = DALoggingwithCategory();
  os_log_type_t v6 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 134217984;
    id v9 = [WeakRetained backgroundTaskID];
    _os_log_impl(&dword_0, v5, v6, "Received redirect URL. Ending background task %lu", (uint8_t *)&v8, 0xCu);
  }

  unsigned int v7 = +[UIApplication sharedApplication];
  objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskID"));

  [WeakRetained setBackgroundTaskID:UIBackgroundTaskInvalid];
  [WeakRetained handleRedirectURL:v3];
}

void sub_16410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = *(void **)(a1 + 32);
  if (v6)
  {
    int v8 = [v7 webAuthenticationSession];
    [v8 cancel];

    if ([*(id *)(a1 + 32) backgroundTaskID] != (id)UIBackgroundTaskInvalid)
    {
      id v9 = DALoggingwithCategory();
      os_log_type_t v10 = _CPLog_to_os_log_type[7];
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = [*(id *)(a1 + 32) backgroundTaskID];
        int v19 = 134217984;
        id v20 = v11;
        _os_log_impl(&dword_0, v9, v10, "Sign in canceled. Ending background task %lu", (uint8_t *)&v19, 0xCu);
      }

      id v12 = +[UIApplication sharedApplication];
      objc_msgSend(v12, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundTaskID"));

      [*(id *)(a1 + 32) setBackgroundTaskID:UIBackgroundTaskInvalid];
    }
    [*(id *)(a1 + 32) _fallBackToAutoDiscoverV1];
    uint64_t v13 = +[PSOAuthAccountRedirectURLController sharedInstance];
    id v14 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
    [v13 unRegisterOAuthClientForRedirectURL:v14];

    if ([v6 code] == (char *)&dword_0 + 2 || objc_msgSend(v6, "code") == (char *)&dword_0 + 3)
    {
      long long v15 = DALoggingwithCategory();
      os_log_type_t v16 = _CPLog_to_os_log_type[3];
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = [v6 code];
        int v19 = 134217984;
        id v20 = v17;
        _os_log_impl(&dword_0, v15, v16, "ExchangeSync Login UI WindowContext is not valid! ASWebAuthenticationSessionErrorCode:  %lu", (uint8_t *)&v19, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setWebAuthenticationSession:0];
  }
  else
  {
    v18 = [v7 redirectHandlerBlock];
    ((void (**)(void, id))v18)[2](v18, v5);
  }
}

void sub_167D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = +[ASSettingsAccountsUIController usernameFromAccessToken:*(void *)(a1 + 32)];
  if (([*(id *)(a1 + 40) _storeHasDuplicateForUsername:*(void *)(a1 + 48)] & 1) != 0
    || v3 && [*(id *)(a1 + 40) _storeHasDuplicateForUsername:v3])
  {
    [*(id *)(a1 + 40) showIdenticalAccountFailureView];
    [*(id *)(a1 + 40) stopValidationWithPrompt:0 showButtons:1];
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4) {
      (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, 0, 0, 0);
    }
  }
  else
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v5, v6))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_0, v5, v6, "Successfuly received an OAuth identity. Creating and saving an account with the credential info", (uint8_t *)&v28, 2u);
    }

    [*(id *)(a1 + 56) setUsername:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) setObject:*(void *)(a1 + 48) forKeyedSubscript:kDAAccountEmailAddress];
    unsigned int v7 = [WeakRetained _defaultAccountDescription];
    uint64_t v8 = [*(id *)(a1 + 56) accountDescription];
    id v9 = (void *)v8;
    if (v8) {
      os_log_type_t v10 = (void *)v8;
    }
    else {
      os_log_type_t v10 = v7;
    }
    id v11 = v10;

    if ([v11 isEqualToString:v7])
    {
      id v12 = [WeakRetained accountStore];
      unsigned int v13 = [v12 hasAccountWithDescription:v7];

      if (v13)
      {
        id v14 = *(id *)(a1 + 48);

        id v11 = v14;
      }
    }
    [*(id *)(a1 + 56) setAccountDescription:v11];
    long long v15 = [*(id *)(a1 + 56) username];
    os_log_type_t v16 = [WeakRetained account];
    [v16 setObject:v15 forKeyedSubscript:ACAccountPropertyIdentityEmailAddress];

    id v17 = objc_alloc((Class)ACAccountCredential);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 64);
    id v20 = +[NSDate distantFuture];
    id v21 = [v17 initWithOAuth2Token:v18 refreshToken:v19 expiryDate:v20];

    v22 = [WeakRetained account];
    v23 = [v22 backingAccountInfo];
    [v23 setCredential:v21];

    v24 = [*(id *)(a1 + 40) account];
    [v24 discoverInitialPropertiesWithConsumer:*(void *)(a1 + 40)];

    v25 = DALoggingwithCategory();
    if (os_log_type_enabled(v25, v6))
    {
      v26 = [*(id *)(a1 + 56) username];
      v27 = [*(id *)(a1 + 56) accountDescription];
      int v28 = 138412546;
      v29 = v26;
      __int16 v30 = 2112;
      v31 = v27;
      _os_log_impl(&dword_0, v25, v6, "OAuth Account setup successfuly with username/emailaddress : %@ and description : %@", (uint8_t *)&v28, 0x16u);
    }
  }
}

void sub_17260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1728C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    os_log_type_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v6, v7))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_0, v6, v7, "Can save account failed with error : %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = [v5 domain];
    if ([v8 isEqualToString:ACErrorDomain])
    {
      id v9 = (char *)[v5 code];

      if (v9 == (unsigned char *)&dword_4 + 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1876C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_18788(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 281) presentViewController:a2 animated:1 completion:0];
}

void sub_187A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_type_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    id v9 = DALoggingwithCategory();
    os_log_type_t v10 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v9, v10))
    {
      LOWORD(v45) = 0;
      _os_log_impl(&dword_0, v9, v10, "Successfuly received an OAuth identity. Creating and saving an account with the credential info", (uint8_t *)&v45, 2u);
    }

    id v11 = [v5 oauthURI];
    uint64_t v12 = [WeakRetained account];
    unsigned int v13 = [v12 backingAccountInfo];
    [v13 setObject:v11 forKeyedSubscript:kESExchangeOAuthURI];

    uint64_t v14 = [v5 tokenRequestURI];
    uint64_t v15 = [WeakRetained account];
    uint64_t v16 = [v15 backingAccountInfo];
    [v16 setObject:v14 forKeyedSubscript:kESExchangeTokenRequestURI];

    id v17 = [v5 jwksURI];
    uint64_t v18 = [WeakRetained account];
    uint64_t v19 = [v18 backingAccountInfo];
    [v19 setObject:v17 forKeyedSubscript:kESExchangeOAuthJWKSURI];

    id v20 = [v5 issuer];
    id v21 = [WeakRetained account];
    v22 = [v21 backingAccountInfo];
    [v22 setObject:v20 forKeyedSubscript:kESExchangeOAuthTokenIssuer];

    v23 = [WeakRetained account];
    v24 = [v23 backingAccountInfo];
    [v24 setObject:@"2" forKeyedSubscript:kESExchangeOAuthVersion];

    v25 = [v5 jwksData];
    v26 = [WeakRetained account];
    v27 = [v26 backingAccountInfo];
    [v27 setObject:v25 forKeyedSubscript:kESExchangeOAuthJWKSData];

    int v28 = +[NSDate date];
    [v28 timeIntervalSince1970];
    v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    __int16 v30 = [WeakRetained account];
    v31 = [v30 backingAccountInfo];
    [v31 setObject:v29 forKeyedSubscript:kESExchangeOAuthJWKSDataCacheDate];

    v32 = [WeakRetained account];
    v33 = [v32 backingAccountInfo];
    [v33 setObject:&stru_30C50 forKeyedSubscript:kESExchangePasswordPromptDate];

    v34 = [WeakRetained account];
    v35 = [v34 backingAccountInfo];
    [v35 setObject:&stru_30C50 forKeyedSubscript:kESExchangePendingClaimsChallenge];

    v36 = [WeakRetained account];
    v37 = [v36 backingAccountInfo];
    v38 = [v5 username];
    v39 = [v5 accessToken];
    v40 = [v5 refreshToken];
    v41 = [WeakRetained completion];
    [WeakRetained _validateUniquenessAndAddAccount:v37 username:v38 token:v39 refreshToken:v40 completion:v41];

LABEL_9:
    goto LABEL_10;
  }
  if (v6)
  {
    v42 = DALoggingwithCategory();
    os_log_type_t v43 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v42, v43))
    {
      int v45 = 138412290;
      id v46 = v6;
      _os_log_impl(&dword_0, v42, v43, "Error retrieving an OAuth identity. Error %@", (uint8_t *)&v45, 0xCu);
    }

    v36 = +[NSError errorWithDomain:DAAccountValidationDomain code:100 userInfo:0];
    v44 = [WeakRetained account];
    [WeakRetained account:v44 isValid:0 validationError:v36];

    v37 = [WeakRetained completion];
    v38 = objc_loadWeakRetained(v7);
    v39 = [v38 account];
    v40 = [v39 backingAccountInfo];
    ((void (**)(void, void *, void, void))v37)[2](v37, v40, 0, 0);
    goto LABEL_9;
  }
LABEL_10:
}

double sub_1956C(void *a1, double a2)
{
  id v3 = a1;
  double v4 = a2 + -20.0;
  objc_msgSend(v3, "sizeThatFits:", a2 + -20.0, INFINITY);
  double v7 = v6;
  double v8 = a2 / 3.0;
  if (v4 >= v8)
  {
    double v9 = v5;
    double v10 = v4 + -20.0;
    objc_msgSend(v3, "sizeThatFits:", v10, INFINITY);
    if (v12 <= v9)
    {
      do
      {
        double v7 = v11;
        if (v10 < v8) {
          break;
        }
        double v10 = v10 + -20.0;
        objc_msgSend(v3, "sizeThatFits:", v10, INFINITY);
      }
      while (v13 <= v9);
    }
  }

  return v7;
}

void sub_1AC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AC64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = DALoggingwithCategory();
  os_log_type_t v8 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412546;
    id v88 = v5;
    __int16 v89 = 2112;
    id v90 = v6;
    _os_log_impl(&dword_0, v7, v8, "Finished OAuth Token refresh with OAuthIdenity %@ and Error %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    double v10 = DALoggingwithCategory();
    os_log_type_t v11 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, v11, "Not saving OAuthIdentity since it is either nil, or an error occurred. Showing validation failure message.", buf, 2u);
    }

    double v12 = [WeakRetained account];
    double v13 = [v12 accountType];
    uint64_t v14 = [v13 identifier];
    unsigned int v15 = [v14 isEqualToString:ACAccountTypeIdentifierHotmail];

    uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = v16;
    if (v15) {
      CFStringRef v18 = @"HOTMAIL_ACCOUNT";
    }
    else {
      CFStringRef v18 = @"EXCHANGE_ACCOUNT";
    }
    uint64_t v19 = [v16 localizedStringForKey:v18 value:&stru_30C50 table:@"ASAccountSetup"];

    id v20 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v21 = (const __CFString *)[v20 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_30C50 table:@"ASAccountSetup"];
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    CFUserNotificationDisplayNotice(0.0, 3uLL, 0, 0, 0, v19, v21, (CFStringRef)[v22 localizedStringForKey:@"OK" value:&stru_30C50 table:@"ASAccountSetup"]);
  }
  v23 = [v5 accessToken];
  v24 = +[ASSettingsAccountsUIController usernameFromAccessToken:v23];

  uint64_t v25 = [v5 username];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [WeakRetained account];
    int v28 = [v27 username];
    v29 = [v5 username];
    id v30 = [v28 compare:v29 options:1];

    if (v30)
    {
      v31 = DALoggingwithCategory();
      os_log_type_t v32 = _CPLog_to_os_log_type[3];
      if (os_log_type_enabled(v31, v32))
      {
        *(_WORD *)buf = 0;
        v33 = "DAEASOAuthWebViewController username mismatch, did not save account";
LABEL_19:
        _os_log_impl(&dword_0, v31, v32, v33, buf, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  if (v24)
  {
    v34 = *(void **)(a1 + 32);
    v35 = [WeakRetained account];
    v36 = [v35 identifier];
    v37 = [WeakRetained account];
    v38 = [v37 accountType];
    LODWORD(v34) = [v34 _storeHasDuplicateForUsername:v24 withoutIdentifier:v36 withAccountType:v38];

    if (v34)
    {
      v31 = DALoggingwithCategory();
      os_log_type_t v32 = _CPLog_to_os_log_type[3];
      if (os_log_type_enabled(v31, v32))
      {
        *(_WORD *)buf = 0;
        v33 = "DAEASOAuthWebViewController found a duplicate account with username, did not save account";
        goto LABEL_19;
      }
LABEL_20:

      +[DAEASOAuthWebViewController presentUsernameMismatchAlert];
      v39 = &off_26000;
      goto LABEL_37;
    }
  }
  v39 = &off_26000;
  if (v5 && !v6)
  {
    uint64_t v40 = [v5 oauthURI];
    if (!v40
      || (v41 = (void *)v40,
          [v5 tokenRequestURI],
          v42 = objc_claimAutoreleasedReturnValue(),
          v42,
          v41,
          !v42))
    {
      os_log_type_t v43 = +[NSAssertionHandler currentHandler];
      [v43 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"ASSettingsDataclassConfigurationViewController.m", 319, @"We have used these objects to fetch and verify the tokens, neither of these should be empty" object file lineNumber description];
    }
    v44 = [WeakRetained account];
    id v45 = [v44 migrationStatus];

    if ((unint64_t)v45 <= 1)
    {
      id v46 = [WeakRetained account];
      [v46 setObject:&__kCFBooleanTrue forKeyedSubscript:kESExchangeOAuthSupportedKey];

      v47 = [WeakRetained account];
      v48 = [v47 username];
      v49 = [WeakRetained account];
      [v49 setObject:v48 forKeyedSubscript:ACAccountPropertyIdentityEmailAddress];

      os_log_type_t v50 = [WeakRetained account];
      [v50 setMigrationStatus:2];
    }
    uint64_t v51 = [v5 oauthURI];
    v52 = [WeakRetained account];
    [v52 setObject:v51 forKeyedSubscript:kESExchangeOAuthURI];

    v53 = [v5 tokenRequestURI];
    int v54 = [WeakRetained account];
    [v54 setObject:v53 forKeyedSubscript:kESExchangeTokenRequestURI];

    uint64_t v55 = [v5 jwksURI];

    if (v55)
    {
      v56 = [v5 jwksURI];
      v57 = [WeakRetained account];
      [v57 setObject:v56 forKeyedSubscript:kESExchangeOAuthJWKSURI];
    }
    v58 = [v5 issuer];

    if (v58)
    {
      v59 = [v5 issuer];
      v60 = [WeakRetained account];
      [v60 setObject:v59 forKeyedSubscript:kESExchangeOAuthTokenIssuer];
    }
    v61 = [WeakRetained account];
    [v61 setObject:@"2" forKeyedSubscript:kESExchangeOAuthVersion];

    v62 = [v5 jwksData];

    if (v62)
    {
      v63 = [v5 jwksData];
      v64 = [WeakRetained account];
      [v64 setObject:v63 forKeyedSubscript:kESExchangeOAuthJWKSData];
    }
    v65 = +[NSDate date];
    [v65 timeIntervalSince1970];
    v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v67 = [WeakRetained account];
    [v67 setObject:v66 forKeyedSubscript:kESExchangeOAuthJWKSDataCacheDate];

    v68 = [WeakRetained account];
    [v68 setObject:&stru_30C50 forKeyedSubscript:kESExchangePasswordPromptDate];

    v69 = [WeakRetained account];
    [v69 setObject:&stru_30C50 forKeyedSubscript:kESExchangePendingClaimsChallenge];

    id v70 = objc_alloc((Class)ACAccountCredential);
    v71 = [v5 accessToken];
    v72 = [v5 refreshToken];
    id v73 = [v70 initWithOAuth2Token:v71 refreshToken:v72 expiryDate:0];

    v74 = [WeakRetained account];
    [v74 setCredential:v73];

    v75 = DALoggingwithCategory();
    os_log_type_t v76 = _CPLog_to_os_log_type[7];
    if (os_log_type_enabled(v75, v76))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v75, v76, "DAEASOAuthWebViewController will save account with new credential", buf, 2u);
    }

    dispatch_semaphore_t v77 = dispatch_semaphore_create(0);
    v78 = [WeakRetained accountStore];
    v79 = [WeakRetained account];
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_1B628;
    v84[3] = &unk_30B10;
    id v85 = 0;
    dispatch_semaphore_t v86 = v77;
    v80 = v77;
    [v78 saveAccount:v79 withCompletionHandler:v84];

    dispatch_semaphore_wait(v80, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_37:
  [WeakRetained reloadAccount];
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v39 + 113);
  block[2] = sub_1B768;
  block[3] = &unk_307B8;
  id v83 = WeakRetained;
  id v81 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

intptr_t sub_1B628(uint64_t a1, int a2)
{
  double v4 = DALoggingwithCategory();
  os_log_type_t v5 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 67109378;
    LODWORD(v12[0]) = a2;
    WORD2(v12[0]) = 2112;
    *(void *)((char *)v12 + 6) = v6;
    _os_log_impl(&dword_0, v4, v5, "DAEASOAuthWebViewController did save account with success %d error %@", (uint8_t *)&v11, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    double v7 = DALoggingwithCategory();
    os_log_type_t v8 = _CPLog_to_os_log_type[4];
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412290;
      v12[0] = v9;
      _os_log_impl(&dword_0, v7, v8, "DAEASOAuthWebViewController save account FAILED with error %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_1B768(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_1C41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 192));
  _Unwind_Resume(a1);
}

void sub_1C4B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  if (v6)
  {
    os_log_type_t v8 = [v7 webAuthenticationSession];
    [v8 cancel];

    if ([*(id *)(a1 + 32) backgroundTaskID] != (id)UIBackgroundTaskInvalid)
    {
      uint64_t v9 = DALoggingwithCategory();
      os_log_type_t v10 = _CPLog_to_os_log_type[7];
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = [*(id *)(a1 + 32) backgroundTaskID];
        int v19 = 134217984;
        id v20 = v11;
        _os_log_impl(&dword_0, v9, v10, "Sign in canceled. Ending background task %lu", (uint8_t *)&v19, 0xCu);
      }

      double v12 = +[UIApplication sharedApplication];
      objc_msgSend(v12, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundTaskID"));

      [*(id *)(a1 + 32) setBackgroundTaskID:UIBackgroundTaskInvalid];
    }
    double v13 = +[PSOAuthAccountRedirectURLController sharedInstance];
    uint64_t v14 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
    [v13 unRegisterOAuthClientForRedirectURL:v14];

    if ([v6 code] == (char *)&dword_0 + 2 || objc_msgSend(v6, "code") == (char *)&dword_0 + 3)
    {
      unsigned int v15 = DALoggingwithCategory();
      os_log_type_t v16 = _CPLog_to_os_log_type[3];
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = [v6 code];
        int v19 = 134217984;
        id v20 = v17;
        _os_log_impl(&dword_0, v15, v16, "ExchangeSync Login UI WindowContext is not valid! ASWebAuthenticationSessionErrorCode:  %lu", (uint8_t *)&v19, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setWebAuthenticationSession:0];
  }
  else
  {
    CFStringRef v18 = [v7 redirectHandlerBlock];
    ((void (**)(void, id))v18)[2](v18, v5);
  }
}

void sub_1C700(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v2, v3))
  {
    int v5 = 134217984;
    id v6 = [WeakRetained backgroundTaskID];
    _os_log_impl(&dword_0, v2, v3, "Background task %lu expired. End task", (uint8_t *)&v5, 0xCu);
  }

  double v4 = +[UIApplication sharedApplication];
  objc_msgSend(v4, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskID"));

  [WeakRetained setBackgroundTaskID:UIBackgroundTaskInvalid];
}

void sub_1C810(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = DALoggingwithCategory();
  os_log_type_t v6 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 134217984;
    id v9 = [WeakRetained backgroundTaskID];
    _os_log_impl(&dword_0, v5, v6, "Exchange OAuth Setup: Received a callBack URL from SafariViewController. Ending background task %lu", (uint8_t *)&v8, 0xCu);
  }

  double v7 = +[UIApplication sharedApplication];
  objc_msgSend(v7, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskID"));

  [WeakRetained setBackgroundTaskID:UIBackgroundTaskInvalid];
  [WeakRetained handleRedirectURL:v3];
}

void sub_1C93C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentViewController:v3 animated:1 completion:0];
}

void sub_1C9A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = DALoggingwithCategory();
  os_log_type_t v8 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = [v5 username];
    int v11 = 138412546;
    double v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, v7, v8, "Wohoo Saved OAuth Updated Password Identity %@, error %@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAccount];
  [WeakRetained reloadSpecifiers];
}

void sub_1CC54(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1CD00;
  v7[3] = &unk_30BA0;
  id v8 = a3;
  uint64_t v9 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  v7[4] = v5;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_1CD00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2 == 302)
  {
    double v4 = [v3 daAccount];
    uint64_t v5 = [v4 backingAccountInfo];
    [v5 setAuthenticated:1];

    LODWORD(v4) = *(unsigned __int8 *)(a1 + 56);
    id v6 = [*(id *)(a1 + 32) daAccount];
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    if (v4) {
      [v6 autodiscoverOnPremOAuthAccountWithConsumer:v7];
    }
    else {
      [v6 autodiscoverOAuthAccountWithConsumer:v7];
    }
  }
  else
  {
    unsigned int v8 = [v3 _isNetworkOfflineError:*(void *)(a1 + 40)];
    uint64_t v9 = DALoggingwithCategory();
    os_log_type_t v10 = _CPLog_to_os_log_type[6];
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, v10, "Received an Internet Offline Error duing AutoDV2. Presenting Internet Offline Alert", buf, 2u);
      }

      +[DAEASOAuthWebViewController presentInternetOfflineError];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_0, v9, v10, "#EASTrafficRe-direct Failed. Unable to complete OAuth sign in.", v13, 2u);
      }
    }
    [*(id *)(a1 + 32) _enableReAuthenticationButton];
    [*(id *)(a1 + 32) stopValidationWithPrompt:0 showButtons:1];
  }
}

id sub_1DC5C(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  double v4 = +[NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setIsOofSupported:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v5 checkAndFetchOutOfOfficeState];
  }
  else
  {
    return [v5 performSelectorOnMainThread:"removeOutOfOfficeSpecifier" withObject:0 waitUntilDone:0];
  }
}

void sub_1E5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t DALoggingwithCategory()
{
  return _DALoggingwithCategory();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PSPIDForProcessNamed()
{
  return _PSPIDForProcessNamed();
}

uint64_t PSTextViewInsets()
{
  return _PSTextViewInsets();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t dataaccess_get_global_queue()
{
  return _dataaccess_get_global_queue();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int truncate(const char *a1, off_t a2)
{
  return _truncate(a1, a2);
}

id objc_msgSend_ASOutOfOfficeDirtyStates(void *a1, const char *a2, ...)
{
  return [a1 ASOutOfOfficeDirtyStates];
}

id objc_msgSend_ASOutOfOfficeEnabledState(void *a1, const char *a2, ...)
{
  return [a1 ASOutOfOfficeEnabledState];
}

id objc_msgSend_DASettingsInfo(void *a1, const char *a2, ...)
{
  return [a1 DASettingsInfo];
}

id objc_msgSend__accountIsManaged(void *a1, const char *a2, ...)
{
  return [a1 _accountIsManaged];
}

id objc_msgSend__beginAccountValidation(void *a1, const char *a2, ...)
{
  return [a1 _beginAccountValidation];
}

id objc_msgSend__defaultAccountDescription(void *a1, const char *a2, ...)
{
  return [a1 _defaultAccountDescription];
}

id objc_msgSend__disableButtons(void *a1, const char *a2, ...)
{
  return [a1 _disableButtons];
}

id objc_msgSend__disableReAuthenticationButton(void *a1, const char *a2, ...)
{
  return [a1 _disableReAuthenticationButton];
}

id objc_msgSend__enableButtons(void *a1, const char *a2, ...)
{
  return [a1 _enableButtons];
}

id objc_msgSend__enableReAuthenticationButton(void *a1, const char *a2, ...)
{
  return [a1 _enableReAuthenticationButton];
}

id objc_msgSend__fallBackToAutoDiscoverV1(void *a1, const char *a2, ...)
{
  return [a1 _fallBackToAutoDiscoverV1];
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return [a1 _font];
}

id objc_msgSend__generateExchangeIdLabel(void *a1, const char *a2, ...)
{
  return [a1 _generateExchangeIdLabel];
}

id objc_msgSend__generateExchangeIdText(void *a1, const char *a2, ...)
{
  return [a1 _generateExchangeIdText];
}

id objc_msgSend__listenForAccountsChangedNotifications(void *a1, const char *a2, ...)
{
  return [a1 _listenForAccountsChangedNotifications];
}

id objc_msgSend__navTitle(void *a1, const char *a2, ...)
{
  return [a1 _navTitle];
}

id objc_msgSend__presentNotesController(void *a1, const char *a2, ...)
{
  return [a1 _presentNotesController];
}

id objc_msgSend__reAuthenticationButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 _reAuthenticationButtonTapped];
}

id objc_msgSend__reAuthenticationSectionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _reAuthenticationSectionSpecifiers];
}

id objc_msgSend__reallyStartAutoDiscoverAccount(void *a1, const char *a2, ...)
{
  return [a1 _reallyStartAutoDiscoverAccount];
}

id objc_msgSend__setViewsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _setViewsEnabled];
}

id objc_msgSend__smimeEncryptSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _smimeEncryptSpecifier];
}

id objc_msgSend__smimeSigningSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _smimeSigningSpecifier];
}

id objc_msgSend__specifiersForCompletedAutodiscovery(void *a1, const char *a2, ...)
{
  return [a1 _specifiersForCompletedAutodiscovery];
}

id objc_msgSend__specifiersForOptionalServerAutodiscovery(void *a1, const char *a2, ...)
{
  return [a1 _specifiersForOptionalServerAutodiscovery];
}

id objc_msgSend__transitionToCompletedAutodiscovery(void *a1, const char *a2, ...)
{
  return [a1 _transitionToCompletedAutodiscovery];
}

id objc_msgSend__transitionToOptionalServerAutodiscovery(void *a1, const char *a2, ...)
{
  return [a1 _transitionToOptionalServerAutodiscovery];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessToken(void *a1, const char *a2, ...)
{
  return [a1 accessToken];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountArchivesMailByDefault(void *a1, const char *a2, ...)
{
  return [a1 accountArchivesMailByDefault];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountDescriptionForFirstTimeSetup(void *a1, const char *a2, ...)
{
  return [a1 accountDescriptionForFirstTimeSetup];
}

id objc_msgSend_accountFromSpecifier(void *a1, const char *a2, ...)
{
  return [a1 accountFromSpecifier];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountNeedsAdd(void *a1, const char *a2, ...)
{
  return [a1 accountNeedsAdd];
}

id objc_msgSend_accountOperationsHelper(void *a1, const char *a2, ...)
{
  return [a1 accountOperationsHelper];
}

id objc_msgSend_accountSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 accountSpecifiers];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountTypeIdentifier];
}

id objc_msgSend_activeSyncDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activeSyncDeviceIdentifier];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attemptedValidation(void *a1, const char *a2, ...)
{
  return [a1 attemptedValidation];
}

id objc_msgSend_autoDV2RedirectSession(void *a1, const char *a2, ...)
{
  return [a1 autoDV2RedirectSession];
}

id objc_msgSend_autoExternalReplyMessage(void *a1, const char *a2, ...)
{
  return [a1 autoExternalReplyMessage];
}

id objc_msgSend_autoReplyMessage(void *a1, const char *a2, ...)
{
  return [a1 autoReplyMessage];
}

id objc_msgSend_autoReplyStartDate(void *a1, const char *a2, ...)
{
  return [a1 autoReplyStartDate];
}

id objc_msgSend_autoReplyTextCellSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 autoReplyTextCellSpecifiers];
}

id objc_msgSend_autodiscoverAccount(void *a1, const char *a2, ...)
{
  return [a1 autodiscoverAccount];
}

id objc_msgSend_backgroundTaskID(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskID];
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 backingAccountInfo];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_calendarDate(void *a1, const char *a2, ...)
{
  return [a1 calendarDate];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_cellFocusColor(void *a1, const char *a2, ...)
{
  return [a1 cellFocusColor];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return [a1 challenge];
}

id objc_msgSend_checkAndFetchOutOfOfficeState(void *a1, const char *a2, ...)
{
  return [a1 checkAndFetchOutOfOfficeState];
}

id objc_msgSend_cleanupAccountFiles(void *a1, const char *a2, ...)
{
  return [a1 cleanupAccountFiles];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeVerifier(void *a1, const char *a2, ...)
{
  return [a1 codeVerifier];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_confirmedUnvalidatedAccount(void *a1, const char *a2, ...)
{
  return [a1 confirmedUnvalidatedAccount];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentEndTimeSpecifier(void *a1, const char *a2, ...)
{
  return [a1 currentEndTimeSpecifier];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 currentlyEditingCell];
}

id objc_msgSend_daAccount(void *a1, const char *a2, ...)
{
  return [a1 daAccount];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_datePicker(void *a1, const char *a2, ...)
{
  return [a1 datePicker];
}

id objc_msgSend_datePickerShowing(void *a1, const char *a2, ...)
{
  return [a1 datePickerShowing];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_deallocating(void *a1, const char *a2, ...)
{
  return [a1 deallocating];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteButtonSpecifier(void *a1, const char *a2, ...)
{
  return [a1 deleteButtonSpecifier];
}

id objc_msgSend_diagnosticSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 diagnosticSpecifiers];
}

id objc_msgSend_diagnosticsVisible(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsVisible];
}

id objc_msgSend_didSetFullHostURL(void *a1, const char *a2, ...)
{
  return [a1 didSetFullHostURL];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissKeyboard(void *a1, const char *a2, ...)
{
  return [a1 dismissKeyboard];
}

id objc_msgSend_dismissesAfterInitialSetup(void *a1, const char *a2, ...)
{
  return [a1 dismissesAfterInitialSetup];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainOnly(void *a1, const char *a2, ...)
{
  return [a1 domainOnly];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_dumpRuntimeStateSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 dumpRuntimeStateSpecifiers];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enableSaveButton(void *a1, const char *a2, ...)
{
  return [a1 enableSaveButton];
}

id objc_msgSend_encryptionIdentityPersistentReference(void *a1, const char *a2, ...)
{
  return [a1 encryptionIdentityPersistentReference];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_exchangeIdView(void *a1, const char *a2, ...)
{
  return [a1 exchangeIdView];
}

id objc_msgSend_externalAutoReplyTextboxSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 externalAutoReplyTextboxSpecifiers];
}

id objc_msgSend_externalMessage(void *a1, const char *a2, ...)
{
  return [a1 externalMessage];
}

id objc_msgSend_externalMessageGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 externalMessageGroupSpecifiers];
}

id objc_msgSend_externalMessageRadioSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 externalMessageRadioSpecifiers];
}

id objc_msgSend_externalMessageSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 externalMessageSpecifiers];
}

id objc_msgSend_externalState(void *a1, const char *a2, ...)
{
  return [a1 externalState];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_folderIdsThatExternalClientsCareAbout(void *a1, const char *a2, ...)
{
  return [a1 folderIdsThatExternalClientsCareAbout];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return [a1 friendlyName];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return [a1 generalPasteboard];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_haveEnoughValues(void *a1, const char *a2, ...)
{
  return [a1 haveEnoughValues];
}

id objc_msgSend_haveRegisteredForAccountsChanged(void *a1, const char *a2, ...)
{
  return [a1 haveRegisteredForAccountsChanged];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_idTextView(void *a1, const char *a2, ...)
{
  return [a1 idTextView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityPersist(void *a1, const char *a2, ...)
{
  return [a1 identityPersist];
}

id objc_msgSend_indexOfCurrentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 indexOfCurrentlyEditingCell];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isAccountModificationDisabled(void *a1, const char *a2, ...)
{
  return [a1 isAccountModificationDisabled];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isFetchingOutOfOfficeState(void *a1, const char *a2, ...)
{
  return [a1 isFetchingOutOfOfficeState];
}

id objc_msgSend_isFirstTimeSetup(void *a1, const char *a2, ...)
{
  return [a1 isFirstTimeSetup];
}

id objc_msgSend_isHotmailAccount(void *a1, const char *a2, ...)
{
  return [a1 isHotmailAccount];
}

id objc_msgSend_isOofSupported(void *a1, const char *a2, ...)
{
  return [a1 isOofSupported];
}

id objc_msgSend_isRunningFromMobileMailApp(void *a1, const char *a2, ...)
{
  return [a1 isRunningFromMobileMailApp];
}

id objc_msgSend_isSettingUpNewAccount(void *a1, const char *a2, ...)
{
  return [a1 isSettingUpNewAccount];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isSuspendedEventsOnly(void *a1, const char *a2, ...)
{
  return [a1 isSuspendedEventsOnly];
}

id objc_msgSend_issuer(void *a1, const char *a2, ...)
{
  return [a1 issuer];
}

id objc_msgSend_jwksData(void *a1, const char *a2, ...)
{
  return [a1 jwksData];
}

id objc_msgSend_jwksURI(void *a1, const char *a2, ...)
{
  return [a1 jwksURI];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelTopPadding(void *a1, const char *a2, ...)
{
  return [a1 labelTopPadding];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layoutDatePicker(void *a1, const char *a2, ...)
{
  return [a1 layoutDatePicker];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkSpecifier(void *a1, const char *a2, ...)
{
  return [a1 linkSpecifier];
}

id objc_msgSend_localizedAccountSetupTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedAccountSetupTitleString];
}

id objc_msgSend_localizedAccountTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedAccountTitleString];
}

id objc_msgSend_localizedConfirmSaveUnvalidatedAccountMessageString(void *a1, const char *a2, ...)
{
  return [a1 localizedConfirmSaveUnvalidatedAccountMessageString];
}

id objc_msgSend_localizedConfirmSaveUnvalidatedAccountTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedConfirmSaveUnvalidatedAccountTitleString];
}

id objc_msgSend_localizedIdenticalAccountFailureMessage(void *a1, const char *a2, ...)
{
  return [a1 localizedIdenticalAccountFailureMessage];
}

id objc_msgSend_localizedValidationFailureTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedValidationFailureTitleString];
}

id objc_msgSend_mailNumberOfPastDaysToSync(void *a1, const char *a2, ...)
{
  return [a1 mailNumberOfPastDaysToSync];
}

id objc_msgSend_mailNumberOfPastDaysToSyncUpperLimit(void *a1, const char *a2, ...)
{
  return [a1 mailNumberOfPastDaysToSyncUpperLimit];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_managingOwnerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 managingOwnerIdentifier];
}

id objc_msgSend_mcBackingPayload(void *a1, const char *a2, ...)
{
  return [a1 mcBackingPayload];
}

id objc_msgSend_mcBackingProfile(void *a1, const char *a2, ...)
{
  return [a1 mcBackingProfile];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 messageSpecifiers];
}

id objc_msgSend_migrationStatus(void *a1, const char *a2, ...)
{
  return [a1 migrationStatus];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_newDefaultAccount(void *a1, const char *a2, ...)
{
  return [a1 newDefaultAccount];
}

id objc_msgSend_numberOfRetriedFetchingOutOfOfficeCounter(void *a1, const char *a2, ...)
{
  return [a1 numberOfRetriedFetchingOutOfOfficeCounter];
}

id objc_msgSend_oauthFlowController(void *a1, const char *a2, ...)
{
  return [a1 oauthFlowController];
}

id objc_msgSend_oauthURI(void *a1, const char *a2, ...)
{
  return [a1 oauthURI];
}

id objc_msgSend_oldTextColor(void *a1, const char *a2, ...)
{
  return [a1 oldTextColor];
}

id objc_msgSend_oofState(void *a1, const char *a2, ...)
{
  return [a1 oofState];
}

id objc_msgSend_oooExternalMessageAudience(void *a1, const char *a2, ...)
{
  return [a1 oooExternalMessageAudience];
}

id objc_msgSend_outOfOfficeEnabled(void *a1, const char *a2, ...)
{
  return [a1 outOfOfficeEnabled];
}

id objc_msgSend_outOfOfficeEndDateDisplaySpecifier(void *a1, const char *a2, ...)
{
  return [a1 outOfOfficeEndDateDisplaySpecifier];
}

id objc_msgSend_outOfOfficeSpecifier(void *a1, const char *a2, ...)
{
  return [a1 outOfOfficeSpecifier];
}

id objc_msgSend_pane(void *a1, const char *a2, ...)
{
  return [a1 pane];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathsOfAllLogFiles(void *a1, const char *a2, ...)
{
  return [a1 pathsOfAllLogFiles];
}

id objc_msgSend_preferenceValue(void *a1, const char *a2, ...)
{
  return [a1 preferenceValue];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentInternetOfflineError(void *a1, const char *a2, ...)
{
  return [a1 presentInternetOfflineError];
}

id objc_msgSend_presentSSLError(void *a1, const char *a2, ...)
{
  return [a1 presentSSLError];
}

id objc_msgSend_presentUsernameMismatchAlert(void *a1, const char *a2, ...)
{
  return [a1 presentUsernameMismatchAlert];
}

id objc_msgSend_previousUserSelectedAutoReplyEndDate(void *a1, const char *a2, ...)
{
  return [a1 previousUserSelectedAutoReplyEndDate];
}

id objc_msgSend_principalURL(void *a1, const char *a2, ...)
{
  return [a1 principalURL];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return [a1 property];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_reAuthenticationButtonSpecifier(void *a1, const char *a2, ...)
{
  return [a1 reAuthenticationButtonSpecifier];
}

id objc_msgSend_redirectHandlerBlock(void *a1, const char *a2, ...)
{
  return [a1 redirectHandlerBlock];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadAccount(void *a1, const char *a2, ...)
{
  return [a1 reloadAccount];
}

id objc_msgSend_reloadParentSpecifier(void *a1, const char *a2, ...)
{
  return [a1 reloadParentSpecifier];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_remotedManaged(void *a1, const char *a2, ...)
{
  return [a1 remotedManaged];
}

id objc_msgSend_removeParentSpecifier(void *a1, const char *a2, ...)
{
  return [a1 removeParentSpecifier];
}

id objc_msgSend_reportActiveExchangeOAuthAccountsCount(void *a1, const char *a2, ...)
{
  return [a1 reportActiveExchangeOAuthAccountsCount];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_saveButton(void *a1, const char *a2, ...)
{
  return [a1 saveButton];
}

id objc_msgSend_saveModifiedPropertiesOnBackingAccount(void *a1, const char *a2, ...)
{
  return [a1 saveModifiedPropertiesOnBackingAccount];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_serverData(void *a1, const char *a2, ...)
{
  return [a1 serverData];
}

id objc_msgSend_serverOutOfOfficeInformation(void *a1, const char *a2, ...)
{
  return [a1 serverOutOfOfficeInformation];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMenuController(void *a1, const char *a2, ...)
{
  return [a1 sharedMenuController];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_showCanSaveAccountFailureView(void *a1, const char *a2, ...)
{
  return [a1 showCanSaveAccountFailureView];
}

id objc_msgSend_showIdenticalAccountFailureView(void *a1, const char *a2, ...)
{
  return [a1 showIdenticalAccountFailureView];
}

id objc_msgSend_signingIdentityPersistentReference(void *a1, const char *a2, ...)
{
  return [a1 signingIdentityPersistentReference];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sized(void *a1, const char *a2, ...)
{
  return [a1 sized];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_supportsDraftFolderSync(void *a1, const char *a2, ...)
{
  return [a1 supportsDraftFolderSync];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_textViewTopPadding(void *a1, const char *a2, ...)
{
  return [a1 textViewTopPadding];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timePickerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 timePickerSpecifier];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_tokenRequestURI(void *a1, const char *a2, ...)
{
  return [a1 tokenRequestURI];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitioningToFinishedAccountSetup(void *a1, const char *a2, ...)
{
  return [a1 transitioningToFinishedAccountSetup];
}

id objc_msgSend_transitionsAfterInitialSetup(void *a1, const char *a2, ...)
{
  return [a1 transitionsAfterInitialSetup];
}

id objc_msgSend_updateDoneButton(void *a1, const char *a2, ...)
{
  return [a1 updateDoneButton];
}

id objc_msgSend_useSSL(void *a1, const char *a2, ...)
{
  return [a1 useSSL];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userSelectedAutoReplyEndDate(void *a1, const char *a2, ...)
{
  return [a1 userSelectedAutoReplyEndDate];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_usernameWithoutDomain(void *a1, const char *a2, ...)
{
  return [a1 usernameWithoutDomain];
}

id objc_msgSend_validateAccount(void *a1, const char *a2, ...)
{
  return [a1 validateAccount];
}

id objc_msgSend_validatedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 validatedSuccessfully];
}

id objc_msgSend_validationInProgress(void *a1, const char *a2, ...)
{
  return [a1 validationInProgress];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_verifyAccountPassword(void *a1, const char *a2, ...)
{
  return [a1 verifyAccountPassword];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_webAuthenticationSession(void *a1, const char *a2, ...)
{
  return [a1 webAuthenticationSession];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}