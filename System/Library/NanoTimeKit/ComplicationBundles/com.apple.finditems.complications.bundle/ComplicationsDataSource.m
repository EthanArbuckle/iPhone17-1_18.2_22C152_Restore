@interface ComplicationsDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (NSString)appIdentifier;
+ (NSString)bundleIdentifier;
+ (NSString)localizedAppName;
- (_TtC33com_apple_finditems_complications23ComplicationsDataSource)init;
- (_TtC33com_apple_finditems_complications23ComplicationsDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)currentSwitcherTemplate;
- (void)fetchWidgetMigrationForDescriptor:(CLKComplicationDescriptor *)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation ComplicationsDataSource

- (void)fetchWidgetMigrationForDescriptor:(CLKComplicationDescriptor *)a3 family:(int64_t)a4 completion:(id)a5
{
  sub_6994(&qword_C3B8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_7060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_C3C8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_C3D8;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_56DC((uint64_t)v10, (uint64_t)&unk_C3E8, (uint64_t)v15);
  swift_release();
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  return 1;
}

+ (NSString)bundleIdentifier
{
  NSString v2 = sub_7000();

  return (NSString *)v2;
}

+ (NSString)appIdentifier
{
  NSString v2 = sub_7000();

  return (NSString *)v2;
}

+ (NSString)localizedAppName
{
  type metadata accessor for ComplicationsDataSource();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v7._countAndFlagsBits = 0xE000000000000000;
  v9._countAndFlagsBits = 0x454D414E5F505041;
  v9._object = (void *)0xE800000000000000;
  v10.value._countAndFlagsBits = 0;
  v10.value._object = 0;
  v4.super.isa = v3;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_6FA0(v9, v10, v4, v11, v7);

  NSString v5 = sub_7000();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (id)currentSwitcherTemplate
{
  NSString v2 = self;
  id v3 = sub_6614((uint64_t)[(ComplicationsDataSource *)v2 family]);

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  uint64_t v5 = sub_6FD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v9 = (void (**)(void *, id))_Block_copy(a3);
  Swift::String_optional v10 = self;
  id v11 = sub_6614((uint64_t)[(ComplicationsDataSource *)v10 family]);
  sub_6FC0();
  id v12 = v11;
  Class isa = sub_6FB0().super.isa;
  id v14 = [self entryWithDate:isa complicationTemplate:v12];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9[2](v9, v14);

  _Block_release(v9);
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return sub_6EF8(a3) & 1;
}

- (_TtC33com_apple_finditems_complications23ComplicationsDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ComplicationsDataSource();
  return [(ComplicationsDataSource *)&v9 initWithComplication:a3 family:a4 forDevice:a5];
}

- (_TtC33com_apple_finditems_complications23ComplicationsDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ComplicationsDataSource();
  return [(ComplicationsDataSource *)&v3 init];
}

@end