@interface AVTGrayscaleStickerController
- (AVTGrayscaleStickerController)init;
- (AVTGrayscaleStickerControllerDelegate)delegate;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTStickerSelectionDelegate)selectionDelegate;
- (AVTStickerViewController)stickerViewController;
- (AVTStickerViewControllerImageDelegate)imageDelegate;
- (AVTUICapabilities)uiCapabilities;
- (AVTUIEnvironment)environment;
- (AVTViewSessionProvider)viewSessionProvider;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)allowsPoseCapture;
- (BOOL)shouldHideUserInfoView;
- (BOOL)shouldShowSelectionLayerForStickers;
- (NSArray)allowedStickers;
- (UIColor)backgroundColor;
- (id)stickerSheetControllerForSelectedAvatar:(id)a3 stickerSheetModel:(id)a4 taskScheduler:(id)a5;
- (id)stickerViewControllerForFetchRequest:(id)a3 allowedStickers:(id)a4 stickerPacks:(id)a5 allowPoseCapture:(BOOL)a6 showUserInfoView:(BOOL)a7 allowEditing:(BOOL)a8 backgroundColor:(id)a9 grayscaleConvertionDelegate:(id)a10 presenterDelegate:(id)a11 selectionDelegate:(id)a12;
- (void)poseCaptureViewController:(id)a3 didCapturePoseWithConfiguration:(id)a4 avatar:(id)a5;
- (void)poseCaptureViewController:(id)a3 willCaptureAvatarImage:(id)a4 completion:(id)a5;
- (void)poseCaptureViewControllerDidCancel:(id)a3;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3;
- (void)setAllowedStickers:(id)a3;
- (void)setAllowsPoseCapture:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageDelegate:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setShowsSelectionLayerForStickers:(BOOL)a3;
- (void)setStickerViewController:(id)a3;
- (void)setUiCapabilities:(id)a3;
- (void)setViewSessionProvider:(id)a3;
- (void)stickerSheetController:(id)a3 didSelectCameraViewForRecord:(id)a4;
- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTGrayscaleStickerController

- (AVTGrayscaleStickerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVTGrayscaleStickerController;
  v2 = [(AVTGrayscaleStickerController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    v5 = objc_alloc_init(AVTUICapabilities);
    uiCapabilities = v2->_uiCapabilities;
    v2->_uiCapabilities = v5;
  }
  return v2;
}

- (id)stickerViewControllerForFetchRequest:(id)a3 allowedStickers:(id)a4 stickerPacks:(id)a5 allowPoseCapture:(BOOL)a6 showUserInfoView:(BOOL)a7 allowEditing:(BOOL)a8 backgroundColor:(id)a9 grayscaleConvertionDelegate:(id)a10 presenterDelegate:(id)a11 selectionDelegate:(id)a12
{
  BOOL v34 = a8;
  BOOL v38 = a6;
  BOOL v39 = a7;
  id v16 = a12;
  id v35 = a11;
  id v36 = a10;
  id v37 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_alloc_init(AVTAvatarStore);
  v21 = [AVTViewSessionProvider alloc];
  v22 = [(AVTGrayscaleStickerController *)self environment];
  +[AVTViewSessionProvider backingSizeForEnvironment:v22];
  double v24 = v23;
  double v26 = v25;
  v27 = +[AVTViewSessionProvider creatorForAVTView];
  v28 = [(AVTGrayscaleStickerController *)self environment];
  v29 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v21, "initWithAVTViewBackingSize:viewCreator:environment:", v27, v28, v24, v26);

  [(AVTGrayscaleStickerController *)self setViewSessionProvider:v29];
  LOBYTE(v33) = 0;
  v30 = +[AVTStickerViewController stickerViewControllerForStore:v20 fetchRequest:v19 stickerPacks:v17 stickerConfigurationNames:v18 avtViewSessionProvider:v29 allowEditing:v34 allowPeel:v33];

  [(AVTGrayscaleStickerController *)self setAllowedStickers:v18];
  [(AVTGrayscaleStickerController *)self setPresenterDelegate:v35];
  [(AVTGrayscaleStickerController *)self setImageDelegate:v36];
  [(AVTGrayscaleStickerController *)self setSelectionDelegate:v16];
  [(AVTGrayscaleStickerController *)self setAllowsPoseCapture:v38];
  [(AVTGrayscaleStickerController *)self setShouldHideUserInfoView:!v39];
  [(AVTGrayscaleStickerController *)self setBackgroundColor:v37];
  [v30 setStickerSelectionDelegate:v16];

  [v30 setStickerSheetControllerProvider:self];
  [v30 setPresenterDelegate:v35];

  [v30 setImageDelegate:v36];
  [v30 setShouldHideUserInfoView:!v39];
  [v30 setEdgesForExtendedLayout:0];
  v31 = [v30 view];
  [v31 setBackgroundColor:v37];

  [(AVTGrayscaleStickerController *)self setStickerViewController:v30];
  return v30;
}

- (void)stickerSheetController:(id)a3 didSelectCameraViewForRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AVTGrayscaleStickerController *)self presenterDelegate];

  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = [(AVTGrayscaleStickerController *)self uiCapabilities];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke;
    v10[3] = &unk_263FF0D18;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v9 requestAccessForCameraWithCompletionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke_2;
    v6[3] = &unk_263FF0780;
    v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (!v2
    || ([*(id *)(a1 + 32) delegate],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 shouldPresentPoseCaptureControllerForRecord:*(void *)(a1 + 40)],
        v3,
        v4))
  {
    v5 = [AVTPoseCaptureViewController alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) viewSessionProvider];
    id v11 = [(AVTPoseCaptureViewController *)v5 initWithSelectedRecord:v6 avtViewSessionProvider:v7];

    [(AVTPoseCaptureViewController *)v11 setDelegate:*(void *)(a1 + 32)];
    -[AVTPoseCaptureViewController setShouldHideUserInfoView:](v11, "setShouldHideUserInfoView:", [*(id *)(a1 + 32) shouldHideUserInfoView]);
    objc_super v8 = [*(id *)(a1 + 32) backgroundColor];
    [(AVTPoseCaptureViewController *)v11 setBackgroundColor:v8];

    uint64_t v9 = [*(id *)(a1 + 32) accessibilityIgnoresInvertColors];
    v10 = [(AVTPoseCaptureViewController *)v11 view];
    [v10 setAccessibilityIgnoresInvertColors:v9];

    [*(id *)(a1 + 32) wrapAndPresentViewController:v11 animated:1];
  }
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(AVTGrayscaleStickerController *)self presenterDelegate];
  [v5 presentAvatarUIController:v6 animated:1];
}

- (id)stickerSheetControllerForSelectedAvatar:(id)a3 stickerSheetModel:(id)a4 taskScheduler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [[AVTSelectableStickerSheetController alloc] initWithStickerSheetModel:v8 taskScheduler:v7 allowsPoseCapture:[(AVTGrayscaleStickerController *)self allowsPoseCapture]];

  v10 = [(AVTGrayscaleStickerController *)self presenterDelegate];
  [(AVTSelectableStickerSheetController *)v9 setPresenterDelegate:v10];

  id v11 = [(AVTGrayscaleStickerController *)self imageDelegate];
  [(AVTSelectableStickerSheetController *)v9 setImageDelegate:v11];

  [(AVTSelectableStickerSheetController *)v9 setShowCellSelectionLayer:[(AVTGrayscaleStickerController *)self shouldShowSelectionLayerForStickers]];
  [(AVTSelectableStickerSheetController *)v9 setStickerSheetDelegate:self];
  return v9;
}

- (void)poseCaptureViewController:(id)a3 didCapturePoseWithConfiguration:(id)a4 avatar:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(AVTGrayscaleStickerController *)self stickerViewController];
  [v9 clearStickerSelection];

  v10 = [(AVTGrayscaleStickerController *)self selectionDelegate];
  [v10 didSelectStickerWithConfiguration:v8 avatar:v7];

  id v11 = [(AVTGrayscaleStickerController *)self presenterDelegate];
  [v11 dismissAvatarUIControllerAnimated:1];
}

- (void)poseCaptureViewControllerDidCancel:(id)a3
{
  id v3 = [(AVTGrayscaleStickerController *)self presenterDelegate];
  [v3 dismissAvatarUIControllerAnimated:1];
}

- (void)poseCaptureViewController:(id)a3 willCaptureAvatarImage:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v7 = (void (**)(id, id))a5;
  id v8 = [(AVTGrayscaleStickerController *)self imageDelegate];

  if (v8)
  {
    uint64_t v9 = [(AVTGrayscaleStickerController *)self imageDelegate];
    [v9 viewWillUpdateWithImage:v10 completion:v7];
  }
  else
  {
    v7[2](v7, v10);
  }
}

- (BOOL)shouldShowSelectionLayerForStickers
{
  return self->_showsSelectionLayerForStickers;
}

- (void)setShowsSelectionLayerForStickers:(BOOL)a3
{
  self->_showsSelectionLayerForStickers = a3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  self->_accessibilityIgnoresInvertColors = a3;
}

- (AVTGrayscaleStickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTGrayscaleStickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelegate);
  return (AVTStickerViewControllerImageDelegate *)WeakRetained;
}

- (void)setImageDelegate:(id)a3
{
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (AVTStickerSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  return (AVTStickerSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (AVTStickerViewController)stickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerViewController);
  return (AVTStickerViewController *)WeakRetained;
}

- (void)setStickerViewController:(id)a3
{
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (void)setViewSessionProvider:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUICapabilities)uiCapabilities
{
  return self->_uiCapabilities;
}

- (void)setUiCapabilities:(id)a3
{
}

- (BOOL)allowsPoseCapture
{
  return self->_allowsPoseCapture;
}

- (void)setAllowsPoseCapture:(BOOL)a3
{
  self->_allowsPoseCapture = a3;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (NSArray)allowedStickers
{
  return self->_allowedStickers;
}

- (void)setAllowedStickers:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_allowedStickers, 0);
  objc_storeStrong((id *)&self->_uiCapabilities, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_destroyWeak((id *)&self->_stickerViewController);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end