@interface CDPDBackupErrorProviderImpl
- (BOOL)supportsErrorPresentation;
- (CDPDBackupErrorProviderImpl)initWithContext:(id)a3 uiProvider:(id)a4;
- (id)cooldownErrorWithUnderlyingError:(id)a3;
- (id)globalHardLimitError;
- (id)globalHardLimitErrorWithRecord:(id)a3;
- (id)hardLimitErrorForRecord:(id)a3;
- (id)recordNotFoundErrorWithUnderlyingError:(id)a3;
- (id)verficationFailedErrorwithUnderlyingError:(id)a3;
- (void)handleHardLimitError:(id)a3 completion:(id)a4;
- (void)handleSoftLimitError:(id)a3 completion:(id)a4;
- (void)setPrevailingSecret:(unint64_t)a3;
@end

@implementation CDPDBackupErrorProviderImpl

- (CDPDBackupErrorProviderImpl)initWithContext:(id)a3 uiProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPDBackupErrorProviderImpl;
  v9 = [(CDPDBackupErrorProviderImpl *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_uiProvider, a4);
  }

  return v10;
}

- (BOOL)supportsErrorPresentation
{
  return 0;
}

- (void)setPrevailingSecret:(unint64_t)a3
{
  self->_prevailingSecret = a3;
}

- (id)cooldownErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  v4 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v6 = _CDPStateError();

  return v6;
}

- (id)globalHardLimitError
{
  return (id)_CDPStateError();
}

- (id)globalHardLimitErrorWithRecord:(id)a3
{
  return (id)_CDPStateError();
}

- (id)hardLimitErrorForRecord:(id)a3
{
  return (id)_CDPStateError();
}

- (id)verficationFailedErrorwithUnderlyingError:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v5 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"];
  v6 = [v5 localizedString];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];

  id v7 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_ICLOUD_CONNECTION_MESSAGE"];
  id v8 = [v7 localizedString];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08338]];

  v9 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v10 = [v9 localizedString];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08348]];

  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v11 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  objc_super v12 = [v11 localizedString];
  v16[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08340]];

  v14 = _CDPStateError();

  return v14;
}

- (id)recordNotFoundErrorWithUnderlyingError:(id)a3
{
  return (id)_CDPStateError();
}

- (void)handleHardLimitError:(id)a3 completion:(id)a4
{
}

- (void)handleSoftLimitError:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end