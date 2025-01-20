@interface AVSCoreSpeechBridge
+ (id)sharedInstance;
- (AVSCoreSpeechBridge)init;
- (const)recordingASBD;
- (id)onBufferReceived;
- (id)onStopped;
- (void)commandControlListener:(id)a3 didStopUnexpectedly:(BOOL)a4;
- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4;
- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4 hostTime:(unint64_t)a5;
- (void)setOnBufferReceived:(id)a3;
- (void)setOnStopped:(id)a3;
- (void)startListening:(id)a3;
- (void)stopListening:(id)a3;
@end

@implementation AVSCoreSpeechBridge

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __37__AVSCoreSpeechBridge_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(AVSCoreSpeechBridge);

  return MEMORY[0x270F9A758]();
}

- (AVSCoreSpeechBridge)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVSCoreSpeechBridge;
  v2 = [(AVSCoreSpeechBridge *)&v6 init];
  if (v2)
  {
    v3 = (CSCommandControlListener *)objc_alloc_init(MEMORY[0x263F37F78]);
    commandControlListener = v2->_commandControlListener;
    v2->_commandControlListener = v3;

    [(CSCommandControlListener *)v2->_commandControlListener setDelegate:v2];
  }
  return v2;
}

- (const)recordingASBD
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
  v3 = (const AudioStreamBasicDescription *)[v2 streamDescription];

  return v3;
}

- (void)startListening:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_alloc_init(MEMORY[0x263F37F80]);
  commandControlListener = self->_commandControlListener;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __38__AVSCoreSpeechBridge_startListening___block_invoke;
  v17 = &unk_26521F680;
  v19 = &v27;
  v20 = &v21;
  v8 = v5;
  v18 = v8;
  [(CSCommandControlListener *)commandControlListener startListenWithOption:v6 completion:&v14];
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    *((unsigned char *)v28 + 24) = 0;
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08338];
    v32[0] = @"Timed out";
    v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, &v31, 1, v14, v15, v16, v17);
    uint64_t v12 = [v10 errorWithDomain:@"CoreSpeechBridge" code:-1 userInfo:v11];
    v13 = (void *)v22[5];
    v22[5] = v12;
  }
  if (v4) {
    v4[2](v4, *((unsigned __int8 *)v28 + 24), v22[5]);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __38__AVSCoreSpeechBridge_startListening___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)stopListening:(id)a3
{
  id v5 = a3;
  [(CSCommandControlListener *)self->_commandControlListener stopListenWithCompletion:&__block_literal_global_279];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
    v4 = v5;
  }
}

- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AVSCoreSpeechBridge *)self commandControlListener:v7 hasLPCMBufferAvailable:v6 hostTime:mach_absolute_time()];
}

- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4 hostTime:(unint64_t)a5
{
  id v6 = a4;
  if (v6 && self->_onBufferReceived)
  {
    id v12 = v6;
    id v7 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
    unint64_t v8 = (unint64_t)[v12 length] >> 1;
    dispatch_time_t v9 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v7 frameCapacity:v8];
    objc_msgSend(v9, "setFrameLength:", objc_msgSend(v9, "frameCapacity"));
    v10 = *(void **)[v9 int16ChannelData];
    id v11 = v12;
    memcpy(v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));

    (*((void (**)(void))self->_onBufferReceived + 2))();
    id v6 = v12;
  }
}

- (void)commandControlListener:(id)a3 didStopUnexpectedly:(BOOL)a4
{
  onStopped = (void (**)(id, BOOL))self->_onStopped;
  if (onStopped) {
    onStopped[2](onStopped, a4);
  }
}

- (id)onBufferReceived
{
  return self->_onBufferReceived;
}

- (void)setOnBufferReceived:(id)a3
{
}

- (id)onStopped
{
  return self->_onStopped;
}

- (void)setOnStopped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onStopped, 0);
  objc_storeStrong(&self->_onBufferReceived, 0);

  objc_storeStrong((id *)&self->_commandControlListener, 0);
}

@end