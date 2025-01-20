@interface NTKAlaskanDiverStyleView
- (BOOL)doneButtonTapped;
- (BOOL)forceInactiveMode;
- (BOOL)hasCountUpStarted;
- (BOOL)hasRotatedToMinuteHand;
- (BOOL)isAnimationInProgress;
- (BOOL)isEditing;
- (BOOL)showTimelapsedByMinutes;
- (BOOL)syncMarkerWithMinuteHand;
- (CALayer)countUpBackgroundLayer;
- (CGSize)previousBoundsSize;
- (CLKDevice)device;
- (CLKUIColoringLabel)countUpLabel;
- (NSDate)overrideDate;
- (NSDate)startDate;
- (NTKAlaskanDialView)innerDialView;
- (NTKAlaskanDialView)minutesMarkerView;
- (NTKAlaskanDialView)ticksView;
- (NTKAlaskanDialView)trackingTicksView;
- (NTKAlaskanDiverStyleView)initWithFrame:(CGRect)a3;
- (NTKAlaskanDiverStyleViewDelegate)delegate;
- (NTKAlaskanDiversColorPalette)palette;
- (UIImageView)markerFillIcon;
- (UIImageView)markerOutlineIcon;
- (double)angleOffsetForDate:(id)a3;
- (double)countUpLabelAlpha;
- (double)targetAngleOffsetForOffset:(double)a3;
- (double)timeIntervalBetweenStartDate:(id)a3 date:(id)a4;
- (double)timeOffset;
- (id)_countUpLabelTextColor;
- (id)_timelapsedTextProviderWithStartDate:(id)a3;
- (id)_timelapsedTextProviderWithStartDate:(id)a3 forcePaused:(BOOL)a4;
- (id)countUpLabelColor;
- (id)currentDate;
- (id)innerDialViewBackgroundColor;
- (int64_t)currentCountUp;
- (unint64_t)angleOffset;
- (unint64_t)currentMode;
- (void)_setAngleOffset:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setAngleOffset:(double)a3 animated:(BOOL)a4 progressCallback:(id)a5 completionBlock:(id)a6;
- (void)setAngleOffset:(double)a3 animated:(BOOL)a4 progressCallback:(id)a5 completionBlock:(id)a6 animationDuration:(double)a7;
- (void)setAngleOffset:(unint64_t)a3;
- (void)setCountUpBackgroundLayer:(id)a3;
- (void)setCountUpLabel:(id)a3;
- (void)setCurrentCountUp:(int64_t)a3;
- (void)setCurrentMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDisableMarkerTracking:(BOOL)a3;
- (void)setDoneButtonTapped:(BOOL)a3;
- (void)setForceInactiveMode:(BOOL)a3;
- (void)setHasRotatedToMinuteHand:(BOOL)a3;
- (void)setInnerDialView:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setMarkerFillIcon:(id)a3;
- (void)setMarkerOutlineIcon:(id)a3;
- (void)setMinutesMarkerView:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPalette:(id)a3;
- (void)setPreviousBoundsSize:(CGSize)a3;
- (void)setShowTimelapsedByMinutes:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDate:(id)a3 animated:(BOOL)a4;
- (void)setStartDate:(id)a3 animated:(BOOL)a4 setAngleOffset:(double)a5;
- (void)setSyncMarkerWithMinuteHand:(BOOL)a3;
- (void)setTicksView:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTrackingTicksView:(id)a3;
- (void)updateColor:(id)a3 object:(id)a4;
- (void)updateCountUp;
- (void)updateFrameForCountUpLabel;
- (void)updateStartDate;
- (void)updateTicksForCurrentTime;
- (void)updateTrackingTicks;
- (void)updateViewStateAnimated:(BOOL)a3;
@end

@implementation NTKAlaskanDiverStyleView

- (NTKAlaskanDiverStyleView)initWithFrame:(CGRect)a3
{
  v123.receiver = self;
  v123.super_class = (Class)NTKAlaskanDiverStyleView;
  v3 = -[NTKAlaskanDiverStyleView initWithFrame:](&v123, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v7 = +[UIColor blackColor];
    [(NTKAlaskanDiverStyleView *)v3 setBackgroundColor:v7];

    uint64_t v122 = 0;
    long long v121 = 0u;
    long long v120 = 0u;
    long long v119 = 0u;
    long long v118 = 0u;
    long long v117 = 0u;
    long long v116 = 0u;
    long long v115 = 0u;
    long long v114 = 0u;
    long long v113 = 0u;
    long long v112 = 0u;
    long long v111 = 0u;
    long long v110 = 0u;
    long long v109 = 0u;
    long long v108 = 0u;
    v8 = [(NTKAlaskanDiverStyleView *)v3 device];
    sub_1F17C(v8, (uint64_t)&v108);

    v9 = +[NSNull null];
    v124[0] = @"contents";
    v124[1] = @"backgroundColor";
    v125[0] = v9;
    v125[1] = v9;
    v124[2] = @"transform";
    v124[3] = @"bounds";
    v125[2] = v9;
    v125[3] = v9;
    v124[4] = @"position";
    v124[5] = @"opacity";
    v125[4] = v9;
    v125[5] = v9;
    v124[6] = @"hidden";
    v125[6] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:7];
    objc_initWeak(&location, v3);
    v11 = [NTKAlaskanDialView alloc];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1F2C4;
    v89[3] = &unk_39288;
    objc_copyWeak(&v91, &location);
    long long v104 = v120;
    long long v105 = v121;
    uint64_t v106 = v122;
    long long v100 = v116;
    long long v101 = v117;
    long long v103 = v119;
    long long v102 = v118;
    long long v96 = v112;
    long long v97 = v113;
    long long v99 = v115;
    long long v98 = v114;
    long long v92 = v108;
    long long v93 = v109;
    long long v94 = v110;
    long long v95 = v111;
    id v12 = v10;
    id v90 = v12;
    v13 = [(NTKAlaskanDialView *)v11 initWithNumberOfMarkers:12 markersFactory:v89];
    innerDialView = v3->_innerDialView;
    v3->_innerDialView = v13;

    v15 = [(NTKAlaskanDiverStyleView *)v3 innerDialViewBackgroundColor];
    [(NTKAlaskanDialView *)v3->_innerDialView setBackgroundColor:v15];

    [(NTKAlaskanDialView *)v3->_innerDialView setContentDiameter:*((double *)&v109 + 1)];
    v16 = +[NSMutableIndexSet indexSet];
    [v16 addIndex:0];
    [v16 addIndex:1];
    [v16 addIndex:3];
    [v16 addIndex:5];
    [v16 addIndex:7];
    [v16 addIndex:9];
    [v16 addIndex:11];
    v17 = [NTKAlaskanDialView alloc];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1F3B4;
    v70[3] = &unk_392B0;
    objc_copyWeak(&v72, &location);
    long long v85 = v120;
    long long v86 = v121;
    long long v81 = v116;
    long long v82 = v117;
    long long v83 = v118;
    long long v84 = v119;
    long long v77 = v112;
    long long v78 = v113;
    long long v79 = v114;
    long long v80 = v115;
    long long v73 = v108;
    long long v74 = v109;
    long long v75 = v110;
    long long v76 = v111;
    uint64_t v87 = v122;
    uint64_t v88 = 12;
    id v18 = v12;
    id v71 = v18;
    v19 = [(NTKAlaskanDialView *)v17 initWithNumberOfMarkers:12 markersFactory:v70];
    minutesMarkerView = v3->_minutesMarkerView;
    v3->_minutesMarkerView = v19;

    [(NTKAlaskanDialView *)v3->_minutesMarkerView setShouldPixelAlignCenterPoints:0];
    [(NTKAlaskanDialView *)v3->_minutesMarkerView setShouldRotateMarkers:0];
    [(NTKAlaskanDialView *)v3->_minutesMarkerView setMarkersToRotateIndexSet:v16];
    v21 = [(NTKAlaskanDiversColorPalette *)v3->_palette ring];
    [(NTKAlaskanDialView *)v3->_minutesMarkerView setBackgroundColor:v21];

    v22 = +[NSMutableIndexSet indexSet];
    [v22 addIndex:0];
    [v22 addIndex:10];
    [v22 addIndex:20];
    [v22 addIndex:30];
    [v22 addIndex:40];
    [v22 addIndex:50];
    [v22 addIndex:60];
    v23 = [NTKAlaskanDialView alloc];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1F6E0;
    v52[3] = &unk_39288;
    objc_copyWeak(&v54, &location);
    id v24 = v22;
    long long v67 = v120;
    long long v68 = v121;
    id v33 = v24;
    id v53 = v24;
    uint64_t v69 = v122;
    long long v63 = v116;
    long long v64 = v117;
    long long v65 = v118;
    long long v66 = v119;
    long long v59 = v112;
    long long v60 = v113;
    long long v61 = v114;
    long long v62 = v115;
    long long v55 = v108;
    long long v56 = v109;
    long long v57 = v110;
    long long v58 = v111;
    v25 = [(NTKAlaskanDialView *)v23 initWithNumberOfMarkers:60 markersFactory:v52];
    trackingTicksView = v3->_trackingTicksView;
    v3->_trackingTicksView = v25;

    [(NTKAlaskanDialView *)v3->_trackingTicksView setShouldRotateMarkers:1];
    [(NTKAlaskanDialView *)v3->_trackingTicksView setShouldPixelAlignCenterPoints:0];
    v27 = [NTKAlaskanDialView alloc];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1F8FC;
    v34[3] = &unk_39288;
    objc_copyWeak(&v36, &location);
    id v28 = v18;
    id v35 = v28;
    long long v49 = v120;
    long long v50 = v121;
    uint64_t v51 = v122;
    long long v45 = v116;
    long long v46 = v117;
    long long v47 = v118;
    long long v48 = v119;
    long long v41 = v112;
    long long v42 = v113;
    long long v43 = v114;
    long long v44 = v115;
    long long v37 = v108;
    long long v38 = v109;
    long long v39 = v110;
    long long v40 = v111;
    v29 = [(NTKAlaskanDialView *)v27 initWithNumberOfMarkers:60 markersFactory:v34];
    ticksView = v3->_ticksView;
    v3->_ticksView = v29;

    [(NTKAlaskanDialView *)v3->_ticksView setShouldRotateMarkers:1];
    [(NTKAlaskanDiverStyleView *)v3 addSubview:v3->_minutesMarkerView];
    [(NTKAlaskanDiverStyleView *)v3 addSubview:v3->_innerDialView];
    [(NTKAlaskanDiverStyleView *)v3 addSubview:v3->_trackingTicksView];
    [(NTKAlaskanDiverStyleView *)v3 addSubview:v3->_ticksView];
    [(NTKAlaskanDiverStyleView *)v3 updateViewStateAnimated:0];
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v3->_minutesMarkerView selector:"reloadMarkers" name:UIAccessibilityBoldTextStatusDidChangeNotification object:0];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v54);

    objc_destroyWeak(&v72);
    objc_destroyWeak(&v91);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  innerDialView = self->_innerDialView;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1FCD8;
  v32[3] = &unk_391B0;
  v32[4] = self;
  id v7 = v5;
  id v33 = v7;
  [(NTKAlaskanDialView *)innerDialView enumerateMarkers:v32];
  minutesMarkerView = self->_minutesMarkerView;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1FD48;
  v30[3] = &unk_391B0;
  v30[4] = self;
  id v9 = v7;
  id v31 = v9;
  [(NTKAlaskanDialView *)minutesMarkerView enumerateMarkers:v30];
  trackingTicksView = self->_trackingTicksView;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1FDB8;
  v28[3] = &unk_391B0;
  v28[4] = self;
  id v11 = v9;
  id v29 = v11;
  [(NTKAlaskanDialView *)trackingTicksView enumerateMarkers:v28];
  id v12 = [(NTKAlaskanDiversColorPalette *)self->_palette ring];
  [(NTKAlaskanDialView *)self->_minutesMarkerView setBackgroundColor:v12];

  ticksView = self->_ticksView;
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_1FE28;
  v25 = &unk_391B0;
  v26 = self;
  id v27 = v11;
  id v14 = v11;
  [(NTKAlaskanDialView *)ticksView enumerateMarkers:&v22];
  v15 = [(NTKAlaskanDiverStyleView *)self innerDialViewBackgroundColor];
  [(NTKAlaskanDialView *)self->_innerDialView setBackgroundColor:v15];

  v16 = [(NTKAlaskanDiverStyleView *)self palette];
  v17 = [v16 markerFillColor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_markerFillIcon);
  [WeakRetained setTintColor:v17];

  v19 = [(NTKAlaskanDiverStyleView *)self palette];
  v20 = [v19 markerOutlineColor];
  id v21 = objc_loadWeakRetained((id *)&self->_markerOutlineIcon);
  [v21 setTintColor:v20];
}

- (void)updateColor:(id)a3 object:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setTextColor:v8];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setTintColor:v8];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    id v7 = v8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v7 = [v8 CGColor];
    v6 = v5;
  }
  [v6 setBackgroundColor:v7];
LABEL_10:
}

- (void)setCurrentMode:(unint64_t)a3
{
  self->_currentMode = a3;
  if (!a3)
  {
    id v5 = [(NTKAlaskanDiversColorPalette *)self->_palette markerFillColor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_markerFillIcon);
    [WeakRetained setTintColor:v5];
  }
}

- (void)setDisableMarkerTracking:(BOOL)a3
{
  self->_syncMarkerWithMinuteHand = a3;
  if (!a3)
  {
    id v4 = [(NTKAlaskanDiverStyleView *)self currentDate];
    [(NTKAlaskanDiverStyleView *)self setDate:v4];
  }
}

- (void)updateTicksForCurrentTime
{
  v3 = [(NTKAlaskanDiverStyleView *)self currentDate];
  id v4 = [(NTKAlaskanDiverStyleView *)self currentDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (self->_currentMode == 1)
  {
    id v8 = [(NTKAlaskanDiverStyleView *)self startDate];
    id v7 = [v8 dateByAddingTimeInterval:v6];
    [(NTKAlaskanDiverStyleView *)self setStartDate:v7];
  }
  else
  {
    [(NTKAlaskanDiverStyleView *)self updateCountUp];
  }
}

- (void)setOverrideDate:(id)a3
{
  id v5 = a3;
  if ((NTKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NTKAlaskanDiverStyleView *)self updateTicksForCurrentTime];
  }
}

- (id)currentDate
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    v3 = overrideDate;
  }
  else
  {
    v3 = +[NSDate date];
  }

  return v3;
}

- (void)setStartDate:(id)a3
{
}

- (void)setStartDate:(id)a3 animated:(BOOL)a4
{
}

- (void)setStartDate:(id)a3 animated:(BOOL)a4 setAngleOffset:(double)a5
{
  BOOL v6 = a4;
  id v9 = (id)[(NSDate *)self->_startDate isEqualToDate:a3];
  if ((v9 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_startDate, a3);
    [(NTKAlaskanDiverStyleView *)self updateCountUp];
    [(NTKAlaskanDiverStyleView *)self angleOffsetForDate:self->_startDate];
    if (a5 != 0.0) {
      -[NTKAlaskanDiverStyleView setAngleOffset:animated:progressCallback:completionBlock:](self, "setAngleOffset:animated:progressCallback:completionBlock:", v6, 0, 0);
    }
    id v9 = [(NTKAlaskanDiverStyleView *)self updateViewStateAnimated:v6];
  }

  _objc_release_x1(v9);
}

- (void)updateViewStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_204A8;
  v10[3] = &unk_38B68;
  objc_copyWeak(&v11, &location);
  id v5 = objc_retainBlock(v10);
  BOOL v6 = v5;
  if (v3)
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    id v7 = [(NTKAlaskanDiverStyleView *)self device];
    sub_1F17C(v7, (uint64_t)v8);

    +[UIView animateWithDuration:v6 animations:*((double *)v8 + 1)];
  }
  else
  {
    ((void (*)(void *))v5[2])(v5);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)updateCountUp
{
  BOOL v3 = [(NTKAlaskanDiverStyleView *)self countUpLabel];
  [v3 setTextProvider:0];

  if (self->_currentMode == 1)
  {
    id v4 = [(NTKAlaskanDiverStyleView *)self startDate];
    id v5 = [(NTKAlaskanDiverStyleView *)self currentDate];
    [(NTKAlaskanDiverStyleView *)self timeIntervalBetweenStartDate:v4 date:v5];
    double v7 = v6;

    if (self->_currentCountUp == (uint64_t)v7) {
      goto LABEL_8;
    }
    self->_currentCountUp = (uint64_t)v7;
    id v8 = [(NTKAlaskanDiverStyleView *)self delegate];
    [v8 alaskanDiverStyleView:self didRotateDialToMinuteOffset:self->_currentCountUp];

    uint64_t v9 = +[NTKTroutFaceBundle localizedStringForKey:@"ALASKAN_COUNT_UP_ALERT_ACTION_START" comment:@"Start"];
    v10 = [(NTKAlaskanDiverStyleView *)self countUpLabel];
    [v10 setText:v9];
  }
  else if (self->_startDate)
  {
    uint64_t v9 = -[NTKAlaskanDiverStyleView _timelapsedTextProviderWithStartDate:](self, "_timelapsedTextProviderWithStartDate:");
    v10 = [(NTKAlaskanDiverStyleView *)self countUpLabel];
    [v10 setTextProvider:v9];
  }
  else
  {
    uint64_t v9 = +[NSDate date];
    v10 = [(NTKAlaskanDiverStyleView *)self _timelapsedTextProviderWithStartDate:v9 forcePaused:1];
    id v11 = [(NTKAlaskanDiverStyleView *)self countUpLabel];
    [v11 setTextProvider:v10];
  }
LABEL_8:
  [(NTKAlaskanDiverStyleView *)self updateTrackingTicks];

  [(NTKAlaskanDiverStyleView *)self updateFrameForCountUpLabel];
}

- (double)timeIntervalBetweenStartDate:(id)a3 date:(id)a4
{
  double result = 0.0;
  if (a3 && a4)
  {
    id v6 = a3;
    [a4 timeIntervalSinceReferenceDate];
    double v8 = v7;
    [v6 timeIntervalSinceReferenceDate];
    double v10 = v9;

    double v11 = 0.0;
    if (v8 - v10 >= 0.0) {
      double v11 = (v8 - v10) / 60.0;
    }
    return (double)((uint64_t)v11 % 60);
  }
  return result;
}

- (CLKUIColoringLabel)countUpLabel
{
  countUpLabel = self->_countUpLabel;
  if (!countUpLabel)
  {
    uint64_t v36 = 0;
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
    long long v24 = 0u;
    memset(v23, 0, sizeof(v23));
    id v4 = [(NTKAlaskanDiverStyleView *)self device];
    sub_1F17C(v4, (uint64_t)v23);

    id v5 = +[CLKUIColoringLabel labelWithOptions:0];
    id v6 = self->_countUpLabel;
    self->_countUpLabel = v5;

    double v7 = [(NTKAlaskanDiverStyleView *)self _countUpLabelTextColor];
    [(CLKUIColoringLabel *)self->_countUpLabel setTextColor:v7];

    double v8 = +[CLKFont compactSoftFontOfSize:*((double *)&v24 + 1) weight:UIFontWeightSemibold];
    [(CLKUIColoringLabel *)self->_countUpLabel setFont:v8];

    double v9 = [(CLKUIColoringLabel *)self->_countUpLabel layer];
    [v9 setMasksToBounds:1];

    [(CLKUIColoringLabel *)self->_countUpLabel setTextAlignment:1];
    [(CLKUIColoringLabel *)self->_countUpLabel setBaselineAdjustment:1];
    -[CLKUIColoringLabel setHitTestInsets:](self->_countUpLabel, "setHitTestInsets:", *((double *)&v29 + 1), v30, *(double *)&v31);
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_20D1C;
    v20[3] = &unk_39240;
    objc_copyWeak(&v21, &location);
    [(CLKUIColoringLabel *)self->_countUpLabel setNowProvider:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_20D78;
    v18[3] = &unk_38B68;
    objc_copyWeak(&v19, &location);
    [(CLKUIColoringLabel *)self->_countUpLabel setNeedsResizeHandler:v18];
    double v10 = +[CALayer layer];
    countUpBackgroundLayer = self->_countUpBackgroundLayer;
    self->_countUpBackgroundLayer = v10;

    v37[0] = @"backgroundColor";
    id v12 = +[NSNull null];
    v37[1] = @"opacity";
    v38[0] = v12;
    v13 = +[NSNull null];
    v38[1] = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    [(CALayer *)self->_countUpBackgroundLayer setActions:v14];

    id v15 = +[UIColor systemRedColor];
    -[CALayer setBackgroundColor:](self->_countUpBackgroundLayer, "setBackgroundColor:", [v15 CGColor]);

    v16 = [(NTKAlaskanDiverStyleView *)self layer];
    [v16 addSublayer:self->_countUpBackgroundLayer];

    [(NTKAlaskanDiverStyleView *)self addSubview:self->_countUpLabel];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    countUpLabel = self->_countUpLabel;
  }

  return countUpLabel;
}

- (double)targetAngleOffsetForOffset:(double)a3
{
  id v5 = [(NTKAlaskanDiverStyleView *)self currentDate];
  [(NTKAlaskanDiverStyleView *)self angleOffsetForDate:v5];

  id v6 = [(NTKAlaskanDiverStyleView *)self startDate];
  double v7 = [(NTKAlaskanDiverStyleView *)self currentDate];
  [(NTKAlaskanDiverStyleView *)self timeIntervalBetweenStartDate:v6 date:v7];

  NTKNormalizeAngle();
  double v9 = v8;
  if (CLKFloatEqualsFloat()) {
    return a3;
  }
  else {
    return v9;
  }
}

- (double)angleOffsetForDate:(id)a3
{
  BOOL v3 = [a3 dateByAddingTimeInterval:self->_timeOffset];
  +[NTKAnalogHandsView minuteHandAngleForDate:v3];
  double v5 = v4;

  return v5;
}

- (void)setAngleOffset:(unint64_t)a3
{
  [(NTKAlaskanDiverStyleView *)self _setAngleOffset:a3];

  [(NTKAlaskanDiverStyleView *)self updateStartDate];
}

- (void)setAngleOffset:(double)a3 animated:(BOOL)a4 progressCallback:(id)a5 completionBlock:(id)a6 animationDuration:(double)a7
{
}

- (void)setAngleOffset:(double)a3 animated:(BOOL)a4 progressCallback:(id)a5 completionBlock:(id)a6
{
  BOOL v7 = a4;
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  id v10 = a6;
  id v12 = a5;
  double v11 = [(NTKAlaskanDiverStyleView *)self device];
  sub_1F17C(v11, (uint64_t)v13);

  [(NTKAlaskanDiverStyleView *)self setAngleOffset:v7 animated:v12 progressCallback:v10 completionBlock:1 animationDuration:a3 shouldSetDate:*(double *)v13];
}

- (void)setForceInactiveMode:(BOOL)a3
{
  self->_forceInactiveMode = a3;
  if (!a3) {
    [(NTKAlaskanDiverStyleView *)self updateViewStateAnimated:1];
  }
}

- (void)_setAngleOffset:(unint64_t)a3
{
  if (self->_angleOffset != a3)
  {
    self->_angleOffset = a3;
    [(NTKAlaskanDialView *)self->_minutesMarkerView setAngleOffset:(double)a3];
    [(NTKAlaskanDialView *)self->_trackingTicksView setAngleOffset:(double)self->_angleOffset];
    [(NTKAlaskanDiverStyleView *)self updateTrackingTicks];
  }
}

- (void)updateTrackingTicks
{
  BOOL v3 = [(NTKAlaskanDiverStyleView *)self startDate];
  double v4 = 0.0;
  if (v3)
  {
    if ([(NTKAlaskanDiverStyleView *)self currentMode])
    {
      double v4 = 1.0;
      if ((char *)[(NTKAlaskanDiverStyleView *)self currentMode] == (char *)&dword_0 + 1)
      {
        if ([(NTKAlaskanDiverStyleView *)self hasRotatedToMinuteHand]) {
          double v4 = 1.0;
        }
        else {
          double v4 = 0.0;
        }
      }
    }
  }

  double v5 = [(NTKAlaskanDiverStyleView *)self trackingTicksView];
  [v5 setAlpha:v4];

  id v11 = [(NTKAlaskanDiverStyleView *)self currentDate];
  [(NTKAlaskanDiverStyleView *)self angleOffsetForDate:v11];
  double v7 = v6;
  [(NTKAlaskanDiverStyleView *)self angleOffset];
  NTKNormalizeAngle();
  double v9 = +[NSNumber numberWithDouble:v7 - v8];
  id v10 = [(NTKAlaskanDiverStyleView *)self trackingTicksView];
  [v10 setHidingMaskStartAngle:v9];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)NTKAlaskanDiverStyleView;
  [(NTKAlaskanDiverStyleView *)&v30 layoutSubviews];
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  *(_OWORD *)long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)dx = 0u;
  BOOL v3 = [(NTKAlaskanDiverStyleView *)self device];
  sub_1F17C(v3, (uint64_t)&v19);

  [(NTKAlaskanDiverStyleView *)self bounds];
  double height = self->_previousBoundsSize.height;
  if (self->_previousBoundsSize.width != v6 || height != v4)
  {
    [(NTKAlaskanDiverStyleView *)self bounds];
    self->_previousBoundsSize.width = v8;
    self->_previousBoundsSize.double height = v9;
    -[NTKAlaskanDialView setFrame:](self->_minutesMarkerView, "setFrame:", 0.0, 0.0, *(double *)&v28, *(double *)&v28);
    [(NTKAlaskanDiverStyleView *)self bounds];
    CLKRectGetCenter();
    -[NTKAlaskanDialView setPosition:](self->_minutesMarkerView, "setPosition:");
    [(NTKAlaskanDialView *)self->_minutesMarkerView frame];
    CGRect v32 = CGRectInset(v31, dx[0], dx[0]);
    -[NTKAlaskanDialView setFrame:](self->_innerDialView, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    [(NTKAlaskanDialView *)self->_minutesMarkerView bounds];
    [(NTKAlaskanDialView *)self->_innerDialView bounds];
    id v10 = [(NTKAlaskanDiverStyleView *)self device];
    CLKRoundForDevice();
    -[NTKAlaskanDialView setContentInset:](self->_minutesMarkerView, "setContentInset:");

    [(NTKAlaskanDialView *)self->_minutesMarkerView bounds];
    id v11 = [(NTKAlaskanDiverStyleView *)self device];
    CLKRoundForDevice();
    double v13 = v12;
    uint64_t v14 = [(NTKAlaskanDialView *)self->_minutesMarkerView layer];
    [v14 setCornerRadius:v13];

    [(NTKAlaskanDialView *)self->_innerDialView bounds];
    id v15 = [(NTKAlaskanDiverStyleView *)self device];
    CLKRoundForDevice();
    double v17 = v16;
    id v18 = [(NTKAlaskanDialView *)self->_innerDialView layer];
    [v18 setCornerRadius:v17];

    [(NTKAlaskanDialView *)self->_innerDialView frame];
    CGRect v34 = CGRectInset(v33, v26[1], v26[1]);
    -[NTKAlaskanDialView setFrame:](self->_ticksView, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
    [(NTKAlaskanDialView *)self->_minutesMarkerView frame];
    -[NTKAlaskanDialView setFrame:](self->_trackingTicksView, "setFrame:");
    [(NTKAlaskanDialView *)self->_minutesMarkerView contentInset];
    -[NTKAlaskanDialView setContentInset:](self->_trackingTicksView, "setContentInset:");
  }
  [(NTKAlaskanDiverStyleView *)self updateFrameForCountUpLabel];
}

- (void)updateFrameForCountUpLabel
{
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)dy = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  memset(v20, 0, sizeof(v20));
  BOOL v3 = [(NTKAlaskanDiverStyleView *)self device];
  sub_1F17C(v3, (uint64_t)v20);

  [(NTKAlaskanDialView *)self->_innerDialView bounds];
  [(CLKUIColoringLabel *)self->_countUpLabel setMaxWidth:*((double *)&v28 + 1) * v4];
  countUpLabel = self->_countUpLabel;
  [(CLKUIColoringLabel *)countUpLabel maxWidth];
  double v7 = v6;
  [(NTKAlaskanDiverStyleView *)self bounds];
  -[CLKUIColoringLabel sizeThatFits:](countUpLabel, "sizeThatFits:", v7, v8);
  -[CLKUIColoringLabel setFrame:](self->_countUpLabel, "setFrame:", 0.0, 0.0, v9 + *((double *)&v21 + 1), v10);
  [(NTKAlaskanDiverStyleView *)self bounds];
  CGRectGetMidX(v32);
  id v11 = [(NTKAlaskanDiverStyleView *)self device];
  CLKRoundForDevice();
  double v13 = v12;
  [(NTKAlaskanDiverStyleView *)self bounds];
  CGRectGetMidY(v33);
  [(CLKUIColoringLabel *)self->_countUpLabel bounds];
  CGRectGetMidY(v34);
  uint64_t v14 = [(NTKAlaskanDiverStyleView *)self device];
  CLKRoundForDevice();
  -[CLKUIColoringLabel setCenter:](self->_countUpLabel, "setCenter:", v13, v15);

  [(CLKUIColoringLabel *)self->_countUpLabel frame];
  CGRect v36 = CGRectInset(v35, 0.0, dy[1]);
  -[CALayer setFrame:](self->_countUpBackgroundLayer, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  [(CALayer *)self->_countUpBackgroundLayer position];
  double v17 = v16;
  [(CALayer *)self->_countUpBackgroundLayer position];
  -[CALayer setPosition:](self->_countUpBackgroundLayer, "setPosition:", v17, v18 + *(double *)&v23);
  [(CALayer *)self->_countUpBackgroundLayer frame];
  id v19 = [(NTKAlaskanDiverStyleView *)self device];
  CLKRoundForDevice();
  -[CALayer setCornerRadius:](self->_countUpBackgroundLayer, "setCornerRadius:");
}

- (BOOL)isAnimationInProgress
{
  return 0;
}

- (double)countUpLabelAlpha
{
  if (!self->_startDate) {
    return 0.0;
  }
  double result = 1.0;
  if (!self->_currentMode) {
    return 0.0;
  }
  return result;
}

- (id)countUpLabelColor
{
  unint64_t currentMode = self->_currentMode;
  switch(currentMode)
  {
    case 2uLL:
      self = +[UIColor systemRedColor];
      break;
    case 1uLL:
      self = +[UIColor systemGreenColor];
      break;
    case 0uLL:
      self = +[UIColor colorWithWhite:0.129411765 alpha:1.0];
      break;
  }

  return self;
}

- (id)_countUpLabelTextColor
{
  if (self->_currentMode == 1) {
    +[UIColor blackColor];
  }
  else {
  v2 = +[UIColor whiteColor];
  }

  return v2;
}

- (id)innerDialViewBackgroundColor
{
  if ([(NTKAlaskanDiverStyleView *)self hasCountUpStarted] && !self->_forceInactiveMode)
  {
    double v4 = [(NTKAlaskanDiverStyleView *)self palette];
    BOOL v3 = [v4 activeBackground];
  }
  else
  {
    BOOL v3 = +[UIColor blackColor];
  }

  return v3;
}

- (BOOL)hasCountUpStarted
{
  return self->_currentMode == 2;
}

- (id)_timelapsedTextProviderWithStartDate:(id)a3
{
  return [(NTKAlaskanDiverStyleView *)self _timelapsedTextProviderWithStartDate:a3 forcePaused:0];
}

- (id)_timelapsedTextProviderWithStartDate:(id)a3 forcePaused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = +[CLKRelativeDateTextProvider textProviderWithDate:v6 style:2 units:224];
  [v7 setTritiumDateStyle:0];
  [v7 setWantsSubseconds:1];
  unint64_t currentMode = self->_currentMode;
  if (currentMode == 1 || v4)
  {
    double v10 = +[NSDate date];
    [v7 setDate:v10];

    [v7 setRelativeToDate:v6];
    unint64_t currentMode = self->_currentMode;
  }
  [v7 setPaused:currentMode == 1];

  return v7;
}

- (void)updateStartDate
{
  id v6 = +[NSDate date];
  [(NTKAlaskanDiverStyleView *)self angleOffsetForDate:v6];
  double v4 = v3 - (double)[(NTKAlaskanDiverStyleView *)self angleOffset];
  if (v4 < 0.0) {
    double v4 = v4 + 360.0;
  }
  double v5 = [v6 dateByAddingTimeInterval:v4 / -6.0 * 60.0];
  [(NTKAlaskanDiverStyleView *)self setStartDate:v5 animated:0 setAngleOffset:0.0];
}

- (NTKAlaskanDiverStyleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKAlaskanDiverStyleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (unint64_t)angleOffset
{
  return self->_angleOffset;
}

- (BOOL)forceInactiveMode
{
  return self->_forceInactiveMode;
}

- (NTKAlaskanDiversColorPalette)palette
{
  return self->_palette;
}

- (BOOL)showTimelapsedByMinutes
{
  return self->_showTimelapsedByMinutes;
}

- (void)setShowTimelapsedByMinutes:(BOOL)a3
{
  self->_showTimelapsedByMinutes = a3;
}

- (BOOL)syncMarkerWithMinuteHand
{
  return self->_syncMarkerWithMinuteHand;
}

- (void)setSyncMarkerWithMinuteHand:(BOOL)a3
{
  self->_syncMarkerWithMinuteHand = a3;
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

- (BOOL)hasRotatedToMinuteHand
{
  return self->_hasRotatedToMinuteHand;
}

- (void)setHasRotatedToMinuteHand:(BOOL)a3
{
  self->_hasRotatedToMinuteHand = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKAlaskanDialView)innerDialView
{
  return self->_innerDialView;
}

- (void)setInnerDialView:(id)a3
{
}

- (NTKAlaskanDialView)trackingTicksView
{
  return self->_trackingTicksView;
}

- (void)setTrackingTicksView:(id)a3
{
}

- (NTKAlaskanDialView)minutesMarkerView
{
  return self->_minutesMarkerView;
}

- (void)setMinutesMarkerView:(id)a3
{
}

- (NTKAlaskanDialView)ticksView
{
  return self->_ticksView;
}

- (void)setTicksView:(id)a3
{
}

- (void)setCountUpLabel:(id)a3
{
}

- (CALayer)countUpBackgroundLayer
{
  return self->_countUpBackgroundLayer;
}

- (void)setCountUpBackgroundLayer:(id)a3
{
}

- (UIImageView)markerFillIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_markerFillIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setMarkerFillIcon:(id)a3
{
}

- (UIImageView)markerOutlineIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_markerOutlineIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setMarkerOutlineIcon:(id)a3
{
}

- (int64_t)currentCountUp
{
  return self->_currentCountUp;
}

- (void)setCurrentCountUp:(int64_t)a3
{
  self->_currentCountUp = a3;
}

- (BOOL)doneButtonTapped
{
  return self->_doneButtonTapped;
}

- (void)setDoneButtonTapped:(BOOL)a3
{
  self->_doneButtonTapped = a3;
}

- (CGSize)previousBoundsSize
{
  double width = self->_previousBoundsSize.width;
  double height = self->_previousBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousBoundsSize:(CGSize)a3
{
  self->_previousBoundsSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_markerOutlineIcon);
  objc_destroyWeak((id *)&self->_markerFillIcon);
  objc_storeStrong((id *)&self->_countUpBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_countUpLabel, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_minutesMarkerView, 0);
  objc_storeStrong((id *)&self->_trackingTicksView, 0);
  objc_storeStrong((id *)&self->_innerDialView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end