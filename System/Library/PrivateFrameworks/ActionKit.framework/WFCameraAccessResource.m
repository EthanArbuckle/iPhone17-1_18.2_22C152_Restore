@interface WFCameraAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedImportErrorReasonForStatus:(unint64_t)a3;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFCameraAccessResource

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v8 = (void *)getAVCaptureDeviceClass_softClass;
  uint64_t v27 = getAVCaptureDeviceClass_softClass;
  if (!getAVCaptureDeviceClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __getAVCaptureDeviceClass_block_invoke;
    v22 = &unk_264E5EC88;
    v23 = &v24;
    __getAVCaptureDeviceClass_block_invoke((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v24, 8);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v10 = (uint64_t *)getAVMediaTypeVideoSymbolLoc_ptr_27112;
  uint64_t v27 = getAVMediaTypeVideoSymbolLoc_ptr_27112;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_27112)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __getAVMediaTypeVideoSymbolLoc_block_invoke_27113;
    v22 = &unk_264E5EC88;
    v23 = &v24;
    v11 = AVFoundationLibrary_27114();
    v12 = dlsym(v11, "AVMediaTypeVideo");
    *(void *)(v23[1] + 24) = v12;
    getAVMediaTypeVideoSymbolLoc_ptr_27112 = *(void *)(v23[1] + 24);
    v10 = (uint64_t *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v10)
  {
    uint64_t v13 = *v10;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v17[3] = &unk_264E5ADE8;
    v17[4] = self;
    id v18 = v7;
    id v14 = v7;
    [v9 requestAccessForMediaType:v13 completionHandler:v17];
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"WFCameraAccessResource.m", 21, @"%s", dlerror());

    __break(1u);
  }
}

void __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  block[3] = &unk_264E5CD30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v6 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WFCameraAccessResource;
    v3 = -[WFAccessResource localizedImportErrorReasonForStatus:](&v5, sel_localizedImportErrorReasonForStatus_);
  }
  else
  {
    v3 = WFLocalizedString(@"This shortcut requires a camera, which this device does not have.");
  }
  return v3;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WFCameraAccessResource;
    v3 = -[WFAccessResource localizedErrorReasonForStatus:](&v5, sel_localizedErrorReasonForStatus_);
  }
  else
  {
    v3 = WFLocalizedString(@"This device does not have a camera.");
  }
  return v3;
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.camera";
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end