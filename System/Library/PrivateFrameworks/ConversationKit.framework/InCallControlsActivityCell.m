@interface InCallControlsActivityCell
- (_TtC15ConversationKit26InCallControlsActivityCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit26InCallControlsActivityCell)initWithFrame:(CGRect)a3;
@end

@implementation InCallControlsActivityCell

- (_TtC15ConversationKit26InCallControlsActivityCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit26InCallControlsActivityCell *)InCallControlsActivityCell.init(frame:)();
}

- (_TtC15ConversationKit26InCallControlsActivityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsActivityCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26InCallControlsActivityCell_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26InCallControlsActivityCell_linkViewHeightConstraint));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit26InCallControlsActivityCell_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end