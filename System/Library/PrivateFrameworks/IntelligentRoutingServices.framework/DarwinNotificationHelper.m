@interface DarwinNotificationHelper
- (_TtC26IntelligentRoutingServices24DarwinNotificationHelper)init;
- (void)dealloc;
@end

@implementation DarwinNotificationHelper

- (void)dealloc
{
  v2 = self;
  DarwinNotificationHelper.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
}

- (_TtC26IntelligentRoutingServices24DarwinNotificationHelper)init
{
  return (_TtC26IntelligentRoutingServices24DarwinNotificationHelper *)DarwinNotificationHelper.init()();
}

@end