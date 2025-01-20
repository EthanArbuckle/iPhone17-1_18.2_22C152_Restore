@interface CFXReviewViewController
+ (void)initialize;
- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3;
- (BOOL)mediaCapturedInFunCam;
- (BOOL)mediaCapturedInFunCam_metadata;
- (BOOL)mediaItemRequiresExport;
- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3;
- (CFXEffectBrowserViewController)effectBrowserViewController;
- (CFXMediaItem)mediaItem;
- (CFXPreviewViewController)internalPreviewViewController;
- (CFXReviewControlsViewController)reviewControlsViewController;
- (CFXReviewViewController)initWithMediaItem:(id)a3;
- (CFXReviewViewControllerDelegate)delegate;
- (NSData)adjustmentsData;
- (NSData)animojiMetadata;
- (NSData)animojiMetadata_metadata;
- (NSString)effectBrowserPresentedAppIdentifier;
- (OS_dispatch_group)metadataReaderGroup;
- (UIView)effectsPickerDrawer;
- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5;
- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3;
- (id)preferredDisplayColorSpace;
- (id)preferredExportColorSpace;
- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3;
- (id)selectedAppIdentifierForPreviewViewController:(id)a3;
- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3;
- (int64_t)calculateMediaInterfaceOrientationForDisplay;
- (int64_t)cameraModeUsedForCapture;
- (int64_t)mediaCaptureDevicePosition;
- (int64_t)mediaInterfaceOrientationForDisplay_metadata;
- (void)CFX_resetAndLoadPreviewViewController;
- (void)CFX_updateAnalyticsForSentMediaItem:(id)a3;
- (void)animojiMetadata;
- (void)calculateMediaInterfaceOrientationForDisplay;
- (void)effectBrowserViewController:(id)a3 didDismissPickerForEffectType:(id)a4;
- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7;
- (void)effectBrowserViewController:(id)a3 didPresentPickerForEffectType:(id)a4;
- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4;
- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4;
- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4;
- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5;
- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4;
- (void)exportMediaItemToFileURL:(id)a3;
- (void)loadView;
- (void)mediaCaptureDevicePosition;
- (void)mediaCapturedInFunCam;
- (void)previewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5;
- (void)previewViewController:(id)a3 didProgress:(double)a4 exportingMediaItem:(id)a5;
- (void)previewViewController:(id)a3 didStartExportingMediaItem:(id)a4;
- (void)previewViewControllerDidHideUserInterface:(id)a3;
- (void)previewViewControllerDidShowUserInterface:(id)a3;
- (void)previewViewControllerDidStartEditingText:(id)a3;
- (void)previewViewControllerDidStopEditingText:(id)a3;
- (void)setAnimojiMetadata_metadata:(id)a3;
- (void)setCameraModeUsedForCapture:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectBrowserPresentedAppIdentifier:(id)a3;
- (void)setEffectBrowserViewController:(id)a3;
- (void)setEffectsPickerDrawer:(id)a3;
- (void)setInternalPreviewViewController:(id)a3;
- (void)setMediaCapturedInFunCam_metadata:(BOOL)a3;
- (void)setMediaInterfaceOrientationForDisplay_metadata:(int64_t)a3;
- (void)setMediaItem:(id)a3;
- (void)setMetadataReaderGroup:(id)a3;
- (void)setReviewControlsViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CFXReviewViewController

+ (void)initialize
{
  v7[1] = *MEMORY[0x263EF8340];
  +[CFXApplicationState beginMonitoringApplicationState];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 addSuiteNamed:@"com.apple.MobileSMS"];

  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = *MEMORY[0x263F61328];
  v7[0] = &unk_26E801710;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 registerDefaults:v4];

  +[CFXEffect setupFactoryDelegate];
  v5 = +[CFXMediaSettings sharedInstance];
  +[JFXMediaSettings setProviderDelegate:v5];
}

- (CFXReviewViewController)initWithMediaItem:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CFXReviewViewController;
  id v6 = [(CFXReviewViewController *)&v23 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = +[CFXEffectHostAppDelegate sharedInstance];
    [v7 setColorSpaceDelegate:v6];

    v8 = dispatch_get_global_queue(25, 0);
    dispatch_async(v8, &__block_literal_global);

    objc_storeStrong((id *)v6 + 128, a3);
    dispatch_group_t v9 = dispatch_group_create();
    v10 = (void *)*((void *)v6 + 129);
    *((void *)v6 + 129) = v9;

    *((unsigned char *)v6 + 976) = 0;
    *((void *)v6 + 130) = 0;
    *((void *)v6 + 132) = [v5 cameraMode];
    v11 = [v5 originalAssetURL];
    v12 = [v5 metadataURL];
    uint64_t v13 = [v5 type];
    dispatch_group_enter(*((dispatch_group_t *)v6 + 129));
    v14 = dispatch_get_global_queue(21, 0);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__CFXReviewViewController_initWithMediaItem___block_invoke_2;
    v18[3] = &unk_264C09F80;
    id v19 = v12;
    id v21 = v11;
    uint64_t v22 = v13;
    id v20 = v6;
    id v15 = v11;
    id v16 = v12;
    dispatch_async(v14, v18);
  }
  return (CFXReviewViewController *)v6;
}

uint64_t __45__CFXReviewViewController_initWithMediaItem___block_invoke()
{
  return +[CFXEffect initEffectRegistry];
}

void __45__CFXReviewViewController_initWithMediaItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __45__CFXReviewViewController_initWithMediaItem___block_invoke_3;
    v20[3] = &unk_264C09F58;
    id v21 = *(id *)(a1 + 40);
    +[JFXVideoWriter META_metadataForVideo:v2 completion:v20];
  }
  else
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v4 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 48), 0);
      if (v4)
      {
        id v5 = v4;
        CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
        if (v6)
        {
          uint64_t v7 = *MEMORY[0x263F0F248];
          uint64_t v8 = *MEMORY[0x263F0F218];
          uint64_t v9 = *MEMORY[0x263F0F518];
          uint64_t v10 = *MEMORY[0x263F0F540];
          CFDictionaryRef v11 = v6;
          v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:v7];
          uint64_t v13 = [v12 objectForKeyedSubscript:v8];
          *(unsigned char *)(v3 + 976) = [v13 isEqualToString:@"Generated in Camera Effects"];
          v14 = [(__CFDictionary *)v11 objectForKeyedSubscript:v9];
          id v15 = [v14 objectForKeyedSubscript:v10];

          if (v15
            && ([v14 objectForKeyedSubscript:v10],
                id v16 = objc_claimAutoreleasedReturnValue(),
                int v17 = [v16 unsignedIntValue],
                v16,
                (v17 - 1) <= 7))
          {
            uint64_t v18 = qword_234D60D88[v17 - 1];
          }
          else
          {
            uint64_t v18 = 0;
          }
          *(void *)(v3 + 1040) = v18;
          CFRelease(v11);
        }
        CFRelease(v5);
      }
    }
    id v19 = *(NSObject **)(*(void *)(a1 + 40) + 1032);
    dispatch_group_leave(v19);
  }
}

void __45__CFXReviewViewController_initWithMediaItem___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = !v5;
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = v6;
  *(void *)(*(void *)(a1 + 32) + 1040) = a3;
  uint64_t v7 = [a4 copy];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1048);
  *(void *)(v8 + 1048) = v7;

  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 1032);
  dispatch_group_leave(v10);
}

- (void)loadView
{
  uint64_t v3 = [JFXPassThroughContainerView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  BOOL v5 = -[JFXPassThroughContainerView initWithFrame:](v3, "initWithFrame:");

  [(CFXReviewViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CFXReviewViewController;
  [(CFXReviewViewController *)&v4 viewDidLoad];
  if (!+[JFXOrientationMonitor initialized]) {
    +[JFXOrientationMonitor initializeWithViewController:self];
  }
  [(CFXReviewViewController *)self CFX_resetAndLoadPreviewViewController];
  uint64_t v3 = objc_alloc_init(CFXStageManagerWarningViewController);
  [(UIViewController *)self jfxAddChildViewController:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CFXReviewViewController;
  [(CFXReviewViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CFXReviewViewController;
  [(CFXReviewViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CFXReviewViewController;
  -[CFXReviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = CFXLog_action();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(CFXReviewViewController *)self internalPreviewViewController];
    uint64_t v10 = [v9 previewClip];
    CFDictionaryRef v11 = [v10 effectStack];
    v12 = +[CFXActionLogging actionLogAsJSONForEvent:@"device rotated" atLocation:@"post-capture" withEffectStack:v11];
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  uint64_t v13 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v13 userInterfaceIdiom]) {
    goto LABEL_6;
  }
  v14 = [(CFXReviewViewController *)self view];
  id v15 = [v14 window];

  if (v15)
  {
    uint64_t v13 = [(CFXReviewViewController *)self internalPreviewViewController];
    id v16 = [v13 bottomControlsSnapshot];
    int v17 = [(CFXReviewViewController *)self internalPreviewViewController];
    [v17 bottomControlsCenter];
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [(CFXReviewViewController *)self view];
    objc_super v23 = [v22 subviews];
    uint64_t v24 = [v23 count];
    v25[4] = self;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v26[3] = &unk_264C09FA8;
    v26[4] = self;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v25[3] = &unk_264C09FA8;
    -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v16, v24, 0, v7, v26, v25, v19, v21, width, height);

LABEL_6:
  }
}

void __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) internalPreviewViewController];
  [v1 hideBottomControls];
}

void __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) internalPreviewViewController];
  [v1 showBottomControls];
}

- (NSData)adjustmentsData
{
  objc_super v2 = [(CFXReviewViewController *)self mediaItem];
  objc_super v3 = [v2 adjustmentsData];

  return (NSData *)v3;
}

- (UIView)effectsPickerDrawer
{
  [(CFXReviewViewController *)self loadViewIfNeeded];
  objc_super v3 = [(CFXReviewViewController *)self internalPreviewViewController];
  objc_super v4 = [v3 effectsPickerDrawer];

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4 = a3;
  [(CFXReviewViewController *)self loadViewIfNeeded];
  BOOL v5 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v5 setEffectsPickerDrawer:v4];

  if (!v4)
  {
    char v6 = [(CFXReviewViewController *)self effectBrowserViewController];

    if (v6)
    {
      id v7 = [(CFXReviewViewController *)self effectBrowserViewController];
      [v7 jfxRemoveFromParentViewController];

      [(CFXReviewViewController *)self setEffectBrowserViewController:0];
    }
  }
}

- (BOOL)mediaCapturedInFunCam
{
  objc_super v3 = [(CFXReviewViewController *)self metadataReaderGroup];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  intptr_t v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    char v6 = JFXLog_playback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFXReviewViewController mediaCapturedInFunCam]();
    }
  }
  return [(CFXReviewViewController *)self mediaCapturedInFunCam_metadata];
}

- (int64_t)mediaCaptureDevicePosition
{
  objc_super v3 = [(CFXReviewViewController *)self metadataReaderGroup];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  intptr_t v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    char v6 = JFXLog_playback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFXReviewViewController mediaCaptureDevicePosition]();
    }
  }
  return [(CFXMediaItem *)self->_mediaItem cameraPosition];
}

- (int64_t)calculateMediaInterfaceOrientationForDisplay
{
  objc_super v3 = [(CFXReviewViewController *)self metadataReaderGroup];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  intptr_t v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    char v6 = JFXLog_playback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFXReviewViewController calculateMediaInterfaceOrientationForDisplay]();
    }
  }
  return [(CFXReviewViewController *)self mediaInterfaceOrientationForDisplay_metadata];
}

- (NSData)animojiMetadata
{
  objc_super v3 = [(CFXReviewViewController *)self metadataReaderGroup];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  intptr_t v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    char v6 = JFXLog_playback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFXReviewViewController animojiMetadata]();
    }
  }
  id v7 = [(CFXReviewViewController *)self animojiMetadata_metadata];
  return (NSData *)v7;
}

- (void)exportMediaItemToFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v5 exportMediaItemToFileURL:v4];
}

- (BOOL)mediaItemRequiresExport
{
  objc_super v3 = [(CFXReviewViewController *)self internalPreviewViewController];
  id v4 = [v3 previewClip];

  if ([(CFXReviewViewController *)self mediaCapturedInFunCam])
  {
    BOOL v5 = 1;
  }
  else
  {
    char v6 = [v4 effectStack];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (void)effectBrowserViewController:(id)a3 didDismissPickerForEffectType:(id)a4
{
  if (objc_msgSend(a4, "jtEffectType", a3) == 1)
  {
    id v5 = [(CFXReviewViewController *)self internalPreviewViewController];
    [v5 setPresentingFilterPicker:0];
  }
}

- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v13 = a4;
  id v14 = [(CFXReviewViewController *)self internalPreviewViewController];
  objc_msgSend(v14, "addOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:completion:", v13, 0, x, y, width, height, a7);
}

- (void)effectBrowserViewController:(id)a3 didPresentPickerForEffectType:(id)a4
{
  if (objc_msgSend(a4, "jtEffectType", a3) == 1)
  {
    id v5 = [(CFXReviewViewController *)self internalPreviewViewController];
    [v5 setPresentingFilterPicker:1];
  }
}

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  id v9 = a4;
  char v6 = +[CFXAnalyticsManager sharedInstance];
  id v7 = v6;
  if (a4)
  {
    [v6 startTrackingPickerWithIdentifier:v9];
  }
  else
  {
    uint64_t v8 = [(CFXReviewViewController *)self effectBrowserPresentedAppIdentifier];
    [v7 stopTrackingPickerWithIdentifier:v8];
  }
  [(CFXReviewViewController *)self setEffectBrowserPresentedAppIdentifier:v9];
}

- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4
{
  id v5 = a4;
  char v6 = [(CFXReviewViewController *)self internalPreviewViewController];
  id v7 = [v6 previewClip];
  [v7 removeAllEffectsOfType:7];

  uint64_t v8 = [(CFXReviewViewController *)self internalPreviewViewController];
  id v9 = [v8 previewPlayer];
  [v9 updateCompositionForEffectChange];

  uint64_t v10 = [v5 identifier];

  LODWORD(v9) = [v10 isEqualToString:@"Animoji"];
  if (v9)
  {
    id v11 = +[CFXAnalyticsManager sharedInstance];
    [v11 didSelectEffectOfType:@"Animoji" effectIsNone:1];
  }
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v5 = a4;
  char v6 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v6 addEffect:v5 completion:0];

  id v7 = [v5 jtEffect];
  int v8 = [v7 type];

  id v9 = @"Filter";
  if (v8 != 1) {
    id v9 = 0;
  }
  uint64_t v10 = v9;
  id v12 = +[CFXAnalyticsManager sharedInstance];
  uint64_t v11 = [v5 isNone];

  [v12 didSelectEffectOfType:v10 effectIsNone:v11];
}

- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3
{
  objc_super v3 = [(CFXReviewViewController *)self internalPreviewViewController];
  id v4 = [v3 previewClip];
  id v5 = [v4 effectsOfType:1];
  char v6 = [v5 firstObject];

  id v7 = [v6 effectID];

  return v7;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  objc_super v3 = [(CFXReviewViewController *)self internalPreviewViewController];
  id v4 = [v3 previewClip];
  id v5 = [v4 effectsOfType:7];
  char v6 = [v5 firstObject];

  id v7 = [v6 effectID];

  return v7;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  id v5 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v5 updateUIForDockMagnify:a4 > 50.0 dockHeightDelta:a4 + -44.0];
}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  if ([(CFXReviewViewController *)self mediaCapturedInFunCam])
  {
    id v4 = [(CFXReviewViewController *)self mediaItem];
    uint64_t v5 = [v4 metadataURL];
    if (v5)
    {
      char v6 = (void *)v5;
      id v7 = [MEMORY[0x263F1C5C0] currentDevice];
      char v8 = objc_msgSend(v7, "jfx_hasTrueDepthFrontCamera");

      if (v8)
      {
        id v9 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = [MEMORY[0x263F086E0] jfxBundle];
  id v9 = [v10 localizedStringForKey:@"HIDE_MEMOJI_NON_FUN_CAM_MEDIA_ITEM_DIPLAY Name" value:&stru_26E7CDB50 table:0];

LABEL_7:
  return v9;
}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  return v4;
}

- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  BOOL v4 = [v3 userInterfaceIdiom] == 0;

  return v4;
}

- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = [(CFXReviewViewController *)self internalPreviewViewController];
  objc_msgSend(v9, "filterPickerPreviewBackgroundImageAtSizeInPixels:completion:", v8, width, height);
}

- (void)previewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  [(CFXReviewViewController *)self setMediaItem:v13];
  [(CFXReviewViewController *)self CFX_updateAnalyticsForSentMediaItem:v13];
  uint64_t v8 = [(CFXReviewViewController *)self delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(CFXReviewViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(CFXReviewViewController *)self delegate];
      [v12 reviewViewController:self didFinishExportingMediaItem:v13 withError:v7];
    }
  }
}

- (void)previewViewController:(id)a3 didProgress:(double)a4 exportingMediaItem:(id)a5
{
  id v12 = a5;
  uint64_t v7 = [(CFXReviewViewController *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(CFXReviewViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(CFXReviewViewController *)self delegate];
      [v11 reviewViewController:self didProgress:v12 exportingMediaItem:a4];
    }
  }
}

- (void)previewViewController:(id)a3 didStartExportingMediaItem:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [(CFXReviewViewController *)self delegate];
  if (v5)
  {
    char v6 = (void *)v5;
    uint64_t v7 = [(CFXReviewViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(CFXReviewViewController *)self delegate];
      [v9 reviewViewController:self didStartExportingMediaItem:v10];
    }
  }
}

- (void)previewViewControllerDidHideUserInterface:(id)a3
{
  uint64_t v4 = [(CFXReviewViewController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    char v6 = [(CFXReviewViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXReviewViewController *)self delegate];
      [v8 reviewViewControllerDidHideUserInterface:self];
    }
  }
}

- (void)previewViewControllerDidShowUserInterface:(id)a3
{
  uint64_t v4 = [(CFXReviewViewController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    char v6 = [(CFXReviewViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXReviewViewController *)self delegate];
      [v8 reviewViewControllerDidShowUserInterface:self];
    }
  }
}

- (void)previewViewControllerDidStartEditingText:(id)a3
{
  uint64_t v4 = [(CFXReviewViewController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    char v6 = [(CFXReviewViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXReviewViewController *)self delegate];
      [v8 reviewViewControllerDidHideUserInterface:self];
    }
  }
}

- (void)previewViewControllerDidStopEditingText:(id)a3
{
  uint64_t v4 = [(CFXReviewViewController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    char v6 = [(CFXReviewViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXReviewViewController *)self delegate];
      [v8 reviewViewControllerDidShowUserInterface:self];
    }
  }
}

- (id)selectedAppIdentifierForPreviewViewController:(id)a3
{
  objc_super v3 = [(CFXReviewViewController *)self effectBrowserViewController];
  uint64_t v4 = [v3 selectedAppIdentifier];

  return v4;
}

- (id)preferredDisplayColorSpace
{
  objc_super v2 = [(CFXReviewViewController *)self mediaItem];
  objc_super v3 = [v2 clip];
  uint64_t v4 = [v3 mediaItem];

  uint64_t v5 = [v4 colorSpace];

  return v5;
}

- (id)preferredExportColorSpace
{
  objc_super v3 = [(CFXReviewViewController *)self mediaItem];
  uint64_t v4 = [v3 clip];
  uint64_t v5 = [v4 mediaItem];

  if ([v5 mediaType] == 2)
  {
    char v6 = [(CFXReviewViewController *)self preferredDisplayColorSpace];
  }
  else
  {
    char v7 = [v5 colorSpace];
    char v6 = objc_msgSend(v7, "jfx_videoExportColorSpace");
  }
  return v6;
}

- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  memset(&v6, 0, sizeof(v6));
  objc_msgSend(MEMORY[0x263F5E478], "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return CGRectGetHeight(v6);
}

- (void)CFX_resetAndLoadPreviewViewController
{
  v45[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [(CFXReviewViewController *)self internalPreviewViewController];

  if (v3)
  {
    uint64_t v4 = [(CFXReviewViewController *)self internalPreviewViewController];
    [v4 jfxRemoveFromParentViewController];

    uint64_t v5 = [(CFXReviewViewController *)self effectBrowserViewController];
    [v5 jfxRemoveFromParentViewController];
  }
  CGRect v6 = (void *)MEMORY[0x263F1C9E8];
  long long v7 = [MEMORY[0x263F086E0] jfxBundle];
  long long v8 = [v6 storyboardWithName:@"CFXPreviewView" bundle:v7];
  long long v9 = [v8 instantiateViewControllerWithIdentifier:@"CFXPreviewViewController"];
  [(CFXReviewViewController *)self setInternalPreviewViewController:v9];

  long long v10 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v10 setDelegate:self];

  char v11 = [(CFXReviewViewController *)self mediaItem];
  id v12 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v12 setMediaItem:v11];

  BOOL v13 = [(CFXReviewViewController *)self mediaCaptureDevicePosition] == 1;
  id v14 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v14 setCapturedWithBackCamera:v13];

  id v15 = [(CFXReviewViewController *)self internalPreviewViewController];
  [v15 loadViewIfNeeded];

  id v16 = [(CFXReviewViewController *)self internalPreviewViewController];
  int v17 = [v16 previewControls];

  [v17 view];
  v43 = v42 = v17;
  double v18 = [v17 controlsContainerView];
  double v19 = [(CFXReviewViewController *)self internalPreviewViewController];
  v44 = [v19 effectBrowserContentPresenterViewController];

  double v20 = [[CFXEffectBrowserViewController alloc] initWithDelegate:self contentPresenter:v44];
  [(CFXReviewViewController *)self setEffectBrowserViewController:v20];

  double v21 = [(CFXReviewViewController *)self effectBrowserViewController];
  [v21 setContentPresenterDelegate:v44];

  [v44 setDelegate:self];
  uint64_t v22 = [(CFXReviewViewController *)self effectBrowserViewController];
  objc_super v23 = [v22 view];

  uint64_t v24 = [(CFXReviewViewController *)self effectBrowserViewController];
  [v17 addChildViewController:v24];

  [v43 addSubview:v23];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = (void *)MEMORY[0x263F08938];
  v41 = [v23 leadingAnchor];
  v39 = [v18 leadingAnchor];
  v38 = [v41 constraintEqualToAnchor:v39];
  v45[0] = v38;
  v37 = [v23 trailingAnchor];
  v36 = [v18 trailingAnchor];
  v25 = [v37 constraintEqualToAnchor:v36];
  v45[1] = v25;
  v26 = [v23 topAnchor];
  v40 = v18;
  objc_super v27 = [v18 topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v45[2] = v28;
  v29 = [v23 bottomAnchor];
  uint64_t v30 = [v18 bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v45[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
  [v35 activateConstraints:v32];

  v33 = [(CFXReviewViewController *)self effectBrowserViewController];
  [v33 didMoveToParentViewController:v42];

  v34 = [(CFXReviewViewController *)self internalPreviewViewController];
  [(UIViewController *)self jfxAddChildViewController:v34 constrainRelativeToSafeAreas:0];
}

- (void)CFX_updateAnalyticsForSentMediaItem:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x264C08000;
  if (!a3) {
    goto LABEL_32;
  }
  [a3 clip];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v46 = long long v59 = 0u;
  uint64_t v4 = [v46 effectStack];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (!v5)
  {
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    char v53 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  char v53 = 0;
  uint64_t v7 = *(void *)v57;
  uint64_t v47 = *MEMORY[0x263F61538];
  v48 = v4;
  unint64_t v8 = 0x264C08000uLL;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v57 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v10 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      int v11 = [v10 type];
      switch(v11)
      {
        case 7:
          char v53 = 1;
          continue;
        case 2:
          id v12 = [v10 effectID];
          BOOL v13 = *(void **)(v8 + 2920);
          +[CFXEffectType effectTypeWithIdentifier:@"Text"];
          id v15 = v14 = v8;
          id v16 = [v13 effectIdentifiersForEffectType:v15];
          int v17 = [v16 containsObject:v12];

          if (v17)
          {
            ++v54;
            goto LABEL_16;
          }
          double v18 = *(void **)(v14 + 2920);
          double v19 = +[CFXEffectType effectTypeWithIdentifier:@"Shapes"];
          double v20 = [v18 effectIdentifiersForEffectType:v19];
          int v21 = [v20 containsObject:v12];

          if (v21)
          {
            ++v51;
LABEL_16:
            unint64_t v8 = v14;
          }
          else
          {
            uint64_t v22 = *(void **)(v14 + 2920);
            objc_super v23 = +[CFXEffectType effectTypeWithIdentifier:@"EmojiStickers"];
            uint64_t v24 = [v22 effectIdentifiersForEffectType:v23];
            int v25 = [v24 containsObject:v12];

            if (v25) {
              ++v49;
            }
            else {
              v50 += [v12 isEqualToString:v47];
            }
            unint64_t v8 = v14;
            uint64_t v4 = v48;
          }

          continue;
        case 1:
          ++v55;
          break;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v6);
LABEL_26:

  uint64_t v26 = [v46 isVideo];
  objc_super v27 = [(CFXReviewViewController *)self internalPreviewViewController];
  unsigned int v52 = [v27 capturedWithBackCamera] ^ 1;

  v28 = +[CFXEffectHostAppDelegate sharedInstance];
  v29 = [v28 preferredExportColorSpace];

  uint64_t v30 = +[CFXEffectHostAppDelegate sharedInstance];
  v31 = [v30 preferredDisplayColorSpace];

  unint64_t v3 = 0x264C08000uLL;
  if ([v29 isHDRSpace]) {
    char v32 = [v31 isHDRSpace];
  }
  else {
    char v32 = 0;
  }
  v33 = [v46 mediaItem];
  v34 = [v33 colorSpace];
  char v35 = [v34 isHDRSpace];
  v36 = +[CFXAnalyticsManager sharedInstance];
  BYTE1(v44) = v35;
  LOBYTE(v44) = v32;
  objc_msgSend(v36, "trackMediaSentWithAnimoji:video:frontCamera:filterCount:labelCount:messagesStickerCount:shapeCount:emojiStickerCount:supportsHDR:isHDR:", v53 & 1, v26, v52, v55, v54, v50, v51, v49, v44);

  if (v26)
  {
    double v37 = (double)(int)[v46 duration];
    v38 = +[CFXMediaSettings sharedInstance];
    double v39 = v37 / (double)(int)[v38 frameRate];

    v40 = +[CFXAnalyticsManager sharedInstance];
    [v40 trackEventWithName:@"videoduration" duration:v39];
  }
LABEL_32:
  v41 = [*(id *)(v3 + 2808) sharedInstance];
  [v41 stopTrackingTimeIntervalEventWithName:@"activebackcameratime"];

  v42 = [*(id *)(v3 + 2808) sharedInstance];
  [v42 stopTrackingTimeIntervalEventWithName:@"activefrontcameratime"];

  v43 = [*(id *)(v3 + 2808) sharedInstance];
  [v43 stopTrackingTimeIntervalEventWithName:@"activetime"];
}

- (CFXReviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXReviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CFXEffectBrowserViewController)effectBrowserViewController
{
  return self->_effectBrowserViewController;
}

- (void)setEffectBrowserViewController:(id)a3
{
}

- (CFXPreviewViewController)internalPreviewViewController
{
  return self->_internalPreviewViewController;
}

- (void)setInternalPreviewViewController:(id)a3
{
}

- (CFXReviewControlsViewController)reviewControlsViewController
{
  return self->_reviewControlsViewController;
}

- (void)setReviewControlsViewController:(id)a3
{
}

- (NSString)effectBrowserPresentedAppIdentifier
{
  return self->_effectBrowserPresentedAppIdentifier;
}

- (void)setEffectBrowserPresentedAppIdentifier:(id)a3
{
}

- (CFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (OS_dispatch_group)metadataReaderGroup
{
  return self->_metadataReaderGroup;
}

- (void)setMetadataReaderGroup:(id)a3
{
}

- (BOOL)mediaCapturedInFunCam_metadata
{
  return self->_mediaCapturedInFunCam_metadata;
}

- (void)setMediaCapturedInFunCam_metadata:(BOOL)a3
{
  self->_mediaCapturedInFunCam_metadata = a3;
}

- (int64_t)mediaInterfaceOrientationForDisplay_metadata
{
  return self->_mediaInterfaceOrientationForDisplay_metadata;
}

- (void)setMediaInterfaceOrientationForDisplay_metadata:(int64_t)a3
{
  self->_mediaInterfaceOrientationForDisplay_metadata = a3;
}

- (NSData)animojiMetadata_metadata
{
  return self->_animojiMetadata_metadata;
}

- (void)setAnimojiMetadata_metadata:(id)a3
{
}

- (int64_t)cameraModeUsedForCapture
{
  return self->_cameraModeUsedForCapture;
}

- (void)setCameraModeUsedForCapture:(int64_t)a3
{
  self->_cameraModeUsedForCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiMetadata_metadata, 0);
  objc_storeStrong((id *)&self->_metadataReaderGroup, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_reviewControlsViewController, 0);
  objc_storeStrong((id *)&self->_internalPreviewViewController, 0);
  objc_storeStrong((id *)&self->_effectBrowserViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)mediaCapturedInFunCam
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "ERROR: failed to determine media item captured location", v2, v3, v4, v5, v6);
}

- (void)mediaCaptureDevicePosition
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "ERROR: failed to read capture device position", v2, v3, v4, v5, v6);
}

- (void)calculateMediaInterfaceOrientationForDisplay
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "ERROR: failed to read capture interface orientation", v2, v3, v4, v5, v6);
}

- (void)animojiMetadata
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "ERROR: failed to animoji metadata", v2, v3, v4, v5, v6);
}

@end