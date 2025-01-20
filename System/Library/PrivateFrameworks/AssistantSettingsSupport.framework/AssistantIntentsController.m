@interface AssistantIntentsController
- (AssistantIntentsController)init;
- (NSArray)intentsSpecifiers;
- (id)accesssForSpecifier:(id)a3;
- (id)specifiers;
- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3;
- (void)dealloc;
- (void)setAccess:(id)a3 forSpecifier:(id)a4;
- (void)setIntentsSpecifiers:(id)a3;
- (void)tccPreferencesChanged;
- (void)viewDidTapLearnMore:(id)a3;
@end

@implementation AssistantIntentsController

- (AssistantIntentsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantIntentsController;
  v2 = [(AssistantIntentsController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)tccPreferencesChangedCallback, @"com.apple.tcc.access.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.tcc.access.changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)AssistantIntentsController;
  [(AssistantIntentsController *)&v4 dealloc];
}

- (void)tccPreferencesChanged
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantIntentsController_tccPreferencesChanged__block_invoke;
  v2[3] = &unk_26457CFB0;
  v2[4] = self;
  [(AssistantIntentsController *)self _fetchIntentsSpecifiersWithCompletion:v2];
}

void __51__AssistantIntentsController_tccPreferencesChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  objc_super v5 = [*(id *)(a1 + 32) intentsSpecifiers];
  uint64_t v6 = [v5 count];

  if (v4 == v6 && [v3 count])
  {
    unint64_t v7 = 0;
    char v8 = 0;
    uint64_t v9 = *MEMORY[0x263F60308];
    do
    {
      while (1)
      {
        v10 = [v3 objectAtIndexedSubscript:v7];
        v11 = [v10 propertyForKey:v9];
        v12 = [*(id *)(a1 + 32) intentsSpecifiers];
        v13 = [v12 objectAtIndexedSubscript:v7];
        v14 = [v13 propertyForKey:v9];

        if (v11 == v14) {
          break;
        }
        v15 = [*(id *)(a1 + 32) intentsSpecifiers];
        v16 = [v15 objectAtIndexedSubscript:v7];
        v17 = [v3 objectAtIndexedSubscript:v7];
        v18 = [v17 propertyForKey:v9];
        [v16 setProperty:v18 forKey:v9];

        ++v7;
        char v8 = 1;
        if ([v3 count] <= v7) {
          goto LABEL_10;
        }
      }
      ++v7;
    }
    while ([v3 count] > v7);
    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__AssistantIntentsController_tccPreferencesChanged__block_invoke_2;
    block[3] = &unk_26457CF88;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
LABEL_11:
}

uint64_t __51__AssistantIntentsController_tccPreferencesChanged__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(AssistantIntentsController *)self loadSpecifiersFromPlistName:@"Assistant_Intents" target:self];
    objc_super v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;

    if (self->_intentsSpecifiers)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "arrayByAddingObjectsFromArray:");
      uint64_t v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      unint64_t v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;
    }
    else
    {
      char v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) lastObject];
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __40__AssistantIntentsController_specifiers__block_invoke;
      v11[3] = &unk_26457D000;
      objc_copyWeak(&v12, &from);
      objc_copyWeak(&v13, &location);
      [(AssistantIntentsController *)self _fetchIntentsSpecifiersWithCompletion:v11];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  uint64_t v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);

  return v9;
}

void __40__AssistantIntentsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIntentsSpecifiers:v3];

  if ([v3 count])
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__AssistantIntentsController_specifiers__block_invoke_2;
      block[3] = &unk_26457CFD8;
      objc_copyWeak(&v10, v4);
      id v8 = v3;
      id v9 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v10);
    }
  }
}

void __40__AssistantIntentsController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained insertContiguousSpecifiers:*(void *)(a1 + 32) afterSpecifier:*(void *)(a1 + 40) animated:0];
}

- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__AssistantIntentsController__fetchIntentsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_26457D028;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[IntentsUtilities intentsAppsWithCompletion:v6];
}

void __68__AssistantIntentsController__fetchIntentsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v23 = a1;
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS_GROUP"];
    v18 = v22 = v4;
    objc_msgSend(v4, "addObject:");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v21 = *(void *)v25;
      uint64_t v20 = *MEMORY[0x263F60188];
      uint64_t v7 = *MEMORY[0x263EFFB40];
      uint64_t v8 = *MEMORY[0x263F601A8];
      uint64_t v9 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v12 = (void *)MEMORY[0x263F5FC40];
          id v13 = [v11 displayName];
          v14 = [v12 preferenceSpecifierNamed:v13 target:*(void *)(v23 + 32) set:sel_setAccess_forSpecifier_ get:sel_accesssForSpecifier_ detail:0 cell:6 edit:0];

          v15 = [v11 appID];
          [v14 setProperty:v15 forKey:v20];

          [v14 setProperty:v7 forKey:v8];
          v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "accessGranted"));
          [v14 setProperty:v16 forKey:v9];

          v17 = [v11 appID];
          [v14 setProperty:v17 forKey:@"intentsAppID"];

          [v22 addObject:v14];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }

    (*(void (**)(void))(*(void *)(v23 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x263F60308];
  uint64_t v7 = [v5 propertyForKey:*MEMORY[0x263F60308]];
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [v5 propertyForKey:@"intentsAppID"];
    +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", [v10 BOOLValue], v9);
    [v5 setProperty:v10 forKey:v6];
  }
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (void)viewDidTapLearnMore:(id)a3
{
  id v4 = objc_alloc_init(SiriAboutAssistantModalViewController);
  [(SiriModalTextViewController *)v4 presentFromParentViewController:self];
}

- (NSArray)intentsSpecifiers
{
  return self->_intentsSpecifiers;
}

- (void)setIntentsSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end