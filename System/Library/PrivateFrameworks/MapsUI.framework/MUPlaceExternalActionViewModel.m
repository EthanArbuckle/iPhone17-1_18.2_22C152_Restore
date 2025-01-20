@interface MUPlaceExternalActionViewModel
- (BOOL)isEnabled;
- (BOOL)shouldShowMenu;
- (GEOPlaceExternalAction)externalAction;
- (MUPlaceExternalActionViewModel)initWithExternalAction:(id)a3 amsResultProvider:(id)a4 iconCache:(id)a5 actionHandler:(id)a6 analyticsHandler:(id)a7;
- (id)accessibilityIdentifier;
- (id)analyticsButtonValues;
- (id)buildMenuWithPresentationOptions:(id)a3;
- (id)symbolName;
- (id)titleText;
- (void)buildMenuItemViewModelsWithUpdateDelegate:(id)a3 completion:(id)a4;
- (void)openPartnerActionUsingMenuItemViewModel:(id)a3;
- (void)performSingleVendorSelectionAction;
@end

@implementation MUPlaceExternalActionViewModel

- (MUPlaceExternalActionViewModel)initWithExternalAction:(id)a3 amsResultProvider:(id)a4 iconCache:(id)a5 actionHandler:(id)a6 analyticsHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MUPlaceExternalActionViewModel;
  v18 = [(MUActionRowItemViewModel *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_externalAction, a3);
    v20 = [[MUGroupedExternalActionController alloc] initWithGroupedExternalAction:v13 amsResultProvider:v14 supportsMultipleVendorSelection:1 actionHandler:v16 analyticsHandler:v17];
    [(MUGroupedExternalActionController *)v20 setSingleVendorAnalyticsTarget:201];
    [(MUGroupedExternalActionController *)v20 setMultipleVendorAnalyticsTarget:57];
    [(MUGroupedExternalActionController *)v20 setAnalyticsModuleType:4];
    [(MUGroupedExternalActionController *)v20 setSource:9];
    v21 = [[MUPlaceExternalActionMenuHelper alloc] initWithExternalActionController:v20 iconCache:v15];
    menuHelper = v19->_menuHelper;
    v19->_menuHelper = v21;
  }
  return v19;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  id v4 = a3;
  if ([(MUPlaceExternalActionViewModel *)self shouldShowMenu])
  {
    v5 = (void *)MEMORY[0x1E4FB1970];
    v6 = [(MUPlaceExternalActionMenuHelper *)self->_menuHelper buildMenuElementsWithPresentationOptions:v4];
    v7 = [v5 menuWithChildren:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowMenu
{
  v2 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)buildMenuItemViewModelsWithUpdateDelegate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (![(MUPlaceExternalActionViewModel *)self shouldShowMenu]) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  [(MUPlaceExternalActionMenuHelper *)self->_menuHelper buildMenuItemViewModelsWithUpdateDelegate:v7 completion:v6];
}

- (void)openPartnerActionUsingMenuItemViewModel:(id)a3
{
  menuHelper = self->_menuHelper;
  id v4 = a3;
  id v6 = [(MUPlaceExternalActionMenuHelper *)menuHelper actionController];
  v5 = [v4 vendorLinkViewModel];

  [v6 openPartnerActionUsingViewModel:v5];
}

- (void)performSingleVendorSelectionAction
{
  id v2 = [(MUPlaceExternalActionMenuHelper *)self->_menuHelper actionController];
  [v2 openFirstPartnerAction];
}

- (id)symbolName
{
  return (id)[(GEOPlaceExternalAction *)self->_externalAction symbolName];
}

- (id)titleText
{
  return (id)[(GEOPlaceExternalAction *)self->_externalAction actionName];
}

- (BOOL)isEnabled
{
  if (![(GEOPlaceExternalAction *)self->_externalAction possiblyHasSupportedIntegrations])return 0; {
  BOOL v3 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  }
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"ExternalAction"];
}

- (id)analyticsButtonValues
{
  return MUExternalActionRevealedAnalyticsModuleButtonsForAction(self->_externalAction);
}

- (GEOPlaceExternalAction)externalAction
{
  return self->_externalAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAction, 0);
  objc_storeStrong((id *)&self->_menuHelper, 0);
}

@end