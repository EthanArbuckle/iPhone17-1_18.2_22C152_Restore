@interface ParmesanFacePreviewTitleSupplementaryView
- (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanFacePreviewTitleSupplementaryView

- (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView *)sub_246C0CF84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView_subtitleLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);

  result = (_TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion41ParmesanFacePreviewTitleSupplementaryView_subtitleLabel);
}

@end