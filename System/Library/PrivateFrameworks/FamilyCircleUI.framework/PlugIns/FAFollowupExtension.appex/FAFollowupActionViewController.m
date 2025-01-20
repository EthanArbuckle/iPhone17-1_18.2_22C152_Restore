@interface FAFollowupActionViewController
- (FLFollowUpItem)followupItem;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)handleAKAction:(id)a3 completion:(id)a4;
- (void)handleActionWithURL:(id)a3;
- (void)handleActionWithURLKey:(id)a3 completion:(id)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setFollowupItem:(id)a3;
@end

@implementation FAFollowupActionViewController

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(id, uint64_t))a5;
  id v11 = a4;
  v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 userInfo];
    int v31 = 138412290;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Processing followup item with info: %@", (uint8_t *)&v31, 0xCu);
  }
  objc_storeStrong((id *)&self->_followupItem, a3);
  v14 = [v11 userInfo];
  v15 = [v14 objectForKeyedSubscript:AKActionKey];

  v16 = [v11 userInfo];
  v17 = [v16 objectForKeyedSubscript:AKFollowUpSafariURLKey];

  v18 = [v11 userInfo];

  v19 = [v18 objectForKeyedSubscript:AKFollowUpURLKey];

  if (v19)
  {
    v20 = _FALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received URL key: %@", (uint8_t *)&v31, 0xCu);
    }

    [(FAFollowupActionViewController *)self handleActionWithURLKey:v19 completion:v10];
  }
  else if (v17)
  {
    v21 = +[NSURL URLWithString:v17];
    if (v21)
    {
      v22 = _FALogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412290;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received URL: %@", (uint8_t *)&v31, 0xCu);
      }

      [(FAFollowupActionViewController *)self handleActionWithURL:v21];
    }
    v10[2](v10, 1);
  }
  else
  {
    v23 = _FALogSystem();
    v24 = v23;
    if (v15)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412290;
        v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received AKAction %@", (uint8_t *)&v31, 0xCu);
      }

      v25 = objc_opt_new();
      v26 = [(FLFollowUpItem *)self->_followupItem uniqueIdentifier];
      [v25 setItemIdentifier:v26];

      [v25 setAkAction:v15];
      v27 = [v9 userInfo];
      v28 = [v27 objectForKeyedSubscript:AKFollowUpIDMSDataKey];

      v29 = [v9 userInfo];
      v30 = [v29 objectForKeyedSubscript:AKFollowUpAltDSIDKey];

      if (v28) {
        [v25 setIdmsData:v28];
      }
      if (v30) {
        [v25 setAltDSID:v30];
      }
      [(FAFollowupActionViewController *)self handleAKAction:v25 completion:v10];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100003138(v24);
      }

      v10[2](v10, 1);
    }
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
}

- (void)handleActionWithURLKey:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, uint64_t))a4;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v6, 2u);
  }

  v4[2](v4, 1);
}

- (void)handleAKAction:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, uint64_t))a4;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v6, 2u);
  }

  v4[2](v4, 1);
}

- (void)handleActionWithURL:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Subclasses must override this method.", v4, 2u);
  }
}

- (FLFollowUpItem)followupItem
{
  return self->_followupItem;
}

- (void)setFollowupItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end