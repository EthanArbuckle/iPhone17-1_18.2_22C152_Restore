@interface IdentityProofingBaseViewController
- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation IdentityProofingBaseViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingBaseViewController();
  id v2 = v3.receiver;
  [(IdentityProofingBaseViewController *)&v3 viewDidLoad];
  sub_21F4E76F8();
}

- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_21F5515A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9CoreIDVUI34IdentityProofingBaseViewController *)sub_21F4E8198(v5, v7, a4);
}

- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI34IdentityProofingBaseViewController *)sub_21F4E82B4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController_bottomTrayBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___primaryStackView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___bottomTray);
}

@end