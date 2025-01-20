@interface FLAlertControllerHelper
+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 presentingController:(id)a6;
@end

@implementation FLAlertControllerHelper

+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 presentingController:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v27 = a4;
  id v9 = a5;
  id v26 = a6;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x263F1C3F0];
        v17 = objc_msgSend(v15, "title", v26);
        uint64_t v18 = [v15 style];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __86__FLAlertControllerHelper_presentAlertWithTitle_message_actions_presentingController___block_invoke;
        v34[3] = &unk_2645F2650;
        v34[4] = v15;
        v19 = [v16 actionWithTitle:v17 style:v18 handler:v34];
        [v10 addObject:v19];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  v20 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v28 message:v27 preferredStyle:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(v20, "addAction:", *(void *)(*((void *)&v30 + 1) + 8 * j), v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v23);
  }

  [v26 presentViewController:v20 animated:1 completion:0];
}

void __86__FLAlertControllerHelper_presentAlertWithTitle_message_actions_presentingController___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) handler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) handler];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

@end