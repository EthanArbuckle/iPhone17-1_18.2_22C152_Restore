@interface FBKToggleQuestionCell
+ (NSString)reuseIdentifier;
+ (void)setReuseIdentifier:(id)a3;
- (FBKAnswer)answer;
- (FBKBugFormEditorDelegate)editorDelegate;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore21FBKToggleQuestionCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore21FBKToggleQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setAnswer:(id)a3;
- (void)setEditorDelegate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)toggleSwitchValueChanged;
@end

@implementation FBKToggleQuestionCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

+ (NSString)reuseIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setReuseIdentifier:(id)a3
{
  uint64_t v3 = sub_22A4B3458();
  uint64_t v5 = v4;
  swift_beginAccess();
  qword_268377420 = v3;
  off_268377428 = v5;
  swift_bridgeObjectRelease();
}

- (FBKBugFormEditorDelegate)editorDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_editorDelegate;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (FBKBugFormEditorDelegate *)v3;
}

- (void)setEditorDelegate:(id)a3
{
}

- (FBKQuestion)question
{
  return (FBKQuestion *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_question);
}

- (void)setQuestion:(id)a3
{
}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_answer);
}

- (void)setAnswer:(id)a3
{
}

- (_TtC12FeedbackCore21FBKToggleQuestionCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore21FBKToggleQuestionCell *)sub_22A48B65C(a3);
}

- (_TtC12FeedbackCore21FBKToggleQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore21FBKToggleQuestionCell *)sub_22A48B74C(a3, (uint64_t)a4, v6);
}

- (void)toggleSwitchValueChanged
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_toggle);
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = v2;
    objc_msgSend(v4, sel_isOn);
    sub_22A48BA10();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22A432A10((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_editorDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_toggle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_question));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore21FBKToggleQuestionCell_answer);
}

@end