@interface OSAJobQuiescenceMonitor
+ (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)sharedInstance;
- (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)init;
@end

@implementation OSAJobQuiescenceMonitor

+ (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)sharedInstance
{
  v2 = (void *)_s17osanalyticshelper23OSAJobQuiescenceMonitorC14sharedInstanceACSgvgZ_0();

  return (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor *)v2;
}

- (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor)init
{
  return (_TtC17osanalyticshelper23OSAJobQuiescenceMonitor *)sub_1000122D4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end