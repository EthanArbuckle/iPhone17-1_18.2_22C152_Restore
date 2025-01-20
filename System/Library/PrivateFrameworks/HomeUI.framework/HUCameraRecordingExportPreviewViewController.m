@interface HUCameraRecordingExportPreviewViewController
- (AVPlayerLooper)looper;
- (AVQueuePlayer)queuePlayer;
- (BOOL)hasVideoPreview;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HMCameraClip)cameraClip;
- (HMCameraClipFetchVideoAssetContextOperation)videoDownloadOperation;
- (HMCameraProfile)cameraProfile;
- (HUCameraRecordingExportPreviewViewController)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5;
- (HUCameraRecordingPlayerView)playerView;
- (NSOperationQueue)backgroundSessionQueue;
- (NSURL)exportURL;
- (UIActivityIndicatorView)loadingIndicatorView;
- (UIButton)submitButton;
- (UILabel)descriptionLabel;
- (UITextView)learnMoreTextView;
- (id)completionHandler;
- (id)queuePlayerObserver;
- (void)_addConstraints;
- (void)_displayFailureToSubmitAlert;
- (void)_loadLoadingInterface;
- (void)_loadPreviewInterface;
- (void)_stripAndTruncateRecording;
- (void)cancelSubmission;
- (void)didDismissPrivacyViewController;
- (void)playVideoFile;
- (void)prepareRecordingForExport;
- (void)setBackgroundSessionQueue:(id)a3;
- (void)setCameraClip:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setExportURL:(id)a3;
- (void)setHasVideoPreview:(BOOL)a3;
- (void)setLearnMoreTextView:(id)a3;
- (void)setLoadingIndicatorView:(id)a3;
- (void)setLooper:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setQueuePlayer:(id)a3;
- (void)setQueuePlayerObserver:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)setVideoDownloadOperation:(id)a3;
- (void)showPrivacyInformation;
- (void)submitCurrentClip;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCameraRecordingExportPreviewViewController

- (HUCameraRecordingExportPreviewViewController)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  v11 = [(HUCameraRecordingExportPreviewViewController *)&v18 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cameraClip, v8);
    objc_storeWeak((id *)&v12->_cameraProfile, v9);
    v13 = _Block_copy(v10);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    backgroundSessionQueue = v12->_backgroundSessionQueue;
    v12->_backgroundSessionQueue = v15;

    [(HUCameraRecordingExportPreviewViewController *)v12 prepareRecordingForExport];
  }

  return v12;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  [(HUCameraRecordingExportPreviewViewController *)&v10 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUCameraRecordingExportPreviewViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackNavigationTitle", @"HUCameraExportFeedbackNavigationTitle", 1);
  [(HUCameraRecordingExportPreviewViewController *)self setTitle:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
  v7 = _HULocalizedStringWithDefaultValue(@"HUCameraCancelText", @"HUCameraCancelText", 1);
  id v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_cancelSubmission];
  id v9 = [(HUCameraRecordingExportPreviewViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  if ([(HUCameraRecordingExportPreviewViewController *)self hasVideoPreview]) {
    [(HUCameraRecordingExportPreviewViewController *)self _loadPreviewInterface];
  }
  else {
    [(HUCameraRecordingExportPreviewViewController *)self _loadLoadingInterface];
  }
}

- (void)_loadPreviewInterface
{
  v3 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v4 = [v3 superview];

  if (!v4)
  {
    v5 = [(HUCameraRecordingExportPreviewViewController *)self view];
    id v6 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
    [v5 addSubview:v6];

    v7 = [(HUCameraRecordingExportPreviewViewController *)self view];
    id v8 = [(HUCameraRecordingExportPreviewViewController *)self descriptionLabel];
    [v7 addSubview:v8];

    id v9 = [(HUCameraRecordingExportPreviewViewController *)self view];
    objc_super v10 = [(HUCameraRecordingExportPreviewViewController *)self learnMoreTextView];
    [v9 addSubview:v10];

    v11 = [(HUCameraRecordingExportPreviewViewController *)self view];
    v12 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
    [v11 addSubview:v12];

    [(HUCameraRecordingExportPreviewViewController *)self _addConstraints];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  [(HUCameraRecordingExportPreviewViewController *)&v7 traitCollectionDidChange:a3];
  v4 = [(HUCameraRecordingExportPreviewViewController *)self traitCollection];
  if ([v4 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else {
  v5 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }
  id v6 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];
  [v6 setColor:v5];
}

- (void)_loadLoadingInterface
{
  v3 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
    [(HUCameraRecordingExportPreviewViewController *)self setLoadingIndicatorView:v4];

    v5 = [(HUCameraRecordingExportPreviewViewController *)self traitCollection];
    if ([v5 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    else {
    id v6 = [MEMORY[0x1E4F428B8] systemBlackColor];
    }
    objc_super v7 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];
    [v7 setColor:v6];

    id v8 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];
    [v8 startAnimating];

    id v9 = [(HUCameraRecordingExportPreviewViewController *)self view];
    [v9 center];
    double v11 = v10;
    double v13 = v12;
    v14 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];
    objc_msgSend(v14, "setCenter:", v11, v13);

    id v16 = [(HUCameraRecordingExportPreviewViewController *)self view];
    v15 = [(HUCameraRecordingExportPreviewViewController *)self loadingIndicatorView];
    [v16 addSubview:v15];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  [(HUCameraRecordingExportPreviewViewController *)&v4 viewWillAppear:a3];
  if ([(HUCameraRecordingExportPreviewViewController *)self hasVideoPreview]) {
    [(HUCameraRecordingExportPreviewViewController *)self playVideoFile];
  }
}

- (void)playVideoFile
{
  objc_initWeak(&location, self);
  v3 = [(HUCameraRecordingExportPreviewViewController *)self queuePlayer];
  CMTimeMakeWithSeconds(&v10, 0.017, 60);
  uint64_t v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraRecordingExportPreviewViewController_playVideoFile__block_invoke;
  v8[3] = &unk_1E638A490;
  objc_copyWeak(&v9, &location);
  id v6 = [v3 addPeriodicTimeObserverForInterval:&v10 queue:v4 usingBlock:v8];
  [(HUCameraRecordingExportPreviewViewController *)self setQueuePlayerObserver:v6];

  objc_super v7 = [(HUCameraRecordingExportPreviewViewController *)self queuePlayer];
  [v7 play];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__HUCameraRecordingExportPreviewViewController_playVideoFile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queuePlayer];
  v3 = [v2 currentItem];
  uint64_t v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  id v6 = [WeakRetained queuePlayer];
  objc_super v7 = [v6 currentItem];
  id v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  float v9 = Seconds / CMTimeGetSeconds(&v13);
  CMTime v10 = [WeakRetained playerView];
  double v11 = [v10 progressView];
  *(float *)&double v12 = v9;
  [v11 setProgress:v12];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  [(HUCameraRecordingExportPreviewViewController *)&v7 viewWillDisappear:a3];
  uint64_t v4 = [(HUCameraRecordingExportPreviewViewController *)self queuePlayerObserver];

  if (v4)
  {
    id v5 = [(HUCameraRecordingExportPreviewViewController *)self queuePlayer];
    id v6 = [(HUCameraRecordingExportPreviewViewController *)self queuePlayerObserver];
    [v5 removeTimeObserver:v6];
  }
}

- (void)_addConstraints
{
  v82[16] = *MEMORY[0x1E4F143B8];
  v81 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v80 = [v81 heightAnchor];
  v79 = [v80 constraintEqualToConstant:220.0];
  v82[0] = v79;
  v78 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v77 = [v78 widthAnchor];
  v76 = [v77 constraintEqualToConstant:390.0];
  v82[1] = v76;
  v75 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v72 = [v75 topAnchor];
  v74 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v73 = [v74 safeAreaLayoutGuide];
  v71 = [v73 topAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 constant:20.0];
  v82[2] = v70;
  v69 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v67 = [v69 centerXAnchor];
  v68 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v66 = [v68 centerXAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v82[3] = v65;
  v64 = [(HUCameraRecordingExportPreviewViewController *)self descriptionLabel];
  v62 = [v64 topAnchor];
  v63 = [(HUCameraRecordingExportPreviewViewController *)self playerView];
  v61 = [v63 bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:10.0];
  v82[4] = v60;
  v59 = [(HUCameraRecordingExportPreviewViewController *)self descriptionLabel];
  v57 = [v59 leftAnchor];
  v58 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v56 = [v58 safeAreaLayoutGuide];
  v55 = [v56 leftAnchor];
  v54 = [v57 constraintEqualToAnchor:v55 constant:10.0];
  v82[5] = v54;
  v53 = [(HUCameraRecordingExportPreviewViewController *)self descriptionLabel];
  v50 = [v53 rightAnchor];
  v52 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v51 = [v52 safeAreaLayoutGuide];
  v49 = [v51 rightAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:-10.0];
  v82[6] = v48;
  v47 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v44 = [v47 bottomAnchor];
  v46 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v45 = [v46 safeAreaLayoutGuide];
  v43 = [v45 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:-20.0];
  v82[7] = v42;
  v41 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v40 = [v41 heightAnchor];
  v39 = [v40 constraintEqualToConstant:47.0];
  v82[8] = v39;
  v38 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v36 = [v38 centerXAnchor];
  v37 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v34 = [v37 centerXAnchor];
  v33 = [v36 constraintEqualToAnchor:v34];
  v82[9] = v33;
  v32 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v30 = [v32 leftAnchor];
  v31 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v29 = [v31 safeAreaLayoutGuide];
  v28 = [v29 leftAnchor];
  v27 = [v30 constraintEqualToAnchor:v28 constant:20.0];
  v82[10] = v27;
  v26 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v24 = [v26 rightAnchor];
  v25 = [(HUCameraRecordingExportPreviewViewController *)self view];
  v23 = [v25 safeAreaLayoutGuide];
  v22 = [v23 rightAnchor];
  v21 = [v24 constraintEqualToAnchor:v22 constant:-20.0];
  v82[11] = v21;
  v20 = [(HUCameraRecordingExportPreviewViewController *)self learnMoreTextView];
  v19 = [v20 heightAnchor];
  objc_super v18 = [v19 constraintEqualToConstant:80.0];
  v82[12] = v18;
  v17 = [(HUCameraRecordingExportPreviewViewController *)self learnMoreTextView];
  v15 = [v17 bottomAnchor];
  id v16 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  v14 = [v16 topAnchor];
  CMTime v13 = [v15 constraintEqualToAnchor:v14 constant:-10.0];
  v82[13] = v13;
  v3 = [(HUCameraRecordingExportPreviewViewController *)self learnMoreTextView];
  uint64_t v4 = [v3 leftAnchor];
  id v5 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  id v6 = [v5 leftAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  v82[14] = v7;
  id v8 = [(HUCameraRecordingExportPreviewViewController *)self learnMoreTextView];
  float v9 = [v8 rightAnchor];
  CMTime v10 = [(HUCameraRecordingExportPreviewViewController *)self submitButton];
  double v11 = [v10 rightAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v82[15] = v12;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:16];

  [MEMORY[0x1E4F28DC8] activateConstraints:v35];
}

- (void)showPrivacyInformation
{
  v22 = objc_alloc_init(HUCameraRecordingPrivacyTextViewController);
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v4 = [(HUCameraRecordingPrivacyTextViewController *)v22 view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
  id v6 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
  objc_super v7 = (void *)[v5 initWithTitle:v6 style:0 target:self action:sel_didDismissPrivacyViewController];
  id v8 = [(HUCameraRecordingPrivacyTextViewController *)v22 navigationItem];
  [v8 setRightBarButtonItem:v7];

  float v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v22];
  [v9 setModalPresentationStyle:2];
  CMTime v10 = [(HUCameraRecordingExportPreviewViewController *)self view];
  double v11 = [v9 popoverPresentationController];
  [v11 setSourceView:v10];

  double v12 = [(HUCameraRecordingExportPreviewViewController *)self view];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [v9 popoverPresentationController];
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  [(HUCameraRecordingExportPreviewViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)didDismissPrivacyViewController
{
}

- (void)submitCurrentClip
{
  v3 = [(HUCameraRecordingExportPreviewViewController *)self completionHandler];
  v3[2](v3, 1);

  [(HUCameraRecordingExportPreviewViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelSubmission
{
  v3 = [(HUCameraRecordingExportPreviewViewController *)self completionHandler];
  v3[2](v3, 0);

  [(HUCameraRecordingExportPreviewViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_displayFailureToSubmitAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackFailureToSubmitTitle", @"HUCameraFeedbackFailureToSubmitTitle", 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackFailureToSubmitMessage", @"HUCameraFeedbackFailureToSubmitMessage", 1);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F42728], "hu_alertControllerForAcknowledgementWithTitle:message:", v5, v3);
  [(HUCameraRecordingExportPreviewViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_stripAndTruncateRecording
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(HUCameraRecordingExportPreviewViewController *)self cameraClip];
    *(_DWORD *)buf = 138412290;
    double v11 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Starting Strip and truncate operation for clip:%@", buf, 0xCu);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F68F78]);
  id v6 = [(HUCameraRecordingExportPreviewViewController *)self cameraClip];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke;
  v9[3] = &unk_1E638A4B8;
  v9[4] = self;
  objc_super v7 = (void *)[v5 initWithCameraClip:v6 completionHandler:v9];

  id v8 = [(HUCameraRecordingExportPreviewViewController *)self backgroundSessionQueue];
  [v8 addOperation:v7];
}

void __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Finally completed stripping the audio at %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke_35;
  v7[3] = &unk_1E63850E0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke_35(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setExportURL:");
    v2 = [*(id *)(a1 + 40) loadingIndicatorView];
    [v2 setHidden:1];

    [*(id *)(a1 + 40) setHasVideoPreview:1];
    [*(id *)(a1 + 40) _loadPreviewInterface];
    id v3 = *(void **)(a1 + 40);
    return [v3 playVideoFile];
  }
  else
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Unable to locate output URL after stripping audio. Try again later.", v6, 2u);
    }

    return [*(id *)(a1 + 40) _displayFailureToSubmitAlert];
  }
}

- (void)prepareRecordingForExport
{
  id v3 = (void *)MEMORY[0x1E4F68F68];
  uint64_t v4 = [(HUCameraRecordingExportPreviewViewController *)self cameraClip];
  LODWORD(v3) = [v3 hasCachedRecordingForCameraClip:v4];

  if (v3)
  {
    [(HUCameraRecordingExportPreviewViewController *)self _stripAndTruncateRecording];
  }
  else
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Download file to prepare for export.", (uint8_t *)buf, 2u);
    }

    id v6 = objc_alloc(MEMORY[0x1E4F2E6F0]);
    objc_super v7 = [(HUCameraRecordingExportPreviewViewController *)self cameraProfile];
    id v8 = [v7 clipManager];
    uint64_t v9 = [(HUCameraRecordingExportPreviewViewController *)self cameraClip];
    CMTime v10 = (void *)[v6 initWithClipManager:v8 clip:v9];

    id v11 = (void *)MEMORY[0x1E4F68FF8];
    uint64_t v12 = [(HUCameraRecordingExportPreviewViewController *)self cameraClip];
    double v13 = [v11 videoDestinationURLForCameraClip:v12];
    [v10 setClipDestinationFileURL:v13];

    [v10 setDownloadProgressHandler:&__block_literal_global_100];
    objc_initWeak(buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke_42;
    v14[3] = &unk_1E638A500;
    objc_copyWeak(&v15, buf);
    [v10 setFetchVideoAssetContextCompletionBlock:v14];
    [v10 start];
    [(HUCameraRecordingExportPreviewViewController *)self setVideoDownloadOperation:v10];
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Current clip download progress completion percentage: %lu.", (uint8_t *)&v4, 0xCu);
  }
}

void __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (v4)
  {
    objc_super v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 cameraClip];
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Error: %@ downloading video file for clip: %@. THIS SHOULD NEVER HAPPEN.", (uint8_t *)&v9, 0x16u);
    }
    [v6 _displayFailureToSubmitAlert];
  }
  else
  {
    [WeakRetained _stripAndTruncateRecording];
    [v6 setVideoDownloadOperation:0];
  }
}

- (HUCameraRecordingPlayerView)playerView
{
  playerView = self->_playerView;
  if (!playerView)
  {
    id v4 = (void *)MEMORY[0x1E4F16620];
    uint64_t v5 = [(HUCameraRecordingExportPreviewViewController *)self exportURL];
    uint64_t v6 = [v4 playerItemWithURL:v5];

    id v7 = objc_alloc_init(MEMORY[0x1E4F16670]);
    [(HUCameraRecordingExportPreviewViewController *)self setQueuePlayer:v7];
    id v8 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:v7 templateItem:v6];
    [(HUCameraRecordingExportPreviewViewController *)self setLooper:v8];

    int v9 = [[HUCameraRecordingPlayerView alloc] initWithPlayer:v7 displayingProgressView:1];
    id v10 = [(HUCameraRecordingPlayerView *)v9 layer];
    [v10 setCornerRadius:8.0];

    [(HUCameraRecordingPlayerView *)v9 setClipsToBounds:1];
    [(HUCameraRecordingPlayerView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v11 = self->_playerView;
    self->_playerView = v9;

    playerView = self->_playerView;
  }

  return playerView;
}

- (UILabel)descriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setTextAlignment:1];
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackExplanation", @"HUCameraExportFeedbackExplanation", 1);
    [(UILabel *)v4 setText:v5];

    uint64_t v6 = self->_descriptionLabel;
    self->_descriptionLabel = v4;

    descriptionLabel = self->_descriptionLabel;
  }

  return descriptionLabel;
}

- (UIButton)submitButton
{
  submitButton = self->_submitButton;
  if (!submitButton)
  {
    id v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4 addTarget:self action:sel_submitCurrentClip forControlEvents:64];
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIButton *)v4 setTintColor:v5];

    uint64_t v6 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UIButton *)v4 setBackgroundColor:v6];

    id v7 = [(UIButton *)v4 layer];
    [v7 setCornerRadius:8.0];

    id v8 = _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackSubmitButtonTitle", @"HUCameraExportFeedbackSubmitButtonTitle", 1);
    [(UIButton *)v4 setTitle:v8 forState:0];

    int v9 = self->_submitButton;
    self->_submitButton = v4;

    submitButton = self->_submitButton;
  }

  return submitButton;
}

- (UITextView)learnMoreTextView
{
  v15[1] = *MEMORY[0x1E4F143B8];
  learnMoreTextView = self->_learnMoreTextView;
  if (!learnMoreTextView)
  {
    id v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E4F42F58]);
    [(UITextView *)v4 setEditable:0];
    uint64_t v5 = (void *)MEMORY[0x1E4F28B18];
    uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackConsumerSubheadingText", @"HUCameraExportFeedbackConsumerSubheadingText", 1);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackConsumerSubheadingLinkText", @"HUCameraExportFeedbackConsumerSubheadingLinkText", 1);
    id v8 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F18F92B8];
    uint64_t v14 = *MEMORY[0x1E4F42510];
    int v9 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v15[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    __int16 v11 = objc_msgSend(v5, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v6, v7, v8, v10, 0);
    [(UITextView *)v4 setAttributedText:v11];

    [(UITextView *)v4 setDelegate:self];
    [(UITextView *)v4 setTextAlignment:1];
    [(UITextView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v12 = self->_learnMoreTextView;
    self->_learnMoreTextView = v4;

    learnMoreTextView = self->_learnMoreTextView;
  }

  return learnMoreTextView;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!a6) {
    [(HUCameraRecordingExportPreviewViewController *)self showPrivacyInformation];
  }

  return 0;
}

- (HMCameraClip)cameraClip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraClip);

  return (HMCameraClip *)WeakRetained;
}

- (void)setCameraClip:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraProfile);

  return (HMCameraProfile *)WeakRetained;
}

- (void)setCameraProfile:(id)a3
{
}

- (NSURL)exportURL
{
  return self->_exportURL;
}

- (void)setExportURL:(id)a3
{
}

- (HMCameraClipFetchVideoAssetContextOperation)videoDownloadOperation
{
  return self->_videoDownloadOperation;
}

- (void)setVideoDownloadOperation:(id)a3
{
}

- (BOOL)hasVideoPreview
{
  return self->_hasVideoPreview;
}

- (void)setHasVideoPreview:(BOOL)a3
{
  self->_hasVideoPreview = a3;
}

- (AVQueuePlayer)queuePlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queuePlayer);

  return (AVQueuePlayer *)WeakRetained;
}

- (void)setQueuePlayer:(id)a3
{
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
}

- (void)setPlayerView:(id)a3
{
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void)setSubmitButton:(id)a3
{
}

- (void)setLearnMoreTextView:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)queuePlayerObserver
{
  return self->_queuePlayerObserver;
}

- (void)setQueuePlayerObserver:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
}

- (NSOperationQueue)backgroundSessionQueue
{
  return self->_backgroundSessionQueue;
}

- (void)setBackgroundSessionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong(&self->_queuePlayerObserver, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_learnMoreTextView, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_destroyWeak((id *)&self->_queuePlayer);
  objc_storeStrong((id *)&self->_videoDownloadOperation, 0);
  objc_storeStrong((id *)&self->_exportURL, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);

  objc_destroyWeak((id *)&self->_cameraClip);
}

@end