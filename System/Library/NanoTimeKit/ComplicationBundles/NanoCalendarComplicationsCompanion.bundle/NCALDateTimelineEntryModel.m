@interface NCALDateTimelineEntryModel
- (BOOL)lunar;
- (id)_graphicRectangularDateBodyTextWithDate:(id)a3 displayLunarDate:(BOOL)a4;
- (id)_graphicRectangularDateHeaderTextWithDate:(id)a3 useLunarDate:(BOOL)a4;
- (id)_newBezelTemplate;
- (id)_newCircularTemplateMedium:(BOOL)a3;
- (id)_newExtraLargeLunarTemplate;
- (id)_newExtraLargeTemplate;
- (id)_newGraphicRectangularTemplateDisplayingLunarDate:(BOOL)a3;
- (id)_newLargeUtilitarianTemplate;
- (id)_newModularLargeLunarTemplate;
- (id)_newModularLargeTemplate;
- (id)_newModularSmallLunarTemplate;
- (id)_newModularSmallTemplate;
- (id)_newSignatureCircularTemplate;
- (id)_newSignatureCornerTemplate;
- (id)_newSignatureExtraLargeCircularTemplate;
- (id)_newSimpleTextTemplate;
- (id)_newSmallFlatUtilitarianTemplate;
- (id)_simpleTextShortDateProvider;
- (id)templateForComplicationFamily:(int64_t)a3;
- (void)setLunar:(BOOL)a3;
@end

@implementation NCALDateTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v5 = OverlayCalendarLocaleID();
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  v7 = 0;
  switch(a3)
  {
    case 0:
      if (v6) {
        id v8 = [(NCALDateTimelineEntryModel *)self _newModularSmallLunarTemplate];
      }
      else {
        id v8 = [(NCALDateTimelineEntryModel *)self _newModularSmallTemplate];
      }
      goto LABEL_22;
    case 1:
      if (v6) {
        id v8 = [(NCALDateTimelineEntryModel *)self _newModularLargeLunarTemplate];
      }
      else {
        id v8 = [(NCALDateTimelineEntryModel *)self _newModularLargeTemplate];
      }
      goto LABEL_22;
    case 2:
    case 6:
      id v8 = [(NCALDateTimelineEntryModel *)self _newSmallFlatUtilitarianTemplate];
      goto LABEL_22;
    case 3:
      id v8 = [(NCALDateTimelineEntryModel *)self _newLargeUtilitarianTemplate];
      goto LABEL_22;
    case 4:
      id v8 = [(NCALDateTimelineEntryModel *)self _newCircularTemplateMedium:0];
      goto LABEL_22;
    case 7:
      if (v6) {
        id v8 = [(NCALDateTimelineEntryModel *)self _newExtraLargeLunarTemplate];
      }
      else {
        id v8 = [(NCALDateTimelineEntryModel *)self _newExtraLargeTemplate];
      }
      goto LABEL_22;
    case 8:
      id v8 = [(NCALDateTimelineEntryModel *)self _newSignatureCornerTemplate];
      goto LABEL_22;
    case 9:
      id v8 = [(NCALDateTimelineEntryModel *)self _newBezelTemplate];
      goto LABEL_22;
    case 10:
      id v8 = [(NCALDateTimelineEntryModel *)self _newSignatureCircularTemplate];
      goto LABEL_22;
    case 11:
      id v8 = [(NCALDateTimelineEntryModel *)self _newGraphicRectangularTemplateDisplayingLunarDate:v6];
      goto LABEL_22;
    case 12:
      id v8 = [(NCALDateTimelineEntryModel *)self _newSignatureExtraLargeCircularTemplate];
LABEL_22:
      v7 = v8;
      break;
    default:
      break;
  }
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    id v9 = [(NCALDateTimelineEntryModel *)self _newCircularTemplateMedium:1];
  }
  else
  {
    if (CLKComplicationFamilySimpleText != a3) {
      goto LABEL_28;
    }
    id v9 = [(NCALDateTimelineEntryModel *)self _newSimpleTextTemplate];
  }
  id v10 = v9;

  v7 = v10;
LABEL_28:
  v11 = ncs_log_complication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    int64_t v14 = a3;
    __int16 v15 = 1024;
    BOOL v16 = v7 != 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Has template for family %ld? -> %d", (uint8_t *)&v13, 0x12u);
  }

  return v7;
}

- (id)_newModularSmallTemplate
{
  v3 = [(NCALDateTimelineEntryModel *)self entryDate];
  v4 = +[CLKDateTextProvider textProviderWithDate:v3 units:512];

  [v4 setShortUnits:1];
  v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  BOOL v6 = +[CLKDateTextProvider textProviderWithDate:v5 units:16];

  v7 = +[CLKComplicationTemplateModularSmallDate templateWithWeekdayTextProvider:v4 dayTextProvider:v6];
  [v7 setHighlightMode:2];
  id v8 = +[UIColor systemRedColor];
  [v7 setTintColor:v8];

  return v7;
}

- (id)_newModularSmallLunarTemplate
{
  v3 = [(NCALDateTimelineEntryModel *)self entryDate];
  v4 = +[CLKDateTextProvider textProviderWithDate:v3 units:8];

  [v4 setShortUnits:1];
  v5 = OverlayCalendarLocaleID();
  [v4 setAlternateCalendarLocaleID:v5];

  BOOL v6 = [(NCALDateTimelineEntryModel *)self entryDate];
  v7 = +[CLKDateTextProvider textProviderWithDate:v6 units:16];

  id v8 = OverlayCalendarLocaleID();
  [v7 setAlternateCalendarLocaleID:v8];

  id v9 = +[CLKComplicationTemplateModularSmallStackText templateWithLine1TextProvider:v4 line2TextProvider:v7];
  id v10 = +[UIColor systemRedColor];
  [v9 setTintColor:v10];

  [v9 setHighlightMode:1];
  return v9;
}

- (id)_newModularLargeTemplate
{
  v2 = [(NCALDateTimelineEntryModel *)self entryDate];
  v3 = +[CLKDateTextProvider textProviderWithDate:v2 units:512];
  v4 = +[CLKDateTextProvider textProviderWithDate:v2 units:24];
  [v4 setShortUnits:1];
  [v4 setAllowsNarrowUnits:1];
  v5 = +[CLKComplicationTemplateModularLargeTallBody templateWithHeaderTextProvider:v3 bodyTextProvider:v4];
  BOOL v6 = +[UIColor systemRedColor];
  [v5 setTintColor:v6];

  return v5;
}

- (id)_newModularLargeLunarTemplate
{
  v3 = [(NCALDateTimelineEntryModel *)self entryDate];
  v4 = +[CLKDateTextProvider textProviderWithDate:v3 units:12];

  v5 = OverlayCalendarLocaleID();
  [v4 setAlternateCalendarLocaleID:v5];

  BOOL v6 = [(NCALDateTimelineEntryModel *)self entryDate];
  v7 = +[CLKDateTextProvider textProviderWithDate:v6 units:16];

  [v7 setShortUnits:1];
  id v8 = OverlayCalendarLocaleID();
  [v7 setAlternateCalendarLocaleID:v8];

  id v9 = +[CLKComplicationTemplateModularLargeTallBody templateWithHeaderTextProvider:v4 bodyTextProvider:v7];
  id v10 = +[UIColor systemRedColor];
  [v9 setTintColor:v10];

  return v9;
}

- (id)_newSmallFlatUtilitarianTemplate
{
  v2 = [(NCALDateTimelineEntryModel *)self _simpleTextShortDateProvider];
  v3 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v2];

  return v3;
}

- (id)_simpleTextShortDateProvider
{
  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v3 = OverlayCalendarLocaleID();

    if (v3) {
      uint64_t v4 = 16;
    }
    else {
      uint64_t v4 = 528;
    }
  }
  else
  {
    uint64_t v4 = 528;
  }
  v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  BOOL v6 = +[CLKDateTextProvider textProviderWithDate:v5 units:v4];

  [v6 setUppercase:1];
  [v6 setShortUnits:1];
  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v7 = OverlayCalendarLocaleID();
    [v6 setAlternateCalendarLocaleID:v7];
  }

  return v6;
}

- (id)_newSimpleTextTemplate
{
  v2 = [(NCALDateTimelineEntryModel *)self _simpleTextShortDateProvider];
  v3 = +[CLKComplicationTemplateSimpleText templateWithTextProvider:v2];

  return v3;
}

- (id)_newLargeUtilitarianTemplate
{
  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v3 = OverlayCalendarLocaleID();

    if (v3) {
      uint64_t v4 = 28;
    }
    else {
      uint64_t v4 = 536;
    }
  }
  else
  {
    uint64_t v4 = 536;
  }
  v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  BOOL v6 = +[CLKDateTextProvider textProviderWithDate:v5 units:v4];

  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v7 = OverlayCalendarLocaleID();
    [v6 setAlternateCalendarLocaleID:v7];
  }
  id v8 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v6];

  return v8;
}

- (id)_newCircularTemplateMedium:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  BOOL v6 = +[CLKDateTextProvider textProviderWithDate:v5 units:16];

  if ([(NCALDateTimelineEntryModel *)self lunar])
  {
    v7 = OverlayCalendarLocaleID();
    [v6 setAlternateCalendarLocaleID:v7];
  }
  id v8 = (id *)CLKComplicationTemplateCircularMediumSimpleText_ptr;
  if (!v3) {
    id v8 = (id *)CLKComplicationTemplateCircularSmallSimpleText_ptr;
  }
  id v9 = [*v8 templateWithTextProvider:v6];

  return v9;
}

- (id)_newExtraLargeTemplate
{
  BOOL v3 = [(NCALDateTimelineEntryModel *)self entryDate];
  uint64_t v4 = +[CLKDateTextProvider textProviderWithDate:v3 units:512];

  [v4 setShortUnits:1];
  v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  BOOL v6 = +[CLKDateTextProvider textProviderWithDate:v5 units:16];

  v7 = +[CLKComplicationTemplateExtraLargeDate templateWithWeekdayTextProvider:v4 dayTextProvider:v6];
  [v7 setHighlightMode:2];
  id v8 = +[UIColor systemRedColor];
  [v7 setTintColor:v8];

  return v7;
}

- (id)_newExtraLargeLunarTemplate
{
  BOOL v3 = [(NCALDateTimelineEntryModel *)self entryDate];
  uint64_t v4 = +[CLKDateTextProvider textProviderWithDate:v3 units:8];

  [v4 setShortUnits:1];
  v5 = OverlayCalendarLocaleID();
  [v4 setAlternateCalendarLocaleID:v5];

  BOOL v6 = [(NCALDateTimelineEntryModel *)self entryDate];
  v7 = +[CLKDateTextProvider textProviderWithDate:v6 units:16];

  id v8 = OverlayCalendarLocaleID();
  [v7 setAlternateCalendarLocaleID:v8];

  id v9 = +[CLKComplicationTemplateExtraLargeStackText templateWithLine1TextProvider:v4 line2TextProvider:v7];
  id v10 = +[UIColor systemRedColor];
  [v9 setTintColor:v10];

  [v9 setHighlightMode:1];
  return v9;
}

- (id)_newBezelTemplate
{
  id v2 = [(NCALDateTimelineEntryModel *)self _newSignatureCircularTemplate];
  BOOL v3 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v2];

  return v3;
}

- (id)_newSignatureCircularTemplate
{
  [(NCALDateTimelineEntryModel *)self lunar];
  id v2 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  BOOL v3 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v2];
  uint64_t v6 = NTKRichComplicationViewUsePlatterKey;
  v7 = &__kCFBooleanTrue;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 setMetadata:v4];

  return v3;
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  [(NCALDateTimelineEntryModel *)self lunar];
  id v2 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  BOOL v3 = +[CLKComplicationTemplateGraphicExtraLargeCircularImage templateWithImageProvider:v2];
  uint64_t v6 = NTKRichComplicationViewUsePlatterKey;
  v7 = &__kCFBooleanTrue;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 setMetadata:v4];

  return v3;
}

- (id)_newSignatureCornerTemplate
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_graphicRectangularDateHeaderTextWithDate:(id)a3 useLunarDate:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 12;
  }
  else {
    uint64_t v5 = 512;
  }
  uint64_t v6 = +[CLKDateTextProvider textProviderWithDate:a3 units:v5];
  v7 = v6;
  if (a4)
  {
    id v8 = OverlayCalendarLocaleID();
    [v7 setAlternateCalendarLocaleID:v8];
  }
  else
  {
    [v6 setAlternateCalendarLocaleID:0];
  }
  id v9 = +[UIColor systemRedColor];
  [v7 setTintColor:v9];

  return v7;
}

- (id)_graphicRectangularDateBodyTextWithDate:(id)a3 displayLunarDate:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = 24;
  }
  uint64_t v6 = +[CLKDateTextProvider textProviderWithDate:a3 units:v5];
  [v6 setShortUnits:1];
  [v6 setAllowsNarrowUnits:!v4];
  if (v4)
  {
    v7 = OverlayCalendarLocaleID();
    [v6 setAlternateCalendarLocaleID:v7];
  }
  else
  {
    [v6 setAlternateCalendarLocaleID:0];
  }

  return v6;
}

- (id)_newGraphicRectangularTemplateDisplayingLunarDate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NCALDateTimelineEntryModel *)self entryDate];
  uint64_t v6 = [(NCALDateTimelineEntryModel *)self _graphicRectangularDateHeaderTextWithDate:v5 useLunarDate:v3];
  v7 = [(NCALDateTimelineEntryModel *)self _graphicRectangularDateBodyTextWithDate:v5 displayLunarDate:v3];
  id v8 = +[CLKComplicationTemplateGraphicRectangularLargeText templateWithHeaderTextProvider:v6 bodyTextProvider:v7];

  return v8;
}

- (BOOL)lunar
{
  return self->_lunar;
}

- (void)setLunar:(BOOL)a3
{
  self->_lunar = a3;
}

@end