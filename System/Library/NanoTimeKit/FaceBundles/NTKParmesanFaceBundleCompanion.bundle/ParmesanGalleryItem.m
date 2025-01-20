@interface ParmesanGalleryItem
- (NTKParmesanGalleryComposition)composition;
- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)init;
- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)initWithComposition:(id)a3 views:(id)a4;
- (_TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews)views;
- (void)applyContentEffect:(id)a3 with:(unint64_t)a4;
- (void)dealloc;
- (void)setComposition:(id)a3;
- (void)setViews:(id)a3;
@end

@implementation ParmesanGalleryItem

- (NTKParmesanGalleryComposition)composition
{
  return (NTKParmesanGalleryComposition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition));
}

- (void)setComposition:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition) = (Class)a3;
  id v3 = a3;
}

- (_TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews)views
{
  return (_TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views);
}

- (void)setViews:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views) = (Class)a3;
  id v3 = a3;
}

- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)initWithComposition:(id)a3 views:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem *)sub_246BBE868(a3, a4);

  return v8;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition) = 0;
  id v3 = self;

  id v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views);
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views) = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for ParmesanGalleryItem();
  [(ParmesanGalleryItem *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views);
}

- (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applyContentEffect:(id)a3 with:(unint64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_246BBDD60((uint64_t)a3, a4);
}

@end