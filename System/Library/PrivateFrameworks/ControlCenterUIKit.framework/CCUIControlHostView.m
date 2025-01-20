@interface CCUIControlHostView
- (BOOL)isResizing;
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (BOOL)showsMenuAsPrimaryAction;
- (CCUIControlHostView)initWithCoder:(id)a3;
- (CCUIControlHostView)initWithFrame:(CGRect)a3;
- (CCUIControlHostView)initWithFrame:(CGRect)a3 instance:(id)a4;
- (CCUIControlHostViewDelegate)delegate;
- (CCUIModuleContentMetrics)contentMetrics;
- (CHUISControlInstance)controlInstance;
- (NSString)cameraCapturePrewarmReason;
- (NSString)menuDisplayName;
- (UIMenu)contextMenu;
- (double)continuousCornerRadius;
- (id)contextMenuItems;
- (int64_t)gridSizeClass;
- (void)controlInstanceViewModelDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setCameraCapturePrewarmReason:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setResizing:(BOOL)a3;
@end

@implementation CCUIControlHostView

- (CCUIControlHostView)initWithFrame:(CGRect)a3 instance:(id)a4
{
  return (CCUIControlHostView *)sub_1D837F038(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUIControlHostView)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CHUISControlInstance)controlInstance
{
  return (CHUISControlInstance *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR___CCUIControlHostView_controlInstance));
}

- (CCUIControlHostViewDelegate)delegate
{
  v2 = (void *)MEMORY[0x1D9486180]((char *)self + OBJC_IVAR___CCUIControlHostView_delegate, a2);
  return (CCUIControlHostViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)gridSizeClass
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_gridSizeClass);
}

- (void)setGridSizeClass:(int64_t)a3
{
}

- (double)continuousCornerRadius
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_continuousCornerRadius);
  return result;
}

- (void)setContinuousCornerRadius:(double)a3
{
}

- (CCUIModuleContentMetrics)contentMetrics
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_contentMetrics);
  return (CCUIModuleContentMetrics *)v2;
}

- (void)setContentMetrics:(id)a3
{
}

- (BOOL)isResizing
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_isResizing);
}

- (void)setResizing:(BOOL)a3
{
}

- (NSString)cameraCapturePrewarmReason
{
  if (*(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason))
  {
    swift_bridgeObjectRetain();
    id v2 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setCameraCapturePrewarmReason:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D83820F8();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason);
  uint64_t *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIControlHostView;
  id v2 = self;
  [(CCUIControlHostView *)&v4 layoutSubviews];
  id v3 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView);
  [(CCUIControlHostView *)v2 bounds];
  objc_msgSend(v3, sel_setFrame_);
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = [(CCUIControlHostView *)v5 delegate];
  if (!v6
    || (unsigned int v7 = [(CCUIControlHostViewDelegate *)v6 controlHostViewShouldPerformPrimaryAction:v5], swift_unknownObjectRelease(), v7))
  {
    sub_1D838008C();
  }

  return 0;
}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0();
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (NSString)menuDisplayName
{
  id v2 = (void *)sub_1D83820E8();
  return (NSString *)v2;
}

- (id)contextMenuItems
{
  id v2 = self;
  unint64_t v3 = (unint64_t)CCUIControlHostView.contextMenuItems()();

  if (v3)
  {
    sub_1D837C460(0, &qword_1EA88BE90);
    id v4 = (void *)sub_1D8382138();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (UIMenu)contextMenu
{
  id v2 = self;
  id v3 = CCUIControlHostView.contextMenu.getter();

  return (UIMenu *)v3;
}

- (CCUIControlHostView)initWithFrame:(CGRect)a3
{
  double result = (CCUIControlHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D837C410((uint64_t)self + OBJC_IVAR___CCUIControlHostView_delegate);
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_applicationContext);
}

@end