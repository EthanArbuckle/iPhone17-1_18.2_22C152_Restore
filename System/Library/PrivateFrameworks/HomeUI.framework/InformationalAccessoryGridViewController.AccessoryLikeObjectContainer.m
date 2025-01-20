@interface InformationalAccessoryGridViewController.AccessoryLikeObjectContainer
- (NSSet)hf_accessoryLikeObjects;
- (_TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer)init;
- (void)setHf_accessoryLikeObjects:(id)a3;
@end

@implementation InformationalAccessoryGridViewController.AccessoryLikeObjectContainer

- (NSSet)hf_accessoryLikeObjects
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA116480);
  sub_1BE49FC0C();
  sub_1BE9C36A8();
  v2 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (void)setHf_accessoryLikeObjects:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA116480);
  sub_1BE49FC0C();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer_hf_accessoryLikeObjects) = (Class)sub_1BE9C4E88();

  swift_bridgeObjectRelease();
}

- (_TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer)init
{
  result = (_TtCC6HomeUI40InformationalAccessoryGridViewControllerP33_1E0D713E2D70C07A82D0ABA514F9943228AccessoryLikeObjectContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end