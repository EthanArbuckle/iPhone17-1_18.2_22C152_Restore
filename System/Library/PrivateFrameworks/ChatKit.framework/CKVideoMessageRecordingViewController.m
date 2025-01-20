@interface CKVideoMessageRecordingViewController
- (BOOL)canceled;
- (BOOL)recording;
- (BOOL)sending;
- (BOOL)shouldAutorotate;
- (BOOL)triedToRecord;
- (CKActionMenuController)videoActionMenuController;
- (CKActionMenuItem)photoMenuItem;
- (CKMediaObject)mediaObjectForSending;
- (CKRecordingElapsedTimeView)timerView;
- (CKVideoMessageRecordingViewController)initWithPresentationView:(id)a3;
- (CKVideoMessageRecordingViewControllerDelegate)videoMessageDelegate;
- (NSError)captureError;
- (UIButton)swapCameraButton;
- (UIImagePickerController)cameraViewController;
- (UIView)topBackgroundView;
- (id)mediaExportCompletionBlock;
- (unint64_t)enableCancel;
- (void)_animateVideoIn;
- (void)_cleanupCamera;
- (void)_previewWarmedUp:(id)a3;
- (void)actionMenuControllerWillDismissActionMenu:(id)a3 animated:(BOOL)a4;
- (void)cancel;
- (void)ckVideoRecorder:(id)a3 imageDataCaptured:(id)a4 error:(id)a5;
- (void)ckVideoRecorder:(id)a3 videoCaptured:(id)a4 error:(id)a5;
- (void)ckVideoRecorderRecordingCanceled:(id)a3;
- (void)dealloc;
- (void)dismissWithCompletion:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)photoMenuItemAction:(id)a3;
- (void)presentVideoActionMenuController;
- (void)presentWithCompletion:(id)a3;
- (void)record;
- (void)send;
- (void)setCameraViewController:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCaptureError:(id)a3;
- (void)setEnableCancel:(unint64_t)a3;
- (void)setMediaExportCompletionBlock:(id)a3;
- (void)setMediaObjectForSending:(id)a3;
- (void)setPhotoMenuItem:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setSending:(BOOL)a3;
- (void)setSwapCameraButton:(id)a3;
- (void)setTimerView:(id)a3;
- (void)setTopBackgroundView:(id)a3;
- (void)setTriedToRecord:(BOOL)a3;
- (void)setVideoActionMenuController:(id)a3;
- (void)setVideoMessageDelegate:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
- (void)swapCamera:(id)a3;
- (void)takePictureWithCompletionBlock:(id)a3;
- (void)videoMenuItemAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKVideoMessageRecordingViewController

- (CKVideoMessageRecordingViewController)initWithPresentationView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVideoMessageRecordingViewController;
  v6 = [(CKVideoMessageRecordingViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationView, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__previewWarmedUp_ name:*MEMORY[0x1E4F159D8] object:0];
    [v8 addObserver:v7 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
    [v8 addObserver:v7 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
  }
  return v7;
}

- (void)viewDidLoad
{
  v69[2] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)CKVideoMessageRecordingViewController;
  [(CKVideoMessageRecordingViewController *)&v68 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42A90]);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 _properties];
  v6 = (void *)[v4 initWithDictionary:v5];

  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [v6 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F44098]];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  [v6 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F440B8]];
  [v6 setValue:v8 forKey:*MEMORY[0x1E4F44080]];
  [v6 setValue:v7 forKey:*MEMORY[0x1E4F44038]];
  [v3 _setProperties:v6];
  [v3 setAllowsEditing:0];
  uint64_t v9 = 1;
  [v3 setSourceType:1];
  [v3 _setImagePickerSavingOptions:4];
  uint64_t v10 = *MEMORY[0x1E4F225F8];
  v69[0] = *MEMORY[0x1E4F22660];
  v69[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  [v3 setMediaTypes:v11];

  [v3 setCameraCaptureMode:1];
  [v3 setVideoQuality:0];
  v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v13 = [v12 objectForKey:@"kCKVideoMessagingCameraDevice"];

  if (v13) {
    uint64_t v9 = [v13 integerValue];
  }
  v67 = v13;
  if (v9 >= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v9;
  }
  [v3 setCameraDevice:v14];
  [v3 setShowsCameraControls:0];
  [v3 setDelegate:self];
  [(CKVideoMessageRecordingViewController *)self setCameraViewController:v3];
  v15 = [(CKVideoMessageRecordingViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(CKVideoMessageRecordingViewController *)self addChildViewController:v3];
  v24 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  v25 = [v24 view];

  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);
  [v25 setAlpha:0.0];
  [v3 didMoveToParentViewController:self];
  v65 = v25;
  v66 = v15;
  [v15 addSubview:v25];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v17, v19, v21, v23);
  [v26 setAutoresizingMask:18];
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v21, 40.0);
  [v27 setAutoresizingMask:18];
  v28 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.3];
  [v27 setBackgroundColor:v28];

  [v27 setOpaque:0];
  [v26 addSubview:v27];
  [(CKVideoMessageRecordingViewController *)self setTopBackgroundView:v27];
  v29 = [CKRecordingElapsedTimeView alloc];
  v30 = -[CKRecordingElapsedTimeView initWithFrame:](v29, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKRecordingElapsedTimeView *)v30 setAutoresizingMask:5];
  [(CKVideoMessageRecordingViewController *)self setTimerView:v30];
  v31 = [(CKVideoMessageRecordingViewController *)self timerView];
  [v31 sizeToFit];

  v32 = [(CKVideoMessageRecordingViewController *)self timerView];
  [v32 setHidden:1];

  v33 = [(CKVideoMessageRecordingViewController *)self topBackgroundView];
  [v33 frame];
  CGFloat v34 = CGRectGetWidth(v70) * 0.5;
  v35 = [(CKVideoMessageRecordingViewController *)self topBackgroundView];
  [v35 frame];
  CGFloat v36 = CGRectGetHeight(v71) * 0.5;
  v37 = [(CKVideoMessageRecordingViewController *)self timerView];
  [v37 frame];
  double v39 = v38;
  double v41 = v40;
  CGFloat v42 = v34 - v38 * 0.5;
  CGFloat v43 = v36 - v40 * 0.5;

  v44 = [(CKVideoMessageRecordingViewController *)self timerView];
  objc_msgSend(v44, "setFrame:", v42, v43, v39, v41);

  v45 = [(CKVideoMessageRecordingViewController *)self topBackgroundView];
  uint64_t v46 = [(CKVideoMessageRecordingViewController *)self timerView];
  [v45 addSubview:v46];

  v47 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  LOBYTE(v46) = [v47 BOOLForKey:@"CKSwapCameraButton"];

  if ((v46 & 1) == 0)
  {
    v48 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    v49 = [MEMORY[0x1E4F42A80] ckImageNamed:@"CameraToggle"];
    v50 = [MEMORY[0x1E4F428B8] whiteColor];
    v51 = [v49 _flatImageWithColor:v50];
    [v48 setImage:v51 forState:0];

    [v48 setOpaque:0];
    [v48 sizeToFit];
    [v48 addTarget:self action:sel_swapCamera_ forControlEvents:64];
    [v48 frame];
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    double v57 = v56;
    double v59 = v58;
    v60 = [(CKVideoMessageRecordingViewController *)self topBackgroundView];
    [v60 frame];
    double Width = CGRectGetWidth(v72);
    v73.origin.x = v53;
    v73.origin.y = v55;
    v73.size.width = v57;
    v73.size.height = v59;
    double v62 = Width - CGRectGetWidth(v73) + -10.0;

    objc_msgSend(v48, "setFrame:", v62, 10.0, v57, v59);
    [v48 setAutoresizingMask:1];
    v63 = [(CKVideoMessageRecordingViewController *)self topBackgroundView];
    [v63 addSubview:v48];

    [(CKVideoMessageRecordingViewController *)self setSwapCameraButton:v48];
  }
  v64 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  [v64 setCameraOverlayView:v26];
}

- (void)presentVideoActionMenuController
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v3 = [CKVideoCancelActionMenuItemView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v8 = -[CKVideoCancelActionMenuItemView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(CKVideoCancelActionMenuItemView *)v8 sizeToFit];
  v51 = v8;
  double v52 = [(CKActionMenuItem *)[CKVideoCancelActionMenuItem alloc] initWithView:v8 label:0 target:self action:sel_cancelMenuItemAction_];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "ck_cui_cameraModeDialFontForContentSize:", *MEMORY[0x1E4F437B0]);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "ck_cui_cameraKerningForFont:", v9);
  v54[0] = *MEMORY[0x1E4FB0700];
  v11 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v12 = *MEMORY[0x1E4FB0710];
  v55[0] = v11;
  v55[1] = v10;
  v49 = (void *)v10;
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v54[1] = v12;
  v54[2] = v13;
  v50 = (void *)v9;
  v55[2] = v9;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

  v15 = [MEMORY[0x1E4F57DB0] actionMenuShutterButton];
  [v15 setMode:0 animated:0];
  [v15 setUserInteractionEnabled:0];
  [v15 sizeToFit];
  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v17 = CKFrameworkBundle();
  double v18 = [v17 localizedStringForKey:@"PHOTO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v19 = [v16 initWithString:v18 attributes:v14];

  double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v4, v5, v6, v7);
  v47 = (void *)v19;
  [v20 setAttributedText:v19];
  [v20 sizeToFit];
  double v21 = [[CKActionMenuItem alloc] initWithView:v15 label:v20 target:self action:sel_photoMenuItemAction_];
  [(CKVideoMessageRecordingViewController *)self setPhotoMenuItem:v21];
  double v22 = [MEMORY[0x1E4F57DB0] actionMenuShutterButton];
  [v22 setMode:1 animated:0];
  [v22 setUserInteractionEnabled:0];
  [v22 sizeToFit];
  id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
  v24 = CKFrameworkBundle();
  v25 = [v24 localizedStringForKey:@"VIDEO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v48 = (void *)v14;
  v26 = (void *)[v23 initWithString:v25 attributes:v14];

  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v4, v5, v6, v7);
  [v27 setAttributedText:v26];
  [v27 sizeToFit];
  v28 = [(CKActionMenuItem *)[CKRecordActionMenuItem alloc] initWithView:v22 label:v27 target:self action:sel_videoMenuItemAction_];
  v29 = [CKActionMenuController alloc];
  v53[0] = v28;
  v53[1] = v21;
  v53[2] = v52;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  v31 = [(CKActionMenuController *)v29 initWithActionMenuItems:v30 defaultActionIndex:2 blurEffectStyle:2];

  [(CKActionMenuController *)v31 setDelegate:self];
  [(CKVideoMessageRecordingViewController *)self setVideoActionMenuController:v31];
  [(UIView *)self->_presentationView frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  if (CKMainScreenScale_once_68 != -1) {
    dispatch_once(&CKMainScreenScale_once_68, &__block_literal_global_174);
  }
  double v40 = *(double *)&CKMainScreenScale_sMainScreenScale_68;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_68 == 0.0) {
    double v40 = 1.0;
  }
  double v41 = v33 * v40 + floor((v37 * v40 - v6 * v40) * 0.5);
  double v42 = v35 * v40 + floor((v39 * v40 - v7 * v40) * 0.5);
  double v43 = 1.0 / v40;
  double v44 = v43 * v41;
  double v45 = v43 * v42;
  uint64_t v46 = [(UIView *)self->_presentationView superview];
  -[CKActionMenuController presentActionMenuFromPoint:inView:animated:](v31, "presentActionMenuFromPoint:inView:animated:", v46, 1, v44, v45);
}

- (void)presentWithCompletion:(id)a3
{
  uint64_t v10 = (void (**)(void))a3;
  double v4 = [_CKVideoMessageRecordingWindow alloc];
  double v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 bounds];
  double v6 = -[_CKVideoMessageRecordingWindow initWithFrame:](v4, "initWithFrame:");
  overlayWindow = self->_overlayWindow;
  self->_overlayWindow = v6;

  [(UIWindow *)self->_overlayWindow setRootViewController:self];
  [(UIWindow *)self->_overlayWindow setHidden:0];
  uint64_t v8 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  uint64_t v9 = [v8 view];
  [(UIWindow *)self->_overlayWindow bounds];
  objc_msgSend(v9, "setFrame:");

  self->_presented = 1;
  [(CKVideoMessageRecordingViewController *)self presentVideoActionMenuController];
  if (self->_previewWarmedUp) {
    [(CKVideoMessageRecordingViewController *)self _animateVideoIn];
  }
  if (v10) {
    v10[2]();
  }
  [(CKVideoMessageRecordingViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_previewWarmedUp:(id)a3
{
  if (self->_presented) {
    [(CKVideoMessageRecordingViewController *)self _animateVideoIn];
  }
  self->_previewWarmedUp = 1;
}

- (void)dismissWithCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  overlayWindow = self->_overlayWindow;
  if (overlayWindow)
  {
    double v6 = overlayWindow;
    dispatch_time_t v7 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__CKVideoMessageRecordingViewController_dismissWithCompletion___block_invoke;
    block[3] = &unk_1E5620C40;
    uint64_t v13 = v6;
    uint64_t v8 = v6;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);

    uint64_t v9 = self->_overlayWindow;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(UIWindow *)v9 setHidden:1];
  uint64_t v10 = self->_overlayWindow;
  self->_overlayWindow = 0;

  v11 = [(CKVideoMessageRecordingViewController *)self videoActionMenuController];
  [v11 setDelegate:0];
  [(CKVideoMessageRecordingViewController *)self setVideoActionMenuController:0];
  [v11 dismissActionMenuAnimated:1];
  if (v4) {
    v4[2](v4);
  }
}

uint64_t __63__CKVideoMessageRecordingViewController_dismissWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRootViewController:0];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)_animateVideoIn
{
  if (!self->_showingVideo)
  {
    self->_showingVideo = 1;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke;
    v3[3] = &unk_1E5620C40;
    v3[4] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke_2;
    v2[3] = &unk_1E5620BF0;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:0.3];
  }
}

void __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cameraViewController];
  v1 = [v2 view];
  [v1 setAlpha:1.0];
}

uint64_t __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) recording];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) triedToRecord];
    if (result)
    {
      id v3 = *(void **)(a1 + 32);
      return [v3 record];
    }
  }
  return result;
}

- (void)swapCamera:(id)a3
{
  double v4 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  uint64_t v5 = [v4 cameraDevice];

  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    double v6 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
    dispatch_time_t v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    double v6 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
    dispatch_time_t v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setCameraDevice:v8];

LABEL_6:
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = NSNumber;
  uint64_t v10 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "cameraDevice"));
  [v12 setObject:v11 forKey:@"kCKVideoMessagingCameraDevice"];
}

- (void)actionMenuControllerWillDismissActionMenu:(id)a3 animated:(BOOL)a4
{
  if (![(CKVideoMessageRecordingViewController *)self sending])
  {
    [(CKVideoMessageRecordingViewController *)self cancel];
  }
}

- (void)record
{
  if (![(CKVideoMessageRecordingViewController *)self recording])
  {
    id v3 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
    -[CKVideoMessageRecordingViewController setRecording:](self, "setRecording:", [v3 startVideoCapture]);

    if ([(CKVideoMessageRecordingViewController *)self recording])
    {
      double v4 = [(CKVideoMessageRecordingViewController *)self photoMenuItem];
      [v4 setEnabled:0 animated:1];

      uint64_t v5 = [(CKVideoMessageRecordingViewController *)self timerView];
      [v5 setHidden:0];

      double v6 = [(CKVideoMessageRecordingViewController *)self timerView];
      [v6 startTimer];

      dispatch_time_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v8 = [v7 BOOLForKey:@"CKSwapCameraButton"];

      if ((v8 & 1) == 0)
      {
        id v9 = [(CKVideoMessageRecordingViewController *)self swapCameraButton];
        [v9 setHidden:1];
      }
    }
    else
    {
      [(CKVideoMessageRecordingViewController *)self setTriedToRecord:1];
    }
  }
}

- (void)videoMenuItemAction:(id)a3
{
  if ([a3 isSelected])
  {
    [(CKVideoMessageRecordingViewController *)self record];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke_2;
    v4[3] = &unk_1E5620C40;
    v4[4] = self;
    +[CKActionMenuItem animate:v4 completion:0];
  }
  else if ([(CKVideoMessageRecordingViewController *)self recording])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke;
    v5[3] = &unk_1E5620C40;
    v5[4] = self;
    [(CKVideoMessageRecordingViewController *)self stopRecordingWithCompletionBlock:v5];
  }
}

uint64_t __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

void __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "videoActionMenuController", 0);
  id v2 = [v1 actionMenuItems];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_time_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) label];
        [v7 setAlpha:0.0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)takePictureWithCompletionBlock:(id)a3
{
  [(CKVideoMessageRecordingViewController *)self setMediaExportCompletionBlock:a3];
  id v4 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
  [v4 takePicture];
}

- (void)photoMenuItemAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CKVideoMessageRecordingViewController_photoMenuItemAction___block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [(CKVideoMessageRecordingViewController *)self takePictureWithCompletionBlock:v3];
}

uint64_t __61__CKVideoMessageRecordingViewController_photoMenuItemAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  id v4 = [(CKVideoMessageRecordingViewController *)self timerView];
  [v4 endTimer];

  if ([(CKVideoMessageRecordingViewController *)self recording])
  {
    [(CKVideoMessageRecordingViewController *)self setRecording:0];
    [(CKVideoMessageRecordingViewController *)self setMediaExportCompletionBlock:v6];
    uint64_t v5 = [(CKVideoMessageRecordingViewController *)self cameraViewController];
    [v5 stopVideoCapture];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)send
{
  [(CKVideoMessageRecordingViewController *)self setSending:1];
  uint64_t v3 = [(CKVideoMessageRecordingViewController *)self videoMessageDelegate];
  id v4 = [(CKVideoMessageRecordingViewController *)self mediaObjectForSending];
  uint64_t v5 = [(CKVideoMessageRecordingViewController *)self captureError];
  [v3 ckVideoMessageRecordingViewController:self mediaObjectCaptured:v4 error:v5];

  [(CKVideoMessageRecordingViewController *)self setMediaObjectForSending:0];

  [(CKVideoMessageRecordingViewController *)self setCaptureError:0];
}

- (void)cancel
{
  [(CKVideoMessageRecordingViewController *)self setCanceled:1];
  uint64_t v3 = [(CKVideoMessageRecordingViewController *)self cameraViewController];

  if (v3) {
    [(CKVideoMessageRecordingViewController *)self stopRecordingWithCompletionBlock:0];
  }
  id v4 = [(CKVideoMessageRecordingViewController *)self videoMessageDelegate];
  [v4 ckVideoMessageRecordingViewControllerRecordingCanceled:self];
}

- (void)ckVideoRecorderRecordingCanceled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKVideoMessageRecordingViewController *)self videoMessageDelegate];
  [v5 ckVideoMessageRecordingViewControllerRecordingCanceled:self];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [v4 outputFileURL];

  [v7 removeItemAtURL:v6 error:0];
}

- (void)ckVideoRecorder:(id)a3 videoCaptured:(id)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = v9;
  if (v8)
  {
    if (!v9)
    {
      long long v11 = +[CKMediaObjectManager sharedInstance];
      id v12 = [v11 mediaObjectWithFileURL:v8 filename:@"Video Message.mov" transcoderUserInfo:0];

      goto LABEL_6;
    }
  }
  else
  {
    id v16 = v9;
    _IMWarn();
  }
  id v12 = 0;
LABEL_6:
  -[CKVideoMessageRecordingViewController setMediaObjectForSending:](self, "setMediaObjectForSending:", v12, v16);
  [(CKVideoMessageRecordingViewController *)self setCaptureError:v10];
  uint64_t v13 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];

  if (v13)
  {
    uint64_t v14 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];
    v14[2]();

    [(CKVideoMessageRecordingViewController *)self setMediaExportCompletionBlock:0];
  }
  if (v8)
  {
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtURL:v8 error:0];
  }
}

- (void)ckVideoRecorder:(id)a3 imageDataCaptured:(id)a4 error:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    long long v10 = +[CKImageData UTITypeForData:v8];
    long long v11 = +[CKMediaObjectManager sharedInstance];
    id v12 = [v11 mediaObjectWithData:v8 UTIType:v10 filename:0 transcoderUserInfo:0];
  }
  else
  {
    id v12 = 0;
  }
  [(CKVideoMessageRecordingViewController *)self setMediaObjectForSending:v12];
  [(CKVideoMessageRecordingViewController *)self setCaptureError:v9];
  uint64_t v13 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];

  if (v13)
  {
    uint64_t v14 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];
    v14[2]();

    [(CKVideoMessageRecordingViewController *)self setMediaExportCompletionBlock:0];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  if ([(CKVideoMessageRecordingViewController *)self canceled]) {
    goto LABEL_21;
  }
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F43990]];
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F22660]))
  {
    id v7 = [v5 objectForKey:*MEMORY[0x1E4F43998]];
    if (v7)
    {
      id v8 = [v5 objectForKey:*MEMORY[0x1E4F440A8]];
      id v9 = [v5 objectForKey:*MEMORY[0x1E4F440A0]];
      [v9 doubleValue];
      double v11 = v10;
      [v8 doubleValue];
      if (v11 - v12 <= 2.22044605e-16)
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        [v13 setObject:v8 forKey:*MEMORY[0x1E4F6D3B8]];
        [v13 setObject:v9 forKey:*MEMORY[0x1E4F6D388]];
      }
      id v17 = +[CKMediaObjectManager sharedInstance];
      id v16 = [v17 mediaObjectWithFileURL:v7 filename:@"Video Message.mov" transcoderUserInfo:v13];

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F225F8]))
  {
    id v16 = 0;
    goto LABEL_15;
  }
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F44070]];
  if (!v7)
  {
LABEL_13:
    _IMWarn();
    id v16 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = +[CKImageData UTITypeForData:v7];
  id v15 = +[CKMediaObjectManager sharedInstance];
  id v16 = [v15 mediaObjectWithData:v7 UTIType:v14 filename:0 transcoderUserInfo:0];

LABEL_14:
LABEL_15:
  [(CKVideoMessageRecordingViewController *)self setMediaObjectForSending:v16];
  double v18 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];

  if (v18) {
    goto LABEL_19;
  }
  if ([(CKVideoMessageRecordingViewController *)self recording])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__CKVideoMessageRecordingViewController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v21[3] = &unk_1E5620C40;
    v21[4] = self;
    [(CKVideoMessageRecordingViewController *)self stopRecordingWithCompletionBlock:v21];
  }
  uint64_t v19 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];

  if (v19)
  {
LABEL_19:
    double v20 = [(CKVideoMessageRecordingViewController *)self mediaExportCompletionBlock];
    v20[2]();

    [(CKVideoMessageRecordingViewController *)self setMediaExportCompletionBlock:0];
  }

LABEL_21:
}

uint64_t __93__CKVideoMessageRecordingViewController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

- (void)_cleanupCamera
{
  if ([(UIImagePickerController *)self->_cameraViewController isViewLoaded])
  {
    uint64_t v3 = [(UIImagePickerController *)self->_cameraViewController view];
    [v3 removeFromSuperview];
  }
  [(CKVideoMessageRecordingViewController *)self removeChildViewController:self->_cameraViewController];
  [(UIImagePickerController *)self->_cameraViewController setDelegate:0];
  cameraViewController = self->_cameraViewController;
  self->_cameraViewController = 0;

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(CKActionMenuController *)self->_videoActionMenuController setDelegate:0];
  [(CKVideoMessageRecordingViewController *)self _cleanupCamera];
  presentationView = self->_presentationView;
  self->_presentationView = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKVideoMessageRecordingViewController;
  [(CKVideoMessageRecordingViewController *)&v5 dealloc];
}

- (CKVideoMessageRecordingViewControllerDelegate)videoMessageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoMessageDelegate);

  return (CKVideoMessageRecordingViewControllerDelegate *)WeakRetained;
}

- (void)setVideoMessageDelegate:(id)a3
{
}

- (UIView)topBackgroundView
{
  return self->_topBackgroundView;
}

- (void)setTopBackgroundView:(id)a3
{
}

- (CKRecordingElapsedTimeView)timerView
{
  return self->_timerView;
}

- (void)setTimerView:(id)a3
{
}

- (CKActionMenuController)videoActionMenuController
{
  return self->_videoActionMenuController;
}

- (void)setVideoActionMenuController:(id)a3
{
}

- (CKActionMenuItem)photoMenuItem
{
  return self->_photoMenuItem;
}

- (void)setPhotoMenuItem:(id)a3
{
}

- (UIButton)swapCameraButton
{
  return self->_swapCameraButton;
}

- (void)setSwapCameraButton:(id)a3
{
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)sending
{
  return self->_sending;
}

- (void)setSending:(BOOL)a3
{
  self->_sending = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)triedToRecord
{
  return self->_triedToRecord;
}

- (void)setTriedToRecord:(BOOL)a3
{
  self->_triedToRecord = a3;
}

- (unint64_t)enableCancel
{
  return self->_enableCancel;
}

- (void)setEnableCancel:(unint64_t)a3
{
  self->_enableCancel = a3;
}

- (CKMediaObject)mediaObjectForSending
{
  return self->_mediaObjectForSending;
}

- (void)setMediaObjectForSending:(id)a3
{
}

- (NSError)captureError
{
  return self->_captureError;
}

- (void)setCaptureError:(id)a3
{
}

- (id)mediaExportCompletionBlock
{
  return self->_mediaExportCompletionBlock;
}

- (void)setMediaExportCompletionBlock:(id)a3
{
}

- (UIImagePickerController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_storeStrong(&self->_mediaExportCompletionBlock, 0);
  objc_storeStrong((id *)&self->_captureError, 0);
  objc_storeStrong((id *)&self->_mediaObjectForSending, 0);
  objc_storeStrong((id *)&self->_swapCameraButton, 0);
  objc_storeStrong((id *)&self->_photoMenuItem, 0);
  objc_storeStrong((id *)&self->_videoActionMenuController, 0);
  objc_storeStrong((id *)&self->_timerView, 0);
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_destroyWeak((id *)&self->_videoMessageDelegate);
  objc_storeStrong((id *)&self->_overlayWindow, 0);

  objc_storeStrong((id *)&self->_presentationView, 0);
}

@end