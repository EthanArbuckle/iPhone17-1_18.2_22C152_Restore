@interface ACCFeaturePluginHIDProvider
+ (id)sharedHIDProvider;
- (ACCFeaturePluginHIDProvider)init;
- (AccessoryHIDClient)hidClient;
- (BOOL)deleteHIDDescriptor:(id)a3;
- (BOOL)processGetReportResponse:(id)a3 reportType:(unsigned __int8)a4 reportID:(unsigned __int8)a5 forUUID:(id)a6;
- (BOOL)processInReport:(id)a3 forUUID:(id)a4;
- (NSMutableArray)descriptorUUIDs;
- (OS_dispatch_queue)hidProviderLock;
- (id)createHIDDescriptor:(id)a3;
- (id)getDescriptor:(id)a3;
- (void)dealloc;
- (void)setDescriptorUUIDs:(id)a3;
- (void)setHidClient:(id)a3;
- (void)setHidProviderLock:(id)a3;
- (void)stopHIDProvider;
@end

@implementation ACCFeaturePluginHIDProvider

+ (id)sharedHIDProvider
{
  if (sharedHIDProvider_once != -1) {
    dispatch_once(&sharedHIDProvider_once, &__block_literal_global);
  }
  v2 = (void *)sharedHIDProvider_sharedInstance;
  return v2;
}

uint64_t __48__ACCFeaturePluginHIDProvider_sharedHIDProvider__block_invoke()
{
  sharedHIDProvider_sharedInstance = objc_alloc_init(ACCFeaturePluginHIDProvider);
  return MEMORY[0x270F9A758]();
}

- (ACCFeaturePluginHIDProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCFeaturePluginHIDProvider;
  v2 = [(ACCFeaturePluginHIDProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    descriptorUUIDs = v2->_descriptorUUIDs;
    v2->_descriptorUUIDs = 0;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F22E18]) initWithDelegate:v3];
    hidClient = v3->_hidClient;
    v3->_hidClient = (AccessoryHIDClient *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("hidProviderSerialQueue", 0);
    hidProviderLock = v3->_hidProviderLock;
    v3->_hidProviderLock = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ACCFeaturePluginHIDProvider;
  [(ACCFeaturePluginHIDProvider *)&v2 dealloc];
}

- (void)stopHIDProvider
{
  v3 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ACCFeaturePluginHIDProvider_stopHIDProvider__block_invoke;
  block[3] = &unk_2647CFF50;
  block[4] = self;
  dispatch_sync(v3, block);

  [(ACCFeaturePluginHIDProvider *)self setHidClient:0];
  [(ACCFeaturePluginHIDProvider *)self setHidProviderLock:0];
}

uint64_t __46__ACCFeaturePluginHIDProvider_stopHIDProvider__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) removeDescriptor];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) setDescriptorUUIDs:0];
}

- (id)createHIDDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke;
  block[3] = &unk_2647CFFF0;
  id v10 = v4;
  long long v11 = self;
  v12 = &v13;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke(uint64_t a1)
{
  objc_super v2 = [ACCFeaturePluginHIDDescriptor alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_2;
  v13[3] = &unk_2647CFF78;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  v11[4] = v14;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_3;
  v12[3] = &unk_2647CFFA0;
  v12[4] = v14;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_4;
  v11[3] = &unk_2647CFFC8;
  id v4 = [(ACCFeaturePluginHIDDescriptor *)v2 initWithDecriptorInfo:v3 sendOutReport:v13 sendGetReport:v12 sendComponentUpdate:v11];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) descriptorUUIDs];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      [*(id *)(a1 + 40) setDescriptorUUIDs:v6];
    }
    id v7 = [*(id *)(a1 + 40) descriptorUUIDs];
    [v7 addObject:v4];

    uint64_t v8 = [(ACCFeaturePluginHIDDescriptor *)v4 hidDeviceUUIDStr];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 hidClient];
  [v7 sendOutReport:v5 fromUUID:v6];
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = [v6 hidClient];
  [v10 sendGetReportForType:v8 andID:v7 fromUUID:v9];
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 hidClient];
  [v6 hidDescriptor:v5 active:a3];
}

- (BOOL)deleteHIDDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v4)
  {
    id v5 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ACCFeaturePluginHIDProvider_deleteHIDDescriptor___block_invoke;
    block[3] = &unk_2647CFFF0;
    void block[4] = self;
    id v9 = v4;
    id v10 = &v11;
    dispatch_sync(v5, block);

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__ACCFeaturePluginHIDProvider_deleteHIDDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      id v8 = [v7 hidDeviceUUIDStr];
      id v9 = *(void **)(a1 + 40);

      if (v8 == v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    [v10 removeDescriptor];
    uint64_t v11 = [*(id *)(a1 + 32) descriptorUUIDs];
    [v11 removeObject:v10];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_super v2 = v10;
  }
LABEL_12:
}

- (BOOL)processInReport:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (v6 && v7)
  {
    id v10 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__ACCFeaturePluginHIDProvider_processInReport_forUUID___block_invoke;
    v12[3] = &unk_2647D0018;
    v12[4] = self;
    id v13 = v8;
    long long v15 = &v16;
    id v14 = v6;
    dispatch_sync(v10, v12);

    BOOL v9 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __55__ACCFeaturePluginHIDProvider_processInReport_forUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v7 hidDeviceUUIDStr];
        BOOL v9 = *(void **)(a1 + 40);

        if (v8 == v9) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 handleInReport:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (BOOL)processGetReportResponse:(id)a3 reportType:(unsigned __int8)a4 reportID:(unsigned __int8)a5 forUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v12 = v11;
  BOOL v13 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (v10 && v11)
  {
    id v14 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ACCFeaturePluginHIDProvider_processGetReportResponse_reportType_reportID_forUUID___block_invoke;
    block[3] = &unk_2647D0040;
    void block[4] = self;
    id v17 = v12;
    char v19 = &v22;
    unsigned __int8 v20 = a4;
    unsigned __int8 v21 = a5;
    id v18 = v10;
    dispatch_sync(v14, block);

    BOOL v13 = *((unsigned char *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __84__ACCFeaturePluginHIDProvider_processGetReportResponse_reportType_reportID_forUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v7 hidDeviceUUIDStr];
        BOOL v9 = *(void **)(a1 + 40);

        if (v8 == v9) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 handleGetReportResponse:*(unsigned __int8 *)(a1 + 64) reportID:*(unsigned __int8 *)(a1 + 65) report:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)getDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  if (v4)
  {
    uint64_t v5 = [(ACCFeaturePluginHIDProvider *)self hidProviderLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__ACCFeaturePluginHIDProvider_getDescriptor___block_invoke;
    block[3] = &unk_2647CFFF0;
    void block[4] = self;
    id v10 = v4;
    long long v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__ACCFeaturePluginHIDProvider_getDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [v7 hidDeviceUUIDStr];
        BOOL v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSMutableArray)descriptorUUIDs
{
  return self->_descriptorUUIDs;
}

- (void)setDescriptorUUIDs:(id)a3
{
}

- (AccessoryHIDClient)hidClient
{
  return (AccessoryHIDClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHidClient:(id)a3
{
}

- (OS_dispatch_queue)hidProviderLock
{
  return self->_hidProviderLock;
}

- (void)setHidProviderLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidProviderLock, 0);
  objc_storeStrong((id *)&self->_hidClient, 0);
  objc_storeStrong((id *)&self->_descriptorUUIDs, 0);
}

@end