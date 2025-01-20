@interface IAPInfoUpdateRequestTask
- (void)main;
@end

@implementation IAPInfoUpdateRequestTask

- (void)main
{
  v3 = sub_100416894((uint64_t)XPCRequestToken, 1);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    v13 = v3;
    id v7 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%@]: %{public}@ Starting legacy request to refresh IAPs", buf, 0x16u);
  }
  v5 = sub_1000109AC();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F748;
  v8[3] = &unk_100521620;
  v8[4] = self;
  id v9 = v3;
  id v6 = v3;
  sub_1000106BC((uint64_t)v5, v6, v8);
}

@end