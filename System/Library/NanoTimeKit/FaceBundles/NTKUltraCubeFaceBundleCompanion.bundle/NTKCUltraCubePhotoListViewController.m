@interface NTKCUltraCubePhotoListViewController
- (BOOL)inGallery;
- (BOOL)isModalInPresentation;
- (NTKCUltraCubePhotoListViewController)initWithUltraCubePhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6;
- (NTKCompanionUltraCubePhotosEditor)editor;
- (NTKUltraCubeFace)face;
- (void)customUltraCubeControllerDidFinish:(id)a3;
- (void)setEditor:(id)a3;
- (void)setFace:(id)a3;
@end

@implementation NTKCUltraCubePhotoListViewController

- (NTKCUltraCubePhotoListViewController)initWithUltraCubePhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_NTKCUltraCubePhotoListViewController alloc] initWithUltraCubePhotosEditor:v12 forFace:v11 inGallery:v6 faceView:v10];

  v17.receiver = self;
  v17.super_class = (Class)NTKCUltraCubePhotoListViewController;
  v14 = [(NTKCUltraCubePhotoListViewController *)&v17 initWithRootViewController:v13];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_implementationVC, v13);
    [(_NTKCUltraCubePhotoListViewController *)v15->_implementationVC setDelegate:v15];
  }

  return v15;
}

- (NTKCompanionUltraCubePhotosEditor)editor
{
  return [(_NTKCUltraCubePhotoListViewController *)self->_implementationVC editor];
}

- (BOOL)inGallery
{
  return [(_NTKCUltraCubePhotoListViewController *)self->_implementationVC inGallery];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)customUltraCubeControllerDidFinish:(id)a3
{
  id v4 = [(NTKCUltraCubePhotoListViewController *)self delegate];
  [v4 customUltraCubeControllerDidFinish:self];
}

- (void)setEditor:(id)a3
{
}

- (NTKUltraCubeFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);

  objc_storeStrong((id *)&self->_implementationVC, 0);
}

@end