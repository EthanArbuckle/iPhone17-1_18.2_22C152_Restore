@interface AMSKeybag
+ (id)bl_keybagSyncDataForAccount:(id)a3 withTransactionType:(unsigned int)a4;
+ (void)bl_importKeybagData:(id)a3;
@end

@implementation AMSKeybag

+ (void)bl_importKeybagData:(id)a3
{
  id v3 = a3;
  v4 = +[AMSKeybag sharedInstance];
  id v8 = 0;
  unsigned __int8 v5 = [v4 importKeybagWithData:v3 error:&v8];

  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = BLServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to import keybag data for account error:  %@", buf, 0xCu);
    }
  }
}

+ (id)bl_keybagSyncDataForAccount:(id)a3 withTransactionType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = +[AMSKeybag sharedInstance];
  objc_msgSend(v5, "ams_DSID");
  v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &off_1001AF880;
  }
  id v13 = 0;
  v9 = [v6 keybagSyncDataWithAccountID:v8 transactionType:v4 error:&v13];
  id v10 = v13;

  if (!v9)
  {
    v11 = BLServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to obtain keybay data for account error:  %@", buf, 0xCu);
    }
  }

  return v9;
}

@end