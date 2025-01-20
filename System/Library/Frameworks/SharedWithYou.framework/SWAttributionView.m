@interface SWAttributionView
+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5;
- (BOOL)enablesMarquee;
- (CGFloat)preferredMaxLayoutWidth;
- (CGSize)intrinsicContentSize;
- (NSArray)constraints;
- (NSString)blurEffectGroupName;
- (NSString)menuTitleForHideAction;
- (SLAttributionView)slAttributionView;
- (SWAttributionView)init;
- (SWAttributionViewBackgroundStyle)backgroundStyle;
- (SWAttributionViewDisplayContext)displayContext;
- (SWAttributionViewHorizontalAlignment)horizontalAlignment;
- (SWHighlight)highlight;
- (UIMenu)highlightMenu;
- (UIMenu)supplementalMenu;
- (id)closeButton;
- (void)_sendFeedbackForCurrentDisplayContext;
- (void)_updateSLAttributionViewAlignment;
- (void)_updateSLAttributionViewBackgroundStyle;
- (void)_updateSLAttributionViewHideMenuItemTitle;
- (void)_updateSLAttributionViewSupplementalMenu;
- (void)didMoveToWindow;
- (void)setBackgroundStyle:(SWAttributionViewBackgroundStyle)backgroundStyle;
- (void)setBlurEffectGroupName:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDisplayContext:(SWAttributionViewDisplayContext)displayContext;
- (void)setHighlight:(SWHighlight *)highlight;
- (void)setHorizontalAlignment:(SWAttributionViewHorizontalAlignment)horizontalAlignment;
- (void)setMenuTitleForHideAction:(NSString *)menuTitleForHideAction;
- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth;
- (void)setSlAttributionView:(id)a3;
- (void)setSupplementalMenu:(UIMenu *)supplementalMenu;
- (void)updateConstraints;
- (void)useBannerLayout;
@end

@implementation SWAttributionView

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
}

- (SWAttributionView)init
{
  v3.receiver = self;
  v3.super_class = (Class)SWAttributionView;
  return [(SWAttributionView *)&v3 init];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)SWAttributionView;
  [(SWAttributionView *)&v4 didMoveToWindow];
  objc_super v3 = [(SWAttributionView *)self window];

  if (v3) {
    [(SWAttributionView *)self _sendFeedbackForCurrentDisplayContext];
  }
}

- (void)updateConstraints
{
  v55[3] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)SWAttributionView;
  [(SWAttributionView *)&v53 updateConstraints];
  objc_super v3 = [(SWAttributionView *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(SWAttributionView *)self constraints];
    [v5 deactivateConstraints:v6];

    [(SWAttributionView *)self setConstraints:0];
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [(SWAttributionView *)self slAttributionView];

  if (v8)
  {
    [(SWAttributionView *)self preferredMaxLayoutWidth];
    double v10 = v9;
    v11 = [(SWAttributionView *)self slAttributionView];
    v12 = v11;
    if (v10 <= 0.0)
    {
      v48 = [v11 topAnchor];
      uint64_t v46 = [(SWAttributionView *)self topAnchor];
      uint64_t v47 = [v48 constraintEqualToAnchor:v46];
      v54[0] = v47;
      v44 = [(SWAttributionView *)self slAttributionView];
      v45 = [v44 bottomAnchor];
      uint64_t v42 = [(SWAttributionView *)self bottomAnchor];
      v52 = [v45 constraintEqualToAnchor:v42];
      v54[1] = v52;
      v51 = [(SWAttributionView *)self slAttributionView];
      v39 = [v51 leadingAnchor];
      v50 = [(SWAttributionView *)self leadingAnchor];
      v49 = objc_msgSend(v39, "constraintEqualToAnchor:");
      v54[2] = v49;
      v43 = [(SWAttributionView *)self slAttributionView];
      v41 = [v43 trailingAnchor];
      v40 = [(SWAttributionView *)self trailingAnchor];
      v38 = [v41 constraintEqualToAnchor:v40];
      v54[3] = v38;
      v37 = [(SWAttributionView *)self slAttributionView];
      v36 = [v37 widthAnchor];
      v23 = [(SWAttributionView *)self widthAnchor];
      v24 = [v36 constraintEqualToAnchor:v23];
      v54[4] = v24;
      v25 = [(SWAttributionView *)self slAttributionView];
      v26 = [v25 heightAnchor];
      [(SWAttributionView *)self heightAnchor];
      v28 = v27 = v12;
      v29 = [v26 constraintEqualToAnchor:v28];
      v54[5] = v29;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:6];
      v31 = v30 = v7;
      [v30 addObjectsFromArray:v31];

      v7 = v30;
      v18 = (void *)v42;

      v16 = v44;
      v12 = v27;
      v14 = (void *)v46;

      v22 = v39;
      v17 = v45;

      v13 = v48;
      v15 = (void *)v47;
    }
    else
    {
      v13 = [v11 widthAnchor];
      [(SWAttributionView *)self preferredMaxLayoutWidth];
      v14 = objc_msgSend(v13, "constraintEqualToConstant:");
      v55[0] = v14;
      v15 = [(SWAttributionView *)self widthAnchor];
      v16 = [(SWAttributionView *)self slAttributionView];
      v17 = [v16 widthAnchor];
      v18 = [v15 constraintEqualToAnchor:v17];
      v55[1] = v18;
      uint64_t v19 = [(SWAttributionView *)self heightAnchor];
      v51 = [(SWAttributionView *)self slAttributionView];
      uint64_t v20 = [v51 heightAnchor];
      v52 = (void *)v19;
      v21 = (void *)v19;
      v22 = (void *)v20;
      v50 = [v21 constraintEqualToAnchor:v20];
      v55[2] = v50;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
      objc_msgSend(v7, "addObjectsFromArray:");
    }
  }
  [(SWAttributionView *)self setConstraints:v7];
  v32 = [(SWAttributionView *)self constraints];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(SWAttributionView *)self constraints];
    [v34 activateConstraints:v35];
  }
}

- (CGSize)intrinsicContentSize
{
  [(SWAttributionView *)self frame];
  double v4 = v3;
  v5 = [(SWAttributionView *)self slAttributionView];
  [v5 intrinsicContentSize];
  double v7 = v6;

  double v8 = v4;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setHighlight:(SWHighlight *)highlight
{
  v5 = highlight;
  if (self->_highlight != v5)
  {
    v13 = v5;
    double v6 = [(SWAttributionView *)self slAttributionView];

    if (v6)
    {
      double v7 = [(SWAttributionView *)self slAttributionView];
      [v7 removeFromSuperview];

      [(SWAttributionView *)self setSlAttributionView:0];
    }
    objc_storeStrong((id *)&self->_highlight, highlight);
    v5 = v13;
    if (v13)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FA5600]);
      double v9 = [(SWHighlight *)v13 slHighlight];
      double v10 = (void *)[v8 initWithHighlight:v9];
      [(SWAttributionView *)self setSlAttributionView:v10];

      v11 = [(SWAttributionView *)self slAttributionView];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      v12 = [(SWAttributionView *)self slAttributionView];
      [(SWAttributionView *)self addSubview:v12];

      [(SWAttributionView *)self _updateSLAttributionViewAlignment];
      [(SWAttributionView *)self _updateSLAttributionViewBackgroundStyle];
      [(SWAttributionView *)self _updateSLAttributionViewSupplementalMenu];
      [(SWAttributionView *)self _updateSLAttributionViewHideMenuItemTitle];
      [(SWAttributionView *)self _updateSLAttributionViewEnablesMarquee];
      [(SWAttributionView *)self setNeedsUpdateConstraints];
      v5 = v13;
    }
  }
}

- (void)setDisplayContext:(SWAttributionViewDisplayContext)displayContext
{
  if (self->_displayContext != displayContext)
  {
    self->_displayContext = displayContext;
    double v4 = [(SWAttributionView *)self window];

    if (v4)
    {
      [(SWAttributionView *)self _sendFeedbackForCurrentDisplayContext];
    }
  }
}

- (void)setHorizontalAlignment:(SWAttributionViewHorizontalAlignment)horizontalAlignment
{
  self->_horizontalAlignment = horizontalAlignment;
  [(SWAttributionView *)self _updateSLAttributionViewAlignment];
}

- (void)_updateSLAttributionViewAlignment
{
  SWAttributionViewHorizontalAlignment v3 = [(SWAttributionView *)self horizontalAlignment];
  uint64_t v4 = 1;
  if (v3 != SWAttributionViewHorizontalAlignmentCenter) {
    uint64_t v4 = -1;
  }
  if (v3 == SWAttributionViewHorizontalAlignmentTrailing) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [(SWAttributionView *)self slAttributionView];
  [v6 updateAlignment:v5];
}

- (void)setBackgroundStyle:(SWAttributionViewBackgroundStyle)backgroundStyle
{
  self->_backgroundStyle = backgroundStyle;
  [(SWAttributionView *)self _updateSLAttributionViewBackgroundStyle];
}

- (void)_updateSLAttributionViewBackgroundStyle
{
  SWAttributionViewBackgroundStyle v3 = [(SWAttributionView *)self backgroundStyle];
  if (v3 == SWAttributionViewBackgroundStyleColor) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = -1;
  }
  if (v3 == SWAttributionViewBackgroundStyleMaterial) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [(SWAttributionView *)self slAttributionView];
  [v6 updateBackgroundStyle:v5];
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  if ((SL_CGFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    [(SWAttributionView *)self setTranslatesAutoresizingMaskIntoConstraints:preferredMaxLayoutWidth == 0.0];
    self->_preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    [(SWAttributionView *)self setNeedsUpdateConstraints];
  }
}

- (UIMenu)highlightMenu
{
  SWAttributionViewBackgroundStyle v3 = [(SWAttributionView *)self slAttributionView];
  uint64_t v4 = [v3 contextMenuItems];
  uint64_t v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(UIMenu *)self->_highlightMenu children];
  char v9 = [v8 isEqualToArray:v7];

  highlightMenu = self->_highlightMenu;
  if (!highlightMenu || (v9 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4FB1970] menuWithChildren:v7];
    v12 = self->_highlightMenu;
    self->_highlightMenu = v11;

    highlightMenu = self->_highlightMenu;
  }
  v13 = highlightMenu;

  return v13;
}

- (void)setSupplementalMenu:(UIMenu *)supplementalMenu
{
  uint64_t v5 = supplementalMenu;
  p_supplementalMenu = &self->_supplementalMenu;
  if (self->_supplementalMenu != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_supplementalMenu, supplementalMenu);
    p_supplementalMenu = (UIMenu **)[(SWAttributionView *)self _updateSLAttributionViewSupplementalMenu];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_supplementalMenu, v5);
}

- (void)_updateSLAttributionViewSupplementalMenu
{
  id v4 = [(SWAttributionView *)self supplementalMenu];
  SWAttributionViewBackgroundStyle v3 = [(SWAttributionView *)self slAttributionView];
  [v3 setSupplementalMenu:v4];
}

- (void)setMenuTitleForHideAction:(NSString *)menuTitleForHideAction
{
  uint64_t v5 = menuTitleForHideAction;
  if (!-[NSString isEqualToString:](self->_menuTitleForHideAction, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_menuTitleForHideAction, menuTitleForHideAction);
    [(SWAttributionView *)self _updateSLAttributionViewHideMenuItemTitle];
  }
}

- (void)_updateSLAttributionViewHideMenuItemTitle
{
  id v4 = [(SWAttributionView *)self menuTitleForHideAction];
  SWAttributionViewBackgroundStyle v3 = [(SWAttributionView *)self slAttributionView];
  [v3 setHideMenuItemTitle:v4];
}

- (id)closeButton
{
  v2 = [(SWAttributionView *)self slAttributionView];
  SWAttributionViewBackgroundStyle v3 = [v2 closeButton];

  return v3;
}

- (void)useBannerLayout
{
  id v2 = [(SWAttributionView *)self slAttributionView];
  [v2 useBannerLayout];
}

- (void)setBlurEffectGroupName:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_blurEffectGroupName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_blurEffectGroupName, a3);
    uint64_t v5 = [(SWAttributionView *)self blurEffectGroupName];
    id v6 = [(SWAttributionView *)self slAttributionView];
    [v6 setBlurEffectGroupName:v5];
  }
}

- (void)_sendFeedbackForCurrentDisplayContext
{
  if ([(SWAttributionView *)self displayContext] == SWAttributionViewDisplayContextDetail)
  {
    id v4 = [(SWAttributionView *)self highlight];
    SWAttributionViewBackgroundStyle v3 = [v4 slHighlight];
    SLSendPortraitFeedbackTypeUserInteractedWithHighlight();
  }
  else
  {
    id v4 = [(SWAttributionView *)self highlight];
    SWAttributionViewBackgroundStyle v3 = [v4 slHighlight];
    SLSendPortraitFeedbackTypeDisplayedHighlight();
  }
}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (SWAttributionViewDisplayContext)displayContext
{
  return self->_displayContext;
}

- (SWAttributionViewHorizontalAlignment)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (SWAttributionViewBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CGFloat)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (NSString)menuTitleForHideAction
{
  return self->_menuTitleForHideAction;
}

- (UIMenu)supplementalMenu
{
  return self->_supplementalMenu;
}

- (BOOL)enablesMarquee
{
  return self->_enablesMarquee;
}

- (SLAttributionView)slAttributionView
{
  return self->_slAttributionView;
}

- (void)setSlAttributionView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_slAttributionView, 0);
  objc_storeStrong((id *)&self->_supplementalMenu, 0);
  objc_storeStrong((id *)&self->_menuTitleForHideAction, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);

  objc_storeStrong((id *)&self->_highlightMenu, 0);
}

@end