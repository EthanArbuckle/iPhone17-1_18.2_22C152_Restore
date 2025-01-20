@interface CCUIControlTemplateView
- (BOOL)isExpanded;
- (BOOL)isRedacted;
- (BOOL)isResizing;
- (BOOL)showsMenuAffordance;
- (BOOL)supportsAccessibilityContentSizeCategories;
- (CCUIControlTemplateView)initWithCoder:(id)a3;
- (CCUIControlTemplateView)initWithFrame:(CGRect)a3;
- (CCUIControlTemplateViewContextMenuDelegate)contextMenuDelegate;
- (CCUIControlTemplateViewDelegate)delegate;
- (CCUIControlTemplateViewMenuModuleDelegate)menuModuleDelegate;
- (CCUIModuleContentMetrics)contentMetrics;
- (CGRect)glyphContentFrame;
- (NSArray)requiredVisualStyleCategories;
- (NSString)subtitle;
- (NSString)title;
- (UIView)backgroundView;
- (UIView)customGlyphView;
- (double)continuousCornerRadius;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)gridSizeClass;
- (void)contentStateDidChange;
- (void)didMoveToWindow;
- (void)didUpdatePreferredContentSizeCategory;
- (void)dismissVisibleMenu;
- (void)layoutSubviews;
- (void)primaryActionTriggered;
- (void)selectionDidChange;
- (void)setBackgroundView:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContextMenuDelegate:(id)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setCustomGlyphView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setMenuModuleDelegate:(id)a3;
- (void)setRedacted:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setShowsMenuAffordance:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateProperties:(id)a3 animated:(BOOL)a4;
- (void)updateVisibleMenuIfNeeded;
@end

@implementation CCUIControlTemplateView

- (CCUIControlTemplateView)initWithFrame:(CGRect)a3
{
  return (CCUIControlTemplateView *)CCUIControlTemplateView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUIControlTemplateView)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CCUIControlTemplateViewDelegate)delegate
{
  v2 = (void *)MEMORY[0x1D9486180]((char *)self + OBJC_IVAR___CCUIControlTemplateView_delegate, a2);
  return (CCUIControlTemplateViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (CCUIControlTemplateViewContextMenuDelegate)contextMenuDelegate
{
  v2 = (void *)MEMORY[0x1D9486180]((char *)self + OBJC_IVAR___CCUIControlTemplateView_contextMenuDelegate, a2);
  return (CCUIControlTemplateViewContextMenuDelegate *)v2;
}

- (void)setContextMenuDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1D837A5B8();

  swift_unknownObjectRelease();
}

- (CCUIControlTemplateViewMenuModuleDelegate)menuModuleDelegate
{
  v2 = (void *)MEMORY[0x1D9486180]((char *)self + OBJC_IVAR___CCUIControlTemplateView_menuModuleDelegate, a2);
  return (CCUIControlTemplateViewMenuModuleDelegate *)v2;
}

- (void)setMenuModuleDelegate:(id)a3
{
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR___CCUIControlTemplateView_backgroundView));
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)customGlyphView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR___CCUIControlTemplateView_customGlyphView));
}

- (void)setCustomGlyphView:(id)a3
{
}

- (BOOL)showsMenuAffordance
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance);
}

- (void)setShowsMenuAffordance:(BOOL)a3
{
  id v3 = (void *)*((unsigned __int8 *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance);
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance) = a3;
  v4 = self;
  sub_1D83714A8(v3);
}

- (NSString)title
{
  return (NSString *)sub_1D8379280((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIControlTemplateView_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1D8379280((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIControlTemplateView_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isRedacted
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted);
}

- (void)setRedacted:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted);
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted) = a3;
  if (v3 != a3)
  {
    v6 = self;
    unsigned int v4 = [(CCUIControlTemplateView *)v6 isRedacted];
    double v5 = 0.35;
    if (!v4) {
      double v5 = 1.0;
    }
    [(CCUIButtonModuleView *)v6 setGlyphAlpha:v5];
  }
}

- (BOOL)isResizing
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = self;
  sub_1D83725B0((id)v3);
}

- (BOOL)isExpanded
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded);
}

- (void)setExpanded:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded);
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded) = a3;
  if (v3 != a3)
  {
    unsigned int v4 = self;
    sub_1D8371BC0(0);
    [(CCUIControlTemplateView *)v4 setNeedsLayout];
  }
}

- (int64_t)gridSizeClass
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CCUIControlTemplateView_gridSizeClass);
}

- (void)setGridSizeClass:(int64_t)a3
{
  unsigned int v4 = self;
  sub_1D8372954((id)a3);
}

- (double)continuousCornerRadius
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius);
}

- (void)setContinuousCornerRadius:(double)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius);
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius) = a3;
  if (v3 != a3)
  {
    unsigned int v4 = self;
    sub_1D8372AAC();
  }
}

- (BOOL)supportsAccessibilityContentSizeCategories
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories);
}

- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories) = a3;
  if (v3 != a3)
  {
    unsigned int v4 = self;
    sub_1D8371BC0(0);
    sub_1D8372C34();
    [(CCUIControlTemplateView *)v4 setNeedsLayout];
  }
}

- (void)updateProperties:(id)a3 animated:(BOOL)a4
{
  v6 = _Block_copy(a3);
  _Block_copy(v6);
  v7 = self;
  sub_1D837AF3C(a4, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)updateVisibleMenuIfNeeded
{
  v2 = self;
  sub_1D8374058();
}

- (void)dismissVisibleMenu
{
}

- (CCUIModuleContentMetrics)contentMetrics
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIControlTemplateView;
  v2 = [(CCUIButtonModuleView *)&v4 contentMetrics];
  return v2;
}

- (void)setContentMetrics:(id)a3
{
  id v5 = a3;
  v6 = self;
  CCUIControlTemplateView.contentMetrics.setter(a3);
}

- (CGRect)glyphContentFrame
{
  v2 = self;
  __C::CGRect v11 = CCUIControlTemplateView.glyphContentFrame()();
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;

  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)selectionDidChange
{
  v6 = self;
  id v2 = [(CCUIControlTemplateView *)v6 visualStylingProviderForCategory:1];
  if (v2)
  {
    int v3 = v2;
    objc_super v4 = (CCUIControlTemplateView *)v2;
    sub_1D8374FFC((uint64_t)v4, 1, v3);

    id v5 = v4;
  }
  else
  {
    id v5 = v6;
  }
}

- (void)contentStateDidChange
{
  id v2 = self;
  _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
}

- (void)layoutSubviews
{
  id v2 = self;
  CCUIControlTemplateView.layoutSubviews()();
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIControlTemplateView;
  id v2 = self;
  [(CCUIButtonModuleView *)&v6 didMoveToWindow];
  if ([(CCUIControlTemplateView *)v2 _isInAWindow])
  {
    v5.receiver = v2;
    v5.super_class = (Class)CCUIControlTemplateView;
    int v3 = (CCUIControlTemplateView *)[(CCUIControlTemplateView *)&v5 visualStylingProviderForCategory:1];
    if (v3)
    {
      objc_super v4 = v3;
      [(CCUIControlTemplateView *)v2 setVisualStylingProvider:v3 forCategory:1];

      id v2 = v4;
    }
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_super v6 = self;
  id v7 = _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  double v9 = self;
  id v10 = _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0();

  swift_unknownObjectRelease();
  return v10;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  objc_super v4 = self;
  id v5 = CCUIControlTemplateView.visualStylingProvider(for:)(a3);

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  id v2 = self;
  sub_1D8382258();
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 1);
  sub_1D8382238();
  sub_1D8382268();
  sub_1D8382278();
  sub_1D8382248();

  sub_1D837C460(0, &qword_1EA88BCC8);
  int v3 = (void *)sub_1D8382138();
  swift_release();
  return (NSArray *)v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v7 = a3;
  id v8 = self;
  sub_1D8375DB8(a3, a4);
}

- (void)primaryActionTriggered
{
  objc_super v4 = self;
  id v2 = [(CCUIControlTemplateView *)v4 delegate];
  if (!v2
    || (unsigned int v3 = [(CCUIControlTemplateViewDelegate *)v2 performPrimaryActionForControlTemplateView:v4], swift_unknownObjectRelease(), v3))
  {
    sub_1D8377A24();
  }
}

- (void)didUpdatePreferredContentSizeCategory
{
  id v2 = self;
  sub_1D8371BC0(0);
  sub_1D83720A4((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D8377C04, sub_1D8377B6C);
  sub_1D83720A4((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D8377DCC, sub_1D8377D44);
  sub_1D8372C34();
}

- (void).cxx_destruct
{
  sub_1D837C410((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_delegate);
  sub_1D837C410((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_contextMenuDelegate);
  sub_1D837C410((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_menuModuleDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_customGlyphView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction));
  sub_1D837BDE4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels));
  unsigned int v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  objc_super v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  sub_1D837BDE4(v3, v4);
}

@end