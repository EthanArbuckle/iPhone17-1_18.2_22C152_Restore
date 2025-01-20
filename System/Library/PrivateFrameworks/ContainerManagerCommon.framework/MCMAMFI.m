@interface MCMAMFI
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:(id)a3 teamID:(id)a4;
- (Class)lwcrClass;
- (MCMAMFI)initWithAuditToken:(id *)a3;
- (id)_encodeRequirement:(id)a3 name:(id)a4;
- (id)_encodedQueriesWithContainerConfig:(id)a3 teamID:(id)a4;
- (id)_requirementForProfileValidatedEntitlements;
- (id)_requirementForTeamID:(id)a3;
- (id)_requirementForValidationCategory:(id)a3;
- (id)_requirementForiOSPlatform;
- (void)setLWCRClass:(Class)a3;
@end

@implementation MCMAMFI

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setLWCRClass:(Class)a3
{
  self->_lwcrClass = a3;
}

- (Class)lwcrClass
{
  Class lwcrClass = self->_lwcrClass;

  return lwcrClass;
}

- (id)_encodedQueriesWithContainerConfig:(id)a3 teamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 honorGroupContainerEntitlementForAppStoreSigned])
  {
    v9 = [(MCMAMFI *)self _requirementForValidationCategory:&unk_1F2F10FE8];
    uint64_t v10 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"MAS"];
    if (!v10) {
      goto LABEL_23;
    }
    v11 = (void *)v10;
    [v8 addObject:v10];
  }
  if ([v6 honorGroupContainerEntitlementForPlatformBinary])
  {
    v9 = [(MCMAMFI *)self _requirementForValidationCategory:&unk_1F2F11000];
    uint64_t v12 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"platform binary"];
    if (!v12) {
      goto LABEL_23;
    }
    v13 = (void *)v12;
    [v8 addObject:v12];
  }
  if ([v6 honorGroupContainerEntitlementForProfileValidatedEntitlements])
  {
    v9 = [(MCMAMFI *)self _requirementForProfileValidatedEntitlements];
    uint64_t v14 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"profile validated entitlements"];
    if (!v14) {
      goto LABEL_23;
    }
    v15 = (void *)v14;
    [v8 addObject:v14];
  }
  if ([v6 honorGroupContainerEntitlementForMatchingTeamIDPrefix])
  {
    v9 = [(MCMAMFI *)self _requirementForTeamID:v7];
    if (v9)
    {
      uint64_t v16 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"team ID prefix"];
      if (!v16) {
        goto LABEL_23;
      }
      v17 = (void *)v16;
      [v8 addObject:v16];
    }
  }
  if ([v6 honorGroupContainerEntitlementForiPadAppsOnMac])
  {
    v9 = [(MCMAMFI *)self _requirementForiOSPlatform];
    uint64_t v18 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"iPad app"];
    if (!v18) {
      goto LABEL_23;
    }
    v19 = (void *)v18;
    [v8 addObject:v18];
  }
  if (![v6 honorGroupContainerEntitlementForTestFlight]) {
    goto LABEL_21;
  }
  v9 = [(MCMAMFI *)self _requirementForValidationCategory:&unk_1F2F10FB8];
  uint64_t v20 = [(MCMAMFI *)self _encodeRequirement:v9 name:@"TestFlight"];
  if (v20)
  {
    v21 = (void *)v20;
    [v8 addObject:v20];

LABEL_21:
    if ([v8 count]) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_23:

  v8 = v9;
LABEL_24:

  v8 = 0;
LABEL_25:

  return v8;
}

- (id)_encodeRequirement:(id)a3 name:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  v8 = [(objc_class *)[(MCMAMFI *)self lwcrClass] withVersion:1 withConstraintCategory:0 withRequirements:v6 withError:&v15];
  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = [v8 externalRepresentation];
    v11 = [[MCMAMFIEncodedQuery alloc] initWithLoggingName:v7 encodedQuery:v10];
  }
  else
  {
    uint64_t v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Could not construct LWCR for requirement %@; error = %@",
        buf,
        0x16u);
    }

    uint64_t v10 = 0;
    v11 = 0;
  }
  v13 = v11;

  return v13;
}

- (id)_requirementForProfileValidatedEntitlements
{
  return &unk_1F2F10EF0;
}

- (id)_requirementForiOSPlatform
{
  return &unk_1F2F10EA0;
}

- (id)_requirementForValidationCategory:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"validation-category";
  v8[0] = a3;
  long long v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)_requirementForTeamID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v10 = @"$optional";
    v8 = @"team-identifier";
    long long v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v11[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:(id)a3 teamID:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MCMAMFI *)self auditToken];
  int pid = container_audit_token_get_pid();
  v8 = (void *)MEMORY[0x1D9478DF0]();
  if ([(MCMAMFI *)self lwcrClass])
  {
    id v9 = [(MCMAMFI *)self _encodedQueriesWithContainerConfig:v6 teamID:v7];
    if (v9)
    {
      context = v8;
      id v26 = v7;
      id v27 = v6;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            bzero(v39, 0x404uLL);
            [(MCMAMFI *)self auditToken];
            id v16 = [v15 encodedQuery];
            [v16 bytes];
            id v17 = [v15 encodedQuery];
            [v17 length];
            int v18 = amfi_launch_constraint_matches_process();

            id v19 = container_log_handle_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              if (v18) {
                uint64_t v20 = "passed";
              }
              else {
                uint64_t v20 = "insufficient for";
              }
              v21 = [v15 loggingName];
              *(_DWORD *)buf = 136316162;
              v30 = v20;
              __int16 v31 = 2112;
              v32 = v21;
              __int16 v33 = 1024;
              int v34 = pid;
              __int16 v35 = 1024;
              int v36 = *(_DWORD *)v39;
              __int16 v37 = 2080;
              v38 = &v40;
              _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "Signature %s strict scrutiny; test = %@, int pid = %d, error = (%d) %s",
                buf,
                0x2Cu);
            }
            if (v18)
            {

              BOOL v23 = 1;
              id v7 = v26;
              id v6 = v27;
              goto LABEL_21;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v41 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v7 = v26;
      id v6 = v27;
      v8 = context;
    }
  }
  v22 = container_log_handle_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v39 = 67109120;
    int v40 = pid;
    _os_log_impl(&dword_1D7739000, v22, OS_LOG_TYPE_DEFAULT, "Requestor's signature did not pass strict scrutiny; int pid = %d",
      v39,
      8u);
  }

  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (MCMAMFI)initWithAuditToken:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MCMAMFI;
  id v4 = [(MCMAMFI *)&v8 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    v4->_Class lwcrClass = (Class)objc_opt_class();
  }
  return v5;
}

@end