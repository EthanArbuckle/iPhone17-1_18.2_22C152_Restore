@interface AQIDataSource
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (NSNumber)legacyNTKComplicationType;
+ (NSString)bundleIdentifier;
- (_TtC20WeatherComplications13AQIDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
@end

@implementation AQIDataSource

+ (NSNumber)legacyNTKComplicationType
{
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, 36);

  return (NSNumber *)v2;
}

+ (NSString)bundleIdentifier
{
  id v2 = (void *)sub_23796EA68();

  return (NSString *)v2;
}

- (_TtC20WeatherComplications13AQIDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (_TtC20WeatherComplications13AQIDataSource *)sub_2379596CC(a3, a4, a5);
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_237959FAC((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  v5 = self;

  return objc_msgSend(v5, sel_deviceSupportsWidgets_, a4);
}

- (void).cxx_destruct
{
}

@end