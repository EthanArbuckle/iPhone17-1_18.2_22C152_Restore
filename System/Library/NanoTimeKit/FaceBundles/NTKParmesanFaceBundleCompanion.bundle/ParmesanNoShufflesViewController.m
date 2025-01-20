@interface ParmesanNoShufflesViewController
- (_TtC30NTKParmesanFaceBundleCompanion32ParmesanNoShufflesViewController)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion32ParmesanNoShufflesViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5;
- (void)loadView;
@end

@implementation ParmesanNoShufflesViewController

- (void)loadView
{
  v2 = self;
  sub_246BBD07C();
}

- (_TtC30NTKParmesanFaceBundleCompanion32ParmesanNoShufflesViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_editor) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face) = (Class)a4;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_inGallery) = a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionBaseViewController();
  id v9 = a3;
  id v10 = a4;
  return [(NTKParmesanShuffleSelectionBaseViewController *)&v12 initWithNibName:0 bundle:0];
}

- (_TtC30NTKParmesanFaceBundleCompanion32ParmesanNoShufflesViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanNoShufflesViewController();
  return [(NTKParmesanShuffleSelectionBaseViewController *)&v5 initWithCoder:a3];
}

@end