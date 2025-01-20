@interface NTKCellularConnectivityImageView
+ (BOOL)tritium_wantsCrossfadeAnimation;
- (BOOL)_showDisconnected;
- (BOOL)_showDotsInsteadOfImage;
- (BOOL)usesLegibility;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKCellularConnectivityImageView)initWithFrame:(CGRect)a3;
- (NTKExplorerStatusView)dotsView;
- (UIColor)color;
- (UIColor)contentColor;
- (UIColor)overrideColor;
- (UIImageView)imageView;
- (UIView)platterView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (int64_t)_filterStyle;
- (void)_reevaluateSignalState;
- (void)_setCutoutImageFromPlatter:(BOOL)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)pauseLiveFullColorImageView;
- (void)resumeLiveFullColorImageView;
- (void)setColor:(id)a3;
- (void)setDotsView:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKCellularConnectivityImageView

- (NTKCellularConnectivityImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v28.receiver = self;
  v28.super_class = (Class)NTKCellularConnectivityImageView;
  v5 = -[NTKCellularConnectivityImageView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    [(NTKCellularConnectivityImageView *)v5 bounds];
    double v8 = v7 * 0.5;
    [(NTKCellularConnectivityImageView *)v6 bounds];
    double v10 = v9 * 0.5;
    if (width < height) {
      double height = width;
    }
    v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, height, height);
    platterView = v6->_platterView;
    v6->_platterView = v11;

    -[UIView setCenter:](v6->_platterView, "setCenter:", v8, v10);
    v13 = [(UIView *)v6->_platterView layer];
    [v13 setCornerRadius:height * 0.5];

    [(UIView *)v6->_platterView setClipsToBounds:1];
    [(NTKCellularConnectivityImageView *)v6 addSubview:v6->_platterView];
    id v14 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double v16 = CGRectZero.size.width;
    double v17 = CGRectZero.size.height;
    v18 = (UIImageView *)objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, v16, v17);
    imageView = v6->_imageView;
    v6->_imageView = v18;

    -[UIImageView setCenter:](v6->_imageView, "setCenter:", v8, v10);
    [(NTKCellularConnectivityImageView *)v6 addSubview:v6->_imageView];
    v20 = v6->_imageProvider;
    id v21 = objc_alloc((Class)NTKExplorerStatusView);
    v22 = [(CLKImageProvider *)v20 dotLayoutConstraints];
    v23 = [(CLKImageProvider *)v20 dotColorOptions];
    v24 = (NTKExplorerStatusView *)objc_msgSend(v21, "initWithFrame:dotLayoutConstraints:dotColorOptions:", v22, v23, CGRectZero.origin.x, y, v16, v17);
    dotsView = v6->_dotsView;
    v6->_dotsView = v24;

    v26 = [(NTKCellularConnectivityImageView *)v6 filterProvider];
    [(NTKExplorerStatusView *)v6->_dotsView setFilterProvider:v26];

    [(NTKCellularConnectivityImageView *)v6 addSubview:v6->_dotsView];
  }
  return v6;
}

- (void)_setCutoutImageFromPlatter:(BOOL)a3
{
  if (self->_cutoutImageFromPlatter != a3)
  {
    BOOL v3 = a3;
    self->_cutoutImageFromPlatter = a3;
    v4 = [(UIImageView *)self->_imageView layer];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = kCAFilterSubtractS;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setCompositingFilter:v5];
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCellularConnectivityImageView;
  [(NTKCellularConnectivityImageView *)&v17 layoutSubviews];
  BOOL v3 = [(NTKCellularConnectivityImageView *)self imageProvider];
  -[NTKCellularConnectivityImageView _setCutoutImageFromPlatter:](self, "_setCutoutImageFromPlatter:", [v3 cutoutImageFromPlatter]);
  [(NTKCellularConnectivityImageView *)self bounds];
  double v5 = v4 * 0.5;
  [(NTKCellularConnectivityImageView *)self bounds];
  double v7 = v6 * 0.5;
  -[UIView setHidden:](self->_platterView, "setHidden:", [v3 needsPlatter] ^ 1);
  [(NTKCellularConnectivityImageView *)self bounds];
  double v9 = v8;
  [(NTKCellularConnectivityImageView *)self bounds];
  if (v9 >= v10) {
    double v9 = v10;
  }
  -[UIView setFrame:](self->_platterView, "setFrame:", 0.0, 0.0, v9, v9);
  -[UIView setCenter:](self->_platterView, "setCenter:", v5, v7);
  v11 = [(UIView *)self->_platterView layer];
  [v11 setCornerRadius:v9 * 0.5];

  [(UIImageView *)self->_imageView setHidden:[(NTKCellularConnectivityImageView *)self _showDotsInsteadOfImage]];
  objc_msgSend(v3, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:", 0, 4, 1, v9, v9, v9, v9);
  v12 = [v3 createSymbolImage];
  [(UIImageView *)self->_imageView setImage:v12];

  [(UIImageView *)self->_imageView sizeToFit];
  v13 = [v3 imageVerticalOffsetScaleFromWidth];
  [v13 floatValue];
  id v14 = +[CLKDevice currentDevice];
  CLKRoundForDevice();
  double v16 = v7 + v15;

  -[UIImageView setCenter:](self->_imageView, "setCenter:", v5, v16);
  [(NTKExplorerStatusView *)self->_dotsView setHidden:[(NTKCellularConnectivityImageView *)self _showDotsInsteadOfImage] ^ 1];
  [(NTKExplorerStatusView *)self->_dotsView sizeToFit];
  -[NTKExplorerStatusView setCenter:](self->_dotsView, "setCenter:", v5, v7);
  [(NTKCellularConnectivityImageView *)self setColor:self->_color];
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
  id v5 = a3;
  double v6 = [v5 dotLayoutConstraints];
  [(NTKExplorerStatusView *)self->_dotsView setDotLayoutConstraints:v6];

  -[NTKExplorerStatusView setSignalStrengthBars:](self->_dotsView, "setSignalStrengthBars:", [v5 numDotsFilled]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_41B4;
  block[3] = &unk_82B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_color, a3);
  double v6 = [(NTKCellularConnectivityImageView *)self imageProvider];
  id v7 = v5;
  if (self->_tritium_isOn)
  {
    double v8 = [v6 tritiumPlatterColor];

    double v9 = v7;
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v10 = [v6 tritiumPlatterColor];
    double v9 = v7;
    goto LABEL_8;
  }
  v11 = [v6 platterOverrideColor];

  double v9 = v7;
  if (v11)
  {
    double v9 = [v6 platterOverrideColor];
  }
  [v6 platterAlpha];
  if (fabs(v12 + -1.0) >= 0.00000011920929)
  {
    [v6 platterAlpha];
    uint64_t v10 = objc_msgSend(v9, "colorWithAlphaComponent:");
LABEL_8:

    double v9 = (void *)v10;
  }
LABEL_9:
  [(UIView *)self->_platterView setBackgroundColor:v9];
  id v21 = v7;
  v13 = [v6 imageOverrideColor];

  id v14 = v21;
  if (v13)
  {
    id v14 = [v6 imageOverrideColor];
  }
  [v6 imageAlpha];
  if (fabs(v15 + -1.0) >= 0.00000011920929)
  {
    [v6 imageAlpha];
    uint64_t v16 = objc_msgSend(v14, "colorWithAlphaComponent:");

    id v14 = (void *)v16;
  }
  if (self->_cutoutImageFromPlatter)
  {
    uint64_t v17 = +[UIColor whiteColor];

    id v14 = (void *)v17;
  }
  [(UIImageView *)self->_imageView setTintColor:v14];
  v18 = [v6 dotColorOptions];
  id v19 = [v18 copy];

  [v19 setConnectedDotColor:v21];
  if ([v6 needsPlatter])
  {
    [v19 setConnectedDotBackgroundColor:v9];
  }
  else
  {
    v20 = +[UIColor blackColor];
    [v19 setConnectedDotBackgroundColor:v20];
  }
  [(NTKExplorerStatusView *)self->_dotsView setDotColorOptions:v19];
  [(NTKExplorerStatusView *)self->_dotsView setTritiumIsOn:self->_tritium_isOn];
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKCellularConnectivityImageView initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)pauseLiveFullColorImageView
{
  self->_shouldPauseFullColorImageView = 1;
  [(NTKCellularConnectivityImageView *)self _reevaluateSignalState];
}

- (void)resumeLiveFullColorImageView
{
  self->_shouldPauseFullColorImageView = 0;
  [(NTKCellularConnectivityImageView *)self _reevaluateSignalState];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = [v5 metadata];
  id v7 = [v6 objectForKey:@"NTKCellularConnectivityImageProviderMetadataKey"];

  LOBYTE(v6) = objc_msgSend(v5, "tritium_isTritiumInactiveFullColorImageProvider");
  self->_tritium_isOn = (char)v6;
  [(NTKCellularConnectivityImageView *)self setImageProvider:v7];
}

+ (BOOL)tritium_wantsCrossfadeAnimation
{
  return 1;
}

- (void)setFilterProvider:(id)a3
{
  p_filterProvider = &self->_filterProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_filterProvider, v5);
  id v6 = [(NTKCellularConnectivityImageView *)self dotsView];
  [v6 setFilterProvider:v5];
}

- (int64_t)_filterStyle
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v5 = [(NTKCellularConnectivityImageView *)self dotsView];
  [v5 transitionToMonochromeWithFraction:a3];

  id v6 = [(NTKCellularConnectivityImageView *)self filterProvider];
  objc_msgSend(v6, "filtersForView:style:fraction:", self, -[NTKCellularConnectivityImageView _filterStyle](self, "_filterStyle"), a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    id v7 = [(NTKCellularConnectivityImageView *)self platterView];
    double v8 = [v7 layer];
    [v8 setFilters:v11];

    double v9 = [(NTKCellularConnectivityImageView *)self imageView];
    uint64_t v10 = [v9 layer];
    [v10 setFilters:v11];
  }
}

- (void)updateMonochromeColor
{
  BOOL v3 = [(NTKCellularConnectivityImageView *)self dotsView];
  [v3 updateMonochromeColor];

  double v4 = [(NTKCellularConnectivityImageView *)self filterProvider];
  objc_msgSend(v4, "filtersForView:style:", self, -[NTKCellularConnectivityImageView _filterStyle](self, "_filterStyle"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v5 = [(NTKCellularConnectivityImageView *)self platterView];
    id v6 = [v5 layer];
    [v6 setFilters:v9];

    id v7 = [(NTKCellularConnectivityImageView *)self imageView];
    double v8 = [v7 layer];
    [v8 setFilters:v9];
  }
}

- (BOOL)_showDotsInsteadOfImage
{
  v2 = [(NTKCellularConnectivityImageView *)self imageProvider];
  unsigned __int8 v3 = [v2 showsAsDots];

  return v3;
}

- (BOOL)_showDisconnected
{
  v2 = [(NTKCellularConnectivityImageView *)self imageProvider];
  unsigned __int8 v3 = [v2 isDisconnected];

  return v3;
}

- (void)_reevaluateSignalState
{
  double v4 = self->_imageProvider;
  if ([(NTKCellularConnectivityImageView *)self _showDotsInsteadOfImage]
    || [(NTKExplorerStatusView *)self->_dotsView state] == (char *)&dword_0 + 2)
  {
    if ([(CLKImageProvider *)v4 animateSearchingState]
      && !self->_shouldPauseFullColorImageView)
    {
      uint64_t v3 = 2;
    }
    else
    {
      uint64_t v3 = [(NTKCellularConnectivityImageView *)self _showDisconnected] ^ 1;
    }
    [(NTKExplorerStatusView *)self->_dotsView setState:v3];
  }
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (UIColor)contentColor
{
  return self->contentColor;
}

- (UIColor)overrideColor
{
  return self->overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (BOOL)usesLegibility
{
  return self->usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->usesLegibilitdouble y = a3;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NTKExplorerStatusView)dotsView
{
  return self->_dotsView;
}

- (void)setDotsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotsView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->overrideColor, 0);
  objc_storeStrong((id *)&self->contentColor, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end