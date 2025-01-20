@interface VideoView
- (NSString)accessibilityVideoDescription;
- (_TtC16HealthArticlesUI9VideoView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI9VideoView)initWithFrame:(CGRect)a3;
- (void)nonLoopingEndOfPlay:(id)a3;
- (void)setAccessibilityVideoDescription:(id)a3;
@end

@implementation VideoView

- (NSString)accessibilityVideoDescription
{
  v2 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1C2920BB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessibilityVideoDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C2920BE0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_accessibilityVideoDescription);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC16HealthArticlesUI9VideoView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI9VideoView *)sub_1C291A4F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI9VideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C291F074();
}

- (void)nonLoopingEndOfPlay:(id)a3
{
  uint64_t v4 = sub_1C2920360();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2920340();
  v8 = self;
  sub_1C291DA24();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1C291E128((uint64_t)self + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_videoPlayer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI9VideoView_primaryPlayerItem));

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthArticlesUI9VideoView____lazy_storage___captionLabel);
}

@end