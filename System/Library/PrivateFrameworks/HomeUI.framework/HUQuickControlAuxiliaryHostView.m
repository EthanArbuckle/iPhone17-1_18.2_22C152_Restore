@interface HUQuickControlAuxiliaryHostView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (HUQuickControlAuxiliaryView)auxiliaryView;
- (void)setAuxiliaryView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUQuickControlAuxiliaryHostView

- (void)setAuxiliaryView:(id)a3
{
  v5 = (HUQuickControlAuxiliaryView *)a3;
  p_auxiliaryView = &self->_auxiliaryView;
  auxiliaryView = self->_auxiliaryView;
  if (auxiliaryView != v5)
  {
    v8 = v5;
    [(HUQuickControlAuxiliaryView *)auxiliaryView removeFromSuperview];
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    [(HUQuickControlAuxiliaryView *)*p_auxiliaryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUQuickControlAuxiliaryHostView *)self addSubview:*p_auxiliaryView];
    [(HUQuickControlAuxiliaryHostView *)self setNeedsUpdateConstraints];
    v5 = v8;
  }
}

- (void)updateConstraints
{
  v3 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];

  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
    v6 = [v5 centerXAnchor];
    v7 = [(HUQuickControlAuxiliaryHostView *)self centerXAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [v4 addObject:v8];

    v9 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
    v10 = [v9 centerYAnchor];
    v11 = [(HUQuickControlAuxiliaryHostView *)self centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v4 addObject:v12];

    v13 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
    v14 = [v13 widthAnchor];
    v15 = [(HUQuickControlAuxiliaryHostView *)self widthAnchor];
    LODWORD(v16) = 1132134400;
    v17 = objc_msgSend(v14, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v15, v16);
    [v4 addObjectsFromArray:v17];

    v18 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
    v19 = [v18 heightAnchor];
    v20 = [(HUQuickControlAuxiliaryHostView *)self heightAnchor];
    LODWORD(v21) = 1132134400;
    v22 = objc_msgSend(v19, "hu_constraintsLessThanOrEqualToAnchor:equalityPriority:", v20, v21);
    [v4 addObjectsFromArray:v22];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlAuxiliaryHostView;
  [(HUQuickControlAuxiliaryHostView *)&v23 updateConstraints];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
  v9 = [(HUQuickControlAuxiliaryHostView *)self auxiliaryView];
  -[HUQuickControlAuxiliaryHostView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  LOBYTE(self) = objc_msgSend(v8, "pointInside:withEvent:", v7);

  return (char)self;
}

- (HUQuickControlAuxiliaryView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (void).cxx_destruct
{
}

@end