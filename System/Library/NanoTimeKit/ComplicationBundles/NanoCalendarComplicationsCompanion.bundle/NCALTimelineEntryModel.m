@interface NCALTimelineEntryModel
+ (id)_entryForTemplateDescription:(id)a3 family:(int64_t)a4;
+ (id)_extraLargeCalendarImageProviderWithConflicts:(BOOL)a3;
+ (id)_graphicCircularImageProviderWithConflicts:(BOOL)a3;
+ (id)_graphicExtraLargeImageProviderWithConflicts:(BOOL)a3;
+ (id)_graphicStackTextProvider:(id)a3;
+ (id)_modularSmallCalendarImageWithConflicts:(BOOL)a3;
+ (id)_signatureCornerImageProvider;
+ (id)_swapPlaceholderString:(id)a3 withTimeStringForDate:(id)a4 inString:(id)a5 usingBaseFont:(id)a6 smallCapsBaseFont:(id)a7 timeZone:(id)a8 options:(unint64_t)a9;
+ (id)_utilityCalendarImageProvider;
+ (id)circular:(id)a3 isMedium:(BOOL)a4;
+ (id)contentForLargeModular:(id)a3;
+ (id)contentForSignatureRectangular:(id)a3;
+ (id)eventStartDateTextProvider:(id)a3;
+ (id)extraLarge:(id)a3;
+ (id)graphicCircular:(id)a3;
+ (id)graphicExtraLarge:(id)a3;
+ (id)largeModular:(id)a3;
+ (id)largeUtility:(id)a3;
+ (id)loadingEntryForFamily:(int64_t)a3;
+ (id)lockedEntryForFamily:(int64_t)a3;
+ (id)sampleEventTemplateForFamily:(int64_t)a3;
+ (id)signatureBezel:(id)a3;
+ (id)signatureCircular:(id)a3;
+ (id)signatureCorner:(id)a3;
+ (id)signatureRectangular:(id)a3;
+ (id)smallModular:(id)a3;
+ (id)smallUtility:(id)a3;
+ (id)wrappedUserStringFrom:(id)a3;
- (BOOL)displayAsConflicting;
- (BOOL)displayAsFirstInDay;
- (BOOL)displayAsTomorrow;
- (BOOL)displayEntryDateInGraphicCircularView;
- (BOOL)overlappingDates;
- (NSArray)eventColors;
- (NSDate)eventEndDate;
- (NSDate)eventStartDate;
- (NSString)identifier;
- (NSString)primaryEventLocation;
- (NSString)primaryEventOrganizerName;
- (NSString)primaryEventTitle;
- (NSString)secondaryEventTitle;
- (NSURL)launchURL;
- (id)_wrappedPrimaryEventLocation;
- (id)_wrappedPrimaryEventOrganizerName;
- (id)_wrappedPrimaryEventTitle;
- (id)_wrappedSecondaryEventTitle;
- (id)description;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)eventsInDayCount;
- (unint64_t)overlappingEventCount;
- (void)setDisplayAsConflicting:(BOOL)a3;
- (void)setDisplayAsFirstInDay:(BOOL)a3;
- (void)setDisplayAsTomorrow:(BOOL)a3;
- (void)setDisplayEntryDateInGraphicCircularView:(BOOL)a3;
- (void)setEventColors:(id)a3;
- (void)setEventEndDate:(id)a3;
- (void)setEventStartDate:(id)a3;
- (void)setEventsInDayCount:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setOverlappingDates:(BOOL)a3;
- (void)setOverlappingEventCount:(unint64_t)a3;
- (void)setPrimaryEventLocation:(id)a3;
- (void)setPrimaryEventOrganizerName:(id)a3;
- (void)setPrimaryEventTitle:(id)a3;
- (void)setSecondaryEventTitle:(id)a3;
@end

@implementation NCALTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  if (NTKComplicationFamilyUtilitarianLargeNarrow == a3)
  {
LABEL_2:
    uint64_t v4 = [(id)objc_opt_class() largeUtility:self];
LABEL_6:
    v8 = (void *)v4;
    goto LABEL_7;
  }
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    v5 = objc_opt_class();
    v6 = self;
    uint64_t v7 = 1;
LABEL_5:
    uint64_t v4 = [v5 circular:v6 isMedium:v7];
    goto LABEL_6;
  }
  v8 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v4 = [(id)objc_opt_class() smallModular:self];
      goto LABEL_6;
    case 1:
      uint64_t v4 = [(id)objc_opt_class() largeModular:self];
      goto LABEL_6;
    case 2:
    case 6:
      uint64_t v4 = [(id)objc_opt_class() smallUtility:self];
      goto LABEL_6;
    case 3:
      goto LABEL_2;
    case 4:
      v5 = objc_opt_class();
      v6 = self;
      uint64_t v7 = 0;
      goto LABEL_5;
    case 7:
      uint64_t v4 = [(id)objc_opt_class() extraLarge:self];
      goto LABEL_6;
    case 8:
      uint64_t v4 = [(id)objc_opt_class() signatureCorner:self];
      goto LABEL_6;
    case 9:
      uint64_t v4 = [(id)objc_opt_class() signatureBezel:self];
      goto LABEL_6;
    case 10:
      uint64_t v4 = [(id)objc_opt_class() graphicCircular:self];
      goto LABEL_6;
    case 11:
      uint64_t v4 = [(id)objc_opt_class() signatureRectangular:self];
      goto LABEL_6;
    case 12:
      uint64_t v4 = [(id)objc_opt_class() graphicExtraLarge:self];
      goto LABEL_6;
    default:
      break;
  }
LABEL_7:
  [v8 finalize];

  return v8;
}

+ (id)largeModular:(id)a3
{
  id v4 = a3;
  v5 = [a1 contentForLargeModular:v4];
  v6 = [v5 firstObject];
  if ((unint64_t)[v5 count] < 2) {
    +[CLKSimpleTextProvider textProviderWithText:&stru_20EE0];
  }
  else {
  uint64_t v7 = [v5 objectAtIndexedSubscript:1];
  }
  if ((unint64_t)[v5 count] < 3)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v5 objectAtIndexedSubscript:2];
  }
  v9 = +[UIImage systemImageNamed:@"exclamationmark.circle"];
  v10 = (char *)[v4 overlappingEventCount];
  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    v11 = +[CLKComplicationTemplateModularLargeStandardBody templateWithHeaderTextProvider:v6 body1TextProvider:v7 body2TextProvider:v8];
    if (![v4 displayAsConflicting]) {
      goto LABEL_18;
    }
    v12 = +[CLKImageProvider imageProviderWithOnePieceImage:v9];
    [v11 setBody1ImageProvider:v12];
  }
  else
  {
    if (!v10)
    {
      v11 = +[CLKComplicationTemplateModularLargeStandardBody templateWithHeaderTextProvider:v6 body1TextProvider:v7];
      goto LABEL_18;
    }
    v12 = NCALComplicationLocalizedString(@"NEXTEVENT_N_COINCIDENT_EVENTS_LINE_ITEM_LARGE_MODULAR");
    v13 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v12];
    if (!v8)
    {
      v8 = +[CLKSimpleTextProvider textProviderWithText:&stru_20EE0];
    }
    v11 = +[CLKComplicationTemplateModularLargeTable templateWithHeaderTextProvider:v6 row1Column1TextProvider:v13 row1Column2TextProvider:v7 row2Column1TextProvider:v13 row2Column2TextProvider:v8];
    [v11 setUseNoColumnPadding:1];
    if ([v4 displayAsConflicting])
    {
      v14 = +[CLKImageProvider imageProviderWithOnePieceImage:v9];
      [v11 setHeaderImageProvider:v14];
    }
  }

LABEL_18:
  v15 = +[UIColor systemRedColor];
  [v11 setTintColor:v15];

  return v11;
}

+ (id)contentForLargeModular:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 overlappingEventCount];
  v5 = v4 - 1;
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v9 = [v3 eventStartDate];
    v10 = [v3 eventEndDate];
    v11 = +[NSTimeZone calendarTimeZone];
    v12 = +[CLKTimeIntervalTextProvider finalizedTextProviderWithStartDate:v9 endDate:v10 timeZone:v11];

    v13 = [v3 _wrappedPrimaryEventTitle];
    v14 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v13];

    v15 = [v3 _wrappedPrimaryEventLocation];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v3 _wrappedPrimaryEventOrganizerName];
    }
    v28 = v17;

    if ([v28 length])
    {
      v27 = +[NTKOverrideTextProvider textProviderWithText:v28 overrideBlock:&stru_20B98];
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v6 = v4;
    if (v4)
    {
      v18 = [v3 eventStartDate];
      if (NTKHourOfDateIsSingular()) {
        CFStringRef v19 = @"SINGULAR";
      }
      else {
        CFStringRef v19 = @"PLURAL";
      }
      v20 = [@"NEXTEVENT_N_COINCIDENT_EVENTS_AT_TIME_LARGE_MODULAR_" stringByAppendingString:v19];
      v21 = NCALComplicationLocalizedString(v20);
      v22 = +[NSString localizedStringWithFormat:v21, v6, @"<ATTRIB_TIME_PLACEHOLD>"];

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_ACDC;
      v33[3] = &unk_20BC0;
      id v23 = v18;
      id v34 = v23;
      v12 = +[NTKOverrideTextProvider textProviderWithText:v22 overrideBlock:v33];
      v24 = [v3 _wrappedPrimaryEventTitle];
      v14 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v24];

      if (v6 == (unsigned char *)&dword_0 + 2)
      {
        v25 = [v3 _wrappedSecondaryEventTitle];
      }
      else
      {
        v26 = NCALComplicationLocalizedString(@"NEXTEVENT_N_MORE_ELLIPSIS_LARGE_MODULAR");
        v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v5);
      }
      v27 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v25];
    }
    else
    {
      uint64_t v7 = NCALComplicationLocalizedString(@"NEXTEVENT_NEXT_EVENT_TITLE_LARGE_MODULAR");
      if ([v3 displayAsTomorrow])
      {
        v8 = @"NEXTEVENT_NO_EVENTS_TOMORROW_LARGE_MODULAR";
      }
      else if ([v3 displayAsFirstInDay])
      {
        v8 = @"NEXTEVENT_NO_EVENTS_TODAY_LARGE_MODULAR";
      }
      else
      {
        v8 = @"NEXTEVENT_NO_EVENTS_LEFT_TODAY_LARGE_MODULAR";
      }
      v29 = NCALComplicationLocalizedString(v8);
      v12 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v7];
      v14 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v29];

      v27 = 0;
    }
  }
  v30 = +[NSMutableArray arrayWithCapacity:3];
  v31 = v30;
  if (v12) {
    [v30 addObject:v12];
  }
  if (v14) {
    [v31 addObject:v14];
  }
  if (v27) {
    [v31 addObject:v27];
  }

  return v31;
}

+ (id)contentForSignatureRectangular:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 overlappingEventCount];
  v5 = v4 - 1;
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v13 = [v3 eventStartDate];
    v14 = [v3 eventEndDate];
    v15 = +[NSTimeZone calendarTimeZone];
    v10 = +[CLKTimeIntervalTextProvider finalizedTextProviderWithStartDate:v13 endDate:v14 timeZone:v15];

    v16 = [v3 _wrappedPrimaryEventTitle];
    v11 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v16];

    id v17 = [v3 _wrappedPrimaryEventLocation];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [v3 _wrappedPrimaryEventOrganizerName];
    }
    uint64_t v7 = v19;

    if (![v7 length])
    {
      v12 = 0;
      goto LABEL_30;
    }
    uint64_t v32 = +[NTKOverrideTextProvider textProviderWithText:v7 overrideBlock:&stru_20BE0];
LABEL_22:
    v12 = (void *)v32;
    goto LABEL_30;
  }
  v6 = v4;
  if (v4)
  {
    if ([v3 overlappingDates])
    {
      v20 = [v3 eventStartDate];
      v21 = [v3 eventEndDate];
      v22 = +[NSTimeZone calendarTimeZone];
      v10 = +[CLKTimeIntervalTextProvider finalizedTextProviderWithStartDate:v20 endDate:v21 timeZone:v22];
    }
    else
    {
      v20 = [v3 eventStartDate];
      v10 = +[CLKTimeTextProvider textProviderWithDate:v20];
    }

    v30 = [v3 _wrappedPrimaryEventTitle];
    v11 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v30];

    if (v6 == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v7 = [v3 _wrappedSecondaryEventTitle];
    }
    else
    {
      v31 = NCALComplicationLocalizedFormat(@"NEXTEVENT_N_MORE_EVENTS_SIGNATURE_RECTANGULAR");
      uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v5);
    }
    uint64_t v32 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v7];
    goto LABEL_22;
  }
  if ([v3 displayAsTomorrow])
  {
    uint64_t v7 = NCALComplicationLocalizedString(@"NEXTEVENT_NEXT_EVENT_TOMORROW_TITLE_SIGNATURE_RECTANGULAR");
    v8 = NCALComplicationLocalizedString(@"NEXTEVENT_NO_EVENTS_TOMORROW_SUBTITLE_SIGNATURE_RECTANGULAR");
    v9 = 0;
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    id v23 = +[NSBundle mainBundle];
    v24 = [v23 preferredLocalizations];
    v25 = [v24 firstObject];
    v26 = +[NSLocale localeWithLocaleIdentifier:v25];

    v27 = [v3 entryDate];
    v28 = +[NTKComplicationDateFormatter stringForDate:v27 withStyle:32];
    uint64_t v7 = [v28 uppercaseStringWithLocale:v26];

    v9 = NCALComplicationLocalizedString(@"NEXTEVENT_NO_EVENT_SUBTITLE_SIGNATURE_RECTANGULAR");
    if ([v3 displayAsFirstInDay]) {
      v29 = @"NEXTEVENT_NO_EVENTS_TODAY_SIGNATURE_RECTANGULAR";
    }
    else {
      v29 = @"NEXTEVENT_NO_EVENTS_LEFT_TODAY_SIGNATURE_RECTANGULAR";
    }
    v8 = NCALComplicationLocalizedString(v29);

    if (v7)
    {
LABEL_5:
      v10 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v7];
      if (v8) {
        goto LABEL_6;
      }
LABEL_27:
      v11 = 0;
      if (v9) {
        goto LABEL_7;
      }
LABEL_28:
      v12 = 0;
      goto LABEL_29;
    }
  }
  v10 = 0;
  if (!v8) {
    goto LABEL_27;
  }
LABEL_6:
  v11 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v8];
  if (!v9) {
    goto LABEL_28;
  }
LABEL_7:
  v12 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v9];
LABEL_29:

LABEL_30:
  v33 = +[NSMutableArray arrayWithCapacity:3];
  id v34 = v33;
  if (v10) {
    [v33 addObject:v10];
  }
  if (v11) {
    [v34 addObject:v11];
  }
  if (v12) {
    [v34 addObject:v12];
  }

  return v34;
}

+ (id)_swapPlaceholderString:(id)a3 withTimeStringForDate:(id)a4 inString:(id)a5 usingBaseFont:(id)a6 smallCapsBaseFont:(id)a7 timeZone:(id)a8 options:(unint64_t)a9
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [a7 CLKFontWithLocalizedSmallCaps];
  uint64_t v18 = CLKTimeDesignatorAttribute;
  uint64_t v43 = CLKTimeDesignatorAttribute;
  v44 = &__kCFBooleanTrue;
  id v19 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v20 = +[NSTimeZone calendarTimeZone];
  v21 = +[NSAttributedString NTKTimeWithDate:v15 andDesignatorAttributes:v19 timeZone:v20 options:0];

  id v22 = [v21 mutableCopy];
  [v22 beginEditing];
  id v23 = [v22 length];
  id v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  v36 = sub_B6B4;
  v37 = &unk_20C08;
  id v24 = v22;
  id v38 = v24;
  id v25 = v17;
  id v39 = v25;
  id v26 = v13;
  id v40 = v26;
  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v23, 0x100000, &v34);
  objc_msgSend(v24, "endEditing", v34, v35, v36, v37);
  id v27 = [v14 rangeOfString:v16];
  uint64_t v29 = v28;

  id v30 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v41 = NSFontAttributeName;
  id v42 = v26;
  v31 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v32 = [v30 initWithString:v14 attributes:v31];

  if (v27 != (id)0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v32, "replaceCharactersInRange:withAttributedString:", v27, v29, v24);
  }

  return v32;
}

+ (id)smallUtility:(id)a3
{
  id v3 = a3;
  id v4 = [v3 overlappingEventCount];
  if ([v3 displayAsConflicting])
  {
    v5 = 0;
  }
  else
  {
    v5 = NCALComplicationImageNamed(@"analogNextEventCalendarBackground");
  }
  if ([v3 displayAsConflicting])
  {
    v6 = 0;
  }
  else
  {
    v6 = NCALComplicationImageNamed(@"analogNextEventCalendarForeground");
  }
  if ([v3 displayAsConflicting]) {
    uint64_t v7 = @"analogNextEventCoincidentAlertGlyph";
  }
  else {
    uint64_t v7 = @"analogNextEventCalendar";
  }
  v8 = NCALComplicationImageNamed(v7);
  if ([v3 displayAsConflicting]) {
    +[UIColor whiteColor];
  }
  else {
  v9 = +[UIColor systemRedColor];
  }
  v10 = +[CLKImageProvider imageProviderWithOnePieceImage:v8 twoPieceImageBackground:v5 twoPieceImageForeground:v6];
  [v10 setTintColor:v9];
  if (v4)
  {
    v11 = [v3 eventStartDate];
    v12 = +[NSTimeZone calendarTimeZone];
    id v13 = +[CLKTimeTextProvider textProviderWithDate:v11 timeZone:v12];
  }
  else
  {
    v11 = NCALComplicationLocalizedString(@"NEXTEVENT_NONE_SHORT_UTILITY");
    id v13 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v11];
  }

  id v14 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v13 imageProvider:v10];

  return v14;
}

+ (id)_modularSmallCalendarImageWithConflicts:(BOOL)a3
{
  if (a3) {
    id v3 = @"graphicSmallCalendarConflict";
  }
  else {
    id v3 = @"graphicCalendar";
  }
  if (a3) {
    id v4 = @"graphicSmallCalendarConflictNoAccent";
  }
  else {
    id v4 = @"graphicCalendarNoAccent";
  }
  if (a3) {
    v5 = @"graphicSmallCalendarConflictAccent";
  }
  else {
    v5 = @"graphicCalendarAccent";
  }
  v6 = v5;
  uint64_t v7 = v4;
  v8 = NCALComplicationImageNamed(v3);
  v9 = NCALComplicationImageNamed(v6);

  v10 = NCALComplicationImageNamed(v7);

  v11 = +[CLKImageProvider imageProviderWithOnePieceImage:v8 twoPieceImageBackground:v9 twoPieceImageForeground:v10];

  v12 = +[UIColor systemRedColor];
  [v11 setTintColor:v12];

  return v11;
}

+ (id)_extraLargeCalendarImageProviderWithConflicts:(BOOL)a3
{
  if (a3) {
    id v3 = @"XLgraphicSmallCalendarConflict";
  }
  else {
    id v3 = @"XLgraphicCalendar";
  }
  if (a3) {
    id v4 = @"XLgraphicSmallCalendarConflictNoAccent";
  }
  else {
    id v4 = @"XLgraphicCalendarNoAccent";
  }
  if (a3) {
    v5 = @"XLgraphicSmallCalendarConflictAccent";
  }
  else {
    v5 = @"XLgraphicCalendarAccent";
  }
  v6 = v5;
  uint64_t v7 = v4;
  v8 = NCALComplicationImageNamed(v3);
  v9 = NCALComplicationImageNamed(v6);

  v10 = NCALComplicationImageNamed(v7);

  v11 = +[CLKImageProvider imageProviderWithOnePieceImage:v8 twoPieceImageBackground:v9 twoPieceImageForeground:v10];

  v12 = +[UIColor systemRedColor];
  [v11 setTintColor:v12];

  return v11;
}

+ (id)_utilityCalendarImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28428);
  id WeakRetained = objc_loadWeakRetained(&qword_28430);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = +[CLKRenderingContext sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&qword_28430);
    if (v5 == v6)
    {
      uint64_t v7 = +[CLKRenderingContext sharedRenderingContext];
      v8 = [v7 device];
      id v9 = [v8 version];
      uint64_t v10 = qword_28438;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = +[CLKRenderingContext sharedRenderingContext];
  v12 = [v11 device];
  objc_storeWeak(&qword_28430, v12);

  id v13 = objc_loadWeakRetained(&qword_28430);
  qword_28438 = (uint64_t)[v13 version];

  id v14 = +[CLKRenderingContext sharedRenderingContext];
  id v15 = [v14 device];
  sub_BD48();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28428);
  id v16 = (void *)qword_28420;

  return v16;
}

+ (id)smallModular:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overlappingEventCount];
  id v6 = objc_msgSend(a1, "_modularSmallCalendarImageWithConflicts:", objc_msgSend(v4, "displayAsConflicting"));
  if (v5)
  {
    uint64_t v7 = [v4 eventStartDate];
    [a1 eventStartDateTextProvider:v7];
  }
  else
  {
    uint64_t v7 = NCALComplicationLocalizedString(@"NEXTEVENT_NONE_SHORT_UTILITY");
    +[CLKSimpleTextProvider finalizedTextProviderWithText:v7];
  v8 = };

  id v9 = +[CLKComplicationTemplateModularSmallStackImage templateWithLine1ImageProvider:v6 line2TextProvider:v8];
  uint64_t v10 = +[UIColor systemRedColor];
  [v9 setTintColor:v10];

  return v9;
}

+ (id)largeUtility:(id)a3
{
  id v3 = a3;
  id v4 = NCALComplicationImageNamed(@"analogNextEventCoincidentAlertGlyph");
  id v5 = (char *)[v3 overlappingEventCount];
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    v8 = [v3 eventStartDate];
    id v9 = +[NSTimeZone calendarTimeZone];
    uint64_t v10 = +[CLKTimeTextProvider textProviderWithDate:v8 timeZone:v9];

    [v10 setPrefersDesignatorToMinutes:1];
    v11 = [v3 _wrappedPrimaryEventTitle];
    if (v11)
    {
      v12 = [v3 _wrappedPrimaryEventTitle];
      id v13 = +[NSLocale currentLocale];
      id v14 = [v12 uppercaseStringWithLocale:v13];
    }
    else
    {
      id v14 = &stru_20EE0;
    }

    id v24 = +[CLKSimpleTextProvider textProviderWithText:v14];
    v21 = +[CLKTextProvider textProviderWithFormat:@"%@ %@", v10, v24];
    if ([v3 displayAsConflicting])
    {
      id v22 = +[CLKImageProvider imageProviderWithOnePieceImage:v4];
      id v25 = +[UIColor whiteColor];
      [v22 setTintColor:v25];
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v6 = v5;
    if (v5)
    {
      id v15 = [v3 eventStartDate];
      if (NTKHourOfDateIsSingular()) {
        CFStringRef v16 = @"SINGULAR";
      }
      else {
        CFStringRef v16 = @"PLURAL";
      }
      id v17 = [@"NEXTEVENT_N_COINCIDENT_EVENTS_AT_TIME_LONG_UTILITY_" stringByAppendingString:v16];
      uint64_t v18 = NCALComplicationLocalizedString(v17);
      id v19 = +[NSString localizedStringWithFormat:v18, v6, @"<ATTRIB_TIME_PLACEHOLD>"];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_C334;
      v29[3] = &unk_20BC0;
      id v20 = v15;
      id v30 = v20;
      v21 = +[NTKOverrideTextProvider textProviderWithText:v19 overrideBlock:v29];
      [v21 finalize];
      if ([v3 displayAsConflicting])
      {
        id v22 = +[CLKImageProvider imageProviderWithOnePieceImage:v4];
        id v23 = +[UIColor whiteColor];
        [v22 setTintColor:v23];
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      if ([v3 displayAsTomorrow])
      {
        uint64_t v7 = @"NEXTEVENT_NO_EVENTS_TOMORROW_LONG_UTILITY";
      }
      else if ([v3 displayAsFirstInDay])
      {
        uint64_t v7 = @"NEXTEVENT_NO_EVENTS_TODAY_LONG_UTILITY";
      }
      else
      {
        uint64_t v7 = @"NEXTEVENT_NO_EVENTS_LEFT_TODAY_LONG_UTILITY";
      }
      id v26 = NCALComplicationLocalizedString(v7);
      v21 = +[CLKSimpleTextProvider textProviderWithText:v26];

      [v21 finalize];
      id v22 = 0;
    }
  }
  id v27 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v21 imageProvider:v22];

  return v27;
}

+ (id)circular:(id)a3 isMedium:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 overlappingEventCount])
  {
    uint64_t v7 = @"analog";
    if (v4)
    {
      uint64_t v7 = @"victory";
      v8 = (id *)CLKComplicationTemplateCircularMediumStackImage_ptr;
    }
    else
    {
      v8 = (id *)CLKComplicationTemplateCircularSmallStackImage_ptr;
    }
    id v9 = v7;
    if ([v6 displayAsConflicting]) {
      CFStringRef v10 = @"NextEventCoincidentAlertGlyph";
    }
    else {
      CFStringRef v10 = @"NextEventCalendar";
    }
    v11 = [(__CFString *)v9 stringByAppendingString:v10];

    v12 = NCALComplicationImageNamed(v11);

    id v13 = +[CLKImageProvider imageProviderWithOnePieceImage:v12];
    id v14 = [v6 eventStartDate];
    id v15 = [a1 eventStartDateTextProvider:v14];

    CFStringRef v16 = [*v8 templateWithLine1ImageProvider:v13 line2TextProvider:v15];
  }
  else
  {
    if (v4) {
      id v17 = @"victoryCalendarNone";
    }
    else {
      id v17 = @"colorAnalogCalendarNoContent";
    }
    if (v4) {
      uint64_t v18 = (id *)CLKComplicationTemplateCircularMediumSimpleImage_ptr;
    }
    else {
      uint64_t v18 = (id *)CLKComplicationTemplateCircularSmallSimpleImage_ptr;
    }
    id v19 = NCALComplicationImageNamed(v17);
    v12 = +[CLKImageProvider imageProviderWithOnePieceImage:v19];

    CFStringRef v16 = [*v18 templateWithImageProvider:v12];
  }

  return v16;
}

+ (id)extraLarge:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_extraLargeCalendarImageProviderWithConflicts:", objc_msgSend(v4, "displayAsConflicting"));
  id v6 = [a1 _graphicStackTextProvider:v4];

  uint64_t v7 = +[CLKComplicationTemplateExtraLargeStackImage templateWithLine1ImageProvider:v5 line2TextProvider:v6];
  v8 = +[UIColor systemRedColor];
  [v7 setTintColor:v8];

  return v7;
}

+ (id)_graphicStackTextProvider:(id)a3
{
  id v4 = a3;
  if ([v4 overlappingEventCount])
  {
    id v5 = [v4 eventStartDate];
    [a1 eventStartDateTextProvider:v5];
  }
  else
  {
    id v5 = NCALComplicationLocalizedString(@"NEXTEVENT_NONE_SHORT_UTILITY");
    +[CLKSimpleTextProvider finalizedTextProviderWithText:v5];
  id v6 = };

  return v6;
}

+ (id)eventStartDateTextProvider:(id)a3
{
  id v3 = a3;
  id v4 = +[NSTimeZone calendarTimeZone];
  id v5 = +[CLKTimeTextProvider textProviderWithDate:v3 timeZone:v4];

  id v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = [v6 components:64 fromDate:v3];

  if (![v7 minute]) {
    [v5 setDisallowBothMinutesAndDesignator:1];
  }
  [v5 setPrefersDesignatorToMinutes:1];
  [v5 finalize];

  return v5;
}

+ (id)graphicExtraLarge:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_graphicExtraLargeImageProviderWithConflicts:", objc_msgSend(v4, "displayAsConflicting"));
  id v6 = [a1 _graphicStackTextProvider:v4];

  uint64_t v7 = +[CLKComplicationTemplateGraphicExtraLargeCircularStackImage templateWithLine1ImageProvider:v5 line2TextProvider:v6];

  return v7;
}

+ (id)_graphicExtraLargeImageProviderWithConflicts:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v5 = @"XLgraphicSmallCalendarConflict";
  }
  else {
    id v5 = @"XLgraphicCalendar";
  }
  id v6 = NCALComplicationImageNamed(v5);
  uint64_t v7 = +[UIColor systemRedColor];
  v8 = [v6 imageWithTintColor:v7];

  id v9 = [a1 _extraLargeCalendarImageProviderWithConflicts:v3];
  CFStringRef v10 = +[CLKFullColorImageProvider providerWithFullColorImage:v8 tintedImageProvider:v9];

  return v10;
}

+ (id)graphicCircular:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_graphicCircularImageProviderWithConflicts:", objc_msgSend(v4, "displayAsConflicting"));
  id v6 = [a1 _graphicStackTextProvider:v4];

  uint64_t v7 = +[CLKComplicationTemplateGraphicCircularStackImage templateWithLine1ImageProvider:v5 line2TextProvider:v6];

  uint64_t v10 = NTKRichComplicationViewUsePlatterKey;
  v11 = &__kCFBooleanTrue;
  v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 setMetadata:v8];

  return v7;
}

+ (id)_graphicCircularImageProviderWithConflicts:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v5 = @"graphicSmallCalendarConflict";
  }
  else {
    id v5 = @"graphicCalendar";
  }
  id v6 = NCALComplicationImageNamed(v5);
  uint64_t v7 = +[UIColor systemRedColor];
  v8 = [v6 imageWithTintColor:v7];

  id v9 = [a1 _modularSmallCalendarImageWithConflicts:v3];
  uint64_t v10 = +[CLKFullColorImageProvider providerWithFullColorImage:v8 tintedImageProvider:v9];

  return v10;
}

+ (id)signatureBezel:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 overlappingEventCount];
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = [v4 _wrappedPrimaryEventTitle];
    uint64_t v10 = +[CLKSimpleTextProvider textProviderWithText:v9];

    v11 = [v4 eventStartDate];
    v12 = +[NSTimeZone calendarTimeZone];
    id v13 = +[CLKTimeTextProvider textProviderWithDate:v11 timeZone:v12];

    [v13 setPrefersDesignatorToMinutes:1];
    [v13 finalize];
    id v14 = [v4 _wrappedPrimaryEventLocation];
    if (v14
      || ([v4 _wrappedPrimaryEventOrganizerName],
          (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = +[CLKSimpleTextProvider textProviderWithText:v14];
      CFStringRef v16 = NCALComplicationLocalizedString(@"CALENDAR_BEZEL_FORMAT");
      v8 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v16, v13, v10, v15);
    }
    else
    {
      id v14 = NCALComplicationLocalizedString(@"CALENDAR_BEZEL_FORMAT_NO_SUBTITLE");
      v8 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v14, v13, v10);
    }
  }
  else
  {
    id v6 = v5;
    if (!v5)
    {
      uint64_t v7 = NCALComplicationLocalizedString(@"CALENDAR_BEZEL_NO_EVENTS_TODAY");
      v8 = +[CLKSimpleTextProvider textProviderWithText:v7];

      goto LABEL_13;
    }
    id v17 = [v4 eventStartDate];
    if (NTKHourOfDateIsSingular()) {
      CFStringRef v18 = @"SINGULAR";
    }
    else {
      CFStringRef v18 = @"PLURAL";
    }
    uint64_t v10 = [@"NEXTEVENT_N_COINCIDENT_EVENTS_AT_TIME_LONG_UTILITY_" stringByAppendingString:v18];
    id v19 = NCALComplicationLocalizedString(v10);
    id v20 = +[NSString localizedStringWithFormat:v19, v6, @"<ATTRIB_TIME_PLACEHOLD>"];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_CEE0;
    v25[3] = &unk_20BC0;
    id v26 = v17;
    id v21 = v17;
    v8 = +[NTKOverrideTextProvider textProviderWithText:v20 overrideBlock:v25];
  }
LABEL_13:
  id v22 = [a1 signatureCircular:v4];
  id v23 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v22 textProvider:v8];

  return v23;
}

+ (id)signatureCircular:(id)a3
{
  id v3 = a3;
  id v4 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  if (v3 && [v3 displayEntryDateInGraphicCircularView])
  {
    id v9 = NCALDateComplicationOverrideMetadataKey;
    id v5 = [v3 entryDate];
    uint64_t v10 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v4 setMetadata:v6];
  }
  uint64_t v7 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v4];

  return v7;
}

+ (id)signatureCorner:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 overlappingEventCount];
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    if (NTKLanguageIsTallScript())
    {
      uint64_t v7 = [v4 eventStartDate];
      id v9 = [v4 eventEndDate];
      uint64_t v10 = +[NSTimeZone calendarTimeZone];
      v8 = +[CLKTimeIntervalTextProvider finalizedTextProviderWithStartDate:v7 endDate:v9 timeZone:v10];

      goto LABEL_6;
    }
    CFStringRef v16 = [v4 eventStartDate];
    v8 = +[CLKTimeTextProvider textProviderWithDate:v16];

    v12 = [v4 _wrappedPrimaryEventTitle];
    id v13 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v12];
  }
  else
  {
    id v6 = v5;
    if (!v5)
    {
      uint64_t v7 = NCALComplicationLocalizedString(@"NEXTEVENT_NO_EVENTS_SIGNATURE_CORNER");
      v8 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v7];
LABEL_6:

      goto LABEL_11;
    }
    v11 = NCALComplicationLocalizedFormat(@"NEXTEVENT_CONFLICT_SIGNATURE_CORNER");
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v6);

    id v13 = +[CLKSimpleTextProvider finalizedTextProviderWithText:v12];
    id v14 = [v4 eventStartDate];
    id v15 = +[NSTimeZone calendarTimeZone];
    v8 = +[CLKTimeTextProvider textProviderWithDate:v14 timeZone:v15];
  }
  if (v13)
  {
    id v17 = +[UIColor systemRedColor];
    [v13 setTintColor:v17];

    CFStringRef v18 = +[UIColor whiteColor];
    [v8 setTintColor:v18];

    uint64_t v19 = +[CLKComplicationTemplateGraphicCornerStackText templateWithInnerTextProvider:v13 outerTextProvider:v8];
    goto LABEL_12;
  }
LABEL_11:
  id v20 = +[UIColor systemRedColor];
  [v8 setTintColor:v20];

  id v13 = [a1 _signatureCornerImageProvider];
  uint64_t v19 = +[CLKComplicationTemplateGraphicCornerTextImage templateWithTextProvider:v8 imageProvider:v13];
LABEL_12:
  id v21 = (void *)v19;

  return v21;
}

+ (id)_signatureCornerImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28448);
  id WeakRetained = objc_loadWeakRetained(&qword_28450);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = +[CLKRenderingContext sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&qword_28450);
    if (v5 == v6)
    {
      uint64_t v7 = +[CLKRenderingContext sharedRenderingContext];
      v8 = [v7 device];
      id v9 = [v8 version];
      uint64_t v10 = qword_28458;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v11 = +[CLKRenderingContext sharedRenderingContext];
  v12 = [v11 device];
  objc_storeWeak(&qword_28450, v12);

  id v13 = objc_loadWeakRetained(&qword_28450);
  qword_28458 = (uint64_t)[v13 version];

  id v14 = +[CLKRenderingContext sharedRenderingContext];
  id v15 = [v14 device];
  sub_D568();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28448);
  CFStringRef v16 = (void *)qword_28440;

  return v16;
}

+ (id)signatureRectangular:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [a1 contentForSignatureRectangular:v4];
  if ([v6 count])
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    [v5 setObject:v7 forKeyedSubscript:@"NanoCalendarRichComplicationRectangularViewFirstTextKey"];
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    v8 = [v6 objectAtIndexedSubscript:1];
    [v5 setObject:v8 forKeyedSubscript:@"NanoCalendarRichComplicationRectangularViewSecondTextKey"];
  }
  if ((unint64_t)[v6 count] >= 3)
  {
    id v9 = [v6 objectAtIndexedSubscript:2];
    [v5 setObject:v9 forKeyedSubscript:@"NanoCalendarRichComplicationRectangularViewThirdTextKey"];
  }
  uint64_t v10 = [v4 eventColors];
  [v5 setObject:v10 forKeyedSubscript:@"NanoCalendarRichComplicationRectangularEventColorsKey"];

  v11 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  [v11 setMetadata:v5];
  v12 = +[CLKComplicationTemplateGraphicRectangularFullImage templateWithImageProvider:v11];

  return v12;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)NCALTimelineEntryModel;
  id v3 = [(NCALTimelineEntryModel *)&v13 description];
  id v4 = [(NCALTimelineEntryModel *)self identifier];
  id v5 = [(NCALTimelineEntryModel *)self entryDate];
  id v6 = [(NCALTimelineEntryModel *)self primaryEventTitle];
  uint64_t v7 = [(NCALTimelineEntryModel *)self primaryEventLocation];
  v8 = [(NCALTimelineEntryModel *)self secondaryEventTitle];
  id v9 = [(NCALTimelineEntryModel *)self eventStartDate];
  uint64_t v10 = [(NCALTimelineEntryModel *)self eventEndDate];
  v11 = +[NSString stringWithFormat:@"%@ identifier: %@ entryDate %@ title 1 %@ location %@ title 2 %@ startDate %@ endDate %@", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

+ (id)wrappedUserStringFrom:(id)a3
{
  id v3 = [a3 stringByAppendingString:@"⁩"];
  id v4 = [@"⁨" stringByAppendingString:v3];

  return v4;
}

- (id)_wrappedPrimaryEventTitle
{
  id v3 = [(NCALTimelineEntryModel *)self primaryEventTitle];

  if (v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(NCALTimelineEntryModel *)self primaryEventTitle];
    id v6 = [v4 wrappedUserStringFrom:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_wrappedSecondaryEventTitle
{
  id v3 = [(NCALTimelineEntryModel *)self secondaryEventTitle];

  if (v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(NCALTimelineEntryModel *)self secondaryEventTitle];
    id v6 = [v4 wrappedUserStringFrom:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_wrappedPrimaryEventLocation
{
  id v3 = [(NCALTimelineEntryModel *)self primaryEventLocation];

  if (v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(NCALTimelineEntryModel *)self primaryEventLocation];
    id v6 = [v4 wrappedUserStringFrom:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_wrappedPrimaryEventOrganizerName
{
  id v3 = [(NCALTimelineEntryModel *)self primaryEventOrganizerName];

  if (v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(NCALTimelineEntryModel *)self primaryEventOrganizerName];
    id v6 = [v4 wrappedUserStringFrom:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)lockedEntryForFamily:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28468);
  id WeakRetained = objc_loadWeakRetained(&qword_28470);
  p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSObject + 48);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    v8 = +[CLKRenderingContext sharedRenderingContext];
    id v9 = [v8 device];
    id v10 = objc_loadWeakRetained(&qword_28470);
    if (v9 == v10)
    {
      v11 = +[CLKRenderingContext sharedRenderingContext];
      v12 = [v11 device];
      id v13 = [v12 version];
      uint64_t v14 = qword_28478;

      p_opt_class_meths = &OBJC_PROTOCOL___NSObject.opt_class_meths;
      if (v13 == (id)v14) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v15 = +[CLKRenderingContext sharedRenderingContext];
  CFStringRef v16 = [v15 device];
  objc_storeWeak(&qword_28470, v16);

  id v17 = objc_loadWeakRetained(&qword_28470);
  p_opt_class_meths[143] = (__objc2_meth_list *)[v17 version];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_DDA8;
  v22[3] = &unk_20C28;
  v22[4] = a1;
  CFStringRef v18 = +[CLKRenderingContext sharedRenderingContext];
  uint64_t v19 = [v18 device];
  ((void (*)(void *, void *))sub_DDA8)(v22, v19);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28468);
  id v20 = [a1 _entryForTemplateDescription:qword_28460 family:a3];

  return v20;
}

+ (id)loadingEntryForFamily:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28488);
  id WeakRetained = objc_loadWeakRetained(&qword_28490);
  p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSObject + 48);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    v8 = +[CLKRenderingContext sharedRenderingContext];
    id v9 = [v8 device];
    id v10 = objc_loadWeakRetained(&qword_28490);
    if (v9 == v10)
    {
      v11 = +[CLKRenderingContext sharedRenderingContext];
      v12 = [v11 device];
      id v13 = [v12 version];
      uint64_t v14 = qword_28498;

      p_opt_class_meths = &OBJC_PROTOCOL___NSObject.opt_class_meths;
      if (v13 == (id)v14) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v15 = +[CLKRenderingContext sharedRenderingContext];
  CFStringRef v16 = [v15 device];
  objc_storeWeak(&qword_28490, v16);

  id v17 = objc_loadWeakRetained(&qword_28490);
  p_opt_class_meths[147] = (__objc2_meth_list *)[v17 version];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_E3C4;
  v22[3] = &unk_20C28;
  v22[4] = a1;
  CFStringRef v18 = +[CLKRenderingContext sharedRenderingContext];
  uint64_t v19 = [v18 device];
  ((void (*)(void *, void *))sub_E3C4)(v22, v19);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28488);
  id v20 = [a1 _entryForTemplateDescription:qword_28480 family:a3];

  return v20;
}

+ (id)_entryForTemplateDescription:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v8 = +[NSDate date];
  [v7 setDate:v8];

  if (NTKComplicationFamilyUtilitarianLargeNarrow == a4)
  {
    id v9 = [v6 utilityLarge];
    uint64_t v10 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v9];
  }
  else
  {
    if (CLKComplicationFamilyCircularMedium != a4)
    {
      uint64_t v14 = 0;
      switch(a4)
      {
        case 0:
          uint64_t v19 = CLKComplicationTemplateModularSmallStackImage;
          id v9 = [v6 modularSmallTop];
          uint64_t v20 = [v6 modularSmallBottom];
          goto LABEL_28;
        case 1:
          id v9 = [v6 modularLargeHeader];
          id v21 = [v6 modularLargeFirst];
          uint64_t v22 = +[CLKComplicationTemplateModularLargeStandardBody templateWithHeaderTextProvider:v9 body1TextProvider:v21];
          goto LABEL_29;
        case 2:
        case 6:
          id v17 = CLKComplicationTemplateUtilitarianSmallFlat;
          uint64_t v18 = [v6 utilitySmall];
          goto LABEL_19;
        case 3:
          id v17 = CLKComplicationTemplateUtilitarianLargeFlat;
          uint64_t v18 = [v6 utilityLarge];
LABEL_19:
          id v9 = (void *)v18;
          id v21 = [v6 utilityImageProvider];
          uint64_t v22 = [v17 templateWithTextProvider:v9 imageProvider:v21];
          goto LABEL_29;
        case 4:
          v11 = CLKComplicationTemplateCircularSmallSimpleImage;
          uint64_t v12 = [v6 circularSmallImage];
          goto LABEL_5;
        case 7:
          uint64_t v19 = CLKComplicationTemplateExtraLargeStackImage;
          uint64_t v23 = [v6 extraLargeTop];
          goto LABEL_27;
        case 8:
          id v24 = [v6 signatureCornerTextProvider];
          id v25 = [a1 _signatureCornerImageProvider];
          uint64_t v14 = +[CLKComplicationTemplateGraphicCornerTextImage templateWithTextProvider:v24 imageProvider:v25];

          goto LABEL_9;
        case 9:
          id v9 = [a1 signatureCircular:0];
          id v21 = [v6 signatureBezel];
          uint64_t v22 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v9 textProvider:v21];
          goto LABEL_29;
        case 10:
          uint64_t v19 = CLKComplicationTemplateGraphicCircularStackImage;
          uint64_t v23 = [a1 _graphicCircularImageProviderWithConflicts:0];
          goto LABEL_27;
        case 11:
          id v9 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
          v32[0] = @"NanoCalendarRichComplicationRectangularViewFirstTextKey";
          id v26 = [v6 modularLargeHeader];
          v33[0] = v26;
          v32[1] = @"NanoCalendarRichComplicationRectangularViewSecondTextKey";
          id v27 = [v6 modularLargeFirst];
          v33[1] = v27;
          v32[2] = @"NanoCalendarRichComplicationRectangularEventColorsKey";
          uint64_t v28 = +[UIColor whiteColor];
          v31 = v28;
          uint64_t v29 = +[NSArray arrayWithObjects:&v31 count:1];
          v33[2] = v29;
          id v30 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
          [v9 setMetadata:v30];

          id v13 = CLKComplicationTemplateGraphicRectangularFullImage;
          goto LABEL_6;
        case 12:
          uint64_t v19 = CLKComplicationTemplateGraphicExtraLargeCircularStackImage;
          uint64_t v23 = [v6 graphicExtraLargeTop];
LABEL_27:
          id v9 = (void *)v23;
          uint64_t v20 = [v6 graphicStackTimeText];
LABEL_28:
          id v21 = (void *)v20;
          uint64_t v22 = [v19 templateWithLine1ImageProvider:v9 line2TextProvider:v20];
LABEL_29:
          uint64_t v14 = (void *)v22;

          goto LABEL_8;
        default:
          goto LABEL_9;
      }
    }
    v11 = CLKComplicationTemplateCircularMediumSimpleImage;
    uint64_t v12 = [v6 circularMediumImage];
LABEL_5:
    id v9 = (void *)v12;
    id v13 = v11;
LABEL_6:
    uint64_t v10 = [v13 templateWithImageProvider:v9];
  }
  uint64_t v14 = (void *)v10;
LABEL_8:

LABEL_9:
  id v15 = +[UIColor systemRedColor];
  [v14 setTintColor:v15];

  if (v14) {
    [v7 setComplicationTemplate:v14];
  }

  return v7;
}

+ (id)sampleEventTemplateForFamily:(int64_t)a3
{
  id v4 = objc_opt_new();
  id v5 = NTKIdealizedDate();
  [v4 setEntryDate:v5];
  [v4 setEventsInDayCount:1];
  [v4 setOverlappingEventCount:1];
  id v6 = NTKColorWithRGBA();
  uint64_t v22 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v22 count:1];
  [v4 setEventColors:v7];

  v8 = NTKStartOfDayForDate();
  id v9 = +[NSCalendar currentCalendar];
  uint64_t v10 = [v9 components:62 fromDate:v5];
  int64_t v21 = a3;
  if ((a3 | 2) == 0xB)
  {
    v11 = NCALComplicationLocalizedString(@"COMPLICATION_SAMPLE_CALENDAR_TITLE_ALTERNATE");
    [v4 setPrimaryEventTitle:v11];

    uint64_t v12 = NCALComplicationLocalizedString(@"COMPLICATION_SAMPLE_CALENDAR_LOCATION_ALTERNATE");
    uint64_t v13 = 0;
    uint64_t v14 = 9;
    uint64_t v15 = 8;
  }
  else
  {
    CFStringRef v16 = NCALComplicationLocalizedString(@"COMPLICATION_SAMPLE_CALENDAR_TITLE");
    [v4 setPrimaryEventTitle:v16];

    uint64_t v12 = NCALComplicationLocalizedString(@"COMPLICATION_SAMPLE_CALENDAR_LOCATION");
    uint64_t v14 = 17;
    uint64_t v13 = 30;
    uint64_t v15 = 16;
  }
  [v4 setPrimaryEventLocation:v12];

  [v10 setHour:v15];
  [v10 setMinute:v13];
  id v17 = [v9 nextDateAfterDate:v8 matchingComponents:v10 options:2];
  [v4 setEventStartDate:v17];

  [v10 setHour:v14];
  uint64_t v18 = [v9 nextDateAfterDate:v8 matchingComponents:v10 options:2];
  [v4 setEventEndDate:v18];

  uint64_t v19 = [v4 templateForComplicationFamily:v21];

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setEventStartDate:(id)a3
{
}

- (NSDate)eventEndDate
{
  return self->_eventEndDate;
}

- (void)setEventEndDate:(id)a3
{
}

- (NSString)primaryEventTitle
{
  return self->_primaryEventTitle;
}

- (void)setPrimaryEventTitle:(id)a3
{
}

- (NSString)primaryEventLocation
{
  return self->_primaryEventLocation;
}

- (void)setPrimaryEventLocation:(id)a3
{
}

- (NSString)secondaryEventTitle
{
  return self->_secondaryEventTitle;
}

- (void)setSecondaryEventTitle:(id)a3
{
}

- (NSString)primaryEventOrganizerName
{
  return self->_primaryEventOrganizerName;
}

- (void)setPrimaryEventOrganizerName:(id)a3
{
}

- (BOOL)displayAsTomorrow
{
  return self->_displayAsTomorrow;
}

- (void)setDisplayAsTomorrow:(BOOL)a3
{
  self->_displayAsTomorrow = a3;
}

- (BOOL)displayAsConflicting
{
  return self->_displayAsConflicting;
}

- (void)setDisplayAsConflicting:(BOOL)a3
{
  self->_displayAsConflicting = a3;
}

- (BOOL)displayAsFirstInDay
{
  return self->_displayAsFirstInDay;
}

- (void)setDisplayAsFirstInDay:(BOOL)a3
{
  self->_displayAsFirstInDay = a3;
}

- (unint64_t)overlappingEventCount
{
  return self->_overlappingEventCount;
}

- (void)setOverlappingEventCount:(unint64_t)a3
{
  self->_overlappingEventCount = a3;
}

- (BOOL)overlappingDates
{
  return self->_overlappingDates;
}

- (void)setOverlappingDates:(BOOL)a3
{
  self->_overlappingDates = a3;
}

- (unint64_t)eventsInDayCount
{
  return self->_eventsInDayCount;
}

- (void)setEventsInDayCount:(unint64_t)a3
{
  self->_eventsInDayCount = a3;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSArray)eventColors
{
  return self->_eventColors;
}

- (void)setEventColors:(id)a3
{
}

- (BOOL)displayEntryDateInGraphicCircularView
{
  return self->_displayEntryDateInGraphicCircularView;
}

- (void)setDisplayEntryDateInGraphicCircularView:(BOOL)a3
{
  self->_displayEntryDateInGraphicCircularView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventColors, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_primaryEventOrganizerName, 0);
  objc_storeStrong((id *)&self->_secondaryEventTitle, 0);
  objc_storeStrong((id *)&self->_primaryEventLocation, 0);
  objc_storeStrong((id *)&self->_primaryEventTitle, 0);
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end