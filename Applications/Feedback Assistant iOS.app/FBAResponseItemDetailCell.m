@interface FBAResponseItemDetailCell
- (FBKContentItem)contentItem;
- (UIStackView)questionGroupsStack;
- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setContentItem:(id)a3;
- (void)setQuestionGroupsStack:(id)a3;
@end

@implementation FBAResponseItemDetailCell

- (UIStackView)questionGroupsStack
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setQuestionGroupsStack:(id)a3
{
}

- (void)awakeFromNib
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = self;
    [Strong setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    __break(1u);
  }
}

- (FBKContentItem)contentItem
{
  return (FBKContentItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem));
}

- (void)setContentItem:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100083FA0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100084E48();
}

- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_unknownObjectWeakInit();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBAResponseItemDetailCell();
  v7 = [(FBAResponseItemDetailCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC18Feedback_Assistant25FBAResponseItemDetailCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAResponseItemDetailCell();
  return [(FBAResponseItemDetailCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant25FBAResponseItemDetailCell_contentItem);
}

@end