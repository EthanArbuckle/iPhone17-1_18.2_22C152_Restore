@interface NTKParmesanShuffleSelectionBaseViewController
- (BOOL)inGallery;
- (NTKCParmesanAlbumEditor)editor;
- (NTKFace)face;
- (NTKParmesanShuffleSelectionBaseViewController)initWithCoder:(id)a3;
- (NTKParmesanShuffleSelectionBaseViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5;
- (NTKParmesanShuffleSelectionBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)albumChooserDidFinish:(id)a3;
- (void)setFace:(id)a3;
- (void)setInGallery:(BOOL)a3;
@end

@implementation NTKParmesanShuffleSelectionBaseViewController

- (NTKCParmesanAlbumEditor)editor
{
  return (NTKCParmesanAlbumEditor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_editor));
}

- (NTKFace)face
{
  return (NTKFace *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face));
}

- (void)setFace:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face) = (Class)a3;
  id v3 = a3;
}

- (BOOL)inGallery
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_inGallery);
}

- (void)setInGallery:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_inGallery) = a3;
}

- (NTKParmesanShuffleSelectionBaseViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_editor) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face) = (Class)a4;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_inGallery) = a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionBaseViewController();
  id v9 = a3;
  id v10 = a4;
  return [(NTKParmesanShuffleSelectionBaseViewController *)&v12 initWithNibName:0 bundle:0];
}

- (NTKParmesanShuffleSelectionBaseViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (NTKParmesanShuffleSelectionBaseViewController *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)albumChooserDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_246BAC8F8(v4);
}

- (NTKParmesanShuffleSelectionBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (NTKParmesanShuffleSelectionBaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_editor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face));
  id v3 = (char *)self + OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_delegate;

  sub_246B98F78((uint64_t)v3);
}

@end