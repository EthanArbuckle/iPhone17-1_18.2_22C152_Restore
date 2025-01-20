@interface AddPassesViewControllerWrapper.AddPassCoordinator
- (_TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator)init;
- (void)addPassesViewControllerDidFinish:(id)a3;
- (void)dealloc;
@end

@implementation AddPassesViewControllerWrapper.AddPassCoordinator

- (void)dealloc
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3710);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8D310];
  *(_OWORD *)(v3 + 16) = xmmword_23CA48830;
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 32) = 0x74696E696564;
  *(void *)(v3 + 40) = 0xE600000000000000;
  v5 = self;
  sub_23CA47000();
  swift_bridgeObjectRelease();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
  [(AddPassesViewControllerWrapper.AddPassCoordinator *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_23CA25258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion));
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  uint64_t v4 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion);
  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion);
  if (v5)
  {
    objc_super v6 = self;
    id v7 = a3;
    v8 = self;
    sub_23CA3A58C((uint64_t)v5);
    v5(objc_msgSend(v6, sel_didAddPasses_, v7));
    sub_23CA25258((uint64_t)v5);
    uint64_t v9 = *v4;
  }
  else
  {
    id v10 = a3;
    v11 = self;
    uint64_t v9 = 0;
  }
  *uint64_t v4 = 0;
  v4[1] = 0;
  sub_23CA25258(v9);
}

- (_TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator)init
{
  result = (_TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end