@interface SKEvent
- (_TtC12AppleIDSetup7SKEvent)init;
@end

@implementation SKEvent

- (_TtC12AppleIDSetup7SKEvent)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup7SKEvent_eventType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup7SKEvent_error) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SKEvent();
  return [(SKEvent *)&v3 init];
}

- (void).cxx_destruct
{
}

@end