@interface WFTakeVideoActionUIKitUserInterface
+ (int64_t)cameraDeviceFromString:(id)a3;
+ (int64_t)qualityFromString:(id)a3;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithOutput:(id)a3 error:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithQuality:(id)a3 device:(id)a4 startImmediately:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation WFTakeVideoActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WFTakeVideoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __70__WFTakeVideoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithOutput:0 error:v2];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F83690];
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 objectForKey:v6];
  v10 = [v7 objectForKey:*MEMORY[0x263F83688]];

  v11 = [MEMORY[0x263F852B8] typeWithString:v10];
  v12 = [v11 fileExtension];

  if (!v12)
  {
    uint64_t v13 = [v9 wfFileType];

    v11 = (void *)v13;
  }
  v14 = NSString;
  v15 = [v11 fileExtension];
  v16 = objc_msgSend(v14, "wf_datedFilenameWithTypeString:fileExtension:", @"Movie", v15);

  v17 = [MEMORY[0x263F33870] fileWithURL:v9 options:3 ofType:0 proposedFilename:v16];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__WFTakeVideoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
  v19[3] = &unk_264900E88;
  v19[4] = self;
  id v20 = v17;
  id v18 = v17;
  [v8 dismissViewControllerAnimated:1 completion:v19];
}

uint64_t __91__WFTakeVideoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithOutput:*(void *)(a1 + 40) error:0];
}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFTakeVideoActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFTakeVideoActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFTakeVideoActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFTakeVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFTakeVideoActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __79__WFTakeVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithOutput:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithQuality:(id)a3 device:(id)a4 startImmediately:(BOOL)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFTakeVideoActionUIKitUserInterface.m", 43, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
LABEL_7:
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFTakeVideoActionUIKitUserInterface.m", 44, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFTakeVideoActionUIKitUserInterface.m", 42, @"Invalid parameter not satisfying: %@", @"quality" object file lineNumber description];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_7;
  }
LABEL_4:
  [(WFTakeVideoActionUIKitUserInterface *)self setCompletionHandler:v13];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke;
  block[3] = &unk_264900850;
  block[4] = self;
  id v20 = v12;
  id v21 = v11;
  BOOL v22 = a5;
  id v14 = v11;
  id v15 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F82808]);
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 setSourceType:1];
  objc_msgSend(v2, "setCameraDevice:", objc_msgSend((id)objc_opt_class(), "cameraDeviceFromString:", *(void *)(a1 + 40)));
  objc_msgSend(v2, "setVideoQuality:", objc_msgSend((id)objc_opt_class(), "qualityFromString:", *(void *)(a1 + 48)));
  v3 = [(id)*MEMORY[0x263F1DBC8] identifier];
  v13[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v2 setMediaTypes:v4];

  [v2 setCameraCaptureMode:1];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke_2;
  v10 = &unk_264900CC8;
  char v12 = *(unsigned char *)(a1 + 56);
  id v5 = v2;
  id v11 = v5;
  objc_super v6 = (void (**)(void))_Block_copy(&v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "presentContent:completion:", v5, v6, v7, v8, v9, v10) & 1) == 0)
  {
    [*(id *)(a1 + 32) presentContent:v5];
    v6[2](v6);
  }
}

uint64_t __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) startVideoCapture];
  }
  return result;
}

+ (int64_t)cameraDeviceFromString:(id)a3
{
  id v3 = a3;
  if (![v3 isEqualToString:*MEMORY[0x263F23338]]
    || (int64_t v4 = 0, ([MEMORY[0x263F82808] isCameraDeviceAvailable:0] & 1) == 0))
  {
    if (![v3 isEqualToString:*MEMORY[0x263F23330]]
      || (int64_t v4 = 1, ([MEMORY[0x263F82808] isCameraDeviceAvailable:1] & 1) == 0))
    {
      int64_t v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)qualityFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F23348]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F23340]])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end