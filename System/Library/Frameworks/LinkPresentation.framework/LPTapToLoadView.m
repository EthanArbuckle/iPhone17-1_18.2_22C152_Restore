@interface LPTapToLoadView
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPTapToLoadView)initWithHost:(id)a3;
- (LPTapToLoadView)initWithHost:(id)a3 style:(id)a4;
- (LPTapToLoadViewDelegate)tapToLoadViewDelegate;
- (id)_createIndeterminateProgressIndicator;
- (void)_animateToProgressView;
- (void)_buildViews;
- (void)_didScroll;
- (void)_highlightLongPressRecognized:(id)a3;
- (void)_tapRecognized:(id)a3;
- (void)animateOutWithCompletionHandler:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutComponentView;
- (void)setTapToLoadViewDelegate:(id)a3;
@end

@implementation LPTapToLoadView

- (LPTapToLoadView)initWithHost:(id)a3
{
  return 0;
}

- (LPTapToLoadView)initWithHost:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPTapToLoadView;
  v8 = [(LPComponentView *)&v15 initWithHost:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_style, a4);
    [(LPTapToLoadView *)v9 _buildViews];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v9 action:sel__tapRecognized_];
    [(LPTapToLoadView *)v9 addGestureRecognizer:v10];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v9 action:sel__highlightLongPressRecognized_];
    highlightGestureRecognizer = v9->_highlightGestureRecognizer;
    v9->_highlightGestureRecognizer = (UILongPressGestureRecognizer *)v11;

    [(UILongPressGestureRecognizer *)v9->_highlightGestureRecognizer setMinimumPressDuration:0.001];
    [(UILongPressGestureRecognizer *)v9->_highlightGestureRecognizer setDelegate:v9];
    [(LPTapToLoadView *)v9 addGestureRecognizer:v9->_highlightGestureRecognizer];
    v13 = v9;
  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = [(LPTapToLoadViewStyle *)self->_style width];
  [v4 value];
  double v6 = v5;
  id v7 = [(LPTapToLoadViewStyle *)self->_style height];
  [v7 value];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutComponentView
{
  captionView = self->_captionView;
  [(LPTapToLoadView *)self bounds];
  -[LPTextView sizeThatFits:](captionView, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  [(LPTapToLoadView *)self bounds];
  double v11 = v10 * 0.5 - v7 * 0.5;
  [(LPTapToLoadView *)self bounds];
  -[LPTextView setFrame:](self->_captionView, "setFrame:", v11, v12 * 0.5 - v9 * 0.5, v7, v9);
  [(LPTapToLoadView *)self bounds];
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  [(LPTapToLoadView *)self bounds];
  progressView = self->_progressView;

  -[UIView setFrame:](progressView, "setFrame:");
}

- (void)_buildViews
{
  id v13 = [(LPTapToLoadViewStyle *)self->_style backgroundColor];
  -[UIView _lp_setBackgroundColor:](self, "_lp_setBackgroundColor:");

  LPLocalizedString(@"Tap to Load Preview");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [LPTextView alloc];
  double v4 = [(LPComponentView *)self host];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
  double v6 = [(LPTapToLoadViewStyle *)self->_style caption];
  double v7 = [(LPTextView *)v3 initWithHost:v4 text:v5 style:v6];
  captionView = self->_captionView;
  self->_captionView = v7;

  [(LPTapToLoadView *)self addSubview:self->_captionView];
  double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  highlightView = self->_highlightView;
  self->_highlightView = v9;

  [(UIView *)self->_highlightView setHidden:1];
  double v11 = self->_highlightView;
  double v12 = [(LPTapToLoadViewStyle *)self->_style tapHighlightColor];
  [(UIView *)v11 _lp_setBackgroundColor:v12];

  [(LPTapToLoadView *)self addSubview:self->_highlightView];
}

- (id)_createIndeterminateProgressIndicator
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v2 startAnimating];

  return v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Uipreviewgestu.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_didScroll
{
  [(UILongPressGestureRecognizer *)self->_highlightGestureRecognizer setEnabled:0];
  highlightGestureRecognizer = self->_highlightGestureRecognizer;

  [(UILongPressGestureRecognizer *)highlightGestureRecognizer setEnabled:1];
}

- (void)_highlightLongPressRecognized:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    double v6 = [(UIView *)self->_highlightView layer];
    [v6 setHidden:0];
  }
  else
  {
    BOOL wasTapped = self->_wasTapped;
    double v6 = [(UIView *)self->_highlightView layer];
    [v6 setHidden:!wasTapped];
  }

LABEL_6:
}

- (void)_tapRecognized:(id)a3
{
  id v11 = a3;
  self->_BOOL wasTapped = 1;
  uint64_t v4 = [(UIView *)self->_highlightView layer];
  [v4 setHidden:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);
    [v7 tapToLoadViewWasTapped:self];
  }
  [(LPTapToLoadView *)self removeGestureRecognizer:v11];
  [(LPTapToLoadView *)self removeGestureRecognizer:self->_highlightGestureRecognizer];
  highlightGestureRecognizer = self->_highlightGestureRecognizer;
  self->_highlightGestureRecognizer = 0;

  double v9 = [(LPTapToLoadView *)self _createIndeterminateProgressIndicator];
  progressView = self->_progressView;
  self->_progressView = v9;

  [(LPTapToLoadView *)self addSubview:self->_progressView];
  [(UIView *)self _lp_setNeedsLayout];
  [(LPTapToLoadView *)self _animateToProgressView];
}

- (void)_animateToProgressView
{
  id v15 = [(LPTapToLoadView *)self layer];
  [v15 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 2.0, 800.0, 37.0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v16 setKeyPath:@"opacity"];
  [v16 setDelegate:self];
  [v16 setRemovedOnCompletion:0];
  uint64_t v5 = *MEMORY[0x1E4F39FA0];
  [v16 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v16 setToValue:&unk_1EF7128A0];
  char v6 = [(LPTextView *)self->_captionView layer];
  [v6 addAnimation:v16 forKey:@"captionFadeOutSpring"];

  id v7 = (void *)[v16 copy];
  [v7 setKeyPath:@"transform.scale.xy"];
  [v7 setToValue:&unk_1EF712E18];
  double v8 = [(LPTextView *)self->_captionView layer];
  [v8 addAnimation:v7 forKey:@"captionShrinkSpring"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v9 setDuration:0.25];
  [v9 setKeyPath:@"opacity"];
  [v9 setDelegate:self];
  [v9 setRemovedOnCompletion:0];
  [v9 setFillMode:v5];
  [v9 setToValue:&unk_1EF7128A0];
  double v10 = [(UIView *)self->_highlightView layer];
  [v10 addAnimation:v9 forKey:@"highlightFadeOut"];

  id v11 = objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 2.0, 700.0, 37.0);
  [v11 setBeginTime:v4 + 0.18];
  [v11 setKeyPath:@"opacity"];
  [v11 setFromValue:&unk_1EF7128A0];
  double v12 = [(UIView *)self->_progressView layer];
  [v12 addAnimation:v11 forKey:@"progressFadeInSpring"];

  id v13 = objc_msgSend(v11, "_lp_copyWithBeginTime:", v4 + 0.135);
  [v13 setKeyPath:@"transform.scale.xy"];
  [v13 setFromValue:&unk_1EF712E28];
  id v14 = [(UIView *)self->_progressView layer];
  [v14 addAnimation:v13 forKey:@"progressGrowSpring"];
}

- (void)animateOutWithCompletionHandler:(id)a3
{
  id aBlock = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v4 setDuration:0.25];
  [v4 setKeyPath:@"opacity"];
  [v4 setDelegate:self];
  [v4 setRemovedOnCompletion:0];
  uint64_t v5 = *MEMORY[0x1E4F39FA0];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 0.25;
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1036831949;
  double v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v6 :v9 :v7 :v8];
  [v4 setTimingFunction:v10];

  [v4 setToValue:&unk_1EF7128A0];
  id v11 = [(LPTapToLoadView *)self layer];
  [v11 addAnimation:v4 forKey:@"fadeOut"];

  id v12 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v12 setDuration:0.25];
  [v12 setKeyPath:@"transform.scale.xy"];
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1036831949;
  v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v16 :v14 :v15];
  [v12 setTimingFunction:v17];

  [v12 setFillMode:v5];
  [v12 setToValue:&unk_1EF712E38];
  v18 = [(UIView *)self->_progressView layer];
  [v18 addAnimation:v12 forKey:@"scaleOut"];

  v19 = _Block_copy(aBlock);
  id animateOutCompletionHandler = self->_animateOutCompletionHandler;
  self->_id animateOutCompletionHandler = v19;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v15 = a3;
  uint64_t v5 = [(LPTextView *)self->_captionView layer];
  id v6 = [v5 animationForKey:@"captionFadeOutSpring"];

  if (v6 == v15)
  {
    [(LPTextView *)self->_captionView removeFromSuperview];
    captionView = self->_captionView;
    self->_captionView = 0;
  }
  double v8 = [(UIView *)self->_highlightView layer];
  id v9 = [v8 animationForKey:@"highlightFadeOutSpring"];

  if (v9 == v15)
  {
    [(UIView *)self->_highlightView removeFromSuperview];
    highlightView = self->_highlightView;
    self->_highlightView = 0;
  }
  id v11 = [(LPTapToLoadView *)self layer];
  id v12 = [v11 animationForKey:@"fadeOut"];

  if (v12 == v15)
  {
    id animateOutCompletionHandler = (void (**)(void))self->_animateOutCompletionHandler;
    if (animateOutCompletionHandler)
    {
      animateOutCompletionHandler[2]();
      id v14 = self->_animateOutCompletionHandler;
      self->_id animateOutCompletionHandler = 0;
    }
  }
}

- (LPTapToLoadViewDelegate)tapToLoadViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapToLoadViewDelegate);

  return (LPTapToLoadViewDelegate *)WeakRetained;
}

- (void)setTapToLoadViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapToLoadViewDelegate);
  objc_storeStrong(&self->_animateOutCompletionHandler, 0);
  objc_storeStrong((id *)&self->_highlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_captionView, 0);
}

@end