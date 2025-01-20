@interface DepthDataSource
+ (NSString)bundleIdentifier;
+ (NSString)localizedComplicationName;
- (_TtC32DepthComplicationBundleCompanion15DepthDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation DepthDataSource

- (_TtC32DepthComplicationBundleCompanion15DepthDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DepthDataSource();
  return [(BaseDataSource *)&v9 initWithComplication:a3 family:a4 forDevice:a5];
}

+ (NSString)bundleIdentifier
{
  NSString v2 = sub_36DC8();

  return (NSString *)v2;
}

+ (NSString)localizedComplicationName
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

- (id)lockedTemplate
{
  uint64_t v2 = *(void **)(*(void *)&self->super.CLKCComplicationBundleDataSource_opaque[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14BaseDataSource_timelineDataProvider]
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentDepthModel);
  NSString v3 = self;
  id v4 = v2;
  id v5 = sub_E094((uint64_t)[(DepthDataSource *)v3 family]);

  return v5;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_2DF80(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)currentSwitcherTemplate
{
  uint64_t v2 = self;
  id v3 = sub_2DB88();

  return v3;
}

@end