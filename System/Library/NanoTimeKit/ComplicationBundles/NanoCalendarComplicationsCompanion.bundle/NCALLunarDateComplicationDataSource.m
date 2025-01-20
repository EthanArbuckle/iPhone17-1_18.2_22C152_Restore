@interface NCALLunarDateComplicationDataSource
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (BOOL)isLunarDateComplication;
+ (id)bundleIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (NCALLunarDateComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
@end

@implementation NCALLunarDateComplicationDataSource

+ (id)bundleIdentifier
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NCALLunarDateComplicationDataSource;
  v2 = objc_msgSendSuper2(&v5, "bundleIdentifier");
  v3 = [v2 stringByAppendingString:@".lunarDate"];

  return v3;
}

+ (id)legacyNTKComplicationType
{
  return &off_22298;
}

+ (id)localizedAppName
{
  return (id)_NTKComplicationTypeLocalizedLabelTextFromTypeKey(@"LUNAR_DATE", a2);
}

+ (BOOL)isLunarDateComplication
{
  return 1;
}

- (NCALLunarDateComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NCALLunarDateComplicationDataSource;
  return [(NCALDateComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NCALLunarDateComplicationDataSource;
  [(NCALDateComplicationDataSource *)&v2 dealloc];
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  if (a4 == 11)
  {
    objc_super v5 = (void (*)(void))*((void *)a5 + 2);
    id v7 = a5;
    v5();
  }
  else
  {
    objc_super v6 = (void (**)(void))a5;
    id v7 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoCalendar.WidgetExtension" containerBundleIdentifier:@"com.apple.NanoCalendar" kind:@"com.apple.CalendarWidget.CalendarLunarDateComplication" intent:0];
    v6[2](v6);
  }
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"827A9753-8ABC-42BF-AFC5-76F5D1838CF9"];
  unsigned __int8 v7 = [v5 supportsCapability:v6];

  if (a3 == 11) {
    return 0;
  }
  else {
    return v7;
  }
}

@end