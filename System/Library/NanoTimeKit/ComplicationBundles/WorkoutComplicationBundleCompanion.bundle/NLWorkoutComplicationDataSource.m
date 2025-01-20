@interface NLWorkoutComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (BOOL)_hasActiveWorkout;
- (BOOL)_hasPausedActiveWorkout;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (BOOL)hasKnownLastWorkoutState;
- (BOOL)isLoadingLastWorkout;
- (HKHealthStore)healthStore;
- (HKObserverQuery)workoutObservationQuery;
- (HKSampleQuery)lastWorkoutQuery;
- (HKWorkout)lastWorkout;
- (NLWorkoutComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (_HKCurrentWorkoutSnapshot)activeWorkoutSnapshot;
- (_HKWorkoutObserver)workoutObserver;
- (id)_animationImages;
- (id)_makeAnimatedImageProvider;
- (id)_noActiveWorkoutImageForComplicationFamily:(int64_t)a3;
- (id)_noWorkoutsTemplate;
- (id)_signatureTemplateWithFamily:(int64_t)a3 hasActiveWorkout:(BOOL)a4 hasPausedActiveWorkout:(BOOL)a5;
- (id)_templateForActiveWorkoutInSwitcher:(BOOL)a3;
- (id)_templateForWorkout:(id)a3 family:(int64_t)a4;
- (id)_unknownTemplateForFamily:(int64_t)a3;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)sampleTemplate;
- (void)_handleDeviceLockChange;
- (void)_invalidate;
- (void)_startObserving;
- (void)_stopObservingSynchronously:(BOOL)a3;
- (void)_updateActiveWorkoutState;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)setActiveWorkoutSnapshot:(id)a3;
- (void)setHasKnownLastWorkoutState:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setLastWorkout:(id)a3;
- (void)setLastWorkoutQuery:(id)a3;
- (void)setLoadingLastWorkout:(BOOL)a3;
- (void)setWorkoutObservationQuery:(id)a3;
- (void)setWorkoutObserver:(id)a3;
@end

@implementation NLWorkoutComplicationDataSource

+ (id)legacyNTKComplicationType
{
  return &off_CB78;
}

+ (id)appIdentifier
{
  return @"com.apple.SessionTrackerApp";
}

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"WORKOUT", a2);
}

- (NLWorkoutComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NLWorkoutComplicationDataSource;
  v9 = [(NLWorkoutComplicationDataSource *)&v19 initWithComplication:a3 family:a4 forDevice:v8];
  if (v9)
  {
    char v10 = CLKIsUVPreviewApp();
    v9->_inUVPreview = v10;
    if ((v10 & 1) == 0)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.nanolifestyle.workout.health-queue", v11);
      healthQueue = v9->_healthQueue;
      v9->_healthQueue = (OS_dispatch_queue *)v12;

      v14 = v9->_healthQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4F1C;
      block[3] = &unk_C470;
      v15 = v9;
      v18 = v15;
      dispatch_async(v14, block);
      v15->_deviceIsLocked = [v8 isLocked];
      [(NLWorkoutComplicationDataSource *)v15 _updateActiveWorkoutState];
      [(NLWorkoutComplicationDataSource *)v15 _startObserving];
    }
  }

  return v9;
}

- (void)dealloc
{
  [(NLWorkoutComplicationDataSource *)self _stopObservingSynchronously:1];
  v3.receiver = self;
  v3.super_class = (Class)NLWorkoutComplicationDataSource;
  [(NLWorkoutComplicationDataSource *)&v3 dealloc];
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 18;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  if (CLKComplicationFamilyCircularMedium == a3) {
    return 1;
  }
  else {
    return ((unint64_t)a3 < 0xD) & (0x1FDFu >> a3);
  }
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if ([(NLWorkoutComplicationDataSource *)self _hasActiveWorkout])
  {
    uint64_t v5 = [(NLWorkoutComplicationDataSource *)self _templateForActiveWorkoutInSwitcher:0];
  }
  else
  {
    lastWorkout = self->_lastWorkout;
    if (lastWorkout)
    {
      uint64_t v5 = [(NLWorkoutComplicationDataSource *)self _templateForWorkout:lastWorkout family:[(NLWorkoutComplicationDataSource *)self family]];
    }
    else if (self->_loadingLastWorkout && !self->_hasKnownLastWorkoutState)
    {
      uint64_t v5 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:[(NLWorkoutComplicationDataSource *)self family]];
    }
    else
    {
      uint64_t v5 = [(NLWorkoutComplicationDataSource *)self _noWorkoutsTemplate];
    }
  }
  id v9 = (id)v5;
  v7 = +[NSDate date];
  id v8 = +[CLKComplicationTimelineEntry entryWithDate:v7 complicationTemplate:v9];
  v4[2](v4, v8);
}

- (id)currentSwitcherTemplate
{
  return [(NLWorkoutComplicationDataSource *)self sampleTemplate];
}

- (id)sampleTemplate
{
  objc_super v3 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  v4 = objc_opt_new();
  [v4 setYear:2016];
  [v4 setMonth:9];
  [v4 setDay:23];
  [v4 setHour:9];
  [v4 setMinute:41];
  uint64_t v5 = [v3 dateFromComponents:v4];
  v6 = NTKStartOfDayForDate();

  v7 = [v3 nextDateAfterDate:v6 matchingComponents:v4 options:2];
  id v8 = [v7 dateByAddingTimeInterval:-1740.0];
  id v9 = +[HKUnit kilocalorieUnit];
  char v10 = +[HKQuantity quantityWithUnit:v9 doubleValue:400.0];

  v11 = +[HKUnit mileUnit];
  dispatch_queue_t v12 = +[HKQuantity quantityWithUnit:v11 doubleValue:3.1];

  v13 = +[HKWorkout workoutWithActivityType:37 startDate:v8 endDate:v7 duration:v10 totalEnergyBurned:v12 totalDistance:0 metadata:1740.0];
  v14 = [(NLWorkoutComplicationDataSource *)self _templateForWorkout:v13 family:[(NLWorkoutComplicationDataSource *)self family]];

  return v14;
}

- (id)lockedTemplate
{
  objc_super v3 = (char *)[(NLWorkoutComplicationDataSource *)self family];
  if (v3 == (unsigned char *)&dword_8 + 3)
  {
    id v9 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
    uint64_t v5 = +[CLKSimpleTextProvider textProviderWithText:v9];

    char v10 = NTKClockFaceLocalizedString();
    v7 = +[CLKSimpleTextProvider textProviderWithText:v10];

    id v8 = CLKComplicationTemplateGraphicRectangularStandardBody;
    goto LABEL_6;
  }
  if (v3 == (unsigned char *)&dword_0 + 3)
  {
    dispatch_queue_t v12 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:3];
    uint64_t v5 = +[CLKImageProvider imageProviderWithOnePieceImage:v12];

    v13 = NTKClockFaceLocalizedString();
    v7 = +[CLKSimpleTextProvider textProviderWithText:v13];

    uint64_t v11 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v7 imageProvider:v5];
    goto LABEL_8;
  }
  if (v3 == (unsigned char *)&dword_0 + 1)
  {
    v4 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
    uint64_t v5 = +[CLKSimpleTextProvider textProviderWithText:v4];

    v6 = NTKClockFaceLocalizedString();
    v7 = +[CLKSimpleTextProvider textProviderWithText:v6];

    id v8 = CLKComplicationTemplateModularLargeStandardBody;
LABEL_6:
    uint64_t v11 = [v8 templateWithHeaderTextProvider:v5 body1TextProvider:v7];
LABEL_8:
    v14 = (void *)v11;

    goto LABEL_10;
  }
  v14 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:[(NLWorkoutComplicationDataSource *)self family]];
LABEL_10:
  v15 = [(id)objc_opt_class() _workoutTintColor];
  [v14 setTintColor:v15];

  return v14;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v6 = a5;
  id v7 = +[NSURL URLWithString:@"SessionTrackerApp://"];
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (id)_unknownTemplateForFamily:(int64_t)a3
{
  uint64_t v5 = 0;
  switch(a3)
  {
    case 0:
      id v6 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:0];
      id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v6];

      id v8 = CLKComplicationTemplateModularSmallSimpleImage;
      goto LABEL_10;
    case 1:
      id v9 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
      id v7 = +[CLKSimpleTextProvider textProviderWithText:v9];

      char v10 = +[NTKNoContentTemplateProvider largeModularEmptyTextProvider];
      uint64_t v11 = CLKComplicationTemplateModularLargeStandardBody;
      goto LABEL_12;
    case 2:
      dispatch_queue_t v12 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:2];
      id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v12];

      id v8 = CLKComplicationTemplateUtilitarianSmallSquare;
      goto LABEL_10;
    case 3:
      v13 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:3];
      id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v13];

      v14 = NLWorkoutComplicationLocalizedString(@"WORKOUT_STATE_NONE_UTILITY_LARGE");
      v15 = +[CLKSimpleTextProvider textProviderWithText:v14];

      uint64_t v5 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v15 imageProvider:v7];

      goto LABEL_13;
    case 4:
      v16 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:4];
      id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v16];

      id v8 = CLKComplicationTemplateCircularSmallSimpleImage;
      goto LABEL_10;
    case 6:
      v17 = +[CLKSimpleTextProvider textProviderWithText:&stru_C608];
      v18 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:6];
      objc_super v19 = +[CLKImageProvider imageProviderWithOnePieceImage:v18];

      uint64_t v5 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v17 imageProvider:v19];

      break;
    case 7:
      v20 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:7];
      id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v20];

      id v8 = CLKComplicationTemplateExtraLargeSimpleImage;
LABEL_10:
      uint64_t v5 = [v8 templateWithImageProvider:v7];
      goto LABEL_13;
    case 8:
    case 9:
    case 10:
    case 12:
      uint64_t v5 = [(NLWorkoutComplicationDataSource *)self _signatureTemplateWithFamily:a3 hasActiveWorkout:0 hasPausedActiveWorkout:0];
      break;
    case 11:
      v21 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
      id v7 = +[CLKSimpleTextProvider textProviderWithText:v21];

      char v10 = +[NTKNoContentTemplateProvider largeModularEmptyTextProvider];
      uint64_t v11 = CLKComplicationTemplateGraphicRectangularStandardBody;
LABEL_12:
      uint64_t v5 = [v11 templateWithHeaderTextProvider:v7 body1TextProvider:v10];

LABEL_13:
      break;
    default:
      break;
  }
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    v22 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:a3];
    v23 = +[CLKImageProvider imageProviderWithOnePieceImage:v22];

    uint64_t v24 = +[CLKComplicationTemplateCircularMediumSimpleImage templateWithImageProvider:v23];

    uint64_t v5 = (void *)v24;
  }
  v25 = [(id)objc_opt_class() _workoutTintColor];
  [v5 setTintColor:v25];

  return v5;
}

- (id)_noWorkoutsTemplate
{
  id v3 = [(NLWorkoutComplicationDataSource *)self family];
  v4 = 0;
  switch((unint64_t)v3)
  {
    case 0uLL:
    case 2uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
      v4 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:v3];
      break;
    case 1uLL:
      uint64_t v5 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
      id v6 = +[CLKSimpleTextProvider textProviderWithText:v5];

      id v7 = NLWorkoutComplicationLocalizedString(@"WORKOUT_STATE_NONE_MODULAR");
      id v8 = +[CLKSimpleTextProvider textProviderWithText:v7];

      id v9 = CLKComplicationTemplateModularLargeStandardBody;
      goto LABEL_8;
    case 3uLL:
      char v10 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:3];
      id v6 = +[CLKImageProvider imageProviderWithOnePieceImage:v10];

      uint64_t v11 = NLWorkoutComplicationLocalizedString(@"WORKOUT_STATE_NONE_UTILITY_LARGE");
      id v8 = +[CLKSimpleTextProvider textProviderWithText:v11];

      dispatch_queue_t v12 = CLKComplicationTemplateUtilitarianLargeFlat;
      goto LABEL_6;
    case 6uLL:
      v13 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:6];
      id v6 = +[CLKImageProvider imageProviderWithOnePieceImage:v13];

      v14 = NLWorkoutComplicationLocalizedString(@"WORKOUT_STATE_NONE_UTILITY_SMALL_FLAT");
      id v8 = +[CLKSimpleTextProvider textProviderWithText:v14];

      dispatch_queue_t v12 = CLKComplicationTemplateUtilitarianSmallFlat;
LABEL_6:
      uint64_t v15 = [v12 templateWithTextProvider:v8 imageProvider:v6];
      goto LABEL_9;
    case 0xBuLL:
      v16 = NLWorkoutComplicationLocalizedString(@"WORKOUT_TITLE_NONE");
      id v6 = +[CLKSimpleTextProvider textProviderWithText:v16];

      v17 = NLWorkoutComplicationLocalizedString(@"WORKOUT_STATE_NONE_MODULAR");
      id v8 = +[CLKSimpleTextProvider textProviderWithText:v17];

      id v9 = CLKComplicationTemplateGraphicRectangularStandardBody;
LABEL_8:
      uint64_t v15 = [v9 templateWithHeaderTextProvider:v6 body1TextProvider:v8];
LABEL_9:
      v4 = (void *)v15;

      break;
    default:
      break;
  }
  if (v3 == (id)CLKComplicationFamilyCircularMedium)
  {
    uint64_t v18 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:v3];

    v4 = (void *)v18;
  }
  objc_super v19 = [(id)objc_opt_class() _workoutTintColor];
  [v4 setTintColor:v19];

  return v4;
}

- (id)_templateForWorkout:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  if ((unint64_t)a4 <= 0xB && ((1 << a4) & 0x80A) != 0)
  {
    objc_msgSend(v6, "fiui_swimmingLocationType");
    id v9 = [v7 metadata];
    char v10 = [v9 objectForKeyedSubscript:HKMetadataKeyIndoorWorkout];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 BOOLValue];
      }
    }
    [v7 workoutActivityType];
    id v8 = FIUILocalizedNameForActivityType();
  }
  if (qword_11B90 != -1) {
    dispatch_once(&qword_11B90, &stru_C490);
  }
  uint64_t v11 = 0;
  switch(a4)
  {
    case 0:
    case 2:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
      uint64_t v11 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:a4];
      break;
    case 1:
      uint64_t v15 = +[CLKSimpleTextProvider textProviderWithText:v8];
      v16 = [(id)qword_11B88 localizedKeyMetricStringForWorkout:v7 unitStyle:3];
      v17 = +[CLKSimpleTextProvider textProviderWithText:v16];
      uint64_t v18 = [v7 endDate];
      objc_super v19 = +[CLKDateTextProvider textProviderWithDate:v18 units:536];

      v20 = CLKComplicationTemplateModularLargeStandardBody;
      goto LABEL_20;
    case 3:
      v21 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:3];
      v32 = +[CLKImageProvider imageProviderWithOnePieceImage:v21];

      v22 = [(id)qword_11B88 localizedKeyMetricStringForWorkout:v7 unitStyle:1];
      v23 = [v22 localizedLowercaseString];

      uint64_t v24 = +[CLKSimpleTextProvider textProviderWithText:v23];
      [v24 setUseLowercaseSmallCaps:1];
      v25 = NLWorkoutComplicationLocalizedString(@"WORKOUT_DESCRIPTION_FORMAT_UTILITY");
      v26 = +[CLKSimpleTextProvider textProviderWithText:v8];
      v27 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v25, v24, v26);

      uint64_t v11 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v27 imageProvider:v32];

      break;
    case 6:
      v28 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:6];
      v29 = +[CLKImageProvider imageProviderWithOnePieceImage:v28];

      v30 = +[CLKSimpleTextProvider textProviderWithText:&stru_C608];
      uint64_t v11 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v30 imageProvider:v29];

      break;
    case 11:
      uint64_t v15 = +[CLKSimpleTextProvider textProviderWithText:v8];
      v16 = [(id)qword_11B88 localizedKeyMetricStringForWorkout:v7 unitStyle:3];
      v17 = +[CLKSimpleTextProvider textProviderWithText:v16];
      v31 = [v7 endDate];
      objc_super v19 = +[CLKDateTextProvider textProviderWithDate:v31 units:536];

      v20 = CLKComplicationTemplateGraphicRectangularStandardBody;
LABEL_20:
      uint64_t v11 = [v20 templateWithHeaderTextProvider:v15 body1TextProvider:v17 body2TextProvider:v19];

      break;
    default:
      break;
  }
  if (CLKComplicationFamilyCircularMedium == a4)
  {
    uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _unknownTemplateForFamily:a4];

    uint64_t v11 = (void *)v12;
  }
  v13 = [(id)objc_opt_class() _workoutTintColor];
  [v11 setTintColor:v13];

  return v11;
}

- (id)_signatureTemplateWithFamily:(int64_t)a3 hasActiveWorkout:(BOOL)a4 hasPausedActiveWorkout:(BOOL)a5
{
  uint64_t v5 = 0;
  BOOL v6 = a5;
  BOOL v7 = a4;
  switch(a3)
  {
    case 8:
      id v8 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
      v31[0] = @"NLWorkoutComplicationMetadataHasActiveWorkoutKey";
      id v9 = +[NSNumber numberWithBool:v7];
      v32[0] = v9;
      v31[1] = @"NLWorkoutComplicationMetadataActiveWorkoutIsPausedKey";
      char v10 = +[NSNumber numberWithBool:v6];
      v32[1] = v10;
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      [v8 setMetadata:v11];

      uint64_t v12 = CLKComplicationTemplateGraphicCornerCircularImage;
      goto LABEL_6;
    case 9:
      id v8 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
      v33[0] = @"NLWorkoutComplicationMetadataHasActiveWorkoutKey";
      v13 = +[NSNumber numberWithBool:v7];
      v34[0] = v13;
      v33[1] = @"NLWorkoutComplicationMetadataActiveWorkoutIsPausedKey";
      v14 = +[NSNumber numberWithBool:v6];
      v34[1] = v14;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      [v8 setMetadata:v15];

      v16 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v8];
      uint64_t v5 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v16];

      goto LABEL_7;
    case 10:
      id v8 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
      v29[0] = @"NLWorkoutComplicationMetadataHasActiveWorkoutKey";
      v17 = +[NSNumber numberWithBool:v7];
      v30[0] = v17;
      v29[1] = @"NLWorkoutComplicationMetadataActiveWorkoutIsPausedKey";
      uint64_t v18 = +[NSNumber numberWithBool:v6];
      v30[1] = v18;
      objc_super v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      [v8 setMetadata:v19];

      uint64_t v12 = CLKComplicationTemplateGraphicCircularImage;
      goto LABEL_6;
    case 12:
      id v8 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
      v27[0] = @"NLWorkoutComplicationMetadataHasActiveWorkoutKey";
      v20 = +[NSNumber numberWithBool:v7];
      v28[0] = v20;
      v27[1] = @"NLWorkoutComplicationMetadataActiveWorkoutIsPausedKey";
      v21 = +[NSNumber numberWithBool:v6];
      v28[1] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      [v8 setMetadata:v22];

      uint64_t v12 = CLKComplicationTemplateGraphicExtraLargeCircularImage;
LABEL_6:
      uint64_t v5 = [v12 templateWithImageProvider:v8];
LABEL_7:

      break;
    default:
      break;
  }
  uint64_t v25 = NTKRichComplicationViewUsePlatterKey;
  v26 = &__kCFBooleanTrue;
  v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  [v5 setMetadata:v23];

  return v5;
}

- (id)_templateForActiveWorkoutInSwitcher:(BOOL)a3
{
  unsigned int v5 = [(NLWorkoutComplicationDataSource *)self _hasPausedActiveWorkout];
  BOOL v6 = +[NSDate date];
  [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot elapsedTimeAtDate:v6];
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
  id v9 = +[CLKRelativeDateTextProvider textProviderWithDate:v8 style:2 units:224];
  [v9 setTimeTravelUpdateFrequency:0];
  if (v5) {
    [v9 setRelativeToDate:v6];
  }
  id v10 = [(NLWorkoutComplicationDataSource *)self family];
  uint64_t v11 = 0;
  switch((unint64_t)v10)
  {
    case 0uLL:
      uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
      v13 = CLKComplicationTemplateModularSmallSimpleImage;
      goto LABEL_17;
    case 1uLL:
      v14 = [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot configuration];
      [v14 activityType];
      uint64_t v12 = FIUILocalizedNameForIndoorAgnosticActivityType();

      uint64_t v15 = +[CLKSimpleTextProvider textProviderWithText:v12];
      uint64_t v16 = +[CLKComplicationTemplateModularLargeTallBody templateWithHeaderTextProvider:v15 bodyTextProvider:v9];
      goto LABEL_9;
    case 2uLL:
      uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
      v13 = CLKComplicationTemplateUtilitarianSmallSquare;
      goto LABEL_17;
    case 3uLL:
      if (a3)
      {
        v22 = [(NLWorkoutComplicationDataSource *)self _noActiveWorkoutImageForComplicationFamily:3];
        uint64_t v18 = +[CLKImageProvider imageProviderWithOnePieceImage:v22];

        if ((v5 & 1) == 0)
        {
LABEL_15:
          id v23 = v9;
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v18 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
        if ((v5 & 1) == 0) {
          goto LABEL_15;
        }
      }
      uint64_t v24 = NLWorkoutComplicationLocalizedString(@"WORKOUT_IN_SESSION_PAUSED");
      +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v24, v9);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
      uint64_t v11 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v23 imageProvider:v18];

LABEL_24:
LABEL_25:
      if (v10 == (id)CLKComplicationFamilyCircularMedium)
      {
        uint64_t v25 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
        uint64_t v26 = +[CLKComplicationTemplateCircularMediumSimpleImage templateWithImageProvider:v25];

        uint64_t v11 = (void *)v26;
      }
      v27 = [(id)objc_opt_class() _workoutTintColor];
      [v11 setTintColor:v27];

      return v11;
    case 4uLL:
      uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
      v13 = CLKComplicationTemplateCircularSmallSimpleImage;
      goto LABEL_17;
    case 6uLL:
      uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
      uint64_t v15 = +[CLKSimpleTextProvider textProviderWithText:&stru_C608];
      uint64_t v16 = +[CLKComplicationTemplateUtilitarianSmallFlat templateWithTextProvider:v15 imageProvider:v12];
LABEL_9:
      uint64_t v11 = (void *)v16;

      goto LABEL_18;
    case 7uLL:
      uint64_t v12 = [(NLWorkoutComplicationDataSource *)self _makeAnimatedImageProvider];
      v13 = CLKComplicationTemplateExtraLargeSimpleImage;
LABEL_17:
      uint64_t v11 = [v13 templateWithImageProvider:v12];
LABEL_18:

      goto LABEL_25;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
      uint64_t v11 = [(NLWorkoutComplicationDataSource *)self _signatureTemplateWithFamily:v10 hasActiveWorkout:1 hasPausedActiveWorkout:[(NLWorkoutComplicationDataSource *)self _hasPausedActiveWorkout]];
      goto LABEL_25;
    case 0xBuLL:
      v17 = [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot configuration];
      [v17 activityType];
      uint64_t v18 = FIUILocalizedNameForIndoorAgnosticActivityType();

      objc_super v19 = +[CLKSimpleTextProvider textProviderWithText:v18];
      if (v5)
      {
        v20 = NLWorkoutComplicationLocalizedString(@"WORKOUT_IN_SESSION_PAUSED");
        +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v20, v9);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v21 = v9;
      }
      uint64_t v11 = +[CLKComplicationTemplateGraphicRectangularStandardBody templateWithHeaderTextProvider:v19 body1TextProvider:v21];

      goto LABEL_24;
    default:
      goto LABEL_25;
  }
}

- (id)_noActiveWorkoutImageForComplicationFamily:(int64_t)a3
{
  return +[NLWorkoutComplicationImageProvider noWorkoutImageForComplicationFamily:a3];
}

- (id)_animationImages
{
  animationImages = self->_animationImages;
  if (!animationImages)
  {
    unint64_t v4 = (unint64_t)[(NLWorkoutComplicationDataSource *)self family];
    if (v4 <= 7 && ((0xDDu >> v4) & 1) != 0)
    {
      if (v4 != CLKComplicationFamilyCircularMedium)
      {
        unsigned int v5 = *(&off_C578 + v4);
LABEL_9:
        BOOL v6 = [(__CFString *)v5 stringByAppendingString:@"WorkoutActive%02d"];
        double v7 = +[NSMutableArray array];
        uint64_t v8 = 0;
        do
        {
          id v9 = +[NSString stringWithValidatedFormat:v6, @"%02d", 0, v8 validFormatSpecifiers error];
          id v10 = NLWorkoutComplicationImageNamed(v9);

          if (v10) {
            [(NSArray *)v7 addObject:v10];
          }

          uint64_t v8 = (v8 + 1);
        }
        while (v8 != 37);
        uint64_t v11 = self->_animationImages;
        self->_animationImages = v7;

        goto LABEL_14;
      }
    }
    else if (v4 != CLKComplicationFamilyCircularMedium)
    {
LABEL_14:
      animationImages = self->_animationImages;
      goto LABEL_15;
    }
    unsigned int v5 = @"victory";
    goto LABEL_9;
  }
LABEL_15:

  return animationImages;
}

- (id)_makeAnimatedImageProvider
{
  objc_initWeak(&location, self);
  unsigned int v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_6E90;
  uint64_t v8 = &unk_C4B8;
  objc_copyWeak(&v9, &location);
  id v3 = +[NLWorkoutComplicationImageProvider imageProviderWithImageViewCreationHandler:&v5];
  objc_msgSend(v3, "setPaused:", -[NLWorkoutComplicationDataSource _hasPausedActiveWorkout](self, "_hasPausedActiveWorkout", v5, v6, v7, v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (BOOL)_hasActiveWorkout
{
  activeWorkoutSnapshot = self->_activeWorkoutSnapshot;
  if (!activeWorkoutSnapshot
    || [(_HKCurrentWorkoutSnapshot *)activeWorkoutSnapshot sessionState] != (char *)&dword_0 + 2
    && [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot sessionState] != &dword_4)
  {
    return 0;
  }
  unint64_t v4 = self->_activeWorkoutSnapshot;

  return [(_HKCurrentWorkoutSnapshot *)v4 isFirstPartyWorkout];
}

- (BOOL)_hasPausedActiveWorkout
{
  BOOL v3 = [(NLWorkoutComplicationDataSource *)self _hasActiveWorkout];
  if (v3) {
    LOBYTE(v3) = [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot sessionState] == &dword_4
  }
              || [(_HKCurrentWorkoutSnapshot *)self->_activeWorkoutSnapshot internalState] == (char *)&dword_8 + 1;
  return v3;
}

- (void)_startObserving
{
  [(NLWorkoutComplicationDataSource *)self _stopObservingSynchronously:0];
  if (!self->_inUVPreview)
  {
    objc_initWeak(&location, self);
    BOOL v3 = (const char *)kHKHealthDaemonActiveWorkoutServersDidUpdateNotification;
    id v4 = &_dispatch_main_q;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_70F8;
    v5[3] = &unk_C4E0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &self->_workoutStateNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingSynchronously:(BOOL)a3
{
  if (!self->_inUVPreview)
  {
    int workoutStateNotifyToken = self->_workoutStateNotifyToken;
    if (workoutStateNotifyToken)
    {
      notify_cancel(workoutStateNotifyToken);
      self->_int workoutStateNotifyToken = 0;
    }
  }
}

- (void)_handleDeviceLockChange
{
  BOOL deviceIsLocked = self->_deviceIsLocked;
  id v4 = [(NLWorkoutComplicationDataSource *)self device];
  self->_BOOL deviceIsLocked = [v4 isLocked];

  if (self->_deviceIsLocked != deviceIsLocked)
  {
    [(NLWorkoutComplicationDataSource *)self _invalidate];
  }
}

- (void)_invalidate
{
  id v2 = [(NLWorkoutComplicationDataSource *)self delegate];
  [v2 invalidateEntries];
}

- (void)_updateActiveWorkoutState
{
  if (!self->_inUVPreview)
  {
    _HKInitializeLogging();
    BOOL v3 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[NLWorkoutComplicationDataSource] Updating active workout state.", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    healthQueue = self->_healthQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7354;
    v5[3] = &unk_C558;
    objc_copyWeak(&v6, buf);
    void v5[4] = self;
    dispatch_async(healthQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(id, id))a5;
  uint64_t v8 = v6;
  if (a4 == 11 || a4 == 1)
  {
    id v7 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.SessionTrackerApp.WorkoutWidgetExtension" containerBundleIdentifier:@"com.apple.SessionTrackerApp" kind:@"WorkoutWidgetExtension" intent:0];
    v8[2](v8, v7);
  }
  else
  {
    v6[2](v6, 0);
  }
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  return a3 == 1 || a3 == 11;
}

- (BOOL)isLoadingLastWorkout
{
  return self->_loadingLastWorkout;
}

- (void)setLoadingLastWorkout:(BOOL)a3
{
  self->_loadingLastWorkout = a3;
}

- (HKWorkout)lastWorkout
{
  return self->_lastWorkout;
}

- (void)setLastWorkout:(id)a3
{
}

- (BOOL)hasKnownLastWorkoutState
{
  return self->_hasKnownLastWorkoutState;
}

- (void)setHasKnownLastWorkoutState:(BOOL)a3
{
  self->_hasKnownLastWorkoutState = a3;
}

- (_HKWorkoutObserver)workoutObserver
{
  return self->_workoutObserver;
}

- (void)setWorkoutObserver:(id)a3
{
}

- (_HKCurrentWorkoutSnapshot)activeWorkoutSnapshot
{
  return self->_activeWorkoutSnapshot;
}

- (void)setActiveWorkoutSnapshot:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKSampleQuery)lastWorkoutQuery
{
  return self->_lastWorkoutQuery;
}

- (void)setLastWorkoutQuery:(id)a3
{
}

- (HKObserverQuery)workoutObservationQuery
{
  return self->_workoutObservationQuery;
}

- (void)setWorkoutObservationQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutObservationQuery, 0);
  objc_storeStrong((id *)&self->_lastWorkoutQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activeWorkoutSnapshot, 0);
  objc_storeStrong((id *)&self->_workoutObserver, 0);
  objc_storeStrong((id *)&self->_lastWorkout, 0);
  objc_storeStrong((id *)&self->_animationImages, 0);

  objc_storeStrong((id *)&self->_healthQueue, 0);
}

@end