@interface CKEffectPickerMacViewController
- (BOOL)effectSelectionViewController:(id)a3 didSelectEffectWithIdentifier:(id)a4;
- (BOOL)effectShouldDisplayOverBalloon:(id)a3;
- (BOOL)hasSelectedDefaultEffect;
- (BOOL)isInlineReply;
- (BOOL)showingInStandAloneWindow;
- (CGPoint)balloonViewOrigin;
- (CKBalloonView)balloonView;
- (CKChatControllerDummyAnimator)dummyAnimator;
- (CKComposition)composition;
- (CKEffectPickerMacViewController)initWithComposition:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5;
- (CKEffectPickerMacViewController)initWithEntryView:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5 isInlineReply:(BOOL)a6;
- (CKEffectPickerViewControllerDelegate)delegate;
- (CKEffectPreviewCollectionViewController)effectCollectionViewController;
- (CKEffectSelectionViewController)selectionViewController;
- (CKFullScreenEffectManager)fsem;
- (CKMessageEntryView)entryView;
- (NSLayoutConstraint)balloonHeightConstraint;
- (NSLayoutConstraint)balloonWidthConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSString)effectIdentifier;
- (UIButton)closeButton;
- (UILabel)titleLabel;
- (UIVibrancyEffect)titleVibrancyEffect;
- (UIView)balloonContainer;
- (UIView)contentView;
- (UIView)effectPreviewOverlayView;
- (UIView)effectsPresentingView;
- (UIView)sendButton;
- (UIViewController)effectsPresentingViewController;
- (UIViewController)wolfEffectSelectionVC;
- (UIVisualEffectView)titleContainerView;
- (char)color;
- (id)_defaultSendAnimationContextForAnimationPreview;
- (id)createSendButton;
- (id)keyCommands;
- (void)closeButtonPressed:(id)a3;
- (void)createBalloonView;
- (void)createTranscriptBlurBackground;
- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)keyCommandReturn:(id)a3;
- (void)placeBalloonContainer:(id)a3;
- (void)placeSendButton;
- (void)setBalloonContainer:(id)a3;
- (void)setBalloonHeightConstraint:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setBalloonViewOrigin:(CGPoint)a3;
- (void)setBalloonWidthConstraint:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setColor:(char)a3;
- (void)setComposition:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDummyAnimator:(id)a3;
- (void)setEffectCollectionViewController:(id)a3;
- (void)setEffectIdentifier:(id)a3;
- (void)setEffectPreviewOverlayView:(id)a3;
- (void)setEffectsPresentingView:(id)a3;
- (void)setEffectsPresentingViewController:(id)a3;
- (void)setFsem:(id)a3;
- (void)setHasSelectedDefaultEffect:(BOOL)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setIsInlineReply:(BOOL)a3;
- (void)setSelectionViewController:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setShowingInStandAloneWindow:(BOOL)a3;
- (void)setTitleContainerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleVibrancyEffect:(id)a3;
- (void)setWolfEffectSelectionVC:(id)a3;
- (void)showCloseButton;
- (void)startAnimationPreviewForIdentifier:(id)a3;
- (void)touchUpInsideSendButton:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKEffectPickerMacViewController

- (CKEffectPickerMacViewController)initWithComposition:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEffectPickerMacViewController;
  v11 = [(CKEffectPickerMacViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_composition, a3);
    v12->_balloonViewOrigin.CGFloat x = x;
    v12->_balloonViewOrigin.CGFloat y = y;
    v12->_color = a5;
    v12->_hasSelectedDefaultEffect = 0;
    v13 = objc_alloc_init(CKFullScreenEffectManager);
    fsem = v12->_fsem;
    v12->_fsem = v13;

    v12->_showingInStandAloneWindow = 0;
    v12->_isInlineReplCGFloat y = 0;
  }

  return v12;
}

- (CKEffectPickerMacViewController)initWithEntryView:(id)a3 balloonViewOrigin:(CGPoint)a4 color:(char)a5 isInlineReply:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKEffectPickerMacViewController;
  v12 = [(CKEffectPickerMacViewController *)&v17 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_entryView, v11);
    v13->_balloonViewOrigin.CGFloat x = x;
    v13->_balloonViewOrigin.CGFloat y = y;
    v13->_color = a5;
    v13->_hasSelectedDefaultEffect = 0;
    v14 = objc_alloc_init(CKFullScreenEffectManager);
    fsem = v13->_fsem;
    v13->_fsem = v14;

    v13->_showingInStandAloneWindow = 0;
    v13->_isInlineReplCGFloat y = a6;
  }

  return v13;
}

- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (!a3) {
    [(UIViewController *)self->_wolfEffectSelectionVC dismissViewControllerAnimated:1 completion:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)CKEffectPickerMacViewController;
  [(CKEffectPickerMacViewController *)&v9 dismissViewControllerAnimated:v5 completion:v8];
}

- (void)createTranscriptBlurBackground
{
  v3 = [CKEffectPickerBackgroundView alloc];
  v4 = [(CKEffectPickerMacViewController *)self view];
  [v4 bounds];
  objc_super v9 = -[CKEffectPickerBackgroundView initWithFrame:](v3, "initWithFrame:");

  [(CKEffectPickerBackgroundView *)v9 setBackgroundColorForTranscriptType:[(CKEffectPickerMacViewController *)self isInlineReply]];
  [(CKEffectPickerBackgroundView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = [(CKEffectPickerMacViewController *)self view];
  [v5 addSubview:v9];

  v6 = [(CKEffectPickerMacViewController *)self view];
  [(UIView *)v9 __ck_makeEdgesEqualTo:v6];

  v7 = [(CKEffectPickerBackgroundView *)v9 effectView];
  id v8 = [v7 contentView];
  [(CKEffectPickerMacViewController *)self setContentView:v8];
}

- (void)createBalloonView
{
  CKBalloonViewForClass([(CKComposition *)self->_composition balloonViewClass]);
  v3 = (CKBalloonView *)objc_claimAutoreleasedReturnValue();
  [(CKBalloonView *)v3 configureForComposition:self->_composition];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CKBalloonView *)v3 setColor:self->_color];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 isAccessibilityPreferredContentSizeCategory];

    if (v5) {
      [(CKBalloonView *)v3 truncateForLargeText];
    }
  }
  [(CKBalloonView *)v3 setCanUseOpaqueMask:0];
  [(CKBalloonView *)v3 setUserInteractionEnabled:0];
  balloonView = self->_balloonView;
  self->_balloonView = v3;
}

- (id)createSendButton
{
  v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 theme];
  v6 = objc_msgSend(v5, "sendButtonColorForColorType:", -[CKEffectPickerMacViewController color](self, "color"));

  [v3 setContentHorizontalAlignment:3];
  [v3 setContentVerticalAlignment:3];
  v7 = +[CKEntryViewButton entryViewButtonImageForType:4 color:[(CKEffectPickerMacViewController *)self color]];
  id v8 = [v7 _imageThatSuppressesAccessibilityHairlineThickening];

  [v3 setImage:v8 forState:0];
  [v3 setImage:v8 forState:4];
  [v3 setTintColor:v6];
  [v3 addTarget:self action:sel_touchUpInsideSendButton_ forControlEvents:64];

  return v3;
}

- (void)placeSendButton
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CKEffectPickerMacViewController *)self sendButton];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(CKEffectPickerMacViewController *)self contentView];
  int v5 = +[CKUIBehavior sharedBehaviors];
  if ([v5 effectPickerPresentsSelectionView])
  {
    uint64_t v6 = [v4 bottomAnchor];
  }
  else
  {
    v7 = [(CKEffectPickerMacViewController *)self selectionViewController];
    id v8 = [v7 view];
    uint64_t v6 = [v8 topAnchor];
  }
  v19 = (void *)v6;

  v20 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(CKEffectPickerMacViewController *)self sendButton];
  v26 = [v27 rightAnchor];
  v25 = [v4 rightAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-20.0];
  v28[0] = v24;
  v23 = [(CKEffectPickerMacViewController *)self sendButton];
  v22 = [v23 bottomAnchor];
  objc_super v9 = [v22 constraintEqualToAnchor:v6 constant:-12.0];
  v28[1] = v9;
  id v10 = [(CKEffectPickerMacViewController *)self sendButton];
  id v11 = [v10 widthAnchor];
  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 sendButtonSize];
  objc_msgSend(v11, "constraintEqualToConstant:");
  v13 = v21 = v4;
  v28[2] = v13;
  v14 = [(CKEffectPickerMacViewController *)self sendButton];
  v15 = [v14 heightAnchor];
  objc_super v16 = +[CKUIBehavior sharedBehaviors];
  [v16 sendButtonSize];
  objc_super v17 = objc_msgSend(v15, "constraintEqualToConstant:");
  v28[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v20 activateConstraints:v18];
}

- (void)placeBalloonContainer:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:self->_balloonView];
  [(CKEffectPickerMacViewController *)self setBalloonContainer:v4];
  int v5 = [v4 widthAnchor];
  uint64_t v6 = [v5 constraintEqualToConstant:0.0];
  balloonWidthConstraint = self->_balloonWidthConstraint;
  self->_balloonWidthConstraint = v6;

  id v8 = [v4 heightAnchor];
  objc_super v9 = [v8 constraintEqualToConstant:0.0];
  balloonHeightConstraint = self->_balloonHeightConstraint;
  self->_balloonHeightConstraint = v9;

  v21 = (void *)MEMORY[0x1E4F28DC8];
  id v11 = [v4 rightAnchor];
  v12 = [(UIView *)self->_sendButton leftAnchor];
  v13 = +[CKUIBehavior sharedBehaviors];
  [v13 balloonMaskTailSizeForTailShape:1];
  v15 = [v11 constraintEqualToAnchor:v12 constant:-(8.0 - v14)];
  v22[0] = v15;
  objc_super v16 = [v4 bottomAnchor];

  objc_super v17 = [(UIView *)self->_sendButton bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v19 = self->_balloonWidthConstraint;
  v22[1] = v18;
  v22[2] = v19;
  v22[3] = self->_balloonHeightConstraint;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v21 activateConstraints:v20];
}

- (void)showCloseButton
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F427E0] buttonWithType:7];
  [(UIButton *)v3 addTarget:self action:sel_closeButtonPressed_ forEvents:64];
  [(UIButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:v3];
  closeButton = self->_closeButton;
  self->_closeButton = v3;
  int v5 = v3;

  v19 = [(CKEffectPickerMacViewController *)self contentView];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(UIButton *)v5 leftAnchor];
  objc_super v17 = [v19 leftAnchor];
  objc_super v16 = [v18 constraintEqualToAnchor:v17 constant:20.0];
  v20[0] = v16;
  uint64_t v6 = [(UIButton *)v5 centerYAnchor];
  v7 = [(CKEffectPickerMacViewController *)self sendButton];
  id v8 = [v7 centerYAnchor];
  objc_super v9 = [v6 constraintEqualToAnchor:v8];
  v20[1] = v9;
  id v10 = [(UIButton *)v5 widthAnchor];
  id v11 = [v10 constraintEqualToConstant:21.0];
  v20[2] = v11;
  v12 = [(UIButton *)v5 heightAnchor];
  v13 = [v12 constraintEqualToConstant:21.0];
  v20[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v15 activateConstraints:v14];
}

- (void)viewDidLoad
{
  v80[4] = *MEMORY[0x1E4F143B8];
  v78.receiver = self;
  v78.super_class = (Class)CKEffectPickerMacViewController;
  [(CKEffectPickerMacViewController *)&v78 viewDidLoad];
  [(CKEffectPickerMacViewController *)self createTranscriptBlurBackground];
  [(CKEffectPickerMacViewController *)self createBalloonView];
  v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 effectPickerPresentsSelectionView];

  unint64_t v5 = 0x1E4F1C000;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(CKEffectSelectionViewController);
    [(CKEffectSelectionViewController *)v6 setDelegate:self];
    v7 = [(CKEffectSelectionViewController *)v6 view];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v8 = [(CKEffectSelectionViewController *)v6 view];
    objc_super v9 = [v8 heightAnchor];
    [(CKEffectSelectionViewController *)v6 maxCellHeight];
    id v11 = [v9 constraintEqualToConstant:v10 + 15.0];
    [(CKEffectPickerMacViewController *)self setHeightConstraint:v11];

    [(CKEffectPickerMacViewController *)self addChildViewController:v6];
    v12 = [(CKEffectPickerMacViewController *)self contentView];
    v13 = [(CKEffectSelectionViewController *)v6 view];
    [v12 addSubview:v13];

    v65 = (void *)MEMORY[0x1E4F28DC8];
    v76 = [(CKEffectSelectionViewController *)v6 view];
    v72 = [v76 leftAnchor];
    v74 = [(CKEffectPickerMacViewController *)self contentView];
    v70 = [v74 leftAnchor];
    v68 = [v72 constraintEqualToAnchor:v70];
    v80[0] = v68;
    v66 = [(CKEffectSelectionViewController *)v6 view];
    v63 = [v66 bottomAnchor];
    v64 = [(CKEffectPickerMacViewController *)self contentView];
    v62 = [v64 bottomAnchor];
    double v14 = [v63 constraintEqualToAnchor:v62 constant:15.0 + -18.0];
    v80[1] = v14;
    v15 = [(CKEffectSelectionViewController *)v6 view];
    objc_super v16 = [v15 rightAnchor];
    objc_super v17 = [(CKEffectPickerMacViewController *)self contentView];
    v18 = [v17 rightAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v80[2] = v19;
    v20 = [(CKEffectPickerMacViewController *)self heightConstraint];
    v80[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];
    [v65 activateConstraints:v21];

    unint64_t v5 = 0x1E4F1C000uLL;
    [(CKEffectSelectionViewController *)v6 didMoveToParentViewController:self];
    [(CKEffectPickerMacViewController *)self setSelectionViewController:v6];
  }
  v22 = objc_alloc_init(CKEffectPreviewCollectionViewController);
  [(CKEffectPickerMacViewController *)self setEffectPreviewOverlayView:0];
  v23 = [(CKEffectPickerMacViewController *)self contentView];
  v24 = [(CKEffectPreviewCollectionViewController *)v22 view];
  [v23 addSubview:v24];

  [(CKEffectPickerMacViewController *)self addChildViewController:v22];
  v25 = [(CKEffectPreviewCollectionViewController *)v22 view];
  v26 = [(CKEffectPickerMacViewController *)self contentView];
  objc_msgSend(v25, "__ck_makeEdgesEqualTo:", v26);

  [(CKEffectPreviewCollectionViewController *)v22 didMoveToParentViewController:self];
  [(CKEffectPreviewCollectionViewController *)v22 setDelegate:self];
  v27 = [(CKEffectPreviewCollectionViewController *)v22 view];
  [v27 setUserInteractionEnabled:0];

  v28 = [(CKEffectPreviewCollectionViewController *)v22 view];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CKEffectPreviewCollectionViewController *)v22 displayEffectWithIdentifier:0];
  v77 = v22;
  [(CKEffectPickerMacViewController *)self setEffectCollectionViewController:v22];
  id v29 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  v30 = CKFrameworkBundle();
  v31 = [v30 localizedStringForKey:@"EFFECT_PICKER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v29 setText:v31];

  v32 = [MEMORY[0x1E4FB08E0] systemFontOfSize:22.0 weight:*MEMORY[0x1E4FB09B8]];
  [v29 setFont:v32];

  [v29 sizeToFit];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKEffectPickerMacViewController *)self setTitleLabel:v29];
  v73 = [MEMORY[0x1E4F427D8] effectWithStyle:18];
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F42FE8], "effectForBlurEffect:");
  [(CKEffectPickerMacViewController *)self setTitleVibrancyEffect:v33];
  v71 = (void *)v33;
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v33];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [v34 contentView];
  [v35 addSubview:v29];

  [(CKEffectPickerMacViewController *)self setTitleContainerView:v34];
  v36 = [(CKEffectPickerMacViewController *)self contentView];
  [v36 addSubview:v34];

  v37 = [v34 contentView];
  objc_msgSend(v37, "__ck_makeEdgesEqualTo:", v29);

  v38 = +[CKUIBehavior sharedBehaviors];
  [v38 macEffectPickerTitleLeadingPadding];
  double v40 = v39;

  v41 = +[CKUIBehavior sharedBehaviors];
  [v41 macAppKitToolbarHeight];
  double v43 = v42;

  v75 = v29;
  [v29 bounds];
  double v45 = v44 * 0.5;
  if (v44 >= v43) {
    double v45 = 0.0;
  }
  double v46 = v43 * 0.5 - v45;
  v67 = (void *)MEMORY[0x1E4F28DC8];
  v69 = [v34 leadingAnchor];
  v47 = [(CKEffectPickerMacViewController *)self contentView];
  v48 = [v47 leadingAnchor];
  v49 = [v69 constraintEqualToAnchor:v48 constant:v40];
  v79[0] = v49;
  v50 = [v34 topAnchor];
  v51 = [(CKEffectPickerMacViewController *)self contentView];
  v52 = [v51 topAnchor];
  v53 = [v50 constraintEqualToAnchor:v52 constant:v46];
  v79[1] = v53;
  v54 = [*(id *)(v5 + 2424) arrayWithObjects:v79 count:2];
  [v67 activateConstraints:v54];

  v55 = [(CKEffectPickerMacViewController *)self createSendButton];
  [(CKEffectPickerMacViewController *)self setSendButton:v55];

  v56 = [(CKEffectPickerMacViewController *)self contentView];
  v57 = [(CKEffectPickerMacViewController *)self sendButton];
  [v56 addSubview:v57];

  [(CKEffectPickerMacViewController *)self placeSendButton];
  v58 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v57) = [v58 effectPickerShowsCloseButton];

  if (v57) {
    [(CKEffectPickerMacViewController *)self showCloseButton];
  }
  id v59 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v60 = [(CKEffectPickerMacViewController *)self contentView];
  [v60 addSubview:v59];

  [(CKEffectPickerMacViewController *)self placeBalloonContainer:v59];
  v61 = objc_alloc_init(CKChatControllerDummyAnimator);
  [(CKEffectPickerMacViewController *)self setDummyAnimator:v61];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CKEffectPickerMacViewController;
  [(CKEffectPickerMacViewController *)&v18 viewDidLayoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [(CKEffectPickerMacViewController *)self view];
  [v4 frame];
  double v6 = v5;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 senderTranscriptInsets];
  objc_msgSend(v3, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, v6, v8, v9, v10, v11);
  double v13 = v12;

  [(CKBalloonView *)self->_balloonView prepareForDisplay];
  [(CKBalloonView *)self->_balloonView setNeedsLayout];
  [(CKBalloonView *)self->_balloonView setNeedsDisplay];
  [(CKBalloonView *)self->_balloonView layoutIfNeeded];
  -[CKBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  -[CKBalloonView setFrame:](self->_balloonView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
  [(NSLayoutConstraint *)self->_balloonHeightConstraint setConstant:v17];
  [(NSLayoutConstraint *)self->_balloonWidthConstraint setConstant:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerMacViewController;
  [(CKEffectPickerMacViewController *)&v5 viewWillAppear:a3];
  if (![(CKEffectPickerMacViewController *)self hasSelectedDefaultEffect])
  {
    [(CKEffectPickerMacViewController *)self setHasSelectedDefaultEffect:1];
    char v4 = [(CKEffectPickerMacViewController *)self selectionViewController];
    [v4 setSelectedEffectIdentifier:@"com.apple.messages.effect.CKHeartEffect"];

    [(CKEffectPickerMacViewController *)self setEffectIdentifier:@"com.apple.messages.effect.CKHeartEffect"];
  }
}

- (id)keyCommands
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel_closeButtonPressed_];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_keyCommandReturn_];
  v6[1] = v3;
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)keyCommandReturn:(id)a3
{
}

- (void)touchUpInsideSendButton:(id)a3
{
  id v6 = [(CKEffectPickerMacViewController *)self delegate];
  char v4 = [(CKEffectPickerMacViewController *)self selectionViewController];
  objc_super v5 = [v4 selectedEffectIdentifier];
  [v6 effectPickerViewController:self effectWithIdentifierSelected:v5];
}

- (void)closeButtonPressed:(id)a3
{
  id v4 = [(CKEffectPickerMacViewController *)self delegate];
  [v4 effectPickerViewControllerClose:self animated:0];
}

- (BOOL)effectSelectionViewController:(id)a3 didSelectEffectWithIdentifier:(id)a4
{
  id v5 = a4;
  [(CKEffectPickerMacViewController *)self setEffectIdentifier:v5];
  if (([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"] & 1) == 0)
  {
    id v6 = [(CKEffectPickerMacViewController *)self balloonView];
    [v6 setInvisibleInkEffectEnabled:0];
  }
  v7 = [(CKEffectPickerMacViewController *)self contentView];
  BOOL v8 = [(CKEffectPickerMacViewController *)self effectShouldDisplayOverBalloon:v5];
  double v9 = [(CKEffectPickerMacViewController *)self effectCollectionViewController];
  double v10 = [v9 view];
  double v11 = [(CKEffectPickerMacViewController *)self balloonContainer];
  if (v8) {
    [v7 insertSubview:v10 aboveSubview:v11];
  }
  else {
    [v7 insertSubview:v10 belowSubview:v11];
  }

  double v12 = [(CKEffectPickerMacViewController *)self sendButton];
  double v13 = [(CKEffectPickerMacViewController *)self balloonContainer];
  [v7 insertSubview:v12 aboveSubview:v13];

  double v14 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v13) = [v14 effectPickerShowsCloseButton];

  if (v13)
  {
    double v15 = [(CKEffectPickerMacViewController *)self closeButton];
    double v16 = [(CKEffectPickerMacViewController *)self balloonContainer];
    [v7 insertSubview:v15 aboveSubview:v16];
  }
  double v17 = [(CKEffectPickerMacViewController *)self titleContainerView];
  objc_super v18 = [(CKEffectPickerMacViewController *)self balloonContainer];
  [v7 insertSubview:v17 aboveSubview:v18];

  v19 = [(CKEffectPickerMacViewController *)self fsem];
  v20 = [v19 effectForIdentifier:v5];

  if (v20 && [v20 effectIsDark])
  {
    v21 = +[CKUIBehavior sharedBehaviors];
    char v22 = [v21 effectPickerPresentsSelectionView];

    if ((v22 & 1) == 0)
    {
      v23 = [(CKEffectPickerMacViewController *)self selectionViewController];
      v24 = [v23 view];
      v25 = [(CKEffectPickerMacViewController *)self effectCollectionViewController];
      v26 = [v25 view];
      [v7 insertSubview:v24 aboveSubview:v26];
    }
    v27 = [(CKEffectPickerMacViewController *)self titleVibrancyEffect];
    v28 = [(CKEffectPickerMacViewController *)self titleContainerView];
    [v28 setEffect:v27];
  }
  else
  {
    id v29 = +[CKUIBehavior sharedBehaviors];
    char v30 = [v29 effectPickerPresentsSelectionView];

    if ((v30 & 1) == 0)
    {
      v31 = [(CKEffectPickerMacViewController *)self selectionViewController];
      v32 = [v31 view];
      uint64_t v33 = [(CKEffectPickerMacViewController *)self effectCollectionViewController];
      v34 = [v33 view];
      [v7 insertSubview:v32 belowSubview:v34];
    }
    v27 = [(CKEffectPickerMacViewController *)self titleContainerView];
    [v27 setEffect:0];
  }

  v35 = +[CKImpactEffectManager effectIdentifiers];
  int v36 = [v35 containsObject:v5];

  if (v36)
  {
    v37 = [(CKEffectPickerMacViewController *)self effectCollectionViewController];
    [v37 displayEffectWithIdentifier:0];

    [(CKEffectPickerMacViewController *)self startAnimationPreviewForIdentifier:v5];
  }
  else
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    double v42 = __95__CKEffectPickerMacViewController_effectSelectionViewController_didSelectEffectWithIdentifier___block_invoke;
    double v43 = &unk_1E5620AF8;
    double v44 = self;
    id v45 = v5;
    dispatch_async(MEMORY[0x1E4F14428], &v40);
  }
  if (objc_msgSend(v20, "effectIsDark", v40, v41, v42, v43, v44)) {
    uint64_t v38 = 2;
  }
  else {
    uint64_t v38 = 0;
  }
  [(CKEffectPickerMacViewController *)self setOverrideUserInterfaceStyle:v38];

  return 1;
}

void __95__CKEffectPickerMacViewController_effectSelectionViewController_didSelectEffectWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) effectCollectionViewController];
  [v2 displayEffectWithIdentifier:*(void *)(a1 + 40)];
}

- (BOOL)effectShouldDisplayOverBalloon:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"com.apple.messages.effect.CKHappyBirthdayEffect";
  v8[1] = @"com.apple.messages.effect.CKConfettiEffect";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v8 count:2];
  uint64_t v6 = [v5 indexOfObject:v4];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_defaultSendAnimationContextForAnimationPreview
{
  id v2 = objc_alloc_init(CKSendAnimationContext);
  [(CKSendAnimationContext *)v2 setIsSender:1];
  [(CKSendAnimationContext *)v2 setShouldRepeat:0];

  return v2;
}

- (void)startAnimationPreviewForIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKEffectPickerMacViewController *)self balloonView];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend(v5, "subviews", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v5)
  {
    objc_msgSend(v5, "setInvisibleInkEffectEnabled:", objc_msgSend(v4, "isEqualToString:", @"com.apple.MobileSMS.expressivesend.invisibleink"));
    [v5 prepareForDisplayIfNeeded];
    double v11 = [(CKEffectPickerMacViewController *)self _defaultSendAnimationContextForAnimationPreview];
    v21 = v5;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v11 setThrowBalloonViews:v12];

    double v13 = v7;
    if (!v7)
    {
      double v13 = [MEMORY[0x1E4F1CA98] null];
    }
    v20 = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v11 setAnimatableTextViews:v14];

    if (!v7) {
    [v11 setImpactIdentifier:v4];
    }
    double v15 = [(CKEffectPickerMacViewController *)self dummyAnimator];
    [v15 beginAnimationWithSendAnimationContext:v11];
  }
}

- (CKEffectPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKEffectPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)effectPreviewOverlayView
{
  return self->_effectPreviewOverlayView;
}

- (void)setEffectPreviewOverlayView:(id)a3
{
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (CKEffectPreviewCollectionViewController)effectCollectionViewController
{
  return self->_effectCollectionViewController;
}

- (void)setEffectCollectionViewController:(id)a3
{
}

- (BOOL)isInlineReply
{
  return self->_isInlineReply;
}

- (void)setIsInlineReply:(BOOL)a3
{
  self->_isInlineReplCGFloat y = a3;
}

- (CKEffectSelectionViewController)selectionViewController
{
  return self->_selectionViewController;
}

- (void)setSelectionViewController:(id)a3
{
}

- (CKChatControllerDummyAnimator)dummyAnimator
{
  return self->_dummyAnimator;
}

- (void)setDummyAnimator:(id)a3
{
}

- (UIView)balloonContainer
{
  return self->_balloonContainer;
}

- (void)setBalloonContainer:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIVisualEffectView)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
}

- (UIVibrancyEffect)titleVibrancyEffect
{
  return self->_titleVibrancyEffect;
}

- (void)setTitleVibrancyEffect:(id)a3
{
}

- (UIView)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (CKComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (CGPoint)balloonViewOrigin
{
  double x = self->_balloonViewOrigin.x;
  double y = self->_balloonViewOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (char)color
{
  return self->_color;
}

- (void)setColor:(char)a3
{
  self->_color = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)balloonWidthConstraint
{
  return self->_balloonWidthConstraint;
}

- (void)setBalloonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)balloonHeightConstraint
{
  return self->_balloonHeightConstraint;
}

- (void)setBalloonHeightConstraint:(id)a3
{
}

- (BOOL)hasSelectedDefaultEffect
{
  return self->_hasSelectedDefaultEffect;
}

- (void)setHasSelectedDefaultEffect:(BOOL)a3
{
  self->_hasSelectedDefaultEffect = a3;
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (NSString)effectIdentifier
{
  return self->_effectIdentifier;
}

- (void)setEffectIdentifier:(id)a3
{
}

- (UIViewController)wolfEffectSelectionVC
{
  return self->_wolfEffectSelectionVC;
}

- (void)setWolfEffectSelectionVC:(id)a3
{
}

- (UIViewController)effectsPresentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effectsPresentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setEffectsPresentingViewController:(id)a3
{
}

- (UIView)effectsPresentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effectsPresentingView);

  return (UIView *)WeakRetained;
}

- (void)setEffectsPresentingView:(id)a3
{
}

- (CKMessageEntryView)entryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryView);

  return (CKMessageEntryView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entryView);
  objc_destroyWeak((id *)&self->_effectsPresentingView);
  objc_destroyWeak((id *)&self->_effectsPresentingViewController);
  objc_storeStrong((id *)&self->_wolfEffectSelectionVC, 0);
  objc_storeStrong((id *)&self->_effectIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_balloonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_balloonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_titleVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_balloonContainer, 0);
  objc_storeStrong((id *)&self->_dummyAnimator, 0);
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_effectCollectionViewController, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end