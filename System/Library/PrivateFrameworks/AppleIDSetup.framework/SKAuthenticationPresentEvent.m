@interface SKAuthenticationPresentEvent
- (_TtC12AppleIDSetup28SKAuthenticationPresentEvent)init;
@end

@implementation SKAuthenticationPresentEvent

- (_TtC12AppleIDSetup28SKAuthenticationPresentEvent)init
{
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12AppleIDSetup28SKAuthenticationPresentEvent_passwordType) = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12AppleIDSetup28SKAuthenticationPresentEvent_password);
  v4 = (objc_class *)type metadata accessor for SKAuthenticationPresentEvent();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SKEvent *)&v6 init];
}

- (void).cxx_destruct
{
}

@end