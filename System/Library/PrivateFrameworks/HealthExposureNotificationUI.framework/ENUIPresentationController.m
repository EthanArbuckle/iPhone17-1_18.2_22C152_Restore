@interface ENUIPresentationController
- (BOOL)didPresent;
- (ENUIHostViewController)hostViewController;
- (UIWindow)savedKeyWindow;
- (UIWindow)window;
- (_UIAsyncInvocation)requestCancellationInvocation;
- (void)_dismissRemoteViewController;
- (void)_mainQueue_presentWithPresentationRequest:(id)a3 completion:(id)a4;
- (void)_makeRemoteViewControllerKeyAndVisible:(id)a3;
- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4;
- (void)cancelPresentation;
- (void)dealloc;
- (void)hostViewControllerDidFinishWithError:(id)a3;
- (void)presentWithPresentationRequest:(id)a3 completion:(id)a4;
- (void)setDidPresent:(BOOL)a3;
- (void)setHostViewController:(id)a3;
- (void)setRequestCancellationInvocation:(id)a3;
- (void)setSavedKeyWindow:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ENUIPresentationController

- (void)dealloc
{
  v3 = [(ENUIPresentationController *)self requestCancellationInvocation];
  id v4 = (id)[v3 invoke];

  v5.receiver = self;
  v5.super_class = (Class)ENUIPresentationController;
  [(ENUIPresentationController *)&v5 dealloc];
}

- (void)presentWithPresentationRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ENUIPresentationController.m", 38, @"Invalid parameter not satisfying: %@", @"presentationRequest != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ENUIPresentationController.m", 39, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ENUIPresentationController_presentWithPresentationRequest_completion___block_invoke;
  block[3] = &unk_264864B70;
  block[4] = self;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__ENUIPresentationController_presentWithPresentationRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentWithPresentationRequest:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)cancelPresentation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ENUIPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_264864B98;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__ENUIPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestCancellationInvocation];
  id v3 = (id)[v2 invoke];

  id v4 = *(void **)(a1 + 32);

  return [v4 _dismissRemoteViewController];
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ENUIPresentationController *)self didPresent])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__ENUIPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_264864BC0;
    aBlock[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v8 = _Block_copy(aBlock);
    [(ENUIPresentationController *)self setDidPresent:1];
    v9 = +[ENUIHostViewController requestRemoteViewControllerWithConnectionHandler:v8];
    [(ENUIPresentationController *)self setRequestCancellationInvocation:v9];
  }
}

void __80__ENUIPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setRequestCancellationInvocation:0];
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v8;
    [v6 setHostViewController:v7];
    [v7 setDelegate:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _makeRemoteViewControllerKeyAndVisible:v7];
    [v7 show];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_mainQueue_presentWithPresentationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__ENUIPresentationController__mainQueue_presentWithPresentationRequest_completion___block_invoke;
  v9[3] = &unk_264864BE8;
  id v10 = v6;
  id v8 = v6;
  [(ENUIPresentationController *)self _requestAndConfigureHostViewController:v9 completion:v7];
}

uint64_t __83__ENUIPresentationController__mainQueue_presentWithPresentationRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentationRequest:*(void *)(a1 + 32)];
}

- (void)_makeRemoteViewControllerKeyAndVisible:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82438];
  id v5 = a3;
  id v6 = [v4 sharedApplication];
  id v7 = [v6 keyWindow];
  [(ENUIPresentationController *)self setSavedKeyWindow:v7];

  id v8 = objc_alloc(MEMORY[0x263F82E88]);
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 bounds];
  id v12 = (id)objc_msgSend(v8, "initWithFrame:");

  [v12 setWindowLevel:*MEMORY[0x263F83C60] + -1.0];
  id v10 = [(ENUIPresentationController *)self savedKeyWindow];
  id v11 = [v10 windowScene];
  [v12 setWindowScene:v11];

  [v12 setRootViewController:v5];
  [v12 makeKeyAndVisible];
  [(ENUIPresentationController *)self setWindow:v12];
}

- (void)_dismissRemoteViewController
{
  if ([(ENUIPresentationController *)self didPresent])
  {
    id v3 = [(ENUIPresentationController *)self window];
    [v3 setWindowScene:0];

    [(ENUIPresentationController *)self setWindow:0];
    id v4 = [(ENUIPresentationController *)self savedKeyWindow];
    [v4 makeKeyWindow];

    [(ENUIPresentationController *)self setSavedKeyWindow:0];
    id v5 = [(ENUIPresentationController *)self hostViewController];
    [v5 setDelegate:0];

    [(ENUIPresentationController *)self setHostViewController:0];
    self->_didPresent = 0;
  }
}

- (void)hostViewControllerDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = ENUILogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ENUIPresentationController hostViewControllerDidFinishWithError:]((uint64_t)v4, v5);
    }
  }
  [(ENUIPresentationController *)self _dismissRemoteViewController];
}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
}

- (ENUIHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (UIWindow)savedKeyWindow
{
  return self->_savedKeyWindow;
}

- (void)setSavedKeyWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_savedKeyWindow, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);

  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

- (void)hostViewControllerDidFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_229389000, a2, OS_LOG_TYPE_ERROR, "Privacy host controller finished with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end