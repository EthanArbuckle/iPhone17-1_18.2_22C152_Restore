@interface WFSelectMusicActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithOutput:(id)a3 error:(id)a4;
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showWithSelectMultiple:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFSelectMusicActionUIKitUserInterface

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

- (void)mediaPickerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__WFSelectMusicActionUIKitUserInterface_mediaPickerDidCancel___block_invoke;
  v3[3] = &unk_264900E20;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __62__WFSelectMusicActionUIKitUserInterface_mediaPickerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithOutput:0 error:v2];
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__WFSelectMusicActionUIKitUserInterface_mediaPicker_didPickMediaItems___block_invoke;
  v8[3] = &unk_264900E88;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __71__WFSelectMusicActionUIKitUserInterface_mediaPicker_didPickMediaItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithOutput:*(void *)(a1 + 40) error:0];
}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFSelectMusicActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    v8 = [(WFSelectMusicActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFSelectMusicActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFSelectMusicActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSelectMusicActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFSelectMusicActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithOutput:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithSelectMultiple:(BOOL)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSelectMusicActionUIKitUserInterface.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFSelectMusicActionUIKitUserInterface *)self setCompletionHandler:v7];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFSelectMusicActionUIKitUserInterface_showWithSelectMultiple_completionHandler___block_invoke;
  block[3] = &unk_264900CC8;
  BOOL v10 = a3;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__WFSelectMusicActionUIKitUserInterface_showWithSelectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getMPMediaPickerControllerClass_softClass;
  uint64_t v9 = getMPMediaPickerControllerClass_softClass;
  if (!getMPMediaPickerControllerClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getMPMediaPickerControllerClass_block_invoke;
    v5[3] = &unk_264900EF8;
    v5[4] = &v6;
    __getMPMediaPickerControllerClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = (void *)[[v3 alloc] initWithMediaTypes:255];
  [v4 setModalPresentationStyle:2];
  objc_msgSend(v4, "setPreferredContentSize:", 540.0, 620.0);
  [v4 setAllowsPickingMultipleItems:*(unsigned __int8 *)(a1 + 40)];
  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 setShowsCloudItems:1];
  [*(id *)(a1 + 32) presentContent:v4];
}

@end