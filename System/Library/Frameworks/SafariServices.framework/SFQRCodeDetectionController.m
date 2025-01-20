@interface SFQRCodeDetectionController
@end

@implementation SFQRCodeDetectionController

void __48___SFQRCodeDetectionController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v1;
}

void __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke_2;
  v5[3] = &unk_1E5C73380;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v2 = isLiveCameraOnlyAction(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 || (uint64_t v4 = *(void *)(a1 + 32)) == 0)
  {
    id v6 = *(void (**)(uint64_t, void, void))(v3 + 16);
    v6(v3, 0, 0);
  }
  else
  {
    id v7 = @"action";
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v5);
  }
}

void __72___SFQRCodeDetectionController_getActionForImageSynchronously_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((isLiveCameraOnlyAction(v4) & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL __49___SFQRCodeDetectionController_elementForAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"action"];
  BOOL v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

id __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 icon];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"qrcode"];
  }
  id v6 = v5;

  id v7 = (void *)MEMORY[0x1E4FB13F0];
  v8 = [v2 label];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke_2;
  v12[3] = &unk_1E5C72170;
  id v13 = v2;
  id v9 = v2;
  v10 = [v7 actionWithTitle:v8 image:v6 identifier:0 handler:v12];

  return v10;
}

uint64_t __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

void __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "safari_originalDataAsString");
  [v3 setString:v2];
}

uint64_t __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCopyActionItem];
}

@end