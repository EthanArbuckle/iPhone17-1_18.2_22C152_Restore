@interface PushCacheDeleteUpdateRequestTask
- (void)main;
@end

@implementation PushCacheDeleteUpdateRequestTask

- (void)main
{
  v3 = +[KeepAlive keepAliveWithName:@"com.apple.PushCacheDeleteUpdateOperation"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    v13 = v3;
    id v4 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[%@]: Created transaction: %@", (uint8_t *)&v10, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v8 = client;
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Purgeable update request for client: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_1002C5D90();
  sub_1002C753C(v9);
  if (self) {
    self->super.super._success = 1;
  }
}

@end