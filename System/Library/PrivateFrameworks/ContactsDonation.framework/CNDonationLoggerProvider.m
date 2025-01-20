@interface CNDonationLoggerProvider
+ (CNDonationLoggerProvider)defaultProvider;
- (CNDonationAccountLogger)accountLoggerImpl;
- (CNDonationAgentLogger)agentLoggerImpl;
- (CNDonationAnalyticsLogger)analyticsLoggerImpl;
- (CNDonationExtensionLogger)extensionLoggerImpl;
- (CNDonationLoggerProvider)init;
- (CNDonationManagedDuplicatesLogger)duplicatesLoggerImpl;
- (CNDonationPreferencesLogger)preferencesLoggerImpl;
- (CNDonationToolLogger)toolLoggerImpl;
@end

@implementation CNDonationLoggerProvider

+ (CNDonationLoggerProvider)defaultProvider
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CNDonationLoggerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1) {
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  }
  v2 = (void *)defaultProvider_cn_once_object_1;

  return (CNDonationLoggerProvider *)v2;
}

uint64_t __43__CNDonationLoggerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_cn_once_object_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (CNDonationLoggerProvider)init
{
  v19.receiver = self;
  v19.super_class = (Class)CNDonationLoggerProvider;
  v2 = [(CNDonationLoggerProvider *)&v19 init];
  if (v2)
  {
    v3 = objc_alloc_init(_CNDonationAgentLogger);
    agentLoggerImpl = v2->_agentLoggerImpl;
    v2->_agentLoggerImpl = (CNDonationAgentLogger *)v3;

    v5 = objc_alloc_init(_CNDonationExtensionLogger);
    extensionLoggerImpl = v2->_extensionLoggerImpl;
    v2->_extensionLoggerImpl = (CNDonationExtensionLogger *)v5;

    v7 = objc_alloc_init(_CNDonationToolLogger);
    toolLoggerImpl = v2->_toolLoggerImpl;
    v2->_toolLoggerImpl = (CNDonationToolLogger *)v7;

    v9 = objc_alloc_init(_CNDonationAccountLogger);
    accountLoggerImpl = v2->_accountLoggerImpl;
    v2->_accountLoggerImpl = (CNDonationAccountLogger *)v9;

    v11 = objc_alloc_init(_CNDonationPreferencesLogger);
    preferencesLoggerImpl = v2->_preferencesLoggerImpl;
    v2->_preferencesLoggerImpl = (CNDonationPreferencesLogger *)v11;

    v13 = objc_alloc_init(_CNDonationAnalyticsLogger);
    analyticsLoggerImpl = v2->_analyticsLoggerImpl;
    v2->_analyticsLoggerImpl = (CNDonationAnalyticsLogger *)v13;

    v15 = objc_alloc_init(_CNDonationManagedDuplicatesLogger);
    duplicatesLoggerImpl = v2->_duplicatesLoggerImpl;
    v2->_duplicatesLoggerImpl = (CNDonationManagedDuplicatesLogger *)v15;

    v17 = v2;
  }

  return v2;
}

- (CNDonationAgentLogger)agentLoggerImpl
{
  return self->_agentLoggerImpl;
}

- (CNDonationExtensionLogger)extensionLoggerImpl
{
  return self->_extensionLoggerImpl;
}

- (CNDonationToolLogger)toolLoggerImpl
{
  return self->_toolLoggerImpl;
}

- (CNDonationAccountLogger)accountLoggerImpl
{
  return self->_accountLoggerImpl;
}

- (CNDonationPreferencesLogger)preferencesLoggerImpl
{
  return self->_preferencesLoggerImpl;
}

- (CNDonationAnalyticsLogger)analyticsLoggerImpl
{
  return self->_analyticsLoggerImpl;
}

- (CNDonationManagedDuplicatesLogger)duplicatesLoggerImpl
{
  return self->_duplicatesLoggerImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicatesLoggerImpl, 0);
  objc_storeStrong((id *)&self->_analyticsLoggerImpl, 0);
  objc_storeStrong((id *)&self->_preferencesLoggerImpl, 0);
  objc_storeStrong((id *)&self->_accountLoggerImpl, 0);
  objc_storeStrong((id *)&self->_toolLoggerImpl, 0);
  objc_storeStrong((id *)&self->_extensionLoggerImpl, 0);

  objc_storeStrong((id *)&self->_agentLoggerImpl, 0);
}

@end