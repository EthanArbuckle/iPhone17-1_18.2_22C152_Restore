@interface AppleDeviceQueryBasebandConnectionArmory
+ (__CTServerConnection)getCTServerConnection;
+ (id)getCoreTelephonyClient;
@end

@implementation AppleDeviceQueryBasebandConnectionArmory

+ (id)getCoreTelephonyClient
{
  if (objc_opt_class())
  {
    if (getCoreTelephonyClient_aToken != -1) {
      dispatch_once(&getCoreTelephonyClient_aToken, &__block_literal_global);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)getCoreTelephonyClient_aSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (!getCoreTelephonyClient__client)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x263F02D38]) initWithQueue:0];
      v6 = (void *)getCoreTelephonyClient__client;
      getCoreTelephonyClient__client = v5;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)getCoreTelephonyClient_aSemaphore);
    id v7 = (id)getCoreTelephonyClient__client;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient]", 101, @"Failed to weak link core telephony client framework!", v2, v3, v4, v9);
    id v7 = 0;
  }

  return v7;
}

uint64_t __66__AppleDeviceQueryBasebandConnectionArmory_getCoreTelephonyClient__block_invoke()
{
  getCoreTelephonyClient_aSemaphore = (uint64_t)dispatch_semaphore_create(1);

  return MEMORY[0x270F9A758]();
}

+ (__CTServerConnection)getCTServerConnection
{
  if (getCTServerConnection_aToken != -1) {
    dispatch_once(&getCTServerConnection_aToken, &__block_literal_global_4);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)getCTServerConnection_aSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!getCTServerConnection__connection)
  {
    uint64_t v2 = dispatch_get_global_queue(0, 0);
    getCTServerConnection__connection = _CTServerConnectionCreateOnTargetQueue();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)getCTServerConnection_aSemaphore);
  CFRetain((CFTypeRef)getCTServerConnection__connection);
  return (__CTServerConnection *)getCTServerConnection__connection;
}

uint64_t __65__AppleDeviceQueryBasebandConnectionArmory_getCTServerConnection__block_invoke()
{
  getCTServerConnection_aSemaphore = (uint64_t)dispatch_semaphore_create(1);

  return MEMORY[0x270F9A758]();
}

@end