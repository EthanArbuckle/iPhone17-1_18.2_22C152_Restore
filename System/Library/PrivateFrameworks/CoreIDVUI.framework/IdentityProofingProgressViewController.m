@interface IdentityProofingProgressViewController
- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)updateUI;
- (void)updateViews;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityProofingProgressViewController

- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F500158();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4FC840();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingProgressViewController();
  id v4 = v7.receiver;
  [(IdentityProofingProgressViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationItem, v7.receiver, v7.super_class);
  objc_msgSend(v5, sel_setHidesBackButton_animated_, 1, 0);

  id v6 = objc_msgSend(v4, sel_navigationItem);
  objc_msgSend(v6, sel_setLeftBarButtonItem_, 0);

  sub_21F4FE8B4();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_21F4FCA7C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21F4FDAB8();
}

- (void)updateUI
{
  v2 = self;
  sub_21F4FE66C();
}

- (void)updateViews
{
  v2 = self;
  sub_21F4FE8B4();
}

- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI38IdentityProofingProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_config));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_primaryLabel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_imageView);
}

@end