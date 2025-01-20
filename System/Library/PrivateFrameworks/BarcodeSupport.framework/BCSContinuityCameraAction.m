@interface BCSContinuityCameraAction
- (BCSContinuityCameraAction)initWithData:(id)a3 codePayload:(id)a4;
- (BOOL)isConnecting;
- (BOOL)isContinuityCameraAction;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)localizedDefaultActionDescription;
- (void)performDefaultAction;
- (void)performDefaultActionWithCompletionHandler:(id)a3;
- (void)setConnecting:(BOOL)a3;
@end

@implementation BCSContinuityCameraAction

- (BCSContinuityCameraAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSContinuityCameraAction;
  v8 = [(BCSAction *)&v11 initWithData:v6 codePayload:v7];
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (void)setConnecting:(BOOL)a3
{
  if (self->_connecting != a3)
  {
    self->_connecting = a3;
    id v4 = [(BCSAction *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 actionDidUpdateTitle:self];
    }
  }
}

- (BOOL)isContinuityCameraAction
{
  return 1;
}

- (id)localizedDefaultActionDescription
{
  if (self->_connecting) {
    v2 = @"Connecting to Apple TV…";
  }
  else {
    v2 = @"Connect to Apple TV";
  }
  v3 = _BCSLocalizedString(v2, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  return v3;
}

- (id)actionIconSystemImageName
{
  return @"appletv.fill";
}

- (id)actionPickerItems
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [BCSContinuityCameraActionPickerItem alloc];
  id v4 = [(BCSAction *)self localizedActionDescription];
  v5 = [(BCSActionPickerItem *)v3 initWithLabel:v4 action:self];
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)performDefaultAction
{
}

- (void)performDefaultActionWithCompletionHandler:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, id))a3;
  [(BCSContinuityCameraAction *)self setConnecting:1];
  v5 = (void *)MEMORY[0x263F08BA0];
  id v6 = [(BCSAction *)self data];
  id v7 = [v6 url];
  v8 = [v5 componentsWithURL:v7 resolvingAgainstBaseURL:0];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v10 = [v8 queryItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v15 = [v14 value];
          v16 = [v14 name];
          [v9 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v11);
    }

    id v33 = 0;
    v17 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:0 error:&v33];
    id v18 = v33;
    if (v18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(v18, "_bcs_privacyPreservingDescription");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Failed to serialize pairing info: %@", (uint8_t *)&buf, 0xCu);
      }
      BCSActionError(3);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v20);
    }
    else
    {
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2050000000;
      v21 = (void *)getRPRemoteDisplayDeviceClass_softClass;
      uint64_t v41 = getRPRemoteDisplayDeviceClass_softClass;
      if (!getRPRemoteDisplayDeviceClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v44 = __getRPRemoteDisplayDeviceClass_block_invoke;
        v45 = &unk_26468ACC8;
        v46 = &v38;
        __getRPRemoteDisplayDeviceClass_block_invoke((uint64_t)&buf);
        v21 = (void *)v39[3];
      }
      v22 = v21;
      _Block_object_dispose(&v38, 8);
      id v20 = objc_alloc_init(v22);
      v23 = [MEMORY[0x263F08C38] UUID];
      v24 = [v23 UUIDString];
      [v20 setIdentifier:v24];

      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2050000000;
      v25 = (void *)getRPRemoteDisplaySessionClass_softClass;
      uint64_t v41 = getRPRemoteDisplaySessionClass_softClass;
      if (!getRPRemoteDisplaySessionClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v44 = __getRPRemoteDisplaySessionClass_block_invoke;
        v45 = &unk_26468ACC8;
        v46 = &v38;
        __getRPRemoteDisplaySessionClass_block_invoke((uint64_t)&buf);
        v25 = (void *)v39[3];
      }
      v26 = v25;
      _Block_object_dispose(&v38, 8);
      v27 = (RPRemoteDisplaySession *)objc_alloc_init(v26);
      remoteDisplaySession = self->_remoteDisplaySession;
      self->_remoteDisplaySession = v27;

      [(RPRemoteDisplaySession *)self->_remoteDisplaySession setDestinationDevice:v20];
      if (remoteDisplaySessionQueue_onceToken != -1) {
        dispatch_once(&remoteDisplaySessionQueue_onceToken, &__block_literal_global_61);
      }
      [(RPRemoteDisplaySession *)self->_remoteDisplaySession setDispatchQueue:remoteDisplaySessionQueue_queue];
      if (objc_opt_respondsToSelector()) {
        [(RPRemoteDisplaySession *)self->_remoteDisplaySession setPairingInfo:v17];
      }
      [(RPRemoteDisplaySession *)self->_remoteDisplaySession setPasswordType:10];
      [(RPRemoteDisplaySession *)self->_remoteDisplaySession setServiceType:@"com.apple.ddui.guestpairing"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Connecting camera", (uint8_t *)&buf, 2u);
      }
      objc_initWeak((id *)&buf, self);
      v29 = self->_remoteDisplaySession;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke;
      v30[3] = &unk_26468BC30;
      v31 = v4;
      objc_copyWeak(&v32, (id *)&buf);
      [(RPRemoteDisplaySession *)v29 activateWithCompletion:v30];
      objc_destroyWeak(&v32);

      objc_destroyWeak((id *)&buf);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Failed to get URL components", (uint8_t *)&buf, 2u);
    }
    v9 = BCSActionError(3);
    v4[2](v4, v9);
  }
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2;
  block[3] = &unk_26468BC08;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v8);
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2(id *a1)
{
  v2 = a1 + 4;
  if (a1[4])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2_cold_1(v2);
    }
    id v3 = (void (**)(id, void *))a1[5];
    id v4 = BCSActionError(3);
    v3[2](v3, v4);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Successfully connected", buf, 2u);
    }
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_21;
    v6[3] = &unk_26468BBE0;
    objc_copyWeak(&v8, a1 + 6);
    id v7 = a1[5];
    dispatch_after(v5, MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v8);
  }
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_time_t v5 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Invalidating session and calling completion", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 13) invalidate];
    id v4 = (void *)v3[13];
    v3[13] = 0;

    [v3 setConnecting:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisplaySessionQueue, 0);
  objc_storeStrong((id *)&self->_remoteDisplaySession, 0);
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2_cold_1(id *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(*a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  id v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSContinuityCameraAction: Failed to connect: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end