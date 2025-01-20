@interface PersonalizationFeedbackCollectionViewCell
- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapSubmitButton:(id)a3;
- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell *)sub_1001F5760(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001F9454();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001F60E8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001F702C();
}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F7250(v4);
}

- (void)didTapSubmitButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F9858();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton);

  sub_10001A4D0(v3);
}

@end