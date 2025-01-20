@interface FBKTopicCell
+ (NSString)reuseIdentifier;
- (BOOL)disclosesMoreForms;
- (CGRect)frame;
- (FBKBugFormLabel)formName;
- (FBKBugFormStub)formStub;
- (FBKQuestionCellTextView)formDescriptions;
- (NSLayoutConstraint)topicToBottomOfView;
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore12FBKTopicCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore12FBKTopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)horizontalFrameInset;
- (void)setDisclosesMoreForms:(BOOL)a3;
- (void)setFormDescriptions:(id)a3;
- (void)setFormName:(id)a3;
- (void)setFormStub:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalFrameInset:(double)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setTopicToBottomOfView:(id)a3;
@end

@implementation FBKTopicCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSLayoutConstraint)topicToBottomOfView
{
  v2 = (void *)MEMORY[0x22A6CA870]((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_topicToBottomOfView, a2);

  return (NSLayoutConstraint *)v2;
}

- (void)setTopicToBottomOfView:(id)a3
{
}

- (FBKQuestionCellTextView)formDescriptions
{
  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formDescriptions;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A6CA870](v2);

  return (FBKQuestionCellTextView *)v3;
}

- (void)setFormDescriptions:(id)a3
{
}

- (FBKBugFormLabel)formName
{
  v2 = (void *)MEMORY[0x22A6CA870]((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formName, a2);

  return (FBKBugFormLabel *)v2;
}

- (void)setFormName:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  v2 = (void *)sub_22A4B3418();

  return (NSString *)v2;
}

- (FBKBugFormStub)formStub
{
  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formStub);
  swift_beginAccess();
  return (FBKBugFormStub *)*v2;
}

- (void)setFormStub:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formStub);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_22A48C6CC();
}

- (BOOL)disclosesMoreForms
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_disclosesMoreForms;
  swift_beginAccess();
  return *v2;
}

- (void)setDisclosesMoreForms:(BOOL)a3
{
  uint64_t v4 = self;
  sub_22A48CA20(a3);
}

- (double)horizontalFrameInset
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalFrameInset:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKTopicCell();
  [(FBKTopicCell *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_horizontalFrameInset);
  swift_beginAccess();
  double v9 = x + *v8;
  double v10 = width - (*v8 + *v8);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKTopicCell();
  -[FBKTopicCell setFrame:](&v11, sel_setFrame_, v9, y, v10, height);
}

- (_TtC12FeedbackCore12FBKTopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore12FBKTopicCell *)FBKTopicCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore12FBKTopicCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore12FBKTopicCell *)FBKTopicCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore12FBKTopicCell_formStub);
}

@end