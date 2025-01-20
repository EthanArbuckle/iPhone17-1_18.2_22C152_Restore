@interface NTKCUltraCubePreviewViewController
- (NTKCUltraCubePreviewViewController)initWithPreviewProvider:(id)a3;
- (NTKUltraCubeCropPreview)currentPreview;
- (NTKUltraCubePreviewProvider)previewProvider;
- (void)_ultracubePreviewViewControllerDidDismiss:(id)a3;
- (void)_ultracubePreviewViewControllerWantsToCancel:(id)a3;
- (void)_ultracubePreviewViewControllerWantsToDelete:(id)a3;
- (void)_ultracubePreviewViewControllerWantsToSave:(id)a3;
- (void)setCurrentPreview:(id)a3;
- (void)viewDidLoad;
@end

@implementation NTKCUltraCubePreviewViewController

- (NTKCUltraCubePreviewViewController)initWithPreviewProvider:(id)a3
{
  id v4 = a3;
  v5 = [[_NTKCUltraCubePreviewViewController alloc] initWithPreviewProvider:v4];

  v14.receiver = self;
  v14.super_class = (Class)NTKCUltraCubePreviewViewController;
  v6 = [(NTKCUltraCubePreviewViewController *)&v14 initWithRootViewController:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_implementationVC, v5);
    [(_NTKCUltraCubePreviewViewController *)v7->_implementationVC setDelegate:v7];
    id v8 = objc_alloc_init((Class)UINavigationBarAppearance);
    [v8 configureWithOpaqueBackground];
    v9 = [(NTKCUltraCubePreviewViewController *)v7 navigationBar];
    [v9 setStandardAppearance:v8];

    v10 = [(NTKCUltraCubePreviewViewController *)v7 navigationBar];
    [v10 setScrollEdgeAppearance:v8];

    v11 = [(NTKCUltraCubePreviewViewController *)v7 navigationItem];
    [v11 setLargeTitleDisplayMode:2];

    v12 = [(NTKCUltraCubePreviewViewController *)v7 navigationBar];
    [v12 setPrefersLargeTitles:0];
  }
  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCUltraCubePreviewViewController;
  [(NTKCUltraCubePreviewViewController *)&v3 viewDidLoad];
  [(NTKCUltraCubePreviewViewController *)self setToolbarHidden:0];
}

- (NTKUltraCubeCropPreview)currentPreview
{
  return [(_NTKCUltraCubePreviewViewController *)self->_implementationVC currentPreview];
}

- (void)setCurrentPreview:(id)a3
{
}

- (NTKUltraCubePreviewProvider)previewProvider
{
  return [(_NTKCUltraCubePreviewViewController *)self->_implementationVC previewProvider];
}

- (void)_ultracubePreviewViewControllerWantsToCancel:(id)a3
{
  id v4 = [(NTKCUltraCubePreviewViewController *)self delegate];
  [v4 ultracubePreviewViewControllerWantsToCancel:self];
}

- (void)_ultracubePreviewViewControllerWantsToDelete:(id)a3
{
  id v4 = [(NTKCUltraCubePreviewViewController *)self delegate];
  [v4 ultracubePreviewViewControllerWantsToDelete:self];
}

- (void)_ultracubePreviewViewControllerWantsToSave:(id)a3
{
  id v4 = [(NTKCUltraCubePreviewViewController *)self delegate];
  [v4 ultracubePreviewViewControllerWantsToSave:self];
}

- (void)_ultracubePreviewViewControllerDidDismiss:(id)a3
{
  id v4 = [(NTKCUltraCubePreviewViewController *)self delegate];
  [v4 ultracubePreviewViewControllerDidDismiss:self];
}

- (void).cxx_destruct
{
}

@end