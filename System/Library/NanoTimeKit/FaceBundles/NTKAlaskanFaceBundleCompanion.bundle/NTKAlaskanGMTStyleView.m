@interface NTKAlaskanGMTStyleView
- (BOOL)doneButtonTapped;
- (BOOL)is24HourMode;
- (BOOL)isEditing;
- (CALayer)centerCircleBackgroundLayer;
- (CALayer)gmtHandTip;
- (CALayer)magnifierLensBorder;
- (CALayer)primaryBackgroundLayer;
- (CALayer)secondaryBackgroundLayer;
- (CGPoint)centerPointForAngle:(double)a3 radius:(int64_t)a4;
- (CGRect)pickerViewFrame;
- (CLKDevice)device;
- (NSArray)defaultLocations;
- (NSArray)timezones;
- (NSDate)date;
- (NSMutableDictionary)pickerViewItemIndexByCityIdentifier;
- (NSMutableDictionary)pickerViewItemIndexByHour;
- (NSNumber)currentHighlightedHour;
- (NTKAlaskanAnalogHand)gmtHourHands;
- (NTKAlaskanDialView)bezelView;
- (NTKAlaskanDialView)dialView;
- (NTKAlaskanDialView)gmtHourMarkersView;
- (NTKAlaskanDialView)magnifierGmtHourMarkersView;
- (NTKAlaskanDialView)ticksView;
- (NTKAlaskanGMTColorPalette)palette;
- (NTKAlaskanGMTStyleView)initWithFrame:(CGRect)a3;
- (NTKAlaskanGMTStyleViewDelegate)delegate;
- (NTKAlaskanGMTTimezoneLocation)noneLocation;
- (NTKAlaskanGMTTimezoneLocation)referenceTimezoneLocation;
- (NTKAlaskanGMTTimezoneLocation)selectedPickerViewTimezoneLocation;
- (NTKAlaskanGMTTimezoneLocation)selectedTimezoneLocation;
- (UIImage)locationIcon;
- (UIImageView)heroMarker;
- (UILabel)centerLabel;
- (UIView)containerView;
- (double)angleForHour:(double)a3;
- (double)angleOffset;
- (double)diameter;
- (double)hourOffset;
- (double)magnifierAnglePositionForDate:(id)a3;
- (double)pickerViewCornerRadius;
- (double)targetAngleOffsetForOffset:(double)a3;
- (id)_formattedTextForHour:(unint64_t)a3;
- (id)attributedStringWithPrefix:(id)a3 image:(id)a4 suffix:(id)a5;
- (id)createHourMarkerForBezelView:(unint64_t)a3;
- (id)createTickMarkerForBezelView;
- (id)layerDisabledActions;
- (int64_t)hourForDate:(id)a3;
- (void)_setAngleOffset:(double)a3;
- (void)_updateDialViewsFrame;
- (void)_updateDialViewsFrameAnimated:(BOOL)a3;
- (void)applyHourMarkersScaleTransform;
- (void)dealloc;
- (void)layoutSubviews;
- (void)selectHourOffset:(double)a3;
- (void)selectHourOffset:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)selectTimezoneLocation:(id)a3;
- (void)selectTimezoneLocation:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdditionalTimezoneLocations:(id)a3;
- (void)setBezelView:(id)a3;
- (void)setCenterCircleBackgroundLayer:(id)a3;
- (void)setCenterLabel:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentHighlightedHour:(id)a3;
- (void)setDate:(id)a3;
- (void)setDefaultLocations:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDialView:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setDiameter:(double)a3 animated:(BOOL)a4;
- (void)setDoneButtonTapped:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setEditingAlpha:(double)a3;
- (void)setGmtHandTip:(id)a3;
- (void)setGmtHourHands:(id)a3;
- (void)setGmtHourMarkersView:(id)a3;
- (void)setHeroMarker:(id)a3;
- (void)setHourOffset:(double)a3;
- (void)setIs24HourMode:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setLocationIcon:(id)a3;
- (void)setMagnifierGmtHourMarkersView:(id)a3;
- (void)setMagnifierLensBorder:(id)a3;
- (void)setNoneLocation:(id)a3;
- (void)setPalette:(id)a3;
- (void)setPickerViewItemIndexByCityIdentifier:(id)a3;
- (void)setPickerViewItemIndexByHour:(id)a3;
- (void)setPrimaryBackgroundLayer:(id)a3;
- (void)setReferenceTimezoneLocation:(id)a3;
- (void)setSecondaryBackgroundLayer:(id)a3;
- (void)setSelectedPickerViewTimezoneLocation:(id)a3;
- (void)setSelectedTimezoneLocation:(id)a3;
- (void)setTicksView:(id)a3;
- (void)setTimezones:(id)a3;
- (void)startEditing;
- (void)stopEditing;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBezelMarkerForCurrentDate;
- (void)updateCenterLabelFrame;
- (void)updateCenterLabelText;
- (void)updateColor:(id)a3 object:(id)a4;
- (void)updateGMTHourHands;
- (void)updateMagnifierMask;
- (void)updatePickerViewSelection;
- (void)updateSolarMaskWithSunriseAngle:(double)a3 sunsetAngle:(double)a4 clockwise:(BOOL)a5;
- (void)updateSolarMaskWithTimezoneLocation:(id)a3;
- (void)updateUIForCurrentState;
@end

@implementation NTKAlaskanGMTStyleView

- (NTKAlaskanGMTStyleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v71.receiver = self;
  v71.super_class = (Class)NTKAlaskanGMTStyleView;
  v7 = -[NTKAlaskanGMTStyleView initWithFrame:](&v71, "initWithFrame:");
  if (v7)
  {
    v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    [(NTKAlaskanGMTStyleView *)v7 addSubview:v7->_containerView];
    uint64_t v10 = objc_opt_new();
    date = v7->_date;
    v7->_date = (NSDate *)v10;

    v12 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    uint64_t v13 = [v12 device];
    device = v7->_device;
    v7->_device = (CLKDevice *)v13;

    memset(__src, 0, 312);
    v15 = [(NTKAlaskanGMTStyleView *)v7 device];
    sub_141EC(v15, __src);

    v16 = +[NSLocale currentLocale];
    v7->_is24HourMode = CLKLocaleIs24HourMode();

    v17 = [(NTKAlaskanGMTStyleView *)v7 layerDisabledActions];
    v18 = (CALayer *)objc_alloc_init((Class)CALayer);
    primaryBackgroundLayer = v7->_primaryBackgroundLayer;
    v7->_primaryBackgroundLayer = v18;

    [(CALayer *)v7->_primaryBackgroundLayer setActions:v17];
    v20 = [(NTKAlaskanGMTStyleView *)v7 containerView];
    v21 = [v20 layer];
    [v21 addSublayer:v7->_primaryBackgroundLayer];

    v22 = (CALayer *)objc_alloc_init((Class)CALayer);
    secondaryBackgroundLayer = v7->_secondaryBackgroundLayer;
    v7->_secondaryBackgroundLayer = v22;

    [(CALayer *)v7->_secondaryBackgroundLayer setActions:v17];
    [(CALayer *)v7->_primaryBackgroundLayer addSublayer:v7->_secondaryBackgroundLayer];
    objc_initWeak(&location, v7);
    v24 = [NTKAlaskanDialView alloc];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_14300;
    v67[3] = &unk_39138;
    objc_copyWeak(&v68, &location);
    v25 = [(NTKAlaskanDialView *)v24 initWithNumberOfMarkers:24 markersFactory:v67];
    bezelView = v7->_bezelView;
    v7->_bezelView = v25;

    [(NTKAlaskanDialView *)v7->_bezelView setShouldRotateMarkers:1];
    v27 = [(NTKAlaskanGMTStyleView *)v7 containerView];
    [v27 addSubview:v7->_bezelView];

    v28 = (CALayer *)objc_alloc_init((Class)CALayer);
    centerCircleBackgroundLayer = v7->_centerCircleBackgroundLayer;
    v7->_centerCircleBackgroundLayer = v28;

    id v30 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v7->_centerCircleBackgroundLayer, "setBackgroundColor:", [v30 CGColor]);

    [(CALayer *)v7->_centerCircleBackgroundLayer setActions:v17];
    v31 = [(NTKAlaskanGMTStyleView *)v7 containerView];
    v32 = [v31 layer];
    [v32 addSublayer:v7->_centerCircleBackgroundLayer];

    v33 = [NTKAlaskanDialView alloc];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_143AC;
    v63[3] = &unk_39160;
    objc_copyWeak(&v64, &location);
    memcpy(v65, __src, sizeof(v65));
    uint64_t v66 = 12;
    v34 = [(NTKAlaskanDialView *)v33 initWithNumberOfMarkers:12 markersFactory:v63];
    dialView = v7->_dialView;
    v7->_dialView = v34;

    v36 = [(NTKAlaskanGMTStyleView *)v7 containerView];
    [v36 addSubview:v7->_dialView];

    [(NTKAlaskanDialView *)v7->_dialView setContentDiameter:__src[1]];
    v37 = +[UIColor clearColor];
    [(NTKAlaskanDialView *)v7->_dialView setBackgroundColor:v37];

    [(NTKAlaskanDialView *)v7->_dialView setShouldPixelAlignCenterPoints:0];
    v38 = [NTKAlaskanDialView alloc];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1456C;
    v59[3] = &unk_39188;
    objc_copyWeak(v61, &location);
    v61[1] = &stru_68 + 16;
    id v39 = v17;
    id v60 = v39;
    memcpy(v62, __src, sizeof(v62));
    v40 = [(NTKAlaskanDialView *)v38 initWithNumberOfMarkers:120 markersFactory:v59];
    ticksView = v7->_ticksView;
    v7->_ticksView = v40;

    [(NTKAlaskanDialView *)v7->_ticksView setShouldRotateMarkers:1];
    v42 = [(NTKAlaskanGMTStyleView *)v7 containerView];
    [v42 addSubview:v7->_ticksView];

    uint64_t v43 = objc_opt_new();
    gmtHandTip = v7->_gmtHandTip;
    v7->_gmtHandTip = (CALayer *)v43;

    [(CALayer *)v7->_gmtHandTip setActions:v39];
    -[CALayer setFrame:](v7->_gmtHandTip, "setFrame:", 0.0, 0.0, __src[26], __src[26]);
    [(CALayer *)v7->_gmtHandTip bounds];
    [(CALayer *)v7->_gmtHandTip setCornerRadius:v45 * 0.5];
    id v46 = [(NTKAlaskanGMTColorPalette *)v7->_palette gmtHandInlayColor];
    -[CALayer setBackgroundColor:](v7->_gmtHandTip, "setBackgroundColor:", [v46 CGColor]);

    id v47 = [(NTKAlaskanGMTColorPalette *)v7->_palette gmtHandColor];
    -[CALayer setBorderColor:](v7->_gmtHandTip, "setBorderColor:", [v47 CGColor]);

    double v48 = __src[27];
    [(CALayer *)v7->_gmtHandTip setBorderWidth:__src[27]];
    v49 = -[NTKAlaskanAnalogHand initWithFrame:]([NTKAlaskanAnalogHand alloc], "initWithFrame:", 0.0, 0.0, v48, 0.0);
    gmtHourHands = v7->_gmtHourHands;
    v7->_gmtHourHands = v49;

    v51 = [(NTKAlaskanAnalogHand *)v7->_gmtHourHands layer];
    objc_msgSend(v51, "setAnchorPoint:", 0.5, 0.0);

    v52 = [(NTKAlaskanGMTColorPalette *)v7->_palette gmtHandColor];
    [(NTKAlaskanAnalogHand *)v7->_gmtHourHands setBackgroundColor:v52];

    [(NTKAlaskanAnalogHand *)v7->_gmtHourHands setTipLayer:v7->_gmtHandTip];
    [(UIView *)v7->_containerView addSubview:v7->_gmtHourHands];
    uint64_t v53 = +[NSMutableArray arrayWithCapacity:50];
    magnifierFonts = v7->_magnifierFonts;
    v7->_magnifierFonts = (NSMutableArray *)v53;

    for (int i = 0; i != 50; ++i)
    {
      CLKInterpolateBetweenFloatsClipped();
      v56 = v7->_magnifierFonts;
      v57 = +[CLKFont compactSoftFontOfSize:weight:](CLKFont, "compactSoftFontOfSize:weight:");
      [(NSMutableArray *)v56 addObject:v57];
    }
    objc_destroyWeak(v61);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKAlaskanGMTStyleView;
  [(NTKAlaskanGMTStyleView *)&v2 dealloc];
}

- (id)layerDisabledActions
{
  objc_super v2 = +[NSNull null];
  v5[0] = @"contents";
  v5[1] = @"backgroundColor";
  v6[0] = v2;
  v6[1] = v2;
  v5[2] = @"transform";
  v5[3] = @"position";
  v6[2] = v2;
  v6[3] = v2;
  v5[4] = @"opacity";
  v5[5] = @"mask";
  v6[4] = v2;
  v6[5] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];

  return v3;
}

- (void)setPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  id v6 = [(NTKAlaskanGMTColorPalette *)self->_palette dayDialColor];
  -[CALayer setBackgroundColor:](self->_primaryBackgroundLayer, "setBackgroundColor:", [v6 CGColor]);

  id v7 = [(NTKAlaskanGMTColorPalette *)self->_palette nightDialColor];
  -[CALayer setBackgroundColor:](self->_secondaryBackgroundLayer, "setBackgroundColor:", [v7 CGColor]);

  bezelView = self->_bezelView;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_14B60;
  v36[3] = &unk_391B0;
  v36[4] = self;
  id v9 = v5;
  id v37 = v9;
  [(NTKAlaskanDialView *)bezelView enumerateMarkers:v36];
  dialView = self->_dialView;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_14BF4;
  v34[3] = &unk_391B0;
  v34[4] = self;
  id v11 = v9;
  id v35 = v11;
  [(NTKAlaskanDialView *)dialView enumerateMarkers:v34];
  gmtHourMarkersView = self->_gmtHourMarkersView;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_14C64;
  v32[3] = &unk_391B0;
  v32[4] = self;
  id v13 = v11;
  id v33 = v13;
  [(NTKAlaskanDialView *)gmtHourMarkersView enumerateMarkers:v32];
  magnifierGmtHourMarkersView = self->_magnifierGmtHourMarkersView;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_14CD4;
  v30[3] = &unk_391B0;
  v30[4] = self;
  id v15 = v13;
  id v31 = v15;
  [(NTKAlaskanDialView *)magnifierGmtHourMarkersView enumerateMarkers:v30];
  id v16 = [(NTKAlaskanGMTColorPalette *)self->_palette magnifierLensBorderColor];
  -[CALayer setBorderColor:](self->_magnifierLensBorder, "setBorderColor:", [v16 CGColor]);

  v17 = [(NTKAlaskanGMTColorPalette *)self->_palette monogramTextColor];
  [(UILabel *)self->_centerLabel setTextColor:v17];

  v18 = [(NTKAlaskanGMTColorPalette *)self->_palette gmtHandColor];
  [(NTKAlaskanAnalogHand *)self->_gmtHourHands setBackgroundColor:v18];

  id v19 = [(NTKAlaskanGMTColorPalette *)self->_palette gmtHandColor];
  -[CALayer setBorderColor:](self->_gmtHandTip, "setBorderColor:", [v19 CGColor]);

  id v20 = [(NTKAlaskanGMTColorPalette *)self->_palette gmtHandInlayColor];
  -[CALayer setBackgroundColor:](self->_gmtHandTip, "setBackgroundColor:", [v20 CGColor]);

  ticksView = self->_ticksView;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_14D44;
  v27 = &unk_391B0;
  v28 = self;
  id v29 = v15;
  id v22 = v15;
  [(NTKAlaskanDialView *)ticksView enumerateMarkers:&v24];
  v23 = objc_msgSend(v22, "outerMarkersColor", v24, v25, v26, v27, v28);
  [(UIImageView *)self->_heroMarker setTintColor:v23];
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
    id v6 = v5;
    id v7 = v8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v7 = [v8 CGColor];
    id v6 = v5;
  }
  [v6 setBackgroundColor:v7];
LABEL_10:
}

- (void)setDate:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToDate:self->_date] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, a3);
    [(NTKAlaskanGMTStyleView *)self updateGMTHourHands];
    [(NTKAlaskanGMTStyleView *)self updateMagnifierMask];
  }
}

- (void)setEditingAlpha:(double)a3
{
  -[NTKAlaskanAnalogHand setAlpha:](self->_gmtHourHands, "setAlpha:");
  centerLabel = self->_centerLabel;

  [(UILabel *)centerLabel setAlpha:a3];
}

- (void)selectHourOffset:(double)a3
{
}

- (void)selectHourOffset:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(NTKAlaskanGMTStyleView *)self setSelectedTimezoneLocation:0];
  [(NTKAlaskanGMTStyleView *)self setHourOffset:a3];
  [(NTKAlaskanGMTStyleView *)self updatePickerViewSelectionAnimated:v5];
  if (a3 < 0.0) {
    a3 = (double)(unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers] + a3;
  }
  id v9 = [(NTKAlaskanGMTStyleView *)self bezelView];
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  double v10 = (double)((unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers] - 1);
  if (a3 < v10) {
    double v10 = a3;
  }
  [v9 angleForIndex:v10];
  double v12 = v11;

  [(NTKAlaskanGMTStyleView *)self setAngleOffset:v5 animated:0 progressCallback:v8 completionBlock:360.0 - v12];
  [(NTKAlaskanGMTStyleView *)self updateSolarMaskWithTimezoneLocation:0];

  [(NTKAlaskanGMTStyleView *)self updateCenterLabelText];
}

- (void)setSelectedTimezoneLocation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTimezoneLocation, a3);

  [(NTKAlaskanGMTStyleView *)self updateCenterLabelText];
}

- (void)selectTimezoneLocation:(id)a3
{
}

- (void)selectTimezoneLocation:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [v9 hourOffset];
  [(NTKAlaskanGMTStyleView *)self selectHourOffset:v5 animated:v8 completionBlock:v10];

  [(NTKAlaskanGMTStyleView *)self setSelectedTimezoneLocation:v9];
  [(NTKAlaskanGMTStyleView *)self updatePickerViewSelectionAnimated:v5];
  selectedTimezoneLocation = self->_selectedTimezoneLocation;

  [(NTKAlaskanGMTStyleView *)self updateSolarMaskWithTimezoneLocation:selectedTimezoneLocation];
}

- (void)setAdditionalTimezoneLocations:(id)a3
{
  v4 = [a3 sortedArrayUsingComparator:&stru_391D0];
  id v21 = [v4 mutableCopy];

  BOOL v5 = [(NSArray *)self->_defaultLocations firstObject];
  [v5 hourOffset];
  float v7 = v6;

  id v8 = +[NSMutableArray array];
  if ([(NSArray *)self->_defaultLocations count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = (uint64_t)fminf(v7, 0.0);
    while (v10)
    {
      double v11 = [(NSArray *)self->_defaultLocations objectAtIndexedSubscript:v9];
      double v12 = 0;
      ++v9;
      if (v11) {
        goto LABEL_5;
      }
LABEL_6:
      id v13 = +[NSMutableIndexSet indexSet];
      if ([v21 count])
      {
        uint64_t v14 = 0;
        while (1)
        {
          id v15 = [v21 objectAtIndexedSubscript:v14];
          [v15 hourOffset];
          float v17 = v16;
          [(NTKAlaskanGMTTimezoneLocation *)v11 hourOffset];
          if (v17 >= (float)(v18 + 1.0)) {
            break;
          }
          [(NSArray *)v8 addObject:v15];
          [v13 addIndex:v14];

          if ((unint64_t)[v21 count] <= ++v14) {
            goto LABEL_14;
          }
        }
      }
LABEL_14:
      [v21 removeObjectsAtIndexes:v13];
      if (!v10 && !self->_selectedTimezoneLocation) {
        [(NTKAlaskanGMTStyleView *)self setSelectedTimezoneLocation:v12];
      }

      ++v10;
      if (v9 >= [(NSArray *)self->_defaultLocations count]) {
        goto LABEL_18;
      }
    }
    double v12 = [(NTKAlaskanGMTStyleView *)self noneLocation];
    [(NSArray *)v8 addObject:v12];
    double v11 = self->_referenceTimezoneLocation;
    if (!v11) {
      goto LABEL_6;
    }
LABEL_5:
    [(NSArray *)v8 addObject:v11];
    goto LABEL_6;
  }
LABEL_18:
  timezones = self->_timezones;
  self->_timezones = v8;

  [(NTKAlaskanGMTStyleView *)self updatePickerViewWithTimezones];
  [(NTKAlaskanGMTStyleView *)self updatePickerViewSelection];
  id v20 = [(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation];
  [(NTKAlaskanGMTStyleView *)self updateSolarMaskWithTimezoneLocation:v20];
}

- (NTKAlaskanGMTTimezoneLocation)noneLocation
{
  noneLocation = self->_noneLocation;
  if (!noneLocation)
  {
    v4 = objc_alloc_init(NTKAlaskanGMTTimezoneLocation);
    BOOL v5 = self->_noneLocation;
    self->_noneLocation = v4;

    [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation setHourOffset:0.0];
    [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation setSunriseHourOfDay:6.0];
    [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation setSunsetHourOfDay:18.0];
    float v6 = +[NTKSalmonFaceBundle localizedStringForKey:@"ALASKAN_GMT_NONE_SELECTED_CITY_LABEL" comment:@"None"];
    [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation setLocationName:v6];

    float v7 = [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation locationName];
    [(NTKAlaskanGMTTimezoneLocation *)self->_noneLocation setCityName:v7];

    noneLocation = self->_noneLocation;
  }

  return noneLocation;
}

- (void)updatePickerViewSelection
{
}

- (double)targetAngleOffsetForOffset:(double)a3
{
  [(NTKAlaskanDialView *)self->_bezelView searchForClosestMarkerAngleAtAngle:a3];
  return result;
}

- (void)setIsEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(void))a5;
  unint64_t v9 = v8;
  if (self->_isEditing == v6)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    self->_isEditing = v6;
    if (v6)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_157E8;
      v22[3] = &unk_38C00;
      v23 = v8;
      [(NTKAlaskanGMTStyleView *)self startEditingWithCompletionBlock:v22];
      uint64_t v10 = [(NTKAlaskanGMTStyleView *)self delegate];
      double v11 = [(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation];
      [v10 alaskanGMTStyleView:self didSelectTimezoneLocation:v11];

      double v12 = [(NTKAlaskanGMTStyleView *)self delegate];
      [v12 alaskanGMTStyleViewDidStartEditing:self];

      selectedPickerViewTimezoneLocation = v23;
    }
    else
    {
      if (self->_doneButtonTapped)
      {
        self->_doneButtonTapped = 0;
        [(NTKAlaskanGMTStyleView *)self stopEditing];
        uint64_t v14 = [(NTKAlaskanGMTStyleView *)self delegate];
        [v14 alaskanGMTStyleViewDidFinishEditing:self];
      }
      else
      {
        float v17 = _NSConcreteStackBlock;
        uint64_t v18 = 3221225472;
        id v19 = sub_15800;
        id v20 = &unk_38C00;
        id v21 = v8;
        [(NTKAlaskanGMTStyleView *)self stopEditingAnimated:v5 completionBlock:&v17];
        id v15 = [(NTKAlaskanGMTStyleView *)self delegate];
        [v15 alaskanGMTStyleViewDidCancelEditing:self animated:v5];

        float v16 = [(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation];
        [(NTKAlaskanGMTStyleView *)self selectTimezoneLocation:v16 animated:0 completionBlock:0];
      }
      selectedPickerViewTimezoneLocation = self->_selectedPickerViewTimezoneLocation;
      self->_selectedPickerViewTimezoneLocation = 0;
    }

    [(NTKAlaskanGMTStyleView *)self updateGMTHourHands];
  }
}

- (void)_setAngleOffset:(double)a3
{
  if (self->_angleOffset != a3)
  {
    self->_angleOffset = a3;
    BOOL v5 = [(NTKAlaskanGMTStyleView *)self bezelView];
    [v5 setAngleOffset:a3];

    [(NTKAlaskanDialView *)self->_gmtHourMarkersView setAngleOffset:a3];
    [(NTKAlaskanDialView *)self->_magnifierGmtHourMarkersView setAngleOffset:a3];
    CLKDegreesToRadians();
    CGAffineTransformMakeRotation(&v9, v6);
    float v7 = [(NTKAlaskanGMTStyleView *)self secondaryBackgroundLayer];
    CGAffineTransform v8 = v9;
    [v7 setAffineTransform:&v8];

    [(NTKAlaskanGMTStyleView *)self updateMagnifierMask];
  }
}

- (void)updateMagnifierMask
{
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  v3 = [(NTKAlaskanGMTStyleView *)self device];
  sub_141EC(v3, v28);

  [(NTKAlaskanGMTStyleView *)self bounds];
  CLKRectGetCenter();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [(NTKAlaskanDialView *)self->_magnifierGmtHourMarkersView contentDiameter];
  double v9 = v8 * 0.5;
  uint64_t v10 = [(NTKAlaskanGMTStyleView *)self date];
  [(NTKAlaskanGMTStyleView *)self magnifierAnglePositionForDate:v10];
  double v12 = v11;

  [(NTKAlaskanGMTStyleView *)self centerPointForAngle:(uint64_t)v9 radius:v12];
  CGAffineTransformMakeTranslation(&v27, v5, v7);
  id v13 = [(NTKAlaskanGMTStyleView *)self device];
  CLKPixelAlignRectForDevice();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  id v22 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v15, v17, v19, v21);
  v23 = +[CAShapeLayer layer];
  id v24 = v22;
  objc_msgSend(v23, "setPath:", objc_msgSend(v24, "CGPath"));
  uint64_t v25 = [(NTKAlaskanDialView *)self->_magnifierGmtHourMarkersView layer];
  [v25 setMask:v23];

  v26 = [(NTKAlaskanGMTColorPalette *)self->_palette magnifierLensBackgroundColor];
  [(NTKAlaskanDialView *)self->_magnifierGmtHourMarkersView setBackgroundColor:v26];

  -[CALayer setFrame:](self->_magnifierLensBorder, "setFrame:", v15, v17, v19, v21);
  [(NTKAlaskanGMTStyleView *)self applyHourMarkersScaleTransform];
}

- (void)applyHourMarkersScaleTransform
{
  if (([(NTKAlaskanDialView *)self->_gmtHourMarkersView disableLayout] & 1) == 0)
  {
    [(NTKAlaskanDialView *)self->_gmtHourMarkersView layoutMarkers];
    [(NTKAlaskanGMTStyleView *)self bounds];
    CLKRectGetCenter();
    double v4 = v3;
    double v6 = v5;
    [(CALayer *)self->_magnifierLensBorder position];
    atan2(v7 - v4, v8 - v6);
    CLKRadiansToDegrees();
    gmtHourMarkersView = self->_gmtHourMarkersView;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_15C10;
    v11[3] = &unk_391F8;
    *(double *)&v11[5] = v4;
    *(double *)&v11[6] = v6;
    v11[7] = v10;
    v11[4] = self;
    [(NTKAlaskanDialView *)gmtHourMarkersView enumerateMarkers:v11];
  }
}

- (int64_t)hourForDate:(id)a3
{
  id v3 = a3;
  double v4 = +[NSCalendar currentCalendar];
  double v5 = [v4 components:32 fromDate:v3];

  id v6 = [v5 hour];
  return (int64_t)v6;
}

- (double)magnifierAnglePositionForDate:(id)a3
{
  id v4 = a3;
  double v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 components:96 fromDate:v4];

  unint64_t v7 = (unint64_t)[v6 hour];
  double v8 = 360.0 / (double)(unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers];
  double v9 = v8 * (double)(v7 % (unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers])
     + -270.0;

  return v9;
}

- (CGPoint)centerPointForAngle:(double)a3 radius:(int64_t)a4
{
  CLKDegreesToRadians();
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeRotation(&v8, v5);
  float64x2_t v6 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_f64(*(float64x2_t *)&v8.c, (float64x2_t)0), *(float64x2_t *)&v8.a, (double)-a4));
  double v7 = v6.f64[1];
  result.double x = v6.f64[0];
  result.double y = v7;
  return result;
}

- (void)updateGMTHourHands
{
  id v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 components:96 fromDate:self->_date];
  [v4 hour];
  [v4 minute];
  [(NTKAlaskanDialView *)self->_bezelView numberOfMarkers];
  [(NTKAlaskanDialView *)self->_bezelView numberOfMarkers];
  CLKDegreesToRadians();
  CGAffineTransformMakeRotation(&v8, v5);
  gmtHourHands = self->_gmtHourHands;
  CGAffineTransform v7 = v8;
  [(NTKAlaskanAnalogHand *)gmtHourHands setTransform:&v7];
  [(NTKAlaskanGMTStyleView *)self updateBezelMarkerForCurrentDate];
}

- (void)updateBezelMarkerForCurrentDate
{
  id v16 = [(NSDate *)self->_date dateByAddingTimeInterval:self->_hourOffset * 3600.0];
  id v3 = -[NTKAlaskanGMTStyleView hourForDate:](self, "hourForDate:");
  currentHighlightedHour = self->_currentHighlightedHour;
  if (currentHighlightedHour)
  {
    if ((void *)[(NSNumber *)currentHighlightedHour integerValue] == v3) {
      goto LABEL_9;
    }
    if (self->_currentHighlightedHour)
    {
      CGFloat v5 = [(NTKAlaskanGMTStyleView *)self bezelView];
      float64x2_t v6 = +[NSMutableIndexSet indexSet];
      [v5 setMarkersToRotateIndexSet:v6];

      NSInteger v7 = [(NSNumber *)self->_currentHighlightedHour integerValue];
      CGAffineTransform v8 = [(NTKAlaskanGMTStyleView *)self bezelView];
      if (v7) {
        [(NTKAlaskanGMTStyleView *)self createTickMarkerForBezelView];
      }
      else {
      double v9 = [(NTKAlaskanGMTStyleView *)self heroMarker];
      }
      objc_msgSend(v8, "replaceMarker:atIndex:", v9, -[NSNumber integerValue](self->_currentHighlightedHour, "integerValue"));
    }
  }
  uint64_t v10 = +[NSNumber numberWithInteger:v3];
  double v11 = self->_currentHighlightedHour;
  self->_currentHighlightedHour = v10;

  double v12 = [(NTKAlaskanGMTStyleView *)self createHourMarkerForBezelView:v3];
  id v13 = [(NTKAlaskanGMTStyleView *)self bezelView];
  double v14 = +[NSMutableIndexSet indexSetWithIndex:v3];
  [v13 setMarkersToRotateIndexSet:v14];

  double v15 = [(NTKAlaskanGMTStyleView *)self bezelView];
  [v15 replaceMarker:v12 atIndex:v3];

LABEL_9:
}

- (id)createHourMarkerForBezelView:(unint64_t)a3
{
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
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
  CGFloat v5 = [(NTKAlaskanGMTStyleView *)self device];
  sub_141EC(v5, &v14);

  id v6 = objc_alloc_init((Class)UILabel);
  NSInteger v7 = +[CLKFont compactSoftFontOfSize:*((double *)&v15 + 1) weight:UIFontWeightSemibold];
  [v6 setFont:v7];

  CGAffineTransform v8 = [(NTKAlaskanGMTStyleView *)self _formattedTextForHour:a3];
  [v6 setText:v8];

  double v9 = [(NTKAlaskanGMTStyleView *)self layerDisabledActions];
  uint64_t v10 = [v6 layer];
  [v10 setActions:v9];

  double v11 = [(NTKAlaskanGMTStyleView *)self palette];
  double v12 = [v11 gmtCurrentHourLabelColor];
  [v6 setTextColor:v12];

  [v6 sizeToFit];

  return v6;
}

- (id)createTickMarkerForBezelView
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  id v3 = [(NTKAlaskanGMTStyleView *)self device];
  sub_141EC(v3, &v10);

  id v4 = +[CALayer layer];
  CGFloat v5 = [(NTKAlaskanGMTStyleView *)self layerDisabledActions];
  [v4 setActions:v5];

  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v11);
  id v6 = [(NTKAlaskanGMTStyleView *)self palette];
  id v7 = [v6 outerMarkersColor];
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  [v4 bounds];
  CGAffineTransform v8 = [(NTKAlaskanGMTStyleView *)self device];
  CLKRoundForDevice();
  objc_msgSend(v4, "setCornerRadius:");

  return v4;
}

- (UIImageView)heroMarker
{
  heroMarker = self->_heroMarker;
  if (!heroMarker)
  {
    id v4 = +[NTKAlaskanFaceBundle imageWithName:@"gmt-arrow"];
    CGFloat v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
    id v6 = self->_heroMarker;
    self->_heroMarker = v5;

    heroMarker = self->_heroMarker;
  }

  return heroMarker;
}

- (id)_formattedTextForHour:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (self->_is24HourMode)
  {
    if (!a3) {
      a3 = 24;
    }
  }
  else
  {
    a3 = 12;
    if (v3)
    {
      BOOL v4 = v3 == 12;
      unint64_t v5 = v3 % 0xC;
      if (!v4) {
        a3 = v5;
      }
    }
  }
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = +[NSString localizedStringWithFormat:@"%@", v6];

  return v7;
}

- (void)updateCenterLabelText
{
  [(NTKAlaskanGMTStyleView *)self hourOffset];
  if (v3 == 0.0
    && ([(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [v4 cityIdentifier],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    CGAffineTransform v8 = [(NTKAlaskanGMTStyleView *)self centerLabel];
    [v8 setText:0];
  }
  else
  {
    id v6 = [(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation];
    id v7 = [v6 cityIdentifier];

    if (v7)
    {
      CGAffineTransform v8 = [(NTKAlaskanGMTStyleView *)self selectedTimezoneLocation];
      [v8 locationName];
    }
    else
    {
      CGAffineTransform v8 = +[NTKSalmonFaceBundle localizedStringForKey:@"ALASKAN_GMT_HOUR_OFFSET_MONOGRAM_LABEL" comment:@"%+ld HRS"];
      [(NTKAlaskanGMTStyleView *)self hourOffset];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, (uint64_t)v9);
    long long v10 = };
    long long v11 = [(NTKAlaskanGMTStyleView *)self centerLabel];
    [v11 setText:v10];
  }

  [(NTKAlaskanGMTStyleView *)self updateCenterLabelFrame];
}

- (void)startEditing
{
}

- (void)updateUIForCurrentState
{
}

- (void)stopEditing
{
}

- (id)attributedStringWithPrefix:(id)a3 image:(id)a4 suffix:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v9];

  id v11 = objc_alloc_init((Class)NSTextAttachment);
  [v11 setImage:v8];

  long long v12 = +[NSAttributedString attributedStringWithAttachment:v11];
  [v10 appendAttributedString:v12];

  id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v7];
  [v10 appendAttributedString:v13];

  long long v14 = +[UIColor whiteColor];
  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, objc_msgSend(v10, "length"));

  return v10;
}

- (UIImage)locationIcon
{
  locationIcon = self->_locationIcon;
  if (!locationIcon)
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
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
    long long v12 = 0u;
    BOOL v4 = [(NTKAlaskanGMTStyleView *)self device];
    sub_141EC(v4, &v11);

    unint64_t v5 = +[CLKFont compactSoftFontOfSize:*((double *)&v12 + 1) weight:UIFontWeightSemibold];
    id v6 = +[UIImageSymbolConfiguration configurationWithFont:v5];

    id v7 = +[UIImage systemImageNamed:@"location.fill" withConfiguration:v6];
    id v8 = [v7 imageWithRenderingMode:2];
    id v9 = self->_locationIcon;
    self->_locationIcon = v8;

    locationIcon = self->_locationIcon;
  }

  return locationIcon;
}

- (UILabel)centerLabel
{
  centerLabel = self->_centerLabel;
  if (!centerLabel)
  {
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    BOOL v4 = [(NTKAlaskanGMTStyleView *)self device];
    sub_141EC(v4, &v10);

    unint64_t v5 = +[CLKUIColoringLabel labelWithOptions:0];
    id v6 = self->_centerLabel;
    self->_centerLabel = v5;

    id v7 = +[CLKFont compactSoftFontOfSize:*(double *)&v11 weight:UIFontWeightBold];
    [(UILabel *)self->_centerLabel setFont:v7];

    id v8 = [(NTKAlaskanGMTColorPalette *)self->_palette monogramTextColor];
    [(UILabel *)self->_centerLabel setTextColor:v8];

    [(UILabel *)self->_centerLabel setTextAlignment:1];
    [(UILabel *)self->_centerLabel setNumberOfLines:1];
    [(NTKAlaskanGMTStyleView *)self addSubview:self->_centerLabel];
    centerLabel = self->_centerLabel;
  }

  return centerLabel;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAlaskanGMTStyleView;
  id v4 = a3;
  [(NTKAlaskanGMTStyleView *)&v8 traitCollectionDidChange:v4];
  unint64_t v5 = [(NTKAlaskanGMTStyleView *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    [(NTKAlaskanDialView *)self->_dialView reloadMarkers];
    [(NTKAlaskanDialView *)self->_bezelView reloadMarkers];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAlaskanGMTStyleView;
  [(NTKAlaskanGMTStyleView *)&v8 layoutSubviews];
  uint64_t v7 = 0;
  long long v6 = 0u;
  -[NTKAlaskanGMTStyleView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  double v3 = 0);
  sub_141EC(v3, &v5);

  double v4 = *(double *)&v6;
  -[UIView setBounds:](self->_containerView, "setBounds:", 0.0, 0.0, *(double *)&v6, *(double *)&v6);
  [(NTKAlaskanGMTStyleView *)self bounds];
  CLKRectGetCenter();
  -[UIView setCenter:](self->_containerView, "setCenter:");
  -[CALayer setBounds:](self->_primaryBackgroundLayer, "setBounds:", 0.0, 0.0, v4, v4);
  CLKRectGetCenter();
  -[CALayer setPosition:](self->_primaryBackgroundLayer, "setPosition:");
  -[CALayer setBounds:](self->_secondaryBackgroundLayer, "setBounds:", 0.0, 0.0, v4, v4);
  CLKRectGetCenter();
  -[CALayer setPosition:](self->_secondaryBackgroundLayer, "setPosition:");
  -[NTKAlaskanDialView setFrame:](self->_bezelView, "setFrame:", 0.0, 0.0, v4, v4);
  -[NTKAlaskanDialView setFrame:](self->_gmtHourMarkersView, "setFrame:", 0.0, 0.0, v4, v4);
  [(NTKAlaskanGMTStyleView *)self bounds];
  -[NTKAlaskanDialView setFrame:](self->_magnifierGmtHourMarkersView, "setFrame:");
  [(NTKAlaskanGMTStyleView *)self bounds];
  CLKRectGetCenter();
  -[NTKAlaskanDialView setCenter:](self->_magnifierGmtHourMarkersView, "setCenter:");
  [(NTKAlaskanGMTStyleView *)self _updateDialViewsFrame];
  [(NTKAlaskanGMTStyleView *)self updateMagnifierMask];
  [(NTKAlaskanGMTStyleView *)self updateCenterLabelFrame];
}

- (void)_updateDialViewsFrame
{
}

- (void)_updateDialViewsFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)ddouble x = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  long long v5 = [(NTKAlaskanGMTStyleView *)self device];
  sub_141EC(v5, &v11);

  double v6 = 3.0;
  if (!self->_isEditing) {
    double v6 = 2.0;
  }
  double v7 = *(double *)&v11 * v6;
  [(UIView *)self->_containerView bounds];
  double v8 = CGRectGetWidth(v32) - v7;
  -[NTKAlaskanDialView setFrame:](self->_dialView, "setFrame:", 0.0, 0.0, v8, v8);
  [(UIView *)self->_containerView bounds];
  CLKRectGetCenter();
  -[NTKAlaskanDialView setPosition:](self->_dialView, "setPosition:");
  +[CATransaction begin];
  +[CATransaction setDisableActions:v3 ^ 1];
  [(NTKAlaskanDialView *)self->_dialView frame];
  -[CALayer setFrame:](self->_centerCircleBackgroundLayer, "setFrame:");
  +[CATransaction commit];
  [(NTKAlaskanDialView *)self->_dialView frame];
  CGRect v34 = CGRectInset(v33, dx[1], dx[1]);
  -[NTKAlaskanDialView setFrame:](self->_ticksView, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  [(NTKAlaskanDialView *)self->_bezelView frame];
  [(CALayer *)self->_centerCircleBackgroundLayer frame];
  id v9 = [(NTKAlaskanGMTStyleView *)self device];
  CLKRoundForDevice();
  -[NTKAlaskanDialView setContentInset:](self->_bezelView, "setContentInset:");

  [(NTKAlaskanDialView *)self->_gmtHourMarkersView frame];
  [(CALayer *)self->_centerCircleBackgroundLayer frame];
  long long v10 = [(NTKAlaskanGMTStyleView *)self device];
  CLKRoundForDevice();
  -[NTKAlaskanDialView setContentInset:](self->_gmtHourMarkersView, "setContentInset:");

  [(NTKAlaskanGMTStyleView *)self setDiameter:v3 animated:v8];
}

- (void)updateCenterLabelFrame
{
  [(CALayer *)self->_centerCircleBackgroundLayer bounds];
  double v4 = v3 * 0.6;
  centerLabel = self->_centerLabel;
  [(NTKAlaskanGMTStyleView *)self bounds];
  -[UILabel sizeThatFits:](centerLabel, "sizeThatFits:", v4, v6);
  -[UILabel setFrame:](self->_centerLabel, "setFrame:", 0.0, 0.0, v7, v8);
  [(NTKAlaskanGMTStyleView *)self bounds];
  double MidX = CGRectGetMidX(v16);
  dialView = self->_dialView;
  [(NTKAlaskanDialView *)dialView positionForMarkerAtIndex:2];
  -[NTKAlaskanDialView convertPoint:toView:](dialView, "convertPoint:toView:", self);
  [(UILabel *)self->_centerLabel setCenter:MidX];
  [(UILabel *)self->_centerLabel frame];
  id v14 = [(NTKAlaskanGMTStyleView *)self device];
  CLKRoundForDevice();
  double v12 = v11;
  long long v13 = [(UILabel *)self->_centerLabel layer];
  [v13 setCornerRadius:v12];
}

- (CGRect)pickerViewFrame
{
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  double v3 = [(NTKAlaskanGMTStyleView *)self device];
  sub_141EC(v3, v14);

  if (self->_isEditing)
  {
    [(UIView *)self->_containerView bounds];
    double v5 = v4 + *(double *)v14 * -3.0;
  }
  else
  {
    [(CALayer *)self->_centerCircleBackgroundLayer bounds];
    double v5 = v6;
  }
  [(UIView *)self->_containerView bounds];
  double v8 = (v7 - v5) * 0.5;
  [(UIView *)self->_containerView bounds];
  double v10 = (v9 - v5) * 0.5;
  double v11 = v8;
  double v12 = v5;
  double v13 = v5;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v11;
  return result;
}

- (double)pickerViewCornerRadius
{
  [(NTKAlaskanGMTStyleView *)self pickerViewFrame];
  double v3 = [(NTKAlaskanGMTStyleView *)self device];
  CLKRoundForDevice();
  double v5 = v4;

  return v5;
}

- (void)setDiameter:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_diameter = a3;
    +[CATransaction begin];
    +[CATransaction setDisableActions:!v4];
    [(CALayer *)self->_centerCircleBackgroundLayer bounds];
    double v7 = [(NTKAlaskanGMTStyleView *)self device];
    CLKRoundForDevice();
    -[CALayer setCornerRadius:](self->_centerCircleBackgroundLayer, "setCornerRadius:");

    +[CATransaction commit];
    [(CALayer *)self->_primaryBackgroundLayer bounds];
    double v8 = [(NTKAlaskanGMTStyleView *)self device];
    CLKRoundForDevice();
    -[CALayer setCornerRadius:](self->_primaryBackgroundLayer, "setCornerRadius:");

    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    -[NTKAlaskanGMTStyleView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
    double v9 = 0);
    sub_141EC(v9, &v17);

    [(NTKAlaskanAnalogHand *)self->_gmtHourHands bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(UIView *)self->_containerView bounds];
    -[NTKAlaskanAnalogHand setBounds:](self->_gmtHourHands, "setBounds:", v11, v13, v15, v16 * 0.5 - *(double *)&v18);
    [(UIView *)self->_containerView bounds];
    CLKRectGetCenter();
    -[NTKAlaskanAnalogHand setCenter:](self->_gmtHourHands, "setCenter:");
  }
}

- (void)updateSolarMaskWithTimezoneLocation:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    [v4 sunriseHourOfDay];
    -[NTKAlaskanGMTStyleView angleForHour:](self, "angleForHour:");
    double v6 = v5;
    [v14 sunsetHourOfDay];
  }
  else
  {
    [(NTKAlaskanGMTStyleView *)self angleForHour:6.0];
    double v6 = v8;
    double v7 = 18.0;
  }
  [(NTKAlaskanGMTStyleView *)self angleForHour:v7];
  double v10 = v9;
  [v14 sunriseHourOfDay];
  double v12 = v11;
  [v14 sunsetHourOfDay];
  [(NTKAlaskanGMTStyleView *)self updateSolarMaskWithSunriseAngle:v12 > v13 sunsetAngle:v6 clockwise:v10];
}

- (void)updateSolarMaskWithSunriseAngle:(double)a3 sunsetAngle:(double)a4 clockwise:(BOOL)a5
{
  BOOL v5 = a5;
  [(NTKAlaskanGMTStyleView *)self layoutIfNeeded];
  [(UIView *)self->_containerView bounds];
  CLKRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  double v11 = +[UIBezierPath bezierPath];
  objc_msgSend(v11, "moveToPoint:", v8, v10);
  [(UIView *)self->_containerView bounds];
  CGFloat v12 = CGRectGetHeight(v19) * 0.5;
  CLKDegreesToRadians();
  double v14 = v13;
  CLKDegreesToRadians();
  objc_msgSend(v11, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v5, v8, v10, v12, v14, v15);
  [v11 closePath];
  double v16 = +[CAShapeLayer layer];
  id v17 = v11;
  objc_msgSend(v16, "setPath:", objc_msgSend(v17, "CGPath"));
  [(CALayer *)self->_secondaryBackgroundLayer setMask:v16];
}

- (double)angleForHour:(double)a3
{
  double v3 = a3;
  if (a3 < 0.0) {
    double v3 = (float)(unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers] + a3;
  }
  BOOL v5 = [(NTKAlaskanGMTStyleView *)self bezelView];
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  double v6 = (float)((unint64_t)[(NTKAlaskanDialView *)self->_bezelView numberOfMarkers] - 1);
  if (v3 < v6) {
    double v6 = v3;
  }
  [v5 angleForIndex:v6];

  NTKNormalizeAngle();
  return result;
}

- (NTKAlaskanGMTStyleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKAlaskanGMTStyleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)angleOffset
{
  return self->_angleOffset;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (NTKAlaskanGMTColorPalette)palette
{
  return self->_palette;
}

- (NTKAlaskanGMTTimezoneLocation)referenceTimezoneLocation
{
  return self->_referenceTimezoneLocation;
}

- (void)setReferenceTimezoneLocation:(id)a3
{
}

- (NSArray)defaultLocations
{
  return self->_defaultLocations;
}

- (void)setDefaultLocations:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKAlaskanDialView)bezelView
{
  return self->_bezelView;
}

- (void)setBezelView:(id)a3
{
}

- (NTKAlaskanDialView)ticksView
{
  return self->_ticksView;
}

- (void)setTicksView:(id)a3
{
}

- (NTKAlaskanDialView)dialView
{
  return self->_dialView;
}

- (void)setDialView:(id)a3
{
}

- (NTKAlaskanDialView)gmtHourMarkersView
{
  return self->_gmtHourMarkersView;
}

- (void)setGmtHourMarkersView:(id)a3
{
}

- (NTKAlaskanDialView)magnifierGmtHourMarkersView
{
  return self->_magnifierGmtHourMarkersView;
}

- (void)setMagnifierGmtHourMarkersView:(id)a3
{
}

- (void)setCenterLabel:(id)a3
{
}

- (CALayer)magnifierLensBorder
{
  return self->_magnifierLensBorder;
}

- (void)setMagnifierLensBorder:(id)a3
{
}

- (void)setNoneLocation:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NTKAlaskanAnalogHand)gmtHourHands
{
  return self->_gmtHourHands;
}

- (void)setGmtHourHands:(id)a3
{
}

- (BOOL)is24HourMode
{
  return self->_is24HourMode;
}

- (void)setIs24HourMode:(BOOL)a3
{
  self->_is24HourMode = a3;
}

- (CALayer)primaryBackgroundLayer
{
  return self->_primaryBackgroundLayer;
}

- (void)setPrimaryBackgroundLayer:(id)a3
{
}

- (CALayer)secondaryBackgroundLayer
{
  return self->_secondaryBackgroundLayer;
}

- (void)setSecondaryBackgroundLayer:(id)a3
{
}

- (CALayer)centerCircleBackgroundLayer
{
  return self->_centerCircleBackgroundLayer;
}

- (void)setCenterCircleBackgroundLayer:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (CALayer)gmtHandTip
{
  return self->_gmtHandTip;
}

- (void)setGmtHandTip:(id)a3
{
}

- (double)hourOffset
{
  return self->_hourOffset;
}

- (void)setHourOffset:(double)a3
{
  self->_hourOffset = a3;
}

- (NTKAlaskanGMTTimezoneLocation)selectedTimezoneLocation
{
  return self->_selectedTimezoneLocation;
}

- (NTKAlaskanGMTTimezoneLocation)selectedPickerViewTimezoneLocation
{
  return self->_selectedPickerViewTimezoneLocation;
}

- (void)setSelectedPickerViewTimezoneLocation:(id)a3
{
}

- (NSArray)timezones
{
  return self->_timezones;
}

- (void)setTimezones:(id)a3
{
}

- (BOOL)doneButtonTapped
{
  return self->_doneButtonTapped;
}

- (void)setDoneButtonTapped:(BOOL)a3
{
  self->_doneButtonTapped = a3;
}

- (NSNumber)currentHighlightedHour
{
  return self->_currentHighlightedHour;
}

- (void)setCurrentHighlightedHour:(id)a3
{
}

- (NSMutableDictionary)pickerViewItemIndexByCityIdentifier
{
  return self->_pickerViewItemIndexByCityIdentifier;
}

- (void)setPickerViewItemIndexByCityIdentifier:(id)a3
{
}

- (NSMutableDictionary)pickerViewItemIndexByHour
{
  return self->_pickerViewItemIndexByHour;
}

- (void)setPickerViewItemIndexByHour:(id)a3
{
}

- (void)setLocationIcon:(id)a3
{
}

- (void)setHeroMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroMarker, 0);
  objc_storeStrong((id *)&self->_locationIcon, 0);
  objc_storeStrong((id *)&self->_pickerViewItemIndexByHour, 0);
  objc_storeStrong((id *)&self->_pickerViewItemIndexByCityIdentifier, 0);
  objc_storeStrong((id *)&self->_currentHighlightedHour, 0);
  objc_storeStrong((id *)&self->_timezones, 0);
  objc_storeStrong((id *)&self->_selectedPickerViewTimezoneLocation, 0);
  objc_storeStrong((id *)&self->_selectedTimezoneLocation, 0);
  objc_storeStrong((id *)&self->_gmtHandTip, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_centerCircleBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_secondaryBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_primaryBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_gmtHourHands, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_noneLocation, 0);
  objc_storeStrong((id *)&self->_magnifierLensBorder, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_magnifierGmtHourMarkersView, 0);
  objc_storeStrong((id *)&self->_gmtHourMarkersView, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_bezelView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_defaultLocations, 0);
  objc_storeStrong((id *)&self->_referenceTimezoneLocation, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_magnifierFonts, 0);
}

@end