@interface AVPictureInPictureSampleBufferDisplayLayerHostView
+ (Class)layerClass;
- (AVPictureInPictureCALayerHostView)hostView;
- (AVPictureInPictureSampleBufferDisplayLayerHostView)initWithFrame:(CGRect)a3;
- (BOOL)isDeferringGeometryUpdates;
- (BOOL)needsGeometryUpdate;
- (CGRect)lastKnownBounds;
- (CGRect)lastKnownFrame;
- (CGSize)contentDimensions;
- (CGSize)imageQueueSize;
- (double)beginTime;
- (unsigned)contextId;
- (void)_updateGeometryIfNeeded;
- (void)layoutSubviews;
- (void)setBeginTime:(double)a3;
- (void)setContentDimensions:(CGSize)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setDeferringGeometryUpdates:(BOOL)a3;
- (void)setFrame:(CGRect)a3 contentDimensions:(CGSize)a4 imageQueueSize:(CGSize)a5;
- (void)setImageQueueSize:(CGSize)a3;
- (void)setLastKnownBounds:(CGRect)a3;
- (void)setLastKnownFrame:(CGRect)a3;
- (void)setNeedsGeometryUpdate:(BOOL)a3;
@end

@implementation AVPictureInPictureSampleBufferDisplayLayerHostView

- (void).cxx_destruct
{
}

- (void)setDeferringGeometryUpdates:(BOOL)a3
{
  self->_deferringGeometryUpdates = a3;
}

- (BOOL)isDeferringGeometryUpdates
{
  return self->_deferringGeometryUpdates;
}

- (void)setNeedsGeometryUpdate:(BOOL)a3
{
  self->_needsGeometryUpdate = a3;
}

- (BOOL)needsGeometryUpdate
{
  return self->_needsGeometryUpdate;
}

- (void)setLastKnownBounds:(CGRect)a3
{
  self->_lastKnownBounds = a3;
}

- (CGRect)lastKnownBounds
{
  double x = self->_lastKnownBounds.origin.x;
  double y = self->_lastKnownBounds.origin.y;
  double width = self->_lastKnownBounds.size.width;
  double height = self->_lastKnownBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastKnownFrame:(CGRect)a3
{
  self->_lastKnownFrame = a3;
}

- (CGRect)lastKnownFrame
{
  double x = self->_lastKnownFrame.origin.x;
  double y = self->_lastKnownFrame.origin.y;
  double width = self->_lastKnownFrame.size.width;
  double height = self->_lastKnownFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentDimensions:(CGSize)a3
{
  self->_contentDimensions = a3;
}

- (CGSize)contentDimensions
{
  double width = self->_contentDimensions.width;
  double height = self->_contentDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageQueueSize:(CGSize)a3
{
  self->_imageQueueSize = a3;
}

- (CGSize)imageQueueSize
{
  double width = self->_imageQueueSize.width;
  double height = self->_imageQueueSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AVPictureInPictureCALayerHostView)hostView
{
  return self->_hostView;
}

- (void)_updateGeometryIfNeeded
{
  if ([(AVPictureInPictureSampleBufferDisplayLayerHostView *)self needsGeometryUpdate]
    && ![(AVPictureInPictureSampleBufferDisplayLayerHostView *)self isDeferringGeometryUpdates])
  {
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self setNeedsGeometryUpdate:0];
    v3 = [MEMORY[0x1E4FB1618] blackColor];
    v4 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
    [v4 setBackgroundColor:v3];

    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
    CGFloat x = v63.origin.x;
    CGFloat y = v63.origin.y;
    CGFloat width = v63.size.width;
    CGFloat height = v63.size.height;
    if (CGRectIsInfinite(v63)) {
      goto LABEL_59;
    }
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    if (CGRectIsNull(v64)) {
      goto LABEL_59;
    }
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
    BOOL v11 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v10 < 0;
    BOOL v12 = v11 && (unint64_t)(v10 - 1) >= 0xFFFFFFFFFFFFFLL;
    BOOL v13 = !v12;
    BOOL v14 = v9 < 0 || ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    BOOL v15 = v14 && (unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFELL;
    if (v15 || !v13) {
      goto LABEL_59;
    }
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self contentDimensions];
    BOOL v18 = ((v17 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v17 < 0;
    BOOL v19 = v18 && (unint64_t)(v17 - 1) >= 0xFFFFFFFFFFFFFLL;
    BOOL v20 = !v19;
    BOOL v21 = v16 < 0 || ((v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    BOOL v22 = v21 && (unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFELL;
    if (v22
      || !v20
      || (([(AVPictureInPictureSampleBufferDisplayLayerHostView *)self imageQueueSize],
           ((v24 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF)
        ? (BOOL v25 = v24 < 0)
        : (BOOL v25 = 1),
          v25 ? (BOOL v26 = (unint64_t)(v24 - 1) >= 0xFFFFFFFFFFFFFLL) : (BOOL v26 = 0),
          v26 ? (int v27 = 0) : (int v27 = 1),
          v23 >= 0 ? (BOOL v28 = ((v23 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE) : (BOOL v28 = 1),
          v28 ? (BOOL v29 = (unint64_t)(v23 - 1) > 0xFFFFFFFFFFFFELL) : (BOOL v29 = 0),
          v29 || !v27))
    {
LABEL_59:
      [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      v55 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

      v46 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      long long v56 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v57[0] = *MEMORY[0x1E4F1DAB8];
      v57[1] = v56;
      v57[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v46 setTransform:v57];
    }
    else
    {
      v30 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v61[0] = *MEMORY[0x1E4F1DAB8];
      v61[1] = v31;
      v61[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v30 setTransform:v61];

      [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self contentDimensions];
      v70.size.CGFloat width = 1600.0;
      v70.origin.CGFloat x = 0.0;
      v70.origin.CGFloat y = 0.0;
      v70.size.CGFloat height = 1600.0;
      CGRect v65 = AVMakeRectWithAspectRatioInsideRect(v62, v70);
      double v32 = v65.origin.x;
      double v33 = v65.origin.y;
      double v34 = v65.size.width;
      double v35 = v65.size.height;
      [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
      double v36 = CGRectGetWidth(v66);
      v67.origin.CGFloat x = v32;
      v67.origin.CGFloat y = v33;
      v67.size.CGFloat width = v34;
      v67.size.CGFloat height = v35;
      double v37 = v36 / CGRectGetWidth(v67);
      [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
      double v38 = CGRectGetHeight(v68);
      v69.origin.CGFloat x = v32;
      v69.origin.CGFloat y = v33;
      v69.size.CGFloat width = v34;
      v69.size.CGFloat height = v35;
      double v39 = v38 / CGRectGetHeight(v69);
      memset(&v60.c, 0, 32);
      if (v37 >= v39) {
        double v39 = v37;
      }
      *(_OWORD *)&v60.a = 0uLL;
      CGAffineTransformMakeScale(&v60, v39, v39);
      v40 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      objc_msgSend(v40, "setFrame:", v32, v33, v34, v35);

      CGAffineTransform v59 = v60;
      v41 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      CGAffineTransform v58 = v59;
      [v41 setTransform:&v58];

      [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
      UIRectGetCenter();
      double v43 = v42;
      double v45 = v44;
      v46 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
      objc_msgSend(v46, "setCenter:", v43, v45);
    }
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerHostView;
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)&v27 layoutSubviews];
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self lastKnownBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
  v30.origin.CGFloat x = v11;
  v30.origin.CGFloat y = v12;
  v30.size.CGFloat width = v13;
  v30.size.CGFloat height = v14;
  v28.origin.CGFloat x = v4;
  v28.origin.CGFloat y = v6;
  v28.size.CGFloat width = v8;
  v28.size.CGFloat height = v10;
  if (!CGRectEqualToRect(v28, v30)) {
    goto LABEL_3;
  }
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self lastKnownFrame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self frame];
  v31.origin.CGFloat x = v23;
  v31.origin.CGFloat y = v24;
  v31.size.CGFloat width = v25;
  v31.size.CGFloat height = v26;
  v29.origin.CGFloat x = v16;
  v29.origin.CGFloat y = v18;
  v29.size.CGFloat width = v20;
  v29.size.CGFloat height = v22;
  if (!CGRectEqualToRect(v29, v31))
  {
LABEL_3:
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self setNeedsGeometryUpdate:1];
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self frame];
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setLastKnownFrame:](self, "setLastKnownFrame:");
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self bounds];
    -[AVPictureInPictureSampleBufferDisplayLayerHostView setLastKnownBounds:](self, "setLastKnownBounds:");
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self _updateGeometryIfNeeded];
  }
}

- (void)setFrame:(CGRect)a3 contentDimensions:(CGSize)a4 imageQueueSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self imageQueueSize];
  BOOL v16 = height == v15 && width == v14;
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self setDeferringGeometryUpdates:1];
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self contentDimensions];
  BOOL v19 = v18 == v8 && v17 == v7;
  if (!v19
    || ([(AVPictureInPictureSampleBufferDisplayLayerHostView *)self imageQueueSize], v21 != width)
    || v20 != height)
  {
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self setNeedsGeometryUpdate:1];
  }
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setContentDimensions:](self, "setContentDimensions:", v8, v7);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setImageQueueSize:](self, "setImageQueueSize:", width, height);
  -[AVPictureInPictureSampleBufferDisplayLayerHostView setFrame:](self, "setFrame:", x, y, v10, v9);
  [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self setDeferringGeometryUpdates:0];
  if (v16)
  {
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self _updateGeometryIfNeeded];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__AVPictureInPictureSampleBufferDisplayLayerHostView_setFrame_contentDimensions_imageQueueSize___block_invoke;
    v22[3] = &unk_1E5FC4698;
    v22[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
  }
}

uint64_t __96__AVPictureInPictureSampleBufferDisplayLayerHostView_setFrame_contentDimensions_imageQueueSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGeometryIfNeeded];
}

- (void)setBeginTime:(double)a3
{
  id v5 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
  CGFloat v4 = [v5 layer];
  [v4 setBeginTime:a3];
}

- (double)beginTime
{
  v2 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
  double v3 = [v2 layer];
  [v3 beginTime];
  double v5 = v4;

  return v5;
}

- (void)setContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
  double v4 = [v5 layer];
  [v4 setContextId:v3];
}

- (unsigned)contextId
{
  v2 = [(AVPictureInPictureSampleBufferDisplayLayerHostView *)self hostView];
  uint64_t v3 = [v2 layer];
  unsigned int v4 = [v3 contextId];

  return v4;
}

- (AVPictureInPictureSampleBufferDisplayLayerHostView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerHostView;
  uint64_t v3 = -[AVPictureInPictureSampleBufferDisplayLayerHostView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    unsigned int v4 = [AVPictureInPictureCALayerHostView alloc];
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)v3 bounds];
    uint64_t v5 = -[AVPictureInPictureCALayerHostView initWithFrame:](v4, "initWithFrame:");
    hostView = v3->_hostView;
    v3->_hostView = (AVPictureInPictureCALayerHostView *)v5;

    [(AVPictureInPictureCALayerHostView *)v3->_hostView setTranslatesAutoresizingMaskIntoConstraints:1];
    [(AVPictureInPictureCALayerHostView *)v3->_hostView setAutoresizingMask:0];
    [(AVPictureInPictureSampleBufferDisplayLayerHostView *)v3 addSubview:v3->_hostView];
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end