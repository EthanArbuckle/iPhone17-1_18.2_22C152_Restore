@interface ChanceRainDataSource
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (NSString)bundleIdentifier;
- (_TtC20WeatherComplications20ChanceRainDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)sampleTemplate;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
@end

@implementation ChanceRainDataSource

+ (NSString)bundleIdentifier
{
  v2 = (void *)sub_23796EA68();

  return (NSString *)v2;
}

- (_TtC20WeatherComplications20ChanceRainDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (_TtC20WeatherComplications20ChanceRainDataSource *)sub_23792B534(a3, a4, a5);
}

- (id)sampleTemplate
{
  v2 = self;
  if ((id)[(CLKCComplicationDataSource *)v2 family] == (id)11)
  {
    sub_23792B378();
    uint64_t v4 = v3;
    uint64_t ObjectType = swift_getObjectType();
    id v6 = (id)(*(uint64_t (**)(int64_t, uint64_t, uint64_t))(v4 + 48))([(CLKCComplicationDataSource *)v2 family], ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for ChanceRainDataSource(0);
    id v6 = [(BaseDataSource *)&v8 sampleTemplate];
  }

  return v6;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  objc_super v8 = self;
  sub_23792D08C((char *)v8, (uint64_t)v6);
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
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_nhpLogger;
  uint64_t v4 = sub_23796E9E8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC20WeatherComplications20ChanceRainDataSource_logger, v4);

  swift_bridgeObjectRelease();
}

@end