@interface NTKAlaskanDialViewFactory
- (NTKChronographProFacePalette)palette;
- (id)_12HourDialView;
- (id)_30secondsDialView;
- (id)_3secondsDialView;
- (id)_60secondsDialView;
- (id)_6secondsDialView;
- (id)_tachymeterDialView;
- (void)setPalette:(id)a3;
@end

@implementation NTKAlaskanDialViewFactory

- (id)_12HourDialView
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  sub_DBB8(v4, &v25);
  v5 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksCount:120];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargerTicksTestBlock:&stru_38C20];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_DD28;
  v9[3] = &unk_38C40;
  long long v22 = v37;
  long long v23 = v38;
  long long v24 = v39;
  long long v18 = v33;
  long long v19 = v34;
  long long v20 = v35;
  long long v21 = v36;
  long long v14 = v29;
  long long v15 = v30;
  long long v16 = v31;
  long long v17 = v32;
  long long v10 = v25;
  long long v11 = v26;
  long long v12 = v27;
  long long v13 = v28;
  [(NTKAlaskanChronoDialViewOptions *)v5 setTickSizeAtIndexBlock:v9];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v5, "setLargeTicksAnchorPoint:", 0.5, 0.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v5, "setSmallTicksAnchorPoint:", 0.5, 0.0);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksContentInset:*(double *)&v31];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersCount:12];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleMarkersTestBlock:&stru_38C60];
  v6 = +[CLKFont nonAccessibleSystemFontOfSize:*(double *)&v32 weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersDiameter:*(double *)&v36];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkerTextBlock:&stru_38C80];
  v7 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v5, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v7;
}

- (id)_tachymeterDialView
{
  v2 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v3 = [v2 device];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  long long v28 = v3;
  sub_DBB8(v3, &v60);
  v4 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  id v5 = [&off_3ACB0 mutableCopy];
  LODWORD(v6) = 101;
  do
  {
    uint64_t v6 = (v6 - 1);
    v7 = +[NSNumber numberWithInt:v6];
    unsigned __int8 v8 = [&off_3AC98 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      v9 = +[NSNumber numberWithInt:v6];
      [v5 addObject:v9];
    }
  }
  while (v6 > 0x3D);
  long long v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[&off_3AC98 count] + 1);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = [&off_3AC98 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v57;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v57 != v13) {
          objc_enumerationMutation(&off_3AC98);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) floatValue];
        CLKInterpolateBetweenFloatsClipped();
        long long v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 addObject:v15];
      }
      id v12 = [&off_3AC98 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v12);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v52 objects:v75 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v53;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * (void)j) floatValue];
        CLKInterpolateBetweenFloatsClipped();
        long long v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v10 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v52 objects:v75 count:16];
    }
    while (v18);
  }

  [v10 addObject:&off_3A648];
  -[NTKAlaskanChronoDialViewOptions setMarkersCount:](v4, "setMarkersCount:", [&off_3AC98 count]);
  [(NTKAlaskanChronoDialViewOptions *)v4 setVisibleMarkersTestBlock:&stru_38CA0];
  long long v22 = +[CLKFont nonAccessibleSystemFontOfSize:*((double *)&v67 + 1) weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v4 setMarkersFont:v22];

  [(NTKAlaskanChronoDialViewOptions *)v4 setMarkersDiameter:*((double *)&v71 + 1)];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_E424;
  v50[3] = &unk_38838;
  v51 = &off_3AC98;
  [(NTKAlaskanChronoDialViewOptions *)v4 setMarkerTextBlock:v50];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_E494;
  v48[3] = &unk_38CC8;
  id v23 = v10;
  id v49 = v23;
  [(NTKAlaskanChronoDialViewOptions *)v4 setMarkersAngleProvider:v48];
  -[NTKAlaskanChronoDialViewOptions setTicksCount:](v4, "setTicksCount:", [v23 count]);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_E4A0;
  v46[3] = &unk_38CC8;
  id v47 = v23;
  id v24 = v23;
  [(NTKAlaskanChronoDialViewOptions *)v4 setTicksAngleProvider:v46];
  [(NTKAlaskanChronoDialViewOptions *)v4 setLargerTicksTestBlock:&stru_38CE8];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  long long v45 = v74;
  long long v42 = v71;
  long long v43 = v72;
  long long v44 = v73;
  long long v38 = v67;
  long long v39 = v68;
  long long v40 = v69;
  long long v41 = v70;
  long long v34 = v63;
  long long v35 = v64;
  long long v36 = v65;
  long long v37 = v66;
  long long v31 = v60;
  long long v32 = v61;
  v29[2] = sub_E4B4;
  v29[3] = &unk_38D10;
  long long v30 = &off_3AC98;
  long long v33 = v62;
  [(NTKAlaskanChronoDialViewOptions *)v4 setTickSizeAtIndexBlock:v29];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v4, "setLargeTicksAnchorPoint:", 0.5, 1.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v4, "setSmallTicksAnchorPoint:", 0.5, 1.0);
  [(NTKAlaskanChronoDialViewOptions *)v4 setTicksContentInset:*((double *)&v66 + 1)];
  long long v25 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v4, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v25;
}

- (id)_60secondsDialView
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  sub_DBB8(v4, &v25);
  id v5 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksCount:120];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargerTicksTestBlock:&stru_38D30];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_E750;
  v9[3] = &unk_38C40;
  long long v22 = v37;
  long long v23 = v38;
  long long v24 = v39;
  long long v18 = v33;
  long long v19 = v34;
  long long v20 = v35;
  long long v21 = v36;
  long long v14 = v29;
  long long v15 = v30;
  long long v16 = v31;
  long long v17 = v32;
  long long v10 = v25;
  long long v11 = v26;
  long long v12 = v27;
  long long v13 = v28;
  [(NTKAlaskanChronoDialViewOptions *)v5 setTickSizeAtIndexBlock:v9];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v5, "setLargeTicksAnchorPoint:", 0.5, 0.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v5, "setSmallTicksAnchorPoint:", 0.5, 0.0);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksContentInset:*(double *)&v31];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersCount:60];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleMarkersTestBlock:&stru_38D50];
  uint64_t v6 = +[CLKFont nonAccessibleSystemFontOfSize:*(double *)&v33 weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersDiameter:*(double *)&v37];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkerTextBlock:&stru_38D70];
  v7 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v5, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v7;
}

- (id)_30secondsDialView
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  sub_DBB8(v4, &v25);
  id v5 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksCount:120];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargerTicksTestBlock:&stru_38D90];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_EA38;
  v9[3] = &unk_38C40;
  long long v22 = v37;
  long long v23 = v38;
  long long v24 = v39;
  long long v18 = v33;
  long long v19 = v34;
  long long v20 = v35;
  long long v21 = v36;
  long long v14 = v29;
  long long v15 = v30;
  long long v16 = v31;
  long long v17 = v32;
  long long v10 = v25;
  long long v11 = v26;
  long long v12 = v27;
  long long v13 = v28;
  [(NTKAlaskanChronoDialViewOptions *)v5 setTickSizeAtIndexBlock:v9];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v5, "setLargeTicksAnchorPoint:", 0.5, 0.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v5, "setSmallTicksAnchorPoint:", 0.5, 0.0);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksContentInset:*(double *)&v31];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersCount:30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleMarkersTestBlock:&stru_38DB0];
  uint64_t v6 = +[CLKFont nonAccessibleSystemFontOfSize:*((double *)&v33 + 1) weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersDiameter:*((double *)&v37 + 1)];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkerTextBlock:&stru_38DD0];
  v7 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v5, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v7;
}

- (id)_6secondsDialView
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  sub_DBB8(v4, &v10);
  id v5 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksCount:150];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargerTicksTestBlock:&stru_38DF0];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargeTickSize:v10];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSmallTickSize:v11];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v5, "setLargeTicksAnchorPoint:", 0.5, 0.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v5, "setSmallTicksAnchorPoint:", 0.5, 0.0);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksContentInset:*(double *)&v16];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersCount:30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleMarkersTestBlock:&stru_38E10];
  uint64_t v6 = +[CLKFont nonAccessibleSystemFontOfSize:*(double *)&v19 weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersDiameter:*(double *)&v23];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkerTextBlock:&stru_38E30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setHasSecondaryMarkers:1];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersCount:30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleSecondaryMarkersTestBlock:&stru_38E50];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersDiameter:*((double *)&v23 + 1)];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkerTextBlock:&stru_38E70];
  v7 = +[CLKFont nonAccessibleSystemFontOfSize:*((double *)&v20 + 1) weight:UIFontWeightRegular];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersFont:v7];

  unsigned __int8 v8 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v5, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v8;
}

- (id)_3secondsDialView
{
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  sub_DBB8(v4, &v10);
  id v5 = objc_alloc_init(NTKAlaskanChronoDialViewOptions);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksCount:150];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargerTicksTestBlock:&stru_38E90];
  [(NTKAlaskanChronoDialViewOptions *)v5 setLargeTickSize:v10];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSmallTickSize:v11];
  -[NTKAlaskanChronoDialViewOptions setLargeTicksAnchorPoint:](v5, "setLargeTicksAnchorPoint:", 0.5, 0.0);
  -[NTKAlaskanChronoDialViewOptions setSmallTicksAnchorPoint:](v5, "setSmallTicksAnchorPoint:", 0.5, 0.0);
  [(NTKAlaskanChronoDialViewOptions *)v5 setTicksContentInset:*(double *)&v16];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersCount:30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleMarkersTestBlock:&stru_38EB0];
  uint64_t v6 = +[CLKFont nonAccessibleSystemFontOfSize:*(double *)&v20 weight:UIFontWeightSemibold];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersFont:v6];

  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkersDiameter:*(double *)&v24];
  [(NTKAlaskanChronoDialViewOptions *)v5 setMarkerTextBlock:&stru_38ED0];
  [(NTKAlaskanChronoDialViewOptions *)v5 setHasSecondaryMarkers:1];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersCount:30];
  [(NTKAlaskanChronoDialViewOptions *)v5 setVisibleSecondaryMarkersTestBlock:&stru_38EF0];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersDiameter:*((double *)&v24 + 1)];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkerTextBlock:&stru_38F10];
  v7 = +[CLKFont nonAccessibleSystemFontOfSize:*((double *)&v20 + 1) weight:UIFontWeightRegular];
  [(NTKAlaskanChronoDialViewOptions *)v5 setSecondaryMarkersFont:v7];

  unsigned __int8 v8 = -[NTKAlaskanChronoDialView initWithFrame:options:palette:]([NTKAlaskanChronoDialView alloc], "initWithFrame:options:palette:", v5, self->_palette, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v8;
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
}

@end