@interface ComponentViewOverflowViewController
- (NSArray)keyCommands;
- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ComponentViewOverflowViewController

- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_overflowTransitioning) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension35ComponentViewOverflowViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003FB020();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1003FB724();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v5.receiver;
  [(ComponentViewOverflowViewController *)&v5 viewWillDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_scrollView], "setContentOffset:animated:", 0, 0.0, 0.0, v5.receiver, v5.super_class);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003FBE10(a3);
}

- (NSArray)keyCommands
{
  v2 = self;
  BOOL v3 = sub_1003C1360();

  if (v3)
  {
    sub_1003C2C14();
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
}

- (_TtC20ProductPageExtension35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension35ComponentViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_componentView));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension35ComponentViewOverflowViewController_overflowTransitioning);
}

@end