@interface WFContentItemViewController
- (WFContentItem)contentItem;
- (WFContentItemViewController)initWithContentItem:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFContentItemViewController

- (void).cxx_destruct
{
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  contentItem = self->_contentItem;
  id v6 = a4;
  v7 = [(WFContentItem *)contentItem supportedTypes];
  uint64_t v8 = [v6 row];

  v9 = [v7 objectAtIndex:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = self->_contentItem;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_264900D18;
    v12 = &v17;
    v16[4] = self;
    id v17 = v10;
    -[WFContentItem getFileRepresentation:forType:](v11, "getFileRepresentation:forType:", v16);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    v12 = (id *)&v15;
    -[WFContentItem getObjectRepresentation:forClass:](self->_contentItem, "getObjectRepresentation:forClass:", &v14, objc_msgSend(v13, "objectClass", MEMORY[0x263EF8330], 3221225472, __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_3, &unk_264900D40, self, v13));
    goto LABEL_5;
  }
LABEL_6:
}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v11[3] = &unk_264900F78;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v12[3] = &unk_264900F78;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    WFUserInterfaceFromViewController();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v2 = [MEMORY[0x263F336E8] alertWithError:*(void *)(a1 + 48)];
    [v15 presentAlert:v2];
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [MEMORY[0x263F33718] sharedContext];
    [v15 openURL:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc_init(MEMORY[0x263F82E10]);
    v3 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:*(void *)(a1 + 32)];
    [v15 setView:v3];

    v4 = [*(id *)(a1 + 56) typeDescription];
    [v15 setTitle:v4];

    v2 = [*(id *)(a1 + 40) navigationController];
    [v2 pushViewController:v15 animated:1];
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v15 = objc_alloc_init(MEMORY[0x263F82E10]);
  if (isKindOfClass)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F109A8]);
    id v7 = (void *)[objc_alloc(MEMORY[0x263F109E0]) initWithPlacemark:*(void *)(a1 + 32)];
    [v6 addAnnotation:v7];
    v16[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v6 showAnnotations:v8 animated:0];

    [v15 setView:v6];
    id v9 = [*(id *)(a1 + 56) typeDescription];
    [v15 setTitle:v9];

    id v10 = [*(id *)(a1 + 40) navigationController];
    [v10 pushViewController:v15 animated:1];

    return;
  }
  id v11 = objc_alloc_init(MEMORY[0x263F82D60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setAttributedText:*(void *)(a1 + 32)];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) description];
    [v11 setText:v12];
  }
  [v15 setView:v11];
  id v13 = [*(id *)(a1 + 56) typeDescription];
  [v15 setTitle:v13];

  uint64_t v14 = [*(id *)(a1 + 40) navigationController];
  [v14 pushViewController:v15 animated:1];

LABEL_8:
}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 56);
    v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD70]];
    LODWORD(v2) = [v2 isEqual:v3];

    if (v2)
    {
      id v4 = objc_alloc_init(MEMORY[0x263F82E10]);
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      id v5 = (void *)getWKWebViewClass_softClass_4989;
      uint64_t v23 = getWKWebViewClass_softClass_4989;
      if (!getWKWebViewClass_softClass_4989)
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __getWKWebViewClass_block_invoke_4990;
        v19[3] = &unk_264900EF8;
        v19[4] = &v20;
        __getWKWebViewClass_block_invoke_4990((uint64_t)v19);
        id v5 = (void *)v21[3];
      }
      id v6 = v5;
      _Block_object_dispose(&v20, 8);
      id v7 = objc_alloc_init(v6);
      [v4 setView:v7];
      uint64_t v8 = [*(id *)(a1 + 56) typeDescription];
      [v4 setTitle:v8];

      id v9 = (void *)MEMORY[0x263F08BD8];
      id v10 = [*(id *)(a1 + 32) fileURL];
      id v11 = [v9 requestWithURL:v10];
      id v12 = (id)[v7 loadRequest:v11];

      id v13 = [*(id *)(a1 + 40) navigationController];
      [v13 pushViewController:v4 animated:1];

      return;
    }
    id v15 = (void *)MEMORY[0x263F6BCB0];
    id v16 = [*(id *)(a1 + 32) fileURL];
    id v18 = [v15 interactionControllerWithURL:v16];

    id v17 = [*(id *)(a1 + 56) typeDescription];
    [v18 setName:v17];

    [v18 setDelegate:*(void *)(a1 + 40)];
    [v18 presentPreviewAnimated:1];
  }
  else
  {
    WFUserInterfaceFromViewController();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [MEMORY[0x263F336E8] alertWithError:*(void *)(a1 + 48)];
    [v18 presentAlert:v14];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"WFOutputTypeCellIdentifier" forIndexPath:v6];
  uint64_t v8 = [(WFContentItem *)self->_contentItem supportedTypes];
  uint64_t v9 = [v6 row];

  id v10 = [v8 objectAtIndex:v9];

  [v7 setAccessoryType:1];
  id v11 = [v10 typeDescription];
  id v12 = [v7 textLabel];
  [v12 setText:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v10 documentIcon];
    uint64_t v14 = [v13 UIImage];
    id v15 = [v7 imageView];
    [v15 setImage:v14];
  }
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(WFContentItem *)self->_contentItem supportedTypes];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WFContentItemViewController;
  [(WFContentItemViewController *)&v4 viewDidLoad];
  v3 = [(WFContentItemViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFOutputTypeCellIdentifier"];
}

- (WFContentItemViewController)initWithContentItem:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContentItemViewController.m", 28, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContentItemViewController;
  id v7 = [(WFContentItemViewController *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentItem, a3);
    uint64_t v9 = WFLocalizedString(@"Supported Types");
    [(WFContentItemViewController *)v8 setTitle:v9];
  }
  return v8;
}

@end