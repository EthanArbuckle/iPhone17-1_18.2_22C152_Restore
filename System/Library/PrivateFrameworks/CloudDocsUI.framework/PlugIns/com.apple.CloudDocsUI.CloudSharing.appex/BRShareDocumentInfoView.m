@interface BRShareDocumentInfoView
- (BOOL)compactMode;
- (BRShareDocumentInfoView)initWithFrame:(CGRect)a3;
- (BRShareFittingImageView)thumbnailView;
- (NSLayoutConstraint)thumbnailHeightConstraint;
- (UILabel)infoTextLabel;
- (UILabel)itemTitleLabel;
- (UILabel)ownerLabel;
- (UILabel)titleLabel;
- (void)setCompactMode:(BOOL)a3;
- (void)setThumbnailView:(id)a3;
@end

@implementation BRShareDocumentInfoView

- (BRShareDocumentInfoView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)BRShareDocumentInfoView;
  v3 = -[BRShareDocumentInfoView initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BRShareDocumentInfoView *)v3 setAlignment:3];
    [(BRShareDocumentInfoView *)v4 setDistribution:0];
    [(BRShareDocumentInfoView *)v4 setAxis:1];
    [(BRShareDocumentInfoView *)v4 setLayoutMarginsRelativeArrangement:1];
    -[BRShareDocumentInfoView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    v5 = +[NSMutableArray array];
    UIFontDescriptorTraitKey v44 = UIFontWeightTrait;
    v6 = +[NSNumber numberWithDouble:UIFontWeightBold];
    v45 = v6;
    v36 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];

    v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
    UIFontDescriptorAttributeName v42 = UIFontDescriptorTraitsAttribute;
    v43 = v36;
    v8 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v35 = [v7 fontDescriptorByAddingAttributes:v8];

    uint64_t v9 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v9;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    v11 = +[UIFont fontWithDescriptor:v35 size:0.0];
    [(UILabel *)v4->_titleLabel setFont:v11];

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_titleLabel setText:@" "];
    [(BRShareDocumentInfoView *)v4 addArrangedSubview:v4->_titleLabel];
    uint64_t v12 = objc_opt_new();
    infoTextLabel = v4->_infoTextLabel;
    v4->_infoTextLabel = (UILabel *)v12;

    [(UILabel *)v4->_infoTextLabel setNumberOfLines:0];
    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_infoTextLabel setFont:v14];

    [(UILabel *)v4->_infoTextLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_infoTextLabel setTextAlignment:1];
    [(UILabel *)v4->_infoTextLabel setText:@" "];
    [(BRShareDocumentInfoView *)v4 addArrangedSubview:v4->_infoTextLabel];
    uint64_t v15 = objc_opt_new();
    thumbnailView = v4->_thumbnailView;
    v4->_thumbnailView = (BRShareFittingImageView *)v15;

    [(BRShareFittingImageView *)v4->_thumbnailView setContentMode:1];
    [(BRShareFittingImageView *)v4->_thumbnailView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(BRShareFittingImageView *)v4->_thumbnailView heightAnchor];
    uint64_t v18 = [v17 constraintEqualToConstant:110.0];
    thumbnailHeightConstraint = v4->_thumbnailHeightConstraint;
    v4->_thumbnailHeightConstraint = (NSLayoutConstraint *)v18;

    LODWORD(v20) = 1144586240;
    [(NSLayoutConstraint *)v4->_thumbnailHeightConstraint setPriority:v20];
    [v5 addObject:v4->_thumbnailHeightConstraint];
    [(BRShareDocumentInfoView *)v4 addArrangedSubview:v4->_thumbnailView];
    UIFontDescriptorTraitKey v40 = UIFontWeightTrait;
    v21 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
    v41 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

    v23 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
    UIFontDescriptorAttributeName v38 = UIFontDescriptorTraitsAttribute;
    v39 = v22;
    v24 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v25 = [v23 fontDescriptorByAddingAttributes:v24];

    uint64_t v26 = objc_opt_new();
    itemTitleLabel = v4->_itemTitleLabel;
    v4->_itemTitleLabel = (UILabel *)v26;

    [(UILabel *)v4->_itemTitleLabel setNumberOfLines:0];
    [v25 pointSize];
    v28 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v25);
    [(UILabel *)v4->_itemTitleLabel setFont:v28];

    [(UILabel *)v4->_itemTitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_itemTitleLabel setTextAlignment:1];
    [(UILabel *)v4->_itemTitleLabel setText:@" "];
    [(BRShareDocumentInfoView *)v4 addArrangedSubview:v4->_itemTitleLabel];
    uint64_t v29 = objc_opt_new();
    ownerLabel = v4->_ownerLabel;
    v4->_ownerLabel = (UILabel *)v29;

    [(UILabel *)v4->_ownerLabel setNumberOfLines:0];
    v31 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v4->_ownerLabel setFont:v31];

    [(UILabel *)v4->_ownerLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_ownerLabel setTextAlignment:1];
    [(UILabel *)v4->_ownerLabel setLineBreakMode:5];
    [(UILabel *)v4->_ownerLabel setText:@" "];
    v32 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_ownerLabel setTextColor:v32];

    [(BRShareDocumentInfoView *)v4 addArrangedSubview:v4->_ownerLabel];
    v33 = +[UIColor clearColor];
    [(BRShareDocumentInfoView *)v4 setBackgroundColor:v33];

    +[NSLayoutConstraint activateConstraints:v5];
  }
  return v4;
}

- (void)setCompactMode:(BOOL)a3
{
  self->_compactMode = a3;
  double v4 = 20.0;
  if (a3)
  {
    double v4 = 16.0;
    double v5 = 10.0;
  }
  else
  {
    double v5 = 12.0;
  }
  if (a3) {
    double v6 = 75.0;
  }
  else {
    double v6 = 110.0;
  }
  if (a3) {
    double v7 = 4.0;
  }
  else {
    double v7 = 6.0;
  }
  [(BRShareDocumentInfoView *)self setCustomSpacing:self->_titleLabel afterView:v4];
  [(BRShareDocumentInfoView *)self setCustomSpacing:self->_infoTextLabel afterView:v5];
  [(BRShareDocumentInfoView *)self setCustomSpacing:self->_thumbnailView afterView:v5];
  [(NSLayoutConstraint *)self->_thumbnailHeightConstraint setConstant:v6];
  itemTitleLabel = self->_itemTitleLabel;

  [(BRShareDocumentInfoView *)self setCustomSpacing:itemTitleLabel afterView:v7];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)infoTextLabel
{
  return self->_infoTextLabel;
}

- (UILabel)itemTitleLabel
{
  return self->_itemTitleLabel;
}

- (UILabel)ownerLabel
{
  return self->_ownerLabel;
}

- (BRShareFittingImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (NSLayoutConstraint)thumbnailHeightConstraint
{
  return self->_thumbnailHeightConstraint;
}

- (BOOL)compactMode
{
  return self->_compactMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_ownerLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_infoTextLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end