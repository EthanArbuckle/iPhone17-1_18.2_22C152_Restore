@interface PHLivePhotoEditingContext
+ (id)errorWithUnderlyingError:(id)a3;
- (CGImagePropertyOrientation)orientation;
- (CIImage)fullSizeImage;
- (CMTime)duration;
- (CMTime)photoTime;
- (PHLivePhotoEditingContext)init;
- (PHLivePhotoEditingContext)initWithLivePhotoEditingInput:(PHContentEditingInput *)livePhotoInput;
- (PHLivePhotoFrameProcessingBlock)frameProcessor;
- (float)audioVolume;
- (void)cancel;
- (void)prepareLivePhotoForPlaybackWithTargetSize:(CGSize)targetSize options:(NSDictionary *)options completionHandler:(void *)handler;
- (void)saveLivePhotoToOutput:(PHContentEditingOutput *)output options:(NSDictionary *)options completionHandler:(void *)handler;
- (void)setAudioVolume:(float)audioVolume;
- (void)setFrameProcessor:(PHLivePhotoFrameProcessingBlock)frameProcessor;
@end

@implementation PHLivePhotoEditingContext

- (void).cxx_destruct
{
}

- (void)cancel
{
}

- (void)saveLivePhotoToOutput:(PHContentEditingOutput *)output options:(NSDictionary *)options completionHandler:(void *)handler
{
  v8 = output;
  v9 = options;
  v10 = handler;
  if (self->_editSession)
  {
    if ([(PHContentEditingOutput *)v8 isLoopingLivePhoto])
    {
      v11 = [(PHContentEditingOutput *)v8 renderURLWithExtensionForMediaType:1];
      [(PHContentEditingOutput *)v8 renderedContentURL];
    }
    else
    {
      v11 = [(PHContentEditingOutput *)v8 renderedContentURL];
      [(PHContentEditingOutput *)v8 renderedVideoComplementContentURL];
    v13 = };
    v14 = [MEMORY[0x1E4F8CC28] destinationWithPhotoURL:v11 videoURL:v13];
    editSession = self->_editSession;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__PHLivePhotoEditingContext_saveLivePhotoToOutput_options_completionHandler___block_invoke;
    v16[3] = &unk_1E58484E0;
    id v17 = v10;
    [(PFLivePhotoEditSession *)editSession exportToDestination:v14 options:v9 completionHandler:v16];
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    (*((void (**)(void *, void, void *))v10 + 2))(v10, 0, v12);
  }
}

uint64_t __77__PHLivePhotoEditingContext_saveLivePhotoToOutput_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareLivePhotoForPlaybackWithTargetSize:(CGSize)targetSize options:(NSDictionary *)options completionHandler:(void *)handler
{
  double height = targetSize.height;
  double width = targetSize.width;
  id v9 = handler;
  editSession = self->_editSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__PHLivePhotoEditingContext_prepareLivePhotoForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  v12[3] = &unk_1E58484B8;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  -[PFLivePhotoEditSession prepareForPlaybackWithTargetSize:options:completionHandler:](editSession, "prepareForPlaybackWithTargetSize:options:completionHandler:", options, v12, width, height);
}

void __97__PHLivePhotoEditingContext_prepareLivePhotoForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [(id)objc_opt_class() errorWithUnderlyingError:v9];

  if (v7)
  {
    id v11 = [v7 videoAsset];
    long long v22 = 0uLL;
    uint64_t v23 = 0;
    [v7 photoTime];
    v12 = [v8 videoComposition];
    if (v8)
    {
      [v8 audioVolume];
      float v14 = v13;
    }
    else
    {
      float v14 = 1.0;
    }
    [v7 photoExifOrientation];
    uint64_t v16 = PLImageOrientationFromExifOrientation();
    id v17 = [PHLivePhoto alloc];
    uint64_t v18 = [v7 photo];
    long long v20 = v22;
    uint64_t v21 = v23;
    v15 = [(PHLivePhoto *)v17 initWithImage:v18 uiOrientation:v16 videoAsset:v11 photoTime:&v20 asset:0 options:0 videoComposition:v12];
    *(float *)&double v19 = v14;
    [(PHLivePhoto *)v15 setAudioVolume:v19];
  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CGImagePropertyOrientation)orientation
{
  return [(PFLivePhotoEditSession *)self->_editSession orientation];
}

- (void)setAudioVolume:(float)audioVolume
{
}

- (float)audioVolume
{
  [(PFLivePhotoEditSession *)self->_editSession audioVolume];
  return result;
}

- (void)setFrameProcessor:(PHLivePhotoFrameProcessingBlock)frameProcessor
{
}

- (PHLivePhotoFrameProcessingBlock)frameProcessor
{
  return (PHLivePhotoFrameProcessingBlock)[(PFLivePhotoEditSession *)self->_editSession frameProcessor];
}

- (CMTime)photoTime
{
  float result = (CMTime *)self->_editSession;
  if (result) {
    return (CMTime *)[(CMTime *)result photoTime];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CMTime)duration
{
  float result = (CMTime *)self->_editSession;
  if (result) {
    return (CMTime *)[(CMTime *)result duration];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CIImage)fullSizeImage
{
  return (CIImage *)[(PFLivePhotoEditSession *)self->_editSession inputImage];
}

- (PHLivePhotoEditingContext)initWithLivePhotoEditingInput:(PHContentEditingInput *)livePhotoInput
{
  v4 = livePhotoInput;
  v5 = [(PHContentEditingInput *)v4 livePhoto];
  v6 = [v5 imageURL];
  id v7 = [v5 videoURL];
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  if (v5) {
    [v5 photoTime];
  }
  if ([(PHContentEditingInput *)v4 mediaSubtypes] == 8
    && [(PHContentEditingInput *)v4 playbackStyle] == 5)
  {
    long long v16 = *MEMORY[0x1E4F1FA48];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  }
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        if (BYTE12(v16))
        {
          v15.receiver = self;
          v15.super_class = (Class)PHLivePhotoEditingContext;
          self = [(PHLivePhotoEditingContext *)&v15 init];
          if (self)
          {
            id v8 = objc_alloc(MEMORY[0x1E4F8CC20]);
            uint64_t v9 = [(PHContentEditingInput *)v4 fullSizeImageOrientation];
            long long v13 = v16;
            uint64_t v14 = v17;
            v10 = (PFLivePhotoEditSession *)[v8 initWithPhotoURL:v6 videoURL:v7 photoTime:&v13 photoOrientation:v9];
            editSession = self->_editSession;
            self->_editSession = v10;
          }
        }
      }
    }
  }

  return self;
}

- (PHLivePhotoEditingContext)init
{
  return 0;
}

+ (id)errorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F8CEC8]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 3) {
        uint64_t v7 = 3072;
      }
      else {
        uint64_t v7 = -1;
      }
    }
    else
    {

      uint64_t v7 = -1;
    }
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", v7, 0);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end