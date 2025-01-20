@interface FriendRequestCardViewController
- (GKDashboardPlayerPhotoView)friendAvatarView;
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (NSLayoutConstraint)topMostConstriant;
- (UIButton)acceptButton;
- (UIButton)ignoreButton;
- (UIButton)receiverActionStatus;
- (UIImageView)gameCenterPhoto;
- (UILabel)achievementsCountLabel;
- (UILabel)achievementsLabel;
- (UILabel)edgeCaseStateLabel;
- (UILabel)errorStateLabel;
- (UILabel)friendsCountLabel;
- (UILabel)friendsLabel;
- (UILabel)gameCenterLabel;
- (UILabel)gamesCountLabel;
- (UILabel)gamesLabel;
- (UILabel)inviteStatusInfoLabel;
- (UILabel)playerName;
- (UILabel)secondSubtitleLabel;
- (UILabel)subTitle;
- (UILabel)tryAgainLabel;
- (UILabel)viewFriendsLabel;
- (UIStackView)buttonsStackView;
- (UIStackView)centerStackView;
- (UIStackView)inviteAcceptedStackView;
- (UIStackView)playerProfileInfoBarAndButtonStackView;
- (UIStackView)playerProfileInfoBarStackView;
- (UIStackView)receiverInfoStackView;
- (UIView)dividerView;
- (UIView)mainContainer;
- (_TtC26GameCenterMessageExtension31FriendRequestCardViewController)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension31FriendRequestCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)acceptButtonPressed;
- (void)avatarContentIsReady;
- (void)avatarPressed:(id)a3;
- (void)dealloc;
- (void)friendAvatarPressed:(id)a3;
- (void)ignoreButtonPressed;
- (void)setAcceptButton:(id)a3;
- (void)setAchievementsCountLabel:(id)a3;
- (void)setAchievementsLabel:(id)a3;
- (void)setButtonsStackView:(id)a3;
- (void)setCenterStackView:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setEdgeCaseStateLabel:(id)a3;
- (void)setErrorStateLabel:(id)a3;
- (void)setFriendAvatarView:(id)a3;
- (void)setFriendsCountLabel:(id)a3;
- (void)setFriendsLabel:(id)a3;
- (void)setGameCenterLabel:(id)a3;
- (void)setGameCenterPhoto:(id)a3;
- (void)setGamesCountLabel:(id)a3;
- (void)setGamesLabel:(id)a3;
- (void)setIgnoreButton:(id)a3;
- (void)setInviteAcceptedStackView:(id)a3;
- (void)setInviteStatusInfoLabel:(id)a3;
- (void)setMainContainer:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
- (void)setPlayerName:(id)a3;
- (void)setPlayerProfileInfoBarAndButtonStackView:(id)a3;
- (void)setPlayerProfileInfoBarStackView:(id)a3;
- (void)setReceiverActionStatus:(id)a3;
- (void)setReceiverInfoStackView:(id)a3;
- (void)setSecondSubtitleLabel:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTopMostConstriant:(id)a3;
- (void)setTryAgainLabel:(id)a3;
- (void)setViewFriendsLabel:(id)a3;
- (void)tryAgainPressed:(id)a3;
- (void)updateCard:(id)a3;
- (void)viewDidLoad;
- (void)viewGameCenterFriendsTapped:(id)a3;
@end

@implementation FriendRequestCardViewController

- (UIView)mainContainer
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setMainContainer:(id)a3
{
}

- (UILabel)playerName
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setPlayerName:(id)a3
{
}

- (UILabel)subTitle
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setSubTitle:(id)a3
{
}

- (UILabel)inviteStatusInfoLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setInviteStatusInfoLabel:(id)a3
{
}

- (UILabel)secondSubtitleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setSecondSubtitleLabel:(id)a3
{
}

- (UILabel)viewFriendsLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setViewFriendsLabel:(id)a3
{
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (GKDashboardPlayerPhotoView *)Strong;
}

- (void)setPlayerAvatarView:(id)a3
{
}

- (UIButton)acceptButton
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setAcceptButton:(id)a3
{
}

- (UILabel)gameCenterLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setGameCenterLabel:(id)a3
{
}

- (UIImageView)gameCenterPhoto
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIImageView *)Strong;
}

- (void)setGameCenterPhoto:(id)a3
{
}

- (UIButton)ignoreButton
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setIgnoreButton:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setButtonsStackView:(id)a3
{
}

- (UILabel)friendsCountLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setFriendsCountLabel:(id)a3
{
}

- (UILabel)friendsLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setFriendsLabel:(id)a3
{
}

- (UILabel)gamesLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setGamesLabel:(id)a3
{
}

- (UILabel)achievementsLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setAchievementsLabel:(id)a3
{
}

- (UILabel)achievementsCountLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setAchievementsCountLabel:(id)a3
{
}

- (UILabel)gamesCountLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setGamesCountLabel:(id)a3
{
}

- (UIStackView)playerProfileInfoBarStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setPlayerProfileInfoBarStackView:(id)a3
{
}

- (GKDashboardPlayerPhotoView)friendAvatarView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (GKDashboardPlayerPhotoView *)Strong;
}

- (void)setFriendAvatarView:(id)a3
{
}

- (UIStackView)playerProfileInfoBarAndButtonStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setPlayerProfileInfoBarAndButtonStackView:(id)a3
{
}

- (UILabel)errorStateLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setErrorStateLabel:(id)a3
{
}

- (UIStackView)receiverInfoStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setReceiverInfoStackView:(id)a3
{
}

- (UIView)dividerView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setDividerView:(id)a3
{
}

- (UILabel)tryAgainLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTryAgainLabel:(id)a3
{
}

- (UILabel)edgeCaseStateLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setEdgeCaseStateLabel:(id)a3
{
}

- (UIButton)receiverActionStatus
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setReceiverActionStatus:(id)a3
{
}

- (UIStackView)inviteAcceptedStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setInviteAcceptedStackView:(id)a3
{
}

- (NSLayoutConstraint)topMostConstriant
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant));
}

- (void)setTopMostConstriant:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)centerStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView));
}

- (void)setCenterStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView) = (Class)a3;
  id v3 = a3;
}

- (void)dealloc
{
  id v3 = self;
  id v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FriendRequestCardViewController();
  [(FriendRequestCardViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);

  sub_100010AE4(v3);
}

- (void)avatarContentIsReady
{
  id v5 = self;
  uint64_t v2 = sub_10003F89C();
  if (v2)
  {
    uint64_t v3 = (_TtC26GameCenterMessageExtension31FriendRequestCardViewController *)v2;
    sub_10002DB48();

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_100008D74();
}

- (void)updateCard:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100010B48();
}

- (void)acceptButtonPressed
{
  uint64_t v2 = self;
  sub_10000A13C();
}

- (void)ignoreButtonPressed
{
  uint64_t v2 = self;
  sub_10000B620();
}

- (void)avatarPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100010EEC();
}

- (void)friendAvatarPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10001105C();
}

- (void)viewGameCenterFriendsTapped:(id)a3
{
  v8 = self;
  id v4 = (_TtC26GameCenterMessageExtension31FriendRequestCardViewController *)a3;
  uint64_t v5 = sub_10003F89C();
  if (v5)
  {
    objc_super v6 = (_TtC26GameCenterMessageExtension31FriendRequestCardViewController *)v5;
    id v7 = [objc_allocWithZone((Class)GKReporter) init];
    [v7 reportEvent:GKReporterDomainImprovedFriendingUIInteractions type:GKViewFriendListButtonTapped];

    sub_10002E00C();
    id v4 = v8;
    v8 = v6;
  }
}

- (void)tryAgainPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100011308();
}

- (_TtC26GameCenterMessageExtension31FriendRequestCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100047E68();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC26GameCenterMessageExtension31FriendRequestCardViewController *)sub_10000F8B4(v5, v7, a4);
}

- (_TtC26GameCenterMessageExtension31FriendRequestCardViewController)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension31FriendRequestCardViewController *)sub_10000FC44(a3);
}

@end