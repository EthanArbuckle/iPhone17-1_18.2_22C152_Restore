@interface CRSCardRequest
+ (void)initialize;
+ (void)registerService:(id)a3;
- (BOOL)loadsBundleServices;
- (CRContent)content;
- (CRSCardRequest)init;
- (CRSCardRequest)initWithContent:(id)a3 format:(unint64_t)a4;
- (NSSet)_excludedServiceIdentifiers;
- (unint64_t)format;
- (void)_loadAndRegisterBundleServices:(id)a3;
- (void)_setExcludedServiceIdentifiers:(id)a3;
- (void)_tryRemainingCardServices:(id)a3 reply:(id)a4;
- (void)setContent:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setLoadsBundleServices:(BOOL)a3;
- (void)startWithReply:(id)a3;
@end

@implementation CRSCardRequest

- (CRSCardRequest)init
{
  return [(CRSCardRequest *)self initWithContent:0 format:1];
}

- (CRSCardRequest)initWithContent:(id)a3 format:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRSCardRequest;
  v8 = [(CRSCardRequest *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_content, a3);
    v9->_format = a4;
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.CardServices.CRSCardRequest.request-queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v9->_loadsBundleServices = 1;
  }

  return v9;
}

- (void)startWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_queue;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __33__CRSCardRequest_startWithReply___block_invoke;
    v13[3] = &unk_264760BE0;
    v6 = v5;
    objc_super v14 = v6;
    objc_copyWeak(&v17, &location);
    id v7 = v4;
    v15 = self;
    id v16 = v7;
    uint64_t v8 = MEMORY[0x22A638C20](v13);
    v9 = (void *)v8;
    if (self->_loadsBundleServices)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __33__CRSCardRequest_startWithReply___block_invoke_56;
      v10[3] = &unk_264760C08;
      id v11 = v7;
      id v12 = v9;
      [(CRSCardRequest *)self _loadAndRegisterBundleServices:v10];
    }
    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __33__CRSCardRequest_startWithReply___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CRSCardRequest_startWithReply___block_invoke_2;
  block[3] = &unk_264760BB8;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v3 = *(id *)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __33__CRSCardRequest_startWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(v1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v4;
      _os_log_impl(&dword_225997000, v3, OS_LOG_TYPE_INFO, "Starting card request: %@", buf, 0xCu);
    }
    id v5 = +[CRSIdentifiedServiceRegistry sharedInstance];
    id v6 = [v5 identifiedServices];

    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        uint64_t v11 = 0;
        uint64_t v27 = v9;
        do
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
          if ([v12 conformsToProtocol:&unk_26D926B30])
          {
            id v13 = v12;
            if ([v13 canSatisfyCardRequest:WeakRetained])
            {
              [*(id *)(v1 + 32) _excludedServiceIdentifiers];
              v15 = uint64_t v14 = v10;
              [v13 serviceIdentifier];
              id v16 = v7;
              id v17 = WeakRetained;
              v19 = uint64_t v18 = v1;
              char v20 = [v15 containsObject:v19];

              uint64_t v1 = v18;
              id WeakRetained = v17;
              id v7 = v16;

              uint64_t v10 = v14;
              uint64_t v9 = v27;
              if ((v20 & 1) == 0) {
                [v26 addObject:v13];
              }
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v9);
    }

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __33__CRSCardRequest_startWithReply___block_invoke_52;
    v28[3] = &unk_264760B90;
    v28[4] = WeakRetained;
    [v26 sortUsingComparator:v28];
    v21 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *(void *)(v1 + 32);
      v23 = v21;
      v24 = [v26 reverseObjectEnumerator];
      v25 = [v24 allObjects];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v22;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_225997000, v23, OS_LOG_TYPE_INFO, "Sorted card services by priority for request %@: %@", buf, 0x16u);
    }
    [WeakRetained _tryRemainingCardServices:v26 reply:*(void *)(v1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
  }
}

uint64_t __33__CRSCardRequest_startWithReply___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 servicePriorityForRequest:v5];
  uint64_t v8 = [v6 servicePriorityForRequest:*(void *)(a1 + 32)];

  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __33__CRSCardRequest_startWithReply___block_invoke_56(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)initialize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRSCardRequest;
  objc_msgSendSuper2(&v4, sel_initialize);
  CRLogInitIfNeeded();
  id v3 = objc_alloc_init(_CRSPassthroughService);
  [a1 registerService:v3];
}

- (void)_loadAndRegisterBundleServices:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke;
  v7[3] = &unk_264760C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225997000, v2, OS_LOG_TYPE_INFO, "Loading and registering bundle services if necessary: %@", buf, 0xCu);
  }
  id v4 = +[_CRSServiceBundleManager sharedInstance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke_63;
  v5[3] = &unk_264760B68;
  id v6 = *(id *)(a1 + 40);
  [v4 getServiceBundlesWithCompletion:v5];
}

void __49__CRSCardRequest__loadAndRegisterBundleServices___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = +[CRSIdentifiedServiceRegistry sharedInstance];
          [v14 registerIdentifiedService:v13];
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      uint64_t v8 = *(void (**)(void))(v15 + 16);
      goto LABEL_13;
    }
  }
}

- (void)_tryRemainingCardServices:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke;
    block[3] = &unk_264760CD0;
    objc_copyWeak(&v13, &location);
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) lastObject];
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  objc_initWeak(&location, WeakRetained);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_65;
  v18[3] = &unk_264760C80;
  objc_copyWeak(&v23, &location);
  v18[4] = WeakRetained;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v19 = v5;
  uint64_t v20 = v6;
  uint64_t v22 = v25;
  id v7 = v4;
  uint64_t v21 = v7;
  [v5 requestCard:WeakRetained reply:v18];
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_67;
    block[3] = &unk_264760CA8;
    objc_copyWeak(&v17, &location);
    id v12 = *(id *)(a1 + 32);
    long long v16 = v25;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = 0;
    uint64_t v14 = v10;
    id v15 = v9;
    dispatch_group_notify(v7, v8, block);

    objc_destroyWeak(&v17);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v25, 8);
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 72));
  id v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2;
    block[3] = &unk_264760C58;
    id v14 = v6;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v5;
    long long v12 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v12;
    long long v18 = v12;
    dispatch_async(v8, block);
  }
  objc_destroyWeak(&to);
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2_cold_1(a1, v2, v3);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *MEMORY[0x263F31630];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 40);
        int v12 = 138412802;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v8;
        _os_log_impl(&dword_225997000, v5, OS_LOG_TYPE_INFO, "Retrieved card %@ from service %@ for request %@", (uint8_t *)&v12, 0x20u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
    }
    else if (v6)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_225997000, v5, OS_LOG_TYPE_INFO, "No card retrieved from service %@ for request %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_67(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_copyWeak(&to, (id *)(a1 + 72));
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v2 removeLastObject];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v3 = objc_alloc_init(CRSCardResponse);
    [(CRSCardResponse *)v3 setCard:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    id v4 = objc_loadWeakRetained(&to);
    [(CRSCardResponse *)v3 setRequest:v4];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if ([v2 count])
    {
      id v5 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v14 = v2;
        _os_log_impl(&dword_225997000, v5, OS_LOG_TYPE_INFO, "Found card, so not trying remaining services %@", buf, 0xCu);
      }
    }
    goto LABEL_10;
  }
  if (![v2 count])
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F80];
    int v12 = @"No service produced a card";
    uint64_t v3 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v9 = [v8 errorWithDomain:*MEMORY[0x263F31628] code:401 userInfo:v3];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);

LABEL_10:
    goto LABEL_11;
  }
  BOOL v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v14 = v2;
    _os_log_impl(&dword_225997000, v6, OS_LOG_TYPE_INFO, "Trying remaining services %@", buf, 0xCu);
  }
  [*(id *)(a1 + 48) _tryRemainingCardServices:v2 reply:*(void *)(a1 + 56)];
LABEL_11:

  objc_destroyWeak(&to);
}

- (CRContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (BOOL)loadsBundleServices
{
  return self->_loadsBundleServices;
}

- (void)setLoadsBundleServices:(BOOL)a3
{
  self->_loadsBundleServices = a3;
}

- (NSSet)_excludedServiceIdentifiers
{
  return self->_excludedServiceIdentifiers;
}

- (void)_setExcludedServiceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedServiceIdentifiers, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)registerService:(id)a3
{
  id v3 = a3;
  id v4 = +[CRSIdentifiedServiceRegistry sharedInstance];
  [v4 registerIdentifiedService:v3];
}

void __50__CRSCardRequest__tryRemainingCardServices_reply___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_225997000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve card from service %@ for request %@ due to error: %@", (uint8_t *)&v6, 0x20u);
}

@end