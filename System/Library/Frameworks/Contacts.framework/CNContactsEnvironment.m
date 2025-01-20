@interface CNContactsEnvironment
+ (BOOL)supportsSecureCoding;
+ (id)baseURLWithDataLocationName:(id)a3;
+ (id)currentEnvironment;
+ (id)inMemoryURL;
+ (id)unitTestingEnvironment;
+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3;
+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4;
+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5;
+ (id)unitTestingEnvironmentWithSchedulerProvider:(id)a3 loggerProvider:(id)a4;
- (BOOL)useInMemoryStores;
- (CNContactsEnvironment)init;
- (CNContactsEnvironment)initWithCoder:(id)a3;
- (CNContactsEnvironment)initWithSchedulerProvider:(id)a3 loggerProvider:(id)a4;
- (CNContactsLoggerProvider)loggerProvider;
- (CNSchedulerProvider)schedulerProvider;
- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings;
- (CNiOSABPredicateRunner)abPredicateRunner;
- (CNiOSAddressBook)addressBook;
- (NSArray)delegateInfos;
- (NSURL)baseURL;
- (SGSuggestionsServiceContactsProtocol)suggestionsService;
- (id)copyWithDelegateInfos:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)makeCurrentEnvironment;
- (void)setAbPredicateRunner:(id)a3;
- (void)setAddressBook:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDelegateInfos:(id)a3;
- (void)setSiriIntelligenceSettings:(id)a3;
- (void)setSuggestionsService:(id)a3;
@end

@implementation CNContactsEnvironment

id __36__CNContactsEnvironment_addressBook__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = [[CNiOSAddressBook alloc] initWithContactsEnvironment:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v2;
}

- (BOOL)useInMemoryStores
{
  v2 = [(CNContactsEnvironment *)self baseURL];
  v3 = [(id)objc_opt_class() inMemoryURL];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

+ (id)inMemoryURL
{
  if (inMemoryURL_cn_once_token_0 != -1) {
    dispatch_once(&inMemoryURL_cn_once_token_0, &__block_literal_global_2_2);
  }
  v2 = (void *)inMemoryURL_cn_once_object_0;

  return v2;
}

- (NSArray)delegateInfos
{
  return self->_delegateInfos;
}

- (CNContactsLoggerProvider)loggerProvider
{
  return self->_loggerProvider;
}

- (CNiOSAddressBook)addressBook
{
  v2 = cn_objectResultWithObjectLock();

  return (CNiOSAddressBook *)v2;
}

+ (id)currentEnvironment
{
  if (s_currentEnvironmentOnceToken != -1) {
    dispatch_once(&s_currentEnvironmentOnceToken, &__block_literal_global_42);
  }
  v2 = (void *)s_currentEnvironment;

  return v2;
}

- (SGSuggestionsServiceContactsProtocol)suggestionsService
{
  return self->_suggestionsService;
}

- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings
{
  return self->_siriIntelligenceSettings;
}

uint64_t __43__CNContactsEnvironment_currentEnvironment__block_invoke()
{
  s_currentEnvironment = objc_alloc_init(CNContactsEnvironment);

  return MEMORY[0x1F41817F8]();
}

- (CNContactsEnvironment)init
{
  v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  char v4 = +[CNContactsLoggerProvider defaultProvider];
  v5 = [(CNContactsEnvironment *)self initWithSchedulerProvider:v3 loggerProvider:v4];

  return v5;
}

- (CNContactsEnvironment)initWithSchedulerProvider:(id)a3 loggerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactsEnvironment;
  v9 = [(CNContactsEnvironment *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schedulerProvider, a3);
    objc_storeStrong((id *)&v10->_loggerProvider, a4);
    v11 = objc_alloc_init(CNiOSABPredicateRunner);
    abPredicateRunner = v10->_abPredicateRunner;
    v10->_abPredicateRunner = v11;

    v13 = v10;
  }

  return v10;
}

void __36__CNContactsEnvironment_inMemoryURL__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"in-memory://"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)inMemoryURL_cn_once_object_0;
  inMemoryURL_cn_once_object_0 = v0;
}

- (void)makeCurrentEnvironment
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CNContactsEnvironment_makeCurrentEnvironment__block_invoke;
  block[3] = &unk_1E56B4530;
  block[4] = self;
  if (s_currentEnvironmentOnceToken != -1) {
    dispatch_once(&s_currentEnvironmentOnceToken, block);
  }
}

void __47__CNContactsEnvironment_makeCurrentEnvironment__block_invoke(uint64_t a1)
{
}

+ (id)unitTestingEnvironment
{
  v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  char v4 = +[CNMockLoggerProvider loggerProvider];
  v5 = [a1 unitTestingEnvironmentWithSchedulerProvider:v3 loggerProvider:v4];

  return v5;
}

+ (id)unitTestingEnvironmentWithSchedulerProvider:(id)a3 loggerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CNContactsEnvironment alloc] initWithSchedulerProvider:v7 loggerProvider:v6];

  v9 = [a1 inMemoryURL];
  [(CNContactsEnvironment *)v8 setBaseURL:v9];

  return v8;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F5A4F0];
  id v5 = a3;
  id v6 = [v4 defaultProvider];
  id v7 = +[CNMockLoggerProvider loggerProvider];
  id v8 = [a1 unitTestingEnvironmentWithDataLocationName:v5 schedulerProvider:v6 loggerProvider:v7];

  return v8;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNMockLoggerProvider loggerProvider];
  v9 = [a1 unitTestingEnvironmentWithDataLocationName:v7 schedulerProvider:v6 loggerProvider:v8];

  return v9;
}

+ (id)unitTestingEnvironmentWithDataLocationName:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  id v8 = a3;
  v9 = [a1 unitTestingEnvironmentWithSchedulerProvider:a4 loggerProvider:a5];
  v10 = [a1 baseURLWithDataLocationName:v8];

  [v9 setBaseURL:v10];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactsEnvironment)initWithCoder:(id)a3
{
  v3 = [(CNContactsEnvironment *)self init];
  char v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = [[CNContactsEnvironment alloc] initWithSchedulerProvider:self->_schedulerProvider loggerProvider:self->_loggerProvider];
  id v5 = [(CNContactsEnvironment *)self baseURL];
  [(CNContactsEnvironment *)v4 setBaseURL:v5];

  objc_storeStrong((id *)&v4->_addressBook, self->_addressBook);
  objc_storeStrong((id *)&v4->_abPredicateRunner, self->_abPredicateRunner);
  return v4;
}

+ (id)baseURLWithDataLocationName:(id)a3
{
  id v3 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    char v4 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v6 = [v5 URLForDirectory:13 inDomain:2 appropriateForURL:0 create:1 error:0];
    id v7 = [v6 URLByAppendingPathComponent:@"ContactsTests"];

    char v4 = [v7 URLByAppendingPathComponent:v3 isDirectory:1];
  }

  return v4;
}

- (id)copyWithDelegateInfos:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(CNContactsEnvironment *)self copy];
  [v5 setDelegateInfos:v4];

  [v5 setAddressBook:0];
  return v5;
}

- (void)setAddressBook:(id)a3
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setBaseURL:(id)a3
{
}

- (void)setSuggestionsService:(id)a3
{
}

- (void)setSiriIntelligenceSettings:(id)a3
{
}

- (void)setDelegateInfos:(id)a3
{
}

- (CNiOSABPredicateRunner)abPredicateRunner
{
  return self->_abPredicateRunner;
}

- (void)setAbPredicateRunner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerProvider, 0);
  objc_storeStrong((id *)&self->_abPredicateRunner, 0);
  objc_storeStrong((id *)&self->_delegateInfos, 0);
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);

  objc_storeStrong((id *)&self->_addressBook, 0);
}

@end