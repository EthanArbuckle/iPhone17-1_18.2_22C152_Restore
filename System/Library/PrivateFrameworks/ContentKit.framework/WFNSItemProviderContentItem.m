@interface WFNSItemProviderContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemProviderTypeIdentifierOverrides;
+ (id)itemProviderTypeIdentifierOverridesWithFileURLType:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)cachesSupportedTypes;
- (BOOL)useNewLoadingAPI;
- (NSItemProvider)itemProvider;
- (NSString)contentName;
- (WFFileType)fileURLType;
- (id)name;
- (id)outputTypes;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateFileRepresentationWithNewAPI:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)generateObjectRepresentationWithNewAPI:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)preloadImportantItemsWithCompletionHandler:(id)a3;
- (void)setContentName:(id)a3;
- (void)setFileURLType:(id)a3;
- (void)setUseNewLoadingAPI:(BOOL)a3;
@end

@implementation WFNSItemProviderContentItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLType, 0);
  objc_storeStrong((id *)&self->_contentName, 0);
}

- (void)setFileURLType:(id)a3
{
}

- (WFFileType)fileURLType
{
  return self->_fileURLType;
}

- (void)setUseNewLoadingAPI:(BOOL)a3
{
  self->_useNewLoadingAPI = a3;
}

- (BOOL)useNewLoadingAPI
{
  return self->_useNewLoadingAPI;
}

- (void)setContentName:(id)a3
{
}

- (NSString)contentName
{
  return self->_contentName;
}

- (void)preloadImportantItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFNSItemProviderContentItem *)self outputTypes];
  v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke;
    v21[3] = &unk_26428AA00;
    v21[4] = self;
    v8 = &v22;
    id v22 = v4;
    uint64_t v9 = objc_opt_class();
    v10 = v21;
  }
  else
  {
    v11 = +[WFObjectType typeWithClass:objc_opt_class()];
    int v12 = [v5 containsObject:v11];

    if (v12)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_26428AA00;
      v19[4] = self;
      v8 = &v20;
      id v20 = v4;
      uint64_t v9 = objc_opt_class();
      v10 = v19;
    }
    else
    {
      v13 = +[WFObjectType typeWithClass:objc_opt_class()];
      int v14 = [v5 containsObject:v13];

      if (!v14)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4;
        v15[3] = &unk_26428ACE8;
        v15[4] = self;
        v8 = &v16;
        id v16 = v4;
        [(WFContentItem *)self getFileRepresentations:v15 forType:0];
        goto LABEL_8;
      }
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_26428AA00;
      v17[4] = self;
      v8 = &v18;
      id v18 = v4;
      uint64_t v9 = objc_opt_class();
      v10 = v17;
    }
  }
  [(WFContentItem *)self getObjectRepresentation:v10 forClass:v9];
LABEL_8:
}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 setContentName:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 setContentName:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 setContentName:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  v5 = [a2 firstObject];
  v6 = [v5 wfName];
  [*(id *)(a1 + 32) setContentName:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)cachesSupportedTypes
{
  return 0;
}

- (id)outputTypes
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9B0];
  id v4 = (void *)MEMORY[0x263F852B8];
  v5 = [(WFNSItemProviderContentItem *)self itemProvider];
  v6 = [v5 registeredTypeIdentifiers];
  id v7 = [v4 typesFromStrings:v6];
  v8 = [v3 orderedSetWithArray:v7];

  uint64_t v9 = objc_opt_class();
  v10 = [(WFNSItemProviderContentItem *)self fileURLType];
  v11 = [v9 itemProviderTypeIdentifierOverridesWithFileURLType:v10];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v12 = objc_msgSend(v8, "copy", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    uint64_t v16 = *MEMORY[0x263F1DD08];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v19 = [v11 objectForKey:v18];
        if (v19)
        {
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "indexOfObject:", v18), v19);
        }
        else if ([v18 conformsToUTType:v16])
        {
          uint64_t v20 = [v8 indexOfObject:v18];
          v21 = +[WFObjectType typeWithClass:objc_opt_class()];
          [v8 replaceObjectAtIndex:v20 withObject:v21];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  id v22 = +[WFObjectType typeWithClass:objc_opt_class()];
  [v8 addObject:v22];

  return v8;
}

- (id)name
{
  v3 = [(WFNSItemProviderContentItem *)self contentName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFNSItemProviderContentItem;
    id v5 = [(WFContentItem *)&v8 name];
  }
  v6 = v5;

  return v6;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v26 = "-[WFNSItemProviderContentItem generateObjectRepresentation:options:forClass:]";
    __int16 v27 = 2112;
    Class v28 = a5;
    _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_DEFAULT, "%s Loading item of class %@ from NSItemProvider", buf, 0x16u);
  }

  if (![(WFNSItemProviderContentItem *)self useNewLoadingAPI])
  {
    if ((Class)objc_opt_class() == a5)
    {
      int v12 = [(WFNSItemProviderContentItem *)self itemProvider];
      uint64_t v13 = [(id)*MEMORY[0x263F1DD08] identifier];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke;
      v23[3] = &unk_26428A988;
      id v24 = v8;
      [v12 loadItemForTypeIdentifier:v13 options:0 completionHandler:v23];

      uint64_t v14 = v24;
    }
    else if ((Class)objc_opt_class() == a5)
    {
      uint64_t v15 = [(WFNSItemProviderContentItem *)self itemProvider];
      uint64_t v16 = [(id)*MEMORY[0x263F1DB18] identifier];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
      v21[3] = &unk_26428A9B0;
      id v22 = v8;
      [v15 loadItemForTypeIdentifier:v16 options:0 completionHandler:v21];

      uint64_t v14 = v22;
    }
    else
    {
      if ((Class)objc_opt_class() != a5)
      {
        v11 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
        (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v11);

        goto LABEL_13;
      }
      v17 = [(WFNSItemProviderContentItem *)self itemProvider];
      id v18 = [(id)*MEMORY[0x263F1DC20] identifier];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
      v19[3] = &unk_26428AD60;
      id v20 = v8;
      [v17 loadItemForTypeIdentifier:v18 options:0 completionHandler:v19];

      uint64_t v14 = v20;
    }

    goto LABEL_13;
  }
  [(WFNSItemProviderContentItem *)self generateObjectRepresentationWithNewAPI:v8 options:v9 forClass:a5];
LABEL_13:
}

uint64_t __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    id v5 = (objc_class *)MEMORY[0x263F85308];
    id v6 = a2;
    a2 = (void *)[[v5 alloc] initWithPlatformImage:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v6;
    uint64_t v7 = [[NSString alloc] initWithContentsOfURL:v5 encoding:4 error:&v17];
    id v8 = v17;

    id v5 = (id)v7;
    id v6 = v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v5 regularFileContents];

    id v5 = (id)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [[NSString alloc] initWithData:v5 encoding:4];

    id v5 = (id)v10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 containsString:@"<div>"])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_4;
      v13[3] = &unk_26428A9D8;
      id v14 = v5;
      id v16 = *(id *)(a1 + 32);
      id v15 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v13);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v6);
    }
    else
    {
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08188] code:-1100 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v12);
    }
  }
}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_4(uint64_t a1)
{
  v28[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if ([v2 rangeOfString:@"<html"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [NSString stringWithFormat:@"<!DOCTYPE html><html><head><meta charset=\"utf-8\"></head><body>%@</body></html>", v2];

    id v2 = (id)v3;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  id v4 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_24251;
  uint64_t v26 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_24251;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_24251)
  {
    id v5 = UIFoundationLibrary_24253();
    v24[3] = (uint64_t)dlsym(v5, "NSDocumentTypeDocumentAttribute");
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_24251 = v24[3];
    id v4 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v4)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    id v20 = [NSString stringWithUTF8String:"NSString *getNSDocumentTypeDocumentAttribute(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFNSItemProviderContentItem.m", 21, @"%s", dlerror());

    goto LABEL_15;
  }
  id v6 = *v4;
  id v27 = v6;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v7 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr_24259;
  uint64_t v26 = getNSHTMLTextDocumentTypeSymbolLoc_ptr_24259;
  if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr_24259)
  {
    id v8 = UIFoundationLibrary_24253();
    v24[3] = (uint64_t)dlsym(v8, "NSHTMLTextDocumentType");
    getNSHTMLTextDocumentTypeSymbolLoc_ptr_24259 = v24[3];
    uint64_t v7 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    id v22 = [NSString stringWithUTF8String:"NSString *getNSHTMLTextDocumentType(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFNSItemProviderContentItem.m", 22, @"%s", dlerror());

LABEL_15:
    __break(1u);
  }
  v28[0] = *v7;
  uint64_t v9 = NSDictionary;
  id v10 = v28[0];
  uint64_t v11 = [v9 dictionaryWithObjects:v28 forKeys:&v27 count:1];

  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v13 = [v2 dataUsingEncoding:4];
  id v14 = (void *)[v12 initWithData:v13 options:v11 documentAttributes:0 error:0];

  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = [v14 string];
  id v17 = (void *)v16;
  if (v16) {
    id v18 = (id)v16;
  }
  else {
    id v18 = v2;
  }
  (*(void (**)(uint64_t, id, void, void))(v15 + 16))(v15, v18, 0, *(void *)(a1 + 40));
}

- (void)generateObjectRepresentationWithNewAPI:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = a3;
  id v8 = [(WFNSItemProviderContentItem *)self itemProvider];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__WFNSItemProviderContentItem_generateObjectRepresentationWithNewAPI_options_forClass___block_invoke;
  v11[3] = &unk_26428A960;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = (id)[v8 loadObjectOfClass:a5 completionHandler:v11];
}

void __87__WFNSItemProviderContentItem_generateObjectRepresentationWithNewAPI_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 itemProvider];
  id v9 = [v8 suggestedName];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[WFNSItemProviderContentItem generateFileRepresentation:options:forType:]";
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_DEFAULT, "%s Loading item of type %@ from NSItemProvider", buf, 0x16u);
  }

  if ([(WFNSItemProviderContentItem *)self useNewLoadingAPI])
  {
    [(WFNSItemProviderContentItem *)self generateFileRepresentationWithNewAPI:v8 options:v9 forType:v10];
  }
  else
  {
    id v12 = [(WFNSItemProviderContentItem *)self itemProvider];
    uint64_t v13 = [v10 string];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke;
    v14[3] = &unk_26428A938;
    v14[4] = self;
    id v15 = v10;
    id v16 = v8;
    [v12 loadItemForTypeIdentifier:v13 options:0 completionHandler:v14];
  }
}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = a1[5];
    if ([v8 conformsToUTType:*MEMORY[0x263F1DAA0]])
    {
      uint64_t v9 = [v5 wfFileType];

      [a1[4] setFileURLType:v9];
      id v8 = (id)v9;
    }
    id v10 = (void (**)(id, void *, void *))a1[6];
    uint64_t v11 = +[WFFileRepresentation fileWithURL:v5 options:5 ofType:v8];
    v10[2](v10, v11, v7);
    goto LABEL_5;
  }
  id v12 = [v6 domain];
  if (![v12 isEqualToString:*MEMORY[0x263F08188]])
  {

    goto LABEL_10;
  }
  uint64_t v13 = [v7 code];

  if (v13 != -1100)
  {
LABEL_10:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_11;
  }
  id v8 = [a1[4] itemProvider];
  uint64_t v11 = [a1[5] string];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v15[3] = &unk_26428A910;
  id v14 = a1[5];
  v15[4] = a1[4];
  id v16 = v14;
  id v17 = a1[6];
  [v8 loadItemForTypeIdentifier:v11 options:0 completionHandler:v15];

LABEL_5:
LABEL_11:
}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void (**)(id, void *, id))a1[6];
    id v8 = +[WFFileRepresentation fileWithData:v5 ofType:a1[5] proposedFilename:0];
    v7[2](v7, v8, v6);
  }
  else
  {
    uint64_t v9 = [a1[4] itemProvider];
    id v10 = [a1[5] string];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_3;
    v11[3] = &unk_26428A8E8;
    id v13 = a1[6];
    id v12 = a1[5];
    [v9 loadItemForTypeIdentifier:v10 options:0 completionHandler:v11];
  }
}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = +[WFContentItem itemWithObject:a2];
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = v3;
    if (v3) {
      [v3 getFileRepresentation:v4 forType:*(void *)(a1 + 32)];
    }
    else {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
    }
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

- (void)generateFileRepresentationWithNewAPI:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(WFNSItemProviderContentItem *)self itemProvider];
  id v10 = [v8 string];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke;
  v14[3] = &unk_26428A8C0;
  id v16 = self;
  id v17 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = (id)[v9 loadInPlaceFileRepresentationForTypeIdentifier:v10 completionHandler:v14];
}

void __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__24289;
    void v19[4] = __Block_byref_object_dispose__24290;
    id v20 = 0;
    uint64_t v9 = objc_opt_new();
    id v18 = v8;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke_8;
    v13[3] = &unk_26428A898;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v19;
    char v17 = a3;
    [v9 coordinateReadingItemAtURL:v7 options:0 error:&v18 byAccessor:v13];
    id v12 = v18;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    _Block_object_dispose(v19, 8);

    id v8 = v12;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke_8(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 lastPathComponent];
  if ([v3 hasPrefix:@"."])
  {
    uint64_t v4 = +[WFFileRepresentation proposedFilenameForFile:0 ofType:*(void *)(a1 + 32)];

    uint64_t v3 = (void *)v4;
  }
  id v5 = [*(id *)(a1 + 40) itemProvider];
  id v6 = [v5 suggestedName];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) itemProvider];
    uint64_t v8 = [v7 suggestedName];

    uint64_t v3 = (void *)v8;
  }
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 3;
  }
  uint64_t v10 = +[WFFileRepresentation fileWithURL:v13 options:v9 ofType:*(void *)(a1 + 32) proposedFilename:v3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (NSItemProvider)itemProvider
{
  uint64_t v3 = objc_opt_class();
  return (NSItemProvider *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Item providers");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Item providers", @"Item providers");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Item provider", @"Item provider");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  return (id)[MEMORY[0x263EFF9D8] orderedSet];
}

+ (id)ownedTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)itemProviderTypeIdentifierOverridesWithFileURLType:(id)a3
{
  v21[6] = *MEMORY[0x263EF8340];
  id v3 = a3;
  __int16 v19 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD08]];
  v20[0] = v19;
  id v18 = +[WFObjectType typeWithClass:objc_opt_class()];
  v21[0] = v18;
  char v17 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD38]];
  v20[1] = v17;
  id v16 = +[WFObjectType typeWithClass:objc_opt_class()];
  v21[1] = v16;
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  v20[2] = v4;
  id v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v21[2] = v5;
  id v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
  v20[3] = v6;
  id v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  v21[3] = v7;
  uint64_t v8 = *MEMORY[0x263F1DAA0];
  uint64_t v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAA0]];
  v20[4] = v9;
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x263F852B8] typeWithUTType:v8];
  }
  void v21[4] = v10;
  uint64_t v11 = *MEMORY[0x263F85A38];
  id v12 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F85A38]];
  v20[5] = v12;
  id v13 = [MEMORY[0x263F852B8] typeFromPasteboardType:v11];
  void v21[5] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];

  if (!v3) {
  return v14;
  }
}

+ (id)itemProviderTypeIdentifierOverrides
{
  return (id)[a1 itemProviderTypeIdentifierOverridesWithFileURLType:0];
}

@end