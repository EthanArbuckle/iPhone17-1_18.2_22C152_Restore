@interface AMSUIWebJSTelephony
+ (BOOL)_hasCellularTelephonyCapability;
+ (BOOL)_hasRequiredTelephonyEntitlement;
- (AMSUIWebJSTelephony)init;
- (AMSUIWebJSTelephony)initWithDelegate:(id)a3;
- (AMSUIWebJSTelephonyDelegate)delegate;
- (BOOL)telephonySetupFailed;
- (CTXPCServiceSubscriptionContext)telephonyContext;
- (CoreTelephonyClient)telephonyClient;
- (NSString)countryCode;
- (NSString)networkCode;
- (NSString)phoneNumber;
- (NSString)providerName;
- (NSString)radioTechnology;
- (NSString)radioType;
- (OS_dispatch_queue)telephonyQueue;
- (id)formattedPhoneNumber:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)phoneNumberAvailable:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyContext:(id)a3;
- (void)setTelephonyQueue:(id)a3;
- (void)setTelephonySetupFailed:(BOOL)a3;
@end

@implementation AMSUIWebJSTelephony

- (AMSUIWebJSTelephony)init
{
  return [(AMSUIWebJSTelephony *)self initWithDelegate:0];
}

- (AMSUIWebJSTelephony)initWithDelegate:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebJSTelephony;
  v5 = [(AMSUIWebJSTelephony *)&v27 init];
  if (!v5) {
    goto LABEL_9;
  }
  if (!+[AMSUIWebJSTelephony _hasCellularTelephonyCapability])
  {
    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v12 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v18 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v18;
    v19 = "%{public}@ Not capable for telephony";
LABEL_22:
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
LABEL_23:

    v17 = 0;
    goto LABEL_24;
  }
  if (!+[AMSUIWebJSTelephony _hasRequiredTelephonyEntitlement])
  {
    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v12 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v20 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v20;
    v19 = "%{public}@ Not entitled for telephony";
    goto LABEL_22;
  }
  objc_storeWeak((id *)&v5->_delegate, v4);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.AppleMediaServicesUI.webTelephony", 0);
  telephonyQueue = v5->_telephonyQueue;
  v5->_telephonyQueue = (OS_dispatch_queue *)v6;

  uint64_t v8 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v5->_telephonyQueue];
  telephonyClient = v5->_telephonyClient;
  v5->_telephonyClient = (CoreTelephonyClient *)v8;

  [(CoreTelephonyClient *)v5->_telephonyClient setDelegate:v5];
  v10 = v5->_telephonyClient;
  if (!v10)
  {
    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v12 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v21 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v21;
    v19 = "%{public}@ Failed to initialize telephony client.";
    goto LABEL_22;
  }
  id v26 = 0;
  v11 = [(CoreTelephonyClient *)v10 getActiveContexts:&v26];
  id v12 = v26;
  v13 = [v11 voicePreferred];
  if (v13)
  {
    v14 = [v11 findForUuid:v13];
    uint64_t v15 = [v14 context];
    telephonyContext = v5->_telephonyContext;
    v5->_telephonyContext = (CTXPCServiceSubscriptionContext *)v15;
  }
  if (!v5->_telephonyContext)
  {
    v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v23)
    {
      v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v25;
      __int16 v30 = 1024;
      BOOL v31 = v13 != 0;
      __int16 v32 = 1024;
      BOOL v33 = v11 != 0;
      __int16 v34 = 2114;
      id v35 = v12;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize telephony context. (hasUUID: %d hasContexts: %d) %{public}@", buf, 0x22u);
    }

    goto LABEL_23;
  }

LABEL_9:
  v17 = v5;
LABEL_24:

  return v17;
}

- (void)dealloc
{
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSTelephony;
  [(AMSUIWebJSTelephony *)&v3 dealloc];
}

- (void)invalidate
{
}

+ (BOOL)_hasCellularTelephonyCapability
{
  return MGGetBoolAnswer();
}

+ (BOOL)_hasRequiredTelephonyEntitlement
{
  if (_hasRequiredTelephonyEntitlement_sOnceToken != -1) {
    dispatch_once(&_hasRequiredTelephonyEntitlement_sOnceToken, &__block_literal_global_28);
  }
  return _hasRequiredTelephonyEntitlement_hasEntitlement;
}

void __55__AMSUIWebJSTelephony__hasRequiredTelephonyEntitlement__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFErrorRef error = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.CommCenter.fine-grained", &error);
    if (v2)
    {
      objc_super v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFArrayGetTypeID()) {
        _hasRequiredTelephonyEntitlement_hasEntitlement = [v3 containsObject:@"spi"];
      }
      CFRelease(v3);
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v1);
  }
}

- (NSString)countryCode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  objc_super v3 = [(AMSUIWebJSTelephony *)self telephonyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_countryCode__block_invoke;
  v6[3] = &unk_2643E53A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_countryCode__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFTypeRef v2 = [*(id *)(a1 + 32) telephonyClient];
  objc_super v3 = [*(id *)(a1 + 32) telephonyContext];
  id v12 = 0;
  uint64_t v4 = [v2 copyMobileSubscriberCountryCode:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      v11 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch country code. %{public}@", buf, 0x16u);
    }
  }
}

- (NSString)networkCode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  objc_super v3 = [(AMSUIWebJSTelephony *)self telephonyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_networkCode__block_invoke;
  v6[3] = &unk_2643E53A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_networkCode__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFTypeRef v2 = [*(id *)(a1 + 32) telephonyClient];
  objc_super v3 = [*(id *)(a1 + 32) telephonyContext];
  id v12 = 0;
  uint64_t v4 = [v2 copyMobileSubscriberNetworkCode:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      v11 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch network code. %{public}@", buf, 0x16u);
    }
  }
}

- (NSString)phoneNumber
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  objc_super v3 = [(AMSUIWebJSTelephony *)self telephonyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_phoneNumber__block_invoke;
  v6[3] = &unk_2643E3230;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_phoneNumber__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFTypeRef v2 = [*(id *)(a1 + 32) telephonyClient];
  objc_super v3 = [*(id *)(a1 + 32) telephonyContext];
  id v14 = 0;
  id v4 = [v2 getPhoneNumber:v3 error:&v14];
  id v5 = v14;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch phone number. %{public}@", buf, 0x16u);
    }
  }
  uint64_t v11 = [v4 number];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (NSString)providerName
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  objc_super v3 = [(AMSUIWebJSTelephony *)self telephonyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__AMSUIWebJSTelephony_providerName__block_invoke;
  v6[3] = &unk_2643E3230;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __35__AMSUIWebJSTelephony_providerName__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFTypeRef v2 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  objc_super v3 = [*(id *)(a1 + 32) telephonyClient];
  id v4 = [*(id *)(a1 + 32) telephonyContext];
  id v15 = 0;
  id v5 = (void *)[v3 copyCarrierBundleValue:v4 key:@"CarrierName" bundleType:v2 error:&v15];
  id v6 = v15;

  id v7 = v5;
  objc_opt_class();
  id v8 = 0;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v6)
  {
    uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch provider name. %{public}@", buf, 0x16u);
    }
  }
}

- (NSString)radioTechnology
{
  CFTypeRef v2 = [MEMORY[0x263F27D98] lastConnectionReport];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F279B0]];

  return (NSString *)v3;
}

- (NSString)radioType
{
  CFTypeRef v2 = [MEMORY[0x263F27D98] lastConnectionReport];
  objc_super v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F279A8]];

  return (NSString *)v3;
}

- (id)formattedPhoneNumber:(id)a3
{
  objc_super v3 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
  return v3;
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v5 = [(AMSUIWebJSTelephony *)self delegate];
  [v5 telephonyDidChange:self];
}

- (void)phoneNumberAvailable:(id)a3
{
  id v4 = [(AMSUIWebJSTelephony *)self delegate];
  [v4 telephonyDidChange:self];
}

- (void)phoneNumberChanged:(id)a3
{
  id v4 = [(AMSUIWebJSTelephony *)self delegate];
  [v4 telephonyDidChange:self];
}

- (AMSUIWebJSTelephonyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebJSTelephonyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)telephonyContext
{
  return self->_telephonyContext;
}

- (void)setTelephonyContext:(id)a3
{
}

- (BOOL)telephonySetupFailed
{
  return self->_telephonySetupFailed;
}

- (void)setTelephonySetupFailed:(BOOL)a3
{
  self->_telephonySetupFailed = a3;
}

- (OS_dispatch_queue)telephonyQueue
{
  return self->_telephonyQueue;
}

- (void)setTelephonyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
  objc_storeStrong((id *)&self->_telephonyContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end