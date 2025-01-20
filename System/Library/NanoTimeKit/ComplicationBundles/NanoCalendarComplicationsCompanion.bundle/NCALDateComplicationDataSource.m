@interface NCALDateComplicationDataSource
+ (BOOL)_hasMigratedForFamily:(int64_t)a3;
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (BOOL)isLunarDateComplication;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (BOOL)_isLunarDateComplication;
- (BOOL)supportsTapAction;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (NCALDateComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (id)sampleTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)_invalidate;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
@end

@implementation NCALDateComplicationDataSource

- (NCALDateComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NCALDateComplicationDataSource;
  v5 = [(NCALDateComplicationDataSource *)&v8 initWithComplication:a3 family:a4 forDevice:a5];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_invalidate" name:UIApplicationSignificantTimeChangeNotification object:0];
    [v6 addObserver:v5 selector:"_invalidate" name:CUIKPreferencesNotification_OverlayCalendarID object:0];
    [v6 addObserver:v5 selector:"_invalidate" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCALDateComplicationDataSource;
  [(NCALDateComplicationDataSource *)&v4 dealloc];
}

+ (id)bundleIdentifier
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NCALDateComplicationDataSource;
  v2 = objc_msgSendSuper2(&v5, "bundleIdentifier");
  v3 = [v2 stringByAppendingString:@".date"];

  return v3;
}

+ (id)legacyNTKComplicationType
{
  return &off_222B0;
}

+ (id)appIdentifier
{
  return @"com.apple.NanoCalendar";
}

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"DATE", a2);
}

+ (BOOL)isLunarDateComplication
{
  return 0;
}

- (void)_invalidate
{
  id v2 = [(NCALDateComplicationDataSource *)self delegate];
  [v2 invalidateEntries];
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6114C32D-3A7F-4C06-A90E-2106E5A304D3"];
  unsigned __int8 v7 = [v5 supportsCapability:v6];

  if (unint64_t)a3 < 7 && ((0x5Fu >> a3)) {
    return 1;
  }
  BOOL result = 1;
  if (a3 != 7
    && CLKComplicationFamilyCircularMedium != a3
    && (unint64_t)(a3 - 8) >= 3
    && CLKComplicationFamilySimpleText != a3)
  {
    if (a3 == 11) {
      BOOL v9 = v7;
    }
    else {
      BOOL v9 = 0;
    }
    return a3 == 12 || v9;
  }
  return result;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 1 || a3 == 16;
}

- (BOOL)_isLunarDateComplication
{
  id v2 = objc_opt_class();

  return _[v2 isLunarDateComplication];
}

- (id)_currentTimelineEntry
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  return [(NCALDateComplicationDataSource *)self sampleTemplate];
}

- (id)sampleTemplate
{
  v3 = objc_opt_new();
  objc_super v4 = +[CLKDate complicationDate];
  [v3 setEntryDate:v4];

  objc_msgSend(v3, "setLunar:", -[NCALDateComplicationDataSource _isLunarDateComplication](self, "_isLunarDateComplication"));
  id v5 = objc_msgSend(v3, "entryForComplicationFamily:", -[NCALDateComplicationDataSource family](self, "family"));
  id v6 = [v5 complicationTemplate];

  return v6;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NCALDateComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate distantFuture];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
}

- (unint64_t)timelineAnimationBehavior
{
  return 1;
}

- (BOOL)supportsTapAction
{
  v3.receiver = self;
  v3.super_class = (Class)NCALDateComplicationDataSource;
  return [(NCALDateComplicationDataSource *)&v3 supportsTapAction];
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  if ([(NCALDateComplicationDataSource *)self family] == &dword_8) {
    objc_super v3 = objc_opt_class();
  }
  else {
    objc_super v3 = 0;
  }

  return (Class)v3;
}

+ (BOOL)_hasMigratedForFamily:(int64_t)a3
{
  return a3 != 8 && CLKComplicationFamilySimpleText != a3 && NTKComplicationFamilyDate != a3;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  unsigned __int8 v7 = (void (**)(id, id))a5;
  if (+[NCALDateComplicationDataSource _hasMigratedForFamily:a4])
  {
    id v6 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.DateComplicationsHost.DateComplications" containerBundleIdentifier:@"com.apple.DateComplicationsHost" kind:@"com.apple.CalendarWidget.CalendarDateComplication" intent:0];
    v7[2](v7, v6);
  }
  else
  {
    v7[2](v7, 0);
  }
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"827A9753-8ABC-42BF-AFC5-76F5D1838CF9"];
  unsigned __int8 v7 = [v5 supportsCapability:v6];

  return v7 & +[NCALDateComplicationDataSource _hasMigratedForFamily:a3];
}

@end