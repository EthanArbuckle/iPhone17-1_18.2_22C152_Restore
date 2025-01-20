@interface NTKGlobetrotterDialView
- (NTKGlobetrotterDialView)initWithFrame:(CGRect)a3 timeZoneHourOffset:(int64_t)a4 device:(id)a5;
- (UIView)hourMarkerDialView;
- (id)_dialMarkerAttributedStringForHour:(unint64_t)a3;
- (id)_hourMarkerFont;
- (id)_imageViewWithSymbolName:(id)a3 font:(id)a4;
- (id)_localTimeZone;
- (id)_newCityLabelWithCityIndex:(unint64_t)a3;
- (id)_newHourMarkerLabel;
- (int64_t)_hourMarkerDialIndexForHour:(int64_t)a3;
- (void)_rotateHourMarkerDialToCurrentTime;
- (void)_updateCityDialColor;
- (void)_updateColor:(id)a3 forObject:(id)a4;
- (void)_updateEditingImageColor;
- (void)_updateHourDialMarkers;
- (void)_updateHourMarkerDial;
- (void)_updateSunriseSunsetInfo;
- (void)applyTransitionFraction:(double)a3 fromNumeralOption:(id)a4 toNumeralOption:(id)a5;
- (void)cleanupAfterEditing;
- (void)layoutSubviews;
- (void)prepareForEditing;
- (void)setAlphaForNonHourMarkerSubviews:(double)a3;
- (void)setNumberSystem:(unint64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setTimeZoneHourOffset:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKGlobetrotterDialView

- (NTKGlobetrotterDialView)initWithFrame:(CGRect)a3 timeZoneHourOffset:(int64_t)a4 device:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v66.receiver = self;
  v66.super_class = (Class)NTKGlobetrotterDialView;
  v12 = -[NTKGlobetrotterDialView initWithFrame:](&v66, "initWithFrame:", x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a5);
    uint64_t v65 = 0;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    sub_7350(v11, (uint64_t)&v58);
    v13->_numberSystem = -1;
    if (NTKShowIndicScriptNumerals())
    {
      double v14 = *((double *)&v62 + 1);
      double v15 = UIFontWeightSemibold;
      v16 = +[NTKSFCompactFont numericRoundedFontOfSize:*((double *)&v62 + 1) weight:UIFontWeightSemibold];
      if (v16)
      {
LABEL_7:
        uint64_t v17 = [(NTKGlobetrotterDialView *)v13 _imageViewWithSymbolName:@"sun.max.fill" font:v16];
        sunriseImageView = v13->_sunriseImageView;
        v13->_sunriseImageView = (UIImageView *)v17;

        uint64_t v19 = [(NTKGlobetrotterDialView *)v13 _imageViewWithSymbolName:@"moon.fill" font:v16];
        sunsetImageView = v13->_sunsetImageView;
        v13->_sunsetImageView = (UIImageView *)v19;

        v13->_previousSunriseHour = 0x7FFFFFFFFFFFFFFFLL;
        v13->_previousSunsetHour = 0x7FFFFFFFFFFFFFFFLL;
        objc_initWeak(&location, v13);
        id v21 = objc_alloc((Class)NTKDialView);
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_7480;
        v55[3] = &unk_10508;
        objc_copyWeak(&v56, &location);
        v22 = (NTKDialView *)[v21 initWithNumberOfMarkers:12 markersFactory:v55];
        outerCityDialView = v13->_outerCityDialView;
        v13->_outerCityDialView = v22;

        [(NTKDialView *)v13->_outerCityDialView setShouldRotateMarkers:1];
        [(NTKGlobetrotterDialView *)v13 addSubview:v13->_outerCityDialView];
        id v24 = objc_alloc((Class)NTKDialView);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_74E0;
        v53[3] = &unk_10508;
        objc_copyWeak(&v54, &location);
        v25 = (NTKDialView *)[v24 initWithNumberOfMarkers:12 markersFactory:v53];
        innerCityDialView = v13->_innerCityDialView;
        v13->_innerCityDialView = v25;

        [(NTKDialView *)v13->_innerCityDialView setShouldRotateMarkers:1];
        [(NTKGlobetrotterDialView *)v13 addSubview:v13->_innerCityDialView];
        v27 = +[NSNull null];
        v67[0] = @"contents";
        v67[1] = @"backgroundColor";
        v68[0] = v27;
        v68[1] = v27;
        v67[2] = @"transform";
        v67[3] = @"bounds";
        v68[2] = v27;
        v68[3] = v27;
        v67[4] = @"position";
        v67[5] = @"opacity";
        v68[4] = v27;
        v68[5] = v27;
        v67[6] = @"hidden";
        v68[6] = v27;
        v28 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:7];
        id v29 = objc_alloc((Class)NTKDialView);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_7544;
        v42[3] = &unk_10530;
        objc_copyWeak(&v44, &location);
        long long v50 = v63;
        long long v51 = v64;
        long long v45 = v58;
        long long v46 = v59;
        long long v47 = v60;
        uint64_t v52 = v65;
        long long v48 = v61;
        long long v49 = v62;
        id v30 = v28;
        id v43 = v30;
        v31 = (NTKDialView *)[v29 initWithNumberOfMarkers:24 markersFactory:v42];
        cityDialDotsView = v13->_cityDialDotsView;
        v13->_cityDialDotsView = v31;

        [(NTKGlobetrotterDialView *)v13 addSubview:v13->_cityDialDotsView];
        v33 = (UIView *)objc_alloc_init((Class)UIView);
        nonHourMarkerOverlayView = v13->_nonHourMarkerOverlayView;
        v13->_nonHourMarkerOverlayView = v33;

        v35 = +[UIColor blackColor];
        [(UIView *)v13->_nonHourMarkerOverlayView setBackgroundColor:v35];

        [(UIView *)v13->_nonHourMarkerOverlayView setAlpha:0.0];
        [(NTKGlobetrotterDialView *)v13 addSubview:v13->_nonHourMarkerOverlayView];
        id v36 = objc_alloc((Class)NTKDialView);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_7644;
        v40[3] = &unk_10508;
        objc_copyWeak(&v41, &location);
        v37 = (NTKDialView *)[v36 initWithNumberOfMarkers:24 markersFactory:v40];
        hourMarkerDialView = v13->_hourMarkerDialView;
        v13->_hourMarkerDialView = v37;

        [(NTKDialView *)v13->_hourMarkerDialView setShouldPixelAlignCenterPoints:0];
        [(NTKDialView *)v13->_hourMarkerDialView setShouldRotateMarkers:1];
        [(NTKGlobetrotterDialView *)v13 addSubview:v13->_hourMarkerDialView];
        [(NTKGlobetrotterDialView *)v13 layoutIfNeeded];
        [(NTKGlobetrotterDialView *)v13 setTimeZoneHourOffset:0];
        objc_destroyWeak(&v41);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v54);
        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);

        goto LABEL_8;
      }
    }
    else
    {
      double v14 = *((double *)&v62 + 1);
      double v15 = UIFontWeightSemibold;
    }
    v16 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v14 design:v15];
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKGlobetrotterDialView;
  [(NTKGlobetrotterDialView *)&v24 layoutSubviews];
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  memset(v19, 0, sizeof(v19));
  sub_7350(self->_device, (uint64_t)v19);
  [(NTKGlobetrotterDialView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[NTKDialView setFrame:](self->_outerCityDialView, "setFrame:");
  -[NTKDialView setFrame:](self->_innerCityDialView, "setFrame:", v4, v6, v8, v10);
  -[NTKDialView setFrame:](self->_cityDialDotsView, "setFrame:", 0.0, 0.0, *(double *)&v20, *(double *)&v20);
  -[NTKDialView setFrame:](self->_hourMarkerDialView, "setFrame:", 0.0, 0.0, *((double *)&v21 + 1), *((double *)&v21 + 1));
  -[UIView setFrame:](self->_nonHourMarkerOverlayView, "setFrame:", v4, v6, v8, v10);
  CLKRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  -[NTKDialView setCenter:](self->_outerCityDialView, "setCenter:");
  -[NTKDialView setCenter:](self->_innerCityDialView, "setCenter:", v12, v14);
  -[NTKDialView setCenter:](self->_cityDialDotsView, "setCenter:", v12, v14);
  -[NTKDialView setCenter:](self->_hourMarkerDialView, "setCenter:", v12, v14);
  [(NTKDialView *)self->_hourMarkerDialView setContentInset:*(double *)&v22];
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  double MidX = CGRectGetMidX(v25);
  v16 = [(NTKGlobetrotterDialView *)self layer];
  [v16 setCornerRadius:MidX];

  [(NTKDialView *)self->_hourMarkerDialView bounds];
  double v17 = CGRectGetMidX(v26);
  v18 = [(NTKDialView *)self->_hourMarkerDialView layer];
  [v18 setCornerRadius:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGlobetrotterDialView;
  id v4 = a3;
  [(NTKGlobetrotterDialView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(NTKGlobetrotterDialView *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    [(NTKDialView *)self->_outerCityDialView reloadMarkers];
    [(NTKDialView *)self->_innerCityDialView reloadMarkers];
    [(NTKGlobetrotterDialView *)self setTimeZoneHourOffset:self->_timeZoneHourOffset];
    [(NTKGlobetrotterDialView *)self _updateCityDialColor];
  }
}

- (void)prepareForEditing
{
  id v3 = objc_alloc((Class)UIGraphicsImageRenderer);
  [(NTKGlobetrotterDialView *)self bounds];
  id v4 = objc_msgSend(v3, "initWithBounds:");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7A9C;
  v9[3] = &unk_10558;
  v9[4] = self;
  double v5 = [v4 imageWithActions:v9];
  id v6 = [v5 imageWithRenderingMode:2];

  id v7 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
  editingImageView = self->_editingImageView;
  self->_editingImageView = v7;

  [(NTKGlobetrotterDialView *)self _updateEditingImageColor];
  [(NTKGlobetrotterDialView *)self addSubview:self->_editingImageView];
  [(NTKDialView *)self->_outerCityDialView setHidden:1];
  [(NTKDialView *)self->_innerCityDialView setHidden:1];
}

- (void)cleanupAfterEditing
{
  [(NTKGlobetrotterDialView *)self _updateCityDialColor];
  [(NTKDialView *)self->_outerCityDialView setHidden:0];
  [(NTKDialView *)self->_innerCityDialView setHidden:0];
  [(UIImageView *)self->_editingImageView removeFromSuperview];
  editingImageView = self->_editingImageView;
  self->_editingImageView = 0;
}

- (void)setPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  id v6 = [v5 dialBackground];
  [(NTKGlobetrotterDialView *)self setBackgroundColor:v6];

  if (self->_editingImageView) {
    [(NTKGlobetrotterDialView *)self _updateEditingImageColor];
  }
  else {
    [(NTKGlobetrotterDialView *)self _updateCityDialColor];
  }
  id v7 = [v5 hourMarkerLabel];
  [(UIImageView *)self->_sunriseImageView setTintColor:v7];
  [(UIImageView *)self->_sunsetImageView setTintColor:v7];
  cityDialDotsView = self->_cityDialDotsView;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_7DA0;
  v15[3] = &unk_10580;
  v15[4] = self;
  id v16 = v5;
  id v9 = v5;
  [(NTKDialView *)cityDialDotsView enumerateMarkers:v15];
  double v10 = [v9 hourMarkerDialBackground];
  [(NTKDialView *)self->_hourMarkerDialView setBackgroundColor:v10];

  hourMarkerDialView = self->_hourMarkerDialView;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7E2C;
  v13[3] = &unk_10580;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [(NTKDialView *)hourMarkerDialView enumerateMarkers:v13];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_overrideDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NTKGlobetrotterDialView *)self _rotateHourMarkerDialToCurrentTime];
  }
}

- (void)setAlphaForNonHourMarkerSubviews:(double)a3
{
  [(UIView *)self->_nonHourMarkerOverlayView setAlpha:1.0 - a3];
  editingImageView = self->_editingImageView;

  [(UIImageView *)editingImageView setAlpha:a3];
}

- (UIView)hourMarkerDialView
{
  return (UIView *)self->_hourMarkerDialView;
}

- (void)applyTransitionFraction:(double)a3 fromNumeralOption:(id)a4 toNumeralOption:(id)a5
{
  id v8 = a5;
  [a4 numeralOption];
  uint64_t v9 = CLKLocaleNumberSystemFromNumeralOption();
  [v8 numeralOption];

  uint64_t v10 = CLKLocaleNumberSystemFromNumeralOption();
  if (v9 == v10)
  {
    [(NTKGlobetrotterDialView *)self setNumberSystem:v9];
  }
  else
  {
    if (a3 >= 0.5)
    {
      uint64_t v13 = v10;
      CLKMapFractionIntoRange();
      double v12 = v14;
      uint64_t v9 = v13;
    }
    else
    {
      CLKMapFractionIntoRange();
      double v12 = v11;
    }
    [(NTKGlobetrotterDialView *)self setNumberSystem:v9];
    id v15 = [(NTKDialView *)self->_hourMarkerDialView markerContainerView];
    [v15 setAlpha:v12];
  }
}

- (void)_rotateHourMarkerDialToCurrentTime
{
  id v8 = [(NTKGlobetrotterDialView *)self _currentDate];
  uint64_t v3 = NTKDateHourIn24HourTime();
  id v4 = [(NTKGlobetrotterDialView *)self _localTimeZone];
  if ([v4 isDaylightSavingTimeForDate:v8])
  {
    [v4 daylightSavingTimeOffsetForDate:v8];
    double v6 = (double)v3 + v5 / -3600.0;
    if ((uint64_t)v6) {
      uint64_t v3 = (uint64_t)v6;
    }
    else {
      uint64_t v3 = 24;
    }
  }
  [(NTKDialView *)self->_hourMarkerDialView angleForIndex:(double)[(NTKGlobetrotterDialView *)self _hourMarkerDialIndexForHour:v3]];
  [(NTKDialView *)self->_hourMarkerDialView setAngleOffset:-(v7 + -180.0)];
  [(NTKGlobetrotterDialView *)self _updateHourDialMarkers];
}

- (void)_updateHourDialMarkers
{
  [(NTKDialView *)self->_hourMarkerDialView angleOffset];
  unint64_t v4 = llround(v3 / 15.0);
  [(NTKDialView *)self->_outerCityDialView angleOffset];
  uint64_t v6 = (uint64_t)(v5 / 15.0);
  double v7 = [(NTKGlobetrotterDialView *)self _currentDate];
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  sub_7350(self->_device, (uint64_t)&v25);
  hourMarkerDialView = self->_hourMarkerDialView;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8308;
  v12[3] = &unk_105A8;
  unint64_t v14 = v4;
  uint64_t v15 = v6;
  v12[4] = self;
  id v13 = v7;
  long long v16 = xmmword_CEC0;
  long long v21 = v29;
  long long v22 = v30;
  long long v23 = v31;
  uint64_t v24 = v32;
  long long v17 = v25;
  long long v18 = v26;
  long long v19 = v27;
  long long v20 = v28;
  id v9 = v7;
  [(NTKDialView *)hourMarkerDialView enumerateMarkers:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_84C8;
  v10[3] = &unk_105C8;
  v10[4] = v4;
  long long v11 = xmmword_CEC0;
  [(NTKDialView *)self->_hourMarkerDialView setMarkerRotationProvider:v10];
}

- (id)_dialMarkerAttributedStringForHour:(unint64_t)a3
{
  double v5 = CLKLocaleNumberSystemIdentifier();
  uint64_t v6 = +[NSString stringWithFormat:@"en_US@numbers=%@", v5];
  id v7 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v6];
  id v8 = objc_alloc((Class)NSString);
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = [v8 initWithFormat:@"%@", v7, v9 locale];

  long long v11 = CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
  double v12 = [(NTKGlobetrotterDialView *)self _hourMarkerFont];
  id v13 = objc_alloc((Class)NSAttributedString);
  v17[0] = NSLanguageIdentifierAttributeName;
  v17[1] = NSFontAttributeName;
  v18[0] = v11;
  v18[1] = v12;
  unint64_t v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v15 = [v13 initWithString:v10 attributes:v14];

  return v15;
}

- (void)setTimeZoneHourOffset:(int64_t)a3
{
  self->_timeZoneHourOffset = a3;
  double v5 = (double)a3;
  double v6 = (double)a3 * 15.0;
  [(NTKDialView *)self->_outerCityDialView setAngleOffset:v6];
  [(NTKDialView *)self->_innerCityDialView setAngleOffset:v6 + 15.0];
  if (a3 < 0)
  {
    uint64_t v7 = -(uint64_t)((unint64_t)-a3 >> 1);
  }
  else if (a3)
  {
    uint64_t v7 = llround(v5 * 0.5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v43 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  sub_7350(self->_device, (uint64_t)&v36);
  outerCityDialView = self->_outerCityDialView;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_89B8;
  v26[3] = &unk_105E8;
  long long v32 = v40;
  long long v33 = v41;
  long long v34 = v42;
  long long v28 = v36;
  long long v29 = v37;
  long long v30 = v38;
  long long v27 = xmmword_CED0;
  v26[4] = v7;
  uint64_t v35 = v43;
  long long v31 = v39;
  [(NTKDialView *)outerCityDialView enumerateMarkers:v26];
  if (a3 < 1)
  {
    if (a3 < 0) {
      unint64_t v9 = llround(v5 * 0.5);
    }
    else {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = (unint64_t)a3 >> 1;
  }
  innerCityDialView = self->_innerCityDialView;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8A7C;
  v16[3] = &unk_105E8;
  long long v22 = v40;
  long long v23 = v41;
  long long v24 = v42;
  long long v18 = v36;
  long long v19 = v37;
  long long v20 = v38;
  long long v17 = xmmword_CEE0;
  v16[4] = v9;
  uint64_t v25 = v43;
  long long v21 = v39;
  -[NTKDialView enumerateMarkers:](innerCityDialView, "enumerateMarkers:", v16, 3, 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_8B40;
  v14[3] = &unk_105C8;
  v14[4] = v7;
  long long v15 = xmmword_CED0;
  [(NTKDialView *)self->_outerCityDialView setMarkerRotationProvider:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8B90;
  v12[3] = &unk_105C8;
  v12[4] = v9;
  long long v13 = v11;
  [(NTKDialView *)self->_innerCityDialView setMarkerRotationProvider:v12];
  [(NTKGlobetrotterDialView *)self _updateHourMarkerDial];
}

- (void)setNumberSystem:(unint64_t)a3
{
  if (self->_numberSystem != a3)
  {
    self->_numberSystem = a3;
    [(NTKGlobetrotterDialView *)self _updateHourDialMarkers];
    hourMarkerDialView = self->_hourMarkerDialView;
    [(NTKDialView *)hourMarkerDialView setNeedsLayout];
  }
}

- (void)_updateHourMarkerDial
{
  [(NTKGlobetrotterDialView *)self _updateSunriseSunsetInfo];

  [(NTKGlobetrotterDialView *)self _rotateHourMarkerDialToCurrentTime];
}

- (void)_updateSunriseSunsetInfo
{
  double v3 = +[NTKGlobetrotterCityManager sharedInstance];
  [v3 cityCoordinateForHourOffset:self->_timeZoneHourOffset];
  double v5 = v4;
  uint64_t v7 = v6;

  id v8 = [(NTKGlobetrotterDialView *)self _currentDate];
  objc_initWeak(&location, self);
  unint64_t v9 = dispatch_get_global_queue(25, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8DA4;
  v11[3] = &unk_10638;
  objc_copyWeak(v14, &location);
  v14[1] = v5;
  v14[2] = v7;
  id v12 = v8;
  long long v13 = self;
  id v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (int64_t)_hourMarkerDialIndexForHour:(int64_t)a3
{
  return 24 - a3;
}

- (id)_localTimeZone
{
  return +[NTKGlobetrotterCityManager idealizedTimeZone];
}

- (id)_newHourMarkerLabel
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  memset(v7, 0, sizeof(v7));
  sub_7350(self->_device, (uint64_t)v7);
  id v3 = objc_alloc_init((Class)CLKUICurvedColoringLabel);
  unint64_t v4 = [(NTKGlobetrotterDialView *)self _hourMarkerFont];
  [v3 setFont:v4];

  [v3 setTracking:*(double *)&v8];
  double v5 = [(UIImageView *)self->_sunriseImageView tintColor];
  [v3 setTextColor:v5];

  return v3;
}

- (id)_hourMarkerFont
{
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_7350(self->_device, (uint64_t)v5);
  double v2 = *((double *)&v6 + 1);
  if (NTKShowIndicScriptNumerals()) {
    +[NTKSFCompactFont numericRoundedFontOfSize:v2 weight:UIFontWeightSemibold];
  }
  else {
  id v3 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v2 design:UIFontWeightSemibold];
  }

  return v3;
}

- (id)_newCityLabelWithCityIndex:(unint64_t)a3
{
  double v5 = +[NTKGlobetrotterCityManager sharedInstance];
  long long v6 = [v5 displayNameForCityAtIndex:a3];

  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  sub_7350(self->_device, (uint64_t)v10);
  id v7 = objc_alloc_init((Class)CLKUICurvedColoringLabel);
  long long v8 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*(double *)&v11 design:UIFontWeightSemibold];
  [v7 setFont:v8];

  [v7 setTracking:*((double *)&v11 + 1)];
  [v7 setText:v6];
  [v7 sizeToFit];

  return v7;
}

- (id)_imageViewWithSymbolName:(id)a3 font:(id)a4
{
  id v5 = a3;
  long long v6 = +[UIImageSymbolConfiguration configurationWithFont:a4];
  id v7 = +[UIImage systemImageNamed:v5 withConfiguration:v6];

  long long v8 = [v7 imageWithRenderingMode:2];

  id v9 = [objc_alloc((Class)UIImageView) initWithImage:v8];

  return v9;
}

- (void)_updateColor:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setTextColor:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setTintColor:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
      }
    }
  }
}

- (void)_updateCityDialColor
{
  outerCityDialView = self->_outerCityDialView;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9670;
  v6[3] = &unk_10660;
  v6[4] = self;
  [(NTKDialView *)outerCityDialView enumerateMarkers:v6];
  innerCityDialView = self->_innerCityDialView;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_96EC;
  v5[3] = &unk_10660;
  _OWORD v5[4] = self;
  [(NTKDialView *)innerCityDialView enumerateMarkers:v5];
}

- (void)_updateEditingImageColor
{
  id v3 = [(NTKGlobetrotterColorPalette *)self->_palette cityDialLabel];
  [(NTKGlobetrotterDialView *)self _updateColor:v3 forObject:self->_editingImageView];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_editingImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_hourMarkerDialView, 0);
  objc_storeStrong((id *)&self->_nonHourMarkerOverlayView, 0);
  objc_storeStrong((id *)&self->_cityDialDotsView, 0);
  objc_storeStrong((id *)&self->_innerCityDialView, 0);
  objc_storeStrong((id *)&self->_outerCityDialView, 0);
  objc_storeStrong((id *)&self->_sunsetImageView, 0);

  objc_storeStrong((id *)&self->_sunriseImageView, 0);
}

@end