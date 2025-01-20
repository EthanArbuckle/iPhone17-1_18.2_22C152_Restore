@interface CACAssetDownloadingView
- (CACAssetDownloadingView)initWithActivityIndicatorStyle:(int64_t)a3;
- (UIActivityIndicatorView)indicator;
- (UILabel)downloadLabel;
- (void)setDownloadLabel:(id)a3;
- (void)setIndicator:(id)a3;
@end

@implementation CACAssetDownloadingView

- (CACAssetDownloadingView)initWithActivityIndicatorStyle:(int64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CACAssetDownloadingView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[CACAssetDownloadingView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v7)
  {
    v8 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:a3];
    indicator = v7->_indicator;
    v7->_indicator = v8;

    [(UIActivityIndicatorView *)v7->_indicator startAnimating];
    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    downloadLabel = v7->_downloadLabel;
    v7->_downloadLabel = v10;

    v12 = +[UIColor secondaryLabelColor];
    [(UILabel *)v7->_downloadLabel setTextColor:v12];

    v13 = settingsLocString(@"DOWNLOADING", @"CommandAndControlSettings");
    [(UILabel *)v7->_downloadLabel setText:v13];

    v29 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
    [(UILabel *)v7->_downloadLabel setFont:v29];
    [(UILabel *)v7->_downloadLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v7->_downloadLabel setNumberOfLines:0];
    [(UIActivityIndicatorView *)v7->_indicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_downloadLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CACAssetDownloadingView *)v7 addSubview:v7->_indicator];
    [(CACAssetDownloadingView *)v7 addSubview:v7->_downloadLabel];
    v14 = [(CACAssetDownloadingView *)v7 safeAreaLayoutGuide];
    v28 = [(UIActivityIndicatorView *)v7->_indicator trailingAnchor];
    v27 = [v14 trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [(UIActivityIndicatorView *)v7->_indicator centerYAnchor];
    v24 = [v14 centerYAnchor];
    v15 = [v25 constraintEqualToAnchor:v24];
    v31[1] = v15;
    v16 = [(UILabel *)v7->_downloadLabel trailingAnchor];
    v17 = [(UIActivityIndicatorView *)v7->_indicator leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:-8.0];
    v31[2] = v18;
    v19 = [(UILabel *)v7->_downloadLabel centerYAnchor];
    v20 = [v14 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v31[3] = v21;
    v22 = +[NSArray arrayWithObjects:v31 count:4];
    +[NSLayoutConstraint activateConstraints:v22];
  }
  return v7;
}

- (UIActivityIndicatorView)indicator
{
  return self->_indicator;
}

- (void)setIndicator:(id)a3
{
}

- (UILabel)downloadLabel
{
  return self->_downloadLabel;
}

- (void)setDownloadLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadLabel, 0);

  objc_storeStrong((id *)&self->_indicator, 0);
}

@end