@interface GKMultiplayerFooterView
- (BOOL)inviteFriendsButtonEnabled;
- (BOOL)inviteFriendsButtonHidden;
- (BOOL)startGameButtonEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)footerStatusString;
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithFrame:(CGRect)a3;
- (id)inviteFriendsHandler;
- (id)startGameHandler;
- (void)configureUsing:(id)a3;
- (void)didTapButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)layoutSubviews;
- (void)setFooterStatusString:(id)a3;
- (void)setInviteFriendsButtonEnabled:(BOOL)a3;
- (void)setInviteFriendsButtonHidden:(BOOL)a3;
- (void)setInviteFriendsHandler:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setStartGameButtonEnabled:(BOOL)a3;
- (void)setStartGameHandler:(id)a3;
- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3;
@end

@implementation GKMultiplayerFooterView

- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI23GKMultiplayerFooterView *)GKMultiplayerFooterView.init(frame:)();
}

- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF41DC90();
}

- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3
{
  v4 = self;
  sub_1AF41DD6C(a3);
}

- (BOOL)startGameButtonEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF41E0CC();

  return v3 & 1;
}

- (void)setStartGameButtonEnabled:(BOOL)a3
{
  v4 = self;
  sub_1AF41E12C(a3);
}

- (BOOL)inviteFriendsButtonEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF41E2A0();

  return v3 & 1;
}

- (void)setInviteFriendsButtonEnabled:(BOOL)a3
{
  v4 = self;
  sub_1AF41E348(a3);
}

- (BOOL)inviteFriendsButtonHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF41E470();

  return v3 & 1;
}

- (void)setInviteFriendsButtonHidden:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_1AF41E4F0();
}

- (NSString)primaryButtonTitle
{
  return (NSString *)sub_1AF41E640(self, (uint64_t)a2, (void (*)(void))sub_1AF41E594);
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (NSString)secondaryButtonTitle
{
  return (NSString *)sub_1AF41E640(self, (uint64_t)a2, (void (*)(void))sub_1AF41E6C0);
}

- (void)setSecondaryButtonTitle:(id)a3
{
}

- (NSString)footerStatusString
{
  return (NSString *)sub_1AF41E640(self, (uint64_t)a2, (void (*)(void))sub_1AF41E928);
}

- (void)setFooterStatusString:(id)a3
{
}

- (id)startGameHandler
{
  return sub_1AF41ECF0((uint64_t)self, (uint64_t)a2, sub_1AF41EAC8, (uint64_t)&block_descriptor_41_0);
}

- (void)setStartGameHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1AF41EB7C((uint64_t)v4, v5);
}

- (id)inviteFriendsHandler
{
  return sub_1AF41ECF0((uint64_t)self, (uint64_t)a2, sub_1AF41ED98, (uint64_t)&block_descriptor_29);
}

- (void)setInviteFriendsHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF388384;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1AF41EE4C((uint64_t)v4, v5);
}

- (void)configureUsing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AF41F128();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF41F1EC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1AF41F88C(width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  unsigned __int8 v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)didTapButton:(id)a3
{
}

- (void)didTapSecondaryButton:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_statusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_topSeparator));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_startGameHandler));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_inviteFriendsHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView____lazy_storage___secondaryButtonFocusGuide));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView____lazy_storage___primaryButtonFocusGuide);
}

@end