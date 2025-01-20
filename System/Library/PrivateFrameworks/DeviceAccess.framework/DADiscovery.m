@interface DADiscovery
- (BOOL)direct;
- (BOOL)runningExtension;
- (DAAppContext)appContext;
- (DADiscovery)init;
- (DADiscovery)initWithConfiguration:(id)a3 error:(id *)a4;
- (DADiscovery)initWithConfigurations:(id)a3 error:(id *)a4;
- (DADiscovery)initWithXPCObject:(id)a3 error:(id *)a4;
- (DADiscoveryConfiguration)configuration;
- (NSArray)configurations;
- (NSArray)discoveredDevices;
- (NSString)bundleID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (OS_xpc_object)xpcListenerEndpoint;
- (double)activateTimeInterval;
- (id)_ensureXPCStarted;
- (id)_uuidFromExtension:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (unint64_t)flags;
- (unsigned)clientID;
- (void)_activateDirect;
- (void)_activateExtension:(id)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_findExtensionPoint:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6;
- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportASKEvent:(id)a3;
- (void)_reportEvent:(id)a3;
- (void)_reportEventType:(int64_t)a3;
- (void)_startExtensions:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6;
- (void)_stopExtensons;
- (void)_updateNEPolicy:(id)a3 remove:(BOOL)a4;
- (void)_xpcReceivedDAEvent:(id)a3;
- (void)_xpcReceivedDeviceEvent:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activate;
- (void)encodeWithXPCObject:(id)a3;
- (void)finishMigration;
- (void)getAuthorizedDevices:(id)a3;
- (void)invalidate;
- (void)invalidateWithReason:(unint64_t)a3;
- (void)migrateDevices;
- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5;
- (void)reportDeviceChanged:(id)a3 appID:(id)a4;
- (void)respondToBluetoothPairingRequest:(id)a3 completionHandler:(id)a4;
- (void)setActivateTimeInterval:(double)a3;
- (void)setAppContext:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5;
- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6;
- (void)setXpcCnx:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation DADiscovery

- (DADiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)DADiscovery;
  v2 = [(DADiscovery *)&v5 init];
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v2->_lock._os_unfair_lock_opaque = 0;
    v3 = v2;
  }

  return v2;
}

- (DADiscovery)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(DADiscovery *)self init];
  if (v13)
  {
    uint64_t v14 = [v6 copy];
    configuration = v13->_configuration;
    v13->_configuration = (DADiscoveryConfiguration *)v14;

    v16 = v13;
  }
  else if (a4)
  {
    DAErrorF(350000, (uint64_t)"init failed", v7, v8, v9, v10, v11, v12, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (DADiscovery)initWithConfigurations:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(DADiscovery *)self init];
  if (v13)
  {
    uint64_t v14 = [v6 copy];
    configurations = v13->_configurations;
    v13->_configurations = (NSArray *)v14;

    v16 = v13;
  }
  else if (a4)
  {
    DAErrorF(350000, (uint64_t)"init failed", v7, v8, v9, v10, v11, v12, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (DADiscovery)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(DADiscovery *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_19;
    }
    uint64_t v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_18:
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_19;
    }
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_18;
  }
  CUXPCDecodeNSString();
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5) {
      goto LABEL_6;
    }
LABEL_19:
    v15 = 0;
    goto LABEL_13;
  }
  v7->_clientID = 0;
LABEL_6:
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_19;
  }
  if (!v7->_configuration)
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (!v7->_configuration && !v7->_configurations) {
      goto LABEL_19;
    }
  }
  if (CUXPCDecodeUInt64RangedEx() == 6) {
    v7->_flags = 0;
  }
  v15 = v7;
LABEL_13:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  v4 = [(NSString *)self->_bundleID UTF8String];
  if (v4) {
    xpc_dictionary_set_string(xdict, "bndI", v4);
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfObjects();
  xpc_dictionary_set_uint64(xdict, "dsFs", self->_flags);
}

- (id)description
{
  return [(DADiscovery *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  uint64_t v4 = objc_opt_class();
  uint64_t clientID = self->_clientID;
  bundleID = self->_bundleID;
  uint64_t v20 = v4;
  NSAppendPrintF();
  id v5 = 0;
  id v6 = v5;
  extensions = self->_extensions;
  if (extensions)
  {
    id v30 = v5;
    uint64_t v8 = extensions;
    [(NSMutableSet *)v8 count];
    NSAppendPrintF();
    id v9 = v30;

    id v6 = v9;
  }
  configuration = self->_configuration;
  if (configuration)
  {
    id v29 = v6;
    uint64_t v21 = configuration;
    NSAppendPrintF();
    id v11 = v6;

    id v6 = v11;
  }
  uint64_t v12 = self->_configurations;
  uint64_t v13 = v12;
  if (v12)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        uint64_t v18 = v6;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
          NSAppendPrintF();
          id v6 = v18;

          ++v17;
          uint64_t v18 = v6;
        }
        while (v15 != v17);
        uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v32, 16, v22);
      }
      while (v15);
    }
  }

  return v6;
}

- (NSArray)discoveredDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceMap = self->_deviceMap;
  if (deviceMap)
  {
    id v5 = [(NSMutableDictionary *)deviceMap allValues];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (BOOL)runningExtension
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_extensions;
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = [(NSMutableSet *)v4 count];

  return v5 != 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__DADiscovery_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__DADiscovery_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    v3 = *(unsigned char **)(v1 + 32);
    if (v3[56])
    {
      return [v3 _activateDirect];
    }
    else
    {
      return [v3 _activateXPCStart:0];
    }
  }
  return result;
}

- (void)_activateDirect
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = self;
    LogPrintF();
  }
  v3 = [(DADiscoveryConfiguration *)self->_configuration bundleID];
  bundleID = v3;
  if (!v3) {
    bundleID = self->_bundleID;
  }
  uint64_t v5 = bundleID;

  self->_activateTimeInterval = CFAbsoluteTimeGetCurrent();
  if (v5)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __30__DADiscovery__activateDirect__block_invoke;
    v18[3] = &unk_264520580;
    v18[4] = self;
    [(DADiscovery *)self _findExtensionPoint:@"com.apple.discovery-extension" bundleID:v5 entitlement:@"com.apple.developer.media-device-discovery-extension" completion:v18];
    if ((self->_flags & 4) != 0)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __30__DADiscovery__activateDirect__block_invoke_2;
      v16[3] = &unk_2645205A8;
      v16[4] = self;
      uint64_t v17 = v5;
      [(DADiscovery *)self _findExtensionPoint:@"com.apple.accessory-setup-extension" bundleID:v17 entitlement:@"com.apple.developer.accessory-setup-discovery-extension" completion:v16];
    }
  }
  else
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v12 = DAErrorF(350001, (uint64_t)"Bundle does not exist", v6, v7, v8, v9, v10, v11, v15);
    uint64_t v13 = [[DAEvent alloc] initWithEventType:10 error:v12];
    [(DADiscovery *)self _reportEvent:v13];
  }
}

void __30__DADiscovery__activateDirect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _activateExtension:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __30__DADiscovery__activateDirect__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(a1 + 32) _activateExtension:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
    goto LABEL_9;
  }
  uint64_t v15 = *(void **)(a1 + 32);
  if (!v15[11] && !v15[12])
  {
    DAErrorF(350001, (uint64_t)"Extension or configurations not available on %@", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 40));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = [[DAEvent alloc] initWithEventType:32 error:v10];
    [v16 _reportEvent:v17];

LABEL_9:
    goto LABEL_10;
  }
  if (([v15 flags] & 8) != 0) {
    [(id)gDADaemonServer runMigrationWithDiscovery:*(void *)(a1 + 32)];
  }
  else {
    [(id)gDADaemonServer runSystemDiscovery];
  }
LABEL_10:
}

- (void)migrateDevices
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__DADiscovery_migrateDevices__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__DADiscovery_migrateDevices__block_invoke(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finishMigration];
}

- (void)finishMigration
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  [(DADiscovery *)self encodeWithXPCObject:xdict];
  xpc_dictionary_set_string(xdict, "mTyp", "DscM");
  id v3 = [(DADiscovery *)self _ensureXPCStarted];
  xpc_connection_send_message_with_reply(v3, xdict, (dispatch_queue_t)self->_dispatchQueue, &__block_literal_global);
}

uint64_t __30__DADiscovery_finishMigration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_DADiscovery <= 30)
  {
    id v5 = v2;
    if (gLogCategory_DADiscovery != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_activateExtension:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(DADiscoveryExtension);
  [(DADiscoveryExtension *)v5 setDispatchQueue:self->_dispatchQueue];
  [(DADiscoveryExtension *)v5 setEkExtension:v4];

  [(DADiscoveryExtension *)v5 setParent:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__DADiscovery__activateExtension___block_invoke;
  v10[3] = &unk_264520418;
  v10[4] = self;
  v10[5] = v5;
  [(DADiscoveryExtension *)v5 setInvalidationHandler:v10];
  extensions = self->_extensions;
  if (!extensions)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v8 = self->_extensions;
    self->_extensions = v7;

    extensions = self->_extensions;
  }
  [(NSMutableSet *)extensions addObject:v5];
  uint64_t v9 = [(DADiscovery *)self _uuidFromExtension:v5];
  if (v9) {
    [(DADiscovery *)self _updateNEPolicy:v9 remove:0];
  }
  [(DADiscoveryExtension *)v5 activate];
}

uint64_t __34__DADiscovery__activateExtension___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _invalidated];
}

- (void)_activateXPCStart:(BOOL)a3
{
  if (a3)
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (gLogCategory_DADiscovery <= 30 {
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [(DADiscovery *)self encodeWithXPCObject:v4];
  xpc_dictionary_set_string(v4, "mTyp", "DscA");
  id v5 = [(DADiscovery *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __33__DADiscovery__activateXPCStart___block_invoke;
  handler[3] = &unk_2645205F0;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);
}

uint64_t __33__DADiscovery__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__DADiscovery__activateXPCCompleted___block_invoke;
  aBlock[3] = &unk_264520618;
  aBlock[4] = self;
  aBlock[5] = &v33;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v6 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v7 = (void *)v34[5];
  v34[5] = v6;

  if (!v34[5])
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = self;
      LogPrintF();
    }
    id v31 = 0;
    if (![(DADiscoveryConfiguration *)self->_configuration presenceOnly])
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
    }
    if ([v31 count])
    {
      os_unfair_lock_lock(&self->_lock);
      if (!self->_deviceMap)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        deviceMap = self->_deviceMap;
        self->_deviceMap = v8;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = v31;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v15 = [v14 identifier];
            if (v15) {
              [(NSMutableDictionary *)self->_deviceMap setObject:v14 forKeyedSubscript:v15];
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v40 count:16];
        }
        while (v11);
      }

      os_unfair_lock_unlock(&self->_lock);
    }
    [(DADiscovery *)self _reportEventType:10];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v31;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:*(void *)(*((void *)&v23 + 1) + 8 * j)];
          [(DADiscovery *)self _reportEvent:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v39 count:16];
      }
      while (v17);
    }

    if (xpc_dictionary_get_BOOL(v4, "dvPr"))
    {
      long long v21 = [[DAEventDevicesPresent alloc] initWithPresent:1 devicesMigrated:0];
      [(DADiscovery *)self _reportEvent:v21];
    }
  }
  v5[2](v5);

  _Block_object_dispose(&v33, 8);
}

void __37__DADiscovery__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      id v3 = CUPrintNSError();
      LogPrintF();
    }
    id v2 = *(void **)(a1 + 32);
    id v4 = [[DAEvent alloc] initWithEventType:10 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v2 _reportEvent:v4];
  }
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  id v4 = self->_xpcCnx;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = self->_xpcListenerEndpoint;
    uint64_t v7 = v6;
    if (v6)
    {
      mach_service = xpc_connection_create_from_endpoint(v6);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __32__DADiscovery__ensureXPCStarted__block_invoke;
    handler[3] = &unk_2645205F0;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    id v5 = mach_service;
  }

  return v5;
}

uint64_t __32__DADiscovery__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcReceivedMessage:a2];
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      id v3 = self;
      LogPrintF();
    }
    -[DADiscovery _reportEventType:](self, "_reportEventType:", 60, v3);
    [(DADiscovery *)self _activateXPCStart:1];
  }
}

- (void)invalidate
{
  [(id)gDADaemonServer runSystemDiscovery];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__DADiscovery_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DADiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 32) = 1;
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = *(void *)(v2 + 32);
      LogPrintF();
    }
    id v3 = *(_xpc_connection_s **)(*(void *)(v2 + 32) + 48);
    if (v3) {
      xpc_connection_cancel(v3);
    }
    objc_msgSend(*(id *)(v2 + 32), "_stopExtensons", v5);
    id v4 = *(void **)(v2 + 32);
    return [v4 _invalidated];
  }
  return result;
}

- (void)invalidateWithReason:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__DADiscovery_invalidateWithReason___block_invoke;
  v4[3] = &unk_264520640;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __36__DADiscovery_invalidateWithReason___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    if (gLogCategory_DADiscovery <= 50 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      LogPrintF();
    }
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "mTyp", "DsSp");
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      xpc_dictionary_set_uint64(v2, "DSpRn", v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v7);
    id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 64);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __36__DADiscovery_invalidateWithReason___block_invoke_2;
    handler[3] = &unk_2645205F0;
    handler[4] = v5;
    xpc_connection_send_message_with_reply(v4, v2, v6, handler);
  }
}

void __36__DADiscovery_invalidateWithReason___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v2 = CUPrintNSError();
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v2);
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableSet *)self->_extensions count]
    && !self->_xpcCnx)
  {
    [(DADiscovery *)self _reportEventType:20];
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_reportEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = _Block_copy(self->_eventHandler);
  uint64_t v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (void)_reportASKEvent:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 device];
  if (!v5) {
    goto LABEL_34;
  }
  id v6 = [(DADiscoveryConfiguration *)self->_configuration bundleID];
  bundleID = v6;
  if (!v6) {
    bundleID = self->_bundleID;
  }
  uint64_t v8 = bundleID;

  uint64_t v9 = [(id)gDADaemonServer getDevicesWithFlags:8 appID:v8];
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    id v31 = v9;
    LogPrintF();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v35;
  v32 = self;
  id v33 = v4;
  while (2)
  {
    uint64_t v14 = v8;
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      uint64_t v17 = objc_msgSend(v16, "bluetoothIdentifier", v31);
      uint64_t v18 = [v5 bluetoothIdentifier];
      int v19 = [v17 isEqual:v18];

      if (v19)
      {
        long long v23 = v10;
        uint64_t v8 = v14;
        id v4 = v33;
        if (gLogCategory_DADiscovery > 90) {
          goto LABEL_33;
        }
        if (gLogCategory_DADiscovery == -1)
        {
          long long v23 = v10;
          if (!_LogCategory_Initialize()) {
            goto LABEL_33;
          }
        }
LABEL_28:
        LogPrintF();
        long long v23 = v10;
        goto LABEL_33;
      }
      long long v20 = [v16 SSID];
      long long v21 = [v5 SSID];
      int v22 = [v20 isEqual:v21];

      if (v22)
      {
        long long v23 = v10;
        uint64_t v8 = v14;
        id v4 = v33;
        if (gLogCategory_DADiscovery > 90) {
          goto LABEL_33;
        }
        if (gLogCategory_DADiscovery == -1)
        {
          long long v23 = v10;
          if (!_LogCategory_Initialize()) {
            goto LABEL_33;
          }
        }
        goto LABEL_28;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v8 = v14;
    self = v32;
    id v4 = v33;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_17:

  long long v23 = [v5 identifier];
  if (v23)
  {
    [v5 setFlags:8];
    long long v24 = [v5 discoveryConfiguration];

    if (!v24)
    {
      long long v25 = objc_alloc_init(DADiscoveryConfiguration);
      [(DADiscoveryConfiguration *)v25 setBundleID:v8];
      long long v26 = [v5 identifier];
      [(DADiscoveryConfiguration *)v25 setAssociationIdentifier:v26];

      long long v27 = [v5 name];
      [(DADiscoveryConfiguration *)v25 setDisplayName:v27];

      -[DADiscoveryConfiguration setAllowsBluetoothPairing:](v25, "setAllowsBluetoothPairing:", [v5 allowPairing]);
      long long v28 = [v5 bluetoothIdentifier];
      [(DADiscoveryConfiguration *)v25 setBluetoothIdentifier:v28];

      [v5 setDiscoveryConfiguration:v25];
    }
    objc_msgSend(v5, "setDiscoveredInExtension:", 1, v31);
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v29 = _Block_copy(self->_eventHandler);
    long long v30 = v29;
    if (v29) {
      (*((void (**)(void *, id))v29 + 2))(v29, v4);
    }
  }
LABEL_33:

LABEL_34:
}

- (void)_reportEventType:(int64_t)a3
{
  id v4 = [[DAEvent alloc] initWithEventType:a3];
  [(DADiscovery *)self _reportEvent:v4];
}

- (void)getAuthorizedDevices:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__DADiscovery_getAuthorizedDevices___block_invoke;
  v7[3] = &unk_264520508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__DADiscovery_getAuthorizedDevices___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GADv");
  id v3 = objc_alloc_init(DASession);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 88) bundleID];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  [(DASession *)v3 setBundleID:v5];

  [(DASession *)v3 setClientID:*(unsigned int *)(*(void *)(a1 + 32) + 60)];
  CUXPCEncodeObject();
  id v6 = [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__DADiscovery_getAuthorizedDevices___block_invoke_2;
  v9[3] = &unk_264520668;
  v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  xpc_connection_send_message_with_reply(v6, v2, v8, v9);
}

uint64_t __36__DADiscovery_getAuthorizedDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getAuthorizedDevicesCompleted:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  int v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__DADiscovery__getAuthorizedDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_264520690;
  uint64_t v14 = &v15;
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = CUXPCDecodeNSErrorIfNeeded();
  id v10 = (void *)v16[5];
  void v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = CUPrintNSObjectOneLine();
      LogPrintF();
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __64__DADiscovery__getAuthorizedDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF();
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)respondToBluetoothPairingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke;
  block[3] = &unk_2645206E0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 50 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "BTPM");
  xpc_dictionary_set_string(v2, "mSTyp", "BTPRsp");
  CUXPCEncodeObject();
  id v3 = [*(id *)(a1 + 40) _ensureXPCStarted];
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 64);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke_2;
  handler[3] = &unk_2645206B8;
  id v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);
}

uint64_t __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v7 = v2;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = v7, v3))
    {
      id v6 = CUPrintNSError();
      LogPrintF();

      uint64_t v2 = v7;
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v7);
    uint64_t v2 = v7;
  }

  return MEMORY[0x270F9A758](v4, v2);
}

- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5
{
}

- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke;
  v14[3] = &unk_264520730;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  int64_t v18 = a3;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(dispatchQueue, v14);
}

void __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    DADeviceStateToString(*(void *)(a1 + 56));
    v13 = uint64_t v12 = v2;
    LogPrintF();
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v3, "dvSt", *(void *)(a1 + 56));
  uint64_t v4 = objc_alloc_init(DASession);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 88) bundleID];
  id v6 = v5;
  if (!v5) {
    id v6 = *(void **)(*(void *)(a1 + 40) + 120);
  }
  -[DASession setBundleID:](v4, "setBundleID:", v6, v12, v13);

  [(DASession *)v4 setClientID:*(unsigned int *)(*(void *)(a1 + 40) + 60)];
  CUXPCEncodeObject();
  uint64_t v7 = [*(id *)(a1 + 40) _ensureXPCStarted];
  id v8 = *(NSObject **)(*(void *)(a1 + 40) + 64);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke_2;
  handler[3] = &unk_264520708;
  id v9 = *(id *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v15 = v9;
  uint64_t v17 = v10;
  id v16 = v11;
  xpc_connection_send_message_with_reply(v7, v3, v8, handler);
}

void __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v3 = DADeviceStateToString(*(void *)(a1 + 48));
    uint64_t v4 = CUPrintNSError();
    LogPrintF();
  }
  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v2);
}

- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke;
  v15[3] = &unk_264520758;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

void __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke(id *a1)
{
  if (([a1[4] flags] & 8) != 0)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "mTyp", "SAAi");
    id v9 = objc_alloc_init(DASession);
    id v10 = [*((id *)a1[5] + 11) bundleID];
    uint64_t v11 = v10;
    if (!v10) {
      uint64_t v11 = (void *)*((void *)a1[5] + 15);
    }
    [(DASession *)v9 setBundleID:v11];

    [(DASession *)v9 setClientID:*((unsigned int *)a1[5] + 15)];
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    id v12 = [a1[5] _ensureXPCStarted];
    id v13 = *((void *)a1[5] + 8);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2;
    handler[3] = &unk_264520668;
    id v18 = a1[6];
    id v19 = a1[7];
    xpc_connection_send_message_with_reply(v12, v8, v13, handler);
  }
  else
  {
    id v14 = (void (**)(id, id))a1[7];
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v2, v3, v4, v5, v6, v7, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16);
  }
}

void __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  id v5 = (id)v2;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = (uint64_t)v5, v3))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF();

      uint64_t v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2);
}

- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke;
  v15[3] = &unk_264520780;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int v3 = objc_alloc_init(DASession);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) bundleID];
  id v5 = v4;
  if (!v4) {
    id v5 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  [(DASession *)v3 setBundleID:v5];

  [(DASession *)v3 setClientID:*(unsigned int *)(*(void *)(a1 + 32) + 60)];
  xpc_dictionary_set_string(v2, "mTyp", "MdSt");
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = v2;
  id v8 = (const char *)[v6 UTF8String];
  if (v8) {
    xpc_dictionary_set_string(v7, "id", v8);
  }

  CUXPCEncodeObject();
  CUXPCEncodeObject();
  id v9 = [*(id *)(a1 + 32) _ensureXPCStarted];
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2;
  handler[3] = &unk_2645206B8;
  id v12 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v9, v7, v10, handler);
}

void __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reportDeviceChanged:(id)a3 appID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:42 device:v5];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_extensions;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "reportEventToExtension:", v6, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (gLogCategory_DADiscovery <= 9)
  {
    if (gLogCategory_DADiscovery != -1 || (int v5 = _LogCategory_Initialize(), v4 = v18, v5))
    {
      CUPrintXPC();
      v16 = long long v15 = self;
      LogPrintF();

      id v4 = v18;
    }
  }
  if (MEMORY[0x223C529E0](v4) == MEMORY[0x263EF8708])
  {
    [(DADiscovery *)self _xpcReceivedMessage:v18];
  }
  else if (v18 == (id)MEMORY[0x263EF86A0])
  {
    [(DADiscovery *)self _interrupted];
  }
  else if (v18 == (id)MEMORY[0x263EF86A8])
  {
    if (!self->_invalidateCalled
      && gLogCategory_DADiscovery <= 90
      && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    [(DADiscovery *)self _invalidated];
  }
  else
  {
    long long v12 = DAErrorF(350000, (uint64_t)"XPC event error", v6, v7, v8, v9, v10, v11, (uint64_t)v15);
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      long long v13 = CUPrintNSError();
      uint64_t v17 = CUPrintXPC();
      LogPrintF();
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "mTyp");
  if (string)
  {
    if (!strcmp(string, "Evnt"))
    {
      [(DADiscovery *)self _xpcReceivedDAEvent:v5];
    }
    else if (gLogCategory_DADiscovery <= 90 {
           && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    }
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_DADiscovery <= 90 {
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_8;
  }
}

- (void)_xpcReceivedDAEvent:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x223C529E0]() == MEMORY[0x263EF8708])
  {
    id v11 = 0;
    id v5 = +[DAEvent allocInitWithXPCObject:v4 error:&v11];
    id v6 = v11;
    if (!v5)
    {
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      {
        uint64_t v10 = CUPrintNSError();
        LogPrintF();
      }
      goto LABEL_14;
    }
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      id v9 = v5;
      LogPrintF();
    }
    if ((unint64_t)(objc_msgSend(v5, "eventType", v9) - 40) <= 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (gLogCategory_DADiscovery <= 90
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_14;
        }
      }
      [(DADiscovery *)self _xpcReceivedDeviceEvent:v5];
    }
    uint64_t v7 = _Block_copy(self->_eventHandler);
    uint64_t v8 = v7;
    if (v7) {
      (*((void (**)(void *, id))v7 + 2))(v7, v5);
    }

LABEL_14:
    goto LABEL_15;
  }
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:
}

- (void)_xpcReceivedDeviceEvent:(id)a3
{
  id v9 = a3;
  id v4 = [v9 device];
  id v5 = [v4 identifier];
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_deviceMap)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      deviceMap = self->_deviceMap;
      self->_deviceMap = v6;
    }
    if ([v9 eventType] == 41) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v4;
    }
    [(NSMutableDictionary *)self->_deviceMap setObject:v8 forKeyedSubscript:v5];
    os_unfair_lock_unlock(&self->_lock);
  }
  else if (gLogCategory_DADiscovery <= 90 {
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_findExtensionPoint:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:v10];
  long long v15 = (void *)MEMORY[0x263F04DF0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke;
  v20[3] = &unk_2645207D0;
  v20[4] = self;
  id v21 = v10;
  id v23 = v12;
  id v24 = v13;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  id v19 = v10;
  [v15 executeQuery:v14 completionHandler:v20];
}

void __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke_2;
  v6[3] = &unk_2645207A8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(a1 + 40) count];
    LogPrintF();
  }
  if (*(unsigned char *)(*(void *)(a1 + 48) + 32) || ![*(id *)(a1 + 40) count])
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    return [v4 _startExtensions:v5 bundleID:v6 entitlement:v7 completion:v8];
  }
}

- (void)_startExtensions:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v25 = (void (**)(id, void *))a6;
  long long v26 = [MEMORY[0x263EFF980] array];
  id v12 = v10;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "bundleIdentifier", v23, v24);
        id v20 = [v19 stringByDeletingPathExtension];

        if (v12 && ([v20 isEqual:v12] & 1) == 0)
        {
          if (gLogCategory_DADiscovery <= 30
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            id v23 = v12;
            id v24 = v20;
            LogPrintF();
          }
        }
        else
        {
          id v21 = [v18 entitlementNamed:v11 ofClass:objc_opt_class()];
          char v22 = [v21 BOOLValue];

          if (v22)
          {
            [v26 addObject:v18];
          }
          else if (gLogCategory_DADiscovery <= 30 {
                 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          }
          {
            id v23 = [v18 bundleIdentifier];
            LogPrintF();
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  if (v25) {
    v25[2](v25, v26);
  }
}

- (void)_stopExtensons
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_extensions;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = -[DADiscovery _uuidFromExtension:](self, "_uuidFromExtension:", v8, (void)v10);
        if (v9) {
          [(DADiscovery *)self _updateNEPolicy:v9 remove:1];
        }
        [v8 invalidate];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateNEPolicy:(id)a3 remove:(BOOL)a4
{
  BOOL v4 = a4;
  v120[3] = *MEMORY[0x263EF8340];
  id v106 = a3;
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    id v89 = v106;
    LogPrintF();
  }
  if (v106)
  {
    if (v4)
    {
      policySessions = self->_policySessions;
      uint64_t v7 = [v106 UUIDString];
      id v8 = [(NSMutableDictionary *)policySessions objectForKeyedSubscript:v7];

      if (v8)
      {
        if (([v8 removeAllPolicies] & 1) == 0
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v89 = v106;
          LogPrintF();
        }
        if ((objc_msgSend(v8, "apply", v89) & 1) == 0
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v90 = v106;
          LogPrintF();
        }
        uint64_t v16 = self->_policySessions;
        id v17 = objc_msgSend(v106, "UUIDString", v90);
        [(NSMutableDictionary *)v16 setObject:0 forKeyedSubscript:v17];

        if (gLogCategory_DADiscovery <= 30
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v91 = CUPrintNSObjectOneLine();
          LogPrintF();
        }
        goto LABEL_84;
      }
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
        goto LABEL_94;
      }
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x263F14618]);
      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x263F14600]);
        long long v10 = [MEMORY[0x263F14610] skipWithOrder:20];
        long long v11 = [MEMORY[0x263F14608] allInterfaces];
        v120[0] = v11;
        long long v12 = [MEMORY[0x263F14608] customEntitlement:@"com.apple.developer.media-device-discovery-extension"];
        v120[1] = v12;
        long long v13 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v120[2] = v13;
        uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:3];
        uint64_t v15 = [v9 initWithOrder:0 result:v10 conditions:v14];

        v102 = (void *)v15;
        if (![v8 addPolicy:v15]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v89 = v106;
          LogPrintF();
        }
        id v18 = objc_alloc(MEMORY[0x263F14600]);
        id v19 = [MEMORY[0x263F14610] skipWithOrder:100];
        id v20 = [MEMORY[0x263F14608] allInterfaces];
        v119[0] = v20;
        id v21 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v119[1] = v21;
        char v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
        uint64_t v23 = [v18 initWithOrder:10 result:v19 conditions:v22];

        v101 = (void *)v23;
        if (![v8 addPolicy:v23]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v89 = v106;
          LogPrintF();
        }
        v103 = self;
        id v24 = objc_alloc(MEMORY[0x263F14600]);
        long long v25 = [MEMORY[0x263F14610] skipWithOrder:65];
        long long v26 = [MEMORY[0x263F14608] allInterfaces];
        v118[0] = v26;
        long long v27 = [MEMORY[0x263F14608] schemeUsingPort:53];
        v118[1] = v27;
        long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:2];
        uint64_t v29 = [v24 initWithOrder:25 result:v25 conditions:v28];

        v100 = (void *)v29;
        if (![v8 addPolicy:v29]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v89 = v106;
          LogPrintF();
        }
        long long v30 = (void *)MEMORY[0x263F14608];
        id v31 = objc_msgSend(MEMORY[0x263F143F0], "endpointWithHostname:port:", @"224.0.0.0", @"0", v89);
        v104 = [v30 remoteAddress:v31 prefix:4];

        uint64_t v32 = (void *)MEMORY[0x263F14608];
        id v33 = [MEMORY[0x263F143F0] endpointWithHostname:@"ff00::" port:@"0"];
        uint64_t v34 = [v32 remoteAddress:v33 prefix:8];

        long long v35 = (void *)MEMORY[0x263F14608];
        long long v36 = [MEMORY[0x263F143F0] endpointWithHostname:@"255.255.255.255" port:@"0"];
        uint64_t v37 = [v35 remoteAddress:v36 prefix:32];

        id v38 = (void *)MEMORY[0x263F14608];
        uint64_t v39 = [MEMORY[0x263F143F0] endpointWithHostname:@"224.0.0.0" port:@"0"];
        uint64_t v40 = [v38 localAddress:v39 prefix:4];

        uint64_t v41 = (void *)MEMORY[0x263F14608];
        v42 = [MEMORY[0x263F143F0] endpointWithHostname:@"ff00::" port:@"0"];
        uint64_t v43 = [v41 localAddress:v42 prefix:8];

        v44 = (void *)MEMORY[0x263F14608];
        v45 = [MEMORY[0x263F143F0] endpointWithHostname:@"255.255.255.255" port:@"0"];
        uint64_t v46 = [v44 localAddress:v45 prefix:32];

        v117[0] = v104;
        v117[1] = v34;
        v98 = (void *)v37;
        v99 = (void *)v34;
        v117[2] = v37;
        v117[3] = v40;
        v96 = (void *)v43;
        v97 = (void *)v40;
        v117[4] = v43;
        v117[5] = v46;
        v95 = (void *)v46;
        [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:6];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = [obj countByEnumeratingWithState:&v107 objects:v116 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v108;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v108 != v49) {
                objc_enumerationMutation(obj);
              }
              uint64_t v51 = *(void *)(*((void *)&v107 + 1) + 8 * i);
              id v52 = objc_alloc(MEMORY[0x263F14600]);
              v53 = [MEMORY[0x263F14610] skipWithOrder:50];
              v54 = [MEMORY[0x263F14608] allInterfaces];
              v115[0] = v54;
              v55 = [MEMORY[0x263F14608] effectiveApplication:v106];
              v115[1] = v55;
              v115[2] = v51;
              v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:3];
              v57 = (void *)[v52 initWithOrder:30 result:v53 conditions:v56];

              if (![v8 addPolicy:v57]
                && gLogCategory_DADiscovery <= 90
                && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
              {
                id v92 = v106;
                LogPrintF();
              }
            }
            uint64_t v48 = [obj countByEnumeratingWithState:&v107 objects:v116 count:16];
          }
          while (v48);
        }

        id v58 = objc_alloc(MEMORY[0x263F14600]);
        v59 = [MEMORY[0x263F14610] skipWithOrder:100];
        v60 = [MEMORY[0x263F14608] allInterfaces];
        v114[0] = v60;
        v61 = [MEMORY[0x263F14608] localNetworks];
        v114[1] = v61;
        v62 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v114[2] = v62;
        v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:3];
        v64 = (void *)[v58 initWithOrder:35 result:v59 conditions:v63];

        if (![v8 addPolicy:v64]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v92 = v106;
          LogPrintF();
        }
        id v65 = objc_alloc(MEMORY[0x263F14600]);
        v66 = [MEMORY[0x263F14610] drop];
        v67 = [MEMORY[0x263F14608] allInterfaces];
        v113[0] = v67;
        v68 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v113[1] = v68;
        v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:2];
        uint64_t v70 = [v65 initWithOrder:40 result:v66 conditions:v69];

        v94 = (void *)v70;
        if (![v8 addPolicy:v70]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v92 = v106;
          LogPrintF();
        }
        id v71 = objc_alloc(MEMORY[0x263F14600]);
        v72 = [MEMORY[0x263F14610] skipWithOrder:100];
        v73 = [MEMORY[0x263F14608] allInterfaces];
        v112[0] = v73;
        v74 = [MEMORY[0x263F14608] customEntitlement:@"com.apple.developer.networking.multicast"];
        v112[1] = v74;
        v75 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v112[2] = v75;
        v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:3];
        uint64_t v77 = [v71 initWithOrder:60 result:v72 conditions:v76];

        v78 = (void *)v77;
        if (![v8 addPolicy:v77]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v92 = v106;
          LogPrintF();
        }
        id v79 = objc_alloc(MEMORY[0x263F14600]);
        v80 = [MEMORY[0x263F14610] drop];
        v81 = [MEMORY[0x263F14608] allInterfaces];
        v111[0] = v81;
        v82 = [MEMORY[0x263F14608] effectiveApplication:v106];
        v111[1] = v82;
        v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
        v84 = (void *)[v79 initWithOrder:70 result:v80 conditions:v83];

        if (![v8 addPolicy:v84]
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          id v92 = v106;
          LogPrintF();
        }
        if (objc_msgSend(v8, "apply", v92))
        {
          v85 = v103->_policySessions;
          if (!v85)
          {
            v86 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            v87 = v103->_policySessions;
            v103->_policySessions = v86;

            v85 = v103->_policySessions;
          }
          v88 = [v106 UUIDString];
          [(NSMutableDictionary *)v85 setObject:v8 forKeyedSubscript:v88];

          if (gLogCategory_DADiscovery <= 30
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            v93 = CUPrintNSObjectOneLine();
            LogPrintF();
          }
        }
        else if (gLogCategory_DADiscovery <= 90 {
               && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }

        goto LABEL_84;
      }
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
LABEL_94:
      }
        LogPrintF();
    }
LABEL_84:

    goto LABEL_85;
  }
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_85:
}

- (id)_uuidFromExtension:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  BOOL v4 = [v3 ekExtension];
  uint64_t v5 = [v4 bundleIdentifier];

  if (v5)
  {
    [v5 UTF8String];
    uint64_t v6 = NEHelperCacheCopyAppUUIDMapping();
    uint64_t v7 = (void *)v6;
    if (v6 && MEMORY[0x223C529E0](v6) == MEMORY[0x263EF86D8])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __34__DADiscovery__uuidFromExtension___block_invoke;
      applier[3] = &unk_2645207F8;
      applier[4] = &v11;
      xpc_array_apply(v7, applier);
    }
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __34__DADiscovery__uuidFromExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x223C529E0]() == MEMORY[0x263EF87A8])
  {
    bytes = xpc_uuid_get_bytes(v4);
    if (bytes)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:bytes];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }

  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (double)activateTimeInterval
{
  return self->_activateTimeInterval;
}

- (void)setActivateTimeInterval:(double)a3
{
  self->_activateTimeInterval = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (DADiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (DAAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_policySessions, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

@end