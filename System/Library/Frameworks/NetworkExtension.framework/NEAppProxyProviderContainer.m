@interface NEAppProxyProviderContainer
- (NEAppProxyProvider)provider;
- (NEAppProxyProviderContainer)initWithDelegate:(id)a3 providerClass:(Class)a4;
- (void)handleAppMessage:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegateInterface:(unsigned int)a3;
- (void)setInitialFlowDivertControlSocket:(id)a3;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stop;
- (void)wake;
@end

@implementation NEAppProxyProviderContainer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_flowQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (NEAppProxyProvider)provider
{
  return (NEAppProxyProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NEAppProxyProviderContainer *)self provider];
  [v8 handleAppMessage:v7 completionHandler:v6];
}

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2048;
    id v20 = v4;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Setting initial flow divert control socket to %p", buf, 0x16u);
  }

  dup([v4 fileDescriptor]);
  id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v7 = dispatch_queue_create("NEFlow queue", v6);
  dispatch_queue_t v9 = v7;
  if (self)
  {
    objc_setProperty_atomic(self, v8, v7, 32);

    id Property = objc_getProperty(self, v10, 32, 1);
  }
  else
  {

    id Property = 0;
  }
  id v12 = Property;
  v13 = (_NEFlowDirector *)NEFlowDirectorCreate();
  if (self)
  {
    self->_director = v13;

    if (self->_director)
    {
      if (self->_delegateInterfaceIndex) {
        NEFlowDirectorSetDelegateInterface();
      }
      v14[6] = (id)MEMORY[0x1E4F143A8];
      v14[7] = (id)3221225472;
      v14[8] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke;
      v14[9] = &unk_1E5992C58;
      objc_copyWeak(&v15, &location);
      NEFlowDirectorSetOpenControlSocketCallback();
      v14[1] = (id)MEMORY[0x1E4F143A8];
      v14[2] = (id)3221225472;
      v14[3] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2;
      v14[4] = &unk_1E598EF20;
      v14[5] = self;
      NEFlowDirectorSetMatchRulesCallback();
      objc_copyWeak(v14, &location);
      NEFlowDirectorSetNewFlowCallback();
      objc_destroyWeak(v14);
      objc_destroyWeak(&v15);
    }
  }
  else
  {
  }
  objc_destroyWeak(&location);
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self) {
    objc_msgSend(objc_getProperty(self, v1, 24, 1), "container:didRequestFlowDivertControlSocketWithCompletionHandler:");
  }
}

uint64_t __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = a4;
    _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: Verifying app with signing identifier %@", (uint8_t *)&v9, 0x16u);
  }

  return NEFlowDirectorHandleMatchRulesResult();
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  self = objc_loadWeakRetained(v4);
  id v6 = (void (**)(id, uint64_t))v5;
  if (self)
  {
    uint64_t FlowType = NEFlowGetFlowType();
    if (FlowType == 1)
    {
      int v9 = off_1E598D080;
    }
    else
    {
      uint64_t v8 = FlowType;
      if (FlowType != 2)
      {
        uint64_t v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v17 = v8;
          _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "Unknown flow type %ld", buf, 0xCu);
        }
        goto LABEL_11;
      }
      int v9 = off_1E598D088;
    }
    id v10 = objc_alloc(*v9);
    uint64_t v12 = objc_msgSend(v10, "initWithNEFlow:queue:", a2, objc_getProperty(self, v11, 32, 1));
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = (uint64_t)self;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "%@: Calling handleNewFlow with %@", buf, 0x16u);
    }

    v14 = [self provider];
    v6[2](v6, [v14 handleNewFlow:v12]);

LABEL_11:
  }
}

void __58__NEAppProxyProviderContainer_flowDivertOpenControlSocket__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    int v5 = dup([v3 fileDescriptor]);
  }
  else {
    int v5 = -1;
  }
  id v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: Received new flow divert control socket %d", (uint8_t *)&v9, 0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 && *(void *)(v8 + 40)) {
    NEFlowDirectorHandleNewControlSocket();
  }
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 1024;
    unsigned int v9 = a3;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Setting flow divert delegate interface to %u", (uint8_t *)&v6, 0x12u);
  }

  if (self)
  {
    self->_delegateInterfaceIndex = a3;
    if (self->_director) {
      NEFlowDirectorSetDelegateInterface();
    }
  }
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: Calling stopProxyWithReason", buf, 0xCu);
  }

  id v4 = [(NEAppProxyProviderContainer *)self provider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NEAppProxyProviderContainer_stop__block_invoke;
  v5[3] = &unk_1E59932C0;
  v5[4] = self;
  [v4 stopProxyWithReason:0 completionHandler:v5];
}

void __35__NEAppProxyProviderContainer_stop__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (v3[5])
    {
      NEFlowDirectorDestroy();
    }
    else if (objc_getProperty(v3, a2, 48, 1))
    {
      id v4 = ne_log_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler", buf, 0xCu);
      }

      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 48, 1);
      }
      (*((void (**)(id, void))Property + 2))(Property, 0);
      unsigned int v9 = *(void **)(a1 + 32);
      if (v9) {
        objc_setProperty_atomic_copy(v9, v8, 0, 48);
      }
    }
  }
}

void __35__NEAppProxyProviderContainer_stop__block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    *(void *)(v2 + 40) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (objc_getProperty(v4, a2, 48, 1))
      {
        uint64_t v5 = ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          int v11 = 138412290;
          uint64_t v12 = v6;
          _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler", (uint8_t *)&v11, 0xCu);
        }

        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v7, 48, 1);
        }
        (*((void (**)(id, void))Property + 2))(Property, 0);
        uint64_t v10 = *(void **)(a1 + 32);
        if (v10) {
          objc_setProperty_atomic_copy(v10, v9, 0, 48);
        }
      }
    }
  }
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2048;
    id v15 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@: Calling startProxyWithOptions with options %p", buf, 0x16u);
  }

  if (self) {
    objc_setProperty_atomic_copy(self, v9, v7, 48);
  }
  uint64_t v10 = [(NEAppProxyProviderContainer *)self provider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E5993618;
  v11[4] = self;
  [v10 startProxyWithOptions:v6 completionHandler:v11];
}

void __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!v6) {
    NEFlowDirectorStart();
  }
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, v3, 24, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  [Property container:v5 didStartWithError:v6];
}

- (void)wake
{
  id v2 = [(NEAppProxyProviderContainer *)self provider];
  [v2 wake];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAppProxyProviderContainer *)self provider];
  [v5 sleepWithCompletionHandler:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (NEAppProxyProviderContainer)initWithDelegate:(id)a3 providerClass:(Class)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEAppProxyProviderContainer;
  uint64_t v8 = [(NEAppProxyProviderContainer *)&v15 init];
  if (!v8) {
    goto LABEL_7;
  }
  Class Superclass = class_getSuperclass(a4);
  if (Superclass == (Class)objc_opt_class())
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    uint64_t v12 = (NEAppProxyProvider *)objc_alloc_init(a4);
    provider = v8->_provider;
    v8->_provider = v12;

    [(NEProvider *)v8->_provider setdefaultPathObserver:v8];
LABEL_7:
    int v11 = v8;
    goto LABEL_8;
  }
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "%@: failed to init, providerClass is not subclass of NEAppProxyProvider", buf, 0xCu);
  }

  int v11 = 0;
LABEL_8:

  return v11;
}

@end