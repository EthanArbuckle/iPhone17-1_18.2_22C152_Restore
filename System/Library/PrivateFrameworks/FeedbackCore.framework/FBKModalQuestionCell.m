@interface FBKModalQuestionCell
+ (NSString)reuseIdentifier;
+ (void)setReuseIdentifier:(id)a3;
- (FBKQuestion)question;
- (NSString)itemIdentifier;
- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
@end

@implementation FBKModalQuestionCell

- (FBKQuestion)question
{
  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question);
  swift_beginAccess();
  return (FBKQuestion *)*v2;
}

- (void)setQuestion:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_22A4A84EC(a3);
}

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
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
  qword_2683778C0 = v3;
  off_2683778C8 = v5;
  swift_bridgeObjectRelease();
}

- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question) = 0;
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKModalQuestionCell();
  return [(FBKModalQuestionCell *)&v6 initWithCoder:a3];
}

- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore20FBKModalQuestionCell *)sub_22A4A8224(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question));

  swift_bridgeObjectRelease();
}

@end