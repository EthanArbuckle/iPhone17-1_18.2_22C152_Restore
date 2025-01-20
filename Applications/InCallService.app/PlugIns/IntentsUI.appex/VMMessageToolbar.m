@interface VMMessageToolbar
- (BOOL)_shouldShowRTTButton;
- (BOOL)isRestricted;
- (NSArray)standardConstraints;
- (VMMessageToolbarDelegate)delegate;
- (VMPlayerControlButton)playerControlButton;
- (VMPlayerControlsView)playerControlsView;
- (VMRTTButton)rttButton;
- (VMRoundButton)audioRouteButton;
- (VMRoundButton)dialRequestButton;
- (VMRoundButton)trashButton;
- (double)playerControlButtonWidthLayoutConstraintConstant;
- (void)commonInit;
- (void)handleActionForButtonSender:(id)a3 event:(id)a4;
- (void)handleActionForPlayerControlButtonSender:(id)a3 event:(id)a4;
- (void)handleActionForRTTButtonSender:(id)a3 event:(id)a4;
- (void)loadConstraints;
- (void)loadViews;
- (void)setAudioRouteButton:(id)a3;
- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDialRequestButton:(id)a3;
- (void)setPlayerControlButton:(id)a3;
- (void)setPlayerControlState:(int64_t)a3;
- (void)setPlayerControlsView:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setRttButton:(id)a3;
- (void)setStandardConstraints:(id)a3;
- (void)setTrashButton:(id)a3;
- (void)unloadConstraints;
- (void)updateAudioRouteButtonWithTouchUpInsideEnabled:(BOOL)a3;
- (void)updateButtonsState;
- (void)updateRTTButton;
@end

@implementation VMMessageToolbar

- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 3uLL:
      v5 = [(VMMessageToolbar *)self trashButton];
      break;
    case 2uLL:
      v5 = [(VMMessageToolbar *)self dialRequestButton];
      break;
    case 1uLL:
      v5 = [(VMMessageToolbar *)self audioRouteButton];
      break;
    default:
      return;
  }
  id v6 = v5;
  [v5 setHidden:!v4];
}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    [(VMMessageToolbar *)self updateButtonsState];
  }
}

- (void)updateAudioRouteButtonWithTouchUpInsideEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VMMessageToolbar *)self audioRouteButton];
  id v6 = v5;
  if (v3) {
    [v5 addTarget:self action:"handleActionForButtonSender:event:" forControlEvents:64];
  }
  else {
    [v5 removeTarget:self forEvents:64];
  }
}

- (void)updateButtonsState
{
  unsigned int v3 = [(VMMessageToolbar *)self isRestricted];
  BOOL v4 = [(VMMessageToolbar *)self playerControlButton];
  v5 = v4;
  if (v3)
  {
    [v4 setEnabled:0];

    id v6 = [(VMMessageToolbar *)self audioRouteButton];
    v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    [v4 setEnabled:1];

    id v6 = [(VMMessageToolbar *)self audioRouteButton];
    v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setEnabled:v8];

  [(VMMessageToolbar *)self updateRTTButton];
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)VMMessageToolbar;
  [(VMMessageToolbar *)&v3 commonInit];
  [(VMMessageToolbar *)self loadViews];
}

- (void)loadViews
{
  objc_super v3 = [[VMRoundButton alloc] initWithType:1];
  audioRouteButton = self->_audioRouteButton;
  self->_audioRouteButton = v3;

  [(VMRoundButton *)self->_audioRouteButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMMessageToolbar *)self updateAudioRouteButtonWithTouchUpInsideEnabled:1];
  [(VMMessageToolbar *)self addSubview:self->_audioRouteButton];
  v5 = [[VMRoundButton alloc] initWithType:2];
  dialRequestButton = self->_dialRequestButton;
  self->_dialRequestButton = v5;

  [(VMRoundButton *)self->_dialRequestButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMRoundButton *)self->_dialRequestButton addTarget:self action:"handleActionForButtonSender:event:" forControlEvents:64];
  [(VMMessageToolbar *)self addSubview:self->_dialRequestButton];
  v7 = [[VMRoundButton alloc] initWithType:3];
  trashButton = self->_trashButton;
  self->_trashButton = v7;

  [(VMRoundButton *)self->_trashButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMRoundButton *)self->_trashButton addTarget:self action:"handleActionForButtonSender:event:" forControlEvents:64];
  [(VMMessageToolbar *)self addSubview:self->_trashButton];
  v9 = +[VMPlayerControlButton buttonWithState:0];
  playerControlButton = self->_playerControlButton;
  self->_playerControlButton = v9;

  [(VMPlayerControlButton *)self->_playerControlButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMPlayerControlButton *)self->_playerControlButton addTarget:self action:"handleActionForPlayerControlButtonSender:event:" forControlEvents:64];
  [(VMMessageToolbar *)self addSubview:self->_playerControlButton];
  if (TUCallScreeningRTTEnabled())
  {
    v11 = objc_alloc_init(VMRTTButton);
    rttButton = self->_rttButton;
    self->_rttButton = v11;

    [(VMRTTButton *)self->_rttButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VMRTTButton *)self->_rttButton addTarget:self action:"handleActionForRTTButtonSender:event:" forControlEvents:64];
    [(VMMessageToolbar *)self addSubview:self->_rttButton];
  }

  [(VMMessageToolbar *)self updateButtonsState];
}

- (void)loadConstraints
{
  v98.receiver = self;
  v98.super_class = (Class)VMMessageToolbar;
  [(VMMessageToolbar *)&v98 loadConstraints];
  id v96 = objc_alloc((Class)NSMutableArray);
  v92 = [(VMMessageToolbar *)self leadingAnchor];
  v94 = [(VMMessageToolbar *)self playerControlButton];
  v90 = [v94 leadingAnchor];
  v88 = [v92 constraintEqualToAnchor:v90 constant:0.0];
  v100[0] = v88;
  v84 = [(VMMessageToolbar *)self topAnchor];
  v86 = [(VMMessageToolbar *)self playerControlButton];
  v82 = [v86 topAnchor];
  v81 = [v84 constraintEqualToAnchor:v82 constant:-18.0];
  v100[1] = v81;
  v79 = [(VMMessageToolbar *)self bottomAnchor];
  v80 = [(VMMessageToolbar *)self playerControlButton];
  v78 = [v80 bottomAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 constant:16.0];
  v100[2] = v77;
  v76 = [(VMMessageToolbar *)self playerControlButton];
  v75 = [v76 widthAnchor];
  [(VMMessageToolbar *)self playerControlButtonWidthLayoutConstraintConstant];
  v74 = [v75 constraintEqualToConstant:];
  v100[3] = v74;
  v73 = [(VMMessageToolbar *)self audioRouteButton];
  v71 = [v73 centerYAnchor];
  v72 = [(VMMessageToolbar *)self playerControlButton];
  v70 = [v72 centerYAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v100[4] = v69;
  v68 = [(VMMessageToolbar *)self audioRouteButton];
  v67 = [v68 heightAnchor];
  v66 = [v67 constraintEqualToConstant:37.0];
  v100[5] = v66;
  v65 = [(VMMessageToolbar *)self audioRouteButton];
  v63 = [v65 bottomAnchor];
  v64 = [(VMMessageToolbar *)self playerControlButton];
  v62 = [v64 bottomAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v100[6] = v61;
  v60 = [(VMMessageToolbar *)self audioRouteButton];
  v58 = [v60 trailingAnchor];
  v59 = [(VMMessageToolbar *)self dialRequestButton];
  v57 = [v59 leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:-20.0];
  v100[7] = v56;
  v55 = [(VMMessageToolbar *)self audioRouteButton];
  v54 = [v55 widthAnchor];
  v53 = [v54 constraintEqualToConstant:37.0];
  v100[8] = v53;
  v52 = [(VMMessageToolbar *)self dialRequestButton];
  v50 = [v52 topAnchor];
  v51 = [(VMMessageToolbar *)self playerControlButton];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v100[9] = v48;
  v47 = [(VMMessageToolbar *)self dialRequestButton];
  v45 = [v47 bottomAnchor];
  v46 = [(VMMessageToolbar *)self playerControlButton];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v100[10] = v43;
  v42 = [(VMMessageToolbar *)self dialRequestButton];
  v40 = [v42 trailingAnchor];
  v41 = [(VMMessageToolbar *)self trashButton];
  v39 = [v41 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:-20.0];
  v100[11] = v38;
  v37 = [(VMMessageToolbar *)self dialRequestButton];
  v35 = [v37 widthAnchor];
  v36 = [(VMMessageToolbar *)self audioRouteButton];
  v34 = [v36 widthAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v100[12] = v33;
  v32 = [(VMMessageToolbar *)self trashButton];
  v30 = [v32 topAnchor];
  v31 = [(VMMessageToolbar *)self playerControlButton];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v100[13] = v28;
  v27 = [(VMMessageToolbar *)self trashButton];
  v25 = [v27 bottomAnchor];
  v26 = [(VMMessageToolbar *)self playerControlButton];
  v24 = [v26 bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v100[14] = v23;
  v22 = [(VMMessageToolbar *)self trashButton];
  objc_super v3 = [v22 widthAnchor];
  BOOL v4 = [(VMMessageToolbar *)self dialRequestButton];
  v5 = [v4 widthAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v100[15] = v6;
  v7 = [(VMMessageToolbar *)self trashButton];
  uint64_t v8 = [v7 trailingAnchor];
  v9 = [(VMMessageToolbar *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v100[16] = v10;
  v11 = +[NSArray arrayWithObjects:v100 count:17];
  id v97 = [v96 initWithArray:v11];

  if (TUCallScreeningRTTEnabled())
  {
    v95 = [(VMMessageToolbar *)self rttButton];
    v91 = [v95 topAnchor];
    v93 = [(VMMessageToolbar *)self playerControlButton];
    v89 = [v93 topAnchor];
    v87 = [v91 constraintEqualToAnchor:v89];
    v99[0] = v87;
    v85 = [(VMMessageToolbar *)self rttButton];
    v83 = [v85 bottomAnchor];
    v12 = [(VMMessageToolbar *)self playerControlButton];
    v13 = [v12 bottomAnchor];
    v14 = [v83 constraintEqualToAnchor:v13];
    v99[1] = v14;
    v15 = [(VMMessageToolbar *)self rttButton];
    v16 = [v15 leadingAnchor];
    v17 = [(VMMessageToolbar *)self playerControlButton];
    v18 = [v17 trailingAnchor];
    v19 = [v16 constraintEqualToAnchor:v18 constant:20.0];
    v99[2] = v19;
    v20 = +[NSArray arrayWithObjects:v99 count:3];
    [v97 addObjectsFromArray:v20];
  }
  [(VMMessageToolbar *)self setStandardConstraints:v97];
  v21 = [(VMMessageToolbar *)self standardConstraints];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)unloadConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)VMMessageToolbar;
  [(VMMessageToolbar *)&v4 unloadConstraints];
  objc_super v3 = [(VMMessageToolbar *)self standardConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];
}

- (void)setPlayerControlState:(int64_t)a3
{
  if (!a3 || a3 == 2)
  {
    objc_super v3 = [(VMMessageToolbar *)self playerControlButton];
    id v5 = v3;
    uint64_t v4 = 1;
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    objc_super v3 = [(VMMessageToolbar *)self playerControlButton];
    id v5 = v3;
    uint64_t v4 = 0;
  }
  [v3 setPlayerState:v4 enabled:1];
}

- (void)updateRTTButton
{
  if ([(VMMessageToolbar *)self _shouldShowRTTButton]
    && ![(VMMessageToolbar *)self isRestricted])
  {
    id v6 = [(VMMessageToolbar *)self rttButton];
    [v6 setHidden:0];

    uint64_t v4 = [(VMMessageToolbar *)self rttButton];
    id v7 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    objc_super v3 = [(VMMessageToolbar *)self rttButton];
    [v3 setHidden:1];

    uint64_t v4 = [(VMMessageToolbar *)self rttButton];
    id v7 = v4;
    uint64_t v5 = 0;
  }
  [v4 setEnabled:v5];
}

- (BOOL)_shouldShowRTTButton
{
  if (!TUCallScreeningRTTEnabled()) {
    return 0;
  }
  objc_super v3 = [(VMMessageToolbar *)self delegate];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___VMMessageToolbarDelegate];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(VMMessageToolbar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 messageToolbarShouldShowRTTButton:self];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)handleActionForPlayerControlButtonSender:(id)a3 event:(id)a4
{
  id v13 = a3;
  id v5 = [(VMMessageToolbar *)self playerControlButton];

  unsigned __int8 v6 = v13;
  if (v5 == v13)
  {
    id v7 = [v13 playerState];
    uint64_t v8 = v7 == (id)1 ? 2 : v7 == 0;
    [v13 setPlayerState:v7 != (id)1 enabled:1];
    v9 = [(VMMessageToolbar *)self playerControlsView];

    unsigned __int8 v6 = v13;
    if (v9)
    {
      v10 = [(VMMessageToolbar *)self playerControlsView];
      v11 = [v10 delegate];

      if (objc_opt_respondsToSelector())
      {
        v12 = [(VMMessageToolbar *)self playerControlsView];
        [v11 playbackControls:v12 didRequestState:v8];
      }
      unsigned __int8 v6 = v13;
    }
  }
}

- (void)handleActionForButtonSender:(id)a3 event:(id)a4
{
  id v12 = a3;
  id v5 = [(VMMessageToolbar *)self delegate];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___VMMessageToolbarDelegate];

  if (v6)
  {
    id v7 = [(VMMessageToolbar *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(VMMessageToolbar *)self audioRouteButton];

      if (v8 == v12)
      {
        uint64_t v11 = 1;
        goto LABEL_9;
      }
      id v9 = [(VMMessageToolbar *)self dialRequestButton];

      if (v9 == v12)
      {
        uint64_t v11 = 2;
        goto LABEL_9;
      }
      id v10 = [(VMMessageToolbar *)self trashButton];

      if (v10 == v12)
      {
        uint64_t v11 = 3;
LABEL_9:
        [v7 messageToolbar:self handleActionForButtonType:v11];
      }
    }
  }
}

- (void)handleActionForRTTButtonSender:(id)a3 event:(id)a4
{
  id v5 = [(VMMessageToolbar *)self delegate];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___VMMessageToolbarDelegate];

  if (v6)
  {
    id v7 = [(VMMessageToolbar *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 messageToolbarDidSelectRTTButton:self];
    }
  }
}

- (double)playerControlButtonWidthLayoutConstraintConstant
{
  v2 = [(VMMessageToolbar *)self playerControlButton];
  id v3 = [v2 playerState];

  if (v3 == (id)1) {
    +[UIImage voicemailPlayGlyphImage];
  }
  else {
  unsigned int v4 = +[UIImage voicemailPauseGlyphImage];
  }
  [v4 size];
  double v6 = v5;

  return v6;
}

- (VMMessageToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMMessageToolbarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VMRoundButton)audioRouteButton
{
  return self->_audioRouteButton;
}

- (void)setAudioRouteButton:(id)a3
{
}

- (VMRoundButton)dialRequestButton
{
  return self->_dialRequestButton;
}

- (void)setDialRequestButton:(id)a3
{
}

- (VMRoundButton)trashButton
{
  return self->_trashButton;
}

- (void)setTrashButton:(id)a3
{
}

- (VMPlayerControlButton)playerControlButton
{
  return self->_playerControlButton;
}

- (void)setPlayerControlButton:(id)a3
{
}

- (VMRTTButton)rttButton
{
  return self->_rttButton;
}

- (void)setRttButton:(id)a3
{
}

- (VMPlayerControlsView)playerControlsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerControlsView);

  return (VMPlayerControlsView *)WeakRetained;
}

- (void)setPlayerControlsView:(id)a3
{
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (NSArray)standardConstraints
{
  return self->_standardConstraints;
}

- (void)setStandardConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardConstraints, 0);
  objc_destroyWeak((id *)&self->_playerControlsView);
  objc_storeStrong((id *)&self->_rttButton, 0);
  objc_storeStrong((id *)&self->_playerControlButton, 0);
  objc_storeStrong((id *)&self->_trashButton, 0);
  objc_storeStrong((id *)&self->_dialRequestButton, 0);
  objc_storeStrong((id *)&self->_audioRouteButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end