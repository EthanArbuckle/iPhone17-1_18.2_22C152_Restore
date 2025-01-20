@interface ParmesanGalleryTransitionContainerView
- (_TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanGalleryTransitionContainerView

- (_TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ParmesanGalleryTransitionContainerView();
  return -[ParmesanColorAdjustView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView) = 0;
  id v4 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_currentView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView);
}

@end