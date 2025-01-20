@interface MFMailAccountProxyGenerator
- (MFMailAccountProxyGenerator)init;
- (MFMailAccountProxyGenerator)initWithAllowsRestrictedAccounts:(BOOL)a3;
- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4;
- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4 originatingBundleID:(id)a5 sourceAccountManagement:(int)a6;
- (id)activeAccountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (id)allAccountProxies;
- (id)defaultMailAccountProxyForDeliveryOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4;
@end

@implementation MFMailAccountProxyGenerator

- (MFMailAccountProxyGenerator)init
{
  return [(MFMailAccountProxyGenerator *)self initWithAllowsRestrictedAccounts:0];
}

- (MFMailAccountProxyGenerator)initWithAllowsRestrictedAccounts:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFMailAccountProxyGenerator;
  v4 = [(MFMailAccountProxyGenerator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_allowsRestrictedAccounts = a3;
    v6 = objc_alloc_init(_MFMailAccountProxySource);
    proxySource = v5->_proxySource;
    v5->_proxySource = v6;
  }
  return v5;
}

- (id)defaultMailAccountProxyForDeliveryOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = [(_MFMailAccountProxySource *)self->_proxySource accountProxiesOriginatingBundleID:v6 sourceAccountManagement:v4];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 _isActive]
          && (self->_allowsRestrictedAccounts || ([v12 _isRestricted] & 1) == 0))
        {
          if ([v12 isDefaultDeliveryAccount])
          {
            unint64_t v13 = v12;
            goto LABEL_17;
          }
          if (!v9) {
            unint64_t v9 = v12;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = 0;
    unint64_t v9 = 0;
  }
LABEL_17:

  if (!(v13 | v9))
  {
    v14 = +[MFMailAccountProxy log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "defaultAccount, firstUnrestrictedAccount are nil", v18, 2u);
    }
  }
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = (void *)v9;
  }
  id v16 = v15;

  return v16;
}

- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  uint64_t v4 = [(MFMailAccountProxyGenerator *)self accountProxyContainingEmailAddress:a3 includingInactive:a4 originatingBundleID:0 sourceAccountManagement:0];

  return v4;
}

- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4 originatingBundleID:(id)a5 sourceAccountManagement:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v8 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v41 = v11;
  if (v8) {
    [(MFMailAccountProxyGenerator *)self allAccountProxies];
  }
  else {
  v12 = [(MFMailAccountProxyGenerator *)self activeAccountProxiesOriginatingBundleID:v11 sourceAccountManagement:v6];
  }
  id v13 = v10;
  v14 = [v13 emailAddressValue];
  v15 = [v14 simpleAddress];
  id v16 = v15;
  if (v15)
  {
    id v48 = v15;
  }
  else
  {
    id v48 = [v13 stringValue];
  }

  id v17 = v13;
  v18 = [v17 emailAddressValue];
  long long v19 = [v18 displayName];
  long long v20 = v19;
  if (v19)
  {
    id v46 = v19;
  }
  else
  {
    id v46 = [v17 stringValue];
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v12;
  uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  v40 = v17;
  if (!v21)
  {
    v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_40;
  }
  uint64_t v22 = v21;
  v23 = 0;
  uint64_t v24 = 0;
  uint64_t v43 = *(void *)v54;
  do
  {
    uint64_t v44 = v22;
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v54 != v43) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      v26 = [v25 _emailAddressesAndAliases];
      v27 = objc_msgSend(v26, "ef_map:", &__block_literal_global_19);

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v47 = v27;
      uint64_t v28 = [v47 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v50 != v29) {
              objc_enumerationMutation(v47);
            }
            if (![*(id *)(*((void *)&v49 + 1) + 8 * j) caseInsensitiveCompare:v48])
            {
              uint64_t v31 = [v25 fullUserName];
              v32 = (void *)v31;
              if (v46 && (!v31 || [v46 caseInsensitiveCompare:v31]))
              {
                if (v24)
                {
                  v33 = v24;
                  v34 = v24;
                  v35 = v23;
                  uint64_t v24 = v25;
                  if (![v25 isDefaultDeliveryAccount]) {
                    goto LABEL_33;
                  }
                }
                else
                {
                  v34 = 0;
                  uint64_t v24 = v25;
                }
              }
              else if (v23)
              {
                v35 = v23;
                v34 = v23;
                v23 = v25;
                v33 = v24;
                if (([v25 isDefaultDeliveryAccount] & 1) == 0) {
                  goto LABEL_33;
                }
              }
              else
              {
                v34 = 0;
                v23 = v25;
              }
              id v36 = v25;

              v35 = v23;
              v33 = v24;
LABEL_33:

              v23 = v35;
              uint64_t v24 = v33;
              continue;
            }
          }
          uint64_t v28 = [v47 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v28);
      }
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  }
  while (v22);
LABEL_40:

  if (v23) {
    v37 = v23;
  }
  else {
    v37 = v24;
  }
  id v38 = v37;

  return v38;
}

id __128__MFMailAccountProxyGenerator_accountProxyContainingEmailAddress_includingInactive_originatingBundleID_sourceAccountManagement___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 emailAddressValue];
  uint64_t v4 = [v3 simpleAddress];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  v7 = v6;

  return v7;
}

- (id)activeAccountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v8 = -[_MFMailAccountProxySource accountProxiesOriginatingBundleID:sourceAccountManagement:](self->_proxySource, "accountProxiesOriginatingBundleID:sourceAccountManagement:", v6, v4, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 _isActive]
          && (self->_allowsRestrictedAccounts || ([v12 _isRestricted] & 1) == 0))
        {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)allAccountProxies
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = -[_MFMailAccountProxySource accountProxiesOriginatingBundleID:sourceAccountManagement:](self->_proxySource, "accountProxiesOriginatingBundleID:sourceAccountManagement:", 0, 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (self->_allowsRestrictedAccounts
          || ([*(id *)(*((void *)&v10 + 1) + 8 * i) _isRestricted] & 1) == 0)
        {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end