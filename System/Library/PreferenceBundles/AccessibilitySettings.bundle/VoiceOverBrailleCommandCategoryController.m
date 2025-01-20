@interface VoiceOverBrailleCommandCategoryController
- (BOOL)keyIsSupported:(id)a3;
- (VoiceOverBrailleCommandCategoryController)init;
- (id)_getCommandDescription:(id)a3;
- (id)_specifierForCommand:(id)a3;
- (id)specifiers;
@end

@implementation VoiceOverBrailleCommandCategoryController

- (VoiceOverBrailleCommandCategoryController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverBrailleCommandCategoryController;
  v2 = [(VoiceOverBrailleCommandCategoryController *)&v6 init];
  if (v2)
  {
    v3 = (SCROBrailleClient *)[objc_alloc((Class)SCROBrailleClient) initWithDelegate:v2];
    brailleClient = v2->_brailleClient;
    v2->_brailleClient = v3;

    [(SCROBrailleClient *)v2->_brailleClient setKeepConnectionAlive:1];
    [(SCROBrailleClient *)v2->_brailleClient setDisplayDescriptorCallbackEnabled:0];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v5 = [v4 objectForKey:@"bt-device"];
  device = self->_device;
  self->_device = v5;

  v7 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v8 = [v7 objectForKey:@"braille-category"];
  category = self->_category;
  self->_category = v8;

  v10 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v11 = [v10 objectForKey:@"input-manager"];
  inputManager = self->_inputManager;
  self->_inputManager = v11;

  v13 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v14 = [v13 objectForKey:@"display-token"];
  self->_token = [v14 intValue];

  uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
  v16 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v16)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = +[PSSpecifier groupSpecifierWithID:@"BrailleCommandGroup"];
    [v17 addObject:v18];
    id v19 = objc_alloc_init((Class)VOSVoiceOverCommandInfo);
    id v20 = objc_alloc_init((Class)VOSVoiceOverCommandInfo);
    v21 = [v20 brailleCommandsForCategory:self->_category];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __55__VoiceOverBrailleCommandCategoryController_specifiers__block_invoke;
    v38[3] = &unk_209D00;
    id v22 = v19;
    id v39 = v22;
    v23 = [v21 sortedArrayUsingComparator:v38];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        v28 = 0;
        do
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = -[VoiceOverBrailleCommandCategoryController _specifierForCommand:](self, "_specifierForCommand:", *(void *)(*((void *)&v34 + 1) + 8 * (void)v28), (void)v34);
          if (v29) {
            [v17 addObject:v29];
          }

          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v26);
    }

    v30 = +[PSSpecifier groupSpecifierWithID:@"AddNewCommand"];
    [v17 addObject:v30];
    v31 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
    *(void *)&self->AXUISettingsBaseListController_opaque[v15] = v17;
    id v32 = v17;

    v16 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
  }

  return v16;
}

id __55__VoiceOverBrailleCommandCategoryController_specifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 localizedNameForCommand:a2];
  v8 = [*(id *)(a1 + 32) localizedNameForCommand:v6];

  id v9 = [v7 caseInsensitiveCompare:v8];
  return v9;
}

- (BOOL)keyIsSupported:(id)a3
{
  return VOTBrailleKeyIsSupported(a3);
}

- (id)_getCommandDescription:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v5 = [(SCROMobileBrailleDisplayInputManager *)self->_inputManager commandDictionaryForDisplayWithToken:self->_token];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __68__VoiceOverBrailleCommandCategoryController__getCommandDescription___block_invoke;
  v9[3] = &unk_20A1F0;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  v12 = &v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __68__VoiceOverBrailleCommandCategoryController__getCommandDescription___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 userInfo];
  id v10 = [v9 objectForKey:@"braille-command"];
  unsigned int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
    unsigned int v12 = [*(id *)(a1 + 40) keyIsSupported:v17];

    uint64_t v13 = v17;
    if (v12)
    {
      uint64_t v14 = VOTBrailleButtonName((uint64_t)v17, *(void **)(*(void *)(a1 + 40) + 200), *(unsigned int *)(*(void *)(a1 + 40) + 208));
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v13 = v17;
      *a4 = 1;
    }
  }
  else
  {

    uint64_t v13 = v17;
  }
}

- (id)_specifierForCommand:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)VOSVoiceOverCommandInfo);
  id v6 = [v5 localizedNameForCommand:v4];

  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_getCommandDescription:" detail:objc_opt_class() cell:2 edit:0];
  id v8 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  id v9 = v8;
  device = self->_device;
  if (device) {
    [v8 setObject:device forKey:@"bt-device"];
  }
  [v9 setObject:self->_inputManager forKey:@"input-manager"];
  [v9 setObject:v4 forKey:@"braille-command"];
  unsigned int v11 = +[NSNumber numberWithInt:self->_token];
  [v9 setObject:v11 forKey:@"display-token"];

  [v7 setUserInfo:v9];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_storeStrong((id *)&self->_brailleClient, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end