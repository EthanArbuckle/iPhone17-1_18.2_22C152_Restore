@interface RPBroadcastMP4ClipHandler
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)finishedProcessingMP4ClipWithUpdatedBroadcastConfiguration:(RPBroadcastConfiguration *)broadcastConfiguration error:(NSError *)error;
@end

@implementation RPBroadcastMP4ClipHandler

- (void)finishedProcessingMP4ClipWithUpdatedBroadcastConfiguration:(RPBroadcastConfiguration *)broadcastConfiguration error:(NSError *)error
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v6 = broadcastConfiguration;
  v7 = error;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v6;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "broadcast configuration = %p", buf, 0xCu);
  }
  if (v7)
  {
    v8 = [(RPBroadcastHandler *)self extensionContext];
    [v8 cancelRequestWithError:v7];
  }
  else
  {
    v8 = [MEMORY[0x263EFF980] array];
    if (v6)
    {
      v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6];
      id v10 = objc_alloc_init(MEMORY[0x263F08810]);
      id v11 = objc_alloc(MEMORY[0x263F086A0]);
      v12 = [NSString _rpLocalizationNotNeeded:@"RPBroadcastExtensionKeyBroadcastConfiguration"];
      v13 = (void *)[v11 initWithString:v12];
      [v10 setAttributedTitle:v13];

      id v14 = objc_alloc(MEMORY[0x263F088E0]);
      v15 = (void *)[v14 initWithItem:v9 typeIdentifier:*MEMORY[0x263F01A08]];
      v18 = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      [v10 setAttachments:v16];

      [v8 addObject:v10];
    }
    v17.receiver = self;
    v17.super_class = (Class)RPBroadcastMP4ClipHandler;
    [(RPBroadcastHandler *)&v17 _completeRequestWithReturnItems:v8];
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionContext", buf, 2u);
  }
  [(RPBroadcastHandler *)self setExtensionContext:v4];
  id v5 = (id)*MEMORY[0x263F01A08];
  *(void *)buf = 0;
  v29 = buf;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  v6 = [(RPBroadcastHandler *)self extensionContext];
  v7 = [v6 inputItems];
  uint64_t v8 = [v7 count];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v9 = [(RPBroadcastHandler *)self extensionContext];
  id v10 = [v9 inputItems];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke;
  v12[3] = &unk_26451D708;
  id v11 = v5;
  v15 = buf;
  v16 = v26;
  objc_super v17 = v24;
  v18 = v22;
  v19 = v21;
  uint64_t v20 = v8;
  id v13 = v11;
  id v14 = self;
  [v10 enumerateObjectsUsingBlock:v12];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(buf, 8);
}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attachments];
  id v5 = [v4 objectAtIndexedSubscript:0];

  if ([v5 hasItemConformingToTypeIdentifier:*(void *)(a1 + 32)])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2;
    v7[3] = &unk_26451D6E0;
    id v8 = v3;
    long long v10 = *(_OWORD *)(a1 + 56);
    long long v11 = *(_OWORD *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 88);
    long long v9 = *(_OWORD *)(a1 + 40);
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v7];
  }
}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2_cold_1();
    }
    goto LABEL_27;
  }
  id v8 = [*(id *)(a1 + 32) attributedTitle];
  long long v9 = [v8 string];
  int v10 = [v9 isEqualToString:@"RPBroadcastExtensionKeyMovieClipURL"];

  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "received movie clip URL", (uint8_t *)&v24, 2u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
LABEL_20:
    objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), a2);
    goto LABEL_21;
  }
  uint64_t v12 = [*(id *)(a1 + 32) attributedTitle];
  id v13 = [v12 string];
  int v14 = [v13 isEqualToString:@"RPBroadcastExtensionKeyExtensionUserInfo"];

  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "received user info", (uint8_t *)&v24, 2u);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    goto LABEL_20;
  }
  v15 = [*(id *)(a1 + 32) attributedTitle];
  v16 = [v15 string];
  int v17 = [v16 isEqualToString:@"RPBroadcastExtensionKeyRequestedFinish"];

  if (v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "received request finished", (uint8_t *)&v24, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v6 BOOLValue];
    goto LABEL_21;
  }
  v18 = [*(id *)(a1 + 32) attributedTitle];
  v19 = [v18 string];
  int v20 = [v19 isEqualToString:@"RPBroadcastExtensionKeyExtensionSandboxToken"];

  if (v20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "received sandbox token", (uint8_t *)&v24, 2u);
    }
    uint64_t v11 = *(void *)(a1 + 72);
    goto LABEL_20;
  }
LABEL_21:
  if (*(void *)(a1 + 88) == ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) UTF8String];
    uint64_t v21 = sandbox_extension_consume();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      uint64_t v25 = v21;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "received all data, consumed sandbox token ret=%llu", (uint8_t *)&v24, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "calling subclass method", (uint8_t *)&v24, 2u);
    }
    v22 = *(void **)(a1 + 40);
    id v23 = [NSURL URLWithString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v22 processMP4ClipWithURL:v23 setupInfo:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) finished:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
LABEL_27:
}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error loading input item for type", v0, 2u);
}

@end