@interface FBKDateTimeCell
+ (id)reuseIdentifier;
- (FBKAnswer)answer;
- (FBKBugFormEditorDelegate)editorDelegate;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (UIDatePicker)datePicker;
- (UILabel)questionLabel;
- (_TtC12FeedbackCore15FBKDateTimeCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore15FBKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)dateDidChange:(id)a3;
- (void)setAnswer:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setEditorDelegate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setQuestionLabel:(id)a3;
@end

@implementation FBKDateTimeCell

- (NSString)itemIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4 = sub_22A4B3458();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UILabel)questionLabel
{
  v2 = (void *)MEMORY[0x22A6CA870]((char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_questionLabel, a2);

  return (UILabel *)v2;
}

- (void)setQuestionLabel:(id)a3
{
}

- (UIDatePicker)datePicker
{
  v2 = (void *)MEMORY[0x22A6CA870]((char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_datePicker, a2);

  return (UIDatePicker *)v2;
}

- (void)setDatePicker:(id)a3
{
}

- (FBKBugFormEditorDelegate)editorDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_editorDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (FBKBugFormEditorDelegate *)v3;
}

- (void)setEditorDelegate:(id)a3
{
}

- (void)awakeFromNib
{
  v2 = self;
  sub_22A430EB8();
}

+ (id)reuseIdentifier
{
  v2 = (void *)sub_22A4B3418();

  return v2;
}

- (FBKQuestion)question
{
  return (FBKQuestion *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_question);
}

- (void)setQuestion:(id)a3
{
}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_answer);
}

- (void)setAnswer:(id)a3
{
}

- (void)dateDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22A431E14(v4);
}

- (_TtC12FeedbackCore15FBKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_22A4B3458();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC12FeedbackCore15FBKDateTimeCell *)FBKDateTimeCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore15FBKDateTimeCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore15FBKDateTimeCell *)FBKDateTimeCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_22A432A10((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_editorDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_question));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_answer);
}

@end