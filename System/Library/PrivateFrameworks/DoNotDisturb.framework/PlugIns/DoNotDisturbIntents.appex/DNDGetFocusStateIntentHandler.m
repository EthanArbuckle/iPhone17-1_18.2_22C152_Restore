@interface DNDGetFocusStateIntentHandler
- (void)handleGetFocusState:(id)a3 completion:(id)a4;
@end

@implementation DNDGetFocusStateIntentHandler

- (void)handleGetFocusState:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = DNDIntentLog;
  if (os_log_type_enabled((os_log_t)DNDIntentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling intent: %{public}@", buf, 0xCu);
  }
  v8 = [v5 focus];
  v9 = +[DNDModeSelectionService serviceForClientIdentifier:@"com.apple.DoNotDisturb.Intents"];
  id v41 = 0;
  v10 = [v9 availableModesWithError:&v41];
  id v11 = v41;
  if (v11)
  {
    v12 = DNDIntentLog;
    if (os_log_type_enabled((os_log_t)DNDIntentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error getting available modes: %@", buf, 0xCu);
    }
    sub_1000012F4(v6, 5, 2);
  }
  else
  {
    id v34 = v5;
    v35 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v33 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v37 + 1) + 8 * i) modeIdentifier];
          v19 = [v8 identifier];
          unsigned __int8 v20 = [v18 isEqualToString:v19];

          if (v20)
          {

            id v36 = 0;
            v22 = [v9 activeModeAssertionWithError:&v36];
            id v23 = v36;
            if (v23)
            {
              v24 = DNDIntentLog;
              if (os_log_type_enabled((os_log_t)DNDIntentLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v44 = v23;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Error while getting assertion mode: %@.", buf, 0xCu);
              }
              id v6 = v35;
              sub_1000012F4(v35, 5, 2);
              v10 = v33;
              id v5 = v34;
            }
            else
            {
              v32 = v22;
              v25 = [v22 details];
              v26 = [v25 modeIdentifier];
              v27 = [v8 identifier];
              unsigned int v28 = [v26 isEqualToString:v27];

              v29 = DNDIntentLog;
              BOOL v30 = os_log_type_enabled((os_log_t)DNDIntentLog, OS_LOG_TYPE_DEFAULT);
              if (v28)
              {
                id v6 = v35;
                if (v30)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requested mode is active.", buf, 2u);
                }
                uint64_t v31 = 1;
              }
              else
              {
                id v6 = v35;
                if (v30)
                {
                  *(_WORD *)buf = 0;
                  uint64_t v31 = 2;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requested mode is not active.", buf, 2u);
                }
                else
                {
                  uint64_t v31 = 2;
                }
              }
              v10 = v33;
              id v5 = v34;
              v22 = v32;
              sub_1000012F4(v6, 4, v31);
            }

            goto LABEL_31;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v21 = DNDIntentLog;
    if (os_log_type_enabled((os_log_t)DNDIntentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Requested mode is not configured.", buf, 2u);
    }
    id v6 = v35;
    sub_1000012F4(v35, 100, 2);
    v10 = v33;
    id v5 = v34;
  }
LABEL_31:
}

@end