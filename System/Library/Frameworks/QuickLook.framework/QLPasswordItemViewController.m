@interface QLPasswordItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (void)invalidate;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)loadView;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4;
@end

@implementation QLPasswordItemViewController

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82690]);
  v4 = [(QLPreviewContext *)self->_context previewTitle];
  id v5 = (id)[v3 initWithDocumentName:v4];

  [v5 setPasswordDelegate:self];
  [(QLPasswordItemViewController *)self setView:v5];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  objc_storeStrong((id *)&self->_context, a4);
  id v11 = a4;
  id v8 = a5;
  v9 = _Block_copy(v8);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v9;
}

- (void)previewDidAppear:(BOOL)a3
{
  dispatch_time_t v4 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__QLPasswordItemViewController_previewDidAppear___block_invoke;
  block[3] = &unk_2642F5430;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __49__QLPasswordItemViewController_previewDidAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordView];
  v1 = [v2 passwordField];
  [v1 becomeFirstResponder];
}

- (void)previewWillDisappear:(BOOL)a3
{
  id v4 = [(QLPasswordItemViewController *)self passwordView];
  id v3 = [v4 passwordField];
  [v3 resignFirstResponder];
}

- (void)invalidate
{
  self->_id completionBlock = 0;
  MEMORY[0x270F9A758]();
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  -[QLPreviewContext setPassword:](self->_context, "setPassword:", a3, a4);
  id completionBlock = (void (**)(id, void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, 0);
    id v6 = self->_completionBlock;
    self->_id completionBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end