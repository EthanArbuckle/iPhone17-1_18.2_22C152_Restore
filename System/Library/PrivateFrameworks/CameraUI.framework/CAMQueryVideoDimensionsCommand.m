@interface CAMQueryVideoDimensionsCommand
- (CAMQueryVideoDimensionsCommand)initWithCoder:(id)a3;
- (CAMQueryVideoDimensionsCommand)initWithCompletionBlock:(id)a3;
- (id)_completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setCompletionBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMQueryVideoDimensionsCommand

- (CAMQueryVideoDimensionsCommand)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMQueryVideoDimensionsCommand;
  v5 = [(CAMCaptureCommand *)&v9 initWithSubcommands:0];
  v6 = v5;
  if (v5)
  {
    [(CAMQueryVideoDimensionsCommand *)v5 _setCompletionBlock:v4];
    v7 = v6;
  }

  return v6;
}

- (CAMQueryVideoDimensionsCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQueryVideoDimensionsCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    if ([v4 decodeBoolForKey:@"CAMQueryVideoDimensionsCommandUnserializedCompletionBlock"])-[CAMQueryVideoDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_1); {
    v6 = v5;
    }
  }

  return v5;
}

void __48__CAMQueryVideoDimensionsCommand_initWithCoder___block_invoke()
{
  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMQueryVideoDimensionsCommandLensPosition could not be serialized so some behavior may be different.", v1, 2u);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMQueryVideoDimensionsCommand;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  if (self->__completionBlock) {
    [v4 encodeBool:1 forKey:@"CAMQueryVideoDimensionsCommandUnserializedCompletionBlock"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMQueryVideoDimensionsCommand;
  id v4 = [(CAMCaptureCommand *)&v7 copyWithZone:a3];
  objc_super v5 = [(CAMQueryVideoDimensionsCommand *)self _completionBlock];
  [v4 _setCompletionBlock:v5];

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentVideoDevice];
  objc_super v5 = [v4 activeFormat];
  v6 = (const opaqueCMFormatDescription *)[v5 formatDescription];
  if (v6)
  {
    uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v6);
    uint64_t v8 = (int)Dimensions;
    uint64_t v9 = Dimensions >> 32;
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(CAMQueryVideoDimensionsCommand *)v8 executeWithContext:v10];
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get video dimensions", v12, 2u);
    }
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }

  completionBlock = (void (**)(id, uint64_t, uint64_t))self->__completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, v8, v9);
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
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld", (uint8_t *)&v3, 0x16u);
}

@end