@interface AVPictureInPictureIndicatorLayer
- (AVPictureInPictureIndicatorLayer)init;
- (AVPictureInPictureIndicatorLayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5 videoRectWhenPIPBegan:(CGRect)a6;
- (AVPictureInPictureIndicatorSublayer)contentLayer;
- (CGRect)videoRectWhenPIPBegan;
- (NSString)customText;
- (void)layoutSublayers;
- (void)setCustomText:(id)a3;
@end

@implementation AVPictureInPictureIndicatorLayer

- (void).cxx_destruct
{
}

- (CGRect)videoRectWhenPIPBegan
{
  double x = self->_videoRectWhenPIPBegan.origin.x;
  double y = self->_videoRectWhenPIPBegan.origin.y;
  double width = self->_videoRectWhenPIPBegan.size.width;
  double height = self->_videoRectWhenPIPBegan.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AVPictureInPictureIndicatorSublayer)contentLayer
{
  return self->_contentLayer;
}

- (NSString)customText
{
  v2 = [(AVPictureInPictureIndicatorLayer *)self contentLayer];
  v3 = [v2 customText];

  return (NSString *)v3;
}

- (void)setCustomText:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPictureInPictureIndicatorLayer *)self contentLayer];
  [v5 setCustomText:v4];
}

- (AVPictureInPictureIndicatorLayer)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = _AVMethodProem(self);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithTraitCollection:opaque:].", v5, v7 format];

  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  return -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](self, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", 0, 0, 1.0, v8, v9, v10, v11);
}

- (void)layoutSublayers
{
  v25.receiver = self;
  v25.super_class = (Class)AVPictureInPictureIndicatorLayer;
  [(AVPictureInPictureIndicatorLayer *)&v25 layoutSublayers];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(AVPictureInPictureIndicatorLayer *)self videoRectWhenPIPBegan];
  double v4 = 16.0;
  double v5 = 9.0;
  double v7 = v6;
  if (v6 > 0.0)
  {
    double v8 = v3;
    if (v3 > 0.0)
    {
      [(AVPictureInPictureIndicatorLayer *)self videoRectWhenPIPBegan];
      BOOL IsNull = CGRectIsNull(v27);
      if (IsNull) {
        double v5 = 9.0;
      }
      else {
        double v5 = v7;
      }
      if (IsNull) {
        double v4 = 16.0;
      }
      else {
        double v4 = v8;
      }
    }
  }
  [(AVPictureInPictureIndicatorLayer *)self bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v26.double width = v4;
  v26.double height = v5;
  v31.origin.double x = v11;
  v31.origin.double y = v13;
  v31.size.double width = v15;
  v31.size.double height = v17;
  CGRect v28 = AVMakeRectWithAspectRatioInsideRect(v26, v31);
  double v18 = round(v28.origin.x);
  double v19 = round(v28.origin.y);
  double v20 = round(v28.size.width);
  double v21 = round(v28.size.height);
  v22 = [(AVPictureInPictureIndicatorLayer *)self contentLayer];
  objc_msgSend(v22, "setBounds:", v18, v19, v20, v21);

  v23 = [(AVPictureInPictureIndicatorLayer *)self contentLayer];
  [(AVPictureInPictureIndicatorLayer *)self bounds];
  double MidX = CGRectGetMidX(v29);
  [(AVPictureInPictureIndicatorLayer *)self bounds];
  objc_msgSend(v23, "setPosition:", MidX, CGRectGetMidY(v30));

  [MEMORY[0x1E4F39CF8] commit];
}

- (AVPictureInPictureIndicatorLayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5 videoRectWhenPIPBegan:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  BOOL v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVPictureInPictureIndicatorLayer;
  CGFloat v13 = [(AVPictureInPictureIndicatorLayer *)&v18 init];
  double v14 = v13;
  if (v13)
  {
    v13->_videoRectWhenPIPBegan.origin.CGFloat x = x;
    v13->_videoRectWhenPIPBegan.origin.CGFloat y = y;
    v13->_videoRectWhenPIPBegan.size.CGFloat width = width;
    v13->_videoRectWhenPIPBegan.size.CGFloat height = height;
    CGFloat v15 = [[AVPictureInPictureIndicatorSublayer alloc] initWithDisplayScale:a4 placeholderImage:v10 opaque:a3];
    contentLayer = v14->_contentLayer;
    v14->_contentLayer = v15;

    [(AVPictureInPictureIndicatorLayer *)v14 addSublayer:v14->_contentLayer];
  }
  return v14;
}

@end