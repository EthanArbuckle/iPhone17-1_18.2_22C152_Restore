@interface BlurViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC10Blackbeard18BlurViewController)initWithCoder:(id)a3;
- (_TtC10Blackbeard18BlurViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation BlurViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B152BC0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_249264E60;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10Blackbeard18BlurViewController_viewController);
  *(void *)(v3 + 32) = v4;
  sub_24925DD30();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967E378);
  v6 = (void *)sub_24925DCE0();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC10Blackbeard18BlurViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10Blackbeard18BlurViewController_blurView;
  v6 = self;
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_effectWithStyle_, 19);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v8);

  v10 = (objc_class *)sub_24925E280();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v10;

  result = (_TtC10Blackbeard18BlurViewController *)sub_24925E6D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_248F308A8();
}

- (_TtC10Blackbeard18BlurViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10Blackbeard18BlurViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10Blackbeard18BlurViewController_viewController);
}

@end