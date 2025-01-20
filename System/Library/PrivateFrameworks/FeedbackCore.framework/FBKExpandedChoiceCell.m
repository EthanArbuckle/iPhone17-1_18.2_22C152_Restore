@interface FBKExpandedChoiceCell
+ (id)reuseIdentifier;
- (BOOL)showError;
- (FBKAnswer)answer;
- (FBKBugFormEditorDelegate)delegate;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setAnswer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setShowError:(BOOL)a3;
- (void)updateCellContent;
@end

@implementation FBKExpandedChoiceCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (FBKBugFormEditorDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (FBKBugFormEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

+ (id)reuseIdentifier
{
  v2 = (void *)sub_22A4B3418();

  return v2;
}

- (FBKQuestion)question
{
  return (FBKQuestion *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_question);
}

- (void)setQuestion:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_22A482B70(a3);
}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_22A431470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_answer);
}

- (void)setAnswer:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_22A482D60(a3);
}

- (BOOL)showError
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_showError;
  swift_beginAccess();
  return *v2;
}

- (void)setShowError:(BOOL)a3
{
  uint64_t v4 = self;
  sub_22A47ED40(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_22A47F040();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_22A4B27F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B27E8();
  v8 = self;
  sub_22A47F21C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)updateCellContent
{
  v2 = self;
  sub_22A47F574();
}

- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore21FBKExpandedChoiceCell *)FBKExpandedChoiceCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore21FBKExpandedChoiceCell *)FBKExpandedChoiceCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_22A432A10((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_question));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_answer));

  swift_release();
}

@end