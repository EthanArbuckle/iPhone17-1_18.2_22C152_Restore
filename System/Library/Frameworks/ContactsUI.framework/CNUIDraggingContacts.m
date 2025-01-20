@interface CNUIDraggingContacts
+ (BOOL)canAcceptDropForDropSession:(id)a3;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)contactsFromDraggingContacts:(id)a3 withKeys:(id)a4;
+ (id)contactsWithIdentifiers:(id)a3 store:(id)a4 keysToFetch:(id)a5 unifyResults:(BOOL)a6 error:(id *)a7;
+ (id)dragItemForContact:(id)a3 withContactStore:(id)a4;
+ (id)draggingContactsForContacts:(id)a3 contactStore:(id)a4;
+ (id)draggingContactsWithItemProviderData:(id)a3 typeIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6;
+ (id)imageForDragging;
+ (id)itemProviderForContact:(id)a3 withContactStore:(id)a4;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (void)provideContactsForDropSession:(id)a3 withKeys:(id)a4 completionBlock:(id)a5;
+ (void)provideVCardURLForDropSession:(id)a3 completionBlock:(id)a4;
- (CNContactStore)contactStore;
- (CNUIDraggingContacts)initWithDraggingContacts:(id)a3 contactStore:(id)a4;
- (NSArray)draggingContacts;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)setDraggingContacts:(id)a3;
@end

@implementation CNUIDraggingContacts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_draggingContacts, 0);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setDraggingContacts:(id)a3
{
}

- (NSArray)draggingContacts
{
  return self->_draggingContacts;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F5A258];
  v9 = [(CNUIDraggingContacts *)self draggingContacts];
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if (v8)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v10 = [(CNUIDraggingContacts *)self draggingContacts];
    v11 = [v10 objectAtIndexedSubscript:0];

    v12 = [v11 dataRepresentationForType:v6];
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    (*((void (**)(id, void *, void))v7 + 2))(v7, v13, 0);
  }
  return 0;
}

- (CNUIDraggingContacts)initWithDraggingContacts:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIDraggingContacts;
  v9 = [(CNUIDraggingContacts *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_draggingContacts, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v11 = v10;
  }

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)[MEMORY[0x1E4F1B9D8] availableDataRepresentationTypes];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F1B980];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  v11 = [(id)objc_opt_class() draggingContactsWithItemProviderData:v9 typeIdentifier:v8 contactStore:v10 error:a5];

  return v11;
}

+ (id)draggingContactsForContacts:(id)a3 contactStore:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v7 = 0;
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v15 = objc_alloc(MEMORY[0x1E4F1B9D8]);
          v16 = objc_msgSend(v15, "initWithContact:contactStore:", v14, v6, (void)v18);
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v7 = [[CNUIDraggingContacts alloc] initWithDraggingContacts:v8 contactStore:v6];
  }

  return v7;
}

+ (id)draggingContactsWithItemProviderData:(id)a3 typeIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = [(id)objc_opt_class() readableTypeIdentifiersForItemProvider];
  int v14 = [v13 containsObject:v11];

  if (v14)
  {
    if ([v11 isEqualToString:*MEMORY[0x1E4F1AE10]])
    {
      id v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
      v16 = 0;
      if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
      {
        v20[0] = *MEMORY[0x1E4F1AE08];
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        v16 = [a1 contactsWithIdentifiers:v15 store:v12 keysToFetch:v17 unifyResults:0 error:a6];
      }
    }
    else if ([v11 isEqualToString:*MEMORY[0x1E4F22718]])
    {
      v16 = [MEMORY[0x1E4F1B998] contactsWithData:v10 error:a6];
    }
    else
    {
      v16 = 0;
    }
    long long v18 = [a1 draggingContactsForContacts:v16 contactStore:v12];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

+ (id)contactsWithIdentifiers:(id)a3 store:(id)a4 keysToFetch:(id)a5 unifyResults:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = (objc_class *)MEMORY[0x1E4F1B908];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)[[v11 alloc] initWithKeysToFetch:v12];

  v16 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v14];

  [v15 setPredicate:v16];
  [v15 setUnifyResults:v8];
  [v15 setOnlyMainStore:1];
  v17 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__CNUIDraggingContacts_contactsWithIdentifiers_store_keysToFetch_unifyResults_error___block_invoke;
  v22[3] = &unk_1E5498C50;
  id v23 = v17;
  id v18 = v17;
  LODWORD(a7) = [v13 enumerateContactsWithFetchRequest:v15 error:a7 usingBlock:v22];

  if (a7) {
    long long v19 = v18;
  }
  else {
    long long v19 = 0;
  }
  id v20 = v19;

  return v20;
}

uint64_t __85__CNUIDraggingContacts_contactsWithIdentifiers_store_keysToFetch_unifyResults_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F22718];
  v5[0] = *MEMORY[0x1E4F1AE10];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return (NSArray *)v3;
}

+ (void)provideVCardURLForDropSession:(id)a3 completionBlock:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, void))a4;
  id v9 = (id)*MEMORY[0x1E4F225B8];
  v30[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  char v11 = [v7 hasItemsConformingToTypeIdentifiers:v10];

  if ((v11 & 1) == 0)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"CNUIDraggingContacts.m" lineNumber:145 description:@"dropSession does not contain items of type file URL"];
  }
  uint64_t v12 = *MEMORY[0x1E4F5A258];
  id v13 = [v7 items];
  LOBYTE(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  if ((v12 & 1) == 0) {
    v8[2](v8, 0);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = objc_msgSend(v7, "items", v7);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v25 + 1) + 8 * v18) itemProvider];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __70__CNUIDraggingContacts_provideVCardURLForDropSession_completionBlock___block_invoke;
        v23[3] = &unk_1E5499D48;
        v24 = v8;
        id v20 = (id)[v19 loadDataRepresentationForTypeIdentifier:v9 completionHandler:v23];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }
}

void __70__CNUIDraggingContacts_provideVCardURLForDropSession_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithData:v4 encoding:4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)contactsFromDraggingContacts:(id)a3 withKeys:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v12 = [v11 draggingContacts];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              uint64_t v18 = [v17 fetchContactWithKeys:v6];
              if (v18)
              {
                long long v19 = [v17 fetchContactWithKeys:v6];
                [v7 addObject:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  id v20 = [v7 allObjects];

  return v20;
}

+ (void)provideContactsForDropSession:(id)a3 withKeys:(id)a4 completionBlock:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  char v11 = (void (**)(id, void))a5;
  int v12 = [v9 canLoadObjectsOfClass:objc_opt_class()];
  uint64_t v13 = *MEMORY[0x1E4F1AE70];
  v29[0] = *MEMORY[0x1E4F1AE68];
  v29[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  int v15 = [v9 hasItemsConformingToTypeIdentifiers:v14];

  if ((v12 & 1) == 0 && (v15 & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"CNUIDraggingContacts.m" lineNumber:112 description:@"dropSession does not support creating items of class CNUIDraggingContacts or CNContact"];
  }
  uint64_t v16 = *MEMORY[0x1E4F5A258];
  uint64_t v17 = [v9 items];
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if ((v16 & 1) == 0) {
    v11[2](v11, 0);
  }
  if (v15)
  {
    uint64_t v18 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke;
    v27[3] = &unk_1E5498C00;
    long long v19 = (id *)&v28;
    long long v28 = v11;
    id v20 = (id)[v9 loadObjectsOfClass:v18 completion:v27];
LABEL_10:

    goto LABEL_11;
  }
  if (v12)
  {
    uint64_t v21 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke_2;
    v24[3] = &unk_1E5498C28;
    long long v19 = (id *)v26;
    v26[0] = v11;
    v26[1] = a1;
    id v25 = v10;
    id v22 = (id)[v9 loadObjectsOfClass:v21 completion:v24];

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [(id)objc_opt_class() contactsFromDraggingContacts:v4 withKeys:*(void *)(a1 + 32)];

  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
}

+ (BOOL)canAcceptDropForDropSession:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F22718];
  v12[0] = *MEMORY[0x1E4F225B8];
  v12[1] = v4;
  v12[2] = *MEMORY[0x1E4F1AE70];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  if ([v3 hasItemsConformingToTypeIdentifiers:v5])
  {
    id v6 = [v3 localDragSession];
    if (v6)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4F1AE68];
      v11[0] = *MEMORY[0x1E4F1AE10];
      v11[1] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      int v7 = [v3 hasItemsConformingToTypeIdentifiers:v9] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)imageForDragging
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v2 imageNamed:@"vCardDragging" inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

+ (id)itemProviderForContact:(id)a3 withContactStore:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1B9D8]) initWithContact:v6 contactStore:v7];
    id v9 = [CNUIDraggingContacts alloc];
    v23[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    char v11 = [(CNUIDraggingContacts *)v9 initWithDraggingContacts:v10 contactStore:v7];

    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v11];
    uint64_t v13 = *MEMORY[0x1E4F1AE68];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__CNUIDraggingContacts_itemProviderForContact_withContactStore___block_invoke;
    v19[3] = &unk_1E5498BD8;
    id v22 = a1;
    id v14 = v6;
    id v20 = v14;
    id v15 = v7;
    id v21 = v15;
    [v12 registerDataRepresentationForTypeIdentifier:v13 visibility:0 loadHandler:v19];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F5A738]) initWithContactStore:v15];
    uint64_t v17 = [v16 makeActivityAdvertisingViewingOfContact:v14];
    [v16 updateUserActivityState:v17 withContentsOfContact:v14];
    [v12 registerObject:v17 visibility:0];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

id __64__CNUIDraggingContacts_itemProviderForContact_withContactStore___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) identifier];
  v17[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
  uint64_t v16 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  id v15 = 0;
  id v10 = [v4 contactsWithIdentifiers:v6 store:v7 keysToFetch:v9 unifyResults:1 error:&v15];
  id v11 = v15;

  if ([v10 count])
  {
    int v12 = [v10 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 loadDataWithTypeIdentifier:*MEMORY[0x1E4F1AE68] forItemProviderCompletionHandler:v3];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)dragItemForContact:(id)a3 withContactStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() itemProviderForContact:v7 withContactStore:v6];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CNUIDraggingContacts_dragItemForContact_withContactStore___block_invoke;
  v12[3] = &__block_descriptor_40_e20___UIDragPreview_8__0l;
  void v12[4] = a1;
  [v9 setPreviewProvider:v12];
  id v10 = +[CNUIVCardUtilities fileNameForContact:v7];

  [v8 setSuggestedName:v10];

  return v9;
}

id __60__CNUIDraggingContacts_dragItemForContact_withContactStore___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1838]);
  v1 = [(id)objc_opt_class() imageForDragging];
  uint64_t v2 = (void *)[v0 initWithImage:v1];

  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:v2];

  return v3;
}

@end