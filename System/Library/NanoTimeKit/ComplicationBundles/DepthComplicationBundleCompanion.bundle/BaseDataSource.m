@interface BaseDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)wantsToSkipPauseWhenEnteringTritium;
+ (NSString)appIdentifier;
+ (NSString)localizedAppName;
+ (int64_t)tritiumUpdatePriority;
- (_TtC32DepthComplicationBundleCompanion14BaseDataSource)init;
- (_TtC32DepthComplicationBundleCompanion14BaseDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (void)timelineCurrentEntryModelUpdated:(id)a3;
@end

@implementation BaseDataSource

+ (NSString)appIdentifier
{
  NSString v2 = sub_36DC8();

  return (NSString *)v2;
}

+ (NSString)localizedAppName
{
  sub_2DE94();
  if (v2)
  {
    NSString v3 = sub_36DC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

+ (BOOL)wantsToSkipPauseWhenEnteringTritium
{
  return 1;
}

+ (int64_t)tritiumUpdatePriority
{
  return 1;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a4;
  LOBYTE(a3) = sub_35EB4(a3, v6);

  return a3 & 1;
}

- (_TtC32DepthComplicationBundleCompanion14BaseDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (_TtC32DepthComplicationBundleCompanion14BaseDataSource *)sub_36100(a3, (void *)a4, a5);
}

- (_TtC32DepthComplicationBundleCompanion14BaseDataSource)init
{
  result = (_TtC32DepthComplicationBundleCompanion14BaseDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)timelineCurrentEntryModelUpdated:(id)a3
{
  id v4 = a3;
  id v6 = self;
  id v5 = [(BaseDataSource *)v6 delegate];
  if (v5)
  {
    [v5 invalidateEntries];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end