@interface ParmesanPreviewContentView
- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParmesanPreviewContentView

- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView *)sub_246BAEF34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  id v5 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanPreviewContentView();
  v2 = (char *)v5.receiver;
  [(ParmesanPreviewContentView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_timeView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_cropView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_timeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_cropView));
  sub_246B98680(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(uint64_t *)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration), *(void **)((char *)&self->super._layerRetained+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanPreviewContentView_configuration));
}

@end