@interface WFTakePhotoAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (id)disabledOnPlatforms;
- (unint64_t)remainingPhotos;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
- (void)setRemainingPhotos:(unint64_t)a3;
@end

@implementation WFTakePhotoAction

+ (id)userInterfaceXPCInterface
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFTakePhotoAction;
  v2 = objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithCameraPreview_photoCount_device_shortcutAttribution_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E16D8;
}

- (void)setRemainingPhotos:(unint64_t)a3
{
  self->_remainingPhotos = a3;
}

- (unint64_t)remainingPhotos
{
  return self->_remainingPhotos;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFTakePhotoAction;
  v2 = [(WFTakePhotoAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  v6 = [(WFTakePhotoAction *)self parameterValueForKey:@"WFCameraCaptureShowPreview" ofClass:objc_opt_class()];
  uint64_t v7 = [v6 BOOLValue];

  v8 = [(WFTakePhotoAction *)self parameterValueForKey:@"WFPhotoCount" ofClass:objc_opt_class()];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [(WFTakePhotoAction *)self parameterValueForKey:@"WFCameraCaptureDevice" ofClass:objc_opt_class()];
  v11 = [(WFTakePhotoAction *)self workflow];
  int v12 = [v11 hiddenFromLibraryAndSync];

  if (v12)
  {
    v13 = [MEMORY[0x263F86A50] defaultDatabase];
    v14 = [(WFTakePhotoAction *)self workflow];
    v15 = [v14 workflowID];
    v16 = [v13 configuredTriggersForWorkflowID:v15 error:0];

    v17 = [v16 firstObject];
    v18 = [v17 trigger];
    v19 = [v18 localizedDescriptionWithConfigurationSummary];
  }
  else
  {
    v16 = [(WFTakePhotoAction *)self workflow];
    v19 = [v16 name];
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke;
  v20[3] = &unk_264E56F50;
  v20[4] = self;
  [v5 showWithCameraPreview:v7 photoCount:v9 device:v10 shortcutAttribution:v19 completionHandler:v20];
}

void __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263F08928];
  v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke_2;
  v11[3] = &unk_264E56F28;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v9 = v6;
  id v10 = (id)objc_msgSend(v7, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v8, v11);
}

uint64_t __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOutput:a2];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 finishRunningWithError:v4];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFTakePhotoAction *)self parameterValueForKey:@"WFCameraCaptureShowPreview" ofClass:objc_opt_class()];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [(WFTakePhotoAction *)self variableSource];
  v8 = [v7 workflowStartDate];

  id v9 = [(WFTakePhotoAction *)self variableSource];
  id v10 = [v9 contentForPrivateVariableKey:@"WFTakePhotoActionConfirmed"];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  int v13 = [v12 BOOLValue];
  if (v8) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((v14 | v6) & 1) == 0)
  {
    v15 = [MEMORY[0x263EFF8F0] currentCalendar];
    v16 = [v15 dateByAddingUnit:64 value:10 toDate:v8 options:0];

    v17 = [MEMORY[0x263EFF910] date];
    uint64_t v18 = [v17 compare:v16];

    if (v18 == 1)
    {
      v19 = [(WFTakePhotoAction *)self workflow];
      if ([v19 hiddenFromLibraryAndSync])
      {
      }
      else
      {
        v20 = [(WFTakePhotoAction *)self workflow];
        v21 = [v20 name];

        if (v21)
        {
          v22 = NSString;
          v23 = WFLocalizedString(@"The shortcut “%@” wants to take a photo. Do you want to allow it?");
          v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v21);

LABEL_18:
          v25 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
          v26 = [(WFTakePhotoAction *)self localizedName];
          [v25 setTitle:v26];

          [v25 setMessage:v24];
          v27 = (void *)MEMORY[0x263F336F0];
          v28 = WFLocalizedString(@"Don’t Allow");
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke;
          v37[3] = &unk_264E5EE70;
          v37[4] = self;
          v29 = [v27 buttonWithTitle:v28 style:1 handler:v37];
          [v25 addButton:v29];

          v30 = (void *)MEMORY[0x263F336F0];
          v31 = WFLocalizedString(@"OK");
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke_2;
          v35[3] = &unk_264E5DED8;
          v35[4] = self;
          id v36 = v4;
          v32 = [v30 buttonWithTitle:v31 style:0 preferred:1 handler:v35];
          [v25 addButton:v32];

          v33 = [(WFTakePhotoAction *)self userInterface];
          [v33 presentAlert:v25];

          goto LABEL_19;
        }
      }
      v24 = WFLocalizedString(@"This shortcut wants to take a photo. Do you want to allow it?");
      goto LABEL_18;
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)WFTakePhotoAction;
  [(WFTakePhotoAction *)&v34 runAsynchronouslyWithInput:v4];
LABEL_19:
}

void __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

id __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) variableSource];
  [v2 setContent:MEMORY[0x263EFFA88] forPrivateVariableKey:@"WFTakePhotoActionConfirmed"];

  uint64_t v3 = *(void *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFTakePhotoAction;
  return objc_msgSendSuper2(&v5, sel_runAsynchronouslyWithInput_, v3);
}

@end