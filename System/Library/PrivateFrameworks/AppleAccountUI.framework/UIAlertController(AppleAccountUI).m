@interface UIAlertController(AppleAccountUI)
+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:;
+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:actionHandler:;
+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:;
+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:actionHandler:;
+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:destructiveButtonTitle:actionHandler:;
+ (uint64_t)alertWithTitle:()AppleAccountUI message:;
- (id)_handlerWithMultiActionHandler:()AppleAccountUI;
- (id)_handlerWithSingleActionHandler:()AppleAccountUI;
@end

@implementation UIAlertController(AppleAccountUI)

+ (uint64_t)alertWithTitle:()AppleAccountUI message:
{
  return [MEMORY[0x263F82418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
}

+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:actionHandler:
{
  v9 = (void *)MEMORY[0x263F82418];
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v13 = (void *)MEMORY[0x263F82400];
  v14 = [v12 _handlerWithSingleActionHandler:v10];

  v15 = [v13 actionWithTitle:v11 style:0 handler:v14];

  [v12 addAction:v15];
  return v12;
}

+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() alertWithTitle:v9 message:v8 buttonTitle:v7 actionHandler:0];

  return v10;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:actionHandler:
{
  id v11 = (void *)MEMORY[0x263F82418];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = [v11 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v16 = (void *)MEMORY[0x263F82400];
  v17 = [v15 _handlerWithMultiActionHandler:v12];
  v18 = [v16 actionWithTitle:v14 style:1 handler:v17];

  [v15 addAction:v18];
  v19 = (void *)MEMORY[0x263F82400];
  v20 = [v15 _handlerWithMultiActionHandler:v12];

  v21 = [v19 actionWithTitle:v13 style:0 handler:v20];

  [v15 addAction:v21];
  return v15;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:destructiveButtonTitle:actionHandler:
{
  id v11 = (void *)MEMORY[0x263F82418];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = [v11 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v16 = (void *)MEMORY[0x263F82400];
  v17 = [v15 _handlerWithMultiActionHandler:v12];
  v18 = [v16 actionWithTitle:v14 style:1 handler:v17];

  [v15 addAction:v18];
  v19 = (void *)MEMORY[0x263F82400];
  v20 = [v15 _handlerWithMultiActionHandler:v12];

  v21 = [v19 actionWithTitle:v13 style:2 handler:v20];

  [v15 addAction:v21];
  return v15;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() alertWithTitle:v12 message:v11 cancelButtonTitle:v10 defaultButtonTitle:v9 actionHandler:0];

  return v13;
}

- (id)_handlerWithSingleActionHandler:()AppleAccountUI
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__UIAlertController_AppleAccountUI___handlerWithSingleActionHandler___block_invoke;
    aBlock[3] = &unk_263F93260;
    id v8 = v3;
    v5 = _Block_copy(aBlock);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_handlerWithMultiActionHandler:()AppleAccountUI
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIAlertController_AppleAccountUI___handlerWithMultiActionHandler___block_invoke;
    aBlock[3] = &unk_263F93260;
    id v8 = v3;
    v5 = _Block_copy(aBlock);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end