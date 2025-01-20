@interface ParmesanGalleryMaskableContentView
- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParmesanGalleryMaskableContentView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanGalleryMaskableContentView();
  v2 = (char *)v5.receiver;
  [(ParmesanGalleryMaskableContentView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_maskingLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_monochromeColorMatrix;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)(id)NTKDefaultMonochromeColorMatrix();
  *(Class *)((char *)&v9->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_maskingLayer) = 0;
  *((unsigned char *)&v9->super.super.super.isa
  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_useMaskingLayer) = 0;

  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for ParmesanGalleryMaskableContentView();
  return -[ParmesanGalleryMaskableContentView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView)initWithCoder:(id)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView *)sub_246BB8028(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_monochromeColorMatrix));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanGalleryMaskableContentView_maskingLayer);
}

@end