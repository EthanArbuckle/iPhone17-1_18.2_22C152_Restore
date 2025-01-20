@interface DBInCallWidgetAvatarView
- (CNAvatarViewController)avatarController;
- (CNAvatarViewControllerSettings)avatarControllerSettings;
- (DBInCallWidgetAvatarView)initWithFrame:(CGRect)a3;
- (NSString)appBundleIdentifier;
- (TUCall)currentCall;
- (UIImageView)appIconView;
- (UIImageView)focusRingView;
- (void)_setupImagesIfNecessary;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppIconView:(id)a3;
- (void)setAvatarController:(id)a3;
- (void)setAvatarControllerSettings:(id)a3;
- (void)setCurrentCall:(id)a3;
- (void)setFocusRingView:(id)a3;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBInCallWidgetAvatarView

- (DBInCallWidgetAvatarView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)DBInCallWidgetAvatarView;
  v3 = -[DBInCallWidgetAvatarView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263EFEBC8];
    v5 = [MEMORY[0x263F7E1A0] sharedInstance];
    v6 = [v5 contactStore];
    uint64_t v7 = [v4 settingsWithContactStore:v6 threeDTouchEnabled:0];
    avatarControllerSettings = v3->_avatarControllerSettings;
    v3->_avatarControllerSettings = (CNAvatarViewControllerSettings *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFEBC0]) initWithSettings:v3->_avatarControllerSettings];
    avatarController = v3->_avatarController;
    v3->_avatarController = (CNAvatarViewController *)v9;

    v11 = [(CNAvatarViewController *)v3->_avatarController view];
    [(DBInCallWidgetAvatarView *)v3 addSubview:v11];

    v12 = [(CNAvatarViewController *)v3->_avatarController view];
    [v12 setUserInteractionEnabled:0];

    [(DBInCallWidgetAvatarView *)v3 setClipsToBounds:0];
    id v13 = objc_alloc_init(MEMORY[0x263F82828]);
    [(DBInCallWidgetAvatarView *)v3 addSubview:v13];
    [(DBInCallWidgetAvatarView *)v3 setAppIconView:v13];
    id v14 = objc_alloc(MEMORY[0x263F82828]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    focusRingView = v3->_focusRingView;
    v3->_focusRingView = (UIImageView *)v15;

    v17 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UIImageView *)v3->_focusRingView setTintColor:v17];

    [(UIImageView *)v3->_focusRingView setHidden:1];
    [(UIImageView *)v3->_focusRingView setUserInteractionEnabled:0];
    [(DBInCallWidgetAvatarView *)v3 addSubview:v3->_focusRingView];
    [(DBInCallWidgetAvatarView *)v3 _setupImagesIfNecessary];
    [(DBInCallWidgetAvatarView *)v3 setupConstraints];
  }
  return v3;
}

- (void)setupConstraints
{
  v61[14] = *MEMORY[0x263EF8340];
  v3 = [(DBInCallWidgetAvatarView *)self avatarController];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(DBInCallWidgetAvatarView *)self appIconView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(DBInCallWidgetAvatarView *)self focusRingView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = (void *)MEMORY[0x263F08938];
  v60 = [(DBInCallWidgetAvatarView *)self widthAnchor];
  v59 = [v60 constraintEqualToConstant:49.0];
  v61[0] = v59;
  v58 = [(DBInCallWidgetAvatarView *)self heightAnchor];
  v57 = [v58 constraintEqualToConstant:49.0];
  v61[1] = v57;
  v56 = [(DBInCallWidgetAvatarView *)self avatarController];
  v55 = [v56 view];
  v54 = [v55 leadingAnchor];
  v53 = [(DBInCallWidgetAvatarView *)self leadingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:4.0];
  v61[2] = v52;
  v51 = [(DBInCallWidgetAvatarView *)self avatarController];
  v50 = [v51 view];
  v49 = [v50 trailingAnchor];
  v48 = [(DBInCallWidgetAvatarView *)self trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:-5.0];
  v61[3] = v47;
  v46 = [(DBInCallWidgetAvatarView *)self avatarController];
  v45 = [v46 view];
  v44 = [v45 topAnchor];
  v43 = [(DBInCallWidgetAvatarView *)self topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:4.0];
  v61[4] = v42;
  v41 = [(DBInCallWidgetAvatarView *)self avatarController];
  v40 = [v41 view];
  v38 = [v40 bottomAnchor];
  v37 = [(DBInCallWidgetAvatarView *)self bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:-5.0];
  v61[5] = v36;
  v35 = [(DBInCallWidgetAvatarView *)self focusRingView];
  v34 = [v35 widthAnchor];
  v33 = [v34 constraintEqualToConstant:49.0];
  v61[6] = v33;
  v32 = [(DBInCallWidgetAvatarView *)self focusRingView];
  v31 = [v32 heightAnchor];
  v30 = [v31 constraintEqualToConstant:49.0];
  v61[7] = v30;
  v29 = [(DBInCallWidgetAvatarView *)self focusRingView];
  v28 = [v29 centerXAnchor];
  v27 = [(DBInCallWidgetAvatarView *)self centerXAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v61[8] = v26;
  v25 = [(DBInCallWidgetAvatarView *)self focusRingView];
  v24 = [v25 centerYAnchor];
  v23 = [(DBInCallWidgetAvatarView *)self centerYAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v61[9] = v22;
  v21 = [(DBInCallWidgetAvatarView *)self appIconView];
  v20 = [v21 trailingAnchor];
  objc_super v19 = [(DBInCallWidgetAvatarView *)self trailingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:-4.0];
  v61[10] = v18;
  v17 = [(DBInCallWidgetAvatarView *)self appIconView];
  uint64_t v7 = [v17 bottomAnchor];
  v8 = [(DBInCallWidgetAvatarView *)self bottomAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8 constant:-4.0];
  v61[11] = v9;
  v10 = [(DBInCallWidgetAvatarView *)self appIconView];
  v11 = [v10 widthAnchor];
  v12 = [v11 constraintEqualToConstant:13.0];
  v61[12] = v12;
  id v13 = [(DBInCallWidgetAvatarView *)self appIconView];
  id v14 = [v13 heightAnchor];
  uint64_t v15 = [v14 constraintEqualToConstant:13.0];
  v61[13] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:14];
  [v39 activateConstraints:v16];
}

- (void)_setupImagesIfNecessary
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  v5 = [(DBInCallWidgetAvatarView *)self traitCollection];
  id v6 = [v3 imageNamed:@"CarInCallWidgetAvatarFocusRing" inBundle:v4 compatibleWithTraitCollection:v5];

  [(UIImageView *)self->_focusRingView setImage:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBInCallWidgetAvatarView;
  [(DBInCallWidgetAvatarView *)&v4 traitCollectionDidChange:a3];
  [(DBInCallWidgetAvatarView *)self _setupImagesIfNecessary];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v7 = [a3 nextFocusedItem];
  BOOL v5 = v7 != self;
  id v6 = [(DBInCallWidgetAvatarView *)self focusRingView];
  [v6 setHidden:v5];
}

- (void)setCurrentCall:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_currentCall = &self->_currentCall;
  objc_storeStrong((id *)&self->_currentCall, a3);
  if ([(TUCall *)self->_currentCall isConferenced]) {
    goto LABEL_11;
  }
  if ([(TUCall *)*p_currentCall isConversation])
  {
    uint64_t v7 = [MEMORY[0x263F7E1A0] sharedInstance];
    v8 = [v7 activeConversationForCall:*p_currentCall];

    char v9 = [v8 isOneToOneModeEnabled] ^ 1;
  }
  else
  {
    char v9 = 0;
  }
  if (!*p_currentCall
    || (v9 & 1) != 0
    || ([(TUCall *)*p_currentCall contactIdentifiers],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 firstObject],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        v10,
        !v12))
  {
LABEL_11:
    [(CNAvatarViewController *)self->_avatarController setContacts:MEMORY[0x263EFFA68]];
  }
  else
  {
    id v13 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v14 = [v13 contactStore];

    uint64_t v15 = [(TUCall *)*p_currentCall contactIdentifiers];
    v16 = [v15 firstObject];
    v25[0] = *MEMORY[0x263EFDFF0];
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    id v23 = 0;
    v18 = [v14 unifiedContactWithIdentifier:v16 keysToFetch:v17 error:&v23];
    id v19 = v23;

    if (v18)
    {
      v24 = v18;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      [(CNAvatarViewController *)self->_avatarController setContacts:v20];
    }
  }
  v21 = [(TUCall *)*p_currentCall provider];
  v22 = [v21 displayAppBundleIdentifier];
  [(DBInCallWidgetAvatarView *)self setAppBundleIdentifier:v22];
}

- (void)setAppBundleIdentifier:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 isEqualToString:self->_appBundleIdentifier];
  id v5 = v20;
  if ((v4 & 1) == 0)
  {
    id v6 = (NSString *)[v20 copy];
    appBundleIdentifier = self->_appBundleIdentifier;
    self->_appBundleIdentifier = v6;

    v8 = [(DBInCallWidgetAvatarView *)self appBundleIdentifier];

    if (v8)
    {
      char v9 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B590]];
      [v9 size];
      double v11 = v10;
      double v13 = v12;
      id v14 = [(DBInCallWidgetAvatarView *)self traitCollection];
      [v14 displayScale];
      double v16 = v15;

      v17 = [(DBInCallWidgetAvatarView *)self appBundleIdentifier];
      v18 = DBIconImageForBundleIdentifierWithInfoAndBorder(v17, 0, v11, v13, v16, 13.5);
      id v19 = [(DBInCallWidgetAvatarView *)self appIconView];
      [v19 setImage:v18];
    }
    else
    {
      char v9 = [(DBInCallWidgetAvatarView *)self appIconView];
      [v9 setImage:0];
    }

    id v5 = v20;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (TUCall)currentCall
{
  return self->_currentCall;
}

- (CNAvatarViewControllerSettings)avatarControllerSettings
{
  return self->_avatarControllerSettings;
}

- (void)setAvatarControllerSettings:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CNAvatarViewController)avatarController
{
  return self->_avatarController;
}

- (void)setAvatarController:(id)a3
{
}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (void)setAppIconView:(id)a3
{
}

- (UIImageView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRingView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_avatarController, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarControllerSettings, 0);
  objc_storeStrong((id *)&self->_currentCall, 0);
}

@end