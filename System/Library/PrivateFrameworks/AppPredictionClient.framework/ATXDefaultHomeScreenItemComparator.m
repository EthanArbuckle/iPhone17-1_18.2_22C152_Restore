@interface ATXDefaultHomeScreenItemComparator
- (ATXDefaultWidgetStack)defaultStack;
- (BOOL)isStackDefaultStack:(id)a3;
- (NSArray)galleryItems;
- (unint64_t)rankOfWidgetSuggestedInGallery:(id)a3;
- (void)loadDefaultItemsWithCompletionHandler:(id)a3;
- (void)setDefaultStack:(id)a3;
- (void)setGalleryItems:(id)a3;
@end

@implementation ATXDefaultHomeScreenItemComparator

- (void)loadDefaultItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[ATXDefaultHomeScreenItemManager sharedInstance];
  int v6 = [MEMORY[0x1E4F93B08] isiPad];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5D056C8;
  if (v6) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 fetchSuggestedGalleryItemsOfGridSize:v7 widgetFamilyMask:7294 withCompletionHandler:v9];
}

void __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    [*(id *)(a1 + 32) setGalleryItems:a2];
    v5 = +[ATXDefaultHomeScreenItemManager sharedInstance];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5D056C8;
    id v6 = *(id *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v5 fetchSmartStackOfVariant:0 completionHandler:v7];
  }
}

uint64_t __76__ATXDefaultHomeScreenItemComparator_loadDefaultItemsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    id v6 = [a2 firstObject];
    [*(id *)(a1 + 32) setDefaultStack:v6];

    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

- (unint64_t)rankOfWidgetSuggestedInGallery:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(ATXDefaultHomeScreenItemComparator *)self galleryItems];

  if (v5)
  {
    id v6 = [(ATXDefaultHomeScreenItemComparator *)self galleryItems];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__ATXDefaultHomeScreenItemComparator_rankOfWidgetSuggestedInGallery___block_invoke;
    v9[3] = &unk_1E5D05A00;
    id v10 = v4;
    v11 = &v12;
    [v6 enumerateObjectsUsingBlock:v9];

    unint64_t v7 = v13[3];
  }
  else
  {
    unint64_t v7 = v13[3];
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __69__ATXDefaultHomeScreenItemComparator_rankOfWidgetSuggestedInGallery___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v16;
  if (isKindOfClass)
  {
    id v9 = v16;
    id v10 = *(void **)(a1 + 32);
    v11 = [v9 avocadoDescriptor];
    uint64_t v12 = [v11 extensionBundleIdentifier];
    v13 = [v9 avocadoDescriptor];
    uint64_t v14 = [v13 kind];
    LODWORD(v10) = [v10 isSameWidgetAsWidgetBundleId:v12 widgetKind:v14];

    if (v10)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + 1;
      *a4 = 1;
    }

    id v8 = v16;
  }

  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

- (BOOL)isStackDefaultStack:(id)a3
{
  id v4 = a3;
  v5 = [(ATXDefaultHomeScreenItemComparator *)self defaultStack];

  if (v5)
  {
    switch([v4 stackLayoutSize])
    {
      case 0:
        id v6 = [(ATXDefaultHomeScreenItemComparator *)self defaultStack];
        uint64_t v7 = [v6 smallDefaultStack];
        goto LABEL_11;
      case 1:
        id v6 = [(ATXDefaultHomeScreenItemComparator *)self defaultStack];
        uint64_t v7 = [v6 mediumDefaultStack];
        goto LABEL_11;
      case 2:
        id v6 = [(ATXDefaultHomeScreenItemComparator *)self defaultStack];
        uint64_t v7 = [v6 largeDefaultStack];
        goto LABEL_11;
      case 3:
        id v9 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[ATXDefaultHomeScreenItemComparator isStackDefaultStack:](v9);
        }

        id v8 = 0;
        goto LABEL_14;
      case 4:
        id v6 = [(ATXDefaultHomeScreenItemComparator *)self defaultStack];
        uint64_t v7 = [v6 extraLargeDefaultStack];
LABEL_11:
        id v8 = (id)v7;

        break;
      default:
        id v8 = 0;
        break;
    }
    id v10 = [v4 widgets];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [v8 count];

    if (v11 == v12)
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 1;
      v5 = [v4 widgets];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__ATXDefaultHomeScreenItemComparator_isStackDefaultStack___block_invoke;
      v14[3] = &unk_1E5D05A28;
      id v8 = v8;
      id v15 = v8;
      id v16 = &v17;
      [v5 enumerateObjectsUsingBlock:v14];

      LOBYTE(v5) = *((unsigned char *)v18 + 24) != 0;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
LABEL_14:
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

void __58__ATXDefaultHomeScreenItemComparator_isStackDefaultStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectAtIndexedSubscript:a3];
  id v13 = [v9 avocadoDescriptor];

  id v10 = [v13 extensionBundleIdentifier];
  uint64_t v11 = [v13 kind];
  char v12 = [v8 isSameWidgetAsWidgetBundleId:v10 widgetKind:v11];

  if ((v12 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (NSArray)galleryItems
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGalleryItems:(id)a3
{
}

- (ATXDefaultWidgetStack)defaultStack
{
  return (ATXDefaultWidgetStack *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStack, 0);

  objc_storeStrong((id *)&self->_galleryItems, 0);
}

- (void)isStackDefaultStack:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Attempted to run ATXDefaultHomeScreenItemComparator on a 6x4 stack", v1, 2u);
}

@end