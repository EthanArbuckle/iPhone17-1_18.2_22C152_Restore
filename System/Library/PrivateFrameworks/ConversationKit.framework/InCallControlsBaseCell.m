@interface InCallControlsBaseCell
- (UILabel)titleLabel;
- (_TtC15ConversationKit19InCallControlButton)button;
- (_TtC15ConversationKit22InCallControlsBaseCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit22InCallControlsBaseCell)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InCallControlsBaseCell

- (UILabel)titleLabel
{
  id v2 = InCallControlsBaseCell.titleLabel.getter();
  return (UILabel *)v2;
}

- (_TtC15ConversationKit19InCallControlButton)button
{
  id v2 = InCallControlsBaseCell.button.getter();
  return (_TtC15ConversationKit19InCallControlButton *)v2;
}

- (_TtC15ConversationKit22InCallControlsBaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit22InCallControlsBaseCell *)InCallControlsBaseCell.init(frame:)();
}

- (_TtC15ConversationKit22InCallControlsBaseCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsBaseCell.init(coder:)();
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsBaseCell.didTapButton(_:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  InCallControlsBaseCell.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_nameLabelFirstBaselineLayoutConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_nameLabelLastBaselineLayoutConstraint));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end