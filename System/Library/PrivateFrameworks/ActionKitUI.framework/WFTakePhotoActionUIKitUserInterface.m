@interface WFTakePhotoActionUIKitUserInterface
+ (int64_t)cameraDeviceFromString:(id)a3;
- (BOOL)showPreview;
- (NSMutableArray)outputImages;
- (WFContentCollection)outputCollection;
- (WFImagePickerController)pickerController;
- (WFTakePhotoActionUIKitUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (WFTakePhotoImmediateModeManager)immediateModeManager;
- (id)completionHandler;
- (id)setupControllerWithOverlay:(id)a3;
- (int64_t)device;
- (unint64_t)duration;
- (unint64_t)remainingPhotos;
- (void)addImageDataToOutput:(id)a3;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)manager:(id)a3 didFinishWithPhoto:(id)a4 error:(id)a5;
- (void)managerDidBecomeReady:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDevice:(int64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setImmediateModeManager:(id)a3;
- (void)setOutputCollection:(id)a3;
- (void)setOutputImages:(id)a3;
- (void)setPickerController:(id)a3;
- (void)setRemainingPhotos:(unint64_t)a3;
- (void)setShowPreview:(BOOL)a3;
- (void)setUpImmediateInterfaceWithAttribution:(id)a3;
- (void)setUpTapInterface;
- (void)showWithCameraPreview:(BOOL)a3 photoCount:(unint64_t)a4 device:(id)a5 shortcutAttribution:(id)a6 completionHandler:(id)a7;
@end

@implementation WFTakePhotoActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immediateModeManager, 0);
  objc_destroyWeak((id *)&self->_pickerController);
  objc_storeStrong((id *)&self->_outputImages, 0);
  objc_storeStrong((id *)&self->_outputCollection, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setImmediateModeManager:(id)a3
{
}

- (WFTakePhotoImmediateModeManager)immediateModeManager
{
  return self->_immediateModeManager;
}

- (void)setPickerController:(id)a3
{
}

- (WFImagePickerController)pickerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerController);
  return (WFImagePickerController *)WeakRetained;
}

- (void)setDevice:(int64_t)a3
{
  self->_device = a3;
}

- (int64_t)device
{
  return self->_device;
}

- (void)setOutputImages:(id)a3
{
}

- (NSMutableArray)outputImages
{
  return self->_outputImages;
}

- (void)setRemainingPhotos:(unint64_t)a3
{
  self->_remainingPhotos = a3;
}

- (unint64_t)remainingPhotos
{
  return self->_remainingPhotos;
}

- (void)setOutputCollection:(id)a3
{
}

- (WFContentCollection)outputCollection
{
  return self->_outputCollection;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setShowPreview:(BOOL)a3
{
  self->_showPreview = a3;
}

- (BOOL)showPreview
{
  return self->_showPreview;
}

- (void)manager:(id)a3 didFinishWithPhoto:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  [a3 stop];
  if (!v8)
  {
    v9 = [v10 fileDataRepresentation];
    [(WFTakePhotoActionUIKitUserInterface *)self addImageDataToOutput:v9];
  }
  [(WFTakePhotoActionUIKitUserInterface *)self finishWithError:v8];
}

- (void)managerDidBecomeReady:(id)a3
{
  id v5 = 0;
  [a3 takePhotoWithError:&v5];
  id v4 = v5;
  if (v4) {
    [(WFTakePhotoActionUIKitUserInterface *)self finishWithError:v4];
  }
}

- (void)addImageDataToOutput:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];

  id v8 = objc_msgSend(NSString, "wf_datedFilenameWithTypeString:fileExtension:", v7, @"jpeg");
  v9 = [MEMORY[0x263F339A0] createTemporaryFileWithFilename:v8];
  id v16 = 0;
  [v5 writeToURL:v9 options:0 error:&v16];

  id v10 = v16;
  if (v10)
  {
    [(WFTakePhotoActionUIKitUserInterface *)self finishWithError:v10];
  }
  else
  {
    v11 = [MEMORY[0x263F33870] fileWithURL:v9 options:1];
    v12 = [(WFTakePhotoActionUIKitUserInterface *)self outputCollection];
    v13 = (void *)MEMORY[0x263F338B0];
    v14 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB40]];
    v15 = [v13 itemWithFile:v11 preferredFileType:v14];
    [v12 addItem:v15];
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WFTakePhotoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __70__WFTakePhotoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithError:v2];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a3;
  v7 = [a4 objectForKey:*MEMORY[0x263F836A0]];
  id v8 = v7;
  if (v7)
  {
    v9 = UIImageJPEGRepresentation(v7, 1.0);
    [(WFTakePhotoActionUIKitUserInterface *)self addImageDataToOutput:v9];

    [(WFTakePhotoActionUIKitUserInterface *)self setRemainingPhotos:[(WFTakePhotoActionUIKitUserInterface *)self remainingPhotos] - 1];
    id v10 = [v6 cameraOverlayView];
    objc_msgSend(v10, "setTakenPhotos:", objc_msgSend(v10, "totalPhotos") - -[WFTakePhotoActionUIKitUserInterface remainingPhotos](self, "remainingPhotos"));
    if ([(WFTakePhotoActionUIKitUserInterface *)self remainingPhotos]
      && [(WFTakePhotoActionUIKitUserInterface *)self showPreview])
    {
      v11 = [v6 cameraOverlayView];
      v12 = [v11 shutterButton];
      [v12 setEnabled:1];
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __91__WFTakePhotoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
      v13[3] = &unk_264900E20;
      v13[4] = self;
      [v6 dismissViewControllerAnimated:1 completion:v13];
    }
  }
}

uint64_t __91__WFTakePhotoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF9700] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  [(WFTakePhotoActionUIKitUserInterface *)&v4 dealloc];
}

- (void)finishWithError:(id)a3
{
  id v11 = a3;
  objc_super v4 = [(WFTakePhotoActionUIKitUserInterface *)self outputCollection];
  uint64_t v5 = [v4 numberOfItems];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F08910];
    v7 = [(WFTakePhotoActionUIKitUserInterface *)self outputCollection];
    id v8 = objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
  }
  else
  {
    id v8 = 0;
  }
  v9 = [(WFTakePhotoActionUIKitUserInterface *)self completionHandler];

  if (v9)
  {
    id v10 = [(WFTakePhotoActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, void *, id))v10)[2](v10, v8, v11);

    [(WFTakePhotoActionUIKitUserInterface *)self setCompletionHandler:0];
  }
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFTakePhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __79__WFTakePhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithCameraPreview:(BOOL)a3 photoCount:(unint64_t)a4 device:(id)a5 shortcutAttribution:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  id v17 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v14)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFTakePhotoActionUIKitUserInterface.m", 148, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFTakePhotoActionUIKitUserInterface *)self setShowPreview:v10];
  [(WFTakePhotoActionUIKitUserInterface *)self setCompletionHandler:v14];
  -[WFTakePhotoActionUIKitUserInterface setDevice:](self, "setDevice:", [(id)objc_opt_class() cameraDeviceFromString:v17]);
  [(WFTakePhotoActionUIKitUserInterface *)self setRemainingPhotos:a4];
  id v15 = objc_alloc_init(MEMORY[0x263F337B0]);
  [(WFTakePhotoActionUIKitUserInterface *)self setOutputCollection:v15];

  if ([(WFTakePhotoActionUIKitUserInterface *)self showPreview]) {
    [(WFTakePhotoActionUIKitUserInterface *)self setUpTapInterface];
  }
  else {
    [(WFTakePhotoActionUIKitUserInterface *)self setUpImmediateInterfaceWithAttribution:v13];
  }
}

- (void)setUpImmediateInterfaceWithAttribution:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__WFTakePhotoActionUIKitUserInterface_setUpImmediateInterfaceWithAttribution___block_invoke;
  block[3] = &unk_264900E88;
  id v5 = v4;
  id v11 = v5;
  v12 = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_super v6 = [[WFTakePhotoImmediateModeManager alloc] initWithCameraPosition:[(WFTakePhotoActionUIKitUserInterface *)self device] delegate:self];
  [(WFTakePhotoActionUIKitUserInterface *)self setImmediateModeManager:v6];

  v7 = [(WFTakePhotoActionUIKitUserInterface *)self immediateModeManager];
  id v9 = 0;
  [v7 startSessionWithError:&v9];
  id v8 = v9;

  if (v8) {
    [(WFTakePhotoActionUIKitUserInterface *)self finishWithError:v8];
  }
}

void __78__WFTakePhotoActionUIKitUserInterface_setUpImmediateInterfaceWithAttribution___block_invoke(uint64_t a1)
{
  id v2 = [WFTakePhotoNotificationView alloc];
  id v4 = -[WFTakePhotoNotificationView initWithFrame:shortcutAttribution:](v2, "initWithFrame:shortcutAttribution:", *(void *)(a1 + 32), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v3 = objc_alloc_init(MEMORY[0x263F82E10]);
  [v3 setView:v4];
  [*(id *)(a1 + 40) presentContent:v3];
}

- (void)setUpTapInterface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke;
  block[3] = &unk_264900E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) remainingPhotos] < 2)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = objc_alloc_init(WFCameraOverlayView);
    -[WFCameraOverlayView setTotalPhotos:](v2, "setTotalPhotos:", [*(id *)(a1 + 32) remainingPhotos]);
  }
  id v3 = [*(id *)(a1 + 32) setupControllerWithOverlay:v2];
  if (v2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke_2;
    v4[3] = &unk_2648FFF88;
    id v5 = v2;
    [v3 setMagicTapHandler:v4];
  }
  [*(id *)(a1 + 32) presentContent:v3];
}

uint64_t __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) shutterButton];
  [v1 sendActionsForControlEvents:64];

  return 1;
}

- (id)setupControllerWithOverlay:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WFImagePickerController);
  [(WFImagePickerController *)v5 setDelegate:self];
  [(WFImagePickerController *)v5 setSourceType:1];
  [(WFImagePickerController *)v5 setCameraDevice:[(WFTakePhotoActionUIKitUserInterface *)self device]];
  if (v4)
  {
    objc_super v6 = [(WFImagePickerController *)v5 cameraOverlayView];
    [v6 frame];
    objc_msgSend(v4, "setFrame:");

    [v4 setAutoresizingMask:18];
    [v4 setPickerController:v5];
    [(WFImagePickerController *)v5 setCameraOverlayView:v4];
    [(WFImagePickerController *)v5 setShowsCameraControls:0];
  }
  [(WFTakePhotoActionUIKitUserInterface *)self setPickerController:v5];

  return v5;
}

- (WFTakePhotoActionUIKitUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5 = (void *)MEMORY[0x263F85260];
  uint64_t v6 = *MEMORY[0x263F85610];
  id v7 = a3;
  id v8 = [v5 attributionWithAppBundleIdentifier:v6];
  v12.receiver = self;
  v12.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  id v9 = [(WFActionUserInterface *)&v12 initWithUserInterfaceType:v7 attribution:v8];

  if (v9) {
    BOOL v10 = v9;
  }

  return v9;
}

+ (int64_t)cameraDeviceFromString:(id)a3
{
  id v3 = a3;
  if (![v3 isEqualToString:*MEMORY[0x263F23298]]
    || (int64_t v4 = 0, ([MEMORY[0x263F82808] isCameraDeviceAvailable:0] & 1) == 0))
  {
    if (![v3 isEqualToString:*MEMORY[0x263F232A0]]
      || (int64_t v4 = 1, ([MEMORY[0x263F82808] isCameraDeviceAvailable:1] & 1) == 0))
    {
      int64_t v4 = 0;
    }
  }

  return v4;
}

@end