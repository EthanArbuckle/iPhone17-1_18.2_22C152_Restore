@interface MDMFollowUp
+ (void)clearFollowUpWithClientID:(id)a3;
- (FLFollowUpController)followUpController;
- (MDMFollowUp)initWithStyle:(int64_t)a3 clientIdentifier:(id)a4 itemIdentifier:(id)a5 url:(id)a6 title:(id)a7 notificationInfo:(id)a8 userInfo:(id)a9;
- (NSDictionary)userInfo;
- (NSString)clientIdentifier;
- (NSString)itemIdentifier;
- (NSString)notificationInfo;
- (NSString)title;
- (NSURL)url;
- (id)_constructFollowUp;
- (int64_t)style;
- (void)clearFollowUp;
- (void)presentFollowUp;
- (void)setClientIdentifier:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setNotificationInfo:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MDMFollowUp

- (MDMFollowUp)initWithStyle:(int64_t)a3 clientIdentifier:(id)a4 itemIdentifier:(id)a5 url:(id)a6 title:(id)a7 notificationInfo:(id)a8 userInfo:(id)a9
{
  id v15 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MDMFollowUp;
  v18 = [(MDMFollowUp *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:v15];
    followUpController = v18->_followUpController;
    v18->_followUpController = (FLFollowUpController *)v19;

    objc_storeStrong((id *)&v18->_clientIdentifier, a4);
    objc_storeStrong((id *)&v18->_itemIdentifier, a5);
    objc_storeStrong((id *)&v18->_url, a6);
    v18->_style = a3;
    objc_storeStrong((id *)&v18->_title, a7);
    objc_storeStrong((id *)&v18->_notificationInfo, a8);
    objc_storeStrong((id *)&v18->_userInfo, a9);
  }

  return v18;
}

- (void)presentFollowUp
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(MDMFollowUp *)self clearFollowUp];
  v3 = [(MDMFollowUp *)self _constructFollowUp];
  v4 = [(MDMFollowUp *)self followUpController];
  id v10 = 0;
  char v5 = [v4 postFollowUpItem:v3 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = [(MDMFollowUp *)self clientIdentifier];
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Failed to post FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)clearFollowUp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(MDMFollowUp *)self followUpController];
  id v9 = 0;
  char v4 = [v3 clearPendingFollowUpItems:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = [(MDMFollowUp *)self clientIdentifier];
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Failed to clear pending FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);
    }
  }
}

+ (void)clearFollowUpWithClientID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:v3];
  id v8 = 0;
  char v5 = [v4 clearPendingFollowUpItems:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = v3;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Failed to clear pending FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);
    }
  }
}

- (id)_constructFollowUp
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F35378];
  char v4 = [(MDMFollowUp *)self title];
  char v5 = [(MDMFollowUp *)self url];
  id v6 = [v3 actionWithLabel:v4 url:v5];

  v7 = [(MDMFollowUp *)self userInfo];
  [v6 setUserInfo:v7];

  id v8 = objc_opt_new();
  id v9 = [(MDMFollowUp *)self title];
  [v8 setTitle:v9];

  v22[0] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  [v8 setActions:v10];

  [v8 setGroupIdentifier:*MEMORY[0x263F352C8]];
  __int16 v11 = [(MDMFollowUp *)self itemIdentifier];
  [v8 setUniqueIdentifier:v11];

  if ([(MDMFollowUp *)self style] == 1) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = 18;
  }
  [v8 setDisplayStyle:v12];
  uint64_t v13 = [(MDMFollowUp *)self notificationInfo];

  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [(MDMFollowUp *)self title];
    [v14 setTitle:v15];

    id v16 = [(MDMFollowUp *)self notificationInfo];
    [v14 setInformativeText:v16];

    [v14 setActivateAction:v6];
    id v17 = [v14 options];
    uint64_t v21 = *MEMORY[0x263F352F8];
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    uint64_t v19 = [v17 setByAddingObjectsFromArray:v18];
    [v14 setOptions:v19];

    [v8 setNotification:v14];
  }

  return v8;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end