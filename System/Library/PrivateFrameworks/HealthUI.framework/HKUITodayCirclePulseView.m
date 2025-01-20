@interface HKUITodayCirclePulseView
- (HKUITodayCirclePulseView)initWithFrame:(CGRect)a3;
- (double)circleDiameter;
- (void)_layoutSubviews;
- (void)pulse:(id)a3;
- (void)setCircleDiameter:(double)a3;
- (void)setDayLabelContent:(id)a3;
@end

@implementation HKUITodayCirclePulseView

- (HKUITodayCirclePulseView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HKUITodayCirclePulseView;
  v3 = -[HKUITodayCirclePulseView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(HKUITodayCirclePulseView *)v3 setBackgroundColor:v4];

    [(HKUITodayCirclePulseView *)v3 setClipsToBounds:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundContainer = v3->_backgroundContainer;
    v3->_backgroundContainer = v5;

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v3->_backgroundContainer setBackgroundColor:v7];

    v8 = objc_alloc_init(HKUITodayCirclePulseBackground);
    background = v3->_background;
    v3->_background = v8;

    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(HKUITodayCirclePulseBackground *)v3->_background setBackgroundColor:v10];

    [(HKUITodayCirclePulseBackground *)v3->_background setAutoresizingMask:18];
    [(UIView *)v3->_backgroundContainer addSubview:v3->_background];
    [(HKUITodayCirclePulseView *)v3 addSubview:v3->_backgroundContainer];
    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    dayLabel = v3->_dayLabel;
    v3->_dayLabel = (CALayer *)v11;

    v13 = [(HKUITodayCirclePulseView *)v3 layer];
    [v13 addSublayer:v3->_dayLabel];
  }
  return v3;
}

- (void)setDayLabelContent:(id)a3
{
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (void)_layoutSubviews
{
  [(HKUITodayCirclePulseView *)self circleDiameter];
  UIRoundToViewScale();
  double v4 = v3;
  [(HKUITodayCirclePulseView *)self circleDiameter];
  double v6 = v5;
  [(HKUITodayCirclePulseView *)self circleDiameter];
  v18.origin.double x = HKUICeilRectToScreenScale(0.0, 0.0, v6, v7);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  CGRect v19 = CGRectInset(v18, 1.0, 1.0);
  double v12 = v19.origin.x;
  double v13 = v19.origin.y;
  double v14 = v19.size.width;
  double v16 = v19.size.height;
  -[CALayer setFrame:](self->_dayLabel, "setFrame:", x, y, width, height);
  -[CALayer setPosition:](self->_dayLabel, "setPosition:", v4, v4);
  -[UIView setFrame:](self->_backgroundContainer, "setFrame:", v12, v13, v14, v16);
  backgroundContainer = self->_backgroundContainer;
  -[UIView setCenter:](backgroundContainer, "setCenter:", v4, v4);
}

- (void)pulse:(id)a3
{
  id v4 = a3;
  [(HKUITodayCirclePulseView *)self _layoutSubviews];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke;
  v10[3] = &unk_1E6D50ED8;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:0x20000 delay:v10 options:0 mass:0.230000004 stiffness:0.0700000003 damping:1.20000005 initialVelocity:400.0 animations:16.0 completion:0.0];
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v8 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke_2;
  v9[3] = &unk_1E6D50ED8;
  v9[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke_3;
  v7[3] = &unk_1E6D53570;
  id v6 = v4;
  [v5 _animateUsingSpringWithDuration:196608 delay:v9 options:v7 mass:1.28999996 stiffness:0.0 damping:1.20000005 initialVelocity:400.0 animations:16.0 completion:0.0];
}

void __34__HKUITodayCirclePulseView_pulse___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v8.m33 = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v8.m43 = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v8.m13 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 0.84, 0.84, 1.0);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  CATransform3D v7 = v9;
  [v6 setTransform:&v7];
}

void __34__HKUITodayCirclePulseView_pulse___block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v8.m33 = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v8.m43 = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v8.m13 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 1.19047619, 1.19047619, 1.0);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  CATransform3D v7 = v9;
  [v6 setTransform:&v7];
}

uint64_t __34__HKUITodayCirclePulseView_pulse___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_backgroundContainer, 0);
}

@end