@interface LAPSPasscodeOptionsPresentationController
- (void)_presentPasscodeOptionsAlert:(id)a3 completion:(id)a4;
- (void)_presentPasscodeOptionsPopOverWithContentVC:(id)a3 request:(id)a4 completion:(id)a5;
- (void)_presentPasscodeOptionsPopover:(id)a3 completion:(id)a4;
- (void)_presentPasscodeOptionsSheet:(id)a3 completion:(id)a4;
- (void)presentPasscodeOptions:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeOptionsPresentationController

- (void)presentPasscodeOptions:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [v8 presentationStyle];
  switch(v7)
  {
    case 2:
      [(LAPSPasscodeOptionsPresentationController *)self _presentPasscodeOptionsSheet:v8 completion:v6];
      break;
    case 1:
      [(LAPSPasscodeOptionsPresentationController *)self _presentPasscodeOptionsPopover:v8 completion:v6];
      break;
    case 0:
      [(LAPSPasscodeOptionsPresentationController *)self _presentPasscodeOptionsAlert:v8 completion:v6];
      break;
  }
}

- (void)_presentPasscodeOptionsSheet:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 sourceViewController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke;
  v10[3] = &unk_26506EEB0;
  id v11 = v5;
  id v8 = v5;
  v9 = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke((uint64_t)v10);
  objc_msgSend(v7, "presentViewController:animated:completion:", v9, objc_msgSend(v8, "animated"), v6);
}

LAPSPasscodeOptionsSheetViewController *__85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [LAPSPasscodeOptionsSheetViewController alloc];
  v3 = [*(id *)(a1 + 32) config];
  v4 = [(LAPSPasscodeOptionsSheetViewController *)v2 initWithConfiguration:v3];

  [(LAPSPasscodeOptionsSheetViewController *)v4 setModalPresentationStyle:2];
  id v5 = [(LAPSPasscodeOptionsSheetViewController *)v4 sheetPresentationController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2;
  v11[3] = &unk_26506EE88;
  id v6 = v4;
  v12 = v6;
  uint64_t v7 = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2((uint64_t)v11);
  v13[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v5 setDetents:v8];

  [v5 setPreferredCornerRadius:12.0];
  v9 = [*(id *)(a1 + 32) delegate];
  [(LAPSPasscodeOptionsSheetViewController *)v6 setDelegate:v9];

  return v6;
}

id __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82BD0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_3;
  v4[3] = &unk_26506EE60;
  id v5 = *(id *)(a1 + 32);
  v2 = [v1 customDetentWithIdentifier:@"Small" resolver:v4];

  return v2;
}

double __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  return v1;
}

- (void)_presentPasscodeOptionsAlert:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 config];
  id v8 = [[LAPSPasscodeOptionsAlertViewController alloc] initWithConfiguration:v9];
  [(LAPSPasscodeOptionsPresentationController *)self _presentPasscodeOptionsPopOverWithContentVC:v8 request:v7 completion:v6];
}

- (void)_presentPasscodeOptionsPopover:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 config];
  id v8 = [[LAPSPasscodeOptionsSheetViewController alloc] initWithConfiguration:v9 style:1];
  [(LAPSPasscodeOptionsPresentationController *)self _presentPasscodeOptionsPopOverWithContentVC:v8 request:v7 completion:v6];
}

- (void)_presentPasscodeOptionsPopOverWithContentVC:(id)a3 request:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 sourceViewController];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke;
  v17 = &unk_26506EED8;
  id v18 = v8;
  id v19 = v7;
  id v11 = v7;
  id v12 = v8;
  v13 = __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke((uint64_t)&v14);
  objc_msgSend(v10, "presentViewController:animated:completion:", v13, objc_msgSend(v12, "animated", v14, v15, v16, v17), v9);
}

id __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sourceView];
  if (v2)
  {
  }
  else
  {
    v3 = [*(id *)(a1 + 32) sourceItem];

    if (!v3)
    {
      [*(id *)(a1 + 40) setModalPresentationStyle:6];
      goto LABEL_9;
    }
  }
  [*(id *)(a1 + 40) setModalPresentationStyle:7];
  v4 = [*(id *)(a1 + 40) popoverPresentationController];
  id v5 = [*(id *)(a1 + 32) sourceView];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) sourceView];
    [v4 setSourceView:v6];

    id v7 = [*(id *)(a1 + 32) sourceView];
    [v7 bounds];
    objc_msgSend(v4, "setSourceRect:");
  }
  id v8 = [*(id *)(a1 + 32) sourceItem];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) sourceItem];
    [v4 setSourceItem:v9];

    [v4 setPermittedArrowDirections:1];
  }

LABEL_9:
  v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) delegate];
  [v10 setDelegate:v11];

  id v12 = *(void **)(a1 + 40);

  return v12;
}

@end