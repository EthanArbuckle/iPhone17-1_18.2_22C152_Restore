@interface WFEvernoteContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithNoteRef:(id)a3 note:(id)a4;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (void)createNoteWithContent:(id)a3 completionHandler:(id)a4;
- (BOOL)canEncodeWithCoder:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)includesFileRepresentationInSerializedItem;
- (ENNoteRef)noteRef;
- (WFFileType)preferredFileType;
- (id)name;
- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFEvernoteContentItem

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__WFEvernoteContentItem_getListSubtitle___block_invoke;
    v7[3] = &unk_264E5D7A8;
    id v8 = v4;
    [(WFEvernoteContentItem *)self getObjectRepresentation:v7 forClass:objc_opt_class()];
  }
  return 1;
}

void __41__WFEvernoteContentItem_getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v8 = [a2 modificationDate];
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    [v3 setDoesRelativeDateFormatting:1];
    [v3 setDateStyle:1];
    [v8 timeIntervalSinceNow];
    [v3 setTimeStyle:fabs(v4) < 172800.0];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = [v3 stringFromDate:v8];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

- (BOOL)canEncodeWithCoder:(id)a3
{
  id v3 = a3;
  double v4 = [v3 wfFileCoder];
  if (v4)
  {
    uint64_t v5 = [v3 wfFileCoder];
    BOOL v6 = [v5 targetPlatform] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke;
  v11[3] = &unk_264E5D9E8;
  v13 = self;
  id v14 = v7;
  id v12 = v8;
  id v9 = v8;
  id v10 = v7;
  [(WFEvernoteContentItem *)self getObjectRepresentation:v11 forClass:objc_opt_class()];
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if ([*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DD70]])
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_2;
      v27[3] = &unk_264E5D970;
      id v28 = *(id *)(a1 + 32);
      id v29 = v7;
      id v30 = *(id *)(a1 + 48);
      [v29 generateWebArchiveData:v27];

      id v10 = v28;
    }
    else
    {
      if (![*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DB00]])
      {
        v11 = [v7 resources];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          v13 = [v7 resources];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_4;
          v21[3] = &unk_264E5D998;
          id v22 = *(id *)(a1 + 32);
          id v14 = objc_msgSend(v13, "if_compactMap:", v21);

          if ([v14 count])
          {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

            id v10 = v22;
            goto LABEL_13;
          }
        }
        if (![*(id *)(a1 + 32) conformsToUTType:*MEMORY[0x263F1DBF0]])
        {
          uint64_t v16 = *(void *)(a1 + 48);
          v17 = [(id)objc_opt_class() badCoercionErrorForType:*(void *)(a1 + 32)];
          (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);

          goto LABEL_14;
        }
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_5;
        v18[3] = &unk_264E5D9C0;
        v15 = *(void **)(a1 + 40);
        id v20 = *(id *)(a1 + 48);
        id v19 = *(id *)(a1 + 32);
        [v15 getObjectRepresentation:v18 forClass:getUIPrintFormatterClass()];

        id v10 = v20;
        goto LABEL_13;
      }
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_3;
      v23[3] = &unk_264E5D970;
      id v24 = *(id *)(a1 + 32);
      id v25 = v7;
      id v26 = *(id *)(a1 + 48);
      [v25 generateHTMLData:v23];

      id v10 = v24;
    }
LABEL_13:

    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_2(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F33870];
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  id v6 = a2;
  id v7 = [v5 title];
  id v8 = [v3 fileWithData:v6 ofType:v4 proposedFilename:v7];

  uint64_t v9 = a1[6];
  v11[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_3(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F33870];
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  id v6 = a2;
  id v7 = [v5 title];
  id v8 = [v3 fileWithData:v6 ofType:v4 proposedFilename:v7];

  uint64_t v9 = a1[6];
  v11[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
}

id __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263F852B8];
  uint64_t v5 = [v3 mimeType];
  id v6 = [v4 typeFromMIMEType:v5];

  if ([v6 conformsToType:*(void *)(a1 + 32)])
  {
    id v7 = (void *)MEMORY[0x263F33870];
    id v8 = [v3 data];
    uint64_t v9 = [v3 filename];
    id v10 = [v7 fileWithData:v8 ofType:v6 proposedFilename:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = [MEMORY[0x263F337C8] itemWithObject:a2 named:a3];
    [v5 getFileRepresentations:*(void *)(a1 + 40) forType:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = a3;
  if ((Class)objc_opt_class() == a5)
  {
    uint64_t v12 = +[WFEvernoteAccessResource evernoteSession];
    v13 = [(WFEvernoteContentItem *)self noteRef];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v24[3] = &unk_264E5D888;
    id v25 = v7;
    [v12 downloadNote:v13 progress:0 completion:v24];

    v11 = v25;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v22[3] = &unk_264E5D7A8;
    id v23 = v7;
    [(WFEvernoteContentItem *)self getObjectRepresentation:v22 forClass:objc_opt_class()];
    v11 = v23;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    uint64_t v14 = objc_opt_class();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    v19[3] = &unk_264E5D8F8;
    id v20 = v7;
    Class v21 = a5;
    [(WFEvernoteContentItem *)self coerceToItemClass:v14 completionHandler:v19];
    v11 = v20;
  }
  else
  {
    id v8 = NSStringFromClass(a5);
    int v9 = [@"UIPrintFormatter" isEqualToString:v8];

    if (!v9)
    {
      v15 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);

      goto LABEL_10;
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
    v16[3] = &unk_264E5D948;
    id v17 = v7;
    Class v18 = a5;
    id v10 = objc_msgSend(MEMORY[0x263F852B8], "typeFromPasteboardType:", *MEMORY[0x263F85A38], v16[0], 3221225472, __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6, &unk_264E5D948);
    [(WFEvernoteContentItem *)self getFileRepresentation:v16 forType:v10];

    v11 = v17;
  }

LABEL_10:
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x263F33908];
  id v6 = a3;
  id v7 = [v5 object:a2];
  v9[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 resources];
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_201_51410);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
    v7[3] = &unk_264E5D8D0;
    id v8 = *(id *)(a1 + 32);
    [v6 getObjectRepresentation:v7 forClass:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__51402;
  v15 = __Block_byref_object_dispose__51403;
  id v16 = [MEMORY[0x263F33960] itemWithFile:v5];
  id v7 = (void *)v12[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
  v8[3] = &unk_264E5D920;
  id v9 = *(id *)(a1 + 32);
  id v10 = &v11;
  [v7 getObjectRepresentation:v8 forClass:*(void *)(a1 + 40)];

  _Block_object_dispose(&v11, 8);
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = (void *)MEMORY[0x263F33908];
  id v9 = a4;
  id v10 = [v8 object:a2 named:a3];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v9);

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = (void *)MEMORY[0x263F33908];
  id v8 = a4;
  id v9 = [v7 object:a2 named:a3];
  v11[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v8);
}

id __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x263F852B8];
  uint64_t v4 = [v2 mimeType];
  id v5 = [v3 typeFromMIMEType:v4];

  if ([v5 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    uint64_t v6 = (void *)MEMORY[0x263F85308];
    uint64_t v7 = [v2 data];
    id v8 = [v6 imageWithData:v7];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x263F33908];
      id v10 = [v2 filename];
      uint64_t v11 = [v10 stringByDeletingPathExtension];
      uint64_t v12 = [v9 object:v8 named:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)name
{
  id v3 = [(WFEvernoteContentItem *)self objectForClass:objc_opt_class()];
  uint64_t v4 = [v3 wfName];

  if (v4)
  {
    uint64_t v5 = [v3 wfName];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFEvernoteContentItem;
    uint64_t v5 = [(WFEvernoteContentItem *)&v8 name];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (ENNoteRef)noteRef
{
  uint64_t v3 = objc_opt_class();
  return (ENNoteRef *)[(WFEvernoteContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Evernote notes");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Evernote notes", @"Evernote notes");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Evernote note", @"Evernote note");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A20];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v5 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v6 = [MEMORY[0x263F33910] typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  uint64_t v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  objc_super v8 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  id v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];
  id v10 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

+ (id)ownedTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)itemWithNoteRef:(id)a3 note:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a1 itemWithObject:a3];
  objc_super v8 = [MEMORY[0x263F33908] object:v6];
  v12[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v10 = objc_opt_class();

  [v7 setObjectRepresentations:v9 forClass:v10];
  return v7;
}

+ (void)createNoteWithContent:(id)a3 completionHandler:(id)a4
{
  v14[6] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  void v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__51402;
  v12[4] = __Block_byref_object_dispose__51403;
  id v13 = 0;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  void v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v14[5] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke;
  v9[3] = &unk_264E5D860;
  uint64_t v11 = v12;
  id v8 = v6;
  id v10 = v8;
  [v5 generateCollectionByCoercingToItemClasses:v7 completionHandler:v9];

  _Block_object_dispose(v12, 8);
}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  v46[0] = v7;
  id v10 = [v7 collectionByFilteringToItemClass:objc_opt_class() excludedItems:v46];
  id v11 = v46[0];

  id v45 = v11;
  uint64_t v12 = [v11 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v45];
  id v13 = v45;

  id v44 = v13;
  uint64_t v14 = [v13 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v44];
  id v15 = v44;

  id v43 = v15;
  id v16 = [v15 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v43];
  id v17 = v43;

  id v42 = v17;
  Class v18 = [v17 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v42];
  id v19 = v42;

  v32 = v9;
  if ([v10 numberOfItems])
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_2;
    v40[3] = &unk_264E5D7A8;
    id v20 = &v41;
    id v41 = *(id *)(a1 + 32);
    [v10 getObjectRepresentation:v40 forClass:objc_opt_class()];
  }
  else
  {
    id v30 = v19;
    v31 = v10;
    Class v21 = [v16 items];
    [v21 firstObject];
    v23 = id v22 = v12;
    [v23 preferredFileType];
    id v24 = v14;
    v26 = id v25 = v8;
    uint64_t v29 = *MEMORY[0x263F1DB00];
    char v27 = objc_msgSend(v26, "conformsToUTType:");

    id v8 = v25;
    uint64_t v14 = v24;

    uint64_t v12 = v22;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_3;
    v33[3] = &unk_264E5D838;
    uint64_t v38 = *(void *)(a1 + 40);
    char v39 = v27;
    id v20 = &v34;
    id v34 = v22;
    id v35 = v24;
    id v36 = v18;
    id v37 = *(id *)(a1 + 32);
    if (v27) {
      [MEMORY[0x263F852B8] typeWithUTType:v29];
    }
    else {
    id v28 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
    }
    [v16 getFileRepresentation:v33 forType:v28];

    id v19 = v30;
    id v10 = v31;
  }
}

uint64_t __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  if (v5)
  {
    id v7 = objc_alloc_init(ENWebContentTransformer);
    id v8 = [v5 wfName];
    [(ENWebContentTransformer *)v7 setTitle:v8];

    id v9 = [v5 wfType];
    id v10 = [v9 MIMEType];
    [(ENWebContentTransformer *)v7 setMimeType:v10];

    if (*(unsigned char *)(a1 + 72))
    {
      id v11 = [NSString alloc];
      uint64_t v12 = [v5 data];
      uint64_t v13 = [v11 initWithData:v12 encoding:4];
    }
    else
    {
      uint64_t v12 = [v5 data];
      uint64_t v13 = +[ENWebArchive webArchiveWithData:v12];
    }
    Class v18 = (void *)v13;
    uint64_t v14 = [(ENWebContentTransformer *)v7 transformedValue:v13];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    id v15 = [*(id *)(a1 + 32) items];
    objc_msgSend(v15, "if_map:", &__block_literal_global_181_51461);
    id v7 = (ENWebContentTransformer *)objc_claimAutoreleasedReturnValue();

    id v16 = [*(id *)(a1 + 40) items];
    uint64_t v12 = objc_msgSend(v16, "if_map:", &__block_literal_global_184_51462);

    id v17 = [(ENWebContentTransformer *)v7 arrayByAddingObjectsFromArray:v12];
    Class v18 = [v17 componentsJoinedByString:@"\n"];

    if (v18)
    {
      id v19 = +[ENNoteContent noteContentWithString:v18];
      [v14 setContent:v19];
    }
  }

  id v20 = *(void **)(a1 + 48);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_6;
  v24[3] = &unk_264E5D810;
  id v25 = v14;
  long long v23 = *(_OWORD *)(a1 + 56);
  id v21 = (id)v23;
  long long v26 = v23;
  id v22 = v14;
  [v20 getFileRepresentations:v24 forType:0];
}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v20 = a3;
  if (v20) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = [ENResource alloc];
        uint64_t v12 = objc_msgSend(v10, "data", v20);
        uint64_t v13 = [v10 wfType];
        uint64_t v14 = [v13 MIMEType];
        id v15 = [v10 filename];
        id v16 = [(ENResource *)v11 initWithData:v12 mimeType:v14 filename:v15];

        [*(id *)(a1 + 32) addResource:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  id v17 = [*(id *)(a1 + 32) resources];
  if (v17)
  {
  }
  else
  {
    Class v18 = [*(id *)(a1 + 32) content];

    if (!v18)
    {
      id v19 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_14;
    }
  }
  id v19 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_14:
  v19();
}

id __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 URL];
  id v3 = [v2 absoluteString];

  return v3;
}

uint64_t __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 string];
}

+ (id)propertyBuilders
{
  void v12[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F33808] block:&__block_literal_global_51474 name:@"Creation Date" class:objc_opt_class()];
  id v3 = [v2 userInfo:*MEMORY[0x263F33AF0]];
  uint64_t v4 = [v3 tense:1];
  id v5 = [v4 timeUnits:8444];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x263F33808] block:&__block_literal_global_165 name:@"Last Modified Date" class:objc_opt_class()];
  uint64_t v7 = [v6 userInfo:*MEMORY[0x263F33AF8]];
  uint64_t v8 = [v7 tense:1];
  id v9 = [v8 timeUnits:8444];
  v12[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFEvernoteContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_264E5D7A8;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 modificationDate];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFEvernoteContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_264E5D7A8;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 creationDate];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end