@interface CUIKAccountsController
+ (id)sharedInstance;
+ (void)initialize;
+ (void)invalidate;
- (BOOL)haveiCloudCalendarAccountInSources:(id)a3;
- (BOOL)sourceIsManaged:(id)a3;
- (CUIKAccountsController)init;
- (id)_accountForAccountIdentifier:(id)a3;
- (id)_displayAccountForAccountWithIdentifier:(id)a3;
- (id)accountStore;
- (id)accountTypeTitleForSource:(id)a3;
- (id)accountTypeTitleForSourceWithExternalId:(id)a3;
- (id)titleForSource:(id)a3 forBeginningOfSentence:(BOOL)a4;
- (int)sortOrderForSource:(id)a3;
- (int)sortOrderForSourceType:(int64_t)a3;
- (int)sortOrderForStoreType:(int64_t)a3;
- (void)_accountStoreDidChange:(id)a3;
- (void)dealloc;
@end

@implementation CUIKAccountsController

+ (id)sharedInstance
{
  id v2 = (id)__SharedRefreshController;
  objc_sync_enter(v2);
  v3 = (void *)__SharedRefreshController;
  if (!__SharedRefreshController)
  {
    uint64_t v4 = objc_opt_new();
    v5 = (void *)__SharedRefreshController;
    __SharedRefreshController = v4;

    v3 = (void *)__SharedRefreshController;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)invalidate
{
  id obj = (id)__SharedRefreshController;
  objc_sync_enter(obj);
  id v2 = (void *)__SharedRefreshController;
  __SharedRefreshController = 0;

  objc_sync_exit(obj);
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_10);
  }
}

void __36__CUIKAccountsController_initialize__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)__cachedAccounts;
  __cachedAccounts = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)__cachedDisplayAccounts;
  __cachedDisplayAccounts = v2;
}

- (CUIKAccountsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKAccountsController;
  uint64_t v2 = [(CUIKAccountsController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:0];

    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CUIKAccountsController;
  [(CUIKAccountsController *)&v4 dealloc];
}

- (id)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_super v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)_accountStoreDidChange:(id)a3
{
  objc_msgSend((id)__cachedAccounts, "removeAllObjects", a3);
  v3 = (void *)__cachedDisplayAccounts;

  [v3 removeAllObjects];
}

- (id)_accountForAccountIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)__cachedAccounts objectForKey:v4];
  if (!v5)
  {
    objc_super v6 = [(CUIKAccountsController *)self accountStore];
    v5 = [v6 accountWithIdentifier:v4];

    if (v5) {
      [(id)__cachedAccounts setObject:v5 forKey:v4];
    }
  }

  return v5;
}

- (id)_displayAccountForAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)__cachedDisplayAccounts objectForKey:v4];
  if (!v5)
  {
    objc_super v6 = [(CUIKAccountsController *)self _accountForAccountIdentifier:v4];
    v7 = v6;
    if (v6)
    {
      v5 = [v6 displayAccount];
      [(id)__cachedDisplayAccounts setObject:v5 forKey:v4];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)titleForSource:(id)a3 forBeginningOfSentence:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 sourceType];
  if (v7 == 4)
  {
    v9 = CUIKBundle();
    v10 = v9;
    if (v4) {
      v11 = @"Subscribed calendar group title";
    }
    else {
      v11 = @"Subscribed calendar group title.  Usually preceded by 'All' to denote selecting all the calendars in the group. In English these are the same.";
    }
    v8 = [v9 localizedStringForKey:v11 value:@"Subscribed" table:0];
  }
  else if (v7)
  {
    if ([v6 isDelegate])
    {
      v8 = [v6 title];
    }
    else
    {
      v12 = [v6 externalID];
      if (v12)
      {
        v13 = [(CUIKAccountsController *)self _displayAccountForAccountWithIdentifier:v12];
        v14 = v13;
        if (v13)
        {
          v8 = [v13 accountDescription];
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
      }
      if (![v8 length] && objc_msgSend(v6, "sourceType") == 5)
      {
        v15 = CUIKBundle();
        uint64_t v16 = [v15 localizedStringForKey:@"The 'other' account, where the birthday calendar lives", @"Other", 0 value table];

        v8 = (void *)v16;
      }
      if (![v8 length])
      {
        uint64_t v17 = [v6 title];

        v8 = (void *)v17;
      }
    }
    if (![v8 length])
    {
      v18 = CUIKBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"Untitled Account" value:&stru_1F187C430 table:0];

      v8 = (void *)v19;
    }
  }
  else
  {
    v8 = [(id)EKWeakLinkClass() localizedTitleForLocalSourceOfDataclass:*MEMORY[0x1E4F17A80] usedAtBeginningOfSentence:v4];
  }

  return v8;
}

- (id)accountTypeTitleForSourceWithExternalId:(id)a3
{
  if (a3)
  {
    v3 = -[CUIKAccountsController _displayAccountForAccountWithIdentifier:](self, "_displayAccountForAccountWithIdentifier:");
    BOOL v4 = v3;
    if (v3)
    {
      v5 = [v3 accountType];
      id v6 = [v5 accountTypeDescription];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)accountTypeTitleForSource:(id)a3
{
  id v4 = a3;
  if ([v4 sourceType])
  {
    v5 = [v4 externalID];
    id v6 = [(CUIKAccountsController *)self accountTypeTitleForSourceWithExternalId:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)sourceIsManaged:(id)a3
{
  id v3 = a3;
  id v4 = [v3 eventStore];
  char v5 = [v4 isSourceManaged:v3];

  return v5;
}

- (int)sortOrderForSource:(id)a3
{
  uint64_t v4 = [a3 sourceType];

  return [(CUIKAccountsController *)self sortOrderForSourceType:v4];
}

- (int)sortOrderForSourceType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 1;
  }
  else {
    return dword_1BE079418[a3];
  }
}

- (int)sortOrderForStoreType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 1;
  }
  else {
    return dword_1BE079434[a3];
  }
}

- (BOOL)haveiCloudCalendarAccountInSources:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = *MEMORY[0x1E4F17750];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "sourceType", (void)v18))
        {
          v11 = [v10 externalID];
          v12 = [(CUIKAccountsController *)self _displayAccountForAccountWithIdentifier:v11];

          if (v12)
          {
            v13 = [v12 accountType];
            v14 = [v13 identifier];
            char v15 = [v14 isEqualToString:v8];

            if (v15)
            {
              BOOL v16 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_13:

  return v16;
}

- (void).cxx_destruct
{
}

@end