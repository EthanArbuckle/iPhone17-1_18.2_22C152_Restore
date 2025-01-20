@interface CSFocusActivityView
+ (CGSize)activityViewSize;
- (BOOL)enabled;
- (BOOL)isActivityIndicatorVisible;
- (CGRect)_activityIndicatorFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSFocusActivityViewDelegate)delegate;
- (FCActivityDescribing)activity;
- (UIView)activityIndicator;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (void)_addActivityIndicatorTargetActions;
- (void)_handleButtonPress:(id)a3;
- (void)_removeActivityIndicatorTargetActions;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeIndicator;
- (void)setActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation CSFocusActivityView

- (void)dealloc
{
  [(CSFocusActivityView *)self _removeActivityIndicatorTargetActions];
  v3.receiver = self;
  v3.super_class = (Class)CSFocusActivityView;
  [(CSFocusActivityView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityView;
  [(CSFocusActivityView *)&v4 layoutSubviews];
  activityIndicator = self->_activityIndicator;
  [(CSFocusActivityView *)self _activityIndicatorFrame];
  -[CSFocusActivityIndicator setFrame:](activityIndicator, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  +[CSFocusActivityIndicator activityIndicatorExpandedSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)strength
{
  [(CSFocusActivityIndicator *)self->_activityIndicator strength];
  return result;
}

- (void)setStrength:(double)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return [(CSFocusActivityIndicator *)self->_activityIndicator legibilitySettings];
}

- (void)setLegibilitySettings:(id)a3
{
}

+ (CGSize)activityViewSize
{
  +[CSFocusActivityIndicator activityIndicatorExpandedSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setActivity:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && !self->_activityIndicator)
  {
    v5 = objc_alloc_init(CSFocusActivityIndicator);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v5;

    [(CSFocusActivityIndicator *)self->_activityIndicator sizeToFit];
    [(CSFocusActivityView *)self addSubview:self->_activityIndicator];
    [(CSFocusActivityView *)self _addActivityIndicatorTargetActions];
    id v4 = v7;
  }
  [(CSFocusActivityIndicator *)self->_activityIndicator setActivity:v4];
  [(CSFocusActivityView *)self setNeedsLayout];
}

- (FCActivityDescribing)activity
{
  return [(CSFocusActivityIndicator *)self->_activityIndicator activity];
}

- (UIView)activityIndicator
{
  return (UIView *)self->_activityIndicator;
}

- (void)removeIndicator
{
  [(CSFocusActivityView *)self _removeActivityIndicatorTargetActions];
  [(CSFocusActivityIndicator *)self->_activityIndicator removeFromSuperview];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  id v4 = [(CSFocusActivityView *)self delegate];
  objc_msgSend(v4, "focusActivityViewIndicatorDidChangeToVisible:", -[CSFocusActivityView isActivityIndicatorVisible](self, "isActivityIndicatorVisible"));
  [(CSFocusActivityView *)self setNeedsLayout];
}

- (BOOL)isActivityIndicatorVisible
{
  return self->_activityIndicator != 0;
}

- (void)_handleButtonPress:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained focusActivityViewIndicatorPressed:v4];
}

- (void)_addActivityIndicatorTargetActions
{
  [(CSFocusActivityIndicator *)self->_activityIndicator addTarget:self action:sel__handleButtonTouchBegan_ forControlEvents:1];
  [(CSFocusActivityIndicator *)self->_activityIndicator addTarget:self action:sel__handleButtonTouchEnded_ forControlEvents:256];
  [(CSFocusActivityIndicator *)self->_activityIndicator addTarget:self action:sel__handleButtonTouchEnded_ forControlEvents:128];
  activityIndicator = self->_activityIndicator;

  [(CSFocusActivityIndicator *)activityIndicator addTarget:self action:sel__handleButtonPress_ forControlEvents:64];
}

- (void)_removeActivityIndicatorTargetActions
{
  [(CSFocusActivityIndicator *)self->_activityIndicator removeTarget:self action:0 forControlEvents:1];
  [(CSFocusActivityIndicator *)self->_activityIndicator removeTarget:self action:0 forControlEvents:256];
  [(CSFocusActivityIndicator *)self->_activityIndicator removeTarget:self action:0 forControlEvents:128];
  activityIndicator = self->_activityIndicator;

  [(CSFocusActivityIndicator *)activityIndicator removeTarget:self action:0 forControlEvents:64];
}

- (CGRect)_activityIndicatorFrame
{
  if (self->_activityIndicator)
  {
    [(CSFocusActivityView *)self bounds];
    [(CSFocusActivityIndicator *)self->_activityIndicator frame];
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CSFocusActivityViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSFocusActivityViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end