@interface FMR1InstructionsController
- (NSString)description;
- (_TtC11FMFindingUI26FMR1InstructionsController)init;
- (void)dealloc;
@end

@implementation FMR1InstructionsController

- (void)dealloc
{
  v2 = self;
  sub_24D36B8D4();
}

- (void).cxx_destruct
{
  sub_24D2C6E6C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI26FMR1InstructionsController_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI26FMR1InstructionsController_findable;
  sub_24D2B6E58((uint64_t)v3);
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI26FMR1InstructionsController)init
{
  result = (_TtC11FMFindingUI26FMR1InstructionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end