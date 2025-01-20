@interface FontPickerClientFontContext
+ (id)sharedInstanceForEndpoint:(id)a3;
+ (void)invalidateSharedInstanceForEndpoint:(id)a3;
- (BOOL)_isFontFilePathAccepatableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5;
- (BOOL)clientHasFontAccessEntitlement;
- (BOOL)hideProfileFonts;
- (BOOL)isFontFamilyAcceptableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5;
- (FontPickerClientFontContext)initWithEndpoint:(id)a3;
- (NSDictionary)locallyActivatedFontsInfo;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)clientEndpoint;
- (id)fontNamesForFontFamily:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5;
- (void)_doneWithLocallyActivatedFonts;
- (void)_setupLocallyActivatedFonts;
- (void)checkin:(id)a3;
- (void)dealloc;
- (void)enumerateFontFamilyNamesUsingBlock:(id)a3;
- (void)fontSelected:(id)a3;
- (void)invalidate;
- (void)runBlockInClientFontContext:(id)a3;
- (void)runWithClientFonts:(id)a3;
- (void)runWithFontNamesForFamilyName:(id)a3 usingBlock:(id)a4;
- (void)setClientEndpoint:(id)a3;
- (void)setClientHasFontAccessEntitlement:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setHideProfileFonts:(BOOL)a3;
- (void)setLocallyActivatedFontsInfo:(id)a3;
- (void)setup;
- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5;
@end

@implementation FontPickerClientFontContext

- (FontPickerClientFontContext)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FontPickerClientFontContext;
  v5 = [(FontPickerClientFontContext *)&v18 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_nestCount = 0;
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
      connection = v6->_connection;
      v6->_connection = (NSXPCConnection *)v7;

      objc_initWeak(&location, v6);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __48__FontPickerClientFontContext_initWithEndpoint___block_invoke;
      v15 = &unk_1E60B9CB0;
      objc_copyWeak(&v16, &location);
      [(NSXPCConnection *)v6->_connection setInvalidationHandler:&v12];
      v9 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1F0DA2698, v12, v13, v14, v15);
      [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v9];
      v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA2B10];
      [(NSXPCConnection *)v6->_connection setExportedInterface:v10];
      [(NSXPCConnection *)v6->_connection setExportedObject:v6];
      [(NSXPCConnection *)v6->_connection resume];
      v6->_forClientContext = 1;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v5->_forClientContext = 0;
    }
  }

  return v6;
}

void __48__FontPickerClientFontContext_initWithEndpoint___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(&cfstr_Fontpickerclie.isa);
    v1 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
  }
}

+ (id)sharedInstanceForEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gSharedClientFontContextInstances)
  {
    if (v3)
    {
LABEL_3:
      id v5 = v4;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
    uint64_t v7 = (void *)gSharedClientFontContextInstances;
    gSharedClientFontContextInstances = v6;

    if (v4) {
      goto LABEL_3;
    }
  }
  id v5 = [MEMORY[0x1E4F1CA98] null];
LABEL_6:
  v8 = v5;
  v9 = [(id)gSharedClientFontContextInstances objectForKey:v5];
  if (!v9)
  {
    v9 = [[FontPickerClientFontContext alloc] initWithEndpoint:v4];
    [(id)gSharedClientFontContextInstances setObject:v9 forKey:v8];
  }

  return v9;
}

+ (void)invalidateSharedInstanceForEndpoint:(id)a3
{
  if (a3)
  {
    id v3 = (void *)gSharedClientFontContextInstances;
    id v4 = a3;
    id v5 = [v3 objectForKey:v4];
    [v5 invalidate];
    [(id)gSharedClientFontContextInstances removeObjectForKey:v4];
  }
}

- (void)checkin:(id)a3
{
  id v4 = a3;
  id v5 = [(FontPickerClientFontContext *)self connection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_357];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__FontPickerClientFontContext_checkin___block_invoke_2;
  v8[3] = &unk_1E60B9C38;
  id v9 = v4;
  id v7 = v4;
  [v6 checkin:v8];
}

void __39__FontPickerClientFontContext_checkin___block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __39__FontPickerClientFontContext_checkin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setup
{
  if (!self->_clientEndpoint)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __36__FontPickerClientFontContext_setup__block_invoke;
    v2[3] = &unk_1E60B9C60;
    v2[4] = self;
    [(FontPickerClientFontContext *)self checkin:v2];
  }
}

void __36__FontPickerClientFontContext_setup__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a3;
  [v9 setClientEndpoint:a2];
  [*(id *)(a1 + 32) setHideProfileFonts:a5];
  memset(&v22, 0, sizeof(v22));
  v11 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v12 = v11;
  if (v11) {
    [v11 auditToken];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }

  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  audit_token_t v21 = v22;
  v14 = SecTaskCreateWithAuditToken(v13, &v21);
  if (v14)
  {
    v15 = v14;
    CFArrayRef v16 = (const __CFArray *)SecTaskCopyValueForEntitlement(v14, @"com.apple.developer.user-fonts", 0);
    if (v16)
    {
      CFArrayRef v17 = v16;
      CFTypeID v18 = CFGetTypeID(v16);
      if (v18 == CFArrayGetTypeID())
      {
        CFIndex Count = CFArrayGetCount(v17);
        v23.id location = 0;
        v23.length = Count;
        if (CFArrayContainsValue(v17, v23, @"font-enumeration"))
        {
          BOOL v20 = 1;
        }
        else
        {
          v24.id location = 0;
          v24.length = Count;
          BOOL v20 = CFArrayContainsValue(v17, v24, @"app-usage") != 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
      CFRelease(v17);
    }
    else
    {
      BOOL v20 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    BOOL v20 = 0;
  }
  [*(id *)(a1 + 32) setClientHasFontAccessEntitlement:v20];
  [*(id *)(a1 + 32) synchronize:v10 deactivated:0 includingFontAssets:a4];
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  clientEndpoint = self->_clientEndpoint;
  self->_clientEndpoint = 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSDictionary *)self->_locallyActivatedFontsInfo allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        GSFontReleaseSandboxExtension();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FontPickerClientFontContext;
  [(FontPickerClientFontContext *)&v8 dealloc];
}

- (void)_setupLocallyActivatedFonts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_locallyActivatedFontsInfo allKeys];
  if ([v2 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_super v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v16 + 1) + 8 * v7)];
          uint64_t v9 = GSFontRegisterURL();
          if (v9) {
            FSLog_Error(@"FontPickerSupport", @"failed to use client's locally activated font (%d) - %@", v10, v11, v12, v13, v14, v15, v9);
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    _CTClearFontFallbacksCache();
    GSFontPurgeFontCache();
    [getUIFontClass() _evictAllItemsFromFontAndFontDescriptorCaches];
  }
}

- (void)_doneWithLocallyActivatedFonts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = self->_locallyActivatedFontsInfo;
  uint64_t v3 = [(NSDictionary *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v15 + 1) + 8 * v6)];
        uint64_t v8 = GSFontUnregisterURL2();
        if (v8) {
          FSLog_Error(@"FontPickerSupport", @"failed to unregister locally activated font (%d) - %@", v9, v10, v11, v12, v13, v14, v8);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSDictionary *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (void)runWithClientFonts:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL, BOOL))a3;
  uint64_t v8 = v4;
  if (self->_forClientContext)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    nestCFIndex Count = v5->_nestCount;
    v5->_nestCFIndex Count = nestCount + 1;
    if (!nestCount)
    {
      [(FontPickerClientFontContext *)v5 setup];
      [(FontPickerClientFontContext *)v5 _setupLocallyActivatedFonts];
    }
    v8[2](v8, v5->_clientHasFontAccessEntitlement, v5->_hideProfileFonts);
    int v7 = v5->_nestCount - 1;
    v5->_nestCFIndex Count = v7;
    if (!v7) {
      [(FontPickerClientFontContext *)v5 _doneWithLocallyActivatedFonts];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v4[2](v4, 0, 1);
  }
}

- (BOOL)_isFontFilePathAccepatableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v9 = v7;
  BOOL v10 = (a4
      || (IsPathUserInstalledFontFile(v7, v8) & 1) == 0
      && (IsPathRegisteredFontAssetFontFile(v9) & 1) == 0
      && (IsPathConfigurationProfileFontFile(v9, v11) & 1) == 0)
     && (!v5 || (IsPathConfigurationProfileFontFile(v9, v8) & 1) == 0);

  return v10;
}

- (BOOL)isFontFamilyAcceptableForClient:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 length])
  {
    uint64_t v9 = (void *)GSFontCopyFontNamesForFontFamilyName();
    if ([v9 count])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = (void *)GSFontCopyFontFilePath();
            if (v15
              && -[FontPickerClientFontContext _isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:](self, "_isFontFilePathAccepatableForClient:withFontEntitlement:hideProfileFonts:", v15, v6, v5, v18))
            {

              BOOL v16 = 1;
              goto LABEL_16;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v16 = 0;
LABEL_16:
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)fontNamesForFontFamily:(id)a3 withFontEntitlement:(BOOL)a4 hideProfileFonts:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 isEqualToString:@".AppleSystemUIFont"])
  {
    uint64_t v9 = [getUIFontClass() fontNamesForFamilyName:v8];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    id v18 = v8;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = (id)GSFontCopyFontNamesForFontFamilyName();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          BOOL v16 = (void *)GSFontCopyFontFilePath();
          if (v16
            && [(FontPickerClientFontContext *)self _isFontFilePathAccepatableForClient:v16 withFontEntitlement:v6 hideProfileFonts:v5])
          {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v8 = v18;
  }

  return v9;
}

- (void)enumerateFontFamilyNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__FontPickerClientFontContext_enumerateFontFamilyNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E60B9CD8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FontPickerClientFontContext *)self runWithClientFonts:v6];
}

void __66__FontPickerClientFontContext_enumerateFontFamilyNamesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = objc_msgSend(getUIFontClass(), "familyNames", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(a1 + 32) fontNamesForFontFamily:*(void *)(*((void *)&v12 + 1) + 8 * v10) withFontEntitlement:a2 hideProfileFonts:a3];
        if ([v11 count]) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)runWithFontNamesForFamilyName:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__FontPickerClientFontContext_runWithFontNamesForFamilyName_usingBlock___block_invoke;
    v8[3] = &unk_1E60B9D00;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(FontPickerClientFontContext *)self runWithClientFonts:v8];
  }
}

void __72__FontPickerClientFontContext_runWithFontNamesForFamilyName_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) fontNamesForFontFamily:*(void *)(a1 + 40) withFontEntitlement:a2 hideProfileFonts:a3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)runBlockInClientFontContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke;
  v6[3] = &unk_1E60B9D50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FontPickerClientFontContext *)self runWithClientFonts:v6];
}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke(uint64_t a1, char a2, char a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_2;
  v8[3] = &unk_1E60B9D28;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = a2;
  char v11 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_3;
  v5[3] = &unk_1E60B9D28;
  v5[4] = v9;
  char v6 = a2;
  char v7 = a3;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v3 + 16))(v3, v8, v5);
}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:@".AppleSystemUIFont"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) isFontFamilyAcceptableForClient:v3 withFontEntitlement:*(unsigned __int8 *)(a1 + 40) hideProfileFonts:*(unsigned __int8 *)(a1 + 41)];
  }

  return v4;
}

uint64_t __59__FontPickerClientFontContext_runBlockInClientFontContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:@".AppleSystemUIFont"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = (void *)GSFontCopyFontFilePath();
    if (v5) {
      uint64_t v4 = [*(id *)(a1 + 32) _isFontFilePathAccepatableForClient:v5 withFontEntitlement:*(unsigned __int8 *)(a1 + 40) hideProfileFonts:*(unsigned __int8 *)(a1 + 41)];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (void)fontSelected:(id)a3
{
  id v4 = a3;
  if (self->_forClientContext)
  {
    if (!self->_clientEndpoint) {
      goto LABEL_6;
    }
    id v6 = v4;
    id v5 = +[FontServicesDaemonManager sharedManager];
    [v5 requestFonts:v6 forClient:self->_clientEndpoint];
  }
  else
  {
    id v6 = v4;
    FSFontPickerSupportFontSelected(v4);
  }
  id v4 = v6;
LABEL_6:
}

- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ([v8 count] || objc_msgSend(v7, "count"))
  {
    locallyActivatedFontsInfo = v9->_locallyActivatedFontsInfo;
    if (locallyActivatedFontsInfo) {
      uint64_t v11 = [(NSDictionary *)locallyActivatedFontsInfo mutableCopy];
    }
    else {
      uint64_t v11 = objc_opt_new();
    }
    long long v12 = (NSDictionary *)v11;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
          GSFontReleaseSandboxExtension();
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_367];
    [(NSDictionary *)v12 addEntriesFromDictionary:v7];
    uint64_t v17 = v9->_locallyActivatedFontsInfo;
    v9->_locallyActivatedFontsInfo = v12;
  }
  objc_sync_exit(v9);
}

void __75__FontPickerClientFontContext_synchronize_deactivated_includingFontAssets___block_invoke()
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)clientEndpoint
{
  return self->_clientEndpoint;
}

- (void)setClientEndpoint:(id)a3
{
}

- (NSDictionary)locallyActivatedFontsInfo
{
  return self->_locallyActivatedFontsInfo;
}

- (void)setLocallyActivatedFontsInfo:(id)a3
{
}

- (BOOL)clientHasFontAccessEntitlement
{
  return self->_clientHasFontAccessEntitlement;
}

- (void)setClientHasFontAccessEntitlement:(BOOL)a3
{
  self->_clientHasFontAccessEntitlement = a3;
}

- (BOOL)hideProfileFonts
{
  return self->_hideProfileFonts;
}

- (void)setHideProfileFonts:(BOOL)a3
{
  self->_hideProfileFonts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locallyActivatedFontsInfo, 0);
  objc_storeStrong((id *)&self->_clientEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end