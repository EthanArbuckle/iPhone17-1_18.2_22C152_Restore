@interface HUBannerTableViewCell
+ (Class)bannerViewClass;
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUBannerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUBannerView)bannerView;
- (HUBannerViewDelegate)delegate;
- (HUGridCellLayoutOptions)layoutOptions;
- (void)prepareForReuse;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUBannerTableViewCell

- (HUBannerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)HUBannerTableViewCell;
  v4 = [(HUBannerTableViewCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)[(id)objc_opt_class() bannerViewClass]);
    v6 = [(HUBannerTableViewCell *)v4 contentView];
    [v6 bounds];
    uint64_t v7 = objc_msgSend(v5, "initWithFrame:");
    bannerView = v4->_bannerView;
    v4->_bannerView = (HUBannerView *)v7;

    [(HUBannerView *)v4->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(HUBannerTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_bannerView];

    v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = [(HUBannerView *)v4->_bannerView leadingAnchor];
    v12 = [(HUBannerTableViewCell *)v4 contentView];
    v13 = [v12 leadingAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    [v10 addObject:v14];

    v15 = [(HUBannerView *)v4->_bannerView trailingAnchor];
    v16 = [(HUBannerTableViewCell *)v4 contentView];
    v17 = [v16 trailingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    [v10 addObject:v18];

    v19 = [(HUBannerView *)v4->_bannerView topAnchor];
    v20 = [(HUBannerTableViewCell *)v4 contentView];
    v21 = [v20 topAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v10 addObject:v22];

    v23 = [(HUBannerView *)v4->_bannerView bottomAnchor];
    v24 = [(HUBannerTableViewCell *)v4 contentView];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v10 addObject:v26];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  }
  return v4;
}

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = [(HUBannerTableViewCell *)self bannerView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (HFItem)item
{
  v2 = [(HUBannerTableViewCell *)self bannerView];
  v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerTableViewCell *)self bannerView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUBannerTableViewCell *)self bannerView];
  [v4 updateUIWithAnimation:v3];
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setLayoutOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerTableViewCell *)self bannerView];
  [v5 setLayoutOptions:v4];
}

- (HUGridCellLayoutOptions)layoutOptions
{
  v2 = [(HUBannerTableViewCell *)self bannerView];
  BOOL v3 = [v2 layoutOptions];

  return (HUGridCellLayoutOptions *)v3;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUBannerTableViewCell *)self bannerView];
  [v4 setCellContentsHidden:v3];
}

- (BOOL)areCellContentsHidden
{
  v2 = [(HUBannerTableViewCell *)self bannerView];
  char v3 = [v2 areCellContentsHidden];

  return v3;
}

- (void)prepareForReuse
{
  char v3 = [(HUBannerTableViewCell *)self bannerView];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)HUBannerTableViewCell;
  [(HUBannerTableViewCell *)&v4 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(HUBannerTableViewCell *)self bannerView];
  [v6 setHighlighted:v5 animated:v4];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerTableViewCell *)self bannerView];
  [v5 setDelegate:v4];
}

- (HUBannerViewDelegate)delegate
{
  v2 = [(HUBannerTableViewCell *)self bannerView];
  char v3 = [v2 delegate];

  return (HUBannerViewDelegate *)v3;
}

- (HUBannerView)bannerView
{
  return self->_bannerView;
}

- (void).cxx_destruct
{
}

@end