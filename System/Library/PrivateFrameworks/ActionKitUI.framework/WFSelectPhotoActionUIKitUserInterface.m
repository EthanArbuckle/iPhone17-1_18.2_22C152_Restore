@interface WFSelectPhotoActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithOutput:(id)a3 error:(id)a4;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithPhotoPickerTypes:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation WFSelectPhotoActionUIKitUserInterface

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

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "userCancelledError", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFSelectPhotoActionUIKitUserInterface *)self finishWithOutput:0 error:v4];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke;
  v8[3] = &unk_264900E88;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

void __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "if_map:", &__block_literal_global_464);
    v3 = *(void **)(a1 + 40);
    id v6 = (id)v2;
    uint64_t v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    uint64_t v4 = [MEMORY[0x263F087E8] userCancelledError];
    v3 = v5;
    uint64_t v2 = 0;
    id v6 = (id)v4;
  }
  [v3 finishWithOutput:v2 error:v4];
}

uint64_t __65__WFSelectPhotoActionUIKitUserInterface_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFSelectPhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSelectPhotoActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFSelectPhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithOutput:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFSelectPhotoActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFSelectPhotoActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFSelectPhotoActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithPhotoPickerTypes:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFSelectPhotoActionUIKitUserInterface.m", 38, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFSelectPhotoActionUIKitUserInterface *)self setCompletionHandler:v10];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_2649002D0;
  v16 = self;
  id v17 = v10;
  BOOL v18 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F33988] sharedLibrary];
  id v12 = 0;
  v3 = [v2 systemPhotoLibraryWithError:&v12];
  id v4 = v12;

  if (v3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F15210]) initWithPhotoLibrary:v3];
    [v5 setSelectionLimit:*(unsigned char *)(a1 + 56) == 0];
    [v5 setDisabledCapabilities:16];
    id v6 = [*(id *)(a1 + 32) allObjects];
    id v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_2148);

    if ([v7 count])
    {
      id v8 = [MEMORY[0x263F15218] anyFilterMatchingSubfilters:v7];
      [v5 setFilter:v8];
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x263F15220]) initWithConfiguration:v5];
    [v9 setDelegate:*(void *)(a1 + 40)];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v9 presentationController];
    [v11 setDelegate:v10];

    [*(id *)(a1 + 40) presentContent:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __99__WFSelectPhotoActionUIKitUserInterface_showWithPhotoPickerTypes_selectMultiple_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:*MEMORY[0x263F232A8]])
  {
    uint64_t v3 = [MEMORY[0x263F15218] imagesFilter];
LABEL_7:
    id v4 = (void *)v3;
    goto LABEL_8;
  }
  if ([v2 isEqualToString:*MEMORY[0x263F232B0]])
  {
    uint64_t v3 = [MEMORY[0x263F15218] livePhotosFilter];
    goto LABEL_7;
  }
  if ([v2 isEqualToString:*MEMORY[0x263F232B8]])
  {
    uint64_t v3 = [MEMORY[0x263F15218] videosFilter];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

@end