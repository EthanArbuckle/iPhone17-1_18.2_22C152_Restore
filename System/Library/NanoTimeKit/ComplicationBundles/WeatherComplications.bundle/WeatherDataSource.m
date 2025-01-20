@interface WeatherDataSource
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (NSNumber)legacyNTKComplicationType;
+ (NSString)bundleIdentifier;
- (_TtC20WeatherComplications17WeatherDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
@end

@implementation WeatherDataSource

+ (NSNumber)legacyNTKComplicationType
{
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, 10);

  return (NSNumber *)v2;
}

+ (NSString)bundleIdentifier
{
  id v2 = (void *)sub_23796EA68();

  return (NSString *)v2;
}

- (_TtC20WeatherComplications17WeatherDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for WeatherDataSource();
  id v8 = a3;
  id v9 = a5;
  v10 = [(BaseDataSource *)&v14 initWithComplication:v8 family:a4 forDevice:v9];
  uint64_t v11 = qword_2689370D0;
  v12 = v10;
  if (v11 != -1) {
    swift_once();
  }
  *(_OWORD *)((char *)&v12->super.super.super.super.isa
            + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_templateFormatter) = xmmword_268939440;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  return v12;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_23794B838(a4, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  v5 = self;

  return objc_msgSend(v5, sel_deviceSupportsWidgets_, a4);
}

@end