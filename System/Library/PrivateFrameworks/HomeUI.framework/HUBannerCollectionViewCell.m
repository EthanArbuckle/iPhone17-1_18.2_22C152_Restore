@interface HUBannerCollectionViewCell
+ (Class)bannerViewClass;
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (HUBannerView)bannerView;
- (HUBannerViewDelegate)delegate;
- (HUGridCellLayoutOptions)layoutOptions;
- (void)prepareForReuse;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUBannerCollectionViewCell

- (HUBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)HUBannerCollectionViewCell;
  v3 = -[HUBannerCollectionViewCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)[(id)objc_opt_class() bannerViewClass]);
    v5 = [(HUBannerCollectionViewCell *)v3 contentView];
    [v5 bounds];
    uint64_t v6 = objc_msgSend(v4, "initWithFrame:");
    bannerView = v3->_bannerView;
    v3->_bannerView = (HUBannerView *)v6;

    [(HUBannerView *)v3->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(HUBannerCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_bannerView];

    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = [(HUBannerView *)v3->_bannerView leadingAnchor];
    v11 = [(HUBannerCollectionViewCell *)v3 contentView];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v9 addObject:v13];

    v14 = [(HUBannerView *)v3->_bannerView trailingAnchor];
    v15 = [(HUBannerCollectionViewCell *)v3 contentView];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v9 addObject:v17];

    v18 = [(HUBannerView *)v3->_bannerView topAnchor];
    v19 = [(HUBannerCollectionViewCell *)v3 contentView];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v9 addObject:v21];

    v22 = [(HUBannerView *)v3->_bannerView bottomAnchor];
    v23 = [(HUBannerCollectionViewCell *)v3 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v9 addObject:v25];

    [MEMORY[0x1E4F28DC8] activateConstraints:v9];
  }
  return v3;
}

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = [(HUBannerCollectionViewCell *)self bannerView];
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
  v2 = [(HUBannerCollectionViewCell *)self bannerView];
  v3 = [v2 item];

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerCollectionViewCell *)self bannerView];
  [v5 setItem:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUBannerCollectionViewCell *)self bannerView];
  [v4 updateUIWithAnimation:v3];
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setLayoutOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerCollectionViewCell *)self bannerView];
  [v5 setLayoutOptions:v4];
}

- (HUGridCellLayoutOptions)layoutOptions
{
  v2 = [(HUBannerCollectionViewCell *)self bannerView];
  BOOL v3 = [v2 layoutOptions];

  return (HUGridCellLayoutOptions *)v3;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUBannerCollectionViewCell *)self bannerView];
  [v4 setCellContentsHidden:v3];
}

- (BOOL)areCellContentsHidden
{
  v2 = [(HUBannerCollectionViewCell *)self bannerView];
  char v3 = [v2 areCellContentsHidden];

  return v3;
}

- (void)prepareForReuse
{
  char v3 = [(HUBannerCollectionViewCell *)self bannerView];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)HUBannerCollectionViewCell;
  [(HUBannerCollectionViewCell *)&v4 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUBannerCollectionViewCell *)self bannerView];
  [v4 setHighlighted:v3 animated:0];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUBannerCollectionViewCell *)self bannerView];
  [v5 setDelegate:v4];
}

- (HUBannerViewDelegate)delegate
{
  v2 = [(HUBannerCollectionViewCell *)self bannerView];
  BOOL v3 = [v2 delegate];

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