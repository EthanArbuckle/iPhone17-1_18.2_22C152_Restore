@interface WDSourcesListTableViewCell
- (HKSourceDataModel)sourceModel;
- (UIImageView)iconImage;
- (UILabel)titleLabel;
- (WDSourcesListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 fetchError:(id)a5;
- (void)prepareForReuse;
- (void)setIconImage:(id)a3;
- (void)setSourceModel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpSubviews;
- (void)setupConstraints;
@end

@implementation WDSourcesListTableViewCell

- (WDSourcesListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDSourcesListTableViewCell;
  v4 = [(WDSourcesListTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDSourcesListTableViewCell *)v4 setUpSubviews];
    [(WDSourcesListTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)prepareForReuse
{
  [(WDSourcesListTableViewCell *)self setSourceModel:0];
  v3.receiver = self;
  v3.super_class = (Class)WDSourcesListTableViewCell;
  [(WDSourcesListTableViewCell *)&v3 prepareForReuse];
}

- (void)setUpSubviews
{
  objc_super v3 = [MEMORY[0x263F1C550] secondarySystemGroupedBackgroundColor];
  [(WDSourcesListTableViewCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [(WDSourcesListTableViewCell *)self setIconImage:v4];

  v5 = [(WDSourcesListTableViewCell *)self iconImage];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(WDSourcesListTableViewCell *)self iconImage];
  [v6 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  objc_super v7 = [(WDSourcesListTableViewCell *)self iconImage];
  [v7 setContentMode:2];

  v8 = [(WDSourcesListTableViewCell *)self contentView];
  v9 = [(WDSourcesListTableViewCell *)self iconImage];
  [v8 addSubview:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(WDSourcesListTableViewCell *)self setTitleLabel:v10];

  v11 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  v12 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v12 setFont:v11];

  v13 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v13 setAdjustsFontForContentSizeCategory:1];

  v14 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v14 setTextAlignment:4];

  v15 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v15 setNumberOfLines:0];

  v16 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v18 = [(WDSourcesListTableViewCell *)self contentView];
  v17 = [(WDSourcesListTableViewCell *)self titleLabel];
  [v18 addSubview:v17];
}

- (void)setupConstraints
{
  objc_super v3 = [(WDSourcesListTableViewCell *)self iconImage];
  id v4 = [v3 leadingAnchor];
  v5 = [(WDSourcesListTableViewCell *)self contentView];
  v6 = [v5 leadingAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6 constant:16.0];
  [v7 setActive:1];

  v8 = [(WDSourcesListTableViewCell *)self iconImage];
  v9 = [v8 widthAnchor];
  id v10 = [v9 constraintEqualToConstant:29.0];
  [v10 setActive:1];

  v11 = [(WDSourcesListTableViewCell *)self iconImage];
  v12 = [v11 heightAnchor];
  v13 = [v12 constraintEqualToConstant:29.0];
  [v13 setActive:1];

  v14 = [(WDSourcesListTableViewCell *)self iconImage];
  v15 = [v14 centerYAnchor];
  v16 = [(WDSourcesListTableViewCell *)self contentView];
  v17 = [v16 centerYAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(WDSourcesListTableViewCell *)self titleLabel];
  v20 = [v19 leadingAnchor];
  v21 = [(WDSourcesListTableViewCell *)self iconImage];
  v22 = [v21 trailingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:16.0];
  [v23 setActive:1];

  v24 = [(WDSourcesListTableViewCell *)self titleLabel];
  v25 = [v24 topAnchor];
  v26 = [(WDSourcesListTableViewCell *)self contentView];
  v27 = [v26 topAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:16.0];
  [v28 setActive:1];

  v29 = [(WDSourcesListTableViewCell *)self titleLabel];
  v30 = [v29 trailingAnchor];
  v31 = [(WDSourcesListTableViewCell *)self contentView];
  v32 = [v31 trailingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32 constant:-16.0];
  [v33 setActive:1];

  v34 = [(WDSourcesListTableViewCell *)self titleLabel];
  v35 = [v34 bottomAnchor];
  v36 = [(WDSourcesListTableViewCell *)self contentView];
  v37 = [v36 bottomAnchor];
  v38 = [v35 constraintLessThanOrEqualToAnchor:v37 constant:-16.0];
  [v38 setActive:1];

  -[WDSourcesListTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 61.0, 0.0, 0.0);
}

- (void)setSourceModel:(id)a3
{
  v5 = (HKSourceDataModel *)a3;
  if (self->_sourceModel != v5)
  {
    objc_storeStrong((id *)&self->_sourceModel, a3);
    if (v5)
    {
      v6 = [(HKSourceDataModel *)v5 source];
      if ([v6 _isConnectedGymSource]) {
        HKConnectedGymSourceName();
      }
      else {
      v9 = [v6 name];
      }
      id v10 = [(WDSourcesListTableViewCell *)self titleLabel];
      [v10 setText:v9];

      v11 = [(HKSourceDataModel *)v5 icon];

      if (v11)
      {
        v12 = [(HKSourceDataModel *)v5 icon];
        v13 = [(WDSourcesListTableViewCell *)self iconImage];
        [v13 setImage:v12];
      }
      else
      {
        objc_initWeak(&location, self);
        v14 = [MEMORY[0x263F463C8] sharedImageManager];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke;
        v22[3] = &unk_26458DBD0;
        v22[4] = self;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_2;
        v19[3] = &unk_26458F068;
        objc_copyWeak(&v21, &location);
        id v20 = v6;
        [v14 loadIconForSource:v20 syncHandler:v22 asyncHandler:v19];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      v15 = (void *)*MEMORY[0x263F46388];
      v16 = [(WDSourcesListTableViewCell *)self titleLabel];
      v17 = [v16 text];
      id v18 = [v15 stringByAppendingFormat:@".Source.%@", v17];
      [(WDSourcesListTableViewCell *)self setAccessibilityIdentifier:v18];
    }
    else
    {
      objc_super v7 = [(WDSourcesListTableViewCell *)self titleLabel];
      [v7 setText:0];

      v8 = [(WDSourcesListTableViewCell *)self iconImage];
      [v8 setImage:0];
    }
  }
}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconImage];
  [v4 setImage:v3];
}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_3;
  v9[3] = &unk_26458F040;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __45__WDSourcesListTableViewCell_setSourceModel___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleReturnedImage:*(void *)(a1 + 32) forSource:*(void *)(a1 + 40) fetchError:*(void *)(a1 + 48)];
}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 fetchError:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14)
  {
    if (!v9)
    {
      id v10 = [(WDSourcesListTableViewCell *)self sourceModel];
      id v11 = [v10 source];
      int v12 = [v8 isEqual:v11];

      if (v12)
      {
        id v13 = [(WDSourcesListTableViewCell *)self iconImage];
        [v13 setImage:v14];
      }
    }
  }
}

- (HKSourceDataModel)sourceModel
{
  return self->_sourceModel;
}

- (UIImageView)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);

  objc_storeStrong((id *)&self->_sourceModel, 0);
}

@end