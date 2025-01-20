@interface _EXExtensionProcess.ProcessObserver
- (_TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver)init;
- (void)processDidInvalidate:(id)a3;
@end

@implementation _EXExtensionProcess.ProcessObserver

- (void)processDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F9A2F0();
}

- (_TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver)init
{
  result = (_TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_191F45B24(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver_invalidationHandler));

  swift_release();
}

@end