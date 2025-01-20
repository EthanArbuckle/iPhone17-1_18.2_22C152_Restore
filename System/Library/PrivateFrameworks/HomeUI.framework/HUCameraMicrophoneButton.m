@interface HUCameraMicrophoneButton
- (BOOL)isOn;
- (CGSize)intrinsicContentSize;
- (HUCameraMicrophoneButton)initWithFrame:(CGRect)a3;
- (UIImage)microphoneImage;
- (id)_circleColor;
- (void)_updateAlpha;
- (void)_updateImage;
- (void)drawRect:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMicrophoneImage:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation HUCameraMicrophoneButton

- (HUCameraMicrophoneButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUCameraMicrophoneButton;
  v3 = -[HUCameraMicrophoneButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUCameraMicrophoneButton *)v3 setOpaque:0];
    [(HUCameraMicrophoneButton *)v4 setContentMode:3];
    [(HUCameraMicrophoneButton *)v4 _updateImage];
  }
  return v4;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(HUCameraMicrophoneButton *)self _updateImage];
    [(HUCameraMicrophoneButton *)self setNeedsDisplay];
  }
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraMicrophoneButton;
  [(HUCameraMicrophoneButton *)&v4 setEnabled:a3];
  [(HUCameraMicrophoneButton *)self _updateAlpha];
  [(HUCameraMicrophoneButton *)self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUCameraMicrophoneButton;
  [(HUCameraMicrophoneButton *)&v5 setHighlighted:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HUCameraMicrophoneButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E6386018;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.2];
}

uint64_t __43__HUCameraMicrophoneButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAlpha];
}

- (void)_updateAlpha
{
  if ([(HUCameraMicrophoneButton *)self isEnabled])
  {
    int v3 = [(HUCameraMicrophoneButton *)self isHighlighted];
    double v4 = 0.3;
    if (!v3) {
      double v4 = 1.0;
    }
  }
  else
  {
    double v4 = 0.2;
  }

  [(HUCameraMicrophoneButton *)self setAlpha:v4];
}

- (void)_updateImage
{
  if ([(HUCameraMicrophoneButton *)self isOn]) {
    int v3 = @"microphoneEnabled";
  }
  else {
    int v3 = @"microphoneDisabled";
  }
  HUImageNamed(v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([(HUCameraMicrophoneButton *)self hu_isHomeAffordancePresent])
  {
    double v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v5 = [v7 _flatImageWithColor:v4];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [(HUCameraMicrophoneButton *)self setMicrophoneImage:v6];
  [(HUCameraMicrophoneButton *)self invalidateIntrinsicContentSize];
  [(HUCameraMicrophoneButton *)self setNeedsDisplay];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUCameraMicrophoneButton *)self microphoneImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  double v8 = v7 + 0.4;
  double v9 = v8;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  id v14 = [(HUCameraMicrophoneButton *)self microphoneImage];
  int v4 = [(HUCameraMicrophoneButton *)self hu_isHomeAffordancePresent];
  if ([(HUCameraMicrophoneButton *)self isEnabled])
  {
    if ([(HUCameraMicrophoneButton *)self isOn]) {
      [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    else {
    double v5 = [MEMORY[0x1E4F428B8] systemBlackColor];
    }
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];

      double v5 = (void *)v6;
    }
    uint64_t v7 = [v14 _flatImageWithColor:v5];

    id v14 = (id)v7;
  }
  [(HUCameraMicrophoneButton *)self bounds];
  double v9 = HURoundToScreenScale(v8 * 0.2);
  [(HUCameraMicrophoneButton *)self bounds];
  CGRect v17 = CGRectInset(v16, v9, v9);
  objc_msgSend(v14, "drawInRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  if ((v4 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F427D0];
    [(HUCameraMicrophoneButton *)self bounds];
    v11 = objc_msgSend(v10, "bezierPathWithOvalInRect:");
    [v11 addClip];

    v12 = [(HUCameraMicrophoneButton *)self _circleColor];
    [v12 setFill];

    if ([(HUCameraMicrophoneButton *)self isEnabled]) {
      CGBlendMode v13 = kCGBlendModeDestinationOver;
    }
    else {
      CGBlendMode v13 = kCGBlendModeSourceOut;
    }
    [(HUCameraMicrophoneButton *)self bounds];
    UIRectFillUsingBlendMode(v18, v13);
  }
}

- (id)_circleColor
{
  if ([(HUCameraMicrophoneButton *)self isEnabled])
  {
    if ([(HUCameraMicrophoneButton *)self isOn]) {
      objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    }
    else {
    double v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
  }
  else
  {
    double v3 = [MEMORY[0x1E4F428B8] colorWithWhite:0.15 alpha:1.0];
  }

  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (UIImage)microphoneImage
{
  return self->_microphoneImage;
}

- (void)setMicrophoneImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end