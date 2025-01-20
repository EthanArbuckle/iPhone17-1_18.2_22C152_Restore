@interface NCALComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)_debugCLKSideBySideFamilies;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
+ (int64_t)tritiumUpdatePriority;
- (NCALComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currrentTimelineEntry;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)sampleTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
@end

@implementation NCALComplicationDataSource

- (NCALComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NCALComplicationDataSource;
  return [(NCALComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NCALComplicationDataSource;
  [(NCALComplicationDataSource *)&v2 dealloc];
}

+ (id)bundleIdentifier
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NCALComplicationDataSource;
  objc_super v2 = objc_msgSendSuper2(&v5, "bundleIdentifier");
  v3 = [v2 stringByAppendingString:@".schedule"];

  return v3;
}

+ (id)legacyNTKComplicationType
{
  return &off_22280;
}

+ (id)appIdentifier
{
  return @"com.apple.NanoCalendar";
}

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"NEXT_EVENT", a2);
}

- (unint64_t)timelineAnimationBehavior
{
  return 2;
}

- (id)currentSwitcherTemplate
{
  return [(NCALComplicationDataSource *)self sampleTemplate];
}

- (id)sampleTemplate
{
  id v2 = [(NCALComplicationDataSource *)self family];

  return +[NCALTimelineEntryModel sampleEventTemplateForFamily:v2];
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NCALComplicationDataSource *)self _currrentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)_currrentTimelineEntry
{
  return 0;
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  unint64_t v6 = a3 - 7;
  if (unint64_t)a3 < 7 && ((0x57u >> a3))
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 1;
    if (a3 != 3)
    {
      BOOL v8 = CLKComplicationFamilyCircularMedium == a3 || NTKComplicationFamilyUtilitarianLargeNarrow == a3;
      if (!v8 && (v6 >= 6 || ((0x37u >> v6) & 1) == 0))
      {
        char v9 = NTKShowBlueRidgeUI();
        if (a3 == 10) {
          BOOL v7 = v9;
        }
        else {
          BOOL v7 = 0;
        }
      }
    }
  }

  return v7;
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate distantFuture];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
}

- (id)lockedTemplate
{
  id v2 = +[NCALTimelineEntryModel lockedEntryForFamily:[(NCALComplicationDataSource *)self family]];
  v3 = [v2 complicationTemplate];

  return v3;
}

+ (int64_t)tritiumUpdatePriority
{
  return 1;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  id v5 = (void (**)(id, id))a5;
  id v7 = +[NCALNextEventIntent intent];
  id v6 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoCalendar.WidgetExtension" containerBundleIdentifier:@"com.apple.NanoCalendar" kind:@"com.apple.CalendarWidget.CalendarNextEventComplication" intent:v7];
  v5[2](v5, v6);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"827A9753-8ABC-42BF-AFC5-76F5D1838CF9"];
  unsigned __int8 v8 = [v6 supportsCapability:v7];

  char v9 = [a1 _debugCLKSideBySideFamilies];
  v10 = +[NSNumber numberWithInteger:a3];
  LOBYTE(v7) = [v9 containsObject:v10];

  return v8 & (v7 ^ 1);
}

+ (id)_debugCLKSideBySideFamilies
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilecal"];
  uint64_t v3 = [v2 arrayForKey:@"ClockKitSideBySideFamilies"];
  id v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = +[NSSet setWithArray:v6];

  return v7;
}

@end