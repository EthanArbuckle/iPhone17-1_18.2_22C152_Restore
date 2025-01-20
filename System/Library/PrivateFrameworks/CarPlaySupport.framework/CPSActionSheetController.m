@interface CPSActionSheetController
+ (id)actionSheetControllerWithActionSheet:(id)a3;
- (CPActionSheetTemplate)actionSheet;
- (CPTemplateDelegate)templateDelegate;
- (void)setActionSheet:(id)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSActionSheetController

+ (id)actionSheetControllerWithActionSheet:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v24 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)[location[0] actions];
  BOOL v10 = [v9 count] != 0;

  if (v10)
  {
    id v5 = v24;
    id v7 = (id)[location[0] title];
    id v6 = (id)[location[0] message];
    id v19 = (id)objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7);

    [v19 setActionSheet:location[0]];
    id v18 = (id)[location[0] alertDelegate];
    id v8 = (id)[location[0] actions];
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke;
    v15 = &unk_2648A4540;
    id v16 = v18;
    id v17 = v19;
    [v8 enumerateObjectsUsingBlock:&v11];

    id v25 = v19;
    int v20 = 1;
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v22 = CarPlaySupportGeneralLogging();
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v24);
      _os_log_error_impl(&dword_22B689000, (os_log_t)v22, v21, "No actions attached to action sheet %@", v26, 0xCu);
    }
    objc_storeStrong(&v22, 0);
    id v25 = 0;
    int v20 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v25;

  return v3;
}

void __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  v15[2] = a4;
  v15[1] = a1;
  id v6 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke_2;
  int v12 = &unk_2648A4518;
  id v13 = a1[4];
  id v14 = location[0];
  v15[0] = (id)objc_msgSend(v6, "alertActionRepresentationWithHandler:");
  [a1[5] addAction:v15[0]];
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __65__CPSActionSheetController_actionSheetControllerWithActionSheet___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([a1[4] conformsToProtocol:&unk_26DF78390])
  {
    id v2 = a1[4];
    id v3 = (id)[a1[5] identifier];
    objc_msgSend(v2, "handleAlertActionForIdentifier:");
  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  [(CPSActionSheetController *)&v10 viewWillAppear:a3];
  uint64_t v8 = [(CPSActionSheetController *)v13 actionSheet];
  id v7 = (id)[(CPActionSheetTemplate *)v8 alertDelegate];
  char v9 = [v7 conformsToProtocol:&unk_26DF72840];

  if (v9)
  {
    id v6 = [(CPSActionSheetController *)v13 actionSheet];
    id v5 = (id)[(CPActionSheetTemplate *)v6 alertDelegate];
    v4 = [(CPSActionSheetController *)v13 actionSheet];
    id v3 = (id)[(CPActionSheetTemplate *)v4 identifier];
    objc_msgSend(v5, "templateWillAppearWithIdentifier:animated:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  [(CPSActionSheetController *)&v10 viewDidAppear:a3];
  uint64_t v8 = [(CPSActionSheetController *)v13 actionSheet];
  id v7 = (id)[(CPActionSheetTemplate *)v8 alertDelegate];
  char v9 = [v7 conformsToProtocol:&unk_26DF72840];

  if (v9)
  {
    id v6 = [(CPSActionSheetController *)v13 actionSheet];
    id v5 = (id)[(CPActionSheetTemplate *)v6 alertDelegate];
    v4 = [(CPSActionSheetController *)v13 actionSheet];
    id v3 = (id)[(CPActionSheetTemplate *)v4 identifier];
    objc_msgSend(v5, "templateDidAppearWithIdentifier:animated:");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  [(CPSActionSheetController *)&v10 viewWillDisappear:a3];
  uint64_t v8 = [(CPSActionSheetController *)v13 actionSheet];
  id v7 = (id)[(CPActionSheetTemplate *)v8 alertDelegate];
  char v9 = [v7 conformsToProtocol:&unk_26DF72840];

  if (v9)
  {
    id v6 = [(CPSActionSheetController *)v13 actionSheet];
    id v5 = (id)[(CPActionSheetTemplate *)v6 alertDelegate];
    v4 = [(CPSActionSheetController *)v13 actionSheet];
    id v3 = (id)[(CPActionSheetTemplate *)v4 identifier];
    objc_msgSend(v5, "templateWillDisappearWithIdentifier:animated:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSActionSheetController;
  [(CPSActionSheetController *)&v10 viewDidDisappear:a3];
  uint64_t v8 = [(CPSActionSheetController *)v13 actionSheet];
  id v7 = (id)[(CPActionSheetTemplate *)v8 alertDelegate];
  char v9 = [v7 conformsToProtocol:&unk_26DF72840];

  if (v9)
  {
    id v6 = [(CPSActionSheetController *)v13 actionSheet];
    id v5 = (id)[(CPActionSheetTemplate *)v6 alertDelegate];
    v4 = [(CPSActionSheetController *)v13 actionSheet];
    id v3 = (id)[(CPActionSheetTemplate *)v4 identifier];
    objc_msgSend(v5, "templateDidDisappearWithIdentifier:animated:");
  }
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (CPActionSheetTemplate)actionSheet
{
  return self->_actionSheet;
}

- (void)setActionSheet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end