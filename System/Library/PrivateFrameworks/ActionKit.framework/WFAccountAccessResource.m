@interface WFAccountAccessResource
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
- (BOOL)canLogOut;
- (BOOL)supportsMultipleAccounts;
- (Class)accountClass;
- (NSArray)accounts;
- (WFAccountAccessResource)initWithDefinition:(id)a3;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedImportErrorReasonForStatus:(unint64_t)a3;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)name;
- (id)resourceName;
- (id)username;
- (unint64_t)status;
- (void)dealloc;
- (void)logOut;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFAccountAccessResource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_observer, 0);
}

- (void)logOut
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(WFAccountAccessResource *)self accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        +[WFAccount deleteAccount:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(WFResource *)self refreshAvailabilityWithForcedNotification];
}

- (BOOL)supportsMultipleAccounts
{
  v2 = [(WFAccountAccessResource *)self accountClass];
  return [(objc_class *)v2 allowsMultipleAccounts];
}

- (BOOL)canLogOut
{
  return ([(objc_class *)[(WFAccountAccessResource *)self accountClass] allowsMultipleAccounts] & 1) == 0&& [(objc_class *)[(WFAccountAccessResource *)self accountClass] numberOfAccounts] != 0;
}

- (id)username
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(WFAccountAccessResource *)self accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) refreshWithCompletionHandler:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  long long v8 = [(WFAccountAccessResource *)self accounts];
  long long v9 = [v8 firstObject];
  long long v10 = [v9 localizedName];

  return v10;
}

- (id)resourceName
{
  v2 = [(WFAccountAccessResource *)self accountClass];
  return (id)[(objc_class *)v2 localizedServiceName];
}

- (id)name
{
  v3 = [(WFAccessResource *)self associatedAppIdentifier];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFAccountAccessResource;
    uint64_t v4 = [(WFAccessResource *)&v6 name];
  }
  else
  {
    uint64_t v4 = [(WFAccountAccessResource *)self resourceName];
  }
  return v4;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = NSStringFromClass([(WFAccountAccessResource *)self accountClass]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v10[3] = &unk_264E5BF50;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 authorizeWithAccountClassName:v8 completionHandler:v10];
}

void __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) accounts];
    long long v8 = objc_msgSend(v7, "if_firstObjectWithValue:forKey:", v5, @"accountID");

    if (v8)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke_2;
      v9[3] = &unk_264E5CA00;
      id v10 = *(id *)(a1 + 40);
      [v8 refreshWithCompletionHandler:v9];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __78__WFAccountAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)status
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(WFAccountAccessResource *)self accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    unint64_t v6 = 4;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) isValid]) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = WFLocalizedString(@"In order to answer this question, Shortcuts needs access to your %@ account.");
    unint64_t v6 = [(objc_class *)[(WFAccountAccessResource *)self accountClass] serviceName];
    uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = WFLocalizedString(@"Shortcuts does not have access to your %@ account.");
    unint64_t v6 = [(objc_class *)[(WFAccountAccessResource *)self accountClass] serviceName];
    uint64_t v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  unint64_t v6 = WFLocalizedStringResourceWithKey(@"your %@ account", @"your %@ account");
  uint64_t v7 = [v5 localize:v6];

  long long v8 = [(objc_class *)[(WFAccountAccessResource *)self accountClass] serviceName];
  long long v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (NSArray)accounts
{
  v2 = [(WFAccountAccessResource *)self accountClass];
  return (NSArray *)[(objc_class *)v2 accounts];
}

- (Class)accountClass
{
  v2 = [(WFResource *)self definition];
  uint64_t v3 = [v2 objectForKey:@"WFAccountClass"];
  uint64_t v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (void)dealloc
{
  [(objc_class *)[(WFAccountAccessResource *)self accountClass] removeAccountObserver:self->_observer];
  v3.receiver = self;
  v3.super_class = (Class)WFAccountAccessResource;
  [(WFAccessResource *)&v3 dealloc];
}

- (WFAccountAccessResource)initWithDefinition:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFAccountAccessResource;
  id v5 = [(WFAccessResource *)&v14 initWithDefinition:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    unint64_t v6 = [(WFAccountAccessResource *)v5 accountClass];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__WFAccountAccessResource_initWithDefinition___block_invoke;
    v11[3] = &unk_264E5B950;
    objc_copyWeak(&v12, &location);
    uint64_t v7 = [(objc_class *)v6 addAccountObserver:v11];
    id observer = v5->_observer;
    v5->_id observer = (id)v7;

    long long v9 = v5;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __46__WFAccountAccessResource_initWithDefinition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshAvailabilityWithNotification];
}

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFAccountAccessResourceUserInterface";
  v6[1] = @"WFAccountAccessResourceUserInterface";
  objc_super v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1B60;
}

@end