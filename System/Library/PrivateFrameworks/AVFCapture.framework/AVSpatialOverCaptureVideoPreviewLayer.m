@interface AVSpatialOverCaptureVideoPreviewLayer
+ (int64_t)uniqueID;
- (AVSpatialOverCaptureVideoPreviewLayer)initWithLayer:(id)a3;
- (BOOL)automaticallyDimsOverCaptureRegion;
- (BOOL)isPrimaryAndOverCaptureCompositingEnabled;
- (BOOL)isSemanticStyleRenderingEnabled;
- (BOOL)isSemanticStyleRenderingSupported;
- (BOOL)performContentUpdates:(id)a3;
- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5;
- (CGPoint)primaryCaptureRectCenterPoint;
- (CGRect)overCaptureRect;
- (CGRect)primaryCaptureRect;
- (CGSize)contentSize;
- (double)primaryCaptureRectAspectRatio;
- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)semanticStyle;
- (id)semanticStyles;
- (id)semanticStylesRegions;
- (int64_t)maxSemanticStyles;
- (int64_t)overCaptureStatus;
- (int64_t)primaryCaptureRectUniqueID;
- (void)_handleSpatialNotification:(id)a3 payload:(id)a4;
- (void)_setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4 transitionPercentComplete:(double)a5;
- (void)_updateSemanticStyleRenderingSupported;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6;
- (void)getPrimaryCaptureRectCenter:(CGPoint *)a3 aspectRatio:(double *)a4 uniqueID:(int64_t *)a5;
- (void)layoutSublayers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeConnection:(id)a3;
- (void)setAutomaticallyDimsOverCaptureRegion:(BOOL)a3;
- (void)setPrimaryAndOverCaptureCompositingEnabled:(BOOL)a3;
- (void)setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSemanticStyles:(id)a3 semanticStylesRegions:(id)a4;
@end

@implementation AVSpatialOverCaptureVideoPreviewLayer

- (id)semanticStyle
{
  id v2 = [(NSArray *)self->_semanticStyles firstObject];

  return v2;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  return [(AVCaptureVideoPreviewLayer *)&v5 addConnection:a3 error:a4];
}

- (void)_updateSemanticStyleRenderingSupported
{
  int v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "sourceDevice"), "activeFormat"), "isSemanticStyleRenderingSupported");
  objc_sync_enter(self);
  int semanticStyleRenderingSupported = self->_semanticStyleRenderingSupported;
  if (v3)
  {
    BOOL semanticStyleRenderingEnabled = 0;
    BOOL v6 = 0;
  }
  else
  {
    BOOL semanticStyleRenderingEnabled = self->_semanticStyleRenderingEnabled;
    BOOL v6 = [(NSArray *)self->_semanticStyles count] != 0;
  }
  objc_sync_exit(self);
  if (semanticStyleRenderingSupported == v3)
  {
    if (!semanticStyleRenderingEnabled) {
      goto LABEL_6;
    }
  }
  else
  {
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyleRenderingSupported"];
    if (!semanticStyleRenderingEnabled)
    {
LABEL_6:
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyleRenderingEnabled"];
  [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"maxSemanticStyles"];
  if (v6)
  {
LABEL_7:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyles"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStylesRegions"];
  }
LABEL_8:
  objc_sync_enter(self);
  self->_int semanticStyleRenderingSupported = v3;
  if (semanticStyleRenderingEnabled)
  {
    self->_BOOL semanticStyleRenderingEnabled = 0;
    self->_maxSemanticStyles = 0;
  }
  if (!v6)
  {
    objc_sync_exit(self);
    if (!semanticStyleRenderingEnabled) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  self->_semanticStyles = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  self->_semanticStylesRegions = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  objc_sync_exit(self);
  [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStylesRegions"];
  [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyles"];
  [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
  if (semanticStyleRenderingEnabled)
  {
LABEL_17:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"maxSemanticStyles"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyleRenderingEnabled"];
  }
LABEL_18:
  if (semanticStyleRenderingSupported != v3)
  {
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyleRenderingSupported"];
  }
}

- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.height;
  double v9 = a4.width;
  long long v36 = *MEMORY[0x1E4F1DAD8];
  double v35 = 0.0;
  [(AVSpatialOverCaptureVideoPreviewLayer *)self getPrimaryCaptureRectCenter:&v36 aspectRatio:&v35 uniqueID:0];
  double v12 = width / height;
  memset(&v34, 0, sizeof(v34));
  uint64_t v13 = *MEMORY[0x1E4F45458];
  v33.receiver = self;
  v33.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  double v14 = v9 / v8;
  -[CGAffineTransform captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:](&v33, sel_captureDeviceTransformForSensorSize_previewSize_sensorToPreviewVTScalingMode_, v13, v9, v8, width, height);
  long long v15 = *MEMORY[0x1E4F1DAB8];
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v32.c = v16;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v32.tx = v17;
  double v18 = v35;
  if (v35 > 0.0 && v35 != v14)
  {
    long long v23 = v16;
    long long v24 = v15;
    if (v35 <= v12) {
      double v19 = width / height;
    }
    else {
      double v19 = v35;
    }
    if (v35 >= v12) {
      double v18 = width / height;
    }
    if (v12 <= v14) {
      double v18 = v9 / v8;
    }
    else {
      double v19 = v9 / v8;
    }
    CGFloat v20 = fmax(v18 / v19, 1.0);
    long long v22 = v17;
    CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
    *(_OWORD *)&t1.a = v24;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = v22;
    CGAffineTransformConcat(&v32, &t1, &t2);
    CGAffineTransformMakeScale(&v29, v20, v20);
    CGAffineTransform v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v29);
    CGAffineTransform v32 = t1;
    CGAffineTransformMakeTranslation(&v27, 0.5, 0.5);
    CGAffineTransform v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v27);
    long long v17 = v22;
    long long v16 = v23;
    CGAffineTransform v32 = t1;
    long long v15 = v24;
  }
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = v17;
  if (*(double *)&v36 != 0.5 || *((double *)&v36 + 1) != 0.5) {
    CGAffineTransformMakeTranslation(&t1, fmax(v12 / v14, 1.0) * (*(double *)&v36 + -0.5), fmax(1.0 / (v12 / v14), 1.0) * (*((double *)&v36 + 1) + -0.5));
  }
  CGAffineTransform v28 = v32;
  CGAffineTransform v25 = t1;
  CGAffineTransformConcat(&v26, &v28, &v25);
  CGAffineTransform v28 = v34;
  return CGAffineTransformConcat(retstr, &v26, &v28);
}

- (void)getPrimaryCaptureRectCenter:(CGPoint *)a3 aspectRatio:(double *)a4 uniqueID:(int64_t *)a5
{
  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  CGPoint primaryCaptureRectCenterPoint = self->_primaryCaptureRectCenterPoint;
  double primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  int64_t primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  if (a3) {
    *a3 = primaryCaptureRectCenterPoint;
  }
  if (a4) {
    *a4 = primaryCaptureRectAspectRatio;
  }
  if (a5) {
    *a5 = primaryCaptureRectUniqueID;
  }
}

- (void)_setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4 transitionPercentComplete:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  self->_lastAspectCenterUpdateTime = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  double primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  BOOL v11 = y != self->_primaryCaptureRectCenterPoint.y || x != self->_primaryCaptureRectCenterPoint.x;
  os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
  if (primaryCaptureRectAspectRatio != a3 || v11)
  {
    if (primaryCaptureRectAspectRatio != a3) {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"primaryCaptureRectAspectRatio"];
    }
    if (v11) {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"primaryCaptureRectCenterPoint"];
    }
    os_unfair_lock_lock(&self->_primaryCaptureRectLock);
    self->_double primaryCaptureRectAspectRatio = a3;
    self->_primaryCaptureRectCenterPoint.double x = x;
    self->_primaryCaptureRectCenterPoint.double y = y;
    self->_primaryCaptureRectTransitionPercentComplete = a5;
    int64_t v13 = [(id)objc_opt_class() uniqueID];
    self->_int64_t primaryCaptureRectUniqueID = v13;
    os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
    if (![(AVCaptureSession *)[(AVCaptureVideoPreviewLayer *)self session] isBeingConfiguredOnCurrentThread])
    {
      if ([MEMORY[0x1E4F39CF8] currentState])
      {
        double v14 = (void *)[(AVSpatialOverCaptureVideoPreviewLayer *)self context];
        long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F50F38]), "initWithPort:", objc_msgSend(v14, "createFencePort"));
        objc_msgSend(v14, "setFencePort:", objc_msgSend(v15, "port"));
      }
      else
      {
        long long v15 = 0;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __113__AVSpatialOverCaptureVideoPreviewLayer__setPrimaryCaptureRectAspectRatio_centerPoint_transitionPercentComplete___block_invoke;
      v16[3] = &unk_1E5A73140;
      *(double *)&v16[6] = a3;
      *(double *)&v16[7] = x;
      *(double *)&v16[8] = y;
      *(double *)&v16[9] = a5;
      v16[10] = v13;
      v16[4] = v15;
      v16[5] = self;
      [(AVCaptureVideoPreviewLayer *)self performFigCaptureSessionOperationSafelyUsingBlock:v16];
    }
    [(AVCaptureVideoPreviewLayer *)self setCaptureDeviceTransformNeedsUpdate];
    if (v11) {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"primaryCaptureRectCenterPoint"];
    }
    if (primaryCaptureRectAspectRatio != a3) {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"primaryCaptureRectAspectRatio"];
    }
  }
  if (self->_automaticallyDimsOverCaptureRegion)
  {
    [(AVSpatialOverCaptureVideoPreviewLayer *)self setNeedsLayout];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self layoutIfNeeded];
  }
}

- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  v4 = [(AVCaptureVideoPreviewLayer *)&v14 _initWithSession:a3 makeConnection:a4];
  objc_super v5 = v4;
  if (v4)
  {
    v4[10] = 0;
    __asm { FMOV            V0.2D, #0.5 }
    *((_OWORD *)v4 + 3) = _Q0;
    *((void *)v4 + 8) = 0x3FF5555555555555;
    *((void *)v4 + 10) = [(id)objc_opt_class() uniqueID];
    v5[176] = 1;
    *((void *)v5 + 16) = 0;
    *((void *)v5 + 17) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v5 + 9) = _Q0;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *((_OWORD *)v5 + 6) = *MEMORY[0x1E4F1DB28];
    *((_OWORD *)v5 + 7) = v12;
    [v5 setAutomaticallyDimsOverCaptureRegion:1];
    *((void *)v5 + 29) = objc_alloc_init(MEMORY[0x1E4F1C978]);
    *((void *)v5 + 30) = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  return v5;
}

+ (int64_t)uniqueID
{
  return atomic_fetch_add_explicit(&uniqueID_sPrimaryCaptureRectUniqueID, 1uLL, memory_order_relaxed) + 1;
}

- (void)layoutSublayers
{
  v23.receiver = self;
  v23.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v23 layoutSublayers];
  if (self->_automaticallyDimsOverCaptureRegion)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    long long v22 = *MEMORY[0x1E4F1DAD8];
    double v21 = 0.0;
    [(AVSpatialOverCaptureVideoPreviewLayer *)self getPrimaryCaptureRectCenter:&v22 aspectRatio:&v21 uniqueID:0];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self bounds];
    *((double *)&v22 + 1) = *((double *)&v22 + 1) * v3;
    [(AVSpatialOverCaptureVideoPreviewLayer *)self bounds];
    CGFloat v4 = v21;
    *(double *)&long long v22 = *(double *)&v22 * v5;
    [(AVSpatialOverCaptureVideoPreviewLayer *)self bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v24.double width = 1.0;
    v24.CGFloat height = v4;
    v27.origin.double x = v7;
    v27.origin.double y = v9;
    v27.size.double width = v11;
    v27.size.CGFloat height = v13;
    CGRect v25 = AVMakeRectWithAspectRatioInsideRect(v24, v27);
    double width = v25.size.width;
    CGFloat height = v25.size.height;
    CGFloat v16 = *((double *)&v22 + 1) - v25.size.width * 0.5;
    CGFloat v17 = *(double *)&v22 - v25.size.height * 0.5;
    double v18 = *MEMORY[0x1E4F1DB28];
    v25.origin.double x = v16;
    v25.origin.double y = v17;
    -[CALayer setFrame:](self->_topDimmingOverlay, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v25.size.width, CGRectGetMinY(v25));
    v26.origin.double x = v16;
    v26.origin.double y = v17;
    v26.size.double width = width;
    v26.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v26);
    [(AVSpatialOverCaptureVideoPreviewLayer *)self bounds];
    -[CALayer setFrame:](self->_bottomDimmingOverlay, "setFrame:", v18, MaxY, width, v20 - MaxY);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setAutomaticallyDimsOverCaptureRegion:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_automaticallyDimsOverCaptureRegion != a3)
  {
    BOOL v3 = a3;
    self->_automaticallyDimsOverCaptureRegion = a3;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if (v3)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      double v6 = (CGColorSpace *)CFAutorelease(DeviceRGB);
      CGColorRef v7 = CGColorCreate(v6, (const CGFloat *)&v11);
      CFTypeRef v8 = CFAutorelease(v7);
      CGFloat v9 = (CALayer *)objc_msgSend(MEMORY[0x1E4F39BE8], "layer", v11, v12);
      self->_topDimmingOverladouble y = v9;
      [(CALayer *)v9 setBackgroundColor:v8];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self addSublayer:self->_topDimmingOverlay];
      double v10 = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
      self->_bottomDimmingOverladouble y = v10;
      [(CALayer *)v10 setBackgroundColor:v8];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self addSublayer:self->_bottomDimmingOverlay];
    }
    else
    {
      [(CALayer *)self->_topDimmingOverlay removeFromSuperlayer];
      self->_topDimmingOverladouble y = 0;
      [(CALayer *)self->_bottomDimmingOverlay removeFromSuperlayer];
      self->_bottomDimmingOverladouble y = 0;
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_semanticStyleRenderingSupported;
}

void __113__AVSpatialOverCaptureVideoPreviewLayer__setPrimaryCaptureRectAspectRatio_centerPoint_transitionPercentComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v16 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F51800]];
    uint64_t v5 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v16 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F51810]];
    uint64_t v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v16 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F51818]];
    uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v16 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F51820]];
    uint64_t v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 80)];
    [v16 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F51828]];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      [v16 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F51808]];
    }
    uint64_t v10 = [*(id *)(a1 + 40) sinkID];
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    objc_super v14 = v16;
    long long v15 = *(void (**)(uint64_t, uint64_t, void, id))(v12 + 8);
    if (v15)
    {
      v15(a2, v10, *MEMORY[0x1E4F51848], v16);
      objc_super v14 = v16;
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v13 + 88)) {
      *(unsigned char *)(v13 + 88) = 1;
    }
  }
}

- (void)_handleSpatialNotification:(id)a3 payload:(id)a4
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqualToString:", -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F51900]])
    {
      int64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F517E0]), "integerValue");
      if (v7 != [(AVSpatialOverCaptureVideoPreviewLayer *)self overCaptureStatus])
      {
        [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"overCaptureStatus"];
        os_unfair_lock_lock(&self->_primaryCaptureRectLock);
        self->_overCaptureStatus = v7;
        os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
        [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"overCaptureStatus"];
        if (self->_automaticallyDimsOverCaptureRegion)
        {
          if (objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "sourceDevice"), "isRampingVideoZoom"))
          {
            double v8 = 0.4;
          }
          else if (CFAbsoluteTimeGetCurrent() - self->_lastAspectCenterUpdateTime >= 0.3)
          {
            double v8 = 3.0;
          }
          else
          {
            double v8 = 0.4;
          }
          CGFloat v9 = 0.0;
          if ((unint64_t)(v7 - 2) <= 3) {
            CGFloat v9 = dbl_1A1636298[v7 - 2];
          }
          memset(components, 0, 24);
          components[3] = v9;
          CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
          uint64_t v11 = (CGColorSpace *)CFAutorelease(DeviceRGB);
          CGColorRef v12 = CGColorCreate(v11, components);
          CFTypeRef v13 = CFAutorelease(v12);
          [MEMORY[0x1E4F39CF8] begin];
          [MEMORY[0x1E4F39CF8] setAnimationDuration:v8];
          [(CALayer *)self->_topDimmingOverlay setBackgroundColor:v13];
          [(CALayer *)self->_bottomDimmingOverlay setBackgroundColor:v13];
          [MEMORY[0x1E4F39CF8] commit];
        }
      }
    }
  }
}

- (int64_t)overCaptureStatus
{
  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  int64_t overCaptureStatus = self->_overCaptureStatus;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return overCaptureStatus;
}

- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v10 = *(void *)&a3;
  [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"contentSize"];
  self->_contentSize.double width = width;
  self->_contentSize.double height = height;
  [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"contentSize"];
  v12.receiver = self;
  v12.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:](&v12, sel_didUpdatePreviewImageQueueSlot_imageQueue_rotationDegrees_size_, v10, a4, a5, width, height);
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  if (![(AVSpatialOverCaptureVideoPreviewLayer *)self isSemanticStyleRenderingEnabled])
  {
    objc_super v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
    return;
  }
  if (objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStyles](self, "semanticStyles"), "count") != 1
    || objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStylesRegions](self, "semanticStylesRegions"), "count") != 1)
  {
    BOOL v9 = 0;
    goto LABEL_12;
  }
  int v7 = objc_msgSend((id)objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStyles](self, "semanticStyles"), "firstObject"), "isEqual:", a3);
  v15.origin.double x = vpl_valueToRect(objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStylesRegions](self, "semanticStylesRegions"), "firstObject"));
  v16.origin.double x = 0.0;
  v16.origin.double y = 0.0;
  v16.size.double width = 1.0;
  v16.size.double height = 1.0;
  BOOL v8 = CGRectEqualToRect(v15, v16);
  BOOL v9 = v8;
  if (v7 && v8) {
    return;
  }
  if ((v7 & 1) == 0)
  {
LABEL_12:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyles"];

    self->_semanticStyles = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a3, 0);
    int v10 = 1;
    char v11 = 1;
    if (v9) {
      goto LABEL_14;
    }
LABEL_13:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStylesRegions"];

    char v11 = 0;
    self->_semanticStylesRegions = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", vpl_rectToValue(0.0, 0.0, 1.0, 1.0), 0);
    goto LABEL_14;
  }
  int v10 = 0;
  if (!v8) {
    goto LABEL_13;
  }
  char v11 = 1;
LABEL_14:
  if ([(AVCaptureSession *)[(AVCaptureVideoPreviewLayer *)self session] isBeingConfigured])
  {
    if (v11) {
      goto LABEL_16;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke;
    v13[3] = &unk_1E5A73190;
    BOOL v14 = a4;
    v13[4] = a3;
    v13[5] = self;
    [(AVCaptureVideoPreviewLayer *)self performFigCaptureSessionOperationSafelyUsingBlock:v13];
    if (v11)
    {
LABEL_16:
      if (!v10) {
        return;
      }
      goto LABEL_17;
    }
  }
  [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStylesRegions"];
  if (v10)
  {
LABEL_17:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyles"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
  }
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (id)semanticStyles
{
  id v2 = self->_semanticStyles;

  return v2;
}

- (id)semanticStylesRegions
{
  id v2 = self->_semanticStylesRegions;

  return v2;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer attachSafelyToFigCaptureSession:](&v17, sel_attachSafelyToFigCaptureSession_);
  if (a3 && self->_havePendingPrimaryCaptureRectChange)
  {
    self->_havePendingPrimaryCaptureRectChange = 0;
    os_unfair_lock_lock(&self->_primaryCaptureRectLock);
    double primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
    double x = self->_primaryCaptureRectCenterPoint.x;
    double y = self->_primaryCaptureRectCenterPoint.y;
    double primaryCaptureRectTransitionPercentComplete = self->_primaryCaptureRectTransitionPercentComplete;
    int64_t primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
    os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
    v18[0] = *MEMORY[0x1E4F51800];
    v19[0] = [NSNumber numberWithDouble:primaryCaptureRectAspectRatio];
    v18[1] = *MEMORY[0x1E4F51810];
    v19[1] = [NSNumber numberWithDouble:x];
    v18[2] = *MEMORY[0x1E4F51818];
    v19[2] = [NSNumber numberWithDouble:y];
    v18[3] = *MEMORY[0x1E4F51820];
    v19[3] = [NSNumber numberWithDouble:primaryCaptureRectTransitionPercentComplete];
    v18[4] = *MEMORY[0x1E4F51828];
    v19[4] = [NSNumber numberWithLongLong:primaryCaptureRectUniqueID];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
    id v11 = [(AVCaptureVideoPreviewLayer *)self sinkID];
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = *(void (**)(OpaqueFigCaptureSession *, id, void, uint64_t))(v13 + 8);
    if (v14) {
      v14(a3, v11, *MEMORY[0x1E4F51848], v10);
    }
  }
  CGRect v15 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  id v16 = [(AVCaptureVideoPreviewLayer *)self weakReference];
  [v15 addListenerWithWeakReference:v16 callback:socvpl_figCaptureSessionNotification name:*MEMORY[0x1E4F51900] object:a3 flags:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v6.receiver = self;
  v6.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v6 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  if (!a3)
  {
    p_BOOL semanticStyleRenderingEnabled = &self->_semanticStyleRenderingEnabled;
    if (!self->_semanticStyleRenderingEnabled) {
      return;
    }
    NSUInteger v6 = [(NSArray *)self->_semanticStyles count];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"maxSemanticStyles"];
    if (v6)
    {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyles"];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStylesRegions"];

      self->_semanticStyles = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      self->_semanticStylesRegions = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      self->_maxSemanticStyles = 0;
      [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStylesRegions"];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyles"];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
    }
    else
    {
      self->_maxSemanticStyles = 0;
    }
    goto LABEL_12;
  }
  if (self->_semanticStyleRenderingSupported)
  {
    p_BOOL semanticStyleRenderingEnabled = &self->_semanticStyleRenderingEnabled;
    if (self->_semanticStyleRenderingEnabled == a3) {
      return;
    }
    [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"maxSemanticStyles"];
    self->_maxSemanticStyles = 3;
LABEL_12:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"maxSemanticStyles"];
    *p_BOOL semanticStyleRenderingEnabled = a3;
    [(AVCaptureVideoPreviewLayer *)self bumpChangeSeed];
    return;
  }
  int v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
}

- (AVSpatialOverCaptureVideoPreviewLayer)initWithLayer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19.receiver = self;
    v19.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
    uint64_t v5 = [(AVCaptureVideoPreviewLayer *)&v19 initWithLayer:a3];
    NSUInteger v6 = v5;
    if (v5)
    {
      v5->_isPresentationLayer = 1;
      v5->_primaryCaptureRectLock._os_unfair_lock_opaque = 0;
      CGPoint v18 = (CGPoint)*MEMORY[0x1E4F1DAD8];
      int64_t v16 = 0;
      double v17 = 0.0;
      [a3 getPrimaryCaptureRectCenter:&v18 aspectRatio:&v17 uniqueID:&v16];
      v6->_CGPoint primaryCaptureRectCenterPoint = v18;
      v6->_double primaryCaptureRectAspectRatio = v17;
      v6->_int64_t primaryCaptureRectUniqueID = v16;
      [a3 primaryCaptureRect];
      v6->_primaryCaptureRect.origin.double x = v7;
      v6->_primaryCaptureRect.origin.double y = v8;
      v6->_primaryCaptureRect.size.double width = v9;
      v6->_primaryCaptureRect.size.double height = v10;
      [a3 overCaptureRect];
      v6->_overCaptureRect.origin.double x = v11;
      v6->_overCaptureRect.origin.double y = v12;
      v6->_overCaptureRect.size.double width = v13;
      v6->_overCaptureRect.size.double height = v14;
      v6->_primaryAndOverCaptureCompositingEnabled = [a3 isPrimaryAndOverCaptureCompositingEnabled];
      -[AVSpatialOverCaptureVideoPreviewLayer setAutomaticallyDimsOverCaptureRegion:](v6, "setAutomaticallyDimsOverCaptureRegion:", [a3 automaticallyDimsOverCaptureRegion]);
      v6->_int semanticStyleRenderingSupported = [a3 isSemanticStyleRenderingSupported];
      v6->_BOOL semanticStyleRenderingEnabled = [a3 isSemanticStyleRenderingEnabled];
      v6->_semanticStyles = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "semanticStyles"), "copy");
      v6->_semanticStylesRegions = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "semanticStylesRegions"), "copy");
      v6->_maxSemanticStyles = [a3 maxSemanticStyles];
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  self->_semanticStyles = 0;
  self->_semanticStylesRegions = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v3 dealloc];
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4
{
}

- (BOOL)isPrimaryAndOverCaptureCompositingEnabled
{
  return self->_primaryAndOverCaptureCompositingEnabled;
}

- (void)setPrimaryAndOverCaptureCompositingEnabled:(BOOL)a3
{
  if (self->_primaryAndOverCaptureCompositingEnabled != a3)
  {
    self->_primaryAndOverCaptureCompositingEnabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __84__AVSpatialOverCaptureVideoPreviewLayer_setPrimaryAndOverCaptureCompositingEnabled___block_invoke;
    v3[3] = &unk_1E5A73168;
    v3[4] = self;
    BOOL v4 = a3;
    [(AVCaptureVideoPreviewLayer *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
  }
}

uint64_t __84__AVSpatialOverCaptureVideoPreviewLayer_setPrimaryAndOverCaptureCompositingEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(v3 + 40)];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    CGFloat v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51840];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

- (CGPoint)primaryCaptureRectCenterPoint
{
  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  CGFloat x = self->_primaryCaptureRectCenterPoint.x;
  CGFloat y = self->_primaryCaptureRectCenterPoint.y;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  double v6 = x;
  double v7 = y;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (double)primaryCaptureRectAspectRatio
{
  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  double primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return primaryCaptureRectAspectRatio;
}

- (int64_t)primaryCaptureRectUniqueID
{
  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  int64_t primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return primaryCaptureRectUniqueID;
}

- (BOOL)automaticallyDimsOverCaptureRegion
{
  return self->_automaticallyDimsOverCaptureRegion;
}

- (int64_t)maxSemanticStyles
{
  return self->_maxSemanticStyles;
}

uint64_t __67__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke(uint64_t result, uint64_t a2)
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
      CGRect v15 = v28;
      int64_t v16 = v27;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F51860];
      uint64_t v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(v3 + 48)];
      CGFloat v14 = (void *)MEMORY[0x1E4F1C9E8];
      CGRect v15 = &v26;
      int64_t v16 = &v25;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    uint64_t v19 = [*(id *)(v3 + 40) sinkID];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v22 = *(void *)(VTable + 16);
    CGPoint result = VTable + 16;
    uint64_t v21 = v22;
    if (v22) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = 0;
    }
    CGSize v24 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v23 + 8);
    if (v24) {
      return v24(a2, v19, *MEMORY[0x1E4F51850], v18);
    }
  }
  return result;
}

- (void)setSemanticStyles:(id)a3 semanticStylesRegions:(id)a4
{
  if (![(AVSpatialOverCaptureVideoPreviewLayer *)self isSemanticStyleRenderingEnabled])
  {
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_28;
  }
  uint64_t v7 = [a3 count];
  if (v7 != [a4 count])
  {
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_28;
  }
  if (![a3 count])
  {
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_28;
  }
  unint64_t v8 = [a3 count];
  if (v8 <= [(AVSpatialOverCaptureVideoPreviewLayer *)self maxSemanticStyles])
  {
    if ([a4 count] != 1)
    {
      unint64_t v14 = 0;
      while (1)
      {
        unint64_t v15 = v14++;
        if (v14 < [a4 count]) {
          break;
        }
LABEL_25:
        if (v14 >= [a4 count] - 1) {
          goto LABEL_10;
        }
      }
      unint64_t v16 = v14;
      while (1)
      {
        uint64_t v17 = (void *)[a4 objectAtIndexedSubscript:v15];
        uint64_t v18 = (void *)[a4 objectAtIndexedSubscript:v16];
        double v19 = vpl_valueToRect(v17);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v26 = vpl_valueToRect(v18);
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        v42.origin.CGFloat x = v19;
        v42.origin.CGFloat y = v21;
        v42.size.double width = v23;
        v42.size.double height = v25;
        v43.origin.CGFloat x = v26;
        v43.origin.CGFloat y = v28;
        v43.size.double width = v30;
        v43.size.double height = v32;
        if (CGRectIntersectsRect(v42, v43)) {
          break;
        }
        if (++v16 >= [a4 count]) {
          goto LABEL_25;
        }
      }
      double v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      objc_super v33 = NSString;
      uint64_t v34 = vpl_rectToString(v19, v21, v23, v25);
      [v33 stringWithFormat:@"Region %d (%@) and region %d (%@) may not overlap", v15, v34, v16, vpl_rectToString(v26, v28, v30, v32)];
      goto LABEL_28;
    }
LABEL_10:
    int v11 = [(NSArray *)self->_semanticStyles isEqual:a3];
    char v12 = [(NSArray *)self->_semanticStylesRegions isEqual:a4];
    char v13 = v12;
    if (v11 && (v12 & 1) != 0) {
      return;
    }
    if ((v11 & 1) == 0)
    {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyle"];
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStyles"];

      self->_semanticStyles = (NSArray *)[a3 copy];
    }
    if ((v13 & 1) == 0)
    {
      [(AVSpatialOverCaptureVideoPreviewLayer *)self willChangeValueForKey:@"semanticStylesRegions"];

      self->_semanticStylesRegions = (NSArray *)[a4 copy];
    }
    if ([(AVCaptureSession *)[(AVCaptureVideoPreviewLayer *)self session] isBeingConfigured])
    {
      if (v13) {
        goto LABEL_18;
      }
    }
    else
    {
      if ([MEMORY[0x1E4F39CF8] currentState])
      {
        long long v36 = (void *)[(AVSpatialOverCaptureVideoPreviewLayer *)self context];
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F50F38]), "initWithPort:", objc_msgSend(v36, "createFencePort"));
        objc_msgSend(v36, "setFencePort:", objc_msgSend(v37, "port"));
      }
      else
      {
        v37 = 0;
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __81__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyles_semanticStylesRegions___block_invoke;
      v41[3] = &unk_1E5A731B8;
      v41[4] = self;
      v41[5] = v37;
      [(AVCaptureVideoPreviewLayer *)self performFigCaptureSessionOperationSafelyUsingBlock:v41];

      if (v13)
      {
LABEL_18:
        if (v11) {
          return;
        }
        goto LABEL_36;
      }
    }
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStylesRegions"];
    if (v11) {
      return;
    }
LABEL_36:
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyles"];
    [(AVSpatialOverCaptureVideoPreviewLayer *)self didChangeValueForKey:@"semanticStyle"];
    return;
  }
  double v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  objc_msgSend(NSString, "stringWithFormat:", @"May only pass up to %d semantic styles and regions", -[AVSpatialOverCaptureVideoPreviewLayer maxSemanticStyles](self, "maxSemanticStyles"), v38, v39, v40);
LABEL_28:
  double v35 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v35);
  }
  NSLog(&cfstr_SuppressingExc.isa, v35);
}

void __81__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyles_semanticStylesRegions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 232);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v11 = (void *)MEMORY[0x1E4F50F60];
          [v10 toneBias];
          int v13 = v12;
          [v10 warmthBias];
          LODWORD(v15) = v14;
          LODWORD(v16) = v13;
          objc_msgSend(v4, "addObject:", objc_msgSend(v11, "semanticStyleWithToneBias:warmthBias:", v16, v15));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
    uint64_t v17 = [MEMORY[0x1E4F50F68] semanticStyleSetWithSemanticStyles:v4 regions:*(void *)(*(void *)(a1 + 32) + 240)];
    if (v17) {
      [v23 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F51870]];
    }
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      [v23 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F51808]];
    }
    uint64_t v19 = [*(id *)(a1 + 32) sinkID];
    uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    double v22 = *(void (**)(uint64_t, uint64_t, void, id))(v21 + 8);
    if (v22) {
      v22(a2, v19, *MEMORY[0x1E4F51850], v23);
    }
  }
}

- (BOOL)performContentUpdates:(id)a3
{
  if ([MEMORY[0x1E4F39CF8] currentState])
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  return 0;
}

- (void)removeConnection:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v3 removeConnection:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  id v6 = [(AVCaptureVideoPreviewLayer *)self weakReference];
  [v5 removeListenerWithWeakReference:v6 callback:socvpl_figCaptureSessionNotification name:*MEMORY[0x1E4F51900] object:a3];
  v7.receiver = self;
  v7.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  [(AVCaptureVideoPreviewLayer *)&v7 detachSafelyFromFigCaptureSession:a3];
}

- (CGRect)primaryCaptureRect
{
  double x = self->_primaryCaptureRect.origin.x;
  double y = self->_primaryCaptureRect.origin.y;
  double width = self->_primaryCaptureRect.size.width;
  double height = self->_primaryCaptureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)overCaptureRect
{
  double x = self->_overCaptureRect.origin.x;
  double y = self->_overCaptureRect.origin.y;
  double width = self->_overCaptureRect.size.width;
  double height = self->_overCaptureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end