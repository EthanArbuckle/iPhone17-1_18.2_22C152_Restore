@interface CCUIControlTemplateView.ButtonGlyphWrapperView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView)initWithCoder:(id)a3;
- (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CCUIControlTemplateView.ButtonGlyphWrapperView

- (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView)initWithCoder:(id)a3
{
  result = (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView *)sub_1D8382288();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CCUIControlTemplateView.ButtonGlyphWrapperView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView), sel_intrinsicContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView));
}

@end