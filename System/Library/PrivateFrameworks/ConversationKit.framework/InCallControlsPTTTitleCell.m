@interface InCallControlsPTTTitleCell
- (_TtC15ConversationKit26InCallControlsPTTTitleCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit26InCallControlsPTTTitleCell)initWithFrame:(CGRect)a3;
@end

@implementation InCallControlsPTTTitleCell

- (_TtC15ConversationKit26InCallControlsPTTTitleCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit26InCallControlsPTTTitleCell *)InCallControlsPTTTitleCell.init(frame:)();
}

- (_TtC15ConversationKit26InCallControlsPTTTitleCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsPTTTitleCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26InCallControlsPTTTitleCell_avatarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26InCallControlsPTTTitleCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26InCallControlsPTTTitleCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit26InCallControlsPTTTitleCell_titleLabelTopConstraint);
}

@end