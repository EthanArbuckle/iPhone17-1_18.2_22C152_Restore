@interface CSSmartSiriVolumeController
- (CSSmartSiriVolumeClient)ssvClient;
- (CSSmartSiriVolumeController)init;
- (CSSmartSiriVolumeControllerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4;
- (void)_createSSVClientConnectionIfNeeded;
- (void)didSmartSiriVolumeChangeForReason:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)setSsvClient:(id)a3;
@end

@implementation CSSmartSiriVolumeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssvClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSsvClient:(id)a3
{
}

- (CSSmartSiriVolumeClient)ssvClient
{
  return self->_ssvClient;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSSmartSiriVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSmartSiriVolumeControllerDelegate *)WeakRetained;
}

- (void)didSmartSiriVolumeChangeForReason:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)p_delegate),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      v14 = "-[CSSmartSiriVolumeController didSmartSiriVolumeChangeForReason:]";
      __int16 v15 = 1026;
      int v16 = a3;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Notifying SSV Client on Volume change for reason - %{public}d", (uint8_t *)&v13, 0x12u);
    }
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 didTTSVolumeChange:self forReason:a3];
  }
  else
  {
    v12 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      v14 = "-[CSSmartSiriVolumeController didSmartSiriVolumeChangeForReason:]";
      __int16 v15 = 1026;
      int v16 = a3;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Dropped SSV Client notification for Volume change with reason - %{public}d", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (void)_createSSVClientConnectionIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_ssvClient)
  {
    v3 = objc_alloc_init(CSSmartSiriVolumeClient);
    ssvClient = self->_ssvClient;
    self->_ssvClient = v3;

    [(CSSmartSiriVolumeClient *)self->_ssvClient setDelegate:self];
    if (!self->_ssvClient)
    {
      v5 = *MEMORY[0x1E4F5D140];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315138;
        v7 = "-[CSSmartSiriVolumeController _createSSVClientConnectionIfNeeded]";
        _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume not available", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CSSmartSiriVolumeController_setPermanentVolumeOffsetWithDirection___block_invoke;
  v4[3] = &unk_1E658C870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void *__69__CSSmartSiriVolumeController_setPermanentVolumeOffsetWithDirection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createSSVClientConnectionIfNeeded];
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    return (void *)[result setPermanentVolumeOffsetWithDirection:v3];
  }
  return result;
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CSSmartSiriVolumeController_setSmartSiriVolumeDirection___block_invoke;
  v4[3] = &unk_1E658C870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void *__59__CSSmartSiriVolumeController_setSmartSiriVolumeDirection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createSSVClientConnectionIfNeeded];
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    return (void *)[result setSmartSiriVolumeDirection:v3];
  }
  return result;
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CSSmartSiriVolumeController_setSmartSiriVolumePercentage___block_invoke;
  v4[3] = &unk_1E658BDD8;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(queue, v4);
}

void *__60__CSSmartSiriVolumeController_setSmartSiriVolumePercentage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createSSVClientConnectionIfNeeded];
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    LODWORD(v2) = *(_DWORD *)(a1 + 40);
    return (void *)[result setSmartSiriVolumePercentage:v2];
  }
  return result;
}

- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14647;
  v19 = __Block_byref_object_dispose__14648;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CSSmartSiriVolumeController_getVolumeForTTSType_withContext___block_invoke;
  v11[3] = &unk_1E658AFC8;
  int v13 = &v15;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __63__CSSmartSiriVolumeController_getVolumeForTTSType_withContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _createSSVClientConnectionIfNeeded];
  double v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    uint64_t v3 = [v2 getVolumeForTTSType:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    float v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v7 = *MEMORY[0x1E4F5D140];
    id v8 = *MEMORY[0x1E4F5D140];
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v7;
        [v6 volumeEstimate];
        int v11 = 136315394;
        id v12 = "-[CSSmartSiriVolumeController getVolumeForTTSType:withContext:]_block_invoke";
        __int16 v13 = 2050;
        double v14 = v10;
        _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Estimated TTS volume : %{public}f", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSSmartSiriVolumeController getVolumeForTTSType:withContext:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get TTS Volume", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (CSSmartSiriVolumeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSmartSiriVolumeController;
  double v2 = [(CSSmartSiriVolumeController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ssv.clientq", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end