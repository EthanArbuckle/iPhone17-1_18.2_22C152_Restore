@interface SKSetupBase
- (_TtC12AppleIDSetup11SKSetupBase)init;
@end

@implementation SKSetupBase

- (_TtC12AppleIDSetup11SKSetupBase)init
{
  return (_TtC12AppleIDSetup11SKSetupBase *)SKSetupBase.init()();
}

- (void).cxx_destruct
{
  sub_247FB846C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_authTagOverride), *(void *)&self->authTagOverride[OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_authTagOverride]);

  sub_247F98D68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_eventHandler));
  swift_bridgeObjectRelease();
  sub_247F98D68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_passwordTypeChangedHandler));

  sub_247FB846C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_pskData), *(void *)&self->authTagOverride[OBJC_IVAR____TtC12AppleIDSetup11SKSetupBase_pskData]);
  swift_bridgeObjectRelease();
}

@end