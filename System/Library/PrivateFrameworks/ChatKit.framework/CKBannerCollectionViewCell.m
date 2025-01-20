@interface CKBannerCollectionViewCell
+ (id)reuseIdentifier;
- (CKBannerCollectionViewCell)init;
- (CKBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)bannerView;
- (void)configureWithEntity:(id)a3;
- (void)layoutSubviews;
- (void)setBannerView:(id)a3;
@end

@implementation CKBannerCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKBannerCollectionViewCell_reuseIdentifier";
}

- (CKBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKBannerCollectionViewCell;
  v3 = -[CKBannerCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    bannerView = v3->_bannerView;
    v3->_bannerView = v4;

    [(UIImageView *)v3->_bannerView setContentMode:1];
    [(UIImageView *)v3->_bannerView setClipsToBounds:1];
    v6 = [(CKBannerCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_bannerView];
  }
  return v3;
}

- (CKBannerCollectionViewCell)init
{
  return -[CKBannerCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CKBannerCollectionViewCell;
  [(CKBannerCollectionViewCell *)&v20 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 businessBannerSize];
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = [(CKBannerCollectionViewCell *)self contentView];
  [v8 bounds];
  double v10 = fmin(v5, v9);
  double v12 = fmin(v7, v11);

  v13 = [(CKBannerCollectionViewCell *)self contentView];
  [v13 bounds];
  double v15 = v14 * 0.5 - v10 * 0.5;
  v16 = [(CKBannerCollectionViewCell *)self contentView];
  [v16 bounds];
  double v18 = v17 * 0.5 - v12 * 0.5;
  v19 = [(CKBannerCollectionViewCell *)self bannerView];
  objc_msgSend(v19, "setFrame:", v15, v18, v10, v12);
}

- (void)configureWithEntity:(id)a3
{
  id v4 = a3;
  id v13 = [(CKBannerCollectionViewCell *)self bannerView];
  double v5 = [v4 defaultIMHandle];

  double v6 = [v5 brandWideLogoImageData];

  double v7 = [v13 image];

  if (v6) {
    objc_super v8 = @"bannerImage";
  }
  else {
    objc_super v8 = 0;
  }
  [v13 setAccessibilityIdentifier:v8];
  if (v6 && !v7)
  {
    double v9 = (void *)MEMORY[0x1E4F42A80];
    double v10 = [v5 brandWideLogoImageData];
    double v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 scale];
    double v12 = objc_msgSend(v9, "imageWithData:scale:", v10);

    [v13 setImage:v12];
  }
}

- (UIImageView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end