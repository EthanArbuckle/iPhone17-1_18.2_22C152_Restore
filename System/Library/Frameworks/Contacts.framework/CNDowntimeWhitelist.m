@interface CNDowntimeWhitelist
+ (BOOL)anyContactIsWhitelisted:(id)a3;
+ (BOOL)isWhitelistedContact:(id)a3;
+ (id)keyDescriptor;
+ (id)os_log;
- (BOOL)isHandleStringWhitelisted:(id)a3;
- (BOOL)isHandleStringWhitelisted:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (CNDowntimeWhitelist)init;
- (CNDowntimeWhitelist)initWithContactStore:(id)a3;
- (CNDowntimeWhitelist)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5;
- (CNDowntimeWhitelist)initWithContactStore:(id)a3 notificationCenter:(id)a4;
- (CNDowntimeWhitelistContainerFetching)containerFetcher;
- (NSNotificationCenter)notificationCenter;
- (NSObject)contactStoreDidChangeNotificationToken;
- (id)allWhitelistedContacts:(id *)a3;
- (id)allWhitelistedHandleStrings;
- (id)allWhitelistedHandleStrings:(id *)a3;
- (id)requestForContactsInPermittedContainers;
- (id)requestForContactsInPermittedContainersWithHandles:(id)a3;
- (id)requestForNonUnifiedContacts;
- (id)whitelistedHandleStringsFromHandleStrings:(id)a3;
- (id)whitelistedHandleStringsFromHandleStrings:(id)a3 error:(id *)a4;
- (void)beginObservingChangeNotifications;
- (void)dealloc;
- (void)setTestContainerFetcher:(id)a3;
@end

@implementation CNDowntimeWhitelist

- (CNDowntimeWhitelist)initWithContactStore:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  v7 = [(CNDowntimeWhitelist *)self initWithContactStore:v5 notificationCenter:v6];

  return v7;
}

- (CNDowntimeWhitelist)initWithContactStore:(id)a3 notificationCenter:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F179C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultStore];
  v10 = [(CNDowntimeWhitelist *)self initWithContactStore:v8 accountStore:v9 notificationCenter:v7];

  return v10;
}

- (CNDowntimeWhitelist)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNDowntimeWhitelist;
  v12 = [(CNDowntimeWhitelist *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
    v14 = [[CNDowntimeWhitelistContainerFetcher alloc] initWithContactStore:v9 accountStore:v10 notificationCenter:v11];
    containerFetcher = v13->_containerFetcher;
    v13->_containerFetcher = (CNDowntimeWhitelistContainerFetching *)v14;

    [(CNDowntimeWhitelist *)v13 beginObservingChangeNotifications];
    v16 = v13;
  }

  return v13;
}

- (void)beginObservingChangeNotifications
{
  v3 = self->_notificationCenter;
  notificationCenter = self->_notificationCenter;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke;
  v8[3] = &unk_1E56B9140;
  id v9 = v3;
  id v5 = v3;
  v6 = [(NSNotificationCenter *)notificationCenter addObserverForName:@"CNContactStoreDidChangeNotification" object:0 queue:0 usingBlock:v8];
  contactStoreDidChangeNotificationToken = self->_contactStoreDidChangeNotificationToken;
  self->_contactStoreDidChangeNotificationToken = v6;
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_24 != -1) {
    dispatch_once(&os_log_cn_once_token_0_24, &__block_literal_global_142);
  }
  v2 = (void *)os_log_cn_once_object_0_24;

  return v2;
}

uint64_t __29__CNDowntimeWhitelist_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "whitelist");
  uint64_t v1 = os_log_cn_once_object_0_24;
  os_log_cn_once_object_0_24 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNDowntimeWhitelist)init
{
  v3 = objc_alloc_init(CNContactStore);
  v4 = [(CNDowntimeWhitelist *)self initWithContactStore:v3];

  return v4;
}

void __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke_2;
  v4[3] = &unk_1E56B4530;
  id v5 = *(id *)(a1 + 32);
  id v3 = (id)[v2 afterDelay:v4 performBlock:0.0];
}

uint64_t __56__CNDowntimeWhitelist_beginObservingChangeNotifications__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationName:@"CNDowntimeWhitelistDidChangeNotification" object:0];
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self->_contactStoreDidChangeNotificationToken];
  v3.receiver = self;
  v3.super_class = (Class)CNDowntimeWhitelist;
  [(CNDowntimeWhitelist *)&v3 dealloc];
}

- (id)whitelistedHandleStringsFromHandleStrings:(id)a3
{
  return [(CNDowntimeWhitelist *)self whitelistedHandleStringsFromHandleStrings:a3 error:0];
}

- (id)whitelistedHandleStringsFromHandleStrings:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CNDowntimeWhitelist *)self contactStore];
  id v8 = [(CNDowntimeWhitelist *)self requestForContactsInPermittedContainersWithHandles:v6];
  id v21 = 0;
  id v9 = [v7 executeFetchRequest:v8 error:&v21];
  id v10 = v21;

  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__CNDowntimeWhitelist_whitelistedHandleStringsFromHandleStrings_error___block_invoke;
    v18[3] = &unk_1E56B9168;
    id v19 = v9;
    v20 = self;
    id v11 = objc_msgSend(v6, "_cn_filter:", v18);
    v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 count];
      uint64_t v14 = [v6 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_INFO, "%lu of %lu handles were whitelisted", buf, 0x16u);
    }

    v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:]();
    }
  }
  else
  {
    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:]();
    }

    id v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

uint64_t __71__CNDowntimeWhitelist_whitelistedHandleStringsFromHandleStrings_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 value];
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = [(id)objc_opt_class() anyContactIsWhitelisted:v5];
  return v6;
}

- (BOOL)isHandleStringWhitelisted:(id)a3
{
  return [(CNDowntimeWhitelist *)self isHandleStringWhitelisted:a3 error:0];
}

- (BOOL)isHandleStringWhitelisted:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    objc_super v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v21[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v9 = [(CNDowntimeWhitelist *)self requestForContactsInPermittedContainersWithHandles:v8];

    id v10 = [(CNDowntimeWhitelist *)self contactStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__CNDowntimeWhitelist_isHandleStringWhitelisted_error___block_invoke;
    v15[3] = &unk_1E56B9190;
    v15[4] = self;
    v15[5] = &v17;
    id v16 = 0;
    char v11 = [v10 enumerateContactsWithFetchRequest:v9 error:&v16 usingBlock:v15];
    id v12 = v16;

    if ((v11 & 1) == 0)
    {
      if (a4) {
        *a4 = v12;
      }
      uint64_t v13 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CNDowntimeWhitelist whitelistedHandleStringsFromHandleStrings:error:]();
      }
    }
    BOOL v7 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

void __55__CNDowntimeWhitelist_isHandleStringWhitelisted_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([(id)objc_opt_class() isWhitelistedContact:v5])
  {
    id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_INFO, "Whitelisted %@", (uint8_t *)&v7, 0xCu);
    }

    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)allWhitelistedHandleStrings
{
  return [(CNDowntimeWhitelist *)self allWhitelistedHandleStrings:0];
}

- (id)allWhitelistedHandleStrings:(id *)a3
{
  id v3 = [(CNDowntimeWhitelist *)self allWhitelistedContacts:a3];
  v4 = objc_msgSend(v3, "_cn_flatMap:", &__block_literal_global_32_3);

  return v4;
}

- (id)allWhitelistedContacts:(id *)a3
{
  id v5 = [(CNDowntimeWhitelist *)self contactStore];
  id v6 = [(CNDowntimeWhitelist *)self requestForContactsInPermittedContainers];
  id v14 = 0;
  int v7 = [v5 executeFetchRequest:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    uint64_t v9 = [v7 value];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__CNDowntimeWhitelist_allWhitelistedContacts___block_invoke;
    v13[3] = &unk_1E56B91B8;
    v13[4] = self;
    id v10 = objc_msgSend(v9, "_cn_filter:", v13);
  }
  else
  {
    char v11 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNDowntimeWhitelist allWhitelistedContacts:]();
    }

    id v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v10;
}

uint64_t __46__CNDowntimeWhitelist_allWhitelistedContacts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() isWhitelistedContact:v2];

  return v3;
}

- (id)requestForContactsInPermittedContainersWithHandles:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNDowntimeWhitelist *)self containerFetcher];
  id v6 = [v5 downtimeWhitelistContainer];
  uint64_t v7 = [v6 identifier];
  id v8 = (void *)v7;
  uint64_t v9 = &stru_1EE052B80;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  id v10 = v9;

  char v11 = [(CNDowntimeWhitelist *)self requestForNonUnifiedContacts];
  v15[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v13 = +[CNContact predicateForContactsMatchingHandleStrings:v4 inContainersWithIdentifiers:v12];

  [v11 setPredicate:v13];

  return v11;
}

- (id)requestForContactsInPermittedContainers
{
  uint64_t v3 = [(CNDowntimeWhitelist *)self containerFetcher];
  id v4 = [v3 downtimeWhitelistContainer];
  uint64_t v5 = [v4 identifier];
  id v6 = (void *)v5;
  uint64_t v7 = &stru_1EE052B80;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(CNDowntimeWhitelist *)self requestForNonUnifiedContacts];
  id v10 = +[CNContact predicateForContactsInContainerWithIdentifier:v8];

  [v9 setPredicate:v10];

  return v9;
}

- (id)requestForNonUnifiedContacts
{
  id v2 = [CNContactFetchRequest alloc];
  uint64_t v3 = [(id)objc_opt_class() keyDescriptor];
  id v4 = [(CNContactFetchRequest *)v2 initWithKeysToFetch:v3];

  [(CNContactFetchRequest *)v4 setUnifyResults:0];

  return v4;
}

+ (id)keyDescriptor
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"identifier";
  v7[1] = @"downtimeWhitelist";
  v7[2] = @"emailAddresses";
  v7[3] = @"phoneNumbers";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  uint64_t v3 = +[CNContact descriptorWithKeyDescriptors:v2 description:@"CNDowntimeWhitelist keyDescriptor"];
  id v6 = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];

  return v4;
}

+ (BOOL)anyContactIsWhitelisted:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_24_1);
}

+ (BOOL)isWhitelistedContact:(id)a3
{
  uint64_t v3 = [a3 downtimeWhitelist];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F5A1B0]];

  return v4;
}

- (void)setTestContainerFetcher:(id)a3
{
}

- (CNDowntimeWhitelistContainerFetching)containerFetcher
{
  return self->_containerFetcher;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)contactStoreDidChangeNotificationToken
{
  return self->_contactStoreDidChangeNotificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_containerFetcher, 0);
}

- (void)whitelistedHandleStringsFromHandleStrings:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error fetching whitelisted contacts %{public}@", v2, v3, v4, v5, v6);
}

- (void)whitelistedHandleStringsFromHandleStrings:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "Whitelisted handles: %{public}@", v1, 0xCu);
}

- (void)allWhitelistedContacts:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "error fetching whitelisted contacts: %{public}@", v2, v3, v4, v5, v6);
}

@end