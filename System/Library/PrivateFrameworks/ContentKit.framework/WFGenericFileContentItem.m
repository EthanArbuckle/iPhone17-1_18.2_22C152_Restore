@interface WFGenericFileContentItem
+ (id)contentCategories;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)isContent;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFGenericFileContentItem

- (BOOL)isContent
{
  v2 = [(WFContentItem *)self internalRepresentationType];
  char v3 = [v2 conformsToUTType:*MEMORY[0x263F1DA38]];

  return v3;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 string];

  int v8 = [v7 isEqualToString:@"UIPrintFormatter"];
  if (([v4 isEqualToUTType:*MEMORY[0x263F1DD70]] & 1) != 0 || v8)
  {
    unsigned __int8 v10 = [(WFGenericFileContentItem *)self isContent];
LABEL_12:
    BOOL v9 = v10;
    goto LABEL_13;
  }
  if (([v4 isEqualToUTType:*MEMORY[0x263F1DA38]] & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)WFGenericFileContentItem;
    unsigned __int8 v10 = [(WFContentItem *)&v12 canGenerateRepresentationForType:v4];
    goto LABEL_12;
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToUTType:*MEMORY[0x263F1DD70]])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke;
    v16[3] = &unk_264289130;
    id v17 = v10;
    id v18 = v9;
    v19 = self;
    id v20 = v8;
    [(WFContentItem *)self getFileRepresentation:v16 forType:0 options:v18];

    v11 = v17;
  }
  else
  {
    if (![v10 isEqualToUTType:*MEMORY[0x263F1DBF0]])
    {
      objc_super v12 = [(id)objc_opt_class() badCoercionErrorForType:v10];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);

      goto LABEL_7;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_3;
    v13[3] = &unk_264289E40;
    id v14 = v9;
    id v15 = v8;
    [(WFContentItem *)self getFileRepresentation:v13 forType:0 options:v14];

    v11 = v14;
  }

LABEL_7:
}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = +[WFWebResource webResourceWithFile:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v7[3] = &unk_264289108;
  id v6 = *(id *)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  +[WFWebResourceCapturer getPasteboardRepresentationForWebResource:v3 type:v4 coercionOptions:v5 completionHandler:v7];
}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 dictionary];
  id v6 = [v5 objectForKey:@"WFCoercionOptionPDFIncludeMargin"];
  uint64_t v7 = [v6 BOOLValue];

  id v9 = +[WFWebResource webResourceWithFile:v4];

  id v8 = objc_alloc_init(WFWebResourceCapturer);
  [(WFWebResourceCapturer *)v8 generatePDFForWebResource:v9 includeMargin:v7 coercionOptions:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v16)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  if ([v10 isEqualToString:@"_"])
  {

    uint64_t v12 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v10)
    {
      int v13 = 0;
      id v14 = v10;
      goto LABEL_8;
    }
  }
  id v14 = [*(id *)(a1 + 32) name];
  id v10 = 0;
  int v13 = 1;
LABEL_8:
  id v15 = +[WFFileRepresentation fileWithData:v16 ofType:v9 proposedFilename:v14];
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v15, v11);

  if (v13) {
LABEL_10:
  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__18152;
    v22 = __Block_byref_object_dispose__18153;
    id v23 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
    v15[3] = &unk_2642890E0;
    id v11 = v10;
    id v16 = v11;
    id v17 = &v18;
    [(WFContentItem *)self getFileRepresentation:v15 forType:0 options:v8];
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);
    id v9 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFGenericFileContentItem;
    id v9 = [(WFContentItem *)&v14 generateObjectRepresentationForClass:a3 options:v8 error:a5];
  }

  return v9;
}

void __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isTemporaryFile])
  {
    id v4 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
      _os_log_impl(&dword_216505000, v4, OS_LOG_TYPE_DEFAULT, "%s Representation is data or temporary file", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F054C0] defaultManager];
    id v6 = [v3 fileURL];
    id v24 = 0;
    uint64_t v7 = [v5 itemForURL:v6 error:&v24];
    id v8 = v24;

    if (v7)
    {
      id v9 = objc_alloc(MEMORY[0x263F51F98]);
      dispatch_semaphore_t v10 = (void *)[v9 initWithBundleIdentifier:*MEMORY[0x263F854E8]];
      id v11 = objc_alloc(MEMORY[0x263F52040]);
      dispatch_time_t v12 = [v7 itemIdentifier];
      int v13 = (void *)[v11 initWithValue:v12 typeName:@"DOCFileEntity"];

      id v14 = objc_alloc(MEMORY[0x263F52108]);
      v25 = v13;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      id v16 = (void *)[v14 initWithIdentifiers:v15 entityType:@"DOCFileEntity"];

      id v17 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v7 itemIdentifier];
        *(_DWORD *)buf = 136315394;
        v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_impl(&dword_216505000, v17, OS_LOG_TYPE_DEFAULT, "%s Fetching entity with identifier %@", buf, 0x16u);
      }
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke_213;
      v22[3] = &unk_2642890B8;
      long long v21 = *(_OWORD *)(a1 + 32);
      id v19 = (id)v21;
      long long v23 = v21;
      [v10 performQuery:v16 completionHandler:v22];
    }
    else
    {
      uint64_t v20 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_216505000, v20, OS_LOG_TYPE_ERROR, "%s Could not retreive FPItem with error: %@", buf, 0x16u);
      }

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
}

void __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 value];
    id v9 = [v8 value];
    int v19 = 136315650;
    uint64_t v20 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v19, 0x20u);
  }
  dispatch_semaphore_t v10 = [v5 value];
  id v11 = [v10 value];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      dispatch_time_t v12 = v11;
    }
    else {
      dispatch_time_t v12 = 0;
    }
  }
  else
  {
    dispatch_time_t v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 firstObject];

  id v15 = [v14 value];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = +[WFObjectRepresentation object:v15];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_semaphore_t v10 = NSStringFromClass(a5);
  int v11 = [@"UIPrintFormatter" isEqualToString:v10];

  if (v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v13[3] = &unk_26428AAB0;
    id v14 = v9;
    id v15 = self;
    id v16 = v8;
    [(WFContentItem *)self getFileRepresentation:v13 forType:0 options:v14];
  }
  else
  {
    dispatch_time_t v12 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v12);
  }
}

void __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[WFWebResource webResourceWithFile:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
  v6[3] = &unk_264289090;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:v3 coercionOptions:v4 completionHandler:v6];
}

void __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:@"_"])
  {

    uint64_t v9 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v7) {
      goto LABEL_5;
    }
  }
  id v7 = [*(id *)(a1 + 32) name];
LABEL_5:
  (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  v10[0] = v3;
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  v10[1] = v4;
  id v5 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  v10[2] = v5;
  id v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  v10[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  id v8 = [v2 orderedSetWithArray:v7];

  return v8;
}

+ (id)ownedTypes
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = (void *)MEMORY[0x263EFF9D8];
  if (v3 == a1)
  {
    id v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];
    id v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA38]];
    id v5 = objc_msgSend(v4, "orderedSetWithObjects:", v6, v7, 0);
  }
  else
  {
    id v5 = objc_opt_new();
  }
  return v5;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v72.receiver = a1;
  v72.super_class = (Class)&OBJC_METACLASS___WFGenericFileContentItem;
  v59 = v14;
  v60 = v13;
  uint64_t v17 = objc_msgSendSuper2(&v72, sel_itemWithSerializedItem_forType_named_attributionSet_cachingIdentifier_, v12, v13, v14, v15, v16);
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
    goto LABEL_53;
  }
  id v57 = v16;
  id v58 = v15;
  uint64_t v20 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v56 = v12;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v68 objects:v75 count:16];
  id v61 = v21;
  if (!v22)
  {
    id v24 = v60;
    goto LABEL_27;
  }
  uint64_t v23 = v22;
  obuint64_t j = *(id *)v69;
  id v24 = v60;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(id *)v69 != obj) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v68 + 1) + 8 * i);
      v27 = [MEMORY[0x263F852B8] typeFromPasteboardType:v26];
      __int16 v28 = [a1 allSupportedTypes];
      if ([v27 conformsToTypes:v28])
      {

LABEL_10:
        if (!v24)
        {
          id v29 = [a1 ownedTypes];
          if ([v27 conformsToTypes:v29])
          {

            goto LABEL_17;
          }
          v34 = [a1 ownedPasteboardTypes];
          int v35 = [v27 conformsToTypes:v34];

          if (v35) {
LABEL_17:
          }
            id v24 = v27;
          else {
            id v24 = 0;
          }
        }
        __int16 v28 = [v21 objectForKey:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [v20 addObject:v27];
        }
LABEL_22:

        goto LABEL_23;
      }
      if ((id)objc_opt_class() != a1) {
        goto LABEL_22;
      }
      [v27 fileExtension];
      uint64_t v30 = v20;
      v32 = id v31 = v24;
      uint64_t v33 = [v32 length];

      id v24 = v31;
      uint64_t v20 = v30;
      id v21 = v61;

      if (v33) {
        goto LABEL_10;
      }
LABEL_23:
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v68 objects:v75 count:16];
  }
  while (v23);
LABEL_27:

  if ([v20 count])
  {
    id v16 = v57;
    id v15 = v58;
    if (!v24)
    {
      id v24 = [v20 firstObject];
    }
    v36 = [v24 string];
    v37 = [v21 objectForKey:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v38 = [v37 dataUsingEncoding:4];

      v37 = (void *)v38;
    }
    objc_opt_class();
    v60 = v24;
    if (objc_opt_isKindOfClass())
    {
      v55 = v36;
      uint64_t v39 = *MEMORY[0x263F1DA48];
      if ([v24 isEqualToUTType:*MEMORY[0x263F1DA48]]) {
        id v40 = 0;
      }
      else {
        id v40 = v24;
      }
      v41 = +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v37, v40, v59, v37);
      id v19 = [a1 itemWithFile:v41 attributionSet:v58 cachingIdentifier:v57];

      [v20 removeObject:v24];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obja = v20;
      uint64_t v42 = [obja countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v65 != v44) {
              objc_enumerationMutation(obja);
            }
            v46 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            v47 = [v46 string];
            v48 = [v21 objectForKey:v47];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v49 = [v48 dataUsingEncoding:4];

              v48 = (void *)v49;
            }
            if ([v60 isEqualToUTType:v39]) {
              v50 = 0;
            }
            else {
              v50 = v46;
            }
            v51 = +[WFFileRepresentation fileWithData:v48 ofType:v50 proposedFilename:v59];
            v73 = v51;
            v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
            [v19 setFileRepresentations:v52 forType:v46];

            id v21 = v61;
          }
          uint64_t v43 = [obja countByEnumeratingWithState:&v64 objects:v74 count:16];
        }
        while (v43);
      }

      id v16 = v57;
      id v15 = v58;
      v37 = v54;
      v36 = v55;
    }
    else
    {
      id v19 = 0;
    }

    id v12 = v56;
  }
  else
  {
    v60 = v24;
    id v19 = 0;
    id v12 = v56;
    id v16 = v57;
    id v15 = v58;
  }
  uint64_t v18 = 0;

LABEL_53:
  return v19;
}

+ (id)stringConversionBehavior
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v4 = [a1 propertyForName:@"Name"];
    id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v4];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___WFGenericFileContentItem;
    id v3 = objc_msgSendSuper2(&v6, sel_stringConversionBehavior);
  }
  return v3;
}

+ (id)propertyBuilders
{
  v25[5] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    id v24 = WFLocalizedContentPropertyNameMarker(@"File Size");
    uint64_t v23 = +[WFContentPropertyBuilder block:&__block_literal_global_18194 name:v24 class:objc_opt_class()];
    uint64_t v22 = [v23 userInfo:@"WFFileSizeProperty"];
    v25[0] = v22;
    id v21 = WFLocalizedContentPropertyNameMarker(@"File Extension");
    uint64_t v20 = +[WFContentPropertyBuilder block:&__block_literal_global_166_18196 name:v21 class:objc_opt_class()];
    id v19 = [v20 userInfo:@"WFFileExtensionProperty"];
    uint64_t v18 = [v19 caseInsensitive:1];
    v25[1] = v18;
    uint64_t v17 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
    id v16 = +[WFContentPropertyBuilder block:&__block_literal_global_172_18199 name:v17 class:objc_opt_class()];
    id v15 = [v16 userInfo:@"WFFileCreationDate"];
    id v14 = [v15 tense:1];
    id v13 = [v14 timeUnits:8444];
    v25[2] = v13;
    id v3 = WFLocalizedContentPropertyNameMarker(@"File Path");
    uint64_t v4 = +[WFContentPropertyBuilder block:&__block_literal_global_179 name:v3 class:objc_opt_class()];
    id v5 = [v4 userInfo:MEMORY[0x263EFFA78]];
    objc_super v6 = [v5 caseInsensitive:0];
    v25[3] = v6;
    id v7 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
    id v8 = +[WFContentPropertyBuilder block:&__block_literal_global_184 name:v7 class:objc_opt_class()];
    uint64_t v9 = [v8 userInfo:@"WFFileModificationDate"];
    id v10 = [v9 tense:1];
    int v11 = [v10 timeUnits:8444];
    v25[4] = v11;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:5];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_9;
  v7[3] = &unk_26428AA60;
  id v8 = v5;
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 modificationDate];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_7;
  v7[3] = &unk_26428AA60;
  id v8 = v5;
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 fileURL];
  id v6 = objc_msgSend(v5, "wf_displayPath");
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
  else
  {
    id v7 = [v8 filename];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_5;
  v7[3] = &unk_26428AA60;
  id v8 = v5;
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 creationDate];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __44__WFGenericFileContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 getPreferredFileExtension:a4];
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

@end