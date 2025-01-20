@interface AUHostDelegate
- (AUAudioUnit)audioUnit;
- (AUHostDelegate)init;
- (void)MIDICIProfileChanged:(unsigned __int8)a3 channel:(unsigned __int8)a4 profile:(id)a5 enabled:(BOOL)a6;
- (void)propertiesChanged:(id)a3;
- (void)setAudioUnit:(id)a3;
- (void)speechSynthesisMetadataAvailable:(id)a3 speechRequest:(id)a4;
- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7;
@end

@implementation AUHostDelegate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioUnit);
  objc_storeStrong((id *)&self->mParameterQueue, 0);
}

- (void)setAudioUnit:(id)a3
{
}

- (AUAudioUnit)audioUnit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  return (AUAudioUnit *)WeakRetained;
}

- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  mParameterQueue = self->mParameterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AUHostDelegate_syncParameter_value_extOriginator_hostTime_eventType___block_invoke;
  block[3] = &unk_1E5687770;
  block[4] = self;
  block[5] = a3;
  float v15 = a4;
  block[6] = a5;
  block[7] = a6;
  unsigned int v16 = a7;
  dispatch_async(mParameterQueue, block);
}

void __71__AUHostDelegate_syncParameter_value_extOriginator_hostTime_eventType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v3 = [WeakRetained parameterTree];
  LODWORD(v4) = *(_DWORD *)(a1 + 64);
  [v3 remoteSyncParameter:*(void *)(a1 + 40) value:*(void *)(a1 + 48) extOriginator:*(void *)(a1 + 56) hostTime:*(unsigned int *)(a1 + 68) eventType:v4];

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
}

- (void)speechSynthesisMetadataAvailable:(id)a3 speechRequest:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  p_audioUnit = &self->_audioUnit;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  v9 = [WeakRetained speechSynthesisOutputMetadataBlock];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_audioUnit);
    v11 = [v10 speechSynthesisOutputMetadataBlock];
    ((void (**)(void, id, id))v11)[2](v11, v12, v6);
  }
}

- (void)MIDICIProfileChanged:(unsigned __int8)a3 channel:(unsigned __int8)a4 profile:(id)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v15 = a5;
  p_audioUnit = &self->_audioUnit;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  id v12 = [WeakRetained profileChangedBlock];

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_audioUnit);
    v14 = [v13 profileChangedBlock];
    ((void (**)(void, uint64_t, uint64_t, id, BOOL))v14)[2](v14, v8, v7, v15, v6);
  }
}

- (void)propertiesChanged:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_audioUnit = &self->_audioUnit;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_loadWeakRetained((id *)p_audioUnit);
    [v8 propertiesChanged:v4];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
          id v14 = objc_loadWeakRetained((id *)p_audioUnit);
          objc_msgSend(v14, "willChangeValueForKey:", *(void *)(v13 + 8), (void)v16);

          id v15 = objc_loadWeakRetained((id *)p_audioUnit);
          [v15 didChangeValueForKey:*(void *)(v13 + 8)];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (AUHostDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)AUHostDelegate;
  v2 = [(AUHostDelegate *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AUHostExtensionContextParameterSyncQueue", 0);
    mParameterQueue = v2->mParameterQueue;
    v2->mParameterQueue = (OS_dispatch_queue *)v3;

    id v5 = v2->mParameterQueue;
    BOOL v6 = dispatch_get_global_queue(25, 0);
    dispatch_set_target_queue(v5, v6);
  }
  return v2;
}

@end