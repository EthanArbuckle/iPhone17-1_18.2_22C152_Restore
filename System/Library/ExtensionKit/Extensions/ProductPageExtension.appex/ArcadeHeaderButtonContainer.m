@interface ArcadeHeaderButtonContainer
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateAccountButtonVisibility;
@end

@implementation ArcadeHeaderButtonContainer

- (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_stackView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for StackView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ArcadeHeaderButtonContainer *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_stackView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_stackView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateAccountButtonVisibility
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_accountButton);
  uint64_t v5 = self;
  id v3 = [(ArcadeHeaderButtonContainer *)v5 traitCollection];
  char v4 = sub_10077C390();

  [v2 setHidden:v4 & 1];
}

- (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension27ArcadeHeaderButtonContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_seeAllGamesButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27ArcadeHeaderButtonContainer_accountButton);
}

@end