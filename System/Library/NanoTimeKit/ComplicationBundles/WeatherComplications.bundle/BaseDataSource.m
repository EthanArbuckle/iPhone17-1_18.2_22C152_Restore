@interface BaseDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (NSString)appIdentifier;
+ (NSString)localizedAppName;
+ (NSString)localizedComplicationName;
- (_TtC20WeatherComplications14BaseDataSource)init;
- (_TtC20WeatherComplications14BaseDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)currentSwitcherTemplate;
- (id)sampleTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(int64_t)a4 withHandler:(id)a5;
@end

@implementation BaseDataSource

+ (NSString)appIdentifier
{
  v2 = (void *)sub_23796EA68();

  return (NSString *)v2;
}

+ (NSString)localizedAppName
{
  sub_23794EF54();
  if (v2)
  {
    v3 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v6 = (*(uint64_t (**)(void))(ObjCClassMetadata + 296))();
  LOBYTE(a3) = sub_23793C494(a3, v6);
  swift_bridgeObjectRelease();
  return a3 & 1;
}

+ (NSString)localizedComplicationName
{
  swift_getObjCClassMetadata();
  sub_23794C62C();
  if (v2)
  {
    v3 = (void *)sub_23796EA68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (_TtC20WeatherComplications14BaseDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (_TtC20WeatherComplications14BaseDataSource *)sub_23794C8D8(a3, a4, a5);
}

- (id)currentSwitcherTemplate
{
  id v2 = [(BaseDataSource *)self sampleTemplate];

  return v2;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  uint64_t v7 = sub_2379265BC(&qword_268937470);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23796E2A8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  sub_23796E288();
  if (a4)
  {
    sub_23796E288();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v15, 1, v10);
  _Block_release(v14);
  sub_23792673C((uint64_t)v9, &qword_268937470);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(int64_t)a4 withHandler:(id)a5
{
  uint64_t v7 = sub_23796E2A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  sub_23796E288();
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_23794F718((uint64_t)v10, v12, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)sampleTemplate
{
  uint64_t v3 = sub_23796E2A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_23796E298();
  (*(void (**)(char *))((*MEMORY[0x263F8EED0] & (uint64_t)v7->super.super.super.isa) + 0x120))(v6);
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t ObjectType = swift_getObjectType();
  id v11 = (id)(*(uint64_t (**)(int64_t, uint64_t, uint64_t))(v9 + 48))([(CLKCComplicationDataSource *)v7 family], ObjectType, v9);
  objc_msgSend(v11, sel_finalize);

  swift_unknownObjectRelease();

  return v11;
}

- (_TtC20WeatherComplications14BaseDataSource)init
{
  result = (_TtC20WeatherComplications14BaseDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_switcherTemplate));
  sub_23792673C((uint64_t)self + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_forecast, &qword_268937478);
  sub_23795049C((uint64_t)self + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_location, MEMORY[0x263F580A0]);
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_becomeActiveDate;
  uint64_t v4 = sub_23796E2A8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_lastUpdateDate, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC20WeatherComplications14BaseDataSource_launchLog;
  uint64_t v7 = sub_23796E9E8();
  uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

@end