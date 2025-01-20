@interface AVBorealisServerPortManager
- (AVBorealisServerPortManager)initWithPortType:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5;
- (BOOL)lastStateSent;
- (BOOL)listeningEnabled;
- (float)hysteresisDurationSeconds;
- (id)notificationBlock;
- (int64_t)generation;
- (unint64_t)portType;
- (void)callNotificationBlock:(BOOL)a3;
- (void)notifyStateChanged:(BOOL)a3 onQueue:(id)a4;
- (void)setGeneration:(int64_t)a3;
- (void)setHysteresisDurationSeconds:(float)a3;
- (void)setLastStateSent:(BOOL)a3;
- (void)setListeningEnabled:(BOOL)a3;
- (void)setNotificationBlock:(id)a3;
- (void)setPortType:(unint64_t)a3;
@end

@implementation AVBorealisServerPortManager

- (void).cxx_destruct
{
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setLastStateSent:(BOOL)a3
{
  self->_lastStateSent = a3;
}

- (BOOL)lastStateSent
{
  return self->_lastStateSent;
}

- (void)setListeningEnabled:(BOOL)a3
{
  self->_listeningEnabled = a3;
}

- (BOOL)listeningEnabled
{
  return self->_listeningEnabled;
}

- (void)setNotificationBlock:(id)a3
{
}

- (id)notificationBlock
{
  return self->_notificationBlock;
}

- (void)setHysteresisDurationSeconds:(float)a3
{
  self->_hysteresisDurationSeconds = a3;
}

- (float)hysteresisDurationSeconds
{
  return self->_hysteresisDurationSeconds;
}

- (void)setPortType:(unint64_t)a3
{
  self->_portType = a3;
}

- (unint64_t)portType
{
  return self->_portType;
}

- (void)notifyStateChanged:(BOOL)a3 onQueue:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke;
  block[3] = &unk_1E5B13BD8;
  BOOL v10 = a3;
  block[4] = self;
  id v9 = v6;
  v7 = v6;
  dispatch_async(v7, block);
}

void __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = [*(id *)(a1 + 32) lastStateSent];
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = [*(id *)(a1 + 32) generation] + 1;
      [v4 setGeneration:v5];
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v12 = *(void **)(a1 + 32);
      [v12 callNotificationBlock:v11];
    }
  }
  else if (v3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 generation] + 1;
    [v6 setGeneration:v7];
    [*(id *)(a1 + 32) hysteresisDurationSeconds];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke_2;
    block[3] = &unk_1E5B13BB0;
    BOOL v10 = *(NSObject **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    void block[5] = v7;
    char v14 = *(unsigned char *)(a1 + 48);
    dispatch_after(v9, v10, block);
  }
}

uint64_t __58__AVBorealisServerPortManager_notifyStateChanged_onQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) generation];
  if (v2 == result)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    return [v4 callNotificationBlock:v5];
  }
  return result;
}

- (void)callNotificationBlock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_lastStateSent != a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    unint64_t portType = self->_portType;
    int v10 = 136315906;
    uint64_t v11 = "AVBorealisServer.mm";
    __int16 v12 = 1024;
    int v13 = 215;
    __int16 v14 = 1024;
    *(_DWORD *)v15 = v3;
    *(_WORD *)&v15[4] = 2048;
    *(void *)&v15[6] = portType;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d setting cached active state: %d for port: %lu", (uint8_t *)&v10, 0x22u);
  }
  self->_lastStateSent = v3;
  if (v3) {
    id v6 = "com.apple.coreaudio.speaker.active";
  }
  else {
    id v6 = "com.apple.coreaudio.speaker.inactive";
  }
  notify_post(v6);
  if (self->_listeningEnabled
    && (notificationBlock = (void (**)(id, unint64_t, BOOL))self->_notificationBlock) != 0)
  {
    notificationBlock[2](notificationBlock, self->_portType, v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    float v8 = _Block_copy(self->_notificationBlock);
    BOOL listeningEnabled = self->_listeningEnabled;
    int v10 = 136315906;
    uint64_t v11 = "AVBorealisServer.mm";
    __int16 v12 = 1024;
    int v13 = 231;
    __int16 v14 = 2048;
    *(void *)v15 = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = listeningEnabled;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d not calling notificationBlock(%p), listening is : %d ", (uint8_t *)&v10, 0x22u);
  }
}

- (AVBorealisServerPortManager)initWithPortType:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVBorealisServerPortManager;
  dispatch_time_t v9 = [(AVBorealisServerPortManager *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    v9->_unint64_t portType = a3;
    v9->_hysteresisDurationSeconds = a4;
    uint64_t v11 = [v8 copy];
    id notificationBlock = v10->_notificationBlock;
    v10->_id notificationBlock = (id)v11;

    *(_WORD *)&v10->_BOOL listeningEnabled = 1;
    v10->_generation = 0;
    if (a3 == 1) {
      v10->_BOOL listeningEnabled = 0;
    }
  }

  return v10;
}

@end