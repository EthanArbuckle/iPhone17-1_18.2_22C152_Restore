@interface AVCaptureConnection
+ (AVCaptureConnection)connectionWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer;
+ (AVCaptureConnection)connectionWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output;
+ (id)keyPathsForValuesAffectingVideoOrientation;
+ (id)keyPathsForValuesAffectingVideoRotationAngle;
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMaxFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMinFrameDuration;
- (AVCaptureConnection)initWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer;
- (AVCaptureConnection)initWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output;
- (AVCaptureOutput)output;
- (AVCaptureVideoOrientation)videoOrientation;
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (AVCaptureVideoStabilizationMode)activeVideoStabilizationMode;
- (AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode;
- (AVVideoFieldMode)videoFieldMode;
- (BOOL)_outputIsPreviewSizedVideoDataOutput;
- (BOOL)_updateCameraIntrinsicMatrixDeliverySupported;
- (BOOL)automaticallyAdjustsVideoMirroring;
- (BOOL)enablesVideoStabilizationWhenAvailable;
- (BOOL)isActive;
- (BOOL)isCameraIntrinsicMatrixDeliveryEnabled;
- (BOOL)isCameraIntrinsicMatrixDeliverySupported;
- (BOOL)isDebugMetadataSidecarFileEnabled;
- (BOOL)isEnabled;
- (BOOL)isLive;
- (BOOL)isLivePhotoMetadataWritingSupported;
- (BOOL)isTrulyDisabled;
- (BOOL)isVideoDeviceOrientationCorrectionEnabled;
- (BOOL)isVideoDeviceOrientationCorrectionSupported;
- (BOOL)isVideoFieldModeSupported;
- (BOOL)isVideoGreenGhostMitigationEnabled;
- (BOOL)isVideoGreenGhostMitigationSupported;
- (BOOL)isVideoMaxFrameDurationSet;
- (BOOL)isVideoMaxFrameDurationSupported;
- (BOOL)isVideoMinFrameDurationSet;
- (BOOL)isVideoMinFrameDurationSupported;
- (BOOL)isVideoMirrored;
- (BOOL)isVideoMirroringSupported;
- (BOOL)isVideoOrientationSupported;
- (BOOL)isVideoRetainedBufferCountHintSupported;
- (BOOL)isVideoRotationAngleSupported:(CGFloat)videoRotationAngle;
- (BOOL)isVideoStabilizationEnabled;
- (BOOL)isVideoStabilizationSupported;
- (BOOL)isVideoZoomSmoothingEnabled;
- (BOOL)isVideoZoomSmoothingSupported;
- (BOOL)livePhotoMetadataWritingEnabled;
- (BOOL)sourcesFromExternalCamera;
- (BOOL)sourcesFromFrontFacingCamera;
- (CGFloat)videoMaxScaleAndCropFactor;
- (CGFloat)videoRotationAngle;
- (CGFloat)videoScaleAndCropFactor;
- (CMTime)videoMaxFrameDuration;
- (CMTime)videoMinFrameDuration;
- (NSArray)audioChannels;
- (NSArray)inputPorts;
- (float)getAvgAudioLevelForChannel:(id)a3;
- (float)getPeakAudioLevelForChannel:(id)a3;
- (id)description;
- (id)figCaptureConnectionConfigurationForSessionPreset:(id)a3 allConnections:(id)a4;
- (id)mediaType;
- (id)session;
- (id)sourceDevice;
- (id)sourceDeviceInput;
- (id)supportedVideoMirroringMethodsForMovieRecording;
- (int)changeSeed;
- (int)videoRetainedBufferCountHint;
- (int64_t)_resolveActiveVideoStabilizationMode:(int64_t)a3 format:(id)a4;
- (int64_t)videoMirroringMethodForMovieRecording;
- (unsigned)clientRetainedBufferCount;
- (void)_handleChangedActiveFormat:(id)a3 forDevice:(id)a4 formatMediaType:(id)a5;
- (void)_setActive:(BOOL)a3;
- (void)_setVideoMinFrameDuration:(id *)a3;
- (void)_setVideoMirrored:(BOOL)a3;
- (void)_setVideoRotationAngle:(double)a3;
- (void)_updateActiveVideoStabilizationMode:(int64_t)a3 bumpChangeSeed:(BOOL)a4;
- (void)_updateMaxScaleAndCropFactorForFormat:(id)a3;
- (void)_updatePropertiesForFormat:(id)a3;
- (void)_updateSupportedVideoMirroringMethodsForMovieRecording;
- (void)_updateVideoGreenGhostMitigationSupported;
- (void)_updateZoomSmoothingSupported;
- (void)bumpChangeSeed;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)automaticallyAdjustsVideoMirroring;
- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)cameraIntrinsicMatrixDeliveryEnabled;
- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setEnablesVideoStabilizationWhenAvailable:(BOOL)enablesVideoStabilizationWhenAvailable;
- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3;
- (void)setPreferredVideoStabilizationMode:(AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode;
- (void)setVideoDeviceOrientationCorrectionEnabled:(BOOL)a3;
- (void)setVideoFieldMode:(AVVideoFieldMode)videoFieldMode;
- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3;
- (void)setVideoMaxFrameDuration:(CMTime *)videoMaxFrameDuration;
- (void)setVideoMinFrameDuration:(CMTime *)videoMinFrameDuration;
- (void)setVideoMirrored:(BOOL)videoMirrored;
- (void)setVideoMirroringMethodForMovieRecording:(int64_t)a3;
- (void)setVideoOrientation:(AVCaptureVideoOrientation)videoOrientation;
- (void)setVideoRetainedBufferCountHint:(int)a3;
- (void)setVideoRotationAngle:(CGFloat)videoRotationAngle;
- (void)setVideoScaleAndCropFactor:(CGFloat)videoScaleAndCropFactor;
- (void)setVideoZoomSmoothingEnabled:(BOOL)a3;
- (void)setupInternalStorage;
- (void)setupObservers;
- (void)teardownObservers;
- (void)updateAudioChannelsArray;
- (void)updateAudioLevelsArray;
@end

@implementation AVCaptureConnection

- (void)_setActive:(BOOL)a3
{
  self->_internal->active = a3;
}

- (AVCaptureVideoOrientation)videoOrientation
{
  [(AVCaptureConnection *)self sourcesFromFrontFacingCamera];
  [(AVCaptureConnection *)self sourcesFromExternalCamera];
  int v3 = FigCaptureCameraRequires180DegreesRotation();
  [(AVCaptureConnection *)self sourcesFromExternalCamera];
  BOOL v4 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
  internal = self->_internal;
  double videoRotationAngle = internal->videoRotationAngle;
  if (v4)
  {
    if (videoRotationAngle == 90.0)
    {
      if (internal->clientUsesVideoRotationAngleAPI
        && [(AVCaptureConnection *)self sourcesFromFrontFacingCamera])
      {
        BOOL v7 = ([(AVCaptureConnection *)self sourcesFromExternalCamera] | v3) == 0;
        AVCaptureVideoOrientation v8 = AVCaptureVideoOrientationPortrait;
        goto LABEL_20;
      }
      return 1;
    }
    if (videoRotationAngle == 270.0)
    {
      if (internal->clientUsesVideoRotationAngleAPI
        && [(AVCaptureConnection *)self sourcesFromFrontFacingCamera])
      {
        BOOL v10 = ([(AVCaptureConnection *)self sourcesFromExternalCamera] | v3) == 0;
        AVCaptureVideoOrientation v11 = AVCaptureVideoOrientationPortrait;
        goto LABEL_29;
      }
      return 2;
    }
    if (videoRotationAngle == 180.0)
    {
      BOOL v7 = v3 == 0;
LABEL_19:
      AVCaptureVideoOrientation v8 = AVCaptureVideoOrientationLandscapeRight;
LABEL_20:
      if (v7) {
        return v8 + 1;
      }
      else {
        return v8;
      }
    }
    if (videoRotationAngle != 0.0) {
      return 1;
    }
    BOOL v10 = v3 == 0;
  }
  else
  {
    if (videoRotationAngle == 0.0) {
      return 1;
    }
    if (videoRotationAngle == 180.0) {
      return 2;
    }
    if (videoRotationAngle == 270.0)
    {
      if (![(AVCaptureConnection *)self sourcesFromFrontFacingCamera]) {
        return 3;
      }
      BOOL v7 = ![(AVCaptureConnection *)self sourcesFromExternalCamera];
      goto LABEL_19;
    }
    if (videoRotationAngle != 90.0) {
      return 1;
    }
    if (![(AVCaptureConnection *)self sourcesFromFrontFacingCamera]) {
      return 4;
    }
    BOOL v10 = ![(AVCaptureConnection *)self sourcesFromExternalCamera];
  }
  AVCaptureVideoOrientation v11 = AVCaptureVideoOrientationLandscapeRight;
LABEL_29:
  if (v10) {
    return v11;
  }
  else {
    return v11 + 1;
  }
}

- (void)setupInternalStorage
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  inputPorts = self->_internal->inputPorts;
  uint64_t v4 = [(NSMutableArray *)inputPorts countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v51;
    uint64_t v7 = *MEMORY[0x1E4F47C40];
    uint64_t v8 = *MEMORY[0x1E4F47C68];
    uint64_t v45 = *MEMORY[0x1E4F47C50];
    uint64_t v9 = *MEMORY[0x1E4F47C48];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(inputPorts);
        }
        AVCaptureVideoOrientation v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v7))
        {
          uint64_t v12 = 56;
        }
        else if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v8))
        {
          uint64_t v12 = 88;
        }
        else if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", AVMediaTypeForMetadataObjects()))
        {
          uint64_t v12 = 96;
        }
        else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined() {
               && (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v45) & 1) != 0)
        }
        {
          uint64_t v12 = 104;
        }
        else if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v9))
        {
          uint64_t v12 = 112;
        }
        else if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", @"visn"))
        {
          uint64_t v12 = 120;
        }
        else if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", @"pcld"))
        {
          uint64_t v12 = 128;
        }
        else
        {
          if (!objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", @"cacd")) {
            continue;
          }
          uint64_t v12 = 136;
        }
        *(Class *)((char *)&self->_internal->super.isa + v12) = (Class)v11;
      }
      uint64_t v5 = [(NSMutableArray *)inputPorts countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v5);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v13 = [(AVCaptureConnection *)self inputPorts];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v47;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * j) input];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = (void *)[v18 device];
          goto LABEL_36;
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  v19 = 0;
  v18 = 0;
LABEL_36:
  self->_internal->sourceDeviceInput = (AVCaptureDeviceInput *)v18;
  self->_internal->sourceDevice = (AVCaptureDevice *)v19;
  self->_internal->enabled = 1;
  self->_internal->active = 1;
  v20 = [(AVCaptureConnection *)self output];
  v21 = [(AVCaptureConnection *)self videoPreviewLayer];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_internal->videoInputPort
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass() | (v21 != 0);
  }
  self->_internal->videoMirroringSupported = v22 & 1;
  self->_internal->videoMirrored = 0;
  self->_internal->automaticallyAdjustsVideoMirroring = 0;
  if (v21)
  {
    self->_internal->automaticallyAdjustsVideoMirroring = 1;
    self->_internal->videoMirrored = [(AVCaptureConnection *)self sourcesFromFrontFacingCamera];
    self->_internal->videoMirrored |= [(AVCaptureConnection *)self sourcesFromExternalCamera];
  }
  self->_internal->supportedVideoMirroringMethodsForMovieRecording = (NSArray *)&unk_1EF4FAA10;
  self->_internal->videoMirroringMethodForMovieRecording = 0;
  self->_internal->videoRotationSupported = self->_internal->videoMirroringSupported;
  id v23 = [(AVCaptureConnection *)self mediaType];
  uint64_t v24 = *MEMORY[0x1E4F47C68];
  if ((([v23 isEqualToString:*MEMORY[0x1E4F47C68]] & 1) != 0
     || (id v25 = [(AVCaptureConnection *)self mediaType],
         [v25 isEqualToString:*MEMORY[0x1E4F47C48]]))
    && ([(AVCaptureConnection *)self sourcesFromExternalCamera],
        AVCapturePlatformMountsCamerasInLandscapeOrientation()))
  {
    double v26 = 90.0;
  }
  else
  {
    double v26 = 0.0;
  }
  self->_internal->double videoRotationAngle = v26;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v27 = [v19 hasMediaType:v24];
  }
  else {
    char v27 = 0;
  }
  self->_internal->videoDeviceOrientationCorrectionSupported = v27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(AVCaptureConnection *)self sourcesFromExternalCamera];
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      if ([(AVCaptureConnection *)self sourcesFromFrontFacingCamera]
        && ([(AVCaptureConnection *)self sourcesFromFrontFacingCamera],
            [(AVCaptureConnection *)self sourcesFromExternalCamera],
            !FigCaptureCameraRequires180DegreesRotation()))
      {
        double v28 = 180.0;
      }
      else
      {
        double v28 = 0.0;
      }
      self->_internal->double videoRotationAngle = v28;
    }
  }
  self->_internal->clientUsesVideoRotationAngleAPI = 0;
  internal = self->_internal;
  uint64_t v30 = MEMORY[0x1E4F1F9F8];
  long long v31 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(&internal->clientUsesVideoRotationAngleAPI + 4) = *MEMORY[0x1E4F1F9F8];
  uint64_t v32 = *(void *)(v30 + 16);
  *(void *)&internal->videoMinFrameDuration.flags = v32;
  v33 = self->_internal;
  *(_OWORD *)((char *)&v33->videoMinFrameDuration.epoch + 4) = v31;
  *(void *)&v33->videoMaxFrameDuration.flags = v32;
  self->_internal->videoScaleAndCropFactor = 1.0;
  self->_internal->videoMaxScaleAndCropFactor = 1.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v34 = [(AVCaptureInputPort *)self->_internal->videoInputPort input];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend((id)-[AVCaptureInput device](v34, "device"), "activeFormat"), "formatDescription"));
      float v36 = (float)Dimensions.width * 0.0625;
      if (v36 >= (float)((float)Dimensions.height * 0.0625)) {
        float v36 = (float)Dimensions.height * 0.0625;
      }
      self->_internal->videoMaxScaleAndCropFactor = v36;
    }
  }
  self->_internal->videoRetainedBufferCountHint = 0;
  self->_internal->preferredVideoStabilizationMode = 0;
  v37 = self->_internal;
  if (v37->audioInputPort)
  {
    self->_internal->audioChannels = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    [(AVCaptureConnection *)self updateAudioChannelsArray];
    goto LABEL_73;
  }
  if (v37->videoInputPort)
  {
    if (AVGestaltGetBoolAnswer(@"AVGQCaptureMFOStabilizationIsAlwaysOn"))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(AVCaptureConnection *)self isVideoStabilizationSupported])
        {
          self->_internal->preferredVideoStabilizationMode = 1;
          if ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] isVideoStabilizationModeSupported:1])
          {
            self->_internal->activeVideoStabilizationMode = 1;
          }
        }
      }
    }
    v44 = self->_internal;
    if (!v44->preferredVideoStabilizationMode)
    {
      if (!v44->videoPreviewLayerWeakReference)
      {
        if (![(AVCaptureConnection *)self _outputIsPreviewSizedVideoDataOutput]) {
          goto LABEL_73;
        }
        v44 = self->_internal;
      }
      if ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)v44->sourceDevice activeFormat] isVideoStabilizationModeSupported:4])
      {
        [(AVCaptureConnection *)self setPreferredVideoStabilizationMode:4];
      }
    }
  }
LABEL_73:
  self->_internal->cameraIntrinsicMatrixDeliverySupported = 0;
  self->_internal->cameraIntrinsicMatrixDeliveryEnabled = 0;
  self->_internal->livePhotoMetadataWritingEnabled = 0;
  self->_internal->debugMetadataSidecarFileEnabled = 0;
  self->_internal->videoZoomSmoothingSupported = 0;
  self->_internal->videoZoomSmoothingEnabled = 0;
  self->_internal->videoGreenGhostMitigationSupported = 0;
  self->_internal->videoGreenGhostMitigationEnabled = 0;
  if (AVCaptureSessionIsLaunchPrewarmingEnabled())
  {
    id v38 = [NSString alloc];
    uint64_t v39 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "sourceID");
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    uint64_t v42 = [(AVCaptureOutput *)v20 sinkID];
    if (!v42) {
      uint64_t v42 = [(AVCaptureVideoPreviewLayer *)v21 sinkID];
    }
    v43 = (NSString *)[v38 initWithFormat:@"(%@ -> <%@> -> %@)", v39, v41, v42];
  }
  else
  {
    v43 = (NSString *)AVIdentifierForObject((uint64_t)self);
  }
  self->_internal->connectionID = v43;
}

- (BOOL)sourcesFromExternalCamera
{
  if ([(NSString *)[(AVCaptureDevice *)self->_internal->sourceDevice deviceType] isEqualToString:@"AVCaptureDeviceTypeExternal"])
  {
    return 1;
  }
  uint64_t v4 = [(AVCaptureDevice *)self->_internal->sourceDevice deviceType];

  return [(NSString *)v4 isEqualToString:@"AVCaptureDeviceTypeContinuityCamera"];
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return (AVCaptureVideoPreviewLayer *)[(AVWeakReference *)self->_internal->videoPreviewLayerWeakReference referencedObject];
}

- (BOOL)sourcesFromFrontFacingCamera
{
  return [(AVCaptureDevice *)self->_internal->sourceDevice position] == AVCaptureDevicePositionFront;
}

- (BOOL)isTrulyDisabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureConnection *)self isActive]) {
    return 1;
  }
  if ([(AVCaptureConnection *)self isEnabled]
    && (objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "isEnabled") & 1) != 0)
  {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:3];
  [(AVCaptureConnection *)self output];
  return [v4 containsObject:objc_opt_class()];
}

- (NSArray)inputPorts
{
  v2 = self->_internal->inputPorts;

  return (NSArray *)v2;
}

- (BOOL)isEnabled
{
  return self->_internal->enabled;
}

- (AVCaptureOutput)output
{
  return (AVCaptureOutput *)[(AVWeakReference *)self->_internal->outputWeakReference referencedObject];
}

- (BOOL)isActive
{
  return self->_internal->active;
}

- (id)mediaType
{
  internal = self->_internal;
  id result = internal->videoInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->audioInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->metadataInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->metadataItemInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->depthDataInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->visionDataInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->pointCloudDataInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  id result = internal->cameraCalibrationDataInputPort;
  if (result) {
    return (id)[result mediaType];
  }
  return result;
}

- (BOOL)_outputIsPreviewSizedVideoDataOutput
{
  v2 = [(AVCaptureConnection *)self output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(AVCaptureOutput *)v2 deliversPreviewSizedOutputBuffers];
}

- (id)sourceDevice
{
  return self->_internal->sourceDevice;
}

- (BOOL)isVideoMinFrameDurationSet
{
  return self->_internal->videoMinFrameDuration.timescale & 1;
}

- (BOOL)isVideoMaxFrameDurationSet
{
  return self->_internal->videoMaxFrameDuration.timescale & 1;
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

- (id)sourceDeviceInput
{
  return self->_internal->sourceDeviceInput;
}

- (BOOL)isLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(AVCaptureConnection *)self inputPorts];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) isEnabled];
      if (!v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int v8 = [(AVCaptureConnection *)self isEnabled];
    if (v8) {
      LOBYTE(v8) = [(AVCaptureConnection *)self isActive];
    }
  }
  return v8;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal->hasActiveObservers)
  {
    [(AVCaptureConnection *)self teardownObservers];
    internal = self->_internal;
  }

  uint64_t v4 = self->_internal;
  audioChannels = v4->audioChannels;
  if (audioChannels)
  {
    [(NSMutableArray *)audioChannels makeObjectsPerformSelector:sel_invalidate];

    uint64_t v4 = self->_internal;
  }

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureConnection;
  [(AVCaptureConnection *)&v6 dealloc];
}

+ (AVCaptureConnection)connectionWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputPort:port videoPreviewLayer:layer];

  return (AVCaptureConnection *)v4;
}

- (AVCaptureConnection)initWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer
{
  objc_super v6 = [(AVCaptureConnection *)self init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptureConnectionInternal);
    v6->_internal = v7;
    if (port && layer && v7)
    {
      v6->_internal->inputPorts = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", port, 0);
      v6->_internal->videoPreviewLayerWeakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:layer];
      [(AVCaptureConnection *)v6 setupInternalStorage];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

+ (AVCaptureConnection)connectionWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputPorts:ports output:output];

  return (AVCaptureConnection *)v4;
}

- (AVCaptureConnection)initWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureConnection;
  objc_super v6 = [(AVCaptureConnection *)&v9 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptureConnectionInternal);
    v6->_internal = v7;
    if (ports && output && v7)
    {
      v6->_internal->inputPorts = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:ports];
      v6->_internal->outputWeakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:output];
      [(AVCaptureConnection *)v6 setupInternalStorage];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)figCaptureConnectionConfigurationForSessionPreset:(id)a3 allConnections:(id)a4
{
  formatDescriptionOut[15] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  if (![(AVCaptureConnection *)self isActive]) {
    return 0;
  }
  id v7 = [(AVCaptureConnection *)self mediaType];
  int v8 = (void *)[(NSMutableArray *)self->_internal->inputPorts firstObject];
  [v8 input];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    long long v10 = objc_msgSend((id)objc_msgSend(v8, "input"), "device");
    if (![v10 isConnected] || (objc_msgSend(v10, "isSoonToBeDisconnected") & 1) != 0) {
      return 0;
    }
  }
  else
  {
    long long v10 = 0;
  }
  obuint64_t j = (id)*MEMORY[0x1E4F47C68];
  id v133 = a3;
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F50FE8]);
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    v18 = 0;
LABEL_54:
    id v11 = v13;
    goto LABEL_55;
  }
  uint64_t v131 = *MEMORY[0x1E4F47C40];
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F50ED0]);
    if (isKindOfClass)
    {
      v127 = v13;
      id v128 = v7;
      v129 = v8;
      [(AVCaptureConnection *)self output];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        uint64_t v19 = [a4 countByEnumeratingWithState:&v163 objects:v170 count:16];
        if (!v19) {
          return 0;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v164;
LABEL_15:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v164 != v21) {
            objc_enumerationMutation(a4);
          }
          id v23 = *(AVCaptureConnection **)(*((void *)&v163 + 1) + 8 * v22);
          if (v23 != self)
          {
            uint64_t v24 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v163 + 1) + 8 * v22), "inputPorts"), "firstObject");
            [v24 input];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v25 = objc_msgSend((id)objc_msgSend(v24, "input"), "device");
              double v26 = [(AVCaptureConnection *)self output];
              uint64_t v27 = [(AVCaptureConnection *)v23 output];
              int v28 = objc_msgSend(-[AVCaptureConnection mediaType](v23, "mediaType"), "isEqualToString:", obj);
              int v29 = [v25 isConnected];
              if (v26 == (AVCaptureOutput *)v27 && v28 && v29) {
                break;
              }
            }
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [a4 countByEnumeratingWithState:&v163 objects:v170 count:16];
            id v11 = 0;
            if (v20) {
              goto LABEL_15;
            }
            return v11;
          }
        }
      }
      int v8 = v129;
      v41 = (void *)[v129 input];
      [(AVCaptureOutput *)[(AVCaptureConnection *)self output] session];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v41 setAudioCaptureMode:6];
      }
      objc_msgSend(v127, "setAudioCaptureMode:", objc_msgSend(v10, "fallbackAudioCaptureModeIfApplicableForCurrentRoute:", objc_msgSend(v41, "audioCaptureMode")));
      objc_msgSend(v127, "setWindNoiseRemovalEnabled:", objc_msgSend(v41, "isWindNoiseRemovalEnabled"));
      if ([v127 audioCaptureMode] == 6)
      {
        uint64_t v42 = [v129 sourceDevicePosition];
      }
      else
      {
        [v127 setBuiltInMicrophonePosition:0];
        if ([v127 audioCaptureMode] != 3)
        {
          id v7 = v128;
          if ([v127 audioCaptureMode] != 4)
          {
            long long v161 = 0u;
            long long v162 = 0u;
            long long v159 = 0u;
            long long v160 = 0u;
            uint64_t v95 = [a4 countByEnumeratingWithState:&v159 objects:v169 count:16];
            if (v95)
            {
              uint64_t v96 = v95;
              uint64_t v97 = *(void *)v160;
              while (2)
              {
                for (uint64_t i = 0; i != v96; ++i)
                {
                  if (*(void *)v160 != v97) {
                    objc_enumerationMutation(a4);
                  }
                  v99 = *(void **)(*((void *)&v159 + 1) + 8 * i);
                  if ((objc_msgSend((id)objc_msgSend(v99, "mediaType"), "isEqual:", v131) & 1) == 0)
                  {
                    v100 = objc_msgSend((id)objc_msgSend(v99, "inputPorts"), "firstObject");
                    [v100 input];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v101 = objc_msgSend((id)objc_msgSend(v100, "input"), "device");
                      if ([v101 isConnected])
                      {
                        uint64_t v42 = [v101 position];
                        int v8 = v129;
                        goto LABEL_110;
                      }
                    }
                  }
                }
                uint64_t v96 = [a4 countByEnumeratingWithState:&v159 objects:v169 count:16];
                int v8 = v129;
                if (v96) {
                  continue;
                }
                break;
              }
            }
            goto LABEL_111;
          }
          uint64_t v42 = 2;
LABEL_110:
          [v127 setBuiltInMicrophonePosition:v42];
LABEL_111:
          if (objc_msgSend(-[AVCaptureConnection session](self, "session"), "likelyToRecordProResMovies")) {
            [v127 setBuiltInMicrophoneRequiredSampleRate:48000.0];
          }
          uint64_t v15 = 0;
          id v11 = v127;
LABEL_158:
          id v16 = 0;
          id v17 = 0;
          v18 = 0;
          uint64_t v14 = 0;
          goto LABEL_55;
        }
        uint64_t v42 = 1;
      }
      id v7 = v128;
      goto LABEL_110;
    }
    uint64_t v15 = 0;
    goto LABEL_31;
  }
  if ([v7 isEqualToString:AVMediaTypeForMetadataObjects()])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F50FD0]);
    [(AVCaptureConnection *)self output];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = [(AVCaptureConnection *)self output];
      objc_msgSend(v11, "setMetadataIdentifiers:", -[AVCaptureOutput _metadataIdentifiers](v30, "_metadataIdentifiers"));
      [(AVCaptureOutput *)v30 rectOfInterest];
      objc_msgSend(v11, "setMetadataRectOfInterest:");
      objc_msgSend(v11, "setFaceTrackingMaxFaces:", -[AVCaptureOutput faceTrackingMaxFaces](v30, "faceTrackingMaxFaces"));
      objc_msgSend(v11, "setFaceTrackingUsesFaceRecognition:", -[AVCaptureOutput isFaceTrackingUsingFaceRecognition](v30, "isFaceTrackingUsingFaceRecognition"));
      objc_msgSend(v11, "setFaceTrackingPlusEnabled:", -[AVCaptureOutput isFaceTrackingPlusEnabled](v30, "isFaceTrackingPlusEnabled"));
      [(AVCaptureOutput *)v30 faceTrackingNetworkFailureThresholdMultiplier];
      objc_msgSend(v11, "setFaceTrackingNetworkFailureThresholdMultiplier:");
      [(AVCaptureOutput *)v30 faceTrackingFailureFieldOfViewModifier];
      objc_msgSend(v11, "setFaceTrackingFailureFieldOfViewModifier:");
      objc_msgSend(v11, "setAttentionDetectionEnabled:", -[AVCaptureOutput isAttentionDetectionEnabled](v30, "isAttentionDetectionEnabled"));
      objc_msgSend(v11, "setEmitsEmptyObjectDetectionMetadata:", -[AVCaptureOutput emitsEmptyObjectDetectionMetadata](v30, "emitsEmptyObjectDetectionMetadata"));
    }
    uint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    v18 = 0;
    uint64_t v14 = 0;
    id v7 = (id)*MEMORY[0x1E4F47C58];
    goto LABEL_55;
  }
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
    && [v7 isEqualToString:*MEMORY[0x1E4F47C50]])
  {
    long long v31 = v8;
    id v11 = objc_alloc_init(MEMORY[0x1E4F50FC8]);
    formatDescriptionOut[0] = 0;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    inputPorts = self->_internal->inputPorts;
    uint64_t v33 = [(NSMutableArray *)inputPorts countByEnumeratingWithState:&v155 objects:v168 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v156;
      CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v156 != v35) {
            objc_enumerationMutation(inputPorts);
          }
          id v38 = formatDescriptionOut[0];
          uint64_t v39 = (const opaqueCMFormatDescription *)[*(id *)(*((void *)&v155 + 1) + 8 * j) formatDescription];
          if (v38)
          {
            CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(v36, v38, v39, formatDescriptionOut);
            CFRelease(v38);
          }
          else
          {
            formatDescriptionOut[0] = (CMMetadataFormatDescriptionRef)CFRetain(v39);
          }
        }
        uint64_t v34 = [(NSMutableArray *)inputPorts countByEnumeratingWithState:&v155 objects:v168 count:16];
      }
      while (v34);
    }
    [v11 setFormatDescription:formatDescriptionOut[0]];
    int v8 = v31;
    objc_msgSend(v11, "setClock:", objc_msgSend((id)objc_msgSend(v31, "input"), "clock"));
    [v31 input];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = 1;
    }
    else
    {
      [v31 input];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "input"), "ports"), "firstObject"), "mediaType") != obj)
      {
        goto LABEL_155;
      }
      uint64_t v40 = 3;
    }
    [v11 setSourceSubType:v40];
LABEL_155:
    if (formatDescriptionOut[0]) {
      CFRelease(formatDescriptionOut[0]);
    }
    uint64_t v15 = 0;
    goto LABEL_158;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F47C48]])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F50FC0]);
    v18 = v13;
    uint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    goto LABEL_53;
  }
  if ([v7 isEqualToString:@"visn"])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F50FF0]);
    uint64_t v15 = 0;
    id v16 = 0;
    v18 = 0;
    uint64_t v14 = 0;
    id v17 = v11;
    goto LABEL_55;
  }
  if ([v7 isEqualToString:@"pcld"])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F50FE0]);
    objc_msgSend(v16, "setProjectorMode:", objc_msgSend(v10, "timeOfFlightProjectorMode"));
    uint64_t v15 = 0;
    id v17 = 0;
    v18 = 0;
    uint64_t v14 = 0;
    id v11 = v16;
    goto LABEL_55;
  }
  if ([v7 isEqualToString:@"cacd"])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F50ED8]);
    uint64_t v15 = v13;
LABEL_31:
    id v16 = 0;
    id v17 = 0;
    v18 = 0;
LABEL_53:
    uint64_t v14 = 0;
    goto LABEL_54;
  }
  uint64_t v15 = 0;
  id v16 = 0;
  id v17 = 0;
  v18 = 0;
  uint64_t v14 = 0;
  id v11 = 0;
LABEL_55:
  [v11 setConnectionID:self->_internal->connectionID];
  [v11 setMediaType:AVOSTypeForString()];
  if ([v8 isEnabled]) {
    BOOL enabled = self->_internal->enabled;
  }
  else {
    BOOL enabled = 0;
  }
  [v11 setEnabled:enabled];
  objc_msgSend(v11, "setSourceConfiguration:", objc_msgSend(v8, "figCaptureSourceConfigurationForSessionPreset:", v133));
  v44 = v8;
  uint64_t v45 = [v8 sourceDeviceType];
  BOOL v46 = [(AVCaptureDevice *)self->_internal->sourceDevice wideAngleCameraSourcesFromUltraWide];
  long long v47 = (const opaqueCMFormatDescription *)&unk_1EF4FA460;
  if (v46) {
    long long v47 = (const opaqueCMFormatDescription *)&unk_1EF4FA448;
  }
  *(void *)&v171[0] = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
  *(void *)&v171[1] = @"AVCaptureDeviceTypeBuiltInTelephotoCamera";
  formatDescriptionOut[0] = v47;
  formatDescriptionOut[1] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA478;
  *(void *)&v171[2] = @"AVCaptureDeviceTypeBuiltInDualCamera";
  *(void *)&v171[3] = @"AVCaptureDeviceTypeBuiltInUltraWideCamera";
  formatDescriptionOut[2] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA490;
  formatDescriptionOut[3] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA4A8;
  *(void *)&v171[4] = @"AVCaptureDeviceTypeBuiltInDualWideCamera";
  *(void *)&v171[5] = @"AVCaptureDeviceTypeBuiltInTripleCamera";
  formatDescriptionOut[4] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA4C0;
  formatDescriptionOut[5] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA4D8;
  long long v48 = (const opaqueCMFormatDescription *)&unk_1EF4FA508;
  if (v46) {
    long long v48 = (const opaqueCMFormatDescription *)&unk_1EF4FA4F0;
  }
  *(void *)&v171[6] = @"AVCaptureDeviceTypeBuiltInTrueDepthCamera";
  *(void *)&v171[7] = @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera";
  formatDescriptionOut[6] = v48;
  formatDescriptionOut[7] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA520;
  *(void *)&v171[8] = @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera";
  *(void *)&v171[9] = @"AVCaptureDeviceTypeDeskViewCamera";
  formatDescriptionOut[8] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA538;
  formatDescriptionOut[9] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA550;
  long long v49 = (const opaqueCMFormatDescription *)&unk_1EF4FA580;
  if (v46) {
    long long v49 = (const opaqueCMFormatDescription *)&unk_1EF4FA568;
  }
  *(void *)&v171[10] = @"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera";
  *(void *)&v171[11] = @"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera";
  formatDescriptionOut[10] = v49;
  formatDescriptionOut[11] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA598;
  *(void *)&v171[12] = @"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera";
  *(void *)&v171[13] = @"AVCaptureDeviceTypeExternal";
  formatDescriptionOut[12] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA5B0;
  formatDescriptionOut[13] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA5C8;
  *(void *)&v171[14] = @"AVCaptureDeviceTypeContinuityCamera";
  formatDescriptionOut[14] = (CMMetadataFormatDescriptionRef)&unk_1EF4FA5E0;
  objc_msgSend(v11, "setUnderlyingDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", formatDescriptionOut, v171, 15), "objectForKeyedSubscript:", v45), "intValue"));
  internal = self->_internal;
  if (!internal->outputWeakReference)
  {
    if (internal->videoPreviewLayerWeakReference)
    {
      v55 = [(AVCaptureConnection *)self videoPreviewLayer];
      id v53 = objc_alloc_init(MEMORY[0x1E4F50FA8]);
      objc_msgSend(v53, "setSinkID:", -[AVCaptureVideoPreviewLayer sinkID](v55, "sinkID"));
      objc_msgSend(v53, "setDepthDataDeliveryEnabled:", -[AVCaptureVideoPreviewLayer isDepthDataDeliveryEnabled](v55, "isDepthDataDeliveryEnabled"));
      objc_msgSend(v53, "setFilterRenderingEnabled:", -[AVCaptureVideoPreviewLayer isFilterRenderingEnabled](v55, "isFilterRenderingEnabled"));
      objc_msgSend(v53, "setFilters:", -[AVCaptureVideoPreviewLayer videoPreviewFilters](v55, "videoPreviewFilters"));
      objc_msgSend(v53, "setPortraitAutoSuggestEnabled:", -[AVCaptureVideoPreviewLayer isPortraitAutoSuggestEnabled](v55, "isPortraitAutoSuggestEnabled"));
      [v14 setMirroringEnabled:self->_internal->videoMirrored];
      int64_t activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
      if (objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled"))
      {
        uint64_t v60 = 0;
        v59 = v44;
      }
      else
      {
        int64_t v57 = activeVideoStabilizationMode + 1;
        BOOL v58 = (unint64_t)(activeVideoStabilizationMode + 1) > 6;
        v59 = v44;
        if (v58) {
          uint64_t v60 = 0;
        }
        else {
          uint64_t v60 = dword_1A1636858[v57];
        }
      }
      [v14 setVideoStabilizationMethod:v60];
      [v59 input];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v66 = (void *)[v59 input];
        [v66 simulatedAperture];
        objc_msgSend(v53, "setSimulatedAperture:");
        [v66 portraitLightingEffectStrength];
        objc_msgSend(v53, "setPortraitLightingEffectStrength:");
      }
      objc_msgSend(v53, "setSemanticStyleRenderingEnabled:", -[AVCaptureVideoPreviewLayer isSemanticStyleRenderingEnabled](v55, "isSemanticStyleRenderingEnabled"));
      if ([(AVCaptureVideoPreviewLayer *)v55 semanticStyle])
      {
        id v67 = [(AVCaptureVideoPreviewLayer *)v55 semanticStyle];
        v68 = (void *)MEMORY[0x1E4F50F60];
        [v67 toneBias];
        int v70 = v69;
        [v67 warmthBias];
        LODWORD(v72) = v71;
        LODWORD(v73) = v70;
        objc_msgSend(v53, "setSemanticStyle:", objc_msgSend(v68, "semanticStyleWithToneBias:warmthBias:", v73, v72));
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v53 setPrimaryCaptureRectModificationEnabled:1];
        *(_OWORD *)formatDescriptionOut = *MEMORY[0x1E4F1DAD8];
        v171[0] = 0.0;
        uint64_t v136 = 0;
        [(AVCaptureVideoPreviewLayer *)v55 getPrimaryCaptureRectCenter:formatDescriptionOut aspectRatio:v171 uniqueID:&v136];
        objc_msgSend(v53, "setPrimaryCaptureRectCenter:", *(double *)formatDescriptionOut, *(double *)&formatDescriptionOut[1]);
        [v53 setPrimaryCaptureRectAspectRatio:v171[0]];
        [v53 setPrimaryCaptureRectUniqueID:v136];
      }
      objc_msgSend(v53, "setZoomPIPOverlayEnabled:", -[AVCaptureVideoPreviewLayer isZoomPictureInPictureOverlayEnabled](v55, "isZoomPictureInPictureOverlayEnabled"));
    }
    else
    {
      id v53 = 0;
    }
    goto LABEL_148;
  }
  id v51 = v7;
  long long v52 = [(AVCaptureConnection *)self output];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F50F98]);
    if ([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] supportsQuadraHighResolutionStillImageOutput])
    {
      uint64_t v54 = [(AVCaptureOutput *)v52 isHighResolutionStillImageOutputEnabled];
    }
    else
    {
      uint64_t v54 = 0;
    }
    [v53 setQuadraHighResCaptureEnabled:v54];
    if (AVGestaltGetBoolAnswer(@"AVGQCaptureZeroShutterLagAutomaticallyEnabled")
      && [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] isZeroShutterLagSupported])
    {
      [v53 setZeroShutterLagEnabled:1];
    }
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v133 isEqualToString:@"AVCaptureSessionPresetVoicemailGreeting"])
    {
      id v53 = objc_alloc_init(MEMORY[0x1E4F50EF8]);
      v61 = 0;
    }
    else
    {
      id v53 = objc_alloc_init(MEMORY[0x1E4F50F50]);
      int64_t v74 = self->_internal->activeVideoStabilizationMode;
      if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
        || (unint64_t)(v74 + 1) > 6)
      {
        uint64_t v75 = 0;
      }
      else
      {
        uint64_t v75 = dword_1A1636858[v74 + 1];
      }
      [v14 setVideoStabilizationMethod:v75];
      v61 = v53;
    }
    [v14 setLivePhotoMetadataWritingEnabled:self->_internal->livePhotoMetadataWritingEnabled];
    if (v51 == obj)
    {
      if (v14)
      {
        v88 = (void *)[(AVCaptureOutput *)v52 outputSettingsForConnection:self];
        v89 = (void *)[v88 objectForKeyedSubscript:*MEMORY[0x1E4F47DB0]];
        uint64_t v90 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4F47D60]];
        if (v89)
        {
          v91 = (void *)v90;
          if (v90)
          {
            objc_msgSend(v14, "setOutputWidth:", objc_msgSend(v89, "intValue"));
            objc_msgSend(v14, "setOutputHeight:", objc_msgSend(v91, "intValue"));
          }
        }
      }
    }
    if (avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken != -1) {
      dispatch_once(&avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken, &__block_literal_global_6);
    }
    [v14 setPhysicalMirroringForMovieRecordingEnabled:self->_internal->videoMirroringMethodForMovieRecording == 2];
    objc_msgSend(v14, "setZoomSmoothingEnabled:", -[AVCaptureConnection isVideoZoomSmoothingEnabled](self, "isVideoZoomSmoothingEnabled"));
    objc_msgSend(v14, "setVideoGreenGhostMitigationEnabled:", -[AVCaptureConnection isVideoGreenGhostMitigationEnabled](self, "isVideoGreenGhostMitigationEnabled"));
    objc_msgSend(v14, "setStereoVideoCaptureEnabled:", -[AVCaptureOutput isSpatialVideoCaptureEnabled](v52, "isSpatialVideoCaptureEnabled"));
    if ([v14 stereoVideoCaptureEnabled]) {
      [v14 setVideoGreenGhostMitigationEnabled:0];
    }
    objc_msgSend(v61, "setTrueVideoCaptureEnabled:", -[AVCaptureOutput isTrueVideoCaptureEnabled](v52, "isTrueVideoCaptureEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = (void *)[(AVCaptureOutput *)v52 videoSettings];
    id v53 = objc_alloc_init(MEMORY[0x1E4F50FA0]);
    objc_msgSend(v14, "setOutputWidth:", objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue"));
    objc_msgSend(v14, "setOutputHeight:", objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue"));
    uint64_t v63 = [v62 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    if (!v63) {
      goto LABEL_135;
    }
    v64 = (void *)v63;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v65 = v64;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_135;
      }
      v65 = (void *)[v64 firstObject];
    }
    objc_msgSend(v14, "setOutputFormat:", objc_msgSend(v65, "unsignedIntValue"));
LABEL_135:
    objc_msgSend(v14, "setOrientation:", -[AVCaptureConnection _videoOrientation](self, "_videoOrientation"));
    [v14 setMirroringEnabled:self->_internal->videoMirrored];
    int64_t v93 = self->_internal->activeVideoStabilizationMode;
    if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
      || (unint64_t)(v93 + 1) > 6)
    {
      uint64_t v94 = 0;
    }
    else
    {
      uint64_t v94 = dword_1A1636858[v93 + 1];
    }
    [v14 setVideoStabilizationMethod:v94];
    objc_msgSend(v14, "setDeviceOrientationCorrectionEnabled:", -[AVCaptureConnection isVideoDeviceOrientationCorrectionEnabled](self, "isVideoDeviceOrientationCorrectionEnabled"));
    objc_msgSend(v14, "setZoomSmoothingEnabled:", -[AVCaptureConnection isVideoZoomSmoothingEnabled](self, "isVideoZoomSmoothingEnabled"));
    objc_msgSend(v14, "setRetainedBufferCount:", -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount"));
    [v14 setCameraIntrinsicMatrixDeliveryEnabled:self->_internal->cameraIntrinsicMatrixDeliveryEnabled];
    objc_msgSend(v53, "setDiscardsLateVideoFrames:", -[AVCaptureOutput alwaysDiscardsLateVideoFrames](v52, "alwaysDiscardsLateVideoFrames"));
    objc_msgSend(v53, "setOptimizedForPreview:", -[AVCaptureOutput deliversPreviewSizedOutputBuffers](v52, "deliversPreviewSizedOutputBuffers"));
    objc_msgSend(v53, "setSceneStabilityMetadataEnabled:", -[AVCaptureOutput isSceneStabilityMetadataEnabled](v52, "isSceneStabilityMetadataEnabled"));
    objc_msgSend(v53, "setRequestedBufferAttachments:", -[AVCaptureOutput requestedBufferAttachments](v52, "requestedBufferAttachments"));
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F50F10]);
    v76 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeDepthDataFormat] formatDescription];
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v76);
    LODWORD(v78) = Dimensions;
    unint64_t v79 = HIDWORD(Dimensions);
    uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v76);
    int64_t v81 = [(AVCaptureConnection *)self _videoOrientation];
    [(AVCaptureConnection *)self sourcesFromExternalCamera];
    BOOL v82 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
    uint64_t v83 = -3;
    if (v82) {
      uint64_t v83 = -1;
    }
    unint64_t v84 = v83 + v81;
    if (v84 >= 2) {
      uint64_t v85 = v78;
    }
    else {
      uint64_t v85 = v79;
    }
    if (v84 >= 2) {
      uint64_t v78 = v79;
    }
    else {
      uint64_t v78 = v78;
    }
    [v18 setOutputWidth:v85];
    [v18 setOutputHeight:v78];
    [v18 setOutputFormat:MediaSubType];
    [v18 setOrientation:v81];
    [v18 setMirroringEnabled:self->_internal->videoMirrored];
    int64_t v86 = self->_internal->activeVideoStabilizationMode;
    if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
      || (unint64_t)(v86 + 1) > 6)
    {
      uint64_t v87 = 0;
    }
    else
    {
      uint64_t v87 = dword_1A1636858[v86 + 1];
    }
    [v18 setVideoStabilizationMethod:v87];
    objc_msgSend(v18, "setRetainedBufferCount:", -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount"));
    objc_msgSend(v53, "setDiscardsLateDepthData:", -[AVCaptureOutput alwaysDiscardsLateDepthData](v52, "alwaysDiscardsLateDepthData"));
    objc_msgSend(v53, "setFilteringEnabled:", -[AVCaptureOutput isFilteringEnabled](v52, "isFilteringEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v92 = (objc_class *)MEMORY[0x1E4F50EE8];
LABEL_146:
    id v53 = objc_alloc_init(v92);
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v92 = (objc_class *)MEMORY[0x1E4F50F40];
    goto LABEL_146;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F50F28]);
    objc_msgSend(v53, "setIrisMovieCaptureEnabled:", -[AVCaptureOutput isLivePhotoCaptureEnabled](v52, "isLivePhotoCaptureEnabled"));
    if ([v53 irisMovieCaptureEnabled])
    {
      objc_msgSend(v53, "setIrisMovieCaptureSuspended:", -[AVCaptureOutput isLivePhotoCaptureSuspended](v52, "isLivePhotoCaptureSuspended"));
      objc_msgSend(v53, "setPreservesIrisMovieCaptureSuspendedOnSessionStop:", -[AVCaptureOutput preservesLivePhotoCaptureSuspendedOnSessionStop](v52, "preservesLivePhotoCaptureSuspendedOnSessionStop"));
      if (v52)
      {
        [(AVCaptureOutput *)v52 livePhotoMovieDuration];
        long long v151 = v153;
        uint64_t v152 = v154;
        [v53 setIrisMovieDuration:&v151];
        [(AVCaptureOutput *)v52 livePhotoMovieVideoFrameDuration];
      }
      else
      {
        long long v153 = 0uLL;
        uint64_t v154 = 0;
        uint64_t v152 = 0;
        long long v151 = 0uLL;
        [v53 setIrisMovieDuration:&v151];
        long long v149 = 0uLL;
        uint64_t v150 = 0;
      }
      long long v147 = v149;
      uint64_t v148 = v150;
      [v53 setIrisMovieVideoFrameDuration:&v147];
      objc_msgSend(v53, "setIrisMovieAutoTrimMethod:", -[AVCaptureOutput isLivePhotoAutoTrimmingEnabled](v52, "isLivePhotoAutoTrimmingEnabled"));
      if (v14)
      {
        unint64_t v120 = [(AVCaptureOutput *)v52 livePhotoMovieDimensions];
        unint64_t v121 = HIDWORD(v120);
        [v14 setOutputWidth:v120];
        [v14 setOutputHeight:v121];
        objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled");
        [v14 setVideoStabilizationMethod:0];
      }
    }
    if (([v51 isEqual:obj] & 1) == 0 && (objc_msgSend(v53, "irisMovieCaptureEnabled") & 1) == 0) {
      [v11 setEnabled:0];
    }
    objc_msgSend(v53, "setIrisPreparedSettings:", -[AVCaptureOutput figCaptureIrisPreparedSettings](v52, "figCaptureIrisPreparedSettings"));
    objc_msgSend(v53, "setOptimizesImagesForOfflineVideoStabilization:", -[AVCaptureOutput optimizesImagesForOfflineVideoStabilization](v52, "optimizesImagesForOfflineVideoStabilization"));
    objc_msgSend(v53, "setQuadraHighResCaptureEnabled:", -[AVCaptureOutput maxPhotoDimensionsAreHighResolution](v52, "maxPhotoDimensionsAreHighResolution"));
    objc_msgSend(v53, "setDepthDataDeliveryEnabled:", -[AVCaptureOutput isDepthDataDeliveryEnabled](v52, "isDepthDataDeliveryEnabled"));
    objc_msgSend(v53, "setPortraitEffectsMatteDeliveryEnabled:", -[AVCaptureOutput isPortraitEffectsMatteDeliveryEnabled](v52, "isPortraitEffectsMatteDeliveryEnabled"));
    if (objc_msgSend((id)-[AVCaptureOutput enabledSemanticSegmentationMatteTypes](v52, "enabledSemanticSegmentationMatteTypes"), "count"))
    {
      objc_msgSend(v53, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes((void *)-[AVCaptureOutput enabledSemanticSegmentationMatteTypes](v52, "enabledSemanticSegmentationMatteTypes")));
    }
    objc_msgSend(v53, "setFilterRenderingEnabled:", -[AVCaptureOutput isFilterRenderingEnabled](v52, "isFilterRenderingEnabled"));
    objc_msgSend(v53, "setBravoConstituentPhotoDeliveryEnabled:", -[AVCaptureOutput isVirtualDeviceConstituentPhotoDeliveryEnabled](v52, "isVirtualDeviceConstituentPhotoDeliveryEnabled"));
    objc_msgSend(v53, "setMomentCaptureMovieRecordingEnabled:", -[AVCaptureOutput isMovieRecordingEnabled](v52, "isMovieRecordingEnabled"));
    objc_msgSend(v53, "setSpatialOverCaptureEnabled:", -[AVCaptureOutput isSpatialOverCaptureEnabled](v52, "isSpatialOverCaptureEnabled"));
    objc_msgSend(v53, "setDeferredProcessingEnabled:", -[AVCaptureOutput isAutoDeferredPhotoDeliveryEnabled](v52, "isAutoDeferredPhotoDeliveryEnabled"));
    objc_msgSend(v53, "setDigitalFlashCaptureEnabled:", -[AVCaptureOutput isDigitalFlashCaptureEnabled](v52, "isDigitalFlashCaptureEnabled"));
    objc_msgSend(v53, "setFocusPixelBlurScoreEnabled:", -[AVCaptureOutput isFocusPixelBlurScoreEnabled](v52, "isFocusPixelBlurScoreEnabled"));
    objc_msgSend(v53, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[AVCaptureOutput isPreviewQualityAdjustedPhotoFilterRenderingEnabled](v52, "isPreviewQualityAdjustedPhotoFilterRenderingEnabled"));
    objc_msgSend(v53, "setIntelligentDistortionCorrectionEnabled:", -[AVCaptureOutput isContentAwareDistortionCorrectionEnabled](v52, "isContentAwareDistortionCorrectionEnabled"));
    objc_msgSend(v53, "setDemosaicedRawEnabled:", -[AVCaptureOutput isAppleProRAWEnabled](v52, "isAppleProRAWEnabled"));
    uint64_t v122 = [(AVCaptureOutput *)v52 maxPhotoQualityPrioritization];
    if ([(AVCaptureOutput *)v52 isDepthDataDeliveryEnabled]
      && v122 == 3)
    {
      if (AVGestaltGetBoolAnswer(@"AVGQCaptureDepthWithDeepFusionSupported")) {
        uint64_t v122 = 3;
      }
      else {
        uint64_t v122 = 2;
      }
    }
    [v53 setMaxQualityPrioritization:v122];
    objc_msgSend(v53, "setFastCapturePrioritizationEnabled:", -[AVCaptureOutput isFastCapturePrioritizationEnabled](v52, "isFastCapturePrioritizationEnabled"));
    objc_msgSend(v53, "setZeroShutterLagEnabled:", -[AVCaptureOutput isZeroShutterLagEnabled](v52, "isZeroShutterLagEnabled"));
    objc_msgSend(v53, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[AVCaptureOutput isUltraHighResolutionZeroShutterLagSupportEnabled](v52, "isUltraHighResolutionZeroShutterLagSupportEnabled"));
    objc_msgSend(v53, "setResponsiveCaptureEnabled:", -[AVCaptureOutput isResponsiveCaptureEnabled](v52, "isResponsiveCaptureEnabled"));
    objc_msgSend(v53, "setSemanticStyleRenderingEnabled:", -[AVCaptureOutput isSemanticStyleRenderingEnabled](v52, "isSemanticStyleRenderingEnabled"));
    objc_msgSend(v53, "setConstantColorEnabled:", -[AVCaptureOutput isConstantColorEnabled](v52, "isConstantColorEnabled"));
    objc_msgSend(v53, "setConstantColorClippingRecoveryEnabled:", -[AVCaptureOutput isConstantColorClippingRecoveryEnabled](v52, "isConstantColorClippingRecoveryEnabled"));
    objc_msgSend(v53, "setConstantColorSaturationBoostEnabled:", -[AVCaptureOutput isConstantColorSaturationBoostEnabled](v52, "isConstantColorSaturationBoostEnabled"));
    if (avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken != -1) {
      dispatch_once(&avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken, &__block_literal_global_6);
    }
    [v14 setPhysicalMirroringForMovieRecordingEnabled:self->_internal->videoMirroringMethodForMovieRecording == 2];
    objc_msgSend(v53, "setMaxPhotoDimensions:", -[AVCaptureOutput maxPhotoDimensions](v52, "maxPhotoDimensions"));
    objc_msgSend(v53, "setExifFocalLengthsByZoomFactor:", -[AVCaptureOutput exifFocalLengthsByZoomFactor](v52, "exifFocalLengthsByZoomFactor"));
    objc_msgSend(v53, "setStereoPhotoCaptureEnabled:", -[AVCaptureOutput isSpatialPhotoCaptureEnabled](v52, "isSpatialPhotoCaptureEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F50FB0]);
    objc_msgSend(v53, "setFilters:", -[AVCaptureOutput filters](v52, "filters"));
    if ([(AVCaptureOutput *)v52 smartStyles])
    {
      v130 = v53;
      v102 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)-[AVCaptureOutput smartStyles](v52, "smartStyles"), "count"));
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      v132 = v52;
      id obja = (id)[(AVCaptureOutput *)v52 smartStyles];
      uint64_t v103 = [obja countByEnumeratingWithState:&v143 objects:v167 count:16];
      if (v103)
      {
        uint64_t v104 = v103;
        uint64_t v105 = *(void *)v144;
        do
        {
          for (uint64_t k = 0; k != v104; ++k)
          {
            if (*(void *)v144 != v105) {
              objc_enumerationMutation(obja);
            }
            v107 = *(void **)(*((void *)&v143 + 1) + 8 * k);
            v108 = (void *)MEMORY[0x1E4F50F78];
            uint64_t v109 = [v107 cast];
            [v107 intensity];
            int v111 = v110;
            [v107 toneBias];
            int v113 = v112;
            [v107 colorBias];
            LODWORD(v115) = v114;
            LODWORD(v116) = v111;
            LODWORD(v117) = v113;
            objc_msgSend(v102, "addObject:", objc_msgSend(v108, "styleWithCast:intensity:toneBias:colorBias:", v109, v116, v117, v115));
          }
          uint64_t v104 = [obja countByEnumeratingWithState:&v143 objects:v167 count:16];
        }
        while (v104);
      }
      id v53 = v130;
      [v130 setSmartStyles:v102];
      long long v52 = v132;
    }
    [(AVCaptureOutput *)v52 thumbnailSize];
    objc_msgSend(v53, "setThumbnailSize:");
    goto LABEL_147;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F50FB8]);
    if (v52) {
      [(AVCaptureOutput *)v52 minFrameDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v125 = 1.0 / CMTimeGetSeconds(&time);
    *(float *)&double v125 = v125;
    [v53 setMaxFrameRate:v125];
    if (v52) {
      [(AVCaptureOutput *)v52 minBurstFrameDuration];
    }
    else {
      memset(&v141, 0, sizeof(v141));
    }
    double v126 = 1.0 / CMTimeGetSeconds(&v141);
    *(float *)&double v126 = v126;
    [v53 setMaxBurstFrameRate:v126];
    if (v52)
    {
      [(AVCaptureOutput *)v52 maxBurstDuration];
    }
    else
    {
      long long v139 = 0uLL;
      uint64_t v140 = 0;
    }
    long long v137 = v139;
    uint64_t v138 = v140;
    [v53 setMaxBurstDuration:&v137];
    objc_msgSend(v53, "setGaussianPyramidOctavesCount:", -[AVCaptureOutput gaussianPyramidOctavesCount](v52, "gaussianPyramidOctavesCount"));
    [(AVCaptureOutput *)v52 gaussianPyramidBaseOctaveDownscalingFactor];
    objc_msgSend(v53, "setGaussianPyramidBaseOctaveDownscalingFactor:");
    objc_msgSend(v53, "setMaxKeypointsCount:", -[AVCaptureOutput maxKeypointsCount](v52, "maxKeypointsCount"));
    [(AVCaptureOutput *)v52 keypointDetectionThreshold];
    objc_msgSend(v53, "setKeypointDetectionThreshold:");
    objc_msgSend(v53, "setFeatureBinningEnabled:", -[AVCaptureOutput isFeatureBinningEnabled](v52, "isFeatureBinningEnabled"));
    objc_msgSend(v53, "setFeatureOrientationAssignmentEnabled:", -[AVCaptureOutput isFeatureOrientationAssignmentEnabled](v52, "isFeatureOrientationAssignmentEnabled"));
    objc_msgSend(v53, "setDynamicThresholdingEnabled:", -[AVCaptureOutput isDynamicThresholdingEnabled](v52, "isDynamicThresholdingEnabled"));
    objc_msgSend(v53, "setKeypointDetectionFlowType:", -[AVCaptureOutput keypointDetectionFlowType](v52, "keypointDetectionFlowType"));
    objc_msgSend(v53, "setSubPixelThreshold:", -[AVCaptureOutput subPixelThreshold](v52, "subPixelThreshold"));
    objc_msgSend(v53, "setFeatureMatchingEnabled:", -[AVCaptureOutput isFeatureMatchingEnabled](v52, "isFeatureMatchingEnabled"));
    objc_msgSend(v53, "setFeatureMatchingDescriptorSize:", -[AVCaptureOutput featureMatchingDescriptorSize](v52, "featureMatchingDescriptorSize"));
    [(AVCaptureOutput *)v52 orientationDistanceThreshold];
    objc_msgSend(v53, "setOrientationDistanceThreshold:");
    [(AVCaptureOutput *)v52 sigmaDistanceThreshold];
    objc_msgSend(v53, "setSigmaDistanceThreshold:");
    [(AVCaptureOutput *)v52 squareDistanceDisparityFraction];
    objc_msgSend(v53, "setSquareDistanceDisparityFraction:");
    objc_msgSend(v53, "setHammingDistanceThreshold:", -[AVCaptureOutput hammingDistanceThreshold](v52, "hammingDistanceThreshold"));
    objc_msgSend(v53, "setLaccConfigAndMetadata:", -[AVCaptureOutput laccConfigAndMetadata](v52, "laccConfigAndMetadata"));
    uint64_t v118 = [(AVCaptureConnection *)self clientRetainedBufferCount];
    v119 = v17;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v123 = objc_alloc_init(MEMORY[0x1E4F50F00]);
        objc_msgSend(v123, "setDiscardsLateCameraCalibrationData:", -[AVCaptureOutput alwaysDiscardsLateCameraCalibrationData](v52, "alwaysDiscardsLateCameraCalibrationData"));
        objc_msgSend(v15, "setOrientation:", -[AVCaptureConnection _videoOrientation](self, "_videoOrientation"));
        v124 = v15;
        id v53 = v123;
        [v124 setMirroringEnabled:self->_internal->videoMirrored];
      }
      else
      {
        id v53 = 0;
      }
      goto LABEL_147;
    }
    id v53 = objc_alloc_init(MEMORY[0x1E4F50F58]);
    objc_msgSend(v53, "setDiscardsLatePointCloudData:", -[AVCaptureOutput alwaysDiscardsLatePointCloudData](v52, "alwaysDiscardsLatePointCloudData"));
    uint64_t v118 = [(AVCaptureConnection *)self clientRetainedBufferCount];
    v119 = v16;
  }
  [v119 setRetainedBufferCount:v118];
LABEL_147:
  objc_msgSend(v53, "setSinkID:", -[AVCaptureOutput sinkID](v52, "sinkID"));
LABEL_148:
  [v11 setSinkConfiguration:v53];
  if (objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "videoStabilizationStrength") == 2)
  {
    [(AVCaptureConnection *)self output];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || ([(AVCaptureConnection *)self output], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v14 setVideoStabilizationMethod:5];
    }
    objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "setVideoStabilizationStrength:", 0);
  }
  return v11;
}

- (void)setupObservers
{
  internal = self->_internal;
  if (!internal->hasActiveObservers)
  {
    internal->hasActiveObservers = 1;
    uint64_t v4 = self->_internal;
    sourceDevice = v4->sourceDevice;
    if (sourceDevice)
    {
      [(AVCaptureDevice *)sourceDevice addObserver:self forKeyPath:@"activeFormat" options:3 context:AVCaptureConnectionDeviceActiveFormatChangedContext];
      [(AVCaptureDevice *)self->_internal->sourceDevice addObserver:self forKeyPath:@"activeDepthDataFormat" options:3 context:AVCaptureConnectionDeviceActiveDepthDataFormatChangedContext];
      uint64_t v4 = self->_internal;
    }
    if (v4->audioInputPort)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel_inputPortFormatDescriptionChanged_, @"AVCaptureInputPortFormatDescriptionDidChangeNotification", self->_internal->audioInputPort);
      [(AVCaptureConnection *)self updateAudioChannelsArray];
    }
    else if (v4->videoInputPort && v4->sourceDevice)
    {
      objc_super v6 = [(AVCaptureConnection *)self output];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(AVCaptureOutput *)v6 addObserver:self forKeyPath:@"livePhotoCaptureEnabled" options:3 context:AVCaptureConnectionLivePhotoEnabledChangedContext];
      }
      id v7 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      [(AVCaptureConnection *)self _updatePropertiesForFormat:v7];
    }
    else if (v4->pointCloudDataInputPort)
    {
      int v8 = v4->sourceDevice;
      if (v8)
      {
        uint64_t v9 = AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext;
        [(AVCaptureDevice *)v8 addObserver:self forKeyPath:@"timeOfFlightProjectorMode" options:3 context:v9];
      }
    }
  }
}

- (void)updateAudioChannelsArray
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = [(AVCaptureInputPort *)self->_internal->audioInputPort formatDescription];
  if (v4) {
    unint64_t mChannelsPerFrame = CMAudioFormatDescriptionGetStreamBasicDescription(v4)->mChannelsPerFrame;
  }
  else {
    unint64_t mChannelsPerFrame = 1;
  }
  if ([(NSMutableArray *)self->_internal->audioChannels count] != mChannelsPerFrame)
  {
    [(AVCaptureConnection *)self willChangeValueForKey:@"audioChannels"];
    while ([(NSMutableArray *)self->_internal->audioChannels count] < mChannelsPerFrame)
    {
      objc_super v6 = [[AVCaptureAudioChannel alloc] initWithConnection:self];
      [(NSMutableArray *)self->_internal->audioChannels addObject:v6];
    }
    while ([(NSMutableArray *)self->_internal->audioChannels count] > mChannelsPerFrame)
    {
      objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->audioChannels, "lastObject"), "invalidate");
      [(NSMutableArray *)self->_internal->audioChannels removeLastObject];
    }
    [(AVCaptureConnection *)self didChangeValueForKey:@"audioChannels"];
  }

  objc_sync_exit(internal);
}

- (unsigned)clientRetainedBufferCount
{
  if (!self->_internal->outputWeakReference) {
    return 0;
  }
  int v3 = [(AVCaptureConnection *)self output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    internal = self->_internal;
    unsigned int result = internal->videoRetainedBufferCountHint;
    if (!result)
    {
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)internal->sourceDevice activeFormat] formatDescription]);
      if (Dimensions.height <= 3023 || Dimensions.width <= 4031) {
        return 12;
      }
      else {
        return 5;
      }
    }
    return result;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unsigned int result = self->_internal->videoRetainedBufferCountHint;
  if (!result)
  {
    if (v3)
    {
      [(AVCaptureOutput *)v3 minBurstFrameDuration];
      double Seconds = CMTimeGetSeconds(&time);
      [(AVCaptureOutput *)v3 minFrameDuration];
    }
    else
    {
      memset(&time, 0, sizeof(time));
      double Seconds = CMTimeGetSeconds(&time);
      memset(&v17, 0, sizeof(v17));
    }
    float v9 = 1.0 / Seconds;
    float v10 = 1.0 / CMTimeGetSeconds(&v17);
    id v11 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "figCaptureSourceConfigurationForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](v3, "session"), "sessionPreset"));
    if (v9 == 0.0) {
      float v9 = v10;
    }
    objc_msgSend(v11, "requiredMaxFrameRate", v17.value, *(void *)&v17.timescale, v17.epoch);
    float v13 = v9 / v12;
    CMVideoDimensions v14 = CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] formatDescription]);
    BOOL v15 = v14.height <= 3023 || v14.width <= 4031;
    float v16 = 12.0;
    if (!v15) {
      float v16 = 5.0;
    }
    return (int)((float)(v13 * v16) + 0.5);
  }
  return result;
}

- (id)session
{
  if (self->_internal->outputWeakReference) {
    v2 = [(AVCaptureConnection *)self output];
  }
  else {
    v2 = [(AVCaptureConnection *)self videoPreviewLayer];
  }

  return [(AVCaptureOutput *)v2 session];
}

- (BOOL)isVideoZoomSmoothingEnabled
{
  return self->_internal->videoZoomSmoothingEnabled;
}

+ (id)keyPathsForValuesAffectingVideoRotationAngle
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"videoOrientation"];
}

+ (id)keyPathsForValuesAffectingVideoOrientation
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"videoRotationAngle"];
}

- (void)setVideoMirrored:(BOOL)videoMirrored
{
  BOOL v3 = videoMirrored;
  if (![(AVCaptureConnection *)self isVideoMirroringSupported])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_5;
  }
  if ([(AVCaptureConnection *)self automaticallyAdjustsVideoMirroring])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
LABEL_5:
    id v7 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
    return;
  }
  internal = self->_internal;
  if (internal->videoMirrored != v3)
  {
    internal->videoMirrored = v3;
    float v9 = [(AVCaptureConnection *)self output];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [(AVCaptureOutput *)v9 bumpChangeSeed];
    }
    else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(AVCaptureOutput *)v9 _recordingInProgress])
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __40__AVCaptureConnection_setVideoMirrored___block_invoke;
          v10[3] = &unk_1E5A73168;
          v10[4] = self;
          BOOL v11 = v3;
          [(AVCaptureOutput *)v9 performFigCaptureSessionOperationSafelyUsingBlock:v10];
        }
      }
    }
  }
}

- (BOOL)isVideoMirroringSupported
{
  return self->_internal->videoMirroringSupported;
}

- (BOOL)automaticallyAdjustsVideoMirroring
{
  return self->_internal->automaticallyAdjustsVideoMirroring;
}

- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)automaticallyAdjustsVideoMirroring
{
  self->_internal->automaticallyAdjustsVideoMirroring = automaticallyAdjustsVideoMirroring;
}

- (BOOL)isVideoMirrored
{
  return self->_internal->videoMirrored;
}

- (void)setPreferredVideoStabilizationMode:(AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode
{
  if ((unint64_t)(preferredVideoStabilizationMode + 1) >= 7)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, preferredVideoStabilizationMode);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->preferredVideoStabilizationMode != preferredVideoStabilizationMode)
    {
      internal->preferredVideoStabilizationMode = preferredVideoStabilizationMode;
      int64_t v5 = [(AVCaptureConnection *)self _resolveActiveVideoStabilizationMode:preferredVideoStabilizationMode format:[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat]];
      [(AVCaptureConnection *)self _updateActiveVideoStabilizationMode:v5 bumpChangeSeed:1];
    }
  }
}

- (void)_handleChangedActiveFormat:(id)a3 forDevice:(id)a4 formatMediaType:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1A62348E0](self, a2);
  long long v31 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v30 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = [(AVCaptureConnection *)self inputPorts];
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    uint64_t v12 = *MEMORY[0x1E4F47C48];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        CMVideoDimensions v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [(AVCaptureConnection *)self output];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [a5 isEqualToString:v12]) {
          objc_msgSend(v32, "addObject:", -[AVCaptureConnection output](self, "output"));
        }
        if ((id)objc_msgSend((id)objc_msgSend(v14, "input"), "videoDevice") == a4
          && objc_msgSend(-[AVCaptureConnection mediaType](self, "mediaType"), "isEqual:", a5))
        {
          objc_msgSend(v31, "addObject:", objc_msgSend(v14, "input"));
          if ([(AVCaptureConnection *)self output])
          {
            BOOL v15 = [(AVCaptureConnection *)self output];
            float v16 = v32;
          }
          else
          {
            if (![(AVCaptureConnection *)self videoPreviewLayer]) {
              continue;
            }
            BOOL v15 = [(AVCaptureConnection *)self videoPreviewLayer];
            float v16 = v30;
          }
          [v16 addObject:v15];
        }
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v10);
  }
  if (objc_msgSend(-[AVCaptureConnection mediaType](self, "mediaType"), "isEqualToString:", a5)) {
    [(AVCaptureConnection *)self _updatePropertiesForFormat:a3];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v17 = [v31 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * j) handleChangedActiveFormat:a3 forDevice:a4];
      }
      uint64_t v18 = [v31 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v18);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v21 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * k) handleChangedActiveFormat:a3 forDevice:a4];
      }
      uint64_t v22 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v22);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v25 = [v30 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * m) handleChangedActiveFormat:a3 forDevice:a4];
      }
      uint64_t v26 = [v30 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v26);
  }
}

- (void)_updateActiveVideoStabilizationMode:(int64_t)a3 bumpChangeSeed:(BOOL)a4
{
  if (a3 != -1)
  {
    internal = self->_internal;
    unint64_t activeVideoStabilizationMode = internal->activeVideoStabilizationMode;
    if (activeVideoStabilizationMode != a3)
    {
      BOOL v8 = a4;
      if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x2C) != 0)
      {
        if (internal->hasActiveObservers && !internal->hasVideoMinFrameDurationObserver)
        {
          internal->hasVideoMinFrameDurationObserver = 1;
          [(AVCaptureDevice *)self->_internal->sourceDevice addObserver:self forKeyPath:@"activeVideoMinFrameDuration" options:3 context:AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext];
        }
      }
      else
      {
        BOOL v9 = activeVideoStabilizationMode > 5;
        uint64_t v10 = (1 << activeVideoStabilizationMode) & 0x2C;
        BOOL v11 = v9 || v10 == 0;
        if (!v11 && internal->hasVideoMinFrameDurationObserver)
        {
          internal->hasVideoMinFrameDurationObserver = 0;
          [(AVCaptureDevice *)self->_internal->sourceDevice removeObserver:self forKeyPath:@"activeVideoMinFrameDuration" context:AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext];
        }
      }
      [(AVCaptureConnection *)self willChangeValueForKey:@"videoStabilizationEnabled"];
      self->_internal->videoStabilizationEnabled = a3 != 0;
      [(AVCaptureConnection *)self didChangeValueForKey:@"videoStabilizationEnabled"];
      [(AVCaptureConnection *)self willChangeValueForKey:@"activeVideoStabilizationMode"];
      self->_internal->unint64_t activeVideoStabilizationMode = a3;
      [(AVCaptureConnection *)self didChangeValueForKey:@"activeVideoStabilizationMode"];
      [(AVCaptureConnection *)self _updateCameraIntrinsicMatrixDeliverySupported];
      [(AVCaptureConnection *)self _updateSupportedVideoMirroringMethodsForMovieRecording];
      [(AVCaptureConnection *)self _updateZoomSmoothingSupported];
      [(AVCaptureConnection *)self _updateVideoGreenGhostMitigationSupported];
      [(AVCaptureOutput *)[(AVCaptureConnection *)self output] handleVideoStabilizationModeChangedForConnection:self];
      if (v8 && [(AVCaptureConnection *)self isLive])
      {
        uint64_t v12 = [(AVCaptureConnection *)self output];
        [(AVCaptureOutput *)v12 bumpChangeSeed];
      }
    }
  }
}

- (void)_updatePropertiesForFormat:(id)a3
{
  -[AVCaptureConnection _updateMaxScaleAndCropFactorForFormat:](self, "_updateMaxScaleAndCropFactorForFormat:");
  if ([(AVCaptureConnection *)self isVideoStabilizationSupported]) {
    [(AVCaptureConnection *)self _updateActiveVideoStabilizationMode:[(AVCaptureConnection *)self _resolveActiveVideoStabilizationMode:self->_internal->preferredVideoStabilizationMode format:a3] bumpChangeSeed:0];
  }
  [(AVCaptureConnection *)self _updateCameraIntrinsicMatrixDeliverySupported];
  [(AVCaptureConnection *)self _updateSupportedVideoMirroringMethodsForMovieRecording];
  [(AVCaptureConnection *)self _updateZoomSmoothingSupported];

  [(AVCaptureConnection *)self _updateVideoGreenGhostMitigationSupported];
}

- (void)_updateSupportedVideoMirroringMethodsForMovieRecording
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(AVCaptureConnection *)self output];
  if (self->_internal->videoMirroringSupported)
  {
    int64_t v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 addObject:&unk_1EF4FA418];
      if ((self->_internal->activeVideoStabilizationMode & 0xFFFFFFFFFFFFFFFBLL) == 0) {
        goto LABEL_9;
      }
LABEL_8:
      [v3 addObject:&unk_1EF4FA430];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 addObject:&unk_1EF4FA418];
      int v6 = [(AVCaptureOutput *)v5 isLivePhotoCaptureEnabled];
      BOOL v7 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] isIrisVideoStabilizationSupported];
      if (v6)
      {
        if (v7) {
          goto LABEL_8;
        }
      }
    }
  }
LABEL_9:
  if (![v3 count]) {
    [v3 addObject:&unk_1EF4FA400];
  }
  if (([v3 isEqual:self->_internal->supportedVideoMirroringMethodsForMovieRecording] & 1) == 0)
  {
    if (objc_msgSend(v3, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", self->_internal->videoMirroringMethodForMovieRecording)))uint64_t videoMirroringMethodForMovieRecording = self->_internal->videoMirroringMethodForMovieRecording; {
    else
    }
      uint64_t videoMirroringMethodForMovieRecording = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "integerValue");
    [(AVCaptureConnection *)self willChangeValueForKey:@"supportedVideoMirroringMethodsForMovieRecording"];

    self->_internal->supportedVideoMirroringMethodsForMovieRecording = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v3];
    if (videoMirroringMethodForMovieRecording != self->_internal->videoMirroringMethodForMovieRecording)
    {
      [(AVCaptureConnection *)self willChangeValueForKey:@"videoMirroringMethodForMovieRecording"];
      self->_internal->uint64_t videoMirroringMethodForMovieRecording = videoMirroringMethodForMovieRecording;
      [(AVCaptureConnection *)self didChangeValueForKey:@"videoMirroringMethodForMovieRecording"];
    }
    [(AVCaptureConnection *)self didChangeValueForKey:@"supportedVideoMirroringMethodsForMovieRecording"];
  }
}

- (void)_updateZoomSmoothingSupported
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int isKindOfClass = 1;
  }
  else
  {
    [(AVCaptureConnection *)self output];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  int64_t activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
  if (activeVideoStabilizationMode == 3 || activeVideoStabilizationMode == 5) {
    int v6 = isKindOfClass;
  }
  else {
    int v6 = 0;
  }
  id v7 = [(AVCaptureConnection *)self mediaType];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F47C68]];
  BOOL v9 = [(AVCaptureDevice *)self->_internal->sourceDevice isVideoZoomSmoothingSupported] & v6 & v8;
  if (self->_internal->videoZoomSmoothingSupported != v9)
  {
    [(AVCaptureConnection *)self willChangeValueForKey:@"videoZoomSmoothingSupported"];
    self->_internal->videoZoomSmoothingSupported = v9;
    if (!v9 && self->_internal->videoZoomSmoothingEnabled)
    {
      [(AVCaptureConnection *)self willChangeValueForKey:@"videoZoomSmoothingEnabled"];
      self->_internal->videoZoomSmoothingEnabled = 0;
      [(AVCaptureConnection *)self didChangeValueForKey:@"videoZoomSmoothingEnabled"];
    }
    [(AVCaptureConnection *)self didChangeValueForKey:@"videoZoomSmoothingSupported"];
  }
}

- (void)_updateVideoGreenGhostMitigationSupported
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [(AVCaptureOutput *)[(AVCaptureConnection *)self output] isSpatialVideoCaptureEnabled] ^ 1;
  }
  else {
    int v3 = 0;
  }
  int64_t activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
  if (activeVideoStabilizationMode == 3 || activeVideoStabilizationMode == 5) {
    int v6 = v3;
  }
  else {
    int v6 = 0;
  }
  id v7 = [(AVCaptureConnection *)self mediaType];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F47C68]];
  BOOL v9 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] isVideoGreenGhostMitigationSupported] & v8 & v6;
  if (self->_internal->videoGreenGhostMitigationSupported != v9)
  {
    [(AVCaptureConnection *)self willChangeValueForKey:@"videoGreenGhostMitigationSupported"];
    self->_internal->videoGreenGhostMitigationSupported = v9;
    if (!v9 && self->_internal->videoGreenGhostMitigationEnabled)
    {
      [(AVCaptureConnection *)self willChangeValueForKey:@"videoGreenGhostMitigationEnabled"];
      self->_internal->videoGreenGhostMitigationEnabled = 0;
      [(AVCaptureConnection *)self didChangeValueForKey:@"videoGreenGhostMitigationEnabled"];
    }
    [(AVCaptureConnection *)self didChangeValueForKey:@"videoGreenGhostMitigationSupported"];
  }
}

- (BOOL)isVideoStabilizationSupported
{
  internal = self->_internal;
  if (internal->videoPreviewLayerWeakReference)
  {
    int v3 = [(AVCaptureDevice *)internal->sourceDevice activeFormat];
    LOBYTE(v4) = [(AVCaptureDeviceFormat *)v3 isVideoStabilizationModeSupported:4];
  }
  else
  {
    id v6 = [(AVCaptureConnection *)self mediaType];
    int v4 = [v6 isEqualToString:*MEMORY[0x1E4F47C68]];
    if (v4)
    {
      sourceDevice = self->_internal->sourceDevice;
      LOBYTE(v4) = [(AVCaptureDevice *)sourceDevice isVideoStabilizationSupported];
    }
  }
  return v4;
}

- (void)_updateMaxScaleAndCropFactorForFormat:(id)a3
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(AVCaptureConnection *)self output], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a3 formatDescription]);
    float v6 = (float)Dimensions.width * 0.0625;
    if (v6 >= (float)((float)Dimensions.height * 0.0625)) {
      float v6 = (float)Dimensions.height * 0.0625;
    }
    double v7 = v6;
    if (self->_internal->videoMaxScaleAndCropFactor != v6)
    {
      [(AVCaptureConnection *)self willChangeValueForKey:@"videoMaxScaleAndCropFactor"];
      self->_internal->videoMaxScaleAndCropFactor = v7;
      [(AVCaptureConnection *)self didChangeValueForKey:@"videoMaxScaleAndCropFactor"];
      if (self->_internal->videoScaleAndCropFactor > self->_internal->videoMaxScaleAndCropFactor)
      {
        [(AVCaptureConnection *)self willChangeValueForKey:@"videoScaleAndCropFactor"];
        self->_internal->videoScaleAndCropFactor = self->_internal->videoMaxScaleAndCropFactor;
        [(AVCaptureConnection *)self didChangeValueForKey:@"videoScaleAndCropFactor"];
      }
    }
  }
}

- (BOOL)_updateCameraIntrinsicMatrixDeliverySupported
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if ((self->_internal->activeVideoStabilizationMode | 4) == 4) {
    int v4 = isKindOfClass;
  }
  else {
    int v4 = 0;
  }
  id v5 = [(AVCaptureConnection *)self mediaType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F47C68]];
  BOOL v7 = [(AVCaptureDevice *)self->_internal->sourceDevice isCameraIntrinsicMatrixDeliverySupported];
  objc_msgSend(-[NSArray lastObject](-[AVCaptureDeviceFormat videoSupportedFrameRateRanges](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
  BOOL v9 = v8 <= 120.0 && v7;
  int v10 = v9 & v6 & v4;
  if (self->_internal->cameraIntrinsicMatrixDeliverySupported == v10) {
    return 0;
  }
  [(AVCaptureConnection *)self willChangeValueForKey:@"cameraIntrinsicMatrixDeliverySupported"];
  self->_internal->cameraIntrinsicMatrixDeliverySupported = v10;
  if ((v10 & 1) != 0 || !self->_internal->cameraIntrinsicMatrixDeliveryEnabled)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(AVCaptureConnection *)self willChangeValueForKey:@"cameraIntrinsicMatrixDeliveryEnabled"];
    self->_internal->cameraIntrinsicMatrixDeliveryEnabled = 0;
    [(AVCaptureConnection *)self didChangeValueForKey:@"cameraIntrinsicMatrixDeliveryEnabled"];
    BOOL v11 = 1;
  }
  [(AVCaptureConnection *)self didChangeValueForKey:@"cameraIntrinsicMatrixDeliverySupported"];
  return v11;
}

- (int64_t)_resolveActiveVideoStabilizationMode:(int64_t)a3 format:(id)a4
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !self->_internal->videoPreviewLayerWeakReference)
    {
      a3 = 0;
      goto LABEL_16;
    }
  }
  if (a3 != -1)
  {
    if (self->_internal->videoPreviewLayerWeakReference)
    {
      if (a3 != 4) {
        return 0;
      }
      goto LABEL_9;
    }
LABEL_16:
    if ([a4 isVideoStabilizationModeSupported:a3]) {
      return a3;
    }
    else {
      return 0;
    }
  }
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a4 formatDescription]);
  if (self->_internal->videoPreviewLayerWeakReference)
  {
LABEL_9:
    int64_t v7 = 4;
    if (![a4 isVideoStabilizationModeSupported:4]) {
      return 0;
    }
    return v7;
  }
  CMVideoDimensions v9 = Dimensions;
  if ([a4 isVideoStabilizationModeSupported:5]
    && (objc_msgSend(-[AVCaptureConnection sourceDevice](self, "sourceDevice"), "isStabilizationAutoSelectionCinematicExtendedEnhancedEnabled") & 1) != 0)
  {
    return 5;
  }
  int64_t v7 = 3;
  if (([a4 isVideoStabilizationModeSupported:3] & 1) == 0)
  {
    if ([a4 isVideoStabilizationModeSupported:2])
    {
      unsigned __int8 BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionAlwaysSelectsStandardVISFor720p30");
      if (v9.width == 1280) {
        unsigned __int8 v12 = BoolAnswer;
      }
      else {
        unsigned __int8 v12 = 0;
      }
      if ((v12 & (HIDWORD(*(unint64_t *)&v9) == 720)) != 0) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      return [a4 isVideoStabilizationModeSupported:1];
    }
  }
  return v7;
}

- (BOOL)isVideoDeviceOrientationCorrectionEnabled
{
  return self->_internal->videoDeviceOrientationCorrectionEnabled;
}

- (CGFloat)videoScaleAndCropFactor
{
  return self->_internal->videoScaleAndCropFactor;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v11 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  uint64_t v12 = *MEMORY[0x1E4F284C8];
  float v13 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  if ((void *)AVCaptureConnectionDeviceActiveFormatChangedContext == a6
    || AVCaptureConnectionDeviceActiveDepthDataFormatChangedContext == (void)a6)
  {
    uint64_t v15 = [a5 objectForKeyedSubscript:v12];
    float v16 = (uint64_t *)MEMORY[0x1E4F47C68];
    if ((void *)AVCaptureConnectionDeviceActiveFormatChangedContext != a6) {
      float v16 = (uint64_t *)MEMORY[0x1E4F47C48];
    }
    uint64_t v17 = *v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v15;
    }
    [(AVCaptureConnection *)self _handleChangedActiveFormat:v18 forDevice:a4 formatMediaType:v17];
  }
  else if ((void *)AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext == a6)
  {
    memset(&v27, 0, sizeof(v27));
    memset(&v26, 0, sizeof(v26));
    [v13 getValue:&v27];
    [v11 getValue:&v26];
    unint64_t activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
    BOOL v20 = activeVideoStabilizationMode > 5;
    uint64_t v21 = (1 << activeVideoStabilizationMode) & 0x2C;
    if (!v20 && v21 != 0)
    {
      CMTime time1 = v27;
      CMTime time2 = v26;
      if (CMTimeCompare(&time1, &time2))
      {
        if ([(AVCaptureDevice *)self->_internal->sourceDevice isActiveVideoMinFrameDurationSet])
        {
          [(AVCaptureConnection *)self bumpChangeSeed];
        }
      }
    }
  }
  else if ((void *)AVCaptureConnectionLivePhotoEnabledChangedContext == a6)
  {
    if (([v13 isEqual:v11] & 1) == 0)
    {
      [(AVCaptureConnection *)self _updateSupportedVideoMirroringMethodsForMovieRecording];
    }
  }
  else if ((void *)AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext == a6)
  {
    if (([v13 isEqual:v11] & 1) == 0)
    {
      [(AVCaptureConnection *)self bumpChangeSeed];
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)AVCaptureConnection;
    [(AVCaptureConnection *)&v23 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (id)supportedVideoMirroringMethodsForMovieRecording
{
  v2 = self->_internal->supportedVideoMirroringMethodsForMovieRecording;

  return v2;
}

- (void)setEnabled:(BOOL)enabled
{
  internal = self->_internal;
  if (internal->enabled != enabled)
  {
    internal->BOOL enabled = enabled;
    [(AVCaptureConnection *)self bumpChangeSeed];
  }
}

- (void)bumpChangeSeed
{
  [(AVCaptureConnection *)self willChangeValueForKey:@"changeSeed"];
  ++self->_internal->changeSeed;

  [(AVCaptureConnection *)self didChangeValueForKey:@"changeSeed"];
}

- (void)setVideoRetainedBufferCountHint:(int)a3
{
  if ([(AVCaptureConnection *)self isVideoRetainedBufferCountHintSupported])
  {
    internal = self->_internal;
    if (internal->videoRetainedBufferCountHint != a3)
    {
      internal->videoRetainedBufferCountHint = a3;
      if ([(AVCaptureConnection *)self isLive])
      {
        int v6 = [(AVCaptureConnection *)self output];
        [(AVCaptureOutput *)v6 bumpChangeSeed];
      }
    }
  }
  else
  {
    int64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (int)videoRetainedBufferCountHint
{
  if ([(AVCaptureConnection *)self isVideoRetainedBufferCountHintSupported]) {
    return self->_internal->videoRetainedBufferCountHint;
  }
  int v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
  return 0;
}

- (BOOL)isVideoRetainedBufferCountHintSupported
{
  [(AVCaptureConnection *)self output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)cameraIntrinsicMatrixDeliveryEnabled
{
  BOOL v3 = cameraIntrinsicMatrixDeliveryEnabled;
  if (cameraIntrinsicMatrixDeliveryEnabled
    && ![(AVCaptureConnection *)self isCameraIntrinsicMatrixDeliverySupported])
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->cameraIntrinsicMatrixDeliveryEnabled != v3)
    {
      internal->cameraIntrinsicMatrixDeliveryEnabled = v3;
      if ([(AVCaptureConnection *)self isLive])
      {
        [(AVCaptureConnection *)self bumpChangeSeed];
      }
    }
  }
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  return self->_internal->cameraIntrinsicMatrixDeliverySupported;
}

- (void)setVideoOrientation:(AVCaptureVideoOrientation)videoOrientation
{
  if ([(AVCaptureConnection *)self isVideoOrientationSupported])
  {
    self->_internal->clientUsesVideoRotationAngleAPI = 0;
    [(AVCaptureConnection *)self sourcesFromFrontFacingCamera];
    [(AVCaptureConnection *)self sourcesFromExternalCamera];
    int v5 = FigCaptureCameraRequires180DegreesRotation();
    [(AVCaptureConnection *)self sourcesFromExternalCamera];
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      switch(videoOrientation)
      {
        case AVCaptureVideoOrientationPortrait:
          double v6 = 90.0;
          break;
        case AVCaptureVideoOrientationPortraitUpsideDown:
          double v6 = 270.0;
          break;
        case AVCaptureVideoOrientationLandscapeRight:
          double v6 = 180.0;
          if (!v5) {
            double v6 = 0.0;
          }
          break;
        case AVCaptureVideoOrientationLandscapeLeft:
          BOOL v8 = v5 == 0;
          double v6 = 180.0;
          double v9 = 0.0;
          goto LABEL_21;
        default:
          double v6 = 0.0;
          break;
      }
      goto LABEL_26;
    }
    if (videoOrientation == AVCaptureVideoOrientationLandscapeLeft)
    {
      if ([(AVCaptureConnection *)self sourcesFromFrontFacingCamera])
      {
        BOOL v8 = ![(AVCaptureConnection *)self sourcesFromExternalCamera];
        double v6 = 270.0;
        double v9 = 90.0;
LABEL_21:
        if (!v8) {
          double v6 = v9;
        }
        goto LABEL_26;
      }
      double v6 = 90.0;
    }
    else
    {
      if (videoOrientation != AVCaptureVideoOrientationLandscapeRight)
      {
        double v6 = 0.0;
        if (videoOrientation == AVCaptureVideoOrientationPortraitUpsideDown) {
          double v6 = 180.0;
        }
        goto LABEL_26;
      }
      if ([(AVCaptureConnection *)self sourcesFromFrontFacingCamera])
      {
        BOOL v8 = ![(AVCaptureConnection *)self sourcesFromExternalCamera];
        double v6 = 90.0;
        double v9 = 270.0;
        goto LABEL_21;
      }
      double v6 = 270.0;
    }
LABEL_26:
    [(AVCaptureConnection *)self _setVideoRotationAngle:v6];
    return;
  }
  int64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (BOOL)isVideoOrientationSupported
{
  return self->_internal->videoRotationSupported;
}

- (void)_setVideoRotationAngle:(double)a3
{
  if (-[AVCaptureConnection isVideoRotationAngleSupported:](self, "isVideoRotationAngleSupported:"))
  {
    internal = self->_internal;
    if (internal->videoRotationAngle != a3)
    {
      internal->double videoRotationAngle = a3;
      int64_t v6 = [(AVCaptureConnection *)self _videoOrientation];
      int64_t v7 = [(AVCaptureConnection *)self output];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        [(AVCaptureOutput *)v7 updateVideoSettingsForConnection:self];
        [(AVCaptureOutput *)v7 bumpChangeSeed];
      }
      else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
      {
        if (objc_opt_class(), (objc_opt_isKindOfClass())
          && ([(AVCaptureOutput *)v7 _recordingInProgress] & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __46__AVCaptureConnection__setVideoRotationAngle___block_invoke;
          v9[3] = &unk_1E5A73380;
          v9[4] = self;
          v9[5] = v6;
          [(AVCaptureOutput *)v7 performFigCaptureSessionOperationSafelyUsingBlock:v9];
        }
      }
    }
  }
  else
  {
    BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, *(void *)&a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (BOOL)isVideoRotationAngleSupported:(CGFloat)videoRotationAngle
{
  if (videoRotationAngle == 0.0) {
    return 1;
  }
  if (!self->_internal->videoRotationSupported) {
    return 0;
  }
  BOOL v4 = videoRotationAngle == 90.0;
  if (videoRotationAngle == 180.0) {
    BOOL v4 = 1;
  }
  return videoRotationAngle == 270.0 || v4;
}

- (void)setVideoMirroringMethodForMovieRecording:(int64_t)a3
{
  if (-[NSArray containsObject:](self->_internal->supportedVideoMirroringMethodsForMovieRecording, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:")))
  {
    internal = self->_internal;
    if (internal->videoMirroringMethodForMovieRecording != a3)
    {
      internal->uint64_t videoMirroringMethodForMovieRecording = a3;
      [(AVCaptureConnection *)self bumpChangeSeed];
    }
  }
  else
  {
    int64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [(AVCaptureConnection *)self inputPorts];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (!v5) {
          int v5 = (void *)[MEMORY[0x1E4F28E78] string];
        }
        double v9 = (void *)[v8 input];
        int v10 = (objc_class *)objc_opt_class();
        objc_msgSend(v5, "appendFormat:", @"(%@: %p"), NSStringFromClass(v10), v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 appendFormat:@" %@", objc_msgSend((id)objc_msgSend(v9, "device"), "localizedName")];
        }
        [v5 appendString:@""]);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }
  if ([(AVCaptureConnection *)self output])
  {
    BOOL v11 = (void *)MEMORY[0x1E4F28E78];
    [(AVCaptureConnection *)self output];
    uint64_t v12 = (objc_class *)objc_opt_class();
    float v13 = NSStringFromClass(v12);
    CMVideoDimensions v14 = [(AVCaptureConnection *)self output];
  }
  else
  {
    if (![(AVCaptureConnection *)self videoPreviewLayer])
    {
      uint64_t v16 = 0;
      goto LABEL_19;
    }
    BOOL v11 = NSString;
    [(AVCaptureConnection *)self videoPreviewLayer];
    uint64_t v15 = (objc_class *)objc_opt_class();
    float v13 = NSStringFromClass(v15);
    CMVideoDimensions v14 = [(AVCaptureConnection *)self videoPreviewLayer];
  }
  uint64_t v16 = [v11 stringWithFormat:@"%@: %p", v13, v14];
LABEL_19:
  uint64_t v17 = NSString;
  uint64_t v18 = (objc_class *)objc_opt_class();
  return (id)[v17 stringWithFormat:@"<%@: %p %@ -> (%@) [type:%@][enabled:%u][active:%u]>", NSStringFromClass(v18), self, v5, v16, -[AVCaptureConnection mediaType](self, "mediaType"), -[AVCaptureConnection isEnabled](self, "isEnabled"), -[AVCaptureConnection isActive](self, "isActive")];
}

- (void)teardownObservers
{
  internal = self->_internal;
  if (!internal->hasActiveObservers) {
    return;
  }
  internal->hasActiveObservers = 0;
  sourceDevice = self->_internal->sourceDevice;
  if (sourceDevice)
  {
    [(AVCaptureDevice *)sourceDevice removeObserver:self forKeyPath:@"activeFormat" context:AVCaptureConnectionDeviceActiveFormatChangedContext];
    [(AVCaptureDevice *)self->_internal->sourceDevice removeObserver:self forKeyPath:@"activeDepthDataFormat" context:AVCaptureConnectionDeviceActiveDepthDataFormatChangedContext];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  int v5 = self->_internal;
  if (!v5->videoInputPort || !v5->sourceDevice)
  {
    if (!v5->pointCloudDataInputPort) {
      return;
    }
    double v9 = v5->sourceDevice;
    if (!v9) {
      return;
    }
    uint64_t v7 = AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext;
    BOOL v8 = @"timeOfFlightProjectorMode";
    goto LABEL_13;
  }
  if (v5->hasVideoMinFrameDurationObserver)
  {
    v5->hasVideoMinFrameDurationObserver = 0;
    [(AVCaptureDevice *)self->_internal->sourceDevice removeObserver:self forKeyPath:@"activeVideoMinFrameDuration" context:AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext];
  }
  uint64_t v6 = [(AVCaptureConnection *)self output];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = AVCaptureConnectionLivePhotoEnabledChangedContext;
    BOOL v8 = @"livePhotoCaptureEnabled";
    double v9 = v6;
LABEL_13:
    [v9 removeObserver:self forKeyPath:v8 context:v7];
  }
}

- (NSArray)audioChannels
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->audioChannels];
  objc_sync_exit(internal);
  return v4;
}

- (void)updateAudioLevelsArray
{
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if (UpTimeNanoseconds > self->_internal->lastGetAudioLevelsTime + 10000000)
  {
    int64_t v4 = UpTimeNanoseconds;
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3052000000;
    BOOL v11 = __Block_byref_object_copy__2;
    uint64_t v12 = __Block_byref_object_dispose__2;
    uint64_t v13 = 0;
    uint64_t v5 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "sourceID");
    uint64_t v6 = [(AVCaptureConnection *)self output];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__AVCaptureConnection_updateAudioLevelsArray__block_invoke;
    v7[3] = &unk_1E5A72D48;
    v7[4] = v5;
    v7[5] = &v8;
    [(AVCaptureOutput *)v6 performFigCaptureSessionOperationSafelyUsingBlock:v7];

    self->_internal->audioChannelLevels = (NSArray *)v9[5];
    self->_internal->lastGetAudioLevelsTime = v4;
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __45__AVCaptureConnection_updateAudioLevelsArray__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v4 = *(void *)(*(void *)(result + 40) + 8);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 16);
    unsigned int result = VTable + 16;
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? v6 : 0;
    double v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
    if (v9)
    {
      uint64_t v10 = *MEMORY[0x1E4F514E0];
      uint64_t v11 = *MEMORY[0x1E4F1CF80];
      return v9(a2, v3, v10, v11, v4 + 40);
    }
  }
  return result;
}

- (float)getAvgAudioLevelForChannel:(id)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->audioChannels) {
    goto LABEL_6;
  }
  [(AVCaptureConnection *)self updateAudioLevelsArray];
  uint64_t v6 = self->_internal;
  if (!v6->audioChannelLevels) {
    goto LABEL_6;
  }
  unint64_t v7 = [(NSMutableArray *)v6->audioChannels indexOfObject:a3];
  if (v7 >= [(NSMutableArray *)self->_internal->audioChannels count])
  {
    FigDebugAssert3();
LABEL_6:
    float v9 = -120.0;
    goto LABEL_7;
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->audioChannelLevels, "objectAtIndexedSubscript:", 2 * v7), "floatValue");
  float v9 = v8;
LABEL_7:
  objc_sync_exit(internal);
  return v9;
}

- (float)getPeakAudioLevelForChannel:(id)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->audioChannels) {
    goto LABEL_6;
  }
  [(AVCaptureConnection *)self updateAudioLevelsArray];
  uint64_t v6 = self->_internal;
  if (!v6->audioChannelLevels) {
    goto LABEL_6;
  }
  unint64_t v7 = [(NSMutableArray *)v6->audioChannels indexOfObject:a3];
  if (v7 >= [(NSMutableArray *)self->_internal->audioChannels count])
  {
    FigDebugAssert3();
LABEL_6:
    float v9 = -120.0;
    goto LABEL_7;
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->audioChannelLevels, "objectAtIndexedSubscript:", (2 * v7) | 1), "floatValue");
  float v9 = v8;
LABEL_7:
  objc_sync_exit(internal);
  return v9;
}

uint64_t __40__AVCaptureConnection_setVideoMirrored___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 272);
    uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(result + 40)];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 16);
    unsigned int result = VTable + 16;
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? v6 : 0;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8);
    if (v9)
    {
      uint64_t v10 = *MEMORY[0x1E4F518E8];
      return v9(a2, v3, v10, v4);
    }
  }
  return result;
}

- (void)_setVideoMirrored:(BOOL)a3
{
  [(AVCaptureConnection *)self willChangeValueForKey:@"videoMirrored"];
  self->_internal->videoMirrored = a3;

  [(AVCaptureConnection *)self didChangeValueForKey:@"videoMirrored"];
}

- (CGFloat)videoRotationAngle
{
  return self->_internal->videoRotationAngle;
}

- (void)setVideoRotationAngle:(CGFloat)videoRotationAngle
{
  self->_internal->clientUsesVideoRotationAngleAPI = 1;
  [(AVCaptureConnection *)self _setVideoRotationAngle:videoRotationAngle];
}

uint64_t __46__AVCaptureConnection__setVideoRotationAngle___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 272);
    uint64_t v4 = [NSNumber numberWithInteger:*(void *)(result + 40)];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 16);
    unsigned int result = VTable + 16;
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? v6 : 0;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8);
    if (v9)
    {
      uint64_t v10 = *MEMORY[0x1E4F518F0];
      return v9(a2, v3, v10, v4);
    }
  }
  return result;
}

- (BOOL)isVideoMinFrameDurationSupported
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureDevice activeFormat.videoSupportedFrameRateRanges");
    }
  }
  return self->_internal->videoInputPort != 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMinFrameDuration
{
  uint64_t v4 = *(void *)&self->var1;
  if (*(void *)(v4 + 88))
  {
    if (*(unsigned char *)(v4 + 176))
    {
      long long v7 = *(_OWORD *)(v4 + 164);
      retstr->var3 = *(void *)(v4 + 180);
      *(_OWORD *)&retstr->var0 = v7;
    }
    else
    {
      self = *($3CC8671D27C23BF42ADDB32F2B5E48AE **)(v4 + 24);
      if (self)
      {
        return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self activeVideoMinFrameDuration];
      }
      else
      {
        retstr->var0 = 0;
        *(void *)&retstr->var1 = 0;
        retstr->var3 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v6 + 16);
  }
  return self;
}

- (CMTime)videoMinFrameDuration
{
  unsigned int result = (CMTime *)AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated");
  if (result)
  {
    long long v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    unsigned int result = (CMTime *)[v7 isEqualToString:@"YES"];
    if ((result & 1) == 0)
    {
      unsigned int result = (CMTime *)[v7 isEqualToString:@"yes"];
      if ((result & 1) == 0)
      {
        unsigned int result = (CMTime *)[v7 isEqualToString:@"1"];
        if ((result & 1) == 0)
        {
          uint64_t v8 = objc_opt_class();
          float v9 = NSStringFromSelector(a3);
          NSLog(&cfstr_Warning0xXIsDe.isa, v8, self, v9, @"AVCaptureDevice activeVideoMinFrameDuration");
        }
      }
    }
  }
  if (self)
  {
    return (CMTime *)[(AVCaptureConnection *)self _videoMinFrameDuration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (void)_setVideoMinFrameDuration:(id *)a3
{
  internal = self->_internal;
  if (internal->videoInputPort)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    *(void *)&internal->videoMinFrameDuration.flags = a3->var3;
    *(_OWORD *)(&internal->clientUsesVideoRotationAngleAPI + 4) = v6;
    if (a3->var2)
    {
      memset(&v18, 0, sizeof(v18));
      uint64_t v10 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      if (v10) {
        [(AVCaptureDeviceFormat *)v10 lowestSupportedVideoFrameDuration];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      CMTime time1 = (CMTime)*a3;
      CMTime time2 = v18;
      if (CMTimeCompare(&time1, &time2) < 0) {
        *(CMTime *)a3 = v18;
      }
      memset(&time1, 0, sizeof(time1));
      uint64_t v12 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      if (v12) {
        [(AVCaptureDeviceFormat *)v12 highestSupportedVideoFrameDuration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = (CMTime)*a3;
      CMTime v15 = time1;
      if (CMTimeCompare(&time2, &v15) < 1) {
        goto LABEL_20;
      }
      *(_OWORD *)&a3->var0 = *(_OWORD *)&time1.value;
      CMTimeEpoch epoch = time1.epoch;
    }
    else
    {
      long long v7 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      uint64_t v8 = objc_msgSend(-[AVCaptureOutput session](-[AVCaptureConnection output](self, "output"), "session"), "sessionPreset");
      if (v7) {
        [(AVCaptureDeviceFormat *)v7 defaultActiveMinFrameDurationForSessionPreset:v8];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      *(_OWORD *)&a3->var0 = *(_OWORD *)&v18.value;
      CMTimeEpoch epoch = v18.epoch;
    }
    a3->var3 = epoch;
LABEL_20:
    memset(&v18, 0, sizeof(v18));
    sourceDevice = self->_internal->sourceDevice;
    if (sourceDevice) {
      [(AVCaptureDevice *)sourceDevice activeVideoMinFrameDuration];
    }
    CMTime time1 = v18;
    CMTime time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      CMVideoDimensions v14 = self->_internal->sourceDevice;
      CMTime time1 = (CMTime)*a3;
      [(AVCaptureDevice *)v14 _setActiveVideoMinFrameDuration:&time1];
    }
    return;
  }
  float v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v9);
  }
  NSLog(&cfstr_SuppressingExc.isa, v9);
}

- (void)setVideoMinFrameDuration:(CMTime *)videoMinFrameDuration
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"))
  {
    long long v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureDevice setActiveVideoMinFrameDuration");
    }
  }
  long long v9 = *(_OWORD *)&videoMinFrameDuration->value;
  CMTimeEpoch epoch = videoMinFrameDuration->epoch;
  [(AVCaptureConnection *)self _setVideoMinFrameDuration:&v9];
}

- (BOOL)isVideoMaxFrameDurationSupported
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      long long v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureDevice activeFormat.videoSupportedFrameRateRanges");
    }
  }
  return self->_internal->videoInputPort != 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMaxFrameDuration
{
  uint64_t v4 = *(void *)&self->var1;
  if (*(void *)(v4 + 88))
  {
    if (*(unsigned char *)(v4 + 200))
    {
      long long v7 = *(_OWORD *)(v4 + 188);
      retstr->var3 = *(void *)(v4 + 204);
      *(_OWORD *)&retstr->var0 = v7;
    }
    else
    {
      self = *($3CC8671D27C23BF42ADDB32F2B5E48AE **)(v4 + 24);
      if (self)
      {
        return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self activeVideoMaxFrameDuration];
      }
      else
      {
        retstr->var0 = 0;
        *(void *)&retstr->var1 = 0;
        retstr->var3 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v6 + 16);
  }
  return self;
}

- (CMTime)videoMaxFrameDuration
{
  unsigned int result = (CMTime *)AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated");
  if (result)
  {
    long long v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    unsigned int result = (CMTime *)[v7 isEqualToString:@"YES"];
    if ((result & 1) == 0)
    {
      unsigned int result = (CMTime *)[v7 isEqualToString:@"yes"];
      if ((result & 1) == 0)
      {
        unsigned int result = (CMTime *)[v7 isEqualToString:@"1"];
        if ((result & 1) == 0)
        {
          uint64_t v8 = objc_opt_class();
          long long v9 = NSStringFromSelector(a3);
          NSLog(&cfstr_Warning0xXIsDe.isa, v8, self, v9, @"AVCaptureDevice activeVideoMaxFrameDuration");
        }
      }
    }
  }
  if (self)
  {
    return (CMTime *)[(AVCaptureConnection *)self _videoMaxFrameDuration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->CMTimeEpoch epoch = 0;
  }
  return result;
}

- (void)setVideoMaxFrameDuration:(CMTime *)videoMaxFrameDuration
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureDevice setActiveVideoMaxFrameDuration");
    }
  }
  internal = self->_internal;
  if (internal->videoInputPort)
  {
    long long v10 = *(_OWORD *)&videoMaxFrameDuration->value;
    *(void *)&internal->videoMaxFrameDuration.flags = videoMaxFrameDuration->epoch;
    *(_OWORD *)((char *)&internal->videoMinFrameDuration.epoch + 4) = v10;
    if (videoMaxFrameDuration->flags)
    {
      memset(&v22, 0, sizeof(v22));
      CMVideoDimensions v14 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      if (v14) {
        [(AVCaptureDeviceFormat *)v14 highestSupportedVideoFrameDuration];
      }
      else {
        memset(&v22, 0, sizeof(v22));
      }
      CMTime time1 = *videoMaxFrameDuration;
      CMTime time2 = v22;
      if (CMTimeCompare(&time1, &time2) >= 1) {
        *videoMaxFrameDuration = v22;
      }
      memset(&time1, 0, sizeof(time1));
      uint64_t v16 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      if (v16) {
        [(AVCaptureDeviceFormat *)v16 lowestSupportedVideoFrameDuration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = *videoMaxFrameDuration;
      CMTime v19 = time1;
      if ((CMTimeCompare(&time2, &v19) & 0x80000000) == 0) {
        goto LABEL_25;
      }
      *(_OWORD *)&videoMaxFrameDuration->value = *(_OWORD *)&time1.value;
      CMTimeEpoch epoch = time1.epoch;
    }
    else
    {
      uint64_t v11 = [(AVCaptureDevice *)self->_internal->sourceDevice activeFormat];
      uint64_t v12 = objc_msgSend(-[AVCaptureOutput session](-[AVCaptureConnection output](self, "output"), "session"), "sessionPreset");
      if (v11) {
        [(AVCaptureDeviceFormat *)v11 defaultActiveMaxFrameDurationForSessionPreset:v12];
      }
      else {
        memset(&v22, 0, sizeof(v22));
      }
      *(_OWORD *)&videoMaxFrameDuration->value = *(_OWORD *)&v22.value;
      CMTimeEpoch epoch = v22.epoch;
    }
    videoMaxFrameDuration->CMTimeEpoch epoch = epoch;
LABEL_25:
    memset(&v22, 0, sizeof(v22));
    sourceDevice = self->_internal->sourceDevice;
    if (sourceDevice) {
      [(AVCaptureDevice *)sourceDevice activeVideoMaxFrameDuration];
    }
    CMTime time1 = v22;
    CMTime time2 = *videoMaxFrameDuration;
    if (CMTimeCompare(&time1, &time2))
    {
      CMTime v18 = self->_internal->sourceDevice;
      CMTime time1 = *videoMaxFrameDuration;
      [(AVCaptureDevice *)v18 _setActiveVideoMaxFrameDuration:&time1];
    }
    return;
  }
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v13);
  }
  NSLog(&cfstr_SuppressingExc.isa, v13);
}

- (CGFloat)videoMaxScaleAndCropFactor
{
  return self->_internal->videoMaxScaleAndCropFactor;
}

- (void)setVideoScaleAndCropFactor:(CGFloat)videoScaleAndCropFactor
{
  if (videoScaleAndCropFactor >= 1.0)
  {
    [(AVCaptureConnection *)self videoMaxScaleAndCropFactor];
    if (v7 >= videoScaleAndCropFactor)
    {
      self->_internal->videoScaleAndCropFactor = videoScaleAndCropFactor;
      return;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v8 = (void *)[v5 exceptionWithName:v6 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
}

- (BOOL)isVideoStabilizationEnabled
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"-[AVCaptureConnnection activeVideoStabilizationMode]");
    }
  }
  return self->_internal->videoStabilizationEnabled;
}

- (BOOL)enablesVideoStabilizationWhenAvailable
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"-[AVCaptureConnnection preferredVideoStabilizationMode]");
    }
  }
  return self->_internal->preferredVideoStabilizationMode == 1;
}

- (void)setEnablesVideoStabilizationWhenAvailable:(BOOL)enablesVideoStabilizationWhenAvailable
{
  unsigned int v3 = enablesVideoStabilizationWhenAvailable;
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"-[AVCaptureConnnection setPreferredVideoStabilizationMode:]");
    }
  }
  if ([(AVCaptureConnection *)self isVideoStabilizationSupported])
  {
    internal = self->_internal;
    if (internal->preferredVideoStabilizationMode != v3)
    {
      internal->preferredVideoStabilizationMode = v3;
      BOOL v10 = [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_internal->sourceDevice activeFormat] isVideoStabilizationModeSupported:1];
      uint64_t v11 = self->_internal;
      BOOL v12 = v10 && v11->preferredVideoStabilizationMode == 1;
      if (v11->videoStabilizationEnabled != v12)
      {
        if ([(AVCaptureConnection *)self isLive]) {
          [(AVCaptureOutput *)[(AVCaptureConnection *)self output] bumpChangeSeed];
        }
        [(AVCaptureConnection *)self willChangeValueForKey:@"videoStabilizationEnabled"];
        self->_internal->videoStabilizationEnabled = v12;
        [(AVCaptureConnection *)self didChangeValueForKey:@"videoStabilizationEnabled"];
        [(AVCaptureConnection *)self willChangeValueForKey:@"activeVideoStabilizationMode"];
        self->_internal->unint64_t activeVideoStabilizationMode = v3;
        [(AVCaptureConnection *)self didChangeValueForKey:@"activeVideoStabilizationMode"];
        [(AVCaptureConnection *)self _updateCameraIntrinsicMatrixDeliverySupported];
      }
    }
  }
  else
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
  }
}

- (AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode
{
  return self->_internal->preferredVideoStabilizationMode;
}

- (AVCaptureVideoStabilizationMode)activeVideoStabilizationMode
{
  return self->_internal->activeVideoStabilizationMode;
}

- (BOOL)isCameraIntrinsicMatrixDeliveryEnabled
{
  return self->_internal->cameraIntrinsicMatrixDeliveryEnabled;
}

- (BOOL)isLivePhotoMetadataWritingSupported
{
  id v3 = [(AVCaptureConnection *)self mediaType];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F47C68]];
  if (v4)
  {
    [(AVCaptureConnection *)self output];
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();
  }
  return v4 & 1;
}

- (BOOL)livePhotoMetadataWritingEnabled
{
  return self->_internal->livePhotoMetadataWritingEnabled;
}

- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureConnection *)self isLivePhotoMetadataWritingSupported])
  {
    internal = self->_internal;
    if (internal->livePhotoMetadataWritingEnabled != v3)
    {
      internal->livePhotoMetadataWritingEnabled = v3;
      if ([(AVCaptureConnection *)self isLive])
      {
        uint64_t v6 = [(AVCaptureConnection *)self output];
        [(AVCaptureOutput *)v6 bumpChangeSeed];
      }
    }
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (BOOL)isDebugMetadataSidecarFileEnabled
{
  return self->_internal->debugMetadataSidecarFileEnabled;
}

- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3
{
  self->_internal->debugMetadataSidecarFileEnabled = a3;
}

- (int64_t)videoMirroringMethodForMovieRecording
{
  return self->_internal->videoMirroringMethodForMovieRecording;
}

- (BOOL)isVideoZoomSmoothingSupported
{
  return self->_internal->videoZoomSmoothingSupported;
}

- (void)setVideoZoomSmoothingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureConnection *)self isVideoZoomSmoothingSupported])
  {
    internal = self->_internal;
    if (internal->videoZoomSmoothingEnabled != v3)
    {
      internal->videoZoomSmoothingEnabled = v3;
      [(AVCaptureConnection *)self bumpChangeSeed];
    }
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  return self->_internal->videoGreenGhostMitigationSupported;
}

- (BOOL)isVideoGreenGhostMitigationEnabled
{
  return self->_internal->videoGreenGhostMitigationEnabled;
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureConnection *)self isVideoGreenGhostMitigationSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->videoGreenGhostMitigationEnabled != v3)
    {
      internal->videoGreenGhostMitigationEnabled = v3;
      [(AVCaptureConnection *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isVideoDeviceOrientationCorrectionSupported
{
  return self->_internal->videoDeviceOrientationCorrectionSupported;
}

- (void)setVideoDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureConnection *)self isVideoDeviceOrientationCorrectionSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->videoDeviceOrientationCorrectionEnabled != v3)
    {
      internal->videoDeviceOrientationCorrectionEnabled = v3;
      [(AVCaptureConnection *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isVideoFieldModeSupported
{
  return self->_supportsVideoFieldMode;
}

- (AVVideoFieldMode)videoFieldMode
{
  return self->_videoFieldMode;
}

- (void)setVideoFieldMode:(AVVideoFieldMode)videoFieldMode
{
  self->_videoFieldMode = videoFieldMode;
}

@end