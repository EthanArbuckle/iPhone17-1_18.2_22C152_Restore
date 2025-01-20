@interface AVCaptureInput
+ (void)initialize;
- (NSArray)ports;
- (OpaqueCMClock)clock;
- (id)initSubclass;
- (id)session;
- (id)videoDevice;
- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AVCaptureInput

- (id)session
{
  return self->_inputInternal->session;
}

- (void)setSession:(id)a3
{
  self->_inputInternal->session = (AVCaptureSession *)a3;
}

uint64_t __44__AVCaptureInput_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v1 + 24)) {
    __44__AVCaptureInput_attachToFigCaptureSession___block_invoke_cold_1();
  }
  v3 = *(const void **)(a1 + 40);
  *(void *)(v1 + 24) = v3;
  if (v3) {
    CFRetain(v3);
  }
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 attachSafelyToFigCaptureSession:v5];
}

- (id)initSubclass
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureInput;
  v2 = [(AVCaptureInput *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureInputInternal);
    v2->_inputInternal = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVCaptureInput_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureInput;
  [(AVCaptureInput *)&v3 dealloc];
}

- (NSArray)ports
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (OpaqueCMClock)clock
{
  return 0;
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  objc_super v3 = *(const void **)(v4 + 8);
  if (v3 != *(const void **)(v2[1] + 24)) {
    __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke_cold_1();
  }
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    v2 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return [v2 detachSafelyFromFigCaptureSession:v5];
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVCaptureInput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E5A73288;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __68__AVCaptureInput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (id)videoDevice
{
  return 0;
}

void __44__AVCaptureInput_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureInput attachToFigCaptureSession:]_block_invoke", "AVCaptureInput.m", 110, "_inputInternal->figCaptureSession == NULL");
}

void __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureInput detachFromFigCaptureSession:]_block_invoke", "AVCaptureInput.m", 126, "figCaptureSession == _inputInternal->figCaptureSession");
}

@end