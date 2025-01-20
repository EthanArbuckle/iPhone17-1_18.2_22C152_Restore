@interface AVCaptureVideoDataOutput
+ (void)initialize;
- (AVCaptureVideoDataOutput)init;
- (BOOL)_updateVideoSettingsForConnection:(id)a3 connectionBeingAdded:(BOOL)a4;
- (BOOL)allLossyVideoCVPixelFormatTypesEnabled;
- (BOOL)alwaysDiscardsLateVideoFrames;
- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3;
- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3;
- (BOOL)automaticallyConfiguresOutputBufferDimensions;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)deliversPreviewSizedOutputBuffers;
- (BOOL)hasRequiredOutputFormatForConnection:(id)a3;
- (BOOL)isSceneStabilityMetadataEnabled;
- (BOOL)isSceneStabilityMetadataSupported;
- (BOOL)isVideoSettingsAspectRatioOverrideEnabled;
- (BOOL)isVideoSettingsAspectRatioOverrideSupported;
- (BOOL)isVideoSettingsDimensionsOverrideEnabled;
- (BOOL)updateVideoSettingsForConnection:(id)a3;
- (CGSize)outputSizeForSourceFormat:(id)a3;
- (CMTime)minFrameDuration;
- (NSArray)availableVideoCVPixelFormatTypes;
- (NSArray)availableVideoCodecTypes;
- (NSArray)availableVideoCodecTypesForAssetWriterWithOutputFileType:(AVFileType)outputFileType;
- (NSDictionary)recommendedVideoSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType;
- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType;
- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType outputFileURL:(NSURL *)outputFileURL;
- (NSDictionary)videoSettings;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (dispatch_queue_t)sampleBufferCallbackQueue;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)delegateOverride;
- (id)fullyPopulatedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4;
- (id)getTransformedDetectedObjectsInfoFromSampleBuffer:(opaqueCMSampleBuffer *)a3 connection:(id)a4;
- (id)outputScalingModeForSourceFormat:(id)a3;
- (id)requestedBufferAttachments;
- (id)sampleBufferDelegate;
- (id)supportedAssetWriterOutputFileTypes;
- (id)supportedVideoSettingsKeys;
- (id)vettedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4;
- (unsigned)requiredOutputFormatForConnection:(id)a3;
- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3;
- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_setMinFrameDuration:(id *)a3;
- (void)_updateAvailableVideoCVPixelFormatTypesForConnection:(id)a3;
- (void)_updateDeliversPreviewSizedOutputBuffersForConnection:(id)a3 sessionPreset:(id)a4;
- (void)_updateLocalQueue:(localQueueOpaque *)a3;
- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeConnection:(id)a3;
- (void)setAllLossyVideoCVPixelFormatTypesEnabled:(BOOL)a3;
- (void)setAlwaysDiscardsLateVideoFrames:(BOOL)alwaysDiscardsLateVideoFrames;
- (void)setAutomaticallyConfiguresOutputBufferDimensions:(BOOL)automaticallyConfiguresOutputBufferDimensions;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
- (void)setDeliversPreviewSizedOutputBuffers:(BOOL)deliversPreviewSizedOutputBuffers;
- (void)setMinFrameDuration:(CMTime *)minFrameDuration;
- (void)setRequestedBufferAttachments:(id)a3;
- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue;
- (void)setSceneStabilityMetadataEnabled:(BOOL)a3;
- (void)setVideoSettings:(NSDictionary *)videoSettings;
- (void)setVideoSettingsAspectRatioOverrideEnabled:(BOOL)a3;
- (void)setVideoSettingsDimensionsOverrideEnabled:(BOOL)a3;
@end

@implementation AVCaptureVideoDataOutput

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeDelegate];
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverride])
  {
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52820]);
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52828]);
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52420]);
  }
  id v6 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  if ([v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    if (CMSampleBufferGetImageBuffer(a3))
    {
      if (objc_opt_respondsToSelector())
      {
        memset(&v9, 0, sizeof(v9));
        CMSampleBufferGetPresentationTimeStamp(&v9, a3);
        frameCounter = self->_internal->frameCounter;
        CMTime v8 = v9;
        [(FigCaptureFrameCounter *)frameCounter incrementWithPTS:&v8];
        [v5 captureOutput:self didOutputSampleBuffer:a3 fromConnection:v6];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 captureOutput:self didDropSampleBuffer:a3 fromConnection:v6];
    }
  }
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  v7 = (void *)[a3 mediaType];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v8 = 2;
LABEL_5:
    CMTime v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (NSDictionary)videoSettings
{
  v2 = self->_internal->videoSettings;

  return v2;
}

- (id)requestedBufferAttachments
{
  return self->_internal->requestedBufferAttachments;
}

- (BOOL)isSceneStabilityMetadataEnabled
{
  return self->_internal->sceneStabilityMetadataEnabled;
}

- (BOOL)alwaysDiscardsLateVideoFrames
{
  return self->_internal->alwaysDiscardsLateVideoFrames;
}

- (unsigned)requiredOutputFormatForConnection:(id)a3
{
  if (-[AVCaptureVideoDataOutput hasRequiredOutputFormatForConnection:](self, "hasRequiredOutputFormatForConnection:"))
  {
    id v5 = [(NSDictionary *)self->_internal->clientVideoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    return [v5 intValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVCaptureVideoDataOutput;
    return [(AVCaptureOutput *)&v7 requiredOutputFormatForConnection:a3];
  }
}

- (BOOL)hasRequiredOutputFormatForConnection:(id)a3
{
  return [(NSArray *)[(AVCaptureOutput *)self connections] containsObject:a3]
      && [(NSDictionary *)self->_internal->clientVideoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  if ([(AVCaptureVideoDataOutput *)self deliversPreviewSizedOutputBuffers])
  {
    uint64_t v5 = [a3 previewDimensions];
    double v6 = (double)(int)v5;
    double v7 = (double)SHIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureVideoDataOutput;
    [(AVCaptureOutput *)&v8 outputSizeForSourceFormat:a3];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)deliversPreviewSizedOutputBuffers
{
  return self->_internal->deliversPreviewSizedOutputBuffers;
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 1;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = objc_msgSend(-[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject"), "sourceDevice");
  uint64_t v6 = [NSString stringWithFormat:@"%@ -> %@", objc_msgSend(v5, "localizedName"), self];
  self->_internal->frameCounter = (FigCaptureFrameCounter *)[objc_alloc(MEMORY[0x1E4F50F18]) initWithTitle:v6];
  [(FigCaptureFrameCounter *)self->_internal->frameCounter start];
  double v7 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v7 addListenerWithWeakReference:weakReference callback:vdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v7 addListenerWithWeakReference:weakReference callback:vdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureVideoDataOutput;
  [(AVCaptureOutput *)&v9 attachSafelyToFigCaptureSession:a3];
}

- (void)setAlwaysDiscardsLateVideoFrames:(BOOL)alwaysDiscardsLateVideoFrames
{
  internal = self->_internal;
  if (internal->alwaysDiscardsLateVideoFrames != alwaysDiscardsLateVideoFrames)
  {
    internal->alwaysDiscardsLateVideoFrames = alwaysDiscardsLateVideoFrames;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setVideoSettings:(NSDictionary *)videoSettings
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if ([(NSDictionary *)videoSettings count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSDictionary allKeys](videoSettings, "allKeys"));
    double v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", -[AVCaptureVideoDataOutput supportedVideoSettingsKeys](self, "supportedVideoSettingsKeys"));
    [v7 intersectSet:v6];
    unint64_t v8 = [v7 count];
    if (v8 < [v6 count])
    {
      objc_super v9 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v6];
      [v9 minusSet:v7];
      NSLog(&cfstr_Avcapturevideo.isa, [v9 allObjects]);
      v10 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v11 = (void *)[v7 allObjects];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v50 != v14) {
              objc_enumerationMutation(v11);
            }
            [(NSDictionary *)v10 setObject:[(NSDictionary *)videoSettings objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * i)] forKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v13);
      }
      videoSettings = v10;
    }
    id v16 = [(NSDictionary *)videoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    if (v16
      && ![(NSArray *)[(AVCaptureVideoDataOutput *)self availableVideoCVPixelFormatTypes] containsObject:v16])
    {
      v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_49;
    }
    id v17 = [(NSDictionary *)videoSettings objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
    if (v17
      && ![(NSArray *)[(AVCaptureVideoDataOutput *)self availableVideoCodecTypes] containsObject:v17])
    {
      v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_49;
    }
    uint64_t v18 = *MEMORY[0x1E4F24E10];
    unint64_t v19 = [(NSDictionary *)videoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    uint64_t v20 = *MEMORY[0x1E4F24D08];
    unint64_t v21 = [(NSDictionary *)videoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
    if (self->_internal->videoSettingsDimensionsOverrideEnabled && (v19 | v21) != 0)
    {
      v23 = (void *)v21;
      if (v19 && ([(id)v19 intValue] & 1) != 0)
      {
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        goto LABEL_49;
      }
      if (!v23) {
        goto LABEL_52;
      }
      if ([v23 intValue])
      {
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        goto LABEL_49;
      }
      if (!v19)
      {
LABEL_52:
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        goto LABEL_49;
      }
      internal = self->_internal;
      if (internal->deliversPreviewSizedOutputBuffers
        && (!objc_msgSend((id)v19, "isEqualToNumber:", -[NSDictionary objectForKeyedSubscript:](internal->videoSettings, "objectForKeyedSubscript:", v18))|| (objc_msgSend(v23, "isEqualToNumber:", -[NSDictionary objectForKeyedSubscript:](self->_internal->videoSettings, "objectForKeyedSubscript:", v20)) & 1) == 0))
      {
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        goto LABEL_49;
      }
      uint64_t v25 = objc_msgSend(-[AVCaptureConnection sourceDevice](v5, "sourceDevice"), "activeFormat");
      if (v25)
      {
        v48.receiver = self;
        v48.super_class = (Class)AVCaptureVideoDataOutput;
        [(AVCaptureOutput *)&v48 outputSizeForSourceFormat:v25];
        double v27 = v26;
        double v29 = v28;
        uint64_t v30 = [(AVCaptureConnection *)v5 _videoOrientation];
        [(AVCaptureConnection *)v5 sourcesFromExternalCamera];
        BOOL v31 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
        uint64_t v32 = -3;
        if (v31) {
          uint64_t v32 = -1;
        }
        unint64_t v33 = v32 + v30;
        if (v33 >= 2) {
          v34 = (void *)v19;
        }
        else {
          v34 = v23;
        }
        if (v33 >= 2) {
          unint64_t v19 = (unint64_t)v23;
        }
        [v34 floatValue];
        float v36 = v35;
        [(id)v19 floatValue];
        float v38 = v37;
        double v39 = v36;
        double v40 = v38;
        v41 = self->_internal;
        if (!v41->videoSettingsDimensionsOverrideEnabledByClient && (v27 < v39 || v29 < v40))
        {
          v42 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v43 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_49;
        }
        if (v41->videoSettingsAspectRatioOverrideEnabled)
        {
          if (!vdo_dimensionsHaveValidAspectRatio(v39, v40))
          {
            v42 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v43 = *MEMORY[0x1E4F1C3C8];
LABEL_49:
            v47 = (void *)[v42 exceptionWithName:v43 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
            if (AVCaptureShouldThrowForAPIViolations()) {
              objc_exception_throw(v47);
            }
            NSLog(&cfstr_SuppressingExc.isa, v47);
            return;
          }
        }
        else if (vabdd_f64(v27 / v29, v39 / v40) > 0.01)
        {
          v42 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v43 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_49;
        }
      }
    }
  }

  self->_internal->clientVideoSettings = (NSDictionary *)[(NSDictionary *)videoSettings copy];
  if (SettingsArePassthru(videoSettings)) {
    v44 = 0;
  }
  else {
    v44 = videoSettings;
  }
  v45 = [(AVCaptureVideoDataOutput *)self fullyPopulatedVideoSettingsForSettingsDictionary:v44 connection:v5];
  if (v45 != self->_internal->videoSettings)
  {
    v46 = v45;
    if ((-[NSDictionary isEqual:](v45, "isEqual:") & 1) == 0)
    {

      self->_internal->videoSettings = (NSDictionary *)[(NSDictionary *)v46 copy];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (id)fullyPopulatedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4
{
  id v7 = -[AVCaptureVideoDataOutput vettedVideoSettingsForSettingsDictionary:connection:](self, "vettedVideoSettingsForSettingsDictionary:connection:", 0);
  id v8 = [(AVCaptureVideoDataOutput *)self vettedVideoSettingsForSettingsDictionary:a3 connection:a4];
  objc_super v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
  [v9 addEntriesFromDictionary:v8];
  uint64_t v10 = *MEMORY[0x1E4F47D90];
  v11 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F47D90]];
  uint64_t v12 = *MEMORY[0x1E4F47D98];
  if ([v11 isEqual:*MEMORY[0x1E4F47D98]]
    && (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v10), "isEqual:", v12) & 1) == 0)
  {
    [v9 setObject:0 forKeyedSubscript:v10];
  }
  return v9;
}

- (id)vettedVideoSettingsForSettingsDictionary:(id)a3 connection:(id)a4
{
  id v7 = (void *)[a4 sourceDevice];
  id v8 = v7;
  if (a3)
  {
    if (self->_internal->deliversPreviewSizedOutputBuffers
      && (uint64_t v9 = *MEMORY[0x1E4F47D90], ![a3 objectForKeyedSubscript:*MEMORY[0x1E4F47D90]]))
    {
      uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
      [v10 setObject:*MEMORY[0x1E4F47D98] forKeyedSubscript:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v29 = *MEMORY[0x1E4F24D70];
    uint64_t v30 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
    if (v30 && ![(NSArray *)self->_internal->availableVideoCVPixelFormatTypes containsObject:v30])
    {
      if (!v10) {
        uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
      }
      BOOL v31 = (void *)[v8 activeFormat];
      if (v31) {
        id v32 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v31, "formatDescription")));
      }
      else {
        id v32 = [(NSArray *)self->_internal->availableVideoCVPixelFormatTypes firstObject];
      }
      [v10 setObject:v32 forKeyedSubscript:v29];
    }
    uint64_t v33 = *MEMORY[0x1E4F24E10];
    v34 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    uint64_t v35 = *MEMORY[0x1E4F24D08];
    uint64_t v36 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
    if (v34) {
      BOOL v37 = v36 == 0;
    }
    else {
      BOOL v37 = 1;
    }
    if (!v37)
    {
      float v38 = (void *)v36;
      uint64_t v39 = [v8 activeFormat];
      if (v39)
      {
        double v40 = (void *)v39;
        int64_t v62 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] _videoOrientation];
        [a4 sourcesFromExternalCamera];
        if (AVCapturePlatformMountsCamerasInLandscapeOrientation()) {
          uint64_t v41 = -1;
        }
        else {
          uint64_t v41 = -3;
        }
        CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v40 formatDescription]);
        double width = (double)Dimensions.width;
        double height = (double)Dimensions.height;
        [v34 floatValue];
        float v46 = v45;
        double v47 = v45;
        [v38 floatValue];
        double v49 = v48;
        int v50 = (v46 > v48) ^ (width <= height);
        if (v50) {
          double v51 = v47;
        }
        else {
          double v51 = v48;
        }
        if (v50) {
          double v52 = v48;
        }
        else {
          double v52 = v47;
        }
        if (self->_internal->videoSettingsAspectRatioOverrideEnabled) {
          BOOL HaveValidAspectRatio = vdo_dimensionsHaveValidAspectRatio(v51, v52);
        }
        else {
          BOOL HaveValidAspectRatio = vabdd_f64(width / height, v51 / v52) <= 0.01;
        }
        unint64_t v54 = v41 + v62;
        if (!HaveValidAspectRatio || v51 > width || v52 > height)
        {
          v63.receiver = self;
          v63.super_class = (Class)AVCaptureVideoDataOutput;
          [(AVCaptureOutput *)&v63 outputSizeForSourceFormat:v40];
          double v51 = v57;
          double v52 = v58;
        }
        if (v54 >= 2) {
          double v59 = v51;
        }
        else {
          double v59 = v52;
        }
        if (v54 >= 2) {
          double v51 = v52;
        }
        if (v59 != v47 || v51 != v49)
        {
          if (!v10) {
            uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v59), v33);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v51), v35);
        }
      }
    }
    if (v10) {
      id v61 = v10;
    }
    else {
      id v61 = a3;
    }
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DE8], "videoOutputSettingsWithVideoSettingsDictionary:", v61), "outputSettingsDictionary");
  }
  else
  {
    id result = (id)[v7 activeFormat];
    if (result)
    {
      id v12 = result;
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [(AVCaptureVideoDataOutput *)self outputSizeForSourceFormat:v12];
      double v15 = v14;
      double v17 = v16;
      uint64_t v18 = [a4 _videoOrientation];
      [a4 sourcesFromExternalCamera];
      BOOL v19 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
      uint64_t v20 = -3;
      if (v19) {
        uint64_t v20 = -1;
      }
      unint64_t v21 = v20 + v18;
      uint64_t v22 = *MEMORY[0x1E4F24D70];
      uint64_t MediaSubType = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->clientVideoSettings, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue");
      if (!MediaSubType) {
        uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v12, "formatDescription", MediaSubType));
      }
      objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", MediaSubType), v22);
      if (v21 >= 2) {
        double v24 = v15;
      }
      else {
        double v24 = v17;
      }
      if (v21 >= 2) {
        double v15 = v17;
      }
      uint64_t v25 = [NSNumber numberWithDouble:v24];
      [v13 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
      uint64_t v26 = [NSNumber numberWithDouble:v15];
      [v13 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
      id v27 = [(AVCaptureVideoDataOutput *)self outputScalingModeForSourceFormat:v12];
      if (v27) {
        [v13 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F47D90]];
      }
      double v28 = (void *)MEMORY[0x1E4F1C9E8];
      return (id)[v28 dictionaryWithDictionary:v13];
    }
  }
  return result;
}

- (id)supportedVideoSettingsKeys
{
  BOOL videoSettingsDimensionsOverrideEnabled = self->_internal->videoSettingsDimensionsOverrideEnabled;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = *MEMORY[0x1E4F24D70];
  if (videoSettingsDimensionsOverrideEnabled) {
    return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v4, *MEMORY[0x1E4F24E10], *MEMORY[0x1E4F24D08], 0);
  }

  return (id)[v3 setWithObject:v4];
}

- (id)outputScalingModeForSourceFormat:(id)a3
{
  id result = [(NSDictionary *)self->_internal->clientVideoSettings objectForKeyedSubscript:*MEMORY[0x1E4F47D90]];
  if (!result)
  {
    if ([(AVCaptureVideoDataOutput *)self deliversPreviewSizedOutputBuffers])
    {
      uint64_t v6 = (id *)MEMORY[0x1E4F47D98];
      return *v6;
    }
    id v7 = (void *)[a3 vtScalingMode];
    if ([v7 isEqualToString:*MEMORY[0x1E4F45468]])
    {
      uint64_t v6 = (id *)MEMORY[0x1E4F47DA8];
      return *v6;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F45458]]) {
      return (id)*MEMORY[0x1E4F47DA0];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (NSArray)availableVideoCVPixelFormatTypes
{
  v2 = self->_internal->availableVideoCVPixelFormatTypes;

  return v2;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  internal = self->_internal;
  if (internal->deprecatedMinFrameDuration.flags)
  {
    long long v12 = *(_OWORD *)&internal->deprecatedMinFrameDuration.value;
    int64_t epoch = internal->deprecatedMinFrameDuration.epoch;
    [a3 _setVideoMinFrameDuration:&v12];
    p_deprecatedMinFrameDuration = &self->_internal->deprecatedMinFrameDuration;
    if (a3)
    {
      [a3 _videoMinFrameDuration];
    }
    else
    {
      long long v12 = 0uLL;
      int64_t epoch = 0;
    }
    *(_OWORD *)&p_deprecatedMinFrameDuration->value = v12;
    p_deprecatedMinFrameDuration->int64_t epoch = epoch;
  }
  [a3 addObserver:self forKeyPath:@"videoMirrored" options:3 context:AVCaptureOutputVideoMirroredChangedContext_0];
  [a3 addObserver:self forKeyPath:@"videoOrientation" options:3 context:AVCaptureOutputVideoOrientationChangedContext_0];
  id v9 = [(AVCaptureOutput *)self session];
  [v9 addObserver:self forKeyPath:@"sessionPreset" options:3 context:AVCaptureOutputSessionPresetChangedContext];
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", a3, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  [(AVCaptureVideoDataOutput *)self _updateAvailableVideoCVPixelFormatTypesForConnection:a3];
  [(AVCaptureVideoDataOutput *)self _updateVideoSettingsForConnection:a3 connectionBeingAdded:1];
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureVideoDataOutput;
  return [(AVCaptureOutput *)&v11 addConnection:a3 error:a4];
}

- (BOOL)_updateVideoSettingsForConnection:(id)a3 connectionBeingAdded:(BOOL)a4
{
  if (a4) {
    goto LABEL_4;
  }
  if (!a3)
  {
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  BOOL v6 = [(NSArray *)[(AVCaptureOutput *)self connections] containsObject:a3];
  if (v6)
  {
LABEL_4:
    clientVideoSettings = self->_internal->clientVideoSettings;
    if (SettingsArePassthru(clientVideoSettings)) {
      id v8 = 0;
    }
    else {
      id v8 = clientVideoSettings;
    }
    id v9 = [(AVCaptureVideoDataOutput *)self fullyPopulatedVideoSettingsForSettingsDictionary:v8 connection:a3];
    if (v9 != self->_internal->videoSettings)
    {
      uint64_t v10 = v9;
      if ((-[NSDictionary isEqual:](v9, "isEqual:") & 1) == 0)
      {
        [(AVCaptureVideoDataOutput *)self willChangeValueForKey:@"videoSettings"];

        self->_internal->videoSettings = (NSDictionary *)[(NSDictionary *)v10 copy];
        [(AVCaptureVideoDataOutput *)self didChangeValueForKey:@"videoSettings"];
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    goto LABEL_9;
  }
  return v6;
}

- (BOOL)updateVideoSettingsForConnection:(id)a3
{
  return [(AVCaptureVideoDataOutput *)self _updateVideoSettingsForConnection:a3 connectionBeingAdded:0];
}

- (AVCaptureVideoDataOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoDataOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVideoDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
      [(AVCaptureVideoDataOutput *)v2 _updateAvailableVideoCVPixelFormatTypesForConnection:0];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_updateAvailableVideoCVPixelFormatTypesForConnection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v6 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
  if (!v6) {
    goto LABEL_4;
  }
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v6 formatDescription]);
  if (MediaSubType == 2016686642)
  {
    [v5 addObject:&unk_1EF4FA2C8];
LABEL_6:
    [v5 addObject:&unk_1EF4FA298];
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqual:", @"com.microsoft.seeingai"))objc_msgSend(v5, "addObject:", &unk_1EF4FA2B0); {
    goto LABEL_8;
    }
  }
  if (MediaSubType == 2016686640) {
    goto LABEL_6;
  }
LABEL_4:
  [v5 addObjectsFromArray:&unk_1EF4FA980];
LABEL_8:
  if (!FigCapturePlatformSupportsUniversalCompression()) {
    goto LABEL_31;
  }
  BOOL v19 = self;
  int v8 = FigCapturePlatformSupportsUniversalLossyCompression();
  id v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = v5;
  uint64_t v11 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v11) {
    goto LABEL_30;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      int v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) intValue];
      if (v15 <= 1111970368)
      {
        if (v15 == 875704422)
        {
          uint64_t v16 = 641230384;
          uint64_t v17 = 758670896;
          uint64_t v18 = &unk_1EF4FA9B0;
        }
        else
        {
          if (v15 != 875704438) {
            continue;
          }
          uint64_t v16 = 641234480;
          uint64_t v17 = 758674992;
          uint64_t v18 = &unk_1EF4FA998;
        }
      }
      else
      {
        switch(v15)
        {
          case 1111970369:
            uint64_t v17 = 759318337;
            uint64_t v16 = 641877825;
            uint64_t v18 = &unk_1EF4FA9C8;
            break;
          case 2016686640:
            uint64_t v16 = 645428784;
            uint64_t v17 = 762869296;
            uint64_t v18 = &unk_1EF4FA9E0;
            break;
          case 2016686642:
            uint64_t v16 = 645428786;
            uint64_t v17 = 762869298;
            uint64_t v18 = &unk_1EF4FA9F8;
            break;
          default:
            continue;
        }
      }
      objc_msgSend(v9, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16));
      if (v8)
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17));
        if (v19->_internal->allLossyVideoCVPixelFormatTypesEnabled) {
          [v9 addObjectsFromArray:v18];
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v12);
LABEL_30:
  objc_super v5 = v10;
  [v10 addObjectsFromArray:v9];
  self = v19;
LABEL_31:
  if (([v5 isEqual:self->_internal->availableVideoCVPixelFormatTypes] & 1) == 0)
  {
    [(AVCaptureVideoDataOutput *)self willChangeValueForKey:@"availableVideoCVPixelFormatTypes"];

    self->_internal->availableVideoCVPixelFormatTypes = (NSArray *)[v5 copy];
    [(AVCaptureVideoDataOutput *)self didChangeValueForKey:@"availableVideoCVPixelFormatTypes"];
  }
}

- (void)_updateDeliversPreviewSizedOutputBuffersForConnection:(id)a3 sessionPreset:(id)a4
{
  internal = self->_internal;
  if (internal->videoSettingsDimensionsOverrideEnabled)
  {
    uint64_t v8 = [(NSDictionary *)internal->clientVideoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    internal = self->_internal;
    if (v8)
    {
      if ([(NSDictionary *)internal->clientVideoSettings objectForKeyedSubscript:*MEMORY[0x1E4F24D08]])
      {
        BOOL deliversPreviewSizedOutputBuffers = 0;
        goto LABEL_12;
      }
      internal = self->_internal;
    }
  }
  if (internal->automaticallyConfiguresOutputBufferDimensions)
  {
    [(AVCaptureOutput *)self session];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat"), "AVCaptureSessionPresets"), "containsObject:", @"AVCaptureSessionPresetPhoto");
    }
    else {
      int v10 = [a4 isEqualToString:@"AVCaptureSessionPresetPhoto"];
    }
    BOOL deliversPreviewSizedOutputBuffers = v10;
  }
  else
  {
    BOOL deliversPreviewSizedOutputBuffers = internal->deliversPreviewSizedOutputBuffers;
  }
LABEL_12:
  if (self->_internal->deliversPreviewSizedOutputBuffers == deliversPreviewSizedOutputBuffers)
  {
    [(AVCaptureVideoDataOutput *)self updateVideoSettingsForConnection:a3];
  }
  else
  {
    [(AVCaptureVideoDataOutput *)self willChangeValueForKey:@"deliversPreviewSizedOutputBuffers"];
    self->_internal->BOOL deliversPreviewSizedOutputBuffers = deliversPreviewSizedOutputBuffers;
    [(AVCaptureVideoDataOutput *)self updateVideoSettingsForConnection:a3];
    [(AVCaptureVideoDataOutput *)self didChangeValueForKey:@"deliversPreviewSizedOutputBuffers"];
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureVideoDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureVideoDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  objc_super v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue
{
  dispatch_queue_t v4 = sampleBufferCallbackQueue;
  if (((sampleBufferCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    dispatch_queue_t v4 = 0;
  }
  [(AVCaptureVideoDataOutput *)self willChangeValueForKey:@"sampleBufferDelegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:sampleBufferDelegate clientCallbackQueue:v4 exceptionReason:&v8])
  {
    [(AVCaptureVideoDataOutput *)self didChangeValueForKey:@"sampleBufferDelegate"];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureVideoDataOutput *)self didChangeValueForKey:@"sampleBufferDelegate"];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

void __47__AVCaptureVideoDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  BOOL v6 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v7 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2 == -16665)
    {
      [*(id *)(v7[2] + 88) releaseRemoteQueueReceiver];
    }
    else if (!a2)
    {
      [v7 _handleRemoteQueueOperation:a3];
    }
  }
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureVideoDataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (void)setAllLossyVideoCVPixelFormatTypesEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->allLossyVideoCVPixelFormatTypesEnabled != a3)
  {
    internal->allLossyVideoCVPixelFormatTypesEnabled = a3;
    objc_super v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
    [(AVCaptureVideoDataOutput *)self _updateAvailableVideoCVPixelFormatTypesForConnection:v5];
  }
}

+ (void)initialize
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureOutputVideoMirroredChangedContext_0 != a6)
  {
    if ((void *)AVCaptureOutputVideoOrientationChangedContext_0 != a6)
    {
      if ((void *)AVCaptureOutputSessionPresetChangedContext == a6)
      {
        int v10 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
        uint64_t v11 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
        [(AVCaptureVideoDataOutput *)self _updateDeliversPreviewSizedOutputBuffersForConnection:v10 sessionPreset:v11];
      }
      return;
    }
    -[AVCaptureVideoDataOutput updateVideoSettingsForConnection:](self, "updateVideoSettingsForConnection:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68], a4, a5));
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "sourceDevice"), "activeFormat");

  [(AVCaptureOutput *)self updateMetadataTransformForSourceFormat:v8];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (id)sampleBufferDelegate
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (dispatch_queue_t)sampleBufferCallbackQueue
{
  return (dispatch_queue_t)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- (NSArray)availableVideoCodecTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isVideoSettingsDimensionsOverrideEnabled
{
  return self->_internal->videoSettingsDimensionsOverrideEnabled;
}

- (void)setVideoSettingsDimensionsOverrideEnabled:(BOOL)a3
{
  self->_internal->videoSettingsDimensionsOverrideEnabledByClient = a3;
  internal = self->_internal;
  if (internal->videoSettingsDimensionsOverrideEnabled != a3)
  {
    internal->BOOL videoSettingsDimensionsOverrideEnabled = a3;
    objc_super v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
    uint64_t v6 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset");
    [(AVCaptureVideoDataOutput *)self _updateDeliversPreviewSizedOutputBuffersForConnection:v5 sessionPreset:v6];
  }
}

- (BOOL)isVideoSettingsAspectRatioOverrideSupported
{
  return 1;
}

- (BOOL)isVideoSettingsAspectRatioOverrideEnabled
{
  return self->_internal->videoSettingsAspectRatioOverrideEnabled;
}

- (void)setVideoSettingsAspectRatioOverrideEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureVideoDataOutput *)self isVideoSettingsAspectRatioOverrideSupported])
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
    if (internal->videoSettingsAspectRatioOverrideEnabled != v3) {
      internal->videoSettingsAspectRatioOverrideEnabled = v3;
    }
  }
}

- (BOOL)isSceneStabilityMetadataSupported
{
  return 1;
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureVideoDataOutput *)self isSceneStabilityMetadataSupported])
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
    if (internal->sceneStabilityMetadataEnabled != v3)
    {
      internal->sceneStabilityMetadataEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)setRequestedBufferAttachments:(id)a3
{
  requestedBufferAttachments = self->_internal->requestedBufferAttachments;
  if (requestedBufferAttachments != a3)
  {

    self->_internal->requestedBufferAttachments = (NSArray *)[a3 copy];
  }
}

- (BOOL)allLossyVideoCVPixelFormatTypesEnabled
{
  return self->_internal->allLossyVideoCVPixelFormatTypesEnabled;
}

- (id)supportedAssetWriterOutputFileTypes
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F47C00];
  v4[0] = *MEMORY[0x1E4F47C08];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E4F47BD0];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
}

- (NSDictionary)recommendedVideoSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5 = [(AVCaptureVideoDataOutput *)self supportedAssetWriterOutputFileTypes];
  if (([v5 containsObject:outputFileType] & 1) == 0)
  {
    int v10 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, v5);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return 0;
  }
  id v6 = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  if (![v6 isLive]) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v6, "sourceDevice"), 0, 0, outputFileType, 0), "firstObject");
  uint64_t v8 = [(AVCaptureVideoDataOutput *)self videoSettings];

  return (NSDictionary *)[(AVCaptureOutput *)self recommendedOutputSettingsForConnection:v6 sourceSettings:v8 videoCodecType:v7 fileType:outputFileType isIris:0 outputFileURL:0];
}

- (NSArray)availableVideoCodecTypesForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5 = [(AVCaptureVideoDataOutput *)self supportedAssetWriterOutputFileTypes];
  if (([v5 containsObject:outputFileType] & 1) == 0)
  {
    int v10 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, v5);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  if (![v6 isLive]) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 sourceDevice];

  return (NSArray *)[v7 availableVideoCodecTypesForSourceDevice:v8 sourceFormat:0 outputDimensions:0 fileType:outputFileType videoCodecTypesAllowList:0];
}

- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType
{
  id v7 = [(AVCaptureVideoDataOutput *)self supportedAssetWriterOutputFileTypes];
  if (([v7 containsObject:outputFileType] & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v15 = v7;
LABEL_9:
    double v14 = objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector(), 0, v15);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  id v8 = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  if (![v8 isLive]) {
    return 0;
  }
  id v9 = objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v8, "sourceDevice"), 0, 0, outputFileType, 0);
  if (([v9 containsObject:videoCodecType] & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v15 = v9;
    goto LABEL_9;
  }
  int v10 = [(AVCaptureVideoDataOutput *)self videoSettings];

  return (NSDictionary *)[(AVCaptureOutput *)self recommendedOutputSettingsForConnection:v8 sourceSettings:v10 videoCodecType:videoCodecType fileType:outputFileType isIris:0 outputFileURL:0];
}

- (NSDictionary)recommendedVideoSettingsForVideoCodecType:(AVVideoCodecType)videoCodecType assetWriterOutputFileType:(AVFileType)outputFileType outputFileURL:(NSURL *)outputFileURL
{
  if ((objc_msgSend(-[AVCaptureVideoDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes"), "containsObject:", outputFileType) & 1) == 0)
  {
    double v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
LABEL_10:
    uint64_t v16 = (void *)[v14 exceptionWithName:v15 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v16);
    }
    NSLog(&cfstr_SuppressingExc.isa, v16);
    return 0;
  }
  id v9 = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  int v10 = v9;
  uint64_t v17 = 0;
  if (v9)
  {
    -[AVCaptureVideoDataOutput outputSizeForSourceFormat:](self, "outputSizeForSourceFormat:", objc_msgSend((id)objc_msgSend(v9, "sourceDevice"), "activeFormat"));
    if ((AVCaptureMovieFileURLIsValidForConnection(v10, v11, v12, (uint64_t)outputFileURL, &v17) & 1) == 0)
    {
      double v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_10;
    }
  }
  if ([v10 isLive])
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", objc_msgSend(v10, "sourceDevice"), 0, 0, outputFileType, 0), "containsObject:", videoCodecType))return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v10, -[AVCaptureVideoDataOutput videoSettings](self, "videoSettings"), videoCodecType, outputFileType, 0, outputFileURL); {
    double v14 = (void *)MEMORY[0x1E4F1CA00];
    }
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_10;
  }
  return 0;
}

- (CMTime)minFrameDuration
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVDOFrameRatePropertiesAreDeprecated"))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = NSStringFromSelector(a3);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureDevice activeVideoMinFrameDuration");
    }
  }
  internal = self->_internal;
  *(_OWORD *)&retstr->value = *(_OWORD *)&internal->deprecatedMinFrameDuration.value;
  retstr->int64_t epoch = internal->deprecatedMinFrameDuration.epoch;
  id result = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  if (result)
  {
    id result = (CMTime *)[(CMTime *)result _videoMinFrameDuration];
    *(_OWORD *)&retstr->value = v11;
    retstr->int64_t epoch = v12;
  }
  return result;
}

- (void)_setMinFrameDuration:(id *)a3
{
  id v5 = [(AVCaptureOutput *)self firstEnabledConnectionForMediaType:*MEMORY[0x1E4F47C68]];
  if (v5)
  {
    id v6 = v5;
    long long v10 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [v5 _setVideoMinFrameDuration:&v10];
    internal = self->_internal;
    [v6 _videoMinFrameDuration];
    *(_OWORD *)&internal->deprecatedMinFrameDuration.value = v10;
    internal->deprecatedMinFrameDuration.int64_t epoch = var3;
  }
  else
  {
    id v8 = self->_internal;
    int64_t v9 = a3->var3;
    *(_OWORD *)&v8->deprecatedMinFrameDuration.value = *(_OWORD *)&a3->var0;
    v8->deprecatedMinFrameDuration.int64_t epoch = v9;
  }
}

- (void)setMinFrameDuration:(CMTime *)minFrameDuration
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVDOFrameRatePropertiesAreDeprecated"))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureDevice setActiveVideoMinFrameDuration");
    }
  }
  long long v9 = *(_OWORD *)&minFrameDuration->value;
  CMTimeEpoch epoch = minFrameDuration->epoch;
  [(AVCaptureVideoDataOutput *)self _setMinFrameDuration:&v9];
}

- (BOOL)automaticallyConfiguresOutputBufferDimensions
{
  return self->_internal->automaticallyConfiguresOutputBufferDimensions;
}

- (void)setAutomaticallyConfiguresOutputBufferDimensions:(BOOL)automaticallyConfiguresOutputBufferDimensions
{
  internal = self->_internal;
  if (internal->automaticallyConfiguresOutputBufferDimensions != automaticallyConfiguresOutputBufferDimensions)
  {
    internal->automaticallyConfiguresOutputBufferCMVideoDimensions Dimensions = automaticallyConfiguresOutputBufferDimensions;
    id v5 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
    uint64_t v6 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset");
    [(AVCaptureVideoDataOutput *)self _updateDeliversPreviewSizedOutputBuffersForConnection:v5 sessionPreset:v6];
  }
}

- (void)setDeliversPreviewSizedOutputBuffers:(BOOL)deliversPreviewSizedOutputBuffers
{
  internal = self->_internal;
  if (internal->automaticallyConfiguresOutputBufferDimensions)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else if (internal->deliversPreviewSizedOutputBuffers != deliversPreviewSizedOutputBuffers)
  {
    internal->BOOL deliversPreviewSizedOutputBuffers = deliversPreviewSizedOutputBuffers;
    if ([(AVCaptureVideoDataOutput *)self updateVideoSettingsForConnection:[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]]])
    {
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C68];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)removeConnection:(id)a3
{
  [(AVCaptureVideoDataOutput *)self _updateAvailableVideoCVPixelFormatTypesForConnection:0];
  [a3 removeObserver:self forKeyPath:@"videoMirrored" context:AVCaptureOutputVideoMirroredChangedContext_0];
  [a3 removeObserver:self forKeyPath:@"videoOrientation" context:AVCaptureOutputVideoOrientationChangedContext_0];
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "removeObserver:forKeyPath:", self, @"sessionPreset");
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", 0, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVideoDataOutput;
  [(AVCaptureOutput *)&v5 removeConnection:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  [(FigCaptureFrameCounter *)self->_internal->frameCounter stop];

  self->_internal->frameCounter = 0;
  objc_super v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoDataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  uint64_t v7 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  [(AVCaptureVideoDataOutput *)self _updateAvailableVideoCVPixelFormatTypesForConnection:v7];
  -[AVCaptureVideoDataOutput _updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:](self, "_updateDeliversPreviewSizedOutputBuffersForConnection:sessionPreset:", v7, objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVideoDataOutput;
  [(AVCaptureOutput *)&v8 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  objc_super v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureVideoDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __46__AVCaptureVideoDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  dispatch_queue_t v4 = (void *)MEMORY[0x1A62348E0]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v5)
  {
    objc_super v6 = v5;
    long long v7 = *a2;
    int v8 = *((_DWORD *)a2 + 4);
    [v5 _handleLocalQueueMessage:&v7];
  }
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureVideoDataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (id)delegateOverride
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverride];
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverrideCallbackQueue];
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = a4;
  }
  uint64_t v9 = 0;
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:v7 exceptionReason:&v9])
  {
    int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (id)getTransformedDetectedObjectsInfoFromSampleBuffer:(opaqueCMSampleBuffer *)a3 connection:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      if ([(NSArray *)[(AVCaptureOutput *)self connections] containsObject:a4])
      {
        return (id)AVCaptureGetTransformedDetectedObjectsInfo(a3, (uint64_t)a4, self);
      }
      int v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      int v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    }
  }
  else
  {
    int v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  }
  long long v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
  return 0;
}

@end