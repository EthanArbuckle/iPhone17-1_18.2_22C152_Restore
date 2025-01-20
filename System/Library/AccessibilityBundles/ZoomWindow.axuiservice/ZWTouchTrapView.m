@interface ZWTouchTrapView
- (BOOL)accessibilityActivate;
- (BOOL)enabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (ZWTouchTrapViewDelegate)delegate;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ZWTouchTrapView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(ZWTouchTrapView *)self delegate];
  if (v8
    && (v9 = (void *)v8,
        [(ZWTouchTrapView *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = objc_msgSend(v10, "touchTrapView:shouldReportSelfInHitTestAtLocation:", self, x, y),
        v10,
        v9,
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)ZWTouchTrapView;
    BOOL v12 = -[ZWTouchTrapView pointInside:withEvent:](&v14, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(ZWTouchTrapView *)self delegate];
  if (v8
    && (v9 = (void *)v8,
        [(ZWTouchTrapView *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = objc_msgSend(v10, "touchTrapView:shouldReportSelfInHitTestAtLocation:", self, x, y),
        v10,
        v9,
        v11))
  {
    if (-[ZWTouchTrapView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      BOOL v12 = self;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)ZWTouchTrapView;
      -[ZWTouchTrapView hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
      BOOL v12 = (ZWTouchTrapView *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ZWTouchTrapView *)self delegate];
  [v8 touchTrapView:self didTrapTouches:v7 withEvent:v6];
}

- (BOOL)enabled
{
  v2 = [(ZWTouchTrapView *)self layer];
  unsigned __int8 v3 = [v2 hitTestsAsOpaque];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ZWTouchTrapView *)self layer];
  [v4 setHitTestsAsOpaque:v3];
}

- (id)accessibilityLabel
{
  return ZWLocString(@"ZW_STOP_RESIZING_LABEL");
}

- (id)accessibilityHint
{
  return ZWLocString(@"ZW_STOP_RESIZING_HINT");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(ZWTouchTrapView *)self delegate];

  if (v3)
  {
    id v4 = [(ZWTouchTrapView *)self delegate];
    [v4 touchTrapViewActivated:self];
  }
  return v3 != 0;
}

- (ZWTouchTrapViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWTouchTrapViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end