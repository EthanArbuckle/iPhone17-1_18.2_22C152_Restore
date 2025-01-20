@interface AMSSecureCodableError
- (BOOL)_secureCodingSupportedByObject:(id)a3;
- (id)_secureCodableUserInfoDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSSecureCodableError

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  v6 = [(AMSSecureCodableError *)self domain];
  uint64_t v7 = [(AMSSecureCodableError *)self code];
  v8 = [(AMSSecureCodableError *)self _secureCodableUserInfoDictionary];
  id v9 = [v4 errorWithDomain:v6 code:v7 userInfo:v8];

  [v9 encodeWithCoder:v5];
}

- (id)_secureCodableUserInfoDictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [(AMSSecureCodableError *)self userInfo];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = @"NSErrorPeerCertificateChainKey";
    v18[1] = @"NSErrorClientCertificateChainKey";
    uint64_t v5 = *MEMORY[0x1E4F28A50];
    v18[2] = *MEMORY[0x1E4F289B8];
    v18[3] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    uint64_t v7 = [v4 setWithArray:v6];

    v8 = objc_opt_new();
    id v9 = [(AMSSecureCodableError *)self userInfo];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke;
    v14[3] = &unk_1E55A6320;
    id v15 = v7;
    id v10 = v8;
    id v16 = v10;
    v17 = self;
    id v11 = v7;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];

    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

void __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([a1[4] containsObject:v5] & 1) == 0)
  {
    id v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;

      if (v8)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_2;
        v18[3] = &unk_1E559F720;
        v18[4] = a1[6];
        id v9 = objc_msgSend(v8, "ams_filterUsingTest:", v18);
        [a1[5] setObject:v9 forKeyedSubscript:v5];

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v10 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;

      if (v11)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_3;
        v17[3] = &unk_1E55A2388;
        v17[4] = a1[6];
        id v12 = objc_msgSend(v11, "ams_filterUsingTest:", v17);
        [a1[5] setObject:v12 forKeyedSubscript:v5];

LABEL_16:
        id v8 = 0;
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v13 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;

      if (v14)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_4;
        v16[3] = &unk_1E559F720;
        v16[4] = a1[6];
        id v15 = objc_msgSend(v14, "ams_filterUsingTest:", v16);
        [a1[5] setObject:v15 forKeyedSubscript:v5];

        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([a1[6] _secureCodingSupportedByObject:v13]) {
      [a1[5] setObject:v13 forKeyedSubscript:v5];
    }
    goto LABEL_16;
  }
LABEL_18:
}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _secureCodingSupportedByObject:a2];
}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_secureCodingSupportedByObject:");
}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _secureCodingSupportedByObject:a2];
}

- (BOOL)_secureCodingSupportedByObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() supportsSecureCoding])
  {
    char v4 = [v3 conformsToProtocol:&unk_1EDD03758];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

@end