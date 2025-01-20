@interface IdentityProofingViewController
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonClicked;
- (void)primaryButtonClicked;
- (void)secondaryButtonClicked;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)tertiaryButtonClicked;
- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityProofingViewController

- (UILabel)titleLabel
{
  v2 = self;
  id v3 = sub_21F529B44();

  return (UILabel *)v3;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)imageView
{
  v2 = self;
  id v3 = sub_21F52A168();

  return (UIImageView *)v3;
}

- (void)setImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView) = (Class)a3;
  id v3 = a3;
}

- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F52FA98();
}

- (void)primaryButtonClicked
{
}

- (void)secondaryButtonClicked
{
}

- (void)cancelButtonClicked
{
}

- (void)tertiaryButtonClicked
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F52E0AC();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v4 = v10.receiver;
  [(IdentityProofingViewController *)&v10 viewWillAppear:v3];
  sub_21F494F00((uint64_t)v4 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v7);
  uint64_t v5 = v8;
  uint64_t v6 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 136))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if (v3) {
    sub_21F52A57C();
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21F52ED24();
}

- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_21F52F500(a4);
}

- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI30IdentityProofingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction));
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
}

@end