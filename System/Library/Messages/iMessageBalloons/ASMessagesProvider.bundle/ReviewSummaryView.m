@interface ReviewSummaryView
- (_TtC18ASMessagesProvider17ReviewSummaryView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider17ReviewSummaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryView

- (_TtC18ASMessagesProvider17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider17ReviewSummaryView *)sub_66BA98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_66CEE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_66C3C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider17ReviewSummaryView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider17ReviewSummaryView_subtitleLabel));
  swift_bridgeObjectRelease();
  swift_release();
  sub_16ED7C((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider17ReviewSummaryView_subtitleArtworkAlignment);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider17ReviewSummaryView_previewContainer);
}

@end