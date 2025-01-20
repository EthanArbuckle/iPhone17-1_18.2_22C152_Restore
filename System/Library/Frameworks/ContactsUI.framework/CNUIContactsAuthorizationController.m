@interface CNUIContactsAuthorizationController
+ (NSArray)validAuthorizationLabelsForValues;
+ (NSArray)validAuthorizationValues;
+ (NSString)authorizationPaneContactsAppLabel;
+ (NSString)authorizationPaneFooterLabel;
+ (NSString)authorizationPaneHeaderLabel;
- (BOOL)foundAppsWithContactsAccessInfo;
- (CNUIContactsAuthorizationController)init;
- (CNUIContactsAuthorizationController)initWithBundleIdentifier:(id)a3;
- (CNUIContactsAuthorizationControllerDelegate)delegate;
- (CNUIContactsAuthorizationStore)store;
- (CNUICoreContactsAuthorizationModel)model;
- (NSArray)bundleIdentifiersOfAppsWithContactsAccessInfo;
- (id)authorizationLevelOfAppWithBundleIdentifier:(id)a3;
- (id)createModel;
- (id)iconOfAppWithBundleIdentifier:(id)a3;
- (id)nameOfAppWithBundleIdentifier:(id)a3;
- (void)lazilyLoadIconsForRemoteItems;
- (void)saveModel;
- (void)setAuthorizationLevel:(id)a3 ofAppWithBundleIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation CNUIContactsAuthorizationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)setModel:(id)a3
{
}

- (CNUIContactsAuthorizationStore)store
{
  return self->_store;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNUIContactsAuthorizationControllerDelegate *)a3;
}

- (CNUIContactsAuthorizationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setAuthorizationLevel:(id)a3 ofAppWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 unsignedIntegerValue];
  v8 = [(CNUIContactsAuthorizationController *)self model];
  v9 = [v8 itemWithMatchingBundleIdentifier:v6];

  [v9 setAuthorization:v7];

  [(CNUIContactsAuthorizationController *)self saveModel];
}

- (id)iconOfAppWithBundleIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  id v6 = [(CNUIContactsAuthorizationController *)self model];
  uint64_t v7 = [v6 itemWithMatchingBundleIdentifier:v5];

  v8 = [v7 icon];
  v9 = [v4 imageWithData:v8];

  return v9;
}

- (id)nameOfAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIContactsAuthorizationController *)self model];
  id v6 = [v5 itemWithMatchingBundleIdentifier:v4];

  uint64_t v7 = [v6 name];

  return v7;
}

- (id)authorizationLevelOfAppWithBundleIdentifier:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = [(CNUIContactsAuthorizationController *)self model];
  uint64_t v7 = [v6 itemWithMatchingBundleIdentifier:v5];

  v8 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "authorization"));

  return v8;
}

- (NSArray)bundleIdentifiersOfAppsWithContactsAccessInfo
{
  v2 = [(CNUIContactsAuthorizationController *)self model];
  v3 = [v2 bundleIdentifiers];

  return (NSArray *)v3;
}

- (BOOL)foundAppsWithContactsAccessInfo
{
  v2 = [(CNUIContactsAuthorizationController *)self model];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

- (void)saveModel
{
  char v3 = [(CNUIContactsAuthorizationController *)self store];
  id v4 = [(CNUIContactsAuthorizationController *)self model];
  id v6 = [v3 saveContactsAuthorizationModel:v4];

  id v5 = (id)[v6 result:0];
}

- (void)lazilyLoadIconsForRemoteItems
{
  char v3 = [(CNUIContactsAuthorizationController *)self store];
  id v4 = [(CNUIContactsAuthorizationController *)self model];
  id v5 = [v3 contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CNUIContactsAuthorizationController_lazilyLoadIconsForRemoteItems__block_invoke;
  v6[3] = &unk_1E5499F20;
  v6[4] = self;
  [v5 addSuccessBlock:v6];
}

void __68__CNUIContactsAuthorizationController_lazilyLoadIconsForRemoteItems__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 model];
  id v6 = [v5 modelByCopyingIconsOfRemoteItemsFromModel:v4];
  [*(id *)(a1 + 32) setModel:v6];

  id v9 = [*(id *)(a1 + 32) delegate];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = [v4 bundleIdentifiers];

  [v9 controller:v7 didRefreshInfoForAppsWithBundleIdentifiers:v8];
}

- (id)createModel
{
  v2 = [(CNUIContactsAuthorizationController *)self store];
  char v3 = [v2 contactsAuthorizationModel];
  id v4 = [v3 result:0];

  return v4;
}

- (CNUICoreContactsAuthorizationModel)model
{
  model = self->_model;
  if (!model)
  {
    id v4 = [(CNUIContactsAuthorizationController *)self createModel];
    id v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }

  return model;
}

- (CNUIContactsAuthorizationController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIContactsAuthorizationController;
  id v5 = [(CNUIContactsAuthorizationController *)&v10 init];
  if (v5)
  {
    id v6 = [[CNUIContactsAuthorizationStore alloc] initWithBundleIdentifier:v4];
    store = v5->_store;
    v5->_store = v6;

    v8 = v5;
  }

  return v5;
}

- (CNUIContactsAuthorizationController)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (NSArray)validAuthorizationLabelsForValues
{
  return (NSArray *)&unk_1ED915BA8;
}

+ (NSArray)validAuthorizationValues
{
  return (NSArray *)&unk_1ED915B90;
}

+ (NSString)authorizationPaneContactsAppLabel
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

+ (NSString)authorizationPaneHeaderLabel
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"CONTACTS_AUTH_HEADER" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

+ (NSString)authorizationPaneFooterLabel
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"CONTACTS_FOOTER" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

@end