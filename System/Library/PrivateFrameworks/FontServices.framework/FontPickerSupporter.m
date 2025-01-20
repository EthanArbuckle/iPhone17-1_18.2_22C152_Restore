@interface FontPickerSupporter
- (BOOL)clientHasFontAccessEntitlement;
- (BOOL)clientHasFontAccessEntitlement:(id *)a3;
- (FontPickerSupporter)initWithEndpoint:(id)a3;
- (NSMutableSet)activatedFontFilePaths;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)clientEndpoint;
- (void)checkin:(id)a3;
- (void)done;
- (void)setActivatedFontFilePaths:(id)a3;
- (void)setClientEndpoint:(id)a3;
- (void)setClientHasFontAccessEntitlement:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setup;
- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5;
@end

@implementation FontPickerSupporter

- (FontPickerSupporter)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FontPickerSupporter;
  v5 = [(FontPickerSupporter *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__FontPickerSupporter_initWithEndpoint___block_invoke;
    v12[3] = &unk_1E60B9B08;
    v8 = v5;
    v13 = v8;
    [(NSXPCConnection *)v5->_connection setInvalidationHandler:v12];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA2698];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v9];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA2B10];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v10];
    [(NSXPCConnection *)v5->_connection setExportedObject:v8];
    [(NSXPCConnection *)v5->_connection resume];
  }
  return v5;
}

void __40__FontPickerSupporter_initWithEndpoint___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Fontpickersupp_0.isa);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (BOOL)clientHasFontAccessEntitlement:(id *)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v17.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v17.val[4] = v5;
  uint64_t v6 = SecTaskCreateWithAuditToken(v4, &v17);
  if (v6)
  {
    v7 = v6;
    CFArrayRef v8 = (const __CFArray *)SecTaskCopyValueForEntitlement(v6, @"com.apple.developer.user-fonts", 0);
    if (v8)
    {
      CFArrayRef v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFArrayGetTypeID())
      {
        CFIndex Count = CFArrayGetCount(v9);
        v18.location = 0;
        v18.length = Count;
        if (CFArrayContainsValue(v9, v18, @"font-enumeration"))
        {
          int v12 = 1;
          goto LABEL_9;
        }
        v19.location = 0;
        v19.length = Count;
        int v15 = CFArrayContainsValue(v9, v19, @"app-usage");
        CFRelease(v9);
        if (v15)
        {
          int v12 = 1;
          goto LABEL_13;
        }
      }
      else
      {
        CFRelease(v9);
      }
    }
    v13 = (__CFString *)SecTaskCopySigningIdentifier(v7, 0);
    if (!v13)
    {
      int v12 = 0;
      goto LABEL_13;
    }
    CFArrayRef v9 = (const __CFArray *)v13;
    int v12 = IsApplicationIdentifierGrantedFontEnumeration(v13, v14);
LABEL_9:
    CFRelease(v9);
LABEL_13:
    CFRelease(v7);
    LOBYTE(v6) = v12 != 0;
  }
  self->_clientHasFontAccessEntitlement = (char)v6;
  return (char)v6;
}

- (void)checkin:(id)a3
{
  id v4 = a3;
  long long v5 = [(FontPickerSupporter *)self connection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__FontPickerSupporter_checkin___block_invoke_2;
  v8[3] = &unk_1E60B9C38;
  id v9 = v4;
  id v7 = v4;
  [v6 checkin:v8];
}

void __31__FontPickerSupporter_checkin___block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __31__FontPickerSupporter_checkin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__FontPickerSupporter_setup__block_invoke;
  v2[3] = &unk_1E60B9C60;
  v2[4] = self;
  [(FontPickerSupporter *)self checkin:v2];
}

void __28__FontPickerSupporter_setup__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = [MEMORY[0x1E4F29268] currentConnection];
  CFTypeID v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }

  v11 = *(void **)(a1 + 32);
  v12[0] = v13;
  v12[1] = v14;
  if ([v11 clientHasFontAccessEntitlement:v12])
  {
    [*(id *)(a1 + 32) setClientEndpoint:v7];
    GSFontSetupForFontPicker();
  }
  [*(id *)(a1 + 32) synchronize:v8 deactivated:0 includingFontAssets:a4];
}

- (void)done
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_activatedFontFilePaths;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
        if (GSFontUnregisterURL()) {
          NSLog(&cfstr_FailedToUnregi.isa, v8);
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  CFTypeID v10 = (NSMutableSet *)objc_opt_new();
  activatedFontFilePaths = self->_activatedFontFilePaths;
  self->_activatedFontFilePaths = v10;

  GSFontDoneForFontPicker();
  CTFontManagerInstalledFontsChanged();
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)synchronize:(id)a3 deactivated:(id)a4 includingFontAssets:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a4;
  objc_opt_class();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_sync_enter(obj);
  if (v5) {
    MEMORY[0x1BA994CE0](v8);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
  char v11 = 0;
  if (v10)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        long long v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
        if (GSFontUnregisterURL())
        {
          NSLog(&cfstr_FailedToUnregi.isa, v14);
        }
        else
        {
          [(NSMutableSet *)self->_activatedFontFilePaths removeObject:v14];
          char v11 = 1;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  long long v16 = objc_opt_new();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__FontPickerSupporter_synchronize_deactivated_includingFontAssets___block_invoke;
  v32[3] = &unk_1E60B9C88;
  id v17 = v16;
  id v33 = v17;
  [v25 enumerateKeysAndObjectsUsingBlock:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
        uint64_t v24 = GSFontRegisterURL();
        if (v24) {
          NSLog(&cfstr_FailedToUseCli.isa, v24, v22);
        }
        else {
          char v11 = 1;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v19);
  }

  if (v11) {
    CTFontManagerInstalledFontsChanged();
  }
  [(NSMutableSet *)self->_activatedFontFilePaths addObjectsFromArray:v18];

  objc_sync_exit(obj);
}

void __67__FontPickerSupporter_synchronize_deactivated_includingFontAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  MEMORY[0x1BA994BC0]();
  [*(id *)(a1 + 32) addObject:v3];
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

- (NSMutableSet)activatedFontFilePaths
{
  return self->_activatedFontFilePaths;
}

- (void)setActivatedFontFilePaths:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedFontFilePaths, 0);
  objc_storeStrong((id *)&self->_clientEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end