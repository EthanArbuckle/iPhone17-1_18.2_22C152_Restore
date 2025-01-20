@interface AskPermissionRequestExtension
- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4;
@end

@implementation AskPermissionRequestExtension

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request updated. Result: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v7 = [v5 productType];
  unsigned __int8 v8 = [v7 isEqualToString:@"A"];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Processing result with StoreKit service.", (uint8_t *)&v12, 2u);
    }
    v9 = +[SKServiceBroker defaultBroker];
    v10 = [v9 storeKitServiceWithErrorHandler:&stru_10000C660];

    v11 = [v5 buyParams];
    [v10 processPaymentWithBuyParamsString:v11 reply:&stru_10000C6A0];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100007A5C(v5);
  }
}

@end