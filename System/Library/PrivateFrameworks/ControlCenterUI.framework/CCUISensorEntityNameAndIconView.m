@interface CCUISensorEntityNameAndIconView
+ (CGSize)iconSize;
+ (double)horizontalPaddingBetweenIconAndLabel;
+ (int64_t)maximumNumberOfLines;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (CCUISensorEntityNameAndIconView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4;
- (CGRect)cachedExpandedRect;
- (UIImageView)entityIconView;
- (UILabel)appNameLabel;
- (id)_titleLabelForSensorAttributionEntity:(id)a3 maxSize:(CGSize)a4;
- (id)largeContentTitle;
- (void)setAppNameLabel:(id)a3;
- (void)setBlurRadius:(double)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setEntityIconView:(id)a3;
@end

@implementation CCUISensorEntityNameAndIconView

- (id)_titleLabelForSensorAttributionEntity:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v24[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(CCUISensorEntityNameAndIconView *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v12 = [v7 executableDisplayName];

  v13 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  v14 = [v13 preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:1];

  v15 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v16 = (void *)[v15 mutableCopy];

  [v16 setUsesDefaultHyphenation:1];
  uint64_t v17 = *MEMORY[0x1E4FB06F8];
  v23[0] = *MEMORY[0x1E4FB0738];
  v23[1] = v17;
  v24[0] = v16;
  v24[1] = v14;
  v23[2] = *MEMORY[0x1E4FB0700];
  v18 = [MEMORY[0x1E4FB1618] whiteColor];
  v24[2] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v19];
  if (IsAccessibilityCategory) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 2;
  }
  [v11 setNumberOfLines:v21];
  [v11 setAttributedText:v20];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  if (IsAccessibilityCategory) {
    [v11 setAdjustsFontForContentSizeCategory:1];
  }
  BSRectWithSize();
  objc_msgSend(v11, "setFrame:");

  return v11;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUISensorEntityNameAndIconView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CCUISensorEntityNameAndIconView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CCUISensorEntityNameAndIconView;
  v8 = [(CCUISensorEntityNameAndIconView *)&v50 init];
  if (v8)
  {
    v9 = [v7 bundleIdentifier];
    [(id)objc_opt_class() iconSize];
    double v11 = v10;
    double v12 = width - (v10 + 16.0);
    if (v9)
    {
      v13 = +[CCUISensorEntityIconCache sharedInstance];
      v14 = [v13 imageForEntity:v7];
    }
    else
    {
      v14 = 0;
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
    entityIconView = v8->_entityIconView;
    v8->_entityIconView = (UIImageView *)v15;

    [(CCUISensorEntityNameAndIconView *)v8 addSubview:v8->_entityIconView];
    uint64_t v17 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v18 = [(CCUISensorEntityNameAndIconView *)v8 layer];
    v51[0] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    [v18 setFilters:v19];

    [(SBFView *)v8 setAnimatedLayerProperties:&unk_1F2F4B758];
    [(CCUISensorEntityNameAndIconView *)v8 setClipsToBounds:0];
    uint64_t v20 = -[CCUISensorEntityNameAndIconView _titleLabelForSensorAttributionEntity:maxSize:](v8, "_titleLabelForSensorAttributionEntity:maxSize:", v7, v12, height);
    appNameLabel = v8->_appNameLabel;
    v8->_appNameLabel = (UILabel *)v20;

    [(CCUISensorEntityNameAndIconView *)v8 addSubview:v8->_appNameLabel];
    v22 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v23 = [v22 userInterfaceLayoutDirection];

    double v24 = 0.0;
    if (v23 == 1)
    {
      [(UILabel *)v8->_appNameLabel bounds];
      double v24 = v25 + 8.0;
    }
    v26 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    if (v27 == 1)
    {
      [(UILabel *)v8->_appNameLabel bounds];
      double v29 = v28;
      [(UILabel *)v8->_appNameLabel bounds];
      double v31 = v30;
      double v32 = 0.0;
    }
    else
    {
      double v32 = v11 + 8.0;
      [(UILabel *)v8->_appNameLabel bounds];
      double v29 = v33;
      [(UILabel *)v8->_appNameLabel bounds];
      double v31 = v34;
    }
    -[UIImageView setFrame:](v8->_entityIconView, "setFrame:", v24, 0.0, v11, v11);
    -[UILabel setFrame:](v8->_appNameLabel, "setFrame:", v32, 0.0, v29, v31);
    v35 = [(CCUISensorEntityNameAndIconView *)v8 traitCollection];
    v36 = [v35 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

    if (IsAccessibilityCategory)
    {
      v38 = v8->_entityIconView;
      [(UIImageView *)v38 center];
      double v40 = v39;
      [(UILabel *)v8->_appNameLabel center];
      [(UIImageView *)v38 setCenter:v40];
    }
    v41 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v42 = [v41 userInterfaceLayoutDirection];
    if (v42 == 1) {
      double v43 = v24;
    }
    else {
      double v43 = v32;
    }
    double v44 = 0.0;
    if (v42 == 1) {
      double v45 = v11;
    }
    else {
      double v45 = v29;
    }
    if (v42 == 1) {
      double v46 = v11;
    }
    else {
      double v46 = v31;
    }
    double MaxX = CGRectGetMaxX(*(CGRect *)&v43);

    if (v31 >= v11) {
      double v48 = v31;
    }
    else {
      double v48 = v11;
    }
    -[CCUISensorEntityNameAndIconView setFrame:](v8, "setFrame:", 0.0, 0.0, MaxX, v48);
  }
  return v8;
}

+ (CGSize)iconSize
{
  +[CCUISensorEntityIconCache iconSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (double)horizontalPaddingBetweenIconAndLabel
{
  return 8.0;
}

+ (int64_t)maximumNumberOfLines
{
  return 2;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)largeContentTitle
{
  return [(UILabel *)self->_appNameLabel text];
}

- (CGRect)cachedExpandedRect
{
  double x = self->cachedExpandedRect.origin.x;
  double y = self->cachedExpandedRect.origin.y;
  double width = self->cachedExpandedRect.size.width;
  double height = self->cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (UIImageView)entityIconView
{
  return self->_entityIconView;
}

- (void)setEntityIconView:(id)a3
{
}

- (UILabel)appNameLabel
{
  return self->_appNameLabel;
}

- (void)setAppNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNameLabel, 0);

  objc_storeStrong((id *)&self->_entityIconView, 0);
}

@end