@interface RPCCUIActivityControl
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
- (CGRect)_glyphFrameForLayoutFrame:(CGRect *)a3 sizeThatFits:(CGSize)a4;
- (CGRect)_iconLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4 controlSize:(int64_t)a5;
- (CGRect)_optionsButtonLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4;
- (CGRect)_textFrameForControlFrame:(CGRect)a3 iconLayoutFrame:(CGRect)a4 isRTL:(BOOL)a5 controlSize:(int64_t)a6;
- (CGSize)_sizeThatFits:(CGSize)a3 withControlSize:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
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
- (NSString)intensityName;
- (NSString)menuAlternativeDescription;
- (NSString)preferredContentSizeCategory;
- (NSURL)activitySettingsURL;
- (NSURL)activitySetupURL;
- (NSUUID)activityUniqueIdentifier;
- (RPCCActivityDescribing)activityDescription;
- (RPCCUIActivityControl)initWithActivityDescription:(id)a3;
- (RPCCUIActivityControl)initWithActivityDescription:(id)a3 style:(int64_t)a4;
- (RPCCUIActivityControlMenuView)menuView;
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
- (void)setMenuView:(id)a3;
- (void)setOptionsAction:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionHidden:(BOOL)a3;
- (void)updateActivityIconImageView;
- (void)willPresent:(BOOL)a3 withTargetContainerBounds:(CGRect)a4 transitionCoordinator:(id)a5;
@end

@implementation RPCCUIActivityControl

- (RPCCUIActivityControl)initWithActivityDescription:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPCCUIActivityControl;
  v7 = [(RPCCUIActivityControl *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_controlStyle = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    [(RPCCUIActivityControl *)v7 setActivityDescription:v6];
    v9 = +[UIDevice currentDevice];
    v10 = (char *)[v9 userInterfaceIdiom];

    if (v10 == (unsigned char *)&dword_0 + 1)
    {
      id v11 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v8];
      [(RPCCUIActivityControl *)v8 addInteraction:v11];
    }
  }

  return v8;
}

- (RPCCUIActivityControl)initWithActivityDescription:(id)a3
{
  return [(RPCCUIActivityControl *)self initWithActivityDescription:a3 style:0];
}

- (void)setActivityDescription:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activityDescription, a3);
    [(RPCCUIActivityControl *)self _updateActivityIcon];
    [(RPCCUIActivityControl *)self _updateActivityTitle];
    [(RPCCUIActivityControl *)self _updateActivityDetail];
    [(RPCCUIActivityControl *)self _updateAccessibilityIdentifier];
  }
}

- (UIAction)defaultAction
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1EEEC;
  v9 = sub_1EEFC;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1EF04;
  v4[3] = &unk_69548;
  v4[4] = &v5;
  [(RPCCUIActivityControl *)self enumerateEventHandlers:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIAction *)v2;
}

- (void)setDefaultAction:(id)a3
{
  id v5 = a3;
  v4 = [(RPCCUIActivityControl *)self defaultAction];
  if ((objc_msgSend(v5, "rpccui_isEqualToAction:", v4) & 1) == 0)
  {
    if (v4) {
      [(RPCCUIActivityControl *)self removeAction:v4 forControlEvents:64];
    }
    if (v5) {
      [(RPCCUIActivityControl *)self addAction:v5 forControlEvents:64];
    }
  }
}

- (UIAction)optionsAction
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1EEEC;
  id v10 = sub_1EEFC;
  id v11 = 0;
  optionsButton = self->_optionsButton;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1F118;
  v5[3] = &unk_69548;
  v5[4] = &v6;
  [(RPCCUIOptionsControl *)optionsButton enumerateEventHandlers:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIAction *)v3;
}

- (void)setOptionsAction:(id)a3
{
  id v5 = a3;
  v4 = [(RPCCUIActivityControl *)self optionsAction];
  if ((objc_msgSend(v5, "rpccui_isEqualToAction:", v4) & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureOptionsButtonIfNecessary];
    if (v4) {
      [(RPCCUIOptionsControl *)self->_optionsButton removeAction:v4 forControlEvents:64];
    }
    if (v5) {
      [(RPCCUIOptionsControl *)self->_optionsButton addAction:v5 forControlEvents:64];
    }
  }
}

- (NSArray)menuItemActions
{
  return [(RPCCUIActivityControlMenuView *)self->_menuView menuItemActions];
}

- (void)setMenuItemActions:(id)a3
{
  id v6 = a3;
  v4 = [(RPCCUIActivityControl *)self menuItemActions];
  unsigned __int8 v5 = objc_msgSend(v6, "rpccui_isEqualToActionArray:", v4);

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(RPCCUIActivityControlMenuView *)self->_menuView setMenuItemActions:v6];
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (NSArray)menuItemElements
{
  return [(RPCCUIActivityControlMenuView *)self->_menuView menuItemElements];
}

- (NSString)menuAlternativeDescription
{
  return [(RPCCUIActivityControlMenuView *)self->_menuView menuAlternativeDescription];
}

- (void)setMenuAlternativeDescription:(id)a3
{
  id v6 = a3;
  v4 = [(RPCCUIActivityControl *)self menuAlternativeDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(RPCCUIActivityControlMenuView *)self->_menuView setMenuAlternativeDescription:v6];
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (UIAction)footerAction
{
  return [(RPCCUIActivityControlMenuView *)self->_menuView footerAction];
}

- (void)setFooterAction:(id)a3
{
  id v6 = a3;
  v4 = [(RPCCUIActivityControl *)self footerAction];
  unsigned __int8 v5 = objc_msgSend(v6, "rpccui_isEqualToAction:", v4);

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureMenuViewIfNecessary];
    [(RPCCUIActivityControlMenuView *)self->_menuView setFooterAction:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[RPCCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", self->_controlSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  long long v63 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v64 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v84.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v84.c = v63;
  long long v62 = *(_OWORD *)&CGAffineTransformIdentity.tx;
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
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1FB48;
    v82[3] = &unk_68F10;
    v82[4] = self;
    +[UIView performWithoutAnimation:v82];
  }
  v81.receiver = self;
  v81.super_class = (Class)RPCCUIActivityControl;
  [(RPCCUIActivityControl *)&v81 layoutSubviews];
  [(UIView *)self->_contentView bounds];
  CGFloat v65 = v4;
  CGFloat v66 = v5;
  CGFloat v67 = v7;
  CGFloat v68 = v6;
  [(RPCCUIActivityControl *)self _configureBackgroundViewIfNecesssary];
  id v8 = [(RPCCUIActivityControl *)self _shouldReverseLayoutDirection];
  if (CGRectIsEmpty(self->_targetContainerBounds))
  {
    [(RPCCUIActivityControl *)self bounds];
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
  -[RPCCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", v13, width, height);
  BSRectWithSize();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[RPCCUIActivityControl _cornerRadiusForControlFrame:](self, "_cornerRadiusForControlFrame:");
  double v23 = v22;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  [(RPCCUIActivityControlMenuView *)self->_menuView _setContinuousCornerRadius:v23];
  -[RPCCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21);
  double v77 = v24;
  double v78 = v25;
  double v79 = v26;
  double v80 = v27;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v19, v21);
  -[RPCCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v77);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  -[RPCCUIActivityControl _optionsButtonLayoutFrameForControlFrame:isRTL:](self, "_optionsButtonLayoutFrameForControlFrame:isRTL:", v8, v15, v17, v19, v21);
  v76[0] = v36;
  v76[1] = v37;
  v76[2] = v38;
  v76[3] = v39;
  -[RPCCUIOptionsControl sizeThatFits:](self->_optionsButton, "sizeThatFits:", v19, v21);
  -[RPCCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", v76);
  if (!self->_textLayoutDisabled)
  {
    double v58 = v43;
    double v59 = v42;
    double v60 = v41;
    double v61 = v40;
    activityIconPackageView = self->_activityIconPackageView;
    if (activityIconPackageView)
    {
      -[BSUICAPackageView sizeThatFits:](activityIconPackageView, "sizeThatFits:", v19, v21);
      [(RPCCUIActivityControl *)self _effectiveGlyphPointSize];
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
      [(BSUICAPackageView *)self->_activityIconPackageView setFrame:0];
    }
    -[UIImageView setFrame:](self->_activityIconImageView, "setFrame:", v29, v31, v33, v35);
    -[RPCCUIOptionsControl setFrame:](self->_optionsButton, "setFrame:", v61, v60, v59, v58);
    [(RPCCUIOptionsControl *)self->_optionsButton setSelected:self->_controlSize == 1];
    double v45 = 1.0;
    if (self->_controlSize == -1) {
      double v45 = 0.0;
    }
    [(RPCCUIOptionsControl *)self->_optionsButton setAlpha:v45];
    -[RPCCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21, v77, v78, v79, v80);
    UIRectCenteredYInRect();
    CGSize size = CGRectZero.size;
    *(CGPoint *)&v83.a = CGRectZero.origin;
    *(CGSize *)&v83.c = size;
    *(_OWORD *)&v69.a = *(_OWORD *)&v83.a;
    *(CGSize *)&v69.c = size;
    +[UILabel rpccui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:](UILabel, "rpccui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activityTitleLabel, self->_detailLabel, &v83, &v69, self->_drawingContext);
    -[UILabel setFrame:](self->_activityTitleLabel, "setFrame:", v83.a, v83.b, v83.c, v83.d);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    long long v74 = *(_OWORD *)&v69.a;
    v73[2] = sub_1FB94;
    v73[3] = &unk_69358;
    v73[4] = self;
    long long v75 = *(_OWORD *)&v69.c;
    +[UIView performWithoutAnimation:v73];
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
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1FBB4;
    v72[3] = &unk_69358;
    v72[4] = self;
    *(CGFloat *)&v72[5] = v65;
    *(CGFloat *)&v72[6] = MaxY;
    *(CGFloat *)&v72[7] = v66;
    *(double *)&v72[8] = v49 - v50;
    +[UIView performWithoutAnimation:v72];
    int64_t controlSize = self->_controlSize;
  }
  double v51 = 0.0;
  if (controlSize == 1) {
    double v51 = 1.0;
  }
  [(RPCCUIActivityControlMenuView *)self->_menuView setAlpha:v51];
  BOOL v52 = [(RPCCUIActivityControl *)self _isDrawingSelectedAppearance];
  [(RPCCUIActivityControl *)self _setBackgroundViewHighlighted:v52];
  v53 = kRPCCUIPackageViewStateOn;
  if (!v52) {
    v53 = &kRPCCUIPackageViewStateOff;
  }
  [(BSUICAPackageView *)self->_activityIconPackageView setState:*v53 animated:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
  int64_t controlStyle = self->_controlStyle;
  if (controlStyle == 2)
  {
    activityIconImageView = self->_activityIconImageView;
    v56 = [(RPCCUIActivityControl *)self _activityIconTintColorForSelectedAppearance:v52];
    [(UIImageView *)activityIconImageView setTintColor:v56];

    [(RPCCUIOptionsControl *)self->_optionsButton setParentControlSelected:v52];
    [(RPCCUIOptionsControl *)self->_optionsButton layoutIfNeeded];
  }
  else if (controlStyle == 1)
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    CGAffineTransform v71 = v84;
    v70[2] = sub_1FC08;
    v70[3] = &unk_69570;
    v70[4] = self;
    +[UIView performWithoutAnimation:v70];
    memset(&v83, 0, sizeof(v83));
    if ([(RPCCUIActivityControl *)self isHighlighted])
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != (char *)&dword_0 + 1
    || [v4 numberOfTapsRequired] != (char *)&dword_0 + 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(RPCCUIActivityControl *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)RPCCUIActivityControl;
  [(RPCCUIActivityControl *)&v7 setHighlighted:v3];
  if (v5 != [(RPCCUIActivityControl *)self isHighlighted])
  {
    if (self->_controlStyle != 1) {
      [(RPCCUIActivityControl *)self _updateDrawingSelectedAppearance];
    }
    [(RPCCUIActivityControl *)self setNeedsLayout];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1FDD4;
    v6[3] = &unk_68F10;
    v6[4] = self;
    +[UIView rpccui_animateWithSelectionParameters:v6 completion:0];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RPCCUIActivityControl;
  [(RPCCUIActivityControl *)&v4 setSelected:a3];
  [(RPCCUIActivityControl *)self _updateDrawingSelectedAppearance];
}

- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RPCCUIActivityControl;
  [(RPCCUIActivityControl *)&v7 addAction:v6 forControlEvents:a4];
  if (!self->_controlStyle) {
    [(RPCCUIActivityControl *)self setOptionsAction:v6];
  }
}

- (NSString)activityIdentifier
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activityIdentifier];
}

- (NSUUID)activityUniqueIdentifier
{
  return (NSUUID *)[(RPCCActivityDescribing *)self->_activityDescription activityUniqueIdentifier];
}

- (NSString)activityDisplayName
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activityDisplayName];
}

- (NSString)activitySymbolImageName
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activitySymbolImageName];
}

- (NSString)activityColorName
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activityColorName];
}

- (NSString)intensityName
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription intensityName];
}

- (NSDate)activityCreationDate
{
  return (NSDate *)[(RPCCActivityDescribing *)self->_activityDescription activityCreationDate];
}

- (NSString)activityDetailText
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activityDetailText];
}

- (NSURL)activitySettingsURL
{
  return (NSURL *)[(RPCCActivityDescribing *)self->_activityDescription activitySettingsURL];
}

- (NSURL)activitySetupURL
{
  return (NSURL *)[(RPCCActivityDescribing *)self->_activityDescription activitySetupURL];
}

- (NSArray)activityLifetimeDescriptions
{
  return (NSArray *)[(RPCCActivityDescribing *)self->_activityDescription activityLifetimeDescriptions];
}

- (NSString)activityLifetimesAlternativeDescription
{
  return (NSString *)[(RPCCActivityDescribing *)self->_activityDescription activityLifetimesAlternativeDescription];
}

- (BOOL)isPlaceholder
{
  return [(RPCCActivityDescribing *)self->_activityDescription isPlaceholder];
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
  unsigned int v5 = [(RPCCUIActivityControl *)self detailText];
  char v6 = BSEqualStrings();

  if ((v6 & 1) == 0)
  {
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_20090;
    double v11 = &unk_69088;
    v12 = self;
    id v13 = v4;
    +[UIView performWithoutAnimation:&v8];
    [(RPCCUIActivityControl *)self setNeedsLayout];
    objc_super v7 = [(RPCCUIActivityControl *)self superview];
    [v7 setNeedsLayout];
  }
}

- (void)setSelectionHidden:(BOOL)a3
{
  if (self->_selectionHidden != a3)
  {
    self->_selectionHidden = a3;
    [(RPCCUIActivityControl *)self _updateDrawingSelectedAppearance];
    [(RPCCUIActivityControl *)self setNeedsLayout];
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
  [(RPCCUIActivityControl *)self _setNeedsTextAttributesUpdate];

  [(RPCCUIActivityControl *)self setNeedsLayout];
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationships
{
  return [(RPCCUIActivityControlMenuView *)self->_menuView pressGestureRecognizer];
}

- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = +[NSUUID UUID];
  unsigned int v8 = [(RPCCUIActivityControl *)self isExpanded];
  [(RPCCUIActivityControl *)self setExpanded:v4];
  if (v8 != [(RPCCUIActivityControl *)self isExpanded])
  {
    objc_setAssociatedObject(self, &unk_7DD98, v7, (char *)&dword_0 + 1);
    [(UIView *)self->_contentView setClipsToBounds:1];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_202F4;
  v10[3] = &unk_69598;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v6 animateAlongsideTransition:0 completion:v10];
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
  [(RPCCUIActivityControl *)self _setNeedsTextAttributesUpdate];

  [(RPCCUIActivityControl *)self setNeedsLayout];
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
    id v11 = a5;
    v12 = +[NSUUID UUID];
    objc_setAssociatedObject(self, &unk_7DD98, v12, (char *)&dword_0 + 1);
    self->_targetContainerBounds.origin.CGFloat x = x;
    self->_targetContainerBounds.origin.CGFloat y = y;
    self->_targetContainerBounds.size.CGFloat width = width;
    self->_targetContainerBounds.size.CGFloat height = height;
    [(UIView *)self->_contentView setClipsToBounds:1];
    [(RPCCUIActivityControl *)self _setTextLayoutDisabled:!v9];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2055C;
    v14[3] = &unk_69598;
    v14[4] = self;
    id v15 = v12;
    id v13 = v12;
    [v11 animateAlongsideTransition:0 completion:v14];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    -[RPCCUIOptionsControl setAdjustsFontForContentSizeCategory:](self->_optionsButton, "setAdjustsFontForContentSizeCategory:");
    [(RPCCUIActivityControlMenuView *)self->_menuView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(RPCCUIActivityControl *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIActivityControl *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    [(RPCCUIActivityControl *)self _setNeedsTextAttributesUpdate];
    [(RPCCUIOptionsControl *)self->_optionsButton adjustForContentSizeCategoryChange];
    [(RPCCUIActivityControlMenuView *)self->_menuView adjustForContentSizeCategoryChange];
  }
  return v3;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  [(RPCCUIActivityControl *)self _configureBackgroundViewIfNecesssary];
  backgroundView = self->_backgroundView;
  Class v6 = NSClassFromString(@"MTMaterialView");
  objc_super v7 = backgroundView;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  BOOL v9 = v8;

  id v10 = [(UIView *)v9 visualStylingProviderForCategory:a3];

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
  id v5 = objc_alloc_init((Class)UIPreviewParameters);
  [(RPCCUIActivityControl *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self->_backgroundView _continuousCornerRadius];
  id v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7, v9, v11, v13, v14);
  [v5 setVisiblePath:v15];

  id v16 = [objc_alloc((Class)UITargetedPreview) initWithView:self parameters:v5];
  double v17 = +[UIPointerEffect effectWithPreview:v16];
  double v18 = +[UIPointerStyle styleWithEffect:v17 shape:0];

  return v18;
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
  if ([(RPCCUIActivityControl *)self _isDrawingSelectedAppearance] != a3)
  {
    self->_drawingSelectedAppearance = a3;
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateDrawingSelectedAppearance
{
  if (self->_controlStyle)
  {
    if ([(RPCCUIActivityControl *)self isSelected]) {
      id v3 = (id)([(RPCCUIActivityControl *)self isSelectionHidden] ^ 1);
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = [(RPCCUIActivityControl *)self isHighlighted];
  }

  [(RPCCUIActivityControl *)self _setDrawingSelectedAppearance:v3];
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  if (a3) {
    +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  double v7 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v14 = UIFontWeightTrait;
  double v8 = +[NSNumber numberWithDouble:a5];
  id v15 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  double v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  double v11 = [v7 fontDescriptorByAddingAttributes:v10];

  double v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (double)_scaledValueForValue:(double)a3
{
  [(RPCCUIActivityControl *)self _configureActivityTitleLabelIfNecessary];
  [(RPCCUIActivityControl *)self _updateTextAttributesIfNecessary];
  id v5 = [(UILabel *)self->_activityTitleLabel font];
  [v5 _scaledValueForValue:a3];
  double v7 = v6;

  return v7;
}

- (double)_effectiveGlyphPointSize
{
  [(RPCCUIActivityControl *)self _scaledValueForValue:21.0];
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
    [(RPCCUIActivityControl *)self _effectiveGlyphPointSize];
    +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)activityIconImageView setPreferredSymbolConfiguration:v3];
  }
}

- (void)_updateTextAttributesForActivityTitleLabel
{
  activityTitleLabel = self->_activityTitleLabel;
  if (activityTitleLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleSubhead weight:0x8000 additionalTraits:UIFontWeightMedium];
    [(UILabel *)activityTitleLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForDetailLabel
{
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleCaption2 weight:0x8000 additionalTraits:UIFontWeightMedium];
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

  [(RPCCUIActivityControl *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  id v3 = [(RPCCUIActivityControl *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategorCGFloat y = v4;

  [(RPCCUIActivityControl *)self _updateTextAttributesForActivityTitleLabel];
  [(RPCCUIActivityControl *)self _updateTextAttributesForActivityItemImageView];

  [(RPCCUIActivityControl *)self _updateTextAttributesForDetailLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIActivityControl *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIActivityControl *)self _updateTextAttributes];
  }
}

- (void)_configureTextVisualStylingProviderIfNecessary
{
  if (!self->_textVisualStylingProvider)
  {
    id v3 = sub_2CA18();
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v4 = [v3 _visualStylingProviderForStyleSetNamed:@"focusModeText" inBundle:v6];
    textVisualStylingProvider = self->_textVisualStylingProvider;
    self->_textVisualStylingProvider = v4;
  }
}

- (void)_configureGlyphVisualStylingProviderIfNecessary
{
  if (!self->_glyphVisualStylingProvider)
  {
    id v3 = sub_2CA18();
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v4 = [v3 _visualStylingProviderForStyleSetNamed:@"focusModeGlyph" inBundle:v6];
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
  double v7 = [(RPCCUIActivityControlMenuView *)self->_menuView requiredVisualStyleCategories];
  double v8 = +[NSNumber numberWithInteger:a4];
  unsigned int v9 = [v7 containsObject:v8];

  if (v9) {
    [(RPCCUIActivityControlMenuView *)self->_menuView setVisualStylingProvider:v10 forCategory:a4];
  }
}

- (void)_configureContentViewIfNecessary
{
  if (!self->_contentView)
  {
    id v3 = [_RPCCUIActivityControlContentView alloc];
    [(RPCCUIActivityControl *)self bounds];
    BOOL v4 = -[_RPCCUIActivityControlContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self->_contentView setAutoresizingMask:18];
    id v6 = self->_contentView;
    [(RPCCUIActivityControl *)self addSubview:v6];
  }
}

- (void)_configureActivityIconImageViewIfNecessaryForReference:(BOOL)a3
{
  if (!self->_activityIconImageView)
  {
    id v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    activityIconImageView = self->_activityIconImageView;
    self->_activityIconImageView = v5;

    [(UIImageView *)self->_activityIconImageView setContentMode:4];
    if (!a3)
    {
      [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
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
      BOOL v4 = +[UIColor rpccui_colorForActivity:self->_activityDescription];
      goto LABEL_7;
    }
    BOOL v4 = +[UIColor labelColor];
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_7:

  return v4;
}

- (void)_setActivityIcon:(id)a3 forReference:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(RPCCUIActivityControl *)self activityIcon];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureActivityIconImageViewIfNecessaryForReference:v4];
    [(UIImageView *)self->_activityIconImageView setImage:v10];
    if (!v4)
    {
      if (self->_controlStyle == 1)
      {
        [(RPCCUIActivityControl *)self _configureGlyphVisualStylingProviderIfNecessary];
        [(RPCCUIActivityControl *)self _updateVisualStylingOfView:self->_activityIconImageView style:0 visualStylingProvider:self->_glyphVisualStylingProvider outgoingProvider:0];
      }
      else
      {
        activityIconImageView = self->_activityIconImageView;
        unsigned int v9 = [(RPCCUIActivityControl *)self _activityIconTintColorForSelectedAppearance:[(RPCCUIActivityControl *)self _isDrawingSelectedAppearance]];
        [(UIImageView *)activityIconImageView setTintColor:v9];
      }
      [(RPCCUIActivityControl *)self setNeedsLayout];
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
    id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    activityTitleLabel = self->_activityTitleLabel;
    self->_activityTitleLabel = v3;

    [(UILabel *)self->_activityTitleLabel setTextAlignment:1];
    [(UILabel *)self->_activityTitleLabel setNumberOfLines:0];
    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_activityTitleLabel];
    [(RPCCUIActivityControl *)self _updateTextAttributesForActivityTitleLabel];
    if (self->_controlStyle == 1)
    {
      [(RPCCUIActivityControl *)self _configureTextVisualStylingProviderIfNecessary];
      id v5 = self->_activityTitleLabel;
      int64_t v6 = [(RPCCUIActivityControl *)self _titleLabelVisualStyleForHighlightState:[(RPCCUIActivityControl *)self _isBackgroundViewHighlighted]];
      textVisualStylingProvider = self->_textVisualStylingProvider;
      [(RPCCUIActivityControl *)self _updateVisualStylingOfView:v5 style:v6 visualStylingProvider:textVisualStylingProvider outgoingProvider:0];
    }
    else
    {
      double v8 = self->_activityTitleLabel;
      id v9 = +[UIColor labelColor];
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
    id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    detailLabel = self->_detailLabel;
    self->_detailLabel = v3;

    [(UILabel *)self->_detailLabel setTextAlignment:1];
    [(UILabel *)self->_detailLabel setNumberOfLines:0];
    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_detailLabel];
    [(RPCCUIActivityControl *)self _updateTextAttributesForDetailLabel];
    if (self->_controlStyle == 1)
    {
      [(RPCCUIActivityControl *)self _configureTextVisualStylingProviderIfNecessary];
      id v5 = self->_detailLabel;
      int64_t v6 = [(RPCCUIActivityControl *)self _detailLabelVisualStyleForHighlightState:[(RPCCUIActivityControl *)self _isBackgroundViewHighlighted]];
      textVisualStylingProvider = self->_textVisualStylingProvider;
      [(RPCCUIActivityControl *)self _updateVisualStylingOfView:v5 style:v6 visualStylingProvider:textVisualStylingProvider outgoingProvider:0];
    }
    else
    {
      double v8 = self->_detailLabel;
      id v9 = +[UIColor secondaryLabelColor];
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
    id v3 = [[RPCCUIOptionsControl alloc] initWithReferencePointSize:21.0 maximumPointSize:30.0];
    optionsButton = self->_optionsButton;
    self->_optionsButton = v3;

    [(RPCCUIOptionsControl *)self->_optionsButton setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    int64_t controlStyle = self->_controlStyle;
    [(RPCCUIOptionsControl *)self->_optionsButton setControlType:[(RPCCUIActivityControl *)self _optionsControlTypeForControlStyle:controlStyle]];
    if (controlStyle == 1)
    {
      [(RPCCUIActivityControl *)self _configureGlyphVisualStylingProviderIfNecessary];
      [(RPCCUIOptionsControl *)self->_optionsButton setVisualStylingProvider:self->_glyphVisualStylingProvider forCategory:1];
    }
    else
    {
      int64_t v6 = self->_optionsButton;
      char v7 = +[UIColor labelColor];
      [(RPCCUIOptionsControl *)v6 setTintColor:v7];
    }
    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    contentView = self->_contentView;
    id v9 = self->_optionsButton;
    [(UIView *)contentView addSubview:v9];
  }
}

- (void)_configureMenuViewIfNecessary
{
  if (!self->_menuView)
  {
    id v3 = objc_alloc_init(RPCCUIActivityControlMenuView);
    menuView = self->_menuView;
    self->_menuView = v3;

    [(RPCCUIActivityControlMenuView *)self->_menuView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:self->_menuView];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(RPCCUIActivityControlMenuView *)self->_menuView requiredVisualStyleCategories];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) integerValue];
          double v11 = self->_menuView;
          double v12 = [(RPCCUIActivityControl *)self visualStylingProviderForCategory:v10];
          [(RPCCUIActivityControlMenuView *)v11 setVisualStylingProvider:v12 forCategory:v10];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
      objc_msgSend(sub_2C8DC(), "materialViewWithRecipe:", -[RPCCUIActivityControl _recipe](self, "_recipe"));
      id v3 = (_RPCCUIActivityControlBackgroundView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = [[_RPCCUIActivityControlBackgroundView alloc] initWithControlStyle:self->_controlStyle];
    }
    backgroundView = self->_backgroundView;
    self->_backgroundView = &v3->super;

    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    id v5 = self->_backgroundView;
    [(UIView *)self->_contentView bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_contentView insertSubview:self->_backgroundView atIndex:0];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    id v6 = self->_backgroundView;
    Class v7 = NSClassFromString(@"MTMaterialView");
    uint64_t v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        Class v7 = (Class)v8;
      }
      else {
        Class v7 = 0;
      }
    }

    if (v7)
    {
      id v9 = [(RPCCUIActivityControl *)self visualStylingProviderForCategory:1];
      [(RPCCUIActivityControl *)self _visualStylingProviderDidChange:v9 forCategory:1 outgoingProvider:0];
    }
  }
}

- (void)_setActivityIconPackageView:(id)a3
{
  p_activityIconPackageView = &self->_activityIconPackageView;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(BSUICAPackageView *)*p_activityIconPackageView removeFromSuperview];
    objc_storeStrong((id *)&self->_activityIconPackageView, a3);
    [(RPCCUIActivityControl *)self _configureContentViewIfNecessary];
    [(UIView *)self->_contentView addSubview:*p_activityIconPackageView];
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateActivityIcon
{
  id v4 = [(RPCCActivityDescribing *)self->_activityDescription activitySymbolImageName];
  id v3 = +[UIImage _systemImageNamed:v4];
  [(RPCCUIActivityControl *)self setActivityIcon:v3];
}

- (void)_updateActivityTitle
{
  id v5 = [(RPCCUIActivityControl *)self activityDisplayName];
  id v3 = [(UILabel *)self->_activityTitleLabel text];
  char v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureActivityTitleLabelIfNecessary];
    [(UILabel *)self->_activityTitleLabel setText:v5];
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateActivityDetail
{
  id v5 = [(RPCCUIActivityControl *)self _activityDetailText];
  id v3 = [(UILabel *)self->_detailLabel text];
  char v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    [(RPCCUIActivityControl *)self _configureDetailLabelIfNecessary];
    [(UILabel *)self->_detailLabel setText:v5];
    [(RPCCUIActivityControl *)self setNeedsLayout];
  }
}

- (void)_updateAccessibilityIdentifier
{
  id v3 = [(RPCCUIActivityControl *)self activityDisplayName];
  id v4 = +[NSString stringWithFormat:@"mode-%@", v3];

  [(RPCCUIActivityControl *)self setAccessibilityIdentifier:v4];
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
  id v2 = [(RPCCUIActivityControl *)self _highlightingBackgroundView];
  unsigned __int8 v3 = [v2 isHighlighted];

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
  if ([(RPCCUIActivityControl *)self _isBackgroundViewHighlighted] != a3)
  {
    id v5 = [(RPCCUIActivityControl *)self _highlightingBackgroundView];
    [v5 setHighlighted:v3];

    if (self->_controlStyle == 1)
    {
      if (v3)
      {
        id v6 = [(RPCCUIActivityControl *)self visualStylingProviderForCategory:1];
        [v6 stopAutomaticallyUpdatingView:self->_activityIconImageView];

        [(UIImageView *)self->_activityIconImageView mt_removeAllVisualStyling];
        activityIconImageView = self->_activityIconImageView;
        uint64_t v8 = +[UIColor rpccui_colorForActivity:self->_activityDescription];
        [(UIImageView *)activityIconImageView setTintColor:v8];
      }
      else
      {
        id v9 = self->_activityIconImageView;
        uint64_t v8 = [(RPCCUIActivityControl *)self visualStylingProviderForCategory:1];
        [(RPCCUIActivityControl *)self _updateVisualStylingOfView:v9 style:0 visualStylingProvider:v8 outgoingProvider:0];
      }

      activityTitleLabel = self->_activityTitleLabel;
      double v11 = [(MTVisualStylingProvider *)self->_textVisualStylingProvider _visualStylingForStyle:[(RPCCUIActivityControl *)self _titleLabelVisualStyleForHighlightState:v3]];
      [(UILabel *)activityTitleLabel mt_replaceVisualStyling:v11];

      detailLabel = self->_detailLabel;
      long long v13 = [(MTVisualStylingProvider *)self->_textVisualStylingProvider _visualStylingForStyle:[(RPCCUIActivityControl *)self _detailLabelVisualStyleForHighlightState:v3]];
      [(UILabel *)detailLabel mt_replaceVisualStyling:v13];

      [(RPCCUIOptionsControl *)self->_optionsButton setParentControlHighlighted:v3];
      optionsButton = self->_optionsButton;
      [(RPCCUIOptionsControl *)optionsButton layoutIfNeeded];
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
  if (UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryMedium, self->_preferredContentSizeCategory) == NSOrderedDescending) {
    [(RPCCUIActivityControl *)self _scaledValueForValue:32.0];
  }
  BSRectWithSize();
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
  if (UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryMedium, self->_preferredContentSizeCategory) == NSOrderedDescending) {
    [(RPCCUIActivityControl *)self _scaledValueForValue:32.0];
  }
  BSRectWithSize();
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
  [(RPCCUIActivityControl *)self _updateTextAttributesIfNecessary];
  if (a4 == -1) {
    double v8 = 40.0;
  }
  else {
    double v8 = 74.0;
  }
  if (UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryMedium, self->_preferredContentSizeCategory) == NSOrderedDescending) {
    [(RPCCUIActivityControl *)self _scaledValueForValue:v8];
  }
  BSRectWithSize();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [(RPCCUIActivityControl *)self _shouldReverseLayoutDirection];
  -[RPCCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16);
  double v33 = v18;
  double v34 = v19;
  double v35 = v20;
  double v36 = v21;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v14, v16);
  -[RPCCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v33);
  -[RPCCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16, v33, v34, v35, v36);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_22730;
  v32[3] = &unk_695C0;
  v32[5] = v22;
  v32[6] = v23;
  v32[7] = v24;
  v32[8] = 0x7FEFFFFFFFFFFFFFLL;
  v32[4] = self;
  double v25 = objc_retainBlock(v32);
  ((void (*)(void *, UILabel *))v25[2])(v25, self->_activityTitleLabel);
  ((double (*)(void *, UILabel *))v25[2])(v25, self->_detailLabel);
  if (a4 == 1) {
    -[RPCCUIActivityControlMenuView sizeThatFits:](self->_menuView, "sizeThatFits:", width, height);
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
  if ([(RPCCUIActivityControl *)self isPlaceholder] && (unint64_t)(self->_controlStyle - 1) <= 1)
  {
    BOOL v3 = [(RPCCUIActivityControl *)self activityDetailText];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = [v6 localizedStringForKey:@"ACTIVITY_TRY_IT" value:&stru_69FF8 table:0];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_setTextLayoutDisabled:(BOOL)a3
{
  if (self->_textLayoutDisabled != a3)
  {
    id v5 = RPCCUILogSelection;
    if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_textLayoutDisabled) {
        CFStringRef v6 = @"disabled";
      }
      else {
        CFStringRef v6 = @"enabled";
      }
      int v7 = 138543618;
      double v8 = self;
      __int16 v9 = 2114;
      CFStringRef v10 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: text layout %{public}@", (uint8_t *)&v7, 0x16u);
    }
    self->_textLayoutDisabled = a3;
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCUIActivityControl;
  BOOL v3 = [(RPCCUIActivityControl *)&v8 description];
  id v4 = [v3 mutableCopy];

  id v5 = [(RPCCUIActivityControl *)self activityDisplayName];
  CFStringRef v6 = +[NSString stringWithFormat:@"; activityDisplayName: %@", v5];
  objc_msgSend(v4, "insertString:atIndex:", v6, objc_msgSend(v4, "rangeOfString:options:", @">", 4));

  return (NSString *)v4;
}

- (void)updateActivityIconImageView
{
  BOOL v3 = [(RPCCActivityDescribing *)self->_activityDescription activitySymbolImageName];
  id v4 = +[UIImage _systemImageNamed:v3];

  [(UIImageView *)self->_activityIconImageView setImage:v4];
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

- (RPCCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (RPCCUIActivityControlMenuView)menuView
{
  return self->_menuView;
}

- (void)setMenuView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuView, 0);
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_glyphVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_textVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIconPackageView, 0);
  objc_storeStrong((id *)&self->_activityIconImageView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end