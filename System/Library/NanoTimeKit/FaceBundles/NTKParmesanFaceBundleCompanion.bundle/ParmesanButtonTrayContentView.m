@interface ParmesanButtonTrayContentView
- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView)initWithFrame:(CGRect)a3;
- (void)handlePrimaryButtonTapped:(id)a3;
- (void)handleSecondaryButtonTapped:(id)a3;
@end

@implementation ParmesanButtonTrayContentView

- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView *)sub_246BCFBA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_primaryAction);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_secondaryAction);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_buttonSpacing) = (Class)0x4020000000000000;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  id v7 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)handlePrimaryButtonTapped:(id)a3
{
}

- (void)handleSecondaryButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_secondaryButton));
  sub_246B8BDFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_primaryAction));
  sub_246B8BDFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_secondaryAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v7 = *(uint64_t *)((char *)&self->super._cachedTraitCollection
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v8 = *(uint64_t *)((char *)&self->super._swiftAnimationInfo
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);
  uint64_t v9 = *(uint64_t *)((char *)&self->super._traitChangeRegistry
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanButtonTrayContentView_configuration);

  sub_246B8BD80(v3, v4, v5, v6, v7, v8, v9);
}

@end