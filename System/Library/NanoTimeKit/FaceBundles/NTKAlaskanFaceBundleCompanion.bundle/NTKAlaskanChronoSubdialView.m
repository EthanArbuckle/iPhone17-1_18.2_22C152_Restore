@interface NTKAlaskanChronoSubdialView
+ (id)layerDisabledActions;
- (NTKAlaskanChronoSubdialView)initWithFrame:(CGRect)a3 options:(id)a4 palette:(id)a5;
- (NTKAlaskanChronoSubdialView)initWithFrame:(CGRect)a3 ticksView:(id)a4 markersView:(id)a5;
- (NTKAlaskanChronoSubdialViewOptions)options;
- (NTKAlaskanDialView)markersView;
- (NTKAlaskanDialView)tickView;
- (NTKChronographProFacePalette)palette;
- (UIImageView)analogHand;
- (double)diameter;
- (void)layoutSubviews;
- (void)setAnalogHand:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setMarkersView:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPalette:(id)a3;
- (void)setTickView:(id)a3;
- (void)updateCircularMask;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKAlaskanChronoSubdialView

- (NTKAlaskanChronoSubdialView)initWithFrame:(CGRect)a3 options:(id)a4 palette:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v13 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v14 = [v13 device];

  objc_initWeak(location, self);
  v15 = [NTKAlaskanDialView alloc];
  id v16 = [v11 ticksCount];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_224B4;
  v32[3] = &unk_39098;
  objc_copyWeak(&v35, location);
  id v17 = v11;
  id v33 = v17;
  id v18 = v14;
  id v34 = v18;
  v19 = [(NTKAlaskanDialView *)v15 initWithNumberOfMarkers:v16 markersFactory:v32];
  [v17 ticksContentInset];
  -[NTKAlaskanDialView setContentInset:](v19, "setContentInset:");
  [(NTKAlaskanDialView *)v19 setShouldRotateMarkers:1];
  [(NTKAlaskanDialView *)v19 setShouldPixelAlignCenterPoints:0];
  v20 = [NTKAlaskanDialView alloc];
  id v21 = [v17 markersCount];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_2265C;
  v29[3] = &unk_390C0;
  objc_copyWeak(&v31, location);
  id v22 = v17;
  id v30 = v22;
  v23 = [(NTKAlaskanDialView *)v20 initWithNumberOfMarkers:v21 markersFactory:v29];
  [v22 markersDiameter];
  -[NTKAlaskanDialView setContentDiameter:](v23, "setContentDiameter:");
  v24 = -[NTKAlaskanChronoSubdialView initWithFrame:ticksView:markersView:](self, "initWithFrame:ticksView:markersView:", v19, v23, x, y, width, height);
  v25 = [v12 subdialClock];
  [(NTKAlaskanChronoSubdialView *)v24 setBackgroundColor:v25];

  v26 = [v12 subdialClockHand];
  v27 = [(NTKAlaskanChronoSubdialView *)v24 analogHand];
  [v27 setTintColor:v26];

  [(NTKAlaskanChronoSubdialView *)v24 setOptions:v22];
  [(NTKAlaskanChronoSubdialView *)v24 setPalette:v12];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

  return v24;
}

+ (id)layerDisabledActions
{
  v2 = +[NSNull null];
  v5[0] = @"contents";
  v5[1] = @"backgroundColor";
  v6[0] = v2;
  v6[1] = v2;
  v5[2] = @"transform";
  v5[3] = @"bounds";
  v6[2] = v2;
  v6[3] = v2;
  v5[4] = @"position";
  v5[5] = @"opacity";
  v6[4] = v2;
  v6[5] = v2;
  v5[6] = @"mask";
  v6[6] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:7];

  return v3;
}

- (NTKAlaskanChronoSubdialView)initWithFrame:(CGRect)a3 ticksView:(id)a4 markersView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKAlaskanChronoSubdialView;
  v14 = -[NTKAlaskanChronoSubdialView initWithFrame:](&v23, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    p_tickView = &v14->_tickView;
    objc_storeStrong((id *)&v14->_tickView, a4);
    objc_storeStrong((id *)&v15->_markersView, a5);
    id v17 = objc_alloc((Class)UIImageView);
    [(NTKAlaskanChronoSubdialView *)v15 frame];
    id v18 = (UIImageView *)objc_msgSend(v17, "initWithFrame:");
    analogHand = v15->_analogHand;
    v15->_analogHand = v18;

    v20 = +[UIColor whiteColor];
    [(UIImageView *)v15->_analogHand setTintColor:v20];

    if (*p_tickView) {
      -[NTKAlaskanChronoSubdialView addSubview:](v15, "addSubview:");
    }
    if (v15->_markersView) {
      -[NTKAlaskanChronoSubdialView addSubview:](v15, "addSubview:");
    }
    [(NTKAlaskanChronoSubdialView *)v15 addSubview:v15->_analogHand];
    id v21 = +[UIColor blackColor];
    [(NTKAlaskanChronoSubdialView *)v15 setBackgroundColor:v21];
  }
  return v15;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKAlaskanChronoSubdialView;
  [(NTKAlaskanChronoSubdialView *)&v9 layoutSubviews];
  v3 = [(NTKAlaskanChronoSubdialView *)self tickView];
  [(NTKAlaskanChronoSubdialView *)self bounds];
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");

  v4 = [(NTKAlaskanChronoSubdialView *)self markersView];
  [(NTKAlaskanChronoSubdialView *)self bounds];
  objc_msgSend(v4, "ntk_setBoundsAndPositionFromFrame:");

  [(NTKAlaskanChronoSubdialView *)self bounds];
  double v6 = v5;
  [(NTKAlaskanChronoSubdialView *)self bounds];
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  if (self->_diameter != v8)
  {
    self->_diameter = v8;
    [(NTKAlaskanChronoSubdialView *)self updateCircularMask];
  }
}

- (void)updateCircularMask
{
  [(NTKAlaskanChronoSubdialView *)self bounds];
  double v4 = v3 * 0.5;
  double v5 = [(NTKAlaskanChronoSubdialView *)self layer];
  [v5 setCornerRadius:v4];

  double v6 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  id v17 = [v6 device];

  double v7 = +[CLKUIAnalogHandConfiguration defaultSubdialConfigurationForDevice:v17];
  [(NTKAlaskanChronoSubdialView *)self bounds];
  [v7 setHandLength:v8 * 0.5 + -1.0];
  objc_super v9 = +[CLKUIAnalogHandFactory getAssets:2 forConfiguration:v7];
  v10 = [v9 objectForKeyedSubscript:&off_3A9F0];
  id v11 = [v10 imageWithRenderingMode:2];

  [(UIImageView *)self->_analogHand setImage:v11];
  [v7 bounds];
  -[UIImageView setBounds:](self->_analogHand, "setBounds:");
  [v7 anchorPoint];
  double v13 = v12;
  double v15 = v14;
  id v16 = [(UIImageView *)self->_analogHand layer];
  objc_msgSend(v16, "setAnchorPoint:", v13, v15);

  [(NTKAlaskanChronoSubdialView *)self bounds];
  CLKRectGetCenter();
  -[UIImageView setCenter:](self->_analogHand, "setCenter:");
}

- (void)updateWithColorPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  tickView = self->_tickView;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_22DF4;
  v19[3] = &unk_390E8;
  v19[4] = self;
  id v7 = v5;
  id v20 = v7;
  [(NTKAlaskanDialView *)tickView enumerateMarkers:v19];
  markersView = self->_markersView;
  double v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  double v15 = sub_22EC0;
  id v16 = &unk_39110;
  id v17 = self;
  id v18 = v7;
  id v9 = v7;
  [(NTKAlaskanDialView *)markersView enumerateMarkers:&v13];
  v10 = objc_msgSend(v9, "subdialClock", v13, v14, v15, v16, v17);
  [(NTKAlaskanChronoSubdialView *)self setBackgroundColor:v10];

  id v11 = [v9 subdialClockHand];
  double v12 = [(NTKAlaskanChronoSubdialView *)self analogHand];
  [v12 setTintColor:v11];
}

- (NTKAlaskanDialView)tickView
{
  return self->_tickView;
}

- (void)setTickView:(id)a3
{
}

- (NTKAlaskanDialView)markersView
{
  return self->_markersView;
}

- (void)setMarkersView:(id)a3
{
}

- (UIImageView)analogHand
{
  return self->_analogHand;
}

- (void)setAnalogHand:(id)a3
{
}

- (NTKAlaskanChronoSubdialViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (NTKChronographProFacePalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_analogHand, 0);
  objc_storeStrong((id *)&self->_markersView, 0);

  objc_storeStrong((id *)&self->_tickView, 0);
}

@end