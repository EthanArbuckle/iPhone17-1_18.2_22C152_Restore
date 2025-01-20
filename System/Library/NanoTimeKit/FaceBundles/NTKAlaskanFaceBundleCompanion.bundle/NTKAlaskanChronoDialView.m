@interface NTKAlaskanChronoDialView
+ (id)layerDisabledActions;
- (NTKAlaskanChronoDialView)initWithFrame:(CGRect)a3 options:(id)a4 palette:(id)a5;
- (NTKAlaskanChronoDialViewOptions)options;
- (NTKAlaskanDialView)markersView;
- (NTKAlaskanDialView)secondaryMarkersView;
- (NTKAlaskanDialView)ticksView;
- (NTKChronographProFacePalette)palette;
- (void)setMarkersView:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPalette:(id)a3;
- (void)setSecondaryMarkersView:(id)a3;
- (void)setTicksView:(id)a3;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKAlaskanChronoDialView

- (NTKAlaskanChronoDialView)initWithFrame:(CGRect)a3 options:(id)a4 palette:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v48.receiver = self;
  v48.super_class = (Class)NTKAlaskanChronoDialView;
  v14 = -[NTKAlaskanChronoDialView initWithFrame:](&v48, "initWithFrame:", x, y, width, height);
  if (v14)
  {
    v15 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    v16 = [v15 device];

    objc_storeStrong((id *)&v14->_palette, a5);
    objc_storeStrong((id *)&v14->_options, a4);
    objc_initWeak(&location, v14);
    id v17 = [v12 ticksCount];
    id v32 = v13;
    v18 = [NTKAlaskanDialView alloc];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_12C54;
    v43[3] = &unk_39098;
    objc_copyWeak(&v46, &location);
    id v44 = v12;
    id v31 = v16;
    id v45 = v31;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_12EEC;
    v41[3] = &unk_38CC8;
    id v19 = v44;
    id v42 = v19;
    v20 = [(NTKAlaskanDialView *)v18 initWithNumberOfMarkers:v17 markersFactory:v43 angleProvider:v41];
    [(NTKAlaskanDialView *)v20 setShouldRotateMarkers:1];
    [v19 ticksContentInset];
    -[NTKAlaskanDialView setContentInset:](v20, "setContentInset:");
    v21 = +[UIColor clearColor];
    [(NTKAlaskanDialView *)v20 setBackgroundColor:v21];

    [(NTKAlaskanDialView *)v20 setShouldPixelAlignCenterPoints:0];
    [(NTKAlaskanDialView *)v20 setAutoresizingMask:18];
    objc_storeStrong((id *)&v14->_ticksView, v20);
    [(NTKAlaskanChronoDialView *)v14 addSubview:v14->_ticksView];
    v22 = [NTKAlaskanDialView alloc];
    id v23 = [v19 markersCount];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_12F78;
    v38[3] = &unk_390C0;
    objc_copyWeak(&v40, &location);
    id v39 = v19;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_130AC;
    v36[3] = &unk_38CC8;
    id v24 = v39;
    id v37 = v24;
    v25 = [(NTKAlaskanDialView *)v22 initWithNumberOfMarkers:v23 markersFactory:v38 angleProvider:v36];
    [v24 markersDiameter];
    -[NTKAlaskanDialView setContentDiameter:](v25, "setContentDiameter:");
    [(NTKAlaskanDialView *)v25 setAutoresizingMask:18];
    objc_storeStrong((id *)&v14->_markersView, v25);
    [(NTKAlaskanChronoDialView *)v14 addSubview:v14->_markersView];
    if ([v24 hasSecondaryMarkers])
    {
      v26 = [NTKAlaskanDialView alloc];
      id v27 = objc_msgSend(v24, "secondaryMarkersCount", v31);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_13138;
      v33[3] = &unk_390C0;
      objc_copyWeak(&v35, &location);
      id v28 = v24;
      id v34 = v28;
      v29 = [(NTKAlaskanDialView *)v26 initWithNumberOfMarkers:v27 markersFactory:v33];
      [v28 secondaryMarkersDiameter];
      -[NTKAlaskanDialView setContentDiameter:](v29, "setContentDiameter:");
      [(NTKAlaskanDialView *)v29 setAutoresizingMask:18];
      objc_storeStrong((id *)&v14->_secondaryMarkersView, v29);
      [(NTKAlaskanChronoDialView *)v14 addSubview:v14->_secondaryMarkersView];

      objc_destroyWeak(&v35);
    }

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

    id v13 = v32;
  }

  return v14;
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

- (void)updateWithColorPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  ticksView = self->_ticksView;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_134FC;
  v16[3] = &unk_390E8;
  v16[4] = self;
  id v7 = v5;
  id v17 = v7;
  [(NTKAlaskanDialView *)ticksView enumerateMarkers:v16];
  markersView = self->_markersView;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_135C8;
  v14[3] = &unk_39110;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  [(NTKAlaskanDialView *)markersView enumerateMarkers:v14];
  secondaryMarkersView = self->_secondaryMarkersView;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13674;
  v12[3] = &unk_39110;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [(NTKAlaskanDialView *)secondaryMarkersView enumerateMarkers:v12];
}

- (NTKAlaskanDialView)ticksView
{
  return self->_ticksView;
}

- (void)setTicksView:(id)a3
{
}

- (NTKAlaskanDialView)markersView
{
  return self->_markersView;
}

- (void)setMarkersView:(id)a3
{
}

- (NTKAlaskanDialView)secondaryMarkersView
{
  return self->_secondaryMarkersView;
}

- (void)setSecondaryMarkersView:(id)a3
{
}

- (NTKChronographProFacePalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (NTKAlaskanChronoDialViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_secondaryMarkersView, 0);
  objc_storeStrong((id *)&self->_markersView, 0);

  objc_storeStrong((id *)&self->_ticksView, 0);
}

@end