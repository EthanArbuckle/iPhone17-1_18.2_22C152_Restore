@interface HAP2AccessoryServerSecureTransportPairSetup
+ (id)defaultEncryptedSession;
- (HAP2AccessoryServerSecureTransportPairSetup)initWithTransport:(id)a3 operationQueue:(id)a4 encryptedSession:(id)a5;
- (void)transport:(id)a3 didReceiveEvent:(id)a4;
@end

@implementation HAP2AccessoryServerSecureTransportPairSetup

- (void)transport:(id)a3 didReceiveEvent:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Unexpected event received", (uint8_t *)&v6, 0xCu);
  }
}

- (HAP2AccessoryServerSecureTransportPairSetup)initWithTransport:(id)a3 operationQueue:(id)a4 encryptedSession:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (const char *)HAPDispatchQueueName(self, @"delegateQueue");
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create(v11, v12);

  v16.receiver = self;
  v16.super_class = (Class)HAP2AccessoryServerSecureTransportPairSetup;
  v14 = [(HAP2AccessoryServerSecureTransportBase *)&v16 initWithOperationQueue:v10 delegateQueue:v13 transport:v8 encryptedSession:v9];

  if (v14) {
    [v8 setDelegate:v14];
  }

  return v14;
}

+ (id)defaultEncryptedSession
{
  v2 = objc_opt_new();

  return v2;
}

@end