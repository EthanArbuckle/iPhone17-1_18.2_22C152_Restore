@interface VSAccountsArchive
+ (BOOL)supportsSecureCoding;
- (NSArray)accounts;
- (VSAccountChannels)channels;
- (VSAccountsArchive)init;
- (VSAccountsArchive)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setChannels:(id)a3;
@end

@implementation VSAccountsArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAccountsArchive)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSAccountsArchive;
  v2 = [(VSAccountsArchive *)&v6 init];
  v3 = v2;
  if (v2)
  {
    accounts = v2->_accounts;
    v2->_accounts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (VSAccountsArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v17.receiver = self;
  v17.super_class = (Class)VSAccountsArchive;
  v5 = [(VSAccountsArchive *)&v17 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accounts"];

    if (v9)
    {
      uint64_t v10 = [v9 copy];
      accounts = v5->_accounts;
      v5->_accounts = (NSArray *)v10;
    }
    else
    {
      accounts = v5->_accounts;
      v5->_accounts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channels"];
    if (v12)
    {
      v13 = +[VSAccountChannels deserializationResultWithData:v12];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __35__VSAccountsArchive_initWithCoder___block_invoke;
      v15[3] = &unk_1E6BD3AE0;
      v16 = v5;
      [v13 unwrapObject:v15 error:&__block_literal_global_29];
    }
  }

  return v5;
}

uint64_t __35__VSAccountsArchive_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

void __35__VSAccountsArchive_initWithCoder___block_invoke_2()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __35__VSAccountsArchive_initWithCoder___block_invoke_2_cold_1(v0);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = [(VSAccountsArchive *)self accounts];
  [v4 encodeObject:v5 forKey:@"accounts"];

  id v8 = [(VSAccountsArchive *)self channels];
  objc_super v6 = [v8 serializationResultWithFormat:200];
  uint64_t v7 = [v6 object];
  [v4 encodeObject:v7 forKey:@"channels"];
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (VSAccountChannels)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

void __35__VSAccountsArchive_initWithCoder___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Error deserializing account channels: error", v1, 2u);
}

@end