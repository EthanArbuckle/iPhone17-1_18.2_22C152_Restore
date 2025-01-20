@interface FBALastEmptyCell
- (NSString)itemIdentifier;
- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBALastEmptyCell

- (NSString)itemIdentifier
{
  return (NSString *)sub_100069700();
}

- (void)setItemIdentifier:(id)a3
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  id v2 = v3.receiver;
  [(FBALastEmptyCell *)&v3 prepareForReuse];
  [v2 setSelectionStyle:0];
}

- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
    void *v6 = 0;
    v6[1] = 0xE000000000000000;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
    void *v8 = 0;
    v8[1] = 0xE000000000000000;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  v9 = [(FBALastEmptyCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  return [(FBALastEmptyCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end