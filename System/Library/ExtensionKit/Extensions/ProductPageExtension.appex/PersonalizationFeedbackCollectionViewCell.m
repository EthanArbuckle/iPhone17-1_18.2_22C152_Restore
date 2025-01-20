@interface PersonalizationFeedbackCollectionViewCell
- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapSubmitButton:(id)a3;
- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell *)sub_100708C3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10070DAAC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007095C4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10070A508();
}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10070A72C(v4);
}

- (void)didTapSubmitButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10070DEB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton);

  sub_1000194B0(v3);
}

@end