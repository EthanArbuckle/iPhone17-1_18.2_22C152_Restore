@interface CNSharedProfileBannerCell
- (CNSharedProfileBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNSharedProfileBannerView)sharedProfileBannerContentView;
- (CNSharedProfileBannerViewDelegate)delegate;
- (double)minCellHeight;
- (id)variableConstraints;
- (void)setDelegate:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setSharedProfileBannerContentView:(id)a3;
- (void)setUpView;
- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5;
- (void)updateConstraints;
@end

@implementation CNSharedProfileBannerCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContentView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSharedProfileBannerContentView:(id)a3
{
}

- (CNSharedProfileBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharedProfileBannerViewDelegate *)WeakRetained;
}

- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
  [v9 setUpWithSharedProfileStateOracle:v8 tappedAction:a4 hasPerformedAnimation:v5];
}

- (double)minCellHeight
{
  return 60.0;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CNSharedProfileBannerCell;
  [(CNContactCell *)&v4 updateConstraints];
  v3 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
  [v3 updateConstraints];
}

- (id)variableConstraints
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];

  if (v3)
  {
    v27 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
    v25 = [v27 leadingAnchor];
    v26 = [(CNSharedProfileBannerCell *)self contentView];
    v24 = [v26 layoutMarginsGuide];
    v23 = [v24 leadingAnchor];
    v22 = [v25 constraintEqualToAnchor:v23];
    v28[0] = v22;
    v21 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
    v19 = [v21 trailingAnchor];
    v20 = [(CNSharedProfileBannerCell *)self contentView];
    v18 = [v20 layoutMarginsGuide];
    v17 = [v18 trailingAnchor];
    v16 = [v19 constraintEqualToAnchor:v17];
    v28[1] = v16;
    v15 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
    objc_super v4 = [v15 topAnchor];
    BOOL v5 = [(CNSharedProfileBannerCell *)self contentView];
    v6 = [v5 topAnchor];
    v7 = [v4 constraintEqualToAnchor:v6];
    v28[2] = v7;
    id v8 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
    id v9 = [v8 bottomAnchor];
    v10 = [(CNSharedProfileBannerCell *)self contentView];
    v11 = [v10 bottomAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v28[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (void)setLabelTextAttributes:(id)a3
{
  id v7 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  objc_super v4 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
  BOOL v5 = [v4 style];

  [v5 setTitleFont:v7];
  [v5 setSubtitleFont:v7];
  v6 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
  [v6 setStyle:v5];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CNSharedProfileBannerView *)self->_sharedProfileBannerContentView setDelegate:obj];
  }
}

- (CNSharedProfileBannerView)sharedProfileBannerContentView
{
  sharedProfileBannerContentView = self->_sharedProfileBannerContentView;
  if (!sharedProfileBannerContentView)
  {
    objc_super v4 = objc_alloc_init(CNSharedProfileBannerView);
    BOOL v5 = self->_sharedProfileBannerContentView;
    self->_sharedProfileBannerContentView = v4;

    [(CNSharedProfileBannerView *)self->_sharedProfileBannerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(CNSharedProfileBannerCell *)self delegate];
    [(CNSharedProfileBannerView *)self->_sharedProfileBannerContentView setDelegate:v6];

    sharedProfileBannerContentView = self->_sharedProfileBannerContentView;
  }

  return sharedProfileBannerContentView;
}

- (void)setUpView
{
  id v4 = [(CNSharedProfileBannerCell *)self contentView];
  v3 = [(CNSharedProfileBannerCell *)self sharedProfileBannerContentView];
  [v4 addSubview:v3];
}

- (CNSharedProfileBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNSharedProfileBannerCell;
  id v4 = [(CNContactCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  BOOL v5 = v4;
  if (v4)
  {
    [(CNSharedProfileBannerCell *)v4 setUpView];
    v6 = v5;
  }

  return v5;
}

@end