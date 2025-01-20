@interface NTKSquallDigitalTimeView
- (BOOL)isFrozen;
- (CGRect)_hourFrameForLinkingFraction:(double)a3 font:(id)a4;
- (CGRect)_minuteFrameForLinkingFraction:(double)a3 font:(id)a4;
- (NSDate)date;
- (NTKSquallDigitalTimeView)initWithDevice:(id)a3;
- (double)_hourYForLinkingFraction:(double)a3 font:(id)a4;
- (double)_minuteYForLinkingFraction:(double)a3 font:(id)a4;
- (id)_attributedStringForHour:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5;
- (id)_attributedStringForLink:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5;
- (id)_attributedStringForMinute:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5;
- (id)_fontForHour:(BOOL)a3 linkingFraction:(double)a4;
- (id)_hourString:(id)a3;
- (id)_linkedHourFontForDigitBelow:(unint64_t)a3 linkingFraction:(double)a4;
- (id)_minuteString:(id)a3;
- (id)_timeWithFaking:(id)a3 formatter:(id)a4;
- (id)stringAttributesForHour:(BOOL)a3 fontSize:(double)a4;
- (int64_t)_shiftDirectionForTime:(id)a3;
- (int64_t)faceDataMode;
- (void)_centerDateAnimated:(BOOL)a3;
- (void)_layoutTime;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateAnimating;
- (void)_updateLabelsAnimated:(BOOL)a3;
- (void)_updateLocale;
- (void)applyColorPalette:(id)a3;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
- (void)setFaceDataMode:(int64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKSquallDigitalTimeView

- (NTKSquallDigitalTimeView)initWithDevice:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NTKSquallDigitalTimeView;
  v6 = [(NTKSquallDigitalTimeView *)&v45 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = +[NTKSquallFontLoader squallFontDescriptor];
    CFStringRef v48 = kCTFontVariationAttribute;
    v9 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
    v46 = v9;
    sub_1BE0(v7->_device, &v43);
    v10 = +[NSNumber numberWithDouble:v44];
    v47 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v49 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v13 = [v8 fontDescriptorByAddingAttributes:v12];
    linkFontDescriptor = v7->_linkFontDescriptor;
    v7->_linkFontDescriptor = (UIFontDescriptor *)v13;

    uint64_t v15 = +[NTKDate faceDate];
    date = v7->_date;
    v7->_date = (NSDate *)v15;

    v17 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    formatter = v7->_formatter;
    v7->_formatter = v17;

    v19 = v7->_formatter;
    v20 = +[NSLocale localeWithLocaleIdentifier:@"en"];
    [(NSDateFormatter *)v19 setLocale:v20];

    v21 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    hourFormatter = v7->_hourFormatter;
    v7->_hourFormatter = v21;

    v23 = v7->_hourFormatter;
    v24 = +[NSLocale localeWithLocaleIdentifier:@"en"];
    [(NSDateFormatter *)v23 setLocale:v24];

    v25 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    minuteFormatter = v7->_minuteFormatter;
    v7->_minuteFormatter = v25;

    v27 = v7->_minuteFormatter;
    v28 = +[NSLocale localeWithLocaleIdentifier:@"en"];
    [(NSDateFormatter *)v27 setLocale:v28];

    [(NTKSquallDigitalTimeView *)v7 _updateLocale];
    v29 = (CLKUIColoringLabel *)objc_alloc_init((Class)CLKUIColoringLabel);
    hourLabel = v7->_hourLabel;
    v7->_hourLabel = v29;

    [(NTKSquallDigitalTimeView *)v7 addSubview:v7->_hourLabel];
    [(CLKUIColoringLabel *)v7->_hourLabel setTextAlignment:1];
    v31 = (CLKUIColoringLabel *)objc_alloc_init((Class)CLKUIColoringLabel);
    minuteLabel = v7->_minuteLabel;
    v7->_minuteLabel = v31;

    [(NTKSquallDigitalTimeView *)v7 addSubview:v7->_minuteLabel];
    [(CLKUIColoringLabel *)v7->_minuteLabel setTextAlignment:1];
    v33 = (CLKUIColoringLabel *)objc_alloc_init((Class)CLKUIColoringLabel);
    overlayLabel = v7->_overlayLabel;
    v7->_overlayLabel = v33;

    [(NTKSquallDigitalTimeView *)v7 addSubview:v7->_overlayLabel];
    [(CLKUIColoringLabel *)v7->_overlayLabel setTextAlignment:1];
    uint64_t v35 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationTimingFunction = v7->_animationTimingFunction;
    v7->_animationTimingFunction = (CAMediaTimingFunction *)v35;

    [(NTKSquallDigitalTimeView *)v7 _updateLabelsAnimated:0];
    [(NTKSquallDigitalTimeView *)v7 _startClockUpdates];
    v37 = objc_alloc_init(NTKSquallTimeProvider);
    bezelProvider = v7->_bezelProvider;
    v7->_bezelProvider = v37;

    v39 = [[NTKSquallTimeBezelView alloc] initWithDevice:v5 progressProvider:v7->_bezelProvider];
    bezelView = v7->_bezelView;
    v7->_bezelView = v39;

    [(NTKSquallDigitalTimeView *)v7 addSubview:v7->_bezelView];
    [(NTKSquallDigitalTimeView *)v7 sendSubviewToBack:v7->_bezelView];
    v41 = +[NSNotificationCenter defaultCenter];
    [v41 addObserver:v7 selector:"_updateLocale" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  [(NTKSquallDigitalTimeView *)self _layoutTime];
  bezelView = self->_bezelView;
  [(NTKSquallDigitalTimeView *)self bounds];

  -[NTKSquallTimeBezelView ntk_setBoundsAndPositionFromFrame:](bezelView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_layoutTime
{
  id v7 = [(NTKSquallDigitalTimeView *)self _fontForHour:1 linkingFraction:0.0];
  v3 = [(NTKSquallDigitalTimeView *)self _fontForHour:0 linkingFraction:0.0];
  hourLabel = self->_hourLabel;
  [(NTKSquallDigitalTimeView *)self _hourFrameForLinkingFraction:v7 font:0.0];
  -[CLKUIColoringLabel setFrame:](hourLabel, "setFrame:");
  minuteLabel = self->_minuteLabel;
  [(NTKSquallDigitalTimeView *)self _minuteFrameForLinkingFraction:v3 font:0.0];
  -[CLKUIColoringLabel setFrame:](minuteLabel, "setFrame:");
  overlayLabel = self->_overlayLabel;
  [(NTKSquallDigitalTimeView *)self _hourFrameForLinkingFraction:v7 font:0.0];
  -[CLKUIColoringLabel setFrame:](overlayLabel, "setFrame:");
}

- (void)applyColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [(NTKSquallBezelView *)self->_bezelView applyColorPalette:v5];

  [(NTKSquallDigitalTimeView *)self _updateLabelsAnimated:0];
}

- (double)_hourYForLinkingFraction:(double)a3 font:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  device = self->_device;
  id v5 = a4;
  sub_1BE0(device, &v13);
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  objc_msgSend(v5, "lineHeight", v13, v14, v15, v16);
  double v9 = v8;
  [v5 descender];
  double v11 = v10;

  return v7 - (v9 + v11);
}

- (double)_minuteYForLinkingFraction:(double)a3 font:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  device = self->_device;
  id v5 = a4;
  sub_1BE0(device, &v13);
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  objc_msgSend(v5, "lineHeight", v13, v14, v15, v16);
  double v9 = v8;
  [v5 descender];
  double v11 = v10;

  return v7 - (v9 + v11);
}

- (CGRect)_hourFrameForLinkingFraction:(double)a3 font:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [(NTKSquallDigitalTimeView *)self _fontForHour:1 linkingFraction:a3];
  }
  [(NTKSquallDigitalTimeView *)self bounds];
  double v8 = v7;
  [(NTKSquallDigitalTimeView *)self _hourYForLinkingFraction:v6 font:a3];
  double v10 = v9;
  [v6 lineHeight];
  double v12 = v11;

  double v13 = 0.0;
  double v14 = v10;
  double v15 = v8;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_minuteFrameForLinkingFraction:(double)a3 font:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [(NTKSquallDigitalTimeView *)self _fontForHour:0 linkingFraction:a3];
  }
  [(NTKSquallDigitalTimeView *)self bounds];
  double v8 = v7;
  [(NTKSquallDigitalTimeView *)self _minuteYForLinkingFraction:v6 font:a3];
  double v10 = v9;
  [v6 lineHeight];
  double v12 = v11;

  double v13 = 0.0;
  double v14 = v10;
  double v15 = v8;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_updateLabelsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  hourLabel = self->_hourLabel;
  id v6 = [(NTKSquallDigitalTimeView *)self _attributedStringForHour:self->_date linkingFraction:0.0 colorShiftFraction:0.0];
  [(CLKUIColoringLabel *)hourLabel setAttributedText:v6];

  minuteLabel = self->_minuteLabel;
  double v8 = [(NTKSquallDigitalTimeView *)self _attributedStringForMinute:self->_date linkingFraction:0.0 colorShiftFraction:0.0];
  [(CLKUIColoringLabel *)minuteLabel setAttributedText:v8];

  overlayLabel = self->_overlayLabel;
  double v10 = [(NTKSquallDigitalTimeView *)self _attributedStringForLink:self->_date linkingFraction:0.0 colorShiftFraction:0.0];
  [(CLKUIColoringLabel *)overlayLabel setAttributedText:v10];

  [(NTKSquallDigitalTimeView *)self _centerDateAnimated:v3];
  if (!v3)
  {
    [(NTKSquallDigitalTimeView *)self _layoutTime];
  }
}

- (id)_hourString:(id)a3
{
  return [(NTKSquallDigitalTimeView *)self _timeWithFaking:a3 formatter:self->_hourFormatter];
}

- (id)_minuteString:(id)a3
{
  return [(NTKSquallDigitalTimeView *)self _timeWithFaking:a3 formatter:self->_minuteFormatter];
}

- (id)_timeWithFaking:(id)a3 formatter:(id)a4
{
  uint64_t v4 = [a4 stringFromDate:a3];
  id v5 = (void *)v4;
  id v6 = &stru_C580;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  double v7 = v6;

  return v7;
}

- (id)_attributedStringForLink:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5
{
  id v7 = a3;
  double v8 = [(NTKSquallDigitalTimeView *)self _hourString:v7];
  double v9 = +[NSCalendar currentCalendar];
  double v10 = [v9 components:64 fromDate:v7];

  unint64_t v11 = (unint64_t)[v10 minute];
  id v12 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];
  double v13 = [(NTKSquallDigitalTimeView *)self _linkedHourFontForDigitBelow:v11 / 0xA linkingFraction:a4];
  objc_msgSend(v12, "addAttribute:value:range:", NSFontAttributeName, v13, 0, 1);
  double v14 = [(NTKSquallDigitalTimeView *)self _linkedHourFontForDigitBelow:v11 % 0xA linkingFraction:a4];
  objc_msgSend(v12, "addAttribute:value:range:", NSFontAttributeName, v14, 1, 1);
  sub_1BE0(self->_device, &v22);
  double v15 = +[NSNumber numberWithDouble:v23];
  objc_msgSend(v12, "addAttribute:value:range:", NSTrackingAttributeName, v15, 0, 2);

  palette = self->_palette;
  if (palette)
  {
    v17 = [(NTKSquallColorPalette *)palette hourNumeralsFill];
    v18 = [v17 colorWithAlphaComponent:0.0];

    v19 = [(NTKSquallColorPalette *)self->_palette hourNumeralsFillLinked];
    v20 = CLKInterpolateBetweenColors();

    objc_msgSend(v12, "addAttribute:value:range:", NSForegroundColorAttributeName, v20, 0, 2);
  }

  return v12;
}

- (id)_attributedStringForHour:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5
{
  id v7 = [(NTKSquallDigitalTimeView *)self _hourString:a3];
  id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v7];
  double v9 = [(NTKSquallDigitalTimeView *)self _fontForHour:1 linkingFraction:a4];
  objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v9, 0, 2);
  sub_1BE0(self->_device, &v16);
  double v10 = +[NSNumber numberWithDouble:v17];
  objc_msgSend(v8, "addAttribute:value:range:", NSTrackingAttributeName, v10, 0, 2);

  palette = self->_palette;
  if (palette)
  {
    id v12 = [(NTKSquallColorPalette *)palette hourNumeralsFill];
    double v13 = [(NTKSquallColorPalette *)self->_palette hourNumeralsFillLinked];
    double v14 = CLKInterpolateBetweenColors();

    objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, 2);
  }

  return v8;
}

- (id)_attributedStringForMinute:(id)a3 linkingFraction:(double)a4 colorShiftFraction:(double)a5
{
  id v7 = [(NTKSquallDigitalTimeView *)self _minuteString:a3];
  id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v7];
  double v9 = [(NTKSquallDigitalTimeView *)self _fontForHour:0 linkingFraction:a4];
  objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v9, 0, 2);
  sub_1BE0(self->_device, &v16);
  double v10 = +[NSNumber numberWithDouble:v17];
  objc_msgSend(v8, "addAttribute:value:range:", NSTrackingAttributeName, v10, 0, 2);

  palette = self->_palette;
  if (palette)
  {
    id v12 = [(NTKSquallColorPalette *)palette minuteNumeralsFill];
    double v13 = [(NTKSquallColorPalette *)self->_palette minuteNumeralsFillLinked];
    double v14 = CLKInterpolateBetweenColors();

    objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, 2);
  }

  return v8;
}

- (int64_t)_shiftDirectionForTime:(id)a3
{
  uint64_t v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 components:96 fromDate:self->_date];
  id v6 = [v5 minute];
  unint64_t v7 = (unint64_t)[v5 hour];
  if (self->_is24HourMode) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v7 % 0xC;
  }
  unint64_t v9 = v8 - 10;
  unint64_t v10 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * v8 + 0x3333333333333333, 1);
  unint64_t v11 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * (void)v6 + 0x3333333333333333, 1);
  BOOL v14 = (char *)v6 - 10 > (unsigned char *)&dword_8 + 1 && v9 > 9 && v11 < 0x199999999999999ALL;
  uint64_t v17 = (char *)v6 - 10 < (unsigned char *)&dword_8 + 2 && v11 > 0x1999999999999999 && v9 < 0xA;
  uint64_t v18 = v17 << 63 >> 63;
  if (v10 >= 0x199999999999999ALL) {
    int64_t v19 = v18;
  }
  else {
    int64_t v19 = v14;
  }

  return v19;
}

- (void)_centerDateAnimated:(BOOL)a3
{
  int64_t v4 = [(NTKSquallDigitalTimeView *)self _shiftDirectionForTime:self->_date];
  if (v4 != self->_currentHorizontalShift)
  {
    int64_t v5 = v4;
    sub_1BE0(self->_device, &v15);
    double v6 = *((double *)&v15 + 1);
    [(CLKUIColoringLabel *)self->_hourLabel center];
    double v8 = v7;
    [(CLKUIColoringLabel *)self->_minuteLabel center];
    double v10 = v9;
    [(NTKSquallDigitalTimeView *)self frame];
    double v11 = CGRectGetMidX(v16) + v6 * (double)v5;
    if (v8 != v11 || v10 != v11)
    {
      [(CLKUIColoringLabel *)self->_hourLabel center];
      double v14 = v13;
      [(CLKUIColoringLabel *)self->_hourLabel setCenter:v11];
      -[CLKUIColoringLabel setCenter:](self->_overlayLabel, "setCenter:", v11, v14);
      [(CLKUIColoringLabel *)self->_minuteLabel center];
      [(CLKUIColoringLabel *)self->_minuteLabel setCenter:v11];
      self->_currentHorizontalShift = v5;
    }
  }
}

- (id)stringAttributesForHour:(BOOL)a3 fontSize:(double)a4
{
  double v6 = [(NTKSquallDigitalTimeView *)self _fontForHour:a3 linkingFraction:0.0];
  v13[0] = NSFontAttributeName;
  double v7 = [v6 fontWithSize:a4];
  v14[0] = v7;
  v13[1] = NSTrackingAttributeName;
  sub_1BE0(self->_device, &v11);
  double v8 = +[NSNumber numberWithDouble:v12];
  v14[1] = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v9;
}

- (id)_fontForHour:(BOOL)a3 linkingFraction:(double)a4
{
  if (a3)
  {
    v22[0] = UIFontFeatureTypeIdentifierKey;
    v22[1] = UIFontFeatureSelectorIdentifierKey;
    v23[0] = &off_C900;
    v23[1] = &off_C918;
    double v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v24 = v6;
    double v7 = &v24;
  }
  else
  {
    v19[0] = UIFontFeatureTypeIdentifierKey;
    v19[1] = UIFontFeatureSelectorIdentifierKey;
    v20[0] = &off_C900;
    v20[1] = &off_C930;
    double v6 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    v21 = v6;
    double v7 = &v21;
  }
  double v8 = +[NSArray arrayWithObjects:v7 count:1];

  double v9 = objc_opt_new();
  [v9 setObject:v8 forKey:UIFontDescriptorFeatureSettingsAttribute];
  double v10 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  uint64_t v17 = v10;
  long long v11 = +[NSNumber numberWithDouble:a4];
  uint64_t v18 = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v9 setObject:v12 forKey:kCTFontVariationAttribute];

  double v13 = [(UIFontDescriptor *)self->_linkFontDescriptor fontDescriptorByAddingAttributes:v9];
  sub_1BE0(self->_device, v16);
  double v14 = +[UIFont fontWithDescriptor:v13 size:*(double *)v16];

  return v14;
}

- (id)_linkedHourFontForDigitBelow:(unint64_t)a3 linkingFraction:(double)a4
{
  v23[0] = UIFontFeatureTypeIdentifierKey;
  v23[1] = UIFontFeatureSelectorIdentifierKey;
  v24[0] = &off_C900;
  v24[1] = &off_C918;
  double v7 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v25[0] = v7;
  v21[1] = UIFontFeatureSelectorIdentifierKey;
  v22[0] = &off_C900;
  v21[0] = UIFontFeatureTypeIdentifierKey;
  double v8 = +[NSNumber numberWithInt:dword_9748[a3 % 0xA]];
  v22[1] = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v25[1] = v9;
  double v10 = +[NSArray arrayWithObjects:v25 count:2];

  long long v11 = objc_opt_new();
  [v11 setObject:v10 forKey:UIFontDescriptorFeatureSettingsAttribute];
  double v12 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  int64_t v19 = v12;
  double v13 = +[NSNumber numberWithDouble:a4];
  v20 = v13;
  double v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v11 setObject:v14 forKey:kCTFontVariationAttribute];

  long long v15 = [(UIFontDescriptor *)self->_linkFontDescriptor fontDescriptorByAddingAttributes:v11];
  sub_1BE0(self->_device, v18);
  CGRect v16 = +[UIFont fontWithDescriptor:v15 size:v18[0]];

  return v16;
}

- (void)_updateLocale
{
  id v6 = +[NSLocale currentLocale];
  int v3 = CLKLocaleIs24HourMode();
  self->_is24HourMode = v3;
  if (v3) {
    CFStringRef v4 = @"HH\nmm";
  }
  else {
    CFStringRef v4 = @"hh\nmm";
  }
  [(NSDateFormatter *)self->_formatter setDateFormat:v4];
  if (self->_is24HourMode) {
    CFStringRef v5 = @"HH";
  }
  else {
    CFStringRef v5 = @"hh";
  }
  [(NSDateFormatter *)self->_hourFormatter setDateFormat:v5];
  [(NSDateFormatter *)self->_minuteFormatter setDateFormat:@"mm"];
  [(NTKSquallDigitalTimeView *)self _updateLabelsAnimated:0];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5 = a3;
  [(NTKSquallDigitalTimeView *)self setDate:v5];
  [(NTKSquallTimeProvider *)self->_bezelProvider setDate:v5];

  bezelView = self->_bezelView;

  [(NTKSquallBezelView *)bezelView bezelProgressUpdated];
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  self->_frozen = a3;
  [(NTKSquallDigitalTimeView *)self _updateAnimating];
  if (v3)
  {
    [(NTKSquallDigitalTimeView *)self _stopClockUpdates];
  }
  else
  {
    [(NTKSquallDigitalTimeView *)self _startClockUpdates];
  }
}

- (void)_startClockUpdates
{
  objc_initWeak(&location, self);
  BOOL v3 = +[CLKClockTimer sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_32B8;
  v6[3] = &unk_C3F0;
  objc_copyWeak(&v7, &location);
  CFStringRef v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&stru_C430];
  timerToken = self->_timerToken;
  self->_timerToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_stopClockUpdates
{
  if (self->_timerToken)
  {
    BOOL v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_timerToken];

    timerToken = self->_timerToken;
    self->_timerToken = 0;
  }
}

- (int64_t)faceDataMode
{
  return self->_faceDataMode;
}

- (void)setFaceDataMode:(int64_t)a3
{
  self->_faceDataMode = a3;
  [(NTKSquallDigitalTimeView *)self _updateAnimating];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSquallDigitalTimeView;
  [(NTKSquallDigitalTimeView *)&v4 setHidden:a3];
  [(NTKSquallDigitalTimeView *)self _updateAnimating];
}

- (void)_updateAnimating
{
  bezelView = self->_bezelView;
  if (self->_frozen || self->_faceDataMode != 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(NTKSquallDigitalTimeView *)self isHidden] ^ 1;
  }

  [(NTKSquallBezelView *)bezelView setAnimating:v3];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_animationTimingFunction, 0);
  objc_storeStrong((id *)&self->_bezelView, 0);
  objc_storeStrong((id *)&self->_bezelProvider, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_minuteFormatter, 0);
  objc_storeStrong((id *)&self->_hourFormatter, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_linkFontDescriptor, 0);
  objc_storeStrong((id *)&self->_linkFontDescriptors, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_timerToken, 0);
}

@end