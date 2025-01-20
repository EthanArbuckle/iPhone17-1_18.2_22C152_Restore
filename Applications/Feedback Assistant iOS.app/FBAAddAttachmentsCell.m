@interface FBAAddAttachmentsCell
+ (BOOL)supportsMenu;
- (NSString)itemIdentifier;
- (UIMenu)menu;
- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setItemIdentifier:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation FBAAddAttachmentsCell

+ (BOOL)supportsMenu
{
  return 0;
}

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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (UIMenu)menu
{
  result = *(UIMenu **)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button);
  if (result)
  {
    id v3 = [(UIMenu *)result menu];
    return (UIMenu *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setMenu:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button);
  if (v3) {
    [v3 setMenu:a3];
  }
  else {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAAddAttachmentsCell();
  return [(FBAAddAttachmentsCell *)&v6 initWithCoder:a3];
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC18Feedback_Assistant21FBAAddAttachmentsCell *)sub_100068A6C(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button);
}

@end