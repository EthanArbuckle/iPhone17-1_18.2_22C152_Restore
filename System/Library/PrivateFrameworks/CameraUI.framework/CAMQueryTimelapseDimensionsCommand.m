@interface CAMQueryTimelapseDimensionsCommand
- (CAMQueryTimelapseDimensionsCommand)initWithCoder:(id)a3;
- (CAMQueryTimelapseDimensionsCommand)initWithCompletionBlock:(id)a3;
- (id)_completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setCompletionBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMQueryTimelapseDimensionsCommand

- (CAMQueryTimelapseDimensionsCommand)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  v5 = [(CAMCaptureCommand *)&v9 initWithSubcommands:0];
  v6 = v5;
  if (v5)
  {
    [(CAMQueryTimelapseDimensionsCommand *)v5 _setCompletionBlock:v4];
    v7 = v6;
  }

  return v6;
}

- (CAMQueryTimelapseDimensionsCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    if ([v4 decodeBoolForKey:@"CAMQueryTimelapseDimensionsCommandUnserializedCompletionBlock"])-[CAMQueryTimelapseDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_46); {
    v6 = v5;
    }
  }

  return v5;
}

void __52__CAMQueryTimelapseDimensionsCommand_initWithCoder___block_invoke()
{
  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMQueryTimelapseDimensionsCommand could not be serialized so some behaviour may be different.", v1, 2u);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  if (self->__completionBlock) {
    [v4 encodeBool:1 forKey:@"CAMQueryTimelapseDimensionsCommandUnserializedCompletionBlock"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  id v4 = [(CAMCaptureCommand *)&v7 copyWithZone:a3];
  objc_super v5 = [(CAMQueryTimelapseDimensionsCommand *)self _completionBlock];
  [v4 _setCompletionBlock:v5];

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentVideoDevice];
  v6 = [v5 activeFormat];
  objc_super v7 = [v4 currentStillImageOutput];

  objc_super v8 = (const opaqueCMFormatDescription *)[v6 formatDescription];
  if (v8)
  {
    uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v8);
    uint64_t v10 = (int)Dimensions;
    uint64_t v11 = Dimensions >> 32;
    if ([v7 isImageOptimizationForOfflineVideoStabilizationSupported])
    {
      uint64_t v12 = [v7 optimizedImageDimensionsForOfflineStabilization];
      uint64_t v13 = (int)v12;
      uint64_t v14 = v12 >> 32;
      v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 134218752;
        uint64_t v20 = v10;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        __int16 v25 = 2048;
        uint64_t v26 = v14;
        _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld; overscan %ld, %ld",
          (uint8_t *)&v19,
          0x2Au);
      }

      if ((int)v13 * (uint64_t)(int)v11 == (int)v14 * (uint64_t)(int)v10)
      {
        uint64_t v16 = 1;
        goto LABEL_17;
      }
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Aspect ratio mismatch between original and overscan output dimensions", (uint8_t *)&v19, 2u);
      }
      uint64_t v16 = 1;
    }
    else
    {
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(CAMQueryTimelapseDimensionsCommand *)v10 executeWithContext:v17];
      }
      uint64_t v16 = 0;
      uint64_t v14 = v11;
      uint64_t v13 = v10;
    }
  }
  else
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get video dimensions", (uint8_t *)&v19, 2u);
    }
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }

LABEL_17:
  completionBlock = (void (**)(id, uint64_t, uint64_t, void, uint64_t, uint64_t))self->__completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, v10, v11, v13, v14, v16);
  }
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

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld; no overscan",
    (uint8_t *)&v3,
    0x16u);
}

@end