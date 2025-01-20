@interface ICSApplicationDelegateHelper
- (BOOL)configureAndOpenDialRequestForDualSIMIfNecessary:(id)a3 options:(id)a4 url:(id)a5;
- (BOOL)isDefaultOrTelephonyScheme:(id)a3;
- (BOOL)openDialRequestIfNecessary:(id)a3 options:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5;
- (ICSApplicationDelegateHelper)init;
- (TUFeatureFlags)featureFlags;
- (id)openDialRequestBlock;
- (id)requestTimeoutBlock;
- (void)setOpenDialRequestBlock:(id)a3;
- (void)setRequestTimeoutBlock:(id)a3;
@end

@implementation ICSApplicationDelegateHelper

- (ICSApplicationDelegateHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICSApplicationDelegateHelper;
  v2 = [(ICSApplicationDelegateHelper *)&v6 init];
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;
  }
  return v2;
}

- (BOOL)openDialRequestIfNecessary:(id)a3 options:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    v9 = [a4 objectForKey:_UIApplicationOpenURLOptionsSourceProcessHandleKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v8 provider];
      if ([v10 isSystemProvider])
      {

LABEL_8:
        v14 = [(ICSApplicationDelegateHelper *)self openDialRequestBlock];
        ((void (**)(void, id, void *, BOOL))v14)[2](v14, v8, v9, v5);

LABEL_11:
        goto LABEL_12;
      }
      v12 = [(ICSApplicationDelegateHelper *)self featureFlags];
      int v13 = TUDefaultAppsEnabled();

      if (v13) {
        goto LABEL_8;
      }
      v11 = +[TUCallCenter sharedInstance];
      [v11 launchAppForDialRequest:v8 completion:0];
    }
    else
    {
      v11 = sub_1000D5130();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001EB510();
      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v8 != 0;
}

- (BOOL)configureAndOpenDialRequestForDualSIMIfNecessary:(id)a3 options:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(ICSApplicationDelegateHelper *)self isDefaultOrTelephonyScheme:a5];
  if (!v8)
  {
    BOOL v13 = 0;
    goto LABEL_44;
  }
  BOOL v11 = v10;
  if (![v8 preferDefaultApp] || defaultAppRelayTelephonySetting() != 1)
  {
    if (+[PHDevice isGeminiCapable])
    {
      v14 = [v8 provider];
      if ([v14 isTelephonyProvider])
      {
        v15 = [v8 localSenderIdentityAccountUUID];

        if (!v15)
        {
          v16 = +[ICSApplicationServices sharedInstance];
          v17 = [v16 contactGeminiManager];

          v18 = +[ICSApplicationServices sharedInstance];
          v19 = [v18 contactStore];

          v20 = +[CNGeminiManager descriptorForRequiredKeys];
          v47 = v20;
          uint64_t v21 = +[NSArray arrayWithObjects:&v47 count:1];

          v22 = [v8 contactIdentifier];
          v41 = (void *)v21;
          if (v22)
          {
            v23 = sub_1000D5130();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v22;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retrieving contact with identifier %@", buf, 0xCu);
            }

            id v44 = 0;
            v24 = [v19 unifiedContactWithIdentifier:v22 keysToFetch:v21 error:&v44];
            v25 = v44;
            v26 = v25;
            if (!v24)
            {
              if (!v25 || [v25 code] == (id)200) {
                goto LABEL_42;
              }
              v39 = v19;
              v28 = v17;
              v29 = sub_1000D5130();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                sub_1001EB5F0();
              }
              v30 = v26;
              goto LABEL_34;
            }
            v39 = v19;
            v27 = sub_1000D5130();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v24;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Retrieving sender identity for contact %@", buf, 0xCu);
            }

            v43 = v26;
            v28 = v17;
            v29 = [v17 bestSenderIdentityForContact:v24 error:&v43];
            v30 = v43;

            if (v29)
            {
              v31 = [v29 accountUUID];
              [v8 setLocalSenderIdentityAccountUUID:v31];
            }
            else
            {
              if (!v30)
              {
LABEL_34:

                v26 = v30;
                v17 = v28;
                v19 = v39;
LABEL_42:

                goto LABEL_43;
              }
              v31 = sub_1000D5130();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                sub_1001EB658((uint64_t)v30, v31);
              }
            }

            goto LABEL_34;
          }
          v32 = [v8 handle];
          v26 = [v32 cnHandle];

          v24 = sub_1000D5130();
          BOOL v33 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v26)
          {
            if (v33)
            {
              *(_DWORD *)buf = 138412290;
              v46 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Retrieving sender identity for contact handle %@", buf, 0xCu);
            }

            id v42 = 0;
            v34 = [v17 bestSenderIdentityForHandle:v26 contactStore:v19 error:&v42];
            v35 = v42;
            v24 = v35;
            if (v34)
            {
              v40 = v19;
              v36 = v17;
              v37 = [v34 accountUUID];
              [v8 setLocalSenderIdentityAccountUUID:v37];
LABEL_40:

              v17 = v36;
              v19 = v40;
              goto LABEL_41;
            }
            if (v35)
            {
              v40 = v19;
              v36 = v17;
              v37 = sub_1000D5130();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                sub_1001EB578((uint64_t)v24, v37);
              }
              goto LABEL_40;
            }
          }
          else
          {
            if (!v33) {
              goto LABEL_42;
            }
            v34 = [v8 handle];
            *(_DWORD *)buf = 138412290;
            v46 = v34;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Could not create a contact handle from dial request handle %@.", buf, 0xCu);
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
      }
    }
LABEL_43:
    BOOL v13 = [(ICSApplicationDelegateHelper *)self openDialRequestIfNecessary:v8 options:v9 bypassUIPromptIfDefaultProvider:v11];
    goto LABEL_44;
  }
  v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cannot proceed with dial request because user has 'None' selected as their default app", buf, 2u);
  }

  BOOL v13 = 1;
LABEL_44:

  return v13;
}

- (BOOL)isDefaultOrTelephonyScheme:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICSApplicationDelegateHelper *)self featureFlags];
  unsigned int v6 = [v5 defaultCallingAppsGracefulFallbackEnabled];

  if (v6)
  {
    v7 = [v4 scheme];
    id v8 = +[NSURL TUDialRequestSchemeDefaultApp];
    if ([v7 isEqualToString:v8])
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      BOOL v10 = [v4 scheme];
      BOOL v11 = +[NSURL TUDialRequestSchemeForceTelephony];
      unsigned __int8 v9 = [v10 isEqualToString:v11];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)openDialRequestBlock
{
  return self->_openDialRequestBlock;
}

- (void)setOpenDialRequestBlock:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (id)requestTimeoutBlock
{
  return self->_requestTimeoutBlock;
}

- (void)setRequestTimeoutBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong(&self->_openDialRequestBlock, 0);
}

@end