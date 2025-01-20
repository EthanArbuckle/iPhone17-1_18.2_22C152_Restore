@interface ILClassificationController
+ (BOOL)shouldActivate;
+ (ILClassificationController)sharedInstance;
+ (id)electedExtensionFromExtensions:(id)a3;
- (BOOL)isClassificationAvailable;
- (ILClassificationController)init;
- (NSArray)extensions;
- (NSExtension)electedExtension;
- (NSHashTable)delegates;
- (OS_dispatch_queue)queue;
- (id)firstMatchCompletionBlock;
- (id)matchingExtensionToken;
- (void)activateWithCompletion:(id)a3;
- (void)addDelegate:(id)a3;
- (void)beginMatchingExtensionsWithFirstCompletion:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)setElectedExtension:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFirstMatchCompletionBlock:(id)a3;
- (void)updateExtensions:(id)a3 electedExtensions:(id)a4;
@end

@implementation ILClassificationController

+ (ILClassificationController)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ILClassificationController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return (ILClassificationController *)v2;
}

uint64_t __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_12(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() electedExtensionFromExtensions:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v5 updateExtensions:v6 electedExtensions:v7];
}

+ (id)electedExtensionFromExtensions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "optedIn", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

void __44__ILClassificationController_shouldActivate__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (const void *)MGCopyAnswer();
  CFTypeRef v1 = CFAutorelease(v0);
  shouldActivate_shouldActivate = CFEqual(v1, @"iPhone") != 0;
  uint64_t v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412802;
    CFTypeRef v4 = v1;
    __int16 v5 = 2112;
    uint64_t v6 = @"iPhone";
    __int16 v7 = 1024;
    int v8 = shouldActivate_shouldActivate;
    _os_log_impl(&dword_21DAC7000, v2, OS_LOG_TYPE_DEFAULT, "determined device class to be %@ (requires %@), should activate: %d", (uint8_t *)&v3, 0x1Cu);
  }
}

uint64_t __44__ILClassificationController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (ILClassificationController)init
{
  v9.receiver = self;
  v9.super_class = (Class)ILClassificationController;
  uint64_t v2 = [(ILClassificationController *)&v9 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[@"ILClassificationControllerServiceName" UTF8String], v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v6;
  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  __int16 v5 = ILDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DAC7000, v5, OS_LOG_TYPE_DEFAULT, "requested activate classification controller...", buf, 2u);
  }

  uint64_t v6 = [(ILClassificationController *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ILClassificationController_activateWithCompletion___block_invoke;
  v8[3] = &unk_26446FA90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __53__ILClassificationController_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  int v3 = [(id)objc_opt_class() shouldActivate];
  id v4 = ILDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "classification controller already activated", buf, 2u);
    }

    uint64_t v6 = *(void **)(a1 + 40);
    if (v6)
    {
      id v7 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__ILClassificationController_activateWithCompletion___block_invoke_8;
      block[3] = &unk_26446FB20;
      id v8 = v6;
      block[4] = *(void *)(a1 + 32);
      id v15 = v8;
      dispatch_async(v7, block);

      id v9 = v15;
LABEL_14:
    }
  }
  else if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "activating classification controller", buf, 2u);
    }

    [*(id *)(a1 + 32) beginMatchingExtensionsWithFirstCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "shouldn't activate classification controller", buf, 2u);
    }

    long long v10 = *(void **)(a1 + 40);
    if (v10)
    {
      long long v11 = dispatch_get_global_queue(21, 0);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__ILClassificationController_activateWithCompletion___block_invoke_9;
      v12[3] = &unk_26446F938;
      id v13 = v10;
      dispatch_async(v11, v12);

      id v9 = v13;
      goto LABEL_14;
    }
  }
}

- (void)beginMatchingExtensionsWithFirstCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = ILDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _Block_copy(v4);
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_21DAC7000, v5, OS_LOG_TYPE_DEFAULT, "begin matching extensions with first match completion: %@", buf, 0xCu);
  }
  [(ILClassificationController *)self setFirstMatchCompletionBlock:v4];
  objc_initWeak((id *)buf, self);
  uint64_t v13 = *MEMORY[0x263F07FF8];
  uint64_t v14 = @"com.apple.identitylookup.classification-ui";
  id v7 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v8 = (void *)MEMORY[0x263F08800];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke;
  v11[3] = &unk_26446FB70;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = [v8 beginMatchingExtensionsWithAttributes:v7 completion:v11];
  id matchingExtensionToken = self->_matchingExtensionToken;
  self->_id matchingExtensionToken = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)setFirstMatchCompletionBlock:(id)a3
{
}

+ (BOOL)shouldActivate
{
  if (shouldActivate_onceToken != -1) {
    dispatch_once(&shouldActivate_onceToken, &__block_literal_global_1);
  }
  return shouldActivate_shouldActivate;
}

void __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ILDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_21DAC7000, v7, OS_LOG_TYPE_DEFAULT, "update matched extensions: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
  {
    id v8 = ILDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v20 = 0x3032000000;
      v21 = __Block_byref_object_copy_;
      v22 = __Block_byref_object_dispose_;
      id v23 = 0;
      long long v10 = [WeakRetained queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_12;
      block[3] = &unk_26446FB48;
      p_long long buf = &buf;
      block[4] = v8;
      id v11 = v5;
      id v17 = v11;
      dispatch_sync(v10, block);

      id v12 = [v8 firstMatchCompletionBlock];

      if (v12)
      {
        uint64_t v13 = ILDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_21DAC7000, v13, OS_LOG_TYPE_DEFAULT, "Invoking first matching completion", v15, 2u);
        }

        uint64_t v14 = [v8 firstMatchCompletionBlock];
        ((void (**)(void, void, id))v14)[2](v14, *(void *)(*((void *)&buf + 1) + 40), v11);

        [v8 setFirstMatchCompletionBlock:0];
      }

      _Block_object_dispose(&buf, 8);
    }
  }
}

- (void)updateExtensions:(id)a3 electedExtensions:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ILClassificationController *)self queue];
  dispatch_assert_queue_V2(v9);

  long long v10 = ILDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    v32 = @"com.apple.identitylookup.classification-ui";
    _os_log_impl(&dword_21DAC7000, v10, OS_LOG_TYPE_DEFAULT, "updating extensions: %@ elected extension: %@ for point name: %@", buf, 0x20u);
  }
  v19 = v8;
  uint64_t v20 = v7;

  objc_storeStrong((id *)&self->_electedExtension, a4);
  objc_storeStrong((id *)&self->_extensions, a3);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [(ILClassificationController *)self delegates];
  id v12 = [v11 allObjects];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
        v18 = dispatch_get_global_queue(17, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__ILClassificationController_updateExtensions_electedExtensions___block_invoke;
        block[3] = &unk_26446FB98;
        block[4] = v17;
        void block[5] = self;
        dispatch_async(v18, block);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v19, v20);
    }
    while (v14);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)firstMatchCompletionBlock
{
  return self->_firstMatchCompletionBlock;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

uint64_t __53__ILClassificationController_activateWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 16));
}

uint64_t __53__ILClassificationController_activateWithCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__ILClassificationController_updateExtensions_electedExtensions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 isClassificationAvailable];
  id v6 = [*(id *)(a1 + 40) electedExtension];
  id v5 = [*(id *)(a1 + 40) extensions];
  [v2 classificationController:v3 didUpdateAvailability:v4 electedExtension:v6 extensions:v5];
}

- (BOOL)isClassificationAvailable
{
  uint64_t v2 = [(ILClassificationController *)self electedExtension];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSExtension)electedExtension
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  BOOL v3 = [(ILClassificationController *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__ILClassificationController_electedExtension__block_invoke;
  v6[3] = &unk_26446FBC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSExtension *)v4;
}

void __46__ILClassificationController_electedExtension__block_invoke(uint64_t a1)
{
}

- (NSArray)extensions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  BOOL v3 = [(ILClassificationController *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ILClassificationController_extensions__block_invoke;
  v6[3] = &unk_26446FBC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__ILClassificationController_extensions__block_invoke(uint64_t a1)
{
}

- (void)setElectedExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(ILClassificationController *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ILClassificationController_setElectedExtension___block_invoke;
  v7[3] = &unk_26446FB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__ILClassificationController_setElectedExtension___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  BOOL v3 = (void *)(a1 + 40);
  if (v2 != *(id *)(a1 + 40))
  {
    id v4 = ILDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "set elected: %@ in extensions: %@", buf, 0x16u);
    }

    if (v2)
    {
      id v15 = 0;
      char v7 = [v2 attemptOptOut:&v15];
      id v8 = v15;
      if ((v7 & 1) == 0)
      {
        uint64_t v9 = ILDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __50__ILClassificationController_setElectedExtension___block_invoke_cold_2((uint64_t)v2, (uint64_t)v8, v9);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    long long v10 = *(void **)(a1 + 40);
    if (v10)
    {
      id v14 = v8;
      char v11 = [v10 attemptOptIn:&v14];
      id v12 = v14;

      if ((v11 & 1) == 0)
      {
        uint64_t v13 = ILDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __50__ILClassificationController_setElectedExtension___block_invoke_cold_1(v3, (uint64_t)v12, v13);
        }
      }
    }
    else
    {
      id v12 = v8;
    }
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILClassificationController *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ILClassificationController_addDelegate___block_invoke;
  v7[3] = &unk_26446FB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __42__ILClassificationController_addDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILClassificationController *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ILClassificationController_removeDelegate___block_invoke;
  v7[3] = &unk_26446FB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __45__ILClassificationController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  BOOL v3 = (void *)MEMORY[0x263F08800];
  id v4 = [(ILClassificationController *)self matchingExtensionToken];
  [v3 endMatchingExtensions:v4];

  v5.receiver = self;
  v5.super_class = (Class)ILClassificationController;
  [(ILClassificationController *)&v5 dealloc];
}

- (void)setExtensions:(id)a3
{
}

- (id)matchingExtensionToken
{
  return self->_matchingExtensionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstMatchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong(&self->_matchingExtensionToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_electedExtension, 0);
}

void __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  objc_super v5 = @"com.apple.identitylookup.classification-ui";
  _os_log_error_impl(&dword_21DAC7000, a2, OS_LOG_TYPE_ERROR, "Error (%@) finding extensions for point name: %@", (uint8_t *)&v2, 0x16u);
}

void __50__ILClassificationController_setElectedExtension___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21DAC7000, a2, a3, "Error opting in extension %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __50__ILClassificationController_setElectedExtension___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21DAC7000, a2, a3, "Error opting out extension %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end