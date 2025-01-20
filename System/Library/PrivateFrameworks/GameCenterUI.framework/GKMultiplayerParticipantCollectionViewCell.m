@interface GKMultiplayerParticipantCollectionViewCell
+ (NSString)reuseIdentifier;
- (BOOL)removeButtonHidden;
- (BOOL)sharePlayEnabled;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityNameLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI23GKMultiplayerStatusView)accessibilityStatusAccessoryView;
- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)tapHandler;
- (void)applyWithParticipant:(id)a3 number:(int64_t)a4 isRemovingEnabled:(BOOL)a5 isInvitingEnabled:(BOOL)a6 layoutMode:(int64_t)a7;
- (void)didTapRemoveButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setRemoveButtonHidden:(BOOL)a3;
- (void)setSharePlayEnabled:(BOOL)a3;
- (void)setTapHandler:(id)a3;
@end

@implementation GKMultiplayerParticipantCollectionViewCell

+ (NSString)reuseIdentifier
{
  static GKMultiplayerParticipantCollectionViewCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)sharePlayEnabled
{
  return GKMultiplayerParticipantCollectionViewCell.sharePlayEnabled.getter() & 1;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  v4 = self;
  GKMultiplayerParticipantCollectionViewCell.sharePlayEnabled.setter(a3);
}

- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *)sub_1AF36743C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF367F98();
}

- (id)tapHandler
{
  uint64_t v2 = GKMultiplayerParticipantCollectionViewCell.tapHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3687D4;
    v6[3] = &block_descriptor_12;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTapHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF36A5A0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  GKMultiplayerParticipantCollectionViewCell.tapHandler.setter((uint64_t)v4, v5);
}

- (BOOL)removeButtonHidden
{
  uint64_t v2 = self;
  unsigned __int8 v3 = GKMultiplayerParticipantCollectionViewCell.removeButtonHidden.getter();

  return v3 & 1;
}

- (void)setRemoveButtonHidden:(BOOL)a3
{
  v4 = self;
  GKMultiplayerParticipantCollectionViewCell.removeButtonHidden.setter(a3);
}

- (void)applyWithParticipant:(id)a3 number:(int64_t)a4 isRemovingEnabled:(BOOL)a5 isInvitingEnabled:(BOOL)a6 layoutMode:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  v13 = self;
  GKMultiplayerParticipantCollectionViewCell.apply(participant:number:isRemovingEnabled:isInvitingEnabled:layoutMode:)(v12, a4, v9, v8, (void *)a7);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKMultiplayerParticipantCollectionViewCell.layoutSubviews()();
}

- (void)prepareForReuse
{
  uint64_t v2 = self;
  GKMultiplayerParticipantCollectionViewCell.prepareForReuse()();
}

- (void)didTapRemoveButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1AF369BFC();

  sub_1AF36A4F0((uint64_t)v6);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityNameLabel
{
  id v2 = sub_1AF369F44();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF369F84();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI23GKMultiplayerStatusView)accessibilityStatusAccessoryView
{
  id v2 = sub_1AF369FC4();

  return (_TtC12GameCenterUI23GKMultiplayerStatusView *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_silhouetteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_removeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_vibrantRemoveButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_messagesIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_statusAccessoryView));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_tapHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus);
  uint64_t v4 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus);
  unsigned __int8 v5 = *((unsigned char *)&self->super.super.super.super.__layeringSceneIdentity
       + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus);

  sub_1AF369060(v3, v4, v5);
}

@end