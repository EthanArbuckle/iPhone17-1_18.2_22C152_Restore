@interface CUBonjourBrowser
- (CUBonjourBrowser)init;
- (NSArray)devices;
- (NSString)domain;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)_bonjourStart;
- (unint64_t)browseFlags;
- (unsigned)changeFlags;
- (unsigned)controlFlags;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_bonjourHandleAddOrUpdateDevice:(id)a3;
- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4;
- (void)_bonjourHandleRemoveDevice:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_update;
- (void)_updateLocked;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setBrowseFlags:(unint64_t)a3;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceType:(id)a3;
- (void)update;
@end

@implementation CUBonjourBrowser

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (unint64_t)browseFlags
{
  return self->_browseFlags;
}

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  int v29 = 0;
  BonjourDevice_GetDeviceID(v4, v28, &v29);
  if (!v29)
  {
    v10 = NSStringWithMACAddress((uint64_t)v28);
    v15 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v10];
    if (v15)
    {
      v16 = self;
      objc_sync_enter(v16);
      [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v10];
      objc_sync_exit(v16);

      ucat = v16->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          id v18 = v15;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v19 = [v18 shortDescription];
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [v18 descriptionWithLevel:50];
            }
            else {
            uint64_t v19 = [v18 description];
            }
          }
          v21 = (void *)v19;

          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x1Eu, (uint64_t)"Lost %@\n", v22, v23, v24, v25, (uint64_t)v21);
          goto LABEL_24;
        }
        if (_LogCategory_Initialize((uint64_t)v16->_ucat, 0x1Eu))
        {
          ucat = v16->_ucat;
          goto LABEL_8;
        }
      }
LABEL_24:
      deviceLostHandler = (void (**)(id, void *))v16->_deviceLostHandler;
      if (deviceLostHandler) {
        deviceLostHandler[2](deviceLostHandler, v15);
      }
      goto LABEL_26;
    }
    v20 = self->_ucat;
    if (v20->var0 <= 30)
    {
      if (v20->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v20, 0x1Eu)) {
          goto LABEL_26;
        }
        v20 = self->_ucat;
      }
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x1Eu, (uint64_t)"### Bonjour lost untracked device\n", v11, v12, v13, v14, v27);
    }
LABEL_26:

    goto LABEL_27;
  }
  v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au)) {
        goto LABEL_27;
      }
      v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x5Au, (uint64_t)"### Bonjour device found without identifier: %@\n", v5, v6, v7, v8, (uint64_t)v4);
  }
LABEL_27:
}

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  int v39 = 0;
  uint64_t v40 = 0;
  v41[0] = 0;
  BonjourDevice_GetDeviceID(v4, (char *)v41 + 2, &v39);
  if (!v39)
  {
    v10 = NSStringWithMACAddress((uint64_t)v41 + 2);
    uint64_t v11 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v10];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [(CUBonjourDevice *)v11 updateWithBonjourDeviceInfo:v4];
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          v15 = v12;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v16 = [(CUBonjourDevice *)v15 shortDescription];
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [(CUBonjourDevice *)v15 descriptionWithLevel:50];
            }
            else {
            uint64_t v16 = [(CUBonjourDevice *)v15 description];
            }
          }
          uint64_t v27 = (void *)v16;

          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x1Eu, (uint64_t)"Changed %@ %#{flags}\n", v28, v29, v30, v31, (uint64_t)v27);
          goto LABEL_30;
        }
        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
          ucat = self->_ucat;
          goto LABEL_8;
        }
      }
LABEL_30:
      deviceChangedHandler = (void (**)(id, CUBonjourDevice *, uint64_t))self->_deviceChangedHandler;
      if (deviceChangedHandler) {
        deviceChangedHandler[2](deviceChangedHandler, v12, v13);
      }
LABEL_37:

      goto LABEL_38;
    }
    uint64_t v12 = objc_alloc_init(CUBonjourDevice);
    int v17 = *(_DWORD *)((char *)v41 + 2);
    *(_WORD *)&v12->_deviceIDBytes[4] = HIWORD(v41[0]);
    *(_DWORD *)v12->_deviceIDBytes = v17;
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v40];
    [(CUBonjourDevice *)v12 setIdentifier:v18];
    [(CUBonjourDevice *)v12 setIdentifierUUID:v18];
    [(CUBonjourDevice *)v12 setIdentifierStr:v10];
    [(CUBonjourDevice *)v12 updateWithBonjourDeviceInfo:v4];
    uint64_t v19 = self;
    objc_sync_enter(v19);
    deviceMap = self->_deviceMap;
    if (!deviceMap)
    {
      v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v23 = self->_deviceMap;
      p_deviceMap = &self->_deviceMap;
      *p_deviceMap = v21;

      deviceMap = *p_deviceMap;
    }
    [(NSMutableDictionary *)deviceMap setObject:v12 forKeyedSubscript:v10];
    objc_sync_exit(v19);

    uint64_t v24 = v19->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_14:
        uint64_t v25 = v12;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v26 = [(CUBonjourDevice *)v25 shortDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [(CUBonjourDevice *)v25 descriptionWithLevel:50];
          }
          else {
          uint64_t v26 = [(CUBonjourDevice *)v25 description];
          }
        }
        v33 = (void *)v26;

        LogPrintF((uint64_t)v24, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x1Eu, (uint64_t)"Found %@\n", v34, v35, v36, v37, (uint64_t)v33);
        goto LABEL_34;
      }
      if (_LogCategory_Initialize((uint64_t)v19->_ucat, 0x1Eu))
      {
        uint64_t v24 = v19->_ucat;
        goto LABEL_14;
      }
    }
LABEL_34:
    deviceFoundHandler = (void (**)(id, CUBonjourDevice *))v19->_deviceFoundHandler;
    if (deviceFoundHandler) {
      deviceFoundHandler[2](deviceFoundHandler, v12);
    }

    goto LABEL_37;
  }
  v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au)) {
        goto LABEL_38;
      }
      v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x5Au, (uint64_t)"### Bonjour device found without identifier: %@\n", v5, v6, v7, v8, (uint64_t)v4);
  }
LABEL_38:
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1u:
      id v6 = (id)-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:](self, "_bonjourHandleAddOrUpdateDevice:");
      break;
    case 2u:
      id v6 = (id)-[CUBonjourBrowser _bonjourHandleRemoveDevice:](self, "_bonjourHandleRemoveDevice:");
      break;
    case 3u:
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_11;
      }
      if (ucat->var0 != -1) {
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_6:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleEventType:info:]", 0x1Eu, (uint64_t)"Bonjour stopped\n", v7, v8, v9, v10, v14);
      }
LABEL_11:
      bonjourBrowser = self->_bonjourBrowser;
      if (bonjourBrowser)
      {
        CFRetain(self->_bonjourBrowser);
        dispatch_async_f(*((dispatch_queue_t *)bonjourBrowser + 2), bonjourBrowser, (dispatch_function_t)_BonjourBrowser_Stop);
        CFRelease(self->_bonjourBrowser);
        self->_bonjourBrowser = 0;
      }
      id v6 = (id)[(CUBonjourBrowser *)self _invalidated];
      break;
    case 4u:
      uint64_t v12 = self->_ucat;
      if (v12->var0 > 60) {
        goto LABEL_15;
      }
      if (v12->var0 != -1) {
        goto LABEL_9;
      }
      if (_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
      {
        uint64_t v12 = self->_ucat;
LABEL_9:
        LogPrintF((uint64_t)v12, (uint64_t)"-[CUBonjourBrowser _bonjourHandleEventType:info:]", 0x3Cu, (uint64_t)"### Bonjour daemon crashed\n", v7, v8, v9, v10, v14);
      }
LABEL_15:
      id v6 = (id)[(CUBonjourBrowser *)self _interrupted];
      break;
    default:
      break;
  }
  MEMORY[0x1F4181820](v6);
}

- (int)_bonjourStart
{
  p_bonjourBrowser = &self->_bonjourBrowser;
  bonjourBrowser = self->_bonjourBrowser;
  if (bonjourBrowser)
  {
    CFRetain(self->_bonjourBrowser);
    dispatch_async_f(*((dispatch_queue_t *)bonjourBrowser + 2), bonjourBrowser, (dispatch_function_t)_BonjourBrowser_Stop);
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0;
  }
  uint64_t v14 = BonjourBrowser_CreateEx(p_bonjourBrowser, (uint64_t)self->_ucat->var4, self->_controlFlags, v2, v3, v4, v5, v6);
  if (v14) {
    goto LABEL_5;
  }
  BonjourBrowser_SetDispatchQueue((uint64_t)self->_bonjourBrowser, self->_dispatchQueue);
  v15 = self->_bonjourBrowser;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CUBonjourBrowser__bonjourStart__block_invoke;
  aBlock[3] = &unk_1E55BDEE8;
  aBlock[4] = self;
  BonjourBrowser_SetEventHandlerBlock((uint64_t)v15, aBlock);
  uint64_t v14 = BonjourBrowser_Start((dispatch_queue_t *)self->_bonjourBrowser, [(NSString *)self->_serviceType UTF8String], [(NSString *)self->_domain UTF8String], [(NSString *)self->_interfaceName UTF8String], self->_browseFlags);
  if (v14)
  {
LABEL_5:
    ucat = self->_ucat;
    if (ucat->var0 > 60) {
      goto LABEL_9;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
LABEL_9:
        int v17 = (dispatch_queue_t *)*p_bonjourBrowser;
        if (*p_bonjourBrowser)
        {
          CFRetain(*p_bonjourBrowser);
          dispatch_async_f(v17[2], v17, (dispatch_function_t)_BonjourBrowser_Stop);
          CFRelease(*p_bonjourBrowser);
          *p_bonjourBrowser = 0;
        }
        return v14;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourStart]", 0x3Cu, (uint64_t)"### Bonjour start failed: %#m\n", v10, v11, v12, v13, v14);
    goto LABEL_9;
  }
  return v14;
}

uint64_t __33__CUBonjourBrowser__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bonjourHandleEventType:a2 info:a3];
}

- (void)_updateLocked
{
  if (self->_browseFlagsChanged)
  {
    self->_browseFlagsChanged = 0;
    uint64_t v3 = BonjourBrowser_Start((dispatch_queue_t *)self->_bonjourBrowser, [(NSString *)self->_serviceType UTF8String], [(NSString *)self->_domain UTF8String], [(NSString *)self->_interfaceName UTF8String], self->_browseFlags);
    if (v3)
    {
      uint64_t v8 = v3;
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 != -1)
        {
LABEL_5:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _updateLocked]", 0x5Au, (uint64_t)"### Bonjour start update failed: %#m\n", v4, v5, v6, v7, v8);
          return;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        {
          ucat = self->_ucat;
          goto LABEL_5;
        }
      }
    }
  }
}

- (void)_update
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled && obj->_bonjourBrowser) {
    [(CUBonjourBrowser *)obj _updateLocked];
  }
  objc_sync_exit(obj);
}

- (void)update
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUBonjourBrowser_update__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CUBonjourBrowser_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_lostAllDevices
{
  if (self->_deviceLostHandler)
  {
    deviceMap = self->_deviceMap;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__CUBonjourBrowser__lostAllDevices__block_invoke;
    v5[3] = &unk_1E55BDEC0;
    v5[4] = self;
    [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v5];
  }
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_deviceMap removeAllObjects];
  objc_sync_exit(v4);
}

void __35__CUBonjourBrowser__lostAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourBrowser _lostAllDevices]_block_invoke", 0x1Eu, (uint64_t)"Bonjour lost    %@\n", v5, v6, v7, v8, (uint64_t)v9);
      uint64_t v10 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v12)
    {
      uint64_t v11 = *(int **)(v10 + 40);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(v10 + 120) + 16))();
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v19);
    }
  }
LABEL_7:
  if (!self->_bonjourBrowser)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    id v18 = self->_ucat;
    if (v18->var0 <= 10)
    {
      if (v18->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v18, 0xAu)) {
          return;
        }
        id v18 = self->_ucat;
      }
      LogPrintF((uint64_t)v18, (uint64_t)"-[CUBonjourBrowser _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v14, v15, v16, v17, v21);
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUBonjourBrowser_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUBonjourBrowser_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 24)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 24) = 1;
  uint64_t v10 = *(void *)(result + 32);
  uint64_t v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize(*(void *)(v10 + 40), 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourBrowser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v14);
    uint64_t v10 = *(void *)(v9 + 32);
  }
LABEL_6:
  id v13 = *(dispatch_queue_t **)(v10 + 16);
  if (v13)
  {
    CFRetain(*(CFTypeRef *)(v10 + 16));
    dispatch_async_f(v13[2], v13, (dispatch_function_t)_BonjourBrowser_Stop);
    uint64_t v10 = *(void *)(v9 + 32);
  }
  return [(id)v10 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  [(CUBonjourBrowser *)self _lostAllDevices];
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_1E55BF148;
    v7[4] = v5;
    uint64_t v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

uint64_t __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _update];
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUBonjourBrowser_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __28__CUBonjourBrowser_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 40);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUBonjourBrowser activate]_block_invoke", 0x1Eu, (uint64_t)"Activate %@\n", a5, a6, a7, a8, *(void *)(v9 + 104));
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 40);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 9) = 1;
  BOOL v12 = *(void **)(a1 + 32);
  return [v12 _bonjourStart];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC7C8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSArray)devices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  deviceMap = v2->_deviceMap;
  if (deviceMap)
  {
    uint64_t v4 = [(NSMutableDictionary *)deviceMap allValues];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setBrowseFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CUBonjourBrowser_setBrowseFlags___block_invoke;
  v3[3] = &unk_1E55BE748;
  v3[4] = self;
  v3[5] = a3;
  [(CUBonjourBrowser *)self _activateSafeInvokeBlock:v3];
}

uint64_t __35__CUBonjourBrowser_setBrowseFlags___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 64))
  {
    *(void *)(v2 + 64) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  }
  return result;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v69 = 0;
  v70 = (id *)&v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2815;
  v73 = __Block_byref_object_dispose__2816;
  id v74 = 0;
  CFMutableStringRef v68 = 0;
  NSAppendPrintF(&v68, (uint64_t)"CUBonjourBrowser %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  objc_storeStrong(&v74, v68);
  unint64_t browseFlags = self->_browseFlags;
  if (browseFlags)
  {
    uint64_t v17 = v70;
    id v67 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v67, (uint64_t)", BFlags 0x%llX", v10, v11, v12, v13, v14, v15, browseFlags);
    objc_storeStrong(v17 + 5, v67);
  }
  uint64_t changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    uint64_t v19 = v70;
    id v66 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v66, (uint64_t)", CFlags 0x%X", v10, v11, v12, v13, v14, v15, changeFlags);
    objc_storeStrong(v19 + 5, v66);
  }
  v20 = self->_domain;
  uint64_t v27 = v20;
  if (v20)
  {
    uint64_t v28 = v70;
    id obj = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)", Domain '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    objc_storeStrong(v28 + 5, obj);
  }

  uint64_t v29 = self->_interfaceName;
  uint64_t v36 = v29;
  if (v29)
  {
    uint64_t v37 = v70;
    id v64 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v64, (uint64_t)", Interface '%@'", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
    objc_storeStrong(v37 + 5, v64);
  }

  v38 = v70;
  id v63 = v70[5];
  uint64_t v39 = [(NSMutableDictionary *)self->_deviceMap count];
  NSAppendPrintF((CFMutableStringRef *)&v63, (uint64_t)", %d device(s)", v40, v41, v42, v43, v44, v45, v39);
  objc_storeStrong(v38 + 5, v63);
  if (a3 <= 20)
  {
    v52 = v70;
    id v62 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v62, (uint64_t)"\n", v46, v47, v48, v49, v50, v51, v58);
    objc_storeStrong(v52 + 5, v62);
    uint64_t v53 = [(NSMutableDictionary *)self->_deviceMap count];
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v61[3] = 0;
    if (a3 >= 11) {
      int v54 = 50;
    }
    else {
      int v54 = 30;
    }
    deviceMap = self->_deviceMap;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __41__CUBonjourBrowser_descriptionWithLevel___block_invoke;
    v59[3] = &unk_1E55BDE98;
    int v60 = v54;
    v59[4] = &v69;
    v59[5] = v61;
    v59[6] = v53;
    [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v59];
    _Block_object_dispose(v61, 8);
  }
  id v56 = v70[5];
  _Block_object_dispose(&v69, 8);

  return v56;
}

void __41__CUBonjourBrowser_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"    %@\n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  objc_storeStrong((id *)(v6 + 40), obj);

  unint64_t v20 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v20 >= 0x11)
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    id v22 = *(id *)(v21 + 40);
    NSAppendPrintF((CFMutableStringRef *)&v22, (uint64_t)"    ... %d more not shown\n", v14, v15, v16, v17, v18, v19, *(void *)(a1 + 48) - v20);
    objc_storeStrong((id *)(v21 + 40), v22);
    *a4 = 1;
  }
}

- (id)description
{
  return [(CUBonjourBrowser *)self descriptionWithLevel:50];
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBonjourBrowser;
  [(CUBonjourBrowser *)&v4 dealloc];
}

- (CUBonjourBrowser)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUBonjourBrowser;
  uint64_t v2 = [(CUBonjourBrowser *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourBrowser;
    uint64_t v3 = v2;
  }

  return v2;
}

@end