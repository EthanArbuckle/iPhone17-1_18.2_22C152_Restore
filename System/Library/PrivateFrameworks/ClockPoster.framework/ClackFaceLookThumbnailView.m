@interface ClackFaceLookThumbnailView
- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithCoder:(id)a3;
- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ClackFaceLookThumbnailView

- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster26ClackFaceLookThumbnailView_gradientLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster26ClackFaceLookThumbnailView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249FD9E34();
}

- (_TtC11ClockPoster26ClackFaceLookThumbnailView)initWithFrame:(CGRect)a3
{
  result = (_TtC11ClockPoster26ClackFaceLookThumbnailView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster26ClackFaceLookThumbnailView_gradientLayer));
}

@end