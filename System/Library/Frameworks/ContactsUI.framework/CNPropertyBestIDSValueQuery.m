@interface CNPropertyBestIDSValueQuery
- (CNCancelable)idsLookupToken;
- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4;
- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4 idsAvailabilityProvider:(id)a5 schedulerProvider:(id)a6;
- (CNPropertyBestIDSValueQueryDelegate)delegate;
- (CNPropertyGroupItem)bestIDSProperty;
- (NSArray)idsHandles;
- (NSArray)propertyItems;
- (NSMutableArray)validIDSHandles;
- (NSMutableArray)validIDSItems;
- (void)cancel;
- (void)setDelegate:(id)a3;
- (void)setIdsHandles:(id)a3;
- (void)setIdsLookupToken:(id)a3;
- (void)setPropertyItems:(id)a3;
- (void)setValidIDSHandles:(id)a3;
@end

@implementation CNPropertyBestIDSValueQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validIDSHandles, 0);
  objc_storeStrong((id *)&self->_idsLookupToken, 0);
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_propertyItems, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_validIDSItems, 0);
}

- (void)setValidIDSHandles:(id)a3
{
}

- (NSMutableArray)validIDSHandles
{
  return self->_validIDSHandles;
}

- (void)setIdsLookupToken:(id)a3
{
}

- (CNCancelable)idsLookupToken
{
  return self->_idsLookupToken;
}

- (void)setIdsHandles:(id)a3
{
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setPropertyItems:(id)a3
{
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyBestIDSValueQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyBestIDSValueQueryDelegate *)WeakRetained;
}

- (NSMutableArray)validIDSItems
{
  return self->_validIDSItems;
}

- (CNPropertyGroupItem)bestIDSProperty
{
  v46[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1B758];
  v46[0] = *MEMORY[0x1E4F1B728];
  v46[1] = v3;
  v46[2] = *MEMORY[0x1E4F1B708];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v5 = [(CNPropertyBestIDSValueQuery *)self validIDSHandles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v6)
  {
    id v8 = 0;
    v31 = 0;
LABEL_25:

    goto LABEL_27;
  }
  uint64_t v7 = v6;
  v34 = v4;
  id v8 = 0;
  uint64_t v36 = *(void *)v42;
  uint64_t v9 = *MEMORY[0x1E4F1AEE0];
  uint64_t v35 = *MEMORY[0x1E4F1AEE0];
  id obj = v5;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v42 != v36) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v12 = [(CNPropertyBestIDSValueQuery *)self validIDSHandles];
      if ([v12 containsObject:v11])
      {
        v13 = [(CNPropertyBestIDSValueQuery *)self validIDSHandles];
        char v14 = [v13 containsObject:v8];

        if ((v14 & 1) == 0)
        {
          id v15 = v11;

          id v8 = v15;
          continue;
        }
      }
      else
      {
      }
      v16 = [v11 contactProperty];
      v17 = [v16 key];
      if ([v17 isEqualToString:v9])
      {
        v18 = [v8 contactProperty];
        v19 = [v18 key];
        char v20 = [v19 isEqualToString:v9];

        if ((v20 & 1) == 0) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      v21 = [v11 contactProperty];
      v22 = [v21 label];
      if ([v34 containsObject:v22])
      {
        v23 = [v8 contactProperty];
        v24 = [v23 label];
        char v25 = [v34 containsObject:v24];

        if ((v25 & 1) == 0)
        {
LABEL_16:
          id v26 = v11;

          id v8 = v26;
          uint64_t v9 = v35;
          continue;
        }
      }
      else
      {
      }
      uint64_t v9 = v35;
      if (!v8) {
        id v8 = v11;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v7);

  if (v8)
  {
    v27 = [(CNPropertyBestIDSValueQuery *)self idsHandles];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke;
    v39[3] = &unk_1E549B9F8;
    id v8 = v8;
    id v40 = v8;
    v28 = objc_msgSend(v27, "_cn_firstObjectPassingTest:", v39);

    v29 = [(CNPropertyBestIDSValueQuery *)self propertyItems];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke_2;
    v37[3] = &unk_1E549BA20;
    id v38 = v28;
    id v30 = v28;
    v31 = objc_msgSend(v29, "_cn_firstObjectPassingTest:", v37);

    v5 = v40;
    v4 = v34;
    goto LABEL_25;
  }
  v31 = 0;
  v4 = v34;
LABEL_27:

  return (CNPropertyGroupItem *)v31;
}

uint64_t __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

uint64_t __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 contactProperty];
  v4 = [*(id *)(a1 + 32) contactProperty];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)cancel
{
  uint64_t v3 = [(CNPropertyBestIDSValueQuery *)self idsLookupToken];
  [v3 cancel];

  [(CNPropertyBestIDSValueQuery *)self setDelegate:0];
}

- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4 idsAvailabilityProvider:(id)a5 schedulerProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)CNPropertyBestIDSValueQuery;
  char v14 = [(CNPropertyBestIDSValueQuery *)&v41 init];
  id v15 = v14;
  if (v14)
  {
    [(CNPropertyBestIDSValueQuery *)v14 setPropertyItems:v10];
    v16 = [(CNPropertyBestIDSValueQuery *)v15 propertyItems];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v18 = [(CNPropertyBestIDSValueQuery *)v15 propertyItems];
      v19 = objc_msgSend(v18, "_cn_filter:", &__block_literal_global_3_57815);
      char v20 = objc_msgSend(v19, "_cn_map:", &__block_literal_global_57810);
      [(CNPropertyBestIDSValueQuery *)v15 setIdsHandles:v20];

      v21 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __103__CNPropertyBestIDSValueQuery_initWithPropertyItems_service_idsAvailabilityProvider_schedulerProvider___block_invoke;
      id v38 = &unk_1E549BA48;
      v22 = v15;
      v39 = v22;
      id v23 = v21;
      id v40 = v23;
      v24 = _Block_copy(&v35);
      char v25 = getIDSServiceNameFaceTime_45534();
      int v26 = objc_msgSend(v11, "isEqualToString:", v25, v35, v36, v37, v38);

      if (v26)
      {
        v27 = (void *)MEMORY[0x1E4F5A698];
        v28 = [(CNPropertyBestIDSValueQuery *)v22 idsHandles];
        uint64_t v29 = [v27 validateHandlesForFaceTime:v28 availabilityProvider:v12 schedulerProvider:v13 handler:v24];
      }
      else
      {
        id v30 = getIDSServiceNameiMessage_45536();
        int v31 = [v11 isEqualToString:v30];

        if (!v31)
        {
LABEL_8:

          goto LABEL_9;
        }
        v32 = (void *)MEMORY[0x1E4F5A698];
        v28 = [(CNPropertyBestIDSValueQuery *)v22 idsHandles];
        uint64_t v29 = [v32 validateHandlesForIMessage:v28 availabilityProvider:v12 schedulerProvider:v13 handler:v24];
      }
      v33 = (void *)v29;
      [(CNPropertyBestIDSValueQuery *)v22 setIdsLookupToken:v29];

      goto LABEL_8;
    }
  }
LABEL_9:

  return v15;
}

void __103__CNPropertyBestIDSValueQuery_initWithPropertyItems_service_idsAvailabilityProvider_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = [v3 handle];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v16 = v5;

  int v6 = [v3 isAvailable];
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) validIDSHandles];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setValidIDSHandles:v8];
    }
    uint64_t v9 = [*(id *)(a1 + 32) validIDSHandles];
    char v10 = [v9 containsObject:v16];

    if ((v10 & 1) == 0)
    {
      id v11 = [*(id *)(a1 + 32) validIDSHandles];
      [v11 addObject:v16];
    }
  }
  [*(id *)(a1 + 40) addObject:v16];
  uint64_t v12 = [*(id *)(a1 + 40) count];
  id v13 = [*(id *)(a1 + 32) idsHandles];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    id v15 = [*(id *)(a1 + 32) delegate];
    [v15 queryComplete];
  }
}

- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v9 = [v8 idsAvailabilityProvider];
  char v10 = [v8 defaultSchedulerProvider];
  id v11 = [(CNPropertyBestIDSValueQuery *)self initWithPropertyItems:v7 service:v6 idsAvailabilityProvider:v9 schedulerProvider:v10];

  return v11;
}

@end