@interface NWCSunriseComplicationTimelineEntryModel
+ (id)_attributedDisplayNameWithLocationGlyph:(id)a3 inFont:(id)a4;
+ (id)currentEventEntryModelWithEntryAndEventDate:(id)a3 atLocation:(id)a4 withDisplayName:(id)a5 chinaShiftedLocation:(id)a6 constantSun:(int64_t)a7 animationGroup:(id)a8 device:(id)a9;
+ (id)entryModelWithEntryDate:(id)a3 eventDate:(id)a4 atLocation:(id)a5 withDisplayName:(id)a6 chinaShiftedLocation:(id)a7 constantSun:(int64_t)a8 animationGroup:(id)a9 device:(id)a10;
+ (id)placeholderEntryModelWithEntryDate:(id)a3 animationGroup:(id)a4 device:(id)a5;
- (BOOL)isConstantSunEvent;
- (BOOL)isCurrentEvent;
- (BOOL)isNormalUpcomingEvent;
- (BOOL)isSunriseEvent;
- (CLLocation)chinaShiftedLocation;
- (CLLocation)location;
- (NSDate)eventDate;
- (NSString)animationGroup;
- (NSString)locationName;
- (NWCSunriseComplicationTimelineEntryModel)initWithEntryDate:(id)a3 eventDate:(id)a4 atLocation:(id)a5 withDisplayName:(id)a6 chinaShiftedLocation:(id)a7 constantSun:(int64_t)a8 currentEvent:(BOOL)a9 animationGroup:(id)a10 device:(id)a11;
- (id)_circularTemplateIsMedium:(BOOL)a3;
- (id)_eventTimeAndCountdownAbbreviated:(BOOL)a3 suppressCountdown:(BOOL)a4 suppressCommaSeparator:(BOOL)a5;
- (id)_extraLargeTemplate;
- (id)_graphicCircularTemplate;
- (id)_graphicCornerTemplate;
- (id)_graphicExtraLargeTemplate;
- (id)_graphicRectangularTemplate;
- (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4;
- (id)_largeModularTemplate;
- (id)_largeUtilityTemplateSuppressCountdown:(BOOL)a3;
- (id)_smallModularTemplate;
- (id)_smallUtilityTemplate;
- (id)_swapPlaceholderString:(id)a3 withTimeStringForDate:(id)a4 inString:(id)a5 usingBaseFont:(id)a6 smallCapsBaseFont:(id)a7;
- (id)description;
- (id)templateForComplicationFamily:(int64_t)a3;
- (int64_t)constantSun;
@end

@implementation NWCSunriseComplicationTimelineEntryModel

+ (id)currentEventEntryModelWithEntryAndEventDate:(id)a3 atLocation:(id)a4 withDisplayName:(id)a5 chinaShiftedLocation:(id)a6 constantSun:(int64_t)a7 animationGroup:(id)a8 device:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v24) = 1;
  v22 = (void *)[objc_alloc((Class)a1) initWithEntryDate:v21 eventDate:v21 atLocation:v20 withDisplayName:v19 chinaShiftedLocation:v18 constantSun:a7 currentEvent:v24 animationGroup:v17 device:v16];

  return v22;
}

+ (id)entryModelWithEntryDate:(id)a3 eventDate:(id)a4 atLocation:(id)a5 withDisplayName:(id)a6 chinaShiftedLocation:(id)a7 constantSun:(int64_t)a8 animationGroup:(id)a9 device:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOBYTE(v26) = 0;
  uint64_t v24 = (void *)[objc_alloc((Class)a1) initWithEntryDate:v23 eventDate:v22 atLocation:v21 withDisplayName:v20 chinaShiftedLocation:v19 constantSun:a8 currentEvent:v26 animationGroup:v18 device:v17];

  return v24;
}

+ (id)placeholderEntryModelWithEntryDate:(id)a3 animationGroup:(id)a4 device:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  LOBYTE(v13) = 0;
  v11 = (void *)[objc_alloc((Class)a1) initWithEntryDate:v10 eventDate:0 atLocation:0 withDisplayName:0 chinaShiftedLocation:0 constantSun:0 currentEvent:v13 animationGroup:v9 device:v8];

  return v11;
}

- (NWCSunriseComplicationTimelineEntryModel)initWithEntryDate:(id)a3 eventDate:(id)a4 atLocation:(id)a5 withDisplayName:(id)a6 chinaShiftedLocation:(id)a7 constantSun:(int64_t)a8 currentEvent:(BOOL)a9 animationGroup:(id)a10 device:(id)a11
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a10;
  id v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)NWCSunriseComplicationTimelineEntryModel;
  id v19 = [(NWCComplicationTimelineEntryModel *)&v27 initWithEntryDate:a3];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a5);
    objc_storeStrong((id *)&v20->_locationName, a6);
    objc_storeStrong((id *)&v20->_chinaShiftedLocation, a7);
    v20->_constantSun = a8;
    v20->_currentEvent = a9;
    objc_storeStrong((id *)&v20->_eventDate, a4);
    objc_storeStrong((id *)&v20->_animationGroup, a10);
    objc_storeStrong((id *)&v20->_device, a11);
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NWCSunriseComplicationTimelineEntryModel *)self locationName];
  v6 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
  v7 = [v3 stringWithFormat:@"%@ in %@ at %@. constantSun: %ld.", v4, v5, v6, -[NWCSunriseComplicationTimelineEntryModel constantSun](self, "constantSun")];

  return v7;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v5 = (void *)qword_268BA3C08;
  uint64_t v18 = qword_268BA3C08;
  if (!qword_268BA3C08)
  {
    v6 = (void *)sub_23C354368();
    v16[3] = (uint64_t)dlsym(v6, "NTKComplicationFamilyUtilitarianLargeNarrow");
    qword_268BA3C08 = v16[3];
    v5 = (void *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v5)
  {
    v14 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  if (*v5 == a3)
  {
    v7 = self;
    uint64_t v8 = 1;
LABEL_6:
    id v9 = [(NWCSunriseComplicationTimelineEntryModel *)v7 _largeUtilityTemplateSuppressCountdown:v8];
  }
  else if (*MEMORY[0x263EFCF20] == a3)
  {
    id v10 = self;
    uint64_t v11 = 1;
LABEL_9:
    id v9 = [(NWCSunriseComplicationTimelineEntryModel *)v10 _circularTemplateIsMedium:v11];
  }
  else
  {
    switch(a3)
    {
      case 0:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _smallModularTemplate];
        break;
      case 1:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _largeModularTemplate];
        break;
      case 2:
      case 6:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _smallUtilityTemplate];
        break;
      case 3:
        v7 = self;
        uint64_t v8 = 0;
        goto LABEL_6;
      case 4:
        id v10 = self;
        uint64_t v11 = 0;
        goto LABEL_9;
      case 7:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _extraLargeTemplate];
        break;
      case 8:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _graphicCornerTemplate];
        break;
      case 10:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _graphicCircularTemplate];
        break;
      case 11:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _graphicRectangularTemplate];
        break;
      case 12:
        id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _graphicExtraLargeTemplate];
        break;
      default:
        uint64_t v13 = NTALogForCategory(6uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_23C35D304(a3, v13);
        }

        id v9 = 0;
        break;
    }
  }

  return v9;
}

- (id)_eventTimeAndCountdownAbbreviated:(BOOL)a3 suppressCountdown:(BOOL)a4 suppressCommaSeparator:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    id v10 = [MEMORY[0x263EFD228] textProviderWithDate:v9];
    if (a4) {
      goto LABEL_20;
    }
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isCurrentEvent])
    {
      uint64_t v11 = (void *)MEMORY[0x263EFD208];
      v12 = NWCComplicationLocalizedString(@"COUNTDOWN_NOW", @"Now", 0);
      uint64_t v13 = [v11 textProviderWithText:v12];
    }
    else
    {
      if (v7) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v13 = [MEMORY[0x263EFD1E8] textProviderWithDate:v9 style:v19 units:96];
    }
    if (v5) {
      id v20 = @"%@ %@";
    }
    else {
      id v20 = @"%@, %@";
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFD218], "textProviderWithFormat:", v20, v10, v13);

    id v10 = (void *)v21;
  }
  else if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      v14 = @"SUNRISE_SUNUP";
    }
    else {
      v14 = @"SUNRISE_SUNDOWN";
    }
    id v9 = NWCComplicationLocalizedString(v14, @"up down", 0);
    uint64_t v15 = (void *)MEMORY[0x263EFD208];
    uint64_t v13 = [MEMORY[0x263EFF960] currentLocale];
    id v16 = [v9 uppercaseStringWithLocale:v13];
    id v10 = [v15 textProviderWithText:v16];
  }
  else
  {
    uint64_t v17 = NWCComplicationLocalizedString(@"SUNRISE_SUNRISE_SUNSET", @"Sunrise/Sunset", 0);
    id v9 = [v17 localizedUppercaseString];

    uint64_t v18 = NWCComplicationLocalizedString(@"SUNRISE_SUNRISE_SUNSET_SHORT", @"Sunrise/set", 0);
    uint64_t v13 = [v18 localizedUppercaseString];

    id v10 = [MEMORY[0x263EFD208] textProviderWithText:v9 shortText:v13];
  }

LABEL_20:

  return v10;
}

- (id)_swapPlaceholderString:(id)a3 withTimeStringForDate:(id)a4 inString:(id)a5 usingBaseFont:(id)a6 smallCapsBaseFont:(id)a7
{
  v42[1] = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [a7 CLKFontWithLocalizedSmallCaps];
  id v16 = (void *)MEMORY[0x263F086A0];
  uint64_t v41 = *MEMORY[0x263EFCF68];
  uint64_t v17 = v41;
  v42[0] = MEMORY[0x263EFFA88];
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  uint64_t v19 = [v16 NTKTimeWithDate:v13 andDesignatorAttributes:v18 timeZone:0 options:0];

  id v20 = (void *)[v19 mutableCopy];
  [v20 beginEditing];
  uint64_t v21 = [v20 length];
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  v34 = sub_23C35518C;
  v35 = &unk_264E3D830;
  id v22 = v20;
  id v36 = v22;
  id v23 = v15;
  id v37 = v23;
  id v24 = v11;
  id v38 = v24;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v21, 0x100000, &v32);
  objc_msgSend(v22, "endEditing", v32, v33, v34, v35);
  uint64_t v25 = [v12 rangeOfString:v14];
  uint64_t v27 = v26;

  id v28 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v39 = *MEMORY[0x263F1C238];
  id v40 = v24;
  v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v30 = (void *)[v28 initWithString:v12 attributes:v29];

  if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v30, "replaceCharactersInRange:withAttributedString:", v25, v27, v22);
  }

  return v30;
}

- (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(CLKDevice *)self->_device isRunningGloryGMOrLater] & 1) != 0
    || (NWCPreGloryComplicationImageNamed(v7), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v9 = (void *)v8,
        [MEMORY[0x263EFD1D0] imageProviderWithOnePieceImage:v8],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    id v10 = [MEMORY[0x263EFD210] symbolImageProviderWithSystemName:v6];
  }

  return v10;
}

- (id)_largeModularTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    v3 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      uint64_t v4 = @"SUNRISE_SUNRISE";
    }
    else {
      uint64_t v4 = @"SUNRISE_SUNSET";
    }
    BOOL v5 = NWCComplicationLocalizedString(v4, @"Sunrise | Sunset", 0);
    id v6 = [v5 stringByAppendingFormat:@" %@", @"%@"];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = sub_23C3557FC;
    v43[3] = &unk_264E3D858;
    v43[4] = self;
    v44 = @"%@";
    id v7 = v3;
    id v45 = v7;
    uint64_t v8 = (void *)MEMORY[0x23ECE2850](v43);
    id v9 = [sub_23C3558C0() textProviderWithText:v6 overrideBlock:v8];
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isCurrentEvent])
    {
      id v10 = (void *)MEMORY[0x263EFD208];
      id v11 = NWCComplicationLocalizedString(@"COUNTDOWN_NOW", @"Now", 0);
      id v12 = [v10 textProviderWithText:v11];
    }
    else
    {
      id v12 = [MEMORY[0x263EFD1E8] textProviderWithDate:v7 style:0 units:96];
    }
  }
  else
  {
    BOOL v13 = [(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent];
    id v14 = NWCComplicationLocalizedString(@"SUNRISE_SUNRISE_SUNSET", @"Sunrise/Sunset", 0);
    id v9 = [MEMORY[0x263EFD208] textProviderWithText:v14];
    if (v13)
    {
      id v12 = [(NWCSunriseComplicationTimelineEntryModel *)self location];

      if (v12)
      {
        if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
          uint64_t v15 = @"SUNRISE_SUNUP";
        }
        else {
          uint64_t v15 = @"SUNRISE_SUNDOWN";
        }
        id v16 = NWCComplicationLocalizedString(v15, @"no event", 0);
        id v12 = [MEMORY[0x263EFD208] textProviderWithText:v16];
      }
    }
    else
    {
      id v12 = [MEMORY[0x263EFD208] textProviderWithText:@" "];
    }
  }
  uint64_t v17 = [(NWCSunriseComplicationTimelineEntryModel *)self locationName];
  if ([(__CFString *)v17 length])
  {
    uint64_t v18 = (void *)MEMORY[0x263EFD208];
    uint64_t v19 = v17;
LABEL_19:
    id v20 = [v18 textProviderWithText:v19];
    goto LABEL_22;
  }
  uint64_t v21 = [(NWCSunriseComplicationTimelineEntryModel *)self location];

  if (!v21)
  {
    uint64_t v18 = (void *)MEMORY[0x263EFD208];
    uint64_t v19 = @" ";
    goto LABEL_19;
  }
  uint64_t v22 = NWCComplicationLocalizedString(@"SUNRISE_UNKNOWN_LOCATION_FORMAT", @"unknown location format", 0);
  id v23 = [(NWCSunriseComplicationTimelineEntryModel *)self location];
  v42 = sub_23C3559A4(v23);

  id v24 = NSString;
  uint64_t v25 = sub_23C355AD0();
  uint64_t v26 = [v42 objectForKeyedSubscript:v25];
  uint64_t v27 = sub_23C355BD8();
  id v28 = [v42 objectForKeyedSubscript:v27];
  id v40 = (void *)v22;
  uint64_t v41 = objc_msgSend(v24, "localizedStringWithFormat:", v22, v26, v28);

  v29 = [(NWCSunriseComplicationTimelineEntryModel *)self location];
  v30 = sub_23C355CE0(v29);

  v31 = NSString;
  uint64_t v32 = sub_23C355AD0();
  uint64_t v33 = [v30 objectForKeyedSubscript:v32];
  v34 = sub_23C355BD8();
  v35 = [v30 objectForKeyedSubscript:v34];
  id v36 = objc_msgSend(v31, "localizedStringWithFormat:", v22, v33, v35);

  id v20 = [MEMORY[0x263EFD208] textProviderWithText:v41 shortText:v36];

LABEL_22:
  [v20 setItalicized:1];
  id v37 = [MEMORY[0x263EFD0F8] templateWithHeaderTextProvider:v9 body1TextProvider:v12 body2TextProvider:v20];
  id v38 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v37 setTintColor:v38];

  return v37;
}

- (id)_smallModularTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v4 = @"sunset.fill";
    if (v3) {
      uint64_t v4 = @"sunrise.fill";
    }
    BOOL v5 = v4;
    BOOL v6 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v7 = @"modularSunset";
    if (v6) {
      id v7 = @"modularSunrise";
    }
    uint64_t v8 = v7;
    id v9 = (void *)MEMORY[0x263EFD228];
    id v10 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    id v11 = [v9 textProviderWithDate:v10];

    [v11 setDisallowBothMinutesAndDesignator:1];
  }
  else if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v12 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    BOOL v13 = @"sunset.fill";
    if (v12) {
      BOOL v13 = @"sunrise.fill";
    }
    BOOL v5 = v13;
    BOOL v14 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v15 = @"modularSunset";
    if (v14) {
      uint64_t v15 = @"modularSunrise";
    }
    uint64_t v8 = v15;
    id v16 = (void *)MEMORY[0x263EFD208];
    uint64_t v17 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    id v11 = [v16 textProviderWithText:v17];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x263EFD208];
    uint64_t v19 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    id v11 = [v18 textProviderWithText:v19];

    BOOL v5 = @"sunrise.fill";
    uint64_t v8 = @"modularSunrise";
  }
  id v20 = [(NWCSunriseComplicationTimelineEntryModel *)self _imageProviderForImageSymbolName:v5 imageAssetNamePrefix:v8];
  uint64_t v21 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v20 setTintColor:v21];

  uint64_t v22 = [MEMORY[0x263EFD128] templateWithLine1ImageProvider:v20 line2TextProvider:v11];
  id v23 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v22 setTintColor:v23];

  return v22;
}

- (id)_largeUtilityTemplateSuppressCountdown:(BOOL)a3
{
  uint64_t v4 = [(NWCSunriseComplicationTimelineEntryModel *)self _eventTimeAndCountdownAbbreviated:0 suppressCountdown:a3 suppressCommaSeparator:1];
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v5 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    BOOL v6 = @"sunset.fill";
    if (v5) {
      BOOL v6 = @"sunrise.fill";
    }
    id v7 = v6;
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      uint64_t v8 = @"analogSunrise";
    }
    else {
      uint64_t v8 = @"analogSunset";
    }
    id v9 = [(NWCSunriseComplicationTimelineEntryModel *)self _imageProviderForImageSymbolName:v7 imageAssetNamePrefix:v8];

    id v10 = [MEMORY[0x263F1C550] systemOrangeColor];
    [v9 setTintColor:v10];
  }
  else
  {
    id v9 = 0;
  }
  id v11 = [MEMORY[0x263EFD138] templateWithTextProvider:v4 imageProvider:v9];

  return v11;
}

- (id)_circularTemplateIsMedium:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    BOOL v5 = @"victoryNTK";
  }
  else {
    BOOL v5 = @"colorAnalog";
  }
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v6 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v7 = @"sunset.fill";
    if (v6) {
      id v7 = @"sunrise.fill";
    }
    uint64_t v8 = v7;
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      id v9 = @"Sunrise";
    }
    else {
      id v9 = @"Sunset";
    }
    id v10 = [(__CFString *)v5 stringByAppendingString:v9];
    id v11 = (void *)MEMORY[0x263EFD228];
    BOOL v12 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    BOOL v13 = [v11 textProviderWithDate:v12];

    [v13 setDisallowBothMinutesAndDesignator:1];
    [v13 setPrefersDesignatorToMinutes:1];
  }
  else if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v14 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v15 = @"sunset.fill";
    if (v14) {
      uint64_t v15 = @"sunrise.fill";
    }
    uint64_t v8 = v15;
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      id v16 = @"Sunrise";
    }
    else {
      id v16 = @"Sunset";
    }
    id v10 = [(__CFString *)v5 stringByAppendingString:v16];
    uint64_t v17 = (void *)MEMORY[0x263EFD208];
    uint64_t v18 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    BOOL v13 = [v17 textProviderWithText:v18];
  }
  else
  {
    id v10 = [(__CFString *)v5 stringByAppendingString:@"SunriseSunset"];
    uint64_t v19 = (void *)MEMORY[0x263EFD208];
    id v20 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    BOOL v13 = [v19 textProviderWithText:v20];

    uint64_t v8 = @"sun.and.horizon.fill";
  }
  uint64_t v21 = [(NWCSunriseComplicationTimelineEntryModel *)self _imageProviderForImageSymbolName:v8 imageAssetNamePrefix:v10];
  uint64_t v22 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v21 setTintColor:v22];

  id v23 = (id *)0x263EFCFB0;
  if (!v3) {
    id v23 = (id *)0x263EFCFD8;
  }
  id v24 = [*v23 templateWithLine1ImageProvider:v21 line2TextProvider:v13];

  return v24;
}

- (id)_smallUtilityTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v4 = @"sunset.fill";
    if (v3) {
      uint64_t v4 = @"sunrise.fill";
    }
    BOOL v5 = v4;
    BOOL v6 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v7 = @"analogSunset";
    if (v6) {
      id v7 = @"analogSunrise";
    }
    uint64_t v8 = v7;
    id v9 = (void *)MEMORY[0x263EFD228];
    id v10 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    uint64_t v11 = [v9 textProviderWithDate:v10];
LABEL_13:
    uint64_t v17 = (void *)v11;
    goto LABEL_15;
  }
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v12 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    BOOL v13 = @"sunset.fill";
    if (v12) {
      BOOL v13 = @"sunrise.fill";
    }
    BOOL v5 = v13;
    BOOL v14 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v15 = @"analogSunset";
    if (v14) {
      uint64_t v15 = @"analogSunrise";
    }
    uint64_t v8 = v15;
    id v16 = (void *)MEMORY[0x263EFD208];
    id v10 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    uint64_t v11 = [v16 textProviderWithText:v10];
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x263EFD208];
  id v10 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
  uint64_t v17 = [v18 textProviderWithText:v10];
  BOOL v5 = @"sun.and.horizon.fill";
  uint64_t v8 = @"analogSunriseSunset";
LABEL_15:

  uint64_t v19 = [(NWCSunriseComplicationTimelineEntryModel *)self _imageProviderForImageSymbolName:v5 imageAssetNamePrefix:v8];
  id v20 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v19 setTintColor:v20];

  uint64_t v21 = [MEMORY[0x263EFD148] templateWithTextProvider:v17 imageProvider:v19];

  return v21;
}

- (id)_graphicCircularTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v4 = @"sunset.fill";
    if (v3) {
      uint64_t v4 = @"sunrise.fill";
    }
    BOOL v5 = v4;
    BOOL v6 = (void *)MEMORY[0x263EFD228];
    id v7 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    uint64_t v8 = [v6 textProviderWithDate:v7];
LABEL_9:
    BOOL v12 = (void *)v8;
    goto LABEL_11;
  }
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v9 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v10 = @"sunset.fill";
    if (v9) {
      id v10 = @"sunrise.fill";
    }
    BOOL v5 = v10;
    uint64_t v11 = (void *)MEMORY[0x263EFD208];
    id v7 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    uint64_t v8 = [v11 textProviderWithText:v7];
    goto LABEL_9;
  }
  BOOL v13 = (void *)MEMORY[0x263EFD208];
  id v7 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
  BOOL v12 = [v13 textProviderWithText:v7];
  BOOL v5 = @"sun.and.horizon.fill";
LABEL_11:

  BOOL v14 = [MEMORY[0x263EFD1B0] symbolImageProviderWithSystemName:v5];
  uint64_t v15 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v14 setTintColor:v15];

  id v16 = [MEMORY[0x263EFD058] templateWithLine1ImageProvider:v14 line2TextProvider:v12];

  return v16;
}

- (id)_extraLargeTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v4 = @"sunset.fill";
    if (v3) {
      uint64_t v4 = @"sunrise.fill";
    }
    BOOL v5 = v4;
    BOOL v6 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v7 = @"XLmodularSunset";
    if (v6) {
      id v7 = @"XLmodularSunrise";
    }
    uint64_t v8 = v7;
    BOOL v9 = (void *)MEMORY[0x263EFD228];
    id v10 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    uint64_t v11 = [v9 textProviderWithDate:v10];
LABEL_13:
    uint64_t v17 = (void *)v11;
    goto LABEL_15;
  }
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v12 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    BOOL v13 = @"sunset.fill";
    if (v12) {
      BOOL v13 = @"sunrise.fill";
    }
    BOOL v5 = v13;
    BOOL v14 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v15 = @"XLmodularSunset";
    if (v14) {
      uint64_t v15 = @"XLmodularSunrise";
    }
    uint64_t v8 = v15;
    id v16 = (void *)MEMORY[0x263EFD208];
    id v10 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    uint64_t v11 = [v16 textProviderWithText:v10];
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x263EFD208];
  id v10 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
  uint64_t v17 = [v18 textProviderWithText:v10];
  BOOL v5 = @"sunrise.fill";
  uint64_t v8 = @"XLmodularSunrise";
LABEL_15:

  uint64_t v19 = [(NWCSunriseComplicationTimelineEntryModel *)self _imageProviderForImageSymbolName:v5 imageAssetNamePrefix:v8];
  id v20 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v19 setTintColor:v20];

  uint64_t v21 = [MEMORY[0x263EFD000] templateWithLine1ImageProvider:v19 line2TextProvider:v17];

  return v21;
}

- (id)_graphicExtraLargeTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    uint64_t v4 = @"sunset.fill";
    if (v3) {
      uint64_t v4 = @"sunrise.fill";
    }
    BOOL v5 = v4;
    BOOL v6 = (void *)MEMORY[0x263EFD228];
    id v7 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    uint64_t v8 = [v6 textProviderWithDate:v7];
LABEL_9:
    BOOL v12 = (void *)v8;
    goto LABEL_11;
  }
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v9 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    id v10 = @"sunset.fill";
    if (v9) {
      id v10 = @"sunrise.fill";
    }
    BOOL v5 = v10;
    uint64_t v11 = (void *)MEMORY[0x263EFD208];
    id v7 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
    uint64_t v8 = [v11 textProviderWithText:v7];
    goto LABEL_9;
  }
  BOOL v13 = (void *)MEMORY[0x263EFD208];
  id v7 = NWCComplicationLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒", 0);
  BOOL v12 = [v13 textProviderWithText:v7];
  BOOL v5 = @"sunrise.fill";
LABEL_11:

  BOOL v14 = [MEMORY[0x263EFD1B0] symbolImageProviderWithSystemName:v5];
  uint64_t v15 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v14 setTintColor:v15];

  id v16 = [MEMORY[0x263EFD0D0] templateWithLine1ImageProvider:v14 line2TextProvider:v12];

  return v16;
}

- (id)_graphicCornerTemplate
{
  BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self _eventTimeAndCountdownAbbreviated:1 suppressCountdown:0 suppressCommaSeparator:0];
  uint64_t v4 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v3 setTintColor:v4];

  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent]
    || [(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent])
  {
    BOOL v5 = [(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent];
    BOOL v6 = @"sunset.fill";
    if (v5) {
      BOOL v6 = @"sunrise.fill";
    }
    id v7 = v6;
  }
  else
  {
    id v7 = @"sun.and.horizon.fill";
  }
  uint64_t v8 = [MEMORY[0x263EFD1B0] symbolImageProviderWithSystemName:v7];
  BOOL v9 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v8 setTintColor:v9];

  id v10 = [MEMORY[0x263EFD098] templateWithTextProvider:v3 imageProvider:v8];

  return v10;
}

- (id)_graphicRectangularTemplate
{
  if ([(NWCSunriseComplicationTimelineEntryModel *)self isNormalUpcomingEvent])
  {
    BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      uint64_t v4 = @"SUNRISE_SUNRISE";
    }
    else {
      uint64_t v4 = @"SUNRISE_SUNSET";
    }
    BOOL v5 = NWCComplicationLocalizedString(v4, @"Sunrise | Sunset", 0);
    BOOL v6 = [v5 stringByAppendingFormat:@" %@", @"%@"];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = sub_23C357298;
    v51[3] = &unk_264E3D858;
    v51[4] = self;
    v52 = @"%@";
    id v7 = v3;
    id v53 = v7;
    uint64_t v8 = (void *)MEMORY[0x23ECE2850](v51);
    BOOL v9 = [sub_23C3558C0() textProviderWithText:v6 overrideBlock:v8];

    if ([(NWCSunriseComplicationTimelineEntryModel *)self isCurrentEvent])
    {
      id v10 = (void *)MEMORY[0x263EFD208];
      uint64_t v11 = NWCComplicationLocalizedString(@"COUNTDOWN_NOW", @"Now", 0);
      BOOL v12 = [v10 textProviderWithText:v11];

LABEL_15:
      goto LABEL_17;
    }
    uint64_t v17 = [MEMORY[0x263EFD1E8] textProviderWithDate:v7 style:0 units:96];
LABEL_14:
    BOOL v12 = (void *)v17;
    goto LABEL_15;
  }
  BOOL v13 = [(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent];
  BOOL v14 = NWCComplicationLocalizedString(@"SUNRISE_SUNRISE_SUNSET", @"Sunrise/Sunset", 0);
  BOOL v9 = [MEMORY[0x263EFD208] textProviderWithText:v14];
  uint64_t v15 = [MEMORY[0x263F1C550] systemOrangeColor];
  [v9 setTintColor:v15];

  if (v13)
  {
    BOOL v12 = [(NWCSunriseComplicationTimelineEntryModel *)self location];

    if (!v12) {
      goto LABEL_17;
    }
    if ([(NWCSunriseComplicationTimelineEntryModel *)self isSunriseEvent]) {
      id v16 = @"SUNRISE_SUNUP";
    }
    else {
      id v16 = @"SUNRISE_SUNDOWN";
    }
    NWCComplicationLocalizedString(v16, @"no event", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [MEMORY[0x263EFD208] textProviderWithText:v7];
    goto LABEL_14;
  }
  BOOL v12 = [MEMORY[0x263EFD208] textProviderWithText:@" "];
LABEL_17:
  uint64_t v18 = [(NWCSunriseComplicationTimelineEntryModel *)self locationName];
  if ([v18 length])
  {
    uint64_t v19 = [MEMORY[0x263EFD208] textProviderWithText:v18];
    id v20 = [MEMORY[0x263F1C550] grayColor];
    [v19 setTintColor:v20];

    goto LABEL_29;
  }
  uint64_t v21 = [(NWCSunriseComplicationTimelineEntryModel *)self location];

  if (!v21)
  {
    uint64_t v19 = [MEMORY[0x263EFD208] textProviderWithText:@" "];
    goto LABEL_29;
  }
  uint64_t v22 = [(NWCSunriseComplicationTimelineEntryModel *)self location];
  int v23 = NWCShouldChinaShiftCoordinates(v22);

  v47 = v9;
  if (v23)
  {
    id v24 = [(NWCSunriseComplicationTimelineEntryModel *)self chinaShiftedLocation];

    uint64_t v25 = NTALogForCategory(6uLL);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (!v24)
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C352000, v25, OS_LOG_TYPE_DEFAULT, "Intentionally not displaying the location coordinates (shifted or actual) for this China regulatory case. Shifted coordinates must not be done (asynchronously) calculating yet.", buf, 2u);
      }

      id v28 = 0;
      goto LABEL_28;
    }
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C352000, v25, OS_LOG_TYPE_DEFAULT, "Displaying shifted location coordinates for this China regulatory case.", buf, 2u);
    }

    uint64_t v27 = [(NWCSunriseComplicationTimelineEntryModel *)self chinaShiftedLocation];
  }
  else
  {
    uint64_t v27 = [(NWCSunriseComplicationTimelineEntryModel *)self location];
  }
  id v28 = (void *)v27;
LABEL_28:
  v49 = v28;
  uint64_t v29 = NWCComplicationLocalizedString(@"SUNRISE_UNKNOWN_LOCATION_FORMAT", @"unknown location format", 0);
  v48 = sub_23C3559A4(v28);
  v30 = NSString;
  v31 = sub_23C355AD0();
  uint64_t v32 = [v48 objectForKeyedSubscript:v31];
  uint64_t v33 = sub_23C355BD8();
  v34 = [v48 objectForKeyedSubscript:v33];
  v46 = objc_msgSend(v30, "localizedStringWithFormat:", v29, v32, v34);

  v35 = [(NWCSunriseComplicationTimelineEntryModel *)self location];
  id v36 = sub_23C355CE0(v35);

  id v37 = NSString;
  id v38 = sub_23C355AD0();
  uint64_t v39 = [v36 objectForKeyedSubscript:v38];
  id v40 = sub_23C355BD8();
  uint64_t v41 = [v36 objectForKeyedSubscript:v40];
  v42 = (void *)v29;
  v43 = objc_msgSend(v37, "localizedStringWithFormat:", v29, v39, v41);

  uint64_t v19 = [MEMORY[0x263EFD208] textProviderWithText:v46 shortText:v43];

  BOOL v9 = v47;
LABEL_29:

  v44 = [MEMORY[0x263EFD0F0] templateWithHeaderTextProvider:v9 body1TextProvider:v12 body2TextProvider:v19];

  return v44;
}

+ (id)_attributedDisplayNameWithLocationGlyph:(id)a3 inFont:(id)a4
{
  id v5 = a4;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_23C357580;
  uint64_t v18 = &unk_264E3D880;
  id v19 = v5;
  uint64_t v6 = qword_268BA3C00;
  id v7 = v5;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_268BA3C00, &block);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F1C370]);
  [v9 setImage:qword_268BA3BF8];
  id v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v9];
  uint64_t v11 = [NSString stringWithFormat:@" %@", v8, block, v16, v17, v18];

  BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v11];
  [v12 insertAttributedString:v10 atIndex:0];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C220], &unk_26EFF7128, 0, 1);
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C238], v7, 0, objc_msgSend(v12, "length"));
  BOOL v13 = (void *)[v12 copy];

  return v13;
}

- (BOOL)isNormalUpcomingEvent
{
  BOOL v3 = [(NWCSunriseComplicationTimelineEntryModel *)self eventDate];
  if (v3) {
    BOOL v4 = ![(NWCSunriseComplicationTimelineEntryModel *)self isConstantSunEvent];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isConstantSunEvent
{
  return [(NWCSunriseComplicationTimelineEntryModel *)self constantSun] != 0;
}

- (BOOL)isSunriseEvent
{
  return objc_opt_isKindOfClass() & 1;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (CLLocation)chinaShiftedLocation
{
  return self->_chinaShiftedLocation;
}

- (int64_t)constantSun
{
  return self->_constantSun;
}

- (BOOL)isCurrentEvent
{
  return self->_currentEvent;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (NSString)animationGroup
{
  return self->_animationGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationGroup, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_chinaShiftedLocation, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end