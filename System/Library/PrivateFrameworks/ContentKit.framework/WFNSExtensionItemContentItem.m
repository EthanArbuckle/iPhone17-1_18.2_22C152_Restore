@interface WFNSExtensionItemContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithObject:(id)a3 sourceAppBundleIdentifier:(id)a4;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)cachesSupportedTypes;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)itemProvidersSupportType:(id)a3;
- (NSArray)extensionSubItems;
- (NSExtensionItem)extensionItem;
- (id)extensionItemName;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)itemProviderItems;
- (id)itemProviders;
- (id)name;
- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)preloadImportantItemsWithCompletionHandler:(id)a3;
- (void)setExtensionSubItems:(id)a3;
@end

@implementation WFNSExtensionItemContentItem

- (void).cxx_destruct
{
}

- (void)setExtensionSubItems:(id)a3
{
}

- (NSArray)extensionSubItems
{
  return self->_extensionSubItems;
}

- (BOOL)cachesSupportedTypes
{
  return 0;
}

- (void)preloadImportantItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFNSExtensionItemContentItem *)self itemProviderItems];
  v6 = [(WFNSExtensionItemContentItem *)self extensionItem];
  v7 = [v6 userInfo];
  v8 = [v7 objectForKey:@"WFPhotosAssetIdentifiers"];

  uint64_t v9 = [v8 count];
  LOBYTE(v9) = v9 == [v5 count];
  v10 = objc_opt_new();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke;
  v17[3] = &unk_26428AB58;
  char v21 = v9;
  id v18 = v8;
  id v19 = v10;
  v20 = self;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_5;
  v14[3] = &unk_26428AB80;
  id v15 = v19;
  id v16 = v4;
  v14[4] = self;
  id v11 = v19;
  id v12 = v4;
  id v13 = v8;
  objc_msgSend(v5, "if_mapAsynchronously:completionHandler:", v17, v14);
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_26428AB30;
  char v20 = *(unsigned char *)(a1 + 56);
  id v18 = v8;
  id v14 = v7;
  id v15 = *(id *)(a1 + 32);
  uint64_t v19 = a3;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = v7;
  id v12 = v8;
  [v11 preloadImportantItemsWithCompletionHandler:v13];
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v25 = a3;
  [*(id *)(a1 + 32) setExtensionSubItems:v5];
  v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  id v7 = objc_opt_new();
  [v6 setObject:v7 forKey:objc_opt_class()];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v14 = objc_opt_class();
        if ([v14 isSubclassOfClass:objc_opt_class()]) {
          id v14 = objc_opt_class();
        }
        id v15 = [v6 objectForKey:v14];
        id v16 = v15;
        if (v15)
        {
          [v15 addObject:v13];
        }
        else
        {
          uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
          [v6 setObject:v17 forKey:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v24 = [v18 objectForKey:v23];
        [*(id *)(a1 + 32) setSubItems:v24 forClass:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v5 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 80))
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3;
      v20[3] = &unk_26428AAE0;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 72);
      id v21 = v6;
      uint64_t v24 = v7;
      id v22 = *(id *)(a1 + 32);
      id v23 = *(id *)(a1 + 64);
      [v5 getFileRepresentation:v20 forType:0];

      id v8 = v21;
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) itemProvider];
      uint64_t v10 = [(id)*MEMORY[0x263F1DC40] identifier];
      int v11 = [v9 hasItemConformingToTypeIdentifier:v10];

      if (!v11)
      {
        id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        goto LABEL_3;
      }
      id v12 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4;
      v15[3] = &unk_26428AB08;
      id v19 = *(id *)(a1 + 64);
      id v16 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      id v17 = v13;
      uint64_t v18 = v14;
      [v12 getObjectRepresentation:v15 forClass:objc_opt_class()];

      id v8 = v19;
    }

    goto LABEL_9;
  }
  id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_3:
  v4();
LABEL_9:
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[7];
  id v5 = a2;
  id v8 = [v3 objectAtIndex:v4];
  id v6 = +[WFPhotoItemProviderContentItem itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:](WFPhotoItemProviderContentItem, "itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:", a1[5], v5);

  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v7 = (void *)a1[5];
  }
  (*(void (**)(void, void *, void))(a1[6] + 16))(a1[6], v7, 0);
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [a2 objectForKey:*MEMORY[0x263F07FF0]];
  if (v3)
  {
    uint64_t v4 = [WFJavaScriptRunner alloc];
    id v5 = [*(id *)(a1 + 32) itemProvider];
    id v6 = [(WFJavaScriptRunner *)v4 initWithItemProvider:v5];

    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    id v8 = [v7 UUIDString];

    [*(id *)(a1 + 40) setObject:v6 forKey:v8];
    uint64_t v9 = +[WFShareSheetSafariWebPage webPageFromPreprocessingResult:v3 javaScriptRunnerIdentifier:v8];
    uint64_t v10 = *(void **)(a1 + 48);
    int v11 = +[WFObjectRepresentation object:v9];
    v14[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v10 setObjectRepresentations:v12 forClass:objc_opt_class()];

    id v13 = +[WFContentItem itemWithObject:v9];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(WFNSExtensionItemContentItem *)self extensionItem];
  id v12 = [v11 attributedContentText];
  uint64_t v13 = [v12 length];

  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = [(WFNSExtensionItemContentItem *)self extensionItem];
  id v15 = [v14 attributedContentText];
  id v16 = [(WFNSExtensionItemContentItem *)self extensionItemName];
  id v17 = +[WFContentItem itemWithObject:v15 named:v16];

  uint64_t v18 = [v17 supportedTypes];
  id v19 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v8];
  LODWORD(v16) = [v18 intersectsSet:v19];

  if (!v16)
  {

LABEL_5:
    uint64_t v20 = [(WFNSExtensionItemContentItem *)self extensionSubItems];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke;
    v23[3] = &unk_26428AF40;
    id v24 = v8;
    id v25 = v9;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_3;
    v21[3] = &unk_26428AF18;
    id v22 = v10;
    objc_msgSend(v20, "if_flatMapAsynchronously:completionHandler:", v23, v21);

    goto LABEL_6;
  }
  [v17 coerceToItemClasses:v8 options:v9 completionHandler:v10];

LABEL_6:
}

void __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_2;
  v10[3] = &unk_26428AF18;
  id v11 = v6;
  id v9 = v6;
  [a2 coerceToItemClasses:v8 options:v7 completionHandler:v10];
}

uint64_t __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToClass:objc_opt_class()])
  {
    id v5 = [(WFNSExtensionItemContentItem *)self extensionItem];
    id v6 = [v5 attachments];
    unsigned __int8 v7 = [v6 count] != 0;
  }
  else
  {
    if ([v4 conformsToClass:objc_opt_class()])
    {
      uint64_t v8 = [(WFContentItem *)self objectForClass:objc_opt_class()];
      unsigned __int8 v7 = v8 != 0;

      goto LABEL_10;
    }
    if (![v4 conformsToClass:objc_opt_class()])
    {
      v10.receiver = self;
      v10.super_class = (Class)WFNSExtensionItemContentItem;
      unsigned __int8 v7 = [(WFContentItem *)&v10 canGenerateRepresentationForType:v4];
      goto LABEL_10;
    }
    id v5 = [(WFNSExtensionItemContentItem *)self extensionItem];
    id v6 = [v5 attributedContentText];
    if (v6) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = [(WFNSExtensionItemContentItem *)self itemProvidersSupportType:v4];
    }
  }

LABEL_10:
  return v7;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = [(WFNSExtensionItemContentItem *)self itemProviders];
    id v9 = [(WFNSExtensionItemContentItem *)self extensionItemName];
    unsigned __int8 v7 = +[WFObjectRepresentation objects:v8 named:v9];
  }
  else if ((Class)objc_opt_class() == a3 {
         && ([(WFNSExtensionItemContentItem *)self extensionItem],
  }
             objc_super v10 = objc_claimAutoreleasedReturnValue(),
             [v10 attributedContentText],
             id v11 = objc_claimAutoreleasedReturnValue(),
             v10,
             v11))
  {
    id v12 = [(WFNSExtensionItemContentItem *)self extensionItemName];
    uint64_t v13 = +[WFObjectRepresentation object:v11 named:v12];
    v15[0] = v13;
    unsigned __int8 v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  return v7;
}

- (BOOL)itemProvidersSupportType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(WFNSExtensionItemContentItem *)self extensionItem];
  id v6 = [v5 attachments];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v4 string];
        LOBYTE(v10) = [v10 hasItemConformingToTypeIdentifier:v11];

        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)name
{
  id v3 = [(WFNSExtensionItemContentItem *)self extensionItemName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFNSExtensionItemContentItem;
    id v5 = [(WFContentItem *)&v8 name];
  }
  id v6 = v5;

  return v6;
}

- (id)extensionItemName
{
  v2 = [(WFNSExtensionItemContentItem *)self extensionItem];
  id v3 = [v2 attributedTitle];
  id v4 = [v3 string];

  return v4;
}

- (id)itemProviders
{
  v2 = [(WFNSExtensionItemContentItem *)self extensionItem];
  id v3 = [v2 attachments];

  return v3;
}

- (id)itemProviderItems
{
  uint64_t v3 = objc_opt_class();
  id v4 = +[WFCoercionOptions new];
  id v5 = [(WFContentItem *)self itemsByCoercingToItemClass:v3 options:v4 error:0];

  return v5;
}

- (NSExtensionItem)extensionItem
{
  uint64_t v3 = objc_opt_class();
  return (NSExtensionItem *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Extension items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Extension items", @"Extension items");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Extension item", @"Extension item");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFNSExtensionItemContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)itemWithObject:(id)a3 sourceAppBundleIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v7];
  id v12 = [MEMORY[0x263F0F9B0] sharedResolver];
  long long v13 = [v12 resolvedAppMatchingDescriptor:v11];

  if (v13)
  {
    long long v14 = +[WFAppContentLocation locationWithAppDescriptor:v13];
    long long v15 = +[WFManagedConfigurationProfile defaultProfile];
    int v16 = [v15 isAccountBasedSourceApp:v7];

    if (v16)
    {
      id v17 = [v10 userInfo];
      uint64_t v26 = 0;
      long long v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v18 = (void *)get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr;
      uint64_t v29 = get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr;
      if (!get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke;
        long long v31 = &unk_26428AC60;
        long long v32 = &v26;
        __get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke(buf);
        uint64_t v18 = (void *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (!v18)
      {
        id v24 = [MEMORY[0x263F08690] currentHandler];
        id v25 = [NSString stringWithUTF8String:"NSString *get_UINSExtensionItemUserInfoIsContentManagedKey(void)"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFNSExtensionItemContentItem.m", 27, @"%s", dlerror());

        __break(1u);
      }
      id v19 = [v17 objectForKeyedSubscript:*v18];

      if (v19)
      {
        if ([v19 BOOLValue]) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = 1;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v22 = +[WFAppContentLocation locationWithAppDescriptor:v13 managedLevel:v20];

      long long v14 = v22;
    }
    if (v10) {
      [a1 itemWithObject:v10 origin:v14 disclosureLevel:1];
    }
    else {
    id v21 = [a1 itemWithObject:v8 origin:v14 disclosureLevel:1];
    }
  }
  else
  {
    long long v14 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFNSExtensionItemContentItem itemWithObject:sourceAppBundleIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve app descriptor with bundle identifier: %@", buf, 0x16u);
    }
    id v21 = 0;
  }

  return v21;
}

@end