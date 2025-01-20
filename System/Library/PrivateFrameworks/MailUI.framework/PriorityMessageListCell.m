@interface PriorityMessageListCell
- (_TtC6MailUI23PriorityMessageListCell)initWithCoder:(id)a3;
- (_TtC6MailUI23PriorityMessageListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation PriorityMessageListCell

- (_TtC6MailUI23PriorityMessageListCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI23PriorityMessageListCell *)PriorityMessageListCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI23PriorityMessageListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  PriorityMessageListCell.init(coder:)();
}

- (void)prepareForReuse
{
  v2 = self;
  PriorityMessageListCell.prepareForReuse()();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v12 = sub_1DDEED488();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13);
  uint64_t v11 = (uint64_t)&v7 - v8;
  id v5 = v4;
  v6 = self;
  sub_1DDEED468();
  PriorityMessageListCell.updateConfiguration(using:)(v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI23PriorityMessageListCell_message));
  sub_1DDD31CE0();
}

@end