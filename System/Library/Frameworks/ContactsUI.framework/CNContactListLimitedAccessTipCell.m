@interface CNContactListLimitedAccessTipCell
- (CNContactListLimitedAccessTipCell)initWithFrame:(CGRect)a3;
- (CNContactListLimitedAccessTipCellDelegate)delegate;
- (CNContactListLimitedAccessTipView)limitedAccessTipView;
- (CNContactListStyleApplier)contactListStyleApplier;
- (void)limitedAccessTipViewDidTapDismiss:(id)a3;
- (void)setContactListStyleApplier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLimitedAccessTipView:(id)a3;
- (void)updateWithAppName:(id)a3 isLimited:(BOOL)a4;
@end

@implementation CNContactListLimitedAccessTipCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessTipView, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLimitedAccessTipView:(id)a3
{
}

- (CNContactListLimitedAccessTipView)limitedAccessTipView
{
  return self->_limitedAccessTipView;
}

- (void)setContactListStyleApplier:(id)a3
{
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListLimitedAccessTipCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListLimitedAccessTipCellDelegate *)WeakRetained;
}

- (void)limitedAccessTipViewDidTapDismiss:(id)a3
{
  id v4 = [(CNContactListLimitedAccessTipCell *)self delegate];
  [v4 limitedAccessTipCellDidTapDismiss:self];
}

- (void)updateWithAppName:(id)a3 isLimited:(BOOL)a4
{
  BOOL v4 = a4;
  v44[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CNContactListLimitedAccessTipCell *)self setContentConfiguration:0];
  [(CNContactListLimitedAccessTipCell *)self setAccessories:MEMORY[0x1E4F1CBF0]];
  v7 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];

  if (!v7)
  {
    v8 = [[CNContactListLimitedAccessTipView alloc] initWithAppName:v6 isLimited:v4];
    [(CNContactListLimitedAccessTipCell *)self setLimitedAccessTipView:v8];

    v9 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    [v10 setDelegate:self];
  }
  v11 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
  v12 = [v11 superview];

  if (!v12)
  {
    id v43 = v6;
    v13 = [(CNContactListLimitedAccessTipCell *)self contentView];
    v14 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    [v13 addSubview:v14];

    v15 = [(CNContactListLimitedAccessTipCell *)self contactListStyleApplier];
    char v16 = [v15 usesInsetPlatterStyle];
    v17 = [(CNContactListLimitedAccessTipCell *)self contentView];
    v18 = v17;
    if (v16)
    {
      uint64_t v19 = [v17 trailingAnchor];
    }
    else
    {
      v20 = [v17 layoutMarginsGuide];
      uint64_t v19 = [v20 trailingAnchor];
    }
    v31 = (void *)v19;

    v34 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    v39 = [v42 leadingAnchor];
    v41 = [(CNContactListLimitedAccessTipCell *)self contentView];
    v40 = [v41 layoutMarginsGuide];
    v38 = [v40 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:7.0];
    v44[0] = v37;
    v36 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    v35 = [v36 trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v19 constant:-7.0];
    v44[1] = v33;
    v32 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    v21 = [v32 topAnchor];
    v22 = [(CNContactListLimitedAccessTipCell *)self contentView];
    v23 = [v22 topAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v44[2] = v24;
    v25 = [(CNContactListLimitedAccessTipCell *)self limitedAccessTipView];
    v26 = [v25 bottomAnchor];
    v27 = [(CNContactListLimitedAccessTipCell *)self contentView];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v44[3] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    [v34 activateConstraints:v30];

    id v6 = v43;
  }
}

- (CNContactListLimitedAccessTipCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactListLimitedAccessTipCell;
  v3 = -[CNContactListLimitedAccessTipCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end