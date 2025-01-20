@interface NTKCParmesanFacePreviewNavigationController
- (NTKCParmesanFacePreviewNavigationController)initWithCoder:(id)a3;
- (NTKCParmesanFacePreviewNavigationController)initWithFace:(id)a3 faceView:(id)a4 imageEditor:(id)a5 inGallery:(BOOL)a6;
- (NTKCParmesanFacePreviewNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (NTKCParmesanFacePreviewNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (NTKCParmesanFacePreviewNavigationController)initWithRootViewController:(id)a3;
- (NTKParmesanFacePreviewDelegate)previewDelegate;
- (void)setPreviewDelegate:(id)a3;
@end

@implementation NTKCParmesanFacePreviewNavigationController

- (NTKParmesanFacePreviewDelegate)previewDelegate
{
  v2 = (void *)MEMORY[0x24C545A70](*(char **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___NTKCParmesanFacePreviewNavigationController_previewViewController)+ qword_2691D6B60, a2);

  return (NTKParmesanFacePreviewDelegate *)v2;
}

- (void)setPreviewDelegate:(id)a3
{
}

- (NTKCParmesanFacePreviewNavigationController)initWithFace:(id)a3 faceView:(id)a4 imageEditor:(id)a5 inGallery:(BOOL)a6
{
  return (NTKCParmesanFacePreviewNavigationController *)sub_246B990E4(a3, a4, a5, a6);
}

- (NTKCParmesanFacePreviewNavigationController)initWithCoder:(id)a3
{
  result = (NTKCParmesanFacePreviewNavigationController *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (NTKCParmesanFacePreviewNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (NTKCParmesanFacePreviewNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NTKCParmesanFacePreviewNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (NTKCParmesanFacePreviewNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NTKCParmesanFacePreviewNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (NTKCParmesanFacePreviewNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___NTKCParmesanFacePreviewNavigationController_previewViewController));
}

@end