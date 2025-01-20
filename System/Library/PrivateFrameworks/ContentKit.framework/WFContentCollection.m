@interface WFContentCollection
+ (BOOL)supportsSecureCoding;
+ (id)collectionWithItems:(id)a3;
+ (id)requiredResourcesForContentInPasteboard:(id)a3;
+ (void)_generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4;
+ (void)generateCollectionFromDragItems:(id)a3 allowedItemClasses:(id)a4 completionHandler:(id)a5;
+ (void)generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4;
+ (void)getContentItemsForPasteboardItems:(id)a3 resultBlock:(id)a4;
- (BOOL)canPerformCoercion:(id)a3;
- (BOOL)isCoercibleToItemClass:(Class)a3;
- (BOOL)isCoercibleToItemClasses:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)extensionItems;
- (NSArray)minimalExtensionItems;
- (NSLock)itemWriteLock;
- (NSMutableArray)mutableItems;
- (WFCoercionOptions)defaultCoercionOptions;
- (WFContentAttributionSet)attributionSet;
- (WFContentCollection)init;
- (WFContentCollection)initWithCoder:(id)a3;
- (WFContentCollection)initWithDefaultCoercionOptions:(id)a3;
- (WFContentCollection)initWithItems:(id)a3 defaultCoercionOptions:(id)a4;
- (id)collectionByFilteringItemsWithBlock:(id)a3 excludedItems:(id *)a4;
- (id)collectionByFilteringToItemClass:(Class)a3 excludedItems:(id *)a4;
- (id)collectionByMergingAttributionSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveCoercionOptionsForRequest:(id)a3;
- (id)requiredResourcesForContent;
- (int64_t)numberOfItems;
- (unint64_t)hash;
- (void)addFile:(id)a3;
- (void)addFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5;
- (void)addFileWithOriginAttribution:(id)a3;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)addObject:(id)a3;
- (void)addObject:(id)a3 named:(id)a4;
- (void)copyToPasteboard:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateFileRepresentations:(id)a3 forType:(id)a4 completionHandler:(id)a5;
- (void)enumerateObjectRepresentations:(id)a3 forClass:(Class)a4 completionHandler:(id)a5;
- (void)generateCollectionByCoercingToItemClass:(Class)a3 completionHandler:(id)a4;
- (void)generateCollectionByCoercingToItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5;
- (void)generateCollectionByCoercingToItemClasses:(id)a3 completionHandler:(id)a4;
- (void)generateCollectionByCoercingToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)generateCollectionByEvaluatingQuery:(id)a3 forContentItemClass:(Class)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (void)getBoolRepresentation:(id)a3;
- (void)getFileRepresentation:(id)a3 forType:(id)a4;
- (void)getFileRepresentationAndAttributionSet:(id)a3 forType:(id)a4;
- (void)getFileRepresentations:(id)a3 forType:(id)a4;
- (void)getFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5;
- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4;
- (void)getObjectRepresentationAndAttributionSet:(id)a3 forClass:(Class)a4;
- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4;
- (void)getObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getRichTextRepresentation:(id)a3;
- (void)getStringRepresentation:(id)a3;
- (void)getStringRepresentations:(id)a3;
- (void)performCoercion:(id)a3;
- (void)removeItem:(id)a3;
- (void)setDefaultCoercionOptions:(id)a3;
- (void)setItemWriteLock:(id)a3;
- (void)setMutableItems:(id)a3;
- (void)transformFileRepresentationsForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)transformFirstFileRepresentationForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)transformFirstObjectRepresentationForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)transformItemsAndFlattenUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)transformItemsUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)transformObjectRepresentationsForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation WFContentCollection

- (NSArray)minimalExtensionItems
{
  v2 = [(WFContentCollection *)self items];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_201);

  return (NSArray *)v3;
}

uint64_t __61__WFContentCollection_NSExtensionItem__minimalExtensionItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 minimalExtensionItem];
}

- (NSArray)extensionItems
{
  v2 = [(WFContentCollection *)self items];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_1266);

  return (NSArray *)v3;
}

uint64_t __54__WFContentCollection_NSExtensionItem__extensionItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 extensionItem];
}

- (void)copyToPasteboard:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFContentCollection *)self items];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_3;
  v15[3] = &unk_26428AB80;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend(v11, "if_mapAsynchronously:completionHandler:", &__block_literal_global_212, v15);
}

void __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v6 = MEMORY[0x263EFFA78];
  }
  id v7 = a3;
  id v8 = a2;
  [v5 setItems:v8 options:v6];
  id v9 = [*(id *)(a1 + 32) items];
  uint64_t v10 = [v9 count];

  v11 = getWFActionsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[WFContentCollection(WFPasteboard) copyToPasteboard:options:completionHandler:]_block_invoke_3";
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_DEFAULT, "%s Copied %ld items to clipboard", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = [v8 count];

  (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v13, v7);
}

void __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_2;
  v7[3] = &unk_264287040;
  id v8 = v5;
  id v6 = v5;
  [a2 getSerializedItem:v7];
}

uint64_t __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requiredResourcesForContent
{
  v2 = [(WFContentCollection *)self items];
  v3 = objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_196_7976);

  if (v3)
  {
    v4 = [MEMORY[0x263EFFA08] setWithObject:@"WFPhotoAccessResource"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __64__WFContentCollection_WFPasteboard__requiredResourcesForContent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (void)_generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 pasteboardTypesForItemSet:0];
  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __WFUIPasteboardParseItems_block_invoke;
    v15[3] = &unk_264287070;
    id v16 = v8;
    uint64_t v10 = objc_msgSend(v9, "if_map:", v15);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  id v13 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke;
  v14[3] = &__block_descriptor_40_e58_v32__0__WFPasteboardItem_8Q16___v____NSArray___NSError__24l;
  v14[4] = a1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke_2;
  v12[3] = &unk_26428AF18;
  id v11 = v7;
  objc_msgSend(v10, "if_flatMapAsynchronously:completionHandler:", v14, v12);
}

void __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  id v7 = [v5 fileURLItems];
  if (v7)
  {
    v6[2](v6, v7, 0);
  }
  else
  {
    id v8 = objc_opt_class();
    id v9 = [v5 itemsByType];
    v11[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v8 getContentItemsForPasteboardItems:v10 resultBlock:v6];
  }
}

void __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = +[WFContentCollection collectionWithItems:a2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

+ (void)generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WFPasteboardRequiredAccessResources(v6);
  if ([v8 count])
  {
    id v9 = [MEMORY[0x263F853D8] sharedManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __88__WFContentCollection_WFPasteboard__generateCollectionFromPasteboard_completionHandler___block_invoke;
    v10[3] = &unk_264286FD8;
    id v13 = a1;
    id v11 = v6;
    id v12 = v7;
    [v9 requestSandboxExtensionForRunningActionWithAccessResources:v8 completion:v10];
  }
  else
  {
    [a1 _generateCollectionFromPasteboard:v6 completionHandler:v7];
  }
}

uint64_t __88__WFContentCollection_WFPasteboard__generateCollectionFromPasteboard_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _generateCollectionFromPasteboard:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

+ (void)getContentItemsForPasteboardItems:(id)a3 resultBlock:(id)a4
{
}

void __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke_2;
  v7[3] = &unk_264286FB0;
  id v8 = v5;
  id v6 = v5;
  +[WFContentItem getContentItemFromSerializedItem:a2 sourceName:@"Clipboard" completionHandler:v7];
}

uint64_t __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)requiredResourcesForContentInPasteboard:(id)a3
{
  return WFPasteboardRequiredAccessResources(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemWriteLock, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_defaultCoercionOptions, 0);
}

- (void)setItemWriteLock:(id)a3
{
}

- (NSLock)itemWriteLock
{
  return self->_itemWriteLock;
}

- (void)setMutableItems:(id)a3
{
}

- (void)setDefaultCoercionOptions:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self items];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__WFContentCollection_encodeWithCoder___block_invoke;
  v8[3] = &unk_26428B090;
  id v9 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "if_objectsPassingTest:", v8);

  [v6 encodeObject:v7 forKey:@"items"];
}

uint64_t __39__WFContentCollection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canEncodeWithCoder:*(void *)(a1 + 32)];
}

- (WFContentCollection)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"items"];

  if (v9)
  {
    self = [(WFContentCollection *)self initWithItems:v9 defaultCoercionOptions:0];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(WFContentCollection *)self mutableItems];
  uint64_t v6 = (void *)[v4 initWithItems:v5 defaultCoercionOptions:self->_defaultCoercionOptions];

  return v6;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFContentCollection;
  v3 = [(WFContentCollection *)&v7 description];
  id v4 = [(WFContentCollection *)self items];
  id v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = [(WFContentCollection *)self items];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContentCollection *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v7 = 1;
    }
    else
    {
      id v5 = [(WFContentCollection *)self items];
      uint64_t v6 = [(WFContentCollection *)v4 items];
      char v7 = [v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)generateCollectionByCoercingToItemClasses:(id)a3 completionHandler:(id)a4
{
  id v5 = +[WFCoercionRequest requestForCoercingToContentClasses:a3 completionHandler:a4];
  [(WFContentCollection *)self performCoercion:v5];
}

- (void)generateCollectionByCoercingToItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  Class v11 = a3;
  char v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 arrayWithObjects:&v11 count:1];
  -[WFContentCollection generateCollectionByCoercingToItemClasses:options:completionHandler:](self, "generateCollectionByCoercingToItemClasses:options:completionHandler:", v10, v9, v8, v11, v12);
}

- (void)generateCollectionByCoercingToItemClass:(Class)a3 completionHandler:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  Class v8 = a3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a4;
  char v7 = [v5 arrayWithObjects:&v8 count:1];
  -[WFContentCollection generateCollectionByCoercingToItemClasses:completionHandler:](self, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v6, v8, v9);
}

- (BOOL)isCoercibleToItemClasses:(id)a3
{
  id v4 = +[WFCoercionRequest requestForCoercingToContentClasses:a3 completionHandler:0];
  LOBYTE(self) = [(WFContentCollection *)self canPerformCoercion:v4];

  return (char)self;
}

- (BOOL)isCoercibleToItemClass:(Class)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = a3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  LOBYTE(self) = [(WFContentCollection *)self isCoercibleToItemClasses:v4];

  return (char)self;
}

- (void)getBoolRepresentation:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__WFContentCollection_getBoolRepresentation___block_invoke;
  v8[3] = &unk_26428A0B0;
  id v9 = v4;
  id v5 = NSNumber;
  id v6 = v4;
  char v7 = [v5 numberWithBool:1];
  [(WFContentCollection *)self getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __45__WFContentCollection_getBoolRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v9 = a2;
  unint64_t v6 = a4;
  uint64_t v7 = v9;
  id v8 = (id)v6;
  if (!(v9 | v6))
  {
    uint64_t v7 = [NSNumber numberWithBool:0];
  }
  id v10 = (id)v7;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getFileRepresentations:(id)a3 forType:(id)a4
{
  id v5 = +[WFCoercionRequest requestForCoercingToFileType:a4 completionHandler:a3];
  [(WFContentCollection *)self performCoercion:v5];
}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4
{
  id v5 = +[WFCoercionRequest requestForCoercingToObjectClass:a4 completionHandler:a3];
  [(WFContentCollection *)self performCoercion:v5];
}

- (void)getStringRepresentations:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __48__WFContentCollection_getStringRepresentations___block_invoke;
  v6[3] = &unk_26428AFB0;
  id v7 = v4;
  id v5 = v4;
  [(WFContentCollection *)self getObjectRepresentations:v6 forClass:objc_opt_class()];
}

uint64_t __48__WFContentCollection_getStringRepresentations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStringRepresentation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __47__WFContentCollection_getStringRepresentation___block_invoke;
  v6[3] = &unk_26428A0B0;
  id v7 = v4;
  id v5 = v4;
  [(WFContentCollection *)self getObjectRepresentation:v6 forClass:objc_opt_class()];
}

uint64_t __47__WFContentCollection_getStringRepresentation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateCollectionByEvaluatingQuery:(id)a3 forContentItemClass:(Class)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke;
  aBlock[3] = &unk_26428ACE8;
  id v13 = v12;
  aBlock[4] = self;
  id v33 = v13;
  int v14 = _Block_copy(aBlock);
  v15 = [(WFContentCollection *)self items];
  id v16 = [(WFContentCollection *)self collectionByFilteringToItemClass:a4 excludedItems:0];
  uint64_t v17 = [v16 numberOfItems];
  int64_t v18 = [(WFContentCollection *)self numberOfItems];

  if (v17 == v18)
  {
    Class v19 = a4;
    id v20 = v10;
    v21 = v15;
  }
  else
  {
    if ([v15 count])
    {
      v22 = +[WFContentItem contentPropertySubstitutor];
      int v23 = [v10 canEvaluateObjects:v15 withPropertySubstitutor:v22];

      if (v23)
      {
        v24 = +[WFContentItem contentPropertySubstitutor];
        [v10 runWithObjects:v15 propertySubstitutor:v24 completionHandler:v14];

        goto LABEL_10;
      }
    }
    if (![(objc_class *)a4 hasLibrary]
      || [(WFContentCollection *)self isCoercibleToItemClass:a4])
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_2;
      v31[3] = &__block_descriptor_40_e55_v32__0__WFContentItem_8Q16___v____NSArray___NSError__24lu32l8;
      v31[4] = a4;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_4;
      v25[3] = &unk_2642875A8;
      id v28 = v13;
      Class v30 = a4;
      id v26 = v10;
      id v27 = v11;
      id v29 = v14;
      objc_msgSend(v15, "if_mapAsynchronously:completionHandler:", v31, v25);

      goto LABEL_10;
    }
    Class v19 = a4;
    id v20 = v10;
    v21 = 0;
  }
  [(objc_class *)v19 runQuery:v20 withItems:v21 permissionRequestor:v11 completionHandler:v14];
LABEL_10:
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [[WFContentCollection alloc] initWithItems:v7 defaultCoercionOptions:*(void *)(*(void *)(a1 + 32) + 8)];

  (*(void (**)(uint64_t, WFContentCollection *, id))(v5 + 16))(v5, v8, v6);
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_3;
  v11[3] = &unk_26428ACE8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v9 coerceToItemClass:v8 completionHandler:v11];
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v27 = a1;
    id v28 = v6;
    id v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          int v14 = [v13 firstObject];
          v15 = [v13 lastObject];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v16 = v14;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                [v7 setObject:v15 forKey:*(void *)(*((void *)&v33 + 1) + 8 * j)];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v18);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    v21 = *(void **)(v27 + 64);
    uint64_t v22 = *(void *)(v27 + 32);
    int v23 = [v7 keyEnumerator];
    v24 = [v23 allObjects];
    uint64_t v25 = *(void *)(v27 + 40);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_5;
    v30[3] = &unk_26428ACE8;
    id v31 = v7;
    id v32 = *(id *)(v27 + 56);
    id v26 = v7;
    [v21 runQuery:v22 withItems:v24 permissionRequestor:v25 completionHandler:v30];

    id v6 = v28;
    id v5 = v29;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13, (void)v19);
        v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = v14;
        }
        else {
          uint64_t v16 = v13;
        }
        [v7 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = [v7 array];
  (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if ([v5 count])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = v5;
    v10[1] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (id)collectionByFilteringToItemClass:(Class)a3 excludedItems:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __70__WFContentCollection_collectionByFilteringToItemClass_excludedItems___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B16__0__WFContentItem_8lu32l8;
  void v6[4] = a3;
  id v4 = [(WFContentCollection *)self collectionByFilteringItemsWithBlock:v6 excludedItems:a4];
  return v4;
}

uint64_t __70__WFContentCollection_collectionByFilteringToItemClass_excludedItems___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)collectionByFilteringItemsWithBlock:(id)a3 excludedItems:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void))a3;
  uint64_t v7 = [[WFContentCollection alloc] initWithDefaultCoercionOptions:self->_defaultCoercionOptions];
  uint64_t v8 = [[WFContentCollection alloc] initWithDefaultCoercionOptions:self->_defaultCoercionOptions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(WFContentCollection *)self items];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v6[2](v6, v14)) {
          v15 = v7;
        }
        else {
          v15 = v8;
        }
        [(WFContentCollection *)v15 addItem:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (void)generateCollectionByCoercingToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__197;
  v21[4] = __Block_byref_object_dispose__198;
  id v22 = (id)objc_opt_new();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke;
  v17[3] = &unk_264287518;
  id v11 = v8;
  id v18 = v11;
  long long v20 = v21;
  id v12 = v9;
  id v19 = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_3;
  v14[3] = &unk_264287540;
  v14[4] = self;
  uint64_t v16 = v21;
  id v13 = v10;
  id v15 = v13;
  [(WFContentCollection *)self transformItemsAndFlattenUsingBlock:v17 completionHandler:v14];

  _Block_object_dispose(v21, 8);
}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_2;
  v12[3] = &unk_2642874F0;
  uint64_t v8 = a1[6];
  id v14 = v6;
  uint64_t v15 = v8;
  id v13 = v5;
  id v9 = v6;
  id v10 = v5;
  id v11 = +[WFCoercionRequest _requestForCoercingToContentClasses:v7 itemCompletionHandler:v12];
  [v11 setOptions:a1[5]];
  [v10 performCoercion:v11];
}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 setDefaultCoercionOptions:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) items];
  if ([v7 count])
  {
    uint64_t v8 = [*(id *)(a1 + 32) items];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_4;
    v13[3] = &unk_26428B090;
    id v14 = v7;
    id v9 = objc_msgSend(v8, "if_objectsPassingTest:", v13);
    uint64_t v10 = +[WFContentCollection collectionWithItems:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (![v6 count]) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addItem:a1[4]];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)getFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(WFContentCollection *)self items];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke;
  v14[3] = &unk_26428AF40;
  id v15 = v9;
  id v16 = v8;
  id v12 = v8;
  id v13 = v9;
  objc_msgSend(v11, "if_flatMapAsynchronously:completionHandler:", v14, v10);
}

void __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke_2;
  v11[3] = &unk_26428AF18;
  id v12 = v6;
  id v8 = v6;
  id v9 = a2;
  id v10 = +[WFCoercionRequest requestForCoercingToFileType:v7 completionHandler:v11];
  [v10 setOptions:*(void *)(a1 + 40)];
  [v9 performCoercion:v10];
}

uint64_t __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WFContentCollection *)self items];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke;
  v15[3] = &unk_2642874C8;
  id v16 = v9;
  Class v17 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_3;
  v13[3] = &unk_26428AF18;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  objc_msgSend(v10, "if_flatMapAsynchronously:completionHandler:", v15, v13);
}

void __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = +[WFObjectType typeWithClass:*(void *)(a1 + 40)];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 preferredObjectType];
  }
  id v11 = v10;

  uint64_t v12 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_2;
  v14[3] = &unk_26428AF18;
  id v15 = v7;
  id v13 = v7;
  [v6 getRepresentationsForType:v11 options:v12 completionHandler:v14];
}

void __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "if_map:", &__block_literal_global_8643);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_196_8644);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 wfName];
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 object];
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)effectiveCoercionOptionsForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self defaultCoercionOptions];
  id v6 = [v4 options];

  id v7 = [v5 optionsByAddingContentsOfOptions:v6];

  return v7;
}

- (void)performCoercion:(id)a3
{
  id v8 = a3;
  id v4 = [(WFContentCollection *)self effectiveCoercionOptionsForRequest:v8];
  uint64_t v5 = [v8 requestType];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [v8 fileRepresentationResultHandler];
      id v7 = [v8 fileType];
      [(WFContentCollection *)self getFileRepresentations:v6 options:v4 forType:v7];
    }
    else
    {
      if (v5 != 2) {
        goto LABEL_9;
      }
      id v6 = [v8 contentItemClasses];
      id v7 = [v8 contentCollectionResultHandler];
      [(WFContentCollection *)self generateCollectionByCoercingToItemClasses:v6 options:v4 completionHandler:v7];
    }
  }
  else
  {
    id v6 = [v8 objectRepresentationResultHandler];
    -[WFContentCollection getObjectRepresentations:options:forClass:](self, "getObjectRepresentations:options:forClass:", v6, v4, [v8 objectClass]);
  }

LABEL_9:
}

- (BOOL)canPerformCoercion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  id v6 = [(WFContentCollection *)self effectiveCoercionOptionsForRequest:v4];
  [v5 setOptions:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(WFContentCollection *)self items];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) canPerformCoercion:v5])
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)getFileRepresentationAndAttributionSet:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v8 = (void *)MEMORY[0x263EF83A0];
    id v9 = MEMORY[0x263EF83A0];
  }
  else
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke;
  aBlock[3] = &unk_264287450;
  id v10 = v8;
  id v32 = v10;
  id v33 = v6;
  id v11 = _Block_copy(aBlock);
  long long v12 = [(WFContentCollection *)self items];
  long long v13 = [v12 objectEnumerator];

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__8650;
  id v29 = __Block_byref_object_dispose__8651;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_3;
  v19[3] = &unk_2642874A0;
  id v14 = v13;
  id v20 = v14;
  id v15 = v11;
  id v23 = v15;
  uint64_t v24 = &v25;
  id v16 = v7;
  id v21 = v16;
  id v22 = self;
  uint64_t v17 = _Block_copy(v19);
  id v18 = (void *)v26[5];
  v26[5] = (uint64_t)v17;

  (*(void (**)(void))(v26[5] + 16))();
  _Block_object_dispose(&v25, 8);
}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_2;
  v15[3] = &unk_2642881E8;
  id v10 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, v15);
}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_4;
    id v13 = &unk_264287478;
    uint64_t v17 = *(void *)(a1 + 64);
    id v14 = v3;
    id v16 = *(id *)(a1 + 56);
    id v6 = v4;
    id v15 = v6;
    id v7 = +[WFCoercionRequest requestForCoercingToFileType:v5 completionHandler:&v10];
    objc_msgSend(v7, "setOptions:", *(void *)(*(void *)(a1 + 48) + 8), v10, v11, v12, v13);
    [v6 performCoercion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  uint64_t v5 = [a2 firstObject];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void (***)(void, void))(v6 + 40);
  if (v5)
  {
    *(void *)(v6 + 40) = 0;

    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) attributionSet];
    (*(void (**)(uint64_t, void *, void *, id))(v8 + 16))(v8, v5, v9, v11);
  }
  else
  {
    id v10 = v11;
    if (!v11) {
      id v10 = *(id *)(a1 + 32);
    }
    ((void (**)(void, id))v7)[2](v7, v10);
  }
}

uint64_t __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)getFileRepresentation:(id)a3 forType:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__WFContentCollection_getFileRepresentation_forType___block_invoke;
  v8[3] = &unk_264287428;
  id v9 = v6;
  id v7 = v6;
  [(WFContentCollection *)self getFileRepresentationAndAttributionSet:v8 forType:a4];
}

uint64_t __53__WFContentCollection_getFileRepresentation_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getObjectRepresentationAndAttributionSet:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke;
    v32[3] = &unk_264287388;
    id v9 = v6;
    v32[4] = self;
    id v33 = v9;
    [(WFContentCollection *)self getObjectRepresentations:v32 forClass:objc_opt_class()];
    id v10 = v33;
  }
  else
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      id v7 = (void *)MEMORY[0x263EF83A0];
      id v8 = MEMORY[0x263EF83A0];
    }
    else
    {
      id v7 = dispatch_get_global_queue(0, 0);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2;
    aBlock[3] = &unk_2642873B0;
    id v10 = v7;
    id v30 = v10;
    id v31 = v6;
    id v11 = _Block_copy(aBlock);
    id v12 = [(WFContentCollection *)self items];
    id v13 = [v12 objectEnumerator];

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__8650;
    uint64_t v27 = __Block_byref_object_dispose__8651;
    id v28 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_186;
    v17[3] = &unk_264287400;
    id v14 = v13;
    id v18 = v14;
    id v9 = v11;
    id v21 = &v23;
    Class v22 = a4;
    id v19 = self;
    id v20 = v9;
    id v15 = _Block_copy(v17);
    id v16 = (void *)v24[5];
    v24[5] = (uint64_t)v15;

    (*(void (**)(void))(v24[5] + 16))();
    _Block_object_dispose(&v23, 8);
  }
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v13 count])
  {
    id v9 = [v13 componentsJoinedByString:@"\n"];
  }
  else
  {
    id v9 = &stru_26C71CE08;
  }
  id v10 = [v7 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v10 = 0;
  }
  if (v8)
  {

    id v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) attributionSet];
  (*(void (**)(uint64_t, __CFString *, void *, void *, id))(v11 + 16))(v11, v9, v10, v12, v8);
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_3;
  block[3] = &unk_2642878F8;
  id v13 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v23 = v12;
  id v24 = v14;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v13, block);
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_186(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2_187;
    id v13 = &unk_2642873D8;
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 56);
    id v14 = v3;
    id v16 = *(id *)(a1 + 48);
    id v6 = v4;
    id v15 = v6;
    id v7 = +[WFCoercionRequest requestForCoercingToObjectClass:v5 completionHandler:&v10];
    objc_msgSend(v7, "setOptions:", *(void *)(*(void *)(a1 + 40) + 8), v10, v11, v12, v13);
    [v6 performCoercion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2_187(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a4;
  uint64_t v8 = [a3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v8 = 0;
  }
  id v9 = [v15 firstObject];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void (***)(void, void))(v10 + 40);
  if (v9)
  {
    *(void *)(v10 + 40) = 0;

    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [*(id *)(a1 + 40) attributionSet];
    (*(void (**)(uint64_t, void *, void *, void *, id))(v12 + 16))(v12, v9, v8, v13, v7);
  }
  else
  {
    id v14 = v7;
    if (!v7) {
      id v14 = *(id *)(a1 + 32);
    }
    ((void (**)(void, id))v11)[2](v11, v14);
  }
}

uint64_t __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFContentCollection_getObjectRepresentation_forClass___block_invoke;
  v8[3] = &unk_264287360;
  id v9 = v6;
  id v7 = v6;
  [(WFContentCollection *)self getObjectRepresentationAndAttributionSet:v8 forClass:a4];
}

uint64_t __56__WFContentCollection_getObjectRepresentation_forClass___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateFileRepresentations:(id)a3 forType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  uint64_t v11 = [(WFContentCollection *)self items];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke;
  v18[3] = &unk_264287338;
  id v12 = v9;
  id v19 = v12;
  id v22 = v23;
  id v13 = v8;
  id v20 = self;
  id v21 = v13;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_5;
  v15[3] = &unk_264288F38;
  id v14 = v10;
  id v16 = v14;
  uint64_t v17 = v23;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v18, v15);

  _Block_object_dispose(v23, 8);
}

void __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_2;
  v13[3] = &unk_264287310;
  id v14 = v6;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v6;
  id v10 = a2;
  uint64_t v11 = +[WFCoercionRequest requestForCoercingToFileType:v7 completionHandler:v13];
  [v11 setOptions:*(void *)(*(void *)(a1 + 40) + 8)];
  [v10 performCoercion:v11];
}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_3;
    v11[3] = &unk_2642872E8;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    long long v12 = v8;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_4;
    v9[3] = &unk_264287270;
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v11, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateObjectRepresentations:(id)a3 forClass:(Class)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  id v10 = [(WFContentCollection *)self items];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke;
  v16[3] = &unk_2642872C0;
  id v18 = v20;
  Class v19 = a4;
  id v11 = v8;
  v16[4] = self;
  id v17 = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_5;
  v13[3] = &unk_264288F38;
  id v12 = v9;
  id v14 = v12;
  long long v15 = v20;
  objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v16, v13);

  _Block_object_dispose(v20, 8);
}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_2;
  v13[3] = &unk_264287298;
  id v14 = v6;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v6;
  id v10 = a2;
  id v11 = +[WFCoercionRequest requestForCoercingToObjectClass:v7 completionHandler:v13];
  [v11 setOptions:*(void *)(*(void *)(a1 + 32) + 8)];
  [v10 performCoercion:v11];
}

uint64_t __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_3;
    v14[3] = &unk_264287248;
    id v15 = v8;
    long long v11 = *(_OWORD *)(a1 + 40);
    id v10 = (id)v11;
    long long v16 = v11;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_4;
    v12[3] = &unk_264287270;
    id v13 = *(id *)(a1 + 32);
    objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v14, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)collectionByMergingAttributionSet:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self items];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__WFContentCollection_collectionByMergingAttributionSet___block_invoke;
  void v10[3] = &unk_264287220;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "if_map:", v10);

  id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithItems:v7 defaultCoercionOptions:self->_defaultCoercionOptions];
  return v8;
}

uint64_t __57__WFContentCollection_collectionByMergingAttributionSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentItemByMergingAttributionSet:*(void *)(a1 + 32)];
}

- (void)addFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v6 = +[WFContentItem itemWithFile:a3 origin:a4 disclosureLevel:a5];
  [(WFContentCollection *)self addItem:v6];
}

- (void)addFileWithOriginAttribution:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[WFContentLocation contentLocationForFile:v4];
  if (v5)
  {
    id v6 = +[WFContentItem itemWithFile:v4 origin:v5 disclosureLevel:1];
    [(WFContentCollection *)self addItem:v6];
  }
  else
  {
    id v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      id v9 = "-[WFContentCollection addFileWithOriginAttribution:]";
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_FAULT, "%s Should not add content location for in-memory file", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)addFile:(id)a3
{
  id v4 = +[WFContentItem itemWithFile:a3];
  [(WFContentCollection *)self addItem:v4];
}

- (void)addObject:(id)a3 named:(id)a4
{
  id v5 = +[WFContentItem itemWithObject:a3 named:a4];
  [(WFContentCollection *)self addItem:v5];
}

- (void)addObject:(id)a3
{
  id v4 = +[WFContentItem itemWithObject:a3 named:0];
  [(WFContentCollection *)self addItem:v4];
}

- (WFCoercionOptions)defaultCoercionOptions
{
  defaultCoercionOptions = self->_defaultCoercionOptions;
  if (!defaultCoercionOptions)
  {
    id v4 = +[WFCoercionOptions new];
    id v5 = self->_defaultCoercionOptions;
    self->_defaultCoercionOptions = v4;

    defaultCoercionOptions = self->_defaultCoercionOptions;
  }
  return defaultCoercionOptions;
}

- (WFContentAttributionSet)attributionSet
{
  uint64_t v2 = [(WFContentCollection *)self items];
  id v3 = [v2 valueForKey:@"attributionSet"];
  id v4 = +[WFContentAttributionSet attributionSetByMergingAttributionSets:v3];

  return (WFContentAttributionSet *)v4;
}

- (int64_t)numberOfItems
{
  uint64_t v2 = [(WFContentCollection *)self mutableItems];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSMutableArray)mutableItems
{
  mutableItems = self->_mutableItems;
  if (!mutableItems)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    id v5 = self->_mutableItems;
    self->_mutableItems = v4;

    mutableItems = self->_mutableItems;
  }
  return mutableItems;
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self itemWriteLock];
  [v5 lock];

  id v6 = [(WFContentCollection *)self mutableItems];
  [v6 removeObject:v4];

  id v7 = [(WFContentCollection *)self itemWriteLock];
  [v7 unlock];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self itemWriteLock];
  [v5 lock];

  id v6 = [(WFContentCollection *)self mutableItems];
  [v6 addObjectsFromArray:v4];

  id v7 = [(WFContentCollection *)self itemWriteLock];
  [v7 unlock];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentCollection *)self itemWriteLock];
  [v5 lock];

  id v6 = [(WFContentCollection *)self mutableItems];
  [v6 addObject:v4];

  id v7 = [(WFContentCollection *)self itemWriteLock];
  [v7 unlock];
}

- (WFContentCollection)initWithItems:(id)a3 defaultCoercionOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFContentCollection;
  int v8 = [(WFContentCollection *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    mutableItems = v8->_mutableItems;
    v8->_mutableItems = (NSMutableArray *)v9;

    uint64_t v11 = [v7 copy];
    defaultCoercionOptions = v8->_defaultCoercionOptions;
    v8->_defaultCoercionOptions = (WFCoercionOptions *)v11;

    uint64_t v13 = objc_opt_new();
    itemWriteLock = v8->_itemWriteLock;
    v8->_itemWriteLock = (NSLock *)v13;

    id v15 = v8;
  }

  return v8;
}

- (WFContentCollection)initWithDefaultCoercionOptions:(id)a3
{
  return [(WFContentCollection *)self initWithItems:0 defaultCoercionOptions:a3];
}

- (WFContentCollection)init
{
  return [(WFContentCollection *)self initWithItems:0 defaultCoercionOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)collectionWithItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithItems:v4 defaultCoercionOptions:0];

  return v5;
}

+ (void)generateCollectionFromDragItems:(id)a3 allowedItemClasses:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a3, "if_map:", &__block_literal_global_8945);
  uint64_t v10 = +[WFContentCollection collectionWithItems:v9];
  uint64_t v11 = +[WFCoercionRequest requestForCoercingToContentClasses:v8 completionHandler:v7];

  id v14 = @"WFCoercionOptionItemClassPrioritizationType";
  v15[0] = @"SupportedTypes";
  long long v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v13 = +[WFCoercionOptions optionsWithDictionary:v12];
  [v11 setOptions:v13];

  [v10 performCoercion:v11];
}

id __104__WFContentCollection_UIDragItem__generateCollectionFromDragItems_allowedItemClasses_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 itemProvider];
  int64_t v3 = +[WFContentItem itemWithObject:v2];

  [v3 setUseNewLoadingAPI:1];
  return v3;
}

- (void)getRichTextRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(WFContentCollection *)self items];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke;
  v12[3] = &unk_264289E68;
  id v13 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_4;
  v9[3] = &unk_264289E90;
  id v10 = v13;
  id v11 = v4;
  id v7 = v13;
  id v8 = v4;
  objc_msgSend(v6, "if_enumerateAsynchronouslyInSequence:completionHandler:", v12, v9);
}

void __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 string];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
    [*(id *)(a1 + 32) appendAttributedString:v9];
    v7[2](v7, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_2;
      v14[3] = &unk_26428AA88;
      long long v16 = v7;
      id v15 = *(id *)(a1 + 32);
      [v6 getObjectRepresentation:v14 forClass:objc_opt_class()];

      id v10 = v16;
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_3;
      v11[3] = &unk_264289E40;
      id v13 = v7;
      id v12 = *(id *)(a1 + 32);
      [v6 getFileRepresentation:v11 forType:0];

      id v10 = v13;
    }
  }
}

uint64_t __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
}

uint64_t __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) appendAttributedString:a2];
    int64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
}

void __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    id v3 = objc_alloc(getNSTextAttachmentClass());
    uint64_t v4 = [v9 mappedData];
    id v5 = [v9 wfType];
    id v6 = [v5 string];
    id v7 = (void *)[v3 initWithData:v4 ofType:v6];

    id v8 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v7];
    [*(id *)(a1 + 32) appendAttributedString:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)transformFirstFileRepresentationForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFContentCollection *)self items];
  id v12 = [v11 objectEnumerator];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__25648;
  id v32 = __Block_byref_object_dispose__25649;
  id v33 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke;
  v21[3] = &unk_26428AEC8;
  id v13 = v12;
  id v22 = v13;
  id v14 = v10;
  id v25 = v14;
  uint64_t v27 = &v28;
  id v15 = v8;
  id v23 = v15;
  id v16 = v9;
  id v26 = v16;
  id v24 = self;
  objc_super v17 = _Block_copy(v21);
  id v18 = (void *)v29[5];
  v29[5] = (uint64_t)v17;

  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29[5] + 16))(v29[5], 0, v19, v20);
  _Block_object_dispose(&v28, 8);
}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_2;
    v13[3] = &unk_26428AEA0;
    uint64_t v18 = *(void *)(a1 + 72);
    id v14 = v3;
    id v16 = *(id *)(a1 + 64);
    id v6 = v4;
    id v15 = v6;
    id v17 = *(id *)(a1 + 56);
    id v7 = +[WFCoercionRequest requestForCoercingToFileType:v5 completionHandler:v13];
    id v8 = [*(id *)(a1 + 48) defaultCoercionOptions];
    [v7 setOptions:v8];

    [v6 performCoercion:v7];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = +[WFContentCollection collectionWithItems:MEMORY[0x263EFFA68]];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v3);

    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void (***)(void, void))(v7 + 40);
  if (v6)
  {
    *(void *)(v7 + 40) = 0;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_3;
    v11[3] = &unk_26428B0B8;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, void *, id, void *))(v9 + 16))(v9, v6, v5, v11);
  }
  else
  {
    id v10 = v5;
    if (!v5) {
      id v10 = *(id *)(a1 + 32);
    }
    ((void (**)(void, id))v8)[2](v8, v10);
  }
}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_4;
      v11[3] = &unk_26428AD10;
      id v12 = *(id *)(a1 + 32);
      uint64_t v7 = objc_msgSend(v5, "if_compactMap:", v11);
      id v8 = v12;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) attributionSet];
      uint64_t v9 = WFConvertObjectToContentItem(v5, v8);
      v13[0] = v9;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = +[WFContentCollection collectionWithItems:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 attributionSet];
  id v5 = WFConvertObjectToContentItem(v3, v4);

  return v5;
}

- (void)transformFirstObjectRepresentationForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WFContentCollection *)self items];
  uint64_t v11 = [v10 objectEnumerator];

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__25648;
  uint64_t v30 = __Block_byref_object_dispose__25649;
  id v31 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke;
  v19[3] = &unk_26428AE78;
  id v12 = v11;
  id v20 = v12;
  id v13 = v9;
  id v22 = v13;
  id v24 = &v26;
  Class v25 = a3;
  id v14 = v8;
  id v23 = v14;
  id v21 = self;
  id v15 = _Block_copy(v19);
  id v16 = (void *)v27[5];
  v27[5] = (uint64_t)v15;

  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27[5] + 16))(v27[5], 0, v17, v18);
  _Block_object_dispose(&v26, 8);
}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_2;
    v13[3] = &unk_26428AE50;
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 64);
    id v14 = v3;
    id v16 = *(id *)(a1 + 56);
    id v6 = v4;
    id v15 = v6;
    id v17 = *(id *)(a1 + 48);
    uint64_t v7 = +[WFCoercionRequest requestForCoercingToObjectClass:v5 completionHandler:v13];
    id v8 = [*(id *)(a1 + 40) defaultCoercionOptions];
    [v7 setOptions:v8];

    [v6 performCoercion:v7];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v3);

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [a3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v9 = 0;
  }
  id v10 = [v7 firstObject];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void (***)(void, void))(v11 + 40);
  if (v10)
  {
    *(void *)(v11 + 40) = 0;

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_3;
    v15[3] = &unk_26428B0B8;
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, void *, void *, id, void *))(v13 + 16))(v13, v10, v9, v8, v15);
  }
  else
  {
    id v14 = v8;
    if (!v8) {
      id v14 = *(id *)(a1 + 32);
    }
    ((void (**)(void, id))v12)[2](v12, v14);
  }
}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_4;
      v11[3] = &unk_26428AD10;
      id v12 = *(id *)(a1 + 32);
      id v7 = objc_msgSend(v5, "if_compactMap:", v11);
      id v8 = v12;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) attributionSet];
      uint64_t v9 = WFConvertObjectToContentItem(v5, v8);
      v13[0] = v9;
      id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = +[WFContentCollection collectionWithItems:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 attributionSet];
  id v5 = WFConvertObjectToContentItem(v3, v4);

  return v5;
}

- (void)transformFileRepresentationsForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke;
  v12[3] = &unk_26428AE28;
  id v14 = self;
  id v15 = v9;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(WFContentCollection *)self transformItemsAndFlattenUsingBlock:v12 completionHandler:a5];
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_2;
  id v14 = &unk_26428ADB0;
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  id v7 = v5;
  id v8 = a2;
  id v9 = +[WFCoercionRequest requestForCoercingToFileType:v6 completionHandler:&v11];
  id v10 = objc_msgSend(*(id *)(a1 + 40), "defaultCoercionOptions", v11, v12, v13, v14);
  [v9 setOptions:v10];

  [v8 performCoercion:v9];
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_3;
    v9[3] = &unk_26428AE00;
    id v11 = *(id *)(a1 + 40);
    id v10 = v6;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_5;
    v7[3] = &unk_26428AF18;
    id v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_flatMapAsynchronously:completionHandler:", v9, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v9 = a1 + 32;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v9 + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_4;
  v12[3] = &unk_26428AD60;
  id v13 = v6;
  id v10 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16);
  id v11 = v6;
  v10(v8, a2, v7, v12);
}

uint64_t __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v5;
  objc_opt_class();
  uint64_t v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transformObjectRepresentationsForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke;
  void v10[3] = &unk_26428ADD8;
  id v11 = v8;
  Class v12 = a3;
  void v10[4] = self;
  id v9 = v8;
  [(WFContentCollection *)self transformItemsAndFlattenUsingBlock:v10 completionHandler:a5];
}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) defaultCoercionOptions];
  id v8 = +[WFObjectType typeWithClass:*(void *)(a1 + 48)];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v5 preferredObjectType];
  }
  id v11 = v10;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_2;
  v13[3] = &unk_26428ADB0;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v12 = v6;
  [v5 getRepresentationsForType:v11 options:v7 completionHandler:v13];
}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_3;
    v9[3] = &unk_26428AD88;
    id v11 = *(id *)(a1 + 40);
    id v10 = v6;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_5;
    v7[3] = &unk_26428AF18;
    id v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_flatMapAsynchronously:completionHandler:", v9, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a2;
  id v9 = [v8 object];
  id v10 = [v8 wfName];

  uint64_t v11 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_4;
  v14[3] = &unk_26428AD60;
  id v15 = v6;
  id v12 = *(void (**)(uint64_t, void *, void *, uint64_t, void *))(v7 + 16);
  id v13 = v6;
  v12(v7, v9, v10, v11, v14);
}

uint64_t __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v5;
  objc_opt_class();
  uint64_t v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transformItemsAndFlattenUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFContentCollection *)self items];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke;
  v13[3] = &unk_26428AD38;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_4;
  v11[3] = &unk_26428ACE8;
  void v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v13, v11);
}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_26428ACE8;
  id v13 = v6;
  id v14 = v7;
  id v9 = *(void (**)(uint64_t, id, void *))(v8 + 16);
  id v10 = v7;
  id v11 = v6;
  v9(v8, v11, v12);
}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = +[WFContentCollection collectionWithItems:a2];
  id v6 = [*(id *)(a1 + 32) defaultCoercionOptions];
  [v7 setDefaultCoercionOptions:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_3;
  v8[3] = &unk_26428AD10;
  id v9 = *(id *)(a1 + 32);
  id v6 = a3;
  id v7 = objc_msgSend(a2, "if_compactMap:", v8);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 attributionSet];
  id v5 = WFConvertObjectToContentItem(v3, v4);

  return v5;
}

- (void)transformItemsUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFContentCollection *)self items];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke;
  v13[3] = &unk_26428ACC0;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_3;
  v11[3] = &unk_26428ACE8;
  void v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v13, v11);
}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_26428B0B8;
  id v13 = v6;
  id v14 = v7;
  id v9 = *(void (**)(uint64_t, id, void *))(v8 + 16);
  id v10 = v6;
  id v11 = v7;
  v9(v8, v10, v12);
}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = +[WFContentCollection collectionWithItems:a2];
  id v6 = [*(id *)(a1 + 32) defaultCoercionOptions];
  [v7 setDefaultCoercionOptions:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 attributionSet];
  uint64_t v8 = WFConvertObjectToContentItem(v7, v9);

  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);
}

@end