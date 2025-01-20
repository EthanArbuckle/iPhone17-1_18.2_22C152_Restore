@interface CondensedAdLockupWithIconBackgroundView
- (NSArray)accessibilityElements;
- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation CondensedAdLockupWithIconBackgroundView

- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView *)sub_1005C93C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005CA07C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005C99C8();
}

- (NSArray)accessibilityElements
{
  sub_10000D280(&qword_10094C640);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10078DF90;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_10077BED0();
    NSArray v6 = self;
    isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(CondensedAdLockupWithIconBackgroundView *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_backgroundArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_backgroundEffectView));

  swift_unknownObjectRelease();
}

@end