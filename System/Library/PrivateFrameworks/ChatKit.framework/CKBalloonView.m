@interface CKBalloonView
- (BOOL)animationPaused;
- (BOOL)canPresentTapbackPicker;
- (BOOL)canUseOpaqueMask;
- (BOOL)hasOverlay;
- (BOOL)hasSuggestedActionsMenu;
- (BOOL)hasTail;
- (BOOL)invisibleInkEffectEnabled;
- (BOOL)invisibleInkEffectPaused;
- (BOOL)isAudioMessage;
- (BOOL)isBeingShownAsPreview;
- (BOOL)isSelected;
- (BOOL)isShowingMenu;
- (BOOL)needsGroupOpacity;
- (BOOL)shouldEnableLongPress;
- (BOOL)useLargeAsset;
- (BOOL)wantsMultilineMask;
- (BOOL)wantsSkinnyMask;
- (CABackdropLayer)backdropFilterLayer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKBalloonView)initWithFrame:(CGRect)a3;
- (CKBalloonViewDelegate)delegate;
- (CKColor_t)strokeColor;
- (CKInvisibleInkEffectController)invisibleInkEffectController;
- (CKManualUpdater)displayUpdater;
- (CKTextBalloonView)asTextBalloonView;
- (Class)invisibleInkEffectViewClass;
- (NSMutableArray)filters;
- (NSString)description;
- (UIButton)dropDownMenuButton;
- (UIColor)overlayColor;
- (UIDragInteraction)dragInteraction;
- (UIEdgeInsets)textAlignmentInsets;
- (UIImage)imageForInvisibleInkEffectView;
- (UIImageView)overlay;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)snapshotCurrentView;
- (VKCStickerEffectView)stickerEffectView;
- (char)balloonShape;
- (char)balloonStyle;
- (char)balloonTailShape;
- (char)color;
- (char)orientation;
- (double)suggestedActionsMenuAdditionalHeight;
- (double)suggestedActionsMenuAdditionalHeightForBalloonSize:(CGSize)a3;
- (double)suggestedActionsMenuHeight;
- (double)suggestedActionsMenuHeightForSize:(CGSize)a3;
- (id)createOverlayImageView;
- (id)overlayImage;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (unint64_t)balloonCorners;
- (void)_dismissOverlay;
- (void)_hideOverlayAnimated;
- (void)_showOverlayAnimated;
- (void)addFilter:(id)a3;
- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3;
- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3 backgroundStyle:(int64_t)a4;
- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4;
- (void)clearFilters;
- (void)configureForComposition:(id)a3;
- (void)configureForEffectViewWithMediaObject:(id)a3;
- (void)configureForMessagePart:(id)a3;
- (void)configureGestureRecognizers;
- (void)dealloc;
- (void)doubleTapGestureRecognized:(id)a3;
- (void)layoutDropDownMenuIfNeeded;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)longPressGestureRecognized:(id)a3;
- (void)openAppFromNotificationExtensionWith:(id)a3;
- (void)performTranscriptHideAnimation:(id)a3;
- (void)performTranscriptInsertionAnimation:(id)a3;
- (void)performTranscriptReloadAnimation:(id)a3;
- (void)performTranscriptRemovalAnimation:(id)a3;
- (void)performTranscriptRevealAnimation:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForDisplayIfNeeded;
- (void)prepareForReuse;
- (void)removeSuggestedActionsMenu;
- (void)setAnimationPaused:(BOOL)a3;
- (void)setBackdropFilterLayer:(id)a3;
- (void)setBalloonCorners:(unint64_t)a3;
- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3;
- (void)setBalloonShape:(char)a3;
- (void)setBalloonStyle:(char)a3;
- (void)setBalloonTailShape:(char)a3;
- (void)setCanUseOpaqueMask:(BOOL)a3;
- (void)setColor:(char)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayUpdater:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setDragInteraction:(id)a3;
- (void)setDropDownMenuButton:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFilters:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasOverlay:(BOOL)a3;
- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4;
- (void)setHasTail:(BOOL)a3;
- (void)setInvisibleInkEffectController:(id)a3;
- (void)setInvisibleInkEffectEnabled:(BOOL)a3;
- (void)setInvisibleInkEffectPaused:(BOOL)a3;
- (void)setIsBeingShownAsPreview:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setNeedsPrepareForDisplay;
- (void)setOrientation:(char)a3;
- (void)setOverlay:(id)a3;
- (void)setStickerEffectView:(id)a3;
- (void)setStrokeColor:(CKColor_t)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextAlignmentInsets:(UIEdgeInsets)a3;
- (void)setUseLargeAsset:(BOOL)a3;
- (void)setUserInterfaceLevel:(int64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setWantsMultilineMask:(BOOL)a3;
- (void)setWantsSkinnyMask:(BOOL)a3;
- (void)showOverlay:(BOOL)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBalloonForTraitCollection:(id)a3;
- (void)updateGestureEnablement;
- (void)updateRasterizationForInvisibleInkEffect;
@end

@implementation CKBalloonView

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(UIImageView *)self->_overlay removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)CKBalloonView;
  [(CKBalloonView *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  [(CKBalloonView *)self balloonDescriptor];
  v4 = NSStringFromBalloonDescriptor(v11);
  v5 = [(CKBalloonView *)self delegate];
  v6 = [(CKBalloonImageView *)self image];
  v10.receiver = self;
  v10.super_class = (Class)CKBalloonView;
  v7 = [(CKBalloonView *)&v10 description];
  v8 = [v3 stringWithFormat:@"[CKBalloonView balloon:%@ delegate:%@ [UIImageView image:%@ [%@]]]", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (CKBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBalloonView;
  objc_super v3 = -[CKBalloonImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKBalloonView *)v3 configureGestureRecognizers];
    v5 = [[CKManualUpdater alloc] initWithTarget:v4 action:sel_prepareForDisplay];
    [(CKBalloonView *)v4 setDisplayUpdater:v5];
    [(CKBalloonView *)v4 setUserInteractionEnabled:1];
    [(CKBalloonView *)v4 setOpaque:0];
    [(CKBalloonView *)v4 setBalloonTailShape:1];
    [(CKBalloonView *)v4 setHasTail:1];
    [(CKBalloonView *)v4 setCanUseOpaqueMask:1];
    [(CKBalloonView *)v4 setBalloonStyle:0];
    [(CKBalloonView *)v4 setBalloonCorners:-1];
    [(CKBalloonView *)v4 setNeedsPrepareForDisplay];
  }
  return v4;
}

- (void)updateGestureEnablement
{
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  uint64_t v4 = [v3 disableTranscriptInteractions] ^ 1;
  v5 = [(CKBalloonView *)self longPressGestureRecognizer];
  [v5 setEnabled:v4];

  v6 = +[CKUIBehavior sharedBehaviors];
  uint64_t v7 = [v6 disableTranscriptInteractions] ^ 1;
  v8 = [(CKBalloonView *)self doubleTapGestureRecognizer];
  [v8 setEnabled:v7];

  id v11 = +[CKUIBehavior sharedBehaviors];
  uint64_t v9 = [v11 disableTranscriptInteractions] ^ 1;
  objc_super v10 = [(CKBalloonView *)self tapGestureRecognizer];
  [v10 setEnabled:v9];
}

- (void)configureGestureRecognizers
{
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 disableTranscriptInteractions];

  if ((v4 & 1) == 0)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_doubleTapGestureRecognized_];
    [v9 setCancelsTouchesInView:0];
    [v9 setNumberOfTapsRequired:2];
    [(CKBalloonView *)self setDoubleTapGestureRecognizer:v9];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel_longPressGestureRecognized_];
    [v5 setMinimumPressDuration:0.5];
    [v5 setDelaysTouchesBegan:1];
    [v5 _setRequiresQuietImpulse:1];
    objc_msgSend(v5, "setEnabled:", -[CKBalloonView shouldEnableLongPress](self, "shouldEnableLongPress"));
    [(CKBalloonView *)self setLongPressGestureRecognizer:v5];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_tapGestureRecognized_];
    [v6 setDelegate:self];
    [v6 setCancelsTouchesInView:0];
    [v6 requireGestureRecognizerToFail:v9];
    [v6 requireGestureRecognizerToFail:v5];
    [(CKBalloonView *)self setTapGestureRecognizer:v6];
    uint64_t v7 = +[CKPrintController sharedInstance];
    char v8 = [v7 isPrinting];

    if ((v8 & 1) == 0)
    {
      [(CKBalloonView *)self addGestureRecognizer:v6];
      [(CKBalloonView *)self addGestureRecognizer:v9];
      [(CKBalloonView *)self addGestureRecognizer:v5];
    }
  }
}

- (BOOL)shouldEnableLongPress
{
  BOOL result = CKIsRunningInMacCatalyst()
        || (+[CKUIBehavior sharedBehaviors],
            v2 = objc_claimAutoreleasedReturnValue(),
            char v3 = [v2 disableTranscriptClickyOrbContextMenu],
            v2,
            (v3 & 1) != 0)
        || CKIsRunningInMessagesNotificationExtension()
        || CKIsRunningInMessagesNotificationViewService() != 0;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v11 = *MEMORY[0x1E4F437F8];
  long long v12 = v4;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](self, "sizeThatFits:textAlignmentInsets:", &v11, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:", v11, v12);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3 backgroundStyle:(int64_t)a4
{
  id v9 = a3;
  if (![(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    double v6 = [(CKBalloonView *)self dropDownMenuButton];
    [v6 removeFromSuperview];

    double v7 = [[CKChatBotActionButton alloc] initWithActions:v9 delegate:self backgroundStyle:a4 showTitle:1];
    [(CKBalloonView *)self setDropDownMenuButton:v7];

    double v8 = [(CKBalloonView *)self dropDownMenuButton];
    [(CKBalloonView *)self addSubview:v8];
  }
}

- (void)removeSuggestedActionsMenu
{
  char v3 = [(CKBalloonView *)self dropDownMenuButton];
  [v3 removeFromSuperview];

  [(CKBalloonView *)self setDropDownMenuButton:0];
}

- (BOOL)hasSuggestedActionsMenu
{
  v2 = [(CKBalloonView *)self dropDownMenuButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKBalloonView;
  [(CKBalloonImageView *)&v5 layoutSubviews];
  [(CKBalloonView *)self layoutDropDownMenuIfNeeded];
  BOOL v3 = [(CKBalloonView *)self overlay];
  [(CKBalloonView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  stickerEffectView = self->_stickerEffectView;
  if (stickerEffectView)
  {
    [(CKBalloonView *)self bounds];
    -[VKCStickerEffectView setFrame:](stickerEffectView, "setFrame:");
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKBalloonView;
  [(CKBalloonView *)&v5 layoutSublayersOfLayer:a3];
  long long v4 = [(CKBalloonView *)self invisibleInkEffectController];
  [v4 hostViewDidLayoutSubviews];
}

- (double)suggestedActionsMenuAdditionalHeightForBalloonSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(CKBalloonView *)self hasSuggestedActionsMenu];
  double result = 0.0;
  if (v6)
  {
    -[CKBalloonView suggestedActionsMenuHeightForSize:](self, "suggestedActionsMenuHeightForSize:", width, height);
    return v8 + 5.0 + 13.0;
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)suggestedActionsMenuAdditionalHeight
{
  [(CKBalloonView *)self bounds];

  -[CKBalloonView suggestedActionsMenuAdditionalHeightForBalloonSize:](self, "suggestedActionsMenuAdditionalHeightForBalloonSize:", v3, v4);
  return result;
}

- (double)suggestedActionsMenuHeight
{
  [(CKBalloonView *)self bounds];

  -[CKBalloonView suggestedActionsMenuHeightForSize:](self, "suggestedActionsMenuHeightForSize:", v3, v4);
  return result;
}

- (double)suggestedActionsMenuHeightForSize:(CGSize)a3
{
  CGFloat v3 = a3.width + -32.0;
  double v4 = [(CKBalloonView *)self dropDownMenuButton];
  objc_msgSend(v4, "sizeThatFits:", v3, 1.79769313e308);
  double v6 = fmax(v5, 34.0);

  return v6;
}

- (void)layoutDropDownMenuIfNeeded
{
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    [(CKBalloonView *)self frame];
    -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", v3, v4);
    double v6 = v5;
    [(CKBalloonView *)self bounds];
    if (v6 == v7)
    {
      if ([(CKBalloonView *)self orientation]) {
        double v8 = 13.0;
      }
      else {
        double v8 = 19.0;
      }
      if ([(CKBalloonView *)self orientation] == 1) {
        double v9 = 19.0;
      }
      else {
        double v9 = 13.0;
      }
    }
    else
    {
      double v9 = 0.0;
      double v8 = 0.0;
    }
    [(CKBalloonImageView *)self alignmentRectInsets];
    double v11 = v8 + v10;
    [(CKBalloonView *)self bounds];
    double v13 = v12;
    [(CKBalloonView *)self suggestedActionsMenuHeight];
    double v15 = v13 - v14 + -13.0;
    double v16 = v6 - (v9 + v8);
    [(CKBalloonView *)self suggestedActionsMenuHeight];
    double v18 = v17;
    v19 = [(CKBalloonView *)self dropDownMenuButton];
    objc_msgSend(v19, "setFrame:", v11, v15, v16, v18);

    id v20 = [(CKBalloonView *)self dropDownMenuButton];
    [(CKBalloonView *)self bringSubviewToFront:v20];
  }
}

- (void)setEffectView:(id)a3
{
  id v10 = a3;
  id v4 = [(CKBalloonView *)self stickerEffectView];

  double v5 = v10;
  if (v4 != v10)
  {
    double v6 = [(CKBalloonView *)self stickerEffectView];
    [v6 removeFromSuperview];

    [(CKBalloonView *)self setStickerEffectView:v10];
    double v7 = [(CKBalloonView *)self stickerEffectView];

    if (v7)
    {
      double v8 = [(CKBalloonImageView *)self invisibleInkEffectImage];

      double v9 = [(CKBalloonView *)self stickerEffectView];
      if (v8) {
        [(CKBalloonView *)self insertSubview:v9 atIndex:0];
      }
      else {
        [(CKBalloonView *)self addSubview:v9];
      }
    }
    [(CKBalloonImageView *)self setImageHidden:v7 != 0];
    [(CKBalloonView *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)configureForEffectViewWithMediaObject:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v5 = v15;
  if (isKindOfClass)
  {
    id v6 = v15;
    if (([v6 needsAnimation] & 1) == 0)
    {
      [v6 stickerEffectType];
      if (([v6 needsAnimation] & 1) == 0 && (IMStickerEffectTypeShouldAvoidEffectView() & 1) == 0)
      {
        double v7 = [(CKBalloonView *)self stickerEffectView];
        if (!v7)
        {
          id v8 = MTLCreateSystemDefaultDevice();
          double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3FF8]) initWithDevice:v8];
          [v7 setContentMode:1];
          [(CKBalloonView *)self frame];
          objc_msgSend(v7, "setFrame:");
          double v9 = [v6 imageData];
          id v10 = [v9 UTIType];
          int v11 = [v10 hasSuffix:@"heics"];

          if (v11)
          {
            double v12 = [v6 imageData];
            double v13 = [v12 data];
            [v7 setVideoData:v13];
          }
          else
          {
            double v12 = [(CKBalloonImageView *)self image];
            [v7 setImage:v12];
          }

          double v14 = objc_msgSend(MEMORY[0x1E4FB3FF0], "effectWithType:", objc_msgSend(v6, "stickerEffectType"));
          [v7 setEffect:v14];

          [(CKBalloonView *)self setEffectView:v7];
        }
      }
    }

    double v5 = v15;
  }
}

- (void)setOrientation:(char)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setTextAlignmentInsets:(UIEdgeInsets)a3
{
  if (self->_textAlignmentInsets.left != a3.left
    || self->_textAlignmentInsets.top != a3.top
    || self->_textAlignmentInsets.right != a3.right
    || self->_textAlignmentInsets.bottom != a3.bottom)
  {
    self->_textAlignmentInsets = a3;
    [(CKBalloonView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView sizeThatFits:](&v6, sel_sizeThatFits_, a4, a3.width, a3.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)setNeedsPrepareForDisplay
{
  id v2 = [(CKBalloonView *)self displayUpdater];
  [v2 setNeedsUpdate];
}

- (void)prepareForDisplayIfNeeded
{
  id v2 = [(CKBalloonView *)self displayUpdater];
  [v2 updateIfNeeded];
}

- (void)prepareForDisplay
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  [v2 prepareForDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v11 traitCollectionDidChange:v4];
  double v5 = [(CKBalloonView *)self traitCollection];
  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", [v5 userInterfaceStyle]);

  objc_super v6 = [(CKBalloonView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;
  [v4 displayScale];
  double v10 = v9;

  if (v8 != v10)
  {
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKBalloonView *)self prepareForDisplayIfNeeded];
  }
}

- (void)updateBalloonForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKBackgroundLevelForTraitCollection();
  uint64_t v6 = [v4 userInterfaceStyle];

  [(CKBalloonView *)self setUserInterfaceStyle:v6];

  [(CKBalloonView *)self setUserInterfaceLevel:v5];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)CKBalloonView;
  [(CKBalloonImageView *)&v8 prepareForReuse];
  [(CKBalloonView *)self setDelegate:0];
  [(CKBalloonView *)self setBalloonStyle:0];
  [(CKBalloonView *)self setCanUseOpaqueMask:1];
  [(CKBalloonView *)self setSelected:0 withSelectionState:0];
  [(CKBalloonView *)self setBalloonCorners:-1];
  [(CKBalloonView *)self setAlpha:1.0];
  [(CKBalloonView *)self setHidden:0];
  [(CKBalloonView *)self setUserInteractionEnabled:1];
  [(CKBalloonView *)self setInvisibleInkEffectEnabled:0];
  [(CKBalloonView *)self setInvisibleInkEffectPaused:0];
  double v3 = [(CKBalloonView *)self layer];
  objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);

  id v4 = [(CKBalloonView *)self filters];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(CKBalloonView *)self clearFilters];
  }
  [(CKBalloonView *)self setInteractions:MEMORY[0x1E4F1CBF0]];
  [(CKBalloonView *)self setDragInteraction:0];
  uint64_t v6 = [(CKBalloonView *)self stickerEffectView];
  [v6 removeFromSuperview];

  [(CKBalloonView *)self setEffectView:0];
  double v7 = [(CKBalloonView *)self dropDownMenuButton];
  [v7 removeFromSuperview];

  [(CKBalloonView *)self setDropDownMenuButton:0];
}

- (UIColor)overlayColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] clearColor];
}

- (id)overlayImage
{
  [(CKBalloonView *)self balloonDescriptor];
  id v2 = CKResizableBalloonMask(v5);
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (void)_dismissOverlay
{
}

- (void)setHasOverlay:(BOOL)a3
{
}

- (id)createOverlayImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setUserInteractionEnabled:0];
  uint64_t v5 = [(CKBalloonView *)self overlayImage];
  [v4 setImage:v5];

  uint64_t v6 = [(CKBalloonView *)self overlayColor];
  [v4 setTintColor:v6];

  return v4;
}

- (void)showOverlay:(BOOL)a3
{
  if (self->_hasOverlay != a3) {
    -[CKBalloonView setHasOverlay:](self, "setHasOverlay:");
  }
}

- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4
{
  if (self->_hasOverlay != a3)
  {
    self->_hasOverlay = a3;
    if (a3)
    {
      BOOL v5 = a4;
      uint64_t v6 = [(CKBalloonView *)self createOverlayImageView];
      overlay = self->_overlay;
      self->_overlay = v6;

      objc_super v8 = [(CKBalloonView *)self overlay];
      [(CKBalloonView *)self addOverlaySubview:v8];

      [(CKBalloonView *)self _showOverlayAnimated];
      if (v5)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__dismissOverlay object:0];
        [(CKBalloonView *)self performSelector:sel__dismissOverlay withObject:0 afterDelay:2.0];
      }
    }
    else
    {
      [(CKBalloonView *)self _hideOverlayAnimated];
    }
    [(CKBalloonView *)self setNeedsLayout];
  }
}

- (void)_showOverlayAnimated
{
  id v3 = [(CKBalloonView *)self overlay];
  [v3 setAlpha:0.0];

  [(CKBalloonView *)self layoutIfNeeded];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CKBalloonView__showOverlayAnimated__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:0 animations:0.25 completion:0.0];
}

void __37__CKBalloonView__showOverlayAnimated__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlay];
  [v1 setAlpha:1.0];
}

- (void)_hideOverlayAnimated
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CKBalloonView__hideOverlayAnimated__block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__CKBalloonView__hideOverlayAnimated__block_invoke_2;
  v2[3] = &unk_1E5620BF0;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:v2 animations:0.25 completion:0.0];
}

void __37__CKBalloonView__hideOverlayAnimated__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlay];
  [v1 setAlpha:0.0];
}

uint64_t __37__CKBalloonView__hideOverlayAnimated__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) overlay];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 setOverlay:0];
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  [v4 balloonAlpha];
  -[CKBalloonView setAlpha:](self, "setAlpha:");
  BOOL v5 = [(CKBalloonView *)self filters];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    [(CKBalloonView *)self setFilters:v6];
  }
  id v7 = [(CKBalloonView *)self filters];
  [v7 addObject:v4];
}

- (void)clearFilters
{
  [(CKBalloonView *)self setAlpha:1.0];
  id v3 = [(CKBalloonView *)self filters];
  [v3 removeAllObjects];

  [(CKBalloonView *)self setFilters:0];

  [(CKBalloonView *)self setNeedsPrepareForDisplay];
}

- (void)setDragInteraction:(id)a3
{
  BOOL v5 = (UIDragInteraction *)a3;
  dragInteraction = self->_dragInteraction;
  if (dragInteraction != v5)
  {
    id v7 = v5;
    if (dragInteraction)
    {
      -[CKBalloonView removeInteraction:](self, "removeInteraction:");
      BOOL v5 = v7;
    }
    if (v5) {
      [(CKBalloonView *)self addInteraction:v7];
    }
    objc_storeStrong((id *)&self->_dragInteraction, a3);
    BOOL v5 = v7;
  }
}

- (void)setBalloonStyle:(char)a3
{
  if (self->_balloonStyle != a3)
  {
    self->_balloonStyle = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setWantsSkinnyMask:(BOOL)a3
{
  if (self->_wantsSkinnyMask != a3)
  {
    self->_wantsSkinnyMask = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setWantsMultilineMask:(BOOL)a3
{
  if (self->_wantsMultilineMask != a3)
  {
    self->_wantsMultilineMask = a3;
    if (a3) {
      [(CKBalloonView *)self setWantsSkinnyMask:0];
    }
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setBalloonCorners:(unint64_t)a3
{
  if (self->_balloonCorners != a3)
  {
    self->_balloonCorners = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (BOOL)needsGroupOpacity
{
  return 0;
}

- (void)tapGestureRecognized:(id)a3
{
  id v7 = a3;
  if ([v7 modifierFlags] == 0x80000)
  {
    id v4 = [(CKBalloonView *)self delegate];
    [v4 balloonViewLongTouched:self];
  }
  else
  {
    uint64_t v5 = [v7 modifierFlags];
    uint64_t v6 = [(CKBalloonView *)self delegate];
    id v4 = v6;
    if (v5 == 655360) {
      [v6 balloonViewShowInlineReply:self];
    }
    else {
      objc_msgSend(v6, "balloonViewTapped:withModifierFlags:selectedText:", self, objc_msgSend(v7, "modifierFlags"), 0);
    }
  }
}

- (BOOL)invisibleInkEffectEnabled
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setInvisibleInkEffectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKBalloonView *)self invisibleInkEffectController];
  if (v3 && !v5)
  {
    uint64_t v6 = [[CKInvisibleInkEffectController alloc] initWithHostView:self];
    [(CKInvisibleInkEffectController *)v6 setPaused:[(CKBalloonView *)self invisibleInkEffectPaused]];
    [(CKBalloonView *)self setInvisibleInkEffectController:v6];
    uint64_t v5 = v6;
  }
  id v7 = v5;
  if ([v5 isEnabled] != v3)
  {
    [v7 setEnabled:v3];
    [(CKBalloonView *)self updateRasterizationForInvisibleInkEffect];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKBalloonView *)self prepareForDisplayIfNeeded];
  }
}

- (void)setInvisibleInkEffectPaused:(BOOL)a3
{
  if (self->_invisibleInkEffectPaused != a3)
  {
    BOOL v3 = a3;
    self->_invisibleInkEffectPaused = a3;
    uint64_t v5 = [(CKBalloonView *)self invisibleInkEffectController];
    [v5 setPaused:v3];

    [(CKBalloonView *)self updateRasterizationForInvisibleInkEffect];
  }
}

- (void)setBackdropFilterLayer:(id)a3
{
  uint64_t v5 = (CABackdropLayer *)a3;
  if (self->_backdropFilterLayer != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_backdropFilterLayer, a3);
    [(CKBalloonView *)self setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (BOOL)isAudioMessage
{
  return 0;
}

- (Class)invisibleInkEffectViewClass
{
  return 0;
}

- (UIImage)imageForInvisibleInkEffectView
{
  return 0;
}

- (void)doubleTapGestureRecognized:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(CKBalloonView *)self delegate];
      id v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      double v9 = [(CKBalloonView *)self delegate];
      int v11 = 134218498;
      double v12 = self;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2048;
      double v16 = v9;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Balloon view %p was double tapped delegate=<%@:%p>", (uint8_t *)&v11, 0x20u);
    }
  }
  double v10 = [(CKBalloonView *)self delegate];
  [v10 balloonViewDoubleTapped:self];
}

- (void)longPressGestureRecognized:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(CKBalloonView *)self delegate];
    [v4 balloonViewLongTouched:self];
  }
}

- (char)balloonShape
{
  BOOL v3 = [(CKBalloonView *)self wantsSkinnyMask];
  int balloonShape = self->_balloonShape;
  if (balloonShape == 3) {
    char v5 = 4;
  }
  else {
    char v5 = 1;
  }
  if (v3) {
    LOBYTE(balloonShape) = v5;
  }
  return balloonShape;
}

- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  [(CKBalloonView *)self setBalloonShape:a3->var0];
  [(CKBalloonView *)self setBalloonTailShape:a3->var1];
  [(CKBalloonView *)self setBalloonStyle:a3->var2];
  [(CKBalloonView *)self setOrientation:a3->var3];
  [(CKBalloonView *)self setBalloonCorners:a3->var4];
  [(CKBalloonView *)self setCanUseOpaqueMask:a3->var9];
  [(CKBalloonView *)self setHasTail:a3->var10];
  [(CKBalloonView *)self setWantsSkinnyMask:a3->var0 == 1];
  [(CKBalloonView *)self setUseLargeAsset:a3->var11];
  [(CKBalloonView *)self setUserInterfaceStyle:a3->var7];
  [(CKBalloonView *)self setUserInterfaceLevel:a3->var8];
  [(CKBalloonView *)self setWantsMultilineMask:a3->var12];
  [(CKBalloonView *)self setNeedsPrepareForDisplay];

  [(CKBalloonView *)self setNeedsLayout];
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *retstr = *(CKBalloonDescriptor_t *)CKBalloonDescriptorZero;
  retstr->var0 = [(CKBalloonView *)self balloonShape];
  retstr->var1 = [(CKBalloonView *)self balloonTailShape];
  retstr->var2 = [(CKBalloonView *)self balloonStyle];
  retstr->var3 = [(CKBalloonView *)self orientation];
  retstr->var4 = [(CKBalloonView *)self balloonCorners];
  retstr->var9 = [(CKBalloonView *)self canUseOpaqueMask];
  retstr->var10 = [(CKBalloonView *)self hasTail];
  retstr->var12 = [(CKBalloonView *)self wantsMultilineMask];
  retstr->var11 = [(CKBalloonView *)self useLargeAsset];
  retstr->var5 = [(CKBalloonView *)self color];
  [(CKBalloonView *)self strokeColor];
  retstr->var6.red = v5;
  retstr->var6.green = v6;
  retstr->var6.blue = v7;
  retstr->var6.alpha = v8;
  retstr->var7 = [(CKBalloonView *)self userInterfaceStyle];
  CGSize result = [(CKBalloonView *)self userInterfaceLevel];
  retstr->var8 = (int64_t)result;
  return result;
}

- (void)updateRasterizationForInvisibleInkEffect
{
  if ([(CKBalloonView *)self invisibleInkEffectEnabled]) {
    BOOL v3 = [(CKBalloonView *)self invisibleInkEffectPaused];
  }
  else {
    BOOL v3 = 0;
  }

  [(CKBalloonView *)self _setShouldRasterize:v3];
}

- (BOOL)isSelected
{
  return self->_hasOverlay;
}

- (void)performTranscriptInsertionAnimation:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performTranscriptReloadAnimation:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performTranscriptRemovalAnimation:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performTranscriptHideAnimation:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performTranscriptRevealAnimation:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CKBalloonView *)self delegate];
  [v6 balloonView:self selectedChipAction:v5];
}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 didTapChipListFromNotificationExtensionWithBalloonView:self];
}

- (CKBalloonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBalloonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (char)orientation
{
  return self->_orientation;
}

- (BOOL)hasTail
{
  return self->_hasTail;
}

- (void)setHasTail:(BOOL)a3
{
  self->_hasTail = a3;
}

- (char)balloonStyle
{
  return self->_balloonStyle;
}

- (char)color
{
  return self->_color;
}

- (void)setColor:(char)a3
{
  self->_color = a3;
}

- (CKColor_t)strokeColor
{
  double red = self->_strokeColor.red;
  double green = self->_strokeColor.green;
  double blue = self->_strokeColor.blue;
  double alpha = self->_strokeColor.alpha;
  result.double alpha = alpha;
  result.double blue = blue;
  result.double green = green;
  result.double red = red;
  return result;
}

- (void)setStrokeColor:(CKColor_t)a3
{
  self->_strokeColor = a3;
}

- (UIEdgeInsets)textAlignmentInsets
{
  double top = self->_textAlignmentInsets.top;
  double left = self->_textAlignmentInsets.left;
  double bottom = self->_textAlignmentInsets.bottom;
  double right = self->_textAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (BOOL)isShowingMenu
{
  return self->_showingMenu;
}

- (BOOL)canUseOpaqueMask
{
  return self->_canUseOpaqueMask;
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  self->_canUseOpaqueMask = a3;
}

- (BOOL)hasOverlay
{
  return self->_hasOverlay;
}

- (BOOL)wantsSkinnyMask
{
  return self->_wantsSkinnyMask;
}

- (BOOL)wantsMultilineMask
{
  return self->_wantsMultilineMask;
}

- (BOOL)useLargeAsset
{
  return self->_useLargeAsset;
}

- (void)setUseLargeAsset:(BOOL)a3
{
  self->_useLargeAsset = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (BOOL)isBeingShownAsPreview
{
  return self->_isBeingShownAsPreview;
}

- (void)setIsBeingShownAsPreview:(BOOL)a3
{
  self->_isBeingShownAsPreview = a3;
}

- (VKCStickerEffectView)stickerEffectView
{
  return self->_stickerEffectView;
}

- (void)setStickerEffectView:(id)a3
{
}

- (void)setBalloonShape:(char)a3
{
  self->_int balloonShape = a3;
}

- (char)balloonTailShape
{
  return self->_balloonTailShape;
}

- (void)setBalloonTailShape:(char)a3
{
  self->_balloonTailShape = a3;
}

- (unint64_t)balloonCorners
{
  return self->_balloonCorners;
}

- (CABackdropLayer)backdropFilterLayer
{
  return self->_backdropFilterLayer;
}

- (CKInvisibleInkEffectController)invisibleInkEffectController
{
  return self->_invisibleInkEffectController;
}

- (void)setInvisibleInkEffectController:(id)a3
{
}

- (BOOL)invisibleInkEffectPaused
{
  return self->_invisibleInkEffectPaused;
}

- (BOOL)animationPaused
{
  return self->_animationPaused;
}

- (void)setAnimationPaused:(BOOL)a3
{
  self->_animationPaused = a3;
}

- (CKManualUpdater)displayUpdater
{
  return self->_displayUpdater;
}

- (void)setDisplayUpdater:(id)a3
{
}

- (UIImageView)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (UIButton)dropDownMenuButton
{
  return self->_dropDownMenuButton;
}

- (void)setDropDownMenuButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropDownMenuButton, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_displayUpdater, 0);
  objc_storeStrong((id *)&self->_invisibleInkEffectController, 0);
  objc_storeStrong((id *)&self->_backdropFilterLayer, 0);
  objc_storeStrong((id *)&self->_stickerEffectView, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CKTextBalloonView)asTextBalloonView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (CKTextBalloonView *)v3;
}

- (void)configureForComposition:(id)a3
{
  id v10 = a3;
  [(CKBalloonView *)self setOrientation:1];
  [(CKBalloonView *)self setHasTail:1];
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  [(CKBalloonView *)self setBalloonCorners:-1];
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isScheduledMessagesCoreEnabled];

  if (v5)
  {
    id v6 = [v10 sendLaterPluginInfo];

    if (v6)
    {
      double v7 = +[CKUIBehavior sharedBehaviors];
      double v8 = [v7 theme];
      double v9 = [v8 unfilledBalloonColorForColorType:15];
      [v9 ckColor];
      -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");

      [(CKBalloonView *)self setBalloonStyle:3];
    }
  }
}

- (void)configureForMessagePart:(id)a3
{
  id v14 = a3;
  id v4 = [v14 transcriptTraitCollection];
  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", [v4 userInterfaceStyle]);
  [(CKBalloonView *)self setUserInterfaceLevel:CKBackgroundLevelForTraitCollection(v4)];
  -[CKBalloonView setOrientation:](self, "setOrientation:", [v14 balloonOrientation]);
  -[CKBalloonView setHasTail:](self, "setHasTail:", [v14 hasTail]);
  [v14 textAlignmentInsets];
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", [v14 balloonCorners]);
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isScheduledMessagesCoreEnabled];

  if (v6)
  {
    [v14 strokeColor];
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
    -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", [v14 balloonStyle]);
  }
  if (([v14 isCommSafetySensitive] & 1) == 0)
  {
    double v7 = [v14 message];
    double v8 = [v7 expressiveSendStyleID];
    -[CKBalloonView setInvisibleInkEffectEnabled:](self, "setInvisibleInkEffectEnabled:", [v8 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"]);
  }
  double v9 = [v14 suggestedActionsList];
  if ([v9 count])
  {
    id v10 = [v14 IMChatItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v12 = [v14 IMChatItem];
      if ([v12 supportsSuggestedActionsMenu])
      {
        __int16 v13 = [v14 suggestedActionsList];
        [(CKBalloonView *)self addSuggestedActionsMenuWithSuggestedActionsList:v13];
      }
      else
      {
        [(CKBalloonView *)self removeSuggestedActionsMenu];
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  [(CKBalloonView *)self removeSuggestedActionsMenu];
LABEL_13:
}

- (UIView)snapshotCurrentView
{
  id v2 = self;
  id v3 = CKBalloonView.snapshotCurrentView.getter();

  return (UIView *)v3;
}

- (BOOL)canPresentTapbackPicker
{
  return 1;
}

@end