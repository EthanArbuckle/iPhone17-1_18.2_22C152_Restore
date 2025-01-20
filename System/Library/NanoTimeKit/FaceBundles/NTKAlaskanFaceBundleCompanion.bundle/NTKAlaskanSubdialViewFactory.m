@interface NTKAlaskanSubdialViewFactory
- (NTKChronographProFacePalette)palette;
- (id)_12HoursSubdialView;
- (id)_15MinutesSubdialView;
- (id)_2MinutesSubdialView;
- (id)_30MinutesSubdialView;
- (id)_3MinutesSubdialView;
- (id)_60MinutesSubdialView;
- (id)_60secondsSubdialView;
- (id)_subdialViewWithOptions:(id)a3 palette:(id)a4 tag:(int64_t)a5;
- (id)createDefaultOptions;
- (id)markersFont;
- (void)setPalette:(id)a3;
@end

@implementation NTKAlaskanSubdialViewFactory

- (id)_subdialViewWithOptions:(id)a3 palette:(id)a4 tag:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v10 = [v9 device];

  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_29F0(v10, (uint64_t)v14);
  v11 = [NTKAlaskanChronoSubdialView alloc];
  v12 = -[NTKAlaskanChronoSubdialView initWithFrame:options:palette:](v11, "initWithFrame:options:palette:", v8, v7, 0.0, 0.0, v15);

  [(NTKAlaskanChronoSubdialView *)v12 setTag:a5];

  return v12;
}

- (id)_12HoursSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_38708];
  [v3 setMarkersCount:12];
  [v3 setVisibleMarkersTestBlock:&stru_38728];
  [v3 setMarkerTextBlock:&stru_38768];
  v4 = [(NTKAlaskanSubdialViewFactory *)self _subdialViewWithOptions:v3 palette:self->_palette tag:12];

  return v4;
}

- (id)_60MinutesSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_38788];
  [v3 setMarkersCount:12];
  [v3 setVisibleMarkersTestBlock:&stru_387A8];
  [v3 setMarkerTextBlock:&stru_387C8];
  v4 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v5 = [v4 device];

  uint64_t v10 = 0;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  sub_29F0(v5, (uint64_t)v8);
  [v3 setMarkersDiameter:*(double *)&v9];
  v6 = [(NTKAlaskanSubdialViewFactory *)self _subdialViewWithOptions:v3 palette:self->_palette tag:60];

  return v6;
}

- (id)_30MinutesSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:30];
  [v3 setLargerTicksTestBlock:&stru_387E8];
  [v3 setMarkersCount:18];
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&off_3A0C0 forKeyedSubscript:&off_3A0D8];
  [v4 setObject:&off_3A0F0 forKeyedSubscript:&off_3A108];
  [v4 setObject:&off_3A120 forKeyedSubscript:&off_3A138];
  [v4 setObject:&off_3A150 forKeyedSubscript:&off_3A168];
  [v4 setObject:&off_3A180 forKeyedSubscript:&off_3A120];
  [v4 setObject:&off_3A198 forKeyedSubscript:&off_3A1B0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3084;
  v16[3] = &unk_38810;
  id v5 = v4;
  id v17 = v5;
  [v3 setVisibleMarkersTestBlock:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_30E0;
  v14[3] = &unk_38838;
  id v15 = v5;
  id v6 = v5;
  [v3 setMarkerTextBlock:v14];
  id v7 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  id v8 = [v7 device];

  uint64_t v13 = 0;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  sub_29F0(v8, (uint64_t)v11);
  [v3 setMarkersDiameter:*(double *)&v12];
  long long v9 = [(NTKAlaskanSubdialViewFactory *)self _subdialViewWithOptions:v3 palette:self->_palette tag:30];

  return v9;
}

- (id)_15MinutesSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_38858];
  [v3 setMarkersCount:60];
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&off_3A120 forKeyedSubscript:&off_3A1B0];
  [v4 setObject:&off_3A0D8 forKeyedSubscript:&off_3A168];
  [v4 setObject:&off_3A108 forKeyedSubscript:&off_3A1C8];
  [v4 setObject:&off_3A138 forKeyedSubscript:&off_3A1E0];
  [v4 setObject:&off_3A168 forKeyedSubscript:&off_3A1F8];
  [v4 setObject:&off_3A120 forKeyedSubscript:&off_3A210];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_33E8;
  v16[3] = &unk_38810;
  id v5 = v4;
  id v17 = v5;
  [v3 setVisibleMarkersTestBlock:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_3444;
  v14[3] = &unk_38838;
  id v15 = v5;
  id v6 = v5;
  [v3 setMarkerTextBlock:v14];
  id v7 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  id v8 = [v7 device];

  uint64_t v13 = 0;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  sub_29F0(v8, (uint64_t)v11);
  [v3 setMarkersDiameter:*((double *)&v12 + 1)];
  long long v9 = [(NTKAlaskanSubdialViewFactory *)self _subdialViewWithOptions:v3 palette:self->_palette tag:15];

  return v9;
}

- (id)_3MinutesSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_38878];
  [v3 setMarkersCount:12];
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&off_3A0D8 forKeyedSubscript:&off_3A1B0];
  [v4 setObject:&off_3A228 forKeyedSubscript:&off_3A240];
  [v4 setObject:&off_3A258 forKeyedSubscript:&off_3A270];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_36A4;
  v14[3] = &unk_38810;
  id v5 = v4;
  id v15 = v5;
  [v3 setVisibleMarkersTestBlock:v14];
  long long v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_3700;
  long long v12 = &unk_38838;
  id v13 = v5;
  id v6 = v5;
  [v3 setMarkerTextBlock:&v9];
  id v7 = -[NTKAlaskanSubdialViewFactory _subdialViewWithOptions:palette:tag:](self, "_subdialViewWithOptions:palette:tag:", v3, self->_palette, 3, v9, v10, v11, v12);

  return v7;
}

- (id)_2MinutesSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_38898];
  [v3 setMarkersCount:12];
  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&off_3A258 forKeyedSubscript:&off_3A1B0];
  [v4 setObject:&off_3A228 forKeyedSubscript:&off_3A108];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_395C;
  v14[3] = &unk_38810;
  id v5 = v4;
  id v15 = v5;
  [v3 setVisibleMarkersTestBlock:v14];
  long long v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_39B8;
  long long v12 = &unk_38838;
  id v13 = v5;
  id v6 = v5;
  [v3 setMarkerTextBlock:&v9];
  id v7 = -[NTKAlaskanSubdialViewFactory _subdialViewWithOptions:palette:tag:](self, "_subdialViewWithOptions:palette:tag:", v3, self->_palette, 2, v9, v10, v11, v12);

  return v7;
}

- (id)_60secondsSubdialView
{
  v3 = [(NTKAlaskanSubdialViewFactory *)self createDefaultOptions];
  [v3 setTicksCount:60];
  [v3 setLargerTicksTestBlock:&stru_388B8];
  [v3 setMarkersCount:12];
  [v3 setVisibleMarkersTestBlock:&stru_388D8];
  [v3 setMarkerTextBlock:&stru_388F8];
  v4 = [(NTKAlaskanSubdialViewFactory *)self _subdialViewWithOptions:v3 palette:self->_palette tag:-60];

  return v4;
}

- (id)createDefaultOptions
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  sub_29F0(v4, (uint64_t)&v8);
  id v5 = objc_alloc_init(NTKAlaskanChronoSubdialViewOptions);
  [(NTKAlaskanChronoSubdialViewOptions *)v5 setLargeTickSize:v8];
  [(NTKAlaskanChronoSubdialViewOptions *)v5 setSmallTickSize:v9];
  [(NTKAlaskanChronoSubdialViewOptions *)v5 setTicksContentInset:*(double *)&v11];
  id v6 = [(NTKAlaskanSubdialViewFactory *)self markersFont];
  [(NTKAlaskanChronoSubdialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoSubdialViewOptions *)v5 setMarkersDiameter:*((double *)&v11 + 1)];

  return v5;
}

- (id)markersFont
{
  markersFont = self->_markersFont;
  if (!markersFont)
  {
    v4 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    id v5 = [v4 device];

    double v10 = 0.0;
    memset(v9, 0, sizeof(v9));
    sub_29F0(v5, (uint64_t)v9);
    id v6 = +[CLKFont nonAccessibleCompactSoftFontOfSize:v10 weight:UIFontWeightSemibold];
    id v7 = self->_markersFont;
    self->_markersFont = v6;

    markersFont = self->_markersFont;
  }

  return markersFont;
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

  objc_storeStrong((id *)&self->_markersFont, 0);
}

@end