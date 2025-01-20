@interface CNGameCenterCell
- (BOOL)showsGameCenterLabel;
- (CNGameCenterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNPresenterDelegate)presentingDelegate;
- (NSString)playerID;
- (UILabel)gameCenterLabel;
- (UIView)playerView;
- (UIView)playerViewContainer;
- (UIViewController)profileViewController;
- (id)constantConstraintsForHorizontalLayout;
- (id)constantConstraintsForVerticalLayout;
- (id)labelView;
- (id)variableConstraints;
- (id)variableConstraintsForHorizontalLayout;
- (void)dismissProfileViewController;
- (void)presentPlayerProfile;
- (void)setCardGroupItem:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewContainer:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setProfileViewController:(id)a3;
- (void)setShowsGameCenterLabel:(BOOL)a3;
- (void)setupViews;
- (void)updateViewsWithCardGroupItem:(id)a3;
@end

@implementation CNGameCenterCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_profileViewController, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_playerViewContainer, 0);

  objc_storeStrong((id *)&self->_gameCenterLabel, 0);
}

- (void)setPresentingDelegate:(id)a3
{
}

- (CNPresenterDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setProfileViewController:(id)a3
{
}

- (UIViewController)profileViewController
{
  return self->_profileViewController;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerView:(id)a3
{
}

- (UIView)playerView
{
  return self->_playerView;
}

- (void)setPlayerViewContainer:(id)a3
{
}

- (UIView)playerViewContainer
{
  return self->_playerViewContainer;
}

- (UILabel)gameCenterLabel
{
  return self->_gameCenterLabel;
}

- (void)setShowsGameCenterLabel:(BOOL)a3
{
  self->_showsGameCenterLabel = a3;
}

- (BOOL)showsGameCenterLabel
{
  return self->_showsGameCenterLabel;
}

- (void)dismissProfileViewController
{
  v3 = [(CNGameCenterCell *)self presentingDelegate];
  v4 = [(CNGameCenterCell *)self profileViewController];
  [v3 sender:self dismissViewController:v4];

  [(CNGameCenterCell *)self setProfileViewController:0];
}

- (void)presentPlayerProfile
{
  v17[2] = *MEMORY[0x1E4F143B8];
  Class GKDaemonProxyClass_48826 = getGKDaemonProxyClass_48826();
  v4 = [(objc_class *)getGKLocalPlayerClass_48827() currentLocalPlayer];
  v15 = [(objc_class *)GKDaemonProxyClass_48826 proxyForPlayer:v4];

  uint64_t v5 = getpid();
  v6 = [v15 utilityService];
  v7 = [(Class)getGKGameClass[0]() currentGame];
  v8 = [v7 internal];
  v9 = getGKRemoteAlertDeeplinkActionKey[0]();
  v16[0] = v9;
  v10 = getGKRemoteAlertDeeplinkActionPlayerProfileValue[0]();
  v17[0] = v10;
  v11 = getGKRemoteAlertDeeplinkPlayerIdentifierKey[0]();
  v16[1] = v11;
  v12 = [(CNGameCenterCell *)self playerID];
  v17[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14 = getGKDashboardLaunchContextContacts[0]();
  [v6 openDashboardAsRemoteAlertForGame:v8 hostPID:v5 deeplink:v13 launchContext:v14];
}

- (id)variableConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)constantConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)constantConstraintsForVerticalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)variableConstraints
{
  v59[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v56.receiver = self;
  v56.super_class = (Class)CNGameCenterCell;
  v4 = [(CNLabeledCell *)&v56 variableConstraints];
  uint64_t v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(CNGameCenterCell *)self labelView];
  unint64_t v7 = 0x1E4F1C000uLL;
  id v55 = v5;
  if (v6
    && (v8 = (void *)v6,
        BOOL v9 = [(CNGameCenterCell *)self showsGameCenterLabel],
        v8,
        v9))
  {
    v49 = [(CNGameCenterCell *)self gameCenterLabel];
    v41 = [v49 leadingAnchor];
    v39 = [(CNGameCenterCell *)self contentView];
    v10 = [v39 layoutMarginsGuide];
    v11 = [v10 leadingAnchor];
    v12 = [v41 constraintEqualToAnchor:v11];
    v59[0] = v12;
    v53 = [(CNGameCenterCell *)self gameCenterLabel];
    v47 = [v53 trailingAnchor];
    v51 = [(CNGameCenterCell *)self contentView];
    v45 = [v51 layoutMarginsGuide];
    v43 = [v45 trailingAnchor];
    v38 = [v47 constraintEqualToAnchor:v43];
    v59[1] = v38;
    v37 = [(CNGameCenterCell *)self gameCenterLabel];
    v35 = [v37 topAnchor];
    v36 = [(CNGameCenterCell *)self contentView];
    v34 = [v36 topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34 constant:13.0];
    v59[2] = v33;
    v32 = [(CNGameCenterCell *)self gameCenterLabel];
    v13 = [v32 bottomAnchor];
    v14 = [(CNGameCenterCell *)self playerViewContainer];
    v15 = [v14 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v59[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
    [v5 addObjectsFromArray:v17];

    v18 = v39;
    v19 = v49;

    unint64_t v7 = 0x1E4F1C000;
    v20 = v41;
  }
  else
  {
    v19 = [(CNGameCenterCell *)self playerViewContainer];
    v20 = [v19 topAnchor];
    v18 = [(CNGameCenterCell *)self contentView];
    v10 = [v18 topAnchor];
    v11 = [v20 constraintEqualToAnchor:v10 constant:8.0];
    v58 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    [v5 addObjectsFromArray:v12];
  }

  v54 = [(CNGameCenterCell *)self playerViewContainer];
  v50 = [v54 leadingAnchor];
  v52 = [(CNGameCenterCell *)self contentView];
  v48 = [v52 layoutMarginsGuide];
  v46 = [v48 leadingAnchor];
  v44 = [v50 constraintEqualToAnchor:v46];
  v57[0] = v44;
  v42 = [(CNGameCenterCell *)self playerViewContainer];
  v40 = [v42 trailingAnchor];
  v21 = [(CNGameCenterCell *)self contentView];
  v22 = [v21 layoutMarginsGuide];
  v23 = [v22 trailingAnchor];
  v24 = [v40 constraintEqualToAnchor:v23];
  v57[1] = v24;
  v25 = [(CNGameCenterCell *)self playerViewContainer];
  v26 = [v25 bottomAnchor];
  v27 = [(CNGameCenterCell *)self contentView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v57[2] = v29;
  v30 = [*(id *)(v7 + 2424) arrayWithObjects:v57 count:3];
  [v55 addObjectsFromArray:v30];

  return v55;
}

- (id)labelView
{
  gameCenterLabel = self->_gameCenterLabel;
  if (!gameCenterLabel)
  {
    v4 = [(CNLabeledCell *)self standardLabelView];
    uint64_t v5 = self->_gameCenterLabel;
    self->_gameCenterLabel = v4;

    uint64_t v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)self->_gameCenterLabel setFont:v6];

    unint64_t v7 = CNContactsUIBundle();
    v8 = [v7 localizedStringForKey:@"GAME_CENTER_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [(UILabel *)self->_gameCenterLabel setText:v8];

    gameCenterLabel = self->_gameCenterLabel;
  }

  return gameCenterLabel;
}

- (void)setupViews
{
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  playerViewContainer = self->_playerViewContainer;
  self->_playerViewContainer = v3;

  [(UIView *)self->_playerViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(CNGameCenterCell *)self contentView];
  [v5 addSubview:self->_playerViewContainer];
}

- (void)updateViewsWithCardGroupItem:(id)a3
{
  v40[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNGameCenterCell *)self playerView];

  if (v5)
  {
    uint64_t v6 = [(CNGameCenterCell *)self playerView];
    [v6 removeFromSuperview];
  }
  v38 = [v4 relationshipResult];
  unint64_t v7 = [v38 relatedPlayer];
  [v7 playerID];
  v8 = v39 = v4;
  [(CNGameCenterCell *)self setPlayerID:v8];

  BOOL v9 = (void *)[(Class)getGKGameCenterFriendPlayerViewClass[0]() newWithRelationshipResult:v38];
  [(CNGameCenterCell *)self setPlayerView:v9];

  v10 = [(CNGameCenterCell *)self playerView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(CNGameCenterCell *)self playerViewContainer];
  v12 = [(CNGameCenterCell *)self playerView];
  [v11 addSubview:v12];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v37 = [(CNGameCenterCell *)self playerView];
  v35 = [v37 topAnchor];
  v36 = [(CNGameCenterCell *)self playerViewContainer];
  v34 = [v36 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v40[0] = v33;
  v32 = [(CNGameCenterCell *)self playerView];
  v30 = [v32 bottomAnchor];
  v31 = [(CNGameCenterCell *)self playerViewContainer];
  v29 = [v31 bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v40[1] = v28;
  v26 = [(CNGameCenterCell *)self playerView];
  v24 = [v26 leadingAnchor];
  v25 = [(CNGameCenterCell *)self playerViewContainer];
  v23 = [v25 leadingAnchor];
  v13 = [v24 constraintEqualToAnchor:v23];
  v40[2] = v13;
  v14 = [(CNGameCenterCell *)self playerView];
  v15 = [v14 trailingAnchor];
  v16 = [(CNGameCenterCell *)self playerViewContainer];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v40[3] = v18;
  v19 = [(CNGameCenterCell *)self playerView];
  v20 = [v19 heightAnchor];
  v21 = [v20 constraintGreaterThanOrEqualToConstant:70.0];
  v40[4] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
  [v27 activateConstraints:v22];
}

- (void)setCardGroupItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNGameCenterCell;
  id v4 = a3;
  [(CNContactCell *)&v5 setCardGroupItem:v4];
  -[CNGameCenterCell updateViewsWithCardGroupItem:](self, "updateViewsWithCardGroupItem:", v4, v5.receiver, v5.super_class);
}

- (CNGameCenterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNGameCenterCell;
  id v4 = [(CNLabeledCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4)
  {
    [(CNGameCenterCell *)v4 setupViews];
    uint64_t v6 = v5;
  }

  return v5;
}

@end