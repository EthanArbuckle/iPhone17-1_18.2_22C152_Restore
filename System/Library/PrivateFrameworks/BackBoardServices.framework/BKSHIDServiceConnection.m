@interface BKSHIDServiceConnection
+ (id)clientConnectionForServiceWithName:(id)a3;
@end

@implementation BKSHIDServiceConnection

+ (id)clientConnectionForServiceWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F50BB8] endpointForMachName:@"com.apple.backboard.hid-services.xpc" service:v3 instance:0];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v4];
  }
  else
  {
    v6 = BKLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "cannot get endpoint for mach service (on behalf of BSService namee: %{public}@)", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

@end