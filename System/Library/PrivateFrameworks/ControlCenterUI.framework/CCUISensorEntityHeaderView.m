@interface CCUISensorEntityHeaderView
+ (CGSize)iconSize;
+ (double)horizontalPaddingBetweenIconAndLabel;
+ (int64_t)maximumNumberOfLines;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (CCUISensorEntityHeaderView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4;
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

@implementation CCUISensorEntityHeaderView

- (id)_titleLabelForSensorAttributionEntity:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v20[3] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4FB1930];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = [v7 executableDisplayName];

  v10 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  v11 = [v10 preferredFontForTextStyle:*MEMORY[0x1E4FB2918] hiFontStyle:4];

  v12 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v13 = (void *)[v12 mutableCopy];

  [v13 setUsesDefaultHyphenation:1];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v19[0] = *MEMORY[0x1E4FB0738];
  v19[1] = v14;
  v20[0] = v13;
  v20[1] = v11;
  v19[2] = *MEMORY[0x1E4FB0700];
  v15 = [MEMORY[0x1E4FB1618] whiteColor];
  v20[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v16];
  [v8 setNumberOfLines:0];
  [v8 setAttributedText:v17];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  [v8 setAdjustsFontForContentSizeCategory:1];
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUISensorEntityHeaderView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CCUISensorEntityHeaderView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CCUISensorEntityHeaderView;
  id v8 = [(CCUISensorEntityHeaderView *)&v47 init];
  if (v8)
  {
    v9 = [v7 bundleIdentifier];
    [(id)objc_opt_class() iconSize];
    double v11 = v10;
    double v12 = width - (v10 + 16.0);
    if (v9)
    {
      v13 = +[CCUISensorEntityIconCache sharedInstance];
      uint64_t v14 = [v13 imageForEntity:v7];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
    entityIconView = v8->_entityIconView;
    v8->_entityIconView = (UIImageView *)v15;

    [(CCUISensorEntityHeaderView *)v8 addSubview:v8->_entityIconView];
    v17 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v18 = [(CCUISensorEntityHeaderView *)v8 layer];
    v48[0] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    [v18 setFilters:v19];

    [(SBFView *)v8 setAnimatedLayerProperties:&unk_1F2F4B7B8];
    [(CCUISensorEntityHeaderView *)v8 setClipsToBounds:0];
    uint64_t v20 = -[CCUISensorEntityHeaderView _titleLabelForSensorAttributionEntity:maxSize:](v8, "_titleLabelForSensorAttributionEntity:maxSize:", v7, v12, height);
    appNameLabel = v8->_appNameLabel;
    v8->_appNameLabel = (UILabel *)v20;

    [(CCUISensorEntityHeaderView *)v8 addSubview:v8->_appNameLabel];
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
    v35 = v8->_entityIconView;
    [(UIImageView *)v35 center];
    double v37 = v36;
    [(UILabel *)v8->_appNameLabel center];
    [(UIImageView *)v35 setCenter:v37];
    v38 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v39 = [v38 userInterfaceLayoutDirection];
    if (v39 == 1) {
      double v40 = v24;
    }
    else {
      double v40 = v32;
    }
    double v41 = 0.0;
    if (v39 == 1) {
      double v42 = v11;
    }
    else {
      double v42 = v29;
    }
    if (v39 == 1) {
      double v43 = v11;
    }
    else {
      double v43 = v31;
    }
    double MaxX = CGRectGetMaxX(*(CGRect *)&v40);

    if (v31 >= v11) {
      double v45 = v31;
    }
    else {
      double v45 = v11;
    }
    -[CCUISensorEntityHeaderView setFrame:](v8, "setFrame:", 0.0, 0.0, MaxX, v45);
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