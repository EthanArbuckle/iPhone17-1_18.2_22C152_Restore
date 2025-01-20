@interface CCUISensorAttributionWebsiteView
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (CCUISensorAttributionWebsiteView)initWithSensorActivityData:(id)a3 maxSize:(CGSize)a4;
- (CGRect)cachedExpandedRect;
- (UILabel)websiteLabel;
- (id)_titleLabelForSensorActivityData:(id)a3 maxSize:(CGSize)a4;
- (id)largeContentTitle;
- (void)setBlurRadius:(double)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setWebsiteLabel:(id)a3;
@end

@implementation CCUISensorAttributionWebsiteView

- (id)_titleLabelForSensorActivityData:(id)a3 maxSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v6 = (objc_class *)MEMORY[0x1E4FB1930];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = [v7 website];

  v10 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  v11 = [v10 preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:1];

  [v8 setAdjustsFontSizeToFitWidth:1];
  [v8 setMinimumScaleFactor:0.5];
  [v8 setText:v9];
  [v8 setFont:v11];
  v12 = [v8 layer];
  v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
  [v12 setCompositingFilter:v13];

  v14 = [v8 layer];
  [v14 setAllowsGroupBlending:0];

  v15 = [MEMORY[0x1E4FB1618] grayColor];
  [v8 setTextColor:v15];

  objc_msgSend(v8, "sizeThatFits:", width, height);
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUISensorAttributionWebsiteView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CCUISensorAttributionWebsiteView)initWithSensorActivityData:(id)a3 maxSize:(CGSize)a4
{
  double width = a4.width;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CCUISensorAttributionWebsiteView;
  id v7 = [(CCUISensorAttributionWebsiteView *)&v20 init];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v9 = [(CCUISensorAttributionWebsiteView *)v7 layer];
    v21[0] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v9 setFilters:v10];

    v11 = [(CCUISensorAttributionWebsiteView *)v7 layer];
    [v11 setAllowsGroupBlending:0];

    [(SBFView *)v7 setAnimatedLayerProperties:&unk_1F2F4B710];
    [(CCUISensorAttributionWebsiteView *)v7 setClipsToBounds:0];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1938]) initWithDelegate:v7];
    [(CCUISensorAttributionWebsiteView *)v7 addInteraction:v12];
    uint64_t v13 = -[CCUISensorAttributionWebsiteView _titleLabelForSensorActivityData:maxSize:](v7, "_titleLabelForSensorActivityData:maxSize:", v6, width, 20.0);
    websiteLabel = v7->_websiteLabel;
    v7->_websiteLabel = (UILabel *)v13;

    [(CCUISensorAttributionWebsiteView *)v7 addSubview:v7->_websiteLabel];
    v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v16 = [v15 userInterfaceLayoutDirection];

    [(UILabel *)v7->_websiteLabel bounds];
    if (v16 == 1)
    {
      double v18 = width - v17;
      [(UILabel *)v7->_websiteLabel bounds];
    }
    else
    {
      double v18 = 0.0;
    }
    -[UILabel setFrame:](v7->_websiteLabel, "setFrame:", v18, 0.0);
    -[CCUISensorAttributionWebsiteView setFrame:](v7, "setFrame:", 0.0, 0.0, width, 20.0);
  }
  return v7;
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
  return [(UILabel *)self->_websiteLabel text];
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

- (UILabel)websiteLabel
{
  return self->_websiteLabel;
}

- (void)setWebsiteLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end