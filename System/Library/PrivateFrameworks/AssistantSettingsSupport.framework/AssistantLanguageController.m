@interface AssistantLanguageController
+ (id)bundle;
- (AssistantLanguageController)init;
- (BOOL)multilingualEnabledForLanguageCode:(id)a3;
- (NSArray)multilingualResponseLanguageVariants;
- (id)_itemsFromParent;
- (id)specifiers;
- (void)_signalDidSelectVoice;
- (void)languageCodeDidChange:(id)a3;
- (void)listItemSelected:(id)a3;
- (void)reloadSpecifier:(id)a3;
- (void)setMultilingualEnabled:(BOOL)a3 forLanguageCode:(id)a4;
- (void)setMultilingualResponseLanguageVariants:(id)a3;
- (void)setParentController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDetailedTextLabelForSpecifier:(id)a3;
- (void)updateSelectionToCurrentAssistantLanguageAndScrollToVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AssistantLanguageController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantLanguageBundle;
  if (!bundle_sAssistantLanguageBundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantLanguageBundle;
    bundle_sAssistantLanguageBundle = v3;

    v2 = (void *)bundle_sAssistantLanguageBundle;
  }

  return v2;
}

- (AssistantLanguageController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantLanguageController;
  v2 = [(AssistantDetailListController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    multilingualLanguageSettings = v2->_multilingualLanguageSettings;
    v2->_multilingualLanguageSettings = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  startDate = self->_startDate;
  self->_startDate = v5;

  v8.receiver = self;
  v8.super_class = (Class)AssistantLanguageController;
  [(AssistantDetailListController *)&v8 viewDidAppear:v3];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_languageCodeDidChange_ name:*MEMORY[0x263F282E8] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AssistantLanguageController;
  [(AssistantDetailListController *)&v4 viewWillAppear:a3];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
    [(AssistantLanguageController *)self updateSelectionToCurrentAssistantLanguageAndScrollToVisible:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_punchingOutToDetail)
  {
    checkedSpecifier = self->super._checkedSpecifier;
    if (checkedSpecifier)
    {
      objc_super v6 = [(PSSpecifier *)checkedSpecifier values];
      v7 = [v6 firstObject];

      objc_super v8 = [(AssistantLanguageController *)self parentController];
      v9 = [(NSMutableDictionary *)self->_multilingualLanguageSettings objectForKey:v7];
      objc_msgSend(v8, "setSelectedLanguageWantsMultilingualEnabled:", objc_msgSend(v9, "BOOLValue"));

      v10 = [(AssistantLanguageController *)self specifier];
      [v10 performSetterWithValue:v7];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AssistantLanguageController;
  [(AssistantLanguageController *)&v11 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  objc_super v6 = (void *)v5;
  startDate = self->_startDate;
  if (!startDate) {
    startDate = (NSDate *)v5;
  }
  objc_super v8 = startDate;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v9 = (void *)getCKKnowledgeStoreClass_softClass;
  uint64_t v28 = getCKKnowledgeStoreClass_softClass;
  if (!getCKKnowledgeStoreClass_softClass)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getCKKnowledgeStoreClass_block_invoke;
    v23 = &unk_26457D098;
    v24 = &v25;
    __getCKKnowledgeStoreClass_block_invoke((uint64_t)&v20);
    v9 = (void *)v26[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v25, 8);
  objc_super v11 = [v10 defaultSynchedKnowledgeStore];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v12 = (void *)getCKPermanentEventStoreClass_softClass;
  uint64_t v28 = getCKPermanentEventStoreClass_softClass;
  if (!getCKPermanentEventStoreClass_softClass)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getCKPermanentEventStoreClass_block_invoke;
    v23 = &unk_26457D098;
    v24 = &v25;
    __getCKPermanentEventStoreClass_block_invoke((uint64_t)&v20);
    v12 = (void *)v26[3];
  }
  v13 = v12;
  _Block_object_dispose(&v25, 8);
  v14 = (void *)[[v13 alloc] initWithKnowledgeStore:v11];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v15 = (void *)getCKEventClass_softClass;
  uint64_t v28 = getCKEventClass_softClass;
  if (!getCKEventClass_softClass)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getCKEventClass_block_invoke;
    v23 = &unk_26457D098;
    v24 = &v25;
    __getCKEventClass_block_invoke((uint64_t)&v20);
    v15 = (void *)v26[3];
  }
  v16 = v15;
  _Block_object_dispose(&v25, 8);
  v17 = (void *)[[v16 alloc] initWithIdentifier:@"SiriLanguageSettingsShown" startDate:v8 endDate:v6 metadata:0];
  [v14 recordEvent:v17 completionHandler:&__block_literal_global_4];
  v19.receiver = self;
  v19.super_class = (Class)AssistantLanguageController;
  [(AssistantLanguageController *)&v19 viewDidDisappear:v3];
  v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 removeObserver:self name:*MEMORY[0x263F282E8] object:0];

  self->_punchingOutToDetail = 0;
}

void __48__AssistantLanguageController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_UnableToRecord.isa, a2);
  }
}

- (void)setParentController:(id)a3
{
  id v4 = a3;
  if (self->super._supportsMultilingualResponses && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = [v4 multilingualResponseLanguageVariants];
    multilingualResponseLanguageVariants = self->_multilingualResponseLanguageVariants;
    self->_multilingualResponseLanguageVariants = v5;
  }
  v7.receiver = self;
  v7.super_class = (Class)AssistantLanguageController;
  [(AssistantLanguageController *)&v7 setParentController:v4];
}

- (id)specifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    id v4 = [(AssistantLanguageController *)self _itemsFromParent];
    uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v4;
  }
  if (self->super._supportsMultilingualResponses
    && [(NSArray *)self->_multilingualResponseLanguageVariants count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v6 = self->_multilingualResponseLanguageVariants;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      uint64_t v10 = *MEMORY[0x263F60080];
      uint64_t v11 = *MEMORY[0x263F600A8];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v13 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "specifierForID:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          v14 = v13;
          if (v13)
          {
            [v13 setCellType:2];
            [v14 setDetailControllerClass:objc_opt_class()];
            [v14 setProperty:objc_opt_class() forKey:v10];
            [v14 setProperty:MEMORY[0x263EFFA88] forKey:v11];
            [(AssistantLanguageController *)self updateDetailedTextLabelForSpecifier:v14];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  -[AssistantLanguageController updateSelectionToCurrentAssistantLanguageAndScrollToVisible:](self, "updateSelectionToCurrentAssistantLanguageAndScrollToVisible:", 0, (void)v17);
  v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);

  return v15;
}

- (void)reloadSpecifier:(id)a3
{
  id v4 = a3;
  if (self->super._supportsMultilingualResponses) {
    [(AssistantLanguageController *)self updateDetailedTextLabelForSpecifier:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)AssistantLanguageController;
  [(AssistantLanguageController *)&v5 reloadSpecifier:v4];
}

- (void)languageCodeDidChange:(id)a3
{
  [(AssistantLanguageController *)self reloadSpecifiers];

  [(AssistantLanguageController *)self _signalDidSelectVoice];
}

- (void)_signalDidSelectVoice
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  objc_super v5 = __52__AssistantLanguageController__signalDidSelectVoice__block_invoke;
  objc_super v6 = &unk_26457CF60;
  objc_copyWeak(&v7, &location);
  v2 = (void (**)(void))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v3, v4, v5, v6)) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__AssistantLanguageController__signalDidSelectVoice__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    v2 = (void *)WeakRetained[180];
    if (!v2)
    {
      uint64_t v3 = objc_alloc_init(AssistantSettingsSignalEmitter);
      uint64_t v4 = (void *)v5[180];
      v5[180] = v3;

      v2 = (void *)v5[180];
    }
    [v2 emitDidSelectVoiceSignal];
    WeakRetained = v5;
  }
}

- (id)_itemsFromParent
{
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  v23 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) values];
  uint64_t v4 = [v23 count];
  objc_super v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  objc_super v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LIST_ITEMS_GROUP_SPECIFIER"];
  groupSpecifier = self->super._groupSpecifier;
  self->super._groupSpecifier = v6;

  id v22 = v5;
  [v5 addObject:self->super._groupSpecifier];
  [(PSSpecifier *)self->super._groupSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  uint64_t v21 = v4;
  if (v4)
  {
    uint64_t v8 = 0;
    uint64_t v19 = *MEMORY[0x263F5FFE0];
    uint64_t v20 = *MEMORY[0x263F60140];
    do
    {
      uint64_t v9 = [v23 objectAtIndex:v8];
      uint64_t v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) titleDictionary];
      uint64_t v11 = [v10 objectForKey:v9];

      v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v9, 0);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v11, 0);
      v14 = (void *)MEMORY[0x263F5FC40];
      v15 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) target];
      v16 = [v14 preferenceSpecifierNamed:v11 target:v15 set:sel_setAssistantLanguage_forSpecifier_ get:0 detail:0 cell:3 edit:0];

      [v16 setIdentifier:v9];
      [v16 setValues:v12 titles:v13];
      if (self->super._supportsMultilingualResponses)
      {
        long long v17 = [(AssistantDetailListController *)self transparentImage];
        [v16 setProperty:v17 forKey:v20];

        [v16 setProperty:objc_opt_class() forKey:v19];
      }
      [v22 addObject:v16];

      ++v8;
    }
    while (v21 != v8);
  }

  return v22;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AssistantLanguageController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v9) objectAtIndex:v8];
    if ([v10 cellType] == 3)
    {
      [(AssistantLanguageController *)self listItemSelected:v7];
      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)AssistantLanguageController;
      [(AssistantLanguageController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v9), "objectAtIndex:", -[AssistantLanguageController indexForIndexPath:](self, "indexForIndexPath:", v7));
      uint64_t v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      sideTrippedToDetailForSpecifier = self->_sideTrippedToDetailForSpecifier;
      self->_sideTrippedToDetailForSpecifier = v11;

      self->_punchingOutToDetail = 1;
    }
  }
}

- (void)listItemSelected:(id)a3
{
  uint64_t v4 = [(AssistantLanguageController *)self indexForIndexPath:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v4];
    id obj = (id)v5;
    if (self->super._supportsMultilingualResponses)
    {
      id v6 = self->super._previousSelectedSpecifier;
      if (v6)
      {
        [(AssistantDetailListController *)self setChecked:0 forSpecifier:v6];
        [(AssistantLanguageController *)self reloadSpecifier:v6];
      }
      [(AssistantDetailListController *)self setChecked:1 forSpecifier:obj];
      objc_storeStrong((id *)&self->super._previousSelectedSpecifier, obj);
    }
    else
    {
      [(PSSpecifier *)self->super._groupSpecifier setProperty:v5 forKey:*MEMORY[0x263F60200]];
    }
  }
}

- (void)updateDetailedTextLabelForSpecifier:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [v18 values];
  uint64_t v5 = [v4 firstObject];

  id v6 = [MEMORY[0x263F285A0] sharedPreferences];
  int v7 = [v6 multilingualResponseEnabledForLanguage:v5];

  if (!self->_sideTrippedToDetailForSpecifier || !objc_msgSend(v18, "isEqual:"))
  {
    if (!v7) {
      goto LABEL_4;
    }
LABEL_6:
    objc_super v13 = NSString;
    uint64_t v9 = [v18 values];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v13 stringWithFormat:@"MULTILINGUAL_DETAIL_MIXED_%@", v10, 0];
    uint64_t v12 = 1;
    goto LABEL_7;
  }
  if ([(AssistantLanguageController *)self multilingualEnabledForLanguageCode:v5])
  {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v8 = NSString;
  uint64_t v9 = [v18 values];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v8 stringWithFormat:@"MULTILINGUAL_DETAIL_ENGLISH_ONLY_%@", v10, 0];
  uint64_t v12 = 0;
LABEL_7:

  multilingualLanguageSettings = self->_multilingualLanguageSettings;
  v15 = [NSNumber numberWithBool:v12];
  [(NSMutableDictionary *)multilingualLanguageSettings setObject:v15 forKey:v5];

  v16 = +[AssistantLanguageController bundle];
  long long v17 = [v16 localizedStringForKey:v11 value:&stru_26D2AB140 table:@"AssistantSettings"];

  if (v17 && ([v17 isEqualToString:v11] & 1) == 0) {
    [v18 setProperty:v17 forKey:*MEMORY[0x263F602C8]];
  }
  else {
    [v18 removePropertyForKey:*MEMORY[0x263F602C8]];
  }
}

- (void)updateSelectionToCurrentAssistantLanguageAndScrollToVisible:(BOOL)a3
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3)) {
    return;
  }
  BOOL v4 = a3;
  uint64_t v6 = +[AssistantUtilities assistantLanguage];
  sideTrippedToDetailForSpecifier = self->_sideTrippedToDetailForSpecifier;
  id v11 = (id)v6;
  if (sideTrippedToDetailForSpecifier)
  {
    uint64_t v8 = sideTrippedToDetailForSpecifier;
  }
  else
  {
    uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) specifierForID:v6];
    if (!v8) {
      goto LABEL_11;
    }
  }
  if (self->super._supportsMultilingualResponses)
  {
    if (self->super._previousSelectedSpecifier) {
      -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0);
    }
    objc_storeStrong((id *)&self->super._previousSelectedSpecifier, v8);
    [(AssistantDetailListController *)self setChecked:1 forSpecifier:v8];
    [(AssistantLanguageController *)self reloadSpecifier:v8];
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    [(PSSpecifier *)self->super._groupSpecifier setProperty:v8 forKey:*MEMORY[0x263F60200]];
    if (!v4) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = [(AssistantLanguageController *)self table];
  uint64_t v10 = [(AssistantLanguageController *)self indexPathForSpecifier:v8];
  [v9 scrollToRowAtIndexPath:v10 atScrollPosition:2 animated:1];

LABEL_11:
}

- (BOOL)multilingualEnabledForLanguageCode:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_multilingualLanguageSettings objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setMultilingualEnabled:(BOOL)a3 forLanguageCode:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    if ([v6 length])
    {
      multilingualLanguageSettings = self->_multilingualLanguageSettings;
      uint64_t v8 = [NSNumber numberWithBool:v4];
      [(NSMutableDictionary *)multilingualLanguageSettings setValue:v8 forKey:v9];
    }
  }

  MEMORY[0x270F9A758]();
}

- (NSArray)multilingualResponseLanguageVariants
{
  return self->_multilingualResponseLanguageVariants;
}

- (void)setMultilingualResponseLanguageVariants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilingualResponseLanguageVariants, 0);
  objc_storeStrong((id *)&self->_sideTrippedToDetailForSpecifier, 0);
  objc_storeStrong((id *)&self->_multilingualLanguageSettings, 0);
  objc_storeStrong((id *)&self->_signalEmitter, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end