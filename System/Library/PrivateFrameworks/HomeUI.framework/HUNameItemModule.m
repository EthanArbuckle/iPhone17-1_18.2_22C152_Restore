@interface HUNameItemModule
- (HFItemBuilder)sourceItemBuilder;
- (HFNamingComponentCreating)sourceItem;
- (HFStaticItemProvider)itemProvider;
- (HFTransformItem)nameAndIconItem;
- (HUNameItemModule)init;
- (HUNameItemModule)initWithItemUpdater:(id)a3 sourceServiceLikeItem:(id)a4 itemBuilder:(id)a5;
- (NSSet)items;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setItemProvider:(id)a3;
- (void)setItems:(id)a3;
- (void)setNameAndIconItem:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setSourceItemBuilder:(id)a3;
@end

@implementation HUNameItemModule

- (HUNameItemModule)initWithItemUpdater:(id)a3 sourceServiceLikeItem:(id)a4 itemBuilder:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUNameItemModule;
  v10 = [(HFItemModule *)&v13 initWithItemUpdater:a3];
  v11 = v10;
  if (v10)
  {
    [(HUNameItemModule *)v10 setSourceItem:v8];
    [(HUNameItemModule *)v11 setSourceItemBuilder:v9];
  }

  return v11;
}

- (HUNameItemModule)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItemUpdater_sourceServiceLikeItem_itemBuilder_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNameItemModule.m", 38, @"%s is unavailable; use %@ instead",
    "-[HUNameItemModule init]",
    v5);

  return 0;
}

- (id)itemProviders
{
  uint64_t v3 = [(HUNameItemModule *)self itemProvider];
  if (!v3
    || (v4 = (void *)v3,
        [(HUNameItemModule *)self nameAndIconItem],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F696A8]);
    v7 = [(HUNameItemModule *)self sourceItem];
    id v8 = (void *)[v7 copy];
    id v9 = (void *)[v6 initWithSourceItem:v8 transformationBlock:&__block_literal_global_171];
    [(HUNameItemModule *)self setNameAndIconItem:v9];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = [(HUNameItemModule *)self nameAndIconItem];
    v12 = objc_msgSend(v10, "na_setWithSafeObject:", v11);
    [(HUNameItemModule *)self setItems:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
    v14 = [(HUNameItemModule *)self items];
    v15 = (void *)[v13 initWithItems:v14];
    [(HUNameItemModule *)self setItemProvider:v15];
  }
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = [(HUNameItemModule *)self itemProvider];
  v18 = objc_msgSend(v16, "na_setWithSafeObject:", v17);

  return v18;
}

id __33__HUNameItemModule_itemProviders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = *MEMORY[0x1E4F68908];
  v19[0] = *MEMORY[0x1E4F68AB8];
  v19[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F68A00];
  v19[2] = *MEMORY[0x1E4F689E8];
  v19[3] = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v2 objectForKeyedSubscript:v11];
        objc_msgSend(v3, "na_safeSetObject:forKey:", v12, v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  id v13 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68CA0]];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E4F68A08]);

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUNameItemModuleSectionIdentifier"];
  uint64_t v7 = [(HUNameItemModule *)self nameAndIconItem];
  v16[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v6 setItems:v8];

  uint64_t v9 = [(HUNameItemModule *)self sourceItem];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if (v7)
  {
    v10 = HULocalizedWiFiString(@"HUNetworkRouterNameSectionFooter");
    [v6 setFooterTitle:v10];
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F69220];
  long long v15 = v6;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v13 = [v11 filterSections:v12 toDisplayedItems:v5];

  return v13;
}

- (HFNamingComponentCreating)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (HFItemBuilder)sourceItemBuilder
{
  return self->_sourceItemBuilder;
}

- (void)setSourceItemBuilder:(id)a3
{
}

- (HFTransformItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);
  objc_storeStrong((id *)&self->_sourceItemBuilder, 0);

  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end