@interface ENCoreTelephonyUtility
+ (ENCoreTelephonyUtility)sharedInstance;
+ (id)countryCodeISOForMobileCountryCode:(id)a3;
+ (id)mobileCountryCodeForISO:(id)a3;
- (CoreTelephonyClient)ctClient;
- (ENCoreTelephonyUtility)init;
- (NSHashTable)observersTable;
- (OS_dispatch_queue)serialQueue;
- (__CTServerConnection)ctServerConnection;
- (id)countryCodeISOForMobileCountryCode:(id)a3;
- (id)currentMobileCountryCode;
- (id)currentPhoneNumbers;
- (void)addObserver:(id)a3;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setObserversTable:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation ENCoreTelephonyUtility

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v7 = [v6 legacyInfo];
  uint64_t v8 = [(__CFString *)v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v8)
  {
    v10 = v7;
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v9 = v8;
  id v30 = v6;
  id v28 = v5;
  v10 = 0;
  uint64_t v11 = *(void *)v36;
  uint64_t v12 = *MEMORY[0x1E4F23C10];
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v36 != v11) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = v7;
        v16 = [v14 objectForKeyedSubscript:v12];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_13;
        }
        v18 = (void *)MEMORY[0x1E4F29020];
        v19 = [v14 objectForKeyedSubscript:v12];
        v20 = [v18 stringWithFormat:@"%@", v19];

        if (!v20)
        {
          v10 = 0;
LABEL_13:
          v7 = v15;
          continue;
        }
        v7 = v15;
        if ([(__CFString *)v20 integerValue] >= 1
          && [(__CFString *)v20 integerValue] != 0xFFFF)
        {

          v10 = v20;
          id v5 = v28;
          id v6 = v30;
LABEL_19:
          if ([(__CFString *)v10 isEqualToString:@"209"])
          {

            v10 = @"310";
          }
          v21 = +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:v10];
          if (v21)
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            v22 = [(ENCoreTelephonyUtility *)self observersTable];
            v23 = [v22 allObjects];

            uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v32 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  [*(id *)(*((void *)&v31 + 1) + 8 * j) telephonyUtility:self mobileCountryCodeChanged:v10 andCountryCodeISO:v21];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v25);
            }

            id v6 = v30;
          }
          else if (gLogCategory__ENConfigurationManager_0 <= 90 {
                 && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
          }
          {
            [(__CFString *)v10 integerValue];
            LogPrintF_safe();
          }

          goto LABEL_36;
        }
        v10 = v20;
      }
    }
    uint64_t v9 = [(__CFString *)v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9) {
      continue;
    }
    break;
  }

  id v5 = v28;
  id v6 = v30;
  if (v10) {
    goto LABEL_19;
  }
LABEL_37:
}

- (NSHashTable)observersTable
{
  return self->_observersTable;
}

+ (id)countryCodeISOForMobileCountryCode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9439DC0]();
    id v5 = [MEMORY[0x1E4F1C9E0] dictionaryWithContentsOfFile:@"/System/Library/Carrier Bundles/iPhone/Default.bundle/MCC2ISO.plist"];
    id v6 = [v5 objectForKey:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (ENCoreTelephonyUtility)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (ENCoreTelephonyUtility *)v2;
}

void __40__ENCoreTelephonyUtility_sharedInstance__block_invoke()
{
  if (!sharedInstance_sharedInstance)
  {
    v0 = objc_alloc_init(ENCoreTelephonyUtility);
    uint64_t v1 = sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;
    MEMORY[0x1F41817F8](v0, v1);
  }
}

- (ENCoreTelephonyUtility)init
{
  v12.receiver = self;
  v12.super_class = (Class)ENCoreTelephonyUtility;
  v2 = [(ENCoreTelephonyUtility *)&v12 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.exposureNotification.regionSource.telephony", v3);
    [(ENCoreTelephonyUtility *)v2 setSerialQueue:v4];

    id v5 = [(ENCoreTelephonyUtility *)v2 serialQueue];
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    id v6 = objc_alloc(MEMORY[0x1E4F23A78]);
    v7 = [(ENCoreTelephonyUtility *)v2 serialQueue];
    uint64_t v8 = [v6 initWithQueue:v7];
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v8;

    [(CoreTelephonyClient *)v2->_ctClient setDelegate:v2];
  }
  v10 = [MEMORY[0x1E4F28D38] weakObjectsHashTable];
  [(ENCoreTelephonyUtility *)v2 setObserversTable:v10];

  return v2;
}

- (void)dealloc
{
  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if ([(ENCoreTelephonyUtility *)self ctServerConnection]) {
    CFRelease([(ENCoreTelephonyUtility *)self ctServerConnection]);
  }
  v3.receiver = self;
  v3.super_class = (Class)ENCoreTelephonyUtility;
  [(ENCoreTelephonyUtility *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ENCoreTelephonyUtility *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ENCoreTelephonyUtility_addObserver___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__ENCoreTelephonyUtility_addObserver___block_invoke(uint64_t a1)
{
  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v2 = [*(id *)(a1 + 32) observersTable];
  [v2 addObject:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) currentMobileCountryCode];
  objc_super v3 = +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:");
  if (v3)
  {
    if (gLogCategory_ENCoreTelephonyUtility < 31
      && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = [v6 integerValue];
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 40), "telephonyUtility:mobileCountryCodeChanged:andCountryCodeISO:", *(void *)(a1 + 32), v6, v3, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "telephonyUtility:mobileCountryCodeChanged:andCountryCodeISO:", *(void *)(a1 + 32), v6, v3, v4);
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v5 = [(ENCoreTelephonyUtility *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ENCoreTelephonyUtility_removeObserver___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__ENCoreTelephonyUtility_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observersTable];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)countryCodeISOForMobileCountryCode:(id)a3
{
  id v4 = a3;
  if ([(ENCoreTelephonyUtility *)self ctServerConnection]
    || ([(ENCoreTelephonyUtility *)self ctClient],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = (void *)MEMORY[0x1D9439DC0]();
    if (v4)
    {
      [(ENCoreTelephonyUtility *)self ctServerConnection];
      _CTServerConnectionCopyISOForMCC();
      if (gLogCategory__ENConfigurationManager_0 <= 90
        && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }

  return 0;
}

+ (id)mobileCountryCodeForISO:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9439DC0]();
    uint64_t v5 = [MEMORY[0x1E4F1C9E0] dictionaryWithContentsOfFile:@"/System/Library/Carrier Bundles/iPhone/Default.bundle/ISO2MCC.plist"];
    id v6 = [v3 lowercaseString];
    v7 = [v5 objectForKey:v6];

    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)currentMobileCountryCode
{
  id v3 = [(ENCoreTelephonyUtility *)self ctClient];

  if (v3)
  {
    id v4 = [(ENCoreTelephonyUtility *)self ctClient];
    uint64_t v5 = [v4 getCurrentDataSubscriptionContextSync:0];

    id v6 = [(ENCoreTelephonyUtility *)self ctClient];
    id v11 = 0;
    v7 = (void *)[v6 copyMobileCountryCode:v5 error:&v11];
    id v8 = v11;

    if (!v8 && v7 && [v7 length] && objc_msgSend(v7, "integerValue") != 0xFFFF)
    {
      id v9 = v7;
    }
    else
    {
      if (gLogCategory__ENConfigurationManager_0 <= 90
        && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)currentPhoneNumbers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F1CA88] setWithCapacity:2];
  id v3 = [(ENCoreTelephonyUtility *)self ctClient];
  id v28 = 0;
  id v4 = [v3 getSubscriptionInfoWithError:&v28];
  id v5 = v28;

  if (v5)
  {
    if (gLogCategory__ENConfigurationManager_0 <= 90
      && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v5;
LABEL_30:
      LogPrintF_safe();
    }
  }
  else
  {
    v21 = v4;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = [v4 subscriptionsInUse];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          objc_super v12 = [(ENCoreTelephonyUtility *)self ctClient];
          id v23 = 0;
          v13 = [v12 getPhoneNumber:v11 error:&v23];
          id v14 = v23;

          if (v13)
          {
            active = (void *)softLinkCPPhoneNumberCopyActiveCountryCode();
            if (active)
            {
              v16 = [v13 number];
              v17 = softLinkTPSNormalizedPhoneNumberString(v16, active);

              if (v17) {
                [v22 addObject:v17];
              }
            }
            else if (gLogCategory_ENCoreTelephonyUtility <= 90 {
                   && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF_safe();
            }
          }
          else if (gLogCategory__ENConfigurationManager_0 <= 90 {
                 && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
          }
          {
            id v20 = v14;
            LogPrintF_safe();
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    id v4 = v21;
    id v5 = 0;
    if (gLogCategory_ENCoreTelephonyUtility <= 40
      && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
    {
      id v20 = v22;
      goto LABEL_30;
    }
  }
  v18 = objc_msgSend(v22, "allObjects", v20);

  return v18;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)setObserversTable:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_observersTable, 0);

  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end