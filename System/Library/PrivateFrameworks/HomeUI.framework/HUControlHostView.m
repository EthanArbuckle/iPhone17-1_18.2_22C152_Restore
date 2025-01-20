@interface HUControlHostView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)requiresWellDefinedSize;
- (HUControlHostView)initWithControlView:(id)a3;
- (NSArray)controlConstraints;
- (UIView)controlView;
- (void)setControlConstraints:(id)a3;
- (void)setControlView:(id)a3;
- (void)setRequiresWellDefinedSize:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HUControlHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUControlHostView)initWithControlView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUControlHostView;
  v5 = [(HUControlHostView *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUControlHostView *)v5 setControlView:v4];
  }

  return v6;
}

- (void)setControlView:(id)a3
{
  v5 = (UIView *)a3;
  p_controlView = &self->_controlView;
  controlView = self->_controlView;
  if (controlView != v5)
  {
    objc_super v8 = v5;
    [(UIView *)controlView removeFromSuperview];
    objc_storeStrong((id *)&self->_controlView, a3);
    [(UIView *)*p_controlView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)*p_controlView setPreservesSuperviewLayoutMargins:1];
    [(HUControlHostView *)self addSubview:*p_controlView];
    [(HUControlHostView *)self setNeedsUpdateConstraints];
    v5 = v8;
  }
}

- (void)setRequiresWellDefinedSize:(BOOL)a3
{
  if (self->_requiresWellDefinedSize != a3)
  {
    self->_requiresWellDefinedSize = a3;
    [(HUControlHostView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Inside HUControlHostView::updateConstraints", buf, 2u);
  }

  id v4 = [(HUControlHostView *)self controlConstraints];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(HUControlHostView *)self controlConstraints];
    [v5 deactivateConstraints:v6];

    [(HUControlHostView *)self setControlConstraints:0];
  }
  v7 = [(HUControlHostView *)self controlView];

  if (v7)
  {
    objc_super v8 = objc_opt_new();
    v9 = [(HUControlHostView *)self controlView];
    v10 = [v9 centerXAnchor];
    v11 = [(HUControlHostView *)self centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v8 addObject:v12];

    v13 = [(HUControlHostView *)self controlView];
    v14 = [v13 centerYAnchor];
    v15 = [(HUControlHostView *)self centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v8 addObject:v16];

    v17 = [(HUControlHostView *)self controlView];
    v18 = [v17 widthAnchor];
    v19 = [(HUControlHostView *)self widthAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];

    if ([(HUControlHostView *)self requiresWellDefinedSize]) {
      *(float *)&double v21 = 1000.0;
    }
    else {
      *(float *)&double v21 = 251.0;
    }
    [v20 setPriority:v21];
    [v8 addObject:v20];
    v22 = [(HUControlHostView *)self controlView];
    v23 = [v22 heightAnchor];
    v24 = [(HUControlHostView *)self heightAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];

    if ([(HUControlHostView *)self requiresWellDefinedSize]) {
      *(float *)&double v26 = 1000.0;
    }
    else {
      *(float *)&double v26 = 251.0;
    }
    [v25 setPriority:v26];
    [v8 addObject:v25];
    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    [(HUControlHostView *)self setControlConstraints:v8];
  }
  v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "super.updateConstraints in HUControlHostView::updateConstraints", buf, 2u);
  }

  v28.receiver = self;
  v28.super_class = (Class)HUControlHostView;
  [(HUControlHostView *)&v28 updateConstraints];
}

- (BOOL)requiresWellDefinedSize
{
  return self->_requiresWellDefinedSize;
}

- (UIView)controlView
{
  return self->_controlView;
}

- (NSArray)controlConstraints
{
  return self->_controlConstraints;
}

- (void)setControlConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlConstraints, 0);

  objc_storeStrong((id *)&self->_controlView, 0);
}

@end