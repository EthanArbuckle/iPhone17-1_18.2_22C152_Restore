@interface PriorityMessageListHeaderCell
- (_TtC6MailUI29PriorityMessageListHeaderCell)initWithCoder:(id)a3;
- (_TtC6MailUI29PriorityMessageListHeaderCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation PriorityMessageListHeaderCell

- (_TtC6MailUI29PriorityMessageListHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI29PriorityMessageListHeaderCell *)PriorityMessageListHeaderCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI29PriorityMessageListHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  PriorityMessageListHeaderCell.init(coder:)();
}

- (void)prepareForReuse
{
  v2 = self;
  PriorityMessageListHeaderCell.prepareForReuse()();
}

@end