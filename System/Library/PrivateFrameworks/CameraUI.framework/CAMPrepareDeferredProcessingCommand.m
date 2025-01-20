@interface CAMPrepareDeferredProcessingCommand
- (CAMPrepareDeferredProcessingCommand)initWithRequest:(id)a3 coordinator:(id)a4;
- (CAMStillImageCaptureRequest)_request;
- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator;
- (id)copyWithZone:(_NSZone *)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPrepareDeferredProcessingCommand

- (CAMPrepareDeferredProcessingCommand)initWithRequest:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMPrepareDeferredProcessingCommand;
  v9 = [(CAMCaptureCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__request, a3);
    objc_storeStrong((id *)&v10->__deferredProcessingCoordinator, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMPrepareDeferredProcessingCommand;
  v4 = [(CAMCaptureCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(CAMPrepareDeferredProcessingCommand *)self _request];
  v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(CAMPrepareDeferredProcessingCommand *)self _deferredProcessingCoordinator];
  id v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v9 = [(CAMPrepareDeferredProcessingCommand *)self _request];
  uint64_t v5 = [v9 capturePhotoSettingsWithContext:v4];
  v6 = [v4 currentStillImageOutput];

  uint64_t v7 = [v6 deferredSettingsForCapturingPhotoWithSettings:v5];
  id v8 = [(CAMPrepareDeferredProcessingCommand *)self _deferredProcessingCoordinator];
  [v8 prewarmWithPhotoSettings:v7 completionHandler:&__block_literal_global_27];
}

void __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (CAMStillImageCaptureRequest)_request
{
  return self->__request;
}

- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator
{
  return self->__deferredProcessingCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deferredProcessingCoordinator, 0);
  objc_storeStrong((id *)&self->__request, 0);
}

void __58__CAMPrepareDeferredProcessingCommand_executeWithContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to pre-warm deferred processing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end