@interface FMConnectionManager
- (_TtC11FMFindingUI19FMConnectionManager)init;
- (void)dealloc;
@end

@implementation FMConnectionManager

- (void)dealloc
{
  v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x98);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMConnectionManager();
  [(FMConnectionManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11FMFindingUI19FMConnectionManager)init
{
  result = (_TtC11FMFindingUI19FMConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end