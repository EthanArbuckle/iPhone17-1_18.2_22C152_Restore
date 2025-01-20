@interface ATXDeviceStateMonitor
+ (BOOL)airplaneMode;
+ (BOOL)onWifi;
+ (id)SSID;
+ (void)setAirplaneMode:(BOOL)a3;
+ (void)setSSID:(id)a3;
+ (void)startMockingSystem;
+ (void)stopMockingSystem;
@end

@implementation ATXDeviceStateMonitor

+ (BOOL)airplaneMode
{
  pthread_mutex_lock(&lock);
  if (mocking == 1)
  {
    int v2 = mockAirplaneMode;
  }
  else
  {
    if (getAirplaneMode_onceToken != -1) {
      dispatch_once(&getAirplaneMode_onceToken, &__block_literal_global_58);
    }
    unsigned __int8 v3 = atomic_load(getAirplaneMode_inAirplaneMode);
    int v2 = v3 & 1;
  }
  BOOL v4 = v2 != 0;
  pthread_mutex_unlock(&lock);
  return v4;
}

+ (id)SSID
{
  pthread_mutex_lock(&lock);
  if (mocking == 1)
  {
    int v2 = (__CFString *)(id)mockSSID;
  }
  else
  {
    unsigned __int8 v3 = +[ATXWifiStateMonitor sharedInstance];
    int v2 = [v3 SSID];
  }
  pthread_mutex_unlock(&lock);
  if (![(__CFString *)v2 length])
  {

    int v2 = @"- - - - - - - - none - - - - - - - -";
  }
  return v2;
}

+ (BOOL)onWifi
{
  int v2 = [a1 SSID];
  char v3 = [v2 isEqualToString:@"- - - - - - - - none - - - - - - - -"] ^ 1;

  return v3;
}

+ (void)startMockingSystem
{
  pthread_mutex_lock(&lock);
  mocking = 1;
  mockAirplaneMode = 0;
  int v2 = (void *)mockSSID;
  mockSSID = 0;

  pthread_mutex_unlock(&lock);
}

+ (void)stopMockingSystem
{
  pthread_mutex_lock(&lock);
  mocking = 0;
  mockAirplaneMode = 0;
  int v2 = (void *)mockSSID;
  mockSSID = 0;

  pthread_mutex_unlock(&lock);
}

+ (void)setAirplaneMode:(BOOL)a3
{
  pthread_mutex_lock(&lock);
  if ((mocking & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"ATXDeviceStateMonitor.m", 261, @"Invalid parameter not satisfying: %@", @"mocking" object file lineNumber description];
  }
  mockAirplaneMode = a3;
  pthread_mutex_unlock(&lock);
}

+ (void)setSSID:(id)a3
{
  id v8 = a3;
  pthread_mutex_lock(&lock);
  if ((mocking & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"ATXDeviceStateMonitor.m", 269, @"Invalid parameter not satisfying: %@", @"mocking" object file lineNumber description];
  }
  uint64_t v5 = [v8 copy];
  v6 = (void *)mockSSID;
  mockSSID = v5;

  pthread_mutex_unlock(&lock);
}

@end