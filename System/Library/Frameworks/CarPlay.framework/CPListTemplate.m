@interface CPListTemplate
+ (BOOL)supportsSecureCoding;
+ (NSUInteger)maximumItemCount;
+ (NSUInteger)maximumSectionCount;
- (CPAssistantCellConfiguration)assistantCellConfiguration;
- (CPListTemplate)initWithCoder:(id)a3;
- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections;
- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections assistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration;
- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectImageAtIndex:(unint64_t)a4 inImageRowItemWithIdentifier:(id)a5;
- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectListItemWithIdentifier:(id)a4 completionHandler:(id)a5;
- (NSArray)emptyViewSubtitleVariants;
- (NSArray)emptyViewTitleVariants;
- (NSArray)sections;
- (NSIndexPath)indexPathForItem:(id)item;
- (NSMutableSet)itemsToReload;
- (NSString)title;
- (NSUInteger)itemCount;
- (NSUInteger)sectionCount;
- (id)_itemForHostItemWithIdentifier:(id)a3;
- (id)_sectionsByTrimmingAndLinkingSections:(id)a3;
- (id)delegate;
- (void)_linkItemsInSection:(id)a3;
- (void)_setItemNeedsUpdate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)performUpdate;
- (void)setAssistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration;
- (void)setDelegate:(id)delegate;
- (void)setEmptyViewSubtitleVariants:(NSArray *)emptyViewSubtitleVariants;
- (void)setEmptyViewTitleVariants:(NSArray *)emptyViewTitleVariants;
- (void)setItemsToReload:(id)a3;
- (void)updateHeaderImage:(id)a3 forSectionIdentifier:(id)a4;
- (void)updateSections:(NSArray *)sections;
@end

@implementation CPListTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUInteger)maximumItemCount
{
  if (CPCurrentProcessHasAudioEntitlement() & 1) != 0 || (CPCurrentProcessHasPublicSafetyEntitlement()) {
    return 500;
  }
  if (CPCurrentProcessHasCommunicationEntitlement()) {
    return 24;
  }
  if (CPCurrentProcessHasMapsEntitlement()) {
    return 24;
  }
  return 12;
}

+ (NSUInteger)maximumSectionCount
{
  return 200;
}

- (id)_sectionsByTrimmingAndLinkingSections:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFF980] array];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  uint64_t v7 = [(id)objc_opt_class() maximumSectionCount];
  uint64_t v8 = [(id)objc_opt_class() maximumItemCount];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CPListTemplate__sectionsByTrimmingAndLinkingSections___block_invoke;
  v12[3] = &unk_26430A8E8;
  v15 = v20;
  v16 = v21;
  uint64_t v17 = v7;
  uint64_t v18 = v8;
  SEL v19 = a2;
  id v9 = v6;
  id v13 = v9;
  v14 = self;
  [v5 enumerateObjectsUsingBlock:v12];
  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);

  return v10;
}

void __56__CPListTemplate__sectionsByTrimmingAndLinkingSections___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64)
    || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(a1 + 72))
  {
    *a4 = 1;
    goto LABEL_13;
  }
  id v26 = v7;
  uint64_t v8 = objc_opt_class();
  id v9 = *(const char **)(a1 + 80);
  id v10 = v26;
  v11 = [MEMORY[0x263EFFA08] setWithObject:v8];
  id v12 = v10;
  if (([v11 containsObject:object_getClass(v12)] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x263EFF940];
    uint64_t v14 = *MEMORY[0x263EFF4A0];
    v15 = NSStringFromSelector(v9);
    [v13 raise:v14, @"Unsupported object %@ passed to %@. Allowed classes: %@", v12, v15, v11, 0 format];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v17 = [v12 items];
  unint64_t v18 = [v17 count] + v16;
  unint64_t v19 = *(void *)(a1 + 72);

  if (v18 > v19)
  {
    uint64_t v20 = *(void *)(a1 + 72) - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v20 >= 1)
    {
      v21 = [v12 items];
      v22 = objc_msgSend(v21, "subarrayWithRange:", 0, v20);
      [v12 replaceItems:v22];
    }
  }
  v23 = [v12 items];
  if ([v23 count])
  {
  }
  else
  {
    uint64_t v24 = [v12 sectionHeaderStyle];

    id v7 = v26;
    if (v24 != 2) {
      goto LABEL_13;
    }
  }
  [*(id *)(a1 + 32) addObject:v12];
  v25 = [v12 items];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v25 count];

  [v12 setIndex:a3];
  [*(id *)(a1 + 40) _linkItemsInSection:v12];
  id v7 = v26;
LABEL_13:
}

- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections
{
  id v7 = title;
  uint64_t v8 = sections;
  v15.receiver = self;
  v15.super_class = (Class)CPListTemplate;
  id v9 = [(CPTemplate *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    itemsToReload = v9->_itemsToReload;
    v9->_itemsToReload = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_title, title);
    uint64_t v12 = [(CPListTemplate *)v9 _sectionsByTrimmingAndLinkingSections:v8];
    id v13 = v9->_sections;
    v9->_sections = (NSArray *)v12;
  }
  return v9;
}

- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections assistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration
{
  id v9 = assistantCellConfiguration;
  uint64_t v10 = [(CPListTemplate *)self initWithTitle:title sections:sections];
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v10->_assistantCellConfiguration, assistantCellConfiguration);
    }
    else
    {
      uint64_t v12 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_2181A5000, v12, OS_LOG_TYPE_INFO, "No assistant cell configuration", v14, 2u);
      }
    }
  }

  return v11;
}

- (CPListTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CPListTemplate;
  id v5 = [(CPTemplate *)&v31 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    itemsToReload = v5->_itemsToReload;
    v5->_itemsToReload = (NSMutableSet *)v6;

    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kCPListTemplateSectionsKey"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPListTemplateTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v16;

    unint64_t v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"kCPListTemplateEmptyTitlesKey"];
    emptyViewTitleVariants = v5->_emptyViewTitleVariants;
    v5->_emptyViewTitleVariants = (NSArray *)v21;

    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"kCPListTemplateEmptySubtitlesKey"];
    emptyViewSubtitleVariants = v5->_emptyViewSubtitleVariants;
    v5->_emptyViewSubtitleVariants = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPAssistantCellConfigurationKey"];
    assistantCellConfiguration = v5->_assistantCellConfiguration;
    v5->_assistantCellConfiguration = (CPAssistantCellConfiguration *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPListTemplate;
  id v4 = a3;
  [(CPTemplate *)&v10 encodeWithCoder:v4];
  id v5 = [(CPListTemplate *)self sections];
  [v4 encodeObject:v5 forKey:@"kCPListTemplateSectionsKey"];

  uint64_t v6 = [(CPListTemplate *)self title];
  [v4 encodeObject:v6 forKey:@"kCPListTemplateTitleKey"];

  id v7 = [(CPListTemplate *)self emptyViewTitleVariants];
  [v4 encodeObject:v7 forKey:@"kCPListTemplateEmptyTitlesKey"];

  uint64_t v8 = [(CPListTemplate *)self emptyViewSubtitleVariants];
  [v4 encodeObject:v8 forKey:@"kCPListTemplateEmptySubtitlesKey"];

  uint64_t v9 = [(CPListTemplate *)self assistantCellConfiguration];
  [v4 encodeObject:v9 forKey:@"kCPAssistantCellConfigurationKey"];
}

- (void)updateSections:(NSArray *)sections
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = sections;
  id v5 = [(CPListTemplate *)self _sectionsByTrimmingAndLinkingSections:v4];
  uint64_t v6 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "%@ enqueuing list update with %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_sections, v5);
  objc_initWeak((id *)buf, self);
  id v7 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__CPListTemplate_updateSections___block_invoke;
  v9[3] = &unk_26430A910;
  objc_copyWeak(&v10, (id *)buf);
  id v8 = (id)[v7 addSuccessBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __33__CPListTemplate_updateSections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_loadWeakRetained(v2);
    id v7 = NSNumber;
    id v8 = v6;
    uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "sectionCount"));
    id v10 = NSNumber;
    id v11 = objc_loadWeakRetained(v2);
    uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "itemCount"));

    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    unint64_t v18 = v12;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "%@ sending section update with %@ sections, %@ items", (uint8_t *)&v13, 0x20u);
  }
  [v3 reloadTemplate:WeakRetained];
}

- (NSUInteger)sectionCount
{
  return [(NSArray *)self->_sections count];
}

- (NSUInteger)itemCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_sections;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    NSUInteger v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "items", (void)v10);
        v5 += [v8 count];
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

- (void)updateHeaderImage:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPTemplate *)self templateProviderFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__CPListTemplate_updateHeaderImage_forSectionIdentifier___block_invoke;
  v12[3] = &unk_26430A938;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v12];
}

uint64_t __57__CPListTemplate_updateHeaderImage_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSectionHeaderImage:*(void *)(a1 + 32) forSectionIdentifier:*(void *)(a1 + 40)];
}

- (NSIndexPath)indexPathForItem:(id)item
{
  id v4 = item;
  if ([(CPListTemplate *)self sectionCount])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:v5];
      uint64_t v7 = [v6 indexOfItem:v4];

      if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (++v5 >= [(CPListTemplate *)self sectionCount]) {
        goto LABEL_5;
      }
    }
    id v8 = [MEMORY[0x263F088C8] indexPathForRow:v7 inSection:v5];
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }

  return (NSIndexPath *)v8;
}

- (void)_linkItemsInSection:(id)a3
{
  id v4 = a3;
  [v4 setListTemplate:self];
  uint64_t v5 = [v4 items];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CPListTemplate__linkItemsInSection___block_invoke;
  v6[3] = &unk_26430A960;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __38__CPListTemplate__linkItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C970E68]) {
    [v3 setListTemplate:*(void *)(a1 + 32)];
  }
}

- (void)_setItemNeedsUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPListTemplate *)self itemsToReload];
  [v5 addObject:v4];

  [(CPTemplate *)self setNeedsUpdate];
}

- (void)performUpdate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(CPListTemplate *)self itemsToReload];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(CPListTemplate *)self itemsToReload];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      unint64_t v18 = v6;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Sending List Template update for %@ with %@", buf, 0x16u);
    }
    uint64_t v7 = [(CPListTemplate *)self itemsToReload];
    id v8 = [v7 allObjects];

    id v9 = [(CPTemplate *)self templateProviderFuture];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __31__CPListTemplate_performUpdate__block_invoke;
    v13[3] = &unk_26430A988;
    id v14 = v8;
    id v10 = v8;
    id v11 = (id)[v9 addSuccessBlock:v13];

    long long v12 = [(CPListTemplate *)self itemsToReload];
    [v12 removeAllObjects];
  }
}

uint64_t __31__CPListTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadItems:*(void *)(a1 + 32)];
}

- (id)_itemForHostItemWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__4;
  unint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v5 = [(CPListTemplate *)self sections];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke;
  v11[3] = &unk_26430A9D8;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  [v5 enumerateObjectsUsingBlock:v11];

  uint64_t v7 = (void *)v15[5];
  if (!v7)
  {
    id v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_INFO, "Failed to identify a local item for %@", buf, 0xCu);
    }

    uint64_t v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke_2;
  v9[3] = &unk_26430A9B0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 conformsToProtocol:&unk_26C970E68])
  {
    id v7 = [v9 identifier];
  }
  else
  {
    id v7 = 0;
  }
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    **(unsigned char **)(a1 + 48) = 1;
    *a4 = 1;
  }
}

- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectListItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__CPListTemplate_listTemplateWithIdentifier_didSelectListItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26430AA00;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  return result;
}

void __95__CPListTemplate_listTemplateWithIdentifier_didSelectListItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_INFO, "%@ didSelectListItemWithIdentifier %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) _itemForHostItemWithIdentifier:*(void *)(a1 + 40)];
  if ([v5 conformsToProtocol:&unk_26C971138])
  {
    id v6 = v5;
    id v7 = [v6 handler];

    if (v7)
    {
      id v8 = [v6 handler];
      ((void (**)(void, id, void))v8)[2](v8, v6, *(void *)(a1 + 48));

LABEL_9:
      goto LABEL_10;
    }
  }
  id v9 = [*(id *)(a1 + 32) delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 listTemplate:*(void *)(a1 + 32) didSelectListItem:v5 completionHandler:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
LABEL_10:
}

- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectImageAtIndex:(unint64_t)a4 inImageRowItemWithIdentifier:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CPListTemplate_listTemplateWithIdentifier_didSelectImageAtIndex_inImageRowItemWithIdentifier___block_invoke;
  block[3] = &unk_26430A4F8;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a4;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  return result;
}

uint64_t __96__CPListTemplate_listTemplateWithIdentifier_didSelectImageAtIndex_inImageRowItemWithIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _itemForHostItemWithIdentifier:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v6;
    uint64_t v3 = [v2 listImageRowHandler];

    if (v3)
    {
      uint64_t v4 = [v2 listImageRowHandler];
      ((void (**)(void, id, void, void *))v4)[2](v4, v2, *(void *)(a1 + 48), &__block_literal_global_10);
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)setAssistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration
{
  uint64_t v5 = assistantCellConfiguration;
  id v6 = [(CPListTemplate *)self assistantCellConfiguration];
  char v7 = [v6 isEqual:v5];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assistantCellConfiguration, assistantCellConfiguration);
    if ((CPCurrentProcessHasAudioEntitlement() & 1) != 0 || CPCurrentProcessHasCommunicationEntitlement())
    {
      id v8 = [(CPTemplate *)self templateProviderFuture];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__CPListTemplate_setAssistantCellConfiguration___block_invoke;
      v10[3] = &unk_26430A988;
      id v11 = v5;
      id v9 = (id)[v8 addSuccessBlock:v10];
    }
  }
}

uint64_t __48__CPListTemplate_setAssistantCellConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateAssistantCellConfiguration:*(void *)(a1 + 32) withCompletion:&__block_literal_global_145];
}

void __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_3;
    block[3] = &unk_264309D80;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFF940];
  uint64_t v2 = *MEMORY[0x263EFF488];
  uint64_t v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  [v1 raise:v2, @"Error: %@", v4 format];

  exit(-1);
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CPListTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__CPListTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) sections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [v7 headerButton];

        if (v8)
        {
          id v9 = [v7 headerButton];
          [v2 addObject:v9];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v35 count:16];
    }
    while (v4);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__CPListTemplate_handleActionForControlIdentifier___block_invoke_2;
  v16[3] = &unk_26430AA28;
  id v17 = *(id *)(a1 + 40);
  unint64_t v18 = &v23;
  [v2 enumerateObjectsUsingBlock:v16];
  if (v24[5])
  {
    char v10 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v24[5];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      uint64_t v34 = v13;
      _os_log_impl(&dword_2181A5000, v10, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    [(id)v24[5] handlePrimaryAction];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    v15.receiver = *(id *)(a1 + 32);
    v15.super_class = (Class)CPListTemplate;
    objc_msgSendSuper2(&v15, sel_handleActionForControlIdentifier_, v14);
  }

  _Block_object_dispose(&v23, 8);
}

void __51__CPListTemplate_handleActionForControlIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)emptyViewTitleVariants
{
  return self->_emptyViewTitleVariants;
}

- (void)setEmptyViewTitleVariants:(NSArray *)emptyViewTitleVariants
{
}

- (NSArray)emptyViewSubtitleVariants
{
  return self->_emptyViewSubtitleVariants;
}

- (void)setEmptyViewSubtitleVariants:(NSArray *)emptyViewSubtitleVariants
{
}

- (CPAssistantCellConfiguration)assistantCellConfiguration
{
  return self->_assistantCellConfiguration;
}

- (NSMutableSet)itemsToReload
{
  return self->_itemsToReload;
}

- (void)setItemsToReload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToReload, 0);
  objc_storeStrong((id *)&self->_assistantCellConfiguration, 0);
  objc_storeStrong((id *)&self->_emptyViewSubtitleVariants, 0);
  objc_storeStrong((id *)&self->_emptyViewTitleVariants, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end