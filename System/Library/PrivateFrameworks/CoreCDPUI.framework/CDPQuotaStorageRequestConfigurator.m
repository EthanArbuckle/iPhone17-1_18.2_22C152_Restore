@interface CDPQuotaStorageRequestConfigurator
- (BOOL)_isConfigurationValid;
- (CDPQuotaStorageRequestConfigurator)initWithAccount:(id)a3 appList:(unint64_t)a4 contentSpecifiesE2EE:(BOOL)a5;
- (id)quotaRequest:(id *)a3;
- (void)_isConfigurationValid;
@end

@implementation CDPQuotaStorageRequestConfigurator

- (CDPQuotaStorageRequestConfigurator)initWithAccount:(id)a3 appList:(unint64_t)a4 contentSpecifiesE2EE:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDPQuotaStorageRequestConfigurator;
  v10 = [(CDPQuotaStorageRequestConfigurator *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_account, a3);
    v11->_appList = a4;
    v11->_specifyE2EE = a5;
  }

  return v11;
}

- (id)quotaRequest:(id *)a3
{
  if ([(CDPQuotaStorageRequestConfigurator *)self _isConfigurationValid])
  {
    v5 = [[CDPQuotaStorageAppListRequest alloc] initWithAccount:self->_account appList:self->_appList contentSpecifiesE2EE:self->_specifyE2EE];
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5004);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    *a3 = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isConfigurationValid
{
  unint64_t appList = self->_appList;
  if (appList == 2)
  {
    if (self->_specifyE2EE)
    {
      v3 = _CDPLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(CDPQuotaStorageRequestConfigurator *)v3 _isConfigurationValid];
      }
      goto LABEL_13;
    }
  }
  else if (appList == 1)
  {
    if (self->_specifyE2EE)
    {
      v3 = _CDPLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(CDPQuotaStorageRequestConfigurator *)v3 _isConfigurationValid];
      }
      goto LABEL_13;
    }
  }
  else if (!appList && !self->_specifyE2EE)
  {
    v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(CDPQuotaStorageRequestConfigurator *)v3 _isConfigurationValid];
    }
LABEL_13:

    return 0;
  }
  return 1;
}

- (void).cxx_destruct
{
}

- (void)_isConfigurationValid
{
  OUTLINED_FUNCTION_4(&dword_2187CF000, a1, a3, "Illegal configuration. App List: Stingray only, specifyE2EE == YES", a5, a6, a7, a8, 0);
}

@end