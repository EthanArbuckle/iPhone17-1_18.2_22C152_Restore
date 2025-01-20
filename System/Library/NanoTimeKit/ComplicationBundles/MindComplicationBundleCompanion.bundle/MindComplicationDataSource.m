@interface MindComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (NSNumber)legacyNTKComplicationType;
+ (NSString)appIdentifier;
+ (NSString)localizedAppName;
- (_TtC31MindComplicationBundleCompanion26MindComplicationDataSource)init;
- (_TtC31MindComplicationBundleCompanion26MindComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)sampleTemplate;
- (void)fetchWidgetMigrationForDescriptor:(CLKComplicationDescriptor *)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation MindComplicationDataSource

- (void)fetchWidgetMigrationForDescriptor:(CLKComplicationDescriptor *)a3 family:(int64_t)a4 completion:(id)a5
{
  sub_6DD4(&qword_10568);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_A680();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10578;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10588;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_62AC((uint64_t)v10, (uint64_t)&unk_10598, (uint64_t)v15);
  swift_release();
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v4 = a4;
  unsigned __int8 v5 = sub_6870(v4);

  return v5 & 1;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = sub_6AA0(a3, v5);

  return a3 & 1;
}

+ (NSString)appIdentifier
{
  NSString v2 = sub_A5C0();

  return (NSString *)v2;
}

+ (NSNumber)legacyNTKComplicationType
{
  v2.super.super.isa = sub_A6B0().super.super.isa;

  return (NSNumber *)v2.super.super.isa;
}

+ (NSString)localizedAppName
{
  swift_getObjCClassMetadata();
  sub_5A78();
  if (v2)
  {
    NSString v3 = sub_A5C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (id)sampleTemplate
{
  return sub_5E38(self, (uint64_t)a2, (uint64_t (*)(void))sub_791C);
}

- (id)lockedTemplate
{
  return sub_5E38(self, (uint64_t)a2, (uint64_t (*)(void))sub_766C);
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_6C40(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)currentSwitcherTemplate
{
  return sub_5E38(self, (uint64_t)a2, (uint64_t (*)(void))sub_791C);
}

- (_TtC31MindComplicationBundleCompanion26MindComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MindComplicationDataSource();
  return [(MindComplicationDataSource *)&v9 initWithComplication:a3 family:a4 forDevice:a5];
}

- (_TtC31MindComplicationBundleCompanion26MindComplicationDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MindComplicationDataSource();
  return [(MindComplicationDataSource *)&v3 init];
}

@end