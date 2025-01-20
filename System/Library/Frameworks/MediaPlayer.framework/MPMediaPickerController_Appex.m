@interface MPMediaPickerController_Appex
- (MPMediaPickerController)mediaPickerController;
- (UIViewController)remoteViewController;
- (id)serviceController;
- (void)dealloc;
- (void)requestRemoteViewController;
- (void)setMediaPickerController:(id)a3;
- (void)synchronizeSettings;
@end

@implementation MPMediaPickerController_Appex

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaPickerController);
  objc_storeStrong((id *)&self->_musicRemoteViewController, 0);

  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);
}

- (void)setMediaPickerController:(id)a3
{
}

- (MPMediaPickerController)mediaPickerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);

  return (MPMediaPickerController *)WeakRetained;
}

- (id)serviceController
{
  return [(_UIRemoteViewController *)self->_musicRemoteViewController serviceViewControllerProxy];
}

- (void)dealloc
{
  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    v4 = [(_UIResilientRemoteViewContainerViewController *)remoteViewContainerViewController remoteViewController];
    [v4 setMediaPickerController:0];

    [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController willMoveToParentViewController:0];
    if ([(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController isViewLoaded])
    {
      v5 = [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController view];
      [v5 removeFromSuperview];
    }
    [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController removeFromParentViewController];
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController_Appex;
  [(MPMediaPickerController_Appex *)&v6 dealloc];
}

- (void)synchronizeSettings
{
  id v5 = [(MPMediaPickerController_Appex *)self serviceController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  v4 = [WeakRetained configuration];
  [v5 updateWithConfiguration:v4];
}

- (UIViewController)remoteViewController
{
  return (UIViewController *)self->_remoteViewContainerViewController;
}

- (void)requestRemoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  [WeakRetained _beginDelayingPresentation:&__block_literal_global_15791 cancellationHandler:3.0];
  id v5 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.Music.MediaPicker" error:0];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15793;
  v22 = __Block_byref_object_dispose__15794;
  id v23 = 0;
  objc_super v6 = (void *)MEMORY[0x1E4FB2260];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke_191;
  v13 = &unk_1E57F0840;
  SEL v17 = a2;
  v14 = self;
  id v7 = WeakRetained;
  id v15 = v7;
  v16 = &v18;
  uint64_t v8 = [v6 instantiateWithExtension:v5 completion:&v10];
  v9 = (void *)v19[5];
  v19[5] = v8;

  objc_msgSend((id)v19[5], "delayDisplayOfRemoteController", v10, v11, v12, v13, v14);
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, (id)v19[5]);
  _Block_object_dispose(&v18, 8);
}

@end