@interface IMDIDSAccount
- (BOOL)canMakeDowngradeRoutingChecks;
- (BOOL)multiplePhoneNumbersTiedToAccount;
- (IDSAccount)idsAccount;
- (IMDIDSAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5 idsAccount:(id)a6;
- (id)accountDefaults;
- (id)description;
- (void)writeAccountDefaults:(id)a3;
@end

@implementation IMDIDSAccount

- (IMDIDSAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5 idsAccount:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IMDIDSAccount;
  v12 = [(IMDAccount *)&v15 initWithAccountID:a3 defaults:a4 service:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_idsAccount, a6);
  }

  return v13;
}

- (void)writeAccountDefaults:(id)a3
{
  id v4 = a3;
  if ([(IDSAccount *)self->_idsAccount accountType] != 2)
  {
    v5 = [(IMDAccount *)self service];
    int v6 = [v5 canManageRegistration];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1D9905BE8();
      }

      if ([v4 count])
      {
        v8 = (void *)[v4 mutableCopy];
        uint64_t v9 = *MEMORY[0x1E4F6C738];
        uint64_t v10 = [v8 objectForKey:*MEMORY[0x1E4F6C738]];
        if (v10)
        {
          id v11 = (void *)v10;
          v12 = [MEMORY[0x1E4F6C3B8] registration];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            sub_1D9905B80();
          }

          v13 = MEMORY[0x1E0169B80](v11);

          if ([v13 length])
          {
            [v8 setObject:v13 forKey:v9];
            v14 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              sub_1D9905B18();
            }
          }
          else
          {
            [v8 removeObjectForKey:v9];
            v14 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              sub_1D9905AB0();
            }
          }
        }
        else
        {
          v13 = 0;
        }
        [(IDSAccount *)self->_idsAccount updateAccountWithAccountInfo:v8];
      }
    }
  }
}

- (id)accountDefaults
{
  v3 = [(IDSAccount *)self->_idsAccount accountInfo];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x1E4F6B758];
  int v6 = [v4 objectForKey:*MEMORY[0x1E4F6B758]];
  v7 = [(IMDAccount *)self service];
  v8 = objc_msgSend(v7, "imdAccountLoginFromIDSAccountWithType:login:", -[IDSAccount accountType](self->_idsAccount, "accountType"), v6);

  [v4 setObject:v8 forKey:v5];

  return v4;
}

- (BOOL)canMakeDowngradeRoutingChecks
{
  v2 = [(IMDIDSAccount *)self idsAccount];
  BOOL v3 = [v2 accountType] == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(IMDAccount *)self accountID];
  uint64_t v5 = [(IMDIDSAccount *)self idsAccount];
  int v6 = [v3 stringWithFormat:@"<IMDIDSAccount:%p, ID:%@, idsAccount:%@ >", self, v4, v5];

  return v6;
}

- (BOOL)multiplePhoneNumbersTiedToAccount
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(IMDIDSAccount *)self idsAccount];
  BOOL v3 = [v2 devices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  BOOL v5 = v4 != 0;
  if (v4)
  {
    uint64_t v6 = v4;
    unsigned __int8 v7 = 0;
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) linkedUserURIs];
        uint64_t v11 = [v10 count];

        if (((v11 != 0) & v7) != 0) {
          goto LABEL_20;
        }
        v7 |= v11 != 0;
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if (v7)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v12 = +[IMDAccountController sharedInstance];
      BOOL v3 = [v12 accounts];

      uint64_t v13 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (!v13)
      {
LABEL_19:
        BOOL v5 = 0;
        goto LABEL_21;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v3);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = [v17 idsAccount];
          int v19 = [v18 accountType];

          if (!v19) {
            break;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14) {
            goto LABEL_12;
          }
          goto LABEL_19;
        }
      }
LABEL_20:
      BOOL v5 = 1;
      goto LABEL_21;
    }
    return 0;
  }
  else
  {
LABEL_21:
  }
  return v5;
}

- (IDSAccount)idsAccount
{
  return self->_idsAccount;
}

- (void).cxx_destruct
{
}

@end