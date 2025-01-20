@interface FBAFFUValidationCell
- (NSString)itemIdentifier;
- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBAFFUValidationCell

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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell_itemIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (void)awakeFromNib
{
  NSString v2 = self;
  sub_100097BA8();
}

- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18Feedback_Assistant20FBAFFUValidationCell *)sub_100097D7C(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant20FBAFFUValidationCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant20FBAFFUValidationCell *)sub_100097E8C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant20FBAFFUValidationCell____lazy_storage___choiceLabel);
}

@end