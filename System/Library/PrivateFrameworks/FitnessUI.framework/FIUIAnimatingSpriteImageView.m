@interface FIUIAnimatingSpriteImageView
+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6;
+ (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4;
+ (void)_pauseLayer:(id)a3;
+ (void)_resetLayer:(id)a3;
+ (void)_resumeLayer:(id)a3;
- (BOOL)isAnimating;
- (CGSize)_spriteFrameSize;
- (FIUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3;
- (UIImage)spriteImage;
- (id)_centerPointValues;
- (int64_t)spriteColumnCount;
- (int64_t)spriteFrameCount;
- (unint64_t)framesPerSecond;
- (void)_addAnimation:(id)a3 forKey:(id)a4;
- (void)animateOnce;
- (void)layoutSubviews;
- (void)pauseAnimating;
- (void)resumeAnimating;
- (void)setFramesPerSecond:(unint64_t)a3;
- (void)setSpriteColumnCount:(int64_t)a3;
- (void)setSpriteFrameCount:(int64_t)a3;
- (void)setSpriteImage:(id)a3;
- (void)startAnimating;
- (void)stopAnimatingFinishingCycle:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation FIUIAnimatingSpriteImageView

- (FIUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FIUIAnimatingSpriteImageView;
  v3 = -[FIUIAnimatingSpriteImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FIUIAnimatingSpriteImageView *)v3 setClipsToBounds:1];
    v4->_framesPerSecond = 60;
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    imageLayer = v4->_imageLayer;
    v4->_imageLayer = v5;

    v7 = [(FIUIAnimatingSpriteImageView *)v4 layer];
    [v7 addSublayer:v4->_imageLayer];

    v4->_shouldResumeAnimating = 0;
  }
  return v4;
}

- (void)setSpriteImage:(id)a3
{
  v4 = (UIImage *)a3;
  [(FIUIAnimatingSpriteImageView *)self stopAnimatingFinishingCycle:0];
  spriteImage = self->_spriteImage;
  self->_spriteImage = v4;
  v6 = v4;

  v7 = v6;
  [(CALayer *)self->_imageLayer setContents:[(UIImage *)v7 CGImage]];

  [(FIUIAnimatingSpriteImageView *)self setNeedsLayout];
}

- (void)setSpriteFrameCount:(int64_t)a3
{
  self->_spriteFrameCount = a3;
}

- (void)setSpriteColumnCount:(int64_t)a3
{
  self->_spriteColumnCount = a3;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (void)startAnimating
{
  id v5 = a1;
  v13.x = a2;
  v13.y = a3;
  v6 = NSStringFromCGPoint(v13);
  OUTLINED_FUNCTION_0_0(&dword_21E433000, v7, v8, "In startAnimating, centerPointValues does not contain CGPoint %@", v9, v10, v11, v12, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteImage, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (void)layoutSubviews
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(UIImage *)self->_spriteImage size];
  double v6 = v5;
  double v8 = v7;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  -[CALayer setFrame:](self->_imageLayer, "setFrame:", v3, v4, v6, v8);
  uint64_t v9 = (void *)MEMORY[0x263F158F8];
  [v9 commit];
}

- (BOOL)isAnimating
{
  v2 = [(CALayer *)self->_imageLayer animationForKey:@"PositionKeyframeAnimation"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGSize)_spriteFrameSize
{
  spriteImage = self->_spriteImage;
  if (spriteImage)
  {
    int64_t spriteFrameCount = self->_spriteFrameCount;
    int64_t spriteColumnCount = self->_spriteColumnCount;
    if (spriteFrameCount % spriteColumnCount) {
      uint64_t v6 = spriteFrameCount / spriteColumnCount + 1;
    }
    else {
      uint64_t v6 = spriteFrameCount / spriteColumnCount;
    }
    [(UIImage *)spriteImage size];
    double v8 = v7 / (double)self->_spriteColumnCount;
    [(UIImage *)self->_spriteImage size];
    double v10 = v9 / (double)v6;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3 && self->_shouldResumeAnimating) {
    [(FIUIAnimatingSpriteImageView *)self resumeAnimating];
  }
  else {
    [(FIUIAnimatingSpriteImageView *)self pauseAnimating];
  }
}

- (id)_centerPointValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(FIUIAnimatingSpriteImageView *)self _spriteFrameSize];
  [(UIImage *)self->_spriteImage size];
  if (self->_spriteFrameCount >= 1)
  {
    int64_t v4 = 0;
    do
    {
      double v5 = (void *)MEMORY[0x263F08D40];
      UIRectGetCenter();
      uint64_t v6 = objc_msgSend(v5, "valueWithCGPoint:");
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 < self->_spriteFrameCount);
  }
  return v3;
}

+ (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  id v7 = a4;
  double v8 = objc_msgSend(v6, "valueWithCGPoint:", x, y);
  unint64_t v9 = [v7 indexOfObject:v8];

  return v9;
}

+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6
{
  id v9 = a3;
  double v10 = v9;
  if (a5 - 1 == a4)
  {
    id v11 = v9;
  }
  else
  {
    unint64_t v12 = ~a4 + a5;
    unint64_t v13 = a4 + 1;
    v14 = objc_msgSend(v9, "subarrayWithRange:", a4 + 1, v12);
    v15 = v14;
    if (a6)
    {
      v16 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      id v11 = [v15 arrayByAddingObjectsFromArray:v16];
    }
    else
    {
      id v11 = v14;
    }
  }
  return v11;
}

- (void)stopAnimatingFinishingCycle:(BOOL)a3
{
  self->_shouldResumeAnimating = 0;
  if (a3
    && ([(CALayer *)self->_imageLayer presentationLayer],
        int64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    double v5 = [(CALayer *)self->_imageLayer presentationLayer];
    [v5 position];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(FIUIAnimatingSpriteImageView *)self _centerPointValues];
    unint64_t v11 = +[FIUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](FIUIAnimatingSpriteImageView, "_findSpriteIndex:centerPoints:", v10, v7, v9);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _HKInitializeLogging();
      unint64_t v12 = (void *)*MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
        [(FIUIAnimatingSpriteImageView *)v12 stopAnimatingFinishingCycle:v9];
      }
    }
    else
    {
      v14 = [(FIUIAnimatingSpriteImageView *)self _centerPointValues];
      uint64_t v15 = [v14 count];

      [(CALayer *)self->_imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
      if (v11 != v15 - 1)
      {
        v16 = [(FIUIAnimatingSpriteImageView *)self _centerPointValues];
        id v18 = +[FIUIAnimatingSpriteImageView _createNewSpriteArray:v16 currentFrame:v11 arraySize:v15 interrupted:0];

        v17 = _PositionAnimation(v18, (double)(unint64_t)[v18 count] / (double)self->_framesPerSecond, 0.0);
        [(FIUIAnimatingSpriteImageView *)self _addAnimation:v17 forKey:@"PositionKeyframeAnimation"];
      }
    }
  }
  else
  {
    imageLayer = self->_imageLayer;
    [(CALayer *)imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
  }
}

- (void)animateOnce
{
  if ([(FIUIAnimatingSpriteImageView *)self isAnimating]) {
    [(CALayer *)self->_imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
  }
  id v5 = [(FIUIAnimatingSpriteImageView *)self _centerPointValues];
  id v3 = _PositionAnimation(v5, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 1.0);
  [(FIUIAnimatingSpriteImageView *)self _addAnimation:v3 forKey:@"PositionKeyframeAnimation"];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  int64_t v4 = [v5 lastObject];
  [v4 CGPointValue];
  -[CALayer setPosition:](self->_imageLayer, "setPosition:");

  [MEMORY[0x263F158F8] commit];
}

- (void)pauseAnimating
{
  if ([(FIUIAnimatingSpriteImageView *)self isAnimating])
  {
    imageLayer = self->_imageLayer;
    +[FIUIAnimatingSpriteImageView _pauseLayer:imageLayer];
  }
}

- (void)resumeAnimating
{
  if ([(FIUIAnimatingSpriteImageView *)self isAnimating])
  {
    imageLayer = self->_imageLayer;
    +[FIUIAnimatingSpriteImageView _resumeLayer:imageLayer];
  }
  else
  {
    [(FIUIAnimatingSpriteImageView *)self startAnimating];
  }
}

- (void)_addAnimation:(id)a3 forKey:(id)a4
{
  imageLayer = self->_imageLayer;
  id v7 = a4;
  id v8 = a3;
  +[FIUIAnimatingSpriteImageView _resetLayer:imageLayer];
  [(CALayer *)self->_imageLayer addAnimation:v8 forKey:v7];
}

+ (void)_pauseLayer:(id)a3
{
  id v5 = a3;
  [v5 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;
  [v5 setSpeed:0.0];
  [v5 setTimeOffset:v4];
}

+ (void)_resumeLayer:(id)a3
{
  id v6 = a3;
  [v6 timeOffset];
  double v4 = v3;
  LODWORD(v3) = 1.0;
  [v6 setSpeed:v3];
  [v6 setTimeOffset:0.0];
  [v6 setBeginTime:0.0];
  [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
  [v6 setBeginTime:v5 - v4];
}

+ (void)_resetLayer:(id)a3
{
  id v4 = a3;
  LODWORD(v3) = 1.0;
  [v4 setSpeed:v3];
  [v4 setTimeOffset:0.0];
  [v4 setBeginTime:0.0];
}

- (int64_t)spriteFrameCount
{
  return self->_spriteFrameCount;
}

- (int64_t)spriteColumnCount
{
  return self->_spriteColumnCount;
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)stopAnimatingFinishingCycle:(CGFloat)a3 .cold.1(void *a1, CGFloat a2, CGFloat a3)
{
  id v5 = a1;
  v13.double x = a2;
  v13.double y = a3;
  id v6 = NSStringFromCGPoint(v13);
  OUTLINED_FUNCTION_0_0(&dword_21E433000, v7, v8, "In stopAnimatingFinishingCycle, centerPointValues does not contain CGPoint %@", v9, v10, v11, v12, 2u);
}

@end