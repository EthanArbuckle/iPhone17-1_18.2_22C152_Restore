@interface HUDashboardCameraItemModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (HUCameraController)cameraController;
- (HUDashboardCameraItemModuleController)initWithModule:(id)a3 cameraPresentationStyle:(int64_t)a4;
- (NSMapTable)mapTable;
- (id)_cameraItemFor:(id)a3;
- (id)_cellLayoutOptions;
- (id)_detailsViewControllerForCameraItem:(id)a3;
- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3;
- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5;
- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6;
- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 withConfiguration:(id)a4;
- (id)_sourceViewForPresentingCameraItem:(id)a3;
- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5;
- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6;
- (id)presentFeedbackFlowForCameraClip:(id)a3 fromProfile:(id)a4;
- (id)presentItem:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5;
- (id)targetViewForDismissingCameraProfile:(id)a3;
- (int64_t)cameraPresentationStyle;
- (unint64_t)didSelectItem:(id)a3;
- (void)_logInteractionEventOfType:(unint64_t)a3 withItem:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didDismissCameraController:(id)a3 forProfile:(id)a4;
- (void)disableCameraSnapshotsForCells:(id)a3;
- (void)enableCameraSnapshotsForCells:(id)a3;
- (void)setCameraController:(id)a3;
- (void)setCameraPresentationStyle:(int64_t)a3;
- (void)setMapTable:(id)a3;
@end

@implementation HUDashboardCameraItemModuleController

- (void)enableCameraSnapshotsForCells:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          v12 = [v11 item];
          v13 = [v12 profile];
          v14 = objc_msgSend(v13, "hf_cameraManager");
          [v14 beginPeriodicSnapshotsWithRequester:v11];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUDashboardCameraItemModuleController;
  id v7 = a4;
  [(HUItemModuleController *)&v17 configureCell:v6 forItem:v7];
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (!v9) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v9;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class(), v17.receiver, v17.super_class file lineNumber description];

LABEL_7:
    id v11 = 0;
  }

  v14 = [MEMORY[0x1E4F42B58] cellConfiguration];
  [v11 setContentConfiguration:v14];
  long long v15 = [(HUDashboardCameraItemModuleController *)self _cellLayoutOptions];
  [v11 setLayoutOptions:v15];

  [v11 setNeedsUpdateConfiguration];
  long long v16 = [(HUDashboardCameraItemModuleController *)self mapTable];
  [v16 setObject:v11 forKey:v7];
}

- (NSMapTable)mapTable
{
  mapTable = self->_mapTable;
  if (!mapTable)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    uint64_t v5 = self->_mapTable;
    self->_mapTable = v4;

    mapTable = self->_mapTable;
  }

  return mapTable;
}

- (id)_cellLayoutOptions
{
  id v3 = [(HUItemModuleController *)self host];
  uint64_t v4 = [v3 presentingViewControllerForModuleController:self];

  uint64_t v5 = [v4 view];
  [v5 frame];
  unint64_t v8 = HUViewSizeSubclassForViewSize(v6, v7);

  if (v8 > 0xA) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = qword_1BEA199F8[v8];
  }
  v10 = +[HUMosaicCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:v9 viewSizeSubclass:v8];
  objc_msgSend(v10, "setIsMosaicCell:", -[HUDashboardCameraItemModuleController cameraPresentationStyle](self, "cameraPresentationStyle") == 1);

  return v10;
}

- (int64_t)cameraPresentationStyle
{
  return self->_cameraPresentationStyle;
}

- (HUDashboardCameraItemModuleController)initWithModule:(id)a3 cameraPresentationStyle:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUDashboardCameraItemModuleController;
  result = [(HUItemModuleController *)&v6 initWithModule:a3];
  if (result) {
    result->_cameraPresentationStyle = a4;
  }
  return result;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    objc_super v6 = v5;
  }
  else {
    objc_super v6 = 0;
  }
  id v7 = v6;

  [(HUDashboardCameraItemModuleController *)self _logInteractionEventOfType:1 withItem:v5];
  id v8 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v7];

  return 0;
}

- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  v12 = [(HUDashboardCameraItemModuleController *)self _cameraItemFor:a3];
  if (v12)
  {
    v13 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v12 startDate:v10 endDate:v11 animated:v6];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F7A0D8];
    long long v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    v13 = [v14 futureWithError:v15];
  }

  return v13;
}

- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(HUDashboardCameraItemModuleController *)self _cameraItemFor:a3];
  if (v9)
  {
    id v10 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v9 cameraClip:v8 animated:v5];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v10 = [v11 futureWithError:v12];
  }

  return v10;
}

- (id)_cameraItemFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUItemModuleController *)self module];
  BOOL v6 = [v5 matchingItemForHomeKitObject:v4];

  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v8;
    if (v9) {
      goto LABEL_8;
    }
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [HUCameraPlayerConfiguration alloc];
  id v11 = [(HUItemModuleController *)self module];
  v12 = [v11 home];
  v13 = [v9 profile];
  v14 = [(HUCameraPlayerConfiguration *)v10 initWithHome:v12 cameraProfile:v13 notificationUUID:0 clipUUID:0];

  [(HUCameraPlayerConfiguration *)v14 setStartingPlaybackDate:v8];
  long long v15 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v9 withConfiguration:v14];

  return v15;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [HUCameraPlayerConfiguration alloc];
  id v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 home];
  v12 = [v8 profile];
  v13 = [v7 uniqueIdentifier];

  v14 = [(HUCameraPlayerConfiguration *)v9 initWithHome:v11 cameraProfile:v12 notificationUUID:0 clipUUID:v13];
  long long v15 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v8 withConfiguration:v14];

  return v15;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [HUCameraPlayerConfiguration alloc];
  BOOL v6 = [(HUItemModuleController *)self module];
  id v7 = [v6 home];
  id v8 = [v4 profile];
  id v9 = [(HUCameraPlayerConfiguration *)v5 initWithHome:v7 cameraProfile:v8 notificationUUID:0 clipUUID:0];

  id v10 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v4 withConfiguration:v9];

  return v10;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HUCameraController alloc] initWithConfiguration:v6 cameraDelegate:self];

  [(HUDashboardCameraItemModuleController *)self setCameraController:v8];
  id v9 = [(HUDashboardCameraItemModuleController *)self _sourceViewForPresentingCameraItem:v7];

  id v10 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke;
  v14[3] = &unk_1E6385D90;
  v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  v12 = [v10 futureWithBlock:v14];

  return v12;
}

void __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cameraController];
  BOOL v5 = [v4 playerViewController];
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke_2;
  v8[3] = &unk_1E6386018;
  id v9 = v3;
  id v7 = v3;
  [v5 showFullScreenPresentationFromView:v6 completion:v8];
}

uint64_t __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (id)presentFeedbackFlowForCameraClip:(id)a3 fromProfile:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Present dashboard-launched feedback flow for clip:%@ cameraProfile:%@", buf, 0x16u);
  }

  id v9 = [(HUItemModuleController *)self host];
  id v10 = [v9 presentingViewControllerForModuleController:self];

  id v11 = v10;
  v12 = &unk_1F19C09F0;
  if ([v11 conformsToProtocol:v12]) {
    v13 = v11;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  id v15 = objc_msgSend(v14, "hu_preloadContent");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke;
  v21[3] = &unk_1E63863B8;
  id v22 = v6;
  id v23 = v7;
  id v24 = v11;
  id v16 = v11;
  id v17 = v7;
  id v18 = v6;
  v19 = [v15 flatMap:v21];

  return v19;
}

id __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_2;
  v5[3] = &unk_1E6386390;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v3 = [v2 futureWithBlock:v5];

  return v3;
}

void __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F68FF8] videoDestinationURLForCameraClip:a1[4]];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Preparing file for export at path:%@.", buf, 0xCu);
  }

  id v4 = [HUCameraRecordingExportPreviewViewController alloc];
  id v5 = a1[4];
  id v6 = a1[5];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_130;
  v21[3] = &unk_1E6386368;
  id v22 = a1[6];
  id v23 = a1[4];
  id v24 = a1[5];
  id v7 = [(HUCameraRecordingExportPreviewViewController *)v4 initWithCameraClip:v5 cameraProfile:v6 completionHandler:v21];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v7];
  id v9 = [a1[6] view];
  id v10 = [v8 popoverPresentationController];
  [v10 setSourceView:v9];

  id v11 = [a1[6] view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v8 popoverPresentationController];
  objc_msgSend(v20, "setSourceRect:", v13, v15, v17, v19);

  [a1[6] presentViewController:v8 animated:1 completion:0];
}

void __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_130(id *a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_2_131;
    block[3] = &unk_1E6386340;
    id v4 = a1[4];
    id v5 = a1[5];
    id v6 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_2_131(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  if ([*(id *)(a1 + 40) isDonated])
  {
    _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackAlreadySubmittedTitle", @"HUCameraFeedbackAlreadySubmittedTitle", 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v2 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackAlreadySubmittedMessage", @"HUCameraFeedbackAlreadySubmittedMessage", 1);
    id v3 = objc_msgSend(MEMORY[0x1E4F42728], "hu_alertControllerForAcknowledgementWithTitle:message:", v7, v2);
    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F68F70];
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_3;
    v8[3] = &unk_1E6385A20;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    [v4 donateNotificationCenterCameraClip:v9 forCameraProfile:v6 completion:v8];
  }
}

void __86__HUDashboardCameraItemModuleController_presentFeedbackFlowForCameraClip_fromProfile___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error donating clip:%@. %@", (uint8_t *)&v10, 0x16u);
    }
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackFailureToSubmitTitle", @"HUCameraFeedbackFailureToSubmitTitle", 1);
    uint64_t v6 = @"HUCameraFeedbackFailureToSubmitMessage";
  }
  else
  {
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackSubmittedTitle", @"HUCameraFeedbackSubmittedTitle", 1);
    uint64_t v6 = @"HUCameraFeedbackSubmittedMessage";
  }
  id v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  id v8 = objc_msgSend(MEMORY[0x1E4F42728], "hu_alertControllerForAcknowledgementWithTitle:message:", v5, v7);
  [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
}

- (id)presentItem:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [(HUDashboardCameraItemModuleController *)self _presentCameraPlayerViewControllerForCameraItem:v10];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__HUDashboardCameraItemModuleController_presentItem_destination_animated___block_invoke;
    v16[3] = &unk_1E63863E0;
    v16[4] = self;
    v16[5] = a4;
    __int16 v12 = [v11 flatMap:v16];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    __int16 v12 = [v13 futureWithError:v14];
  }

  return v12;
}

id __74__HUDashboardCameraItemModuleController_presentItem_destination_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == 1)
  {
    v2 = [*(id *)(a1 + 32) cameraController];
    id v3 = [v2 presentSettingsViewController];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:a2];
  }

  return v3;
}

- (id)_sourceViewForPresentingCameraItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(HUDashboardCameraItemModuleController *)self mapTable];
  uint64_t v6 = [v5 objectForKey:v4];

  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 cameraContentView];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_detailsViewControllerForCameraItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 profile];

  if (v4)
  {
    id v5 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v3];
  }
  else
  {
    uint64_t v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Camera profile must not be nil to show the editor.", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)_logInteractionEventOfType:(unint64_t)a3 withItem:(id)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F68EE0];
  v16[0] = *MEMORY[0x1E4F681A8];
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = [v7 numberWithUnsignedInteger:a3];
  uint64_t v10 = *MEMORY[0x1E4F681B8];
  v17[0] = v9;
  v17[1] = v8;
  uint64_t v11 = *MEMORY[0x1E4F681E8];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = self;
  v16[3] = *MEMORY[0x1E4F681D0];
  __int16 v12 = [(HUItemModuleController *)self module];
  id v13 = [v12 room];
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  if (!v13) {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  v17[3] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  [v6 sendEvent:13 withData:v15];
}

- (id)targetViewForDismissingCameraProfile:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemModuleController *)self module];
  uint64_t v6 = [v5 allItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HUDashboardCameraItemModuleController_targetViewForDismissingCameraProfile___block_invoke;
  v11[3] = &unk_1E6386108;
  id v12 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);

  id v9 = [(HUDashboardCameraItemModuleController *)self _sourceViewForPresentingCameraItem:v8];

  return v9;
}

uint64_t __78__HUDashboardCameraItemModuleController_targetViewForDismissingCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 profile];
  uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];

  return v8;
}

- (void)didDismissCameraController:(id)a3 forProfile:(id)a4
{
  id v5 = a3;
  id v6 = [(HUDashboardCameraItemModuleController *)self cameraController];

  if (v6 == v5)
  {
    [(HUDashboardCameraItemModuleController *)self setCameraController:0];
  }
}

- (void)disableCameraSnapshotsForCells:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          id v12 = [v11 item];
          id v13 = [v12 profile];
          uint64_t v14 = objc_msgSend(v13, "hf_cameraManager");
          [v14 endPeriodicSnapshotsWithRequester:v11];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (HUCameraController)cameraController
{
  return self->_cameraController;
}

- (void)setCameraController:(id)a3
{
}

- (void)setMapTable:(id)a3
{
}

- (void)setCameraPresentationStyle:(int64_t)a3
{
  self->_cameraPresentationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);

  objc_storeStrong((id *)&self->_cameraController, 0);
}

@end