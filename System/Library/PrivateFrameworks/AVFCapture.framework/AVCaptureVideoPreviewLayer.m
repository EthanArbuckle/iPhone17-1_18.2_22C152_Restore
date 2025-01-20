@interface AVCaptureVideoPreviewLayer
+ (AVCaptureVideoPreviewLayer)layerWithSession:(AVCaptureSession *)session;
+ (AVCaptureVideoPreviewLayer)layerWithSessionWithNoConnection:(AVCaptureSession *)session;
+ (void)initialize;
- (AVCaptureConnection)connection;
- (AVCaptureSession)session;
- (AVCaptureVideoOrientation)orientation;
- (AVCaptureVideoPreviewLayer)init;
- (AVCaptureVideoPreviewLayer)initWithLayer:(id)a3;
- (AVCaptureVideoPreviewLayer)initWithSession:(AVCaptureSession *)session;
- (AVCaptureVideoPreviewLayer)initWithSessionWithNoConnection:(AVCaptureSession *)session;
- (AVLayerVideoGravity)videoGravity;
- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject;
- (BOOL)_automaticallyAdjustsMirroring;
- (BOOL)_filtersAreOptimized:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_isMirrored;
- (BOOL)_setVideoPreviewFilters:(id)a3 checkForExceptionalInput:(BOOL)a4 exceptionReason:(id *)a5;
- (BOOL)_zoomPictureInPictureOverlaySupported;
- (BOOL)automaticallyAdjustsMirroring;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)isDepthDataDeliveryEnabled;
- (BOOL)isDepthDataDeliverySupported;
- (BOOL)isFilterRenderingEnabled;
- (BOOL)isMirrored;
- (BOOL)isMirroringSupported;
- (BOOL)isOrientationSupported;
- (BOOL)isPaused;
- (BOOL)isPortraitAutoSuggestEnabled;
- (BOOL)isPortraitAutoSuggestSupported;
- (BOOL)isPreviewing;
- (BOOL)isSemanticStyleRenderingEnabled;
- (BOOL)isSemanticStyleRenderingSupported;
- (BOOL)isUnoptimizedFilterRenderingEnabled;
- (BOOL)isZoomPictureInPictureOverlayEnabled;
- (BOOL)isZoomPictureInPictureOverlaySupported;
- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5;
- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)pointInLayer;
- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)captureDevicePointOfInterest;
- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInLayerCoordinates;
- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates;
- (CGRect)zoomPictureInPictureOverlayRect;
- (double)previewRotationDegrees;
- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4;
- (id)_input;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)semanticStyle;
- (id)sinkID;
- (id)videoPreviewFilters;
- (id)weakReference;
- (int)changeSeed;
- (int64_t)_orientation;
- (unsigned)imageQueueSlot;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_setPortraitLightingEffectStrengthFromDeviceInput;
- (void)_setSensorAndEstimatedPreviewSizes;
- (void)_setSimulatedApertureFromDeviceInput;
- (void)_updateCaptureDeviceTransform;
- (void)_updateDepthDataDeliverySupported;
- (void)_updatePortraitAutoSuggestSupported;
- (void)_updatePreviewTransforms;
- (void)_updateSemanticStyleRenderingSupported;
- (void)_updateZoomPIPOverlayRect:(CGRect)a3;
- (void)_updateZoomPictureInPictureOverlaySupported;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)bumpChangeSeed;
- (void)centerSublayer:(int64_t)a3;
- (void)dealloc;
- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)didUpdatePreviewFormatDescription:(opaqueCMFormatDescription *)a3;
- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3;
- (void)removeConnection:(id)a3;
- (void)setAutomaticallyAdjustsMirroring:(BOOL)automaticallyAdjustsMirroring;
- (void)setBounds:(CGRect)a3;
- (void)setCaptureDeviceTransformNeedsUpdate;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setFilterRenderingEnabled:(BOOL)a3;
- (void)setMirrored:(BOOL)mirrored;
- (void)setOrientation:(AVCaptureVideoOrientation)orientation;
- (void)setPortraitAutoSuggestEnabled:(BOOL)a3;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSession:(AVCaptureSession *)session;
- (void)setSessionWithNoConnection:(AVCaptureSession *)session;
- (void)setSinkID:(id)a3;
- (void)setUnoptimizedFilterRenderingEnabled:(BOOL)a3;
- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity;
- (void)setVideoPreviewFilters:(id)a3;
- (void)setZoomPictureInPictureOverlayEnabled:(BOOL)a3;
@end

@implementation AVCaptureVideoPreviewLayer

- (BOOL)isDepthDataDeliveryEnabled
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthDataDeliveryEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

- (AVCaptureSession)session
{
  v2 = self->_internal->session;

  return v2;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->visible = v3;
  objc_sync_exit(internal);
  if (v3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVCaptureVideoPreviewLayerDidBecomeVisibleNotification", self);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v6 layerDidBecomeVisible:v3];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  v7 = (void *)[a3 mediaType];
  if (([v7 isEqualToString:*MEMORY[0x1E4F47C68]] & 1) == 0)
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if (self->_internal->connection)
  {
    uint64_t v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (id)videoPreviewFilters
{
  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (void *)[(NSArray *)self->_internal->videoPreviewFilters copy];
  objc_sync_exit(internal);

  return v4;
}

- (BOOL)isZoomPictureInPictureOverlayEnabled
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->zoomPictureInPictureOverlayEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isPortraitAutoSuggestEnabled
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->portraitAutoSuggestEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isFilterRenderingEnabled
{
  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->filterRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    self->_internal->connection = (AVCaptureConnection *)a3;
    [a3 _setVideoOrientation:self->_internal->orientation];
    [a3 setAutomaticallyAdjustsVideoMirroring:self->_internal->automaticallyAdjustsMirroring];
    if (([a3 automaticallyAdjustsVideoMirroring] & 1) == 0) {
      [a3 setVideoMirrored:self->_internal->mirrored];
    }
    [(AVCaptureConnection *)self->_internal->connection addObserver:self forKeyPath:@"videoMirrored" options:3 context:AVCaptureVideoPreviewLayerVideoMirroredChangedContext];
    [(AVCaptureConnection *)self->_internal->connection addObserver:self forKeyPath:@"automaticallyAdjustsVideoMirroring" options:3 context:AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext];
    [(AVCaptureConnection *)self->_internal->connection addObserver:self forKeyPath:@"videoOrientation" options:3 context:AVCaptureVideoPreviewLayerVideoOrientationChangedContext];
    objc_super v6 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self->_internal->connection, "inputPorts"), "firstObject"), "input");
    [v6 addObserver:self forKeyPath:@"simulatedAperture" options:3 context:AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext];
    [v6 addObserver:self forKeyPath:@"portraitLightingEffectStrength" options:3 context:AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext];
    [(AVCaptureVideoPreviewLayer *)self _setSensorAndEstimatedPreviewSizes];
    [(AVCaptureVideoPreviewLayer *)self _updateDepthDataDeliverySupported];
    [(AVCaptureVideoPreviewLayer *)self _updateSemanticStyleRenderingSupported];
    [(AVCaptureVideoPreviewLayer *)self _updateZoomPictureInPictureOverlaySupported];
    [(AVCaptureVideoPreviewLayer *)self _updatePortraitAutoSuggestSupported];
  }
  return a3;
}

- (void)_updatePortraitAutoSuggestSupported
{
  int v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isPortraitAutoSuggestSupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  int portraitAutoSuggestSupported = v5->portraitAutoSuggestSupported;
  BOOL v7 = (v3 & 1) == 0 && v5->portraitAutoSuggestEnabled;
  objc_sync_exit(internal);
  if (portraitAutoSuggestSupported != v3) {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"portraitAutoSuggestSupported"];
  }
  if (v7) {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"portraitAutoSuggestEnabled"];
  }
  uint64_t v8 = self->_internal;
  objc_sync_enter(v8);
  self->_internal->int portraitAutoSuggestSupported = v3;
  if (v7)
  {
    self->_internal->portraitAutoSuggestEnabled = 0;
    objc_sync_exit(v8);
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"portraitAutoSuggestEnabled"];
  }
  else
  {
    objc_sync_exit(v8);
  }
  if (portraitAutoSuggestSupported != v3)
  {
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"portraitAutoSuggestSupported"];
  }
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  [(AVCaptureVideoPreviewLayer *)self _updateDepthDataDeliverySupported];
  [(AVCaptureVideoPreviewLayer *)self _updateSemanticStyleRenderingSupported];
  [(AVCaptureVideoPreviewLayer *)self _updateZoomPictureInPictureOverlaySupported];

  [(AVCaptureVideoPreviewLayer *)self _updatePortraitAutoSuggestSupported];
}

- (void)_updateZoomPictureInPictureOverlaySupported
{
  BOOL v3 = [(AVCaptureVideoPreviewLayer *)self _zoomPictureInPictureOverlaySupported];
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  if (v5->zoomPictureInPictureOverlaySupported != v3)
  {
    CGFloat x = v5->zoomPictureInPictureOverlayRect.origin.x;
    CGFloat y = v5->zoomPictureInPictureOverlayRect.origin.y;
    CGFloat width = v5->zoomPictureInPictureOverlayRect.size.width;
    CGFloat height = v5->zoomPictureInPictureOverlayRect.size.height;
    BOOL zoomPictureInPictureOverlayEnabled = v5->zoomPictureInPictureOverlayEnabled;
    if (v3)
    {
      BOOL v11 = 0;
      BOOL v12 = 0;
    }
    else
    {
      double v13 = *MEMORY[0x1E4F1DB28];
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v19.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v19.origin.CGFloat y = v14;
      v19.size.CGFloat width = v15;
      v19.size.CGFloat height = v16;
      BOOL v12 = !CGRectEqualToRect(v19, v5->zoomPictureInPictureOverlayRect);
      BOOL v11 = zoomPictureInPictureOverlayEnabled;
      CGFloat x = v13;
      CGFloat y = v14;
      CGFloat width = v15;
      CGFloat height = v16;
      LOBYTE(zoomPictureInPictureOverlayEnabled) = 0;
    }
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"zoomPictureInPictureOverlaySupported"];
    if (v11) {
      [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"zoomPictureInPictureOverlayEnabled"];
    }
    if (v12) {
      [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"zoomPictureInPictureOverlayRect"];
    }
    self->_internal->zoomPictureInPictureOverlaySupported = v3;
    v17 = self->_internal;
    v17->zoomPictureInPictureOverlayRect.origin.CGFloat x = x;
    v17->zoomPictureInPictureOverlayRect.origin.CGFloat y = y;
    v17->zoomPictureInPictureOverlayRect.size.CGFloat width = width;
    v17->zoomPictureInPictureOverlayRect.size.CGFloat height = height;
    self->_internal->BOOL zoomPictureInPictureOverlayEnabled = zoomPictureInPictureOverlayEnabled;
    if (v12) {
      [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"zoomPictureInPictureOverlayRect"];
    }
    if (v11) {
      [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"zoomPictureInPictureOverlayEnabled"];
    }
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"zoomPictureInPictureOverlaySupported"];
  }

  objc_sync_exit(internal);
}

- (BOOL)_zoomPictureInPictureOverlaySupported
{
  id v2 = [(AVCaptureConnection *)[(AVCaptureVideoPreviewLayer *)self connection] sourceDevice];
  BOOL v3 = (__CFString *)[v2 deviceType] == @"AVCaptureDeviceTypeBuiltInDualCamera"
    || (__CFString *)[v2 deviceType] == @"AVCaptureDeviceTypeBuiltInTripleCamera"
    || [v2 deviceType] == (void)@"AVCaptureDeviceTypeBuiltInTelephotoCamera";
  v4 = (void *)[v2 activeFormat];
  if (v4) {
    [v4 lowestSupportedVideoFrameDuration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTimeMake(&v6, 1, 60);
  return CMTimeCompare(&time1, &v6) >= 0 && v3;
}

- (void)_updateDepthDataDeliverySupported
{
  int v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isStreamingDisparitySupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  int depthDataDeliverySupported = v5->depthDataDeliverySupported;
  BOOL v7 = (v3 & 1) == 0 && v5->depthDataDeliveryEnabled;
  objc_sync_exit(internal);
  if (depthDataDeliverySupported != v3) {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"depthDataDeliverySupported"];
  }
  if (v7) {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"depthDataDeliveryEnabled"];
  }
  uint64_t v8 = self->_internal;
  objc_sync_enter(v8);
  self->_internal->int depthDataDeliverySupported = v3;
  if (v7)
  {
    self->_internal->depthDataDeliveryEnabled = 0;
    objc_sync_exit(v8);
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"depthDataDeliveryEnabled"];
  }
  else
  {
    objc_sync_exit(v8);
  }
  if (depthDataDeliverySupported != v3)
  {
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"depthDataDeliverySupported"];
  }
}

- (void)_updatePreviewTransforms
{
  connection = self->_internal->connection;
  [(AVCaptureVideoPreviewLayer *)self centerSublayer:[(AVCaptureConnection *)connection _videoOrientation]];
  gravitCGFloat y = self->_internal->gravity;
  uint64_t v5 = [(AVCaptureConnection *)connection _videoOrientation];
  BOOL v6 = [(AVCaptureConnection *)connection isVideoMirrored];
  BOOL v7 = [(AVCaptureConnection *)connection sourcesFromFrontFacingCamera];
  BOOL v8 = [(AVCaptureConnection *)connection sourcesFromExternalCamera];
  internal = self->_internal;
  double previewRotationDegrees = internal->previewRotationDegrees;
  [(AVCaptureVideoPreviewLayer *)self bounds];
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = self->_internal;
  double oddScreenWidth = v14->oddScreenWidth;
  double oddScreenScale = v14->oddScreenScale;
  double width = internal->previewSize.width;
  double height = internal->previewSize.height;
  CGRect v19 = (double *)MEMORY[0x1E4F39B10];
  long long v55 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 24);
  long long v56 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 8);
  long long v72 = v56;
  long long v73 = v55;
  long long v53 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v69 = v54;
  long long v70 = v53;
  long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v71 = v52;
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v51 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v67 = v50;
  long long v68 = v51;
  BOOL v20 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
  uint64_t v21 = -3;
  if (v20) {
    uint64_t v21 = -1;
  }
  unint64_t v22 = v21 + v5;
  if (v22 >= 2) {
    double v23 = width;
  }
  else {
    double v23 = height;
  }
  if (v22 >= 2) {
    double v24 = height;
  }
  else {
    double v24 = width;
  }
  if (oddScreenWidth != 0.0 && oddScreenScale != 0.0)
  {
    double v25 = v22 >= 2 ? v13 : v11;
    float v26 = oddScreenScale * v25;
    BOOL v29 = oddScreenWidth == v26;
    float v27 = height;
    float v28 = vabds_f32(v26, v27);
    BOOL v29 = v29 && v28 == 1.0;
    if (v29)
    {
      if (v22 >= 2) {
        double v23 = width;
      }
      else {
        double v23 = oddScreenWidth;
      }
      if (v22 >= 2) {
        double v24 = oddScreenWidth;
      }
      else {
        double v24 = width;
      }
    }
  }
  if (v23 != *MEMORY[0x1E4F1DB30] || v24 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if ([(NSString *)gravity isEqualToString:*MEMORY[0x1E4F47C28]])
    {
      double v31 = v11 / v23;
      double v32 = v13 / v24;
    }
    else
    {
      BOOL v35 = [(NSString *)gravity isEqualToString:*MEMORY[0x1E4F47C38]];
      double v36 = fmin(v11 / v23, v13 / v24);
      double v37 = fmax(v11 / v23, v13 / v24);
      if (v35) {
        double v31 = v37;
      }
      else {
        double v31 = v36;
      }
      if (v35) {
        double v32 = v37;
      }
      else {
        double v32 = v36;
      }
    }
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      switch(v5)
      {
        case 1:
          BOOL v38 = !v8;
          goto LABEL_47;
        case 2:
          BOOL v38 = !v8;
          goto LABEL_55;
        case 3:
          BOOL v38 = !v6;
          double v39 = 180.0;
          double v48 = 0.0;
          if (!v8 && v7) {
            goto LABEL_56;
          }
          if (!v6) {
            double v39 = 0.0;
          }
          goto LABEL_58;
        case 4:
          double v40 = previewRotationDegrees;
          long long v42 = v55;
          long long v41 = v56;
          long long v44 = v53;
          long long v43 = v54;
          long long v46 = v51;
          long long v45 = v52;
          long long v47 = v50;
          double v39 = 180.0;
          if (v8 || !v7)
          {
            if (v6) {
              double v39 = 0.0;
            }
          }
          else if (!v6)
          {
            double v39 = 0.0;
          }
          goto LABEL_59;
        default:
          double v39 = 0.0;
          goto LABEL_58;
      }
    }
    if (v5 == 4)
    {
      if (v7)
      {
LABEL_49:
        BOOL v38 = !v6;
LABEL_55:
        double v39 = 270.0;
        double v48 = 90.0;
        goto LABEL_56;
      }
    }
    else
    {
      if (v5 != 3)
      {
        double v39 = 0.0;
        double v40 = previewRotationDegrees;
        long long v42 = v55;
        long long v41 = v56;
        long long v44 = v53;
        long long v43 = v54;
        long long v46 = v51;
        long long v45 = v52;
        long long v47 = v50;
        if (v5 == 2) {
          double v39 = 180.0;
        }
        goto LABEL_59;
      }
      if (!v7) {
        goto LABEL_49;
      }
    }
    BOOL v38 = !v6;
LABEL_47:
    double v39 = 90.0;
    double v48 = 270.0;
LABEL_56:
    if (!v38) {
      double v39 = v48;
    }
LABEL_58:
    double v40 = previewRotationDegrees;
    long long v42 = v55;
    long long v41 = v56;
    long long v44 = v53;
    long long v43 = v54;
    long long v46 = v51;
    long long v45 = v52;
    long long v47 = v50;
LABEL_59:
    *(_OWORD *)&v74.m12 = v41;
    *(_OWORD *)&v74.m14 = v42;
    v74.CGFloat m11 = v31;
    v74.CGFloat m22 = v32;
    *(_OWORD *)&v74.m33 = v43;
    *(_OWORD *)&v74.m41 = v44;
    *(_OWORD *)&v74.m43 = v45;
    *(_OWORD *)&v74.m23 = v47;
    *(_OWORD *)&v74.m31 = v46;
    CATransform3DRotate(&v75, &v74, (v39 - v40) * 3.14159265 / 180.0, 0.0, 0.0, 1.0);
    long long v72 = *(_OWORD *)&v75.m12;
    long long v73 = *(_OWORD *)&v75.m14;
    CGFloat m11 = v75.m11;
    CGFloat m22 = v75.m22;
    long long v69 = *(_OWORD *)&v75.m33;
    long long v70 = *(_OWORD *)&v75.m41;
    long long v71 = *(_OWORD *)&v75.m43;
    long long v67 = *(_OWORD *)&v75.m23;
    long long v68 = *(_OWORD *)&v75.m31;
    goto LABEL_60;
  }
  CGFloat m11 = *v19;
  CGFloat m22 = v19[5];
LABEL_60:
  CGFloat v58 = m11;
  long long v59 = v72;
  sublayer = self->_internal->sublayer;
  long long v60 = v73;
  CGFloat v61 = m22;
  long long v64 = v69;
  long long v65 = v70;
  long long v66 = v71;
  long long v62 = v67;
  long long v63 = v68;
  -[CALayer setTransform:](sublayer, "setTransform:", &v58, v50, v51, v52, v53, v54, v55, v56);
  [(AVCaptureVideoPreviewLayer *)self _updateCaptureDeviceTransform];
}

- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  double v13 = [(AVCaptureVideoPreviewLayer *)self connection];
  [(AVCaptureVideoPreviewLayer *)self bounds];
  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v15;
  v27.size.CGFloat width = v16;
  v27.size.CGFloat height = v17;
  CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v27);
  int v18 = [(AVCaptureConnection *)v13 sourcesFromFrontFacingCamera];
  int v19 = [(AVCaptureConnection *)v13 sourcesFromExternalCamera];
  uint64_t v20 = [(AVCaptureConnection *)v13 _videoOrientation];
  p_rollAdjustment = (uint64_t *)&self->_internal->rollAdjustment;
  [(AVCaptureVideoPreviewLayer *)self bounds];
  return AVCaptureVideoTransformForCaptureDevice(a6, v18, v19, 1, v20, p_rollAdjustment, 1, self->_internal->gravity, (uint64_t)retstr, v10, v9, width, height, v22, v23, v24, v25, 1, [(AVCaptureConnection *)v13 isVideoMirrored]);
}

- (AVCaptureConnection)connection
{
  id v2 = self->_internal->connection;

  return v2;
}

- (void)_updateCaptureDeviceTransform
{
  internal = self->_internal;
  -[AVCaptureVideoPreviewLayer captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:](self, "captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:", internal->sensorToPreviewVTScalingMode, internal->sensorSize.width, internal->sensorSize.height, internal->previewSize.width, internal->previewSize.height);
  internal->captureDeviceTransform = v3;
}

- (void)centerSublayer:(int64_t)a3
{
  [(AVCaptureVideoPreviewLayer *)self bounds];
  double v8 = v7;
  double v10 = v9;
  if (v5 != *MEMORY[0x1E4F1DB30] || v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v12 = v5;
    double v13 = v6;
    [(CALayer *)self->_internal->sublayer position];
    double v15 = v14;
    double v17 = v16;
    double v18 = v8 + v12 * 0.5;
    double v19 = v10 + v13 * 0.5;
    internal = self->_internal;
    if (internal->oddScreenWidth != 0.0 && internal->oddScreenScale != 0.0)
    {
      [(AVCaptureConnection *)internal->connection sourcesFromExternalCamera];
      BOOL v21 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
      uint64_t v22 = -3;
      if (v21) {
        uint64_t v22 = -1;
      }
      unint64_t v23 = v22 + a3;
      internal = self->_internal;
      if (v23 >= 2) {
        double v24 = v13;
      }
      else {
        double v24 = v12;
      }
      double oddScreenScale = internal->oddScreenScale;
      float v26 = v24 * oddScreenScale;
      if (internal->oddScreenWidth == v26)
      {
        float height = internal->previewSize.height;
        if (vabds_f32(v26, height) == 1.0)
        {
          double v18 = (float)(int)(v18 * oddScreenScale + 0.5) / oddScreenScale;
          double v19 = (float)(int)(v19 * oddScreenScale + 0.5) / oddScreenScale;
        }
      }
    }
    if (v15 != v18 || v17 != v19)
    {
      sublayer = internal->sublayer;
      -[CALayer setPosition:](sublayer, "setPosition:", v18, v19);
    }
  }
}

uint64_t __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPortraitLightingEffectStrengthFromDeviceInput];
}

uint64_t __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSimulatedApertureFromDeviceInput];
}

- (AVCaptureVideoPreviewLayer)initWithSession:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)[(AVCaptureVideoPreviewLayer *)self _initWithSession:session makeConnection:1];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_internal->disableActions = [MEMORY[0x1E4F39CF8] disableActions];
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)setCaptureDeviceTransformNeedsUpdate
{
  internal = self->_internal;
  objc_sync_enter(internal);
  [(AVCaptureVideoPreviewLayer *)self _updateCaptureDeviceTransform];

  objc_sync_exit(internal);
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__AVCaptureVideoPreviewLayer_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E5A73288;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

- (void)layoutSublayers
{
  [MEMORY[0x1E4F39CF8] begin];
  if (self->_internal->disableActions)
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
  }
  else
  {
    CGAffineTransform v3 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds"];
    if (v3
      || (CGAffineTransform v3 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds.size"]) != 0
      || (CGAffineTransform v3 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds.origin"]) != 0)
    {
      v4 = (void *)MEMORY[0x1E4F39CF8];
      [v3 duration];
      objc_msgSend(v4, "setAnimationDuration:");
      objc_msgSend(MEMORY[0x1E4F39CF8], "setAnimationTimingFunction:", objc_msgSend(v3, "timingFunction"));
    }
  }
  internal = self->_internal;
  if (internal->previewSize.width != *MEMORY[0x1E4F1DB30]
    || internal->previewSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_sync_enter(self->_internal);
    [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
    objc_sync_exit(internal);
  }
  [MEMORY[0x1E4F39CF8] commit];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v7 layoutSublayers];
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqualToString:", -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F517E8]])
    {
      if (!self->_internal->isPreviewing)
      {
        [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"previewing"];
        self->_internal->isPreviewing = 1;
        [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"previewing"];
      }
      objc_super v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"AVCaptureVideoPreviewLayerDidStartRunningNotification" object:self];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F517F0]])
    {
      if (self->_internal->isPreviewing)
      {
        [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"previewing"];
        self->_internal->isPreviewing = 0;
        [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"previewing"];
      }
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F517F8]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516E0]];
      [(AVCaptureVideoPreviewLayer *)self didUpdatePreviewFormatDescription:v8];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518F8]])
    {
      double v9 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51590]];
      uint64_t v10 = [v9 intValue];
      uint64_t v11 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51580]];
      uint64_t v12 = v11;
      if (v9 && !v11) {
        uint64_t v12 = [MEMORY[0x1E4F39B58] objectForSlot:v10];
      }
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F515A0]), "floatValue");
      double v14 = v13;
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51598]), "floatValue");
      double v16 = v15;
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51588]), "floatValue");
      -[AVCaptureVideoPreviewLayer didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:](self, "didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:", v10, v12, v14, v16, v17);
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F51908]])
    {
      memset(&v18, 0, sizeof(v18));
      if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51A80]], &v18))
      {
        -[AVCaptureVideoPreviewLayer _updateZoomPIPOverlayRect:](self, "_updateZoomPIPOverlayRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size);
      }
    }
  }
}

- (id)sinkID
{
  id v2 = self->_internal->sinkID;

  return v2;
}

- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  objc_sync_enter(internal);
  if (dword_1EB4C91C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_internal->double previewRotationDegrees = a5;
  if (a4)
  {
    self->_internal->imageQueueSlot = a3;
    if (width != 0.0 && height != 0.0)
    {
      double v14 = self->_internal;
      double previewRotationDegrees = v14->previewRotationDegrees;
      if (previewRotationDegrees == 90.0 || previewRotationDegrees == 270.0)
      {
        v14->previewSize.double width = height;
        double v14 = self->_internal;
      }
      else
      {
        v14->previewSize.double width = width;
        double width = height;
      }
      v14->previewSize.double height = width;
    }
    objc_msgSend(MEMORY[0x1E4F39CF8], "begin", v16, v17);
    [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
    [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
    [(CALayer *)self->_internal->sublayer setContents:a4];
    [MEMORY[0x1E4F39CF8] commit];
  }
  objc_sync_exit(internal);
}

- (void)didUpdatePreviewFormatDescription:(opaqueCMFormatDescription *)a3
{
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  int32_t v5 = Dimensions;
  unint64_t v6 = HIDWORD(Dimensions);
  objc_super v7 = objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat");
  unint64_t v8 = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v7 formatDescription]);
  int32_t v9 = v8;
  unint64_t v10 = HIDWORD(v8);
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v12 = self->_internal;
  double previewRotationDegrees = v12->previewRotationDegrees;
  BOOL v14 = previewRotationDegrees == 90.0;
  if (previewRotationDegrees == 270.0) {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14;
  if (v14) {
    int v16 = v6;
  }
  else {
    int v16 = v5;
  }
  double v17 = (double)v16;
  if (v15) {
    int v18 = v6;
  }
  else {
    int v18 = v5;
  }
  v12->previewSize.double width = v17;
  self->_internal->previewSize.double height = (double)v18;
  self->_internal->sensorSize.double width = (double)v9;
  self->_internal->sensorSize.double height = (double)(int)v10;
  self->_internal->sensorToPreviewVTScalingMode = (NSString *)[v7 vtScalingMode];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
  [MEMORY[0x1E4F39CF8] commit];

  objc_sync_exit(internal);
}

- (void)_updateZoomPIPOverlayRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  if (!CGRectEqualToRect(v11, self->_internal->zoomPictureInPictureOverlayRect))
  {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"zoomPictureInPictureOverlayRect"];
    int32_t v9 = self->_internal;
    v9->zoomPictureInPictureOverlayRect.origin.CGFloat x = x;
    v9->zoomPictureInPictureOverlayRect.origin.CGFloat y = y;
    v9->zoomPictureInPictureOverlayRect.size.CGFloat width = width;
    v9->zoomPictureInPictureOverlayRect.size.CGFloat height = height;
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"zoomPictureInPictureOverlayRect"];
  }

  objc_sync_exit(internal);
}

- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4
{
  BOOL v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AVCaptureVideoPreviewLayer;
  unint64_t v6 = [(AVCaptureVideoPreviewLayer *)&v20 init];
  if (v6)
  {
    objc_super v7 = objc_alloc_init(AVCaptureVideoPreviewLayerInternal);
    v6->_internal = v7;
    if (v7)
    {
      if (AVCaptureSessionIsLaunchPrewarmingEnabled())
      {
        id v8 = [NSString alloc];
        int32_t v9 = (objc_class *)objc_opt_class();
        id v10 = (id)[v8 initWithFormat:@"<%@>", NSStringFromClass(v9)];
      }
      else
      {
        id v10 = AVIdentifierForObject((uint64_t)v6);
      }
      [(AVCaptureVideoPreviewLayer *)v6 setSinkID:v10];
      v6->_internal->figCaptureSessionSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("capture.videopreview.FigCaptureSessionSyncQueue", 0);
      v6->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v6];
      v6->_internal->orientation = 1;
      v6->_internal->automaticallyAdjustsMirroring = 1;
      internal = v6->_internal;
      uint64_t v12 = (long long *)MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&internal->captureDeviceTransform.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v13 = *v12;
      *(_OWORD *)&internal->captureDeviceTransform.c = v12[1];
      *(_OWORD *)&internal->captureDeviceTransform.a = v13;
      v6->_internal->double previewRotationDegrees = 0.0;
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
      [(AVCaptureVideoPreviewLayer *)v6 setMasksToBounds:1];
      [(AVCaptureVideoPreviewLayer *)v6 setVideoGravity:*MEMORY[0x1E4F47C30]];
      [(AVCaptureVideoPreviewLayer *)v6 setEdgeAntialiasingMask:0];
      [(AVCaptureVideoPreviewLayer *)v6 setInheritsTiming:0];
      v6->_internal->sublayer = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      [(CALayer *)v6->_internal->sublayer setAllowsDisplayCompositing:1];
      [(AVCaptureVideoPreviewLayer *)v6 addSublayer:v6->_internal->sublayer];
      [(CALayer *)v6->_internal->sublayer setEdgeAntialiasingMask:0];
      [(CALayer *)v6->_internal->sublayer setContentsGravity:*MEMORY[0x1E4F3A3C0]];
      [(AVCaptureVideoPreviewLayer *)v6 centerSublayer:1];
      CFDictionaryRef v14 = (const __CFDictionary *)MGCopyAnswer();
      if (v14)
      {
        CFDictionaryRef v15 = v14;
        uint64_t valuePtr = 0;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v14, @"main-screen-width");
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
          if ((valuePtr & 0x100000000) != 0) {
            v6->_internal->double oddScreenWidth = (double)SHIDWORD(valuePtr);
          }
        }
        if (v6->_internal->oddScreenWidth != 0.0)
        {
          CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v15, @"main-screen-scale");
          if (v17)
          {
            CFNumberGetValue(v17, kCFNumberFloatType, &valuePtr);
            v6->_internal->double oddScreenScale = *(float *)&valuePtr;
          }
        }
        CFRelease(v15);
      }
      v6->_internal->videoPreviewFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      [MEMORY[0x1E4F39CF8] commit];
      if (v4) {
        [(AVCaptureVideoPreviewLayer *)v6 setSession:a3];
      }
      else {
        [(AVCaptureVideoPreviewLayer *)v6 setSessionWithNoConnection:a3];
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  gravitCGFloat y = self->_internal->gravity;
  if ((videoGravity == 0) == (gravity != 0)
    || ![(NSString *)gravity isEqualToString:videoGravity])
  {
    unint64_t v6 = (NSString *)[(NSString *)videoGravity copyWithZone:0];

    self->_internal->gravitCGFloat y = v6;
    internal = self->_internal;
    if (internal->previewSize.width != *MEMORY[0x1E4F1DB30]
      || internal->previewSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [MEMORY[0x1E4F39CF8] begin];
      if (([MEMORY[0x1E4F39CF8] disableActions] & 1) == 0)
      {
        int32_t v9 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds"];
        if (v9
          || (int32_t v9 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds.size"]) != 0|| (int32_t v9 = (void *)[(AVCaptureVideoPreviewLayer *)self animationForKey:@"bounds.origin"]) != 0)
        {
          id v10 = (void *)MEMORY[0x1E4F39CF8];
          [v9 duration];
          objc_msgSend(v10, "setAnimationDuration:");
          objc_msgSend(MEMORY[0x1E4F39CF8], "setAnimationTimingFunction:", objc_msgSend(v9, "timingFunction"));
        }
      }
      CGRect v11 = self->_internal;
      objc_sync_enter(v11);
      [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
      objc_sync_exit(v11);
      uint64_t v12 = (void *)MEMORY[0x1E4F39CF8];
      [v12 commit];
    }
  }
}

- (void)setSinkID:(id)a3
{
  self->_internal->sinkID = (NSString *)[a3 copy];
}

- (void)setSession:(AVCaptureSession *)session
{
  if (self->_internal->session != session && (-[AVCaptureSession isEqual:](session, "isEqual:") & 1) == 0)
  {
    int32_t v5 = self->_internal->session;
    if (v5)
    {
      [(AVCaptureSession *)v5 _removeVideoPreviewLayer:self];

      self->_internal->session = 0;
    }
    if (session)
    {
      self->_internal->session = session;
      uint64_t v7 = 0;
      if (![(AVCaptureSession *)session _addVideoPreviewLayer:self exceptionReason:&v7])
      {
        unint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v6);
        }
        NSLog(&cfstr_SuppressingExc.isa, v6);
      }
    }
  }
}

- (id)weakReference
{
  return self->_internal->weakReference;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  int32_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517E8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517F0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517F8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F518F8] object:a3 flags:0];
  uint64_t v7 = *MEMORY[0x1E4F51908];

  [v5 addListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:v7 object:a3 flags:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 || (id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    objc_opt_class();
  }
}

uint64_t __80__AVCaptureVideoPreviewLayer_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 32));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureVideoPreviewLayerVideoMirroredChangedContext == a6)
  {
    int v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4), "BOOLValue");
    if (v11 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue"))
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      long long v13 = self->_internal;
      if (v13->previewSize.width != *MEMORY[0x1E4F1DB30]
        || v13->previewSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
        [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
        [MEMORY[0x1E4F39CF8] commit];
      }
      objc_sync_exit(internal);
      [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
    }
  }
  else if ((void *)AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext == a6)
  {
    int v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
    if ((objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue") & 1) == 0
      && v16)
    {
      [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"mirrored"];
      CFNumberRef v17 = self->_internal;
      objc_sync_enter(v17);
      int v18 = [a4 isVideoMirrored];
      BOOL v19 = [(AVCaptureConnection *)self->_internal->connection sourcesFromFrontFacingCamera];
      objc_sync_exit(v17);
      if (v18 != v19) {
        [a4 _setVideoMirrored:v19];
      }
      [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"mirrored"];
    }
  }
  else if ((void *)AVCaptureVideoPreviewLayerVideoOrientationChangedContext == a6)
  {
    int v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4), "intValue");
    if (v20 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "intValue"))
    {
      BOOL v21 = self->_internal;
      objc_sync_enter(v21);
      uint64_t v22 = self->_internal;
      if (v22->previewSize.width != *MEMORY[0x1E4F1DB30]
        || v22->previewSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
        [(AVCaptureVideoPreviewLayer *)self _updatePreviewTransforms];
        [MEMORY[0x1E4F39CF8] commit];
      }
      objc_sync_exit(v21);
    }
  }
  else
  {
    if ((void *)AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext == a6)
    {
      double v24 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
      if (objc_msgSend(v24, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]))) {
        return;
      }
      figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5A72ED0;
      block[4] = self;
      id v10 = block;
      goto LABEL_35;
    }
    if ((void *)AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext == a6)
    {
      id v8 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
      if ((objc_msgSend(v8, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0])) & 1) == 0)
      {
        figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v25[3] = &unk_1E5A72ED0;
        v25[4] = self;
        id v10 = v25;
LABEL_35:
        dispatch_sync(figCaptureSessionSyncQueue, v10);
      }
    }
  }
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

- (BOOL)isZoomPictureInPictureOverlaySupported
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->zoomPictureInPictureOverlaySupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isPortraitAutoSuggestSupported
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->portraitAutoSuggestSupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isDepthDataDeliverySupported
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthDataDeliverySupported;
  objc_sync_exit(internal);
  return (char)v2;
}

uint64_t __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 32);
  if (*(void *)(v1 + 32)) {
    __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke_cold_1();
  }
  CGAffineTransform v3 = *(const void **)(a1 + 40);
  *(void *)(v1 + 32) = v3;
  if (v3) {
    CFRetain(v3);
  }
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 attachSafelyToFigCaptureSession:v5];
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  unint64_t v6 = self->_internal;
  if (v3 && !v6->depthDataDeliverySupported)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (v6->depthDataDeliveryEnabled != v3)
  {
    v6->depthDataDeliveryEnabled = v3;
    objc_sync_exit(internal);
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
    return;
  }

  objc_sync_exit(internal);
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  unint64_t v6 = self->_internal;
  if (v3 && !v6->portraitAutoSuggestSupported)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (v6->portraitAutoSuggestEnabled != v3)
  {
    v6->portraitAutoSuggestEnabled = v3;
    objc_sync_exit(internal);
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
    return;
  }

  objc_sync_exit(internal);
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  unint64_t v6 = self->_internal;
  if (v6->filterRenderingEnabled == v3)
  {
    objc_sync_exit(internal);
  }
  else
  {
    v6->filterRenderingEnabled = v3;
    objc_sync_exit(internal);
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
  }
}

- (void)setZoomPictureInPictureOverlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  unint64_t v6 = self->_internal;
  if (v3 && !v6->zoomPictureInPictureOverlaySupported)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (v6->zoomPictureInPictureOverlayEnabled != v3)
  {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"zoomPictureInPictureOverlayEnabled"];
    self->_internal->BOOL zoomPictureInPictureOverlayEnabled = v3;
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"zoomPictureInPictureOverlayEnabled"];
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
  }

  objc_sync_exit(internal);
}

- (void)bumpChangeSeed
{
  [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"changeSeed"];
  atomic_fetch_add_explicit(&self->_internal->changeSeed, 1u, memory_order_relaxed);

  [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"changeSeed"];
}

- (void)_setSensorAndEstimatedPreviewSizes
{
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "formatDescription"));
  int v4 = Dimensions;
  unint64_t v5 = HIDWORD(Dimensions);
  if ((int)Dimensions >= 1 && SHIDWORD(Dimensions) >= 1)
  {
    double v7 = (double)(int)Dimensions;
    double v8 = (double)SHIDWORD(Dimensions);
    double v9 = AVCaptureMainScreenPixelSize();
    if (v9 >= v10) {
      double v11 = v10;
    }
    else {
      double v11 = v9;
    }
    if (v9 < v10) {
      double v9 = v10;
    }
    if (v4 * (int)v5 > (uint64_t)(v9 * v11))
    {
      if (v7 / v8 >= v9 / v11)
      {
        LODWORD(v5) = ((int)(((int)v9 & 0xFFFFFFFE) * v5) / v4) & 0xFFFFFFFE;
        int v4 = (int)v9 & 0xFFFFFFFE;
      }
      else
      {
        int v4 = ((int)(((int)v11 & 0xFFFFFFFE) * v4) / (int)v5) & 0xFFFFFFFE;
        LODWORD(v5) = (int)v11 & 0xFFFFFFFE;
      }
    }
    internal = self->_internal;
    objc_sync_enter(internal);
    long long v13 = self->_internal;
    v13->sensorSize.CGFloat width = v7;
    v13->sensorSize.CGFloat height = v8;
    CFDictionaryRef v14 = self->_internal;
    v14->previewSize.CGFloat width = (double)v4;
    v14->previewSize.CGFloat height = (double)(int)v5;
    [(AVCaptureVideoPreviewLayer *)self _updateCaptureDeviceTransform];
    objc_sync_exit(internal);
  }
}

- (void)_setSimulatedApertureFromDeviceInput
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    int v4 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](internal->connection, "inputPorts"), "firstObject"), "input");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      figCaptureSession = self->_internal->figCaptureSession;
      id v6 = [(AVCaptureVideoPreviewLayer *)self sinkID];
      double v7 = NSNumber;
      [v4 simulatedAperture];
      uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v10 = v9 ? v9 : 0;
      double v11 = *(void (**)(OpaqueFigCaptureSession *, id, uint64_t, uint64_t))(v10 + 8);
      if (v11)
      {
        uint64_t v12 = *MEMORY[0x1E4F51858];
        v11(figCaptureSession, v6, v12, v8);
      }
    }
  }
}

- (void)_setPortraitLightingEffectStrengthFromDeviceInput
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    int v4 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](internal->connection, "inputPorts"), "firstObject"), "input");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      figCaptureSession = self->_internal->figCaptureSession;
      id v6 = [(AVCaptureVideoPreviewLayer *)self sinkID];
      double v7 = NSNumber;
      [v4 portraitLightingEffectStrength];
      uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v10 = v9 ? v9 : 0;
      double v11 = *(void (**)(OpaqueFigCaptureSession *, id, uint64_t, uint64_t))(v10 + 8);
      if (v11)
      {
        uint64_t v12 = *MEMORY[0x1E4F51838];
        v11(figCaptureSession, v6, v12, v8);
      }
    }
  }
}

+ (AVCaptureVideoPreviewLayer)layerWithSession:(AVCaptureSession *)session
{
  BOOL v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSession:session];

  return (AVCaptureVideoPreviewLayer *)v3;
}

+ (AVCaptureVideoPreviewLayer)layerWithSessionWithNoConnection:(AVCaptureSession *)session
{
  BOOL v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSessionWithNoConnection:session];

  return (AVCaptureVideoPreviewLayer *)v3;
}

- (AVCaptureVideoPreviewLayer)init
{
  return [(AVCaptureVideoPreviewLayer *)self initWithSession:0];
}

- (AVCaptureVideoPreviewLayer)initWithSessionWithNoConnection:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)[(AVCaptureVideoPreviewLayer *)self _initWithSession:session makeConnection:0];
}

- (double)previewRotationDegrees
{
  internal = self->_internal;
  objc_sync_enter(internal);
  double previewRotationDegrees = self->_internal->previewRotationDegrees;
  objc_sync_exit(internal);
  return previewRotationDegrees;
}

- (AVCaptureVideoPreviewLayer)initWithLayer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v16.receiver = self;
  v16.super_class = (Class)AVCaptureVideoPreviewLayer;
  self = [(AVCaptureVideoPreviewLayer *)&v16 initWithLayer:a3];
  if (!self) {
    return self;
  }
  unint64_t v5 = objc_alloc_init(AVCaptureVideoPreviewLayerInternal);
  self->_internal = v5;
  if (!v5)
  {
LABEL_6:

    return 0;
  }
  if (AVCaptureSessionIsLaunchPrewarmingEnabled())
  {
    id v6 = [NSString alloc];
    double v7 = (objc_class *)objc_opt_class();
    id v8 = (id)[v6 initWithFormat:@"<%@>", NSStringFromClass(v7)];
  }
  else
  {
    id v8 = AVIdentifierForObject((uint64_t)self);
  }
  [(AVCaptureVideoPreviewLayer *)self setSinkID:v8];
  self->_internal->isPresentationLayer = 1;
  self->_internal->gravitCGFloat y = (NSString *)(id)[a3 videoGravity];
  self->_internal->session = (AVCaptureSession *)(id)[a3 session];
  self->_internal->connection = (AVCaptureConnection *)(id)[a3 connection];
  if (!self->_internal->connection)
  {
    self->_internal->orientation = [a3 _orientation];
    self->_internal->automaticallyAdjustsMirroring = [a3 _automaticallyAdjustsMirroring];
    self->_internal->mirrored = [a3 _isMirrored];
  }
  [a3 previewRotationDegrees];
  self->_internal->double previewRotationDegrees = v9;
  self->_internal->int depthDataDeliverySupported = [a3 isDepthDataDeliverySupported];
  self->_internal->depthDataDeliveryEnabled = [a3 isDepthDataDeliveryEnabled];
  self->_internal->filterRenderingEnabled = [a3 isFilterRenderingEnabled];
  self->_internal->unoptimizedFilterRenderingEnabled = [a3 isUnoptimizedFilterRenderingEnabled];
  self->_internal->videoPreviewFilters = (NSArray *)(id)[a3 videoPreviewFilters];
  self->_internal->semanticStyleRenderingSupported = [a3 isSemanticStyleRenderingSupported];
  self->_internal->semanticStyleRenderingEnabled = [a3 isSemanticStyleRenderingEnabled];
  self->_internal->semanticStyle = (AVSemanticStyle *)(id)[a3 semanticStyle];
  self->_internal->zoomPictureInPictureOverlaySupported = [a3 isZoomPictureInPictureOverlaySupported];
  self->_internal->BOOL zoomPictureInPictureOverlayEnabled = [a3 isZoomPictureInPictureOverlayEnabled];
  internal = self->_internal;
  [a3 zoomPictureInPictureOverlayRect];
  internal->zoomPictureInPictureOverlayRect.origin.CGFloat x = v11;
  internal->zoomPictureInPictureOverlayRect.origin.CGFloat y = v12;
  internal->zoomPictureInPictureOverlayRect.size.CGFloat width = v13;
  internal->zoomPictureInPictureOverlayRect.size.CGFloat height = v14;
  self->_internal->portraitAutoSuggestEnabled = [a3 isPortraitAutoSuggestEnabled];
  self->_internal->int portraitAutoSuggestSupported = [a3 isPortraitAutoSuggestSupported];
  return self;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    int v4 = self->_internal;
    session = v4->session;
    if (session)
    {
      if (!v4->isPresentationLayer)
      {
        [(AVCaptureSession *)session _removeVideoPreviewLayer:self];
        [(AVCaptureVideoPreviewLayer *)self removeConnection:self->_internal->connection];
        session = self->_internal->session;
      }

      int v4 = self->_internal;
    }

    [MEMORY[0x1E4F39CF8] begin];
    if (!pthread_main_np()) {
      [MEMORY[0x1E4F39CF8] activateBackground:1];
    }

    [MEMORY[0x1E4F39CF8] commit];
    id v6 = self->_internal;
    if (v6->figCaptureSession)
    {
      -[AVCaptureVideoPreviewLayer detachFromFigCaptureSession:](self, "detachFromFigCaptureSession:");
      id v6 = self->_internal;
    }

    self->_internal = 0;
  }
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v7 dealloc];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setSessionWithNoConnection:(AVCaptureSession *)session
{
  if (self->_internal->session != session && (-[AVCaptureSession isEqual:](session, "isEqual:") & 1) == 0)
  {
    unint64_t v5 = self->_internal->session;
    if (v5)
    {
      [(AVCaptureSession *)v5 _removeVideoPreviewLayer:self];

      self->_internal->session = 0;
    }
    if (session)
    {
      self->_internal->session = session;
      uint64_t v7 = 0;
      if (![(AVCaptureSession *)session _addVideoPreviewLayerWithNoConnection:self exceptionReason:&v7])
      {
        id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v6);
        }
        NSLog(&cfstr_SuppressingExc.isa, v6);
      }
    }
  }
}

- (BOOL)isPreviewing
{
  return self->_internal->isPreviewing;
}

- (AVLayerVideoGravity)videoGravity
{
  if (self->_internal->gravity) {
    return self->_internal->gravity;
  }
  else {
    return (AVLayerVideoGravity)*MEMORY[0x1E4F47C30];
  }
}

- (BOOL)isOrientationSupported
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureConnection's -isVideoOrientationSupported");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  connection = self->_internal->connection;
  if (connection) {
    char v9 = [(AVCaptureConnection *)connection isVideoOrientationSupported];
  }
  else {
    char v9 = 1;
  }
  objc_sync_exit(internal);
  return v9;
}

- (AVCaptureVideoOrientation)orientation
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureConnection's -videoOrientation");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  id v8 = self->_internal;
  connection = v8->connection;
  if (connection) {
    AVCaptureVideoOrientation orientation = [(AVCaptureConnection *)connection videoOrientation];
  }
  else {
    AVCaptureVideoOrientation orientation = v8->orientation;
  }
  objc_sync_exit(internal);
  return orientation;
}

- (int64_t)_orientation
{
  return self->_internal->orientation;
}

- (void)setOrientation:(AVCaptureVideoOrientation)orientation
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureConnection's -setVideoOrientation:");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v10 = self->_internal;
  connection = v10->connection;
  if (connection) {
    [(AVCaptureConnection *)connection setVideoOrientation:orientation];
  }
  else {
    v10->AVCaptureVideoOrientation orientation = orientation;
  }

  objc_sync_exit(internal);
}

- (BOOL)isMirroringSupported
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureConnection's -isVideoMirroringSupported");
    }
  }
  return 1;
}

- (BOOL)automaticallyAdjustsMirroring
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureConnection's -automaticallyAdjustsVideoMirroring");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  id v8 = self->_internal;
  connection = v8->connection;
  if (connection) {
    BOOL automaticallyAdjustsMirroring = [(AVCaptureConnection *)connection automaticallyAdjustsVideoMirroring];
  }
  else {
    BOOL automaticallyAdjustsMirroring = v8->automaticallyAdjustsMirroring;
  }
  objc_sync_exit(internal);
  return automaticallyAdjustsMirroring;
}

- (BOOL)_automaticallyAdjustsMirroring
{
  return self->_internal->automaticallyAdjustsMirroring;
}

- (void)setAutomaticallyAdjustsMirroring:(BOOL)automaticallyAdjustsMirroring
{
  BOOL v3 = automaticallyAdjustsMirroring;
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureConnection's -setAutomaticallyAdjustsVideoMirroring:");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v10 = self->_internal;
  connection = v10->connection;
  if (connection)
  {
    objc_sync_exit(internal);
    [(AVCaptureConnection *)connection setAutomaticallyAdjustsVideoMirroring:v3];
  }
  else
  {
    v10->BOOL automaticallyAdjustsMirroring = v3;
    objc_sync_exit(internal);
  }
}

- (BOOL)isMirrored
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"AVCaptureConnection's -isVideoMirrored");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  id v8 = self->_internal;
  connection = v8->connection;
  if (connection) {
    BOOL mirrored = [(AVCaptureConnection *)connection isVideoMirrored];
  }
  else {
    BOOL mirrored = v8->mirrored;
  }
  objc_sync_exit(internal);
  return mirrored;
}

- (BOOL)_isMirrored
{
  return self->_internal->mirrored;
}

- (void)setMirrored:(BOOL)mirrored
{
  BOOL v3 = mirrored;
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated"))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v6 isEqualToString:@"YES"] & 1) == 0
      && ([v6 isEqualToString:@"yes"] & 1) == 0
      && ([v6 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class();
      id v8 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v7, self, v8, @"AVCaptureConnection's -setVideoMirrored:");
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  connection = self->_internal->connection;
  if (connection)
  {
    objc_sync_exit(internal);
    [(AVCaptureConnection *)connection setVideoMirrored:v3];
    return;
  }
  if ([(AVCaptureVideoPreviewLayer *)self isMirroringSupported])
  {
    if (![(AVCaptureVideoPreviewLayer *)self automaticallyAdjustsMirroring])
    {
      self->_internal->BOOL mirrored = v3;
      goto LABEL_17;
    }
    CGFloat v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
  }
  else
  {
    CGFloat v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
LABEL_17:

  objc_sync_exit(internal);
}

- (BOOL)isPaused
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->isPaused;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setVideoPreviewFilters:(id)a3
{
  uint64_t v4 = 0;
  if (![(AVCaptureVideoPreviewLayer *)self _setVideoPreviewFilters:a3 checkForExceptionalInput:1 exceptionReason:&v4])
  {
    BOOL v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (BOOL)isUnoptimizedFilterRenderingEnabled
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->unoptimizedFilterRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setUnoptimizedFilterRenderingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  id v6 = self->_internal;
  if (v6->unoptimizedFilterRenderingEnabled != v3)
  {
    v6->unoptimizedFilterRenderingEnabled = v3;
    if (!v3)
    {
      uint64_t v8 = 0;
      if (![(AVCaptureVideoPreviewLayer *)self _filtersAreOptimized:self->_internal->videoPreviewFilters exceptionReason:&v8])
      {
        uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
        if (AVCaptureShouldThrowForAPIViolations()) {
          objc_exception_throw(v7);
        }
        NSLog(&cfstr_SuppressingExc.isa, v7);
      }
    }
  }
  objc_sync_exit(internal);
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_internal->semanticStyleRenderingSupported;
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_internal->semanticStyleRenderingEnabled;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (!a3)
  {
    if (!internal->semanticStyleRenderingEnabled) {
      return;
    }
    if (internal->semanticStyle)
    {
      [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];

      self->_internal->semanticStyle = 0;
      [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
      internal = self->_internal;
    }
    goto LABEL_8;
  }
  if (internal->semanticStyleRenderingSupported)
  {
    if (internal->semanticStyleRenderingEnabled == a3) {
      return;
    }
LABEL_8:
    internal->semanticStyleRenderingEnabled = a3;
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
    return;
  }
  id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v6);
  }
  NSLog(&cfstr_SuppressingExc.isa, v6);
}

- (id)semanticStyle
{
  return self->_internal->semanticStyle;
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  internal = self->_internal;
  if (internal->semanticStyleRenderingEnabled)
  {
    if (!-[AVSemanticStyle isEqual:](internal->semanticStyle, "isEqual:"))
    {
      [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];

      self->_internal->semanticStyle = (AVSemanticStyle *)a3;
      if (![(AVCaptureSession *)[(AVCaptureVideoPreviewLayer *)self session] isBeingConfigured])
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __56__AVCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke;
        v9[3] = &unk_1E5A73190;
        BOOL v10 = a4;
        v9[4] = a3;
        v9[5] = self;
        [(AVCaptureVideoPreviewLayer *)self performFigCaptureSessionOperationSafelyUsingBlock:v9];
      }
      [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
    }
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

uint64_t __56__AVCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke(uint64_t result, uint64_t a2)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 32);
    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F50F60];
      [v4 toneBias];
      int v7 = v6;
      [*(id *)(v3 + 32) warmthBias];
      LODWORD(v9) = v8;
      LODWORD(v10) = v7;
      uint64_t v11 = [v5 semanticStyleWithToneBias:v10 warmthBias:v9];
      uint64_t v12 = *MEMORY[0x1E4F51868];
      v28[0] = v11;
      uint64_t v13 = *MEMORY[0x1E4F51860];
      v27[0] = v12;
      v27[1] = v13;
      v28[1] = [NSNumber numberWithBool:*(unsigned __int8 *)(v3 + 48)];
      CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
      CFDictionaryRef v15 = v28;
      objc_super v16 = v27;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F51860];
      uint64_t v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(v3 + 48)];
      CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
      CFDictionaryRef v15 = &v26;
      objc_super v16 = &v25;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    uint64_t v19 = [*(id *)(v3 + 40) sinkID];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v22 = *(void *)(VTable + 16);
    BOOL result = VTable + 16;
    uint64_t v21 = v22;
    if (v22) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = 0;
    }
    double v24 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v23 + 8);
    if (v24) {
      return v24(a2, v19, *MEMORY[0x1E4F51850], v18);
    }
  }
  return result;
}

- (unsigned)imageQueueSlot
{
  id v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LODWORD(v2) = v2->_internal->imageQueueSlot;
  objc_sync_exit(internal);
  return v2;
}

- (CGRect)zoomPictureInPictureOverlayRect
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = self->_internal;
  CGFloat x = v4->zoomPictureInPictureOverlayRect.origin.x;
  CGFloat y = v4->zoomPictureInPictureOverlayRect.origin.y;
  CGFloat width = v4->zoomPictureInPictureOverlayRect.size.width;
  CGFloat height = v4->zoomPictureInPictureOverlayRect.size.height;
  objc_sync_exit(internal);
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C68];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)removeConnection:(id)a3
{
  if (a3 && [a3 isEqual:self->_internal->connection])
  {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"connection"];
    internal = self->_internal;
    if (!internal->isPresentationLayer)
    {
      [(AVCaptureConnection *)internal->connection removeObserver:self forKeyPath:@"videoMirrored" context:AVCaptureVideoPreviewLayerVideoMirroredChangedContext];
      [(AVCaptureConnection *)self->_internal->connection removeObserver:self forKeyPath:@"automaticallyAdjustsVideoMirroring" context:AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext];
      [(AVCaptureConnection *)self->_internal->connection removeObserver:self forKeyPath:@"videoOrientation" context:AVCaptureVideoPreviewLayerVideoOrientationChangedContext];
      int v6 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self->_internal->connection, "inputPorts"), "firstObject"), "input");
      [v6 removeObserver:self forKeyPath:@"simulatedAperture" context:AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext];
      [v6 removeObserver:self forKeyPath:@"portraitLightingEffectStrength" context:AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext];
      self->_internal->AVCaptureVideoOrientation orientation = [a3 _videoOrientation];
      self->_internal->BOOL automaticallyAdjustsMirroring = [a3 automaticallyAdjustsVideoMirroring];
      self->_internal->BOOL mirrored = [a3 isVideoMirrored];
      internal = self->_internal;
    }

    self->_internal->connection = 0;
    int v7 = self->_internal;
    objc_sync_enter(v7);
    int v8 = self->_internal;
    v8->sensorSize.CGFloat width = 0.0;
    v8->sensorSize.CGFloat height = 0.0;
    double v9 = self->_internal;
    v9->previewSize.CGFloat width = 0.0;
    v9->previewSize.CGFloat height = 0.0;
    [(AVCaptureVideoPreviewLayer *)self _updateCaptureDeviceTransform];
    objc_sync_exit(v7);
    [(AVCaptureVideoPreviewLayer *)self _updateDepthDataDeliverySupported];
    [(AVCaptureVideoPreviewLayer *)self _updateSemanticStyleRenderingSupported];
    [(AVCaptureVideoPreviewLayer *)self _updateZoomPictureInPictureOverlaySupported];
    [(AVCaptureVideoPreviewLayer *)self _updatePortraitAutoSuggestSupported];
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"connection"];
  }
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

void __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) != *(void *)(v2[4] + 32)) {
    __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke_cold_1();
  }
  objc_msgSend(v2, "detachSafelyFromFigCaptureSession:");
  uint64_t v4 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 32) + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 32) = 0;
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517E8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517F0] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F517F8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vpl_figCaptureSessionNotification name:*MEMORY[0x1E4F518F8] object:a3];
  weakReference = self->_internal->weakReference;
  uint64_t v7 = *MEMORY[0x1E4F51908];

  [v5 removeListenerWithWeakReference:weakReference callback:vpl_figCaptureSessionNotification name:v7 object:a3];
}

- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)pointInLayer
{
  double y = pointInLayer.y;
  double x = pointInLayer.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v5 = self->_internal;
  long long v10 = *(_OWORD *)&v5->captureDeviceTransform.c;
  long long v11 = *(_OWORD *)&v5->captureDeviceTransform.a;
  tdouble x = v5->captureDeviceTransform.tx;
  tdouble y = v5->captureDeviceTransform.ty;
  objc_sync_exit(internal);
  *(_OWORD *)&v14.a = v11;
  *(_OWORD *)&v14.c = v10;
  v14.tdouble x = tx;
  v14.tdouble y = ty;
  CGAffineTransformInvert(&v15, &v14);
  float64x2_t v8 = vaddq_f64(*(float64x2_t *)&v15.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v15.c, y), *(float64x2_t *)&v15.a, x));
  double v9 = v8.f64[1];
  result.double x = v8.f64[0];
  result.double y = v9;
  return result;
}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)captureDevicePointOfInterest
{
  double y = captureDevicePointOfInterest.y;
  double x = captureDevicePointOfInterest.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v7 = self->_internal;
  double a = v7->captureDeviceTransform.a;
  double b = v7->captureDeviceTransform.b;
  double c = v7->captureDeviceTransform.c;
  double d = v7->captureDeviceTransform.d;
  tdouble x = v7->captureDeviceTransform.tx;
  tdouble y = v7->captureDeviceTransform.ty;
  objc_sync_exit(internal);
  double v14 = tx + y * c + a * x;
  double v15 = ty + y * d + b * x;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (id)_input
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  id result = (id)[(NSArray *)[(AVCaptureConnection *)[(AVCaptureVideoPreviewLayer *)self connection] inputPorts] countByEnumeratingWithState:v3 objects:v4 count:16];
  if (result) {
    return (id)[**((id **)&v3[0] + 1) input];
  }
  return result;
}

- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject
{
  id v5 = [(AVMetadataObject *)metadataObject input];
  if (v5 != [(AVCaptureVideoPreviewLayer *)self _input]) {
    return 0;
  }
  id v7 = [(AVMetadataObject *)metadataObject originalMetadataObject];
  internal = self->_internal;
  objc_sync_enter(internal);
  double v9 = self->_internal;
  long long v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  long long v14 = *(_OWORD *)&v9->captureDeviceTransform.a;
  long long v15 = v10;
  long long v16 = *(_OWORD *)&v9->captureDeviceTransform.tx;
  BOOL v11 = [(AVCaptureConnection *)[(AVCaptureVideoPreviewLayer *)self connection] isVideoMirrored];
  double rollAdjustment = self->_internal->rollAdjustment;
  objc_sync_exit(internal);
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  return (AVMetadataObject *)+[AVMetadataObject derivedMetadataObjectFromMetadataObject:v7 withTransform:v13 isVideoMirrored:v11 rollAdjustment:rollAdjustment];
}

- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInLayerCoordinates
{
  CGFloat height = rectInLayerCoordinates.size.height;
  CGFloat width = rectInLayerCoordinates.size.width;
  CGFloat y = rectInLayerCoordinates.origin.y;
  CGFloat x = rectInLayerCoordinates.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  double v9 = self->_internal;
  long long v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  *(_OWORD *)&v12.double a = *(_OWORD *)&v9->captureDeviceTransform.a;
  *(_OWORD *)&v12.double c = v10;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&v9->captureDeviceTransform.tx;
  objc_sync_exit(internal);
  CGAffineTransform v11 = v12;
  CGAffineTransformInvert(&v12, &v11);
  CGAffineTransform v11 = v12;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates
{
  CGFloat height = rectInMetadataOutputCoordinates.size.height;
  CGFloat width = rectInMetadataOutputCoordinates.size.width;
  CGFloat y = rectInMetadataOutputCoordinates.origin.y;
  CGFloat x = rectInMetadataOutputCoordinates.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  double v9 = self->_internal;
  long long v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  *(_OWORD *)&v11.double a = *(_OWORD *)&v9->captureDeviceTransform.a;
  *(_OWORD *)&v11.double c = v10;
  *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)&v9->captureDeviceTransform.tx;
  objc_sync_exit(internal);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (void)_updateSemanticStyleRenderingSupported
{
  int v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isSemanticStyleRenderingSupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  id v5 = self->_internal;
  semanticStyleRenderingSupportedouble d = v5->semanticStyleRenderingSupported;
  if (v3)
  {
    semanticStyleRenderingEnabledouble d = 0;
    BOOL v8 = 0;
  }
  else
  {
    semanticStyleRenderingEnabledouble d = v5->semanticStyleRenderingEnabled;
    BOOL v8 = v5->semanticStyle != 0;
  }
  objc_sync_exit(internal);
  if (semanticStyleRenderingSupported == v3)
  {
    if (!semanticStyleRenderingEnabled) {
      goto LABEL_6;
    }
  }
  else
  {
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyleRenderingSupported"];
    if (!semanticStyleRenderingEnabled)
    {
LABEL_6:
      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyleRenderingEnabled"];
  if (v8) {
LABEL_7:
  }
    [(AVCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];
LABEL_8:
  double v9 = self->_internal;
  objc_sync_enter(v9);
  self->_internal->semanticStyleRenderingSupportedouble d = v3;
  if (semanticStyleRenderingEnabled) {
    self->_internal->semanticStyleRenderingEnabledouble d = 0;
  }
  if (!v8)
  {
    objc_sync_exit(v9);
    if (!semanticStyleRenderingEnabled) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  self->_internal->semanticStyle = 0;
  objc_sync_exit(v9);
  [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
  if (semanticStyleRenderingEnabled) {
LABEL_17:
  }
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyleRenderingEnabled"];
LABEL_18:
  if (semanticStyleRenderingSupported != v3)
  {
    [(AVCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyleRenderingSupported"];
  }
}

- (BOOL)_filtersAreOptimized:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  connection = self->_internal->connection;
  if (!connection) {
    return 1;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](connection, "sourceDevice"), "activeFormat"), "optimizedVideoPreviewFilterNames"));
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "name"));
      }
      while (v10 != v12);
      uint64_t v10 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  [v8 minusSet:v7];
  if (![v8 count]) {
    return 1;
  }
  CGRect v13 = (void *)[NSString stringWithFormat:@"The following filters are unsupported: %@", objc_msgSend(v8, "allObjects")];
  BOOL result = 0;
  *a4 = v13;
  return result;
}

- (BOOL)_setVideoPreviewFilters:(id)a3 checkForExceptionalInput:(BOOL)a4 exceptionReason:(id *)a5
{
  long long v16 = 0;
  if (!a4)
  {
    p_internal = &self->_internal;
    internal = self->_internal;
    objc_sync_enter(internal);
    goto LABEL_8;
  }
  if (a3)
  {
    if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering))
    {
      p_internal = &self->_internal;
      internal = self->_internal;
      objc_sync_enter(internal);
      if (!self->_internal->unoptimizedFilterRenderingEnabled
        && ![(AVCaptureVideoPreviewLayer *)self _filtersAreOptimized:a3 exceptionReason:&v16])
      {
        objc_sync_exit(internal);
        goto LABEL_13;
      }
LABEL_8:

      (*p_internal)->videoPreviewFilters = (NSArray *)[a3 copy];
      depthDataDeliveryEnabledouble d = (*p_internal)->depthDataDeliveryEnabled;
      objc_sync_exit(internal);
      figCaptureSessionSyncQueue = (*p_internal)->figCaptureSessionSyncQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __95__AVCaptureVideoPreviewLayer__setVideoPreviewFilters_checkForExceptionalInput_exceptionReason___block_invoke;
      v14[3] = &unk_1E5A79A60;
      v14[4] = self;
      v14[5] = a3;
      BOOL v15 = depthDataDeliveryEnabled;
      dispatch_sync(figCaptureSessionSyncQueue, v14);
      return 1;
    }
    CGRect v13 = @"App lacks proper entitlements";
  }
  else
  {
    CGRect v13 = @"videoPreviewFilters must be a non-nil value (empty array is permissible)";
  }
  long long v16 = v13;
LABEL_13:
  BOOL result = 0;
  if (a5) {
    *a5 = v16;
  }
  return result;
}

void *__95__AVCaptureVideoPreviewLayer__setVideoPreviewFilters_checkForExceptionalInput_exceptionReason___block_invoke(uint64_t a1)
{
  BOOL result = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(result[4] + 32);
  if (v3)
  {
    uint64_t v4 = [result sinkID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    BOOL v8 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v7 + 8);
    if (v8) {
      v8(v3, v4, *MEMORY[0x1E4F51830], v5);
    }
    BOOL result = (void *)[*(id *)(a1 + 40) count];
    if (result && *(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _setSimulatedApertureFromDeviceInput];
      uint64_t v9 = *(void **)(a1 + 32);
      return (void *)[v9 _setPortraitLightingEffectStrengthFromDeviceInput];
    }
  }
  return result;
}

void __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureVideoPreviewLayer attachToFigCaptureSession:]_block_invoke", "AVCaptureVideoPreviewLayer.m", 1334, "_internal->figCaptureSession == NULL");
}

void __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureVideoPreviewLayer detachFromFigCaptureSession:]_block_invoke", "AVCaptureVideoPreviewLayer.m", 1357, "figCaptureSession == _internal->figCaptureSession");
}

@end