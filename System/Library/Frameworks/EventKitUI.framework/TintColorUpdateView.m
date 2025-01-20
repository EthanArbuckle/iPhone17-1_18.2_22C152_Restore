@interface TintColorUpdateView
- (EKUITintColorUpdateDelegate)tintColorUpdateDelegate;
- (void)setTintColorUpdateDelegate:(id)a3;
- (void)tintColorDidChange;
@end

@implementation TintColorUpdateView

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)TintColorUpdateView;
  [(TintColorUpdateView *)&v6 tintColorDidChange];
  v3 = [(TintColorUpdateView *)self tintColorUpdateDelegate];

  if (v3)
  {
    v4 = [(TintColorUpdateView *)self tintColorUpdateDelegate];
    v5 = [(TintColorUpdateView *)self tintColor];
    [v4 viewTintColorDidChangeForView:self toColor:v5];
  }
}

- (EKUITintColorUpdateDelegate)tintColorUpdateDelegate
{
  return self->_tintColorUpdateDelegate;
}

- (void)setTintColorUpdateDelegate:(id)a3
{
  self->_tintColorUpdateDelegate = (EKUITintColorUpdateDelegate *)a3;
}

@end