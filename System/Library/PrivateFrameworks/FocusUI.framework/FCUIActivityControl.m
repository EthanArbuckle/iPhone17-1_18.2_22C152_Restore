@interface FCUIActivityControl
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)_isBackgroundViewHighlighted;
- (BOOL)_isDrawingSelectedAppearance;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isContracted;
- (BOOL)isExpanded;
- (BOOL)isPlaceholder;
- (BOOL)isSelectionHidden;
- (BOOL)showsPersistentDetailText;
- (CGRect)_glyphFrameForLayoutFrame:(CGRect *)a3 sizeThatFits:(CGSize)a4;
- (CGRect)_iconLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4 controlSize:(int64_t)a5;
- (CGRect)_optionsButtonLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4;
- (CGRect)_textFrameForControlFrame:(CGRect)a3 iconLayoutFrame:(CGRect)a4 isRTL:(BOOL)a5 controlSize:(int64_t)a6;
- (CGSize)_sizeThatFits:(CGSize)a3 withControlSize:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCActivityDescribing)activityDescription;
- (FCUIActivityControl)initWithActivityDescription:(id)a3;
- (FCUIActivityControl)initWithActivityDescription:(id)a3 style:(int64_t)a4;
- (NSArray)activityLifetimeDescriptions;
- (NSArray)menuItemActions;
- (NSArray)menuItemElements;
- (NSDate)activityCreationDate;
- (NSString)activityColorName;
- (NSString)activityDetailText;
- (NSString)activityDisplayName;
- (NSString)activityIdentifier;
- (NSString)activityLifetimesAlternativeDescription;
- (NSString)activitySymbolImageName;
- (NSString)description;
- (NSString)detailText;
- (NSString)menuAlternativeDescription;
- (NSString)preferredContentSizeCategory;
- (NSURL)activitySettingsURL;
- (NSURL)activitySetupURL;
- (NSUUID)activityUniqueIdentifier;
- (UIAction)defaultAction;
- (UIAction)footerAction;
- (UIAction)optionsAction;
- (UIGestureRecognizer)gestureRecognizerForExclusionRelationships;
- (UIImage)activityIcon;
- (double)_cornerRadiusForControlFrame:(CGRect)a3;
- (double)_effectiveGlyphPointSize;
- (double)_scaledValueForValue:(double)a3;
- (id)_activityDetailText;
- (id)_activityIconTintColorForSelectedAppearance:(BOOL)a3;
- (id)_highlightingBackgroundView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)_detailLabelVisualStyleForHighlightState:(BOOL)a3;
- (int64_t)_optionsControlTypeForControlStyle:(int64_t)a3;
- (int64_t)_recipe;
- (int64_t)_titleLabelVisualStyleForHighlightState:(BOOL)a3;
- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3;
- (int64_t)activitySemanticType;
- (int64_t)controlStyle;
- (void)_configureActivityIconImageViewIfNecessaryForReference:(BOOL)a3;
- (void)_configureActivityTitleLabelIfNecessary;
- (void)_configureBackgroundViewIfNecesssary;
- (void)_configureContentViewIfNecessary;
- (void)_configureDetailLabelIfNecessary;
- (void)_configureGlyphVisualStylingProviderIfNecessary;
- (void)_configureMenuViewIfNecessary;
- (void)_configureOptionsButtonIfNecessary;
- (void)_configureTextVisualStylingProviderIfNecessary;
- (void)_setActivityIcon:(id)a3 forReference:(BOOL)a4;
- (void)_setActivityIconPackageView:(id)a3;
- (void)_setBackgroundViewHighlighted:(BOOL)a3;
- (void)_setDrawingSelectedAppearance:(BOOL)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_setTextLayoutDisabled:(BOOL)a3;
- (void)_updateAccessibilityIdentifier;
- (void)_updateActivityDetail;
- (void)_updateActivityIcon;
- (void)_updateActivityTitle;
- (void)_updateDrawingSelectedAppearance;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForActivityItemImageView;
- (void)_updateTextAttributesForActivityTitleLabel;
- (void)_updateTextAttributesForDetailLabel;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setActivityDescription:(id)a3;
- (void)setActivityIcon:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setContracted:(BOOL)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4;
- (void)setFooterAction:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenuAlternativeDescription:(id)a3;
- (void)setMenuItemActions:(id)a3;
- (void)setOptionsAction:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionHidden:(BOOL)a3;
- (void)willPresent:(BOOL)a3 withTargetContainerBounds:(CGRect)a4 transitionCoordinator:(id)a5;
@end

@implementation FCUIActivityControl

- (FCUIActivityControl)initWithActivityDescription:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCUIActivityControl;
  v7 = [(FCUIActivityControl *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_controlStyle = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    [(FCUIActivityControl *)v7 setActivityDescription:v6];
    v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 == 1)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v8];
      [(FCUIActivityControl *)v8 addInteraction:v11];
    }
  }

  return v8;
}

- (FCUIActivityControl)initWithActivityDescription:(id)a3
{
  return [(FCUIActivityControl *)self initWithActivityDescription:a3 style:0];
}

- (void)setActivityDescription:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activityDescription, a3);
    [(FCUIActivityControl *)self _updateActivityIcon];
    [(FCUIActivityControl *)self _updateActivityTitle];
    [(FCUIActivityControl *)self _updateActivityDetail];
    [(FCUIActivityControl *)self _updateAccessibilityIdentifier];
  }
}

- (UIAction)defaultAction
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__FCUIActivityControl_defaultAction__block_invoke;
  v4[3] = &unk_264542E10;
  v4[4] = &v5;
  [(FCUIActivityControl *)self enumerateEventHandlers:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIAction *)v2;
}

void __36__FCUIActivityControl_defaultAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v9 = a2;
  if (v9)
  {
    id v10 = v9;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v9 = v10;
    *a6 = 1;
  }
}

- (void)setDefaultAction:(id)a3
{
  id v5 = a3;
  v4 = [(FCUIActivityControl *)self defaultAction];
  if ((objc_msgSend(v5, "fcui_isEqualToAction:", v4) & 1) == 0)
  {
    if (v4) {
      [(FCUIActivityControl *)self removeAction:v4 forControlEvents:64];
    }
    if (v5) {
      [(FCUIActivityControl *)self addAction:v5 forControlEvents:64];
    }
  }
}

- (UIAction)optionsAction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  optionsButton = self->_optionsButton;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__FCUIActivityControl_optionsAction__block_invoke;
  v5[3] = &unk_264542E10;
  v5[4] = &v6;
  [(FCUIOptionsControl *)optionsButton enumerateEventHandlers:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIAction *)v3;
}

void __36__FCUIActivityControl_optionsAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v9 = a2;
  if (v9)
  {
    id v10 = v9;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v9 = v10;
    *a6 = 1;
  }
}

- (void)setOptionsAction:(id)a3
{
  id v5 = a3;
  v4 = [(FCUIActivityControl *)self optionsAction];
  if ((objc_msgSend(v5, "fcui_isEqualToAction:", v4) & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureOptionsButtonIfNecessary];
    if (v4) {
      [(FCUIOptionsControl *)self->_optionsButton removeAction:v4 forControlEvents:64];
    }
    if (v5) {
      [(FCUIOptionsControl *)self->_optionsButton addAction:v5 forControlEvents:64];
    }
  }
}

- (NSArray)menuItemActions
{
  return [(FCUIActivityControlMenuView *)self->_menuView menuItemActions];
}

- (void)setMenuItemActions:(id)a3
{
  id v6 = a3;
  v4 = [(FCUIActivityControl *)self menuItemActions];
  char v5 = objc_msgSend(v6, "fcui_isEqualToActionArray:", v4);

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(FCUIActivityControlMenuView *)self->_menuView setMenuItemActions:v6];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (NSArray)menuItemElements
{
  return [(FCUIActivityControlMenuView *)self->_menuView menuItemElements];
}

- (NSString)menuAlternativeDescription
{
  return [(FCUIActivityControlMenuView *)self->_menuView menuAlternativeDescription];
}

- (void)setMenuAlternativeDescription:(id)a3
{
  id v6 = a3;
  v4 = [(FCUIActivityControl *)self menuAlternativeDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(FCUIActivityControlMenuView *)self->_menuView setMenuAlternativeDescription:v6];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (UIAction)footerAction
{
  return [(FCUIActivityControlMenuView *)self->_menuView footerAction];
}

- (void)setFooterAction:(id)a3
{
  id v6 = a3;
  v4 = [(FCUIActivityControl *)self footerAction];
  char v5 = objc_msgSend(v6, "fcui_isEqualToAction:", v4);

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(FCUIActivityControlMenuView *)self->_menuView setFooterAction:v6];
  }
}

- (BOOL)showsPersistentDetailText
{
  return ![(FCUIActivityControl *)self activitySemanticType]
      || [(FCUIActivityControl *)self activitySemanticType] == 9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[FCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", self->_controlSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  long long v63 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v64 = *MEMORY[0x263F000D0];
  *(_OWORD *)&v84.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v84.c = v63;
  long long v62 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v84.tx = v62;
  if (self->_controlStyle == 1)
  {
    contentView = self->_contentView;
    if (contentView) {
      [(UIView *)contentView transform];
    }
    else {
      memset(&v83, 0, sizeof(v83));
    }
    CGAffineTransform v84 = v83;
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke;
    v82[3] = &unk_264542B68;
    v82[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v82];
  }
  v81.receiver = self;
  v81.super_class = (Class)FCUIActivityControl;
  [(FCUIActivityControl *)&v81 layoutSubviews];
  [(UIView *)self->_contentView bounds];
  CGFloat v65 = v4;
  CGFloat v66 = v5;
  CGFloat v67 = v7;
  CGFloat v68 = v6;
  [(FCUIActivityControl *)self _configureBackgroundViewIfNecesssary];
  uint64_t v8 = [(FCUIActivityControl *)self _shouldReverseLayoutDirection];
  if (CGRectIsEmpty(self->_targetContainerBounds))
  {
    [(FCUIActivityControl *)self bounds];
    double width = v9;
    double height = v11;
  }
  else
  {
    double width = self->_targetContainerBounds.size.width;
    double height = self->_targetContainerBounds.size.height;
  }
  if (self->_controlSize == -1) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 0;
  }
  -[FCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", v13, width, height);
  BSRectWithSize();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[FCUIActivityControl _cornerRadiusForControlFrame:](self, "_cornerRadiusForControlFrame:");
  double v23 = v22;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  [(FCUIActivityControlMenuView *)self->_menuView _setContinuousCornerRadius:v23];
  -[FCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21);
  double v77 = v24;
  double v78 = v25;
  double v79 = v26;
  double v80 = v27;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v19, v21);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v77);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  -[FCUIActivityControl _optionsButtonLayoutFrameForControlFrame:isRTL:](self, "_optionsButtonLayoutFrameForControlFrame:isRTL:", v8, v15, v17, v19, v21);
  v76[0] = v36;
  v76[1] = v37;
  v76[2] = v38;
  v76[3] = v39;
  -[FCUIOptionsControl sizeThatFits:](self->_optionsButton, "sizeThatFits:", v19, v21);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", v76);
  if (!self->_textLayoutDisabled)
  {
    double v58 = v43;
    double v59 = v42;
    double v60 = v41;
    double v61 = v40;
    activityIconPackageView = self->_activityIconPackageView;
    if (activityIconPackageView)
    {
      -[FCUICAPackageView sizeThatFits:](activityIconPackageView, "sizeThatFits:", v19, v21);
      [(FCUIActivityControl *)self _effectiveGlyphPointSize];
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
      [(FCUICAPackageView *)self->_activityIconPackageView setFrame:0];
    }
    -[UIImageView setFrame:](self->_activityIconImageView, "setFrame:", v29, v31, v33, v35);
    -[FCUIOptionsControl setFrame:](self->_optionsButton, "setFrame:", v61, v60, v59, v58);
    [(FCUIOptionsControl *)self->_optionsButton setSelected:self->_controlSize == 1];
    double v45 = 1.0;
    if (self->_controlSize == -1) {
      double v45 = 0.0;
    }
    [(FCUIOptionsControl *)self->_optionsButton setAlpha:v45];
    -[FCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21, v77, v78, v79, v80);
    UIRectCenteredYInRect();
    long long v46 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)&v83.a = *MEMORY[0x263F001A8];
    *(_OWORD *)&v83.c = v46;
    *(_OWORD *)&v69.a = *(_OWORD *)&v83.a;
    *(_OWORD *)&v69.c = v46;
    objc_msgSend(MEMORY[0x263F828E0], "fcui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activityTitleLabel, self->_detailLabel, &v83, &v69, self->_drawingContext);
    -[UILabel setFrame:](self->_activityTitleLabel, "setFrame:", v83.a, v83.b, v83.c, v83.d);
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    long long v74 = *(_OWORD *)&v69.a;
    v73[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_2;
    v73[3] = &unk_264542E38;
    v73[4] = self;
    long long v75 = *(_OWORD *)&v69.c;
    [MEMORY[0x263F82E00] performWithoutAnimation:v73];
    [(UILabel *)self->_detailLabel setAlpha:1.0];
  }
  int64_t controlSize = self->_controlSize;
  if (controlSize == 1)
  {
    v85.origin.x = v15;
    v85.origin.y = v17;
    v85.size.double width = v19;
    v85.size.double height = v21;
    CGFloat MaxY = CGRectGetMaxY(v85);
    v86.origin.x = v65;
    v86.size.double height = v67;
    v86.origin.y = v68;
    v86.size.double width = v66;
    double v49 = CGRectGetHeight(v86);
    v87.origin.x = v15;
    v87.origin.y = v17;
    v87.size.double width = v19;
    v87.size.double height = v21;
    CGFloat v50 = CGRectGetHeight(v87);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_3;
    v72[3] = &unk_264542E38;
    v72[4] = self;
    *(CGFloat *)&v72[5] = v65;
    *(CGFloat *)&v72[6] = MaxY;
    *(CGFloat *)&v72[7] = v66;
    *(double *)&v72[8] = v49 - v50;
    [MEMORY[0x263F82E00] performWithoutAnimation:v72];
    int64_t controlSize = self->_controlSize;
  }
  double v51 = 0.0;
  if (controlSize == 1) {
    double v51 = 1.0;
  }
  [(FCUIActivityControlMenuView *)self->_menuView setAlpha:v51];
  BOOL v52 = [(FCUIActivityControl *)self _isDrawingSelectedAppearance];
  [(FCUIActivityControl *)self _setBackgroundViewHighlighted:v52];
  v53 = kFCUIPackageViewStateOn;
  if (!v52) {
    v53 = &kFCUIPackageViewStateOff;
  }
  -[FCUICAPackageView setState:animated:](self->_activityIconPackageView, "setState:animated:", *v53, [MEMORY[0x263F82E00] _isInAnimationBlockWithAnimationsEnabled]);
  int64_t controlStyle = self->_controlStyle;
  if (controlStyle == 2)
  {
    activityIconImageView = self->_activityIconImageView;
    v56 = [(FCUIActivityControl *)self _activityIconTintColorForSelectedAppearance:v52];
    [(UIImageView *)activityIconImageView setTintColor:v56];

    [(FCUIOptionsControl *)self->_optionsButton setParentControlSelected:v52];
    [(FCUIOptionsControl *)self->_optionsButton layoutIfNeeded];
  }
  else if (controlStyle == 1)
  {
    [(FCUIActivityControl *)self setOverrideUserInterfaceStyle:[(FCUIActivityControl *)self _userInterfaceStyleForSelectedAppearance:v52]];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    CGAffineTransform v71 = v84;
    v70[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_4;
    v70[3] = &unk_264542E60;
    v70[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v70];
    memset(&v83, 0, sizeof(v83));
    if ([(FCUIActivityControl *)self isHighlighted])
    {
      CGAffineTransformMakeScale(&v83, 0.93, 0.93);
    }
    else
    {
      *(_OWORD *)&v83.a = v64;
      *(_OWORD *)&v83.c = v63;
      *(_OWORD *)&v83.tx = v62;
    }
    v57 = self->_contentView;
    CGAffineTransform v69 = v83;
    [(UIView *)v57 setTransform:&v69];
  }
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 456);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(void **)(*(void *)(a1 + 32) + 504);
  return [v2 layoutIfNeeded];
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 456);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(FCUIActivityControl *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityControl;
  [(FCUIActivityControl *)&v7 setHighlighted:v3];
  if (v5 != [(FCUIActivityControl *)self isHighlighted])
  {
    if (self->_controlStyle != 1) {
      [(FCUIActivityControl *)self _updateDrawingSelectedAppearance];
    }
    [(FCUIActivityControl *)self setNeedsLayout];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__FCUIActivityControl_setHighlighted___block_invoke;
    v6[3] = &unk_264542B68;
    v6[4] = self;
    objc_msgSend(MEMORY[0x263F82E00], "fcui_animateWithSelectionParameters:completion:", v6, 0);
  }
}

uint64_t __38__FCUIActivityControl_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityControl;
  [(FCUIActivityControl *)&v4 setSelected:a3];
  [(FCUIActivityControl *)self _updateDrawingSelectedAppearance];
}

- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityControl;
  [(FCUIActivityControl *)&v7 addAction:v6 forControlEvents:a4];
  if (!self->_controlStyle) {
    [(FCUIActivityControl *)self setOptionsAction:v6];
  }
}

- (NSString)activityIdentifier
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activityIdentifier];
}

- (NSUUID)activityUniqueIdentifier
{
  return (NSUUID *)[(FCActivityDescribing *)self->_activityDescription activityUniqueIdentifier];
}

- (int64_t)activitySemanticType
{
  return [(FCActivityDescribing *)self->_activityDescription activitySemanticType];
}

- (NSString)activityDisplayName
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activityDisplayName];
}

- (NSString)activitySymbolImageName
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
}

- (NSString)activityColorName
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activityColorName];
}

- (NSDate)activityCreationDate
{
  return (NSDate *)[(FCActivityDescribing *)self->_activityDescription activityCreationDate];
}

- (NSString)activityDetailText
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activityDetailText];
}

- (NSURL)activitySettingsURL
{
  return (NSURL *)[(FCActivityDescribing *)self->_activityDescription activitySettingsURL];
}

- (NSURL)activitySetupURL
{
  return (NSURL *)[(FCActivityDescribing *)self->_activityDescription activitySetupURL];
}

- (NSArray)activityLifetimeDescriptions
{
  return (NSArray *)[(FCActivityDescribing *)self->_activityDescription activityLifetimeDescriptions];
}

- (NSString)activityLifetimesAlternativeDescription
{
  return (NSString *)[(FCActivityDescribing *)self->_activityDescription activityLifetimesAlternativeDescription];
}

- (BOOL)isPlaceholder
{
  return [(FCActivityDescribing *)self->_activityDescription isPlaceholder];
}

- (UIImage)activityIcon
{
  return [(UIImageView *)self->_activityIconImageView image];
}

- (void)setActivityIcon:(id)a3
{
}

- (NSString)detailText
{
  return [(UILabel *)self->_detailLabel text];
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  int v5 = [(FCUIActivityControl *)self detailText];
  char v6 = BSEqualStrings();

  if ((v6 & 1) == 0)
  {
    objc_super v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __37__FCUIActivityControl_setDetailText___block_invoke;
    v12 = &unk_264542A78;
    uint64_t v13 = self;
    id v14 = v4;
    [v7 performWithoutAnimation:&v9];
    [(FCUIActivityControl *)self setNeedsLayout];
    uint64_t v8 = [(FCUIActivityControl *)self superview];
    [v8 setNeedsLayout];
  }
}

uint64_t __37__FCUIActivityControl_setDetailText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureDetailLabelIfNecessary];
  [*(id *)(*(void *)(a1 + 32) + 488) setText:*(void *)(a1 + 40)];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 488);
  return [v2 setAlpha:0.0];
}

- (void)setSelectionHidden:(BOOL)a3
{
  if (self->_selectionHidden != a3)
  {
    self->_selectionHidden = a3;
    [(FCUIActivityControl *)self _updateDrawingSelectedAppearance];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (BOOL)isExpanded
{
  return self->_controlSize == 1;
}

- (void)setExpanded:(BOOL)a3
{
  int64_t controlSize = self->_controlSize;
  if (a3)
  {
    if (controlSize == 1) {
      return;
    }
  }
  else if (controlSize != 1)
  {
    return;
  }
  self->_int64_t controlSize = a3;
  [(FCUIActivityControl *)self _setNeedsTextAttributesUpdate];
  [(FCUIActivityControl *)self setNeedsLayout];
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationships
{
  return [(FCUIActivityControlMenuView *)self->_menuView pressGestureRecognizer];
}

- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x263F08C38] UUID];
  BOOL v8 = [(FCUIActivityControl *)self isExpanded];
  [(FCUIActivityControl *)self setExpanded:v4];
  BOOL v9 = [(FCUIActivityControl *)self isExpanded];
  if (v8 != v9)
  {
    BOOL v10 = v9;
    objc_setAssociatedObject(self, &_FCUIActivityControlAnimationUUID, v7, (void *)1);
    [(UIView *)self->_contentView setClipsToBounds:1];
    [(FCUIActivityControl *)self setSelectionHidden:v10];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__FCUIActivityControl_setExpanded_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_264542E88;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v6 animateAlongsideTransition:0 completion:v12];
}

void __61__FCUIActivityControl_setExpanded_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    BOOL v3 = objc_getAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID);
    int v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 456) setClipsToBounds:0];
      int v5 = *(void **)(a1 + 32);
      objc_setAssociatedObject(v5, &_FCUIActivityControlAnimationUUID, 0, (void *)1);
    }
  }
}

- (BOOL)isContracted
{
  return self->_controlSize == -1;
}

- (void)setContracted:(BOOL)a3
{
  int64_t controlSize = self->_controlSize;
  if (a3)
  {
    if (controlSize == -1) {
      return;
    }
  }
  else if (controlSize != -1)
  {
    return;
  }
  self->_int64_t controlSize = a3 << 63 >> 63;
  [(FCUIActivityControl *)self _setNeedsTextAttributesUpdate];
  [(FCUIActivityControl *)self setNeedsLayout];
}

- (void)willPresent:(BOOL)a3 withTargetContainerBounds:(CGRect)a4 transitionCoordinator:(id)a5
{
  if (a5)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    BOOL v9 = a3;
    id v11 = (void *)MEMORY[0x263F08C38];
    id v12 = a5;
    id v13 = [v11 UUID];
    objc_setAssociatedObject(self, &_FCUIActivityControlAnimationUUID, v13, (void *)1);
    self->_targetContainerBounds.origin.CGFloat x = x;
    self->_targetContainerBounds.origin.CGFloat y = y;
    self->_targetContainerBounds.size.CGFloat width = width;
    self->_targetContainerBounds.size.CGFloat height = height;
    [(UIView *)self->_contentView setClipsToBounds:1];
    [(FCUIActivityControl *)self _setTextLayoutDisabled:!v9];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __83__FCUIActivityControl_willPresent_withTargetContainerBounds_transitionCoordinator___block_invoke;
    v15[3] = &unk_264542E88;
    v15[4] = self;
    id v16 = v13;
    id v14 = v13;
    [v12 animateAlongsideTransition:0 completion:v15];
  }
}

void __83__FCUIActivityControl_willPresent_withTargetContainerBounds_transitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    BOOL v3 = objc_getAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID);
    int v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if (v4)
    {
      int v5 = (_OWORD *)(*(void *)(a1 + 32) + 552);
      long long v6 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      *int v5 = *MEMORY[0x263F001A8];
      v5[1] = v6;
      [*(id *)(*(void *)(a1 + 32) + 456) setClipsToBounds:0];
      [*(id *)(a1 + 32) _setTextLayoutDisabled:0];
      objc_super v7 = *(void **)(a1 + 32);
      objc_setAssociatedObject(v7, &_FCUIActivityControlAnimationUUID, 0, (void *)1);
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    -[FCUIOptionsControl setAdjustsFontForContentSizeCategory:](self->_optionsButton, "setAdjustsFontForContentSizeCategory:");
    [(FCUIActivityControlMenuView *)self->_menuView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(FCUIActivityControl *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIActivityControl *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    [(FCUIActivityControl *)self _setNeedsTextAttributesUpdate];
    [(FCUIOptionsControl *)self->_optionsButton adjustForContentSizeCategoryChange];
    [(FCUIActivityControlMenuView *)self->_menuView adjustForContentSizeCategoryChange];
  }
  return v3;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  [(FCUIActivityControl *)self _configureBackgroundViewIfNecesssary];
  backgroundView = self->_backgroundView;
  uint64_t v6 = objc_opt_class();
  objc_super v7 = backgroundView;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v9 = v8;

  BOOL v10 = [(UIView *)v9 visualStylingProviderForCategory:a3];

  return v10;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (self->_controlSize == 1) {
    return 0;
  }
  else {
    return a5;
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F82AD0]);
  uint64_t v6 = (void *)MEMORY[0x263F824C0];
  [(FCUIActivityControl *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(UIView *)self->_backgroundView _continuousCornerRadius];
  id v16 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v15);
  [v5 setVisiblePath:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self parameters:v5];
  double v18 = (void *)MEMORY[0x263F82A90];
  double v19 = [MEMORY[0x263F82A58] effectWithPreview:v17];
  double v20 = [v18 styleWithEffect:v19 shape:0];

  return v20;
}

- (double)_cornerRadiusForControlFrame:(CGRect)a3
{
  CGRectGetHeight(a3);
  UIRoundToScale();
  if (result > 37.0) {
    return 37.0;
  }
  return result;
}

- (BOOL)_isDrawingSelectedAppearance
{
  return self->_drawingSelectedAppearance;
}

- (void)_setDrawingSelectedAppearance:(BOOL)a3
{
  if ([(FCUIActivityControl *)self _isDrawingSelectedAppearance] != a3)
  {
    self->_drawingSelectedAppearance = a3;
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateDrawingSelectedAppearance
{
  if (self->_controlStyle)
  {
    if ([(FCUIActivityControl *)self isExpanded]
      || ![(FCUIActivityControl *)self isSelected])
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = [(FCUIActivityControl *)self isSelectionHidden] ^ 1;
    }
  }
  else
  {
    uint64_t v3 = [(FCUIActivityControl *)self isHighlighted];
  }
  [(FCUIActivityControl *)self _setDrawingSelectedAppearance:v3];
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a3) {
    [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  double v7 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x263F817A0];
  uint64_t v14 = *MEMORY[0x263F81850];
  double v8 = [NSNumber numberWithDouble:a5];
  double v15 = v8;
  double v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v11 = [v7 fontDescriptorByAddingAttributes:v10];

  double v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (double)_scaledValueForValue:(double)a3
{
  [(FCUIActivityControl *)self _configureActivityTitleLabelIfNecessary];
  [(FCUIActivityControl *)self _updateTextAttributesIfNecessary];
  id v5 = [(UILabel *)self->_activityTitleLabel font];
  [v5 _scaledValueForValue:a3];
  double v7 = v6;

  return v7;
}

- (double)_effectiveGlyphPointSize
{
  [(FCUIActivityControl *)self _scaledValueForValue:21.0];
  if (result > 30.0) {
    return 30.0;
  }
  return result;
}

- (void)_updateTextAttributesForActivityItemImageView
{
  activityIconImageView = self->_activityIconImageView;
  if (activityIconImageView)
  {
    uint64_t v3 = (void *)MEMORY[0x263F82818];
    [(FCUIActivityControl *)self _effectiveGlyphPointSize];
    objc_msgSend(v3, "configurationWithPointSize:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)activityIconImageView setPreferredSymbolConfiguration:v4];
  }
}

- (void)_updateTextAttributesForActivityTitleLabel
{
  activityTitleLabel = self->_activityTitleLabel;
  if (activityTitleLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F835E8] weight:0x8000 additionalTraits:*MEMORY[0x263F81828]];
    [(UILabel *)activityTitleLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForDetailLabel
{
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F83590] weight:0x8000 additionalTraits:*MEMORY[0x263F81828]];
    [(UILabel *)detailLabel setFont:v3];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategorCGFloat y = 0;

  [(FCUIActivityControl *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  id v3 = [(FCUIActivityControl *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategorCGFloat y = v4;

  [(FCUIActivityControl *)self _updateTextAttributesForActivityTitleLabel];
  [(FCUIActivityControl *)self _updateTextAttributesForActivityItemImageView];
  [(FCUIActivityControl *)self _updateTextAttributesForDetailLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCUIActivityControl *)self _needsTextAttributesUpdate])
  {
    [(FCUIActivityControl *)self _updateTextAttributes];
  }
}

- (void)_configureTextVisualStylingProviderIfNecessary
{
  if (!self->_textVisualStylingProvider)
  {
    id v3 = (void *)MEMORY[0x263F54000];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 _visualStylingProviderForStyleSetNamed:@"focusModeText" inBundle:v6];
    textVisualStylingProvider = self->_textVisualStylingProvider;
    self->_textVisualStylingProvider = v4;
  }
}

- (void)_configureGlyphVisualStylingProviderIfNecessary
{
  if (!self->_glyphVisualStylingProvider)
  {
    id v3 = (void *)MEMORY[0x263F54000];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 _visualStylingProviderForStyleSetNamed:@"focusModeGlyph" inBundle:v6];
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;
    self->_glyphVisualStylingProvider = v4;
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v10 = a3;
  double v7 = [(FCUIActivityControlMenuView *)self->_menuView requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9) {
    [(FCUIActivityControlMenuView *)self->_menuView setVisualStylingProvider:v10 forCategory:a4];
  }
}

- (void)_configureContentViewIfNecessary
{
  if (!self->_contentView)
  {
    id v3 = [_FCUIActivityControlContentView alloc];
    [(FCUIActivityControl *)self bounds];
    id v4 = -[_FCUIActivityControlContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self->_contentView setAutoresizingMask:18];
    id v6 = self->_contentView;
    [(FCUIActivityControl *)self addSubview:v6];
  }
}

- (void)_configureActivityIconImageViewIfNecessaryForReference:(BOOL)a3
{
  if (!self->_activityIconImageView)
  {
    id v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    activityIconImageView = self->_activityIconImageView;
    self->_activityIconImageView = v5;

    [(UIImageView *)self->_activityIconImageView setContentMode:4];
    if (!a3)
    {
      [(FCUIActivityControl *)self _configureContentViewIfNecessary];
      contentView = self->_contentView;
      double v8 = self->_activityIconImageView;
      [(UIView *)contentView addSubview:v8];
    }
  }
}

- (id)_activityIconTintColorForSelectedAppearance:(BOOL)a3
{
  int64_t controlStyle = self->_controlStyle;
  if (!controlStyle) {
    goto LABEL_4;
  }
  if (controlStyle == 2)
  {
    if (a3)
    {
LABEL_4:
      id v4 = objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", self->_activityDescription);
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x263F825C8] labelColor];
  }
  else
  {
    id v4 = 0;
  }
LABEL_7:
  return v4;
}

- (void)_setActivityIcon:(id)a3 forReference:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(FCUIActivityControl *)self activityIcon];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureActivityIconImageViewIfNecessaryForReference:v4];
    [(UIImageView *)self->_activityIconImageView setImage:v10];
    if (!v4)
    {
      if (self->_controlStyle == 1)
      {
        [(FCUIActivityControl *)self _configureGlyphVisualStylingProviderIfNecessary];
        [(FCUIActivityControl *)self _updateVisualStylingOfView:self->_activityIconImageView style:0 visualStylingProvider:self->_glyphVisualStylingProvider outgoingProvider:0];
      }
      else
      {
        activityIconImageView = self->_activityIconImageView;
        int v9 = [(FCUIActivityControl *)self _activityIconTintColorForSelectedAppearance:[(FCUIActivityControl *)self _isDrawingSelectedAppearance]];
        [(UIImageView *)activityIconImageView setTintColor:v9];
      }
      [(FCUIActivityControl *)self setNeedsLayout];
    }
  }
}

- (int64_t)_titleLabelVisualStyleForHighlightState:(BOOL)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)_configureActivityTitleLabelIfNecessary
{
  if (!self->_activityTitleLabel)
  {
    id v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    activityTitleLabel = self->_activityTitleLabel;
    self->_activityTitleLabel = v3;

    [(UILabel *)self->_activityTitleLabel setTextAlignment:1];
    [(UILabel *)self->_activityTitleLabel setNumberOfLines:0];
    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_activityTitleLabel];
    [(FCUIActivityControl *)self _updateTextAttributesForActivityTitleLabel];
    if (self->_controlStyle == 1)
    {
      [(FCUIActivityControl *)self _configureTextVisualStylingProviderIfNecessary];
      id v5 = self->_activityTitleLabel;
      int64_t v6 = [(FCUIActivityControl *)self _titleLabelVisualStyleForHighlightState:[(FCUIActivityControl *)self _isBackgroundViewHighlighted]];
      textVisualStylingProvider = self->_textVisualStylingProvider;
      [(FCUIActivityControl *)self _updateVisualStylingOfView:v5 style:v6 visualStylingProvider:textVisualStylingProvider outgoingProvider:0];
    }
    else
    {
      double v8 = self->_activityTitleLabel;
      id v9 = [MEMORY[0x263F825C8] labelColor];
      [(UILabel *)v8 setTextColor:v9];
    }
  }
}

- (int64_t)_detailLabelVisualStyleForHighlightState:(BOOL)a3
{
  if (a3) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)_configureDetailLabelIfNecessary
{
  if (!self->_detailLabel)
  {
    id v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    detailLabel = self->_detailLabel;
    self->_detailLabel = v3;

    [(UILabel *)self->_detailLabel setTextAlignment:1];
    [(UILabel *)self->_detailLabel setNumberOfLines:0];
    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_detailLabel];
    [(FCUIActivityControl *)self _updateTextAttributesForDetailLabel];
    if (self->_controlStyle == 1)
    {
      [(FCUIActivityControl *)self _configureTextVisualStylingProviderIfNecessary];
      id v5 = self->_detailLabel;
      int64_t v6 = [(FCUIActivityControl *)self _detailLabelVisualStyleForHighlightState:[(FCUIActivityControl *)self _isBackgroundViewHighlighted]];
      textVisualStylingProvider = self->_textVisualStylingProvider;
      [(FCUIActivityControl *)self _updateVisualStylingOfView:v5 style:v6 visualStylingProvider:textVisualStylingProvider outgoingProvider:0];
    }
    else
    {
      double v8 = self->_detailLabel;
      id v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
      [(UILabel *)v8 setTextColor:v9];
    }
  }
}

- (int64_t)_optionsControlTypeForControlStyle:(int64_t)a3
{
  int64_t controlStyle = self->_controlStyle;
  int64_t v4 = 1;
  if (controlStyle == 2) {
    int64_t v4 = 2;
  }
  if (controlStyle == 1) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)_configureOptionsButtonIfNecessary
{
  if (!self->_optionsButton)
  {
    id v3 = [[FCUIOptionsControl alloc] initWithReferencePointSize:21.0 maximumPointSize:30.0];
    optionsButton = self->_optionsButton;
    self->_optionsButton = v3;

    [(FCUIOptionsControl *)self->_optionsButton setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    int64_t controlStyle = self->_controlStyle;
    [(FCUIOptionsControl *)self->_optionsButton setControlType:[(FCUIActivityControl *)self _optionsControlTypeForControlStyle:controlStyle]];
    if (controlStyle == 1)
    {
      [(FCUIActivityControl *)self _configureGlyphVisualStylingProviderIfNecessary];
      [(FCUIOptionsControl *)self->_optionsButton setVisualStylingProvider:self->_glyphVisualStylingProvider forCategory:1];
    }
    else
    {
      int64_t v6 = self->_optionsButton;
      char v7 = [MEMORY[0x263F825C8] labelColor];
      [(FCUIOptionsControl *)v6 setTintColor:v7];
    }
    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    contentView = self->_contentView;
    id v9 = self->_optionsButton;
    [(UIView *)contentView addSubview:v9];
  }
}

- (void)_configureMenuViewIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_menuView)
  {
    id v3 = objc_alloc_init(FCUIActivityControlMenuView);
    menuView = self->_menuView;
    self->_menuView = v3;

    [(FCUIActivityControlMenuView *)self->_menuView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_menuView];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(FCUIActivityControlMenuView *)self->_menuView requiredVisualStyleCategories];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) integerValue];
          double v11 = self->_menuView;
          double v12 = [(FCUIActivityControl *)self visualStylingProviderForCategory:v10];
          [(FCUIActivityControlMenuView *)v11 setVisualStylingProvider:v12 forCategory:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)_configureBackgroundViewIfNecesssary
{
  if (!self->_backgroundView)
  {
    if (self->_controlStyle == 1)
    {
      objc_msgSend(MEMORY[0x263F53FE8], "materialViewWithRecipe:", -[FCUIActivityControl _recipe](self, "_recipe"));
      id v3 = (_FCUIActivityControlBackgroundView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = [[_FCUIActivityControlBackgroundView alloc] initWithControlStyle:self->_controlStyle];
    }
    backgroundView = self->_backgroundView;
    self->_backgroundView = &v3->super;

    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    id v5 = self->_backgroundView;
    [(UIView *)self->_contentView bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_contentView insertSubview:self->_backgroundView atIndex:0];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    uint64_t v6 = self->_backgroundView;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = (uint64_t)v8;
      }
      else {
        uint64_t v7 = 0;
      }
    }

    if (v7)
    {
      id v9 = [(FCUIActivityControl *)self visualStylingProviderForCategory:1];
      [(FCUIActivityControl *)self _visualStylingProviderDidChange:v9 forCategory:1 outgoingProvider:0];
    }
  }
}

- (void)_setActivityIconPackageView:(id)a3
{
  p_activityIconPackageView = &self->_activityIconPackageView;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(FCUICAPackageView *)*p_activityIconPackageView removeFromSuperview];
    objc_storeStrong((id *)&self->_activityIconPackageView, a3);
    [(FCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:*p_activityIconPackageView];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateActivityIcon
{
  if (self->_controlStyle == 1)
  {
    uint64_t v3 = +[FCUICAPackageView packageViewForActivity:self->_activityDescription];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v10 = (id)v3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = v10;
    if (v10 && self->_activityIconPackageView) {
      goto LABEL_9;
    }
    [(UIImageView *)self->_activityIconImageView removeFromSuperview];
    activityIconImageView = self->_activityIconImageView;
    self->_activityIconImageView = 0;
  }
  id v4 = v10;
  if (v10)
  {
LABEL_9:
    [(FCUIActivityControl *)self _setActivityIconPackageView:v4];
    id v6 = (void *)MEMORY[0x263F827E8];
    uint64_t v7 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
    uint64_t v8 = [v6 _systemImageNamed:v7];
    [(FCUIActivityControl *)self _setActivityIcon:v8 forReference:1];
    goto LABEL_11;
  }
  [(FCUIActivityControl *)self _setActivityIconPackageView:0];
  id v9 = (void *)MEMORY[0x263F827E8];
  uint64_t v7 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
  uint64_t v8 = [v9 _systemImageNamed:v7];
  [(FCUIActivityControl *)self setActivityIcon:v8];
LABEL_11:
}

- (void)_updateActivityTitle
{
  id v5 = [(FCUIActivityControl *)self activityDisplayName];
  uint64_t v3 = [(UILabel *)self->_activityTitleLabel text];
  char v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureActivityTitleLabelIfNecessary];
    [(UILabel *)self->_activityTitleLabel setText:v5];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateActivityDetail
{
  id v5 = [(FCUIActivityControl *)self _activityDetailText];
  uint64_t v3 = [(UILabel *)self->_detailLabel text];
  char v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    [(FCUIActivityControl *)self _configureDetailLabelIfNecessary];
    [(UILabel *)self->_detailLabel setText:v5];
    [(FCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateAccessibilityIdentifier
{
  uint64_t v3 = NSString;
  char v4 = [(FCUIActivityControl *)self activityDisplayName];
  id v5 = [v3 stringWithFormat:@"mode-%@", v4];

  [(FCUIActivityControl *)self setAccessibilityIdentifier:v5];
}

- (id)_highlightingBackgroundView
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    backgroundView = self->_backgroundView;
  }
  else {
    backgroundView = 0;
  }
  return backgroundView;
}

- (BOOL)_isBackgroundViewHighlighted
{
  long long v2 = [(FCUIActivityControl *)self _highlightingBackgroundView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_setBackgroundViewHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FCUIActivityControl *)self _isBackgroundViewHighlighted] != a3)
  {
    id v5 = [(FCUIActivityControl *)self _highlightingBackgroundView];
    [v5 setHighlighted:v3];

    if (self->_controlStyle == 1)
    {
      if (v3)
      {
        id v6 = [(FCUIActivityControl *)self visualStylingProviderForCategory:1];
        [v6 stopAutomaticallyUpdatingView:self->_activityIconImageView];

        [(UIImageView *)self->_activityIconImageView mt_removeAllVisualStyling];
        activityIconImageView = self->_activityIconImageView;
        uint64_t v8 = objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", self->_activityDescription);
        [(UIImageView *)activityIconImageView setTintColor:v8];
      }
      else
      {
        id v9 = self->_activityIconImageView;
        uint64_t v8 = [(FCUIActivityControl *)self visualStylingProviderForCategory:1];
        [(FCUIActivityControl *)self _updateVisualStylingOfView:v9 style:0 visualStylingProvider:v8 outgoingProvider:0];
      }

      activityTitleLabel = self->_activityTitleLabel;
      double v11 = [(MTVisualStylingProvider *)self->_textVisualStylingProvider _visualStylingForStyle:[(FCUIActivityControl *)self _titleLabelVisualStyleForHighlightState:v3]];
      [(UILabel *)activityTitleLabel mt_replaceVisualStyling:v11];

      detailLabel = self->_detailLabel;
      long long v13 = [(MTVisualStylingProvider *)self->_textVisualStylingProvider _visualStylingForStyle:[(FCUIActivityControl *)self _detailLabelVisualStyleForHighlightState:v3]];
      [(UILabel *)detailLabel mt_replaceVisualStyling:v13];

      [(FCUIOptionsControl *)self->_optionsButton setParentControlHighlighted:v3];
      optionsButton = self->_optionsButton;
      [(FCUIOptionsControl *)optionsButton layoutIfNeeded];
    }
  }
}

- (CGRect)_iconLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4 controlSize:(int64_t)a5
{
  BOOL v5 = a4;
  CGFloat rect_8 = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83470], self->_preferredContentSizeCategory) == NSOrderedDescending)[(FCUIActivityControl *)self _scaledValueForValue:32.0]; {
  BSRectWithSize();
  }
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  if (v5)
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = rect_8;
    CGFloat rect = v11;
    CGRectGetMaxX(v24);
    v25.origin.CGFloat x = rect;
    v25.origin.CGFloat y = v13;
    v25.size.CGFloat width = v15;
    v25.size.CGFloat height = v17;
    CGRectGetWidth(v25);
  }
  UIRectCenteredYInRectScale();
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_optionsButtonLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83470], self->_preferredContentSizeCategory) == NSOrderedDescending)[(FCUIActivityControl *)self _scaledValueForValue:32.0]; {
  BSRectWithSize();
  }
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  if (!a4)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRectGetWidth(v22);
    v23.origin.CGFloat x = v11;
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v15;
    v23.size.CGFloat height = v17;
    CGRectGetWidth(v23);
  }
  UIRectCenteredYInRectScale();
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_glyphFrameForLayoutFrame:(CGRect *)a3 sizeThatFits:(CGSize)a4
{
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v9 = CGRectGetWidth(v14);
  if (v9 > CGRectGetWidth(*a3))
  {
    a3->origin.CGFloat x = x;
    a3->origin.CGFloat y = y;
    a3->size.CGFloat width = width;
    a3->size.CGFloat height = height;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)_textFrameForControlFrame:(CGRect)a3 iconLayoutFrame:(CGRect)a4 isRTL:(BOOL)a5 controlSize:(int64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (a6 == -1)
  {
    CGFloat v14 = a4.origin.x;
    CGFloat v15 = a4.origin.y;
    CGFloat v16 = a4.size.width;
    CGFloat v17 = a4.size.height;
    if (a5)
    {
      double v18 = CGRectGetMinX(*(CGRect *)&v14) + -12.0;
      double v19 = 22.0;
    }
    else
    {
      double v19 = CGRectGetMaxX(*(CGRect *)&v14) + 12.0;
      v30.origin.CGFloat x = v13;
      v30.origin.CGFloat y = v12;
      v30.size.CGFloat width = v11;
      v30.size.CGFloat height = v10;
      double v18 = CGRectGetMaxX(v30) + -22.0;
    }
    double v24 = v18 - v19;
    v31.origin.CGFloat x = v13;
    v31.origin.CGFloat y = v12;
    v31.size.CGFloat width = v11;
    v31.size.CGFloat height = v10;
    double v21 = CGRectGetHeight(v31);
    double v20 = 0.0;
  }
  else
  {
    if (a5)
    {
      CGRectGetMaxX(a3);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRectGetMinX(v27);
    }
    else
    {
      CGRectGetMaxX(a4);
    }
    v28.origin.CGFloat x = v13;
    v28.origin.CGFloat y = v12;
    v28.size.CGFloat width = v11;
    v28.size.CGFloat height = v10;
    CGRectGetWidth(v28);
    v29.origin.CGFloat x = v13;
    v29.origin.CGFloat y = v12;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v10;
    CGRectGetHeight(v29);
    BSRectWithSize();
    UIRectCenteredXInRect();
    double v19 = v22;
    double v24 = v23;
  }
  double v25 = v19;
  double v26 = v24;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 withControlSize:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  [(FCUIActivityControl *)self _updateTextAttributesIfNecessary];
  if (a4 == -1) {
    double v8 = 40.0;
  }
  else {
    double v8 = 74.0;
  }
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83470], self->_preferredContentSizeCategory) == NSOrderedDescending)[(FCUIActivityControl *)self _scaledValueForValue:v8]; {
  BSRectWithSize();
  }
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(FCUIActivityControl *)self _shouldReverseLayoutDirection];
  -[FCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16);
  double v33 = v18;
  double v34 = v19;
  double v35 = v20;
  double v36 = v21;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v14, v16);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v33);
  -[FCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16, v33, v34, v35, v36);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCUIActivityControl__sizeThatFits_withControlSize___block_invoke;
  aBlock[3] = &unk_264542EB0;
  aBlock[5] = v22;
  aBlock[6] = v23;
  aBlock[7] = v24;
  aBlock[8] = 0x7FEFFFFFFFFFFFFFLL;
  aBlock[4] = self;
  double v25 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
  v25[2](v25, self->_activityTitleLabel);
  ((double (*)(void *, UILabel *))v25[2])(v25, self->_detailLabel);
  if (a4 == 1) {
    -[FCUIActivityControlMenuView sizeThatFits:](self->_menuView, "sizeThatFits:", width, height);
  }
  UISizeRoundToScale();
  double v27 = v26;
  double v29 = v28;

  double v30 = v27;
  double v31 = v29;
  result.double height = v31;
  result.double width = v30;
  return result;
}

double __53__FCUIActivityControl__sizeThatFits_withControlSize___block_invoke(double *a1, void *a2)
{
  uint64_t v2 = *(void *)(*((void *)a1 + 4) + 536);
  double v3 = a1[5];
  double v4 = a1[6];
  double v5 = a1[7];
  double v6 = a1[8];
  id v7 = a2;
  objc_msgSend(v7, "fcui_measuringHeightWithNumberOfLines:", objc_msgSend(v7, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v2, v3, v4, v5, v6));
  double v9 = v8;

  return v9;
}

- (int64_t)_recipe
{
  if (self->_controlStyle == 1) {
    return 4;
  }
  else {
    return 1;
  }
}

- (id)_activityDetailText
{
  if ([(FCUIActivityControl *)self isPlaceholder])
  {
    int64_t controlStyle = self->_controlStyle;
    BOOL v4 = [(FCUIActivityControl *)self showsPersistentDetailText];
    if ((unint64_t)(controlStyle - 1) <= 1)
    {
      double v5 = [(FCUIActivityControl *)self activityDetailText];
      double v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        double v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v7 = [v8 localizedStringForKey:@"ACTIVITY_TRY_IT" value:&stru_26D1B4698 table:0];
      }
      goto LABEL_11;
    }
    if (!v4) {
      goto LABEL_8;
    }
LABEL_6:
    id v7 = [(FCUIActivityControl *)self activityDetailText];
    goto LABEL_11;
  }
  if ([(FCUIActivityControl *)self showsPersistentDetailText]) {
    goto LABEL_6;
  }
LABEL_8:
  id v7 = 0;
LABEL_11:
  return v7;
}

- (void)_setTextLayoutDisabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_textLayoutDisabled != a3)
  {
    double v5 = FCUILogSelection;
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_textLayoutDisabled) {
        double v6 = @"disabled";
      }
      else {
        double v6 = @"enabled";
      }
      int v7 = 138543618;
      double v8 = self;
      __int16 v9 = 2114;
      double v10 = v6;
      _os_log_impl(&dword_21FEDE000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: text layout %{public}@", (uint8_t *)&v7, 0x16u);
    }
    self->_textLayoutDisabled = a3;
  }
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)FCUIActivityControl;
  double v3 = [(FCUIActivityControl *)&v9 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  double v5 = NSString;
  double v6 = [(FCUIActivityControl *)self activityDisplayName];
  int v7 = [v5 stringWithFormat:@"; activityDisplayName: %@", v6];
  objc_msgSend(v4, "insertString:atIndex:", v7, objc_msgSend(v4, "rangeOfString:options:", @">", 4));

  return (NSString *)v4;
}

- (BOOL)isSelectionHidden
{
  return self->_selectionHidden;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_glyphVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_textVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_menuView, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIconPackageView, 0);
  objc_storeStrong((id *)&self->_activityIconImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end