@interface FBAFollowupDisplayTextCell
- (NSString)itemIdentifier;
- (UILabel)displayText;
- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setDisplayText:(id)a3;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBAFollowupDisplayTextCell

- (NSString)itemIdentifier
{
  return (NSString *)sub_100069700();
}

- (void)setItemIdentifier:(id)a3
{
}

- (UILabel)displayText
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setDisplayText:(id)a3
{
}

- (void)awakeFromNib
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  id v2 = v6.receiver;
  [(FBAFollowupDisplayTextCell *)&v6 awakeFromNib];
  [v2 setSelectionStyle:3];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    id v5 = [self secondaryLabelColor];
    [v4 setTextColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    objc_super v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
    *objc_super v6 = 0;
    v6[1] = 0xE000000000000000;
    swift_unknownObjectWeakInit();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
    void *v8 = 0;
    v8[1] = 0xE000000000000000;
    swift_unknownObjectWeakInit();
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  v9 = [(FBAFollowupDisplayTextCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC18Feedback_Assistant26FBAFollowupDisplayTextCell)initWithCoder:(id)a3
{
  id v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant26FBAFollowupDisplayTextCell_itemIdentifier);
  *id v5 = 0;
  v5[1] = 0xE000000000000000;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAFollowupDisplayTextCell();
  return [(FBAFollowupDisplayTextCell *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end