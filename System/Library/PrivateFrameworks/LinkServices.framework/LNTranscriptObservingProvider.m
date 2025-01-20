@interface LNTranscriptObservingProvider
- (LNNextActionObserverProtocol)observer;
- (LNTranscriptObservingProvider)initWithObserver:(id)a3;
- (LNTranscriptObservingProviderDelegate)delegate;
- (void)configureConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObserver:(id)a3;
- (void)startObservingNextActionStreamWithCompletion:(id)a3;
- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4;
@end

@implementation LNTranscriptObservingProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setObserver:(id)a3
{
}

- (LNNextActionObserverProtocol)observer
{
  return self->_observer;
}

- (void)setDelegate:(id)a3
{
}

- (LNTranscriptObservingProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LNTranscriptObservingProviderDelegate *)WeakRetained;
}

- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = getLNLogCategoryExecution();
  v9 = v8;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "stopping observation", "", buf, 2u);
  }

  v10 = [(LNTranscriptProvider *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke;
  v17[3] = &unk_1E5B3A550;
  id v11 = v6;
  id v18 = v11;
  v12 = [v10 remoteObjectProxyWithErrorHandler:v17];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke_15;
  v14[3] = &unk_1E5B3A578;
  id v15 = v11;
  id v16 = a3;
  id v13 = v11;
  [v12 stopObservingNextActionStreamWithConnectionUUID:v7 completion:v14];
}

void __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "XPC Error when executing stopObservingNextActionStream. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__LNTranscriptObservingProvider_stopObservingNextActionStreamWithConnectionUUID_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = getLNLogCategoryExecution();
  int v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v5, OS_SIGNPOST_INTERVAL_END, v6, "stopping observation", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startObservingNextActionStreamWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = getLNLogCategoryExecution();
  os_signpost_id_t v6 = v5;
  if ((unint64_t)&self->super.super.isa + 1 >= 2 && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "starting observation", "", buf, 2u);
  }

  *(void *)buf = 0;
  id v16 = buf;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__13880;
  v19 = __Block_byref_object_dispose__13881;
  id v20 = 0;
  uint64_t v7 = [(LNTranscriptProvider *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke;
  v14[3] = &unk_1E5B3A500;
  void v14[4] = buf;
  v14[5] = self;
  v8 = [v7 remoteObjectProxyWithErrorHandler:v14];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke_13;
  v10[3] = &unk_1E5B3A528;
  v12 = buf;
  id v13 = self;
  id v9 = v4;
  id v11 = v9;
  [v8 startObservingNextActionStreamWithCompletion:v10];

  _Block_object_dispose(buf, 8);
}

void __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "XPC Error when executing startObservingNextActionStream. error: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"LNTranscriptErrorDomain" code:1000 userInfo:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = getLNLogCategoryExecution();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v9, OS_SIGNPOST_INTERVAL_END, v10, "starting observation", "", (uint8_t *)&v11, 2u);
  }
}

void __78__LNTranscriptObservingProvider_startObservingNextActionStreamWithCompletion___block_invoke_13(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_ERROR, "Error when executing startObservingNextActionStream. error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v9 = getLNLogCategoryExecution();
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v10, OS_SIGNPOST_INTERVAL_END, v11, "starting observation", "", (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)configureConnection:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LNTranscriptObservingProvider;
  [(LNTranscriptProvider *)&v13 configureConnection:v4];
  objc_initWeak(&location, self);
  id v5 = [v4 interruptionHandler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__LNTranscriptObservingProvider_configureConnection___block_invoke;
  v9[3] = &unk_1E5B3A4D0;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v10 = v6;
  [v4 setInterruptionHandler:v9];
  uint64_t v7 = LNNextActionObserverXPCInterface();
  [v4 setExportedInterface:v7];

  uint64_t v8 = [(LNTranscriptObservingProvider *)self observer];
  [v4 setExportedObject:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__LNTranscriptObservingProvider_configureConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [WeakRetained delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [WeakRetained delegate];
      [v4 observingProviderObservationDidInterrupted:WeakRetained];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

- (LNTranscriptObservingProvider)initWithObserver:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNTranscriptObservingProvider;
  id v6 = [(LNTranscriptProvider *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observer, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

@end