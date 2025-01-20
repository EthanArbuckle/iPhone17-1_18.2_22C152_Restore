@interface FakePresentingViewController#1inGPImageDescriptionViewController.fakePresentingVieController.getter
- (UITraitCollection)traitCollection;
- (_TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController)initWithCoder:(id)a3;
- (_TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FakePresentingViewController#1inGPImageDescriptionViewController.fakePresentingVieController.getter

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController_traits));
}

- (_TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2443BA4F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController_traits;
  id v9 = objc_allocWithZone(MEMORY[0x263F82DA0]);
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  if (v7)
  {
    v12 = (void *)sub_2443BA4B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for GPImageDescriptionViewController.FakePresentingViewController();
  v13 = [(FakePresentingViewController *)&v15 #1 in GPImageDescriptionViewController.fakePresentingVieController.getter initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController_traits;
  id v6 = objc_allocWithZone(MEMORY[0x263F82DA0]);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for GPImageDescriptionViewController.FakePresentingViewController();
  id v9 = [(FakePresentingViewController *)&v11 #1 in GPImageDescriptionViewController.fakePresentingVieController.getter initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCFC15ImagePlayground32GPImageDescriptionViewControllergP33_5F4BE5157666C54802080394A155BAA827fakePresentingVieControllerCSo16UIViewControllerL_28FakePresentingViewController_traits));
}

@end