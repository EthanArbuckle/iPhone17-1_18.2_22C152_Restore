@interface FigVideoCaptureConnectionConfiguration
+ (BOOL)cameraIntrinsicMatrixDeliveryEnabled:(id)a3 doingFaceTracking:(BOOL)a4;
+ (id)videoStabilizationMethods:(id)a3 includeIris:(BOOL)a4;
- ($2825F4736939C4A6D3AD43837233062D)nonRotatedOutputDimensions;
- (BOOL)attachMetadataToVideoBuffers;
- (BOOL)cameraIntrinsicMatrixDeliveryEnabled;
- (BOOL)coreMediaFaceTrackingEnabled;
- (BOOL)deviceOrientationCorrectionEnabled;
- (BOOL)irisSDOFEnabled;
- (BOOL)irisVISEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)livePhotoMetadataWritingEnabled;
- (BOOL)mirroringEnabled;
- (BOOL)physicalMirroringForMovieRecordingEnabled;
- (BOOL)portraitAutoSuggestEnabled;
- (BOOL)previewDepthDataDeliveryEnabled;
- (BOOL)previewDepthFilterRenderingEnabled;
- (BOOL)previewFilterRenderingEnabled;
- (BOOL)requiresScalingForInputTransForm:(FigCaptureVideoTransform)a3 nodeName:(id)a4;
- (BOOL)stereoVideoCaptureEnabled;
- (BOOL)videoGreenGhostMitigationEnabled;
- (BOOL)zoomSmoothingEnabled;
- (FigCaptureVideoTransform)depthDataTransform;
- (FigCaptureVideoTransform)depthDataTransformWithSourceDimensions;
- (FigCaptureVideoTransform)transform;
- (FigVideoCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)irisVISMethod;
- (int)orientation;
- (int)outputFormat;
- (int)outputHeight;
- (int)outputWidth;
- (int)retainedBufferCount;
- (int)videoStabilizationMethod;
- (int)videoStabilizationType;
- (uint64_t)_transformWithSourceDimensions:(int)a3 forceSourceDimensions:;
- (void)setAttachMetadataToVideoBuffers:(BOOL)a3;
- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)a3;
- (void)setCoreMediaFaceTrackingEnabled:(BOOL)a3;
- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3;
- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setOrientation:(int)a3;
- (void)setOutputFormat:(int)a3;
- (void)setOutputHeight:(int)a3;
- (void)setOutputWidth:(int)a3;
- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3;
- (void)setRetainedBufferCount:(int)a3;
- (void)setStereoVideoCaptureEnabled:(BOOL)a3;
- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3;
- (void)setVideoStabilizationMethod:(int)a3;
- (void)setVideoStabilizationType:(int)a3;
- (void)setZoomSmoothingEnabled:(BOOL)a3;
@end

@implementation FigVideoCaptureConnectionConfiguration

- (BOOL)portraitAutoSuggestEnabled
{
  BOOL v3 = [(FigCaptureVideoPreviewSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration] portraitAutoSuggestEnabled];
  if (v3)
  {
    v4 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] requiredFormat];
    LOBYTE(v3) = [(FigCaptureSourceVideoFormat *)v4 isPortraitAutoSuggestSupported];
  }
  return v3;
}

- (id)description
{
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  v4 = &stru_1EFA403E0;
  if (v3 != -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))]; {
  v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"VC %p: <%@>%@ -> <%@>", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration")];
  }
  [v5 appendFormat:@", %@/%dx%d", BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight")];
  if ([(FigVideoCaptureConnectionConfiguration *)self physicalMirroringForMovieRecordingEnabled])
  {
    v6 = @" PhysMM:1,";
  }
  else
  {
    v6 = &stru_1EFA403E0;
  }
  [v5 appendFormat:@", E:%d, VIS:%d, M:%d,%@ O:%@, DOC:%d, RBC:%d, CIM:%d", -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"), -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), v6, FigCaptureVideoOrientationToString(-[FigVideoCaptureConnectionConfiguration orientation](self, "orientation")), -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled"), -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"), -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled")];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  unsigned int v5 = -[FigCaptureConnectionConfiguration isEqual:](&v23, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    int v6 = [(FigVideoCaptureConnectionConfiguration *)self outputFormat];
    if (v6 != [a3 outputFormat]) {
      goto LABEL_18;
    }
    int v7 = [(FigVideoCaptureConnectionConfiguration *)self outputWidth];
    if (v7 != [a3 outputWidth]) {
      goto LABEL_18;
    }
    int v8 = [(FigVideoCaptureConnectionConfiguration *)self outputHeight];
    if (v8 != [a3 outputHeight]) {
      goto LABEL_18;
    }
    int v9 = [(FigVideoCaptureConnectionConfiguration *)self videoStabilizationMethod];
    if (v9 != [a3 videoStabilizationMethod]) {
      goto LABEL_18;
    }
    int v10 = [(FigVideoCaptureConnectionConfiguration *)self videoStabilizationType];
    if (v10 != [a3 videoStabilizationType]) {
      goto LABEL_18;
    }
    int v11 = [(FigVideoCaptureConnectionConfiguration *)self mirroringEnabled];
    if (v11 != [a3 mirroringEnabled]) {
      goto LABEL_18;
    }
    int v12 = [(FigVideoCaptureConnectionConfiguration *)self physicalMirroringForMovieRecordingEnabled];
    if (v12 != [a3 physicalMirroringForMovieRecordingEnabled]) {
      goto LABEL_18;
    }
    int v13 = [(FigVideoCaptureConnectionConfiguration *)self orientation];
    if (v13 != [a3 orientation]) {
      goto LABEL_18;
    }
    int v14 = [(FigVideoCaptureConnectionConfiguration *)self deviceOrientationCorrectionEnabled];
    if (v14 == [a3 deviceOrientationCorrectionEnabled]
      && (int v15 = [(FigVideoCaptureConnectionConfiguration *)self zoomSmoothingEnabled],
          v15 == [a3 zoomSmoothingEnabled])
      && (int v16 = -[FigVideoCaptureConnectionConfiguration videoGreenGhostMitigationEnabled](self, "videoGreenGhostMitigationEnabled"), v16 == [a3 videoGreenGhostMitigationEnabled])&& (v17 = -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"), v17 == objc_msgSend(a3, "retainedBufferCount"))&& (v18 = -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"), v18 == objc_msgSend(a3, "cameraIntrinsicMatrixDeliveryEnabled"))&& (v19 = -[FigVideoCaptureConnectionConfiguration livePhotoMetadataWritingEnabled](self, "livePhotoMetadataWritingEnabled"), v19 == objc_msgSend(a3, "livePhotoMetadataWritingEnabled"))&& (v20 = -[FigVideoCaptureConnectionConfiguration stereoVideoCaptureEnabled](self, "stereoVideoCaptureEnabled"), v20 == objc_msgSend(a3, "stereoVideoCaptureEnabled")))
    {
      BOOL v21 = [(FigVideoCaptureConnectionConfiguration *)self attachMetadataToVideoBuffers];
      LOBYTE(v5) = v21 ^ [a3 attachMetadataToVideoBuffers] ^ 1;
    }
    else
    {
LABEL_18:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)outputWidth
{
  return self->_outputFormat;
}

- (int)outputHeight
{
  return self->_outputWidth;
}

- (int)outputFormat
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (int)videoStabilizationMethod
{
  return self->_outputHeight;
}

- (int)videoStabilizationType
{
  return self->_videoStabilizationMethod;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  id v4 = [(FigCaptureConnectionConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOutputFormat:", -[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat"));
  objc_msgSend(v4, "setOutputWidth:", -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"));
  objc_msgSend(v4, "setOutputHeight:", -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  objc_msgSend(v4, "setVideoStabilizationMethod:", -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"));
  objc_msgSend(v4, "setVideoStabilizationType:", -[FigVideoCaptureConnectionConfiguration videoStabilizationType](self, "videoStabilizationType"));
  objc_msgSend(v4, "setMirroringEnabled:", -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  objc_msgSend(v4, "setPhysicalMirroringForMovieRecordingEnabled:", -[FigVideoCaptureConnectionConfiguration physicalMirroringForMovieRecordingEnabled](self, "physicalMirroringForMovieRecordingEnabled"));
  objc_msgSend(v4, "setOrientation:", -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation"));
  objc_msgSend(v4, "setDeviceOrientationCorrectionEnabled:", -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled"));
  objc_msgSend(v4, "setZoomSmoothingEnabled:", -[FigVideoCaptureConnectionConfiguration zoomSmoothingEnabled](self, "zoomSmoothingEnabled"));
  objc_msgSend(v4, "setVideoGreenGhostMitigationEnabled:", -[FigVideoCaptureConnectionConfiguration videoGreenGhostMitigationEnabled](self, "videoGreenGhostMitigationEnabled"));
  objc_msgSend(v4, "setRetainedBufferCount:", -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"));
  objc_msgSend(v4, "setCameraIntrinsicMatrixDeliveryEnabled:", -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"));
  objc_msgSend(v4, "setLivePhotoMetadataWritingEnabled:", -[FigVideoCaptureConnectionConfiguration livePhotoMetadataWritingEnabled](self, "livePhotoMetadataWritingEnabled"));
  objc_msgSend(v4, "setStereoVideoCaptureEnabled:", -[FigVideoCaptureConnectionConfiguration stereoVideoCaptureEnabled](self, "stereoVideoCaptureEnabled"));
  objc_msgSend(v4, "setAttachMetadataToVideoBuffers:", -[FigVideoCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  return v4;
}

- (int)retainedBufferCount
{
  return *(_DWORD *)&self->_deviceOrientationCorrectionEnabled;
}

- (BOOL)physicalMirroringForMovieRecordingEnabled
{
  return BYTE1(self->_videoStabilizationType);
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_orientation;
}

- (BOOL)cameraIntrinsicMatrixDeliveryEnabled
{
  return self->_retainedBufferCount;
}

- (BOOL)attachMetadataToVideoBuffers
{
  return HIBYTE(self->_retainedBufferCount);
}

- (BOOL)zoomSmoothingEnabled
{
  return BYTE1(self->_orientation);
}

- (BOOL)stereoVideoCaptureEnabled
{
  return BYTE2(self->_retainedBufferCount);
}

- (BOOL)videoGreenGhostMitigationEnabled
{
  return BYTE2(self->_orientation);
}

- (BOOL)livePhotoMetadataWritingEnabled
{
  return BYTE1(self->_retainedBufferCount);
}

- (void)setOutputWidth:(int)a3
{
  self->_outputFormat = a3;
}

- (void)setOutputHeight:(int)a3
{
  self->_outputWidth = a3;
}

- (void)setVideoStabilizationMethod:(int)a3
{
  self->_outputHeight = a3;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  LOBYTE(self->_videoStabilizationType) = a3;
}

- (void)setOutputFormat:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

- (void)setOrientation:(int)a3
{
  *(_DWORD *)&self->_mirroringEnabled = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
  *(_DWORD *)&self->_deviceOrientationCorrectionEnabled = a3;
}

- (void)setVideoStabilizationType:(int)a3
{
  self->_videoStabilizationMethod = a3;
}

- (void)setZoomSmoothingEnabled:(BOOL)a3
{
  BYTE1(self->_orientation) = a3;
}

- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3
{
  BYTE1(self->_videoStabilizationType) = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  LOBYTE(self->_orientation) = a3;
}

- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)a3
{
  LOBYTE(self->_retainedBufferCount) = a3;
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  BYTE2(self->_orientation) = a3;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  BYTE2(self->_retainedBufferCount) = a3;
}

- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3
{
  BYTE1(self->_retainedBufferCount) = a3;
}

- (void)setAttachMetadataToVideoBuffers:(BOOL)a3
{
  HIBYTE(self->_retainedBufferCount) = a3;
}

- (uint64_t)_transformWithSourceDimensions:(int)a3 forceSourceDimensions:
{
  if (a1)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration", 0), "sourcePosition");
    BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration"), "sourceDeviceType"));
    int v8 = [a1 mirroringEnabled];
    LOBYTE(v14) = v8;
    unsigned int v9 = [a1 outputWidth];
    unsigned int v10 = [a1 outputHeight];
    unint64_t v15 = __PAIR64__(v10, v9);
    int v11 = [a1 orientation];
    objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration"), "clientExpectsCameraMountedInLandscapeOrientation");
    int v12 = FigCaptureRotationDegreesFromOrientation(v11, v6 == 2, IsExtensionDeviceType, v8);
    HIDWORD(v14) = v12;
    if (v6 == 2
      && (FigCaptureCameraRequires180DegreesRotation(1, IsExtensionDeviceType) & 1) == 0
      && [a1 deviceOrientationCorrectionEnabled])
    {
      v12 -= 180;
      HIDWORD(v14) = v12;
    }
    if (a3 || !v9 || !v10)
    {
      unint64_t v15 = a2;
      FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v15, v12);
    }
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
  }
  return v14;
}

- (BOOL)mirroringEnabled
{
  return self->_videoStabilizationType;
}

- (int)orientation
{
  return *(_DWORD *)&self->_mirroringEnabled;
}

- (BOOL)irisVISEnabled
{
  BOOL v3 = [(FigCaptureIrisSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self irisSinkConfiguration] irisMovieCaptureEnabled];
  if (v3)
  {
    id v4 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] requiredFormat];
    LOBYTE(v3) = [(FigCaptureSourceVideoFormat *)v4 isIrisVideoStabilizationSupported];
  }
  return v3;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  id v3 = [(FigCaptureConnectionConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_int64(v3, "outputFormat", [(FigVideoCaptureConnectionConfiguration *)self outputFormat]);
  xpc_dictionary_set_int64(v3, "outputWidth", [(FigVideoCaptureConnectionConfiguration *)self outputWidth]);
  xpc_dictionary_set_int64(v3, "outputHeight", [(FigVideoCaptureConnectionConfiguration *)self outputHeight]);
  xpc_dictionary_set_int64(v3, "videoStabilizationMethod", [(FigVideoCaptureConnectionConfiguration *)self videoStabilizationMethod]);
  xpc_dictionary_set_BOOL(v3, "mirroringEnabled", [(FigVideoCaptureConnectionConfiguration *)self mirroringEnabled]);
  xpc_dictionary_set_BOOL(v3, "physicalMirroringForMovieRecordingEnabled", [(FigVideoCaptureConnectionConfiguration *)self physicalMirroringForMovieRecordingEnabled]);
  xpc_dictionary_set_int64(v3, "orientation", [(FigVideoCaptureConnectionConfiguration *)self orientation]);
  xpc_dictionary_set_BOOL(v3, "deviceOrientationCorrectionEnabled", [(FigVideoCaptureConnectionConfiguration *)self deviceOrientationCorrectionEnabled]);
  xpc_dictionary_set_BOOL(v3, "zoomSmoothingEnabled", [(FigVideoCaptureConnectionConfiguration *)self zoomSmoothingEnabled]);
  xpc_dictionary_set_BOOL(v3, "videoGreenGhostMitigationEnabled", [(FigVideoCaptureConnectionConfiguration *)self videoGreenGhostMitigationEnabled]);
  xpc_dictionary_set_int64(v3, "retainedBufferCount", [(FigVideoCaptureConnectionConfiguration *)self retainedBufferCount]);
  xpc_dictionary_set_BOOL(v3, "cameraIntrinsicMatrixDeliveryEnabled", [(FigVideoCaptureConnectionConfiguration *)self cameraIntrinsicMatrixDeliveryEnabled]);
  xpc_dictionary_set_BOOL(v3, "livePhotoMetadataWritingEnabled", [(FigVideoCaptureConnectionConfiguration *)self livePhotoMetadataWritingEnabled]);
  xpc_dictionary_set_BOOL(v3, "stereoVideoCaptureEnabled", [(FigVideoCaptureConnectionConfiguration *)self stereoVideoCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "attachMetadataToVideoBuffers", [(FigVideoCaptureConnectionConfiguration *)self attachMetadataToVideoBuffers]);
  return v3;
}

+ (id)videoStabilizationMethods:(id)a3 includeIris:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v12 = (void *)[v11 sinkConfiguration];
          if ([v12 sinkType] == 4
            || [v12 sinkType] == 6
            || [v12 sinkType] == 1)
          {
            uint64_t v13 = [v11 videoStabilizationMethod];
          }
          else
          {
            if (!v4 || ![v11 irisVISEnabled]) {
              goto LABEL_13;
            }
            uint64_t v13 = [v11 irisVISMethod];
          }
          if (v13) {
            objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v13));
          }
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v14 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v14;
    }
    while (v14);
  }
  return v6;
}

- (int)irisVISMethod
{
  int result = [(FigVideoCaptureConnectionConfiguration *)self irisVISEnabled];
  if (result)
  {
    [(FigCaptureSourceVideoFormat *)[(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] requiredFormat] cinematicStabilizationExtendedLookAheadDuration];
    if (v4 <= 0.0) {
      return 2;
    }
    else {
      return 3;
    }
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)nonRotatedOutputDimensions
{
  int outputWidth = self->_outputWidth;
  v10.var0 = self->_outputFormat;
  v10.var1 = outputWidth;
  BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType([(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType]);
  int v5 = *(_DWORD *)&self->_mirroringEnabled;
  BOOL v6 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourcePosition] == 2;
  int videoStabilizationType_low = LOBYTE(self->_videoStabilizationType);
  [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] clientExpectsCameraMountedInLandscapeOrientation];
  int v8 = FigCaptureRotationDegreesFromOrientation(v5, v6, videoStabilizationType_low, IsExtensionDeviceType);
  FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v10, v8);
  return v10;
}

- (FigCaptureVideoTransform)transform
{
  $2825F4736939C4A6D3AD43837233062D v3 = [(FigCaptureSourceFormat *)[(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] requiredFormat] dimensions];
  uint64_t v4 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, *(void *)&v3, 0);
  result.dimensions = v5;
  result.mirrored = v4;
  result.rotationDegrees = HIDWORD(v4);
  return result;
}

- (BOOL)previewDepthFilterRenderingEnabled
{
  if (![(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] depthDataDeliveryEnabled])
  {
LABEL_4:
    LODWORD(v4) = 0;
    goto LABEL_5;
  }
  $2825F4736939C4A6D3AD43837233062D v3 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] depthDataFormat];
  uint64_t v4 = v3;
  if (v3)
  {
    if (![(FigCaptureSourceFormat *)v3 dimensions])
    {
      LODWORD(v4) = (unint64_t)[(FigCaptureSourceFormat *)v4 dimensions] >> 32 == 0;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
LABEL_5:
  if (![(FigCaptureVideoPreviewSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration] depthDataDeliveryEnabled]&& !v4)
  {
    return 0;
  }
  BOOL v6 = [(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration];
  return [(FigCaptureVideoPreviewSinkConfiguration *)v6 filterRenderingEnabled];
}

- (BOOL)previewDepthDataDeliveryEnabled
{
  v2 = [(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration];
  return [(FigCaptureVideoPreviewSinkConfiguration *)v2 depthDataDeliveryEnabled];
}

+ (BOOL)cameraIntrinsicMatrixDeliveryEnabled:(id)a3 doingFaceTracking:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v20 = *MEMORY[0x1E4F1CF80];
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(a3);
        }
        $2825F4736939C4A6D3AD43837233062D v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        int v11 = (void *)[v10 sinkConfiguration];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 sinkType] == 6)
          {
            char v12 = [v10 cameraIntrinsicMatrixDeliveryEnabled];
            LOBYTE(v6) = 1;
            if ((v12 & 1) != 0 || a4) {
              return v6;
            }
          }
          if (objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "depthDataDeliveryEnabled"))
          {
            if (objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "sourceDeviceType") == 13) {
              goto LABEL_31;
            }
            int v13 = objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "sourceDeviceType");
            if (v13 == 12 || v13 == 6)
            {
              id v21 = 0;
              uint64_t v14 = objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "source");
              uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
              uint64_t v16 = v15 ? v15 : 0;
              long long v17 = *(void (**)(uint64_t, __CFString *, uint64_t, id *))(v16 + 48);
              if (v17) {
                v17(v14, @"AttributesDictionary", v20, &v21);
              }
              char v18 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"Focus"), "BOOLValue");

              if (v18)
              {
LABEL_31:
                LOBYTE(v6) = 1;
                return v6;
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v11 sinkType] == 8)
            {
              LODWORD(v21) = 0;
              if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v10))
              {
                if (!FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "source"), &v21))goto LABEL_31; {
              }
                }
              if (FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(v10)) {
                goto LABEL_31;
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_31;
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (void)setCoreMediaFaceTrackingEnabled:(BOOL)a3
{
  self->_cameraIntrinsicMatrixDeliveryEnabled = a3;
}

- (BOOL)irisSDOFEnabled
{
  return 0;
}

- (FigCaptureVideoTransform)depthDataTransform
{
  $2825F4736939C4A6D3AD43837233062D v3 = [(FigCaptureSourceFormat *)[(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] depthDataFormat] dimensions];
  uint64_t v4 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, *(void *)&v3, 0);
  result.dimensions = v5;
  result.mirrored = v4;
  result.rotationDegrees = HIDWORD(v4);
  return result;
}

- (BOOL)requiresScalingForInputTransForm:(FigCaptureVideoTransform)a3 nodeName:(id)a4
{
  $470D365275581EF16070F5A11344F73E dimensions = a3.dimensions;
  int rotationDegrees = a3.rotationDegrees;
  unint64_t v6 = [(FigVideoCaptureConnectionConfiguration *)self transform];
  int32x2_t v8 = v7;
  unint64_t v9 = HIDWORD(v6);
  $470D365275581EF16070F5A11344F73E v11 = dimensions;
  FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v11, rotationDegrees);
  int32x2_t v12 = v8;
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v12, v9);
  return v11 != *(void *)&v12;
}

- (BOOL)previewFilterRenderingEnabled
{
  if ([(FigCaptureVideoPreviewSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration] filterRenderingEnabled])
  {
    return 1;
  }
  uint64_t v4 = [(FigCaptureConnectionConfiguration *)self videoPreviewSinkConfiguration];
  return [(FigCaptureVideoPreviewSinkConfiguration *)v4 semanticStyleRenderingEnabled];
}

- (FigVideoCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigVideoCaptureConnectionConfiguration;
    uint64_t v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "outputFormat");
      v4->_outputFormat = xpc_dictionary_get_int64(a3, "outputWidth");
      v4->_int outputWidth = xpc_dictionary_get_int64(a3, "outputHeight");
      v4->_outputHeight = xpc_dictionary_get_int64(a3, "videoStabilizationMethod");
      LOBYTE(v4->_videoStabilizationType) = xpc_dictionary_get_BOOL(a3, "mirroringEnabled");
      BYTE1(v4->_videoStabilizationType) = xpc_dictionary_get_BOOL(a3, "physicalMirroringForMovieRecordingEnabled");
      *(_DWORD *)&v4->_mirroringEnabled = xpc_dictionary_get_int64(a3, "orientation");
      LOBYTE(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "deviceOrientationCorrectionEnabled");
      BYTE1(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "zoomSmoothingEnabled");
      BYTE2(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "videoGreenGhostMitigationEnabled");
      *(_DWORD *)&v4->_deviceOrientationCorrectionEnabled = xpc_dictionary_get_int64(a3, "retainedBufferCount");
      LOBYTE(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "cameraIntrinsicMatrixDeliveryEnabled");
      BYTE1(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "livePhotoMetadataWritingEnabled");
      BYTE2(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "stereoVideoCaptureEnabled");
      HIBYTE(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "attachMetadataToVideoBuffers");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)coreMediaFaceTrackingEnabled
{
  return self->_cameraIntrinsicMatrixDeliveryEnabled;
}

- (FigCaptureVideoTransform)depthDataTransformWithSourceDimensions
{
  $2825F4736939C4A6D3AD43837233062D v3 = [(FigCaptureSourceFormat *)[(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] depthDataFormat] dimensions];
  uint64_t v4 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, *(void *)&v3, 1);
  result.$470D365275581EF16070F5A11344F73E dimensions = v5;
  result.mirrored = v4;
  result.int rotationDegrees = HIDWORD(v4);
  return result;
}

@end