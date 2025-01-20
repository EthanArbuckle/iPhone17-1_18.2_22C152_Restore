@interface IMUserVaultTransaction
- (IMUserVaultTransaction)init;
- (NSURL)url;
- (id)uvTransaction;
- (void)setUvTransaction:(id)a3;
@end

@implementation IMUserVaultTransaction

- (IMUserVaultTransaction)init
{
  v3 = (objc_class *)MEMORY[0x1A6227910](@"UVTransaction", @"UserVault");
  if ([(objc_class *)v3 instancesRespondToSelector:sel_initWithResource_error_])
  {
    id v12 = 0;
    v4 = (void *)[[v3 alloc] initWithResource:@"com.apple.messages" error:&v12];
    v5 = v12;
    v6 = IMLogHandleForCategory("IMUserVaultTransaction");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v7) {
        sub_1A09EF65C((uint64_t)v4, v6);
      }
    }
    else if (v7)
    {
      sub_1A09EF5E4((uint64_t)v5, v6);
    }
  }
  else
  {
    v5 = IMLogHandleForCategory("IMUserVaultTransaction");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF6D4(v5);
    }
    v4 = 0;
  }

  v11.receiver = self;
  v11.super_class = (Class)IMUserVaultTransaction;
  v8 = [(IMUserVaultTransaction *)&v11 init];
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_uvTransaction, v4);
  }

  return v9;
}

- (NSURL)url
{
  v3 = [(IMUserVaultTransaction *)self uvTransaction];
  char v4 = objc_opt_respondsToSelector();

  v5 = [(IMUserVaultTransaction *)self uvTransaction];
  id v6 = v5;
  if (v4)
  {
    BOOL v7 = [v5 url];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {

    if (v6)
    {
      v8 = IMLogHandleForCategory("IMUserVaultTransaction");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1A09EF718(v8);
      }

      id v6 = 0;
    }
  }

  return (NSURL *)v6;
}

- (id)uvTransaction
{
  return self->_uvTransaction;
}

- (void)setUvTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end