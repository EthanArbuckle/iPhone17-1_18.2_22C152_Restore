@interface NTKTimerBundleTimelineEntry
+ (id)circularMediumImageProviderForDevice:(id)a3;
+ (id)circularSmallImageProviderForDevice:(id)a3;
+ (id)extraLargeImageProviderForDevice:(id)a3;
+ (id)fullColorSymbolImageProviderForDevice:(id)a3;
+ (id)fullColorSymbolImageProviderForDevice:(id)a3 withOverridePointSize:(double)a4;
+ (id)modularSmallImageProviderForDevice:(id)a3;
+ (id)symbolImageProviderForDevice:(id)a3;
+ (id)utilitarianSmallImageProviderForDevice:(id)a3;
- (BOOL)isDefaultComplication;
- (CLKDevice)device;
- (NSString)title;
- (NTKTimerBundleTimelineEntry)initWithDevice:(id)a3;
- (double)countdownDuration;
- (double)remainingTime;
- (id)_countdownTextProviderWithBaseDate:(id)a3;
- (id)_gaugeProviderForTimeAtState:(unint64_t)a3 tintColor:(id)a4;
- (id)_newCircularMediumTemplate;
- (id)_newCircularSmallTemplate;
- (id)_newExtraLargeTemplate;
- (id)_newLargeFlatUtilityTemplate;
- (id)_newLargeModularTemplate;
- (id)_newSignatureBezelTemplate;
- (id)_newSignatureCircularTemplate;
- (id)_newSignatureCornerGaugeImageTemplate;
- (id)_newSignatureExtraLargeCircularTemplate;
- (id)_newSignatureRectangular;
- (id)_newSignatureRectangularBodyRelativeDateTextProvider;
- (id)_newSignatureRectangularHeaderTextProvider;
- (id)_newSimpleTextTemplate;
- (id)_newSmallFlatUtilityTemplate;
- (id)_newSmallModularTemplate;
- (id)_relativeDateGaugeProviderForTimeInterval:(double)a3 fullDuration:(double)a4 paused:(BOOL)a5 tintColor:(id)a6;
- (id)_relativeDateTextProviderForTimeInterval:(double)a3 paused:(BOOL)a4 twoDigitMinuteZeroPadding:(BOOL)a5;
- (id)_templateMetadata;
- (id)_textProviderForTimeAtState:(unint64_t)a3;
- (id)_textProviderForTimeAtState:(unint64_t)a3 withUnknownText:(id)a4;
- (id)_textProviderForTimeAtState:(unint64_t)a3 withUnknownText:(id)a4 twoDigitMinuteZeroPadding:(BOOL)a5;
- (id)_titleTextProvider:(BOOL)a3;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)numPausedTimers;
- (unint64_t)numRunningTimers;
- (unint64_t)state;
- (void)setCountdownDuration:(double)a3;
- (void)setIsDefaultComplication:(BOOL)a3;
- (void)setNumPausedTimers:(unint64_t)a3;
- (void)setNumRunningTimers:(unint64_t)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation NTKTimerBundleTimelineEntry

+ (id)circularMediumImageProviderForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isRunningGloryGMOrLater])
  {
    id v4 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v3];
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11310);
  id WeakRetained = objc_loadWeakRetained(&qword_11318);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11318);
  if (v7 != v3)
  {

LABEL_7:
    id v10 = objc_storeWeak(&qword_11318, v3);
    qword_11320 = (uint64_t)[v3 version];

    sub_4994();
    goto LABEL_8;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_11320;

  if (v8 != (id)v9) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11310);
  id v4 = (id)qword_11308;
LABEL_9:
  v11 = v4;

  return v11;
}

+ (id)circularSmallImageProviderForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isRunningGloryGMOrLater])
  {
    id v4 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v3];
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11330);
  id WeakRetained = objc_loadWeakRetained(&qword_11338);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11338);
  if (v7 != v3)
  {

LABEL_7:
    id v10 = objc_storeWeak(&qword_11338, v3);
    qword_11340 = (uint64_t)[v3 version];

    sub_4B60();
    goto LABEL_8;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_11340;

  if (v8 != (id)v9) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11330);
  id v4 = (id)qword_11328;
LABEL_9:
  v11 = v4;

  return v11;
}

+ (id)extraLargeImageProviderForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isRunningGloryGMOrLater])
  {
    id v4 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v3];
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11350);
  id WeakRetained = objc_loadWeakRetained(&qword_11358);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11358);
  if (v7 != v3)
  {

LABEL_7:
    id v10 = objc_storeWeak(&qword_11358, v3);
    qword_11360 = (uint64_t)[v3 version];

    sub_4D2C();
    goto LABEL_8;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_11360;

  if (v8 != (id)v9) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11350);
  id v4 = (id)qword_11348;
LABEL_9:
  v11 = v4;

  return v11;
}

+ (id)modularSmallImageProviderForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isRunningGloryGMOrLater])
  {
    id v4 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v3];
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11370);
  id WeakRetained = objc_loadWeakRetained(&qword_11378);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11378);
  if (v7 != v3)
  {

LABEL_7:
    id v10 = objc_storeWeak(&qword_11378, v3);
    qword_11380 = (uint64_t)[v3 version];

    sub_4EF8();
    goto LABEL_8;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_11380;

  if (v8 != (id)v9) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11370);
  id v4 = (id)qword_11368;
LABEL_9:
  v11 = v4;

  return v11;
}

+ (id)utilitarianSmallImageProviderForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isRunningGloryGMOrLater])
  {
    id v4 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v3];
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11390);
  id WeakRetained = objc_loadWeakRetained(&qword_11398);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11398);
  if (v7 != v3)
  {

LABEL_7:
    id v10 = objc_storeWeak(&qword_11398, v3);
    qword_113A0 = (uint64_t)[v3 version];

    sub_50C4();
    goto LABEL_8;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_113A0;

  if (v8 != (id)v9) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11390);
  id v4 = (id)qword_11388;
LABEL_9:
  v11 = v4;

  return v11;
}

- (NTKTimerBundleTimelineEntry)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTimerBundleTimelineEntry;
  v6 = [(NTKTimerBundleTimelineEntry *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)_templateMetadata
{
  id v3 = +[NSMutableDictionary dictionary];
  unint64_t state = self->_state;
  if (state == 3)
  {
    v6 = NTTimerComplicationMetadataStateValue_Running;
  }
  else if (state == 2)
  {
    unsigned int v5 = [(NTKTimerBundleTimelineEntry *)self isDefaultComplication];
    v6 = NTTimerComplicationMetadataStateValue_Paused;
    if (v5) {
      v6 = &NTTimerComplicationMetadataStateValue_Stopped;
    }
  }
  else
  {
    v6 = &NTTimerComplicationMetadataStateValue_Stopped;
  }
  [v3 setObject:*v6 forKeyedSubscript:@"NTKTimerComplicationMetadataStateKey"];
  [(NTKTimerBundleTimelineEntry *)self countdownDuration];
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"NTKTimerComplicationMetadataDurationKey"];

  if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v8 = +[CLKDate complicationDate];
    [(NTKTimerBundleTimelineEntry *)self remainingTime];
    objc_super v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");
    [v3 setObject:v9 forKeyedSubscript:@"NTKTimerComplicationMetadataTimerDateKey"];
    id v10 = [(NTKTimerBundleTimelineEntry *)self _countdownTextProviderWithBaseDate:v8];
    [v3 setObject:v10 forKeyedSubscript:@"NTKTimerComplicationMetadataTextProviderKey"];
  }
  else
  {
    if ([(NTKTimerBundleTimelineEntry *)self isDefaultComplication]) {
      goto LABEL_13;
    }
    [(NTKTimerBundleTimelineEntry *)self countdownDuration];
    id v8 = -[NTKTimerBundleTimelineEntry _relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:](self, "_relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:", 1, v11 > 600.0);
    [v3 setObject:v8 forKeyedSubscript:@"NTKTimerComplicationMetadataTextProviderKey"];
  }

LABEL_13:
  v12 = +[NSNumber numberWithBool:[(NTKTimerBundleTimelineEntry *)self isDefaultComplication]];
  [v3 setObject:v12 forKeyedSubscript:@"NTKTimerComplicationMetaDataIsDefaultKey"];

  [(NTKTimerBundleTimelineEntry *)self remainingTime];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"NTKTimerComplicationMetaDataRemainingPausedTimeKey"];

  return v3;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    id v4 = [(NTKTimerBundleTimelineEntry *)self _newCircularMediumTemplate];
LABEL_3:
    unsigned int v5 = v4;
LABEL_4:
    v6 = [(NTKTimerBundleTimelineEntry *)self _templateMetadata];
    [v5 setMetadata:v6];
  }
  else
  {
    if (CLKComplicationFamilySimpleText != a3)
    {
      unsigned int v5 = 0;
      switch(a3)
      {
        case 0:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newSmallModularTemplate];
          goto LABEL_3;
        case 1:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newLargeModularTemplate];
          goto LABEL_3;
        case 2:
        case 6:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newSmallFlatUtilityTemplate];
          goto LABEL_3;
        case 3:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newLargeFlatUtilityTemplate];
          goto LABEL_3;
        case 4:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newCircularSmallTemplate];
          goto LABEL_3;
        case 7:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newExtraLargeTemplate];
          goto LABEL_3;
        case 8:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newSignatureCornerGaugeImageTemplate];
          goto LABEL_3;
        case 9:
          id v7 = [(NTKTimerBundleTimelineEntry *)self _newSignatureBezelTemplate];
          goto LABEL_7;
        case 10:
          id v7 = [(NTKTimerBundleTimelineEntry *)self _newSignatureCircularTemplate];
          goto LABEL_7;
        case 11:
          id v4 = [(NTKTimerBundleTimelineEntry *)self _newSignatureRectangular];
          goto LABEL_3;
        case 12:
          id v7 = [(NTKTimerBundleTimelineEntry *)self _newSignatureExtraLargeCircularTemplate];
          goto LABEL_7;
        default:
          goto LABEL_4;
      }
    }
    id v7 = [(NTKTimerBundleTimelineEntry *)self _newSimpleTextTemplate];
LABEL_7:
    unsigned int v5 = v7;
  }
  id v8 = +[UIColor systemOrangeColor];
  [v5 setTintColor:v8];

  id v9 = objc_alloc((Class)CLKComplicationBackgroundDescriptor);
  id v10 = +[UIColor colorWithRed:0.623529412 green:0.250980392 blue:0.0274509804 alpha:1.0];
  id v11 = [v9 initWithBackgroundColor:v10];
  [v5 setBackgroundDescriptor:v11];

  return v5;
}

- (id)_countdownTextProviderWithBaseDate:(id)a3
{
  id v4 = a3;
  [(NTKTimerBundleTimelineEntry *)self countdownDuration];
  double v6 = v5;
  [(NTKTimerBundleTimelineEntry *)self remainingTime];
  id v7 = objc_msgSend(v4, "dateByAddingTimeInterval:");
  unint64_t state = self->_state;
  id v9 = +[CLKRelativeDateTextProvider textProviderWithDate:v7 style:2 units:224];
  [v9 setPauseTimerAtZero:1];
  [v9 setTwoDigitMinuteZeroPadding:v6 > 600.0];
  if (state == 2)
  {
    [v9 setRelativeToDate:v4];
    [(NTKTimerBundleTimelineEntry *)self _updateTextProviderForAOTPaused:v9];
  }

  return v9;
}

- (id)_newSignatureCircularTemplate
{
  v2 = [(NTKTimerBundleTimelineEntry *)self _templateMetadata];
  id v3 = +[CLKComplicationTemplateGraphicCircularMetadata templateWithMetadata:v2];

  return v3;
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  v2 = [(NTKTimerBundleTimelineEntry *)self _templateMetadata];
  id v3 = +[CLKComplicationTemplateGraphicExtraLargeCircularMetadata templateWithMetadata:v2];

  return v3;
}

- (id)_newSignatureBezelTemplate
{
  id v2 = [(NTKTimerBundleTimelineEntry *)self _newSignatureCircularTemplate];
  id v3 = +[UIColor systemOrangeColor];
  [v2 setTintColor:v3];

  id v4 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v2];

  return v4;
}

- (id)_newSignatureRectangular
{
  id v3 = +[UIColor systemOrangeColor];
  id v4 = [(NTKTimerBundleTimelineEntry *)self device];
  double v5 = +[NTKTimerBundleTimelineEntry fullColorSymbolImageProviderForDevice:v4];

  id v6 = [(NTKTimerBundleTimelineEntry *)self _newSignatureRectangularHeaderTextProvider];
  [v6 setTintColor:v3];
  if (*(_OWORD *)&self->_numPausedTimers == 0)
  {
    id v10 = [(NTKTimerBundleTimelineEntry *)self _newSignatureRectangularBodyRelativeDateTextProvider];
    id v11 = [v3 colorWithAlphaComponent:0.25];
    v12 = [(NTKTimerBundleTimelineEntry *)self _gaugeProviderForTimeAtState:self->_state tintColor:v11];
    v13 = +[CLKComplicationTemplateGraphicRectangularTextGauge templateWithHeaderImageProvider:v5 headerTextProvider:v6 body1TextProvider:v10 gaugeProvider:v12];
  }
  else
  {
    unint64_t state = self->_state;
    id v8 = NTKClockFaceLocalizedString();
    id v10 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v8 twoDigitMinuteZeroPadding:0];

    switch(self->_state)
    {
      case 0uLL:
      case 1uLL:
      case 4uLL:
        id v9 = [(NTKTimerBundleTimelineEntry *)self _newSignatureRectangularBodyRelativeDateTextProvider];
        goto LABEL_7;
      case 2uLL:
        v14 = NTKClockFaceLocalizedString();
        +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v14, v10);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        id v10 = +[UIColor whiteColor];
        v15 = [v10 colorWithAlphaComponent:0.5];
        [v9 setTintColor:v15];

        goto LABEL_7;
      case 3uLL:
        uint64_t v16 = NTKClockFaceLocalizedString();
        +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v16, v10);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        id v10 = (id)v16;
LABEL_7:

        id v10 = v9;
        break;
      default:
        break;
    }
    id v11 = [(NTKTimerBundleTimelineEntry *)self _gaugeProviderForTimeAtState:self->_state tintColor:v3];
    v13 = +[CLKComplicationTemplateGraphicRectangularTextGauge templateWithHeaderImageProvider:v5 headerTextProvider:v6 body1TextProvider:v10 gaugeProvider:v11];
  }

  return v13;
}

- (id)_newSignatureCornerGaugeImageTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry fullColorSymbolImageProviderForDevice:v3];

  unint64_t state = self->_state;
  id v6 = NTKClockFaceLocalizedString();
  id v7 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v6];

  id v8 = +[UIColor systemOrangeColor];
  [v7 setTintColor:v8];
  id v9 = [(NTKTimerBundleTimelineEntry *)self _gaugeProviderForTimeAtState:self->_state tintColor:v8];
  id v10 = +[CLKComplicationTemplateGraphicCornerGaugeImage templateWithGaugeProvider:v9 leadingTextProvider:v7 trailingTextProvider:0 imageProvider:v4];

  return v10;
}

- (id)_newSmallModularTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry modularSmallImageProviderForDevice:v3];

  unint64_t state = self->_state;
  id v6 = NTKClockFaceLocalizedString();
  id v7 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v6];

  id v8 = +[CLKComplicationTemplateModularSmallStackImage templateWithLine1ImageProvider:v4 line2TextProvider:v7];

  return v8;
}

- (id)_newLargeModularTemplate
{
  unint64_t state = self->_state;
  if (state == 2) {
    goto LABEL_7;
  }
  if (state == 3)
  {
    id v4 = [(NTKTimerBundleTimelineEntry *)self _titleTextProvider:0];
    goto LABEL_9;
  }
  if (![(NTKTimerBundleTimelineEntry *)self isDefaultComplication])
  {
LABEL_7:
    double v5 = NTKClockFaceLocalizedString();
    id v4 = +[CLKSimpleTextProvider textProviderWithText:v5];
  }
  else
  {
    double v5 = NTKClockFaceLocalizedString();
    id v6 = NTKClockFaceLocalizedString();
    id v4 = +[CLKSimpleTextProvider textProviderWithText:v5 shortText:v6];
  }
LABEL_9:
  unint64_t v7 = self->_state;
  id v8 = NTKClockFaceLocalizedString();
  id v9 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:v7 withUnknownText:v8];

  id v10 = [(NTKTimerBundleTimelineEntry *)self device];
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D19E94CA-E3A6-45FB-A534-710914B5AB77"];
  unsigned __int8 v12 = [v10 supportsCapability:v11];

  if (v12)
  {
    v13 = [(NTKTimerBundleTimelineEntry *)self device];
    v14 = +[NTKTimerBundleTimelineEntry symbolImageProviderForDevice:v13];
    v15 = +[CLKComplicationTemplateModularLargeTallBody templateWithHeaderImageProvider:v14 headerTextProvider:v4 bodyTextProvider:v9];
  }
  else
  {
    v15 = +[CLKComplicationTemplateModularLargeTallBody templateWithHeaderTextProvider:v4 bodyTextProvider:v9];
  }

  return v15;
}

- (id)_newCircularSmallTemplate
{
  if ((self->_state | 4) == 4)
  {
    id v2 = [(NTKTimerBundleTimelineEntry *)self device];
    id v3 = +[NTKTimerBundleTimelineEntry circularSmallImageProviderForDevice:v2];

    +[CLKComplicationTemplateCircularSmallSimpleImage templateWithImageProvider:v3];
  }
  else
  {
    id v3 = -[NTKTimerBundleTimelineEntry _textProviderForTimeAtState:](self, "_textProviderForTimeAtState:");
    +[CLKComplicationTemplateCircularSmallSimpleText templateWithTextProvider:v3];
  id v4 = };

  return v4;
}

- (id)_newCircularMediumTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry circularMediumImageProviderForDevice:v3];

  double v5 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:self->_state];
  id v6 = +[CLKComplicationTemplateCircularMediumStackImage templateWithLine1ImageProvider:v4 line2TextProvider:v5];

  return v6;
}

- (id)_newSmallFlatUtilityTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry utilitarianSmallImageProviderForDevice:v3];

  unint64_t state = self->_state;
  id v6 = NTKClockFaceLocalizedString();
  unint64_t v7 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v6];

  id v8 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v7 imageProvider:v4];

  return v8;
}

- (id)_newLargeFlatUtilityTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry utilitarianSmallImageProviderForDevice:v3];

  switch(self->_state)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      if ([(NTKTimerBundleTimelineEntry *)self isDefaultComplication]) {
        goto LABEL_10;
      }
      unint64_t state = self->_state;
      id v6 = NTKClockFaceLocalizedString();
      unint64_t v7 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v6 twoDigitMinuteZeroPadding:0];

      id v8 = NTKClockFaceLocalizedString();
      id v9 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v8, v7);

      break;
    case 2uLL:
      id v10 = [(NTKTimerBundleTimelineEntry *)self title];

      if (v10)
      {
        id v11 = NTKClockFaceLocalizedString();
        unsigned __int8 v12 = [(NTKTimerBundleTimelineEntry *)self title];
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

        uint64_t v14 = +[CLKSimpleTextProvider textProviderWithText:v13];
        goto LABEL_9;
      }
LABEL_10:
      id v11 = NTKClockFaceLocalizedString();
      id v9 = +[CLKSimpleTextProvider textProviderWithText:v11];
      goto LABEL_11;
    case 3uLL:
      v15 = [(NTKTimerBundleTimelineEntry *)self title];

      if (v15)
      {
        id v11 = [(NTKTimerBundleTimelineEntry *)self _titleTextProvider:0];
        [(NTKTimerBundleTimelineEntry *)self remainingTime];
        v13 = -[NTKTimerBundleTimelineEntry _relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:](self, "_relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:", 0, 1);
        uint64_t v14 = +[CLKTextProvider textProviderWithFormat:@"%@ %@", v13, v11];
LABEL_9:
        id v9 = (void *)v14;

LABEL_11:
      }
      else
      {
        [(NTKTimerBundleTimelineEntry *)self remainingTime];
        id v9 = -[NTKTimerBundleTimelineEntry _relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:](self, "_relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:", 0, 1);
      }
      break;
    default:
      id v9 = 0;
      break;
  }
  uint64_t v16 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v9 imageProvider:v4];

  return v16;
}

- (id)_newSimpleTextTemplate
{
  unint64_t state = self->_state;
  id v4 = NTKClockFaceLocalizedString();
  double v5 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v4];

  id v6 = +[CLKComplicationTemplateSimpleText templateWithTextProvider:v5];
  unint64_t v7 = [(NTKTimerBundleTimelineEntry *)self _templateMetadata];
  id v8 = [v7 mutableCopy];

  [v8 setObject:&off_D048 forKeyedSubscript:NTKSimpleTextComplicationTypeMetadataKey];
  [v6 setMetadata:v8];

  return v6;
}

- (id)_newExtraLargeTemplate
{
  id v3 = [(NTKTimerBundleTimelineEntry *)self device];
  id v4 = +[NTKTimerBundleTimelineEntry extraLargeImageProviderForDevice:v3];

  unint64_t state = self->_state;
  id v6 = NTKClockFaceLocalizedString();
  unint64_t v7 = [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:state withUnknownText:v6];

  id v8 = +[CLKComplicationTemplateExtraLargeStackImage templateWithLine1ImageProvider:v4 line2TextProvider:v7];

  return v8;
}

- (id)_gaugeProviderForTimeAtState:(unint64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      double v7 = 100.0;
      double v8 = 0.0;
      id v9 = self;
      goto LABEL_7;
    case 1uLL:
      [(NTKTimerBundleTimelineEntry *)self countdownDuration];
      goto LABEL_6;
    case 2uLL:
      [(NTKTimerBundleTimelineEntry *)self remainingTime];
LABEL_6:
      double v12 = v11;
      [(NTKTimerBundleTimelineEntry *)self countdownDuration];
      double v7 = v13;
      id v9 = self;
      double v8 = v12;
LABEL_7:
      uint64_t v14 = 1;
      goto LABEL_9;
    case 3uLL:
      [(NTKTimerBundleTimelineEntry *)self remainingTime];
      double v16 = v15;
      [(NTKTimerBundleTimelineEntry *)self countdownDuration];
      double v7 = v17;
      id v9 = self;
      double v8 = v16;
      uint64_t v14 = 0;
LABEL_9:
      id v10 = [(NTKTimerBundleTimelineEntry *)v9 _relativeDateGaugeProviderForTimeInterval:v14 fullDuration:v6 paused:v8 tintColor:v7];
      break;
    default:
      id v10 = 0;
      break;
  }

  return v10;
}

- (id)_relativeDateGaugeProviderForTimeInterval:(double)a3 fullDuration:(double)a4 paused:(BOOL)a5 tintColor:(id)a6
{
  float v7 = a3 / a4;
  if (a3 <= 0.0 || a5)
  {
    id v14 = a6;
    *(float *)&double v15 = v7;
    double v13 = +[CLKSimpleGaugeProvider gaugeProviderWithStyle:1 gaugeColor:v14 fillFraction:v15];
  }
  else
  {
    id v8 = a6;
    id v9 = +[NSDate date];
    id v10 = [v9 dateByAddingTimeInterval:a3];
    id v17 = v8;
    double v11 = +[NSArray arrayWithObjects:&v17 count:1];
    *(float *)&double v12 = v7;
    double v13 = +[CLKTimeIntervalGaugeProvider gaugeProviderWithStyle:1 gaugeColors:v11 gaugeColorLocations:0 startDate:v9 startFillFraction:v10 endDate:v12 endFillFraction:0.0];
  }

  return v13;
}

- (id)_textProviderForTimeAtState:(unint64_t)a3
{
  return [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:a3 withUnknownText:&stru_CD58];
}

- (id)_newSignatureRectangularHeaderTextProvider
{
  unint64_t v2 = self->_numPausedTimers + self->_numRunningTimers;
  if (v2 == 1)
  {
    [(NTKTimerBundleTimelineEntry *)self _titleTextProvider:0];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    id v6 = NTKClockFaceLocalizedString();
    float v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v2);

    double v5 = +[CLKSimpleTextProvider textProviderWithText:v7];
  }
  else
  {
    if ([(NTKTimerBundleTimelineEntry *)self isDefaultComplication])
    {
      id v3 = NTKClockFaceLocalizedString();
      id v4 = NTKClockFaceLocalizedString();
      double v5 = +[CLKSimpleTextProvider textProviderWithText:v3 shortText:v4];
    }
    else
    {
      id v3 = NTKClockFaceLocalizedString();
      double v5 = +[CLKSimpleTextProvider textProviderWithText:v3];
    }
  }
  return v5;
}

- (id)_newSignatureRectangularBodyRelativeDateTextProvider
{
  [(NTKTimerBundleTimelineEntry *)self countdownDuration];
  unint64_t v4 = (unint64_t)v3;
  if ((unint64_t)v3 >= 0x3D)
  {
    v6.i64[0] = 0xFEDCBA987654321 * v4;
    v6.i64[1] = 0xEEEEEEEEEEEEEEEFLL * v4;
    int32x2_t v7 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)xmmword_9860, (uint64x2_t)vorrq_s8((int8x16_t)vshlq_u64(v6, (uint64x2_t)xmmword_9850), (int8x16_t)vshlq_u64(v6, (uint64x2_t)xmmword_9840))));
    uint64_t v5 = 1;
    if ((v7.i8[0] & 1) == 0 && ((v4 < 0xE11) & v7.i8[4]) == 0) {
      uint64_t v5 = 2 * (v4 > 0xE10);
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v8 = +[NSDate date];
  [(NTKTimerBundleTimelineEntry *)self countdownDuration];
  id v10 = [v8 dateByAddingTimeInterval:-v9];
  double v11 = +[CLKRelativeDateTextProvider textProviderWithDate:v10 style:v5 units:224];
  [v11 setDisableOffsetPrefix:1];
  [v11 setTwoDigitMinuteZeroPadding:1];
  [v11 setRelativeToDate:v8];
  [(NTKTimerBundleTimelineEntry *)self _updateTextProviderForAOTPaused:v11];

  return v11;
}

- (id)_titleTextProvider:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NTKTimerBundleTimelineEntry *)self title];

  if (v5)
  {
    uint64x2_t v6 = [(NTKTimerBundleTimelineEntry *)self title];
    if (v3)
    {
      int32x2_t v7 = NTKClockFaceLocalizedString();
      uint64_t v8 = +[NSString stringWithFormat:@"%@ %@", v6, v7];

      uint64x2_t v6 = (void *)v8;
    }
  }
  else
  {
    uint64x2_t v6 = NTKClockFaceLocalizedString();
  }
  double v9 = +[CLKSimpleTextProvider textProviderWithText:v6];

  return v9;
}

- (id)_textProviderForTimeAtState:(unint64_t)a3 withUnknownText:(id)a4
{
  return [(NTKTimerBundleTimelineEntry *)self _textProviderForTimeAtState:a3 withUnknownText:a4 twoDigitMinuteZeroPadding:1];
}

- (id)_textProviderForTimeAtState:(unint64_t)a3 withUnknownText:(id)a4 twoDigitMinuteZeroPadding:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      uint64_t v9 = +[CLKSimpleTextProvider textProviderWithText:v8];
      goto LABEL_9;
    case 1uLL:
      [(NTKTimerBundleTimelineEntry *)self countdownDuration];
      goto LABEL_6;
    case 2uLL:
      [(NTKTimerBundleTimelineEntry *)self remainingTime];
LABEL_6:
      double v11 = self;
      uint64_t v12 = 1;
      goto LABEL_8;
    case 3uLL:
      [(NTKTimerBundleTimelineEntry *)self remainingTime];
      double v11 = self;
      uint64_t v12 = 0;
LABEL_8:
      uint64_t v9 = -[NTKTimerBundleTimelineEntry _relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:](v11, "_relativeDateTextProviderForTimeInterval:paused:twoDigitMinuteZeroPadding:", v12, v5);
LABEL_9:
      id v10 = (void *)v9;
      break;
    default:
      id v10 = 0;
      break;
  }

  return v10;
}

- (id)_relativeDateTextProviderForTimeInterval:(double)a3 paused:(BOOL)a4 twoDigitMinuteZeroPadding:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = +[NSDate date];
  id v10 = [v9 dateByAddingTimeInterval:a3];
  double v11 = +[CLKRelativeDateTextProvider textProviderWithDate:v10 style:2 units:224];
  [v11 setPauseTimerAtZero:1];
  [v11 setTwoDigitMinuteZeroPadding:v5];
  if (v6)
  {
    [v11 setRelativeToDate:v9];
    [(NTKTimerBundleTimelineEntry *)self _updateTextProviderForAOTPaused:v11];
  }

  return v11;
}

- (CLKDevice)device
{
  return (CLKDevice *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)numPausedTimers
{
  return self->_numPausedTimers;
}

- (void)setNumPausedTimers:(unint64_t)a3
{
  self->_numPausedTimers = a3;
}

- (unint64_t)numRunningTimers
{
  return self->_numRunningTimers;
}

- (void)setNumRunningTimers:(unint64_t)a3
{
  self->_numRunningTimers = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (double)countdownDuration
{
  return self->_countdownDuration;
}

- (void)setCountdownDuration:(double)a3
{
  self->_countdownDuration = a3;
}

- (BOOL)isDefaultComplication
{
  return self->_isDefaultComplication;
}

- (void)setIsDefaultComplication:(BOOL)a3
{
  self->_isDefaultComplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)fullColorSymbolImageProviderForDevice:(id)a3 withOverridePointSize:(double)a4
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_113B0);
  id WeakRetained = objc_loadWeakRetained(&qword_113B8);
  if (WeakRetained)
  {
    int32x2_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&qword_113B8);
    if (v8 == v5)
    {
      id v9 = [v5 version];
      uint64_t v10 = qword_113C0;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&qword_113B8, v5);
  qword_113C0 = (uint64_t)[v5 version];

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  double v13 = (void *)qword_113A8;
  qword_113A8 = (uint64_t)v12;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_113B0);
  *(float *)&double v14 = a4;
  double v15 = +[NSNumber numberWithFloat:v14];
  double v16 = [(id)qword_113A8 objectForKeyedSubscript:v15];
  if (!v16)
  {
    double v16 = +[CLKFullColorSymbolImageProvider symbolImageProviderWithSystemName:@"timer"];
    [v16 setOverridePointSize:v15];
    id v17 = +[UIColor systemOrangeColor];
    [v16 setTintColor:v17];

    [(id)qword_113A8 setObject:v16 forKeyedSubscript:v15];
  }

  return v16;
}

+ (id)fullColorSymbolImageProviderForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_113D0);
  id WeakRetained = objc_loadWeakRetained(&qword_113D8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_113D8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_113D8, v3);
    qword_113E0 = (uint64_t)[v3 version];

    sub_7138();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_113E0;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_113D0);
  id v10 = (id)qword_113C8;

  return v10;
}

+ (id)symbolImageProviderForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_113F0);
  id WeakRetained = objc_loadWeakRetained(&qword_113F8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_113F8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_113F8, v3);
    qword_11400 = (uint64_t)[v3 version];

    sub_72A0();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_11400;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_113F0);
  id v10 = (id)qword_113E8;

  return v10;
}

@end