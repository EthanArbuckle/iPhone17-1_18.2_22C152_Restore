@interface NTKSeltzerDialView
- (CGPoint)_keystoneDateLabelCenter;
- (CGPoint)_keystoneMoonPhaseImageViewCenter;
- (NTKSeltzerDialView)initWithFrame:(CGRect)a3 device:(id)a4 calendar:(unint64_t)a5 palette:(id)a6;
- (double)angleOffset;
- (id)_animationFromPath:(id)a3 toPath:(id)a4;
- (id)_calendarIdentifierForCalendar:(unint64_t)a3;
- (id)_createDateLabel;
- (id)_currentDate;
- (id)_dateForDayOffset:(int64_t)a3;
- (id)_dateForIndex:(unint64_t)a3;
- (id)_dateLabelFont;
- (id)_keystoneAXDateLabel;
- (id)_keystoneAXMoonPhaseImageLabel;
- (id)_keystoneDateLabelText;
- (id)_keystoneMoonPhaseImage;
- (id)_lunarCalendar;
- (id)_lunarDateLabelTextForDate:(id)a3;
- (id)_lunarStringWithDate:(id)a3;
- (id)_monospacedDateLabelFont;
- (id)_moonPhaseImageForDate:(id)a3;
- (id)_moonPhaseImageForDate:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5;
- (id)_overlayCalendar;
- (int64_t)_dayOffset;
- (int64_t)_keystoneIndex;
- (unint64_t)_timeTravelIndexForFuture:(BOOL)a3;
- (unint64_t)calendar;
- (void)_addDialOutlineWithPath:(id)a3;
- (void)_animateDateCardFromPath:(id)a3 toPath:(id)a4;
- (void)_animateKeystoneFromPath:(id)a3 toPath:(id)a4;
- (void)_applyRTLCorrectionIfNeeded:(int64_t *)a3;
- (void)_drawDateCardOutline;
- (void)_drawDialMaskOutline;
- (void)_drawDialOutlines;
- (void)_drawKeystoneOutline;
- (void)_drawOutlines;
- (void)_layoutCurvedLabel:(id)a3;
- (void)_loadContainerViews;
- (void)_loadDateLabels;
- (void)_loadKeystone;
- (void)_loadLunarCalendarDial;
- (void)_loadMoonPhaseDial;
- (void)_loadMoonPhaseSeparatorDial;
- (void)_updateDateLabels;
- (void)_updateDialOffset:(double)a3;
- (void)_updateDialOffset:(double)a3 skipTimeTravel:(BOOL)a4;
- (void)_updateGregorianLabelWithDate:(id)a3;
- (void)_updateKeystone;
- (void)_updateLunarCalendarUI;
- (void)_updateLunarLabelWithDate:(id)a3;
- (void)applyInteractiveModeProgress:(double)a3;
- (void)applyTransitionFraction:(double)a3 fromCalendar:(unint64_t)a4 toCalendar:(unint64_t)a5;
- (void)enterInteractiveModeAnimated:(BOOL)a3;
- (void)exitInteractiveModeAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCalendar:(unint64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAngleOffset:(double)a3 animated:(BOOL)a4;
- (void)updateDialUI;
@end

@implementation NTKSeltzerDialView

- (NTKSeltzerDialView)initWithFrame:(CGRect)a3 device:(id)a4 calendar:(unint64_t)a5 palette:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)NTKSeltzerDialView;
  v16 = -[NTKSeltzerDialView initWithFrame:](&v28, "initWithFrame:", x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_device, a4);
    v17->_calendar = a5;
    objc_storeStrong((id *)&v17->_palette, a6);
    v18 = +[NTKLocationManager sharedLocationManager];
    v19 = [v18 anyLocation];
    [v19 coordinate];
    v17->_currentCoordinate.latitude = v20;
    v17->_currentCoordinate.longitude = v21;

    v22 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    gregorianDateFormatter = v17->_gregorianDateFormatter;
    v17->_gregorianDateFormatter = v22;

    [(NSDateFormatter *)v17->_gregorianDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d, yyyy"];
    v24 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    lunarDateFormatter = v17->_lunarDateFormatter;
    v17->_lunarDateFormatter = v24;

    [(NSDateFormatter *)v17->_lunarDateFormatter setLocalizedDateFormatFromTemplate:@"MMMM, d"];
    v26 = [(NTKSeltzerDialView *)v17 _lunarCalendar];
    [(NSDateFormatter *)v17->_lunarDateFormatter setCalendar:v26];

    [(NTKSeltzerDialView *)v17 _loadContainerViews];
    [(NTKSeltzerDialView *)v17 _loadLunarCalendarDial];
    [(NTKSeltzerDialView *)v17 _loadMoonPhaseDial];
    [(NTKSeltzerDialView *)v17 _loadMoonPhaseSeparatorDial];
    [(NTKSeltzerDialView *)v17 _loadDateLabels];
    [(NTKSeltzerDialView *)v17 _drawOutlines];
    [(NTKSeltzerDialView *)v17 updateDialUI];
    [(NTKSeltzerDialView *)v17 layoutIfNeeded];
    [(NTKSeltzerDialView *)v17 _loadKeystone];
  }

  return v17;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSeltzerDialView;
  [(NTKSeltzerDialView *)&v5 layoutSubviews];
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  sub_63B0(self->_device, (uint64_t)v3);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  CLKRectCenteredAboutPointForDevice();
  -[NTKDialView setFrame:](self->_calendarDialView, "setFrame:");
  CLKRectCenteredAboutPointForDevice();
  -[NTKDialView setFrame:](self->_moonPhaseDialView, "setFrame:");
  [(NTKDialView *)self->_moonPhaseDialView frame];
  -[NTKDialView setFrame:](self->_moonPhaseSeparatorDialView, "setFrame:");
  if (self->_keystoneDateLabel)
  {
    if (self->_keystoneMoonPhaseImageView)
    {
      [(NTKSeltzerDialView *)self _keystoneDateLabelCenter];
      -[UILabel setCenter:](self->_keystoneDateLabel, "setCenter:");
      [(NTKSeltzerDialView *)self _keystoneMoonPhaseImageViewCenter];
      -[UIImageView setCenter:](self->_keystoneMoonPhaseImageView, "setCenter:");
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKSeltzerDialView;
  id v4 = a3;
  [(NTKSeltzerDialView *)&v12 traitCollectionDidChange:v4];
  objc_super v5 = [(NTKSeltzerDialView *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    dateLabelFont = self->_dateLabelFont;
    self->_dateLabelFont = 0;

    monospacedDateLabelFont = self->_monospacedDateLabelFont;
    self->_monospacedDateLabelFont = 0;

    [(NTKDialView *)self->_calendarDialView reloadMarkers];
    v10 = [(NTKSeltzerDialView *)self _dateLabelFont];
    v11 = [(NTKSeltzerDialView *)self _monospacedDateLabelFont];
    [(UILabel *)self->_keystoneDateLabel setFont:v10];
    [(CLKUICurvedColoringLabel *)self->_gregorianDateLabel setFont:v11];
    [(CLKUICurvedColoringLabel *)self->_lunarDateLabel setFont:v11];
    [(UILabel *)self->_keystoneDateLabel sizeToFit];
    [(NTKSeltzerDialView *)self _layoutCurvedLabel:self->_gregorianDateLabel];
    [(NTKSeltzerDialView *)self _layoutCurvedLabel:self->_lunarDateLabel];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_storeStrong((id *)&self->_overrideDate, a3);

  [(NTKSeltzerDialView *)self updateDialUI];
}

- (void)setCalendar:(unint64_t)a3
{
  if (self->_calendar != a3)
  {
    self->_calendar = a3;
    id v4 = [(NTKSeltzerDialView *)self _lunarCalendar];
    [(NSDateFormatter *)self->_lunarDateFormatter setCalendar:v4];

    [(NTKSeltzerDialView *)self _updateLunarCalendarUI];
  }
}

- (void)applyTransitionFraction:(double)a3 fromCalendar:(unint64_t)a4 toCalendar:(unint64_t)a5
{
  if (a4 != a5)
  {
    uint64_t v20 = v8;
    uint64_t v21 = v7;
    uint64_t v22 = v5;
    uint64_t v23 = v6;
    if (a3 >= 0.5)
    {
      CLKMapFractionIntoRange();
      double v12 = v14;
      unint64_t v10 = a5;
    }
    else
    {
      unint64_t v10 = a4;
      CLKMapFractionIntoRange();
      double v12 = v11;
    }
    CLKMapFractionIntoRange();
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v15, v15);
    [(NTKSeltzerDialView *)self setCalendar:v10];
    [(UIView *)self->_keystoneDateLabelContainerView setAlpha:v12];
    CGAffineTransform v18 = v19;
    [(UIView *)self->_keystoneDateLabelContainerView setTransform:&v18];
    [(UIView *)self->_calendarDialContainerView setAlpha:v12];
    CGAffineTransform v17 = v19;
    [(UIView *)self->_calendarDialContainerView setTransform:&v17];
    [(UIView *)self->_lunarDateLabelContainerView setAlpha:v12];
    CGAffineTransform v16 = v19;
    [(UIView *)self->_lunarDateLabelContainerView setTransform:&v16];
  }
}

- (void)_loadContainerViews
{
  [(NTKSeltzerDialView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v3, v5, v7, v9);
  dialContainerView = self->_dialContainerView;
  self->_dialContainerView = v11;

  [(NTKSeltzerDialView *)self addSubview:self->_dialContainerView];
  v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v8, v10);
  calendarDialContainerView = self->_calendarDialContainerView;
  self->_calendarDialContainerView = v13;

  [(UIView *)self->_dialContainerView addSubview:self->_calendarDialContainerView];
  CGFloat v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v8, v10);
  upperContainerView = self->_upperContainerView;
  self->_upperContainerView = v15;

  [(NTKSeltzerDialView *)self addSubview:self->_upperContainerView];
  CGAffineTransform v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v8, v10);
  keystoneDateLabelContainerView = self->_keystoneDateLabelContainerView;
  self->_keystoneDateLabelContainerView = v17;

  [(UIView *)self->_upperContainerView addSubview:self->_keystoneDateLabelContainerView];
  CGAffineTransform v19 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v8, v10);
  lowerContainerView = self->_lowerContainerView;
  self->_lowerContainerView = v19;

  [(NTKSeltzerDialView *)self addSubview:self->_lowerContainerView];
  uint64_t v21 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v8, v10);
  lunarDateLabelContainerView = self->_lunarDateLabelContainerView;
  self->_lunarDateLabelContainerView = v21;

  uint64_t v23 = self->_lowerContainerView;
  v24 = self->_lunarDateLabelContainerView;

  [(UIView *)v23 addSubview:v24];
}

- (void)_loadLunarCalendarDial
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)NTKDialView);
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  double v8 = sub_6B50;
  double v9 = &unk_104A8;
  objc_copyWeak(&v10, &location);
  double v4 = (NTKDialView *)[v3 initWithNumberOfMarkers:30 markersFactory:&v6];
  calendarDialView = self->_calendarDialView;
  self->_calendarDialView = v4;

  -[NTKDialView setShouldRotateMarkers:](self->_calendarDialView, "setShouldRotateMarkers:", 1, v6, v7, v8, v9);
  [(NTKDialView *)self->_calendarDialView setShouldPixelAlignCenterPoints:0];
  [(UIView *)self->_calendarDialContainerView addSubview:self->_calendarDialView];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_loadMoonPhaseDial
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)NTKDialView);
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  double v8 = sub_6D60;
  double v9 = &unk_104A8;
  objc_copyWeak(&v10, &location);
  double v4 = (NTKDialView *)[v3 initWithNumberOfMarkers:30 markersFactory:&v6];
  moonPhaseDialView = self->_moonPhaseDialView;
  self->_moonPhaseDialView = v4;

  -[NTKDialView setShouldPixelAlignCenterPoints:](self->_moonPhaseDialView, "setShouldPixelAlignCenterPoints:", 0, v6, v7, v8, v9);
  [(UIView *)self->_dialContainerView addSubview:self->_moonPhaseDialView];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_loadMoonPhaseSeparatorDial
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  sub_63B0(self->_device, (uint64_t)v10);
  uint64_t v4 = *((void *)&v11 + 1);
  uint64_t v3 = v12;
  id v5 = [(NTKSeltzerColorPalette *)self->_palette dialStroke];
  id v6 = [v5 CGColor];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6F4C;
  v9[3] = &unk_104C8;
  v9[4] = 0;
  v9[5] = 0;
  v9[6] = v3;
  v9[7] = v4;
  v9[8] = v6;
  uint64_t v7 = (NTKDialView *)[objc_alloc((Class)NTKDialView) initWithNumberOfMarkers:30 markersFactory:v9];
  moonPhaseSeparatorDialView = self->_moonPhaseSeparatorDialView;
  self->_moonPhaseSeparatorDialView = v7;

  [(NTKDialView *)self->_moonPhaseSeparatorDialView setShouldRotateMarkers:1];
  [(NTKDialView *)self->_moonPhaseSeparatorDialView setShouldPixelAlignCenterPoints:0];
  [(NTKDialView *)self->_moonPhaseSeparatorDialView setAngleOffset:6.0];
  [(UIView *)self->_dialContainerView addSubview:self->_moonPhaseSeparatorDialView];
}

- (void)_updateLunarCalendarUI
{
  uint64_t v3 = [(NTKSeltzerDialView *)self _currentDate];
  [(NTKSeltzerDialView *)self _updateLunarLabelWithDate:v3];

  calendarDialView = self->_calendarDialView;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7054;
  v5[3] = &unk_104F0;
  v5[4] = self;
  [(NTKDialView *)calendarDialView enumerateMarkers:v5];
  [(NTKSeltzerDialView *)self _updateKeystone];
}

- (void)updateDialUI
{
  uint64_t v3 = [(NTKSeltzerDialView *)self _currentDate];
  if (!self->_previousDate
    || (+[NSCalendar currentCalendar],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isDate:self->_previousDate inSameDayAsDate:v3],
        v4,
        (v5 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_previousDate, v3);
    self->_nextDayAngleOffset = -12.0;
    self->_previousDayAngleOffset = 12.0;
    [(NTKSeltzerDialView *)self _updateLunarCalendarUI];
    [(NTKSeltzerDialView *)self _updateGregorianLabelWithDate:v3];
    moonPhaseDialView = self->_moonPhaseDialView;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_7210;
    v7[3] = &unk_10518;
    v7[4] = self;
    [(NTKDialView *)moonPhaseDialView enumerateMarkers:v7];
  }
}

- (id)_dateForIndex:(unint64_t)a3
{
  unint64_t v4 = a3 - 30;
  if (a3 < 0xF) {
    unint64_t v4 = a3;
  }
  unint64_t v7 = v4;
  [(NTKSeltzerDialView *)self _applyRTLCorrectionIfNeeded:&v7];
  unsigned __int8 v5 = [(NTKSeltzerDialView *)self _dateForDayOffset:v7];

  return v5;
}

- (id)_lunarDateLabelTextForDate:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NTKSeltzerDialView *)self _lunarCalendar];
  id v6 = [v5 component:16 fromDate:v4];

  return +[NSString localizedStringWithFormat:@"%02lu", v6];
}

- (id)_moonPhaseImageForDate:(id)a3
{
  palette = self->_palette;
  id v5 = a3;
  id v6 = [(NTKSeltzerColorPalette *)palette moonForeground];
  unint64_t v7 = [(NTKSeltzerColorPalette *)self->_palette moonBackground];
  double v8 = [(NTKSeltzerDialView *)self _moonPhaseImageForDate:v5 foregroundColor:v6 backgroundColor:v7];

  return v8;
}

- (id)_moonPhaseImageForDate:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  NUNIMoonPhaseNumber();
  sub_63B0(self->_device, (uint64_t)v11);
  double v9 = NUNIRenderedMoonImage();

  return v9;
}

- (double)angleOffset
{
  [(NTKDialView *)self->_calendarDialView angleOffset];
  return result;
}

- (id)_currentDate
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    uint64_t v3 = overrideDate;
  }
  else
  {
    uint64_t v3 = +[NTKDate faceDate];
  }

  return v3;
}

- (void)_loadKeystone
{
  uint64_t v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  keystoneDateLabel = self->_keystoneDateLabel;
  self->_keystoneDateLabel = v3;

  id v5 = [(NTKSeltzerColorPalette *)self->_palette keystoneDateLabel];
  [(UILabel *)self->_keystoneDateLabel setTextColor:v5];

  id v6 = [(NTKSeltzerDialView *)self _dateLabelFont];
  [(UILabel *)self->_keystoneDateLabel setFont:v6];

  [(UIView *)self->_keystoneDateLabelContainerView addSubview:self->_keystoneDateLabel];
  sub_63B0(self->_device, (uint64_t)v9);
  id v7 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v10, v10);
  keystoneMoonPhaseImageView = self->_keystoneMoonPhaseImageView;
  self->_keystoneMoonPhaseImageView = v7;

  [(UIView *)self->_lowerContainerView addSubview:self->_keystoneMoonPhaseImageView];

  [(NTKSeltzerDialView *)self _updateKeystone];
}

- (void)_updateKeystone
{
  uint64_t v3 = [(NTKSeltzerDialView *)self _keystoneDateLabelText];
  [(UILabel *)self->_keystoneDateLabel setText:v3];

  [(UILabel *)self->_keystoneDateLabel sizeToFit];
  id v4 = [(NTKSeltzerDialView *)self _keystoneMoonPhaseImage];
  [(UIImageView *)self->_keystoneMoonPhaseImageView setImage:v4];

  [(NTKSeltzerDialView *)self setNeedsLayout];
}

- (id)_keystoneDateLabelText
{
  v2 = [(NTKDialView *)self->_calendarDialView markerAtIndex:[(NTKSeltzerDialView *)self _keystoneIndex]];
  uint64_t v3 = [v2 text];

  return v3;
}

- (id)_keystoneAXDateLabel
{
  v2 = [(NTKDialView *)self->_calendarDialView markerAtIndex:[(NTKSeltzerDialView *)self _keystoneIndex]];
  uint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_keystoneMoonPhaseImage
{
  int64_t v8 = [(NTKSeltzerDialView *)self _dayOffset];
  [(NTKSeltzerDialView *)self _applyRTLCorrectionIfNeeded:&v8];
  uint64_t v3 = [(NTKSeltzerDialView *)self _dateForDayOffset:v8];
  id v4 = [(NTKSeltzerColorPalette *)self->_palette keystoneMoonForeground];
  id v5 = [(NTKSeltzerColorPalette *)self->_palette keystoneMoonBackground];
  id v6 = [(NTKSeltzerDialView *)self _moonPhaseImageForDate:v3 foregroundColor:v4 backgroundColor:v5];

  return v6;
}

- (id)_keystoneAXMoonPhaseImageLabel
{
  v2 = [(NTKDialView *)self->_moonPhaseDialView markerAtIndex:[(NTKSeltzerDialView *)self _keystoneIndex]];
  uint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (int64_t)_keystoneIndex
{
  int64_t v2 = [(NTKSeltzerDialView *)self _dayOffset];
  if (v2 % 30 >= 0) {
    return v2 % 30;
  }
  else {
    return v2 % 30 + 30;
  }
}

- (CGPoint)_keystoneDateLabelCenter
{
  p_keystoneDateLabelCenter = &self->_keystoneDateLabelCenter;
  if (self->_keystoneMoonPhaseImageViewCenter.x == CGPointZero.x
    && self->_keystoneMoonPhaseImageViewCenter.y == CGPointZero.y)
  {
    calendarDialView = self->_calendarDialView;
    [(NTKDialView *)calendarDialView positionForMarkerAtIndex:0];
    -[NTKDialView convertPoint:toView:](calendarDialView, "convertPoint:toView:", self->_keystoneDateLabelContainerView);
    p_keystoneDateLabelCenter->double x = x;
    p_keystoneDateLabelCenter->double y = y;
  }
  else
  {
    double x = p_keystoneDateLabelCenter->x;
    double y = self->_keystoneDateLabelCenter.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)_keystoneMoonPhaseImageViewCenter
{
  p_keystoneMoonPhaseImageViewCenter = &self->_keystoneMoonPhaseImageViewCenter;
  double x = self->_keystoneMoonPhaseImageViewCenter.x;
  double y = self->_keystoneMoonPhaseImageViewCenter.y;
  if (x == CGPointZero.x && y == CGPointZero.y)
  {
    moonPhaseDialView = self->_moonPhaseDialView;
    [(NTKDialView *)moonPhaseDialView positionForMarkerAtIndex:0];
    -[NTKDialView convertPoint:toView:](moonPhaseDialView, "convertPoint:toView:", self->_lowerContainerView);
    p_keystoneMoonPhaseImageViewCenter->double x = x;
    p_keystoneMoonPhaseImageViewCenter->double y = y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_loadDateLabels
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  sub_63B0(self->_device, (uint64_t)v9);
  uint64_t v3 = [(NTKSeltzerDialView *)self _createDateLabel];
  gregorianDateLabel = self->_gregorianDateLabel;
  self->_gregorianDateLabel = v3;

  [(CLKUICurvedColoringLabel *)self->_gregorianDateLabel setCircleRadius:*((double *)&v10 + 1)];
  [(UIView *)self->_upperContainerView addSubview:self->_gregorianDateLabel];
  id v5 = [(NTKSeltzerDialView *)self _createDateLabel];
  lunarDateLabel = self->_lunarDateLabel;
  self->_lunarDateLabel = v5;

  [(CLKUICurvedColoringLabel *)self->_lunarDateLabel setCircleRadius:*(double *)&v11];
  lunarDateLabelContainerView = self->_lunarDateLabelContainerView;
  int64_t v8 = self->_lunarDateLabel;

  [(UIView *)lunarDateLabelContainerView addSubview:v8];
}

- (id)_createDateLabel
{
  id v3 = objc_alloc_init((Class)CLKUICurvedColoringLabel);
  [v3 setInterior:1];
  id v4 = [(NTKSeltzerColorPalette *)self->_palette heroDateLabel];
  [v3 setTextColor:v4];

  sub_63B0(self->_device, (uint64_t)v7);
  [v3 setTracking:v8];
  id v5 = [(NTKSeltzerDialView *)self _monospacedDateLabelFont];
  [v3 setFont:v5];

  return v3;
}

- (id)_dateLabelFont
{
  dateLabelFont = self->_dateLabelFont;
  if (!dateLabelFont)
  {
    sub_63B0(self->_device, (uint64_t)v7);
    id v4 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v8 design:UIFontWeightMedium];
    id v5 = self->_dateLabelFont;
    self->_dateLabelFont = v4;

    dateLabelFont = self->_dateLabelFont;
  }

  return dateLabelFont;
}

- (id)_monospacedDateLabelFont
{
  monospacedDateLabelFont = self->_monospacedDateLabelFont;
  if (!monospacedDateLabelFont)
  {
    id v4 = [(NTKSeltzerDialView *)self _dateLabelFont];
    id v5 = [v4 CLKFontWithMonospacedNumbers];
    id v6 = self->_monospacedDateLabelFont;
    self->_monospacedDateLabelFont = v5;

    monospacedDateLabelFont = self->_monospacedDateLabelFont;
  }

  return monospacedDateLabelFont;
}

- (void)_layoutCurvedLabel:(id)a3
{
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v17[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v17[1] = v4;
  v17[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v5 = a3;
  [v5 setTransform:v17];
  [v5 frame];
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v8, v9);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  CGPoint v16 = CGPointZero;
  [v5 getTextCenter:&v16 startAngle:0 endAngle:0];
  CGAffineTransformMakeTranslation(&v15, v11 - v16.x, v13 - v16.y);
  CGAffineTransform v14 = v15;
  [v5 setTransform:&v14];
}

- (void)_updateDateLabels
{
  int64_t v4 = [(NTKSeltzerDialView *)self _dayOffset];
  [(NTKSeltzerDialView *)self _applyRTLCorrectionIfNeeded:&v4];
  id v3 = [(NTKSeltzerDialView *)self _dateForDayOffset:v4];
  [(NTKSeltzerDialView *)self _updateGregorianLabelWithDate:v3];
  [(NTKSeltzerDialView *)self _updateLunarLabelWithDate:v3];
}

- (void)_updateGregorianLabelWithDate:(id)a3
{
  id v7 = [(NSDateFormatter *)self->_gregorianDateFormatter stringFromDate:a3];
  if (NTKSeltzerUseAllUppercaseText())
  {
    int64_t v4 = +[NSLocale currentLocale];
    uint64_t v5 = [v7 uppercaseStringWithLocale:v4];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [(CLKUICurvedColoringLabel *)self->_gregorianDateLabel setText:v6];
  [(NTKSeltzerDialView *)self _layoutCurvedLabel:self->_gregorianDateLabel];
}

- (id)_lunarStringWithDate:(id)a3
{
  if (self->_calendar)
  {
    lunarDateFormatter = self->_lunarDateFormatter;
    id v5 = a3;
    id v6 = [(NSDateFormatter *)lunarDateFormatter stringFromDate:v5];

    if (!NTKSeltzerUseAllUppercaseText()) {
      goto LABEL_6;
    }
    id v7 = +[NSLocale currentLocale];
    uint64_t v8 = [v6 uppercaseStringWithLocale:v7];
  }
  else
  {
    id v6 = a3;
    id v7 = [(NTKSeltzerDialView *)self _overlayCalendar];
    uint64_t v8 = +[CUIKDateStrings monthDayStringForDate:v6 inCalendar:v7];
  }
  double v9 = (void *)v8;

  id v6 = v9;
LABEL_6:

  return v6;
}

- (void)_updateLunarLabelWithDate:(id)a3
{
  int64_t v4 = [(NTKSeltzerDialView *)self _lunarStringWithDate:a3];
  [(CLKUICurvedColoringLabel *)self->_lunarDateLabel setText:v4];

  lunarDateLabel = self->_lunarDateLabel;

  [(NTKSeltzerDialView *)self _layoutCurvedLabel:lunarDateLabel];
}

- (void)_drawOutlines
{
  [(NTKSeltzerDialView *)self _drawDialOutlines];
  [(NTKSeltzerDialView *)self _drawKeystoneOutline];
  [(NTKSeltzerDialView *)self _drawDialMaskOutline];

  [(NTKSeltzerDialView *)self _drawDateCardOutline];
}

- (void)_drawDialOutlines
{
  double v36 = 0.0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  sub_63B0(self->_device, (uint64_t)&v27);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)&v27;
  double v8 = *(double *)&v35;
  double v9 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  [v9 currentPoint];
  double v11 = v10;
  double v13 = v12;

  double v25 = *((double *)&v35 + 1);
  double v14 = *((double *)&v34 + 1);
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moveToPoint:", v11, v13);
  double v15 = v36;
  objc_msgSend(v26, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7, v8, v36);
  [(NTKSeltzerDialView *)self bounds];
  CGFloat v16 = CGRectGetMidY(v38) - *((double *)&v27 + 1);
  [(NTKSeltzerDialView *)self bounds];
  CGRect v40 = CGRectInset(v39, v16, v16);
  uint64_t v17 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  double v18 = *(double *)&v28;
  CGAffineTransform v19 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v28, v8, v8);
  [v19 currentPoint];
  double v21 = v20;
  double v23 = v22;

  v24 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v18, v25, v14);
  objc_msgSend(v24, "moveToPoint:", v21, v23);
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v18, v8, v15);
  [(NTKSeltzerDialView *)self _addDialOutlineWithPath:v26];
  [(NTKSeltzerDialView *)self _addDialOutlineWithPath:v17];
  [(NTKSeltzerDialView *)self _addDialOutlineWithPath:v24];
}

- (void)_addDialOutlineWithPath:(id)a3
{
  id v4 = a3;
  id v9 = +[CAShapeLayer layer];
  id v5 = v4;
  id v6 = [v5 CGPath];

  [v9 setPath:v6];
  id v7 = [(NTKSeltzerColorPalette *)self->_palette dialStroke];
  objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  [v9 setFillColor:0];
  sub_63B0(self->_device, (uint64_t)v10);
  [v9 setLineWidth:v11];
  double v8 = [(NTKSeltzerDialView *)self layer];
  [v8 addSublayer:v9];
}

- (void)_drawKeystoneOutline
{
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  sub_63B0(self->_device, (uint64_t)&v30);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  id v7 = +[CAShapeLayer layer];
  keystoneLayer = self->_keystoneLayer;
  self->_keystoneLayer = v7;

  id v9 = [(NTKSeltzerColorPalette *)self->_palette dialStroke];
  -[CAShapeLayer setStrokeColor:](self->_keystoneLayer, "setStrokeColor:", [v9 CGColor]);

  [(CAShapeLayer *)self->_keystoneLayer setFillColor:0];
  [(CAShapeLayer *)self->_keystoneLayer setLineWidth:*(double *)&v37];
  double v10 = *(double *)&v31;
  double v11 = *(double *)&v38;
  double v12 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v31, *(double *)&v38, *(double *)&v38);
  [v12 currentPoint];
  double v14 = v13;
  double v16 = v15;

  double v17 = *((double *)&v37 + 1);
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v30, *((double *)&v37 + 1), v11);
  double v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v14, v16);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v18, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, v10, v11, v17);
  [(UIBezierPath *)v18 closePath];
  defaultKeystonePath = self->_defaultKeystonePath;
  self->_defaultKeystonePath = v18;
  long long v29 = v18;

  [(CAShapeLayer *)self->_keystoneLayer setPath:[(UIBezierPath *)self->_defaultKeystonePath CGPath]];
  double v20 = [(NTKSeltzerDialView *)self layer];
  [v20 addSublayer:self->_keystoneLayer];

  double v21 = *(double *)&v32;
  double v22 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v32, v11, v11);
  [v22 currentPoint];
  double v24 = v23;
  double v26 = v25;

  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *((double *)&v31 + 1), v17, v11);
  long long v27 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  -[UIBezierPath addLineToPoint:](v27, "addLineToPoint:", v24, v26);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v27, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, v21, v11, v17);
  [(UIBezierPath *)v27 closePath];
  interactiveKeystonePath = self->_interactiveKeystonePath;
  self->_interactiveKeystonePath = v27;
}

- (void)_drawDialMaskOutline
{
  double v40 = 0.0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  sub_63B0(self->_device, (uint64_t)&v31);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  id v30 = +[CALayer layer];
  id v7 = +[CAShapeLayer layer];
  double v8 = +[CAShapeLayer layer];
  [v30 addSublayer:v7];
  [v30 addSublayer:v8];
  double v9 = *(double *)&v31;
  double v10 = *((double *)&v38 + 1);
  double v11 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, *(double *)&v31, *((double *)&v38 + 1), *((double *)&v38 + 1));
  [v11 currentPoint];
  double v13 = v12;
  double v15 = v14;

  double v16 = *(double *)&v32;
  double v17 = *((double *)&v39 + 1);
  double v18 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v32, *((double *)&v39 + 1), v10);
  objc_msgSend(v18, "addLineToPoint:", v13, v15);
  objc_msgSend(v18, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, v9, v10, v17);
  [v18 closePath];
  id v19 = v18;
  objc_msgSend(v7, "setPath:", objc_msgSend(v19, "CGPath"));
  double v20 = v40;
  double v21 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, v9, v40, v40);
  [v21 currentPoint];
  double v23 = v22;
  double v25 = v24;

  double v26 = *(double *)&v39;
  long long v27 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v16, *(double *)&v39, v20);
  objc_msgSend(v27, "addLineToPoint:", v23, v25);
  objc_msgSend(v27, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, v9, v20, v26);
  [v27 closePath];
  id v28 = v27;
  objc_msgSend(v8, "setPath:", objc_msgSend(v28, "CGPath"));
  long long v29 = [(UIView *)self->_dialContainerView layer];
  [v29 setMask:v30];
}

- (void)_drawDateCardOutline
{
  double v39 = 0.0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  sub_63B0(self->_device, (uint64_t)&v30);
  [(NTKSeltzerDialView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  id v7 = +[CAShapeLayer layer];
  dateCardLayer = self->_dateCardLayer;
  self->_dateCardLayer = v7;

  id v9 = [(NTKSeltzerColorPalette *)self->_palette dialStroke];
  -[CAShapeLayer setStrokeColor:](self->_dateCardLayer, "setStrokeColor:", [v9 CGColor]);

  [(CAShapeLayer *)self->_dateCardLayer setFillColor:0];
  [(CAShapeLayer *)self->_dateCardLayer setLineWidth:*(double *)&v37];
  double v10 = *(double *)&v30;
  double v11 = v39;
  double v12 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *(double *)&v30, v39, v39);
  [v12 currentPoint];
  double v14 = v13;
  double v16 = v15;

  double v17 = *((double *)&v38 + 1);
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, *(double *)&v31, *((double *)&v38 + 1), v11);
  double v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v14, v16);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v18, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v10, v11, v17);
  [(UIBezierPath *)v18 closePath];
  defaultDateCardPath = self->_defaultDateCardPath;
  self->_defaultDateCardPath = v18;
  long long v29 = v18;

  [(CAShapeLayer *)self->_dateCardLayer setPath:[(UIBezierPath *)self->_defaultDateCardPath CGPath]];
  double v20 = [(NTKSeltzerDialView *)self layer];
  [v20 addSublayer:self->_dateCardLayer];

  double v21 = *((double *)&v31 + 1);
  double v22 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, *((double *)&v31 + 1), v11, v11);
  [v22 currentPoint];
  double v24 = v23;
  double v26 = v25;

  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v4, v6, *(double *)&v32, v17, v11);
  long long v27 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  -[UIBezierPath addLineToPoint:](v27, "addLineToPoint:", v24, v26);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v27, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v21, v11, v17);
  [(UIBezierPath *)v27 closePath];
  interactiveDateCardPath = self->_interactiveDateCardPath;
  self->_interactiveDateCardPath = v27;
}

- (void)updateAngleOffset:(double)a3 animated:(BOOL)a4
{
  if (!a4)
  {
    [(NTKSeltzerDialView *)self _updateDialOffset:a3];
    [(NTKSeltzerDialView *)self _updateKeystone];
    [(NTKSeltzerDialView *)self _updateDateLabels];
  }
}

- (void)_updateDialOffset:(double)a3
{
}

- (void)_updateDialOffset:(double)a3 skipTimeTravel:(BOOL)a4
{
  -[NTKDialView setAngleOffset:](self->_calendarDialView, "setAngleOffset:");
  [(NTKDialView *)self->_moonPhaseDialView setAngleOffset:a3];
  [(NTKDialView *)self->_moonPhaseSeparatorDialView setAngleOffset:a3 + 6.0];
  if (!a4)
  {
    double nextDayAngleOffset = self->_nextDayAngleOffset;
    if (self->_previousDayAngleOffset <= a3)
    {
      self->_double nextDayAngleOffset = nextDayAngleOffset + 12.0;
      self->_previousDayAngleOffset = self->_previousDayAngleOffset + 12.0;
      unint64_t v11 = [(NTKSeltzerDialView *)self _timeTravelIndexForFuture:0];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      unint64_t v9 = v11;
      uint64_t v10 = -15;
      goto LABEL_8;
    }
    if (nextDayAngleOffset >= a3)
    {
      self->_double nextDayAngleOffset = nextDayAngleOffset + -12.0;
      self->_previousDayAngleOffset = self->_previousDayAngleOffset + -12.0;
      unint64_t v8 = [(NTKSeltzerDialView *)self _timeTravelIndexForFuture:1];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v9 = v8;
        uint64_t v10 = 14;
LABEL_8:
        double v17 = (char *)[(NTKSeltzerDialView *)self _dayOffset] + v10;
        [(NTKSeltzerDialView *)self _applyRTLCorrectionIfNeeded:&v17];
        double v12 = [(NTKSeltzerDialView *)self _dateForDayOffset:v17];
        double v13 = [(NTKDialView *)self->_calendarDialView markerAtIndex:v9];
        double v14 = [(NTKSeltzerDialView *)self _lunarDateLabelTextForDate:v12];
        [v13 setText:v14];

        [v13 sizeToFit];
        double v15 = [(NTKDialView *)self->_moonPhaseDialView markerAtIndex:v9];
        double v16 = [(NTKSeltzerDialView *)self _moonPhaseImageForDate:v12];
        [v15 setImage:v16];
      }
    }
  }
}

- (unint64_t)_timeTravelIndexForFuture:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 14;
  }
  else {
    uint64_t v3 = 15;
  }
  int64_t v4 = [(NTKSeltzerDialView *)self _dayOffset];
  uint64_t v5 = (v4 + v3) % 30;
  if (v5 >= 0) {
    return (v4 + v3) % 30;
  }
  else {
    return v5 + 30;
  }
}

- (int64_t)_dayOffset
{
  [(NTKSeltzerDialView *)self angleOffset];
  return llround(v2 / -12.0);
}

- (void)_applyRTLCorrectionIfNeeded:(int64_t *)a3
{
  if (CLKLayoutIsRTL()) {
    *a3 = -*a3;
  }
}

- (id)_dateForDayOffset:(int64_t)a3
{
  uint64_t v3 = [(NTKSeltzerDialView *)self _currentDate];
  int64_t v4 = NTKAddDaysToDate();

  return v4;
}

- (void)enterInteractiveModeAnimated:(BOOL)a3
{
  if (a3)
  {
    [(NTKSeltzerDialView *)self _animateKeystoneFromPath:self->_defaultKeystonePath toPath:self->_interactiveKeystonePath];
    defaultDateCardPath = self->_defaultDateCardPath;
    interactiveDateCardPath = self->_interactiveDateCardPath;
    [(NTKSeltzerDialView *)self _animateDateCardFromPath:defaultDateCardPath toPath:interactiveDateCardPath];
  }
  else
  {
    [(CAShapeLayer *)self->_keystoneLayer setPath:[(UIBezierPath *)self->_interactiveKeystonePath CGPath]];
    double v6 = [(UIBezierPath *)self->_interactiveDateCardPath CGPath];
    dateCardLayer = self->_dateCardLayer;
    [(CAShapeLayer *)dateCardLayer setPath:v6];
  }
}

- (void)exitInteractiveModeAnimated:(BOOL)a3
{
  [(NTKSeltzerDialView *)self angleOffset];
  double v6 = fabs(v5);
  if (!a3)
  {
    [(NTKSeltzerDialView *)self _updateDialOffset:1 skipTimeTravel:0.0];
    [(CAShapeLayer *)self->_keystoneLayer removeAllAnimations];
    [(CAShapeLayer *)self->_keystoneLayer setPath:[(UIBezierPath *)self->_defaultKeystonePath CGPath]];
    [(CAShapeLayer *)self->_dateCardLayer removeAllAnimations];
    [(CAShapeLayer *)self->_dateCardLayer setPath:[(UIBezierPath *)self->_defaultDateCardPath CGPath]];
    [(NTKSeltzerDialView *)self applyInteractiveModeProgress:0.0];
  }
  if (v6 >= 0.00000011920929)
  {
    previousDate = self->_previousDate;
    self->_previousDate = 0;

    [(NTKSeltzerDialView *)self updateDialUI];
  }
}

- (void)applyInteractiveModeProgress:(double)a3
{
  sub_63B0(self->_device, (uint64_t)v23);
  CGFloat v4 = v24;
  CGAffineTransformMakeTranslation(&v19, 0.0, -v24);
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = v16;
  long long v17 = v9;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v7 = v18;
  CLKInterpolateBetweenTransform();
  upperContainerView = self->_upperContainerView;
  v15[0] = v20;
  v15[1] = v21;
  v15[2] = v22;
  [(UIView *)upperContainerView setTransform:v15];
  CGAffineTransformMakeTranslation(&v11, 0.0, v4);
  long long v16 = v8;
  long long v17 = v9;
  long long v18 = v7;
  CLKInterpolateBetweenTransform();
  lowerContainerView = self->_lowerContainerView;
  v10[0] = v12;
  v10[1] = v13;
  v10[2] = v14;
  [(UIView *)lowerContainerView setTransform:v10];
}

- (void)_animateKeystoneFromPath:(id)a3 toPath:(id)a4
{
  id v7 = [(NTKSeltzerDialView *)self _animationFromPath:a3 toPath:a4];
  keystoneLayer = self->_keystoneLayer;
  double v6 = [v7 keyPath];
  [(CAShapeLayer *)keystoneLayer addAnimation:v7 forKey:v6];
}

- (void)_animateDateCardFromPath:(id)a3 toPath:(id)a4
{
  id v7 = [(NTKSeltzerDialView *)self _animationFromPath:a3 toPath:a4];
  dateCardLayer = self->_dateCardLayer;
  double v6 = [v7 keyPath];
  [(CAShapeLayer *)dateCardLayer addAnimation:v7 forKey:v6];
}

- (id)_animationFromPath:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CABasicAnimation animationWithKeyPath:@"path"];
  id v8 = v6;
  id v9 = [v8 CGPath];

  [v7 setFromValue:v9];
  id v10 = v5;
  id v11 = [v10 CGPath];

  [v7 setToValue:v11];
  [v7 setDuration:0.4];
  long long v12 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v7 setTimingFunction:v12];

  [v7 setRemovedOnCompletion:0];
  [v7 setFillMode:kCAFillModeForwards];

  return v7;
}

- (id)_lunarCalendar
{
  double v2 = [(NTKSeltzerDialView *)self _calendarIdentifierForCalendar:self->_calendar];
  uint64_t v3 = +[NSCalendar calendarWithIdentifier:v2];

  return v3;
}

- (id)_calendarIdentifierForCalendar:(unint64_t)a3
{
  if (a3 <= 2) {
    self = (NTKSeltzerDialView *)*(id *)*(&off_10538 + a3);
  }
  return self;
}

- (id)_overlayCalendar
{
  overlayCalendar = self->__overlayCalendar;
  if (!overlayCalendar)
  {
    CGFloat v4 = +[NSTimeZone calendarTimeZone];
    id v5 = +[CUIKOverlayCalendar overlayCalendarForCalendarIdentifier:NSCalendarIdentifierChinese timezone:v4];
    id v6 = self->__overlayCalendar;
    self->__overlayCalendar = v5;

    overlayCalendar = self->__overlayCalendar;
  }

  return overlayCalendar;
}

- (unint64_t)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overlayCalendar, 0);
  objc_storeStrong((id *)&self->_interactiveKeystonePath, 0);
  objc_storeStrong((id *)&self->_defaultKeystonePath, 0);
  objc_storeStrong((id *)&self->_interactiveDateCardPath, 0);
  objc_storeStrong((id *)&self->_defaultDateCardPath, 0);
  objc_storeStrong((id *)&self->_keystoneLayer, 0);
  objc_storeStrong((id *)&self->_dateCardLayer, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_previousDate, 0);
  objc_storeStrong((id *)&self->_lunarDateFormatter, 0);
  objc_storeStrong((id *)&self->_gregorianDateFormatter, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_monospacedDateLabelFont, 0);
  objc_storeStrong((id *)&self->_dateLabelFont, 0);
  objc_storeStrong((id *)&self->_lunarDateLabel, 0);
  objc_storeStrong((id *)&self->_gregorianDateLabel, 0);
  objc_storeStrong((id *)&self->_keystoneMoonPhaseImageView, 0);
  objc_storeStrong((id *)&self->_keystoneDateLabel, 0);
  objc_storeStrong((id *)&self->_moonPhaseSeparatorDialView, 0);
  objc_storeStrong((id *)&self->_moonPhaseDialView, 0);
  objc_storeStrong((id *)&self->_calendarDialView, 0);
  objc_storeStrong((id *)&self->_lunarDateLabelContainerView, 0);
  objc_storeStrong((id *)&self->_lowerContainerView, 0);
  objc_storeStrong((id *)&self->_keystoneDateLabelContainerView, 0);
  objc_storeStrong((id *)&self->_upperContainerView, 0);
  objc_storeStrong((id *)&self->_calendarDialContainerView, 0);

  objc_storeStrong((id *)&self->_dialContainerView, 0);
}

@end