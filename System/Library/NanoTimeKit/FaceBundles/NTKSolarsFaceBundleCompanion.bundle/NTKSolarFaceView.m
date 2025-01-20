@interface NTKSolarFaceView
- (BOOL)_canEnterInteractiveMode;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_isAnimating;
- (BOOL)_isAnimatingForReason:(id)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_shouldHandleHardwareEvents;
- (BOOL)_solarPathRequiresUpdateForChangedLocation:(id)a3;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (CGPoint)_pointOnSolarPathForPercentage:(double)a3;
- (NTKSolarFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_percentageForWaypoint:(int64_t)a3;
- (double)_solarDiskIdealizedDatePercentage;
- (double)_solarDiskRestPercentage;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_createSolarBezierPath;
- (id)_createWaypointView;
- (id)_detachedComplicationDisplays;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_waypointLabelTextForPercentage:(double)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_waypointBetweenPreviousOffset:(double)a3 currentOffset:(double)a4;
- (int64_t)_waypointForPercentage:(double)a3 withSmallThreshold:(double)a4 largeThreshold:(double)a5;
- (unint64_t)_timeLabelOptions;
- (void)_adjustUIForBoundsChange;
- (void)_animateSolarDiskToRestPercentageIfNeededForViewMode:(int64_t)a3;
- (void)_applyDataMode;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_asyncUpdateLocale;
- (void)_beginAnimatingForReason:(id)a3;
- (void)_buttonPressTimerFired;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterSettingViewMode:(int64_t)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_disableCrown;
- (void)_enableCrown;
- (void)_endAnimatingForReason:(id)a3;
- (void)_handleViewModeTapGesture:(id)a3;
- (void)_interpolateFromViewMode:(int64_t)a3 toViewMode:(int64_t)a4 progress:(double)a5;
- (void)_layoutForegroundContainerView;
- (void)_layoutHorizonForViewMode:(int64_t)a3;
- (void)_layoutLegacyDateComplication;
- (void)_layoutSolarDiskViewForViewMode:(int64_t)a3;
- (void)_layoutSolarPathAndContainerForViewMode:(int64_t)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForSettingViewMode:(int64_t)a3;
- (void)_setSolarBezierPath:(id)a3 animated:(BOOL)a4;
- (void)_setViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)_setViewMode:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setupViews;
- (void)_sharedLocationManagerUpdatedLocation:(id)a3 error:(id)a4;
- (void)_solarDiskPercentageChanged:(double)a3;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_timeZoneChanged:(id)a3;
- (void)_transitionToViewMode:(int64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)_unloadViews;
- (void)_updateColorCurves;
- (void)_updateComplicationColorWithPercentage:(double)a3;
- (void)_updateLocale;
- (void)_updateSolarDiskHaloViewPosition;
- (void)_updateSolarHaloWithPercentage:(double)a3;
- (void)_updateSolarHorizonGradientAlphaWithPercentage:(double)a3;
- (void)_updateSolarHorizonGradientAlphaWithSolarDiskCenter:(CGPoint)a3;
- (void)_updateSolarHorizonGradientColorWithPercentage:(double)a3;
- (void)_updateSolarPathForChangedDate:(id)a3 animated:(BOOL)a4;
- (void)_updateSolarPathForChangedLocation:(id)a3;
- (void)_updateTimeScrubbingContentForViewMode:(int64_t)a3;
- (void)_updateWaypoints;
- (void)_wheelDelayTimerFired;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)setViewMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKSolarFaceView

- (NTKSolarFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKSolarFaceView;
  v9 = [(NTKSolarFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKDigitialUtilitarianFaceViewComplicationFactory *)[objc_alloc((Class)NTKDigitialUtilitarianFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;
  }
  return v9;
}

- (void)dealloc
{
  [(NTKSolarFaceView *)self _unloadSnapshotContentViews];
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v3 dealloc];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory detachedComplicationDisplaysForFaceView:self];
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineCornerRadiusForComplicationSlot:a3 faceView:self];
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)(uint64_t)[(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (void)_loadSnapshotContentViews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v24 _loadSnapshotContentViews];
  if ((*((unsigned char *)self + 368) & 1) == 0)
  {
    [(NTKSolarFaceView *)self _setupViews];
    objc_super v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleViewModeTapGesture:"];
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = v3;

    [(UITapGestureRecognizer *)self->_viewModeTapGesture setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setDelegate:self];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:0];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setCancelsTouchesInView:0];
    [(NTKSolarFaceView *)self addGestureRecognizer:self->_viewModeTapGesture];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_timeZoneChanged:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v5 addObserver:self selector:"_asyncUpdateLocale" name:NSCurrentLocaleDidChangeNotification object:0];
    v6 = [(NTKSolarFaceView *)self device];
    unsigned int v7 = [v6 nrDeviceVersion];

    if (HIWORD(v7) <= 4u)
    {
      id v8 = +[NTKDateComplication complicationWithDateStyle:8];
      id v9 = objc_alloc((Class)NTKDateComplicationLabel);
      v10 = [(NTKSolarFaceView *)self device];
      v11 = (NTKDateComplicationLabel *)[v9 initWithSizeStyle:1 accentType:1 forDevice:v10];
      dateComplicationLabel = self->_dateComplicationLabel;
      self->_dateComplicationLabel = v11;

      objc_super v13 = [(NTKSolarFaceView *)self device];
      sub_64E0(v13, (uint64_t)v23);
      double v14 = v23[0];

      v15 = +[CLKFont systemFontOfSize:v14];
      [(NTKDateComplicationLabel *)self->_dateComplicationLabel setFont:v15];

      v16 = +[NSLocale currentLocale];
      v17 = [v16 objectForKey:NSLocaleLanguageCode];

      if ([v17 isEqualToString:@"he"]) {
        uint64_t v18 = 2048;
      }
      else {
        uint64_t v18 = 0;
      }
      [(NTKDateComplicationLabel *)self->_dateComplicationLabel setOverrideDateStyle:v18];
      [(NTKSolarFaceView *)self addSubview:self->_dateComplicationLabel];
      v19 = self->_dateComplicationLabel;
      v20 = [(NTKSolarFaceView *)self device];
      v21 = +[NTKComplicationController DEPRECATEDControllerForComplication:v8 withLegacyDisplay:v19 forDevice:v20];
      dateComplicationController = self->_dateComplicationController;
      self->_dateComplicationController = v21;

      [(NTKComplicationController *)self->_dateComplicationController _activate];
    }
    *((unsigned char *)self + 368) |= 1u;
    [(NTKSolarFaceView *)self setNeedsLayout];
  }
}

- (void)_unloadSnapshotContentViews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v9 _unloadSnapshotContentViews];
  if (*((unsigned char *)self + 368))
  {
    [(NTKSolarFaceView *)self _stopClockUpdates];
    [(NTKSolarFaceView *)self removeGestureRecognizer:self->_viewModeTapGesture];
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = 0;

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:NSSystemTimeZoneDidChangeNotification object:0];
    [v4 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];
    v5 = [(NTKSolarFaceView *)self device];
    unsigned int v6 = [v5 nrDeviceVersion];

    if (HIWORD(v6) <= 4u)
    {
      [(NTKDateComplicationLabel *)self->_dateComplicationLabel removeFromSuperview];
      dateComplicationLabel = self->_dateComplicationLabel;
      self->_dateComplicationLabel = 0;

      [(NTKComplicationController *)self->_dateComplicationController DEPRECATEDInvalidate];
      dateComplicationController = self->_dateComplicationController;
      self->_dateComplicationController = 0;
    }
    [(NTKSolarFaceView *)self _unloadViews];
    *((unsigned char *)self + 368) &= ~1u;
  }
}

- (void)_setupViews
{
  [(NTKSolarFaceView *)self setClipsToBounds:1];
  v101 = [(NTKSolarFaceView *)self foregroundContainerView];
  id v3 = objc_alloc((Class)NTKSolarTimeModel);
  v4 = [(NTKSolarFaceView *)self currentDisplayDate];
  v5 = (NTKSolarTimeModel *)[v3 initWithReferenceDate:v4 referenceLocation:0];
  solarTimeModel = self->_solarTimeModel;
  self->_solarTimeModel = v5;

  v108[0] = &off_2DAC0;
  id v7 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:1 solarTimeModel:self->_solarTimeModel];
  v109[0] = v7;
  v108[1] = &off_2DAD8;
  id v8 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:2 solarTimeModel:self->_solarTimeModel];
  v109[1] = v8;
  v108[2] = &off_2DAF0;
  id v9 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:3 solarTimeModel:self->_solarTimeModel];
  v109[2] = v9;
  v108[3] = &off_2DB08;
  id v10 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:4 solarTimeModel:self->_solarTimeModel];
  v109[3] = v10;
  v108[4] = &off_2DB20;
  id v11 = [objc_alloc((Class)NTKSolarWaypoint) initWithType:5 solarTimeModel:self->_solarTimeModel];
  v109[4] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:5];
  waypoints = self->_waypoints;
  self->_waypoints = v12;

  [(NTKSolarFaceView *)self _updateWaypoints];
  self->_solarDiskOverridePercentage = -1.0;
  double v14 = [(NTKSolarFaceView *)self device];
  sub_64E0(v14, (uint64_t)v106);
  double v15 = v106[0];

  v16 = +[CLKFont systemFontOfSize:v15 weight:UIFontWeightSemibold];
  v17 = [v16 CLKFontWithMonospacedNumbers];
  uint64_t v18 = [v17 CLKFontWithAlternativePunctuation];

  v99 = v18;
  [v18 lineHeight];
  self->_labelFontLineHeight = v19;
  v20 = +[UIColor blackColor];
  [(NTKSolarFaceView *)self setBackgroundColor:v20];

  v21 = [(NTKSolarFaceView *)self layer];
  [v21 setAllowsGroupBlending:0];

  v22 = +[NSMutableSet set];
  animatingReasons = self->_animatingReasons;
  self->_animatingReasons = v22;

  self->_currentSolarDiskPercentage = -1.0;
  [(NTKSolarFaceView *)self bounds];
  v28 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v24, v25, v26, v27);
  solarContentView = self->_solarContentView;
  self->_solarContentView = v28;

  v30 = self->_solarContentView;
  v31 = +[UIColor blackColor];
  [(UIView *)v30 setBackgroundColor:v31];

  v32 = [(NTKSolarFaceView *)self contentView];
  [v32 addSubview:self->_solarContentView];

  id v33 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v37 = (UIView *)objc_msgSend(v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  solarPathObjectContainerView = self->_solarPathObjectContainerView;
  self->_solarPathObjectContainerView = v37;

  [(UIView *)self->_solarPathObjectContainerView setOpaque:0];
  [(UIView *)self->_solarPathObjectContainerView setAlpha:0.75];
  v39 = [(UIView *)self->_solarPathObjectContainerView layer];
  [v39 setAllowsGroupOpacity:1];

  v40 = [(UIView *)self->_solarPathObjectContainerView layer];
  [v40 setCompositingFilter:kCAFilterScreenBlendMode];

  [(UIView *)self->_solarContentView addSubview:self->_solarPathObjectContainerView];
  v41 = (NTKBezierPathView *)objc_msgSend(objc_alloc((Class)NTKBezierPathView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  solarBezierPathView = self->_solarBezierPathView;
  self->_solarBezierPathView = v41;

  v43 = self->_solarBezierPathView;
  v44 = +[UIColor grayColor];
  [(NTKBezierPathView *)v43 setPathColor:v44];

  [(UIView *)self->_solarPathObjectContainerView addSubview:self->_solarBezierPathView];
  *((unsigned char *)self + 368) |= 2u;
  v45 = [NTKSolarDiskView alloc];
  v46 = [(NTKSolarFaceView *)self device];
  sub_64E0(v46, (uint64_t)v104);
  double v47 = v105;
  v48 = [(NTKSolarFaceView *)self device];
  v49 = [(NTKSolarDiskView *)v45 initWithSize:v48 forDevice:v47];
  solarDiskView = self->_solarDiskView;
  self->_solarDiskView = v49;

  [(UIView *)self->_solarContentView addSubview:self->_solarDiskView];
  v100 = +[NTKSolarFaceBundle imageWithName:@"Solar-Disk-Halo-Color-Mask"];
  v51 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v100];
  solarDiskHaloView = self->_solarDiskHaloView;
  self->_solarDiskHaloView = v51;

  v53 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  solarDiskHaloMaskView = self->_solarDiskHaloMaskView;
  self->_solarDiskHaloMaskView = v53;

  v55 = [(UIView *)self->_solarDiskHaloMaskView layer];
  [v55 setCompositingFilter:kCAFilterSourceIn];

  [(UIImageView *)self->_solarDiskHaloView addSubview:self->_solarDiskHaloMaskView];
  v56 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  solarDiskHaloParentView = self->_solarDiskHaloParentView;
  self->_solarDiskHaloParentView = v56;

  [(UIView *)self->_solarDiskHaloParentView addSubview:self->_solarDiskHaloView];
  [(UIView *)self->_solarContentView addSubview:self->_solarDiskHaloParentView];
  v58 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  waypointLabel = self->_waypointLabel;
  self->_waypointLabel = v58;

  [(UILabel *)self->_waypointLabel setTextAlignment:1];
  [(UILabel *)self->_waypointLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_waypointLabel setFont:v18];
  v60 = self->_waypointLabel;
  v61 = +[UIColor whiteColor];
  [(UILabel *)v60 setTextColor:v61];

  [v101 addSubview:self->_waypointLabel];
  [(NTKSolarFaceView *)self _updateColorCurves];
  v62 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  horizonView = self->_horizonView;
  self->_horizonView = v62;

  v64 = self->_horizonView;
  v65 = +[UIColor grayColor];
  [(UIView *)v64 setBackgroundColor:v65];

  [(UIView *)self->_solarPathObjectContainerView addSubview:self->_horizonView];
  v66 = +[CAGradientLayer layer];
  [v66 setLocations:&off_2DFB0];
  id v67 = +[UIColor clearColor];
  v107[0] = [v67 CGColor];
  id v68 = +[UIColor clearColor];
  v107[1] = [v68 CGColor];
  id v69 = +[UIColor whiteColor];
  v107[2] = [v69 CGColor];
  v70 = +[NSArray arrayWithObjects:v107 count:3];
  [v66 setColors:v70];

  v71 = [(NTKSolarFaceView *)self device];
  sub_64E0(v71, (uint64_t)v102);
  objc_msgSend(v66, "setFrame:", 0.0, 0.0, 0.5, v103);

  [v66 bounds];
  v110.double width = v72;
  v110.double height = v73;
  UIGraphicsBeginImageContextWithOptions(v110, 0, 0.0);
  [v66 renderInContext:UIGraphicsGetCurrentContext()];
  v74 = UIGraphicsGetImageFromCurrentImageContext();
  v98 = objc_msgSend(v74, "resizableImageWithCapInsets:resizingMode:", 1, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  UIGraphicsEndImageContext();
  v75 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v98];
  horizonGradientView = self->_horizonGradientView;
  self->_horizonGradientView = v75;

  [(UIImageView *)self->_horizonGradientView setContentMode:0];
  v77 = self->_horizonGradientView;
  v78 = +[UIColor blackColor];
  [(UIImageView *)v77 setBackgroundColor:v78];

  v79 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  horizonGradientContainerView = self->_horizonGradientContainerView;
  self->_horizonGradientContainerView = v79;

  v81 = [(UIView *)self->_horizonGradientContainerView layer];
  [v81 setCompositingFilter:kCAFilterColorDodgeBlendMode];

  [(UIView *)self->_horizonGradientContainerView addSubview:self->_horizonGradientView];
  [(UIView *)self->_solarContentView addSubview:self->_horizonGradientContainerView];
  v82 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  belowHorizonView = self->_belowHorizonView;
  self->_belowHorizonView = v82;

  [(UIView *)self->_belowHorizonView setOpaque:1];
  v84 = self->_belowHorizonView;
  v85 = +[UIColor blackColor];
  [(UIView *)v84 setBackgroundColor:v85];

  [(UIView *)self->_solarContentView addSubview:self->_belowHorizonView];
  v86 = (NSDateFormatter *)objc_opt_new();
  overrideDateFormatter = self->_overrideDateFormatter;
  self->_overrideDateFormatter = v86;

  v88 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  overrideDateLabel = self->_overrideDateLabel;
  self->_overrideDateLabel = v88;

  [(UILabel *)self->_overrideDateLabel setTextAlignment:0];
  [(UILabel *)self->_overrideDateLabel setFont:v99];
  v90 = self->_overrideDateLabel;
  v91 = +[UIColor whiteColor];
  [(UILabel *)v90 setTextColor:v91];

  [v101 addSubview:self->_overrideDateLabel];
  v92 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  scrubLabel = self->_scrubLabel;
  self->_scrubLabel = v92;

  [(UILabel *)self->_scrubLabel setTextAlignment:1];
  [(UILabel *)self->_scrubLabel setFont:v99];
  v94 = self->_scrubLabel;
  v95 = +[UIColor whiteColor];
  [(UILabel *)v94 setTextColor:v95];

  [v101 addSubview:self->_scrubLabel];
  [(NTKSolarFaceView *)self _solarDiskRestPercentage];
  double v97 = v96;
  -[NTKSolarFaceView _updateSolarHaloWithPercentage:](self, "_updateSolarHaloWithPercentage:");
  [(NTKSolarFaceView *)self _updateSolarHorizonGradientAlphaWithPercentage:v97];
  [(NTKSolarFaceView *)self _updateSolarHorizonGradientColorWithPercentage:v97];
  [(NTKSolarFaceView *)self _updateComplicationColorWithPercentage:v97];
  [(UIView *)self->_solarContentView bringSubviewToFront:self->_solarDiskHaloParentView];
  [(UIView *)self->_solarContentView bringSubviewToFront:self->_belowHorizonView];
  [(UIView *)self->_solarContentView bringSubviewToFront:self->_horizonGradientContainerView];
  [(UIView *)self->_solarContentView bringSubviewToFront:self->_solarPathObjectContainerView];
  [(UIView *)self->_solarContentView bringSubviewToFront:self->_solarDiskView];
  [(NTKSolarFaceView *)self _updateLocale];
}

- (void)_unloadViews
{
  solarTimeModel = self->_solarTimeModel;
  self->_solarTimeModel = 0;

  overrideDateFormatter = self->_overrideDateFormatter;
  self->_overrideDateFormatter = 0;

  waypoints = self->_waypoints;
  self->_waypoints = 0;

  self->_solarDiskOverridePercentage = -1.0;
  [(UIImageView *)self->_horizonGradientView removeFromSuperview];
  [(UIView *)self->_belowHorizonView removeFromSuperview];
  [(UIView *)self->_solarPathObjectContainerView removeFromSuperview];
  [(UIImageView *)self->_solarDiskHaloView removeFromSuperview];
  [(NTKBezierPathView *)self->_solarBezierPathView removeFromSuperview];
  [(NTKSolarDiskView *)self->_solarDiskView removeFromSuperview];
  [(UILabel *)self->_waypointLabel removeFromSuperview];
  [(UIView *)self->_horizonView removeFromSuperview];
  [(UILabel *)self->_overrideDateLabel removeFromSuperview];
  [(UILabel *)self->_scrubLabel removeFromSuperview];
  [(UIView *)self->_solarContentView removeFromSuperview];
  unsigned int v6 = [(NSDictionary *)self->_waypointViews allValues];
  [v6 makeObjectsPerformSelector:"removeFromSuperview"];

  horizonGradientView = self->_horizonGradientView;
  self->_horizonGradientView = 0;

  belowHorizonView = self->_belowHorizonView;
  self->_belowHorizonView = 0;

  solarPathObjectContainerView = self->_solarPathObjectContainerView;
  self->_solarPathObjectContainerView = 0;

  solarDiskHaloView = self->_solarDiskHaloView;
  self->_solarDiskHaloView = 0;

  solarBezierPathView = self->_solarBezierPathView;
  self->_solarBezierPathView = 0;

  solarDiskView = self->_solarDiskView;
  self->_solarDiskView = 0;

  waypointLabel = self->_waypointLabel;
  self->_waypointLabel = 0;

  horizonView = self->_horizonView;
  self->_horizonView = 0;

  overrideDateLabel = self->_overrideDateLabel;
  self->_overrideDateLabel = 0;

  scrubLabel = self->_scrubLabel;
  self->_scrubLabel = 0;

  solarContentView = self->_solarContentView;
  self->_solarContentView = 0;

  waypointViews = self->_waypointViews;
  self->_waypointViews = 0;
}

- (void)setViewMode:(int64_t)a3
{
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v3 = [(NTKSolarFaceView *)self timeView];
  objc_msgSend(v3, "setHidden:", -[NTKSolarFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v5 layoutSubviews];
  if ((*((unsigned char *)self + 368) & 1) != 0
    && ([(NTKSolarFaceView *)self zooming] & 1) == 0
    && ![(NTKSolarFaceView *)self _isAnimating])
  {
    [(NTKSolarFaceView *)self bounds];
    -[UIView setBounds:](self->_solarContentView, "setBounds:");
    if ((*((unsigned char *)self + 368) & 2) != 0)
    {
      id v3 = [(NTKSolarFaceView *)self _createSolarBezierPath];
      [(NTKSolarFaceView *)self _setSolarBezierPath:v3 animated:0];

      *((unsigned char *)self + 368) &= ~2u;
    }
    id v4 = [(NTKSolarFaceView *)self viewMode];
    [(NTKSolarFaceView *)self _layoutLegacyDateComplication];
    [(NTKSolarFaceView *)self _layoutHorizonForViewMode:v4];
    [(NTKSolarFaceView *)self _layoutSolarPathAndContainerForViewMode:v4];
    [(NTKSolarFaceView *)self _layoutSolarDiskViewForViewMode:v4];
    [(NTKSolarFaceView *)self _updateWaypointLabelForCrownMovement];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  digitalTimeLabelDefaultStyle = self->_digitalTimeLabelDefaultStyle;
  self->_digitalTimeLabelDefaultStyle = 0;
  id v5 = a3;

  digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
  self->_digitalTimeLabelSmallInUpperRightCornerStyle = 0;

  v7.receiver = self;
  v7.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v7 traitCollectionDidChange:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  return 1;
}

- (BOOL)_shouldHandleHardwareEvents
{
  return (*((unsigned __int8 *)self + 368) >> 3) & 1;
}

- (void)_enableCrown
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v3 _enableCrown];
  *((unsigned char *)self + 368) |= 8u;
}

- (void)_disableCrown
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v3 _disableCrown];
  *((unsigned char *)self + 368) &= ~8u;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (void)_wheelDelayTimerFired
{
  wheelDelayTimer = self->_wheelDelayTimer;
  self->_wheelDelayTimer = 0;

  if (!self->_buttonPressTimer && [(NTKSolarFaceView *)self _canEnterInteractiveMode])
  {
    [(NTKSolarFaceView *)self _setViewMode:2 animated:1];
  }
}

- (void)_buttonPressTimerFired
{
  self->_buttonPressTimer = 0;
  _objc_release_x1();
}

- (void)_updateTimeScrubbingContentForViewMode:(int64_t)a3
{
  unsigned __int8 v5 = [(NTKSolarFaceView *)self _isAnimating];
  if (a3 == 2 && (v5 & 1) == 0)
  {
    [(NTKSolarFaceView *)self _solarDiskRestPercentage];
    double v7 = v6;
    id v38 = +[NSCalendar currentCalendar];
    [(NTKSolarTimeModel *)self->_solarTimeModel effectiveSolarDayLength];
    double v9 = v7 * v8;
    id v10 = [(NTKSolarTimeModel *)self->_solarTimeModel startDateForReferenceDate];
    uint64_t v11 = NTKRoundDateDownToNearestMinute();

    v12 = +[NTKDate faceDate];
    objc_super v13 = NTKRoundDateDownToNearestMinute();

    v37 = (void *)v11;
    double v14 = [v38 dateByAddingUnit:128 value:(uint64_t)v9 toDate:v11 options:0];
    double v15 = NTKRoundDateDownToNearestMinute();

    [v13 timeIntervalSinceDate:v15];
    if (fabs(v16) <= 60.0)
    {
      id v17 = v13;

      double v15 = v17;
    }
    uint64_t v18 = [(NSDateFormatter *)self->_overrideDateFormatter stringFromDate:v15];
    if (qword_35860 != -1) {
      dispatch_once(&qword_35860, &stru_2CA08);
    }
    if (byte_35858 == 1)
    {
      double v19 = +[NSLocale currentLocale];
      uint64_t v20 = [v18 uppercaseStringWithLocale:v19];

      uint64_t v18 = (void *)v20;
    }
    v21 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory foregroundColor];
    [(UILabel *)self->_overrideDateLabel setText:v18];
    [(UILabel *)self->_overrideDateLabel setTextColor:v21];
    [(UILabel *)self->_overrideDateLabel sizeToFit];
    scrubLabel = self->_scrubLabel;
    v36 = v13;
    [v15 timeIntervalSinceDate:v13];
    double v23 = v22;
    double v24 = objc_opt_new();
    [v24 setMaximumUnitCount:2];
    [v24 setFormattingContext:2];
    [v24 setAllowedUnits:96];
    [v24 setUnitsStyle:0];
    [v24 setZeroFormattingBehavior:0x10000];
    double v25 = [v24 stringFromTimeInterval:fabs(v23)];
    double v26 = +[NSLocale currentLocale];
    int IsRTL = CLKLayoutIsRTL();
    v28 = @"−";
    if (v23 >= 0.0) {
      v28 = @"+";
    }
    v29 = v28;
    if (qword_35860 != -1) {
      dispatch_once(&qword_35860, &stru_2CA08);
    }
    if (byte_35858 == 1)
    {
      uint64_t v30 = [v25 uppercaseStringWithLocale:v26];

      double v25 = (void *)v30;
    }
    CFStringRef v31 = &stru_2D1F8;
    if (IsRTL) {
      CFStringRef v31 = @"\u200F";
    }
    v32 = +[NSString stringWithFormat:@"%@%@%@", v31, v29, v25];

    [(UILabel *)scrubLabel setText:v32];
    [(UILabel *)self->_scrubLabel setTextColor:v21];
    [(UILabel *)self->_scrubLabel sizeToFit];
    [(UILabel *)self->_waypointLabel setTextColor:v21];
    [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForDate:v15];
    double v34 = fmin(fmax(v33, 0.0), 1.0);
    [(NTKSolarFaceView *)self _solarDiskPercentageChanged:v34];
    self->_solarDiskOverridePercentage = v34;
    [(NTKSolarFaceView *)self _updateWaypointLabelForCrownMovement];
  }
}

- (void)_startClockUpdates
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    objc_super v3 = +[CLKClockTimer sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_7D8C;
    v6[3] = &unk_2C8E8;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&stru_2C928];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    objc_super v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_applyDataMode
{
  if (*((unsigned char *)self + 368))
  {
    switch((unint64_t)[(NTKSolarFaceView *)self dataMode])
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_4;
      case 3uLL:
        [(NTKSolarFaceView *)self _setViewMode:1 animated:0];
LABEL_4:
        [(NTKSolarFaceView *)self _stopClockUpdates];
        break;
      case 4uLL:
        [(NTKSolarFaceView *)self _solarDiskRestPercentage];
        -[NTKSolarFaceView _solarDiskPercentageChanged:](self, "_solarDiskPercentageChanged:");
        break;
      case 5uLL:
        [(NTKSolarFaceView *)self _solarDiskRestPercentage];
        -[NTKSolarFaceView _solarDiskPercentageChanged:](self, "_solarDiskPercentageChanged:");
LABEL_11:
        [(NTKSolarFaceView *)self _setViewMode:0 animated:0];
        [(NTKSolarFaceView *)self _startClockUpdates];
        break;
      default:
        return;
    }
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v10 setOverrideDate:v6 duration:a4];
  if (*((unsigned char *)self + 368))
  {
    double currentSolarDiskPercentage = self->_currentSolarDiskPercentage;
    if (v6) {
      [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodInCurrentSolarDayForDate:v6];
    }
    else {
      [(NTKSolarFaceView *)self _solarDiskRestPercentage];
    }
    double v9 = v8;
    if (a4 <= 0.0)
    {
      if (![(NTKSolarFaceView *)self _isAnimating]) {
        [(NTKSolarFaceView *)self _solarDiskPercentageChanged:v9];
      }
    }
    else
    {
      [(NTKSolarFaceView *)self _animateSolarDiskFromPercentage:@"_NTKSolarDiskPercentageChangeForDataModeAnimatingReason" toPercentage:currentSolarDiskPercentage reason:v8];
    }
  }
}

- (void)setTimeOffset:(double)a3
{
  id v4 = [(NTKSolarFaceView *)self timeView];
  [v4 setTimeOffset:a3];
}

- (void)_sharedLocationManagerUpdatedLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138478083;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Solar _sharedLocationManagerUpdatedLocation with location:%{private}@ and error:%@", (uint8_t *)&v12, 0x16u);
  }

  if (self->_usingInitialLocation)
  {
    if (!v6) {
      goto LABEL_12;
    }
    self->_usingInitialLocation = 0;
  }
  *((unsigned char *)self + 368) = *((unsigned char *)self + 368) & 0xFB | (4 * (v6 != 0));
  [(NTKSolarTimeModel *)self->_solarTimeModel setUsePlaceholderData:v6 == 0];
  if (!v6
    || ([(NTKSolarTimeModel *)self->_solarTimeModel referenceLocation],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_super v10 = (void *)v9,
        unsigned int v11 = [(NTKSolarFaceView *)self _solarPathRequiresUpdateForChangedLocation:v6], v10, v11))
  {
    [(NTKSolarFaceView *)self _updateSolarPathForChangedLocation:v6];
    [(NTKSolarFaceView *)self setNeedsLayout];
  }
  if ([(NTKSolarFaceView *)self viewMode] == (char *)&dword_0 + 2) {
    [(NTKSolarFaceView *)self _updateTimeScrubbingContentForViewMode:[(NTKSolarFaceView *)self viewMode]];
  }
LABEL_12:
}

- (BOOL)_solarPathRequiresUpdateForChangedLocation:(id)a3
{
  solarTimeModel = self->_solarTimeModel;
  id v4 = a3;
  unsigned __int8 v5 = [(NTKSolarTimeModel *)solarTimeModel referenceLocation];
  [v5 distanceFromLocation:v4];
  double v7 = v6;

  return v7 >= 250000.0;
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((unsigned char *)self + 368) & 1;
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Solar received timeZoneChanged notification with isContentLoaded?:%ld", (uint8_t *)&v6, 0xCu);
  }

  if (*((unsigned char *)self + 368))
  {
    [(NTKSolarTimeModel *)self->_solarTimeModel updateForTimeZoneChange];
    [(NTKSolarFaceView *)self _updateWaypoints];
    *((unsigned char *)self + 368) |= 2u;
    [(NTKSolarFaceView *)self setNeedsLayout];
  }
}

- (void)_asyncUpdateLocale
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_84EC;
  v2[3] = &unk_2C950;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateLocale
{
  id v4 = +[NSLocale currentLocale];
  if (CLKLocaleIs24HourMode()) {
    CFStringRef v3 = @"H:mm";
  }
  else {
    CFStringRef v3 = @"h:mm a";
  }
  [(NSDateFormatter *)self->_overrideDateFormatter setLocalizedDateFormatFromTemplate:v3];
}

- (void)_handleViewModeTapGesture:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3 && !-[NTKSolarFaceView _isAnimating](self, "_isAnimating"))
  {
    id v4 = (char *)[(NTKSolarFaceView *)self viewMode];
    if (v4 == (unsigned char *)&dword_0 + 2)
    {
      [(NTKSolarFaceView *)self _setViewMode:0 animated:1];
    }
    else if (!v4)
    {
      [(NTKSolarFaceView *)self _setViewMode:2 animated:1];
      [(NTKSolarFaceView *)self _updateWaypointLabelForCrownMovement];
    }
  }
}

- (void)_updateWaypoints
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFStringRef v3 = [(NSDictionary *)self->_waypoints allValues];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if ((*((unsigned char *)self + 368) & 4) != 0) {
          [v8 updateDependentValues];
        }
        else {
          [v8 updateDependentValuesWithPlaceholderData];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (double)_percentageForWaypoint:(int64_t)a3
{
  waypoints = self->_waypoints;
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)waypoints objectForKeyedSubscript:v4];
  [v5 percentageThroughPeriodForWaypointDate];
  double v7 = v6;

  return v7;
}

- (int64_t)_waypointForPercentage:(double)a3 withSmallThreshold:(double)a4 largeThreshold:(double)a5
{
  double v6 = 1.0 - a3;
  if (a3 < a4 || v6 < a4) {
    return 6;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = [(NSDictionary *)self->_waypoints allKeys];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      double v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        int64_t v8 = (int64_t)[*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) integerValue];
        [(NTKSolarFaceView *)self _percentageForWaypoint:v8];
        double v18 = a4;
        double v19 = a4;
        switch(v8)
        {
          case 1:
          case 4:
            double v18 = a5;
            double v19 = a4;
            break;
          case 2:
          case 5:
            double v18 = a4;
            goto LABEL_16;
          case 3:
            double v18 = a5;
LABEL_16:
            double v19 = a5;
            break;
          default:
            break;
        }
        if (v17 <= a3)
        {
          if (a3 - v17 <= v19) {
            goto LABEL_24;
          }
        }
        else if (v17 - a3 <= v18)
        {
          goto LABEL_24;
        }
        double v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
  int64_t v8 = -1;
LABEL_24:

  return v8;
}

- (int64_t)_waypointBetweenPreviousOffset:(double)a3 currentOffset:(double)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v7 = [(NSDictionary *)self->_waypoints allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      int64_t v12 = (int64_t)[*(id *)(*((void *)&v17 + 1) + 8 * v11) integerValue];
      [(NTKSolarFaceView *)self _percentageForWaypoint:v12];
      BOOL v14 = v13 < a4 && v13 > a3;
      BOOL v15 = v13 > a4;
      if (v13 >= a3) {
        BOOL v15 = 0;
      }
      if (v12 != -1 && (v14 || v15)) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    int64_t v12 = -1;
  }

  return v12;
}

- (id)_waypointLabelTextForPercentage:(double)a3
{
  int64_t v5 = [(NTKSolarFaceView *)self _waypointForPercentage:a3 withSmallThreshold:0.0005 largeThreshold:0.0005];
  if (v5 == -1)
  {
    if (a3 <= 0.5)
    {
      [(NTKSolarFaceView *)self _percentageForWaypoint:1];
      double v17 = v16;
      [(NTKSolarFaceView *)self _percentageForWaypoint:2];
      if (v17 != NTKSolarWaypointInvalidPercentage && v18 != NTKSolarWaypointInvalidPercentage)
      {
        if (v17 <= a3)
        {
          if (v17 < a3 && v18 > a3)
          {
            CFStringRef v6 = @"SOLAR_TWILIGHT_MORNING";
            CFStringRef v7 = @"The time between dawn and sunrise";
            goto LABEL_25;
          }
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    else
    {
      [(NTKSolarFaceView *)self _percentageForWaypoint:4];
      double v9 = v8;
      [(NTKSolarFaceView *)self _percentageForWaypoint:5];
      if (v9 != NTKSolarWaypointInvalidPercentage && v10 != NTKSolarWaypointInvalidPercentage)
      {
        if (v9 > a3) {
          goto LABEL_18;
        }
        if (v9 < a3 && v10 > a3)
        {
          CFStringRef v6 = @"SOLAR_TWILIGHT_EVENING";
          CFStringRef v7 = @"The time between sunset and dusk";
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    [(NTKSolarPath *)self->_solarPath altitudeAtPercentage:a3];
    if (v20 >= 0.0)
    {
LABEL_18:
      CFStringRef v6 = @"SOLAR_DAYTIME";
      CFStringRef v7 = @"The time between sunrise and sunset";
      goto LABEL_25;
    }
LABEL_24:
    CFStringRef v6 = @"SOLAR_NIGHTTIME";
    CFStringRef v7 = @"The time before dawn and after dusk";
    goto LABEL_25;
  }
  if (v5 != 6)
  {
    waypoints = self->_waypoints;
    double v13 = +[NSNumber numberWithInteger:v5];
    BOOL v14 = [(NSDictionary *)waypoints objectForKeyedSubscript:v13];
    BOOL v15 = [v14 localizedName];

    goto LABEL_26;
  }
  CFStringRef v6 = @"SOLAR_SOLAR_MIDNIGHT";
  CFStringRef v7 = @"Solar Midnight";
LABEL_25:
  BOOL v15 = +[NTKSolarFaceBundle localizedStringForKey:v6 comment:v7];
LABEL_26:

  return v15;
}

- (void)_updateColorCurves
{
  uint64_t v2 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v153 = +[UIColor colorWithRed:0.384313725 green:0.48627451 blue:0.643137255 alpha:1.0];
  v148 = +[UIColor colorWithRed:0.384313725 green:0.48627451 blue:0.643137255 alpha:1.0];
  v154 = +[UIColor colorWithRed:0.470588235 green:0.768627451 blue:1.0 alpha:1.0];
  CFStringRef v3 = +[UIColor colorWithRed:0.470588235 green:0.768627451 blue:1.0 alpha:1.0];
  v157 = +[UIColor colorWithRed:0.470588235 green:0.768627451 blue:1.0 alpha:1.0];
  v155 = +[UIColor colorWithRed:0.470588235 green:0.509803922 blue:0.788235294 alpha:1.0];
  v158 = +[UIColor colorWithRed:0.470588235 green:0.509803922 blue:0.788235294 alpha:1.0];
  id v4 = objc_alloc((Class)NTKColorCurve);
  id v5 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v6) = -30.0;
  v147 = (void *)v2;
  id v7 = [v5 initWithColor:v2 fraction:v6];
  v172[0] = v7;
  id v8 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v9) = -18.0;
  id v10 = [v8 initWithColor:v153 fraction:v9];
  v172[1] = v10;
  id v11 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v12) = -1084982559;
  id v13 = [v11 initWithColor:v148 fraction:v12];
  v172[2] = v13;
  id v14 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v15) = 18.0;
  id v16 = [v14 initWithColor:v154 fraction:v15];
  v172[3] = v16;
  id v17 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v18) = 30.0;
  id v19 = [v17 initWithColor:v3 fraction:v18];
  v172[4] = v19;
  double v20 = +[NSArray arrayWithObjects:v172 count:5];
  long long v21 = (NTKColorCurve *)[v4 initWithColorCurveElements:v20];
  preNoonSolarDiskColorCurve = self->_preNoonSolarDiskColorCurve;
  self->_preNoonSolarDiskColorCurve = v21;

  id v23 = objc_alloc((Class)NTKColorCurve);
  id v24 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v25) = -30.0;
  id v26 = [v24 initWithColor:v2 fraction:v25];
  v171[0] = v26;
  id v27 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v28) = -18.0;
  id v29 = [v27 initWithColor:v158 fraction:v28];
  v171[1] = v29;
  id v30 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v31) = -1084982559;
  id v32 = [v30 initWithColor:v155 fraction:v31];
  v171[2] = v32;
  id v33 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v34) = 18.0;
  id v35 = [v33 initWithColor:v157 fraction:v34];
  v171[3] = v35;
  id v36 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v37) = 30.0;
  id v38 = [v36 initWithColor:v3 fraction:v37];
  v171[4] = v38;
  v39 = +[NSArray arrayWithObjects:v171 count:5];
  v40 = (NTKColorCurve *)[v23 initWithColorCurveElements:v39];
  postNoonSolarDiskColorCurve = self->_postNoonSolarDiskColorCurve;
  self->_postNoonSolarDiskColorCurve = v40;

  uint64_t v42 = +[UIColor colorWithRed:0.803921569 green:0.549019608 blue:0.815686275 alpha:1.0];
  v146 = +[UIColor colorWithRed:0.803921569 green:0.549019608 blue:0.815686275 alpha:1.0];
  v152 = +[UIColor colorWithRed:0.803921569 green:0.674509804 blue:0.4 alpha:1.0];
  v151 = +[UIColor colorWithRed:0.552941176 green:0.658823529 blue:0.22745098 alpha:1.0];
  uint64_t v43 = +[UIColor colorWithRed:0.588235294 green:0.529411765 blue:0.352941176 alpha:1.0];
  v156 = +[UIColor colorWithRed:0.619607843 green:0.4 blue:0.478431373 alpha:1.0];
  v149 = +[UIColor colorWithRed:0.898039216 green:0.588235294 blue:0.149019608 alpha:1.0];
  v150 = +[UIColor colorWithRed:0.803921569 green:0.360784314 blue:0.184313725 alpha:1.0];
  id v44 = objc_alloc((Class)NTKColorCurve);
  id v45 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v46) = -30.0;
  uint64_t v47 = v42;
  v145 = (void *)v42;
  id v48 = [v45 initWithColor:v42 fraction:v46];
  v170[0] = v48;
  id v49 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v50) = -18.0;
  id v51 = [v49 initWithColor:v146 fraction:v50];
  v170[1] = v51;
  id v52 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v53) = -1084982559;
  id v54 = [v52 initWithColor:v152 fraction:v53];
  v170[2] = v54;
  id v55 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v56) = 18.0;
  id v57 = [v55 initWithColor:v151 fraction:v56];
  v170[3] = v57;
  id v58 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v59) = 30.0;
  uint64_t v60 = v43;
  v144 = (void *)v43;
  id v61 = [v58 initWithColor:v43 fraction:v59];
  v170[4] = v61;
  v62 = +[NSArray arrayWithObjects:v170 count:5];
  v63 = (NTKColorCurve *)[v44 initWithColorCurveElements:v62];
  preNoonHorizonGradientColorCurve = self->_preNoonHorizonGradientColorCurve;
  self->_preNoonHorizonGradientColorCurve = v63;

  id v65 = objc_alloc((Class)NTKColorCurve);
  id v66 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v67) = -30.0;
  id v68 = [v66 initWithColor:v47 fraction:v67];
  v169[0] = v68;
  id v69 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v70) = -18.0;
  id v71 = [v69 initWithColor:v150 fraction:v70];
  v169[1] = v71;
  id v72 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v73) = -1084982559;
  id v74 = [v72 initWithColor:v149 fraction:v73];
  v169[2] = v74;
  id v75 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v76) = 18.0;
  id v77 = [v75 initWithColor:v156 fraction:v76];
  v169[3] = v77;
  id v78 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v79) = 30.0;
  id v80 = [v78 initWithColor:v60 fraction:v79];
  v169[4] = v80;
  v81 = +[NSArray arrayWithObjects:v169 count:5];
  v82 = (NTKColorCurve *)[v65 initWithColorCurveElements:v81];
  postNoonHorizonGradientColorCurve = self->_postNoonHorizonGradientColorCurve;
  self->_postNoonHorizonGradientColorCurve = v82;

  uint64_t v164 = 0;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v161 = 0u;
  memset(v160, 0, sizeof(v160));
  v84 = [(NTKSolarFaceView *)self device];
  sub_64E0(v84, (uint64_t)v160);

  long long v85 = v161;
  long long v86 = v162;
  long long v87 = v163;
  id v88 = objc_alloc((Class)NTKFloatCurve);
  id v89 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*(double *)&v85 fraction:-30.0];
  v168[0] = v89;
  id v90 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*((double *)&v85 + 1) fraction:-18.0];
  v168[1] = v90;
  id v91 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*(double *)&v86 fraction:-0.83];
  v168[2] = v91;
  id v92 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*((double *)&v86 + 1) fraction:30.0];
  v168[3] = v92;
  v93 = +[NSArray arrayWithObjects:v168 count:4];
  v94 = (NTKFloatCurve *)[v88 initWithFloatCurveElements:v93];
  preNoonHorizonHeightCurve = self->_preNoonHorizonHeightCurve;
  self->_preNoonHorizonHeightCurve = v94;

  id v96 = objc_alloc((Class)NTKFloatCurve);
  id v97 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*(double *)&v85 fraction:-30.0];
  v167[0] = v97;
  id v98 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*((double *)&v87 + 1) fraction:-18.0];
  v167[1] = v98;
  id v99 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*(double *)&v87 fraction:-0.83];
  v167[2] = v99;
  id v100 = [objc_alloc((Class)NTKFloatCurveElement) initWithFloatValue:*((double *)&v86 + 1) fraction:30.0];
  v167[3] = v100;
  v101 = +[NSArray arrayWithObjects:v167 count:4];
  v102 = (NTKFloatCurve *)[v96 initWithFloatCurveElements:v101];
  postNoonHorizonHeightCurve = self->_postNoonHorizonHeightCurve;
  self->_postNoonHorizonHeightCurve = v102;

  v143 = NTKInterpolateBetweenColors();
  v142 = NTKInterpolateBetweenColors();
  id v104 = objc_alloc((Class)NTKColorCurve);
  id v105 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v106) = -30.0;
  id v107 = [v105 initWithColor:v153 fraction:v106];
  v166[0] = v107;
  id v108 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v109) = -18.0;
  id v110 = [v108 initWithColor:v153 fraction:v109];
  v166[1] = v110;
  id v111 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v112) = -1084982559;
  id v113 = [v111 initWithColor:v152 fraction:v112];
  v166[2] = v113;
  id v114 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v115) = 18.0;
  id v116 = [v114 initWithColor:v143 fraction:v115];
  v166[3] = v116;
  id v117 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v118) = 30.0;
  id v119 = [v117 initWithColor:v3 fraction:v118];
  v166[4] = v119;
  v120 = +[NSArray arrayWithObjects:v166 count:5];
  v121 = (NTKColorCurve *)[v104 initWithColorCurveElements:v120];
  preNoonComplicationColorCurve = self->_preNoonComplicationColorCurve;
  self->_preNoonComplicationColorCurve = v121;

  id v141 = objc_alloc((Class)NTKColorCurve);
  id v123 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v124) = -30.0;
  id v125 = [v123 initWithColor:v158 fraction:v124];
  v165[0] = v125;
  id v126 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v127) = -18.0;
  id v128 = [v126 initWithColor:v158 fraction:v127];
  v165[1] = v128;
  id v129 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v130) = -1084982559;
  id v131 = [v129 initWithColor:v149 fraction:v130];
  v165[2] = v131;
  id v132 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v133) = 18.0;
  id v134 = [v132 initWithColor:v142 fraction:v133];
  v165[3] = v134;
  id v135 = objc_alloc((Class)NTKColorCurveElement);
  LODWORD(v136) = 30.0;
  id v137 = [v135 initWithColor:v3 fraction:v136];
  v165[4] = v137;
  v138 = +[NSArray arrayWithObjects:v165 count:5];
  v139 = (NTKColorCurve *)[v141 initWithColorCurveElements:v138];
  postNoonComplicationColorCurve = self->_postNoonComplicationColorCurve;
  self->_postNoonComplicationColorCurve = v139;
}

- (void)_updateSolarHaloWithPercentage:(double)a3
{
  -[NTKSolarPath altitudeAtPercentage:](self->_solarPath, "altitudeAtPercentage:");
  double v6 = sub_9AB4(self->_preNoonSolarDiskColorCurve, self->_postNoonSolarDiskColorCurve, a3, v5);
  [(UIView *)self->_solarDiskHaloMaskView setBackgroundColor:v6];
  [(UIView *)self->_horizonView frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:a3];
  double v16 = v15;
  v29.origin.x = v8;
  v29.origin.double y = v10;
  v29.size.double width = v12;
  v29.size.double height = v14;
  double MinY = CGRectGetMinY(v29);
  double v18 = MinY - v16;
  [(UIView *)self->_belowHorizonView frame];
  double v19 = vabdd_f64(MinY, v16) / (CGRectGetHeight(v30) * 0.9);
  double v20 = [(NTKSolarFaceView *)self device];
  sub_64E0(v20, (uint64_t)v27);
  double v21 = v28;

  double v22 = 1.0 - v19;
  if (1.0 - v19 < 0.0) {
    double v22 = 0.0;
  }
  if (v18 >= 0.0) {
    double v23 = 1.0;
  }
  else {
    double v23 = v22;
  }
  double v24 = (v19 + 1.0) * (v21 * 0.78);
  if (v24 > v21 * 1.05) {
    double v24 = v21 * 1.05;
  }
  solarDiskHaloView = self->_solarDiskHaloView;
  CGAffineTransformMakeScale(&v26, v24, v24);
  [(UIImageView *)solarDiskHaloView setTransform:&v26];
  [(UIImageView *)self->_solarDiskHaloView setAlpha:v23];
}

- (void)_updateSolarHorizonGradientAlphaWithPercentage:(double)a3
{
  [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:a3];

  -[NTKSolarFaceView _updateSolarHorizonGradientAlphaWithSolarDiskCenter:](self, "_updateSolarHorizonGradientAlphaWithSolarDiskCenter:");
}

- (void)_updateSolarHorizonGradientAlphaWithSolarDiskCenter:(CGPoint)a3
{
  double y = a3.y;
  [(UIView *)self->_horizonView frame];
  double MinY = CGRectGetMinY(v10);
  double v6 = 20.0;
  if (MinY - y < 0.0) {
    double v6 = 14.0;
  }
  double v7 = fmin(fmax(1.0 - vabdd_f64(MinY, y) / v6, 0.0), 1.0);
  horizonGradientContainerView = self->_horizonGradientContainerView;

  [(UIView *)horizonGradientContainerView setAlpha:v7];
}

- (void)_updateSolarHorizonGradientColorWithPercentage:(double)a3
{
  -[NTKSolarPath altitudeAtPercentage:](self->_solarPath, "altitudeAtPercentage:");
  double v6 = v5;
  double v7 = sub_9AB4(self->_preNoonHorizonGradientColorCurve, self->_postNoonHorizonGradientColorCurve, a3, v5);
  postNoonHorizonHeightCurve = self->_postNoonHorizonHeightCurve;
  double v9 = self->_preNoonHorizonHeightCurve;
  CGRect v10 = postNoonHorizonHeightCurve;
  double v11 = v10;
  if (a3 <= 0.25)
  {
    CGRect v10 = v9;
  }
  else if (a3 < 0.75)
  {
    [(NTKFloatCurve *)v9 floatValueForFraction:v6];
    [(NTKFloatCurve *)v11 floatValueForFraction:v6];
    CLKInterpolateBetweenFloatsClipped();
    goto LABEL_6;
  }
  [(NTKFloatCurve *)v10 floatValueForFraction:v6];
LABEL_6:

  CGFloat v12 = [(NTKSolarFaceView *)self device];
  CLKFloorForDevice();

  [(UIImageView *)self->_horizonGradientView frame];
  -[UIImageView setFrame:](self->_horizonGradientView, "setFrame:");
  double v13 = [(UIImageView *)self->_horizonGradientView layer];
  [v13 displayIfNeeded];

  CGFloat v14 = [(UIImageView *)self->_horizonGradientView layer];
  id v15 = v7;
  objc_msgSend(v14, "setContentsMultiplyColor:", objc_msgSend(v15, "CGColor"));
}

- (void)_updateComplicationColorWithPercentage:(double)a3
{
  -[NTKSolarPath altitudeAtPercentage:](self->_solarPath, "altitudeAtPercentage:");
  sub_9AB4(self->_preNoonComplicationColorCurve, self->_postNoonComplicationColorCurve, a3, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory setForegroundColor:v6 faceView:self];
}

- (double)_solarDiskRestPercentage
{
  solarTimeModel = self->_solarTimeModel;
  CFStringRef v3 = [(NTKSolarFaceView *)self currentDisplayDate];
  [(NTKSolarTimeModel *)solarTimeModel percentageThroughPeriodInCurrentSolarDayForDate:v3];
  double v5 = v4;

  return v5;
}

- (double)_solarDiskIdealizedDatePercentage
{
  [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForIdealizedTimeInCurrentSolarDay];
  return result;
}

- (void)_solarDiskPercentageChanged:(double)a3
{
  -[NTKSolarFaceView _updateSolarHaloWithPercentage:](self, "_updateSolarHaloWithPercentage:");
  [(NTKSolarFaceView *)self _updateSolarHorizonGradientColorWithPercentage:a3];
  [(NTKSolarFaceView *)self _updateComplicationColorWithPercentage:a3];
  [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:a3];
  double v6 = v5;
  double v8 = v7;
  -[NTKSolarFaceView _updateSolarHorizonGradientAlphaWithSolarDiskCenter:](self, "_updateSolarHorizonGradientAlphaWithSolarDiskCenter:");
  -[NTKSolarDiskView setCenter:](self->_solarDiskView, "setCenter:", v6, v8);
  self->_double currentSolarDiskPercentage = a3;

  [(NTKSolarFaceView *)self _updateSolarDiskHaloViewPosition];
}

- (void)_updateSolarDiskHaloViewPosition
{
  [(NTKSolarDiskView *)self->_solarDiskView center];
  double v4 = v3;
  double v6 = v5;
  id v16 = [(NSDictionary *)self->_waypointViews objectForKeyedSubscript:&off_2DAC0];
  double v7 = [(NSDictionary *)self->_waypointViews objectForKeyedSubscript:&off_2DB20];
  [(UIView *)self->_horizonView frame];
  double v9 = v8;
  if (v16)
  {
    [v16 frame];
    double v10 = fmax(CGRectGetMidX(v18), 0.0);
    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
    double v10 = 0.0;
    if (!v7) {
      goto LABEL_5;
    }
  }
  [v7 frame];
  double MidX = CGRectGetMidX(v19);
  [(UIView *)self->_horizonView frame];
  if (MidX > CGRectGetMidX(v20)) {
    double v9 = MidX;
  }
LABEL_5:
  if (v10 >= v4) {
    double v12 = v10;
  }
  else {
    double v12 = v4;
  }
  if (v9 <= v12) {
    double v13 = v9;
  }
  else {
    double v13 = v12;
  }
  [(UIView *)self->_horizonView frame];
  double MinY = CGRectGetMinY(v21);
  if (v6 <= MinY) {
    double v15 = v6;
  }
  else {
    double v15 = MinY;
  }
  -[UIImageView setCenter:](self->_solarDiskHaloView, "setCenter:", v13, v15);
}

- (void)_animateSolarDiskToRestPercentageIfNeededForViewMode:(int64_t)a3
{
  if (a3 != 2)
  {
    double solarDiskOverridePercentage = self->_solarDiskOverridePercentage;
    if (solarDiskOverridePercentage != -1.0)
    {
      [(NTKSolarFaceView *)self _solarDiskRestPercentage];
      [(NTKSolarFaceView *)self _animateSolarDiskFromPercentage:@"_NTKSolarDiskReturnToRestAnimatingReason" toPercentage:solarDiskOverridePercentage reason:v5];
    }
  }
}

- (id)_createWaypointView
{
  uint64_t v2 = [(NTKSolarFaceView *)self device];
  sub_64E0(v2, (uint64_t)v8);
  double v3 = v9;

  id v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v3, v3);
  double v5 = [v4 layer];
  [v5 setCornerRadius:v3 * 0.5];

  double v6 = +[UIColor grayColor];
  [v4 setBackgroundColor:v6];

  [v4 setAlpha:0.0];

  return v4;
}

- (CGPoint)_pointOnSolarPathForPercentage:(double)a3
{
  id v4 = [(NTKBezierPathView *)self->_solarBezierPathView pointModel];
  [v4 pointOnPathForHorizontalPercentage:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.x = v9;
  return result;
}

- (void)_updateSolarPathForChangedLocation:(id)a3
{
  id v4 = a3;
  double v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Solar _updateSolarPathForChangedLocation with location:%@", (uint8_t *)&v8, 0xCu);
  }

  double v6 = [(NTKSolarTimeModel *)self->_solarTimeModel referenceLocation];
  [(NTKSolarTimeModel *)self->_solarTimeModel setReferenceLocation:v4];
  [(NTKSolarFaceView *)self _updateWaypoints];
  double v7 = [(NTKSolarFaceView *)self _createSolarBezierPath];
  [(NTKSolarFaceView *)self _setSolarBezierPath:v7 animated:v6 != 0];
}

- (void)_updateSolarPathForChangedDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Solar _updateSolarPathForChangedDate with date:%@", buf, 0xCu);
  }

  unsigned int v8 = [(NTKSolarTimeModel *)self->_solarTimeModel includesDate:v6];
  id v9 = (char *)[(NTKSolarFaceView *)self viewMode];
  double v10 = [(NTKSolarTimeModel *)self->_solarTimeModel endDateForReferenceDate];
  [v10 timeIntervalSinceDate:v6];
  double v12 = v11;

  [(NTKSolarTimeModel *)self->_solarTimeModel updateModelWithDate:v6];
  if (v8)
  {
    if (v9 != (unsigned char *)&dword_0 + 2)
    {
      [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForDate:v6];
      -[NTKSolarFaceView _solarDiskPercentageChanged:](self, "_solarDiskPercentageChanged:");
    }
  }
  else
  {
    [(NTKSolarFaceView *)self _updateWaypoints];
    if (v9 == (unsigned char *)&dword_0 + 2) {
      *((unsigned char *)self + 368) &= ~8u;
    }
    [(NTKSolarFaceView *)self setUserInteractionEnabled:0];
    [(NTKSolarFaceView *)self bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    CGRect v21 = [(NTKBezierPathView *)self->_solarBezierPathView path];
    id v22 = objc_msgSend(objc_alloc((Class)NTKBezierPathView), "initWithFrame:", v14, v16, v18, v20);
    [v22 setPath:v21];
    double v23 = +[UIColor whiteColor];
    double v24 = [v23 colorWithAlphaComponent:0.5];
    [v22 setPathColor:v24];

    [(NTKBezierPathView *)self->_solarBezierPathView addSubview:v22];
    double v25 = [(NTKSolarFaceView *)self _createSolarBezierPath];
    [(NTKSolarFaceView *)self _setSolarBezierPath:v25 animated:0];

    [(UIView *)self->_horizonView bounds];
    CGRectGetWidth(v45);
    horizonView = self->_horizonView;
    [(UIView *)horizonView frame];
    CLKAlterRect();
    -[UIView setFrame:](horizonView, "setFrame:");
    [(NTKSolarFaceView *)self setUserInteractionEnabled:0];
    [(NTKSolarFaceView *)self _beginAnimatingForReason:@"_NTKSolarPathDateChangeAnimatingReason"];
    v46.origin.x = v14;
    v46.origin.double y = v16;
    v46.size.double width = v18;
    v46.size.double height = v20;
    double Width = CGRectGetWidth(v46);
    if (v12 >= 0.0) {
      double v28 = -Width;
    }
    else {
      double v28 = Width;
    }
    solarBezierPathView = self->_solarBezierPathView;
    CGAffineTransformMakeTranslation(&v42, v28, 0.0);
    [(NTKBezierPathView *)solarBezierPathView setTransform:&v42];
    CGAffineTransformMakeTranslation(&v41, -v28, 0.0);
    [v22 setTransform:&v41];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_A83C;
    v38[3] = &unk_2C978;
    v38[4] = self;
    double v40 = v28;
    id v30 = v22;
    id v39 = v30;
    double v31 = objc_retainBlock(v38);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_A90C;
    v34[3] = &unk_2C9A0;
    v34[4] = self;
    double v37 = v28;
    id v32 = v30;
    id v35 = v32;
    id v36 = v6;
    id v33 = objc_retainBlock(v34);
    if (v4)
    {
      +[UIView animateWithDuration:0 delay:v31 options:v33 animations:0.5 completion:0.0];
    }
    else
    {
      ((void (*)(void *))v31[2])(v31);
      ((void (*)(void *, uint64_t))v33[2])(v33, 1);
    }
  }
}

- (id)_createSolarBezierPath
{
  [(NTKSolarFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v26.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v26.c = v11;
  *(_OWORD *)&v26.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  double v12 = [(NTKSolarFaceView *)self device];
  NTKDigitalTimeLabelDefaultFrameBottom();
  double v14 = v13;

  CGFloat v15 = v14 + 10.0;
  double v16 = self->_labelFontLineHeight + 4.0;
  double v17 = [(NTKSolarFaceView *)self device];
  sub_64E0(v17, (uint64_t)v24);
  double v18 = v25;

  CGAffineTransformMakeTranslation(&v26, 0.0, v15);
  [(NTKSolarTimeModel *)self->_solarTimeModel setUsePlaceholderData:(*((unsigned char *)self + 368) & 4) == 0];
  double v19 = (NTKSolarPath *)objc_msgSend(objc_alloc((Class)NTKSolarPath), "initWithBounds:solarTimeModel:verticallyFitsPathToBounds:usePlaceholderData:", self->_solarTimeModel, 0, (*((unsigned char *)self + 368) & 4) == 0, v4, v6 + v15, v8, v10 - (v15 + v16 + v18));
  solarPath = self->_solarPath;
  self->_solarPath = v19;

  CGRect v21 = [(NTKSolarPath *)self->_solarPath bezierPath];
  CGAffineTransform v23 = v26;
  [v21 applyTransform:&v23];

  return v21;
}

- (void)_setSolarBezierPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NSDictionary *)self->_waypointViews allValues];
  [v7 makeObjectsPerformSelector:"removeFromSuperview"];

  waypointViews = self->_waypointViews;
  uint64_t v27 = 144;
  self->_waypointViews = 0;

  solarBezierPathView = self->_solarBezierPathView;
  double v28 = v6;
  if (v4)
  {
    [(NTKBezierPathView *)solarBezierPathView animateToPath:v6 duration:0 curve:0.5];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_AE74;
    v33[3] = &unk_2C9C8;
    v33[4] = self;
    +[UIView animateWithDuration:v33 animations:0.5];
  }
  else
  {
    [(NTKBezierPathView *)solarBezierPathView setPath:v6];
  }
  double v10 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v11 = [(NSDictionary *)self->_waypoints allValues];
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    double v15 = NTKSolarWaypointInvalidPercentage;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "percentageThroughPeriodForWaypointDate", v27, v28);
        if (v18 != v15)
        {
          solarTimeModel = self->_solarTimeModel;
          double v20 = [v17 waypointDate];
          [(NTKSolarTimeModel *)solarTimeModel percentageThroughPeriodForDate:v20];
          double v22 = v21;

          CGAffineTransform v23 = [(NTKSolarFaceView *)self _createWaypointView];
          [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:v22];
          objc_msgSend(v23, "setCenter:");
          double v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 type]);
          [v10 setObject:v23 forKeyedSubscript:v24];

          [(UIView *)self->_solarPathObjectContainerView insertSubview:v23 aboveSubview:self->_solarBezierPathView];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  id v25 = [v10 copy];
  CGAffineTransform v26 = *(void **)&self->NTKDigitalFaceView_opaque[v27];
  *(void *)&self->NTKDigitalFaceView_opaque[v27] = v25;
}

- (void)_transitionToViewMode:(int64_t)a3
{
  [(NTKSolarFaceView *)self _layoutHorizonForViewMode:"_layoutHorizonForViewMode:"];
  [(NTKSolarFaceView *)self _layoutSolarPathAndContainerForViewMode:a3];

  [(NTKSolarFaceView *)self _layoutSolarDiskViewForViewMode:a3];
}

- (BOOL)_canEnterInteractiveMode
{
  if ([(NTKSolarFaceView *)self _isAnimating]
    || [(NTKSolarFaceView *)self viewMode]
    && [(NTKSolarFaceView *)self viewMode] != (char *)&dword_0 + 1)
  {
    return 0;
  }

  return [(NTKSolarFaceView *)self _shouldHandleHardwareEvents];
}

- (void)_interpolateFromViewMode:(int64_t)a3 toViewMode:(int64_t)a4 progress:(double)a5
{
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  -[UILabel setAlpha:](self->_overrideDateLabel, "setAlpha:");
  [(UILabel *)self->_scrubLabel setAlpha:v7];
  [(UILabel *)self->_waypointLabel setAlpha:v7];
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v7, v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = [(NSDictionary *)self->_waypointViews allValues];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        CGAffineTransform v14 = v19;
        [v13 setTransform:&v14];
        [v13 setAlpha:v7];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  CLKInterpolateBetweenFloatsClipped();
  -[NTKDigitialUtilitarianFaceViewComplicationFactory setAlpha:faceView:](self->_faceViewComplicationFactory, "setAlpha:faceView:", self);
}

- (void)_setViewMode:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_setViewMode:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  if ((*((unsigned char *)self + 368) & 1) != 0 && (!a3 || [(NTKSolarFaceView *)self viewMode] != (id)a3))
  {
    self->_previousViewMode = (int64_t)[(NTKSolarFaceView *)self viewMode];
    self->_nextViewMode = a3;
    [(NTKSolarFaceView *)self _prepareForSettingViewMode:a3];
    [(NTKSolarFaceView *)self _updateTimeScrubbingContentForViewMode:a3];
    if (a3 == 2)
    {
      scrubLabel = self->_scrubLabel;
      id v10 = sub_B33C();
      [(UILabel *)scrubLabel setText:v10];
    }
    uint64_t v11 = [(NTKSolarFaceView *)self delegate];
    [v11 faceViewWantsStatusBarHidden:a3 == 2 animated:v5];

    [(NTKSolarFaceView *)self _interpolateFromViewMode:self->_previousViewMode toViewMode:a3 progress:1.0];
    [(NTKSolarFaceView *)self _transitionToViewMode:a3];
    [(NTKSolarFaceView *)self invalidateDigitalTimeLabelStyle];
    v13.receiver = self;
    v13.super_class = (Class)NTKSolarFaceView;
    [(NTKSolarFaceView *)&v13 setViewMode:a3];
    if (a3 == 2 || self->_previousViewMode == 2)
    {
      id v12 = [(NTKSolarFaceView *)self _createSolarBezierPath];
      [(NTKSolarFaceView *)self _setSolarBezierPath:v12 animated:0];
    }
    [(NTKSolarFaceView *)self _cleanupAfterSettingViewMode:a3];
    [(NTKSolarFaceView *)self _solarDiskRestPercentage];
    -[NTKSolarFaceView _solarDiskPercentageChanged:](self, "_solarDiskPercentageChanged:");
    [(NTKSolarFaceView *)self setNeedsLayout];
    [(NTKSolarFaceView *)self layoutIfNeeded];
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)_prepareForSettingViewMode:(int64_t)a3
{
  if (a3 == 2) {
    [(NTKSolarFaceView *)self _updateWaypointLabelForCrownMovement];
  }
}

- (void)_cleanupAfterSettingViewMode:(int64_t)a3
{
  [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:a3 != 1];
  if (NTKStarbearEnabled())
  {
    if (a3 != 2)
    {
LABEL_3:
      [(NTKSolarFaceView *)self _disableCrown];
      goto LABEL_6;
    }
  }
  else if ((a3 | 2) != 2)
  {
    goto LABEL_3;
  }
  [(NTKSolarFaceView *)self _enableCrown];
LABEL_6:
  if (a3 != 2) {
    self->_double solarDiskOverridePercentage = -1.0;
  }

  [(NTKSolarFaceView *)self _endAnimatingForReason:@"_NTKSolarLayoutAnimatingReason"];
}

- (void)_beginAnimatingForReason:(id)a3
{
}

- (void)_endAnimatingForReason:(id)a3
{
}

- (BOOL)_isAnimating
{
  return [(NSMutableSet *)self->_animatingReasons count] != 0;
}

- (BOOL)_isAnimatingForReason:(id)a3
{
  return [(NSMutableSet *)self->_animatingReasons containsObject:a3];
}

- (void)_layoutLegacyDateComplication
{
  double v3 = [(NTKSolarFaceView *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (HIWORD(v4) <= 4u)
  {
    if (!self->_dateComplicationLayoutRule)
    {
      [(NTKSolarFaceView *)self bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      objc_super v13 = [(NTKSolarFaceView *)self device];
      CGAffineTransform v14 = +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:forDevice:", v13, v6, v8, v10, v12);

      long long v15 = [v14 layoutRule];
      [v15 setHorizontalLayout:0];

      long long v16 = [v14 layoutRule];
      dateComplicationLayoutRule = self->_dateComplicationLayoutRule;
      self->_dateComplicationLayoutRule = v16;
    }
    [(NTKDateComplicationLabel *)self->_dateComplicationLabel sizeToFit];
    [(NTKSolarFaceView *)self bounds];
    CLKAlterRect();
    -[NTKLayoutRule setReferenceFrame:](self->_dateComplicationLayoutRule, "setReferenceFrame:");
    long long v18 = self->_dateComplicationLayoutRule;
    [(NTKDateComplicationLabel *)self->_dateComplicationLabel bounds];
    -[NTKLayoutRule calculateLayoutFrameForBoundsSize:](v18, "calculateLayoutFrameForBoundsSize:", v19, v20);
    dateComplicationLabel = self->_dateComplicationLabel;
    -[NTKDateComplicationLabel setFrame:](dateComplicationLabel, "setFrame:");
  }
}

- (void)_layoutHorizonForViewMode:(int64_t)a3
{
  [(NTKSolarFaceView *)self bounds];
  CGFloat x = v43.origin.x;
  CGFloat y = v43.origin.y;
  CGFloat width = v43.size.width;
  CGFloat height = v43.size.height;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v44);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v45);
  if ((unint64_t)a3 > 2)
  {
    double v18 = MidY + -0.5;
    goto LABEL_9;
  }
  double v12 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&off_2DAD8];
  objc_super v13 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&off_2DB08];
  [v12 percentageThroughPeriodForWaypointDate];
  double v14 = NTKSolarWaypointInvalidPercentage;
  if (v15 == NTKSolarWaypointInvalidPercentage)
  {
    [v13 percentageThroughPeriodForWaypointDate];
    if (v19 == v14)
    {
      [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:0.5];
      double v38 = v37;
      [(NTKSolarPath *)self->_solarPath altitudeAtPercentage:0.5];
      double v18 = v38 + v39;
      goto LABEL_8;
    }
    solarTimeModel = self->_solarTimeModel;
    long long v17 = v13;
  }
  else
  {
    solarTimeModel = self->_solarTimeModel;
    long long v17 = v12;
  }
  double v20 = [v17 waypointDate];
  [(NTKSolarTimeModel *)solarTimeModel percentageThroughPeriodForDate:v20];
  double v22 = v21;

  [(NTKSolarFaceView *)self _pointOnSolarPathForPercentage:v22];
  float v24 = v23 + 0.5;
  double v18 = floorf(v24);
LABEL_8:

LABEL_9:
  CGFloat v41 = v18;
  -[UIView setFrame:](self->_horizonView, "setFrame:", MinX, v18, v11, 0.5);
  [(UIView *)self->_horizonGradientContainerView frame];
  CGFloat v25 = v11;
  double v27 = v26;
  v46.size.CGFloat height = 0.5;
  v46.origin.CGFloat x = MinX;
  v46.origin.CGFloat y = v18;
  v46.size.CGFloat width = v25;
  double MinY = CGRectGetMinY(v46);
  [(UIImageView *)self->_horizonGradientView bounds];
  double v30 = MinY - v29;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat v40 = MinX;
  double v31 = CGRectGetWidth(v47);
  [(UIImageView *)self->_horizonGradientView bounds];
  -[UIView setFrame:](self->_horizonGradientContainerView, "setFrame:", v27, v30, v31);
  horizonGradientView = self->_horizonGradientView;
  [(UIView *)self->_horizonGradientContainerView bounds];
  -[UIImageView setFrame:](horizonGradientView, "setFrame:");
  [(UIView *)self->_belowHorizonView frame];
  v48.size.CGFloat height = 0.5;
  v48.origin.CGFloat x = v40;
  v48.origin.CGFloat y = v41;
  v48.size.CGFloat width = v25;
  double MaxY = CGRectGetMaxY(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v34 = CGRectGetHeight(v49) - MaxY;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double v35 = CGRectGetWidth(v50);
  belowHorizonView = self->_belowHorizonView;

  -[UIView setFrame:](belowHorizonView, "setFrame:", 0.0, MaxY, v35, v34);
}

- (void)_layoutSolarPathAndContainerForViewMode:(int64_t)a3
{
  solarPathObjectContainerView = self->_solarPathObjectContainerView;
  [(NTKSolarFaceView *)self bounds];
  -[UIView setFrame:](solarPathObjectContainerView, "setFrame:");
  solarBezierPathView = self->_solarBezierPathView;
  [(NTKSolarFaceView *)self bounds];
  -[NTKBezierPathView setFrame:](solarBezierPathView, "setFrame:");
  if ((unint64_t)a3 <= 2)
  {
    double v7 = self->_solarBezierPathView;
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v8;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(NTKBezierPathView *)v7 setTransform:v9];
  }
}

- (void)_layoutSolarDiskViewForViewMode:(int64_t)a3
{
  solarDiskView = self->_solarDiskView;
  [(UIView *)self->_horizonView frame];
  [(NTKSolarDiskView *)solarDiskView setHorizonLine:CGRectGetMinY(v9)];
  if (a3 == 1)
  {
    if ([(NTKSolarFaceView *)self _isAnimating]) {
      goto LABEL_9;
    }
    [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForIdealizedTimeInCurrentSolarDay];
    double v6 = self->_solarDiskView;
    goto LABEL_8;
  }
  if (!a3 && (![(NTKSolarFaceView *)self _isAnimating] || self->_previousViewMode == 3))
  {
    double v6 = self->_solarDiskView;
    [(NTKSolarFaceView *)self _solarDiskRestPercentage];
LABEL_8:
    -[NTKSolarFaceView _pointOnSolarPathForPercentage:](self, "_pointOnSolarPathForPercentage:");
    -[NTKSolarDiskView setCenter:](v6, "setCenter:");
  }
LABEL_9:
  solarDiskHaloMaskView = self->_solarDiskHaloMaskView;
  [(UIImageView *)self->_solarDiskHaloView bounds];
  -[UIView setFrame:](solarDiskHaloMaskView, "setFrame:");

  [(NTKSolarFaceView *)self _updateSolarDiskHaloViewPosition];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_layoutForegroundContainerView
{
  [(NTKSolarFaceView *)self bounds];
  recta.origin.CGFloat x = v3;
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  *(void *)&recta.origin.CGFloat y = [(UILabel *)self->_overrideDateLabel text];
  overrideDateLabel = self->_overrideDateLabel;
  double v11 = sub_B33C();
  [(UILabel *)overrideDateLabel setText:v11];

  [(UILabel *)self->_overrideDateLabel sizeToFit];
  [(UILabel *)self->_overrideDateLabel frame];
  double v13 = v12;
  [(UILabel *)self->_overrideDateLabel setText:*(void *)&recta.origin.y];
  double v14 = [(NTKSolarFaceView *)self device];
  sub_64E0(v14, (uint64_t)v32);
  double v15 = v33;

  long long v16 = [(NTKSolarFaceView *)self device];
  sub_64E0(v16, (uint64_t)&recta.size);
  double v17 = v31;

  double v18 = self->_overrideDateLabel;
  double v19 = [(NTKSolarFaceView *)self timeView];
  [v19 frame];
  -[UILabel setFrame:](v18, "setFrame:", v17, v15, CGRectGetMinX(v35) - v17 + -8.0, v13);

  -[UILabel setFrame:](self->_scrubLabel, "setFrame:", v17, v9 - v13 - v15, v7 - v17 * 2.0, v13);
  v36.origin.CGFloat x = recta.origin.x;
  v36.origin.CGFloat y = v5;
  v36.size.CGFloat width = v7;
  v36.size.CGFloat height = v9;
  CGRectGetWidth(v36);
  double v20 = [(NTKBezierPathView *)self->_solarBezierPathView path];
  [v20 bounds];
  CGRectGetMinY(v37);
  [(NTKSolarDiskView *)self->_solarDiskView bounds];
  CGRectGetHeight(v38);

  double v21 = [(NTKSolarFaceView *)self device];
  CLKRectCenteredYInRectForDevice();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  -[UILabel setFrame:](self->_waypointLabel, "setFrame:", v23, v15 + v25, v27, v29);
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v3 _prepareForEditing];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory prepareForEditingForFaceView:self];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarFaceView;
  [(NTKSolarFaceView *)&v3 _cleanupAfterEditing];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory cleanupAfterEditingForFaceView:self];
}

- (void)_adjustUIForBoundsChange
{
  if (*((unsigned char *)self + 368))
  {
    objc_super v3 = [(NTKSolarFaceView *)self _createSolarBezierPath];
    [(NTKSolarFaceView *)self _setSolarBezierPath:v3 animated:0];

    [(NTKSolarFaceView *)self _layoutHorizonForViewMode:[(NTKSolarFaceView *)self viewMode]];
    [(NTKSolarFaceView *)self _layoutSolarPathAndContainerForViewMode:[(NTKSolarFaceView *)self viewMode]];
    [(NTKSolarFaceView *)self _layoutSolarDiskViewForViewMode:[(NTKSolarFaceView *)self viewMode]];
    [(NTKSolarFaceView *)self _solarDiskIdealizedDatePercentage];
    -[NTKSolarFaceView _solarDiskPercentageChanged:](self, "_solarDiskPercentageChanged:");
  }
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  solarContentView = self->_solarContentView;
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](solarContentView, "setAlpha:");
  id v7 = [(NTKSolarFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v7, "setAlpha:");
}

- (void)_configureForEditMode:(int64_t)a3
{
  solarContentView = self->_solarContentView;
  double v6 = NTKEditModeBackgroundContentAlpha;
  if (a3 != 1) {
    double v6 = 1.0;
  }
  [(UIView *)solarContentView setAlpha:v6];
  id v7 = [(NTKSolarFaceView *)self timeView];
  id v9 = v7;
  double v8 = NTKEditModeDimmedAlpha;
  if (!a3) {
    double v8 = 1.0;
  }
  [v7 setAlpha:v8];
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((unint64_t)a3 > 1)
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    if (digitalTimeLabelSmallInUpperRightCornerStyle) {
      goto LABEL_9;
    }
    double v17 = [(NTKSolarFaceView *)self device];
    sub_64E0(v17, (uint64_t)v21);
    double v18 = v22;

    if (v18 > 0.0)
    {
      v24.origin.double x = x;
      v24.origin.double y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      CGRect v25 = CGRectInset(v24, v18 * 0.5, 0.0);
      double x = v25.origin.x;
      double y = v25.origin.y;
      double width = v25.size.width;
      double height = v25.size.height;
    }
    double v11 = [(NTKSolarFaceView *)self device];
    uint64_t v19 = +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:weight:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v11, x, y, width, height, UIFontWeightSemibold);
    double v14 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
    *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v19;
  }
  else
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelDefaultStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelDefaultStyle;
    if (digitalTimeLabelSmallInUpperRightCornerStyle) {
      goto LABEL_9;
    }
    double v11 = [(NTKSolarFaceView *)self device];
    NTKDigitalTimeLabelStyleWideRightSideMargin();
    double v13 = v12;
    double v14 = [(NTKSolarFaceView *)self device];
    uint64_t v15 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v14, x, y, width, height, v13);
    long long v16 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
    *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v15;
  }
  digitalTimeLabelSmallInUpperRightCornerStyle = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
LABEL_9:

  return digitalTimeLabelSmallInUpperRightCornerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonPressTimer, 0);
  objc_storeStrong((id *)&self->_wheelDelayTimer, 0);
  objc_storeStrong((id *)&self->_animatingReasons, 0);
  objc_storeStrong(&self->_waypointSettleAnimationBlock, 0);
  objc_storeStrong((id *)&self->_overrideDateFormatter, 0);
  objc_storeStrong((id *)&self->_overrideDateLabel, 0);
  objc_storeStrong((id *)&self->_scrubLabel, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);
  objc_storeStrong((id *)&self->_dateComplicationLayoutRule, 0);
  objc_storeStrong((id *)&self->_dateComplicationLabel, 0);
  objc_storeStrong((id *)&self->_dateComplicationController, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_viewModeTapGesture, 0);
  objc_storeStrong((id *)&self->_solarPath, 0);
  objc_storeStrong((id *)&self->_postNoonHorizonHeightCurve, 0);
  objc_storeStrong((id *)&self->_preNoonHorizonHeightCurve, 0);
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_belowHorizonView, 0);
  objc_storeStrong((id *)&self->_postNoonHorizonGradientColorCurve, 0);
  objc_storeStrong((id *)&self->_preNoonHorizonGradientColorCurve, 0);
  objc_storeStrong((id *)&self->_horizonGradientContainerView, 0);
  objc_storeStrong((id *)&self->_horizonGradientView, 0);
  objc_storeStrong((id *)&self->_horizonView, 0);
  objc_storeStrong((id *)&self->_waypointViews, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_waypointLabel, 0);
  objc_storeStrong((id *)&self->_postNoonSolarDiskColorCurve, 0);
  objc_storeStrong((id *)&self->_preNoonSolarDiskColorCurve, 0);
  objc_storeStrong((id *)&self->_solarDiskHaloMaskView, 0);
  objc_storeStrong((id *)&self->_solarDiskHaloView, 0);
  objc_storeStrong((id *)&self->_solarDiskHaloParentView, 0);
  objc_storeStrong((id *)&self->_solarDiskView, 0);
  objc_storeStrong((id *)&self->_solarBezierPathView, 0);
  objc_storeStrong((id *)&self->_solarPathObjectContainerView, 0);
  objc_storeStrong((id *)&self->_solarContentView, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelSmallInUpperRightCornerStyle, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelDefaultStyle, 0);
  objc_storeStrong((id *)&self->_postNoonComplicationColorCurve, 0);
  objc_storeStrong((id *)&self->_preNoonComplicationColorCurve, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end