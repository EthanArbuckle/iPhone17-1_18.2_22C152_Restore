@interface FM_Workaround_30408319_Button
- (NSLayoutConstraint)fm_workaround_height_constraint;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setFm_workaround_height_constraint:(id)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation FM_Workaround_30408319_Button

- (void)updateConstraints
{
  [(FM_Workaround_30408319_Button *)self contentEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(FM_Workaround_30408319_Button *)self fm_workaround_height_constraint];

  if (!v11)
  {
    v12 = [(FM_Workaround_30408319_Button *)self heightAnchor];
    [(FM_Workaround_30408319_Button *)self bounds];
    v14 = [v12 constraintEqualToConstant:v13];
    [(FM_Workaround_30408319_Button *)self setFm_workaround_height_constraint:v14];

    v15 = [(FM_Workaround_30408319_Button *)self fm_workaround_height_constraint];
    [v15 setIdentifier:@"fm_workaround_height_constraint"];

    v16 = [(FM_Workaround_30408319_Button *)self fm_workaround_height_constraint];
    LODWORD(v17) = 1144750080;
    [v16 setPriority:v17];

    v18 = [(FM_Workaround_30408319_Button *)self fm_workaround_height_constraint];
    [v18 setActive:1];
  }
  [(FM_Workaround_30408319_Button *)self bounds];
  double v20 = v19 - (v6 + v10);
  v21 = [(FM_Workaround_30408319_Button *)self titleLabel];
  objc_msgSend(v21, "sizeThatFits:", v20, 1.79769313e308);
  double v23 = v22;

  v24 = [(FM_Workaround_30408319_Button *)self fm_workaround_height_constraint];
  [v24 setConstant:v8 + v4 + v23];

  v25.receiver = self;
  v25.super_class = (Class)FM_Workaround_30408319_Button;
  [(FM_Workaround_30408319_Button *)&v25 updateConstraints];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  [(FM_Workaround_30408319_Button *)&v6 setTitle:a3 forState:a4];
  double v5 = [(FM_Workaround_30408319_Button *)self titleLabel];
  [v5 invalidateIntrinsicContentSize];
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  [(FM_Workaround_30408319_Button *)&v6 setAttributedTitle:a3 forState:a4];
  double v5 = [(FM_Workaround_30408319_Button *)self titleLabel];
  [v5 invalidateIntrinsicContentSize];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(FM_Workaround_30408319_Button *)self titleLabel];
  [v5 invalidateIntrinsicContentSize];

  [(FM_Workaround_30408319_Button *)self invalidateIntrinsicContentSize];
  [(FM_Workaround_30408319_Button *)self setNeedsLayout];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__FM_Workaround_30408319_Button_traitCollectionDidChange___block_invoke;
  block[3] = &unk_264335110;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  [(FM_Workaround_30408319_Button *)&v6 traitCollectionDidChange:v4];
}

- (NSLayoutConstraint)fm_workaround_height_constraint
{
  return self->_fm_workaround_height_constraint;
}

- (void)setFm_workaround_height_constraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end