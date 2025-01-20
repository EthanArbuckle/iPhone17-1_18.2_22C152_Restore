@interface FBAExpandingTextInputCell
- (BOOL)textViewShouldEndEditing:(id)a3;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSString)itemIdentifier;
- (UILabel)characterCountLabel;
- (_TtC18Feedback_Assistant20FBAExpandingTextView)commentsTextView;
- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setCharacterCountLabel:(id)a3;
- (void)setCommentsTextView:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setMinimumHeightConstraint:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation FBAExpandingTextInputCell

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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_itemIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)commentsTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC18Feedback_Assistant20FBAExpandingTextView *)Strong;
}

- (void)setCommentsTextView:(id)a3
{
}

- (UILabel)characterCountLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setCharacterCountLabel:(id)a3
{
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setMinimumHeightConstraint:(id)a3
{
}

- (void)awakeFromNib
{
  NSString v2 = self;
  sub_100091BE8();
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAExpandingTextInputCell();
  [(FBAExpandingTextInputCell *)&v6 setSelected:v5 animated:v4];
}

- (void)textViewDidBeginEditing:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    id v9 = [v6 tableView];
    if (v9)
    {
      id v10 = v9;
      [v9 flashScrollIndicators];
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_1000920E4(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_1000927D0();
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong) {

  }
  return 1;
}

- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18Feedback_Assistant25FBAExpandingTextInputCell *)sub_1000923B4(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant25FBAExpandingTextInputCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant25FBAExpandingTextInputCell *)sub_100092528(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100056D7C((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant25FBAExpandingTextInputCell_followup));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end