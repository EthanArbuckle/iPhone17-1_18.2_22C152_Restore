@interface ICUlyssesGetSheetAction
- (BOOL)outputsMultipleItems;
- (id)outputContentClasses;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICUlyssesGetSheetAction

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v19[3] = &unk_264E590E0;
  id v20 = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3;
  v17[3] = &unk_264E5CA00;
  id v18 = v13;
  v16.receiver = self;
  v16.super_class = (Class)ICUlyssesGetSheetAction;
  id v14 = v13;
  id v15 = v12;
  [(ICSchemeAction *)&v16 performActionWithInput:a3 parameters:a4 userInterface:a5 successHandler:v19 errorHandler:v17];
}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  if (!a2 || a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v5[3] = &unk_264E5B5E8;
    id v6 = *(id *)(a1 + 32);
    [a2 getStringRepresentation:v5];
  }
}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 code] == 4)
  {
    v4 = [MEMORY[0x263EFFA40] workflowUserDefaults];
    [v4 removeObjectForKey:@"WFUlyssesAccessToken"];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"WFUlyssesAccessResourceAvailabilityChangedNotification" object:0];

    v10[0] = *MEMORY[0x263F08338];
    id v6 = WFLocalizedString(@"Ulysses Access Required");
    v11[0] = v6;
    v10[1] = *MEMORY[0x263F08320];
    v7 = WFLocalizedString(@"Please re-authorize Shortcuts with Ulysses to access this sheet.");
    v11[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F87400] code:0 userInfo:v8];

    id v3 = (id)v9;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 dataUsingEncoding:4];
    if ([v6 length])
    {
      id v15 = v5;
      v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v15];
      id v8 = v15;

      if (v7)
      {
        id v14 = v8;
        uint64_t v9 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v7 error:&v14];
        id v5 = v14;

        if (v9)
        {
          v10 = (void *)MEMORY[0x263F337B0];
          v11 = [MEMORY[0x263F337C8] itemWithObject:v9];
          v16[0] = v11;
          id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
          id v13 = [v10 collectionWithItems:v12];
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
        uint64_t v9 = 0;
        id v5 = v8;
      }
    }
    else
    {
      id v13 = 0;
      uint64_t v9 = 0;
      v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)outputContentClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)outputsMultipleItems
{
  return 0;
}

@end