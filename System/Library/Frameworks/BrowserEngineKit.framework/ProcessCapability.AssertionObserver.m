@interface ProcessCapability.AssertionObserver
- (_TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver)init;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
@end

@implementation ProcessCapability.AssertionObserver

- (void).cxx_destruct
{
  sub_24324F8D8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate));

  swift_release();
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_24323E1AC((uint64_t)v6);
}

- (_TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver)init
{
  result = (_TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end