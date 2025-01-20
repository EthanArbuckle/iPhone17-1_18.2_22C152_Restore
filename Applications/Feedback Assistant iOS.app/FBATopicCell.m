@interface FBATopicCell
+ (NSString)reuseIdentifier;
- (BOOL)disclosesMoreForms;
- (FBABugFormLabel)formName;
- (FBAQuestionCellTextView)formDescriptions;
- (FBKBugFormStub)formStub;
- (NSLayoutConstraint)topicToBottomOfView;
- (NSString)itemIdentifier;
- (_TtC18Feedback_Assistant12FBATopicCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant12FBATopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setDisclosesMoreForms:(BOOL)a3;
- (void)setFormDescriptions:(id)a3;
- (void)setFormName:(id)a3;
- (void)setFormStub:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setTopicToBottomOfView:(id)a3;
@end

@implementation FBATopicCell

- (NSString)itemIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_itemIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSLayoutConstraint)topicToBottomOfView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setTopicToBottomOfView:(id)a3
{
}

- (FBAQuestionCellTextView)formDescriptions
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (FBAQuestionCellTextView *)Strong;
}

- (void)setFormDescriptions:(id)a3
{
}

- (FBABugFormLabel)formName
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (FBABugFormLabel *)Strong;
}

- (void)setFormName:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  if (qword_100121DC0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (FBKBugFormStub)formStub
{
  return (FBKBugFormStub *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub));
}

- (void)setFormStub:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100054C14();
}

- (BOOL)disclosesMoreForms
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_disclosesMoreForms);
}

- (void)setDisclosesMoreForms:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100054E50(a3);
}

- (_TtC18Feedback_Assistant12FBATopicCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18Feedback_Assistant12FBATopicCell *)sub_100054EB8(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant12FBATopicCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant12FBATopicCell *)sub_100054FF8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant12FBATopicCell_formStub);
}

@end