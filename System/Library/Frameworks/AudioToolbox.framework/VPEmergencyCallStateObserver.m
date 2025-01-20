@interface VPEmergencyCallStateObserver
- (OS_dispatch_queue)serialQueue;
- (TUCallCenter)underlyingCallCenter;
- (VPEmergencyCallStateObserver)initWithEmergencyCallStateHandler:(id)a3;
- (id)handler;
- (void)dealloc;
- (void)handleCallStatusChanged:(id)a3;
- (void)notifyInitialEmergencyCallStatus;
- (void)setHandler:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setUnderlyingCallCenter:(id)a3;
@end

@implementation VPEmergencyCallStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_underlyingCallCenter, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setUnderlyingCallCenter:(id)a3
{
}

- (TUCallCenter)underlyingCallCenter
{
  return self->_underlyingCallCenter;
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)handleCallStatusChanged:(id)a3
{
  id v5 = [a3 object];
  handler = (void (**)(id, uint64_t))self->_handler;
  if (handler) {
    handler[2](handler, [v5 isEmergency]);
  }
}

- (void)notifyInitialEmergencyCallStatus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke;
  aBlock[3] = &unk_1E623DA40;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  if (VPLogScope(void)::once != -1) {
    dispatch_once(&VPLogScope(void)::once, &__block_literal_global_30733);
  }
  v4 = (void **)VPLogScope(void)::scope;
  if (VPLogScope(void)::scope && CALegacyLog::LogEnabled(3, VPLogScope(void)::scope, 0))
  {
    id v5 = *v4;
    if (!*v4) {
      id v5 = (void *)MEMORY[0x1E4F14500];
    }
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "vpEmergencyCallStatusHandler.mm";
      __int16 v10 = 1024;
      int v11 = 63;
      _os_log_impl(&dword_1BB0CE000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying initial emergency call status!", buf, 0x12u);
    }
  }
  dispatch_async((dispatch_queue_t)self->_serialQueue, v3);
}

void __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) currentAudioAndVideoCalls];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke_2;
  v3[3] = &unk_1E623DA18;
  v3[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v4 isEmergency]);
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VPEmergencyCallStateObserver;
  [(VPEmergencyCallStateObserver *)&v4 dealloc];
}

- (VPEmergencyCallStateObserver)initWithEmergencyCallStateHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VPEmergencyCallStateObserver;
  id v5 = [(VPEmergencyCallStateObserver *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_handleCallStatusChanged_ name:*MEMORY[0x1E4FADDC0] object:0];
    v7 = _Block_copy(v4);
    id handler = v5->_handler;
    v5->_id handler = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.coreaudio.vpem", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4FADA98] callCenterWithQueue:v5->_serialQueue];
    underlyingCallCenter = v5->_underlyingCallCenter;
    v5->_underlyingCallCenter = (TUCallCenter *)v11;

    [(VPEmergencyCallStateObserver *)v5 notifyInitialEmergencyCallStatus];
  }

  return v5;
}

@end