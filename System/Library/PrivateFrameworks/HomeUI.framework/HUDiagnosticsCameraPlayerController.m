@interface HUDiagnosticsCameraPlayerController
- (AVPlayerViewController)cameraPlayerViewController;
- (HFCameraPlaybackEngine)playbackEngine;
- (HMCameraProfile)cameraProfile;
- (HUClipScrubberDataSource)clipScrubberDataSource;
- (HUDiagnosticsCameraPlayerController)initWithCameraPlayerViewController:(id)a3 playbackEngine:(id)a4 clipScrubberDataSource:(id)a5 cameraProfile:(id)a6;
- (HUDiagnosticsCameraTimelineView)diagnosticsView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)dismissDetailsViewController;
- (void)dismissDiagnosticDetails;
- (void)displayDiagnosticDetails;
- (void)launchPlaybackEngineDiagnosticsView;
- (void)setCameraPlayerViewController:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setClipScrubberDataSource:(id)a3;
- (void)setDiagnosticsView:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)updateWithPlaybackEngine:(id)a3;
@end

@implementation HUDiagnosticsCameraPlayerController

- (HUDiagnosticsCameraPlayerController)initWithCameraPlayerViewController:(id)a3 playbackEngine:(id)a4 clipScrubberDataSource:(id)a5 cameraProfile:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HUDiagnosticsCameraPlayerController;
  v14 = [(HUDiagnosticsCameraPlayerController *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_cameraPlayerViewController, v10);
    objc_storeWeak((id *)&v15->_playbackEngine, v11);
    objc_storeWeak((id *)&v15->_clipScrubberDataSource, v12);
    objc_storeStrong((id *)&v15->_cameraProfile, a6);
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F428F8]) initWithDelegate:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_cameraPlayerViewController);
    v18 = [WeakRetained view];
    [v18 addInteraction:v16];
  }
  return v15;
}

- (void)updateWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDiagnosticsCameraPlayerController *)self diagnosticsView];
  [v5 updateWithPlaybackEngine:v4];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E4F428F0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E638AD00;
  objc_copyWeak(&v10, &location);
  v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F426E8];
  id v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"house.fill"];
  v6 = [v4 actionWithTitle:@"Home Settings" image:v5 identifier:0 handler:&__block_literal_global_114];

  v7 = (void *)MEMORY[0x1E4F426E8];
  v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"house"];
  v9 = [v7 actionWithTitle:@"HomeKit Settings" image:v8 identifier:0 handler:&__block_literal_global_23_1];

  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = [WeakRetained diagnosticsView];
  id v13 = @"Hide Inspector";
  if (!v12) {
    id v13 = @"Show Inspector";
  }
  v14 = v13;

  v15 = [WeakRetained diagnosticsView];
  v16 = @"magnifyingglass.circle.fill";
  if (!v15) {
    v16 = @"magnifyingglass.circle";
  }
  v17 = v16;

  v18 = (void *)MEMORY[0x1E4F426E8];
  v19 = [MEMORY[0x1E4F42A80] systemImageNamed:v17];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
  v25[3] = &unk_1E638ACD8;
  objc_copyWeak(&v26, v10);
  objc_super v20 = [v18 actionWithTitle:v14 image:v19 identifier:0 handler:v25];

  v21 = (void *)MEMORY[0x1E4F42B80];
  v27[0] = v20;
  v27[1] = v6;
  v27[2] = v9;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v23 = [v21 menuWithTitle:&stru_1F18F92B8 children:v22];

  objc_destroyWeak(&v26);

  return v23;
}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Home"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F69378] sharedInstance];
  id v1 = (id)[v0 openURL:v2];
}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=HomeKit"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F69378] sharedInstance];
  id v1 = (id)[v0 openURL:v2];
}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained diagnosticsView];

  if (v1)
  {
    id v2 = [WeakRetained diagnosticsView];
    [v2 removeFromSuperview];

    [WeakRetained setDiagnosticsView:0];
  }
  else
  {
    [WeakRetained launchPlaybackEngineDiagnosticsView];
  }
}

- (void)launchPlaybackEngineDiagnosticsView
{
  id v3 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  id v4 = [v3 view];
  [v4 bounds];
  double v6 = v5 + -330.0;
  v7 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  v8 = [v7 view];
  [v8 bounds];
  double v10 = v9;

  id v11 = -[HUDiagnosticsCameraTimelineView initWithFrame:]([HUDiagnosticsCameraTimelineView alloc], "initWithFrame:", 0.0, v6, v10, 160.0);
  [(HUDiagnosticsCameraPlayerController *)self setDiagnosticsView:v11];

  id v12 = [(HUDiagnosticsCameraPlayerController *)self diagnosticsView];
  [v12 setOverrideUserInterfaceStyle:2];

  id v13 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  v14 = [v13 customControlsView];
  v15 = [(HUDiagnosticsCameraPlayerController *)self diagnosticsView];
  [v14 addSubview:v15];

  v16 = [(HUDiagnosticsCameraPlayerController *)self diagnosticsView];
  v17 = [v16 moreButton];
  [v17 addTarget:self action:sel_displayDiagnosticDetails forControlEvents:64];

  id v19 = [(HUDiagnosticsCameraPlayerController *)self diagnosticsView];
  v18 = [(HUDiagnosticsCameraPlayerController *)self playbackEngine];
  [v19 updateWithPlaybackEngine:v18];
}

- (void)displayDiagnosticDetails
{
  id v3 = [(HUDiagnosticsCameraPlayerController *)self clipScrubberDataSource];
  id v4 = [v3 currentEvent];
  uint64_t v5 = [v4 containerType];

  if (v5 == 1)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [(HUDiagnosticsCameraPlayerController *)self clipScrubberDataSource];
    id v8 = [v7 currentEvent];
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        double v9 = v8;
      }
      else {
        double v9 = 0;
      }
      id v29 = v8;
      if (v9) {
        goto LABEL_9;
      }
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
    id v29 = 0;
LABEL_9:

    id v12 = [HUDiagnosticsCameraClipViewController alloc];
    id v13 = [(HUDiagnosticsCameraPlayerController *)self cameraProfile];
    uint64_t v14 = [(HUDiagnosticsCameraClipViewController *)v12 initWithRecordingEvent:v29 cameraProfile:v13];
    goto LABEL_18;
  }
  uint64_t v15 = objc_opt_class();
  v16 = [(HUDiagnosticsCameraPlayerController *)self clipScrubberDataSource];
  id v17 = [v16 currentEvent];
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v29 = v17;
    if (v18) {
      goto LABEL_17;
    }
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];
  }
  id v29 = 0;
LABEL_17:

  v21 = [HUDiagnosticsReachabilityEventViewController alloc];
  id v13 = [(HUDiagnosticsCameraPlayerController *)self cameraProfile];
  uint64_t v14 = [(HUDiagnosticsReachabilityEventViewController *)v21 initWithReachabilityEvent:v29 cameraProfile:v13];
LABEL_18:
  v22 = (void *)v14;

  id v23 = objc_alloc(MEMORY[0x1E4F427C0]);
  v24 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
  v25 = (void *)[v23 initWithTitle:v24 style:2 target:self action:sel_dismissDiagnosticDetails];
  id v26 = [v22 navigationItem];
  [v26 setLeftBarButtonItem:v25];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v22];
  v28 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  [v28 presentViewController:v27 animated:1 completion:0];
}

- (void)dismissDiagnosticDetails
{
  id v2 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)dismissDetailsViewController
{
  id v2 = [(HUDiagnosticsCameraPlayerController *)self cameraPlayerViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (AVPlayerViewController)cameraPlayerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraPlayerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)setCameraPlayerViewController:(id)a3
{
}

- (HUDiagnosticsCameraTimelineView)diagnosticsView
{
  return self->_diagnosticsView;
}

- (void)setDiagnosticsView:(id)a3
{
}

- (HUClipScrubberDataSource)clipScrubberDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipScrubberDataSource);

  return (HUClipScrubberDataSource *)WeakRetained;
}

- (void)setClipScrubberDataSource:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_clipScrubberDataSource);
  objc_storeStrong((id *)&self->_diagnosticsView, 0);

  objc_destroyWeak((id *)&self->_cameraPlayerViewController);
}

@end