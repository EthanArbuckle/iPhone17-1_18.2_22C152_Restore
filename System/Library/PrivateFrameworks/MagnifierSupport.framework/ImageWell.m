@interface ImageWell
- (NSString)accessibilityLabel;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport9ImageWell)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport9ImageWell)initWithFrame:(CGRect)a3;
@end

@implementation ImageWell

- (_TtC16MagnifierSupport9ImageWell)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport9ImageWell *)sub_2358CC3FC(a3);
}

- (_TtC16MagnifierSupport9ImageWell)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport9ImageWell *)sub_2358CC4C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)largeContentTitle
{
  v2 = self;
  sub_2358CC29C();

  v3 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_infiniteSettingsGlyph);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_2358CD400();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_infiniteSettingsGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_snapshotImage));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport9ImageWell_badgeView);
}

@end