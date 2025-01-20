@interface ParmesanFacePreviewCell
- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
@end

@implementation ParmesanFacePreviewCell

- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell *)sub_246BAF804(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_selectionAccessoryPadding) = (Class)0x4018000000000000;
  uint64_t v5 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_selectionAccessory;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithImage_, 0);
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_itemIdentifier);
  void *v8 = 0;
  v8[1] = 0;

  result = (_TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ParmesanFacePreviewCell();
  v2 = (char *)v13.receiver;
  [(ParmesanFacePreviewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_previewContentView];
  id v4 = objc_msgSend(v2, sel_contentView, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_246C2C168();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246C2C148();
  double v8 = self;
  sub_246BAFB60();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_previewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanFacePreviewCell_selectionAccessory));

  swift_bridgeObjectRelease();
}

@end