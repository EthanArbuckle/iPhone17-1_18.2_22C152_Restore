@interface DADeviceResolver
- (CUCoalescer)coalescer;
- (DADeviceResolver)init;
- (NSMutableSet)resolveOperations;
- (NSString)bundleID;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (void)_addEndpoint:(id)a3;
- (void)_ensureInitialized;
- (void)_evaluateEndpoints;
- (void)_groupEndpoint:(id)a3 matchedEndpoint:(id)a4;
- (void)_invalidated;
- (void)_removeEndpoint:(id)a3;
- (void)_reportDeviceWithSoloEndpoint:(id)a3;
- (void)_reportEvent:(id)a3;
- (void)_reportEventType:(int64_t)a3;
- (void)_selectEndpoint:(id)a3;
- (void)_startResolvingBonjourFullName:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5;
- (void)_startResolvingBonjourName:(const char *)a3 type:(const char *)a4 interfaceIndex:(unsigned int)a5 endpoint:(id)a6;
- (void)_startResolvingEndpoint:(id)a3;
- (void)_startResolvingHostname:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5;
- (void)_updateSelectedEndpoint:(id)a3;
- (void)addEndpoint:(id)a3;
- (void)invalidate;
- (void)removeEndpoint:(id)a3;
- (void)selectEndpoint:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setResolveOperations:(id)a3;
@end

@implementation DADeviceResolver

- (DADeviceResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)DADeviceResolver;
  v2 = [(DADeviceResolver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return [(DADeviceResolver *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 0x15u)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    v11[5] = 0;
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(NSMutableDictionary *)self->_devices count];
    uint64_t v10 = [(NSMutableDictionary *)self->_endpoints count];
    NSAppendPrintF();
    objc_storeStrong(&v17, 0);
    devices = self->_devices;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__DADeviceResolver_descriptionWithLevel___block_invoke;
    v11[3] = &unk_2645203F0;
    v11[4] = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v11, v5, v6, v10);
    v8 = (__CFString *)v13[5];
    if (!v8) {
      v8 = &stru_26D120818;
    }
    v4 = v8;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_opt_class();
    [(NSMutableDictionary *)self->_devices count];
    [(NSMutableDictionary *)self->_endpoints count];
    NSPrintF();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __41__DADeviceResolver_descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v5 endpoints];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v5 name];

  uint64_t v11 = [v7 count];
  NSAppendPrintF();

  objc_storeStrong((id *)(v8 + 40), obj);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__DADeviceResolver_descriptionWithLevel___block_invoke_2;
  v12[3] = &unk_2645203C8;
  v12[4] = *(void *)(a1 + 32);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12, v9, v6, v10, v11);
}

void __41__DADeviceResolver_descriptionWithLevel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  id v6 = a3;
  id v7 = a2;
  objc_opt_class();
  uint64_t v8 = [v6 airplayDeviceID];
  uint64_t v9 = [v6 bonjourName];
  uint64_t v10 = [v6 bonjourType];
  [v6 bonjourInterfaceIndex];
  uint64_t v11 = [v6 bonjourHostname];
  uint64_t v12 = [v6 ipv4String];
  [v6 selected];

  NSAppendPrintF();
  objc_storeStrong((id *)(v4 + 40), v5);
}

- (void)addEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__DADeviceResolver_addEndpoint___block_invoke;
  v7[3] = &unk_264520418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __32__DADeviceResolver_addEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addEndpoint:*(void *)(a1 + 40)];
}

- (void)_addEndpoint:(id)a3
{
  id v7 = a3;
  [(DADeviceResolver *)self _ensureInitialized];
  id v4 = [v7 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_endpoints objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(DAEndpoint);
      [(NSMutableDictionary *)self->_endpoints setObject:v5 forKeyedSubscript:v4];
    }
    [(DAEndpoint *)v5 updateWithEndpoint:v7];
    [(DAEndpoint *)v5 setAddTicks:mach_absolute_time()];
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      id v6 = v5;
      LogPrintF();
    }
    -[DADeviceResolver _startResolvingEndpoint:](self, "_startResolvingEndpoint:", v5, v6);
    [(CUCoalescer *)self->_coalescer trigger];
  }
  else if (gLogCategory_DADeviceResolver <= 90 {
         && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)removeEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__DADeviceResolver_removeEndpoint___block_invoke;
  v7[3] = &unk_264520418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__DADeviceResolver_removeEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeEndpoint:*(void *)(a1 + 40)];
}

- (void)_removeEndpoint:(id)a3
{
  id v15 = a3;
  [(DADeviceResolver *)self _ensureInitialized];
  id v4 = [v15 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_endpoints objectForKeyedSubscript:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_endpoints setObject:0 forKeyedSubscript:v4];
      id v6 = [v5 parentDevice];
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 endpoints];
        uint64_t v9 = (void *)[v8 mutableCopy];

        [v9 setObject:0 forKeyedSubscript:v4];
        [v7 setEndpoints:v9];
        if ([v9 count])
        {
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          uint64_t v10 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v7];
          uint64_t v11 = (DADeviceEvent *)_Block_copy(self->_eventHandler);
          uint64_t v12 = v11;
          if (v11) {
            ((void (*)(DADeviceEvent *, DADeviceEvent *))v11->super.super._error)(v11, v10);
          }
        }
        else
        {
          uint64_t v10 = [v7 identifier];
          if (v10) {
            [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v10];
          }
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          uint64_t v12 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:41 device:v7];
          v13 = _Block_copy(self->_eventHandler);
          uint64_t v14 = v13;
          if (v13) {
            (*((void (**)(void *, DADeviceEvent *))v13 + 2))(v13, v12);
          }
        }
      }
    }
  }
  else if (gLogCategory_DADeviceResolver <= 90 {
         && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)selectEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__DADeviceResolver_selectEndpoint___block_invoke;
  v7[3] = &unk_264520418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__DADeviceResolver_selectEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectEndpoint:*(void *)(a1 + 40)];
}

- (void)_selectEndpoint:(id)a3
{
  id v13 = a3;
  [(DADeviceResolver *)self _ensureInitialized];
  if (!v13)
  {
    uint64_t v9 = 0;
    id v7 = 0;
    id v5 = 0;
LABEL_7:
    if (self->_bundleID)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        id v12 = v13;
        LogPrintF();
      }
      uint64_t v10 = objc_msgSend(v7, "persistentDictionaryRepresentation", v12);
      if (v10) {
        uint64_t v11 = [[DAEndpoint alloc] initWithPersistentDictionaryRepresentation:v10 error:0];
      }
      else {
        uint64_t v11 = 0;
      }
      [(DADeviceResolver *)self _updateSelectedEndpoint:v11];
    }
    else if (gLogCategory_DADeviceResolver <= 90 {
           && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    goto LABEL_16;
  }
  uint64_t v4 = [v13 identifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(NSMutableDictionary *)self->_endpoints objectForKeyedSubscript:v4];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = [v6 protocolTypeString];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        goto LABEL_7;
      }
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = 0;
    }
    else
    {
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = 0;
      id v7 = 0;
    }
  }
  else
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = 0;
    id v7 = 0;
    id v5 = 0;
  }
LABEL_16:
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DADeviceResolver_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__DADeviceResolver_invalidate__block_invoke(uint64_t result)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 40) = 1;
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = *(void *)(v2 + 32);
      LogPrintF();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = *(id *)(*(void *)(v2 + 32) + 96);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "invalidate", v12);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    [*(id *)(*(void *)(v2 + 32) + 96) removeAllObjects];
    uint64_t v8 = *(void *)(v2 + 32);
    uint64_t v9 = *(_DNSServiceRef_t **)(v8 + 8);
    if (v9)
    {
      DNSServiceRefDeallocate(v9);
      *(void *)(*(void *)(v2 + 32) + 8) = 0;
      uint64_t v8 = *(void *)(v2 + 32);
    }
    objc_msgSend(*(id *)(v8 + 88), "invalidate", v12);
    uint64_t v10 = *(void *)(v2 + 32);
    uint64_t v11 = *(void **)(v10 + 88);
    *(void *)(v10 + 88) = 0;

    return [*(id *)(v2 + 32) _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    [(DADeviceResolver *)self _reportEventType:20];
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_ensureInitialized
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_prefsInitialized)
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefsInitialized = 1;
    int v32 = 0;
    BOOL v3 = CFPrefs_GetInt64() != 0;
    if (self->_prefNameBasedSelect != v3)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_prefNameBasedSelect = v3;
    }
    if (!self->_selectedEndpoints)
    {
      uint64_t v4 = [MEMORY[0x263EFF980] array];
      selectedEndpoints = self->_selectedEndpoints;
      self->_selectedEndpoints = v4;
    }
    uint64_t v6 = self->_bundleID;
    if (v6)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v7 = (void *)MEMORY[0x263EFF980];
      NSPrintF();
      CFArrayGetTypeID();
      uint64_t v8 = (void *)CFPrefs_CopyTypedValue();
      uint64_t v9 = objc_msgSend(v7, "arrayWithArray:", v8, v6);

      if (v32)
      {
        if (gLogCategory_DADeviceResolver <= 30
          && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        NSPrintF();
        CFDictionaryGetTypeID();
      }
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = [[DAEndpoint alloc] initWithPersistentDictionaryRepresentation:*(void *)(*((void *)&v28 + 1) + 8 * i) error:0];
            [(NSMutableArray *)self->_selectedEndpoints addObject:v15];
            if (!self->_selectedProtocolStr)
            {
              long long v16 = [(DAEndpoint *)v15 protocolTypeString];
              selectedProtocolStr = self->_selectedProtocolStr;
              self->_selectedProtocolStr = v16;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v12);
      }
    }
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_selectedEndpoints) {
      [(CUCoalescer *)self->_coalescer trigger];
    }
  }
  p_bonjourSharedService = &self->_bonjourSharedService;
  if (!self->_bonjourSharedService)
  {
    if (DNSServiceCreateConnection(&self->_bonjourSharedService)
      && gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v26 = CUPrintErrorCode();
      LogPrintF();
    }
    if (*p_bonjourSharedService) {
      DNSServiceSetDispatchQueue(*p_bonjourSharedService, (dispatch_queue_t)self->_dispatchQueue);
    }
  }
  if (!self->_coalescer)
  {
    self->_coalesceMinTicks = SecondsToUpTicksF();
    v19 = (CUCoalescer *)objc_alloc_init(MEMORY[0x263F38540]);
    coalescer = self->_coalescer;
    self->_coalescer = v19;
    v21 = v19;

    [(CUCoalescer *)v21 setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)v21 setMinDelay:0.1];
    [(CUCoalescer *)v21 setMaxDelay:0.3];
    [(CUCoalescer *)v21 setLeeway:0.05];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __38__DADeviceResolver__ensureInitialized__block_invoke;
    v27[3] = &unk_264520418;
    v27[4] = v21;
    v27[5] = self;
    [(CUCoalescer *)v21 setActionHandler:v27];
  }
  if (!self->_endpoints)
  {
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    endpoints = self->_endpoints;
    self->_endpoints = v22;
  }
  if (!self->_resolveOperations)
  {
    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    resolveOperations = self->_resolveOperations;
    self->_resolveOperations = v24;
  }
}

void *__38__DADeviceResolver__ensureInitialized__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[11]) {
    return (void *)[result _evaluateEndpoints];
  }
  return result;
}

- (void)_evaluateEndpoints
{
  uint64_t v3 = mach_absolute_time();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  endpoints = self->_endpoints;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__DADeviceResolver__evaluateEndpoints__block_invoke;
  v5[3] = &unk_264520490;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = v10;
  v5[7] = v3;
  [(NSMutableDictionary *)endpoints enumerateKeysAndObjectsUsingBlock:v5];
  [(DADeviceResolver *)self _updateSelectedEndpoint:0];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)self->_endpoints count];
    mach_absolute_time();
    UpTicksToMicroseconds();
    LogPrintF();
  }
  if (*((_DWORD *)v7 + 6)) {
    [(CUCoalescer *)self->_coalescer trigger];
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
}

void __38__DADeviceResolver__evaluateEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 56);
  if ((unint64_t)(v7 - [v6 addTicks]) >= *(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v8 = [v6 parentDevice];
    if (v8 && [v6 grouped])
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__1;
      v21 = __Block_byref_object_dispose__1;
      id v22 = 0;
      int v9 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __38__DADeviceResolver__evaluateEndpoints__block_invoke_2;
      long long v14 = &unk_264520468;
      id v10 = v6;
      id v15 = v10;
      long long v16 = &v17;
      [v9 enumerateKeysAndObjectsUsingBlock:&v11];
      if (v18[5])
      {
        objc_msgSend(*(id *)(a1 + 32), "_groupEndpoint:matchedEndpoint:", v10, v11, v12, v13, v14);
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      else if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reportDeviceWithSoloEndpoint:", v10, v11, v12, v13, v14);
      }

      _Block_object_dispose(&v17, 8);
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __38__DADeviceResolver__evaluateEndpoints__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  if (v8 != v7 && [v8 sameDeviceAsEndpoint:v7])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)_groupEndpoint:(id)a3 matchedEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 mergeMissingInfoFromEndpoint:v7];
  [v7 mergeMissingInfoFromEndpoint:v6];
  id v8 = [v7 parentDevice];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(DADevice *)v8 endpoints];
    uint64_t v11 = (void *)[v10 mutableCopy];
    uint64_t v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v15 = v13;

    id v16 = [v6 identifier];
    if (v16) {
      [v15 setObject:v6 forKeyedSubscript:v16];
    }
    [(DADevice *)v9 setEndpoints:v15];
  }
  else
  {
    id v9 = objc_alloc_init(DADevice);
    long long v14 = [MEMORY[0x263F08C38] UUID];
    id v15 = [v14 UUIDString];

    [(DADevice *)v9 setIdentifier:v15];
    [v7 setParentDevice:v9];
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v17 = [v6 identifier];
    if (v17) {
      [v16 setObject:v6 forKeyedSubscript:v17];
    }
    uint64_t v18 = [v7 identifier];

    if (v18) {
      [v16 setObject:v7 forKeyedSubscript:v18];
    }
    [(DADevice *)v9 setEndpoints:v16];
    devices = self->_devices;
    if (!devices)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v21 = self->_devices;
      self->_devices = v20;

      devices = self->_devices;
    }
    [(NSMutableDictionary *)devices setObject:v9 forKeyedSubscript:v15];
  }
  id v22 = [v6 parentDevice];
  v23 = v22;
  if (v22)
  {
    v24 = [v22 identifier];
    if (v24) {
      [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v24];
    }
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      uint64_t v34 = v9;
      LogPrintF();
    }
    v25 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:41 device:v23];
    v26 = _Block_copy(self->_eventHandler);
    v27 = v26;
    if (v26) {
      (*((void (**)(void *, DADeviceEvent *))v26 + 2))(v26, v25);
    }
  }
  objc_msgSend(v6, "setParentDevice:", v9, v34);
  [v6 setGrouped:1];
  [v7 setGrouped:1];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  long long v28 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v9];
  long long v29 = _Block_copy(self->_eventHandler);
  long long v30 = v29;
  if (v29) {
    (*((void (**)(void *, DADeviceEvent *))v29 + 2))(v29, v28);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DADeviceResolver__groupEndpoint_matchedEndpoint___block_invoke;
  block[3] = &unk_2645204B8;
  id v36 = v6;
  v37 = self;
  id v38 = v7;
  id v32 = v7;
  id v33 = v6;
  dispatch_async(dispatchQueue, block);
}

void __51__DADeviceResolver__groupEndpoint_matchedEndpoint___block_invoke(uint64_t a1)
{
  v40[11] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) airplayDeviceID];
  uint64_t v3 = &unk_26D125CE0;
  uint64_t v4 = &unk_26D125CF8;
  if (!v2) {
    uint64_t v3 = &unk_26D125CF8;
  }
  id v38 = v3;

  id v5 = [*(id *)(a1 + 32) underlyingDADevice];
  id v6 = [v5 url];

  if (v6)
  {
    id v7 = [v5 url];
    id v8 = [v7 absoluteString];
    uint64_t v37 = [v8 length];

    uint64_t v4 = &unk_26D125CE0;
  }
  else
  {
    uint64_t v37 = 0;
  }
  id v9 = *(void **)(*(void *)(a1 + 40) + 64);
  if (v9) {
    id v36 = (__CFString *)[v9 copy];
  }
  else {
    id v36 = @"NoBundleId";
  }
  id v10 = [*(id *)(a1 + 32) parentDevice];
  uint64_t v11 = [v10 protocolType];

  if (v11)
  {
    uint64_t v12 = [v5 protocolType];
    id v13 = [v12 identifier];
LABEL_16:

    id v22 = &unk_26D125CE0;
    goto LABEL_17;
  }
  long long v14 = [*(id *)(a1 + 32) underlyingDADevice];
  id v15 = [v14 protocolType];
  id v16 = [v15 identifier];

  if (v16)
  {
    uint64_t v17 = *(void **)(a1 + 32);
LABEL_15:
    uint64_t v12 = [v17 underlyingDADevice];
    v21 = [v12 protocolType];
    id v13 = [v21 identifier];

    goto LABEL_16;
  }
  uint64_t v18 = [*(id *)(a1 + 48) underlyingDADevice];
  uint64_t v19 = [v18 protocolType];
  v20 = [v19 identifier];

  if (v20)
  {
    uint64_t v17 = *(void **)(a1 + 48);
    goto LABEL_15;
  }
  id v13 = @"-";
  id v22 = &unk_26D125CF8;
LABEL_17:
  v23 = [*(id *)(a1 + 32) bonjourFullName];

  v24 = v5;
  if (v23)
  {
    uint64_t v34 = [*(id *)(a1 + 32) bonjourFullName];
  }
  else
  {
    uint64_t v34 = @"no-full-name";
  }
  v25 = NSNumber;
  v26 = objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice", v34);
  v27 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "supportsGrouping"));

  v39[0] = @"BundleID";
  v39[1] = @"SupportsAirPlay";
  v40[0] = v36;
  v40[1] = v38;
  v39[2] = @"SupportsBonjour";
  v39[3] = @"SupportsSSDP";
  v40[2] = v22;
  v40[3] = v4;
  long long v28 = v13;
  v40[4] = v13;
  v39[4] = @"BonjourServices";
  v39[5] = @"SSDPURLLength";
  long long v29 = [NSNumber numberWithUnsignedInteger:v37];
  v40[5] = v29;
  v39[6] = @"SSDPProtocol";
  long long v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "protocol"));
  v40[6] = v30;
  v39[7] = @"DeviceFlags";
  long long v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "flags"));
  v40[7] = v31;
  v39[8] = @"DeviceType";
  id v32 = DADeviceTypeToString([v24 type]);
  v40[8] = v32;
  v40[9] = v27;
  v39[9] = @"SupportsGrouping";
  v39[10] = @"ProtocolType";
  v40[10] = v28;
  id v33 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:11];

  +[DADeviceAccessAnalytics sendAnalyticsInfo:v33 forEvent:@"com.apple.DeviceAccess.DeviceInfo" withDeviceIdentifier:v35];
}

- (void)_reportDeviceWithSoloEndpoint:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = objc_alloc_init(DADevice);
    id v7 = [MEMORY[0x263F08C38] UUID];
    id v8 = [v7 UUIDString];

    [(DADevice *)v6 setIdentifier:v8];
    v20 = v5;
    v21[0] = v4;
    id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [(DADevice *)v6 setEndpoints:v9];

    [v4 setParentDevice:v6];
    devices = self->_devices;
    if (!devices)
    {
      uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v12 = self->_devices;
      self->_devices = v11;

      devices = self->_devices;
    }
    [(NSMutableDictionary *)devices setObject:v6 forKeyedSubscript:v8];
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v13 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v6];
    long long v14 = _Block_copy(self->_eventHandler);
    id v15 = v14;
    if (v14) {
      (*((void (**)(void *, DADeviceEvent *))v14 + 2))(v14, v13);
    }

    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__DADeviceResolver__reportDeviceWithSoloEndpoint___block_invoke;
    block[3] = &unk_264520418;
    id v18 = v4;
    uint64_t v19 = self;
    dispatch_async(dispatchQueue, block);
  }
}

void __50__DADeviceResolver__reportDeviceWithSoloEndpoint___block_invoke(uint64_t a1)
{
  v37[11] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) airplayDeviceID];
  uint64_t v3 = &unk_26D125CE0;
  id v4 = &unk_26D125CF8;
  if (!v2) {
    uint64_t v3 = &unk_26D125CF8;
  }
  id v35 = v3;

  id v5 = [*(id *)(a1 + 32) underlyingDADevice];
  id v6 = [v5 url];

  if (v6)
  {
    id v7 = [v5 url];
    id v8 = [v7 absoluteString];
    uint64_t v34 = [v8 length];

    id v4 = &unk_26D125CE0;
  }
  else
  {
    uint64_t v34 = 0;
  }
  id v9 = *(void **)(*(void *)(a1 + 40) + 64);
  if (v9) {
    id v33 = (__CFString *)[v9 copy];
  }
  else {
    id v33 = @"NoBundleId";
  }
  id v10 = [*(id *)(a1 + 32) parentDevice];
  uint64_t v11 = [v10 protocolType];

  if (v11)
  {
    uint64_t v12 = [v5 protocolType];
    id v13 = [v12 identifier];
LABEL_13:

    id v18 = &unk_26D125CE0;
    goto LABEL_14;
  }
  long long v14 = [*(id *)(a1 + 32) underlyingDADevice];
  id v15 = [v14 protocolType];
  id v16 = [v15 identifier];

  if (v16)
  {
    uint64_t v12 = [*(id *)(a1 + 32) underlyingDADevice];
    uint64_t v17 = [v12 protocolType];
    id v13 = [v17 identifier];

    goto LABEL_13;
  }
  id v13 = @"-";
  id v18 = &unk_26D125CF8;
LABEL_14:
  uint64_t v19 = [*(id *)(a1 + 32) name];

  if (v19)
  {
    id v32 = @"no-name";
  }
  else
  {
    id v32 = [*(id *)(a1 + 32) name];
  }
  v20 = [*(id *)(a1 + 32) bonjourFullName];

  v21 = v5;
  if (v20)
  {
    long long v31 = [*(id *)(a1 + 32) bonjourFullName];
  }
  else
  {
    long long v31 = @"no-full-name";
  }
  id v22 = NSNumber;
  v23 = [*(id *)(a1 + 32) underlyingDADevice];
  v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "supportsGrouping"));

  v36[0] = @"BundleID";
  v36[1] = @"SupportsAirPlay";
  v37[0] = v33;
  v37[1] = v35;
  v36[2] = @"SupportsBonjour";
  v36[3] = @"SupportsSSDP";
  v37[2] = v18;
  v37[3] = v4;
  v25 = v13;
  v37[4] = v13;
  v36[4] = @"BonjourServices";
  v36[5] = @"SSDPURLLength";
  v26 = [NSNumber numberWithUnsignedInteger:v34];
  v37[5] = v26;
  v36[6] = @"SSDPProtocol";
  v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "protocol"));
  v37[6] = v27;
  v36[7] = @"DeviceFlags";
  long long v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "flags"));
  v37[7] = v28;
  v36[8] = @"DeviceType";
  long long v29 = DADeviceTypeToString([v21 type]);
  v37[8] = v29;
  v37[9] = v24;
  v36[9] = @"SupportsGrouping";
  v36[10] = @"ProtocolType";
  v37[10] = v25;
  long long v30 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:11];

  +[DADeviceAccessAnalytics sendAnalyticsInfo:v30 forEvent:@"com.apple.DeviceAccess.DeviceInfo" withDeviceIdentifier:v31];
}

- (void)_reportEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v4 = _Block_copy(self->_eventHandler);
  id v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (void)_reportEventType:(int64_t)a3
{
  id v4 = [[DAEvent alloc] initWithEventType:a3];
  [(DADeviceResolver *)self _reportEvent:v4];
}

- (void)_updateSelectedEndpoint:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  BOOL prefNameBasedSelect = self->_prefNameBasedSelect;
  BOOL v87 = self->_prefNameBasedSelect;
  v44 = v4;
  v45 = self;
  if (v4 && prefNameBasedSelect)
  {
    id v6 = v4;
    endpoints = self->_endpoints;
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __44__DADeviceResolver__updateSelectedEndpoint___block_invoke;
    v81[3] = &unk_264520468;
    id v8 = v6;
    v82 = v8;
    v83 = &v84;
    [(NSMutableDictionary *)endpoints enumerateKeysAndObjectsUsingBlock:v81];
  }
  else if (!v4)
  {
    goto LABEL_40;
  }
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    bundleID = v44;
    LogPrintF();
  }
  id v9 = v44;
  id v10 = [(NSString *)v9 protocolTypeString];
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  if ([(NSString *)self->_selectedProtocolStr isEqualToString:v10])
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v12 = self->_selectedEndpoints;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v77 objects:v91 count:16];
    if (v13)
    {
      id v14 = 0;
      uint64_t v15 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v78 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          if (v14)
          {
            id v18 = [*(id *)(*((void *)&v77 + 1) + 8 * i) persistentDictionaryRepresentation];
            [v11 addObject:v18];
          }
          else if ([*(id *)(*((void *)&v77 + 1) + 8 * i) matchesSelectedEndpoint:v9 allowName:*((unsigned __int8 *)v85 + 24)])
          {
            id v14 = v17;
          }
          else
          {
            uint64_t v19 = [v17 persistentDictionaryRepresentation];
            [v11 addObject:v19];

            id v14 = 0;
          }
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v77 objects:v91 count:16];
      }
      while (v13);

      if (v14)
      {
        if (gLogCategory_DADeviceResolver <= 30
          && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[NSMutableArray removeObject:](v45->_selectedEndpoints, "removeObject:", v14, v14, v9);
        }
        else
        {
          -[NSMutableArray removeObject:](v45->_selectedEndpoints, "removeObject:", v14, bundleID, v43);
        }
      }
    }
    else
    {

      id v14 = 0;
    }
    -[NSMutableArray addObject:](v45->_selectedEndpoints, "addObject:", v9, bundleID);
    v20 = [(NSString *)v9 persistentDictionaryRepresentation];
    [v11 addObject:v20];
  }
  else
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v43 = v10;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_selectedProtocolStr, v10);
    [(NSMutableArray *)self->_selectedEndpoints removeAllObjects];
    v20 = [(NSString *)v9 persistentDictionaryRepresentation];
    [v11 addObject:v20];
    id v14 = 0;
  }

  bundleID = v45->_bundleID;
  NSPrintF();
  CFPrefs_SetValue();

  self = v45;
LABEL_40:
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__1;
  v75 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", self->_selectedEndpoints, bundleID, v43);
  id v76 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__1;
  v69 = __Block_byref_object_dispose__1;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__1;
  v63 = __Block_byref_object_dispose__1;
  id v64 = 0;
  v21 = self->_endpoints;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __44__DADeviceResolver__updateSelectedEndpoint___block_invoke_2;
  v58[3] = &unk_2645204E0;
  v58[4] = self;
  v58[5] = &v84;
  v58[6] = &v71;
  v58[7] = &v59;
  v58[8] = &v65;
  [(NSMutableDictionary *)v21 enumerateKeysAndObjectsUsingBlock:v58];
  id v22 = (void (**)(void *, DADeviceEvent *))_Block_copy(self->_eventHandler);
  if (v22)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = (id)v66[5];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v90 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            v42 = v27;
            LogPrintF();
          }
          long long v28 = objc_msgSend(v27, "parentDevice", v42);
          long long v29 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v28];
          v22[2](v22, v29);
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v90 count:16];
      }
      while (v24);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v30 = (id)v60[5];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v89 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void **)(*((void *)&v50 + 1) + 8 * k);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            v42 = v34;
            LogPrintF();
          }
          id v35 = objc_msgSend(v34, "parentDevice", v42);
          id v36 = [(DAEventDevice *)[DADeviceEvent alloc] initWithEventType:40 device:v35];
          v22[2](v22, v36);
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v89 count:16];
      }
      while (v31);
    }
  }
  if (v45->_selectedEndpoints && [(id)v72[5] count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v37 = (id)v72[5];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v88 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v47;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(v37);
          }
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v88 count:16];
      }
      while (v38);
    }
  }
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v84, 8);
}

void __44__DADeviceResolver__updateSelectedEndpoint___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = v7;
  if (*(id *)(a1 + 32) != v7)
  {
    id v9 = [v7 parentDevice];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v8 protocolTypeString];
      LODWORD(v10) = [v10 isEqual:v11];

      if (v10)
      {
        uint64_t v12 = [*(id *)(a1 + 32) name];
        uint64_t v13 = [v8 name];
        int v14 = [v12 isEqual:v13];

        if (v14)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
}

void __44__DADeviceResolver__updateSelectedEndpoint___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 parentDevice];

  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = *(id *)(a1[4] + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        if (objc_msgSend(v4, "matchesSelectedEndpoint:allowName:", v11, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), (void)v20))break; {
        if (v8 == ++v10)
        }
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      [*(id *)(*(void *)(a1[6] + 8) + 40) removeObject:v11];

      if ([v4 selected]) {
        goto LABEL_18;
      }
      [v4 setSelected:1];
      uint64_t v12 = *(void **)(*(void *)(a1[7] + 8) + 40);
      if (!v12)
      {
        id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v18 = *(void *)(a1[7] + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        uint64_t v16 = a1[7];
        goto LABEL_16;
      }
      goto LABEL_17;
    }
LABEL_10:

    if ([v4 selected])
    {
      [v4 setSelected:0];
      uint64_t v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v14 = *(void *)(a1[8] + 8);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        uint64_t v16 = a1[8];
LABEL_16:
        uint64_t v12 = *(void **)(*(void *)(v16 + 8) + 40);
      }
LABEL_17:
      objc_msgSend(v12, "addObject:", v4, (void)v20);
    }
  }
LABEL_18:
}

- (void)_startResolvingEndpoint:(id)a3
{
  id v14 = a3;
  id v4 = [v14 ipv4String];
  if (![v4 length])
  {
    id v5 = [v14 bonjourHostname];
    uint64_t v6 = [v5 UTF8String];

    if (v6)
    {
      [(DADeviceResolver *)self _startResolvingHostname:v6 interfaceIndex:0 endpoint:v14];
    }
    else
    {
      id v7 = [v14 bonjourFullName];
      uint64_t v8 = [v7 UTF8String];

      uint64_t v9 = [v14 bonjourInterfaceIndex];
      if (v8)
      {
        [(DADeviceResolver *)self _startResolvingBonjourFullName:v8 interfaceIndex:v9 endpoint:v14];
      }
      else
      {
        id v10 = [v14 bonjourName];
        uint64_t v11 = [v10 UTF8String];

        id v12 = [v14 bonjourType];
        uint64_t v13 = [v12 UTF8String];

        if (v11 && v13)
        {
          [(DADeviceResolver *)self _startResolvingBonjourName:v11 type:v13 interfaceIndex:v9 endpoint:v14];
        }
        else if (gLogCategory_DADeviceResolver <= 90 {
               && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }
      }
    }
  }
}

- (void)_startResolvingBonjourFullName:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5
{
  id v8 = a5;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v8 identifier];
    LogPrintF();
  }
  uint64_t v9 = objc_alloc_init(DADeviceResolveOperation);
  [(DADeviceResolveOperation *)v9 setResolver:self];
  [(DADeviceResolveOperation *)v9 setEndpoint:v8];
  DNSServiceRef sdRef = self->_bonjourSharedService;
  if (DNSServiceQueryRecord(&sdRef, 0x404000u, a4, a3, 0x21u, 1u, (DNSServiceQueryRecordReply)_resolveSRVCallack, v9))
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = CUPrintErrorCode();
      LogPrintF();
    }
  }
  else
  {
    [(DADeviceResolveOperation *)v9 setSrvQuery:sdRef];
    [(NSMutableSet *)self->_resolveOperations addObject:v9];
  }
}

- (void)_startResolvingBonjourName:(const char *)a3 type:(const char *)a4 interfaceIndex:(unsigned int)a5 endpoint:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    id v12 = [v10 identifier];
    LogPrintF();
  }
  if (!DNSServiceConstructFullName(fullName, a3, a4, "local."))
  {
    uint64_t v11 = objc_alloc_init(DADeviceResolveOperation);
    [(DADeviceResolveOperation *)v11 setResolver:self];
    [(DADeviceResolveOperation *)v11 setEndpoint:v10];
    DNSServiceRef sdRef = self->_bonjourSharedService;
    if (DNSServiceQueryRecord(&sdRef, 0x404000u, a5, fullName, 0x21u, 1u, (DNSServiceQueryRecordReply)_resolveSRVCallack, v11))
    {
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        uint64_t v13 = CUPrintErrorCode();
        LogPrintF();
      }
    }
    else
    {
      [(DADeviceResolveOperation *)v11 setSrvQuery:sdRef];
      [(NSMutableSet *)self->_resolveOperations addObject:v11];
    }
    goto LABEL_8;
  }
  if (gLogCategory_DADeviceResolver <= 90
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    uint64_t v11 = (DADeviceResolveOperation *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_8:
  }
}

- (void)_startResolvingHostname:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5
{
  id v8 = a5;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v8 identifier];
    LogPrintF();
  }
  uint64_t v9 = objc_alloc_init(DADeviceResolveOperation);
  [(DADeviceResolveOperation *)v9 setResolver:self];
  [(DADeviceResolveOperation *)v9 setEndpoint:v8];
  DNSServiceRef sdRef = self->_bonjourSharedService;
  if (DNSServiceGetAddrInfo(&sdRef, 0x4000u, a4, 1u, a3, (DNSServiceGetAddrInfoReply)_resolveHostnameCallback, v9))
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = CUPrintErrorCode();
      LogPrintF();
    }
  }
  else
  {
    [(DADeviceResolveOperation *)v9 setAddrInfoQuery:sdRef];
    [(NSMutableSet *)self->_resolveOperations addObject:v9];
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
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

- (CUCoalescer)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (NSMutableSet)resolveOperations
{
  return self->_resolveOperations;
}

- (void)setResolveOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveOperations, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_selectedProtocolStr, 0);
  objc_storeStrong((id *)&self->_selectedEndpoints, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end