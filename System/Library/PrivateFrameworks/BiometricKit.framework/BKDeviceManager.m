@interface BKDeviceManager
+ (id)availableDevices;
+ (id)availableDevicesWithFailure:(BOOL *)a3;
+ (void)initialize;
@end

@implementation BKDeviceManager

+ (void)initialize
{
  if (initializeOSLog_onceToken != -1) {
    dispatch_once(&initializeOSLog_onceToken, &__block_literal_global_1);
  }
}

+ (id)availableDevices
{
  return +[BKDeviceManager availableDevicesWithFailure:0];
}

+ (id)availableDevicesWithFailure:(BOOL *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v5 = __osLogTrace;
  }
  else {
    v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDeviceManager::availableDevicesWithFailure\n", buf, 2u);
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
  BOOL v12 = 0;
  if (+[BKDeviceTouchID deviceAvailableWithFailure:&v12])
  {
    v7 = +[BKDeviceDescriptor deviceDescriptorForType:1];
    [v6 addObject:v7];
  }
  if (v12) {
    v8 = 0;
  }
  else {
    v8 = &v12;
  }
  if (+[BKDevicePearl deviceAvailableWithFailure:v8])
  {
    v9 = +[BKDeviceDescriptor deviceDescriptorForType:2];
    [v6 addObject:v9];
  }
  if (a3) {
    *a3 = v12;
  }
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = v4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v12;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDeviceManager::availableDevicesWithFailure -> %@ (%u)\n", buf, 0x12u);
  }
  [v6 count];
  kdebug_trace();
  return v6;
}

@end