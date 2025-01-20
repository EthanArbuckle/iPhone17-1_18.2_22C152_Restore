@interface WFURLContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)URLCoercions;
+ (id)attributionSetContentOfURL:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)filterRepresentationsForAllowedContent:(id)a3;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)mutableURLCoercions;
+ (id)outputTypes;
+ (id)ownedPasteboardTypes;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
+ (void)rediscoverURLCoercionClassesIfNeeded;
+ (void)registerURLCoercion:(Class)a3;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)includesFileRepresentationInSerializedItem;
- (NSDictionary)additionalRepresentationsForSerialization;
- (NSString)description;
- (NSURL)URL;
- (id)intermediaryTypesForCoercionToItemClass:(Class)a3;
- (id)outputTypes;
- (id)webResource;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentationForPrintHandler:(id)a3 coercionOptions:(id)a4;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getContentsOfURLWithHandler:(id)a3;
- (void)getContentsWithRequest:(id)a3 cacheResult:(BOOL)a4 expectedByteCountHandler:(id)a5 writtenByteCountHandler:(id)a6 completionHandler:(id)a7;
- (void)getContentsWithRequest:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6;
- (void)getHeadersWithCompletionHandler:(id)a3;
- (void)getPDFWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getPreferredFileExtension:(id)a3;
- (void)getPreferredFileSize:(id)a3;
- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4;
@end

@implementation WFURLContentItem

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFURLContentItem;
  v3 = [(WFContentItem *)&v7 description];
  v4 = [(WFURLContentItem *)self URL];
  v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return (NSString *)v5;
}

- (id)outputTypes
{
  v10.receiver = self;
  v10.super_class = (Class)WFURLContentItem;
  v3 = [(WFContentItem *)&v10 outputTypes];
  v4 = (void *)MEMORY[0x263F852B8];
  v5 = [(WFURLContentItem *)self URL];
  v6 = [v5 lastPathComponent];
  objc_super v7 = [v4 typeFromFilename:v6];

  if ([v7 isDeclared])
  {
    v8 = (void *)[v3 mutableCopy];
    [v8 insertObject:v7 atIndex:0];

    v3 = v8;
  }

  return v3;
}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = [(objc_class *)a3 ownedTypes];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", v5, 0);
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)WFURLContentItem;
  v8 = [(WFContentItem *)&v16 intermediaryTypesForCoercionToItemClass:a3];
  v9 = [v8 firstObject];
  if ([v9 conformsToUTType:*MEMORY[0x263F1DB00]])
  {
    objc_super v10 = (objc_class *)objc_opt_class();

    if (v10 != a3) {
      goto LABEL_10;
    }
    v11 = (void *)[v8 mutableCopy];
    v12 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
    uint64_t v13 = [v11 indexOfObject:v12];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = [MEMORY[0x263F088D0] indexSetWithIndex:v13];
      [v11 moveObjectsAtIndexes:v14 toIndex:0];
    }
    v9 = v8;
  }
  else
  {
    v11 = v8;
  }

  v8 = v11;
LABEL_10:

  return v8;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFURLContentItem *)self URL];
    v6 = [v5 scheme];
    unsigned __int8 v7 = [v6 isEqualToString:@"mailto"];
LABEL_7:
    unsigned __int8 v9 = v7;
LABEL_8:

    goto LABEL_9;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v8 = [(WFURLContentItem *)self URL];
    unsigned __int8 v9 = +[DCMapsLink isMapsURL:v8];

    goto LABEL_9;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFURLContentItem *)self URL];
    v6 = [v5 scheme];
    unsigned __int8 v7 = [v6 hasPrefix:@"http"];
    goto LABEL_7;
  }
  if ([v4 isEqualToUTType:*MEMORY[0x263F1DA48]])
  {
    v5 = [(WFURLContentItem *)self URL];
    v6 = [v5 scheme];
    if (([v6 hasPrefix:@"http"] & 1) == 0)
    {
      v11 = [(WFURLContentItem *)self URL];
      v12 = [v11 scheme];
      if (([v12 isEqualToString:@"ftp"] & 1) == 0)
      {
        uint64_t v13 = [(WFURLContentItem *)self URL];
        unsigned __int8 v9 = [v13 isFileURL];
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if ([v4 isEqualToClass:getUIPrintFormatterClass_12083()]
    || ([MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v4 isEqualToType:v14],
        v14,
        v15))
  {
    v5 = [(WFURLContentItem *)self URL];
    v6 = [v5 scheme];
    if (([v6 hasPrefix:@"http"] & 1) == 0)
    {
      v11 = [(WFURLContentItem *)self URL];
      v12 = [v11 scheme];
      if (([v12 isEqualToString:@"data"] & 1) == 0)
      {
        uint64_t v13 = [(WFURLContentItem *)self URL];
        v24 = [v13 scheme];
        if ([v24 isEqualToString:@"ftp"])
        {
          unsigned __int8 v9 = 1;
        }
        else
        {
          v25 = [(WFURLContentItem *)self URL];
          unsigned __int8 v9 = [v25 isFileURL];
        }
        goto LABEL_35;
      }
LABEL_19:
      unsigned __int8 v9 = 1;
LABEL_36:

      goto LABEL_8;
    }
LABEL_17:
    unsigned __int8 v9 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v4 objectClass];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = [(id)objc_opt_class() URLCoercions];
    uint64_t v17 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v5);
          }
          v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "urlItem_outputClasses");
          char v23 = [v22 containsObject:v16];

          if (v23)
          {
            v6 = [(WFURLContentItem *)self URL];
            unsigned __int8 v7 = objc_msgSend(v21, "urlItem_canCoerceFromURL:", v6);
            goto LABEL_7;
          }
        }
        uint64_t v18 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)WFURLContentItem;
  unsigned __int8 v9 = [(WFContentItem *)&v26 canGenerateRepresentationForType:v4];
LABEL_9:

  return v9;
}

- (void)generateObjectRepresentationForPrintHandler:(id)a3 coercionOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFURLContentItem *)self webResource];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__WFURLContentItem_generateObjectRepresentationForPrintHandler_coercionOptions___block_invoke;
  v10[3] = &unk_2642883C8;
  id v11 = v6;
  id v9 = v6;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:v8 coercionOptions:v7 completionHandler:v10];
}

void __80__WFURLContentItem_generateObjectRepresentationForPrintHandler_coercionOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    id v7 = a4;
    id v8 = +[WFObjectRepresentation object:a2 named:a3];
    v11[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);
  }
  else
  {
    objc_super v10 = *(void (**)(uint64_t, void, id))(v4 + 16);
    id v8 = a4;
    v10(v4, MEMORY[0x263EFFA68], v8);
  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v59[1] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void))a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    uint64_t v16 = [(WFURLContentItem *)self URL];
    uint64_t v17 = [v16 absoluteString];
    uint64_t v18 = [(WFContentItem *)self name];
    uint64_t v19 = +[WFObjectRepresentation object:v17 named:v18];
    v59[0] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
    v8[2](v8, v20, 0);

LABEL_20:
    goto LABEL_21;
  }
  objc_super v10 = NSStringFromClass(a5);
  int v11 = [@"UIPrintFormatter" isEqualToString:v10];

  if (v11)
  {
    v12 = [v9 permissionRequestor];
    uint64_t v13 = [(WFURLContentItem *)self URL];
    v58 = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v51[3] = &unk_2642885A8;
    v53 = v8;
    v51[4] = self;
    id v52 = v9;
    [v12 allowNetworkAccessAfterPromptingForURLs:v14 completionHandler:v51];

    int v15 = v53;
LABEL_4:

    goto LABEL_21;
  }
  if ((Class)objc_opt_class() == a5)
  {
    long long v30 = [(WFURLContentItem *)self URL];
    uint64_t v16 = +[WFEmailAddress addressesWithMailtoURL:v30];

    v31 = objc_msgSend(v16, "if_map:", &__block_literal_global_38_12109);
    v8[2](v8, v31, 0);

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a5)
  {
    uint64_t v32 = [(WFURLContentItem *)self URL];
    v33 = +[DCMapsLink mapsLinkWithURL:v32];
    v34 = +[WFObjectRepresentation object:v33];
    v57 = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    v8[2](v8, v35, 0);

    goto LABEL_21;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v36 = [v9 permissionRequestor];
    v37 = [(WFURLContentItem *)self URL];
    v56 = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v49[3] = &unk_26428A628;
    v49[4] = self;
    v50 = v8;
    [v36 allowNetworkAccessAfterPromptingForURLs:v38 completionHandler:v49];

    int v15 = v50;
    goto LABEL_4;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v40 = [(WFURLContentItem *)self webResource];
    v41 = [(WFContentItem *)self name];
    v42 = +[WFObjectRepresentation object:v40 named:v41];
    v55 = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    v8[2](v8, v43, 0);
  }
  else
  {
    id v44 = v9;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v21 = [(id)objc_opt_class() URLCoercions];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_super v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v27 = objc_msgSend(v26, "urlItem_outputClasses");
          int v28 = [v27 containsObject:a5];

          if (v28)
          {
            v39 = [(WFURLContentItem *)self URL];
            objc_msgSend(v26, "urlItem_generateObjectRepresentations:fromURL:forClass:", v8, v39, a5);

            goto LABEL_25;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    long long v29 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v29);

LABEL_25:
    id v9 = v44;
  }
LABEL_21:
}

uint64_t __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) generateObjectRepresentationForPrintHandler:*(void *)(a1 + 48) coercionOptions:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) URL];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    v5[3] = &unk_2642883A0;
    id v6 = *(id *)(a1 + 40);
    +[WFArticle fetchArticleFromURL:v3 pageHTML:0 completionHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = +[WFObjectRepresentation object:a2];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    v5 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 0);
  }
}

id __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFObjectRepresentation object:a2];
}

- (id)webResource
{
  v3 = [(WFURLContentItem *)self URL];
  int v4 = [v3 isFileURL];

  v5 = [(WFURLContentItem *)self URL];
  if (v4)
  {
    uint64_t v6 = +[WFFileRepresentation fileWithURL:v5 options:0];
    id v7 = +[WFWebResource webResourceWithFile:v6];
  }
  else
  {
    id v7 = +[WFWebResource webResourceWithURL:v5];
  }

  return v7;
}

- (NSURL)URL
{
  uint64_t v2 = [(WFContentItem *)self objectForClass:objc_opt_class()];
  v3 = WFAppTransportSecuredURL(v2);

  return (NSURL *)v3;
}

- (void)getPreferredFileExtension:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  v5 = [(WFURLContentItem *)self URL];
  uint64_t v6 = [v5 pathExtension];

  if ([v6 length])
  {
    v4[2](v4, v6);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __46__WFURLContentItem_getPreferredFileExtension___block_invoke;
    v7[3] = &unk_264288378;
    id v8 = v4;
    [(WFURLContentItem *)self getHeadersWithCompletionHandler:v7];
  }
}

void __46__WFURLContentItem_getPreferredFileExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 suggestedFilename];
  v3 = [v4 pathExtension];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)getPreferredFileSize:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__WFURLContentItem_getPreferredFileSize___block_invoke;
  v6[3] = &unk_264288378;
  id v7 = v4;
  id v5 = v4;
  [(WFURLContentItem *)self getHeadersWithCompletionHandler:v6];
}

uint64_t __41__WFURLContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  [a2 expectedContentLength];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(WFContentItem *)self objectRepresentationForClass:objc_opt_class()];
  id v9 = [v8 specifiedName];

  if (v9)
  {
    objc_super v10 = [v8 specifiedName];
    v7[2](v7, v10);
  }
  else
  {
    objc_super v10 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
    int v11 = [(WFContentItem *)self fileRepresentationForType:v10];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 wfName];
      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        uint64_t v16 = [(WFContentItem *)self name];
        v7[2](v7, v16);
      }
    }
    else
    {
      v14 = [v8 object];
      v19[0] = v14;
      int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke;
      v17[3] = &unk_26428A628;
      v17[4] = self;
      uint64_t v18 = v7;
      [v6 allowNetworkAccessAfterPromptingForURLs:v15 completionHandler:v17];
    }
  }
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_2;
    v7[3] = &unk_264288350;
    v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    [v3 getHeadersWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_4;
  }
  id v7 = (void *)MEMORY[0x263F852B8];
  id v8 = [v5 MIMEType];
  id v9 = [v7 typeFromMIMEType:v8];
  char v10 = [v9 conformsToUTType:*MEMORY[0x263F1DB00]];

  if ((v10 & 1) == 0)
  {
LABEL_4:
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_3;
    v15[3] = &unk_264289E40;
    int v11 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v12;
    [v11 getContentsOfURLWithHandler:v15];
  }
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v7);
    goto LABEL_5;
  }
  uint64_t v4 = [a2 wfName];
  if (v4)
  {
    uint64_t v7 = v4;
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
LABEL_5:
    id v5 = (void *)v7;
    goto LABEL_7;
  }
  id v6 = [*(id *)(a1 + 32) name];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  id v5 = 0;
LABEL_7:
}

- (void)getPDFWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dictionary];
  id v9 = [v8 objectForKey:@"WFCoercionOptionPDFIncludeMargin"];
  uint64_t v10 = [v9 BOOLValue];

  id v12 = objc_alloc_init(WFWebResourceCapturer);
  int v11 = [(WFURLContentItem *)self webResource];
  [(WFWebResourceCapturer *)v12 generatePDFForWebResource:v11 includeMargin:v10 coercionOptions:v7 completionHandler:v6];
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void))a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(WFURLContentItem *)self URL];
  int v12 = [v11 isFileURL];

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263F1DBF0];
    if ([v10 isEqualToUTType:*MEMORY[0x263F1DBF0]]
      && ([(WFURLContentItem *)self URL],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 wfType],
          int v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqualToUTType:v13],
          v15,
          v14,
          (v16 & 1) == 0))
    {
      [(WFURLContentItem *)self getPDFWithOptions:v9 completionHandler:v8];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v18 = [(WFURLContentItem *)self URL];
      uint64_t v19 = [v18 path];
      if ([v17 fileExistsAtPath:v19])
      {
        v20 = [(WFURLContentItem *)self URL];
        v21 = +[WFFileRepresentation fileWithURL:v20 options:0];
        v8[2](v8, v21, 0);
      }
      else
      {
        v8[2](v8, 0, 0);
      }
    }
  }
  else
  {
    uint64_t v22 = [(WFURLContentItem *)self URL];
    uint64_t v23 = [v22 host];
    int v24 = [v23 isEqualToString:@"maps.apple.com"];

    if (v24)
    {
      v8[2](v8, 0, 0);
    }
    else
    {
      v25 = [v9 permissionRequestor];
      objc_super v26 = [(WFURLContentItem *)self URL];
      v33[0] = v26;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke;
      v28[3] = &unk_264288328;
      uint64_t v32 = v8;
      id v29 = v10;
      long long v30 = self;
      id v31 = v9;
      [v25 allowNetworkAccessAfterPromptingForURLs:v27 completionHandler:v28];
    }
  }
}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke(id *a1, char a2)
{
  v17[6] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC68]];
    v17[0] = v3;
    uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC70]];
    v17[1] = v4;
    id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAA8]];
    v17[2] = v5;
    id v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
    v17[3] = v6;
    id v7 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
    v17[4] = v7;
    id v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
    void v17[5] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:6];

    int v10 = [a1[4] conformsToTypes:v9];
    id v11 = a1[5];
    if (v10)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_2;
      v13[3] = &unk_264288300;
      v13[4] = v11;
      id v16 = a1[7];
      id v14 = a1[4];
      id v15 = a1[6];
      [v11 getHeadersWithCompletionHandler:v13];
    }
    else
    {
      [a1[5] getContentsOfURLWithHandler:a1[7]];
    }
  }
  else
  {
    int v12 = (void (*)(void))*((void *)a1[7] + 2);
    v12();
  }
}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) getContentsOfURLWithHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F852B8];
    id v8 = [v5 MIMEType];
    id v9 = [v7 typeFromMIMEType:v8];

    if ([v9 conformsToType:*(void *)(a1 + 40)]) {
      goto LABEL_5;
    }
    int v10 = (void *)MEMORY[0x263F852B8];
    id v11 = [v6 suggestedFilename];
    int v12 = [v10 typeFromFilename:v11];
    int v13 = [v12 conformsToType:*(void *)(a1 + 40)];

    if (v13)
    {
LABEL_5:
      [*(id *)(a1 + 32) getContentsOfURLWithHandler:*(void *)(a1 + 56)];
    }
    else if ([*(id *)(a1 + 40) isEqualToUTType:*MEMORY[0x263F1DBF0]])
    {
      [*(id *)(a1 + 32) getPDFWithOptions:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      id v14 = [*(id *)(a1 + 32) webResource];
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_3;
      v17[3] = &unk_2642882D8;
      id v18 = *(id *)(a1 + 56);
      +[WFWebResourceCapturer getPasteboardRepresentationForWebResource:v14 type:v15 coercionOptions:v16 completionHandler:v17];
    }
  }
}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = a5;
  if (a2)
  {
    id v9 = +[WFFileRepresentation fileWithData:a2 ofType:a3 proposedFilename:a4];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getContentsWithRequest:(id)a3 cacheResult:(BOOL)a4 expectedByteCountHandler:(id)a5 writtenByteCountHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [[WFDownloadURLTask alloc] initWithRequest:v12];
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __122__WFURLContentItem_getContentsWithRequest_cacheResult_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke;
  v21 = &unk_2642882B0;
  objc_copyWeak(&v23, &location);
  id v17 = v15;
  id v22 = v17;
  BOOL v24 = a4;
  [(WFDownloadURLTask *)v16 setCompletionHandler:&v18];
  -[WFDownloadURLTask setExpectedByteCountHandler:](v16, "setExpectedByteCountHandler:", v13, v18, v19, v20, v21);
  [(WFDownloadURLTask *)v16 setWrittenByteCountHandler:v14];
  [(WFDownloadURLTask *)v16 start];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __122__WFURLContentItem_getContentsWithRequest_cacheResult_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v38[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v7 || v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_27;
  }
  id v11 = v8;
  objc_opt_class();
  id v37 = v8;
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v11 allHeaderFields];
    id v13 = [v12 objectForKey:@"Content-Type"];

    id v14 = [v13 componentsSeparatedByString:@";"];
    id v15 = [v14 firstObject];

    if (([v15 isEqualToString:@"application/x-javascript"] & 1) != 0
      || ([v15 hasSuffix:@"+json"] & 1) != 0)
    {
      uint64_t v16 = @"application/json";
    }
    else
    {
      if (![v15 isEqualToString:@"application/xhtml+xml"]) {
        goto LABEL_8;
      }
      uint64_t v16 = @"text/html";
    }

    id v15 = v16;
LABEL_8:
    id v17 = [MEMORY[0x263F852B8] typeFromMIMEType:v15];

    goto LABEL_11;
  }
  id v17 = 0;
LABEL_11:
  if (![v17 isDeclared]
    || [v17 isEqualToUTType:*MEMORY[0x263F1DA48]])
  {
    id v18 = WeakRetained;
    uint64_t v19 = [v11 suggestedFilename];
    v20 = [v11 URL];
    v21 = [v20 host];
    char v22 = [v19 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      id v23 = (void *)MEMORY[0x263F852B8];
      BOOL v24 = [v11 suggestedFilename];
      uint64_t v25 = [v23 typeFromFilename:v24];

      id v17 = (void *)v25;
    }
    id WeakRetained = v18;
  }
  if (!v17)
  {
    objc_super v26 = (void *)MEMORY[0x263F852B8];
    long long v27 = [v11 MIMEType];
    id v17 = [v26 typeFromMIMEType:v27];
  }
  int v28 = [v11 suggestedFilename];
  if ([v17 conformsToUTType:*MEMORY[0x263F1DB00]])
  {
    id v29 = WeakRetained;
    long long v30 = WFPageTitleFromHTMLFile((uint64_t)v7);
    id v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      id v32 = [v11 suggestedFilename];
    }
    id v33 = v32;

    int v28 = v33;
    id WeakRetained = v29;
  }
  v34 = [v11 URL];
  v35 = +[WFFileRepresentation fileWithURL:v7 options:3 ofType:v17 proposedFilename:v28 originalURL:v34];

  if (v35 && *(unsigned char *)(a1 + 48))
  {
    v38[0] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
    [WeakRetained setFileRepresentations:v36 forType:v17];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id v8 = v37;
LABEL_27:
}

- (void)getContentsWithRequest:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6
{
}

- (void)getContentsOfURLWithHandler:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F089E0];
  id v5 = a3;
  id v6 = [(WFURLContentItem *)self URL];
  id v7 = [v4 requestWithURL:v6];

  [v7 _setNonAppInitiated:1];
  [(WFURLContentItem *)self getContentsWithRequest:v7 cacheResult:1 expectedByteCountHandler:0 writtenByteCountHandler:0 completionHandler:v5];
}

- (void)getHeadersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F089E0];
  id v6 = [(WFURLContentItem *)self URL];
  id v7 = [v5 requestWithURL:v6];

  [v7 setHTTPMethod:@"HEAD"];
  [v7 _setNonAppInitiated:1];
  id v8 = objc_msgSend(MEMORY[0x263F08BF8], "wf_sharedSession");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __52__WFURLContentItem_getHeadersWithCompletionHandler___block_invoke;
  v11[3] = &unk_264288288;
  id v12 = v4;
  id v9 = v4;
  id v10 = [v8 dataTaskWithRequest:v7 completionHandler:v11];
  [v10 resume];
}

uint64_t __52__WFURLContentItem_getHeadersWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  uint64_t v2 = NSDictionary;
  uint64_t v3 = [(WFContentItem *)self internalRepresentation];
  id v4 = [v3 wfName];
  id v5 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x263F856B8], 0);

  return (NSDictionary *)v5;
}

+ (id)attributionSetContentOfURL:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 isFileURL];
  if (!v3 || v4)
  {
    id v9 = +[WFContentAttributionSet attributionSetByMergingAttributionSets:MEMORY[0x263EFFA68]];
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] setWithObject:v3];
    id v6 = +[WFURLContentLocation locationWithURLs:v5 error:0];

    if (v6)
    {
      id v7 = +[WFContentAttribution attributionWithDisclosureLevel:0 origin:v6 originalItemIdentifier:0];
      v11[0] = v7;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      id v9 = +[WFContentAttributionSet attributionSetWithAttributions:v8];
    }
    else
    {
      id v9 = +[WFContentAttributionSet attributionSetWithAttributions:MEMORY[0x263EFFA68]];
    }
  }
  return v9;
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d URLs");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  int v4 = WFLocalizedStringResourceWithKey(@"URLs", @"URLs");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  int v4 = WFLocalizedStringResourceWithKey(@"URL (singular)", @"URL");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Web";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v25 = (void *)MEMORY[0x263EFF9B0];
  uint64_t v2 = +[WFObjectType typeWithClass:objc_opt_class()];
  BOOL v24 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];
  id v3 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  int v4 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  id v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v8 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v9 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v10 = (void *)v2;
  id v11 = objc_msgSend(v25, "orderedSetWithObjects:", v2, v24, v3, v4, v5, v6, v7, v8, v9, 0);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [a1 URLCoercions];
  uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v17 = objc_msgSend(v16, "urlItem_outputClasses");
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              char v22 = +[WFObjectType typeWithClass:*(void *)(*((void *)&v28 + 1) + 8 * j)];
              [v11 addObject:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v19);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }

  return v11;
}

+ (id)ownedPasteboardTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD08]];
  int v4 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856B8]];
  id v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  int v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToUTType:*MEMORY[0x263F1DA48]] & 1) != 0)
  {
    goto LABEL_24;
  }
  id v5 = v4;
  if (v5)
  {
    objc_opt_class();
    id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 string];

  LOBYTE(v7) = [v8 isEqualToString:@"UIPrintFormatter"];
  if ((v7 & 1) != 0
    || ([MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v5 isEqualToType:v9],
        v9,
        (v10 & 1) != 0))
  {
LABEL_24:
    unsigned __int8 v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v5 objectClass];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v12 = [(id)objc_opt_class() URLCoercions];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "urlItem_outputClasses");
            char v18 = [v17 containsObject:v11];

            if (v18)
            {

              goto LABEL_24;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___WFURLContentItem;
    unsigned __int8 v19 = objc_msgSendSuper2(&v21, sel_supportedTypeMustBeDeterminedByInstance_, v5);
  }

  return v19;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = (void *)*MEMORY[0x263F1DD08];
  id v17 = [(id)*MEMORY[0x263F1DD08] identifier];
  char v18 = [v11 wfObjectOfClass:v15 forKey:v17];

  uint64_t v19 = [v11 wfObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F856B8]];
  uint64_t v20 = (void *)v19;
  if (v19) {
    objc_super v21 = (void *)v19;
  }
  else {
    objc_super v21 = v12;
  }
  id v22 = v21;

  if (!v18)
  {
    uint64_t v23 = objc_opt_class();
    long long v24 = [v16 identifier];
    long long v25 = [v11 wfObjectOfClass:v23 forKey:v24];

    objc_super v26 = [v25 firstObject];
    uint64_t v27 = objc_opt_class();
    id v28 = v26;
    if (v28 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v30 = getWFGeneralLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long v34 = 136315906;
        *(void *)&v34[4] = "WFEnforceClass";
        *(_WORD *)&v34[12] = 2114;
        *(void *)&v34[14] = v28;
        *(_WORD *)&v34[22] = 2114;
        id v35 = (id)objc_opt_class();
        LOWORD(v36) = 2114;
        *(void *)((char *)&v36 + 2) = v27;
        id v31 = v35;
        _os_log_impl(&dword_216505000, v30, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v34, 0x2Au);
      }
      id v29 = 0;
    }
    else
    {
      id v29 = v28;
    }

    char v18 = [NSURL URLWithString:v29];
  }
  long long v32 = objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v18, v22, v13, v14, *(_OWORD *)v34, *(void *)&v34[16], v35, v36);

  return v32;
}

+ (id)filterRepresentationsForAllowedContent:(id)a3
{
  return (id)objc_msgSend(a3, "if_objectsPassingTest:", &__block_literal_global_12201);
}

BOOL __59__WFURLContentItem_filterRepresentationsForAllowedContent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      if ([v4 isFileURL]) {
        BOOL v5 = +[WFFileRepresentation isAllowedToRepresentFileURL:v4];
      }
      else {
        BOOL v5 = 1;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

+ (void)rediscoverURLCoercionClassesIfNeeded
{
  if (rediscoverURLCoercionClassesIfNeeded_onceToken != -1) {
    dispatch_once(&rediscoverURLCoercionClassesIfNeeded_onceToken, &__block_literal_global_12);
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke_2;
  v3[3] = &__block_descriptor_40_e8_v16__0_8l;
  v3[4] = a1;
  WFRegisterClassesFromClassVendingMethodsIfNeeded(a1, @"allURLCoercionsIn", (os_unfair_lock_s *)&rediscoverURLCoercionClassesIfNeeded_lock, WFShouldRediscoverCURLCoercionClasses, (void *)rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors, v3);
}

uint64_t __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerURLCoercion:a2];
}

uint64_t __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors;
  rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors = v0;

  rediscoverURLCoercionClassesIfNeeded_lock = 0;
  return MEMORY[0x270ED7FD8](WFDyldBulkImageLoadCallback_19085);
}

+ (void)registerURLCoercion:(Class)a3
{
  id v4 = [a1 mutableURLCoercions];
  [v4 addObject:a3];
}

+ (id)URLCoercions
{
  [a1 rediscoverURLCoercionClassesIfNeeded];
  return (id)[a1 mutableURLCoercions];
}

+ (id)mutableURLCoercions
{
  if (mutableURLCoercions_onceToken != -1) {
    dispatch_once(&mutableURLCoercions_onceToken, &__block_literal_global_19086);
  }
  id v2 = (void *)mutableURLCoercions_URLCoercions;
  return v2;
}

uint64_t __53__WFURLContentItem_URLCoercions__mutableURLCoercions__block_invoke()
{
  mutableURLCoercions_URLCoercions = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end