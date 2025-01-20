@interface SoundDetectionAudioVisualizationView
- (CAShapeLayer)baseLine;
- (NSMutableArray)levels;
- (SoundDetectionAudioVisualizationView)init;
- (SoundDetectionAudioVisualizationView)initWithPipCount:(int)a3;
- (int)pipCount;
- (void)setBaseLine:(id)a3;
- (void)setLevels:(id)a3;
- (void)setPipCount:(int)a3;
- (void)setTintColor:(id)a3;
- (void)updateWithMagnitudes:(id)a3;
- (void)zeroOut;
@end

@implementation SoundDetectionAudioVisualizationView

- (SoundDetectionAudioVisualizationView)init
{
  return [(SoundDetectionAudioVisualizationView *)self initWithPipCount:55];
}

- (SoundDetectionAudioVisualizationView)initWithPipCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)SoundDetectionAudioVisualizationView;
  v4 = -[SoundDetectionAudioVisualizationView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    [(SoundDetectionAudioVisualizationView *)v4 setPipCount:v3];
    v6 = +[NSMutableArray array];
    if ((int)v3 >= 1)
    {
      do
      {
        id v7 = objc_alloc_init((Class)CAShapeLayer);
        id v8 = +[UIColor systemBlueColor];
        objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

        v9 = [(SoundDetectionAudioVisualizationView *)v5 layer];
        [v9 addSublayer:v7];

        [v6 addObject:v7];
        LODWORD(v3) = v3 - 1;
      }
      while (v3);
    }
    [(SoundDetectionAudioVisualizationView *)v5 setLevels:v6];
    v10 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    baseLine = v5->_baseLine;
    v5->_baseLine = v10;

    v12 = v5->_baseLine;
    id v13 = +[UIColor systemLightGrayColor];
    -[CAShapeLayer setFillColor:](v12, "setFillColor:", [v13 CGColor]);

    v14 = [(SoundDetectionAudioVisualizationView *)v5 layer];
    [v14 addSublayer:v5->_baseLine];
  }
  return v5;
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SoundDetectionAudioVisualizationView;
  [(SoundDetectionAudioVisualizationView *)&v19 setTintColor:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SoundDetectionAudioVisualizationView *)self layer];
  v6 = [v5 sublayers];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v10), "setFillColor:", objc_msgSend(v4, "CGColor"));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  v11 = [(SoundDetectionAudioVisualizationView *)self layer];
  v12 = [v11 sublayers];
  id v13 = [v12 lastObject];
  id v14 = +[UIColor systemLightGrayColor];
  objc_msgSend(v13, "setFillColor:", objc_msgSend(v14, "CGColor"));
}

- (void)updateWithMagnitudes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __61__SoundDetectionAudioVisualizationView_updateWithMagnitudes___block_invoke(uint64_t a1)
{
  unint64_t v2 = (int)[*(id *)(a1 + 32) pipCount];
  [*(id *)(a1 + 32) bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = v7 + (double)(int)[*(id *)(a1 + 32) pipCount] * -2.0;
  int v12 = [*(id *)(a1 + 32) pipCount];
  if (v12 <= 2) {
    int v13 = 2;
  }
  else {
    int v13 = v12;
  }
  double v14 = v11 / (double)(v13 - 1);
  [*(id *)(a1 + 32) bounds];
  double v16 = v15 * 0.5;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGFloat v17 = (CGRectGetWidth(v26) + (double)v2 * -2.0 - v14 * (double)(v2 - 1)) * 0.5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __61__SoundDetectionAudioVisualizationView_updateWithMagnitudes___block_invoke_2;
  v19[3] = &unk_20C298;
  long long v18 = *(void **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = v18;
  CGFloat v21 = v10;
  CGFloat v22 = v17;
  uint64_t v23 = 0x4000000000000000;
  double v24 = v14;
  double v25 = v16;
  +[UIView _animateWithFrictionBounceAnimations:v19 completion:0];
}

void __61__SoundDetectionAudioVisualizationView_updateWithMagnitudes___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) levels];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __61__SoundDetectionAudioVisualizationView_updateWithMagnitudes___block_invoke_3;
  v4[3] = &unk_20C270;
  id v5 = *(id *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 80);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __61__SoundDetectionAudioVisualizationView_updateWithMagnitudes___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 count];
  if ((unint64_t)v7 <= a3)
  {
    CGFloat v10 = &off_22C500;
  }
  else
  {
    id v8 = v7;
    if ([UIApp userInterfaceLayoutDirection] == (char *)&dword_0 + 1) {
      unint64_t v9 = (unint64_t)v8 + ~a3;
    }
    else {
      unint64_t v9 = a3;
    }
    CGFloat v10 = [*(id *)(a1 + 32) objectAtIndex:v9];
  }
  double v11 = *(double *)(a1 + 40);
  double v12 = floor(v11 / 20.0);
  if (v12 >= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  id v18 = v10;
  [v10 floatValue];
  double v15 = v13 + v11 * v14;
  if (v11 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v11;
  }
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48) + (double)a3 * *(double *)(a1 + 56) + (double)a3 * *(double *)(a1 + 64), *(double *)(a1 + 72) + v16 * -0.5, *(double *)(a1 + 56), v16, fmax(*(double *)(a1 + 56), 1.5));
  id v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", objc_msgSend(v17, "CGPath"));
}

- (void)zeroOut
{
  id v4 = (id)objc_opt_new();
  if ([(SoundDetectionAudioVisualizationView *)self pipCount] >= 1)
  {
    int v3 = 0;
    do
    {
      [v4 addObject:&off_22A908];
      ++v3;
    }
    while (v3 < [(SoundDetectionAudioVisualizationView *)self pipCount]);
  }
  [(SoundDetectionAudioVisualizationView *)self updateWithMagnitudes:v4];
}

- (int)pipCount
{
  return self->_pipCount;
}

- (void)setPipCount:(int)a3
{
  self->_pipCount = a3;
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
}

- (CAShapeLayer)baseLine
{
  return self->_baseLine;
}

- (void)setBaseLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLine, 0);

  objc_storeStrong((id *)&self->_levels, 0);
}

@end