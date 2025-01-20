@interface AVCaptureStillImageOutput
+ (NSData)jpegStillImageNSDataRepresentation:(CMSampleBufferRef)jpegSampleBuffer;
+ (__CFDictionary)_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (id)jpegStillImageNSDataRepresentationForSurface:(__IOSurface *)a3 size:(unint64_t)a4 metadata:(id)a5;
+ (unint64_t)maxStillImageJPEGDataSize;
+ (void)initialize;
- (AVCaptureStillImageOutput)init;
- (BOOL)_bracketedSettingsAreValid:(id)a3 fromConnection:(id)a4 exceptionReason:(id *)a5;
- (BOOL)_preparedForBracketedCaptureWithSettings:(id)a3;
- (BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart;
- (BOOL)isCapturingStillImage;
- (BOOL)isHighResolutionStillImageOutputEnabled;
- (BOOL)isLensStabilizationDuringBracketedCaptureEnabled;
- (BOOL)isLensStabilizationDuringBracketedCaptureSupported;
- (BOOL)isNoiseReductionEnabled;
- (BOOL)isStillImageStabilizationActive;
- (BOOL)isStillImageStabilizationSupported;
- (BOOL)squareCropEnabled;
- (CGSize)outputSizeForSourceFormat:(id)a3;
- (CGSize)previewImageSize;
- (NSArray)availableImageDataCVPixelFormatTypes;
- (NSArray)availableImageDataCodecTypes;
- (NSDictionary)outputSettings;
- (NSUInteger)maxBracketedCaptureStillImageCount;
- (id)_figCaptureStillImageSettingsForBracketedCaptureSettingsArray:(id)a3 fromConnection:(id)a4;
- (id)_figCaptureStillImageSettingsForConnection:(id)a3;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)firstActiveConnection;
- (unsigned)imageDataFormatType;
- (unsigned)shutterSound;
- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3;
- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:(id)a3;
- (void)_updateMaxBracketedStillImageCaptureCountForSourceFormat:(id)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)captureStillImageAsynchronouslyFromConnection:(AVCaptureConnection *)connection completionHandler:(void *)handler;
- (void)captureStillImageBracketAsynchronouslyFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler;
- (void)captureStillImageSurfaceAsynchronouslyFromConnection:(id)a3 completionHandler:(id)a4;
- (void)clearPreparedBracketIfNeeded;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3;
- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3;
- (void)handleCenterStageActiveChangedForDevice:(id)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)handleNotification:(id)a3 payload:(id)a4;
- (void)handleNotificationForPrepareRequest:(id)a3 withPayload:(id)a4;
- (void)handleNotificationForRequest:(id)a3 withPayload:(id)a4 imageIsEV0:(BOOL *)a5;
- (void)handleStudioLightingActiveChangedForDevice:(id)a3;
- (void)prepareToCaptureStillImageBracketFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler;
- (void)removeConnection:(id)a3;
- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setAutomaticallyEnablesStillImageStabilizationWhenAvailable:(BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable;
- (void)setHighResolutionStillImageOutputEnabled:(BOOL)highResolutionStillImageOutputEnabled;
- (void)setLensStabilizationDuringBracketedCaptureEnabled:(BOOL)lensStabilizationDuringBracketedCaptureEnabled;
- (void)setNoiseReductionEnabled:(BOOL)a3;
- (void)setOutputSettings:(NSDictionary *)outputSettings;
- (void)setPreviewImageSize:(CGSize)a3;
- (void)setShutterSound:(unsigned int)a3;
- (void)setSquareCropEnabled:(BOOL)a3;
- (void)updateSISSupportedForSourceDevice:(id)a3;
@end

@implementation AVCaptureStillImageOutput

+ (void)initialize
{
}

- (AVCaptureStillImageOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureStillImageOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)updateSISSupportedForSourceDevice:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSISSupported");
  internal = self->_internal;
  if (internal->SISSupported == v5) {
    return;
  }
  BOOL v7 = v5;
  if (!internal->SISSupported)
  {
    int SISEnabled = 0;
    if (v5) {
      goto LABEL_4;
    }
LABEL_6:
    int v9 = 0;
    goto LABEL_7;
  }
  int SISEnabled = internal->SISEnabled;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  int v9 = internal->SISEnabled;
LABEL_7:
  BOOL v10 = (__CFString *)[a3 deviceType] == @"AVCaptureDeviceTypeBuiltInDualCamera" && v7;
  [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"stillImageStabilizationSupported"];
  if (SISEnabled == v9)
  {
    self->_internal->SISSupported = v7;
    self->_internal->bravoImageFusionSupported = v10;
  }
  else
  {
    [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"automaticallyEnablesStillImageStabilizationWhenAvailable"];
    self->_internal->SISSupported = v7;
    self->_internal->bravoImageFusionSupported = v10;
    [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"automaticallyEnablesStillImageStabilizationWhenAvailable"];
  }

  [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"stillImageStabilizationSupported"];
}

- (void)clearPreparedBracketIfNeeded
{
  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal;
  if (v4->preparedBracket.imageCount)
  {
    if (v4->imageDataFormatType != v4->preparedBracket.outputFormat
      || (CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat"), "formatDescription")), v4 = self->_internal, *(void *)&v4->preparedBracket.outputWidth != Dimensions))
    {
      *(void *)&v4->preparedBracket.outputWidth = 0;
      *(void *)&v4->preparedBracket.imageCount = 0;
    }
  }

  objc_sync_exit(internal);
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureStillImageOutput;
  id v5 = [(AVCaptureOutput *)&v8 addConnection:a3 error:a4];
  v6 = (void *)[v5 sourceDevice];
  [(AVCaptureStillImageOutput *)self updateSISSupportedForSourceDevice:v6];
  [(AVCaptureStillImageOutput *)self _setStillImageStabilizationAutomaticallyEnabled:[(AVCaptureStillImageOutput *)self automaticallyEnablesStillImageStabilizationWhenAvailable]];
  -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", [v6 activeFormat]);
  [(AVCaptureStillImageOutput *)self _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:v6];
  return v5;
}

- (void)removeConnection:(id)a3
{
  [(AVCaptureStillImageOutput *)self _setStillImageStabilizationAutomaticallyEnabled:0];
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutput;
  [(AVCaptureOutput *)&v5 removeConnection:a3];
  [(AVCaptureStillImageOutput *)self updateSISSupportedForSourceDevice:0];
  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:0];
  [(AVCaptureStillImageOutput *)self _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:0];
}

- (NSDictionary)outputSettings
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_internal->outputSettings];
}

- (void)setOutputSettings:(NSDictionary *)outputSettings
{
  self->_internal->outputSettings = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:outputSettings];
  id v5 = [(NSDictionary *)outputSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  id v6 = [(NSDictionary *)outputSettings objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
  id v7 = [(NSDictionary *)outputSettings objectForKeyedSubscript:*MEMORY[0x1E4F47D88]];
  if (!v5)
  {
    if (!v6)
    {
LABEL_8:
      self->_internal->jpegQualitySpecified = 0;
      if (!v7)
      {
LABEL_24:
        [(AVCaptureStillImageOutput *)self clearPreparedBracketIfNeeded];
        return;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_internal->imageDataFormatType == 1785750887)
        {
          [v7 floatValue];
          if (v9 >= 0.0 && v9 <= 1.0)
          {
            self->_internal->jpegQualitySpecified = 1;
            self->_internal->jpegQuality = v9;
            goto LABEL_24;
          }
          v11 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v12 = *MEMORY[0x1E4F1C3C8];
        }
        else
        {
          v11 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v12 = *MEMORY[0x1E4F1C3C8];
        }
      }
      else
      {
        v11 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      }
      goto LABEL_21;
    }
    if (![(NSArray *)[(AVCaptureStillImageOutput *)self availableImageDataCodecTypes] containsObject:v6])
    {
      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      uint64_t v19 = (uint64_t)v6;
LABEL_21:
      uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector();
      v16 = v11;
      uint64_t v17 = v12;
      goto LABEL_22;
    }
    unsigned int v8 = AVOSTypeForString();
LABEL_7:
    self->_internal->imageDataFormatType = v8;
    goto LABEL_8;
  }
  if ([(NSArray *)[(AVCaptureStillImageOutput *)self availableImageDataCVPixelFormatTypes] containsObject:v5])
  {
    unsigned int v8 = [v5 intValue];
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v14 = *MEMORY[0x1E4F1C3C8];
  [v5 intValue];
  uint64_t v19 = AVStringForOSType();
  uint64_t v20 = [v5 intValue];
  uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector();
  v16 = v13;
  uint64_t v17 = v14;
LABEL_22:
  v18 = objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0, v19, v20);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v18);
  }
  NSLog(&cfstr_SuppressingExc.isa, v18);
}

- (NSArray)availableImageDataCVPixelFormatTypes
{
  return (NSArray *)&unk_1EF4FAA28;
}

- (NSArray)availableImageDataCodecTypes
{
  result = (NSArray *)availableImageDataCodecTypes_availableTypes;
  if (!availableImageDataCodecTypes_availableTypes)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
    result = (NSArray *)objc_msgSend(v3, "initWithObjects:", *MEMORY[0x1E4F47D38], 0);
    availableImageDataCodecTypes_availableTypes = (uint64_t)result;
  }
  return result;
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C68];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  id v7 = (void *)[a3 mediaType];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v8 = 2;
LABEL_5:
    float v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  [(AVCaptureStillImageOutput *)self updateSISSupportedForSourceDevice:a4];
  [(AVCaptureStillImageOutput *)self _setStillImageStabilizationAutomaticallyEnabled:[(AVCaptureStillImageOutput *)self automaticallyEnablesStillImageStabilizationWhenAvailable]];
  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:a3];
  [(AVCaptureStillImageOutput *)self _updateLensStabilizationDuringBracketedCaptureSupportedForDevice:a4];
  [(AVCaptureStillImageOutput *)self clearPreparedBracketIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  [(AVCaptureOutput *)&v7 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)handleCenterStageActiveChangedForDevice:(id)a3
{
  uint64_t v4 = [a3 activeFormat];

  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:v4];
}

- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  uint64_t v4 = [a3 activeFormat];

  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:v4];
}

- (void)handleStudioLightingActiveChangedForDevice:(id)a3
{
  uint64_t v4 = [a3 activeFormat];

  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:v4];
}

- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  uint64_t v4 = [a3 activeFormat];

  [(AVCaptureStillImageOutput *)self _updateMaxBracketedStillImageCaptureCountForSourceFormat:v4];
}

- (BOOL)squareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_internal->squareCropEnabled = a3;
}

- (CGSize)previewImageSize
{
  internal = self->_internal;
  double width = internal->previewImageSize.width;
  double height = internal->previewImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviewImageSize:(CGSize)a3
{
  self->_internal->previewImageSize = a3;
}

- (unsigned)imageDataFormatType
{
  return self->_internal->imageDataFormatType;
}

- (BOOL)isStillImageStabilizationSupported
{
  return self->_internal->SISSupported;
}

- (BOOL)isStillImageStabilizationActive
{
  return self->_internal->SISActive;
}

- (BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable
{
  internal = self->_internal;
  return internal->SISSupported && internal->SISEnabled;
}

- (void)setAutomaticallyEnablesStillImageStabilizationWhenAvailable:(BOOL)automaticallyEnablesStillImageStabilizationWhenAvailable
{
  if ([(AVCaptureStillImageOutput *)self isStillImageStabilizationSupported])
  {
    self->_internal->int SISEnabled = automaticallyEnablesStillImageStabilizationWhenAvailable;
    BOOL v5 = [(AVCaptureStillImageOutput *)self automaticallyEnablesStillImageStabilizationWhenAvailable];
    [(AVCaptureStillImageOutput *)self _setStillImageStabilizationAutomaticallyEnabled:v5];
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isHighResolutionStillImageOutputEnabled
{
  return self->_internal->highResStillEnabled;
}

- (void)setHighResolutionStillImageOutputEnabled:(BOOL)highResolutionStillImageOutputEnabled
{
  internal = self->_internal;
  if (internal->highResStillEnabled != highResolutionStillImageOutputEnabled)
  {
    internal->highResStillEnabled = highResolutionStillImageOutputEnabled;
    BOOL v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
    if (v5)
    {
      id v6 = v5;
      -[AVCaptureStillImageOutput _updateMaxBracketedStillImageCaptureCountForSourceFormat:](self, "_updateMaxBracketedStillImageCaptureCountForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v5, "sourceDevice"), "activeFormat"));
      -[AVCaptureOutput updateMetadataTransformForSourceFormat:](self, "updateMetadataTransformForSourceFormat:", objc_msgSend(-[AVCaptureConnection sourceDevice](v6, "sourceDevice"), "activeFormat"));
      if ([(AVCaptureStillImageOutput *)self highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart])
      {
        [(AVCaptureOutput *)self bumpChangeSeed];
      }
    }
  }
}

- (BOOL)highResolutionStillImageOutputEnabledChangeCausesCaptureSessionRestart
{
  v2 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if (v2)
  {
    id v3 = objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "activeFormat");
    LOBYTE(v2) = [v3 supportsQuadraHighResolutionStillImageOutput];
  }
  return (char)v2;
}

- (BOOL)isNoiseReductionEnabled
{
  return self->_internal->noiseReductionEnabled;
}

- (void)setNoiseReductionEnabled:(BOOL)a3
{
  self->_internal->noiseReductionEnabled = a3;
}

- (unsigned)shutterSound
{
  return self->_internal->shutterSoundID;
}

- (void)setShutterSound:(unsigned int)a3
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementShutterSoundManipulation))
  {
    self->_internal->shutterSoundID = a3;
  }
  else
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (BOOL)isCapturingStillImage
{
  return self->_internal->isCapturingPhoto;
}

- (id)firstActiveConnection
{
  id v2 = [(AVCaptureOutput *)self liveConnections];

  return (id)[v2 firstObject];
}

- (id)_figCaptureStillImageSettingsForConnection:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  atomic_fetch_add_explicit(&_figCaptureStillImageSettingsForConnection__gSettingsID, 1uLL, memory_order_relaxed);
  id v5 = objc_alloc(MEMORY[0x1E4F50F90]);
  id v6 = (id)[v5 initWithSettingsID:_figCaptureStillImageSettingsForConnection__gSettingsID];
  objc_super v7 = (void *)[a3 sourceDevice];
  uint64_t v8 = (void *)[v7 activeFormat];
  float v9 = v8;
  if (self->_internal->highResStillEnabled && ([v8 supportsHighResolutionStillImageOutput] & 1) != 0)
  {
    unint64_t v10 = 0;
    CMVideoDimensions Dimensions = 0;
    int v12 = 1;
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v9 formatDescription]);
    int v12 = 0;
    unint64_t v10 = HIDWORD(*(unint64_t *)&Dimensions);
  }
  [v6 setOutputFormat:self->_internal->imageDataFormatType];
  if ([v6 outputFormat] == 1785750887) {
    uint64_t v13 = 1785096550;
  }
  else {
    uint64_t v13 = 0;
  }
  [v6 setOutputFileType:v13];
  [v6 setSquareCropEnabled:self->_internal->squareCropEnabled];
  [v6 setOutputWidth:Dimensions];
  [v6 setOutputHeight:v10];
  objc_msgSend(v6, "setOutputMirroring:", objc_msgSend(a3, "isVideoMirrored"));
  objc_msgSend(v6, "setOutputOrientation:", objc_msgSend(a3, "videoOrientation"));
  BOOL v14 = 0;
  internal = self->_internal;
  if (internal->previewImageSize.width > 0.0) {
    BOOL v14 = internal->previewImageSize.height > 0.0;
  }
  [v6 setPreviewEnabled:v14];
  if ([v6 previewEnabled])
  {
    v16 = self->_internal;
    double width = v16->previewImageSize.width;
    double height = v16->previewImageSize.height;
    unsigned int v19 = [v6 outputWidth];
    unsigned int v20 = [v6 outputHeight];
    if (v12)
    {
      uint64_t v21 = [v9 highResolutionStillImageDimensions];
      double v22 = (double)(int)v21;
      double v23 = (double)SHIDWORD(v21);
    }
    else
    {
      double v22 = (double)v19;
      double v23 = (double)v20;
    }
    if (v22 >= v23) {
      double v24 = v23;
    }
    else {
      double v24 = v22;
    }
    if (self->_internal->squareCropEnabled) {
      double v25 = v24;
    }
    else {
      double v25 = v23;
    }
    if (self->_internal->squareCropEnabled) {
      double v22 = v24;
    }
    if (v22 <= width && v25 <= height)
    {
      [v6 setPreviewWidth:v22];
      uint64_t v29 = v25;
    }
    else
    {
      float v27 = v22 / v25;
      float v28 = width / height;
      if (vabds_f32(v27, v28) >= 0.01)
      {
        v47.origin.x = 0.0;
        v47.origin.y = 0.0;
        double v30 = v25;
        v47.size.double width = width;
        v47.size.double height = height;
        CGRect v46 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)&v22, v47);
        double v31 = v46.size.height;
        *(float *)&v46.origin.x = v46.size.width * 0.5;
        [v6 setPreviewWidth:2 * llroundf(*(float *)&v46.origin.x)];
        float v32 = v31 * 0.5;
        uint64_t v29 = 2 * llroundf(v32);
      }
      else
      {
        [v6 setPreviewWidth:width];
        uint64_t v29 = height;
      }
    }
    [v6 setPreviewHeight:v29];
    [v6 setPreviewFormat:875704422];
    objc_msgSend(v6, "setPreviewMirroring:", objc_msgSend(v6, "outputMirroring"));
    objc_msgSend(v6, "setPreviewOrientation:", objc_msgSend(v6, "outputOrientation"));
  }
  [v6 setNoiseReductionEnabled:self->_internal->noiseReductionEnabled];
  [a3 videoScaleAndCropFactor];
  *(float *)&double v33 = v33;
  [v6 setScaleFactor:v33];
  [v6 setShutterSound:self->_internal->shutterSoundID];
  objc_msgSend(v6, "setFlashMode:", objc_msgSend(v7, "flashMode"));
  [v6 setWideColorMode:2];
  if (self->_internal->bravoImageFusionSupported) {
    [v6 setBravoImageFusionMode:2];
  }
  if ([(AVCaptureStillImageOutput *)self automaticallyEnablesStillImageStabilizationWhenAvailable])
  {
    uint64_t v34 = 2;
  }
  else
  {
    uint64_t v34 = 1;
  }
  [v6 setQualityPrioritization:v34];
  objc_msgSend(v6, "setClientQualityPrioritization:", objc_msgSend(v6, "qualityPrioritization"));
  id v35 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDeviceInput];
  if ([v7 isCenterStageActive]) {
    int v36 = [v35 isCenterStageAllowed];
  }
  else {
    int v36 = 0;
  }
  if ([v7 isBackgroundBlurActive]) {
    int v37 = [v35 isBackgroundBlurAllowed];
  }
  else {
    int v37 = 0;
  }
  if ([v7 isStudioLightingActive]) {
    int v38 = [v35 isStudioLightingAllowed];
  }
  else {
    int v38 = 0;
  }
  int v39 = [v7 isBackgroundReplacementActive];
  if (v39) {
    int v39 = [v35 isBackgroundReplacementAllowed];
  }
  if (((v36 | v37 | v38) & 1) != 0 || v39) {
    [v6 setQualityPrioritization:1];
  }
  if ([v9 videoHDRFlavor] == 2
    && ((int)[v6 qualityPrioritization] > 1 || objc_msgSend(v6, "HDRMode")))
  {
    if ([v7 isVideoHDREnabled])
    {
      if ([v7 isVideoHDRSuspended]) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = 2;
      }
    }
    else
    {
      uint64_t v41 = 0;
    }
    [v6 setHDRMode:v41];
  }
  v42 = self->_internal;
  if (v42->jpegQualitySpecified)
  {
    uint64_t v44 = *MEMORY[0x1E4F44AB0];
    *(float *)&double v40 = v42->jpegQuality;
    v45[0] = [NSNumber numberWithFloat:v40];
    objc_msgSend(v6, "setVtCompressionProperties:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1));
  }
  return v6;
}

- (void)captureStillImageAsynchronouslyFromConnection:(AVCaptureConnection *)connection completionHandler:(void *)handler
{
  if (handler)
  {
    if (objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection))
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        uint64_t v8 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A152C000, v8, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
        }
      }
      *(void *)buf = 0;
      uint64_t v15 = buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __93__AVCaptureStillImageOutput_captureStillImageAsynchronouslyFromConnection_completionHandler___block_invoke;
      v13[3] = &unk_1E5A737A0;
      v13[4] = self;
      v13[5] = connection;
      v13[6] = handler;
      v13[7] = buf;
      [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v13];
      if (!v15[24])
      {
        int v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
        objc_exception_throw(v12);
      }
      _Block_object_dispose(buf, 8);
      return;
    }
    float v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    float v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  }
  v11 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

uint64_t __93__AVCaptureStillImageOutput_captureStillImageAsynchronouslyFromConnection_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = a2 != 0;
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[*(id *)(result + 32) _figCaptureStillImageSettingsForConnection:*(void *)(result + 40)];
    [v4 setPayloadType:0];
    id v5 = +[AVCaptureStillImageRequest request];
    objc_msgSend(v5, "setSettingsID:", objc_msgSend(v4, "settingsID"));
    [v5 setSbufCompletionBlock:*(void *)(v3 + 48)];
    [v5 setShutterSoundID:*(unsigned int *)(*(void *)(*(void *)(v3 + 32) + 16) + 80)];
    id v6 = *(void **)(*(void *)(v3 + 32) + 16);
    objc_sync_enter(v6);
    [*(id *)(*(void *)(*(void *)(v3 + 32) + 16) + 16) addObject:v5];
    objc_sync_exit(v6);
    uint64_t v7 = [*(id *)(v3 + 32) sinkID];
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v9 + 80);
    if (v10)
    {
      return v10(a2, v7, v4);
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F516D8];
      v12[0] = &unk_1EF4FA670;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)captureStillImageSurfaceAsynchronouslyFromConnection:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    if (objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", a3))
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        uint64_t v8 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A152C000, v8, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
        }
      }
      *(void *)buf = 0;
      uint64_t v15 = buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __100__AVCaptureStillImageOutput_captureStillImageSurfaceAsynchronouslyFromConnection_completionHandler___block_invoke;
      v13[3] = &unk_1E5A737A0;
      v13[4] = self;
      v13[5] = a3;
      v13[6] = a4;
      v13[7] = buf;
      [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v13];
      if (!v15[24])
      {
        int v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
        objc_exception_throw(v12);
      }
      _Block_object_dispose(buf, 8);
      return;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v11 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

uint64_t __100__AVCaptureStillImageOutput_captureStillImageSurfaceAsynchronouslyFromConnection_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = a2 != 0;
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[*(id *)(result + 32) _figCaptureStillImageSettingsForConnection:*(void *)(result + 40)];
    [v4 setPayloadType:1];
    id v5 = +[AVCaptureStillImageRequest request];
    objc_msgSend(v5, "setSettingsID:", objc_msgSend(v4, "settingsID"));
    [v5 setIosurfaceCompletionBlock:*(void *)(v3 + 48)];
    [v5 setShutterSoundID:*(unsigned int *)(*(void *)(*(void *)(v3 + 32) + 16) + 80)];
    id v6 = *(void **)(*(void *)(v3 + 32) + 16);
    objc_sync_enter(v6);
    [*(id *)(*(void *)(*(void *)(v3 + 32) + 16) + 16) addObject:v5];
    objc_sync_exit(v6);
    uint64_t v7 = [*(id *)(v3 + 32) sinkID];
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v9 + 80);
    if (v10)
    {
      return v10(a2, v7, v4);
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F516D8];
      v12[0] = &unk_1EF4FA670;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (NSUInteger)maxBracketedCaptureStillImageCount
{
  internal = self->_internal;
  objc_sync_enter(internal);
  NSUInteger maxBracketedCaptureCount = self->_internal->maxBracketedCaptureCount;
  objc_sync_exit(internal);
  return maxBracketedCaptureCount;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureSupported
{
  return self->_internal->lensStabilizationDuringBracketedCaptureSupported;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureEnabled
{
  return self->_internal->lensStabilizationDuringBracketedCaptureEnabled;
}

- (void)setLensStabilizationDuringBracketedCaptureEnabled:(BOOL)lensStabilizationDuringBracketedCaptureEnabled
{
  if ([(AVCaptureStillImageOutput *)self isLensStabilizationDuringBracketedCaptureSupported])
  {
    self->_internal->lensStabilizationDuringBracketedCaptureEnabled = lensStabilizationDuringBracketedCaptureEnabled;
  }
  else
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (void)prepareToCaptureStillImageBracketFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler
{
  if (!handler)
  {
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
LABEL_12:
    char v17 = (void *)[v12 exceptionWithName:v13 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v17);
    }
    NSLog(&cfstr_SuppressingExc.isa, v17);
    return;
  }
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection) & 1) == 0)
  {
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_12;
  }
  unint64_t v10 = [(NSArray *)settings count];
  if (v10 > [(AVCaptureStillImageOutput *)self maxBracketedCaptureStillImageCount])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke;
    v23[3] = &unk_1E5A737C8;
    v23[4] = handler;
    uint64_t v11 = v23;
LABEL_5:
    [(AVCaptureOutput *)self performBlockOnSessionNotifyingThread:v11];
    return;
  }
  uint64_t v22 = 0;
  if (![(AVCaptureStillImageOutput *)self _bracketedSettingsAreValid:settings fromConnection:connection exceptionReason:&v22])
  {
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_12;
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  id v15 = [(AVCaptureStillImageOutput *)self _figCaptureStillImageSettingsForBracketedCaptureSettingsArray:settings fromConnection:connection];
  BOOL v16 = [(AVCaptureStillImageOutput *)self _preparedForBracketedCaptureWithSettings:v15];
  objc_sync_exit(internal);
  if (v16)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5A737C8;
    v21[4] = handler;
    uint64_t v11 = v21;
    goto LABEL_5;
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_3;
  v18[3] = &unk_1E5A737F0;
  v18[6] = handler;
  v18[7] = v19;
  v18[4] = self;
  v18[5] = v15;
  v18[8] = a2;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v18];
  _Block_object_dispose(v19, 8);
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  AVLocalizedError();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__AVCaptureStillImageOutput_prepareToCaptureStillImageBracketFromConnection_withSettingsArray_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2 != 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    objc_exception_throw(v11);
  }
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 104), "addObject:", +[AVCapturePrepareBracketRequest prepareBracketRequestWithCompletionBlock:settings:](AVCapturePrepareBracketRequest, "prepareBracketRequestWithCompletionBlock:settings:", *(void *)(a1 + 48), *(void *)(a1 + 40)));
  objc_sync_exit(v4);
  uint64_t v5 = [*(id *)(a1 + 32) sinkID];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 88);
  if (v9)
  {
    return v9(a2, v5, v6);
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F516D8];
    v13[0] = &unk_1EF4FA670;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterPostNotification();
  }
}

- (void)captureStillImageBracketAsynchronouslyFromConnection:(AVCaptureConnection *)connection withSettingsArray:(NSArray *)settings completionHandler:(void *)handler
{
  if (handler)
  {
    if (objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", connection))
    {
      unint64_t v9 = [(NSArray *)settings count];
      if (v9 > [(AVCaptureStillImageOutput *)self maxBracketedCaptureStillImageCount])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke;
        v22[3] = &unk_1E5A73818;
        v22[4] = settings;
        v22[5] = handler;
        [(AVCaptureOutput *)self performBlockOnSessionNotifyingThread:v22];
        return;
      }
      uint64_t v21 = 0;
      if ([(AVCaptureStillImageOutput *)self _bracketedSettingsAreValid:settings fromConnection:connection exceptionReason:&v21])
      {
        internal = self->_internal;
        objc_sync_enter(internal);
        id v14 = [(AVCaptureStillImageOutput *)self _figCaptureStillImageSettingsForBracketedCaptureSettingsArray:settings fromConnection:connection];
        [(AVCaptureStillImageOutput *)self _preparedForBracketedCaptureWithSettings:v14];
        objc_sync_exit(internal);
        uint64_t v17 = 0;
        v18 = &v17;
        uint64_t v19 = 0x2020000000;
        char v20 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke_2;
        v16[3] = &unk_1E5A73840;
        v16[7] = handler;
        v16[8] = &v17;
        v16[4] = self;
        v16[5] = v14;
        v16[6] = settings;
        [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v16];
        if (!*((unsigned char *)v18 + 24))
        {
          id v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
          objc_exception_throw(v15);
        }
        _Block_object_dispose(&v17, 8);
        return;
      }
      unint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    }
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v12 = (void *)[v10 exceptionWithName:v11 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
}

uint64_t __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  AVLocalizedError();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __118__AVCaptureStillImageOutput_captureStillImageBracketAsynchronouslyFromConnection_withSettingsArray_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(*(void *)(result + 32) + 16);
    objc_sync_enter(v4);
    uint64_t v5 = 0;
    uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(v3 + 32) + 16) + 80);
    while ([*(id *)(v3 + 40) bracketImageCount] > v5)
    {
      id v7 = +[AVCaptureStillImageRequest request];
      objc_msgSend(v7, "setSettingsID:", objc_msgSend(*(id *)(v3 + 40), "settingsID"));
      [v7 setBracketedCaptureCompletionBlock:*(void *)(v3 + 56)];
      objc_msgSend(v7, "setBracketedSettings:", objc_msgSend(*(id *)(v3 + 48), "objectAtIndexedSubscript:", v5));
      [v7 setShutterSoundID:v6];
      ++v5;
      [*(id *)(*(void *)(*(void *)(v3 + 32) + 16) + 16) addObject:v7];
      uint64_t v6 = 0;
    }
    objc_sync_exit(v4);
    uint64_t v8 = [*(id *)(v3 + 32) sinkID];
    uint64_t v9 = *(void *)(v3 + 40);
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 80);
    if (v12)
    {
      return v12(a2, v8, v9);
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F516D8];
      v14[0] = &unk_1EF4FA670;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (BOOL)_bracketedSettingsAreValid:(id)a3 fromConnection:(id)a4 exceptionReason:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a3 count];
  if (v9 > [(AVCaptureStillImageOutput *)self maxBracketedCaptureStillImageCount])
  {
    LOBYTE(v10) = 0;
    uint64_t v11 = @"Bracketed capture settings array exceeds -maxBracketedCaptureStillImageCount";
    goto LABEL_62;
  }
  uint64_t v10 = [a3 count];
  if (!v10)
  {
    uint64_t v11 = @"Bracketed capture settings array contains 0 elements";
    goto LABEL_62;
  }
  [a3 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v10) = 0;
    uint64_t v11 = @"Bracketed capture settings array may only contain AVCaptureBracketedStillImageSettings objects";
    goto LABEL_62;
  }
  uint64_t v12 = objc_opt_class();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (!v13)
  {
LABEL_13:
    uint64_t v17 = (void *)[a4 sourceDevice];
    v18 = (void *)[v17 activeFormat];
    if (v12 != objc_opt_class())
    {
      if (v12 == objc_opt_class())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v31 = [a3 countByEnumeratingWithState:&v45 objects:v63 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v46 != v33) {
                objc_enumerationMutation(a3);
              }
              id v35 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              [v35 exposureTargetBias];
              if (v36 != 3.4028e38)
              {
                [v35 exposureTargetBias];
                float v38 = v37;
                [v17 minExposureTargetBias];
                if (v38 < v39
                  || ([v35 exposureTargetBias],
                      float v41 = v40,
                      [v17 maxExposureTargetBias],
                      v41 > v42))
                {
                  uint64_t v43 = [NSString stringWithFormat:@"%@ contains an out of range exposure target bias. Use AVCaptureDevice -minExposureTargetBias / -maxExposureTargetBias", v35];
                  goto LABEL_60;
                }
              }
            }
            uint64_t v32 = [a3 countByEnumeratingWithState:&v45 objects:v63 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
      }
      goto LABEL_15;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v19 = [a3 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (!v19) {
      goto LABEL_44;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v56;
LABEL_20:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v56 != v21) {
        objc_enumerationMutation(a3);
      }
      double v23 = *(void **)(*((void *)&v55 + 1) + 8 * v22);
      [v23 ISO];
      if (v24 != 3.4028e38)
      {
        [v23 ISO];
        float v26 = v25;
        [v18 minISO];
        if (v26 < v27 || ([v23 ISO], float v29 = v28, objc_msgSend(v18, "maxISO"), v29 > v30))
        {
          uint64_t v43 = [NSString stringWithFormat:@"%@ contains an out of range ISO value. Use AVCaptureDeviceFormat -minISO / -maxISO", v23];
LABEL_60:
          uint64_t v11 = (__CFString *)v43;
          goto LABEL_61;
        }
      }
      if (v23) {
        [v23 exposureDuration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2)) {
        break;
      }
LABEL_42:
      if (v20 == ++v22)
      {
        uint64_t v20 = [a3 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v20) {
          goto LABEL_20;
        }
LABEL_44:
        if (([v17 isExposureModeSupported:3] & 1) == 0)
        {
          LOBYTE(v10) = 0;
          uint64_t v11 = @"Source device does not support manual exposure bracketed capture. Use AVCaptureDevice -isExposureModeSupported: with AVCaptureExposureModeCustom";
          goto LABEL_62;
        }
LABEL_15:
        uint64_t v11 = 0;
        LOBYTE(v10) = 1;
        goto LABEL_62;
      }
    }
    if (v23)
    {
      [v23 exposureDuration];
      if (v18)
      {
LABEL_32:
        [v18 minExposureDuration];
        goto LABEL_35;
      }
    }
    else
    {
      memset(&v52, 0, sizeof(v52));
      if (v18) {
        goto LABEL_32;
      }
    }
    memset(&v51, 0, sizeof(v51));
LABEL_35:
    if (CMTimeCompare(&v52, &v51) < 0) {
      goto LABEL_59;
    }
    if (v23)
    {
      [v23 exposureDuration];
      if (v18)
      {
LABEL_38:
        [v18 maxExposureDuration];
        goto LABEL_41;
      }
    }
    else
    {
      memset(&v50, 0, sizeof(v50));
      if (v18) {
        goto LABEL_38;
      }
    }
    memset(&v49, 0, sizeof(v49));
LABEL_41:
    if (CMTimeCompare(&v50, &v49) >= 1)
    {
LABEL_59:
      uint64_t v43 = [NSString stringWithFormat:@"%@ contains an out of range exposure duration. Use AVCaptureDeviceFormat -minExposureDuration / -maxExposureDuration", v23];
      goto LABEL_60;
    }
    goto LABEL_42;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v60;
  uint64_t v11 = @"All elements in the bracketed capture settings array must be of the same class";
LABEL_7:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v60 != v15) {
      objc_enumerationMutation(a3);
    }
    if (objc_opt_class() != v12) {
      break;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [a3 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (!v14) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
  }
LABEL_61:
  LOBYTE(v10) = 0;
LABEL_62:
  if (a5) {
    *a5 = v11;
  }
  return v10;
}

- (id)_figCaptureStillImageSettingsForBracketedCaptureSettingsArray:(id)a3 fromConnection:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = [(AVCaptureStillImageOutput *)self _figCaptureStillImageSettingsForConnection:a4];
  [v6 setFlashMode:0];
  [v6 setHDRMode:0];
  uint64_t v7 = 1;
  [v6 setQualityPrioritization:1];
  objc_msgSend(v6, "setLensStabilizationDuringBracketEnabled:", -[AVCaptureStillImageOutput isLensStabilizationDuringBracketedCaptureEnabled](self, "isLensStabilizationDuringBracketedCaptureEnabled"));
  [a3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    char v24 = 0;
  }
  else
  {
    [a3 firstObject];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();
    if (v24) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  objc_msgSend(v6, "setBracketType:imageCount:", v7, objc_msgSend(a3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = 24 * v11;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        if (isKindOfClass)
        {
          id v16 = a3;
          uint64_t v17 = [v6 exposureDurations];
          if (v15)
          {
            [v15 exposureDuration];
          }
          else
          {
            long long v25 = 0uLL;
            uint64_t v26 = 0;
          }
          uint64_t v21 = v17 + v14;
          *(void *)(v21 + 16) = v26;
          *(_OWORD *)uint64_t v21 = v25;
          [v15 ISO];
          int v19 = v22;
          uint64_t v20 = [v6 ISOs];
          a3 = v16;
        }
        else
        {
          if ((v24 & 1) == 0) {
            goto LABEL_19;
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * v13) exposureTargetBias];
          int v19 = v18;
          uint64_t v20 = [v6 exposureTargetBiases];
        }
        *(_DWORD *)(v20 + 4 * v11) = v19;
LABEL_19:
        ++v11;
        ++v13;
        v14 += 24;
      }
      while (v10 != v13);
      uint64_t v10 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)_preparedForBracketedCaptureWithSettings:(id)a3
{
  return [a3 bracketImageCount] == self->_internal->preparedBracket.imageCount
      && [a3 outputFormat] == self->_internal->preparedBracket.outputFormat
      && [a3 outputWidth] == self->_internal->preparedBracket.outputWidth
      && [a3 outputHeight] == self->_internal->preparedBracket.outputHeight;
}

- (void)_updateMaxBracketedStillImageCaptureCountForSourceFormat:(id)a3
{
  if ((int)FigCapturePlatformIdentifier() >= 5) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 4;
  }
  if (a3)
  {
    id v6 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDeviceInput];
    uint64_t v7 = (void *)[v6 device];
    if ([v7 isCenterStageActive]) {
      int v8 = [v6 isCenterStageAllowed];
    }
    else {
      int v8 = 0;
    }
    if ([v7 isBackgroundBlurActive]) {
      int v10 = [v6 isBackgroundBlurAllowed];
    }
    else {
      int v10 = 0;
    }
    if ([v7 isStudioLightingActive]) {
      int v11 = [v6 isStudioLightingAllowed];
    }
    else {
      int v11 = 0;
    }
    int v12 = [v7 isBackgroundReplacementActive];
    if (v12) {
      LOBYTE(v12) = [v6 isBackgroundReplacementAllowed];
    }
    unint64_t v9 = 0;
    if (((v8 | v10 | v11) & 1) == 0 && (v12 & 1) == 0)
    {
      unint64_t v9 = v5;
      if ([a3 supportsQuadraHighResolutionStillImageOutput])
      {
        if (self->_internal->highResStillEnabled) {
          unint64_t v9 = 0;
        }
        else {
          unint64_t v9 = v5;
        }
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if (v9 != self->_internal->maxBracketedCaptureCount)
  {
    [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"maxBracketedCaptureStillImageCount"];
    self->_internal->NSUInteger maxBracketedCaptureCount = v9;
    [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"maxBracketedCaptureStillImageCount"];
  }

  objc_sync_exit(internal);
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518E0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518D0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518D8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518C8] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 removeListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518E0] object:a3];
  [v5 removeListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518D0] object:a3];
  [v5 removeListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518D8] object:a3];
  [v5 removeListenerWithWeakReference:weakReference callback:sioNotificationHandler name:*MEMORY[0x1E4F518C8] object:a3];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureStillImageOutput;
  [(AVCaptureOutput *)&v7 detachSafelyFromFigCaptureSession:a3];
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v15 = *MEMORY[0x1E4F516D8];
  v16[0] = &unk_1EF4FA658;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  stillImageRequests = self->_internal->stillImageRequests;
  uint64_t v7 = [(NSMutableArray *)stillImageRequests countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(stillImageRequests);
        }
        [(AVCaptureStillImageOutput *)self handleNotificationForRequest:*(void *)(*((void *)&v10 + 1) + 8 * i) withPayload:v5 imageIsEV0:0];
      }
      uint64_t v7 = [(NSMutableArray *)stillImageRequests countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->_internal->stillImageRequests removeAllObjects];
  objc_sync_exit(internal);
}

- (void)_setStillImageStabilizationAutomaticallyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];

  [v4 _setStillImageStabilizationAutomaticallyEnabled:v3];
}

- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForDevice:(id)a3
{
  if ([a3 isLensStabilizationSupported])
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    BOOL v5 = self->_internal->maxBracketedCaptureCount != 0;
    objc_sync_exit(internal);
  }
  else
  {
    BOOL v5 = 0;
  }
  if (self->_internal->lensStabilizationDuringBracketedCaptureSupported != v5)
  {
    [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"lensStabilizationDuringBracketedCaptureSupported"];
    self->_internal->lensStabilizationDuringBracketedCaptureSupported = v5;
    [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"lensStabilizationDuringBracketedCaptureSupported"];
    if (!v5 && self->_internal->lensStabilizationDuringBracketedCaptureEnabled)
    {
      [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"lensStabilizationDuringBracketedCaptureEnabled"];
      self->_internal->lensStabilizationDuringBracketedCaptureEnabled = 0;
      [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"lensStabilizationDuringBracketedCaptureEnabled"];
    }
  }
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  if ([(AVCaptureStillImageOutput *)self isHighResolutionStillImageOutputEnabled])
  {
    uint64_t v5 = [a3 highResolutionStillImageDimensions];
    double v6 = (double)(int)v5;
    double v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureStillImageOutput;
    [(AVCaptureOutput *)&v8 outputSizeForSourceFormat:a3];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)handleNotificationForRequest:(id)a3 withPayload:(id)a4 imageIsEV0:(BOOL *)a5
{
  int v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  if (v8) {
    uint64_t v9 = AVLocalizedErrorWithUnderlyingOSStatus();
  }
  else {
    uint64_t v9 = 0;
  }
  if ([a3 sbufCompletionBlock])
  {
    long long v10 = (const void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51768]];
    if (v10)
    {
      int v11 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v10, (CFStringRef)*MEMORY[0x1E4F2F800], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F2F7E0]), "intValue");
      if (a5) {
        *a5 = v11 == 4;
      }
    }
    else if (!v9)
    {
      AVLocalizedError();
    }
    uint64_t v20 = *(void (**)(void))([a3 sbufCompletionBlock] + 16);
    v20();
  }
  else if ([a3 iosurfaceCompletionBlock])
  {
    uint64_t v12 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51790]];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51798]), "unsignedIntegerValue");
    [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51748]];
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51750]), "unsignedIntegerValue");
    uint64_t v14 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51708]];
    if (v14)
    {
      uint64_t v15 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
      if (v15)
      {
        int v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F2F7E0]), "intValue");
        if (a5) {
          *a5 = v16 == 4;
        }
      }
    }
    if (v13) {
      BOOL v17 = v12 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17 && v9 == 0) {
      AVLocalizedError();
    }
    int v19 = *(void (**)(void))([a3 iosurfaceCompletionBlock] + 16);
    v19();
  }
  else if ([a3 bracketedCaptureCompletionBlock])
  {
    uint64_t v21 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51768]];
    if (!(v21 | v9)) {
      uint64_t v9 = AVLocalizedError();
    }
    uint64_t v22 = [a3 bracketedCaptureCompletionBlock];
    uint64_t v23 = [a3 bracketedSettings];
    char v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 16);
    v24(v22, v21, v23, v9);
  }
}

- (void)handleNotificationForPrepareRequest:(id)a3 withPayload:(id)a4
{
  int v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  if (v6) {
    AVLocalizedErrorWithUnderlyingOSStatus();
  }
  if ([a3 completionBlock])
  {
    double v7 = *(void (**)(void))([a3 completionBlock] + 16);
    v7();
  }
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518E0]])
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51778]), "longLongValue");
      internal = self->_internal;
      objc_sync_enter(internal);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      stillImageRequests = self->_internal->stillImageRequests;
      uint64_t v10 = [(NSMutableArray *)stillImageRequests countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v46;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v46 != v11) {
              objc_enumerationMutation(stillImageRequests);
            }
            uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if ([v13 settingsID] == v7)
            {
              unsigned int v14 = [v13 shutterSoundID];
              objc_sync_exit(internal);
              if (v14) {
                AVCaptureStillImageOutputPlayShutterSound(self, v14);
              }
              goto LABEL_20;
            }
          }
          uint64_t v10 = [(NSMutableArray *)stillImageRequests countByEnumeratingWithState:&v45 objects:v51 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      objc_sync_exit(internal);
LABEL_20:
      [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"capturingStillImage"];
      uint64_t v15 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51A78]];
      if (v15)
      {
        [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"stillImageStabilizationActive"];
        self->_internal->SISActive = [v15 BOOLValue];
        [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"stillImageStabilizationActive"];
      }
      self->_internal->isCapturingPhoto = 1;
      [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"capturingStillImage"];
    }
    else
    {
      if (![a3 isEqualToString:*MEMORY[0x1E4F518D0]])
      {
        if ([a3 isEqualToString:*MEMORY[0x1E4F518D8]])
        {
          uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51778]), "longLongValue");
          obj = self->_internal;
          objc_sync_enter(obj);
          if ([(NSMutableArray *)self->_internal->stillImageRequests count])
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            BOOL v17 = self->_internal->stillImageRequests;
            uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
            if (v18)
            {
              uint64_t v19 = 0;
              uint64_t v20 = *(void *)v42;
              while (2)
              {
                uint64_t v21 = 0;
                uint64_t v33 = v19 + v18;
                do
                {
                  if (*(void *)v42 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * v21);
                  if (objc_msgSend(v22, "settingsID", v33) == v16)
                  {
                    id v30 = v22;
                    [(NSMutableArray *)self->_internal->stillImageRequests removeObjectAtIndex:v19 + v21];
                    objc_sync_exit(obj);
                    if (v30)
                    {
                      char v40 = 0;
                      [(AVCaptureStillImageOutput *)self handleNotificationForRequest:v30 withPayload:a4 imageIsEV0:&v40];
                      if (v40)
                      {
                        uint64_t v31 = self->_internal;
                        objc_sync_enter(v31);
                        [(NSMutableArray *)self->_internal->stillImageRequests insertObject:v30 atIndex:0];
                        objc_sync_exit(v31);
                      }
                    }
                    return;
                  }
                  ++v21;
                }
                while (v18 != v21);
                uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
                uint64_t v19 = v33;
                if (v18) {
                  continue;
                }
                break;
              }
            }
          }
        }
        else
        {
          if (![a3 isEqualToString:*MEMORY[0x1E4F518C8]]) {
            return;
          }
          uint64_t v23 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51778]), "longLongValue");
          obj = self->_internal;
          objc_sync_enter(obj);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          prepareRequests = self->_internal->prepareRequests;
          uint64_t v25 = [(NSMutableArray *)prepareRequests countByEnumeratingWithState:&v36 objects:v49 count:16];
          if (v25)
          {
            uint64_t v26 = 0;
            uint64_t v27 = *(void *)v37;
            while (2)
            {
              uint64_t v28 = 0;
              uint64_t v34 = v26 + v25;
              do
              {
                if (*(void *)v37 != v27) {
                  objc_enumerationMutation(prepareRequests);
                }
                long long v29 = *(void **)(*((void *)&v36 + 1) + 8 * v28);
                if (objc_msgSend((id)objc_msgSend(v29, "settings", v34), "settingsID") == v23)
                {
                  id v32 = v29;
                  [(NSMutableArray *)self->_internal->prepareRequests removeObjectAtIndex:v26 + v28];
                  self->_internal->preparedBracket.imageCount = objc_msgSend((id)objc_msgSend(v32, "settings"), "bracketImageCount");
                  self->_internal->preparedBracket.outputFormat = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputFormat");
                  self->_internal->preparedBracket.outputWidth = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputWidth");
                  self->_internal->preparedBracket.outputHeight = objc_msgSend((id)objc_msgSend(v32, "settings"), "outputHeight");
                  objc_sync_exit(obj);
                  if (v32)
                  {
                    [(AVCaptureStillImageOutput *)self handleNotificationForPrepareRequest:v32 withPayload:a4];
                  }
                  return;
                }
                ++v28;
              }
              while (v25 != v28);
              uint64_t v25 = [(NSMutableArray *)prepareRequests countByEnumeratingWithState:&v36 objects:v49 count:16];
              uint64_t v26 = v34;
              if (v25) {
                continue;
              }
              break;
            }
          }
        }
        objc_sync_exit(obj);
        return;
      }
      [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"capturingStillImage"];
      self->_internal->isCapturingPhoto = 0;
      if (self->_internal->SISActive)
      {
        [(AVCaptureStillImageOutput *)self willChangeValueForKey:@"stillImageStabilizationActive"];
        self->_internal->SISActive = 0;
        [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"stillImageStabilizationActive"];
      }
      [(AVCaptureStillImageOutput *)self didChangeValueForKey:@"capturingStillImage"];
    }
  }
}

+ (unint64_t)maxStillImageJPEGDataSize
{
  if (maxStillImageJPEGDataSize_onceToken != -1) {
    dispatch_once(&maxStillImageJPEGDataSize_onceToken, &__block_literal_global_10);
  }
  return maxStillImageJPEGDataSize_maxDataSize;
}

CMVideoDimensions __54__AVCaptureStillImageOutput_maxStillImageJPEGDataSize__block_invoke()
{
  if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
  {
    CMVideoDimensions result = (CMVideoDimensions)FigCaptureSourceRemoteMaxStillImageJPEGDataSize();
LABEL_9:
    maxStillImageJPEGDataSize_maxDataSize = (uint64_t)result;
    return result;
  }
  id v0 = [(NSArray *)[+[AVCaptureDevice defaultDeviceWithMediaType:*MEMORY[0x1E4F47C68]] formats] lastObject];
  if (v0)
  {
    CMVideoDimensions result = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v0 formatDescription]);
    unint64_t v2 = HIDWORD(*(unint64_t *)&result);
  }
  else
  {
    LODWORD(v2) = 2448;
    CMVideoDimensions result = (CMVideoDimensions)3264;
  }
  if (result.width >= 1 && (int)v2 >= 1)
  {
    CMVideoDimensions result = (CMVideoDimensions)(2 * result.width * (int)v2 / 3);
    goto LABEL_9;
  }
  return result;
}

+ (NSData)jpegStillImageNSDataRepresentation:(CMSampleBufferRef)jpegSampleBuffer
{
  if (jpegSampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(jpegSampleBuffer);
    if (CMFormatDescriptionGetMediaSubType(FormatDescription) == 1785750887)
    {
      DataBuffer = CMSampleBufferGetDataBuffer(jpegSampleBuffer);
      if (DataBuffer)
      {
        CMBlockBufferRef blockBufferOut = 0;
        CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut)|| (size_t totalLengthOut = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut)))
        {
          EXIFJPEGData = 0;
        }
        else
        {
          CFDataRef v8 = CFDataCreateWithBytesNoCopy(v7, (const UInt8 *)dataPointerOut, totalLengthOut, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
          uint64_t v9 = (const void *)[a1 _copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:jpegSampleBuffer];
          EXIFJPEGData = (NSData *)CGImageCreateEXIFJPEGData();
          uint64_t v11 = EXIFJPEGData;
          if (v9) {
            CFRelease(v9);
          }
          if (v8) {
            CFRelease(v8);
          }
        }
        if (blockBufferOut) {
          CFRelease(blockBufferOut);
        }
        return EXIFJPEGData;
      }
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
  }
  unsigned int v14 = (void *)[v12 exceptionWithName:v13 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v14);
  }
  NSLog(&cfstr_SuppressingExc.isa, v14);
  return 0;
}

+ (id)jpegStillImageNSDataRepresentationForSurface:(__IOSurface *)a3 size:(unint64_t)a4 metadata:(id)a5
{
  if (a3 && a4)
  {
    CFRetain(a3);
    IOSurfaceLock(a3, 1u, 0);
    BaseAddress = (const UInt8 *)IOSurfaceGetBaseAddress(a3);
    CFDataRef v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], BaseAddress, a4, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    EXIFJPEGData = (void *)CGImageCreateEXIFJPEGData();
    id v10 = EXIFJPEGData;
    if (v8) {
      CFRelease(v8);
    }
    IOSurfaceUnlock(a3, 1u, 0);
    CFRelease(a3);
  }
  else
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return 0;
  }
  return EXIFJPEGData;
}

+ (__CFDictionary)_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 1u);
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, @"FaceRegions");
    if (Value)
    {
      CFAllocatorRef v7 = Value;
      CFDataRef v8 = (const void *)*MEMORY[0x1E4F2F6D8];
      if (!CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F2F6D8]))
      {
        Mutable = CFDictionaryCreateMutable(v3, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (Mutable)
        {
          id v10 = Mutable;
          CFDictionarySetValue(Mutable, v8, v7);
          CFIndex Count = CFDictionaryGetCount(v5);
          MutableCopy = CFDictionaryCreateMutableCopy(v3, Count, v5);
          CFDictionarySetValue(MutableCopy, v8, v10);
          CFRelease(v10);
          CFRelease(v5);
          return MutableCopy;
        }
      }
    }
  }
  return v5;
}

@end