@interface FBKActionSheetCell
- (UIImageView)actionImageView;
- (UILabel)actionTitleLabel;
- (_TtC12FeedbackCore18FBKActionSheetCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore18FBKActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setActionImageView:(id)a3;
- (void)setActionTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FBKActionSheetCell

- (UILabel)actionTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel));
}

- (void)setActionTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)actionImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView));
}

- (void)setActionImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = (Class)a3;
  id v3 = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9 = self;
  id v4 = a3;
  id v5 = [(FBKActionSheetCell *)v9 traitCollection];
  id v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  char v7 = sub_22A4B3838();
  v8 = *(Class *)((char *)&v9->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel);
  if (v8)
  {
    objc_msgSend(v8, sel_setNumberOfLines_, (v7 & 1) == 0);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC12FeedbackCore18FBKActionSheetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_22A4B3458();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
    id v6 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBKActionSheetCell();
  char v7 = [(FBKActionSheetCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC12FeedbackCore18FBKActionSheetCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetCell();
  return [(FBKActionSheetCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore18FBKActionSheetCell_actionImageView);
}

@end