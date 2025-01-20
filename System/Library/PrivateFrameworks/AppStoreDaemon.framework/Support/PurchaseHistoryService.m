@interface PurchaseHistoryService
- (void)executeQuery:(id)a3 withReplyHandler:(id)a4;
- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withReplyHandler:(id)a5;
- (void)showAllWithReplyHandler:(id)a3;
- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withReplyHandler:(id)a5;
- (void)updateWithContext:(unint64_t)a3 withReplyHandler:(id)a4;
@end

@implementation PurchaseHistoryService

- (void)updateWithContext:(unint64_t)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  sub_10001A264();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = sub_100016788();
  sub_10000833C((uint64_t)v7, a3, v6, v5);
}

- (void)executeQuery:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    if (self)
    {
      v11 = sub_100016788();
      v12 = [v11 processInfo];
      self = [v12 bundleIdentifier];
    }
    int v14 = 138543618;
    v15 = v9;
    __int16 v16 = 2114;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] executeQuery for client: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  v13 = sub_10001A264();
  sub_10024B474((uint64_t)v13, v7, v6);
}

- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  sub_10001A264();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = sub_100016788();
  sub_10024B958((uint64_t)v9, a3, a4, v8, v7);
}

- (void)showAllWithReplyHandler:(id)a3
{
  id v3 = a3;
  sub_10001A264();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = sub_100016788();
  sub_10024BD50((uint64_t)v5, v4, v3);
}

- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  sub_10001A264();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = sub_100016788();
  sub_10024C474((uint64_t)v9, a3, a4, v8, v7);
}

@end