@interface WFTakeVideoAction
+ (id)userInterfaceProtocol;
- (id)disabledOnPlatforms;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFTakeVideoAction

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFTakeVideoAction;
  v2 = [(WFTakeVideoAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFTakeVideoAction *)self parameterValueForKey:@"WFCameraCaptureQuality" ofClass:objc_opt_class()];
  v9 = [(WFTakeVideoAction *)self parameterValueForKey:@"WFCameraCaptureDevice" ofClass:objc_opt_class()];
  v10 = [(WFTakeVideoAction *)self parameterValueForKey:@"WFRecordingStart" ofClass:objc_opt_class()];
  uint64_t v11 = [v10 isEqualToString:@"Immediately"];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v12 = (void *)getUIImagePickerControllerClass_softClass;
  uint64_t v20 = getUIImagePickerControllerClass_softClass;
  if (!getUIImagePickerControllerClass_softClass)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getUIImagePickerControllerClass_block_invoke;
    v16[3] = &unk_264E5EC88;
    v16[4] = &v17;
    __getUIImagePickerControllerClass_block_invoke((uint64_t)v16);
    v12 = (void *)v18[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v17, 8);
  if ([v13 isSourceTypeAvailable:1])
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__WFTakeVideoAction_runWithRemoteUserInterface_input___block_invoke;
    v15[3] = &unk_264E5D390;
    v15[4] = self;
    [v6 showWithQuality:v8 device:v9 startImmediately:v11 completionHandler:v15];
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    [(WFTakeVideoAction *)self finishRunningWithError:v14];
  }
}

void __54__WFTakeVideoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    objc_super v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    [v7 addFile:v6];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1230;
}

@end