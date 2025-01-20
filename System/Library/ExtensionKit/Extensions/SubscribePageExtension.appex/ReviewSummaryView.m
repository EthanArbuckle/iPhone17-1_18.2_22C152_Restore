@interface ReviewSummaryView
- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryView

- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension17ReviewSummaryView *)sub_1002C344C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002C4BC0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002C3D74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitleLabel));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1002C46A4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitleArtworkAlignment);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_previewContainer);
}

@end