@interface CAMTransientImageWell
- (BOOL)_isStashed;
- (BOOL)autoStashesImages;
- (BOOL)currentImageHidden;
- (CAMTransientImageWell)initWithFrame:(CGRect)a3;
- (CAMTransientImageWellDelegate)delegate;
- (CGPoint)_imageViewSpawnPoint;
- (CGPoint)_imageViewStashPoint;
- (CGRect)_unorientedFrameForImageView:(id)a3;
- (CGRect)imageFrame;
- (CGSize)_imageViewMaxSize;
- (CGSize)_imageViewSizeForContentSize:(CGSize)a3;
- (NSTimer)_autoStashTimer;
- (UIImage)image;
- (UIImageView)_imageView;
- (UISwipeGestureRecognizer)_stashGestureRecognizer;
- (UISwipeGestureRecognizer)_unstashGestureRecognizer;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)orientation;
- (void)_cancelAutoStashTimer;
- (void)_dismissImageAnimated:(BOOL)a3;
- (void)_dismissImageView:(id)a3 animated:(BOOL)a4;
- (void)_handleAutoStashTimerFired:(id)a3;
- (void)_handleStashSwipe:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_handleUnstashSwipe:(id)a3;
- (void)_restartAutoStashTimer;
- (void)_restartAutoStashTimerWithDuration:(double)a3;
- (void)_setImageView:(id)a3;
- (void)_setStashed:(BOOL)a3;
- (void)_setStashed:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAutoStashesImages:(BOOL)a3;
- (void)setCurrentImageHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)set_autoStashTimer:(id)a3;
@end

@implementation CAMTransientImageWell

- (CAMTransientImageWell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMTransientImageWell;
  v3 = -[CAMTransientImageWell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_autoStashesImages = 1;
    uint64_t v5 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel__handleTap_];
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v5;

    [(UITapGestureRecognizer *)v4->__tapGestureRecognizer setDelegate:v4];
    [(CAMTransientImageWell *)v4 addGestureRecognizer:v4->__tapGestureRecognizer];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82C38]) initWithTarget:v4 action:sel__handleUnstashSwipe_];
    unstashGestureRecognizer = v4->__unstashGestureRecognizer;
    v4->__unstashGestureRecognizer = (UISwipeGestureRecognizer *)v7;

    [(UISwipeGestureRecognizer *)v4->__unstashGestureRecognizer setDelegate:v4];
    [(UISwipeGestureRecognizer *)v4->__unstashGestureRecognizer setDirection:1];
    [(CAMTransientImageWell *)v4 addGestureRecognizer:v4->__unstashGestureRecognizer];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F82C38]) initWithTarget:v4 action:sel__handleStashSwipe_];
    stashGestureRecognizer = v4->__stashGestureRecognizer;
    v4->__stashGestureRecognizer = (UISwipeGestureRecognizer *)v9;

    [(UISwipeGestureRecognizer *)v4->__stashGestureRecognizer setDelegate:v4];
    [(UISwipeGestureRecognizer *)v4->__stashGestureRecognizer setDirection:2];
    [(CAMTransientImageWell *)v4 addGestureRecognizer:v4->__stashGestureRecognizer];
    v11 = v4;
  }

  return v4;
}

- (void)_setStashed:(BOOL)a3
{
}

- (void)_setStashed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__stashed != a3)
  {
    BOOL v4 = a4;
    self->__stashed = a3;
    [(CAMTransientImageWell *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __46__CAMTransientImageWell__setStashed_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __46__CAMTransientImageWell__setStashed_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CAMTransientImageWell *)self _imageView];

  if (v8
    && ([(CAMTransientImageWell *)self _imageView],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 frame],
        v15.double x = x,
        v15.double y = y,
        BOOL v10 = CGRectContainsPoint(v16, v15),
        v9,
        v10))
  {
    v13.receiver = self;
    v13.super_class = (Class)CAMTransientImageWell;
    v11 = -[CAMTransientImageWell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CAMTransientImageWell;
  [(CAMTransientImageWell *)&v14 layoutSubviews];
  v3 = [(CAMTransientImageWell *)self _imageView];
  [(CAMTransientImageWell *)self _unorientedFrameForImageView:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CAMTransientImageWell *)self _imageView];
  CAMViewSetBoundsAndCenterForFrame(v12, v5, v7, v9, v11);

  objc_super v13 = [(CAMTransientImageWell *)self _imageView];
  +[CAMView rotateView:v13 toInterfaceOrientation:[(CAMTransientImageWell *)self orientation] animated:0];
}

- (CGRect)_unorientedFrameForImageView:(id)a3
{
  id v4 = a3;
  [(CAMTransientImageWell *)self _imageViewMaxSize];
  double v5 = [v4 image];

  [v5 size];
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  [(CAMTransientImageWell *)self _imageViewSpawnPoint];
  if ([(CAMTransientImageWell *)self _isStashed])
  {
    [(CAMTransientImageWell *)self orientation];
    [(CAMTransientImageWell *)self _imageViewStashPoint];
  }
  UIRectCenteredAboutPoint();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_handleTap:(id)a3
{
  if ([(CAMTransientImageWell *)self _isStashed])
  {
    [(CAMTransientImageWell *)self _setStashed:0 animated:1];
    id v4 = [(CAMTransientImageWell *)self delegate];
    [v4 transientImageWellDidGestureToUnstash:self];

    if ([(CAMTransientImageWell *)self autoStashesImages])
    {
      [(CAMTransientImageWell *)self _restartAutoStashTimerWithDuration:2.3];
    }
  }
  else
  {
    id v5 = [(CAMTransientImageWell *)self delegate];
    [v5 transientImageWellDidGestureToPresentCameraRoll:self];
  }
}

- (void)_handleUnstashSwipe:(id)a3
{
  if ([(CAMTransientImageWell *)self _isStashed])
  {
    [(CAMTransientImageWell *)self _setStashed:0 animated:1];
    id v4 = [(CAMTransientImageWell *)self delegate];
    [v4 transientImageWellDidGestureToUnstash:self];

    if ([(CAMTransientImageWell *)self autoStashesImages])
    {
      [(CAMTransientImageWell *)self _restartAutoStashTimerWithDuration:2.3];
    }
  }
}

- (void)_handleStashSwipe:(id)a3
{
  if (![(CAMTransientImageWell *)self _isStashed])
  {
    [(CAMTransientImageWell *)self _setStashed:1 animated:1];
    id v4 = [(CAMTransientImageWell *)self delegate];
    [v4 transientImageWellDidGestureToStash:self];
  }
}

- (CGSize)_imageViewMaxSize
{
  [(CAMTransientImageWell *)self bounds];
  double v4 = v3;
  [(CAMTransientImageWell *)self bounds];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_imageViewSizeForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CAMTransientImageWell *)self _imageViewMaxSize];
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  double v5 = height * 0.0 + 0.0 * width;
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_imageViewSpawnPoint
{
  [(CAMTransientImageWell *)self bounds];
  double v4 = v3;
  [(CAMTransientImageWell *)self bounds];
  double v6 = v4 - v5;
  [(CAMTransientImageWell *)self bounds];
  double v9 = v6 + v8 + v7 * 0.5;
  [(CAMTransientImageWell *)self bounds];
  double v12 = v11 + v10 * 0.5;
  double v13 = v9;
  result.double y = v12;
  result.double x = v13;
  return result;
}

- (CGPoint)_imageViewStashPoint
{
  [(CAMTransientImageWell *)self _imageViewSpawnPoint];
  double v4 = v3;
  [(CAMTransientImageWell *)self bounds];
  double v6 = -(v5 * 0.5 + -10.0);
  double v7 = v4;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)_restartAutoStashTimer
{
}

- (void)_restartAutoStashTimerWithDuration:(double)a3
{
  [(CAMTransientImageWell *)self _cancelAutoStashTimer];
  id v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__handleAutoStashTimerFired_ selector:0 userInfo:0 repeats:a3];
  [(CAMTransientImageWell *)self set_autoStashTimer:v5];
}

- (void)_handleAutoStashTimerFired:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMTransientImageWell *)self _autoStashTimer];

  if (v5 == v4)
  {
    uint64_t v6 = [(CAMTransientImageWell *)self _imageView];
    if (v6)
    {
      double v7 = (void *)v6;
      BOOL v8 = [(CAMTransientImageWell *)self _isStashed];

      if (!v8)
      {
        [(CAMTransientImageWell *)self _setStashed:1 animated:1];
      }
    }
  }
}

- (void)_cancelAutoStashTimer
{
  double v3 = [(CAMTransientImageWell *)self _autoStashTimer];

  if (v3)
  {
    id v4 = [(CAMTransientImageWell *)self _autoStashTimer];
    [v4 invalidate];

    [(CAMTransientImageWell *)self set_autoStashTimer:0];
  }
}

- (void)_dismissImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMTransientImageWell *)self _imageView];

  if (v5)
  {
    uint64_t v6 = [(CAMTransientImageWell *)self _imageView];
    [(CAMTransientImageWell *)self _dismissImageView:v6 animated:v3];
  }
  [(CAMTransientImageWell *)self _setImageView:0];
  [(CAMTransientImageWell *)self _setStashed:0 animated:v3];
}

- (void)_dismissImageView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(CAMTransientImageWell *)self _imageViewSpawnPoint];
    if (v4)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      double v11 = (void *)MEMORY[0x263F82E00];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __52__CAMTransientImageWell__dismissImageView_animated___block_invoke;
      v14[3] = &unk_263FA2BC8;
      id v15 = v6;
      uint64_t v16 = v9;
      uint64_t v17 = v10;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __52__CAMTransientImageWell__dismissImageView_animated___block_invoke_2;
      v12[3] = &unk_263FA0430;
      id v13 = v15;
      [v11 animateWithDuration:0 delay:v14 usingSpringWithDamping:v12 initialSpringVelocity:0.4 options:0.0 animations:0.9 completion:0.0];
    }
    else
    {
      [v6 removeFromSuperview];
    }
  }
}

uint64_t __52__CAMTransientImageWell__dismissImageView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", -*(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __52__CAMTransientImageWell__dismissImageView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMTransientImageWell *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __49__CAMTransientImageWell_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __49__CAMTransientImageWell_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setAutoStashesImages:(BOOL)a3
{
  if (self->_autoStashesImages != a3)
  {
    self->_autoStashesImages = a3;
    if (a3) {
      [(CAMTransientImageWell *)self _restartAutoStashTimer];
    }
    else {
      [(CAMTransientImageWell *)self _cancelAutoStashTimer];
    }
  }
}

- (UIImage)image
{
  v2 = [(CAMTransientImageWell *)self _imageView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CAMTransientImageWell *)self _dismissImageAnimated:1];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];

  [(CAMTransientImageWell *)self _setImageView:v7];
  uint64_t v8 = [(CAMTransientImageWell *)self _imageView];
  [(CAMTransientImageWell *)self addSubview:v8];

  [(CAMTransientImageWell *)self layoutIfNeeded];
  uint64_t v9 = *MEMORY[0x263F15A20];
  uint64_t v10 = [(CAMTransientImageWell *)self _imageView];
  double v11 = [v10 layer];
  [v11 setCornerCurve:v9];

  double v12 = [(CAMTransientImageWell *)self _imageView];
  id v13 = [v12 layer];
  [v13 setCornerRadius:4.0];

  objc_super v14 = [(CAMTransientImageWell *)self _imageView];
  id v15 = [v14 layer];
  [v15 setMasksToBounds:1];

  if (v4)
  {
    memset(&v25, 0, sizeof(v25));
    uint64_t v16 = [(CAMTransientImageWell *)self _imageView];
    uint64_t v17 = v16;
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }

    CGAffineTransform v23 = v25;
    CGAffineTransformScale(&v24, &v23, 0.0, 0.0);
    v18 = [(CAMTransientImageWell *)self _imageView];
    CGAffineTransform v22 = v24;
    [v18 setTransform:&v22];

    v19 = [(CAMTransientImageWell *)self _imageView];
    [v19 setAlpha:0.0];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    CGAffineTransform v21 = v25;
    v20[2] = __43__CAMTransientImageWell_setImage_animated___block_invoke;
    v20[3] = &unk_263FA2270;
    v20[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v20 usingSpringWithDamping:0 initialSpringVelocity:0.25 options:0.0 animations:0.9 completion:0.5];
    if ([(CAMTransientImageWell *)self autoStashesImages]) {
      [(CAMTransientImageWell *)self _restartAutoStashTimerWithDuration:2.25];
    }
  }
  else if ([(CAMTransientImageWell *)self autoStashesImages])
  {
    [(CAMTransientImageWell *)self _restartAutoStashTimer];
  }
}

void __43__CAMTransientImageWell_setImage_animated___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_imageView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v2 setTransform:&v4];

  BOOL v3 = [*(id *)(a1 + 32) _imageView];
  [v3 setAlpha:1.0];
}

- (CGRect)imageFrame
{
  v2 = [(CAMTransientImageWell *)self _imageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)currentImageHidden
{
  v2 = [(CAMTransientImageWell *)self _imageView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setCurrentImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMTransientImageWell *)self _imageView];
  [v4 setHidden:v3];
}

- (CAMTransientImageWellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMTransientImageWellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)autoStashesImages
{
  return self->_autoStashesImages;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setImageView:(id)a3
{
}

- (NSTimer)_autoStashTimer
{
  return self->__autoStashTimer;
}

- (void)set_autoStashTimer:(id)a3
{
}

- (BOOL)_isStashed
{
  return self->__stashed;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (UISwipeGestureRecognizer)_unstashGestureRecognizer
{
  return self->__unstashGestureRecognizer;
}

- (UISwipeGestureRecognizer)_stashGestureRecognizer
{
  return self->__stashGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stashGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__unstashGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__autoStashTimer, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end