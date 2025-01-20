@interface ICDocCamPhotoCaptureDelegate
- (AVCapturePhotoSettings)requestedPhotoSettings;
- (BOOL)constantColorDeliveredFallBackPhoto;
- (BOOL)constantColorDeliveredOriginalPhoto;
- (ICDocCamPhotoCaptureDelegate)initWithRequestedPhotoSettings:(id)a3 willCapturePhotoAnimation:(id)a4 completed:(id)a5;
- (NSDictionary)metaData;
- (NSMutableDictionary)imageAttributes;
- (__CVBuffer)pbRef;
- (float)constantColorCenterWeightedMeanConfidenceLevel;
- (float)highestSharpness;
- (float)sharpnessForImageBuffer:(__CVBuffer *)a3;
- (id)completed;
- (id)willCapturePhotoAnimation;
- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4;
- (void)dealloc;
- (void)didFinish;
- (void)setCompleted:(id)a3;
- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3;
- (void)setConstantColorDeliveredFallBackPhoto:(BOOL)a3;
- (void)setConstantColorDeliveredOriginalPhoto:(BOOL)a3;
- (void)setHighestSharpness:(float)a3;
- (void)setImageAttributes:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setPbRef:(__CVBuffer *)a3;
- (void)setRequestedPhotoSettings:(id)a3;
- (void)setWillCapturePhotoAnimation:(id)a3;
@end

@implementation ICDocCamPhotoCaptureDelegate

- (ICDocCamPhotoCaptureDelegate)initWithRequestedPhotoSettings:(id)a3 willCapturePhotoAnimation:(id)a4 completed:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICDocCamPhotoCaptureDelegate;
  v11 = [(ICDocCamPhotoCaptureDelegate *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(ICDocCamPhotoCaptureDelegate *)v11 setRequestedPhotoSettings:v8];
    [(ICDocCamPhotoCaptureDelegate *)v12 setWillCapturePhotoAnimation:v9];
    [(ICDocCamPhotoCaptureDelegate *)v12 setCompleted:v10];
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(ICDocCamPhotoCaptureDelegate *)v12 setImageAttributes:v13];
  }
  return v12;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pbRef);
  self->_pbRef = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamPhotoCaptureDelegate;
  [(ICDocCamPhotoCaptureDelegate *)&v3 dealloc];
}

- (void)didFinish
{
  objc_super v3 = [(ICDocCamPhotoCaptureDelegate *)self completed];
  v4 = [(ICDocCamPhotoCaptureDelegate *)self pbRef];
  v5 = [(ICDocCamPhotoCaptureDelegate *)self metaData];
  v6 = [(ICDocCamPhotoCaptureDelegate *)self imageAttributes];
  ((void (**)(void, ICDocCamPhotoCaptureDelegate *, __CVBuffer *, void *, void *))v3)[2](v3, self, v4, v5, v6);

  [(ICDocCamPhotoCaptureDelegate *)self setRequestedPhotoSettings:0];

  [(ICDocCamPhotoCaptureDelegate *)self setPbRef:0];
}

- (void)setPbRef:(__CVBuffer *)a3
{
  pbRef = self->_pbRef;
  if (pbRef != a3)
  {
    CVPixelBufferRelease(pbRef);
    self->_pbRef = CVPixelBufferRetain(a3);
  }
}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  LODWORD(v4) = -8388609;
  -[ICDocCamPhotoCaptureDelegate setHighestSharpness:](self, "setHighestSharpness:", a3, a4, v4);
}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  double v4 = [(ICDocCamPhotoCaptureDelegate *)self willCapturePhotoAnimation];
  v4[2]();
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }

    goto LABEL_5;
  }
  id v18 = v9;
  v19 = (__CVBuffer *)[v18 pixelBuffer];
  v20 = [(ICDocCamPhotoCaptureDelegate *)self requestedPhotoSettings];
  if ([v20 isConstantColorEnabled])
  {
    v21 = [(ICDocCamPhotoCaptureDelegate *)self requestedPhotoSettings];
    if ([v21 isConstantColorFallbackPhotoDeliveryEnabled]) {
      int v22 = [v8 isFlashScene];
    }
    else {
      int v22 = 0;
    }

    int v23 = [v18 isConstantColorFallbackPhoto];
    if (v22)
    {
      if (v23)
      {
        if ([(ICDocCamPhotoCaptureDelegate *)self constantColorDeliveredOriginalPhoto])
        {
          [(ICDocCamPhotoCaptureDelegate *)self constantColorCenterWeightedMeanConfidenceLevel];
          if (v24 >= 0.9)
          {
            v25 = os_log_create("com.apple.documentcamera", "");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:](self);
            }

            v19 = [(ICDocCamPhotoCaptureDelegate *)self pbRef];
            v26 = [(ICDocCamPhotoCaptureDelegate *)self imageAttributes];
            [v26 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"constantColorPhoto"];
          }
        }
        [(ICDocCamPhotoCaptureDelegate *)self setConstantColorDeliveredFallBackPhoto:1];
      }
      else
      {
        if ([(ICDocCamPhotoCaptureDelegate *)self constantColorDeliveredFallBackPhoto])
        {
          [v18 constantColorCenterWeightedMeanConfidenceLevel];
          float v33 = v32;
          if (v32 < 0.9)
          {
            v34 = os_log_create("com.apple.documentcamera", "");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:](v18);
            }

            v19 = [(ICDocCamPhotoCaptureDelegate *)self pbRef];
          }
          v35 = [NSNumber numberWithBool:v33 >= 0.9];
          v36 = [(ICDocCamPhotoCaptureDelegate *)self imageAttributes];
          [v36 setObject:v35 forKeyedSubscript:@"constantColorPhoto"];
        }
        [v18 constantColorCenterWeightedMeanConfidenceLevel];
        -[ICDocCamPhotoCaptureDelegate setConstantColorCenterWeightedMeanConfidenceLevel:](self, "setConstantColorCenterWeightedMeanConfidenceLevel:");
        [(ICDocCamPhotoCaptureDelegate *)self setConstantColorDeliveredOriginalPhoto:1];
      }
      [(ICDocCamPhotoCaptureDelegate *)self sharpnessForImageBuffer:v19];
      [(ICDocCamPhotoCaptureDelegate *)self setPbRef:v19];
      CFDictionaryRef v37 = CMCopyDictionaryOfAttachments(0, v19, 1u);
      [(ICDocCamPhotoCaptureDelegate *)self setMetaData:v37];

      goto LABEL_5;
    }
  }
  else
  {

    [v18 isConstantColorFallbackPhoto];
  }
  [(ICDocCamPhotoCaptureDelegate *)self sharpnessForImageBuffer:v19];
  float v28 = v27;
  [(ICDocCamPhotoCaptureDelegate *)self highestSharpness];
  if (v28 > v29)
  {
    [(ICDocCamPhotoCaptureDelegate *)self setPbRef:v19];
    CFDictionaryRef v30 = CMCopyDictionaryOfAttachments(0, v19, 1u);
    [(ICDocCamPhotoCaptureDelegate *)self setMetaData:v30];

    *(float *)&double v31 = v28;
    [(ICDocCamPhotoCaptureDelegate *)self setHighestSharpness:v31];
  }
LABEL_5:
}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8
{
  id v8 = a8;
  if (v8)
  {
    id v9 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ICDocCamPhotoCaptureDelegate *)(uint64_t)v8 captureOutput:v10 didFinishProcessingLivePhotoToMovieFileAtURL:v11 duration:v12 photoDisplayTime:v13 resolvedSettings:v14 error:v15];
    }
  }
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  [(ICDocCamPhotoCaptureDelegate *)self didFinish];
}

- (float)sharpnessForImageBuffer:(__CVBuffer *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  vDSP_Length v6 = HeightOfPlane * WidthOfPlane;
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  src.data = BaseAddressOfPlane;
  src.height = HeightOfPlane;
  src.width = WidthOfPlane;
  src.rowBytes = BytesPerRowOfPlane;
  uint64_t v9 = (float *)malloc_type_calloc(HeightOfPlane * WidthOfPlane, 4uLL, 0x100004052888210uLL);
  uint64_t __StandardDeviation = 0;
  if (v9)
  {
    uint64_t v10 = v9;
    if (BytesPerRowOfPlane == WidthOfPlane)
    {
      vDSP_vfltu8((const unsigned __int8 *)BaseAddressOfPlane, 1, v9, 1, v6);
    }
    else
    {
      dest.data = v9;
      dest.height = HeightOfPlane;
      dest.width = WidthOfPlane;
      dest.rowBytes = 4 * WidthOfPlane;
      vImageConvert_Planar8toPlanarF(&src, &dest, 0.0, 255.0, 0);
    }
    int v20 = -1082130432;
    long long v16 = xmmword_21791AAB8;
    long long v17 = unk_21791AAC8;
    long long v18 = xmmword_21791AAD8;
    long long v19 = unk_21791AAE8;
    vImage_Buffer dest = *(vImage_Buffer *)ymmword_21791AA98;
    vDSP_f5x5(v10, HeightOfPlane, WidthOfPlane, (const float *)&dest, v10);
    vDSP_normalize(v10, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v6);
    free(v10);
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamPhotoCaptureDelegate sharpnessForImageBuffer:](v11);
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return *(float *)&__StandardDeviation;
}

- (AVCapturePhotoSettings)requestedPhotoSettings
{
  return self->_requestedPhotoSettings;
}

- (void)setRequestedPhotoSettings:(id)a3
{
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (__CVBuffer)pbRef
{
  return self->_pbRef;
}

- (float)highestSharpness
{
  return self->_highestSharpness;
}

- (void)setHighestSharpness:(float)a3
{
  self->_highestSharpness = a3;
}

- (NSMutableDictionary)imageAttributes
{
  return self->_imageAttributes;
}

- (void)setImageAttributes:(id)a3
{
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_constantColorCenterWeightedMeanConfidenceLevel;
}

- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3
{
  self->_constantColorCenterWeightedMeanConfidenceLevel = a3;
}

- (BOOL)constantColorDeliveredFallBackPhoto
{
  return self->_constantColorDeliveredFallBackPhoto;
}

- (void)setConstantColorDeliveredFallBackPhoto:(BOOL)a3
{
  self->_constantColorDeliveredFallBackPhoto = a3;
}

- (BOOL)constantColorDeliveredOriginalPhoto
{
  return self->_constantColorDeliveredOriginalPhoto;
}

- (void)setConstantColorDeliveredOriginalPhoto:(BOOL)a3
{
  self->_constantColorDeliveredOriginalPhoto = a3;
}

- (id)willCapturePhotoAnimation
{
  return self->_willCapturePhotoAnimation;
}

- (void)setWillCapturePhotoAnimation:(id)a3
{
}

- (id)completed
{
  return self->_completed;
}

- (void)setCompleted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completed, 0);
  objc_storeStrong(&self->_willCapturePhotoAnimation, 0);
  objc_storeStrong((id *)&self->_imageAttributes, 0);
  objc_storeStrong((id *)&self->_metaData, 0);

  objc_storeStrong((id *)&self->_requestedPhotoSettings, 0);
}

- (void)captureOutput:(void *)a1 didFinishProcessingPhoto:error:.cold.1(void *a1)
{
  [a1 constantColorCenterWeightedMeanConfidenceLevel];
  OUTLINED_FUNCTION_1(&dword_217885000, v1, v2, "captureOutput:didFinishProcessingPhoto: using original capture since it met the minimum confidence level (got %f)", v3, v4, v5, v6, 0);
}

- (void)captureOutput:(void *)a1 didFinishProcessingPhoto:error:.cold.2(void *a1)
{
  [a1 constantColorCenterWeightedMeanConfidenceLevel];
  OUTLINED_FUNCTION_1(&dword_217885000, v1, v2, "captureOutput:didFinishProcessingPhoto: ignoring constant color original capture since it didn't meet the minimum confidence level (got %f)", v3, v4, v5, v6, 0);
}

- (void)captureOutput:(uint64_t)a3 didFinishProcessingPhoto:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)captureOutput:(uint64_t)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(uint64_t)a4 duration:(uint64_t)a5 photoDisplayTime:(uint64_t)a6 resolvedSettings:(uint64_t)a7 error:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sharpnessForImageBuffer:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "sharpnessForImageBuffer unable to allocate floatPixels", v1, 2u);
}

@end