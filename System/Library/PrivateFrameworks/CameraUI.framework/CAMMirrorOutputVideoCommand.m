@interface CAMMirrorOutputVideoCommand
- (BOOL)isOutputMirrored;
- (CAMMirrorOutputVideoCommand)initWithOutputMirrored:(BOOL)a3;
- (id)_debugStringForMirroringMethod:(int64_t)a3;
- (id)_debugStringForSupportedMirroringMethods:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setVideoMirrored:(BOOL)a3 forOutput:(id)a4 requirePhysicalFlip:(BOOL)a5;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMMirrorOutputVideoCommand

- (CAMMirrorOutputVideoCommand)initWithOutputMirrored:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMMirrorOutputVideoCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_outputMirrored = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMMirrorOutputVideoCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMMirrorOutputVideoCommand *)self isOutputMirrored];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMMirrorOutputVideoCommand *)self isOutputMirrored];
  id v8 = [v4 currentStillImageOutput];
  objc_super v6 = [v4 currentMovieFileOutput];

  if (v5) {
    uint64_t v7 = [v8 isMovieRecordingEnabled];
  }
  else {
    uint64_t v7 = 0;
  }
  [(CAMMirrorOutputVideoCommand *)self _setVideoMirrored:v5 forOutput:v8 requirePhysicalFlip:v7];
  [(CAMMirrorOutputVideoCommand *)self _setVideoMirrored:v5 forOutput:v6 requirePhysicalFlip:v5];
}

- (void)_setVideoMirrored:(BOOL)a3 forOutput:(id)a4 requirePhysicalFlip:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = [v8 connectionWithMediaType:*MEMORY[0x263EF9D48]];
    v11 = v10;
    if (v10)
    {
      if ([v10 isVideoMirroringSupported])
      {
        if (v5) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 1;
        }
        v13 = [v11 supportedVideoMirroringMethodsForMovieRecording];
        v14 = [NSNumber numberWithInteger:v12];
        int v15 = [v13 containsObject:v14];

        if (v15)
        {
          [v11 setVideoMirroringMethodForMovieRecording:v12];
        }
        else if (v5)
        {
          v16 = [(CAMMirrorOutputVideoCommand *)self _debugStringForMirroringMethod:2];
          v17 = [(CAMMirrorOutputVideoCommand *)self _debugStringForSupportedMirroringMethods:v13];
          v18 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v19 = 138543874;
            v20 = v16;
            __int16 v21 = 2114;
            v22 = v17;
            __int16 v23 = 2114;
            v24 = v11;
            _os_log_error_impl(&dword_2099F8000, v18, OS_LOG_TYPE_ERROR, "Unsupported mirroring method %{public}@ (supported=%{public}@) for connection %{public}@", (uint8_t *)&v19, 0x20u);
          }
        }
        [v11 setAutomaticallyAdjustsVideoMirroring:0];
        [v11 setVideoMirrored:v6];
      }
      else
      {
        if (!v6)
        {
LABEL_20:

          goto LABEL_21;
        }
        v13 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:]((uint64_t)v9, v13);
        }
      }
    }
    else
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CAMMirrorOutputVideoCommand _setVideoMirrored:forOutput:requirePhysicalFlip:]((uint64_t)v9, v13);
      }
    }

    goto LABEL_20;
  }
LABEL_21:
}

- (id)_debugStringForMirroringMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_263FA2F48[a3];
  }
}

- (id)_debugStringForSupportedMirroringMethods:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__CAMMirrorOutputVideoCommand__debugStringForSupportedMirroringMethods___block_invoke;
  v10[3] = &unk_263FA2F28;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = self;
  [v5 enumerateObjectsUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __72__CAMMirrorOutputVideoCommand__debugStringForSupportedMirroringMethods___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  uint64_t v5 = [v8 integerValue];
  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) _debugStringForMirroringMethod:v5];
  [v6 appendString:v7];
}

- (BOOL)isOutputMirrored
{
  return self->_outputMirrored;
}

- (void)_setVideoMirrored:(uint64_t)a1 forOutput:(NSObject *)a2 requirePhysicalFlip:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to find video output connection for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_setVideoMirrored:(uint64_t)a1 forOutput:(NSObject *)a2 requirePhysicalFlip:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Video connection does not support mirroring for output %{public}@", (uint8_t *)&v2, 0xCu);
}

@end