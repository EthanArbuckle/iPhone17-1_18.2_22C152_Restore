@interface CDPDLocalSecretFollowUpProviderImpl
- (CDPDLocalSecretFollowUpProviderImpl)init;
- (CDPDLocalSecretFollowUpProviderImpl)initWithAltDSID:(id)a3;
- (void)deleteConfirmExistingSecretFollowUp;
- (void)deleteCreatePasscodeFollowUp;
- (void)deleteLocalSecretChangeFollowUp;
- (void)postConfirmExistingSecretFollowUp;
- (void)postLocalSecretChangeFollowUp;
- (void)postRepairFollowUp;
@end

@implementation CDPDLocalSecretFollowUpProviderImpl

- (CDPDLocalSecretFollowUpProviderImpl)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v6 = [(CDPDLocalSecretFollowUpProviderImpl *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (CDPDLocalSecretFollowUpProviderImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPDLocalSecretFollowUpProviderImpl;
  return [(CDPDLocalSecretFollowUpProviderImpl *)&v3 init];
}

- (void)postRepairFollowUp
{
  id v4 = [MEMORY[0x263F34388] contextForStateRepair];
  [v4 setAltDSID:self->_altDSID];
  objc_super v3 = +[CDPDFollowUpController sharedInstance];
  [v3 postFollowUpItemForContext:v4 error:0];
}

- (void)postLocalSecretChangeFollowUp
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F34388] contextForOfflinePasscodeChange];
  [v3 setAltDSID:self->_altDSID];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 altDSID];
    int v7 = 141558274;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "postLocalSecretChangeFollowUp: altDSID:%{mask.hash}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = +[CDPDFollowUpController sharedInstance];
  [v6 postFollowUpItemForContext:v3 error:0];
}

- (void)deleteLocalSecretChangeFollowUp
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F34388] contextForOfflinePasscodeChange];
  [v3 setAltDSID:self->_altDSID];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 altDSID];
    int v7 = 141558274;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "deleteLocalSecretChangeFollowUp: altDSID:%{mask.hash}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = +[CDPDFollowUpController sharedInstance];
  [v6 clearFollowUpWithContext:v3 error:0];
}

- (void)postConfirmExistingSecretFollowUp
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F34388] contextForConfirmExistingSecret];
  [v3 setAltDSID:self->_altDSID];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 altDSID];
    int v7 = 141558274;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "postConfirmExistingSecretFollowUp: altDSID:%{mask.hash}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = +[CDPDFollowUpController sharedInstance];
  [v6 postFollowUpItemForContext:v3 error:0];
}

- (void)deleteConfirmExistingSecretFollowUp
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F34388] contextForConfirmExistingSecret];
  [v3 setAltDSID:self->_altDSID];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 altDSID];
    int v7 = 141558274;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "deleteConfirmExistingSecretFollowUp: altDSID:%{mask.hash}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = +[CDPDFollowUpController sharedInstance];
  [v6 clearFollowUpWithContext:v3 error:0];
}

- (void)deleteCreatePasscodeFollowUp
{
  objc_super v3 = (void *)MEMORY[0x263F34388];
  id v4 = objc_alloc_init(MEMORY[0x263F34350]);
  id v6 = [v3 contextForWalrusCreatePasscodeWithCDPContext:v4];

  [v6 setAltDSID:self->_altDSID];
  id v5 = +[CDPDFollowUpController sharedInstance];
  [v5 clearFollowUpWithContext:v6 error:0];
}

- (void).cxx_destruct
{
}

@end