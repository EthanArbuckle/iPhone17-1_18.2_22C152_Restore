@interface FBKUserCell
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore11FBKUserCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore11FBKUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setItemIdentifier:(id)a3;
- (void)updateWithUser:(id)a3;
@end

@implementation FBKUserCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)updateWithUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22A451048(v4);
}

- (_TtC12FeedbackCore11FBKUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_22A4B3458();
    uint64_t v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
    *uint64_t v6 = 0;
    v6[1] = 0xE000000000000000;
    v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
    void *v8 = 0;
    v8[1] = 0xE000000000000000;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKUserCell();
  v9 = [(FBKUserCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC12FeedbackCore11FBKUserCell)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
  *id v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKUserCell();
  return [(FBKUserCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end