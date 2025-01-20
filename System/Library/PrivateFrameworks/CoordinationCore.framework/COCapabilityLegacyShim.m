@interface COCapabilityLegacyShim
- (BOOL)_isStereoPairMember;
- (BOOL)_isStereoPeer:(id)a3;
- (BOOL)_isStereoPeerActive;
- (BOOL)_messageValidateRequest:(id)a3;
- (BOOL)_messageValidateResponse:(id)a3;
- (BOOL)_rapportEventShouldUpdateState:(id)a3;
- (BOOL)isCompanionQueryInProgress;
- (BOOL)isCompanionQueryIncompatible;
- (BOOL)isCompanionQueryNeeded;
- (BOOL)isCompanionQueryUnsuccessful;
- (COCapabilityLegacyShim)initWithDelegate:(id)a3;
- (COCapabilityLegacyShimDelegate)delegate;
- (NSSet)availableCapabilities;
- (NSSet)companionCapabilities;
- (NSSet)supportedCapabilities;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)rapport;
- (id)_messageCreateRequest;
- (id)_messageCreateResponse;
- (id)_messageDecodeCapabilities:(id)a3;
- (id)_messageEncodeCapabilities;
- (void)_messageEncodeCapabilities;
- (void)_notifyDelegate:(id)a3;
- (void)_rapportDeregister;
- (void)_rapportProcessRequest:(id)a3 emittingResponse:(id)a4;
- (void)_rapportProcessResponse:(id)a3 error:(id)a4;
- (void)_rapportRegister;
- (void)_rapportStart;
- (void)_rapportStop;
- (void)_stateQuery;
- (void)_stateUpdate;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)setAvailableCapabilities:(id)a3;
- (void)setCompanionCapabilities:(id)a3;
- (void)setCompanionQueryInProgress:(BOOL)a3;
- (void)setCompanionQueryIncompatible:(BOOL)a3;
- (void)setCompanionQueryNeeded:(BOOL)a3;
- (void)setCompanionQueryUnsuccessful:(BOOL)a3;
@end

@implementation COCapabilityLegacyShim

- (COCapabilityLegacyShim)initWithDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)COCapabilityLegacyShim;
  v5 = [(COCapabilityLegacyShim *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.CoordinationCore.Capabilities.LegacyShim", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x263EFF980] array];
    [v10 addObject:@"com.apple.SoundBoard.capability.Krono"];
    uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    supportedCapabilities = v6->_supportedCapabilities;
    v6->_supportedCapabilities = (NSSet *)v11;

    v13 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    availableCapabilities = v6->_availableCapabilities;
    v6->_availableCapabilities = v13;

    v15 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    companionCapabilities = v6->_companionCapabilities;
    v6->_companionCapabilities = v15;

    *(_DWORD *)&v6->_companionQueryInProgress = 0;
    v17 = v6->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__COCapabilityLegacyShim_initWithDelegate___block_invoke;
    block[3] = &unk_2645CB288;
    v20 = v6;
    dispatch_async(v17, block);
  }
  return v6;
}

void __43__COCapabilityLegacyShim_initWithDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _rapportStart];
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__COCapabilityLegacyShim_initWithDelegate___block_invoke_2;
  block[3] = &unk_2645CB288;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

void __43__COCapabilityLegacyShim_initWithDelegate___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 availableCapabilities];
  [v1 _notifyDelegate:v2];
}

- (void)dealloc
{
  [(COCapabilityLegacyShim *)self _rapportStop];
  v3.receiver = self;
  v3.super_class = (Class)COCapabilityLegacyShim;
  [(COCapabilityLegacyShim *)&v3 dealloc];
}

- (void)_stateUpdate
{
  BOOL v3 = [(COCapabilityLegacyShim *)self _isStereoPeerActive];
  id v4 = COCoreLogForCategory(5);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)dispatch_queue_t v8 = 0;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: Stereo Pair peer is active", v8, 2u);
    }

    [(COCapabilityLegacyShim *)self _stateQuery];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: Stereo Pair peer is not active", buf, 2u);
    }

    [(COCapabilityLegacyShim *)self setCompanionQueryNeeded:0];
    [(COCapabilityLegacyShim *)self setCompanionQueryUnsuccessful:0];
    v6 = [MEMORY[0x263EFFA08] set];
    [(COCapabilityLegacyShim *)self setCompanionCapabilities:v6];

    v7 = [(COCapabilityLegacyShim *)self supportedCapabilities];
    [(COCapabilityLegacyShim *)self setAvailableCapabilities:v7];
  }
}

- (void)_stateQuery
{
  if ([(COCapabilityLegacyShim *)self isCompanionQueryInProgress])
  {
    BOOL v3 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: query already in progress", (uint8_t *)buf, 2u);
    }

    [(COCapabilityLegacyShim *)self setCompanionQueryNeeded:1];
  }
  else
  {
    [(COCapabilityLegacyShim *)self setCompanionQueryNeeded:0];
    [(COCapabilityLegacyShim *)self setCompanionQueryInProgress:1];
    [(COCapabilityLegacyShim *)self setCompanionQueryIncompatible:0];
    id v4 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: issuing query", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    BOOL v5 = [(COCapabilityLegacyShim *)self rapport];
    v6 = [(COCapabilityLegacyShim *)self _messageCreateRequest];
    uint64_t v7 = *MEMORY[0x263F62C10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__COCapabilityLegacyShim__stateQuery__block_invoke;
    v8[3] = &unk_2645CB2B8;
    objc_copyWeak(&v9, buf);
    [v5 sendRequestID:@"com.apple.SoundBoard.Capabilities" request:v6 destinationID:v7 options:0 responseHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __37__COCapabilityLegacyShim__stateQuery__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__COCapabilityLegacyShim__stateQuery__block_invoke_2;
    block[3] = &unk_2645CAEF8;
    void block[4] = v9;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

uint64_t __37__COCapabilityLegacyShim__stateQuery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rapportProcessResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_rapportStart
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2217C1000, v0, v1, "Legacy Shim: starting companion link", v2, v3, v4, v5, v6);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_cold_1();
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 _rapportStop];

    id v6 = objc_loadWeakRetained(v3);
    [v6 _rapportStart];
  }
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_20_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && [WeakRetained _rapportEventShouldUpdateState:v3]) {
    [v6 _stateUpdate];
  }
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_22_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && [WeakRetained _rapportEventShouldUpdateState:v3]) {
    [v6 _stateUpdate];
  }
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_23_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && [WeakRetained _rapportEventShouldUpdateState:v3]) {
    [v6 _stateUpdate];
  }
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__COCapabilityLegacyShim__rapportStart__block_invoke_24_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _rapportRegister];
    [*(id *)(a1 + 32) _stateUpdate];
  }
}

- (void)_rapportStop
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2217C1000, v0, v1, "Legacy Shim: stopping companion link", v2, v3, v4, v5, v6);
}

- (void)_rapportRegister
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(COCapabilityLegacyShim *)self rapport];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityLegacyShim__rapportRegister__block_invoke;
  v4[3] = &unk_2645CB358;
  v4[4] = self;
  [v3 registerRequestID:@"com.apple.SoundBoard.Capabilities" options:0 handler:v4];

  objc_destroyWeak(&location);
}

void __42__COCapabilityLegacyShim__rapportRegister__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  dispatch_queue_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = v8;
    v10 = [v9 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__COCapabilityLegacyShim__rapportRegister__block_invoke_2;
    block[3] = &unk_2645CB330;
    void block[4] = v9;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

uint64_t __42__COCapabilityLegacyShim__rapportRegister__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rapportProcessRequest:*(void *)(a1 + 40) emittingResponse:*(void *)(a1 + 48)];
}

- (void)_rapportDeregister
{
  id v2 = [(COCapabilityLegacyShim *)self rapport];
  [v2 deregisterRequestID:@"com.apple.SoundBoard.Capabilities"];
}

- (BOOL)_rapportEventShouldUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COCapabilityLegacyShim *)self rapport];
  id v6 = [v5 localDevice];
  char v7 = [v4 isEqual:v6];

  BOOL v8 = (v7 & 1) != 0 || [(COCapabilityLegacyShim *)self _isStereoPeer:v4];
  return v8;
}

- (void)_rapportProcessRequest:(id)a3 emittingResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(COCapabilityLegacyShim *)self _messageValidateRequest:v6])
  {
    BOOL v8 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _rapportProcessRequest:emittingResponse:]();
    }
  }
  id v9 = [(COCapabilityLegacyShim *)self _messageCreateResponse];
  (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0, 0);

  v10 = [(COCapabilityLegacyShim *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__COCapabilityLegacyShim__rapportProcessRequest_emittingResponse___block_invoke;
  block[3] = &unk_2645CB288;
  void block[4] = self;
  dispatch_async(v10, block);
}

uint64_t __66__COCapabilityLegacyShim__rapportProcessRequest_emittingResponse___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCompanionQueryNeeded] & 1) != 0
    || ([*(id *)(a1 + 32) isCompanionQueryUnsuccessful] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) isCompanionQueryIncompatible], result))
  {
    uint64_t v3 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: needs to query due to request", v4, 2u);
    }

    return [*(id *)(a1 + 32) _stateUpdate];
  }
  return result;
}

- (void)_rapportProcessResponse:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(COCapabilityLegacyShim *)self setCompanionQueryInProgress:0];
  if (v6 && !v7)
  {
    if ([(COCapabilityLegacyShim *)self _messageValidateResponse:v6])
    {
      BOOL v8 = [v6 objectForKey:@"supported"];
      id v9 = [(COCapabilityLegacyShim *)self _messageDecodeCapabilities:v8];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
        id v12 = COCoreLogForCategory(5);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v11;
          _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "Legacy Shim: response has Capabilities(%@)", buf, 0xCu);
        }
      }
      else
      {
        id v12 = COCoreLogForCategory(5);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.4();
        }
      }

      goto LABEL_25;
    }
    v16 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.5();
    }
LABEL_17:

    goto LABEL_18;
  }
  id v13 = [v7 domain];
  if (![v13 isEqualToString:*MEMORY[0x263F62C18]])
  {

LABEL_15:
    v16 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _rapportProcessResponse:error:]();
    }
    goto LABEL_17;
  }
  uint64_t v14 = [v7 code];

  if (v14 != -6714) {
    goto LABEL_15;
  }
  v15 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[COCapabilityLegacyShim _rapportProcessResponse:error:]();
  }

  [(COCapabilityLegacyShim *)self setCompanionQueryIncompatible:1];
  v10 = [MEMORY[0x263EFFA08] set];
LABEL_25:
  if (v10)
  {
    [(COCapabilityLegacyShim *)self setCompanionQueryUnsuccessful:0];
    [(COCapabilityLegacyShim *)self setCompanionCapabilities:v10];
    v27 = [(COCapabilityLegacyShim *)self supportedCapabilities];
    v28 = (void *)[v27 mutableCopy];

    v29 = [(COCapabilityLegacyShim *)self companionCapabilities];
    [v28 intersectSet:v29];

    [(COCapabilityLegacyShim *)self setAvailableCapabilities:v28];
    v30 = [(COCapabilityLegacyShim *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke;
    block[3] = &unk_2645CB288;
    void block[4] = self;
    dispatch_async(v30, block);

    goto LABEL_27;
  }
LABEL_18:
  if (![(COCapabilityLegacyShim *)self isCompanionQueryUnsuccessful])
  {
    [(COCapabilityLegacyShim *)self setCompanionQueryUnsuccessful:1];
    v17 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _rapportProcessResponse:error:](v17, v18, v19, v20, v21, v22, v23, v24);
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v25 = dispatch_walltime(0, 120000000000);
    v26 = [(COCapabilityLegacyShim *)self queue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke_27;
    v31[3] = &unk_2645CB2E0;
    objc_copyWeak(&v32, (id *)buf);
    dispatch_after(v25, v26, v31);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
LABEL_27:
}

uint64_t __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCompanionQueryNeeded];
  if (result)
  {
    uint64_t v3 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: refreshing due to pending query", v4, 2u);
    }

    return [*(id *)(a1 + 32) _stateUpdate];
  }
  return result;
}

void __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained
    && (([WeakRetained isCompanionQueryNeeded] & 1) != 0
     || [v2 isCompanionQueryUnsuccessful]))
  {
    uint64_t v3 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: query still needed after delay", v4, 2u);
    }

    [v2 _stateUpdate];
  }
}

- (id)_messageCreateRequest
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"version";
  v5[0] = &unk_26D3EB7D8;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)_messageCreateResponse
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"version";
  v5[1] = @"supported";
  v6[0] = &unk_26D3EB7D8;
  id v2 = [(COCapabilityLegacyShim *)self _messageEncodeCapabilities];
  v6[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (BOOL)_messageValidateRequest:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"version"];
  [v3 floatValue];
  float v5 = v4;

  id v6 = COCoreLogForCategory(5);
  id v7 = v6;
  if (v5 == 1.0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[COCapabilityLegacyShim _messageValidateRequest:](v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[COCapabilityLegacyShim _messageValidateRequest:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return v5 == 1.0;
}

- (BOOL)_messageValidateResponse:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"version"];
  [v3 floatValue];
  float v5 = v4;

  id v6 = COCoreLogForCategory(5);
  id v7 = v6;
  if (v5 == 1.0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[COCapabilityLegacyShim _messageValidateResponse:](v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[COCapabilityLegacyShim _messageValidateResponse:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return v5 == 1.0;
}

- (id)_messageEncodeCapabilities
{
  id v2 = [(COCapabilityLegacyShim *)self supportedCapabilities];
  uint64_t v3 = (void *)[v2 copy];

  id v11 = 0;
  float v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
  id v5 = v11;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    uint64_t v8 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _messageEncodeCapabilities]();
    }

    uint64_t v9 = [MEMORY[0x263EFF8F8] data];

    float v4 = (void *)v9;
  }

  return v4;
}

- (id)_messageDecodeCapabilities:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  float v4 = (void *)MEMORY[0x263EFFA08];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  id v6 = [v4 setWithArray:v5];

  id v23 = 0;
  BOOL v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v6 fromData:v3 error:&v23];
  id v8 = v23;
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v17 = COCoreLogForCategory(5);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[COCapabilityLegacyShim _messageDecodeCapabilities:]();
            }
            goto LABEL_18;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v16 = v11;
  }
  else
  {
    v17 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityLegacyShim _messageDecodeCapabilities:]();
    }
LABEL_18:

    id v16 = 0;
  }

  return v16;
}

- (NSSet)availableCapabilities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__COCapabilityLegacyShim_availableCapabilities__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  void v4[5] = &v5;
  [(COCapabilityLegacyShim *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

uint64_t __47__COCapabilityLegacyShim_availableCapabilities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setAvailableCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__COCapabilityLegacyShim_setAvailableCapabilities___block_invoke;
  v7[3] = &unk_2645CAED0;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = self;
  id v10 = &v11;
  [(COCapabilityLegacyShim *)self _withLock:v7];
  if (*((unsigned char *)v12 + 24))
  {
    id v6 = (void *)[v5 copy];
    [(COCapabilityLegacyShim *)self _notifyDelegate:v6];
  }
  _Block_object_dispose(&v11, 8);
}

void __51__COCapabilityLegacyShim_setAvailableCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isEqualToSet:*(void *)(*(void *)(a1 + 40) + 16)] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    id v5 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "Legacy Shim: available Capabilities updated(%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (NSSet)companionCapabilities
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__COCapabilityLegacyShim_companionCapabilities__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  void v4[5] = &v5;
  [(COCapabilityLegacyShim *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

uint64_t __47__COCapabilityLegacyShim_companionCapabilities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setCompanionCapabilities:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__COCapabilityLegacyShim_setCompanionCapabilities___block_invoke;
  void v6[3] = &unk_2645CAE80;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(COCapabilityLegacyShim *)self _withLock:v6];
}

void __51__COCapabilityLegacyShim_setCompanionCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isEqualToSet:*(void *)(*(void *)(a1 + 40) + 24)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;

    id v5 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 24);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "Legacy Shim: companion Capabilities updated(%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityLegacyShim *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 copy];
    int v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__COCapabilityLegacyShim__notifyDelegate___block_invoke;
    block[3] = &unk_2645CAEF8;
    id v10 = v5;
    uint64_t v11 = self;
    id v12 = v6;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __42__COCapabilityLegacyShim__notifyDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) legacyShim:*(void *)(a1 + 40) availableCapabilitiesChanged:*(void *)(a1 + 48)];
}

- (BOOL)_isStereoPairMember
{
  uint64_t v2 = [(COCapabilityLegacyShim *)self rapport];
  uint64_t v3 = [v2 localDevice];
  id v4 = [v3 mediaSystemIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_isStereoPeer:(id)a3
{
  id v4 = a3;
  if ([(COCapabilityLegacyShim *)self _isStereoPairMember])
  {
    BOOL v5 = [(COCapabilityLegacyShim *)self rapport];
    uint64_t v6 = [v5 localDevice];
    int v7 = [v6 mediaSystemIdentifier];

    id v8 = [v4 mediaSystemIdentifier];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_isStereoPeerActive
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (![(COCapabilityLegacyShim *)self _isStereoPairMember]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(COCapabilityLegacyShim *)self rapport];
  id v4 = [v3 activeDevices];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(COCapabilityLegacyShim *)self rapport];
        uint64_t v11 = [v10 localDevice];
        char v12 = [v9 isEqual:v11];

        if ((v12 & 1) == 0 && [(COCapabilityLegacyShim *)self _isStereoPeer:v9])
        {
          BOOL v13 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (COCapabilityLegacyShimDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COCapabilityLegacyShimDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (BOOL)isCompanionQueryInProgress
{
  return self->_companionQueryInProgress;
}

- (void)setCompanionQueryInProgress:(BOOL)a3
{
  self->_companionQueryInProgress = a3;
}

- (BOOL)isCompanionQueryNeeded
{
  return self->_companionQueryNeeded;
}

- (void)setCompanionQueryNeeded:(BOOL)a3
{
  self->_companionQueryNeeded = a3;
}

- (BOOL)isCompanionQueryUnsuccessful
{
  return self->_companionQueryUnsuccessful;
}

- (void)setCompanionQueryUnsuccessful:(BOOL)a3
{
  self->_companionQueryUnsuccessful = a3;
}

- (BOOL)isCompanionQueryIncompatible
{
  return self->_companionQueryIncompatible;
}

- (void)setCompanionQueryIncompatible:(BOOL)a3
{
  self->_companionQueryIncompatible = a3;
}

- (RPCompanionLinkClient)rapport
{
  return self->_rapport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapport, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_companionCapabilities, 0);
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2217C1000, v0, v1, "Legacy Shim: companion link invalidated", v2, v3, v4, v5, v6);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2217C1000, v0, v1, "Legacy Shim: Rapport local device updated", v2, v3, v4, v5, v6);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2217C1000, v0, v1, "Legacy Shim: Rapport device found", v2, v3, v4, v5, v6);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2217C1000, v0, v1, "Legacy Shim: Rapport device lost", v2, v3, v4, v5, v6);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim: Rapport activation failed: %@", v2, v3, v4, v5, v6);
}

- (void)_rapportProcessRequest:emittingResponse:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim: received invalid request %@", v2, v3, v4, v5, v6);
}

- (void)_rapportProcessResponse:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_rapportProcessResponse:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2217C1000, v0, v1, "Legacy Shim: response not handled - Capability check not supported by companion", v2, v3, v4, v5, v6);
}

- (void)_rapportProcessResponse:error:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2217C1000, v1, OS_LOG_TYPE_ERROR, "Legacy Shim: response missing(%@) or error(%@)", v2, 0x16u);
}

- (void)_rapportProcessResponse:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim: response(%@) lacks Capabilities", v2, v3, v4, v5, v6);
}

- (void)_rapportProcessResponse:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim: received invalid response(%@)", v2, v3, v4, v5, v6);
}

- (void)_messageValidateRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0x3FF0000000000000;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "Legacy Shim: received request (version %f)", (uint8_t *)&v1, 0xCu);
}

- (double)_messageValidateRequest:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217C1000, a1, a3, "Legacy Shim: received request with incompatible version (%f)", a5, a6, a7, a8, 0);
  return result;
}

- (void)_messageValidateResponse:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0x3FF0000000000000;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "Legacy Shim: received response (version %f)", (uint8_t *)&v1, 0xCu);
}

- (double)_messageValidateResponse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217C1000, a1, a3, "Legacy Shim: received response with incompatible version (%f)", a5, a6, a7, a8, 0);
  return result;
}

- (void)_messageEncodeCapabilities
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim: failed to encode: %@", v2, v3, v4, v5, v6);
}

- (void)_messageDecodeCapabilities:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2217C1000, v0, v1, "Legacy Shim failed to decode: %@", v2, v3, v4, v5, v6);
}

- (void)_messageDecodeCapabilities:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2217C1000, v0, v1, "Legacy Shim: failed type check", v2, v3, v4, v5, v6);
}

@end