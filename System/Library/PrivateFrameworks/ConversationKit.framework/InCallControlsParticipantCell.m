@interface InCallControlsParticipantCell
- (UILabel)nameLabel;
- (UILabel)subtitleLabel;
- (_TtC15ConversationKit19InCallControlButton)actionButton;
- (_TtC15ConversationKit19InCallControlButton)kickMemberButton;
- (_TtC15ConversationKit19InCallControlButton)lmiApproveButton;
- (_TtC15ConversationKit19InCallControlButton)lmiRejectButton;
- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setKickMemberButton:(id)a3;
- (void)setLmiApproveButton:(id)a3;
- (void)setLmiRejectButton:(id)a3;
@end

@implementation InCallControlsParticipantCell

- (UILabel)nameLabel
{
  id v2 = InCallControlsParticipantCell.nameLabel.getter();
  return (UILabel *)v2;
}

- (UILabel)subtitleLabel
{
  id v2 = InCallControlsParticipantCell.subtitleLabel.getter();
  return (UILabel *)v2;
}

- (_TtC15ConversationKit19InCallControlButton)actionButton
{
  id v2 = InCallControlsParticipantCell.actionButton.getter();
  return (_TtC15ConversationKit19InCallControlButton *)v2;
}

- (_TtC15ConversationKit19InCallControlButton)lmiApproveButton
{
  id v2 = self;
  id v3 = InCallControlsParticipantCell.lmiApproveButton.getter(&OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiApproveButton, (uint64_t (*)(uint64_t))closure #1 in InCallControlsParticipantCell.lmiApproveButton.getter);

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setLmiApproveButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.lmiApproveButton.setter((uint64_t)v4);
}

- (_TtC15ConversationKit19InCallControlButton)lmiRejectButton
{
  id v2 = self;
  id v3 = InCallControlsParticipantCell.lmiApproveButton.getter(&OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiRejectButton, (uint64_t (*)(uint64_t))closure #1 in InCallControlsParticipantCell.lmiRejectButton.getter);

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setLmiRejectButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.lmiRejectButton.setter((uint64_t)v4);
}

- (_TtC15ConversationKit19InCallControlButton)kickMemberButton
{
  id v2 = self;
  id v3 = InCallControlsParticipantCell.kickMemberButton.getter();

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setKickMemberButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.kickMemberButton.setter((uint64_t)v4);
}

- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit29InCallControlsParticipantCell *)InCallControlsParticipantCell.init(frame:)();
}

- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsParticipantCell.init(coder:)();
}

- (void)layoutSubviews
{
  id v2 = self;
  InCallControlsParticipantCell.layoutSubviews()();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6.super.isa = InCallControlsParticipantCell.preferredLayoutAttributesFitting(_:)((UICollectionViewLayoutAttributes)v4).super.isa;

  return v6.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_statusIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_actionButton));
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_viewModel, &demangling cache variable for type metadata for InCallControlsParticipantCellViewModel?);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_cameraSymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_copresenceSymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_linkSymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_messagesSymbolImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiApproveButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiRejectButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___kickMemberButton));
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_callDelegate));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_participantCellDelegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end