@interface AVControlCenterCaptureDeviceWatcher
- (AVControlCenterCaptureDeviceWatcher)initWithSupportedVideoEffectsDidChangeHandler:(id)a3;
- (BOOL)backgroundBlurSupported;
- (BOOL)backgroundReplacementSupported;
- (BOOL)centerStageSupported;
- (BOOL)micModesSupported;
- (BOOL)reactionEffectsSupported;
- (BOOL)studioLightingSupported;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AVControlCenterCaptureDeviceWatcher

- (AVControlCenterCaptureDeviceWatcher)initWithSupportedVideoEffectsDidChangeHandler:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)AVControlCenterCaptureDeviceWatcher;
  v4 = [(AVControlCenterCaptureDeviceWatcher *)&v9 init];
  if (v4)
  {
    v4->_handler = (id)[a3 copy];
    if ((id)MGCopyAnswer() == (id)*MEMORY[0x1E4F1CFD0])
    {
      v11[0] = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
      v11[1] = @"AVCaptureDeviceTypeExternal";
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      uint64_t v6 = 0;
    }
    else
    {
      v10 = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      uint64_t v6 = 2;
    }
    v7 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v5 mediaType:*MEMORY[0x1E4F47C68] position:v6];
    v4->_discoverySession = v7;
    [(AVCaptureDeviceDiscoverySession *)v7 addObserver:v4 forKeyPath:@"devices" options:5 context:AVCCM_CaptureDeviceListChangedContext];
  }
  return v4;
}

- (void)dealloc
{
  [(AVCaptureDeviceDiscoverySession *)self->_discoverySession removeObserver:self forKeyPath:@"devices" context:AVCCM_CaptureDeviceListChangedContext];

  v3.receiver = self;
  v3.super_class = (Class)AVControlCenterCaptureDeviceWatcher;
  [(AVControlCenterCaptureDeviceWatcher *)&v3 dealloc];
}

- (BOOL)centerStageSupported
{
  return self->_centerStageSupported;
}

- (BOOL)backgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (BOOL)studioLightingSupported
{
  return self->_studioLightingSupported;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (BOOL)backgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((void *)AVCCM_CaptureDeviceListChangedContext == a6)
  {
    uint64_t v6 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v22 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    char v7 = 0;
    char v8 = 0;
    char v9 = 0;
    char v10 = 0;
    if (!v22) {
      goto LABEL_25;
    }
    uint64_t v21 = *(void *)v28;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v13 = (void *)[v12 formats];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
              if (v10)
              {
                char v10 = 1;
                if ((v9 & 1) == 0) {
                  goto LABEL_14;
                }
              }
              else
              {
                char v10 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) isCenterStageSupported];
                if ((v9 & 1) == 0)
                {
LABEL_14:
                  char v9 = [v18 isBackgroundBlurSupported];
                  if ((v7 & 1) == 0) {
                    goto LABEL_15;
                  }
                  goto LABEL_19;
                }
              }
              char v9 = 1;
              if ((v7 & 1) == 0)
              {
LABEL_15:
                char v7 = [v18 isStudioLightSupported];
                if ((v8 & 1) == 0) {
                  goto LABEL_16;
                }
                goto LABEL_20;
              }
LABEL_19:
              char v7 = 1;
              if ((v8 & 1) == 0)
              {
LABEL_16:
                char v8 = [v18 reactionEffectsSupported];
                goto LABEL_21;
              }
LABEL_20:
              char v8 = 1;
LABEL_21:
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);
        }
        ++v11;
      }
      while (v11 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (!v22)
      {
LABEL_25:
        self->_centerStageSupported = v10 & 1;
        self->_backgroundBlurSupported = v9 & 1;
        self->_studioLightingSupported = v7 & 1;
        self->_reactionEffectsSupported = v8 & 1;
        self->_backgroundReplacementSupported = 0;
        (*((void (**)(void))self->_handler + 2))();
        return;
      }
    }
  }
}

- (BOOL)micModesSupported
{
  return self->_micModesSupported;
}

@end