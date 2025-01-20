@interface CAMImageWell
- (BOOL)isScaledForInteraction;
- (BOOL)isThumbnailImageHidden;
- (CAMImageWell)initWithCoder:(id)a3;
- (CAMImageWell)initWithFrame:(CGRect)a3;
- (CAMImageWell)initWithLayoutStyle:(int64_t)a3;
- (CAMImageWellPresentationDelegate)presentationDelegate;
- (CGAffineTransform)_affineTransformForImageOrientation:(SEL)a3;
- (CGRect)alignmentRectForFrame:(CGRect)a3 scaledForInteraction:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableArray)_dimmingViewQueue;
- (NSString)_uuid;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImage)_placeholderImage;
- (UIImage)_thumbnailImage;
- (UIImageView)_thumbnailImageView;
- (UIView)_containerView;
- (double)_cornerRadiusForLayoutStyle:(int64_t)a3;
- (id)_placeholderImageForLayoutStyle:(int64_t)a3;
- (int)_currentPresentationStyle;
- (int64_t)cameraOrientation;
- (int64_t)layoutStyle;
- (unint64_t)_thumbnailUpdateID;
- (void)_commonCAMImageWellInitializationWithLayoutStyle:(int64_t)a3;
- (void)_performEmitAnimationWithImage:(id)a3 orientation:(int64_t)a4 withCompletionBlock:(id)a5;
- (void)_removeFirstDimmingView;
- (void)_setCurrentPresentationStyle:(int)a3;
- (void)_setPlaceholderImage:(id)a3;
- (void)_setThumbnailImage:(id)a3;
- (void)_setThumbnailUpdateID:(unint64_t)a3;
- (void)_setUuid:(id)a3;
- (void)_updateForLayoutStyle;
- (void)_updatePresentationStyleAndImageViewAnimated:(BOOL)a3;
- (void)_updateThumbnailImageAnimated:(BOOL)a3;
- (void)_updateThumbnailTransformFromCameraOrientation;
- (void)layoutSubviews;
- (void)prepareForThumbnailUpdateFromCapture;
- (void)recoverFromFailedThumbnailUpdate;
- (void)setCameraOrientation:(int64_t)a3;
- (void)setCameraOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setScaledForInteraction:(BOOL)a3;
- (void)setScaledForInteraction:(BOOL)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)setThumbnailImage:(id)a3 animated:(BOOL)a4;
- (void)setThumbnailImage:(id)a3 uuid:(id)a4 animated:(BOOL)a5;
- (void)setThumbnailImageHidden:(BOOL)a3;
@end

@implementation CAMImageWell

- (CAMImageWell)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMImageWell;
  v4 = -[CAMImageWell initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMImageWell *)v4 _commonCAMImageWellInitializationWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMImageWellInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  containerView = self->__containerView;
  self->__containerView = v9;

  [(UIView *)self->__containerView setUserInteractionEnabled:0];
  v11 = [(UIView *)self->__containerView layer];
  [v11 setMasksToBounds:1];

  uint64_t v12 = *MEMORY[0x263F15A20];
  v13 = [(UIView *)self->__containerView layer];
  [v13 setCornerCurve:v12];

  [(CAMImageWell *)self addSubview:self->__containerView];
  v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v5, v6, v7, v8);
  thumbnailImageView = self->__thumbnailImageView;
  self->__thumbnailImageView = v14;

  [(UIImageView *)self->__thumbnailImageView setExclusiveTouch:1];
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  dimmingViewQueue = self->__dimmingViewQueue;
  self->__dimmingViewQueue = v16;

  [(UIView *)self->__containerView addSubview:self->__thumbnailImageView];
  [(CAMImageWell *)self _updateForLayoutStyle];
}

- (void)_updateForLayoutStyle
{
  int64_t v3 = [(CAMImageWell *)self layoutStyle];
  id v8 = [(CAMImageWell *)self _placeholderImageForLayoutStyle:v3];
  [(CAMImageWell *)self _cornerRadiusForLayoutStyle:v3];
  double v5 = v4;
  [(CAMImageWell *)self _setPlaceholderImage:v8];
  double v6 = [(CAMImageWell *)self _containerView];
  double v7 = [v6 layer];
  [v7 setCornerRadius:v5];
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)_placeholderImageForLayoutStyle:(int64_t)a3
{
  int64_t v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
      double v4 = (void *)MEMORY[0x263F827E8];
      double v5 = CAMCameraUIFrameworkBundle();
      double v6 = @"CAMImageWellPlaceholder";
      goto LABEL_5;
    case 1:
      double v4 = (void *)MEMORY[0x263F827E8];
      double v5 = CAMCameraUIFrameworkBundle();
      double v6 = @"CAMImageWellPlaceholderPad";
      goto LABEL_5;
    case 4:
      double v4 = (void *)MEMORY[0x263F827E8];
      double v5 = CAMCameraUIFrameworkBundle();
      double v6 = @"CAMImageWellPlaceholder-d22";
LABEL_5:
      int64_t v3 = [v4 imageNamed:v6 inBundle:v5];

      break;
    default:
      break;
  }
  return v3;
}

- (double)_cornerRadiusForLayoutStyle:(int64_t)a3
{
  double v5 = CAMPixelWidthForView(self) + 3.0;
  if (!a3)
  {
    double v6 = [(CAMImageWell *)self traitCollection];
    [v6 displayScale];
    double v8 = v7;

    if (v8 == 2.0) {
      return 3.0;
    }
  }
  return v5;
}

- (void)_setPlaceholderImage:(id)a3
{
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMImageWell *)self setNeedsLayout];
  }
}

- (void)setCameraOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_cameraOrientation != a3)
  {
    BOOL v4 = a4;
    self->_cameraOrientation = a3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CAMImageWell_setCameraOrientation_animated___block_invoke;
    aBlock[3] = &unk_263FA0208;
    aBlock[4] = self;
    double v5 = _Block_copy(aBlock);
    double v6 = v5;
    if (v4) {
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v5 options:0 animations:0.3 completion:0.0];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

uint64_t __46__CAMImageWell_setCameraOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateThumbnailTransformFromCameraOrientation];
}

- (void)_updateThumbnailTransformFromCameraOrientation
{
  unint64_t v3 = self->_cameraOrientation - 2;
  CGFloat v4 = 0.0;
  if (v3 <= 2) {
    CGFloat v4 = dbl_209C79588[v3];
  }
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeRotation(&v7, v4);
  CGAffineTransform v5 = v7;
  UIIntegralTransform();
  CGAffineTransform v7 = v6;
  -[UIImageView setTransform:](self->__thumbnailImageView, "setTransform:", &v6, *(_OWORD *)&v5.a, *(_OWORD *)&v5.c, *(_OWORD *)&v5.tx);
}

- (void)setThumbnailImage:(id)a3 uuid:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = [(CAMImageWell *)self _uuid];
  if (v5)
  {
    if ([v8 isEqualToString:v10]
      && ([(CAMImageWell *)self thumbnailImage],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      uint64_t v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v8;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: not animating since UUID not changing", (uint8_t *)&v13, 0xCu);
      }

      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  [(CAMImageWell *)self _updatePresentationStyleAndImageViewAnimated:v5];
  [(CAMImageWell *)self _setThumbnailImage:v9];

  [(CAMImageWell *)self _setUuid:v8];
  [(CAMImageWell *)self _updateThumbnailImageAnimated:v5];
}

- (NSString)_uuid
{
  return self->__uuid;
}

- (void)_setThumbnailImage:(id)a3
{
}

- (void)_setUuid:(id)a3
{
}

- (void)_updateThumbnailImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMImageWell *)self isThumbnailImageHidden]
    || ([(CAMImageWell *)self _thumbnailImage], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CGAffineTransform v6 = [(CAMImageWell *)self _placeholderImage];
    if (v3)
    {
      [(CAMImageWell *)self _removeFirstDimmingView];
      BOOL v3 = 0;
    }
  }
  else
  {
    CGAffineTransform v6 = (void *)v5;
  }
  CGAffineTransform v7 = [(CAMImageWell *)self _uuid];
  unint64_t v8 = [(CAMImageWell *)self _thumbnailUpdateID] + 1;
  [(CAMImageWell *)self _setThumbnailUpdateID:v8];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __46__CAMImageWell__updateThumbnailImageAnimated___block_invoke;
  v19 = &unk_263FA27E0;
  unint64_t v23 = v8;
  v20 = self;
  id v9 = v6;
  id v21 = v9;
  id v10 = v7;
  id v22 = v10;
  v11 = (void (**)(void *, uint64_t))_Block_copy(&v16);
  if (v3)
  {
    uint64_t v12 = objc_msgSend(v9, "imageOrientation", v16, v17, v18, v19, v20, v21);
    id v13 = v9;
    if ([v13 imageOrientation])
    {
      id v14 = (void *)MEMORY[0x263F827E8];
      id v15 = v13;
      objc_msgSend(v14, "imageWithCGImage:", objc_msgSend(v15, "CGImage"));
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(CAMImageWell *)self _performEmitAnimationWithImage:v13 orientation:v12 withCompletionBlock:v11];
  }
  else
  {
    -[UIImageView _removeAllAnimations:](self->__thumbnailImageView, "_removeAllAnimations:", 0, v16, v17, v18, v19, v20, v21);
    v11[2](v11, 1);
  }
}

- (BOOL)isThumbnailImageHidden
{
  return self->_thumbnailImageHidden;
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

uint64_t __46__CAMImageWell__updateThumbnailImageAnimated___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t result = [*(id *)(a1 + 32) _thumbnailUpdateID];
  if (v2 == result)
  {
    CGFloat v4 = [*(id *)(*(void *)(a1 + 32) + 784) image];
    uint64_t v5 = *(void **)(a1 + 40);

    CGAffineTransform v6 = os_log_create("com.apple.camera", "Camera");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        int v13 = 138543618;
        uint64_t v14 = v11;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        id v10 = "ImageWell %{public}@: setImage (unchanged): %{public}@";
        goto LABEL_7;
      }
    }
    else if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      id v10 = "ImageWell %{public}@: setImage: %{public}@";
LABEL_7:
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 784) setImage:*(void *)(a1 + 40)];
    return [*(id *)(*(void *)(a1 + 32) + 784) setContentMode:2];
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = [(CAMImageWell *)self _placeholderImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)_placeholderImage
{
  return self->__placeholderImage;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CAMImageWell;
  [(CAMImageWell *)&v12 layoutSubviews];
  [(CAMImageWell *)self bounds];
  -[CAMImageWell alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CAMImageWell *)self _containerView];
  CAMViewSetBoundsAndCenterForFrame(v11, v4, v6, v8, v10);
  [(UIView *)self->__containerView bounds];
  -[UIImageView setFrame:](self->__thumbnailImageView, "setFrame:");
}

- (void)prepareForThumbnailUpdateFromCapture
{
  double v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell starting blackout animation", v17, 2u);
  }

  [(CAMImageWell *)self _updatePresentationStyleAndImageViewAnimated:1];
  if ([(CAMImageWell *)self _currentPresentationStyle] != 1)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    [(UIView *)self->__containerView bounds];
    double v5 = objc_msgSend(v4, "initWithFrame:");
    [v5 setUserInteractionEnabled:0];
    double v6 = [MEMORY[0x263F825C8] blackColor];
    [v5 setBackgroundColor:v6];

    [(UIView *)self->__containerView addSubview:v5];
    LODWORD(v7) = 1041812769;
    LODWORD(v8) = 1043018044;
    LODWORD(v9) = 1044413908;
    LODWORD(v10) = 1.0;
    uint64_t v11 = [MEMORY[0x263F15808] functionWithControlPoints:v7 :v8 :v9 :v10];
    objc_super v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v12 setFromValue:&unk_26BDDF278];
    UIAnimationDragCoefficient();
    [v12 setDuration:v13 * 0.31];
    [v12 setFillMode:*MEMORY[0x263F15AA8]];
    [v12 setTimingFunction:v11];
    +[CAMAnimationHelper configurePowerSensitiveAnimation:v12];
    uint64_t v14 = [v5 layer];
    LODWORD(v15) = 1.0;
    [v14 setOpacity:v15];
    uint64_t v16 = [v5 layer];
    [v16 addAnimation:v12 forKey:@"opacityAnimation"];

    [(NSMutableArray *)self->__dimmingViewQueue addObject:v5];
  }
}

- (void)_performEmitAnimationWithImage:(id)a3 orientation:(int64_t)a4 withCompletionBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(CAMImageWell *)self _uuid];
    LODWORD(buf.a) = 138543618;
    *(void *)((char *)&buf.a + 4) = v11;
    WORD2(buf.b) = 2114;
    *(void *)((char *)&buf.b + 6) = v8;
    _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: _performEmitAnimationWithImage: %{public}@", (uint8_t *)&buf, 0x16u);
  }
  memset(&buf, 0, sizeof(buf));
  [(CAMImageWell *)self _affineTransformForImageOrientation:a4];
  objc_super v12 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
  [(UIView *)self->__containerView bounds];
  objc_msgSend(v12, "setFrame:");
  [v12 setContentMode:2];
  thumbnailImageView = self->__thumbnailImageView;
  if (thumbnailImageView) {
    [(UIImageView *)thumbnailImageView transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransform t2 = buf;
  CGAffineTransformConcat(&v31, &t1, &t2);
  [v12 setTransform:&v31];
  [(UIView *)self->__containerView addSubview:v12];
  LODWORD(v14) = 1.0;
  double v15 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :0.0 :v14];
  uint64_t v16 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds"];
  uint64_t v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v16 setFromValue:v17];

  v18 = (void *)MEMORY[0x263F08D40];
  [(UIView *)self->__containerView bounds];
  v19 = objc_msgSend(v18, "valueWithCGRect:");
  [v16 setToValue:v19];

  UIAnimationDragCoefficient();
  [v16 setDuration:v20 * 0.2];
  [v16 setTimingFunction:v15];
  [v16 setFillMode:*MEMORY[0x263F15AA8]];
  +[CAMAnimationHelper configurePowerSensitiveAnimation:v16];
  id v21 = objc_alloc_init(CAMAnimationDelegate);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __79__CAMImageWell__performEmitAnimationWithImage_orientation_withCompletionBlock___block_invoke;
  v25[3] = &unk_263FA2808;
  id v26 = v12;
  v27 = self;
  id v28 = v9;
  id v22 = v9;
  id v23 = v12;
  [(CAMAnimationDelegate *)v21 setCompletion:v25];
  [v16 setDelegate:v21];
  v24 = [v23 layer];
  [v24 addAnimation:v16 forKey:@"emitAnimation"];
}

- (CGAffineTransform)_affineTransformForImageOrientation:(SEL)a3
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  int64_t v7 = a4 - 1;
  if (unint64_t)(a4 - 1) <= 6 && ((0x77u >> v7)) {
    CGAffineTransformMakeRotation(retstr, dbl_209C795A0[v7]);
  }
  UIEdgeInsets result = (CGAffineTransform *)UIIntegralTransform();
  *(_OWORD *)&retstr->a = v9;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = v11;
  return result;
}

uint64_t __79__CAMImageWell__performEmitAnimationWithImage_orientation_withCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) _removeFirstDimmingView];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_removeFirstDimmingView
{
  id v3 = [(NSMutableArray *)self->__dimmingViewQueue firstObject];
  [v3 removeFromSuperview];
  [(NSMutableArray *)self->__dimmingViewQueue removeObject:v3];
}

- (CAMImageWell)initWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMImageWell *)self initWithLayoutStyle:v5];
}

- (CAMImageWell)initWithCoder:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMImageWell *)self initWithLayoutStyle:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(CAMImageWell *)self intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  [(CAMImageWell *)self contentEdgeInsets];
  double v10 = v9 + v5 + v8;
  double v13 = v12 + v7 + v11;
  double v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)setScaledForInteraction:(BOOL)a3
{
}

- (void)setScaledForInteraction:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_scaledForInteraction != a3)
  {
    BOOL v4 = a4;
    self->_scaledForInteraction = a3;
    if (a3) {
      double v5 = *(double *)&CAMImageWellInteractionScale;
    }
    else {
      double v5 = 1.0;
    }
    double v6 = [(CAMImageWell *)self _containerView];
    double v7 = [v6 layer];

    if (v4)
    {
      UIAnimationDragCoefficient();
      float v9 = v8;
      double v10 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale.xy"];
      [v10 setMass:0.8];
      [v10 setDamping:12.0 / v9];
      [v10 setStiffness:300.0 / (float)(v9 * v9)];
      [v10 durationForEpsilon:0.01];
      objc_msgSend(v10, "setDuration:");
      LODWORD(v11) = 1041865114;
      LODWORD(v12) = 0.5;
      LODWORD(v13) = 1.0;
      double v14 = [MEMORY[0x263F15808] functionWithControlPoints:v11 :0.0 :v12 :v13];
      [v10 setTimingFunction:v14];

      double v15 = [v7 presentationLayer];
      uint64_t v16 = [v15 valueForKeyPath:@"transform.scale.xy"];
      [v10 setFromValue:v16];

      uint64_t v17 = [NSNumber numberWithDouble:v5];
      [v10 setToValue:v17];

      [v7 addAnimation:v10 forKey:@"highlightScaleAnimation"];
    }
    else
    {
      [v7 removeAnimationForKey:@"highlightScaleAnimation"];
    }
    memset(&v19, 0, sizeof(v19));
    CATransform3DMakeScale(&v19, v5, v5, 1.0);
    CATransform3D v18 = v19;
    [v7 setTransform:&v18];
  }
}

- (CGRect)alignmentRectForFrame:(CGRect)a3 scaledForInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  -[CAMImageWell alignmentRectForFrame:](self, "alignmentRectForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v4)
  {
    CGAffineTransformMakeScale(&v21, *(CGFloat *)&CAMImageWellInteractionScale, *(CGFloat *)&CAMImageWellInteractionScale);
    UIRectCenteredIntegralRectScale();
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setCameraOrientation:(int64_t)a3
{
}

- (void)setThumbnailImage:(id)a3 animated:(BOOL)a4
{
}

- (void)setThumbnailImageHidden:(BOOL)a3
{
  if (self->_thumbnailImageHidden != a3)
  {
    self->_thumbnailImageHidden = a3;
    [(CAMImageWell *)self _updateThumbnailImageAnimated:0];
  }
}

- (void)recoverFromFailedThumbnailUpdate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(CAMImageWell *)self _uuid];
    int v5 = 138543362;
    double v6 = v4;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: recoverFromFailedThumbnailUpdate", (uint8_t *)&v5, 0xCu);
  }
  [(CAMImageWell *)self _removeFirstDimmingView];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMImageWell *)self _updateForLayoutStyle];
  }
}

- (void)_updatePresentationStyleAndImageViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMImageWell *)self presentationDelegate];

  if (v5)
  {
    double v6 = [(CAMImageWell *)self presentationDelegate];
    int v5 = (void *)[v6 presentationStyleForAppearingThumbnailImage];
  }
  [(CAMImageWell *)self _setCurrentPresentationStyle:v5];
  if ([(CAMImageWell *)self _currentPresentationStyle] == 1 && v3)
  {
    id v7 = [(CAMImageWell *)self _thumbnailImageView];
    [v7 setImage:0];
  }
}

- (int64_t)cameraOrientation
{
  return self->_cameraOrientation;
}

- (BOOL)isScaledForInteraction
{
  return self->_scaledForInteraction;
}

- (CAMImageWellPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (CAMImageWellPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (UIImageView)_thumbnailImageView
{
  return self->__thumbnailImageView;
}

- (NSMutableArray)_dimmingViewQueue
{
  return self->__dimmingViewQueue;
}

- (unint64_t)_thumbnailUpdateID
{
  return self->__thumbnailUpdateID;
}

- (void)_setThumbnailUpdateID:(unint64_t)a3
{
  self->__thumbnailUpdateID = a3;
}

- (int)_currentPresentationStyle
{
  return self->__currentPresentationStyle;
}

- (void)_setCurrentPresentationStyle:(int)a3
{
  self->__currentPresentationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->__placeholderImage, 0);
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->__dimmingViewQueue, 0);
  objc_storeStrong((id *)&self->__thumbnailImageView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end