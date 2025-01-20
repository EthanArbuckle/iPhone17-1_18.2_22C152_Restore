@interface CMContinuityCaptureTransportDeviceSidecarStream
- (BOOL)isMediaStream;
- (CMContinuityCaptureTransportDeviceSidecarStream)initWithSidecarStream:(id)a3 entity:(int64_t)a4 messageDelegate:(id)a5;
- (NSString)description;
- (NSString)streamIdentifier;
- (NSUUID)streamUUID;
- (SidecarStream)stream;
- (id)cipherKeyforSessionID:(id)a3;
- (int64_t)entity;
- (void)activate:(id)a3;
- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5;
@end

@implementation CMContinuityCaptureTransportDeviceSidecarStream

- (CMContinuityCaptureTransportDeviceSidecarStream)initWithSidecarStream:(id)a3 entity:(int64_t)a4 messageDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureTransportDeviceSidecarStream;
  v11 = [(CMContinuityCaptureTransportDeviceSidecarStream *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_messageDelegate, v10);
    objc_storeStrong((id *)&v12->_stream, a3);
    v12->_entity = a4;
    stream = v12->_stream;
    if (stream)
    {
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v15 = [(SidecarStream *)stream nwClientID];
      uint64_t v17 = v16;
      *(void *)&v26.byte0 = v15;
      *(void *)&v26.byte8 = v17;
      CFUUIDRef v18 = CFUUIDCreateFromUUIDBytes(v14, v26);
      v19 = (__CFString *)CFUUIDCreateString(v14, v18);
      v20 = v19;
      if (v19) {
        v19 = (__CFString *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v19];
      }
      v21 = v19;
    }
    else
    {
      v21 = 0;
    }
    streamUUID = v12->_streamUUID;
    v12->_streamUUID = (NSUUID *)v21;

    v12->_active = -1;
    v23 = v12;
  }

  return v12;
}

- (SidecarStream)stream
{
  return self->_stream;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSString)streamIdentifier
{
  return (NSString *)[(SidecarStream *)self->_stream identifier];
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (id)cipherKeyforSessionID:(id)a3
{
  stream = self->_stream;
  id v4 = a3;
  v5 = [(SidecarStream *)stream rapportStream];
  v6 = [v5 streamKey];
  v7 = CMContinuityCaptureCreateCipherKey(v6, v4);

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CMContinuityCaptureTransportDeviceSidecarStream *)self streamIdentifier];
  v7 = [v3 stringWithFormat:@"%@: %@ entity:%u [%p]", v5, v6, self->_entity, self];

  return (NSString *)v7;
}

- (BOOL)isMediaStream
{
  return (unint64_t)(self->_entity - 1) < 3;
}

- (void)activate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(CMContinuityCaptureTransportDeviceSidecarStream *)self streamIdentifier];
  if (self->_active == -1)
  {
    self->_active = 0;
    v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFUUIDRef v18 = self;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Activate", buf, 0xCu);
    }

    if (![(CMContinuityCaptureTransportDeviceSidecarStream *)self isMediaStream])
    {
      stream = self->_stream;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke;
      v13[3] = &unk_264C9A1B0;
      objc_copyWeak(&v15, &location);
      id v14 = v5;
      [(SidecarStream *)stream setHandler:v13];

      objc_destroyWeak(&v15);
    }
    id v9 = self->_stream;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke_6;
    v10[3] = &unk_264C992D8;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(SidecarStream *)v9 activateWithCompletion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870911 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v5 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        int v8 = 138543618;
        id v9 = v6;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got message %@", (uint8_t *)&v8, 0x16u);
      }
      id v7 = objc_loadWeakRetained(WeakRetained + 4);
      [v7 enqueueResponse:v3 identifier:*(void *)(a1 + 32)];
    }
  }
}

void __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3) {
      BOOL v5 = [v3 code] == 0;
    }
    else {
      BOOL v5 = 1;
    }
    WeakRetained[10] = v5;
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Activation complete Error %{public}@", (uint8_t *)&v8, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  id v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v9];
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:CMContinuityCaptureGetMessageGenerationID()];
  [v11 setObject:v12 forKeyedSubscript:@"ContinuityCaptureGID"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke;
  block[3] = &unk_264C99508;
  objc_copyWeak(&v35, location);
  id v13 = v8;
  id v33 = v13;
  id v14 = v10;
  id v34 = v14;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  objc_super v25 = __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke_11;
  CFUUIDBytes v26 = &unk_264C9A1D8;
  objc_copyWeak(&v31, location);
  id v16 = v15;
  id v29 = v16;
  id v17 = v11;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  id v19 = v14;
  id v30 = v19;
  v20 = (void *)MEMORY[0x237DFB780](&v23);
  -[SidecarStream sendOPACK:completion:](self->_stream, "sendOPACK:completion:", v17, v20, v23, v24, v25, v26);
  dispatch_time_t v21 = dispatch_time(0, 10000000000);
  v22 = dispatch_get_global_queue(2, 0);
  dispatch_after(v21, v22, v16);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);

  objc_destroyWeak(location);
}

void __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543618;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Message send timeout for %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870186 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 48));
    id v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureGID"];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureSelector"];
      int v9 = 138544386;
      id v10 = WeakRetained;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Message GID %{public}@ indentifier %{public}@ selector %{public}@ send error %@", (uint8_t *)&v9, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageDelegate);
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end