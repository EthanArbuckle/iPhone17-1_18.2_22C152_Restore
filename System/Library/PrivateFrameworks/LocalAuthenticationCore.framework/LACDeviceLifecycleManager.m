@interface LACDeviceLifecycleManager
+ (void)rebootDeviceWithReason:(id)a3 completion:(id)a4;
@end

@implementation LACDeviceLifecycleManager

+ (void)rebootDeviceWithReason:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = LACLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Rebooting device with reason: %@", (uint8_t *)&v11, 0xCu);
  }

  int v8 = reboot3();
  v9 = LACLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    LODWORD(v12) = v8;
    _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Requested reboot with result: %d", (uint8_t *)&v11, 8u);
  }

  if (v8)
  {
    v10 = +[LACError errorWithCode:-1000 debugDescription:@"Failed to reboot the device"];
    v6[2](v6, v10);
  }
  else
  {
    v6[2](v6, 0);
  }
}

@end