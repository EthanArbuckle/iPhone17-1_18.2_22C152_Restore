@interface CNEntitlementVerifierTestDouble
+ (id)keyForEntitlement:(id)a3;
+ (id)keyForEntitlement:(id)a3 auditToken:(id *)a4;
- (BOOL)BOOLeanResultForKey:(id)a3 error:(id *)a4;
- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4;
- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6;
- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5;
- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4;
- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5;
- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4;
- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3;
- (CNEntitlementVerifierTestDouble)init;
- (id)stringArrayResultForKey:(id)a3 error:(id *)a4;
- (id)valueForEntitlementForKey:(id)a3 error:(id *)a4;
- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5;
- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4;
- (void)setAuditToken:(id *)a3 allowsHighPriority:(BOOL)a4;
- (void)setAuditToken:(id *)a3 allowsHighPriorityError:(id)a4;
- (void)setAuditToken:(id *)a3 hasError:(id)a4 forEntitlement:(id)a5;
- (void)setAuditToken:(id *)a3 hasValue:(id)a4 forEntitlement:(id)a5;
- (void)setAuditToken:(id *)a3 isFirstOrSecondParty:(BOOL)a4;
- (void)setAuditToken:(id *)a3 isFirstOrSecondPartyError:(id)a4;
- (void)setCurrentProcessHasError:(id)a3 forEntitlement:(id)a4;
- (void)setCurrentProcessHasValue:(id)a3 forEntitlement:(id)a4;
@end

@implementation CNEntitlementVerifierTestDouble

- (CNEntitlementVerifierTestDouble)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNEntitlementVerifierTestDouble;
  v2 = [(CNEntitlementVerifierTestDouble *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entitlements = v2->_entitlements;
    v2->_entitlements = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setCurrentProcessHasValue:(id)a3 forEntitlement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(id)objc_opt_class() keyForEntitlement:v6];

  v8 = +[CNResult successWithValue:v7];

  [(NSMutableDictionary *)self->_entitlements setObject:v8 forKeyedSubscript:v9];
}

- (void)setCurrentProcessHasError:(id)a3 forEntitlement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(id)objc_opt_class() keyForEntitlement:v6];

  v8 = +[CNResult failureWithError:v7];

  [(NSMutableDictionary *)self->_entitlements setObject:v8 forKeyedSubscript:v9];
}

- (void)setAuditToken:(id *)a3 hasValue:(id)a4 forEntitlement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_class();
  long long v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  v12 = [v10 keyForEntitlement:v8 auditToken:v14];

  v13 = +[CNResult successWithValue:v9];

  [(NSMutableDictionary *)self->_entitlements setObject:v13 forKeyedSubscript:v12];
}

- (void)setAuditToken:(id *)a3 hasError:(id)a4 forEntitlement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_class();
  long long v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  v12 = [v10 keyForEntitlement:v8 auditToken:v14];

  v13 = +[CNResult failureWithError:v9];

  [(NSMutableDictionary *)self->_entitlements setObject:v13 forKeyedSubscript:v12];
}

- (void)setAuditToken:(id *)a3 isFirstOrSecondParty:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  id v9 = [v7 keyForEntitlement:@"__isFirstParty__" auditToken:v12];
  v10 = [NSNumber numberWithBool:v4];
  long long v11 = +[CNResult successWithValue:v10];
  [(NSMutableDictionary *)self->_entitlements setObject:v11 forKeyedSubscript:v9];
}

- (void)setAuditToken:(id *)a3 isFirstOrSecondPartyError:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  id v9 = [v7 keyForEntitlement:@"__isFirstParty__" auditToken:v11];
  v10 = +[CNResult failureWithError:v6];

  [(NSMutableDictionary *)self->_entitlements setObject:v10 forKeyedSubscript:v9];
}

- (void)setAuditToken:(id *)a3 allowsHighPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  id v9 = [v7 keyForEntitlement:@"__isHighPriorityAllowed__" auditToken:v12];
  v10 = [NSNumber numberWithBool:v4];
  long long v11 = +[CNResult successWithValue:v10];
  [(NSMutableDictionary *)self->_entitlements setObject:v11 forKeyedSubscript:v9];
}

- (void)setAuditToken:(id *)a3 allowsHighPriorityError:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  id v9 = [v7 keyForEntitlement:@"__isHighPriorityAllowed__" auditToken:v11];
  v10 = +[CNResult failureWithError:v6];

  [(NSMutableDictionary *)self->_entitlements setObject:v10 forKeyedSubscript:v9];
}

+ (id)keyForEntitlement:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (id)keyForEntitlement:(id)a3 auditToken:(id *)a4
{
  v5 = (void *)[a3 mutableCopy];
  for (uint64_t i = 0; i != 8; ++i)
  {
    [v5 appendString:@"-"];
    objc_msgSend(v5, "appendFormat:", @"%d", a4->var0[i]);
  }

  return v5;
}

- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() keyForEntitlement:v6];

  LOBYTE(a4) = [(CNEntitlementVerifierTestDouble *)self BOOLeanResultForKey:v7 error:a4];
  return (char)a4;
}

- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_opt_class();
  long long v10 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v10;
  long long v11 = [v9 keyForEntitlement:v8 auditToken:v13];

  LOBYTE(a5) = [(CNEntitlementVerifierTestDouble *)self BOOLeanResultForKey:v11 error:a5];
  return (char)a5;
}

- (BOOL)BOOLeanResultForKey:(id)a3 error:(id *)a4
{
  v5 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:a3];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isSuccess])
    {
      id v7 = [v6 value];
      char v8 = [v7 BOOLValue];
    }
    else
    {
      id v9 = [v6 error];
      id v7 = v9;
      if (a4)
      {
        id v7 = v9;
        char v8 = 0;
        *a4 = v7;
      }
      else
      {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __97__CNEntitlementVerifierTestDouble_currentProcessHasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v14[3] = &unk_1E569F590;
  v14[4] = self;
  v16 = &v17;
  id v10 = v8;
  id v15 = v10;
  char v11 = objc_msgSend(v9, "_cn_any:", v14);
  v12 = (void *)v18[5];
  if (v12)
  {
    char v11 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __97__CNEntitlementVerifierTestDouble_currentProcessHasArrayWithStringValue_forAnyEntitlement_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [(id)objc_opt_class() keyForEntitlement:v3];

  v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v5 stringArrayResultForKey:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = [v7 containsObject:a1[5]];

  return v8;
}

- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  long long v12 = *(_OWORD *)&a3->var0[4];
  long long v20 = *(_OWORD *)a3->var0;
  long long v21 = v12;
  v17[2] = __94__CNEntitlementVerifierTestDouble_auditToken_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v17[3] = &unk_1E569F5B8;
  v17[4] = self;
  uint64_t v19 = &v22;
  id v13 = v10;
  id v18 = v13;
  char v14 = objc_msgSend(v11, "_cn_any:", v17);
  id v15 = (void *)v23[5];
  if (v15)
  {
    char v14 = 0;
    if (a6) {
      *a6 = v15;
    }
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __94__CNEntitlementVerifierTestDouble_auditToken_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_class();
  long long v5 = *(_OWORD *)(a1 + 72);
  v13[0] = *(_OWORD *)(a1 + 56);
  v13[1] = v5;
  uint64_t v6 = [v4 keyForEntitlement:v3 auditToken:v13];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v7 stringArrayResultForKey:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = [v9 containsObject:*(void *)(a1 + 40)];

  return v10;
}

- (id)stringArrayResultForKey:(id)a3 error:(id *)a4
{
  long long v5 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isSuccess])
    {
      id v7 = [v6 value];
      goto LABEL_8;
    }
    uint64_t v8 = [v6 error];
    id v9 = v8;
    if (a4) {
      *a4 = v8;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  long long v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__CNEntitlementVerifierTestDouble_valuesForCurrentProcessForEntitlements_error___block_invoke;
  v10[3] = &unk_1E569F5E0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  objc_msgSend(v6, "_cn_each:", v10);
  id v7 = (void *)v18[5];
  if (v7)
  {
    id v8 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    id v8 = (id)v12[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __80__CNEntitlementVerifierTestDouble_valuesForCurrentProcessForEntitlements_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [(id)objc_opt_class() keyForEntitlement:v3];
  long long v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v5 valueForEntitlementForKey:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v7 forKey:v3];
  }
}

- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  long long v20 = __Block_byref_object_dispose__0;
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  long long v9 = *(_OWORD *)&a3->var0[4];
  long long v14 = *(_OWORD *)a3->var0;
  long long v15 = v9;
  _OWORD v13[2] = __77__CNEntitlementVerifierTestDouble_valuesForAuditToken_forEntitlements_error___block_invoke;
  v13[3] = &unk_1E569F608;
  v13[4] = self;
  v13[5] = &v22;
  v13[6] = &v16;
  objc_msgSend(v8, "_cn_each:", v13);
  uint64_t v10 = (void *)v23[5];
  if (v10)
  {
    id v11 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    id v11 = (id)v17[5];
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v11;
}

void __77__CNEntitlementVerifierTestDouble_valuesForAuditToken_forEntitlements_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_class();
  long long v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  uint64_t v6 = [v4 keyForEntitlement:v3 auditToken:v11];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  long long v9 = [v7 valueForEntitlementForKey:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v9 forKey:v3];
  }
}

- (id)valueForEntitlementForKey:(id)a3 error:(id *)a4
{
  long long v5 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isSuccess])
    {
      id v7 = [v6 value];
      goto LABEL_8;
    }
    uint64_t v8 = [v6 error];
    long long v9 = v8;
    if (a4) {
      *a4 = v8;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3
{
  long long v5 = [(id)objc_opt_class() keyForEntitlement:@"__isFirstParty__"];
  uint64_t v6 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    if ([v6 isSuccess])
    {
      id v8 = [v7 value];
      char v9 = [v8 BOOLValue];
    }
    else
    {
      uint64_t v10 = [v7 error];
      id v8 = v10;
      if (a3)
      {
        id v8 = v10;
        char v9 = 0;
        *a3 = v8;
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v8;
  char v9 = [v7 keyForEntitlement:@"__isFirstParty__" auditToken:v16];
  uint64_t v10 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10)
  {
    if ([v10 isSuccess])
    {
      id v12 = [v11 value];
      char v13 = [v12 BOOLValue];
    }
    else
    {
      long long v14 = [v11 error];
      id v12 = v14;
      if (a4)
      {
        id v12 = v14;
        char v13 = 0;
        *a4 = v12;
      }
      else
      {
        char v13 = 0;
      }
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4
{
  id v7 = objc_opt_class();
  long long v8 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v8;
  char v9 = [v7 keyForEntitlement:@"__isHighPriorityAllowed__" auditToken:v16];
  uint64_t v10 = [(NSMutableDictionary *)self->_entitlements objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10)
  {
    if ([v10 isSuccess])
    {
      id v12 = [v11 value];
      char v13 = [v12 BOOLValue];
    }
    else
    {
      long long v14 = [v11 error];
      id v12 = v14;
      if (a4)
      {
        id v12 = v14;
        char v13 = 0;
        *a4 = v12;
      }
      else
      {
        char v13 = 0;
      }
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end