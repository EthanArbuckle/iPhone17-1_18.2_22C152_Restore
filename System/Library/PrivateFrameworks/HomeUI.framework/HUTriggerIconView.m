@interface HUTriggerIconView
- (CGSize)intrinsicContentSize;
- (HUIconView)iconView;
- (HUTriggerIconView)initWithIconDescriptor:(id)a3;
- (NSArray)constraints;
- (void)layoutSubviews;
- (void)setConstraints:(id)a3;
- (void)setIconView:(id)a3;
@end

@implementation HUTriggerIconView

- (HUTriggerIconView)initWithIconDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerIconView;
  v5 = [(HUTriggerIconView *)&v11 init];
  if (v5)
  {
    v6 = (HUIconView *)objc_alloc_init(MEMORY[0x1E4F6A428]);
    iconView = v5->_iconView;
    v5->_iconView = v6;

    [(HUIconView *)v5->_iconView setIconSize:3];
    v8 = [v4 identifier];
    char v9 = [v8 isEqualToString:@"HFImageIconIdentifierSeparatorArrow"];

    if ((v9 & 1) == 0) {
      [(HUIconView *)v5->_iconView setContentMode:1];
    }
    [(HUIconView *)v5->_iconView updateWithIconDescriptor:v4 displayStyle:1 animated:0];
    [(HUTriggerIconView *)v5 addSubview:v5->_iconView];
  }

  return v5;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerIconView;
  [(HUTriggerIconView *)&v12 layoutSubviews];
  [(HUTriggerIconView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(HUTriggerIconView *)self iconView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUTriggerIconView *)self iconView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end