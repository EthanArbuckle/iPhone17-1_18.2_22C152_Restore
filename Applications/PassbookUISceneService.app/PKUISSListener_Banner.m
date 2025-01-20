@interface PKUISSListener_Banner
- (PKUISSListener_Banner)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PKUISSListener_Banner

- (PKUISSListener_Banner)init
{
  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  v6 = [v5 remoteProcess];
  v7 = v6;
  if (!v6)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      id v15 = v5;
      v11 = "PKUISSBannerHandle: rejecting connection %p - missing remote process.";
      v12 = v9;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
LABEL_11:

    [v5 invalidate];
    goto LABEL_12;
  }
  unsigned int v8 = [v6 hasEntitlement:@"com.apple.wallet.banner"];
  v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      int v14 = 134218240;
      id v15 = v5;
      __int16 v16 = 2050;
      uint64_t v17 = (int)[v7 pid];
      v11 = "PKUISSBannerHandle: rejecting connection %p - remote process %{public}ld missing entitlement com.apple.wallet.banner.";
      v12 = v9;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    int v14 = 134218240;
    id v15 = v5;
    __int16 v16 = 2050;
    uint64_t v17 = (int)[v7 pid];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: accepting connection %p for remote process %{public}ld.", (uint8_t *)&v14, 0x16u);
  }

LABEL_12:
}

- (void).cxx_destruct
{
}

@end