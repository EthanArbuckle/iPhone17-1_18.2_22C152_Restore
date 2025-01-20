@interface FBKAttachmentDiffableCellView
+ (NSString)reuseIdentifier;
+ (void)setReuseIdentifier:(id)a3;
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore29FBKAttachmentDiffableCellView)initWithCoder:(id)a3;
- (_TtC12FeedbackCore29FBKAttachmentDiffableCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBKAttachmentDiffableCellView

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore29FBKAttachmentDiffableCellView_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

+ (NSString)reuseIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setReuseIdentifier:(id)a3
{
  uint64_t v3 = sub_22A4B3458();
  uint64_t v5 = v4;
  swift_beginAccess();
  qword_268376900 = v3;
  off_268376908 = v5;
  swift_bridgeObjectRelease();
}

- (_TtC12FeedbackCore29FBKAttachmentDiffableCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_22A4B3458();
    uint64_t v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore29FBKAttachmentDiffableCellView_itemIdentifier);
    *uint64_t v6 = 0;
    v6[1] = 0xE000000000000000;
    v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore29FBKAttachmentDiffableCellView_itemIdentifier);
    void *v8 = 0;
    v8[1] = 0xE000000000000000;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKAttachmentDiffableCellView();
  v9 = [(FBKAttachmentDiffableCellView *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC12FeedbackCore29FBKAttachmentDiffableCellView)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore29FBKAttachmentDiffableCellView_itemIdentifier);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKAttachmentDiffableCellView();
  return [(FBKAttachmentDiffableCellView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end