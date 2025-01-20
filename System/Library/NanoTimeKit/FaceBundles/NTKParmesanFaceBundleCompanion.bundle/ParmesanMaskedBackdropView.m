@interface ParmesanMaskedBackdropView
- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView)initWithFrame:(CGRect)a3;
- (void)addMaskingSubview:(id)a3;
- (void)layoutSubviews;
@end

@implementation ParmesanMaskedBackdropView

- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView *)sub_246C1DD78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246C1E374();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ParmesanMaskedBackdropView();
  v2 = (char *)v4.receiver;
  [(ParmesanMaskedBackdropView *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void)addMaskingSubview:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_removeFromSuperview);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.isa+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView), sel_addSubview_, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end