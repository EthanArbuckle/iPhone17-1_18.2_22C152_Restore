@interface CNContactQuickActionsController
+ (CNKeyDescriptor)descriptorForRequiredKeys;
+ (OS_os_log)log;
+ (id)sharedDataSource;
- (BOOL)hasDefaultActionForActionType:(id)a3;
- (BOOL)isCarPlay;
- (CNCancelable)actionDiscoveryToken;
- (CNContact)contact;
- (CNContactActionsController)disambiguationMenuController;
- (CNContactQuickActionViewContainer)contactQuickActionViewContainer;
- (CNContactQuickActionsController)init;
- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4;
- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5;
- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5 userActionListDataSource:(id)a6 schedulerProvider:(id)a7 userActionContext:(id)a8;
- (CNContactQuickActionsControllerDelegate)delegate;
- (CNContactQuickActionsDisambiguationMenuPresentation)disambiguationMenuPresentation;
- (CNContactQuickActionsModelTrackingDelegate)modelTrackingDelegate;
- (CNSchedulerProvider)schedulerProvider;
- (CNUINavigationListStyle)navigationListStyle;
- (CNUIUserActionContext)userActionContext;
- (CNUIUserActionListDataSource)userActionListDataSource;
- (NSArray)actionTypes;
- (NSArray)currentMenuElements;
- (NSDictionary)actionListModelsByActionType;
- (UIViewController)disambiguationMenuViewController;
- (id)allModelsObservable;
- (id)defaultTitleForActionType:(id)a3;
- (id)disambiguationMenuForActionType:(id)a3;
- (void)cleanUpAfterLatestActionDiscovery;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)dealloc;
- (void)disambiguationViewControllerDismissedExternally:(id)a3;
- (void)discoverActions;
- (void)executeLongPressBehaviorForActionType:(id)a3;
- (void)executeTapBehaviorForActionType:(id)a3;
- (void)executeTapBehaviorForActionType:(id)a3 shouldFallbackToDisambiguationMenu:(BOOL)a4;
- (void)executeTapBehaviorWithoutDisambiguationForActionType:(id)a3;
- (void)performAction:(id)a3;
- (void)processDiscoveredModels:(id)a3;
- (void)reportStoredModel:(id)a3 forActionType:(id)a4 toQuickActionContainer:(id)a5;
- (void)reportStoredModelsToQuickActionContainer;
- (void)setActionDiscoveryToken:(id)a3;
- (void)setActionListModelsByActionType:(id)a3;
- (void)setContact:(id)a3;
- (void)setCurrentMenuElements:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisambiguationMenuController:(id)a3;
- (void)setDisambiguationMenuViewController:(id)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setModelTrackingDelegate:(id)a3;
- (void)setNavigationListStyle:(id)a3;
- (void)setupDisambiguationMenuForActionType:(id)a3;
- (void)showDisambiguationMenuForActionType:(id)a3;
- (void)storeDiscoveredModels:(id)a3;
- (void)tearDownDisambiguationMenu;
- (void)userActionListDataSource:(id)a3 didResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5;
- (void)userActionListDataSource:(id)a3 willResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5;
@end

@implementation CNContactQuickActionsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_modelTrackingDelegate);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_storeStrong((id *)&self->_currentMenuElements, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuPresentation, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuViewController, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuController, 0);
  objc_storeStrong((id *)&self->_userActionContext, 0);
  objc_storeStrong((id *)&self->_actionListModelsByActionType, 0);
  objc_storeStrong((id *)&self->_actionDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_userActionListDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_contactQuickActionViewContainer);
}

- (void)setModelTrackingDelegate:(id)a3
{
}

- (CNContactQuickActionsModelTrackingDelegate)modelTrackingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelTrackingDelegate);

  return (CNContactQuickActionsModelTrackingDelegate *)WeakRetained;
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (void)setCurrentMenuElements:(id)a3
{
}

- (NSArray)currentMenuElements
{
  return self->_currentMenuElements;
}

- (CNContactQuickActionsDisambiguationMenuPresentation)disambiguationMenuPresentation
{
  return self->_disambiguationMenuPresentation;
}

- (void)setDisambiguationMenuViewController:(id)a3
{
}

- (UIViewController)disambiguationMenuViewController
{
  return self->_disambiguationMenuViewController;
}

- (void)setDisambiguationMenuController:(id)a3
{
}

- (CNContactActionsController)disambiguationMenuController
{
  return self->_disambiguationMenuController;
}

- (CNUIUserActionContext)userActionContext
{
  return self->_userActionContext;
}

- (void)setActionListModelsByActionType:(id)a3
{
}

- (NSDictionary)actionListModelsByActionType
{
  return self->_actionListModelsByActionType;
}

- (void)setActionDiscoveryToken:(id)a3
{
}

- (CNCancelable)actionDiscoveryToken
{
  return self->_actionDiscoveryToken;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUIUserActionListDataSource)userActionListDataSource
{
  return self->_userActionListDataSource;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (NSArray)actionTypes
{
  return self->_actionTypes;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactQuickActionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactQuickActionsControllerDelegate *)WeakRetained;
}

- (CNContactQuickActionViewContainer)contactQuickActionViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactQuickActionViewContainer);

  return (CNContactQuickActionViewContainer *)WeakRetained;
}

- (void)userActionListDataSource:(id)a3 didResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [(CNContactQuickActionsController *)self contact];
  v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
    v11 = [(CNContactQuickActionsController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CNContactQuickActionsController *)self delegate];
      [v13 quickActionsController:self didResolveInitialActionsForActionType:v14];
    }
  }
}

- (void)userActionListDataSource:(id)a3 willResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [(CNContactQuickActionsController *)self contact];
  v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
    v11 = [(CNContactQuickActionsController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CNContactQuickActionsController *)self delegate];
      [v13 quickActionsController:self willResolveInitialActionsForActionType:v14];
    }
  }
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_INFO, "disambiguation menu selected action %@", (uint8_t *)&v16, 0xCu);
  }

  [(CNContactQuickActionsController *)self performAction:v6];
  v9 = [v7 actionTypes];

  int v10 = [v9 firstObject];

  v11 = [(CNContactQuickActionsController *)self userActionListDataSource];
  char v12 = [(CNContactQuickActionsController *)self contact];
  [v11 consumer:self didSelectItem:v6 forContact:v12 actionType:v10];

  v13 = [(CNContactQuickActionsController *)self delegate];
  id v14 = [(CNContactQuickActionsController *)self disambiguationMenuViewController];
  v15 = [v6 type];
  [v13 contactQuickActionsController:self dismissDisambiguationViewController:v14 forActionType:v15];

  [(CNContactQuickActionsController *)self tearDownDisambiguationMenu];
}

- (id)disambiguationMenuForActionType:(id)a3
{
  [(CNContactQuickActionsController *)self setupDisambiguationMenuForActionType:a3];
  v4 = [(CNContactQuickActionsController *)self currentMenuElements];
  v5 = (void *)[v4 copy];

  [(CNContactQuickActionsController *)self tearDownDisambiguationMenu];

  return v5;
}

- (void)disambiguationViewControllerDismissedExternally:(id)a3
{
  id v5 = a3;
  id v6 = [(CNContactQuickActionsController *)self disambiguationMenuViewController];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionsController.m" lineNumber:350 description:@"disambiguationViewController must be presented first in order to be dismissed"];
  }

  [(CNContactQuickActionsController *)self tearDownDisambiguationMenu];
}

- (void)tearDownDisambiguationMenu
{
  [(CNContactQuickActionsController *)self setDisambiguationMenuController:0];

  [(CNContactQuickActionsController *)self setDisambiguationMenuViewController:0];
}

- (void)setupDisambiguationMenuForActionType:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [CNContactActionsController alloc];
  id v6 = [(CNContactQuickActionsController *)self contact];
  id v7 = [(CNContactQuickActionsController *)self userActionListDataSource];
  v24[0] = v4;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v9 = [(CNContactActionsController *)v5 initWithContact:v6 dataSource:v7 actionTypes:v8];
  [(CNContactQuickActionsController *)self setDisambiguationMenuController:v9];

  int v10 = [(CNContactQuickActionsController *)self disambiguationMenuController];
  [v10 setDelegate:self];

  LODWORD(v6) = [(CNContactQuickActionsController *)self isCarPlay];
  v11 = [(CNContactQuickActionsController *)self disambiguationMenuController];
  char v12 = v11;
  if (v6)
  {
    [v11 setDisplayDefaultAppsSectionedMenus:0];

    if (![v4 isEqualToString:*MEMORY[0x1E4F1AD48]]) {
      goto LABEL_6;
    }
    v13 = [(CNContactQuickActionsController *)self disambiguationMenuController];
    [v13 setGenerateDefaultAppListItemsOnly:1];

    uint64_t v14 = *MEMORY[0x1E4F1AD08];
    char v12 = [(CNContactQuickActionsController *)self disambiguationMenuController];
    [v12 setDefaultAppBundleIdentifier:v14];
  }
  else
  {
    [v11 setDisplayNonDefaultAppsMenuTitle:1];
  }

LABEL_6:
  v15 = [(CNContactQuickActionsController *)self navigationListStyle];

  if (v15)
  {
    int v16 = [(CNContactQuickActionsController *)self navigationListStyle];
    id v17 = [(CNContactQuickActionsController *)self disambiguationMenuController];
    [v17 setNavigationListStyle:v16];
  }
  uint64_t v18 = [(CNContactQuickActionsController *)self contactQuickActionViewContainer];
  v19 = [v18 viewForActionType:v4];

  v20 = [(CNContactQuickActionsController *)self disambiguationMenuPresentation];
  v21 = [(CNContactQuickActionsController *)self disambiguationMenuController];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__CNContactQuickActionsController_setupDisambiguationMenuForActionType___block_invoke;
  v23[3] = &unk_1E549B488;
  v23[4] = self;
  v22 = [v20 viewControllerForPresentingActionsController:v21 fromView:v19 dismissDisambiguationMenuHandler:v23];
  [(CNContactQuickActionsController *)self setDisambiguationMenuViewController:v22];
}

uint64_t __72__CNContactQuickActionsController_setupDisambiguationMenuForActionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tearDownDisambiguationMenu];
}

- (void)showDisambiguationMenuForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "showing disambiguation menu", v11, 2u);
  }

  id v7 = [(CNContactQuickActionsController *)self disambiguationMenuController];

  if (v7)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionsController.m" lineNumber:311 description:@"disambiguation menu is already being presented"];
  }
  [(CNContactQuickActionsController *)self setupDisambiguationMenuForActionType:v5];
  v8 = [(CNContactQuickActionsController *)self delegate];
  v9 = [(CNContactQuickActionsController *)self disambiguationMenuViewController];
  [v8 contactQuickActionsController:self presentDisambiguationViewController:v9 forActionType:v5];
}

- (void)executeLongPressBehaviorForActionType:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘actionType’ must be nonnull" userInfo:0];
    objc_exception_throw(v8);
  }
  id v5 = [(CNContactQuickActionsController *)self actionTypes];
  char v6 = [v5 containsObject:v9];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionsController.m" lineNumber:303 description:@"actionType must be a member of actionTypes provided to the initializer"];
  }
  [(CNContactQuickActionsController *)self showDisambiguationMenuForActionType:v9];
}

- (void)performAction:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "executing action %@", (uint8_t *)&v13, 0xCu);
  }

  char v6 = [(CNContactQuickActionsController *)self contactQuickActionViewContainer];
  id v7 = [v6 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    id v9 = [(Class)getFBSOpenApplicationServiceClass[0]() dashboardEndpoint];
    int v10 = [(CNContactQuickActionsController *)self userActionContext];
    [v10 setConnectionEndpoint:v9];
  }
  v11 = [(CNContactQuickActionsController *)self userActionContext];
  id v12 = (id)[v4 performActionWithContext:v11];
}

- (BOOL)hasDefaultActionForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactQuickActionsController *)self actionListModelsByActionType];
  char v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 defaultAction];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)executeTapBehaviorForActionType:(id)a3 shouldFallbackToDisambiguationMenu:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if (!v14)
  {
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘actionType’ must be nonnull" userInfo:0];
    objc_exception_throw(v13);
  }
  id v7 = [(CNContactQuickActionsController *)self actionTypes];
  char v8 = [v7 containsObject:v14];

  if ((v8 & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionsController.m" lineNumber:273 description:@"actionType must be a member of actionTypes provided to the initializer"];
  }
  if ([(CNContactQuickActionsController *)self hasDefaultActionForActionType:v14])
  {
    id v9 = [(CNContactQuickActionsController *)self actionListModelsByActionType];
    int v10 = [v9 objectForKeyedSubscript:v14];
    v11 = [v10 defaultAction];
    [(CNContactQuickActionsController *)self performAction:v11];
  }
  else if (v4)
  {
    [(CNContactQuickActionsController *)self showDisambiguationMenuForActionType:v14];
  }
}

- (void)executeTapBehaviorForActionType:(id)a3
{
}

- (void)executeTapBehaviorWithoutDisambiguationForActionType:(id)a3
{
}

- (id)defaultTitleForActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactQuickActionsController *)self userActionListDataSource];
  char v6 = [v5 consumer:self localizedButtonDisplayNameForActionType:v4];

  return v6;
}

- (void)reportStoredModel:(id)a3 forActionType:(id)a4 toQuickActionContainer:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = [a5 viewForActionType:v8];
  LODWORD(a5) = [v9 isEmpty];

  [v12 setEnabled:a5 ^ 1];
  int v10 = [(CNContactQuickActionsController *)self userActionListDataSource];
  v11 = [v10 consumer:self localizedButtonDisplayNameForActionType:v8];

  [v12 setTitle:v11];
}

- (void)reportStoredModelsToQuickActionContainer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(CNContactQuickActionsController *)self actionListModelsByActionType];
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        int v10 = [(CNContactQuickActionsController *)self actionListModelsByActionType];
        v11 = [v10 objectForKeyedSubscript:v9];
        id v12 = [(CNContactQuickActionsController *)self contactQuickActionViewContainer];
        [(CNContactQuickActionsController *)self reportStoredModel:v11 forActionType:v9 toQuickActionContainer:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)storeDiscoveredModels:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactQuickActionsController *)self actionListModelsByActionType];
  id v6 = (id)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  [(CNContactQuickActionsController *)self setActionListModelsByActionType:v6];
}

- (void)processDiscoveredModels:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(CNContactQuickActionsController *)self contact];
    int v10 = [v9 shortDebugDescription];
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "for contact: %@, discovered actions %@", (uint8_t *)&v11, 0x16u);
  }
  [(CNContactQuickActionsController *)self storeDiscoveredModels:v4];
  [(CNContactQuickActionsController *)self reportStoredModelsToQuickActionContainer];
  id v6 = [(CNContactQuickActionsController *)self modelTrackingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(CNContactQuickActionsController *)self modelTrackingDelegate];
    [v8 quickActionsControllerDidUpdateActionModels];
  }
}

- (id)allModelsObservable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = [(CNContactQuickActionsController *)self actionTypes];
    *(_DWORD *)buf = 138412290;
    long long v16 = v13;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "Action types: %@", buf, 0xCu);
  }
  id v4 = [(CNContactQuickActionsController *)self actionTypes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CNContactQuickActionsController_allModelsObservable__block_invoke;
  v14[3] = &unk_1E549B328;
  v14[4] = self;
  uint64_t v5 = objc_msgSend(v4, "_cn_map:", v14);

  id v6 = (void *)MEMORY[0x1E4F5A480];
  char v7 = [(CNContactQuickActionsController *)self schedulerProvider];
  uint64_t v8 = [v6 merge:v5 schedulerProvider:v7];

  uint64_t v9 = [v8 scan:&__block_literal_global_45 seed:MEMORY[0x1E4F1CC08]];
  int v10 = [(CNContactQuickActionsController *)self schedulerProvider];
  int v11 = [v9 throttle:v10 schedulerProvider:0.0];

  return v11;
}

id __54__CNContactQuickActionsController_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userActionListDataSource];
  uint64_t v5 = [*(id *)(a1 + 32) contact];
  id v6 = [v4 consumer:0 actionModelsForContact:v5 actionType:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CNContactQuickActionsController_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E54991D8;
  id v11 = v3;
  id v7 = v3;
  uint64_t v8 = [v6 map:v10];

  return v8;
}

id __54__CNContactQuickActionsController_allModelsObservable__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionaryWithDictionary:a2];
  id v7 = [v5 second];
  uint64_t v8 = [v5 first];

  [v6 setObject:v7 forKeyedSubscript:v8];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v6];

  return v9;
}

uint64_t __54__CNContactQuickActionsController_allModelsObservable__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5A490] pairWithFirst:*(void *)(a1 + 32) second:a2];
}

- (void)discoverActions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactQuickActionsController *)self contact];

  if (v3)
  {
    id v4 = [(CNContactQuickActionsController *)self userActionListDataSource];
    id v5 = [(CNContactQuickActionsController *)self contact];
    id v6 = [v5 identifier];
    [v4 registerDelegate:self withContactIdentifier:v6];

    objc_initWeak(&location, self);
    uint64_t v31 = 0;
    v32 = (id *)&v31;
    uint64_t v33 = 0x3042000000;
    v34 = __Block_byref_object_copy__32752;
    v35 = __Block_byref_object_dispose__32753;
    id v36 = 0;
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(CNContactQuickActionsController *)self contact];
      v23 = [v22 shortDebugDescription];
      *(_DWORD *)buf = 138412546;
      v39 = self;
      __int16 v40 = 2112;
      v41 = v23;
      _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "%@ subscribing action discovering requests for contact %@.", buf, 0x16u);
    }
    uint64_t v8 = [(CNContactQuickActionsController *)self schedulerProvider];
    uint64_t v9 = [v8 mainThreadScheduler];

    int v10 = [(CNContactQuickActionsController *)self allModelsObservable];
    id v11 = [(CNContactQuickActionsController *)self schedulerProvider];
    id v12 = [v11 backgroundScheduler];
    __int16 v13 = [v10 subscribeOn:v12];
    id v14 = (void *)MEMORY[0x1E4F5A488];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __50__CNContactQuickActionsController_discoverActions__block_invoke;
    v27 = &unk_1E54991B0;
    id v15 = v9;
    id v28 = v15;
    objc_copyWeak(&v30, &location);
    v29 = &v31;
    long long v16 = [v14 observerWithResultBlock:&v24];
    uint64_t v17 = objc_msgSend(v13, "subscribe:", v16, v24, v25, v26, v27);
    [(CNContactQuickActionsController *)self setActionDiscoveryToken:v17];

    uint64_t v18 = [(CNContactQuickActionsController *)self actionDiscoveryToken];
    objc_storeWeak(v32 + 5, v18);

    objc_destroyWeak(&v30);
    _Block_object_dispose(&v31, 8);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = [(CNContactQuickActionsController *)self actionTypes];
    v20 = objc_msgSend(v19, "_cn_indexBy:", *MEMORY[0x1E4F5A248]);
    v21 = objc_msgSend(v20, "_cn_map:", &__block_literal_global_64);
    [(CNContactQuickActionsController *)self setActionListModelsByActionType:v21];

    [(CNContactQuickActionsController *)self reportStoredModelsToQuickActionContainer];
  }
}

void __50__CNContactQuickActionsController_discoverActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CNContactQuickActionsController_discoverActions__block_invoke_2;
  v6[3] = &unk_1E549B3C0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  uint64_t v8 = *(void *)(a1 + 40);
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];

  objc_destroyWeak(&v9);
}

void __50__CNContactQuickActionsController_discoverActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    id v3 = [WeakRetained actionDiscoveryToken];

    if (v3 == v2) {
      [WeakRetained processDiscoveredModels:*(void *)(a1 + 32)];
    }
  }
}

- (void)cleanUpAfterLatestActionDiscovery
{
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "cleaning up after latest action discovery", v7, 2u);
  }

  id v4 = [(CNContactQuickActionsController *)self userActionListDataSource];
  [v4 unregisterDelegate:self];

  id v5 = [(CNContactQuickActionsController *)self actionDiscoveryToken];
  [v5 cancel];

  [(CNContactQuickActionsController *)self setActionDiscoveryToken:0];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionary];
  [(CNContactQuickActionsController *)self setActionListModelsByActionType:v6];
}

- (void)setContact:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  id v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 identifier];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "kicking off action discovery by setting contact with identifier %@", (uint8_t *)&v8, 0xCu);
  }
  [(CNContactQuickActionsController *)self cleanUpAfterLatestActionDiscovery];
  [(CNContactQuickActionsController *)self discoverActions];
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);
  id v5 = a3;
  id v6 = [(CNContactQuickActionsController *)self disambiguationMenuController];
  [v6 setNavigationListStyle:v5];
}

- (void)dealloc
{
  id v3 = [(CNContactQuickActionsController *)self userActionListDataSource];
  [v3 unregisterDelegate:self];

  id v4 = [(CNContactQuickActionsController *)self actionDiscoveryToken];
  [v4 cancel];

  [(CNContactQuickActionsController *)self setActionDiscoveryToken:0];
  v5.receiver = self;
  v5.super_class = (Class)CNContactQuickActionsController;
  [(CNContactQuickActionsController *)&v5 dealloc];
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5 userActionListDataSource:(id)a6 schedulerProvider:(id)a7 userActionContext:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v19 = a7;
  id v35 = a8;
  id v20 = a8;
  if (!v15)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    id v30 = @"parameter ‘actionTypes’ must be nonnull";
    goto LABEL_16;
  }
  if (!v16)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    id v30 = @"parameter ‘contactQuickActionViewContainer’ must be nonnull";
    goto LABEL_16;
  }
  if (!v17)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    id v30 = @"parameter ‘disambiguationMenuPresentation’ must be nonnull";
    goto LABEL_16;
  }
  if (!v18)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    id v30 = @"parameter ‘userActionListDataSource’ must be nonnull";
    goto LABEL_16;
  }
  if (!v19)
  {
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    id v30 = @"parameter ‘schedulerProvider’ must be nonnull";
LABEL_16:
    id v31 = [v28 exceptionWithName:v29 reason:v30 userInfo:0];
    objc_exception_throw(v31);
  }
  v21 = v20;
  if (![v15 count])
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionsController.m" lineNumber:100 description:@"actionTypes should contain at least one action type"];
  }
  v36.receiver = self;
  v36.super_class = (Class)CNContactQuickActionsController;
  v22 = [(CNContactQuickActionsController *)&v36 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_actionTypes, a3);
    objc_storeWeak((id *)&v23->_contactQuickActionViewContainer, v16);
    objc_storeStrong((id *)&v23->_userActionListDataSource, a6);
    objc_storeStrong((id *)&v23->_disambiguationMenuPresentation, a5);
    objc_storeStrong((id *)&v23->_schedulerProvider, obj);
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionary];
    actionListModelsByActionType = v23->_actionListModelsByActionType;
    v23->_actionListModelsByActionType = (NSDictionary *)v24;

    objc_storeStrong((id *)&v23->_userActionContext, v35);
    v26 = v23;
  }

  return v23;
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() sharedDataSource];
  id v12 = +[CNUIContactsEnvironment currentEnvironment];
  __int16 v13 = [v12 defaultSchedulerProvider];

  id v14 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  id v15 = [(CNContactQuickActionsController *)self initWithActionTypes:v10 contactQuickActionViewContainer:v9 disambiguationMenuPresentation:v8 userActionListDataSource:v11 schedulerProvider:v13 userActionContext:v14];

  return v15;
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNContactQuickActionsDisambiguationMenuPresentation defaultPresentation];
  id v9 = [(CNContactQuickActionsController *)self initWithActionTypes:v7 contactQuickActionViewContainer:v6 disambiguationMenuPresentation:v8];

  return v9;
}

- (CNContactQuickActionsController)init
{
  id v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)sharedDataSource
{
  if (sharedDataSource_cn_once_token_3[0] != -1) {
    dispatch_once(sharedDataSource_cn_once_token_3, &__block_literal_global_36_32795);
  }
  id v2 = (void *)sharedDataSource_cn_once_object_3;

  return v2;
}

void __51__CNContactQuickActionsController_sharedDataSource__block_invoke()
{
  v0 = +[CNUIContactsEnvironment currentEnvironment];
  v1 = [v0 actionDiscoveringEnvironment];

  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F5A720]) initWithDiscoveringEnvironment:v1];
  [v2 setTracksChanges:1];

  id v3 = (void *)sharedDataSource_cn_once_object_3;
  sharedDataSource_cn_once_object_3 = (uint64_t)v2;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F5A720] descriptorForRequiredKeys];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  objc_super v5 = [NSString stringWithUTF8String:"+[CNContactQuickActionsController descriptorForRequiredKeys]"];
  id v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return (CNKeyDescriptor *)v6;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_2 != -1) {
    dispatch_once(&log_cn_once_token_2, &__block_literal_global_32800);
  }
  id v2 = (void *)log_cn_once_object_2;

  return (OS_os_log *)v2;
}

void __38__CNContactQuickActionsController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "quick-actions");
  v1 = (void *)log_cn_once_object_2;
  log_cn_once_object_2 = (uint64_t)v0;
}

@end