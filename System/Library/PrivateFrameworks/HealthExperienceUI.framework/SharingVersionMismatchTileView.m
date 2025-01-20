@interface SharingVersionMismatchTileView
- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithFrame:(CGRect)a3;
@end

@implementation SharingVersionMismatchTileView

- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI30SharingVersionMismatchTileView *)SharingVersionMismatchTileView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI30SharingVersionMismatchTileView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI30SharingVersionMismatchTileView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD54921C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_context, (unint64_t *)&qword_1EB73F2E0, (unint64_t *)&qword_1EB73F2D0, (uint64_t)&protocol descriptor for FeedItemViewControllerContext);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI30SharingVersionMismatchTileView_messageView);
}

@end