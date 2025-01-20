@interface CKAppMenuDataSource
+ (BOOL)_shouldDisplayPluginInMenu:(id)a3;
+ (id)_defaultAppOrder;
+ (id)_sortedMenuItemsFromItems:(id)a3;
+ (id)appMenuWithTarget:(id)a3 traitCollection:(id)a4 conversation:(id)a5;
+ (id)imageForIdentifier:(id)a3 traitCollection:(id)a4;
+ (id)orderedItemsForTraitCollection:(id)a3 conversation:(id)a4;
@end

@implementation CKAppMenuDataSource

+ (id)imageForIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[CKBalloonPluginManager sharedInstance];
  v8 = [v7 pluginForExtensionIdentifier:v5];

  v9 = objc_msgSend(v8, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));
  if (!v9)
  {
    v10 = IMBalloonExtensionIDWithSuffix();
    if ([v5 isEqualToString:v10])
    {

LABEL_5:
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuAnimojiStickersIconForTraitCollection:v6];
LABEL_6:
      v9 = (void *)v14;

      goto LABEL_7;
    }
    v11 = IMBalloonExtensionIDWithSuffix();
    int v12 = [v5 isEqualToString:v11];

    if (v12) {
      goto LABEL_5;
    }
    v16 = IMBalloonExtensionIDWithSuffix();
    int v17 = [v5 isEqualToString:v16];

    if (v17)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuHashtagImagesIconForTraitCollection:v6];
      goto LABEL_6;
    }
    if ([v5 isEqualToString:@"kAppMenuEffectsItemIdentifier"])
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuEffectsIconForTraitCollection:v6];
      goto LABEL_6;
    }
    v18 = IMBalloonExtensionIDWithSuffix();
    if ([v5 isEqualToString:v18])
    {

LABEL_17:
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuPhotosIconForTraitCollection:v6];
      goto LABEL_6;
    }
    char v19 = [v5 isEqualToString:@"kAppMenuPhotosItemIdentifier"];

    if (v19) {
      goto LABEL_17;
    }
    if ([v5 isEqualToString:@"kAppMenuEmoji"])
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuEmojiIconForTraitCollection:v6];
      goto LABEL_6;
    }
    v20 = IMBalloonExtensionIDWithSuffix();
    int v21 = [v5 isEqualToString:v20];

    if (v21)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuApplePayIconForTraitCollection:v6];
      goto LABEL_6;
    }
    v22 = IMBalloonExtensionIDWithSuffix();
    int v23 = [v5 isEqualToString:v22];

    if (v23)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuTapToRadarIconForTraitCollection:v6];
      goto LABEL_6;
    }
    if ([v5 isEqualToString:@"kAppMenuAudio"])
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      uint64_t v14 = [v13 appMenuAudioMessagesIconForTraitCollection:v6];
      goto LABEL_6;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F6CC20]])
    {
      v24 = (void *)MEMORY[0x1E4F42A80];
      v25 = @"Mac-SendLaterIcon";
LABEL_30:
      v9 = [v24 ckImageNamed:v25 compatibleWithTraitCollection:v6];
      goto LABEL_7;
    }
    v26 = IMBalloonExtensionIDWithSuffix();
    int v27 = [v5 isEqualToString:v26];

    if (v27)
    {
      v24 = (void *)MEMORY[0x1E4F42A80];
      v25 = @"Mac-GenerativePlaygroundIcon";
      goto LABEL_30;
    }
    v9 = 0;
  }
LABEL_7:

  return v9;
}

+ (id)orderedItemsForTraitCollection:(id)a3 conversation:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isCarrierPigeonEnabled];

  if (!v8) {
    goto LABEL_8;
  }
  v9 = [v5 sendingService];
  uint64_t v10 = [MEMORY[0x1E4F6BDC0] iMessageLiteService];
  if (v9 == (void *)v10)
  {
  }
  else
  {
    v11 = (void *)v10;
    int v12 = [v5 chat];
    int v13 = [v12 shouldDisplayOffGridModeStatus];

    if (!v13) {
      goto LABEL_8;
    }
  }
  uint64_t v14 = [v5 chat];
  int v15 = [v14 supportsCapabilities:0x20000];

  if (v15)
  {
    v16 = [CKCustomAppMenuItem alloc];
    int v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"EFFECT_MENU_ITEM_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v19 = [(CKCustomAppMenuItem *)v16 initWithIdentifier:@"kAppMenuEffectsItemIdentifier" displayName:v18];
    [v6 addObject:v19];

    id v20 = v6;
    goto LABEL_20;
  }
LABEL_8:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v21 = +[CKBalloonPluginManager sharedInstance];
  v22 = [v21 visibleSwitcherPlugins];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if ([a1 _shouldDisplayPluginInMenu:v27]) {
          [v6 addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v24);
  }

  if ([v5 supportsSendLater])
  {
    v28 = [CKCustomAppMenuItem alloc];
    uint64_t v29 = *MEMORY[0x1E4F6CC20];
    v30 = CKFrameworkBundle();
    v31 = [v30 localizedStringForKey:@"SEND_MENU_ITEM_TITLE_SEND_LATER" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v32 = [(CKCustomAppMenuItem *)v28 initWithIdentifier:v29 displayName:v31];
    [v6 addObject:v32];
  }
  v33 = [CKCustomAppMenuItem alloc];
  v34 = CKFrameworkBundle();
  v35 = [v34 localizedStringForKey:@"EFFECT_MENU_ITEM_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v36 = [(CKCustomAppMenuItem *)v33 initWithIdentifier:@"kAppMenuEffectsItemIdentifier" displayName:v35];
  [v6 addObject:v36];

  id v20 = [a1 _sortedMenuItemsFromItems:v6];
LABEL_20:
  v37 = v20;

  return v37;
}

+ (id)_sortedMenuItemsFromItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v7 = [a1 _defaultAppOrder];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke;
  v24[3] = &unk_1E56218F0;
  id v8 = v4;
  id v25 = v8;
  id v9 = v6;
  id v26 = v9;
  id v10 = v5;
  id v27 = v10;
  [v7 enumerateObjectsUsingBlock:v24];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  char v19 = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_3;
  id v20 = &unk_1E5625E48;
  id v21 = v10;
  id v22 = v9;
  id v23 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [v11 enumerateObjectsUsingBlock:&v17];
  uint64_t v14 = objc_msgSend(v12, "reversedOrderedSet", v17, v18, v19, v20);
  int v15 = [v14 array];

  return v15;
}

void __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_2;
  v10[3] = &unk_1E5625E20;
  id v5 = v3;
  id v11 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v10];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    id v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) objectAtIndex:v6];
    [v8 addObject:v9];

    [*(id *)(a1 + 48) addIndex:v7];
  }
}

uint64_t __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "__ck_identifier");
  uint64_t v4 = [v3 hasSuffix:*(void *)(a1 + 32)];

  return v4;
}

void __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:") & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) objectAtIndex:a3];
    [v5 addObject:v6];
  }
}

+ (id)_defaultAppOrder
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)_shouldDisplayPluginInMenu:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v4 isClingEnabled]) {
    char v5 = CKIsStickersStripEnabled();
  }
  else {
    char v5 = 0;
  }

  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v7 = [v6 showAllInstalledMessageApps];

  if (v7) {
    goto LABEL_5;
  }
  id v8 = [v3 identifier];
  id v9 = IMBalloonExtensionIDWithSuffix();
  char v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v5 ^= 1u;
    goto LABEL_16;
  }
  id v11 = [v3 identifier];
  id v12 = IMBalloonExtensionIDWithSuffix();
  char v13 = [v11 isEqualToString:v12];

  if (v13) {
    goto LABEL_16;
  }
  uint64_t v14 = [v3 identifier];
  int v15 = IMBalloonExtensionIDWithSuffix();
  char v16 = [v14 isEqualToString:v15];

  if (v16)
  {
LABEL_5:
    char v5 = 1;
  }
  else
  {
    uint64_t v17 = [v3 identifier];
    uint64_t v18 = IMBalloonExtensionIDWithSuffix();
    int v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      id v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      char v21 = [v20 showTapToRadarMessagesApp];
    }
    else
    {
      id v22 = [v3 identifier];
      id v23 = IMBalloonExtensionIDWithSuffix();
      int v24 = [v22 isEqualToString:v23];

      if (!v24)
      {
        char v5 = 0;
        goto LABEL_16;
      }
      id v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      char v21 = [v20 isGenPlaygroundEnabled];
    }
    char v5 = v21;
  }
LABEL_16:

  return v5;
}

+ (id)appMenuWithTarget:(id)a3 traitCollection:(id)a4 conversation:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id val = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v21 = v9;
  id obj = [a1 orderedItemsForTraitCollection:v8 conversation:v9];
  uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int v15 = objc_msgSend(v14, "__ck_imageForTraitCollection:", v8);
        id location = 0;
        objc_initWeak(&location, val);
        char v16 = (void *)MEMORY[0x1E4F426E8];
        uint64_t v17 = objc_msgSend(v14, "__ck_displayName");
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __70__CKAppMenuDataSource_appMenuWithTarget_traitCollection_conversation___block_invoke;
        v24[3] = &unk_1E56210D8;
        objc_copyWeak(&v25, &location);
        void v24[4] = v14;
        uint64_t v18 = [v16 actionWithTitle:v17 image:v15 identifier:0 handler:v24];
        [v10 addObject:v18];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  int v19 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:16 children:v10];

  return v19;
}

void __70__CKAppMenuDataSource_appMenuWithTarget_traitCollection_conversation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained appSelectionInterfaceSelectedItem:*(void *)(a1 + 32)];
}

@end