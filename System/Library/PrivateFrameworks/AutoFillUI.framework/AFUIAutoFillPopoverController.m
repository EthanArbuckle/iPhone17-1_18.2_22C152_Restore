@interface AFUIAutoFillPopoverController
+ (id)presentAsPopoverFromWindow:(id)a3 documentTraits:(id)a4 documentState:(id)a5 modalUIDelegate:(id)a6 textOperationsHandler:(id)a7;
- (AFUIAutoFillContentController)contentController;
- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5;
- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5;
- (AFUIModalUIDelegate)modalUIDelegate;
- (BOOL)hasSuggestions;
- (BOOL)willPresentMenu;
- (CGRect)_sourceRectInApplicationCoordinates;
- (CGRect)_translatedRectFromApplication:(CGRect)a3;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIMenu)menu;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)performTextOperations;
- (void)_displayContextMenu;
- (void)_displayContextMenuForSourceRect:(CGRect)a3 caretRect:(CGRect)a4;
- (void)_displayContextMenuWhenReady;
- (void)_displayMenuForContentController:(id)a3;
- (void)_presentViewControllerForAutoFillMode:(unint64_t)a3;
- (void)_removeFromSuperview;
- (void)dismissMenu;
- (void)documentStateChanged:(id)a3;
- (void)presentContacts;
- (void)presentCreditCards;
- (void)presentPassword;
- (void)setContentController:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setMenu:(id)a3;
- (void)setModalUIDelegate:(id)a3;
- (void)setPerformTextOperations:(id)a3;
- (void)setWillPresentMenu:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AFUIAutoFillPopoverController

- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFUIAutoFillPopoverController;
  v12 = [(AFUIAutoFillPopoverController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentTraits, a3);
    objc_storeStrong((id *)&v13->_documentState, a4);
    uint64_t v14 = MEMORY[0x24C589E40](v11);
    id performTextOperations = v13->_performTextOperations;
    v13->_id performTextOperations = (id)v14;
  }
  return v13;
}

- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AFUIAutoFillPopoverController;
  return [(AFUIAutoFillPopoverController *)&v6 init];
}

+ (id)presentAsPopoverFromWindow:(id)a3 documentTraits:(id)a4 documentState:(id)a5 modalUIDelegate:(id)a6 textOperationsHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[AFUIAutoFillPopoverController alloc] initWithDocumentTraits:v14 documentState:v13 textOperationsHandler:v11];

  [(AFUIAutoFillPopoverController *)v16 setModalUIDelegate:v12];
  objc_super v17 = [(AFUIAutoFillPopoverController *)v16 view];
  [v15 addSubview:v17];

  v18 = [v15 rootViewController];

  [v18 addChildViewController:v16];
  uint64_t v19 = [v14 autofillMode];

  [(AFUIAutoFillPopoverController *)v16 _presentViewControllerForAutoFillMode:v19];

  return v16;
}

- (void)documentStateChanged:(id)a3
{
  id v45 = a3;
  [v45 clientFrameInWindow];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(RTIDocumentState *)self->_documentState clientFrameInWindow];
  v50.origin.x = v12;
  v50.origin.y = v13;
  v50.size.width = v14;
  v50.size.height = v15;
  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  if (!CGRectEqualToRect(v47, v50)) {
    goto LABEL_5;
  }
  [v45 clientFrameInEntitySpace];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(RTIDocumentState *)self->_documentState clientFrameInEntitySpace];
  v51.origin.x = v24;
  v51.origin.y = v25;
  v51.size.width = v26;
  v51.size.height = v27;
  v48.origin.x = v17;
  v48.origin.y = v19;
  v48.size.width = v21;
  v48.size.height = v23;
  if (CGRectEqualToRect(v48, v51))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
LABEL_5:
    [MEMORY[0x263F82A30] visiblePeripheralFrame];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    [v45 caretRectInWindow];
    v52.origin.x = v36;
    v52.origin.y = v37;
    v52.size.width = v38;
    v52.size.height = v39;
    v49.origin.x = v29;
    v49.origin.y = v31;
    v49.size.width = v33;
    v49.size.height = v35;
    BOOL v40 = CGRectContainsRect(v49, v52);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v40) {
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    if (!v40) {
      goto LABEL_10;
    }
  }
  int v41 = [v45 scrolling];
  v42 = [(AFUIAutoFillPopoverController *)self documentState];
  int v43 = [v42 scrolling];

  if (v41 == v43)
  {
LABEL_8:
    [(AFUIAutoFillPopoverController *)self setDocumentState:v45];
    goto LABEL_13;
  }
LABEL_10:
  BOOL v44 = [(AFUIAutoFillPopoverController *)self willPresentMenu];
  [(AFUIAutoFillPopoverController *)self setDocumentState:v45];
  if (!v44)
  {
    [(AFUIAutoFillPopoverController *)self dismissMenu];
    if (self->_contentController) {
      -[AFUIAutoFillPopoverController _displayMenuForContentController:](self, "_displayMenuForContentController:");
    }
  }
LABEL_13:
}

- (BOOL)hasSuggestions
{
  v3 = [(AFUIAutoFillPopoverController *)self contentController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  CGFloat v5 = [(AFUIAutoFillPopoverController *)self contentController];
  char v6 = [v5 hasSuggestions];

  return v6;
}

- (void)dismissMenu
{
  v3 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
  [v3 setIsMenuPresented:0 forSessionUUID:0];

  char v4 = [(AFUIAutoFillPopoverController *)self contextMenuInteraction];
  [v4 dismissMenu];

  CGFloat v5 = [(AFUIAutoFillPopoverController *)self contextMenuInteraction];
  char v6 = [v5 view];
  [v6 removeFromSuperview];

  [(AFUIAutoFillPopoverController *)self setContextMenuInteraction:0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  char v6 = (void *)MEMORY[0x263F82610];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  CGFloat v11 = __87__AFUIAutoFillPopoverController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  CGFloat v12 = &unk_2652496F8;
  objc_copyWeak(&v13, &location);
  CGFloat v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:&v9];
  objc_msgSend(v7, "setPreferredMenuElementOrder:", 2, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

id __87__AFUIAutoFillPopoverController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained menu];

  return v2;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F82EF8], "defaultStyle", a3, a4);
  [v5 setPreferredLayout:3];
  if (objc_opt_respondsToSelector()) {
    [v5 setAllowsBackgroundInteractionAcrossProccesses:1];
  }
  char v6 = [(AFUIAutoFillPopoverController *)self view];
  CGFloat v7 = [v6 window];
  [v5 setContainerView:v7];

  return v5;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AFUIAutoFillPopoverController;
  [(AFUIAutoFillPopoverController *)&v5 viewDidLoad];
  v3 = [(AFUIAutoFillPopoverController *)self view];
  [v3 setUserInteractionEnabled:0];

  char v4 = [(AFUIAutoFillPopoverController *)self view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)presentPassword
{
  v3 = [AFUIAutoFillPasswordController alloc];
  char v4 = [(AFUIAutoFillPopoverController *)self documentTraits];
  objc_super v5 = [(AFUIAutoFillPopoverController *)self performTextOperations];
  CGFloat v7 = [(AFUIAutoFillPasswordController *)v3 initWithDocumentTraits:v4 presentingViewController:self textOperationsHandler:v5];

  char v6 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
  [(AFUIAutoFillPasswordController *)v7 setModalUIDelegate:v6];

  [(AFUIAutoFillPopoverController *)self _displayMenuForContentController:v7];
}

- (void)presentContacts
{
  v3 = [AFUIAutofillContactsController alloc];
  char v4 = [(AFUIAutoFillPopoverController *)self documentTraits];
  objc_super v5 = [(AFUIAutoFillPopoverController *)self performTextOperations];
  CGFloat v7 = [(AFUIAutofillContactsController *)v3 initWithDocumentTraits:v4 presentingViewController:self textOperationsHandler:v5];

  char v6 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
  [(AFUIAutofillContactsController *)v7 setModalUIDelegate:v6];

  [(AFUIAutoFillPopoverController *)self _displayMenuForContentController:v7];
}

- (void)presentCreditCards
{
  v3 = [AFUIAutoFillCreditCardController alloc];
  char v4 = [(AFUIAutoFillPopoverController *)self documentTraits];
  objc_super v5 = [(AFUIAutoFillPopoverController *)self documentState];
  char v6 = [(AFUIAutoFillPopoverController *)self performTextOperations];
  double v8 = [(AFUIAutoFillCreditCardController *)v3 initWithDocumentTraits:v4 documentState:v5 presentingViewController:self textOperationsHandler:v6];

  CGFloat v7 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
  [(AFUIAutoFillCreditCardController *)v8 setModalUIDelegate:v7];

  [(AFUIAutoFillPopoverController *)self _displayMenuForContentController:v8];
}

- (void)_displayMenuForContentController:(id)a3
{
  id v4 = a3;
  [(AFUIAutoFillPopoverController *)self setContentController:v4];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke;
  v7[3] = &unk_265249010;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_2;
  v5[3] = &unk_265249010;
  objc_copyWeak(&v6, &location);
  [v4 generateInitialMenu:v7 menuChanged:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setMenu:v3];

  id v4 = [WeakRetained documentState];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [WeakRetained documentState];
    char v6 = [v5 scrolling];

    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  CGFloat v7 = [WeakRetained contentController];
  id v8 = v7;
  if (v7 && [v7 hasSuggestions]) {
    [WeakRetained _displayContextMenuWhenReady];
  }
  else {
    [WeakRetained _removeFromSuperview];
  }

LABEL_10:
}

void __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v6 = [WeakRetained contextMenuInteraction];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_3;
  v8[3] = &unk_265249720;
  objc_copyWeak(&v10, v4);
  id v7 = v3;
  id v9 = v7;
  [v6 updateVisibleMenuWithBlock:v8];

  objc_destroyWeak(&v10);
}

id __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained menu];

  char v6 = v3;
  if (v5 == v3)
  {
    [WeakRetained setMenu:*(void *)(a1 + 32)];
    char v6 = *(void **)(a1 + 32);
  }
  id v7 = v6;

  return v7;
}

- (void)_displayContextMenuWhenReady
{
  if (![(AFUIAutoFillPopoverController *)self willPresentMenu])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:self];
    [(AFUIAutoFillPopoverController *)self setContextMenuInteraction:v3];

    [(AFUIAutoFillPopoverController *)self setWillPresentMenu:1];
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__AFUIAutoFillPopoverController__displayContextMenuWhenReady__block_invoke;
    block[3] = &unk_265249678;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __61__AFUIAutoFillPopoverController__displayContextMenuWhenReady__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setWillPresentMenu:0];
  v2 = [WeakRetained contextMenuInteraction];

  if (v2) {
    [WeakRetained _displayContextMenu];
  }
}

- (void)_displayContextMenu
{
  id v3 = [(AFUIAutoFillPopoverController *)self documentState];
  [v3 caretRectInWindow];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(AFUIAutoFillPopoverController *)self _sourceRectInApplicationCoordinates];
  -[AFUIAutoFillPopoverController _translatedRectFromApplication:](self, "_translatedRectFromApplication:");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  -[AFUIAutoFillPopoverController _translatedRectFromApplication:](self, "_translatedRectFromApplication:", v5, v7, v9, v11);

  -[AFUIAutoFillPopoverController _displayContextMenuForSourceRect:caretRect:](self, "_displayContextMenuForSourceRect:caretRect:", v13, v15, v17, v19, v20, v21, v22, v23);
}

- (CGRect)_sourceRectInApplicationCoordinates
{
  id v3 = [(AFUIAutoFillPopoverController *)self documentState];
  [v3 clientFrameInWindow];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(AFUIAutoFillPopoverController *)self documentState];
  [v12 caretRectInWindow];
  if (CGRectIsNull(v23)) {
    goto LABEL_4;
  }
  double v13 = [(AFUIAutoFillPopoverController *)self documentTraits];
  int v14 = [v13 _isExplicitAutoFillInvocation];

  if (v14)
  {
    double v12 = [(AFUIAutoFillPopoverController *)self documentState];
    [v12 caretRectInWindow];
    double v5 = v15;
    double v7 = v16;
    double v9 = v17;
    double v11 = v18;
LABEL_4:
  }
  double v19 = v5;
  double v20 = v7;
  double v21 = v9;
  double v22 = v11;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_displayContextMenuForSourceRect:(CGRect)a3 caretRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v45 = *MEMORY[0x263EF8340];
  double v9 = [(AFUIAutoFillPopoverController *)self view];
  double v10 = [(AFUIAutoFillPopoverController *)self view];
  double v11 = [v10 window];
  double v12 = [v11 screen];
  double v13 = [v12 coordinateSpace];
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v13, x, y, width, height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  double v22 = [(AFUIAutoFillPopoverController *)self view];
  CGRect v23 = [v22 window];
  CGFloat v24 = [v23 screen];
  [v24 bounds];
  v51.origin.double x = v25;
  v51.origin.double y = v26;
  v51.size.double width = v27;
  v51.size.double height = v28;
  v47.origin.double x = v15;
  v47.origin.double y = v17;
  v47.size.double width = v19;
  v47.size.double height = v21;
  BOOL v29 = CGRectIntersectsRect(v47, v51);

  if (width != *MEMORY[0x263F001B0] || height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [MEMORY[0x263F82A30] visiblePeripheralFrame];
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = width;
    v52.size.double height = height;
    if (!CGRectContainsRect(v48, v52) && v29)
    {
      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      double MidX = CGRectGetMidX(v49);
      v50.origin.double x = x;
      v50.origin.double y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      double MidY = CGRectGetMidY(v50);
      if (UIPointIsDiscrete()
        && ([(AFUIAutoFillPopoverController *)self view],
            CGFloat v33 = objc_claimAutoreleasedReturnValue(),
            [v33 window],
            double v34 = objc_claimAutoreleasedReturnValue(),
            v34,
            v33,
            v34))
      {
        id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        CGFloat v35 = [(AFUIAutoFillPopoverController *)self view];
        [v35 addSubview:v42];

        CGFloat v36 = [(AFUIAutoFillPopoverController *)self contextMenuInteraction];
        [v42 addInteraction:v36];

        CGFloat v37 = [(AFUIAutoFillPopoverController *)self contextMenuInteraction];
        objc_msgSend(v37, "_presentMenuAtLocation:", MidX, MidY);

        CGFloat v38 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
        [v38 setIsMenuPresented:1 forSessionUUID:0];
      }
      else
      {
        CGFloat v39 = AFUIAutoFillPopoverControllerOSLogFacility();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v40 = objc_msgSend(NSString, "stringWithFormat:", @"%s _displayMenuForContentController: with invalid centerOfCaret", "-[AFUIAutoFillPopoverController _displayContextMenuForSourceRect:caretRect:]");
          *(_DWORD *)buf = 138412290;
          BOOL v44 = v40;
          _os_log_impl(&dword_248A91000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (CGRect)_translatedRectFromApplication:(CGRect)a3
{
  double v4 = [(AFUIAutoFillPopoverController *)self view];
  double v5 = [v4 window];
  [v5 _contextId];

  double v6 = [(AFUIAutoFillPopoverController *)self view];
  double v7 = [v6 window];
  double v8 = [v7 layer];
  CALayerGetRenderId();

  memset(&v49, 0, sizeof(v49));
  BKSHIDServicesGetCALayerTransform();
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v45 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v46 = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v47 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v48 = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v41 = *MEMORY[0x263F15740];
  long long v42 = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v43 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v44 = v12;
  double v13 = [(AFUIAutoFillPopoverController *)self documentTraits];
  LODWORD(v7) = [v13 contextID];

  if (v7)
  {
    double v14 = [(AFUIAutoFillPopoverController *)self documentTraits];
    [v14 contextID];
    CGFloat v15 = [(AFUIAutoFillPopoverController *)self documentTraits];
    [v15 layerID];
    BKSHIDServicesGetCALayerTransform();
  }
  CA_CGRectApplyTransform();
  CATransform3D v40 = v49;
  CATransform3DInvert(&v39, &v40);
  CA_CGRectApplyTransform();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  CGFloat v24 = [(AFUIAutoFillPopoverController *)self view];
  CGFloat v25 = [(AFUIAutoFillPopoverController *)self view];
  CGFloat v26 = [v25 window];
  objc_msgSend(v24, "convertRect:fromView:", v26, v17, v19, v21, v23);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = v28;
  double v36 = v30;
  double v37 = v32;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (void)_removeFromSuperview
{
  id v3 = [(AFUIAutoFillPopoverController *)self modalUIDelegate];
  [v3 setIsMenuPresented:0 forSessionUUID:0];

  double v4 = [(AFUIAutoFillPopoverController *)self performTextOperations];
  v4[2](v4, 0);

  double v5 = [(AFUIAutoFillPopoverController *)self view];
  [v5 removeFromSuperview];

  [(AFUIAutoFillPopoverController *)self removeFromParentViewController];
}

- (void)_presentViewControllerForAutoFillMode:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 8uLL:
      [(AFUIAutoFillPopoverController *)self presentPassword];
      break;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      [(AFUIAutoFillPopoverController *)self presentContacts];
      break;
    case 9uLL:
      [(AFUIAutoFillPopoverController *)self presentCreditCards];
      break;
    default:
      return;
  }
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalUIDelegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setModalUIDelegate:(id)a3
{
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (id)performTextOperations
{
  return self->_performTextOperations;
}

- (void)setPerformTextOperations:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIMenu)menu
{
  return (UIMenu *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setMenu:(id)a3
{
}

- (AFUIAutoFillContentController)contentController
{
  return (AFUIAutoFillContentController *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setContentController:(id)a3
{
}

- (BOOL)willPresentMenu
{
  return self->_willPresentMenu;
}

- (void)setWillPresentMenu:(BOOL)a3
{
  self->_willPresentMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);

  objc_destroyWeak((id *)&self->_modalUIDelegate);
}

@end