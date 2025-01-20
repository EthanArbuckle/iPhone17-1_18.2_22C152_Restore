@interface CNContactActionsController
+ (id)descriptorForRequiredKeys;
+ (id)supportedActionTypes;
- (BOOL)actionsReversed;
- (BOOL)displayDefaultAppsSectionedMenus;
- (BOOL)displayMenuIconAtTopLevel;
- (BOOL)displayNonDefaultAppsMenuTitle;
- (BOOL)generateDefaultAppListItemsOnly;
- (BOOL)generateFaceTimeListItemsOnly;
- (BOOL)generateFavoritesListItemsOnly;
- (BOOL)shouldUseOutlinedActionGlyphStyle;
- (CNContact)contact;
- (CNContactActionsController)initWithContact:(id)a3 actionTypes:(id)a4;
- (CNContactActionsController)initWithContact:(id)a3 dataSource:(id)a4 actionTypes:(id)a5;
- (CNContactActionsControllerDelegate)delegate;
- (CNUINavigationListStyle)navigationListStyle;
- (CNUIUserActionListDataSource)actionsDataSource;
- (NSArray)actionTypes;
- (NSArray)modelCancelables;
- (NSDictionary)modelsByActionTypes;
- (NSString)defaultAppBundleIdentifier;
- (UIViewController)viewController;
- (id)actionForItem:(id)a3 withImage:(id)a4;
- (id)imageForActionType:(id)a3;
- (id)modelForActionType:(id)a3;
- (id)navigationListItemForUserActionType:(id)a3;
- (int64_t)actionsOrder;
- (void)cancelModels;
- (void)dealloc;
- (void)generateMenuForItem:(id)a3 image:(id)a4 withCurrentList:(id)a5;
- (void)navigationListController:(id)a3 didSelectItem:(id)a4;
- (void)prepareNavigationListItems;
- (void)retrieveModels;
- (void)setActionsDataSource:(id)a3;
- (void)setActionsOrder:(int64_t)a3;
- (void)setActionsReversed:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDefaultAppBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayDefaultAppsSectionedMenus:(BOOL)a3;
- (void)setDisplayMenuIconAtTopLevel:(BOOL)a3;
- (void)setDisplayNonDefaultAppsMenuTitle:(BOOL)a3;
- (void)setGenerateDefaultAppListItemsOnly:(BOOL)a3;
- (void)setGenerateFaceTimeListItemsOnly:(BOOL)a3;
- (void)setGenerateFavoritesListItemsOnly:(BOOL)a3;
- (void)setModelCancelables:(id)a3;
- (void)setModelsByActionTypes:(id)a3;
- (void)setNavigationListStyle:(id)a3;
- (void)setShouldUseOutlinedActionGlyphStyle:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)styleUpdated;
@end

@implementation CNContactActionsController

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = [MEMORY[0x1E4F5A720] descriptorForRequiredKeys];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [NSString stringWithUTF8String:"+[CNContactActionsController descriptorForRequiredKeys]"];
  v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionTypes, 0);
  objc_destroyWeak((id *)&self->_navigationListStyle);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_modelCancelables, 0);
  objc_storeStrong((id *)&self->_modelsByActionTypes, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setDefaultAppBundleIdentifier:(id)a3
{
}

- (NSString)defaultAppBundleIdentifier
{
  return self->_defaultAppBundleIdentifier;
}

- (void)setGenerateDefaultAppListItemsOnly:(BOOL)a3
{
  self->_generateDefaultAppListItemsOnly = a3;
}

- (BOOL)generateDefaultAppListItemsOnly
{
  return self->_generateDefaultAppListItemsOnly;
}

- (void)setGenerateFavoritesListItemsOnly:(BOOL)a3
{
  self->_generateFavoritesListItemsOnly = a3;
}

- (BOOL)generateFavoritesListItemsOnly
{
  return self->_generateFavoritesListItemsOnly;
}

- (void)setGenerateFaceTimeListItemsOnly:(BOOL)a3
{
  self->_generateFaceTimeListItemsOnly = a3;
}

- (BOOL)generateFaceTimeListItemsOnly
{
  return self->_generateFaceTimeListItemsOnly;
}

- (void)setDisplayDefaultAppsSectionedMenus:(BOOL)a3
{
  self->_displayDefaultAppsSectionedMenus = a3;
}

- (BOOL)displayDefaultAppsSectionedMenus
{
  return self->_displayDefaultAppsSectionedMenus;
}

- (void)setDisplayNonDefaultAppsMenuTitle:(BOOL)a3
{
  self->_displayNonDefaultAppsMenuTitle = a3;
}

- (BOOL)displayNonDefaultAppsMenuTitle
{
  return self->_displayNonDefaultAppsMenuTitle;
}

- (void)setDisplayMenuIconAtTopLevel:(BOOL)a3
{
  self->_displayMenuIconAtTopLevel = a3;
}

- (BOOL)displayMenuIconAtTopLevel
{
  return self->_displayMenuIconAtTopLevel;
}

- (NSArray)actionTypes
{
  return self->_actionTypes;
}

- (int64_t)actionsOrder
{
  return self->_actionsOrder;
}

- (CNUINavigationListStyle)navigationListStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationListStyle);

  return (CNUINavigationListStyle *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactActionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactActionsControllerDelegate *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void)setModelCancelables:(id)a3
{
}

- (NSArray)modelCancelables
{
  return self->_modelCancelables;
}

- (void)setModelsByActionTypes:(id)a3
{
}

- (NSDictionary)modelsByActionTypes
{
  return self->_modelsByActionTypes;
}

- (void)setActionsDataSource:(id)a3
{
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setShouldUseOutlinedActionGlyphStyle:(BOOL)a3
{
  self->_shouldUseOutlinedActionGlyphStyle = a3;
}

- (BOOL)shouldUseOutlinedActionGlyphStyle
{
  return self->_shouldUseOutlinedActionGlyphStyle;
}

- (id)actionForItem:(id)a3 withImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 title];
  v9 = (void *)MEMORY[0x1E4FB13F0];
  v10 = v7;
  if (!v7)
  {
    v10 = [v6 image];
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __54__CNContactActionsController_actionForItem_withImage___block_invoke;
  v18 = &unk_1E549BFC8;
  id v19 = v6;
  v20 = self;
  id v11 = v6;
  v12 = [v9 actionWithTitle:v8 image:v10 identifier:0 handler:&v15];
  if (!v7) {

  }
  v13 = objc_msgSend(v11, "subtitle", v15, v16, v17, v18);
  [v12 setDiscoverabilityTitle:v13];

  return v12;
}

void __54__CNContactActionsController_actionForItem_withImage___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v8 = [*(id *)(a1 + 32) content];
  if (objc_opt_isKindOfClass()) {
    v2 = v8;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  if (!v3)
  {
    objc_opt_class();
    v4 = [*(id *)(a1 + 32) defaultItem];
    v5 = [v4 content];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v8 = v6;
  }
  id v7 = [*(id *)(a1 + 40) delegate];
  [v7 contactActionsController:*(void *)(a1 + 40) didSelectAction:v8];
}

- (void)generateMenuForItem:(id)a3 image:(id)a4 withCurrentList:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 items];

  if (v11)
  {
    id v31 = v10;
    id v32 = v9;
    v12 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v13 = [v8 items];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ([(CNContactActionsController *)self displayMenuIconAtTopLevel])
          {
            id v19 = 0;
          }
          else
          {
            uint64_t v20 = [v8 image];
            id v21 = v8;
            v22 = (void *)v20;
            v23 = v32;
            if (v20) {
              v23 = (void *)v20;
            }
            id v19 = v23;

            id v8 = v21;
          }
          [(CNContactActionsController *)self generateMenuForItem:v18 image:v19 withCurrentList:v12];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v15);
    }

    if ([(CNContactActionsController *)self displayMenuIconAtTopLevel])
    {
      v24 = [v8 image];
    }
    else
    {
      v24 = 0;
    }
    id v10 = v31;
    id v9 = v32;
    uint64_t v27 = objc_msgSend(v8, "shouldDisplayInline", v31);
    v28 = (void *)MEMORY[0x1E4FB1970];
    v29 = [v8 title];
    v30 = [v28 menuWithTitle:v29 image:v24 identifier:0 options:v27 children:v12];

    [v10 addObject:v30];
  }
  else
  {
    uint64_t v25 = [v8 image];
    v12 = (void *)v25;
    if (v25) {
      id v26 = (id)v25;
    }
    else {
      id v26 = v9;
    }
    v24 = [(CNContactActionsController *)self actionForItem:v8 withImage:v26];
    [v10 addObject:v24];
  }
}

- (void)prepareNavigationListItems
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CNContactActionsController *)self actionTypes];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __56__CNContactActionsController_prepareNavigationListItems__block_invoke;
  v46[3] = &unk_1E549A598;
  v46[4] = self;
  v5 = objc_msgSend(v4, "_cn_filter:", v46);

  id v6 = v5;
  id v7 = v6;
  if ([(CNContactActionsController *)self actionsOrder] == 1)
  {
    id v8 = [v6 reverseObjectEnumerator];
    id v7 = [v8 allObjects];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(CNContactActionsController *)self navigationListItemForUserActionType:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        [v3 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v11);
  }

  uint64_t v15 = (void *)[v3 copy];
  uint64_t v16 = [(CNContactActionsController *)self displayedController];
  [v16 setItems:v15];

  uint64_t v17 = [v3 count];
  if (v17 == 1)
  {
    uint64_t v18 = [v3 firstObject];
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = [(CNContactActionsController *)self displayedController];
  [v19 setExpandedItem:v18];

  if (v17 == 1) {
  uint64_t v20 = [(CNContactActionsController *)self delegate];
  }
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v37 = v6;
    v22 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v3;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          v29 = [v28 image];
          [(CNContactActionsController *)self generateMenuForItem:v28 image:v29 withCurrentList:v22];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v25);
    }

    if ([v22 count] == 1)
    {
      v30 = [v22 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v6 = v37;
      if (isKindOfClass)
      {
        id v32 = [v22 firstObject];
        long long v33 = [v32 children];
        uint64_t v34 = [v33 mutableCopy];

        v22 = (void *)v34;
      }
    }
    else
    {
      id v6 = v37;
    }
    long long v35 = [(CNContactActionsController *)self delegate];
    long long v36 = (void *)[v22 copy];
    [v35 contactActionsController:self didUpdateWithMenu:v36];
  }
}

uint64_t __56__CNContactActionsController_prepareNavigationListItems__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) modelForActionType:a2];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 isEmpty] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)navigationListItemForUserActionType:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNContactActionsController *)self imageForActionType:v4];
  id v6 = [(CNContactActionsController *)self actionsDataSource];
  id v7 = [v6 consumer:self localizedDisplayNameForActionType:v4];

  id v8 = [[CNUINavigationListItem alloc] initWithTitle:v7 image:v5];
  [(CNUINavigationListItem *)v8 setIdentifier:v4];
  id v9 = [(CNContactActionsController *)self modelForActionType:v4];
  if ([(CNContactActionsController *)self generateFaceTimeListItemsOnly])
  {
    uint64_t v10 = +[CNUINavigationListItem faceTimeNavigationListItemsForUserActionListModel:v9];
    [(CNUINavigationListItem *)v8 setItems:v10];
LABEL_6:

    goto LABEL_27;
  }
  if ([(CNContactActionsController *)self generateDefaultAppListItemsOnly])
  {
    uint64_t v11 = [(CNContactActionsController *)self defaultAppBundleIdentifier];

    if (!v11)
    {
      id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘self.defaultAppBundleIdentifier’ must be nonnull" userInfo:0];
      objc_exception_throw(v36);
    }
    uint64_t v10 = [(CNContactActionsController *)self defaultAppBundleIdentifier];
    uint64_t v12 = +[CNUINavigationListItem defaultAppNavigationListItemsForUserActionListModel:v9 defaultAppBundleIdentifier:v10];
    [(CNUINavigationListItem *)v8 setItems:v12];

    goto LABEL_6;
  }
  id v39 = v4;
  v13 = v9;
  if ([(CNContactActionsController *)self generateFavoritesListItemsOnly])
  {
    uint64_t v14 = [v9 actions];
    uint64_t v15 = objc_msgSend(v14, "_cn_filter:", &__block_literal_global_10089);

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F5A728]) initWithModel:v13 actions:v15];
    [(CNContactActionsController *)self setDisplayNonDefaultAppsMenuTitle:0];

    v13 = (void *)v16;
  }
  uint64_t v17 = +[CNUINavigationListItem navigationListItemsForUserActionListModel:v13 displayDefaultAppsSectionedMenus:[(CNContactActionsController *)self displayDefaultAppsSectionedMenus] displayNonDefaultAppsMenuTitle:[(CNContactActionsController *)self displayNonDefaultAppsMenuTitle]];
  [(CNUINavigationListItem *)v8 setItems:v17];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v18 = [(CNUINavigationListItem *)v8 items];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v19)
  {
    char v21 = 0;
    goto LABEL_26;
  }
  uint64_t v20 = v19;
  char v21 = 0;
  uint64_t v22 = *(void *)v43;
  do
  {
    uint64_t v23 = 0;
    uint64_t v41 = v20;
    do
    {
      if (*(void *)v43 != v22) {
        objc_enumerationMutation(v18);
      }
      uint64_t v24 = *(void **)(*((void *)&v42 + 1) + 8 * v23);
      [v24 setParent:v8];
      uint64_t v25 = [v24 defaultItem];

      if (v25)
      {
        id v26 = [v24 defaultItem];
LABEL_16:

        char v21 = v26;
        goto LABEL_17;
      }
      uint64_t v27 = [v13 defaultAction];
      if (v27)
      {
        v28 = (void *)v27;
        v29 = v18;
        v30 = v8;
        id v31 = v13;
        id v32 = [v13 defaultAction];
        long long v33 = [v24 content];

        if (v32 == v33)
        {
          id v26 = v24;
          v13 = v31;
          id v8 = v30;
          uint64_t v18 = v29;
          uint64_t v20 = v41;
          goto LABEL_16;
        }
        v13 = v31;
        id v8 = v30;
        uint64_t v18 = v29;
        uint64_t v20 = v41;
      }
LABEL_17:
      ++v23;
    }
    while (v20 != v23);
    uint64_t v34 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v20 = v34;
  }
  while (v34);
LABEL_26:

  [(CNUINavigationListItem *)v8 setDefaultItem:v21];
  id v9 = v13;
  v5 = v38;
  id v4 = v40;
  id v7 = v37;
LABEL_27:

  return v8;
}

uint64_t __66__CNContactActionsController_navigationListItemForUserActionType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested] ^ 1;
}

- (void)navigationListController:(id)a3 didSelectItem:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [v6 content];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    goto LABEL_9;
  }
  objc_opt_class();
  uint64_t v10 = [v6 defaultItem];
  id v7 = [v10 content];
  uint64_t v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  id v12 = v11;

  if (v12)
  {
LABEL_9:
    v13 = [(CNContactActionsController *)self delegate];
    [v13 contactActionsController:self didSelectAction:v7];
  }
  else
  {
    uint64_t v14 = [v6 items];
    uint64_t v15 = [v14 count];

    if (v15) {
      [v16 toggleItem:v6];
    }
  }
}

- (id)imageForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactActionsController *)self viewController];
  id v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 3)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_carPlayUserActionSymbolImageForActionType:", v4);
  }
  else
  {
    if ([(CNContactActionsController *)self shouldUseOutlinedActionGlyphStyle]) {
      objc_msgSend(MEMORY[0x1E4FB1818], "cnui_userActionOutlinedSymbolImageForActionType:scale:withColor:", v4, 3, 0);
    }
    else {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_userActionSymbolImageForActionType:scale:withColor:", v4, 3, 0);
    }
  }
  id v9 = (void *)v8;

  return v9;
}

- (void)setActionsOrder:(int64_t)a3
{
  if (self->_actionsOrder != a3)
  {
    self->_actionsOrder = a3;
    [(CNContactActionsController *)self prepareNavigationListItems];
    id v4 = [(CNContactActionsController *)self displayedController];
    [v4 reloadNavigationListView];
  }
}

- (id)modelForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactActionsController *)self modelsByActionTypes];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)cancelModels
{
  id v2 = [(CNContactActionsController *)self modelCancelables];
  objc_msgSend(v2, "_cn_each:", *MEMORY[0x1E4F5A1A8]);
}

- (void)retrieveModels
{
  [(CNContactActionsController *)self cancelModels];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  id v4 = [(CNContactActionsController *)self actionTypes];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __44__CNContactActionsController_retrieveModels__block_invoke;
  id v9 = &unk_1E5497370;
  uint64_t v10 = self;
  objc_copyWeak(&v12, &location);
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateObjectsUsingBlock:&v6];

  -[CNContactActionsController setModelCancelables:](self, "setModelCancelables:", v5, v6, v7, v8, v9, v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __44__CNContactActionsController_retrieveModels__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] actionsDataSource];
  id v5 = a1[4];
  uint64_t v6 = [v5 contact];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __44__CNContactActionsController_retrieveModels__block_invoke_2;
  id v12 = &unk_1E549B8F0;
  objc_copyWeak(&v14, a1 + 6);
  id v7 = v3;
  id v13 = v7;
  uint64_t v8 = [v4 consumer:v5 actionModelsForContact:v6 actionType:v7 handler:&v9];

  objc_msgSend(a1[5], "addObject:", v8, v9, v10, v11, v12);
  objc_destroyWeak(&v14);
}

void __44__CNContactActionsController_retrieveModels__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNContactActionsController_retrieveModels__block_invoke_3;
  aBlock[3] = &unk_1E549BBD0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  id v8 = v4;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v5[2](v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v9);
}

void __44__CNContactActionsController_retrieveModels__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained modelsByActionTypes];
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  [WeakRetained setModelsByActionTypes:v3];
  [WeakRetained prepareNavigationListItems];
  id v4 = [WeakRetained displayedController];
  [v4 reloadNavigationListView];
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    id v4 = objc_alloc_init(CNUINavigationListViewController);
    [(CNUINavigationListViewController *)v4 setDelegate:self];
    id v5 = self->_viewController;
    self->_viewController = &v4->super;

    [(CNContactActionsController *)self retrieveModels];
    viewController = self->_viewController;
  }

  return viewController;
}

- (void)styleUpdated
{
  objc_opt_class();
  id v3 = [(CNContactActionsController *)self viewController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = [(CNContactActionsController *)self navigationListStyle];
  [v5 setNavigationListStyle:v6];

  [(CNContactActionsController *)self retrieveModels];
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeWeak((id *)&self->_navigationListStyle, a3);

  [(CNContactActionsController *)self styleUpdated];
}

- (void)dealloc
{
  [(CNContactActionsController *)self cancelModels];
  v3.receiver = self;
  v3.super_class = (Class)CNContactActionsController;
  [(CNContactActionsController *)&v3 dealloc];
}

- (CNContactActionsController)initWithContact:(id)a3 dataSource:(id)a4 actionTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactActionsController;
  id v12 = [(CNContactActionsController *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_actionTypes, a5);
    objc_storeStrong((id *)&v13->_actionsDataSource, a4);
    modelsByActionTypes = v13->_modelsByActionTypes;
    v13->_modelsByActionTypes = (NSDictionary *)MEMORY[0x1E4F1CC08];

    uint64_t v15 = +[CNUINavigationListStyleProvider defaultStyle];
    objc_storeWeak((id *)&v13->_navigationListStyle, v15);

    v13->_displayDefaultAppsSectionedMenus = 1;
    id v16 = v13;
  }

  return v13;
}

- (CNContactActionsController)initWithContact:(id)a3 actionTypes:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F5A720];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = +[CNUIContactsEnvironment currentEnvironment];
  id v11 = [v10 actionDiscoveringEnvironment];
  id v12 = (void *)[v9 initWithDiscoveringEnvironment:v11];

  id v13 = [(CNContactActionsController *)self initWithContact:v8 dataSource:v12 actionTypes:v7];
  return v13;
}

+ (id)supportedActionTypes
{
  return (id)[MEMORY[0x1E4F5A720] allSupportedActionTypes];
}

- (void)setActionsReversed:(BOOL)a3
{
}

- (BOOL)actionsReversed
{
  return [(CNContactActionsController *)self actionsOrder] == 1;
}

@end