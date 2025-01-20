@interface _MKStackingContentView
- (NSLayoutConstraint)bottomConstraint;
- (UIView)bottomView;
- (UIView)topView;
- (_MKStackingContentView)initWithViewController:(id)a3;
- (id)vibrancyGroupName;
- (void)setBottomView:(id)a3;
- (void)setTopView:(id)a3;
- (void)updateConstraints;
@end

@implementation _MKStackingContentView

- (_MKStackingContentView)initWithViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKStackingContentView;
  return [(_MKUIViewControllerRootView *)&v4 initWithViewController:a3];
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)updateConstraints
{
  p_topView = (id *)&self->_topView;
  if (!self->_topView && !self->_bottomView) {
    goto LABEL_24;
  }
  topConstraint = self->_topConstraint;
  if (!topConstraint) {
    goto LABEL_9;
  }
  if ([(NSLayoutConstraint *)topConstraint isActive])
  {
    bottomConstraint = self->_bottomConstraint;
    if (bottomConstraint)
    {
      if ([(NSLayoutConstraint *)bottomConstraint isActive]) {
        goto LABEL_24;
      }
    }
  }
  v6 = self->_topConstraint;
  if (!v6 || ![(NSLayoutConstraint *)v6 isActive])
  {
LABEL_9:
    bottomView = (UIView *)*p_topView;
    if (!*p_topView) {
      bottomView = self->_bottomView;
    }
    v8 = [(UIView *)bottomView topAnchor];
    v9 = [(_MKStackingContentView *)self topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v11 = self->_topConstraint;
    self->_topConstraint = v10;

    [(NSLayoutConstraint *)self->_topConstraint setActive:1];
  }
  if (*p_topView)
  {
    v12 = self->_bottomView;
    if (v12)
    {
      if (!self->_middleConstraint)
      {
LABEL_17:
        v13 = [(UIView *)v12 topAnchor];
        v14 = [*p_topView bottomAnchor];
        v15 = [v13 constraintEqualToAnchor:v14];
        middleConstraint = self->_middleConstraint;
        self->_middleConstraint = v15;

        [(NSLayoutConstraint *)self->_middleConstraint setActive:1];
        goto LABEL_18;
      }
      if (![(NSLayoutConstraint *)self->_middleConstraint isActive])
      {
        v12 = self->_bottomView;
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  v17 = self->_bottomConstraint;
  if (!v17 || ![(NSLayoutConstraint *)v17 isActive])
  {
    v18 = self->_bottomView;
    v19 = [(_MKStackingContentView *)self bottomAnchor];
    if (v18) {
      p_bottomView = &self->_bottomView;
    }
    else {
      p_bottomView = (UIView **)p_topView;
    }
    v21 = [(UIView *)*p_bottomView bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    v23 = self->_bottomConstraint;
    self->_bottomConstraint = v22;

    [(NSLayoutConstraint *)self->_bottomConstraint setActive:1];
  }
LABEL_24:
  v24.receiver = self;
  v24.super_class = (Class)_MKStackingContentView;
  [(_MKStackingContentView *)&v24 updateConstraints];
}

- (void)setTopView:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v5 = (UIView *)a3;
  p_topView = &self->_topView;
  topView = self->_topView;
  if (topView != v5)
  {
    v8 = [(UIView *)topView superview];

    if (v8 == self) {
      [(UIView *)*p_topView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_topView, a3);
    if (*p_topView)
    {
      [(UIView *)*p_topView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(_MKStackingContentView *)self addSubview:*p_topView];
      v9 = (void *)MEMORY[0x1E4F28DC8];
      v10 = [(UIView *)*p_topView leftAnchor];
      v11 = [(_MKStackingContentView *)self leftAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v17[0] = v12;
      v13 = [(_MKStackingContentView *)self rightAnchor];
      v14 = [(UIView *)*p_topView rightAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v17[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      [v9 activateConstraints:v16];
    }
    [(NSLayoutConstraint *)self->_topConstraint setActive:0];
    [(NSLayoutConstraint *)self->_middleConstraint setActive:0];
    if (!self->_bottomView) {
      [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
    }
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)setBottomView:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_bottomView = &self->_bottomView;
  v7 = [(UIView *)self->_bottomView superview];

  if (v7 == self) {
    [(UIView *)*p_bottomView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_bottomView, a3);
  if (*p_bottomView)
  {
    [(UIView *)*p_bottomView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKStackingContentView *)self addSubview:*p_bottomView];
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(UIView *)*p_bottomView leftAnchor];
    v10 = [(_MKStackingContentView *)self leftAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v16[0] = v11;
    v12 = [(_MKStackingContentView *)self rightAnchor];
    v13 = [(UIView *)*p_bottomView rightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v16[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v8 activateConstraints:v15];
  }
  [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_middleConstraint setActive:0];
  if (!self->_topView) {
    [(NSLayoutConstraint *)self->_topConstraint setActive:0];
  }
  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (id)vibrancyGroupName
{
  return (id)[NSString stringWithFormat:@"<%@: %p> Vibrancy Group", objc_opt_class(), self];
}

- (UIView)topView
{
  return self->_topView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_middleConstraint, 0);

  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end