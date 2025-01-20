@interface _HUQuickControlSingleControlHostView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hasSingleControlView;
- (HULayoutAnchorProviding)preferredFrameLayoutGuide;
- (NAUILayoutConstraintSet)constraintSet;
- (UIView)contentView;
- (_HUQuickControlSingleControlHostView)initWithContentView:(id)a3;
- (void)_setupConstraintSet;
- (void)didMoveToWindow;
- (void)setPreferredFrameLayoutGuide:(id)a3;
- (void)updateConstraints;
@end

@implementation _HUQuickControlSingleControlHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (_HUQuickControlSingleControlHostView)initWithContentView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HUQuickControlSingleControlHostView;
  v6 = [(_HUQuickControlSingleControlHostView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    [(UIView *)v7->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_HUQuickControlSingleControlHostView *)v7 addSubview:v5];
    [(_HUQuickControlSingleControlHostView *)v7 _setupConstraintSet];
  }

  return v7;
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  if (self->_preferredFrameLayoutGuide) {
    self = (_HUQuickControlSingleControlHostView *)self->_preferredFrameLayoutGuide;
  }
  return (HULayoutAnchorProviding *)self;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  id v8 = a3;
  id v5 = [(_HUQuickControlSingleControlHostView *)self preferredFrameLayoutGuide];
  char v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, a3);
    v7 = [(_HUQuickControlSingleControlHostView *)self constraintSet];
    [v7 invalidate];
  }
}

- (BOOL)hasSingleControlView
{
  return 1;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_HUQuickControlSingleControlHostView;
  [(_HUQuickControlSingleControlHostView *)&v4 didMoveToWindow];
  v3 = [(_HUQuickControlSingleControlHostView *)self constraintSet];
  [v3 invalidate];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)_HUQuickControlSingleControlHostView;
  [(_HUQuickControlSingleControlHostView *)&v4 updateConstraints];
  v3 = [(_HUQuickControlSingleControlHostView *)self constraintSet];
  [v3 activateIfNeeded];
}

- (void)_setupConstraintSet
{
  v3 = (NAUILayoutConstraintSet *)[objc_alloc(MEMORY[0x1E4F7A100]) initWithOwningView:self constraintBuilder:&__block_literal_global_249];
  constraintSet = self->_constraintSet;
  self->_constraintSet = v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
}

@end