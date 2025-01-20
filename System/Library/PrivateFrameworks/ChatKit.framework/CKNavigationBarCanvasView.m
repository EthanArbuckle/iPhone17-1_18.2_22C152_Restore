@interface CKNavigationBarCanvasView
+ (double)preferredLandscapeHeightForCompactWidth;
+ (double)preferredLandscapeHeightForRegularWidth;
- (BOOL)_canShowAvatarView;
- (BOOL)audioEnabled;
- (BOOL)enforceLeftItemViewsAlignmentToCenter;
- (BOOL)expanseEnabled;
- (BOOL)ignoreNextWidthChange;
- (BOOL)isAnimatingAvatars;
- (BOOL)isBusinessChat;
- (BOOL)isInEditingMode;
- (BOOL)keepTitleViewCentered;
- (BOOL)multiwayAudioButtonHidden;
- (BOOL)shouldAnimateAvatarLayoutChanges;
- (BOOL)videoEnabled;
- (CGRect)_calculateFrameForButton:(id)a3 shouldOffset:(BOOL)a4;
- (CGSize)_baseBarItemViewSizeForView:(id)a3 proposedSize:(CGSize)a4 minSize:(double)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKNavigationBarCanvasView)initWithFrame:(CGRect)a3;
- (CKNavigationBarCanvasViewDelegate)delegate;
- (CKNavigationButtonView)buttonViewFaceTimeAudio;
- (CKNavigationButtonView)buttonViewFaceTimeVideo;
- (CKNavigationButtonView)buttonViewInfo;
- (NSMutableArray)buttonsToDisplay;
- (UIButton)invisibleContextMenuButton;
- (UIColor)titleDefaultBackgroundColor;
- (UIContextMenuInteraction)secondaryTitleInteraction;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)systemMinimumLayoutMarginsFromDelegate;
- (UIImageView)statusIndicatorImageView;
- (UIMenu)titleViewContextMenu;
- (UIView)leftItemView;
- (UIView)rightItemView;
- (UIView)subtitleView;
- (UIView)titleView;
- (double)_calculateYOriginForButtonWithHeight:(double)a3;
- (double)_preferredHeightFromSubviewMetrics;
- (double)_preferredHeightWithSubviewLayout:(id)a3;
- (double)_updatedPreferredHeight;
- (double)lastLayoutPreferredHeight;
- (id)_subviewLayoutWithBounds:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)joinButtonStyle;
- (int64_t)statusIndicatorType;
- (void)_addLaserEffectToButton:(id)a3;
- (void)_updateJoinButtonStyle;
- (void)clearAllItemViews;
- (void)didHoverOverTitleView:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)layoutTitleViewIfNeeded:(CGRect)a3;
- (void)removeButtonViewsIfNeeded;
- (void)removeFromSuperview;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setButtonViewFaceTimeAudio:(id)a3;
- (void)setButtonViewFaceTimeVideo:(id)a3;
- (void)setButtonViewInfo:(id)a3;
- (void)setButtonsToDisplay:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnforceLeftItemViewsAlignmentToCenter:(BOOL)a3;
- (void)setExpanseEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreNextWidthChange:(BOOL)a3;
- (void)setInvisibleContextMenuButton:(id)a3;
- (void)setIsAnimatingAvatars:(BOOL)a3;
- (void)setIsBusinessChat:(BOOL)a3;
- (void)setIsInEditingMode:(BOOL)a3;
- (void)setJoinButtonStyle:(int64_t)a3;
- (void)setKeepTitleViewCentered:(BOOL)a3;
- (void)setLastLayoutPreferredHeight:(double)a3;
- (void)setLeftItemView:(id)a3;
- (void)setMultiwayAudioButtonHidden:(BOOL)a3;
- (void)setRightItemView:(id)a3;
- (void)setSecondaryTitleInteraction:(id)a3;
- (void)setShouldAnimateAvatarLayoutChanges:(BOOL)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setStatusIndicatorType:(int64_t)a3;
- (void)setSubtitleView:(id)a3;
- (void)setTitleDefaultBackgroundColor:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleViewContextMenu:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation CKNavigationBarCanvasView

- (CKNavigationBarCanvasView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKNavigationBarCanvasView;
  v3 = -[CKNavigationBarCanvasView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKNavigationBarCanvasView *)v3 setShouldAnimateAvatarLayoutChanges:0];
    [(CKNavigationBarCanvasView *)v4 setIsInEditingMode:0];
    [(CKNavigationBarCanvasView *)v4 setIsAnimatingAvatars:0];
    [(CKNavigationBarCanvasView *)v4 setIgnoreNextWidthChange:0];
    [(CKNavigationBarCanvasView *)v4 setAudioEnabled:1];
    [(CKNavigationBarCanvasView *)v4 setVideoEnabled:1];
    [(CKNavigationBarCanvasView *)v4 setExpanseEnabled:1];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (setFrame__onceToken != -1) {
    dispatch_once(&setFrame__onceToken, &__block_literal_global_198);
  }
  if (setFrame__isPad)
  {
    v8 = NSNumber;
    [(CKNavigationBarCanvasView *)self frame];
    v10 = [v8 numberWithDouble:v9];
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (setFrame__isPad)
  {
    v11 = [NSNumber numberWithDouble:width];
    char v12 = [v10 isEqualToNumber:v11];

    if ((v12 & 1) == 0) {
      [(CKNavigationBarCanvasView *)self setIgnoreNextWidthChange:1];
    }
  }
}

void __38__CKNavigationBarCanvasView_setFrame___block_invoke()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  setFrame__isPad = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)removeFromSuperview
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CKNavigationBarCanvasView *)self superview];
      *(_DWORD *)buf = 138412546;
      v7 = self;
      __int16 v8 = 2112;
      double v9 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKNavigationBarCanvasView instance\n {%@} is being removed from its superview\n {%@}.", buf, 0x16u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKNavigationBarCanvasView;
  [(CKNavigationBarCanvasView *)&v5 removeFromSuperview];
}

- (void)didMoveToSuperview
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CKNavigationBarCanvasView;
  [(CKNavigationBarCanvasView *)&v5 didMoveToSuperview];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CKNavigationBarCanvasView *)self superview];
      *(_DWORD *)buf = 138412546;
      v7 = self;
      __int16 v8 = 2112;
      double v9 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKNavigationBarCanvasView instance\n {%@} did move to superview\n {%@}.", buf, 0x16u);
    }
  }
}

- (void)setIsInEditingMode:(BOOL)a3
{
  self->_isInEditingMode = a3;
  v4 = [(CKNavigationBarCanvasView *)self titleView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CKNavigationBarCanvasView *)self titleView];
    objc_super v6 = [v7 collectionViewLayout];
    [v6 invalidateLayout];
  }
}

- (void)setIsBusinessChat:(BOOL)a3
{
  if (self->_isBusinessChat != a3)
  {
    self->_isBusinessChat = a3;
    [(CKNavigationBarCanvasView *)self setNeedsLayout];
  }
}

- (void)setMultiwayAudioButtonHidden:(BOOL)a3
{
  if (self->_multiwayAudioButtonHidden != a3)
  {
    self->_multiwayAudioButtonHidden = a3;
    if ([(CKNavigationBarCanvasView *)self multiwayAudioButtonHidden])
    {
      v4 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];

      if (v4)
      {
        objc_super v5 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
        objc_super v6 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
        [v5 removeObject:v6];

        id v7 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
        [v7 removeFromSuperview];

        [(CKNavigationBarCanvasView *)self setButtonViewFaceTimeAudio:0];
      }
    }
    [(CKNavigationBarCanvasView *)self setNeedsLayout];
    [(CKNavigationBarCanvasView *)self layoutIfNeeded];
  }
}

- (void)setJoinButtonStyle:(int64_t)a3
{
  if (self->_joinButtonStyle != a3)
  {
    self->_joinButtonStyle = a3;
    [(CKNavigationBarCanvasView *)self _updateJoinButtonStyle];
  }
}

- (void)setAudioEnabled:(BOOL)a3
{
  if (self->_audioEnabled != a3)
  {
    self->_audioEnabled = a3;
    -[CKNavigationButtonView setEnabled:](self->_buttonViewFaceTimeAudio, "setEnabled:");
  }
}

- (void)setVideoEnabled:(BOOL)a3
{
  if (self->_videoEnabled != a3)
  {
    self->_videoEnabled = a3;
    -[CKNavigationButtonView setEnabled:](self->_buttonViewFaceTimeVideo, "setEnabled:");
  }
}

- (void)_updateJoinButtonStyle
{
  switch(self->_joinButtonStyle)
  {
    case 0:
      v3 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
      v4 = v3;
      uint64_t v5 = 0;
      goto LABEL_9;
    case 1:
      v3 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
      v4 = v3;
      uint64_t v5 = 4;
      goto LABEL_9;
    case 3:
      objc_super v6 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
      [v6 setJoinButtonStyle:0];

      if (CKJoinPillTextMetrics() <= 70.0) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      __int16 v8 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeVideo];
      [v8 setJoinButtonStyle:v7];

      id v12 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeVideo];
      [v12 setWantsVibrancy:1];
      goto LABEL_12;
    case 4:
      v3 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
      v4 = v3;
      uint64_t v5 = 5;
LABEL_9:
      [v3 setJoinButtonStyle:v5];

      double v9 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeVideo];
      id v12 = v9;
      uint64_t v10 = 0;
      goto LABEL_11;
    case 6:
      v11 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeAudio];
      [v11 setJoinButtonStyle:0];

      double v9 = [(CKNavigationBarCanvasView *)self buttonViewFaceTimeVideo];
      id v12 = v9;
      uint64_t v10 = 3;
LABEL_11:
      [v9 setJoinButtonStyle:v10];
LABEL_12:

      break;
    default:
      return;
  }
}

- (void)removeButtonViewsIfNeeded
{
  [(CKNavigationButtonView *)self->_buttonViewFaceTimeAudio removeFromSuperview];
  [(CKNavigationButtonView *)self->_buttonViewFaceTimeVideo removeFromSuperview];
  [(CKNavigationButtonView *)self->_buttonViewInfo removeFromSuperview];
  [(CKNavigationBarCanvasView *)self setButtonViewFaceTimeAudio:0];
  [(CKNavigationBarCanvasView *)self setButtonViewFaceTimeVideo:0];

  [(CKNavigationBarCanvasView *)self setButtonViewInfo:0];
}

+ (double)preferredLandscapeHeightForCompactWidth
{
  return 32.0;
}

+ (double)preferredLandscapeHeightForRegularWidth
{
  return 44.0;
}

- (void)setTitleView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  objc_super v6 = v5;
  p_titleView = &self->_titleView;
  if (self->_titleView != v5)
  {
    v11 = v5;
    [(UIView *)v5 setAutoresizingMask:0];
    [(UIView *)*p_titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    objc_super v6 = v11;
    if (*p_titleView)
    {
      [(UIView *)*p_titleView sizeToFit];
      [(CKNavigationBarCanvasView *)self addSubview:*p_titleView];
      int v8 = CKIsRunningInMacCatalyst();
      objc_super v6 = v11;
      if (v8)
      {
        double v9 = [(CKNavigationBarCanvasView *)self titleView];
        uint64_t v10 = [v9 backgroundColor];
        [(CKNavigationBarCanvasView *)self setTitleDefaultBackgroundColor:v10];

        objc_super v6 = v11;
      }
    }
  }
}

- (void)setSubtitleView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_subtitleView = &self->_subtitleView;
  if (self->_subtitleView != v5)
  {
    uint64_t v7 = v5;
    [(UIView *)v5 setAutoresizingMask:0];
    [(UIView *)*p_subtitleView removeFromSuperview];
    objc_storeStrong((id *)&self->_subtitleView, a3);
    if (*p_subtitleView)
    {
      [(UIView *)*p_subtitleView sizeToFit];
      [(CKNavigationBarCanvasView *)self addSubview:*p_subtitleView];
    }
    [(CKNavigationBarCanvasView *)self setNeedsLayout];
    uint64_t v5 = v7;
  }
}

- (void)setTitleViewContextMenu:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_titleViewContextMenu, a3);
  uint64_t v5 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];

  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKNavigationBarCanvasView *)self setInvisibleContextMenuButton:v6];

    uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
    int v8 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];
    [v8 setBackgroundColor:v7];
  }
  double v9 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];
  [v9 setMenu:v16];

  uint64_t v10 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];
  [v10 setContextMenuIsPrimary:1];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F428F8]) initWithDelegate:self];
  [(CKNavigationBarCanvasView *)self setSecondaryTitleInteraction:v11];

  id v12 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];
  objc_super v13 = [(CKNavigationBarCanvasView *)self secondaryTitleInteraction];
  [v12 addInteraction:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel_didHoverOverTitleView_];
  v15 = [(CKNavigationBarCanvasView *)self invisibleContextMenuButton];
  [v15 addGestureRecognizer:v14];

  [(CKNavigationBarCanvasView *)self setNeedsLayout];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CKNavigationBarCanvasView *)self secondaryTitleInteraction];
  if (v8 == v7)
  {
    uint64_t v10 = [(CKNavigationBarCanvasView *)self titleView];
    int v11 = objc_msgSend(v10, "pointInside:withEvent:", 0, x, y);

    double v9 = 0;
    if (v11)
    {
      id location = 0;
      objc_initWeak(&location, self);
      id v12 = (void *)MEMORY[0x1E4F428F0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83__CKNavigationBarCanvasView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v14[3] = &unk_1E562A2D0;
      objc_copyWeak(&v15, &location);
      double v9 = [v12 configurationWithIdentifier:0 previewProvider:0 actionProvider:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    double v9 = 0;
  }

  return v9;
}

id __83__CKNavigationBarCanvasView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained titleViewContextMenu];

  return v2;
}

- (void)didHoverOverTitleView:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 3)
  {
    int v11 = [(CKNavigationBarCanvasView *)self titleView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    id v13 = [(CKNavigationBarCanvasView *)self titleView];
    id v7 = [(CKNavigationBarCanvasView *)self titleDefaultBackgroundColor];
    [v13 setBackgroundColor:v7];
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = [(CKNavigationBarCanvasView *)self titleView];
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0) {
      return;
    }
    id v13 = [(CKNavigationBarCanvasView *)self titleView];
    id v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 theme];
    double v9 = [v8 conversationListSelectedCellColor];
    uint64_t v10 = [v9 colorWithAlphaComponent:0.5];
    [v13 setBackgroundColor:v10];
  }
}

- (void)setLeftItemView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_leftItemView = &self->_leftItemView;
  leftItemView = self->_leftItemView;
  if (leftItemView != v5)
  {
    double v9 = v5;
    [(UIView *)leftItemView removeFromSuperview];
    objc_storeStrong((id *)&self->_leftItemView, a3);
    uint64_t v5 = v9;
    if (v9)
    {
      [(UIView *)*p_leftItemView sizeToFit];
      [(CKNavigationBarCanvasView *)self addSubview:*p_leftItemView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v5 = v9;
      if (isKindOfClass)
      {
        [(CKNavigationBarCanvasView *)self _addLaserEffectToButton:*p_leftItemView];
        uint64_t v5 = v9;
      }
    }
  }
}

- (void)setRightItemView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_rightItemView = &self->_rightItemView;
  rightItemView = self->_rightItemView;
  id v8 = v5;
  if (rightItemView != v5)
  {
    [(UIView *)rightItemView removeFromSuperview];
    objc_storeStrong((id *)&self->_rightItemView, a3);
    if (*p_rightItemView)
    {
      [(UIView *)*p_rightItemView sizeToFit];
      [(CKNavigationBarCanvasView *)self addSubview:*p_rightItemView];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CKNavigationBarCanvasView *)self _addLaserEffectToButton:*p_rightItemView];
      }
    }
  }
}

- (void)setStatusIndicatorType:(int64_t)a3
{
  if (setStatusIndicatorType__onceToken != -1) {
    dispatch_once(&setStatusIndicatorType__onceToken, &__block_literal_global_136_1);
  }
  if (self->_statusIndicatorType != a3)
  {
    self->_statusIndicatorType = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_2;
    aBlock[3] = &unk_1E562A320;
    aBlock[4] = self;
    uint64_t v5 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
    if (self->_statusIndicatorType
      || ([(CKNavigationBarCanvasView *)self statusIndicatorImageView],
          int v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      char v6 = (id *)&setStatusIndicatorType__expanseIndicatorImage;
      id v7 = &setStatusIndicatorType__videoIndicatorImage;
      if (a3 != 2) {
        id v7 = &setStatusIndicatorType__audioIndicatorImage;
      }
      if (a3 != 3) {
        char v6 = (id *)v7;
      }
      id v8 = *v6;
      double v9 = [(CKNavigationBarCanvasView *)self statusIndicatorImageView];

      if (v9)
      {
        uint64_t v10 = [(CKNavigationBarCanvasView *)self statusIndicatorImageView];
        [v10 setImage:v8];
      }
      else
      {
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
        [(CKNavigationBarCanvasView *)self setStatusIndicatorImageView:v12];

        uint64_t v10 = [(CKNavigationBarCanvasView *)self statusIndicatorImageView];
        [(CKNavigationBarCanvasView *)self addSubview:v10];
      }

      id v13 = [(CKNavigationBarCanvasView *)self statusIndicatorImageView];
      [v13 setContentMode:1];

      v14 = +[CKUIBehavior sharedBehaviors];
      id v15 = [v14 theme];
      id v16 = [v15 navBarGrayColor];
      v17 = [(CKNavigationBarCanvasView *)self statusIndicatorImageView];
      [v17 setTintColor:v16];

      [(CKNavigationBarCanvasView *)self setNeedsLayout];
      [(CKNavigationBarCanvasView *)self layoutIfNeeded];
      v5[2](v5, 1, 0);
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_5;
      v18[3] = &unk_1E5620C40;
      v18[4] = self;
      ((void (**)(void *, uint64_t, void *))v5)[2](v5, 0, v18);
    }
  }
}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke()
{
  v0 = +[CKUIBehavior sharedBehaviors];
  uint64_t v1 = [v0 navBarHeaderVideoImage];
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  uint64_t v4 = [v3 navBarGrayColor];
  uint64_t v5 = [v1 _flatImageWithColor:v4];
  char v6 = (void *)setStatusIndicatorType__videoIndicatorImage;
  setStatusIndicatorType__videoIndicatorImage = v5;

  id v7 = +[CKUIBehavior sharedBehaviors];
  id v8 = [v7 navBarHeaderAudioImage];
  double v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 theme];
  int v11 = [v10 navBarGrayColor];
  uint64_t v12 = [v8 _flatImageWithColor:v11];
  id v13 = (void *)setStatusIndicatorType__audioIndicatorImage;
  setStatusIndicatorType__audioIndicatorImage = v12;

  id v20 = +[CKUIBehavior sharedBehaviors];
  v14 = [v20 navBarHeaderExpanseImage];
  id v15 = +[CKUIBehavior sharedBehaviors];
  id v16 = [v15 theme];
  v17 = [v16 navBarGrayColor];
  uint64_t v18 = [v14 _flatImageWithColor:v17];
  v19 = (void *)setStatusIndicatorType__expanseIndicatorImage;
  setStatusIndicatorType__expanseIndicatorImage = v18;
}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v32.origin.double x = v8;
  v32.origin.double y = v10;
  v32.size.double width = v12;
  v32.size.double height = v14;
  CGFloat v15 = CGRectGetWidth(v32) * -0.33;
  v33.origin.double x = v8;
  v33.origin.double y = v10;
  v33.size.double width = v12;
  v33.size.double height = v14;
  CGRect v34 = CGRectOffset(v33, v15, 0.0);
  CGRect v26 = v34;
  double v16 = 1.0;
  if (a2)
  {
    double v16 = 0.0;
    double height = v34.size.height;
  }
  else
  {
    double height = v14;
  }
  if (a2) {
    double width = v34.size.width;
  }
  else {
    double width = v12;
  }
  if (a2) {
    double y = v34.origin.y;
  }
  else {
    double y = v10;
  }
  if (a2) {
    double x = v34.origin.x;
  }
  else {
    double x = v8;
  }
  v21 = objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView", *(void *)&v16);
  objc_msgSend(v21, "setFrame:", x, y, width, height);

  v22 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v22 setAlpha:v25];

  v23 = (void *)MEMORY[0x1E4F42FF0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_3;
  v29[3] = &unk_1E562A2F8;
  v29[4] = *(void *)(a1 + 32);
  char v31 = a2;
  *(CGFloat *)&v29[5] = v8;
  *(CGFloat *)&v29[6] = v10;
  *(CGFloat *)&v29[7] = v12;
  *(CGFloat *)&v29[8] = v14;
  CGRect v30 = v26;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_4;
  v27[3] = &unk_1E5622358;
  id v28 = v5;
  id v24 = v5;
  [v23 animateWithDuration:v29 animations:v27 completion:0.3];
}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104)) {
    v2 = (double *)(a1 + 40);
  }
  else {
    v2 = (double *)(a1 + 72);
  }
  if (*(unsigned char *)(a1 + 104)) {
    v3 = (double *)(a1 + 48);
  }
  else {
    v3 = (double *)(a1 + 80);
  }
  if (*(unsigned char *)(a1 + 104)) {
    uint64_t v4 = (double *)(a1 + 56);
  }
  else {
    uint64_t v4 = (double *)(a1 + 88);
  }
  if (*(unsigned char *)(a1 + 104)) {
    id v5 = (double *)(a1 + 64);
  }
  else {
    id v5 = (double *)(a1 + 96);
  }
  double v6 = *v5;
  double v7 = *v4;
  double v8 = *v3;
  double v9 = *v2;
  CGFloat v10 = [*(id *)(a1 + 32) statusIndicatorImageView];
  objc_msgSend(v10, "setFrame:", v9, v8, v7, v6);

  if (*(unsigned char *)(a1 + 104)) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  id v12 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v12 setAlpha:v11];
}

uint64_t __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) statusIndicatorImageView];
  [v2 removeFromSuperview];

  v3 = *(void **)(a1 + 32);

  return [v3 setStatusIndicatorImageView:0];
}

- (void)clearAllItemViews
{
  [(CKNavigationBarCanvasView *)self setLeftItemView:0];
  [(CKNavigationBarCanvasView *)self setRightItemView:0];

  [(CKNavigationBarCanvasView *)self setTitleView:0];
}

- (void)_addLaserEffectToButton:(id)a3
{
  id v3 = a3;
  [v3 setPointerInteractionEnabled:1];
  [v3 setPointerStyleProvider:&__block_literal_global_143_0];
}

id __53__CKNavigationBarCanvasView__addLaserEffectToButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 frame];
  [v4 bounds];
  double v7 = v6;
  [v4 frame];
  double v9 = v8;
  [v4 frame];
  double v11 = v10;
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  [v4 frame];
  double v14 = v13;
  [v4 frame];
  double v16 = v15;
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  double v17 = 1.0;
  if (v12 == 0.0) {
    double v18 = 1.0;
  }
  else {
    double v18 = v12;
  }
  double v19 = round((v9 + v11 * 0.5 - (v7 + 16.0) * 0.5) * v18) / v18;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_80 != 0.0) {
    double v17 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  }
  id v20 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:", v19, round((v14 + v16 * 0.5 + -18.5) * v17) / v17, v7 + 16.0, 37.0);
  v21 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:v20];

  return v21;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4 = self;
  v10.receiver = self;
  v10.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (CKNavigationBarCanvasView *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v6 = [(CKNavigationBarCanvasView *)v5 superview];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        id v4 = v5;
      }
    }
  }
  double v8 = v4;

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  [(CKNavigationBarCanvasView *)self _updatedPreferredHeight];
  double v7 = v6;
  double v8 = v5;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (double)_updatedPreferredHeight
{
  id v3 = [(CKNavigationBarCanvasView *)self delegate];
  char v4 = [v3 shouldConfigureForJunkModal];

  if (v4) {
    return 85.0;
  }
  double v6 = [(CKNavigationBarCanvasView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [(CKNavigationBarCanvasView *)self delegate];
    [v7 preferredHeightOverride];
    double v9 = v8;

    if (v9 > 0.0)
    {
      objc_super v10 = [(CKNavigationBarCanvasView *)self delegate];
      [v10 preferredHeightOverride];
      double v12 = v11;

      return v12;
    }
  }
  else
  {
  }

  [(CKNavigationBarCanvasView *)self _preferredHeightFromSubviewMetrics];
  return result;
}

- (double)_preferredHeightFromSubviewMetrics
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v5 = [(CKNavigationBarCanvasView *)self window];
  if (!v5) {
    goto LABEL_7;
  }
  double v6 = (void *)v5;
  [(CKNavigationBarCanvasView *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v8 == v11 && v10 == v12)
  {
LABEL_7:
    double v16 = [MEMORY[0x1E4F43058] keyWindow];
    [v16 frame];
    double v15 = v17;
  }
  else
  {
    [(CKNavigationBarCanvasView *)self frame];
    double v15 = v14;
  }
  double v18 = +[CKUIBehavior sharedBehaviors];
  [v18 navigationBarDefaultHeight];
  double v20 = v19;

  v21 = -[CKNavigationBarCanvasView _subviewLayoutWithBounds:](self, "_subviewLayoutWithBounds:", v3, v4, v15, v20);
  [(CKNavigationBarCanvasView *)self _preferredHeightWithSubviewLayout:v21];
  double v23 = v22;

  return v23;
}

- (double)_preferredHeightWithSubviewLayout:(id)a3
{
  id v4 = a3;
  [v4 titleFrame];
  double v6 = v5;
  [v4 subtitleFrame];
  double v8 = v7;
  [v4 leftItemFrame];
  double v10 = v9;
  [v4 rightItemFrame];
  double v12 = v11;

  double v13 = [(CKNavigationBarCanvasView *)self delegate];
  int v14 = [v13 shouldConfigureForJunkModal];

  double v15 = v10 + 17.0;
  if (!v14) {
    double v15 = v10;
  }
  double v16 = v6 + v8;
  if (v15 >= v12) {
    double v17 = v15;
  }
  else {
    double v17 = v12;
  }
  if ([(CKNavigationBarCanvasView *)self _canShowAvatarView])
  {
    double v18 = [(CKNavigationBarCanvasView *)self delegate];
    uint64_t v19 = [v18 shouldUseMinimumSafeAreas];

    double v20 = +[CKUIBehavior sharedBehaviors];
    [v20 navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:v19];
    double v22 = v16 + v21;
  }
  else
  {
    if (v17 >= v16 + 8.0) {
      double v23 = v16;
    }
    else {
      double v23 = v16 + 8.0;
    }
    id v24 = +[CKUIBehavior sharedBehaviors];
    [v24 defaultNavigationBarNoContactPhotoCollapsedHeightValue];
    double v22 = v25;

    if (v23 >= v22) {
      double v22 = v23;
    }
  }
  if (v17 >= v22) {
    return v17;
  }
  else {
    return v22;
  }
}

- (BOOL)_canShowAvatarView
{
  v2 = [(CKNavigationBarCanvasView *)self delegate];
  char v3 = [v2 shouldShowAvatarView];

  return v3;
}

- (UIEdgeInsets)safeAreaInsets
{
  char v3 = [(CKNavigationBarCanvasView *)self superview];
  id v4 = [v3 superview];
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (v8 > 0.0 || v12 > 0.0)
  {
    double v13 = [(CKNavigationBarCanvasView *)self window];
    int v14 = [v13 windowScene];

    if (v14 && (unint64_t)([v14 interfaceOrientation] - 3) <= 1)
    {
      double v15 = +[CKUIBehavior sharedBehaviors];
      [v15 landscapeKeyboardInsets];
      double v17 = v16;
      double v19 = v18;

      if (v8 > 0.0) {
        double v8 = v17;
      }
      if (v12 > 0.0) {
        double v12 = v19;
      }
    }
  }
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (UIEdgeInsets)systemMinimumLayoutMarginsFromDelegate
{
  char v3 = [(CKNavigationBarCanvasView *)self delegate];

  if (v3)
  {
    id v4 = [(CKNavigationBarCanvasView *)self delegate];
    [v4 systemMinimumLayoutMarginsForView:self];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(CKNavigationBarCanvasView *)self effectiveUserInterfaceLayoutDirection];
    if (v13) {
      double v14 = v12;
    }
    else {
      double v14 = v8;
    }
    if (!v13) {
      double v8 = v12;
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F437F8];
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v15 = v6;
  double v16 = v14;
  double v17 = v10;
  double v18 = v8;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)layoutTitleViewIfNeeded:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CKNavigationBarCanvasView *)self titleView];

  if (v8)
  {
    double v9 = [(CKNavigationBarCanvasView *)self titleView];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      int v11 = ![(CKNavigationBarCanvasView *)self shouldAnimateAvatarLayoutChanges];
    }
    else {
      int v11 = 1;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke;
    v30[3] = &unk_1E562A368;
    v30[4] = self;
    *(double *)&v30[5] = x;
    *(double *)&v30[6] = y;
    *(double *)&v30[7] = width;
    *(double *)&v30[8] = height;
    double v12 = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke((uint64_t)v30);
    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:CKNavigationBarCollectionViewShouldAdustForEditingModeNotification object:0 userInfo:v12];

    double v14 = [(CKNavigationBarCanvasView *)self titleView];
    double v15 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && [(CKNavigationBarCanvasView *)self ignoreNextWidthChange])
    {
      int v17 = ![(CKNavigationBarCanvasView *)self isInEditingMode];
    }
    else
    {
      int v17 = 0;
    }
    if ((v11 | v17))
    {
      if (([(CKNavigationBarCanvasView *)self isInEditingMode] & isKindOfClass) == 1
        && ![(CKNavigationBarCanvasView *)self isAnimatingAvatars])
      {
        double v19 = [v14 collectionViewLayout];
        [v19 invalidateLayout];

        if (CKMainScreenScale_once_80 != -1) {
          dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
        }
        double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
          double v20 = 1.0;
        }
        double v21 = round(x * v20) / v20;
        double v22 = round(y * v20) / v20;
        double v23 = round(width * v20) / v20;
        double v24 = round(height * v20) / v20;
        double v25 = [(CKNavigationBarCanvasView *)self titleView];
        objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

        if (!v17) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      if (![(CKNavigationBarCanvasView *)self isAnimatingAvatars])
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_4;
        v26[3] = &unk_1E5621968;
        v26[4] = self;
        *(double *)&v26[5] = x;
        *(double *)&v26[6] = y;
        *(double *)&v26[7] = width;
        *(double *)&v26[8] = height;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
        if (!v17) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      [(CKNavigationBarCanvasView *)self setIsAnimatingAvatars:1];
      double v18 = (void *)MEMORY[0x1E4F42FF0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_2;
      v28[3] = &unk_1E5620C40;
      id v29 = v14;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_3;
      v27[3] = &unk_1E5620BF0;
      void v27[4] = self;
      [v18 animateWithDuration:v28 animations:v27 completion:0.3];
    }
    if (!v17)
    {
LABEL_18:

      return;
    }
LABEL_17:
    [(CKNavigationBarCanvasView *)self setIgnoreNextWidthChange:0];
    goto LABEL_18;
  }
}

id __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInEditingMode])
  {
    v10[0] = kCKNavigationBarCollectionViewKey;
    v2 = [*(id *)(a1 + 32) titleView];
    v11[0] = v2;
    v10[1] = kCKNavigationBarEditFrameKey;
    long long v3 = *(_OWORD *)(a1 + 56);
    v7[0] = *(_OWORD *)(a1 + 40);
    v7[1] = v3;
    id v4 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v10[2] = kCKNavigationBarIsInEditingModeKey;
    v11[1] = v4;
    v11[2] = MEMORY[0x1E4F1CC38];
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  else
  {
    v8[0] = kCKNavigationBarCollectionViewKey;
    v2 = [*(id *)(a1 + 32) titleView];
    v8[1] = kCKNavigationBarIsInEditingModeKey;
    v9[0] = v2;
    v9[1] = MEMORY[0x1E4F1CC28];
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  }

  return v5;
}

void __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

uint64_t __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldAnimateAvatarLayoutChanges:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setIsAnimatingAvatars:0];
}

void __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = round(v2 * v6) / v6;
  double v8 = round(v3 * v6) / v6;
  double v9 = round(v4 * v6) / v6;
  double v10 = round(v5 * v6) / v6;
  int v11 = [*(id *)(a1 + 32) titleView];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  double v12 = [*(id *)(a1 + 32) titleView];
  [v12 setNeedsLayout];

  id v13 = [*(id *)(a1 + 32) titleView];
  [v13 layoutIfNeeded];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CKNavigationBarCanvasView;
  [(CKNavigationBarCanvasView *)&v19 layoutSubviews];
  [(CKNavigationBarCanvasView *)self bounds];
  double v3 = [(CKNavigationBarCanvasView *)self _subviewLayoutWithBounds:"_subviewLayoutWithBounds:"];
  double v4 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __43__CKNavigationBarCanvasView_layoutSubviews__block_invoke;
  uint64_t v16 = &unk_1E5620AF8;
  int v17 = self;
  id v5 = v3;
  id v18 = v5;
  [v4 performWithoutAnimation:&v13];
  if (self->_statusIndicatorImageView)
  {
    objc_msgSend(v5, "statusIndicatorFrame", v13, v14, v15, v16, v17);
    -[UIImageView setFrame:](self->_statusIndicatorImageView, "setFrame:");
  }
  -[CKNavigationBarCanvasView _preferredHeightWithSubviewLayout:](self, "_preferredHeightWithSubviewLayout:", v5, v13, v14, v15, v16, v17);
  double v7 = v6;
  [(CKNavigationBarCanvasView *)self lastLayoutPreferredHeight];
  double v9 = vabdd_f64(v8, v7);
  [v5 titleFrame];
  [(CKNavigationBarCanvasView *)self layoutTitleViewIfNeeded:"layoutTitleViewIfNeeded:"];
  if (v9 >= 0.00000999999975)
  {
    double v10 = [(CKNavigationBarCanvasView *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      double v12 = [(CKNavigationBarCanvasView *)self delegate];
      [v12 canvasViewPreferredHeightChanged];
    }
  }
  [(CKNavigationBarCanvasView *)self setLastLayoutPreferredHeight:v7];
}

void __43__CKNavigationBarCanvasView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) leftItemFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) leftItemView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  [*(id *)(a1 + 40) rightItemFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_super v19 = [*(id *)(a1 + 32) rightItemView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  id v20 = [*(id *)(a1 + 32) subtitleView];
  [*(id *)(a1 + 40) subtitleFrame];
  objc_msgSend(v20, "setFrame:");
}

- (id)_subviewLayoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v7 = [(CKNavigationBarCanvasView *)self _shouldReverseLayoutDirection];
  BOOL v8 = [(CKNavigationBarCanvasView *)self _canShowAvatarView];
  double v9 = [(CKNavigationBarCanvasView *)self leftItemView];
  double v10 = [(CKNavigationBarCanvasView *)self rightItemView];
  objc_msgSend(v9, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;
  double rect = width;
  objc_msgSend(v10, "sizeThatFits:", width, height);
  double v16 = fmax(v14, v15);
  double rect2 = height;
  double v203 = v17;
  double v198 = v15;
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
    double v18 = 1.0;
  }
  double v19 = round(v16 * v18) / v18;
  double v20 = fmax(v12, 44.0);
  [(CKNavigationBarCanvasView *)self safeAreaInsets];
  double v22 = v21;
  double v24 = v23;
  [(CKNavigationBarCanvasView *)self systemMinimumLayoutMarginsFromDelegate];
  double v26 = v25;
  double v28 = v27;
  id v29 = [(CKNavigationBarCanvasView *)self leftItemView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  CGFloat v205 = x;
  double v196 = v24;
  double v200 = v28;
  double v194 = v22;
  double v31 = -0.0;
  if (v7)
  {
    if ((isKindOfClass & 1) == 0) {
      double v31 = v28;
    }
    double v32 = v24 + v31;
    v238.origin.CGFloat x = x;
    v238.origin.CGFloat y = y;
    v238.size.double height = rect2;
    v238.size.double width = width;
    double v33 = CGRectGetWidth(v238) - (v20 + v32);
  }
  else
  {
    if ((isKindOfClass & 1) == 0) {
      double v31 = v26;
    }
    double v33 = v22 + v31;
  }
  double v34 = v26;
  double v35 = v20;
  double v36 = fmax(v19, 44.0);
  v37 = [(CKNavigationBarCanvasView *)self delegate];
  char v38 = [v37 shouldConfigureForJunkModal];

  double v39 = 17.0;
  if ((v38 & 1) == 0)
  {
    [(CKNavigationBarCanvasView *)self _calculateYOriginForButtonWithHeight:v36];
    double v39 = v40;
  }
  v41 = [(CKNavigationBarCanvasView *)self rightItemView];
  -[CKNavigationBarCanvasView _baseBarItemViewSizeForView:proposedSize:minSize:](self, "_baseBarItemViewSizeForView:proposedSize:minSize:", v41, v203, v198, 44.0);
  double v43 = v42;
  double v45 = v44;

  v46 = [(CKNavigationBarCanvasView *)self rightItemView];
  objc_opt_class();
  int v47 = objc_opt_isKindOfClass();

  if (v47)
  {
    v48 = [(CKNavigationBarCanvasView *)self rightItemView];
    int v49 = [v48 buttonStyle] != 0;
  }
  else
  {
    int v49 = 0;
  }
  double v195 = v34;
  v50 = [(CKNavigationBarCanvasView *)self rightItemView];
  objc_opt_class();
  int v51 = objc_opt_isKindOfClass();

  if (v47)
  {
    v52 = +[CKUIBehavior sharedBehaviors];
    [v52 tuConversationBalloonJoinButtonHeight];
    double v45 = v53;
  }
  double v54 = 0.0;
  if ((v47 & ~v49 | v51))
  {
    v55 = [(CKNavigationBarCanvasView *)self rightItemView];
    [v55 frame];
    double v56 = CGRectGetWidth(v239);
    v57 = [v55 imageView];
    [v57 frame];
    double v54 = (v56 - CGRectGetWidth(v240)) * 0.5;
  }
  if (v7)
  {
    double v58 = v194 + v195 - v54;
  }
  else
  {
    v241.origin.CGFloat x = x;
    v241.origin.CGFloat y = y;
    v241.size.double height = rect2;
    v241.size.double width = rect;
    double v58 = CGRectGetWidth(v241) - (v196 + v200 + v43 - v54);
  }
  [(CKNavigationBarCanvasView *)self _calculateYOriginForButtonWithHeight:v45];
  uint64_t v229 = 0;
  v230 = (CGRect *)&v229;
  uint64_t v231 = 0x4010000000;
  v232 = "";
  double v233 = v33;
  double v234 = v39;
  double v235 = v35;
  double v236 = v36;
  uint64_t v221 = 0;
  v222 = (CGRect *)&v221;
  uint64_t v223 = 0x4010000000;
  v224 = "";
  double v225 = v58;
  uint64_t v226 = v59;
  double v227 = v43;
  double v228 = v45;
  v60 = [(CKNavigationBarCanvasView *)self subtitleView];
  objc_msgSend(v60, "sizeThatFits:", rect, rect2);
  double v204 = v61;
  double v199 = v62;

  v63 = [(CKNavigationBarCanvasView *)self subtitleView];
  [v63 frame];
  CGFloat v65 = v64;
  CGFloat v67 = v66;

  v68 = [(CKNavigationBarCanvasView *)self titleView];
  [v68 frame];
  CGFloat v70 = v69;
  CGFloat v72 = v71;
  CGFloat v74 = v73;
  CGFloat v76 = v75;

  if (v8)
  {
    v77 = [(CKNavigationBarCanvasView *)self delegate];
    uint64_t v78 = [v77 shouldUseMinimumSafeAreas];

    v79 = +[CKUIBehavior sharedBehaviors];
    [v79 navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:v78];
    double v81 = v80;

    v82 = +[CKUIBehavior sharedBehaviors];
    v83 = [(CKNavigationBarCanvasView *)self delegate];
    objc_msgSend(v82, "defaultNavigationBarHeightValueWantsMinimumSafeAreas:", objc_msgSend(v83, "shouldUseMinimumSafeAreas"));
    double v85 = v84;
  }
  else
  {
    v242.origin.CGFloat x = v70;
    v242.origin.CGFloat y = v72;
    v242.size.double width = v74;
    v242.size.double height = v76;
    double v86 = CGRectGetHeight(v242);
    v243.origin.CGFloat x = v65;
    v243.origin.CGFloat y = v67;
    v243.size.double width = v204;
    v243.size.double height = v199;
    double v87 = CGRectGetHeight(v243);
    v82 = +[CKUIBehavior sharedBehaviors];
    [v82 defaultNavigationBarNoContactPhotoCollapsedHeightValue];
    double v85 = v88;
    double v81 = (rect2 - v86 - v87) * 0.5;
  }

  if (![(CKNavigationBarCanvasView *)self keepTitleViewCentered])
  {
    v93 = [(CKNavigationBarCanvasView *)self titleView];
    objc_opt_class();
    char v94 = objc_opt_isKindOfClass();

    v95 = [(CKNavigationBarCanvasView *)self titleView];
    if (v94)
    {
      v96 = [v95 collectionViewLayout];
      [v96 collectionViewContentSize];
      double v98 = v97;
      double v100 = v99;
    }
    else
    {
      objc_msgSend(v95, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v98 = v114;
      double v100 = v115;
    }

    if (v100 > 0.0) {
      double v85 = v100;
    }
    v116 = [(CKNavigationBarCanvasView *)self rightItemView];

    if (v116)
    {
      v117 = v222;
    }
    else
    {
      v131 = [(CKNavigationBarCanvasView *)self leftItemView];

      double v132 = y;
      double v133 = rect2;
      if (!v131) {
        goto LABEL_59;
      }
      v117 = v230;
    }
    double v132 = v117[1].origin.y;
    double v133 = v117[1].size.height;
LABEL_59:
    v134 = [(CKNavigationBarCanvasView *)self titleView];
    objc_opt_class();
    char v135 = objc_opt_isKindOfClass();
    double v130 = v132 + floor((v133 - v85) * 0.5);

    if (v135)
    {
      [(CKNavigationBarCanvasView *)self titleView];
      v137 = double v136 = v205;
      [v137 _baselineOffsetFromBottom];
      double v130 = v130 + v138 * 0.5;
    }
    else
    {
      double v136 = v205;
    }
    double v129 = v136 + floor((rect - v98) * 0.5);
    v245.origin.CGFloat x = v129;
    v245.origin.CGFloat y = v130;
    v245.size.double width = v98;
    v245.size.double height = v85;
    if (CGRectIntersectsRect(v245, v222[1]))
    {
      CGFloat v139 = v222[1].origin.x;
      CGFloat v140 = v222[1].origin.y;
      CGFloat v141 = v222[1].size.width;
      CGFloat v142 = v222[1].size.height;
      if (v7)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v139);
LABEL_68:
        double v145 = -14.0;
LABEL_69:
        v248.origin.CGFloat x = MaxX + v145;
        double v201 = v130;
        v248.origin.CGFloat y = v130;
        v248.size.double width = v98;
        v248.size.double height = v85;
        double v146 = CGRectGetWidth(v248);
        double v147 = v85;
        v249.origin.CGFloat x = v136;
        v249.origin.CGFloat y = y;
        v249.size.double height = rect2;
        v249.size.double width = rect;
        double v148 = CGRectGetWidth(v249);
        if (v7)
        {
          double v149 = CGRectGetMaxX(v222[1]);
          v250.origin.CGFloat x = v136;
          v250.origin.CGFloat y = y;
          v250.size.double height = rect2;
          v250.size.double width = rect;
          double v150 = CGRectGetWidth(v250);
          CGFloat v151 = v230[1].origin.x;
          CGFloat v152 = v230[1].origin.y;
          CGFloat v153 = v230[1].size.width;
          CGFloat v154 = v230[1].size.height;
        }
        else
        {
          double v149 = CGRectGetMaxX(v230[1]);
          v251.origin.CGFloat x = v136;
          v251.origin.CGFloat y = y;
          v251.size.double height = rect2;
          v251.size.double width = rect;
          double v150 = CGRectGetWidth(v251);
          CGFloat v151 = v222[1].origin.x;
          CGFloat v152 = v222[1].origin.y;
          CGFloat v153 = v222[1].size.width;
          CGFloat v154 = v222[1].size.height;
        }
        double v155 = v148 - (v149 + v150 - CGRectGetMinX(*(CGRect *)&v151)) + -16.0;
        if (v155 >= v146) {
          double v98 = v146;
        }
        else {
          double v98 = v155;
        }
        double v129 = v136 + floor((rect - v98) * 0.5);
        double v85 = v147;
        double v130 = v201;
        goto LABEL_76;
      }
    }
    else
    {
      v246.origin.CGFloat x = v129;
      v246.origin.CGFloat y = v130;
      v246.size.double width = v98;
      v246.size.double height = v85;
      if (!CGRectIntersectsRect(v246, v230[1])) {
        goto LABEL_76;
      }
      CGFloat v139 = v230[1].origin.x;
      CGFloat v140 = v230[1].origin.y;
      CGFloat v141 = v230[1].size.width;
      CGFloat v142 = v230[1].size.height;
      if (!v7)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v139);
        double v145 = 14.0;
        goto LABEL_69;
      }
    }
    double MinX = CGRectGetMinX(*(CGRect *)&v139);
    v247.origin.CGFloat x = v129;
    v247.origin.CGFloat y = v130;
    v247.size.double width = v98;
    v247.size.double height = v85;
    double MaxX = MinX - CGRectGetWidth(v247);
    goto LABEL_68;
  }
  double v193 = v81;
  if (v7)
  {
    double v89 = CGRectGetWidth(v222[1]);
    double v90 = CGRectGetWidth(v230[1]);
    double v91 = v196 + v195;
    double v92 = v196 + v200 + v89;
  }
  else
  {
    double v101 = CGRectGetWidth(v230[1]);
    CGFloat v102 = CGRectGetWidth(v222[1]);
    double v92 = v194 + v195 + v101;
    double v90 = v200 + v102;
    double v91 = v196;
  }
  double v103 = v91 + v90;
  if (v92 >= v103) {
    double v103 = v92;
  }
  v219[0] = MEMORY[0x1E4F143A8];
  v219[1] = 3221225472;
  v219[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke;
  v219[3] = &unk_1E562A390;
  BOOL v220 = v8;
  double v104 = v103 + v103;
  *(CGFloat *)&v219[5] = v205;
  *(CGFloat *)&v219[6] = y;
  *(double *)&v219[7] = rect;
  *(double *)&v219[8] = rect2;
  *(double *)&v219[9] = v103 + v103;
  v219[4] = self;
  double v105 = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke((uint64_t)v219);
  v106 = [(CKNavigationBarCanvasView *)self titleView];
  objc_opt_class();
  char v107 = objc_opt_isKindOfClass();

  v108 = [(CKNavigationBarCanvasView *)self titleView];
  if (v107)
  {
    v109 = [v108 collectionViewLayout];
    [v109 collectionViewContentSize];
    double v111 = v110;
    double v113 = v112;
  }
  else
  {
    [v108 intrinsicContentSize];
    double v111 = v118;
    double v113 = v119;
  }

  double v120 = *MEMORY[0x1E4F1DB30];
  if (v111 == *MEMORY[0x1E4F1DB30])
  {
    double v121 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v113 == v121)
    {
      v122 = [(CKNavigationBarCanvasView *)self titleView];
      objc_msgSend(v122, "sizeThatFits:", v120, v121);
      double v113 = v123;
    }
  }
  if (v113 > 0.0) {
    double v85 = v113;
  }
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
    double v124 = 1.0;
  }
  else {
    double v124 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  }
  v244.origin.CGFloat x = v205;
  v244.origin.CGFloat y = y;
  v244.size.double height = rect2;
  v244.size.double width = rect;
  double MidX = CGRectGetMidX(v244);
  v126 = [(CKNavigationBarCanvasView *)self delegate];
  int v127 = [v126 shouldConfigureForJunkModal];

  v217[0] = MEMORY[0x1E4F143A8];
  v217[1] = 3221225472;
  v217[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2;
  v217[3] = &unk_1E562A390;
  BOOL v218 = v8;
  *(CGFloat *)&v217[5] = v205;
  *(CGFloat *)&v217[6] = y;
  *(double *)&v217[7] = rect;
  *(double *)&v217[8] = rect2;
  *(double *)&v217[9] = v104;
  v217[4] = self;
  __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2((uint64_t)v217);
  double v204 = v128;
  double v98 = ceil(v105 * v124) / v124;
  double v85 = ceil(v85 * v124) / v124;
  double v129 = MidX + v98 * -0.5;
  if (v127) {
    double v130 = 8.0;
  }
  else {
    double v130 = v193;
  }
LABEL_76:
  statusIndicatorImageView = self->_statusIndicatorImageView;
  double v206 = v85;
  if (statusIndicatorImageView)
  {
    v157 = [(UIImageView *)statusIndicatorImageView image];
    [v157 size];

    unint64_t v158 = self->_statusIndicatorType & 0xFFFFFFFFFFFFFFFELL;
    double v159 = 17.0;
    if (v158 == 2) {
      double v160 = 12.0;
    }
    else {
      double v160 = 17.0;
    }
    if (v158 == 2) {
      double v159 = 19.0;
    }
    double rect2a = v159;
    double recta = v160;
    objc_opt_class();
    double v161 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      v162 = self->_titleView;
      v163 = v162;
      if (v162)
      {
        [(UIView *)v162 _firstLineBaseline];
        double v161 = v164;
      }
    }
    else
    {
      v163 = 0;
    }
    double v170 = recta;
    double v171 = v130 + 0.5 - recta + v161;
    double v208 = v171;
    double v202 = v130;
    if (v7)
    {
      v252.origin.CGFloat x = v129;
      double v167 = v129;
      v252.origin.CGFloat y = v130;
      v252.size.double width = v98;
      v252.size.double height = v85;
      double v165 = CGRectGetMaxX(v252) + 2.0;
      double v172 = v98;
    }
    else
    {
      double v173 = rect2a;
      double v174 = v129 + -2.0 - rect2a;
      v253.origin.CGFloat x = v230[1].origin.x;
      CGFloat v175 = v230[1].origin.y;
      CGFloat v176 = v230[1].size.height;
      double v177 = v230[1].size.width + 2.0;
      CGFloat v197 = v253.origin.x;
      v253.origin.CGFloat y = v175;
      v253.size.double width = v177;
      v253.size.double height = v176;
      double v165 = v174;
      double v167 = v129;
      double v172 = v98;
      if (CGRectIntersectsRect(v253, *(CGRect *)(&v171 - 1)))
      {
        v254.origin.CGFloat x = v197;
        v254.origin.CGFloat y = v175;
        v254.size.double width = v177;
        v254.size.double height = v176;
        v255.origin.CGFloat x = CGRectGetMaxX(v254);
        double v165 = v255.origin.x;
        v255.origin.CGFloat y = v208;
        v255.size.double width = rect2a;
        v255.size.double height = recta;
        CGFloat v178 = CGRectGetMaxX(v255) + 2.0 - v129;
        double v167 = v129 + v178;
        double v172 = v98 - v178;
      }
    }

    double v166 = v172;
    double v130 = v202;
    if (v7) {
      goto LABEL_93;
    }
  }
  else
  {
    double v165 = *MEMORY[0x1E4F1DB28];
    double v208 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double rect2a = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double recta = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v166 = v98;
    double v167 = v129;
    if (v7)
    {
LABEL_93:
      v168 = [(CKNavigationBarCanvasView *)self leftItemView];
      v169 = v230;
      goto LABEL_94;
    }
  }
  v168 = [(CKNavigationBarCanvasView *)self rightItemView];
  v169 = v222;
LABEL_94:
  CGFloat v179 = v169[1].origin.x;
  CGSize size = v169[1].size;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v180 = [(CKNavigationBarCanvasView *)self titleView];
      objc_opt_class();
      char v181 = objc_opt_isKindOfClass();

      if (v181)
      {
        v182 = [(CKNavigationBarCanvasView *)self titleView];
        v183 = [v168 titleLabel];
        [v168 setNeedsLayout];
        [v168 layoutIfNeeded];
        v184 = [v183 text];
        uint64_t v185 = [v184 length];

        if (v185)
        {
          [v182 _firstLineBaseline];
          double v187 = v186;
          [v183 _lastLineBaselineFrameOriginY];
          double v189 = v130 + v187;
        }
        else
        {
          [v168 bounds];
          double v189 = v206 * 0.5 + v130;
          double v188 = v190 * 0.5;
        }
        v213[0] = MEMORY[0x1E4F143A8];
        v213[1] = 3221225472;
        v213[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_3;
        v213[3] = &unk_1E562A3B8;
        char v215 = v7;
        *(CGFloat *)&v213[6] = v179;
        *(double *)&v213[7] = v189 - v188;
        CGSize v214 = size;
        v213[4] = &v229;
        v213[5] = &v221;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v213];
      }
    }
  }
  +[CKNavBarCanvasSubviewLayout layoutWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:](CKNavBarCanvasSubviewLayout, "layoutWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:", v167, v130, v166, v206, v98 * 0.5 + v129 - v204 * 0.5, v206 + v130, v204, v199, *(void *)&v230[1].origin.x, *(void *)&v230[1].origin.y, *(void *)&v230[1].size.width, *(void *)&v230[1].size.height, *(void *)&v222[1].origin.x, *(void *)&v222[1].origin.y, *(void *)&v222[1].size.width, *(void *)&v222[1].size.height, *(void *)&v165,
    *(void *)&v208,
    *(void *)&rect2a,
  v191 = *(void *)&recta);

  _Block_object_dispose(&v221, 8);
  _Block_object_dispose(&v229, 8);

  return v191;
}

double __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  double v4 = *(double *)(a1 + 72);
  if (v2) {
    return Width - v4;
  }
  double v6 = Width - (v4 + 14.0 + 14.0);
  int v7 = [*(id *)(a1 + 32) titleView];
  objc_msgSend(v7, "sizeThatFits:", v6, v6);
  double v5 = v8;

  return v5;
}

void __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  if (!v2)
  {
    double v4 = Width - (*(double *)(a1 + 72) + 14.0 + 14.0);
    double v5 = [*(id *)(a1 + 32) subtitleView];
    objc_msgSend(v5, "sizeThatFits:", v4, v4);
  }
}

float64x2_t __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_3(uint64_t a1)
{
  float64x2_t v3 = *(float64x2_t *)(a1 + 48);
  float64x2_t v2 = *(float64x2_t *)(a1 + 64);
  if (*(unsigned char *)(a1 + 80))
  {
    if (CKMainScreenScale_once_80 != -1)
    {
      float64x2_t v9 = *(float64x2_t *)(a1 + 48);
      float64x2_t v11 = *(float64x2_t *)(a1 + 64);
      dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
      float64x2_t v3 = v9;
      float64x2_t v2 = v11;
    }
    *(double *)&uint64_t v4 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_80 != 0.0) {
      uint64_t v4 = CKMainScreenScale_sMainScreenScale_80;
    }
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    if (CKMainScreenScale_once_80 != -1)
    {
      float64x2_t v10 = *(float64x2_t *)(a1 + 48);
      float64x2_t v12 = *(float64x2_t *)(a1 + 64);
      dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
      float64x2_t v3 = v10;
      float64x2_t v2 = v12;
    }
    *(double *)&uint64_t v4 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_80 != 0.0) {
      uint64_t v4 = CKMainScreenScale_sMainScreenScale_80;
    }
    uint64_t v5 = *(void *)(a1 + 40);
  }
  float64x2_t v6 = (float64x2_t)vdupq_lane_s64(v4, 0);
  int v7 = *(float64x2_t **)(v5 + 8);
  _OWORD v7[2] = vdivq_f64(vrndaq_f64(vmulq_n_f64(v3, *(double *)&v4)), v6);
  float64x2_t result = vdivq_f64(vrndaq_f64(vmulq_f64(v2, v6)), v6);
  v7[3] = result;
  return result;
}

- (CGSize)_baseBarItemViewSizeForView:(id)a3 proposedSize:(CGSize)a4 minSize:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 buttonType] != 7)
  {
    double width = fmax(width, 44.0);
    double height = fmax(height, 44.0);
  }

  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)_calculateFrameForButton:(id)a3 shouldOffset:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKNavigationBarCanvasView *)self delegate];
  uint64_t v8 = [v7 shouldUseMinimumSafeAreas];

  double v9 = +[CKUIBehavior sharedBehaviors];
  [v9 navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:v8];
  double v11 = v10 + 2.0;

  if ([(CKNavigationBarCanvasView *)self _canShowAvatarView])
  {
    float64x2_t v12 = +[CKUIBehavior sharedBehaviors];
    [v12 avatarSize];
    double v14 = v11 + v13 + 16.0;
    double v15 = +[CKUIBehavior sharedBehaviors];
    [v15 navigationBarHeaderButtonVerticalOffset];
    double v17 = v14 + v16;
  }
  else
  {
    double v17 = v11 + 24.0 + 22.0;
  }
  if (CKPixelWidth_once_15 != -1) {
    dispatch_once(&CKPixelWidth_once_15, &__block_literal_global_426_0);
  }
  double v18 = *(double *)&CKPixelWidth_sPixel_15;
  double v19 = *(double *)&CKPixelWidth_sPixel_15;
  double v20 = *(double *)&CKPixelWidth_sPixel_15;
  double v21 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
  unint64_t v22 = [v21 count];

  [(CKNavigationBarCanvasView *)self bounds];
  double MidX = CGRectGetMidX(v54);
  if (CKMainScreenScale_once_80 != -1) {
    dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
  }
  double v24 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
  double v25 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
  int v26 = [v25 containsObject:v6];

  if (v26)
  {
    double v27 = v19 + 22.0 + 16.0 + 20.0;
    double v28 = 1.0;
    if (v24 != 0.0) {
      double v28 = v24;
    }
    double v29 = round((MidX + (v20 + 72.0) * (double)v22 * -0.5) * v28) / v28;
    double v30 = round(v17 * v28) / v28;
    double v31 = v18 + 72.0;
    double v32 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
    unint64_t v33 = [v32 indexOfObject:v6];

    double v34 = v29 + (double)v33 * v31;
    if (CKMainScreenScale_once_80 != -1) {
      dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
    }
    double v35 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
      double v35 = 1.0;
    }
    double v36 = round(v34 * v35) / v35;
    double v37 = round(v30 * v35) / v35;
    double v38 = round(v31 * v35) / v35;
    double v39 = round(v27 * v35) / v35;
    if (v4)
    {
      double v40 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
      unint64_t v41 = [v40 count];

      double v42 = [(CKNavigationBarCanvasView *)self buttonsToDisplay];
      unsigned __int8 v43 = [v42 count];

      double v44 = 10.0;
      if (v33 >= v41 >> 1)
      {
        if ((v43 & (v33 == v41 >> 1)) != 0) {
          double v44 = 0.0;
        }
        else {
          double v44 = -10.0;
        }
      }
      v55.origin.double x = v36;
      v55.origin.double y = v37;
      v55.size.double width = v38;
      v55.size.double height = v39;
      CGRect v56 = CGRectOffset(v55, v44, -10.0);
      double x = v56.origin.x;
      double y = v56.origin.y;
      double width = v56.size.width;
      double height = v56.size.height;
      if (CKMainScreenScale_once_80 != -1) {
        dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
      }
      double v49 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
        double v49 = 1.0;
      }
      double v36 = round(x * v49) / v49;
      double v37 = round(y * v49) / v49;
      double v38 = round(width * v49) / v49;
      double v39 = round(height * v49) / v49;
    }
  }
  else
  {
    double v36 = *MEMORY[0x1E4F1DB28];
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v50 = v36;
  double v51 = v37;
  double v52 = v38;
  double v53 = v39;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

- (double)_calculateYOriginForButtonWithHeight:(double)a3
{
  uint64_t v5 = [(CKNavigationBarCanvasView *)self window];
  id v6 = [v5 windowScene];
  id v7 = [v6 statusBarManager];
  [v7 statusBarFrame];
  double v9 = v8;

  BOOL v10 = v9 > 0.0 && [(CKNavigationBarCanvasView *)self _canShowAvatarView];
  double v11 = a3 * 0.5;
  float64x2_t v12 = [(CKNavigationBarCanvasView *)self delegate];
  uint64_t v13 = [v12 shouldUseMinimumSafeAreas];

  double v14 = +[CKUIBehavior sharedBehaviors];
  [v14 navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:v13];
  double v16 = v15;

  if (v10
    && ![(CKNavigationBarCanvasView *)self enforceLeftItemViewsAlignmentToCenter])
  {
    double v19 = +[CKUIBehavior sharedBehaviors];
    [v19 navigationBarLeftItemVerticalCenterOffset];
    double v21 = v20 - v11;
    if (CKMainScreenScale_once_80 != -1) {
      dispatch_once(&CKMainScreenScale_once_80, &__block_literal_global_423_0);
    }
    double v22 = *(double *)&CKMainScreenScale_sMainScreenScale_80;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_80 == 0.0) {
      double v22 = 1.0;
    }
    double v18 = round(v21 * v22) / v22;
  }
  else
  {
    [(CKNavigationBarCanvasView *)self bounds];
    double v18 = v17 * 0.5 - v11;
  }
  return v16 + v18;
}

- (CKNavigationBarCanvasViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKNavigationBarCanvasViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)titleView
{
  return self->_titleView;
}

- (UIView)subtitleView
{
  return self->_subtitleView;
}

- (UIView)leftItemView
{
  return self->_leftItemView;
}

- (UIView)rightItemView
{
  return self->_rightItemView;
}

- (BOOL)enforceLeftItemViewsAlignmentToCenter
{
  return self->_enforceLeftItemViewsAlignmentToCenter;
}

- (void)setEnforceLeftItemViewsAlignmentToCenter:(BOOL)a3
{
  self->_enforceLeftItemViewsAlignmentToCenter = a3;
}

- (BOOL)keepTitleViewCentered
{
  return self->_keepTitleViewCentered;
}

- (void)setKeepTitleViewCentered:(BOOL)a3
{
  self->_keepTitleViewCentered = a3;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (BOOL)expanseEnabled
{
  return self->_expanseEnabled;
}

- (void)setExpanseEnabled:(BOOL)a3
{
  self->_expanseEnabled = a3;
}

- (BOOL)shouldAnimateAvatarLayoutChanges
{
  return self->_shouldAnimateAvatarLayoutChanges;
}

- (void)setShouldAnimateAvatarLayoutChanges:(BOOL)a3
{
  self->_shouldAnimateAvatarLayoutChanges = a3;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (BOOL)multiwayAudioButtonHidden
{
  return self->_multiwayAudioButtonHidden;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (int64_t)joinButtonStyle
{
  return self->_joinButtonStyle;
}

- (CKNavigationButtonView)buttonViewFaceTimeAudio
{
  return self->_buttonViewFaceTimeAudio;
}

- (void)setButtonViewFaceTimeAudio:(id)a3
{
}

- (CKNavigationButtonView)buttonViewFaceTimeVideo
{
  return self->_buttonViewFaceTimeVideo;
}

- (void)setButtonViewFaceTimeVideo:(id)a3
{
}

- (CKNavigationButtonView)buttonViewInfo
{
  return self->_buttonViewInfo;
}

- (void)setButtonViewInfo:(id)a3
{
}

- (UIMenu)titleViewContextMenu
{
  return self->_titleViewContextMenu;
}

- (NSMutableArray)buttonsToDisplay
{
  return self->_buttonsToDisplay;
}

- (void)setButtonsToDisplay:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (BOOL)isAnimatingAvatars
{
  return self->_isAnimatingAvatars;
}

- (void)setIsAnimatingAvatars:(BOOL)a3
{
  self->_isAnimatingAvatars = a3;
}

- (BOOL)ignoreNextWidthChange
{
  return self->_ignoreNextWidthChange;
}

- (void)setIgnoreNextWidthChange:(BOOL)a3
{
  self->_ignoreNextWidthChange = a3;
}

- (UIButton)invisibleContextMenuButton
{
  return self->_invisibleContextMenuButton;
}

- (void)setInvisibleContextMenuButton:(id)a3
{
}

- (UIContextMenuInteraction)secondaryTitleInteraction
{
  return self->_secondaryTitleInteraction;
}

- (void)setSecondaryTitleInteraction:(id)a3
{
}

- (UIColor)titleDefaultBackgroundColor
{
  return self->_titleDefaultBackgroundColor;
}

- (void)setTitleDefaultBackgroundColor:(id)a3
{
}

- (double)lastLayoutPreferredHeight
{
  return self->_lastLayoutPreferredHeight;
}

- (void)setLastLayoutPreferredHeight:(double)a3
{
  self->_lastLayoutPreferredHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDefaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryTitleInteraction, 0);
  objc_storeStrong((id *)&self->_invisibleContextMenuButton, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_buttonsToDisplay, 0);
  objc_storeStrong((id *)&self->_titleViewContextMenu, 0);
  objc_storeStrong((id *)&self->_buttonViewInfo, 0);
  objc_storeStrong((id *)&self->_buttonViewFaceTimeVideo, 0);
  objc_storeStrong((id *)&self->_buttonViewFaceTimeAudio, 0);
  objc_storeStrong((id *)&self->_rightItemView, 0);
  objc_storeStrong((id *)&self->_leftItemView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end