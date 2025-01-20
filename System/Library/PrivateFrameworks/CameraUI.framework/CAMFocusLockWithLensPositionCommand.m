@interface CAMFocusLockWithLensPositionCommand
+ (float)currentLensPositionSentinel;
- (CAMFocusLockWithLensPositionCommand)initWithCoder:(id)a3;
- (CAMFocusLockWithLensPositionCommand)initWithLensPosition:(float)a3 completionBlock:(id)a4;
- (float)_lensPosition;
- (id)_completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setCompletionBlock:(id)a3;
- (void)_setLensPosition:(float)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFocusLockWithLensPositionCommand

+ (float)currentLensPositionSentinel
{
  return *MEMORY[0x263EF96B8];
}

- (CAMFocusLockWithLensPositionCommand)initWithLensPosition:(float)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  v7 = [(CAMCaptureCommand *)&v12 initWithSubcommands:0];
  v9 = v7;
  if (v7)
  {
    *(float *)&double v8 = a3;
    [(CAMFocusLockWithLensPositionCommand *)v7 _setLensPosition:v8];
    [(CAMFocusLockWithLensPositionCommand *)v9 _setCompletionBlock:v6];
    v10 = v9;
  }

  return v9;
}

- (CAMFocusLockWithLensPositionCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"CAMFocusLockWithLensPositionCommandLensPosition"];
    -[CAMFocusLockWithLensPositionCommand _setLensPosition:](v5, "_setLensPosition:");
    if ([v4 decodeBoolForKey:@"CAMFocusLockWithLensPositionCommandUnserializedCompletionBlock"])-[CAMFocusLockWithLensPositionCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_25); {
    id v6 = v5;
    }
  }

  return v5;
}

void __53__CAMFocusLockWithLensPositionCommand_initWithCoder___block_invoke()
{
  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMFocusLockWithLensPositionCommandLensPosition could not be serialized so some behavior may be different.", v1, 2u);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->__lensPosition;
  [v4 encodeFloat:@"CAMFocusLockWithLensPositionCommandLensPosition" forKey:v5];
  if (self->__completionBlock) {
    [v4 encodeBool:1 forKey:@"CAMFocusLockWithLensPositionCommandUnserializedCompletionBlock"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  id v4 = [(CAMCaptureCommand *)&v7 copyWithZone:a3];
  [(CAMFocusLockWithLensPositionCommand *)self _lensPosition];
  objc_msgSend(v4, "_setLensPosition:");
  double v5 = [(CAMFocusLockWithLensPositionCommand *)self _completionBlock];
  [v4 _setCompletionBlock:v5];

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 currentVideoDevice];
  if ([v5 isFocusModeSupported:0])
  {
    objc_super v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CAMFocusLockWithLensPositionCommand executeWithContext:](self, v6);
    }

    objc_initWeak(&location, v5);
    [(CAMFocusLockWithLensPositionCommand *)self _lensPosition];
    int v8 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__CAMFocusLockWithLensPositionCommand_executeWithContext___block_invoke;
    v10[3] = &unk_263FA38C8;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    LODWORD(v9) = v8;
    [v5 setFocusModeLockedWithLensPosition:v10 completionHandler:v9];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else if (self->__completionBlock)
  {
    [v5 lensPosition];
    (*((void (**)(void))self->__completionBlock + 2))();
  }
}

uint64_t __58__CAMFocusLockWithLensPositionCommand_executeWithContext___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32))
  {
    uint64_t v1 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    [WeakRetained lensPosition];
    unsigned __int32 v4 = v3;

    double v5 = *(uint64_t (**)(__n128))(*(void *)(*(void *)(v1 + 32) + 32) + 16);
    v6.n128_u32[0] = v4;
    return v5(v6);
  }
  return result;
}

- (float)_lensPosition
{
  return self->__lensPosition;
}

- (void)_setLensPosition:(float)a3
{
  self->__lensPosition = a3;
}

- (id)_completionBlock
{
  return self->__completionBlock;
}

- (void)_setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)executeWithContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a1 _lensPosition];
  int v4 = 134217984;
  double v5 = v3;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Locking lens position at %.4f", (uint8_t *)&v4, 0xCu);
}

@end