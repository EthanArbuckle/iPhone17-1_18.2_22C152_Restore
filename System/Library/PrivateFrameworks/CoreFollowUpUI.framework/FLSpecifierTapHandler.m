@interface FLSpecifierTapHandler
- (FLSpecifierTapHandlerDelegate)delegate;
- (id)description;
- (void)_handleActionForItem:(id)a3 fromSpecifier:(id)a4 eventSource:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)actionTapped:(id)a3 eventSource:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation FLSpecifierTapHandler

- (void)actionTapped:(id)a3 eventSource:(unint64_t)a4 withCompletionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_221DA3000, v10, OS_LOG_TYPE_DEFAULT, "Handling specifier %@", buf, 0xCu);
  }

  objc_msgSend(v8, "fl_startSpinner");
  v11 = [v8 propertyForKey:*MEMORY[0x263F352A8]];
  v12 = [MEMORY[0x263F353B0] sharedTelemetryController];
  [v12 captureActionForItem:v11 withEvent:2 source:4];

  v13 = [(FLSpecifierTapHandler *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v11 groupIdentifier],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:*MEMORY[0x263F352B8]],
        v14,
        v15))
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__FLSpecifierTapHandler_actionTapped_eventSource_withCompletionHandler___block_invoke;
    v16[3] = &unk_2645F2678;
    v16[4] = self;
    id v17 = v11;
    id v18 = v8;
    unint64_t v20 = a4;
    id v19 = v9;
    [v13 preflightNetworkConnectivityForHandler:self withCompletionHandler:v16];
  }
  else
  {
    [(FLSpecifierTapHandler *)self _handleActionForItem:v11 fromSpecifier:v8 eventSource:a4 withCompletionHandler:v9];
  }
}

void __72__FLSpecifierTapHandler_actionTapped_eventSource_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _handleActionForItem:*(void *)(a1 + 40) fromSpecifier:*(void *)(a1 + 48) eventSource:*(void *)(a1 + 64) withCompletionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fl_stopSpinner");
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_handleActionForItem:(id)a3 fromSpecifier:(id)a4 eventSource:(unint64_t)a5 withCompletionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  id v31 = +[FLHeadlessActionHandler handlerWithItem:v10];
  v13 = _FLLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v27[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v14;
    _os_log_impl(&dword_221DA3000, v13, OS_LOG_TYPE_DEFAULT, "Handling item with handler: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v15 = (void *)v27[5];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke;
  v24[3] = &unk_2645F26A0;
  objc_copyWeak(&v25, (id *)buf);
  [v15 setExtensionRequestedViewControllerPresentation:v24];
  v16 = [v11 propertyForKey:*MEMORY[0x263F352A0]];
  [v16 setEventSource:a5];
  id v17 = (void *)v27[5];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_4;
  v20[3] = &unk_2645F26C8;
  id v18 = v11;
  id v21 = v18;
  uint64_t v23 = &v26;
  id v19 = v12;
  id v22 = v19;
  [v17 handleAction:v16 completion:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v26, 8);
}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1)
    {
      v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_cold_1(v7);
      }

      [v3 setModalPresentationStyle:5];
    }
    id v8 = [WeakRetained delegate];
    [v8 startPresentingForHandler:WeakRetained withRemoteController:v3];
  }
}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  v4 = (void *)a1[4];
  id v7 = a3;
  objc_msgSend(v4, "fl_stopSpinner");
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)description
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@: %p>", v4, self];

  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ going away", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLSpecifierTapHandler;
  [(FLSpecifierTapHandler *)&v4 dealloc];
}

- (FLSpecifierTapHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FLSpecifierTapHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_221DA3000, log, OS_LOG_TYPE_DEBUG, "Overriding presentation for iPad.", v1, 2u);
}

@end