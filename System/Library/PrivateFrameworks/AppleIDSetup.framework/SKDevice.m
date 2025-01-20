@interface SKDevice
- (_TtC12AppleIDSetup8SKDevice)init;
@end

@implementation SKDevice

- (_TtC12AppleIDSetup8SKDevice)init
{
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup8SKDevice_blePSM) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup8SKDevice_identifier);
  v4 = (objc_class *)type metadata accessor for SKDevice();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SKDevice *)&v6 init];
}

- (void).cxx_destruct
{
}

@end