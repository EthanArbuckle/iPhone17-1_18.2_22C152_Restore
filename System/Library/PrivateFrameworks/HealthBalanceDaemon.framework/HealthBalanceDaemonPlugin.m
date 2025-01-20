@interface HealthBalanceDaemonPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (NSString)pluginIdentifier;
- (_TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin)init;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
- (void)setPluginIdentifier:(id)a3;
@end

@implementation HealthBalanceDaemonPlugin

- (NSString)pluginIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_250F0CF50();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setPluginIdentifier:(id)a3
{
  uint64_t v4 = sub_250F0CF80();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin_pluginIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)extensionForHealthDaemon:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_250EBB868((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_250EBBB14(v4);

  return v6;
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = objc_msgSend(a3, sel_behavior);
  unsigned __int8 v5 = objc_msgSend(v4, sel_isRealityDevice);
  swift_unknownObjectRelease();

  return v5 ^ 1;
}

- (_TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin)init
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin_pluginIdentifier);
  v3 = self;
  uint64_t *v2 = sub_250F0C290();
  v2[1] = v4;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for HealthBalanceDaemonPlugin();
  return [(HealthBalanceDaemonPlugin *)&v6 init];
}

- (void).cxx_destruct
{
}

- (id)taskServerClasses
{
  sub_250EBC51C();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_250F0ECE0;
  sub_250EBC5E8(0, (unint64_t *)&unk_26B20E248, type metadata accessor for SleepingSampleAggregateDaySummaryEnumerator, sub_250EBC5B4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for SleepingSampleDaySummaryQueryServer);
  *(void *)(v2 + 32) = v3;
  sub_250EBC5E8(0, (unint64_t *)&unk_26B20E238, (uint64_t (*)(uint64_t))sub_250EA9318, sub_250EBC668, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for SleepingSampleDaySummaryQueryServer);
  *(void *)(v2 + 40) = v4;
  *(void *)(v2 + 48) = type metadata accessor for TrainingLoadSummaryQueryServer();
  sub_250EBC574();
  unsigned __int8 v5 = (void *)sub_250F0D030();
  swift_bridgeObjectRelease();
  return v5;
}

@end