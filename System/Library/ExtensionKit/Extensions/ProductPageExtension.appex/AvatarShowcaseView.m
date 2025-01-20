@interface AvatarShowcaseView
- (_TtC20ProductPageExtension18AvatarShowcaseView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18AvatarShowcaseView)initWithFrame:(CGRect)a3;
@end

@implementation AvatarShowcaseView

- (_TtC20ProductPageExtension18AvatarShowcaseView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18AvatarShowcaseView_artworkLoader) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension18AvatarShowcaseView *)sub_10077D120();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension18AvatarShowcaseView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension18AvatarShowcaseView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18AvatarShowcaseView_layoutConfiguration;
  uint64_t v3 = sub_100776A40();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end