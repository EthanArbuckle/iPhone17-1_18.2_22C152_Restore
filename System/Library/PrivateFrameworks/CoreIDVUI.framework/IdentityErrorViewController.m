@interface IdentityErrorViewController
- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureFonts;
- (void)primaryButtonClicked;
- (void)secondaryButtonClicked;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation IdentityErrorViewController

- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4FC4C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4FAB54();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityErrorViewController();
  v4 = (char *)v7.receiver;
  [(IdentityErrorViewController *)&v7 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingToParentViewController, v7.receiver, v7.super_class))
  {
    v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_21F47D8F8((uint64_t)v5);
    }
  }
}

- (void)configureFonts
{
  v2 = self;
  sub_21F4FBBC4();
}

- (void)primaryButtonClicked
{
}

- (void)secondaryButtonClicked
{
}

- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI27IdentityErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_tertiaryButtonTargetAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___learnMoreButton);
}

@end