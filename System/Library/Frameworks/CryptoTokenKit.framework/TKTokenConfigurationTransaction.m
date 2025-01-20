@interface TKTokenConfigurationTransaction
- (TKTokenConfigurationTransaction)initWithConfigurationConnection:(id)a3;
- (void)commit;
- (void)dealloc;
@end

@implementation TKTokenConfigurationTransaction

- (TKTokenConfigurationTransaction)initWithConfigurationConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenConfigurationTransaction;
  v6 = [(TKTokenConfigurationTransaction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationConnection, a3);
  }

  return v7;
}

- (void)commit
{
  configurationConnection = self->_configurationConnection;
  if (!configurationConnection)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"TKTokenConfiguration.m" lineNumber:97 description:@"Double-commit of transaction"];

    configurationConnection = self->_configurationConnection;
  }
  v4 = [(TKTokenConfigurationConnection *)configurationConnection configurationProtocol];
  [v4 endTransactionWithReply:&__block_literal_global_82];

  id v5 = self->_configurationConnection;
  self->_configurationConnection = 0;
}

- (void)dealloc
{
  if (self->_configurationConnection)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"TKTokenConfiguration.m" lineNumber:103 description:@"Destroying uncommited transaction"];
  }
  v5.receiver = self;
  v5.super_class = (Class)TKTokenConfigurationTransaction;
  [(TKTokenConfigurationTransaction *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

@end