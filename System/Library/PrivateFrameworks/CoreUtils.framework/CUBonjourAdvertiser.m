@interface CUBonjourAdvertiser
- (CUBonjourAdvertiser)init;
- (NSDictionary)txtDictionary;
- (NSString)domain;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)port;
- (unint64_t)advertiseFlags;
- (unsigned)interfaceIndex;
- (void)_activateLocked;
- (void)_activateSafeInvokeBlock:(id)a3;
- (void)_updateLocked;
- (void)_updateTXTDictionary;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setAdvertiseFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInterfaceIndex:(unsigned int)a3;
- (void)setInterfaceName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceType:(id)a3;
- (void)setTxtDictionary:(id)a3;
@end

@implementation CUBonjourAdvertiser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (int)port
{
  return self->_port;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
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

- (unint64_t)advertiseFlags
{
  return self->_advertiseFlags;
}

- (void)_updateTXTDictionary
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_txtDictionary)
  {
    uint64_t v28 = 0;
    v29 = (TXTRecordRef *)&v28;
    uint64_t v30 = 0x3010000000;
    TXTRecordRef v32 = 0uLL;
    v31 = "";
    TXTRecordCreate(&v32, 0x100u, buffer);
    txtDictionary = self->_txtDictionary;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke;
    v26[3] = &unk_1E55BF4E8;
    v26[4] = self;
    v26[5] = &v28;
    [(NSDictionary *)txtDictionary enumerateKeysAndObjectsUsingBlock:v26];
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_9;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x1Eu, (uint64_t)"Update TXT: %##@\n", v8, v9, v10, v11, (uint64_t)self->_txtDictionary);
    }
LABEL_9:
    bonjourAdvertiser = self->_bonjourAdvertiser;
    BytesPtr = TXTRecordGetBytesPtr(v29 + 2);
    unsigned int Length = TXTRecordGetLength(v29 + 2);
    uint64_t v21 = BonjourAdvertiserSetTXTRecord((uint64_t)bonjourAdvertiser, BytesPtr, Length);
    if (!v21) {
      goto LABEL_14;
    }
    v22 = self->_ucat;
    if (v22->var0 > 60) {
      goto LABEL_14;
    }
    if (v22->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v22, 0x3Cu)) {
        goto LABEL_14;
      }
      v22 = self->_ucat;
    }
    LogPrintF((uint64_t)v22, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x3Cu, (uint64_t)"### Set TXT record failed: %#m\n", v17, v18, v19, v20, v21);
LABEL_14:
    TXTRecordDeallocate(v29 + 2);
    _Block_object_dispose(&v28, 8);
    return;
  }
  v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu)) {
        goto LABEL_16;
      }
      v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x1Eu, (uint64_t)"Update TXT: <none>\n", v2, v3, v4, v5, v25);
  }
LABEL_16:
  v23 = self->_bonjourAdvertiser;
  v24 = (void *)*((void *)v23 + 20);
  if (v24) {
    free(v24);
  }
  *((void *)v23 + 20) = 0;
  *((_WORD *)v23 + 84) = 0;
  *((unsigned char *)v23 + 170) = 1;
}

void __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v40 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (const char *)[v5 UTF8String];
    size_t v7 = strlen(v6);
    if (v7 >= 0x100)
    {
      v38 = *(int **)(*(void *)(a1 + 32) + 32);
      if (*v38 > 60) {
        goto LABEL_24;
      }
      if (*v38 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v38, 0x3Cu)) {
          goto LABEL_24;
        }
        v38 = *(int **)(*(void *)(a1 + 32) + 32);
      }
      LogPrintF((uint64_t)v38, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### TXT item '%@', '%@' value too long\n", v8, v9, v10, v11, (uint64_t)v40);
      goto LABEL_24;
    }
    uint8_t v12 = v7;
    v13 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    id v14 = v40;
    if (TXTRecordSetValue(v13, (const char *)[v14 UTF8String], v12, v6))
    {
      uint64_t v19 = *(int **)(*(void *)(a1 + 32) + 32);
      if (*v19 <= 60)
      {
        if (*v19 != -1)
        {
LABEL_6:
          LogPrintF((uint64_t)v19, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', '%@' failed: %#m\n", v15, v16, v17, v18, (uint64_t)v14);
          goto LABEL_24;
        }
        if (_LogCategory_Initialize((uint64_t)v19, 0x3Cu))
        {
          uint64_t v19 = *(int **)(*(void *)(a1 + 32) + 32);
          goto LABEL_6;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 BOOLValue])
    {
      uint64_t v20 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      id v21 = v40;
      if (TXTRecordSetValue(v20, (const char *)[v21 UTF8String], 0, 0))
      {
        v26 = *(int **)(*(void *)(a1 + 32) + 32);
        if (*v26 <= 60)
        {
          if (*v26 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v26, 0x3Cu)) {
              goto LABEL_24;
            }
            v26 = *(int **)(*(void *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v26, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', true failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = *(int **)(*(void *)(a1 + 32) + 32);
        if (*v39 > 60) {
          goto LABEL_24;
        }
        if (*v39 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v39, 0x3Cu)) {
            goto LABEL_24;
          }
          v39 = *(int **)(*(void *)(a1 + 32) + 32);
        }
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### TXT item '%@', unsupported value '%@'\n", v27, v28, v29, v30, (uint64_t)v40);
        goto LABEL_24;
      }
      v31 = (TXTRecordRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      id v32 = v40;
      if (TXTRecordSetValue(v31, (const char *)[v32 UTF8String], 0, 0))
      {
        v37 = *(int **)(*(void *)(a1 + 32) + 32);
        if (*v37 <= 60)
        {
          if (*v37 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v37, 0x3Cu)) {
              goto LABEL_24;
            }
            v37 = *(int **)(*(void *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v37, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', null failed: %#m\n", v33, v34, v35, v36, (uint64_t)v32);
        }
      }
    }
  }
LABEL_24:
}

- (void)_updateLocked
{
  bonjourAdvertiser = self->_bonjourAdvertiser;
  if (!bonjourAdvertiser) {
    return;
  }
  BOOL advertiseFlagsChanged = self->_advertiseFlagsChanged;
  if (self->_advertiseFlagsChanged)
  {
    *((void *)bonjourAdvertiser + 13) = self->_advertiseFlags;
    self->_BOOL advertiseFlagsChanged = 0;
  }
  if (self->_domainChanged)
  {
    if (!ReplaceDifferentString((void **)bonjourAdvertiser + 12, (char *)[(NSString *)self->_domain UTF8String]))goto LABEL_10; {
    ucat = self->_ucat;
    }
    if (ucat->var0 > 60) {
      goto LABEL_10;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
        goto LABEL_10;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _updateLocked]", 0x3Cu, (uint64_t)"### Set domain '%@' failed: %#m\n", v5, v6, v7, v8, (uint64_t)self->_domain);
LABEL_10:
    self->_domainChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_interfaceIndexChanged)
  {
    *((_DWORD *)self->_bonjourAdvertiser + 28) = self->_interfaceIndex;
    self->_interfaceIndexChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_interfaceNameChanged)
  {
    [(NSString *)self->_interfaceName UTF8String];
    __strlcpy_chk();
    self->_interfaceNameChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_nameChanged)
  {
    ReplaceDifferentString((void **)self->_bonjourAdvertiser + 17, (char *)[(NSString *)self->_name UTF8String]);
    self->_nameChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_portChanged)
  {
    *((_DWORD *)self->_bonjourAdvertiser + 37) = self->_port;
    self->_portChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_serviceTypeChanged)
  {
    ReplaceDifferentString((void **)self->_bonjourAdvertiser + 19, (char *)[(NSString *)self->_serviceType UTF8String]);
    self->_serviceTypeChanged = 0;
    BOOL advertiseFlagsChanged = 1;
  }
  if (self->_txtDictionaryChanged)
  {
    [(CUBonjourAdvertiser *)self _updateTXTDictionary];
    self->_txtDictionaryChanged = 0;
    if (!self->_started) {
      goto LABEL_29;
    }
  }
  else
  {
    if (!self->_started)
    {
LABEL_29:
      uint8_t v12 = self->_bonjourAdvertiser;
      CFRetain(v12);
      dispatch_async_f(*((dispatch_queue_t *)v12 + 3), v12, (dispatch_function_t)_BonjourAdvertiserStart);
      self->_started = 1;
      return;
    }
    if (!advertiseFlagsChanged) {
      return;
    }
  }
  uint64_t v10 = self->_bonjourAdvertiser;
  CFRetain(v10);
  uint64_t v11 = *((void *)v10 + 3);
  dispatch_async_f(v11, v10, (dispatch_function_t)_BonjourAdvertiserUpdate);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CUBonjourAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __33__CUBonjourAdvertiser_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(int **)(v10 + 32);
    if (*v11 > 30) {
      goto LABEL_6;
    }
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v12)
      {
LABEL_6:
        v13 = *(dispatch_queue_t **)(v10 + 16);
        if (v13)
        {
          CFRetain(*(CFTypeRef *)(v10 + 16));
          dispatch_async_f(v13[3], v13, (dispatch_function_t)_BonjourAdvertiserStop);
          CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 16));
          *(void *)(*(void *)(a1 + 32) + 16) = 0;
        }
        return;
      }
      uint64_t v11 = *(int **)(v10 + 32);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourAdvertiser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v14);
    uint64_t v10 = *(void *)(a1 + 32);
    goto LABEL_6;
  }
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4[2](v4) && v5->_activated && !v5->_invalidateCalled && !v5->_updatePending)
  {
    v5->_updatePending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke;
    block[3] = &unk_1E55BFC18;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

void __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  [*(id *)(a1 + 32) _updateLocked];
  objc_sync_exit(obj);
}

- (void)_activateLocked
{
  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  if (self->_bonjourAdvertiser) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_7;
      }
      ucat = self->_ucat;
    }
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _activateLocked]", 0x1Eu, (uint64_t)"Activate name=%@, service=%@, domain=%@, port=%d, ifname=%@, ifindex=%u, flags=0x%llX", v2, v3, v4, v5, (uint64_t)self->_name);
  }
LABEL_7:
  uint64_t v9 = BonjourAdvertiserCreate(p_bonjourAdvertiser);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = self->_ucat;
    if (v15->var0 > 60) {
      return;
    }
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x3Cu)) {
        return;
      }
      uint64_t v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUBonjourAdvertiser _activateLocked]", 0x3Cu, (uint64_t)"### Create advertiser failed: %#m\n", v10, v11, v12, v13, v14);
    return;
  }
  label = self->_label;
  if (label)
  {
    uint64_t v17 = *p_bonjourAdvertiser;
    [(NSString *)label UTF8String];
    LogCategoryReplaceF((uint64_t *)v17 + 2, (uint64_t)"%s-%s", v18, v19, v20, v21, v22, v23, qword_1E91CC088);
  }
  BonjourAdvertiserSetDispatchQueue((uint64_t)self->_bonjourAdvertiser, self->_dispatchQueue);
  [(CUBonjourAdvertiser *)self _updateLocked];
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CUBonjourAdvertiser_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

void __31__CUBonjourAdvertiser_activate__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  [*(id *)(a1 + 32) _activateLocked];
  objc_sync_exit(obj);
}

- (void)setTxtDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke;
  v6[3] = &unk_1E55BDE48;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v6];
}

uint64_t __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 120);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  id v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = v8;

  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 48) = 1;
  return result;
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__CUBonjourAdvertiser_setServiceType___block_invoke;
  v6[3] = &unk_1E55BDE48;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v6];
}

uint64_t __38__CUBonjourAdvertiser_setServiceType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 112);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  id v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v8;

  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 47) = 1;
  return result;
}

- (void)setPort:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__CUBonjourAdvertiser_setPort___block_invoke;
  v3[3] = &unk_1E55BDE70;
  int v4 = a3;
  v3[4] = self;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v3];
}

BOOL __31__CUBonjourAdvertiser_setPort___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 56);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 56) = v1;
    *(unsigned char *)(*(void *)(a1 + 32) + 46) = 1;
  }
  return v1 != v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__CUBonjourAdvertiser_setName___block_invoke;
  v6[3] = &unk_1E55BDE48;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v6];
}

uint64_t __31__CUBonjourAdvertiser_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 104);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  id v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 104);
  *(void *)(v9 + 104) = v8;

  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 45) = 1;
  return result;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC758;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)setInterfaceName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CUBonjourAdvertiser_setInterfaceName___block_invoke;
  v6[3] = &unk_1E55BDE48;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v6];
}

uint64_t __40__CUBonjourAdvertiser_setInterfaceName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 88);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  id v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = v8;

  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 44) = 1;
  return result;
}

- (void)setInterfaceIndex:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke;
  v3[3] = &unk_1E55BDE70;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v3];
}

BOOL __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 52);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 52) = v1;
    *(unsigned char *)(*(void *)(a1 + 32) + 43) = 1;
  }
  return v1 != v3;
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CUBonjourAdvertiser_setDomain___block_invoke;
  v6[3] = &unk_1E55BDE48;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v6];
}

uint64_t __33__CUBonjourAdvertiser_setDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 80);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  id v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    return 0;
  }

LABEL_8:
  uint64_t v8 = [*(id *)(a1 + 32) copy];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 42) = 1;
  return result;
}

- (void)setAdvertiseFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke;
  v3[3] = &unk_1E55BDE20;
  v3[4] = self;
  void v3[5] = a3;
  [(CUBonjourAdvertiser *)self _activateSafeInvokeBlock:v3];
}

BOOL __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 64);
  if (v1 != v3)
  {
    *(void *)(v2 + 64) = v1;
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  }
  return v1 != v3;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v65 = 0;
  NSAppendPrintF(&v65, (uint64_t)"CUBonjourAdvertiser %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  uint64_t v10 = v65;
  uint64_t v17 = v10;
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v64 = v10;
    NSAppendPrintF(&v64, (uint64_t)", Name '%@'", v11, v12, v13, v14, v15, v16, (uint64_t)name);
    uint64_t v19 = v64;

    uint64_t v17 = v19;
  }
  CFMutableStringRef v63 = v17;
  NSAppendPrintF(&v63, (uint64_t)", Port %d", v11, v12, v13, v14, v15, v16, self->_port);
  uint64_t v20 = v63;

  unint64_t advertiseFlags = self->_advertiseFlags;
  if (advertiseFlags)
  {
    CFMutableStringRef v62 = v20;
    NSAppendPrintF(&v62, (uint64_t)", AdvFlags 0x%llX", v21, v22, v23, v24, v25, v26, advertiseFlags);
    uint64_t v28 = v62;

    uint64_t v20 = v28;
  }
  domain = self->_domain;
  if (domain)
  {
    CFMutableStringRef v61 = v20;
    NSAppendPrintF(&v61, (uint64_t)", Domain '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)domain);
    uint64_t v30 = v61;

    uint64_t v20 = v30;
  }
  uint64_t interfaceIndex = self->_interfaceIndex;
  if (interfaceIndex)
  {
    CFMutableStringRef v60 = v20;
    NSAppendPrintF(&v60, (uint64_t)", IfIndex %u", v21, v22, v23, v24, v25, v26, interfaceIndex);
    id v32 = v60;

    uint64_t v20 = v32;
  }
  interfaceName = self->_interfaceName;
  if (interfaceName)
  {
    CFMutableStringRef v59 = v20;
    NSAppendPrintF(&v59, (uint64_t)", IfName '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)interfaceName);
    uint64_t v34 = v59;

    uint64_t v20 = v34;
  }
  if (a3 < 50)
  {
    txtDictionary = self->_txtDictionary;
    if (txtDictionary)
    {
      CFMutableStringRef v57 = v20;
      v44 = &v57;
      NSAppendPrintF(&v57, (uint64_t)", TXT %##@", v21, v22, v23, v24, v25, v26, (uint64_t)txtDictionary);
    }
    else
    {
      CFMutableStringRef v56 = v20;
      v44 = &v56;
      NSAppendPrintF(&v56, (uint64_t)", TXT <None>", v21, v22, v23, v24, v25, v26, v53);
    }
    v45 = *v44;

    if (a3 > 20) {
      goto LABEL_19;
    }
    CFMutableStringRef v55 = v45;
    uint64_t v36 = &v55;
    NSAppendPrintF(&v55, (uint64_t)"\n", v46, v47, v48, v49, v50, v51, v54);
    uint64_t v20 = v45;
  }
  else
  {
    CFMutableStringRef v58 = v20;
    uint64_t v35 = [(NSDictionary *)self->_txtDictionary count];
    uint64_t v36 = &v58;
    NSAppendPrintF(&v58, (uint64_t)", TXT %d item(s)", v37, v38, v39, v40, v41, v42, v35);
  }
  v45 = *v36;

LABEL_19:
  return v45;
}

- (id)description
{
  return [(CUBonjourAdvertiser *)self descriptionWithLevel:50];
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
  v4.super_class = (Class)CUBonjourAdvertiser;
  [(CUBonjourAdvertiser *)&v4 dealloc];
}

- (CUBonjourAdvertiser)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUBonjourAdvertiser;
  uint64_t v2 = [(CUBonjourAdvertiser *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourAdvertiser;
  }
  return v2;
}

@end