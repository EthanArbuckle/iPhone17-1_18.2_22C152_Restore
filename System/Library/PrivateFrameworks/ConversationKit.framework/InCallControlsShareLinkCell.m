@interface InCallControlsShareLinkCell
- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InCallControlsShareLinkCell

- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit27InCallControlsShareLinkCell *)InCallControlsShareLinkCell.init(frame:)();
}

- (_TtC15ConversationKit27InCallControlsShareLinkCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsShareLinkCell.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  InCallControlsShareLinkCell.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_shareLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_buttonHeightConstraint));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit27InCallControlsShareLinkCell_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end