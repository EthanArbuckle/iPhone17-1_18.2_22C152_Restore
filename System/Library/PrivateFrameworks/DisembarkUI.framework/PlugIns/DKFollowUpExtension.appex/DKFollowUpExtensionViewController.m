@interface DKFollowUpExtensionViewController
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
@end

@implementation DKFollowUpExtensionViewController

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = _DKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing follow up action: %@", buf, 0xCu);
  }

  v9 = [v6 url];

  if (v9)
  {
    v10 = +[LSApplicationWorkspace defaultWorkspace];
    v11 = [v6 url];
    uint64_t v24 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v25 = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v19 = 0;
    unsigned __int8 v13 = [v10 openSensitiveURL:v11 withOptions:v12 error:&v19];
    id v14 = v19;

    if ((v13 & 1) == 0)
    {
      v15 = _DKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [v6 url];
        if (_DKIsInternalInstall())
        {
          int v17 = 0;
          v18 = v14;
        }
        else if (v14)
        {
          v12 = [v14 domain];
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v12, [v14 code]);
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
          v18 = 0;
        }
        *(_DWORD *)buf = 138412546;
        id v21 = v16;
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to open URL %@: %{public}@", buf, 0x16u);
        if (v17)
        {
        }
      }
    }
  }
  else
  {
    +[DKFollowUp clearFollowUp];
  }
  v7[2](v7, 1);
}

@end