@interface CrossFadeView
- (BOOL)scaleSize;
- (CGRect)endFrame;
- (CGRect)startFrame;
- (CrossFadeView)initWithFrame:(CGRect)a3;
- (CrossFadeView)initWithStartView:(id)a3 endView:(id)a4 startFrame:(CGRect)a5 endFrame:(CGRect)a6;
- (UIView)endView;
- (UIView)startView;
- (id)description;
- (void)animateToEndStateWithDuration:(double)a3 completion:(id)a4;
- (void)animateToStartStateWithDuration:(double)a3 completion:(id)a4;
- (void)haltAnimation;
- (void)setEndView:(id)a3;
- (void)setScaleSize:(BOOL)a3;
- (void)setStartView:(id)a3;
- (void)setToEndState;
- (void)setToStartState;
- (void)springAnimateToEndStateWithTimingFunction:(int)a3;
- (void)springAnimateToEndStateWithTimingFunction:(int)a3 completion:(id)a4;
- (void)springAnimateToStartStateWithTimingFunction:(int)a3;
- (void)springAnimateToStartStateWithTimingFunction:(int)a3 completion:(id)a4;
@end

@implementation CrossFadeView

- (CrossFadeView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CrossFadeView;
  result = -[CrossFadeView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_scaleSize = 1;
  }
  return result;
}

- (CrossFadeView)initWithStartView:(id)a3 endView:(id)a4 startFrame:(CGRect)a5 endFrame:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double v12 = a5.origin.y;
  double v13 = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  v18 = -[CrossFadeView initWithFrame:](self, "initWithFrame:", v13, v12, v11, v10);
  v19 = v18;
  if (v18)
  {
    v18->_startFrame.origin.CGFloat x = v13;
    v18->_startFrame.origin.CGFloat y = v12;
    v18->_startFrame.size.CGFloat width = v11;
    v18->_startFrame.size.CGFloat height = v10;
    v18->_endFrame.origin.CGFloat x = x;
    v18->_endFrame.origin.CGFloat y = y;
    v18->_endFrame.size.CGFloat width = width;
    v18->_endFrame.size.CGFloat height = height;
    [(CrossFadeView *)v18 setStartView:v16];
    [(CrossFadeView *)v19 setEndView:v17];
  }

  return v19;
}

- (void)setStartView:(id)a3
{
  v5 = (UIView *)a3;
  p_startView = &self->_startView;
  startView = self->_startView;
  v9 = v5;
  if (startView != v5)
  {
    if (startView)
    {
      v8 = [(UIView *)startView superview];

      if (v8 == self) {
        [(UIView *)*p_startView removeFromSuperview];
      }
    }
    objc_storeStrong((id *)&self->_startView, a3);
    if (*p_startView)
    {
      [(UIView *)*p_startView removeFromSuperview];
      [(CrossFadeView *)self addSubview:*p_startView];
      [(CrossFadeView *)self bounds];
      -[UIView setFrame:](*p_startView, "setFrame:");
      [(UIView *)*p_startView setAutoresizingMask:18];
    }
  }
}

- (void)setEndView:(id)a3
{
  v5 = (UIView *)a3;
  p_endView = &self->_endView;
  endView = self->_endView;
  v9 = v5;
  if (endView != v5)
  {
    if (endView)
    {
      v8 = [(UIView *)endView superview];

      if (v8 == self) {
        [(UIView *)*p_endView removeFromSuperview];
      }
    }
    objc_storeStrong((id *)&self->_endView, a3);
    if (*p_endView)
    {
      [(UIView *)*p_endView removeFromSuperview];
      [(CrossFadeView *)self addSubview:*p_endView];
      [(CrossFadeView *)self bounds];
      -[UIView setFrame:](*p_endView, "setFrame:");
      [(UIView *)*p_endView setAutoresizingMask:18];
    }
  }
}

- (void)animateToStartStateWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(CrossFadeView *)self setToEndState];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke;
  v11[3] = &unk_1E6087570;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke_2;
  v9[3] = &unk_1E6087B68;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithDuration:327680 delay:v11 options:v9 animations:a3 completion:0.0];
}

uint64_t __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToStartState];
}

uint64_t __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animateToEndStateWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(CrossFadeView *)self setToStartState];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke;
  v11[3] = &unk_1E6087570;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke_2;
  v9[3] = &unk_1E6087B68;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithDuration:327680 delay:v11 options:v9 animations:a3 completion:0.0];
}

uint64_t __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToEndState];
}

uint64_t __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)springAnimateToStartStateWithTimingFunction:(int)a3
{
}

- (void)springAnimateToStartStateWithTimingFunction:(int)a3 completion:(id)a4
{
  id v5 = a4;
  [(CrossFadeView *)self setToEndState];
  id v6 = (void *)MEMORY[0x1E4FB1EB0];
  v7 = +[SpringFactory sharedFactory];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke;
  v11[3] = &unk_1E6087570;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke_2;
  v9[3] = &unk_1E6087B68;
  id v10 = v5;
  id v8 = v5;
  [v6 _animateWithDuration:393216 delay:v7 options:v11 factory:v9 animations:0.91 completion:0.0];
}

uint64_t __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToStartState];
}

uint64_t __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)springAnimateToEndStateWithTimingFunction:(int)a3
{
}

- (void)springAnimateToEndStateWithTimingFunction:(int)a3 completion:(id)a4
{
  id v5 = a4;
  [(CrossFadeView *)self setToStartState];
  id v6 = (void *)MEMORY[0x1E4FB1EB0];
  v7 = +[SpringFactory sharedFactory];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke;
  v11[3] = &unk_1E6087570;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke_2;
  v9[3] = &unk_1E6087B68;
  id v10 = v5;
  id v8 = v5;
  [v6 _animateWithDuration:393216 delay:v7 options:v11 factory:v9 animations:0.91 completion:0.0];
}

uint64_t __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToEndState];
}

uint64_t __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setToStartState
{
  if ([(CrossFadeView *)self scaleSize])
  {
    [(CrossFadeView *)self startFrame];
    scaleViewToFrame(self, v3, v4, v5, v6);
  }
  else
  {
    [(CrossFadeView *)self frame];
    [(CrossFadeView *)self startFrame];
    -[CrossFadeView setFrame:](self, "setFrame:");
  }
  v7 = [(CrossFadeView *)self startView];
  [v7 setAlpha:1.0];

  id v8 = [(CrossFadeView *)self endView];
  [v8 setAlpha:0.0];
}

- (void)setToEndState
{
  if ([(CrossFadeView *)self scaleSize])
  {
    [(CrossFadeView *)self endFrame];
    scaleViewToFrame(self, v3, v4, v5, v6);
  }
  else
  {
    [(CrossFadeView *)self frame];
    [(CrossFadeView *)self endFrame];
    -[CrossFadeView setFrame:](self, "setFrame:");
  }
  v7 = [(CrossFadeView *)self startView];
  [v7 setAlpha:0.0];

  id v8 = [(CrossFadeView *)self endView];
  [v8 setAlpha:1.0];
}

- (void)haltAnimation
{
  CGFloat v3 = [(CrossFadeView *)self layer];
  [v3 removeAllAnimations];

  CGFloat v4 = [(CrossFadeView *)self startView];
  CGFloat v5 = [v4 layer];
  [v5 removeAllAnimations];

  id v7 = [(CrossFadeView *)self endView];
  CGFloat v6 = [v7 layer];
  [v6 removeAllAnimations];
}

- (void)setScaleSize:(BOOL)a3
{
  self->_scaleSize = a3;
  if (a3)
  {
    [(CrossFadeView *)self setAutoresizesSubviews:1];
    CGFloat v4 = [(CrossFadeView *)self startView];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;

    [(CrossFadeView *)self bounds];
    double v10 = v9;
    double v12 = v11;
    double v13 = [(CrossFadeView *)self startView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    v14 = [(CrossFadeView *)self endView];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;

    [(CrossFadeView *)self bounds];
  }
  else
  {
    -[CrossFadeView setAutoresizesSubviews:](self, "setAutoresizesSubviews:");
    v21 = [(CrossFadeView *)self startView];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;

    [(CrossFadeView *)self startFrame];
    double v27 = v26;
    double v29 = v28;
    v30 = [(CrossFadeView *)self startView];
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

    v31 = [(CrossFadeView *)self endView];
    [v31 frame];
    double v16 = v32;
    double v18 = v33;

    [(CrossFadeView *)self endFrame];
  }
  double v34 = v19;
  double v35 = v20;
  id v36 = [(CrossFadeView *)self endView];
  objc_msgSend(v36, "setFrame:", v16, v18, v34, v35);
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)CrossFadeView;
  CGFloat v3 = [(CrossFadeView *)&v12 description];
  CGFloat v4 = [(CrossFadeView *)self startView];
  double v5 = [v4 description];

  double v6 = [(CrossFadeView *)self endView];
  double v7 = [v6 description];

  [(CrossFadeView *)self startFrame];
  double v8 = NSStringFromCGRect(v14);
  [(CrossFadeView *)self endFrame];
  double v9 = NSStringFromCGRect(v15);
  double v10 = [NSString stringWithFormat:@"%@  / startView = %@ / endView = %@ / startFrame = %@ / endFrame = %@", v3, v5, v7, v8, v9];

  return v10;
}

- (UIView)startView
{
  return self->_startView;
}

- (UIView)endView
{
  return self->_endView;
}

- (CGRect)startFrame
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)scaleSize
{
  return self->_scaleSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endView, 0);

  objc_storeStrong((id *)&self->_startView, 0);
}

@end