@interface CTTelephonyNetworkInfo
- (BOOL)getAllowsVOIP:(BOOL *)a3 forContext:(id)a4 withError:(id *)a5;
- (BOOL)getCarrierName:(id)a3 forContext:(id)a4 withError:(id *)a5;
- (BOOL)getMobileCountryCode:(id)a3 andIsoCountryCode:(id)a4 forContext:(id)a5 withError:(id *)a6;
- (BOOL)getMobileNetworkCode:(id)a3 forContext:(id)a4 withError:(id *)a5;
- (BOOL)updateNetworkInfoAndShouldNotifyClient:(BOOL *)a3 forContext:(id)a4;
- (CTCarrier)subscriberCellularProvider;
- (CTServiceDescriptorContainer)descriptors;
- (CTTelephonyNetworkInfo)init;
- (CTTelephonyNetworkInfo)initWithClient:(id)a3;
- (NSDictionary)serviceCurrentRadioAccessTechnology;
- (NSDictionary)serviceSubscriberCellularProviders;
- (NSMutableDictionary)cachedCellIds;
- (NSMutableDictionary)cachedCurrentRadioAccessTechnology;
- (NSMutableDictionary)cachedSignalStrength;
- (NSString)currentRadioAccessTechnology;
- (NSString)dataServiceIdentifier;
- (id).cxx_construct;
- (id)cellId;
- (id)delegate;
- (id)getFirstCellId;
- (id)radioAccessTechnology;
- (id)serviceCellId;
- (id)serviceSignalStrength;
- (id)serviceSubscribersCellularProviderDidUpdateNotifier;
- (id)signalStrength;
- (queue)clientQueue;
- (void)carrierBundleChange:(id)a3;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)currentDataServiceDescriptorChanged:(id)a3;
- (void)dataServiceIdentifier;
- (void)dealloc;
- (void)descriptors;
- (void)postNotificationIfReady:(id)a3 object:(id)a4;
- (void)queryCTSignalStrength;
- (void)queryCellIds;
- (void)queryRat;
- (void)queryRatForDescriptor:(id)a3;
- (void)querySignalStrengthForDescriptor:(id)a3;
- (void)regDataModeChanged:(id)a3 dataMode:(int)a4;
- (void)serviceSubscriberCellularProvidersDidUpdateNotifier;
- (void)setCachedCellIds:(id)a3;
- (void)setCachedCurrentRadioAccessTechnology:(id)a3;
- (void)setCachedSignalStrength:(id)a3;
- (void)setClientQueue:(queue)a3;
- (void)setDelegate:(id)delegate;
- (void)setServiceSubscriberCellularProviderDidUpdateNotifier:(id)a3;
- (void)setServiceSubscriberCellularProviders:(id)a3;
- (void)setServiceSubscriberCellularProvidersDidUpdateNotifier:(void *)serviceSubscriberCellularProvidersDidUpdateNotifier;
- (void)setSubscriberCellularProviderDidUpdateNotifier:(void *)subscriberCellularProviderDidUpdateNotifier;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)subscriberCellularProviderDidUpdateNotifier;
- (void)updateCellId:(id)a3 forDescriptor:(id)a4;
- (void)updateLegacyRat:(id)a3;
- (void)updateRat:(id)a3 descriptor:(id)a4;
- (void)updateSignalStrength:(id)a3 descriptor:(id)a4;
@end

@implementation CTTelephonyNetworkInfo

- (CTTelephonyNetworkInfo)init
{
  v3 = (dispatch_object_s *)dispatch_queue_create("CTTelephonyNetworkInfo", 0);
  fObj = self->_clientQueue.fObj.fObj;
  self->_clientQueue.fObj.fObj = v3;
  if (fObj) {
    dispatch_release(fObj);
  }
  v5 = [[CoreTelephonyClient alloc] initWithQueue:self->_clientQueue.fObj.fObj];
  v6 = [(CTTelephonyNetworkInfo *)self initWithClient:v5];

  return v6;
}

- (CTTelephonyNetworkInfo)initWithClient:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CTTelephonyNetworkInfo;
  v5 = [(CTTelephonyNetworkInfo *)&v35 init];
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v5->_initialized = 0;
    uint64_t v8 = objc_opt_new();
    serviceSubscriberCellularProviders = v7->_serviceSubscriberCellularProviders;
    v7->_serviceSubscriberCellularProviders = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v6->_client, a3);
    cachedCurrentRadioAccessTechnology = v7->_cachedCurrentRadioAccessTechnology;
    v7->_cachedCurrentRadioAccessTechnology = 0;

    cachedSignalStrength = v7->_cachedSignalStrength;
    v7->_cachedSignalStrength = 0;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    cachedCellIds = v7->_cachedCellIds;
    v7->_cachedCellIds = (NSMutableDictionary *)v12;

    if (v7->_subscriberCellularProviderDidUpdateNotifier) {
      -[CTTelephonyNetworkInfo setSubscriberCellularProviderDidUpdateNotifier:](v7, "setSubscriberCellularProviderDidUpdateNotifier:");
    }
    v14 = [(CTTelephonyNetworkInfo *)v7 serviceSubscriberCellularProviders];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      v27 = v7;
      v7 = 0;
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(CTTelephonyNetworkInfo *)v7 setCachedCurrentRadioAccessTechnology:v16];

      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(CTTelephonyNetworkInfo *)v7 setCachedSignalStrength:v17];

      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(CTTelephonyNetworkInfo *)v7 setCachedCellIds:v18];

      [(CTTelephonyNetworkInfo *)v7 descriptors];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v29 = (CTTelephonyNetworkInfo *)objc_claimAutoreleasedReturnValue();
      v19 = [(CTTelephonyNetworkInfo *)v29 descriptors];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v24 = [v23 instance];
            v25 = +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:", (int)[v24 intValue]);

            if (![(CTTelephonyNetworkInfo *)v7 updateNetworkInfoAndShouldNotifyClient:0 forContext:v25])
            {
              v26 = CTLogNetworkInfo();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v23;
                _os_log_debug_impl(&dword_18444A000, v26, OS_LOG_TYPE_DEBUG, "Could not successfully update network info for descriptor %@ during initialization.", buf, 0xCu);
              }
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v20);
      }

      [(CTTelephonyNetworkInfo *)v7 queryRat];
      [(CTTelephonyNetworkInfo *)v7 queryCTSignalStrength];
      [(CoreTelephonyClient *)v7->_client setDelegate:v7];
      v7->_initialized = 1;
      v27 = v29;
    }
  }
  return v7;
}

- (void)dealloc
{
  if (self->_initialized)
  {
    [(CoreTelephonyClient *)self->_client setDelegate:0];
    client = self->_client;
    self->_client = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    descriptors = self->_descriptors;
    self->_descriptors = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CTTelephonyNetworkInfo;
  [(CTTelephonyNetworkInfo *)&v6 dealloc];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
}

- (id)serviceSubscribersCellularProviderDidUpdateNotifier
{
  v2 = _Block_copy(self->_serviceSubscriberCellularProvidersDidUpdateNotifier);

  return v2;
}

- (void)subscriberCellularProviderDidUpdateNotifier
{
  v2 = _Block_copy(self->_subscriberCellularProviderDidUpdateNotifier);

  return v2;
}

- (void)setServiceSubscriberCellularProviderDidUpdateNotifier:(id)a3
{
  id v4 = a3;
  if (self->_serviceSubscriberCellularProvidersDidUpdateNotifier != v4)
  {
    id v7 = v4;
    v5 = (void *)[v4 copyWithZone:0];
    id serviceSubscriberCellularProvidersDidUpdateNotifier = self->_serviceSubscriberCellularProvidersDidUpdateNotifier;
    self->_id serviceSubscriberCellularProvidersDidUpdateNotifier = v5;

    id v4 = v7;
  }
}

- (void)setSubscriberCellularProviderDidUpdateNotifier:(void *)subscriberCellularProviderDidUpdateNotifier
{
  id v4 = subscriberCellularProviderDidUpdateNotifier;
  if (self->_subscriberCellularProviderDidUpdateNotifier != v4)
  {
    id v7 = v4;
    v5 = (void *)[v4 copyWithZone:0];
    id v6 = self->_subscriberCellularProviderDidUpdateNotifier;
    self->_subscriberCellularProviderDidUpdateNotifier = v5;

    id v4 = v7;
  }
}

- (BOOL)getCarrierName:(id)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [[CTBundle alloc] initWithBundleType:1];
    client = self->_client;
    id v17 = 0;
    id v12 = [(CoreTelephonyClient *)client copyCarrierBundleValue:v9 key:@"CarrierName" bundleType:v10 error:&v17];
    id v13 = v17;
    v14 = v13;
    if (a5) {
      *a5 = v13;
    }
    BOOL v15 = v14 == 0;
    if (!v14 && v12) {
      [v8 setString:v12];
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)getMobileCountryCode:(id)a3 andIsoCountryCode:(id)a4 forContext:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10 && v11)
  {
    client = self->_client;
    id v23 = 0;
    id v14 = [(CoreTelephonyClient *)client copyMobileSubscriberCountryCode:v12 error:&v23];
    id v15 = v23;
    id v16 = v15;
    if (v15 || !v14)
    {
      if (a6)
      {
        id v16 = v15;
        BOOL v20 = 0;
        *a6 = v16;
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      id v17 = self->_client;
      id v22 = 0;
      id v18 = [(CoreTelephonyClient *)v17 copyMobileSubscriberIsoCountryCode:v14 error:&v22];
      id v19 = v22;
      id v16 = v19;
      if (a6) {
        *a6 = v19;
      }
      BOOL v20 = v16 == 0;
      if (!v16)
      {
        [v10 setString:v14];
        if (v18) {
          [v11 setString:v18];
        }
      }
    }
  }
  else if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)getMobileNetworkCode:(id)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    client = self->_client;
    id v16 = 0;
    id v11 = [(CoreTelephonyClient *)client copyMobileSubscriberNetworkCode:v9 error:&v16];
    id v12 = v16;
    id v13 = v12;
    if (a5) {
      *a5 = v12;
    }
    BOOL v14 = v13 == 0;
    if (!v13 && v11) {
      [v8 setString:v11];
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)getAllowsVOIP:(BOOL *)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v9 = [[CTBundle alloc] initWithBundleType:1];
    client = self->_client;
    id v16 = 0;
    id v11 = [(CoreTelephonyClient *)client copyCarrierBundleValue:v8 key:@"AllowsVoIP" bundleType:v9 error:&v16];
    id v12 = v16;
    id v13 = v12;
    if (a5) {
      *a5 = v12;
    }
    BOOL v14 = v13 == 0;
    if (!v13 && v11) {
      *a3 = [v11 BOOLValue];
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)updateNetworkInfoAndShouldNotifyClient:(BOOL *)a3 forContext:(id)a4
{
  id v5 = a4;
  unsigned __int8 v43 = 1;
  v36 = v5;
  id v6 = objc_alloc_init(CTCarrier);
  v37 = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1ECFD6720];
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1ECFD6720];
  id v42 = 0;
  BOOL v8 = [(CTTelephonyNetworkInfo *)self getCarrierName:v7 forContext:v5 withError:&v42];
  id v9 = v42;
  if (!v8) {
    goto LABEL_22;
  }
  uint64_t v10 = [v7 length];
  if (v10) {
    id v11 = (void *)[v7 copyWithZone:0];
  }
  else {
    id v11 = 0;
  }
  [(CTCarrier *)v6 setCarrierName:v11];
  if (v10) {

  }
  [v7 setString:&stru_1ECFD6720];
  id v41 = v9;
  BOOL v12 = [(CTTelephonyNetworkInfo *)self getMobileCountryCode:v7 andIsoCountryCode:v38 forContext:v5 withError:&v41];
  id v13 = v41;

  if (!v12)
  {
    BOOL v16 = 0;
    id v9 = v13;
    goto LABEL_23;
  }
  uint64_t v14 = [v7 length];
  if (v14) {
    id v15 = (void *)[v7 copyWithZone:0];
  }
  else {
    id v15 = 0;
  }
  [(CTCarrier *)v6 setMobileCountryCode:v15];
  if (v14) {

  }
  uint64_t v17 = [v38 length];
  if (v17) {
    id v18 = (void *)[v38 copyWithZone:0];
  }
  else {
    id v18 = 0;
  }
  [(CTCarrier *)v6 setIsoCountryCode:v18];
  if (v17) {

  }
  [v7 setString:&stru_1ECFD6720];
  [v38 setString:&stru_1ECFD6720];
  id v40 = v13;
  BOOL v19 = [(CTTelephonyNetworkInfo *)self getMobileNetworkCode:v7 forContext:v5 withError:&v40];
  id v9 = v40;

  if (v19)
  {
    uint64_t v20 = [v7 length];
    if (v20) {
      uint64_t v21 = (void *)[v7 copyWithZone:0];
    }
    else {
      uint64_t v21 = 0;
    }
    [(CTCarrier *)v6 setMobileNetworkCode:v21];
    if (v20) {

    }
    [v7 setString:&stru_1ECFD6720];
    id v39 = v9;
    BOOL v33 = [(CTTelephonyNetworkInfo *)self getAllowsVOIP:&v43 forContext:v5 withError:&v39];
    id v34 = v39;

    if (v33)
    {
      [(CTCarrier *)v6 setAllowsVOIP:v43];
      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = 0;
    }
    id v9 = v34;
  }
  else
  {
LABEL_22:
    BOOL v16 = 0;
  }
LABEL_23:
  id v22 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v5];
  if (v16)
  {
    if (a3) {
      *a3 = 0;
    }
    id v23 = self->_serviceSubscriberCellularProviders;
    objc_sync_enter(v23);
    v24 = [(CTTelephonyNetworkInfo *)self serviceSubscriberCellularProviders];
    v25 = [v22 identifier];
    v26 = [v24 objectForKeyedSubscript:v25];
    char v27 = [v26 isEqual:v37];

    if ((v27 & 1) == 0)
    {
      serviceSubscriberCellularProviders = self->_serviceSubscriberCellularProviders;
      v29 = [v22 identifier];
      [(NSMutableDictionary *)serviceSubscriberCellularProviders setObject:v37 forKey:v29];

      if (a3) {
        *a3 = 1;
      }
    }
  }
  else
  {
    id v23 = self->_serviceSubscriberCellularProviders;
    objc_sync_enter(v23);
    id v30 = self->_serviceSubscriberCellularProviders;
    long long v31 = [v22 identifier];
    [(NSMutableDictionary *)v30 removeObjectForKey:v31];
  }
  objc_sync_exit(v23);

  return v16;
}

- (CTServiceDescriptorContainer)descriptors
{
  descriptors = self->_descriptors;
  if (descriptors)
  {
LABEL_2:
    v3 = descriptors;
    goto LABEL_7;
  }
  client = self->_client;
  id v12 = 0;
  id v6 = [(CoreTelephonyClient *)client getDescriptorsForDomain:1 error:&v12];
  id v7 = v12;
  if (!v7)
  {
    uint64_t v10 = CTLogNetworkInfo();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo descriptors]();
    }
    id v11 = self->_descriptors;
    self->_descriptors = v6;

    descriptors = self->_descriptors;
    goto LABEL_2;
  }
  BOOL v8 = CTLogNetworkInfo();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CTTelephonyNetworkInfo descriptors]();
  }

  v3 = 0;
LABEL_7:

  return v3;
}

- (NSString)dataServiceIdentifier
{
  client = self->_client;
  id v9 = 0;
  v3 = [(CoreTelephonyClient *)client getCurrentDataServiceDescriptorSync:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = CTLogNetworkInfo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo dataServiceIdentifier]();
    }
    id v6 = 0;
  }
  else
  {
    id v7 = CTLogNetworkInfo();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo dataServiceIdentifier]();
    }
    id v6 = [v3 identifier];
  }

  return (NSString *)v6;
}

- (void)regDataModeChanged:(id)a3 dataMode:(int)a4
{
  v6 = id v8 = a3;
  id v7 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v8];
  [(CTTelephonyNetworkInfo *)self updateRat:v6 descriptor:v7];
}

- (void)currentDataServiceDescriptorChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CTTelephonyNetworkInfo *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    global_queue = dispatch_get_global_queue(21, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__CTTelephonyNetworkInfo_currentDataServiceDescriptorChanged___block_invoke;
    v7[3] = &unk_1E5263048;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(global_queue, v7);
  }
}

void __62__CTTelephonyNetworkInfo_currentDataServiceDescriptorChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  objc_msgSend(v1, "dataServiceIdentifierDidChange:");
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v10 = a4;
  id v6 = +[CTServiceDescriptor descriptorWithSubscriptionContext:a3];
  id v8 = [v10 objectForKey:@"kCTRegistrationGsmCellId"];
  if (!v8)
  {
    id v8 = [v10 objectForKey:@"kCTRegistrationC2KBaseId"];
  id v9 = };
  [(CTTelephonyNetworkInfo *)self updateCellId:v9 forDescriptor:v6];
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  char v19 = 0;
  if ([(CTTelephonyNetworkInfo *)self updateNetworkInfoAndShouldNotifyClient:&v19 forContext:v4])
  {
    if (v19)
    {
      id v6 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v4];
      if (self->_serviceSubscriberCellularProvidersDidUpdateNotifier)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke;
        block[3] = &unk_1E5263048;
        block[4] = self;
        id v18 = v6;
        dispatch_async(global_queue, block);
      }
      if (self->_subscriberCellularProviderDidUpdateNotifier
      {
        id v8 = self->_serviceSubscriberCellularProviders;
        objc_sync_enter(v8);
        id v9 = [(CTTelephonyNetworkInfo *)self serviceSubscriberCellularProviders];
        id v10 = [v6 identifier];
        id v11 = [v9 objectForKeyedSubscript:v10];

        id v12 = dispatch_get_global_queue(0, 0);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke_2;
        v15[3] = &unk_1E5263048;
        v15[4] = self;
        id v16 = v11;
        id v13 = v11;
        dispatch_async(v12, v15);

        objc_sync_exit(v8);
      }
    }
  }
  else
  {
    uint64_t v14 = CTLogNetworkInfo();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo carrierBundleChange:]();
    }
  }
}

void __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) identifier];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)postNotificationIfReady:(id)a3 object:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_initialized)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:v8 object:v6];
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v7 = a4;
  id v6 = +[CTServiceDescriptor descriptorWithSubscriptionContext:a3];
  [(CTTelephonyNetworkInfo *)self updateSignalStrength:v7 descriptor:v6];
}

- (void)updateSignalStrength:(id)a3 descriptor:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v22[0] = @"CTSignalStrengthBarsKey";
      id v8 = [v6 bars];
      v23[0] = v8;
      v22[1] = @"CTSignalStrengthDisplayBarsKey";
      id v9 = [v6 displayBars];
      v23[1] = v9;
      v22[2] = @"CTSignalStrengthMaxDisplayBarsKey";
      id v10 = [v6 maxDisplayBars];
      v23[2] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

      id v12 = self->_cachedSignalStrength;
      objc_sync_enter(v12);
      id v13 = [(CTTelephonyNetworkInfo *)self cachedSignalStrength];
      uint64_t v14 = [v7 identifier];
      [v13 setObject:v11 forKey:v14];

      objc_sync_exit(v12);
      if (v11)
      {
        id v15 = [v7 identifier];
        [(CTTelephonyNetworkInfo *)self postNotificationIfReady:@"CTServiceSignalStrengthDidChangeNotification" object:v15];

        {
          uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v17 postNotificationName:@"CTSignalStrengthDidChangeNotification" object:v11];
        }
      }
    }
    else
    {
      char v19 = self->_cachedSignalStrength;
      objc_sync_enter(v19);
      uint64_t v20 = [(CTTelephonyNetworkInfo *)self cachedSignalStrength];
      uint64_t v21 = [v7 identifier];
      [v20 removeObjectForKey:v21];

      objc_sync_exit(v19);
      id v11 = 0;
    }
  }
  else
  {
    id v18 = CTLogNetworkInfo();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo updateSignalStrength:descriptor:](v18);
    }
  }
}

- (void)queryCTSignalStrength
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Querying signal strength for descriptors: %@", v2, v3, v4, v5, v6);
}

- (void)querySignalStrengthForDescriptor:(id)a3
{
  id v4 = a3;
  client = self->_client;
  id v10 = 0;
  uint8_t v6 = [(CoreTelephonyClient *)client getPublicSignalStrength:v4 error:&v10];
  id v7 = v10;
  if (v7)
  {
    id v8 = CTLogNetworkInfo();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo querySignalStrengthForDescriptor:]();
    }
  }
  else if (v6)
  {
    [(CTTelephonyNetworkInfo *)self updateSignalStrength:v6 descriptor:v4];
  }
  else
  {
    id v9 = CTLogNetworkInfo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo querySignalStrengthForDescriptor:]();
    }
  }
}

- (void)queryRat
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Querying RAT for descriptors: %@", v2, v3, v4, v5, v6);
}

- (void)queryRatForDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CTXPCServiceSubscriptionContext contextWithServiceDescriptor:v4];
  client = self->_client;
  id v12 = 0;
  id v7 = [(CoreTelephonyClient *)client getDataStatus:v5 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = CTLogNetworkInfo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo queryRatForDescriptor:]();
    }
  }
  else if (v7) {
    id v10 = {;
  }
    [(CTTelephonyNetworkInfo *)self updateRat:v10 descriptor:v4];
  }
  else
  {
    id v11 = CTLogNetworkInfo();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CTTelephonyNetworkInfo queryRatForDescriptor:]();
    }
  }
}

- (void)updateRat:(id)a3 descriptor:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  id v8 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v8);
  id v9 = [(CTTelephonyNetworkInfo *)self cachedCurrentRadioAccessTechnology];
  id v10 = [v7 identifier];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (!(v6 | v11) || v11 && ([(id)v11 isEqualToString:v6] & 1) != 0)
  {

    objc_sync_exit(v8);
    goto LABEL_12;
  }
  id v12 = CTLogNetworkInfo();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    id v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    unint64_t v24 = v6;
    _os_log_debug_impl(&dword_18444A000, v12, OS_LOG_TYPE_DEBUG, "Updating RAT for descriptor: %@, from: %@ to: %@", (uint8_t *)&v19, 0x20u);
    if (v6) {
      goto LABEL_7;
    }
  }
  else if (v6)
  {
LABEL_7:
    id v13 = [(CTTelephonyNetworkInfo *)self cachedCurrentRadioAccessTechnology];
    uint64_t v14 = [v7 identifier];
    [v13 setObject:v6 forKey:v14];

    goto LABEL_10;
  }
  id v15 = [(CTTelephonyNetworkInfo *)self cachedCurrentRadioAccessTechnology];
  id v16 = [v7 identifier];
  [v15 removeObjectForKey:v16];

  [(CTTelephonyNetworkInfo *)self updateSignalStrength:0 descriptor:v7];
LABEL_10:

  objc_sync_exit(v8);
  uint64_t v17 = [v7 identifier];
  [(CTTelephonyNetworkInfo *)self postNotificationIfReady:@"CTServiceRadioAccessTechnologyDidChangeNotification" object:v17];

    [(CTTelephonyNetworkInfo *)self updateLegacyRat:v6];
LABEL_12:
}

- (void)updateLegacyRat:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CTRadioAccessTechnologyDidChangeNotification" object:v4];
}

- (void)updateCellId:(id)a3 forDescriptor:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    if (v6)
    {
      id v7 = self->_cachedCellIds;
      objc_sync_enter(v7);
      id v8 = [(CTTelephonyNetworkInfo *)self cachedCellIds];
      id v9 = [v6 identifier];
      [v8 setObject:v14 forKey:v9];

      objc_sync_exit(v7);
      id v10 = [v6 identifier];
      [(CTTelephonyNetworkInfo *)self postNotificationIfReady:@"CTServiceCellIdDidChangeNotification" object:v10];

      {
        id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v13 = [(CTTelephonyNetworkInfo *)self getFirstCellId];
        [v12 postNotificationName:@"CTCellIdDidChangeNotification" object:v13];
      }
    }
  }
}

- (void)queryCellIds
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Querying Cell IDs for descriptors: %@", v2, v3, v4, v5, v6);
}

- (NSDictionary)serviceCurrentRadioAccessTechnology
{
  uint64_t v3 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v3);
  uint64_t v4 = [(CTTelephonyNetworkInfo *)self cachedCurrentRadioAccessTechnology];
  objc_sync_exit(v3);

  return (NSDictionary *)v4;
}

- (NSString)currentRadioAccessTechnology
{
  uint64_t v3 = [CTServiceDescriptor alloc];
  uint64_t v4 = [NSNumber numberWithInt:1];
  uint64_t v5 = [(CTServiceDescriptor *)v3 initWithDomain:1 instance:v4];

  uint8_t v6 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v6);
  id v7 = [(CTTelephonyNetworkInfo *)self cachedCurrentRadioAccessTechnology];
  id v8 = [(CTServiceDescriptor *)v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);

  return (NSString *)v9;
}

- (id)serviceSignalStrength
{
  uint64_t v3 = self->_cachedSignalStrength;
  objc_sync_enter(v3);
  uint64_t v4 = [(CTTelephonyNetworkInfo *)self cachedSignalStrength];
  objc_sync_exit(v3);

  return v4;
}

- (id)signalStrength
{
  uint64_t v3 = [CTServiceDescriptor alloc];
  uint64_t v4 = [NSNumber numberWithInt:1];
  uint64_t v5 = [(CTServiceDescriptor *)v3 initWithDomain:1 instance:v4];

  uint8_t v6 = self->_cachedSignalStrength;
  objc_sync_enter(v6);
  id v7 = [(CTTelephonyNetworkInfo *)self cachedSignalStrength];
  id v8 = [(CTServiceDescriptor *)v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);

  return v9;
}

- (id)serviceCellId
{
  uint64_t v3 = self->_cachedCellIds;
  objc_sync_enter(v3);
  uint64_t v4 = [(CTTelephonyNetworkInfo *)self cachedCellIds];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [(CTTelephonyNetworkInfo *)self queryCellIds];
  }
  uint8_t v6 = [(CTTelephonyNetworkInfo *)self cachedCellIds];
  objc_sync_exit(v3);

  return v6;
}

- (id)cellId
{
  uint64_t v3 = [(CTTelephonyNetworkInfo *)self getFirstCellId];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    [(CTTelephonyNetworkInfo *)self queryCellIds];
    id v5 = [(CTTelephonyNetworkInfo *)self getFirstCellId];
  }
  uint8_t v6 = v5;

  return v6;
}

- (id)getFirstCellId
{
  uint64_t v3 = self->_cachedCellIds;
  objc_sync_enter(v3);
  uint64_t v4 = [(CTTelephonyNetworkInfo *)self cachedCellIds];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint8_t v6 = [(CTTelephonyNetworkInfo *)self cachedCellIds];
    id v7 = [v6 objectEnumerator];
    id v8 = [v7 nextObject];
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(v3);

  return v8;
}

- (CTCarrier)subscriberCellularProvider
{
  uint64_t v3 = [CTServiceDescriptor alloc];
  uint64_t v4 = [NSNumber numberWithInt:1];
  uint64_t v5 = [(CTServiceDescriptor *)v3 initWithDomain:1 instance:v4];

  uint8_t v6 = self->_serviceSubscriberCellularProviders;
  objc_sync_enter(v6);
  id v7 = [(CTTelephonyNetworkInfo *)self serviceSubscriberCellularProviders];
  id v8 = [(CTServiceDescriptor *)v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  objc_sync_exit(v6);

  return (CTCarrier *)v9;
}

- (id)radioAccessTechnology
{
  uint64_t v2 = [[CTRadioAccessTechnology alloc] initWithCTTelephonyNetworkInfo:self];

  return v2;
}

- (NSDictionary)serviceSubscriberCellularProviders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServiceSubscriberCellularProviders:(id)a3
{
}

- (void)serviceSubscriberCellularProvidersDidUpdateNotifier
{
  return self->_serviceSubscriberCellularProvidersDidUpdateNotifier;
}

- (void)setServiceSubscriberCellularProvidersDidUpdateNotifier:(void *)serviceSubscriberCellularProvidersDidUpdateNotifier
{
}

- (NSMutableDictionary)cachedCurrentRadioAccessTechnology
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedCurrentRadioAccessTechnology:(id)a3
{
}

- (NSMutableDictionary)cachedSignalStrength
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedSignalStrength:(id)a3
{
}

- (NSMutableDictionary)cachedCellIds
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedCellIds:(id)a3
{
}

- (queue)clientQueue
{
  objc_copyCppObjectAtomic(v2, &self->_clientQueue, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return v3;
}

- (void)setClientQueue:(queue)a3
{
}

- (void).cxx_destruct
{
  fObj = self->_clientQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  objc_storeStrong((id *)&self->_cachedCellIds, 0);
  objc_storeStrong((id *)&self->_cachedSignalStrength, 0);
  objc_storeStrong((id *)&self->_cachedCurrentRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_serviceSubscriberCellularProviders, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong(&self->_subscriberCellularProviderDidUpdateNotifier, 0);
  objc_storeStrong(&self->_serviceSubscriberCellularProvidersDidUpdateNotifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  return self;
}

- (void)descriptors
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Descriptors query returned error: %@", v2, v3, v4, v5, v6);
}

- (void)dataServiceIdentifier
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Data service descriptor query returned error: %@", v2, v3, v4, v5, v6);
}

- (void)carrierBundleChange:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Update network info failed for context %@", v2, v3, v4, v5, v6);
}

- (void)updateSignalStrength:(os_log_t)log descriptor:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "Cannot update signal strength.  Invalid descriptor", v1, 2u);
}

- (void)querySignalStrengthForDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "No signal strength in query result for descriptor: %@", v2, v3, v4, v5, v6);
}

- (void)querySignalStrengthForDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_18444A000, v0, v1, "Signal strength query returned error: %@, descriptor: %@");
}

- (void)queryRatForDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "No DataStatus in query result for context: %@", v2, v3, v4, v5, v6);
}

- (void)queryRatForDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_18444A000, v0, v1, "DataStatus query returned error: %@, context: %@");
}

@end