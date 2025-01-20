@interface FBAActionSheetCell
- (UIImageView)actionImageView;
- (UILabel)actionTitleLabel;
- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setActionImageView:(id)a3;
- (void)setActionTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FBAActionSheetCell

- (UILabel)actionTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel));
}

- (void)setActionTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)actionImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView));
}

- (void)setActionImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = (Class)a3;
  id v3 = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9 = self;
  id v4 = a3;
  id v5 = [(FBAActionSheetCell *)v9 traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  char v7 = UIContentSizeCategory.isAccessibilityCategory.getter();
  v8 = *(Class *)((char *)&v9->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel);
  if (v8)
  {
    [v8 setNumberOfLines:(v7 & 1) == 0];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBAActionSheetCell();
  char v7 = [(FBAActionSheetCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC18Feedback_Assistant18FBAActionSheetCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetCell();
  return [(FBAActionSheetCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant18FBAActionSheetCell_actionImageView);
}

@end