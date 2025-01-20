@interface CNEntitlementVerifier
- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4;
- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6;
- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5;
- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4;
- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5;
- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4;
- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3;
- (BOOL)secTask:(__SecTask *)a3 allowsHighPriorityWithError:(id *)a4;
- (BOOL)secTask:(__SecTask *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6;
- (BOOL)secTask:(__SecTask *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5;
- (BOOL)secTask:(__SecTask *)a3 isFirstOrSecondPartyWithError:(id *)a4;
- (id)highPriorityBundleIdentifiers;
- (id)secTask:(__SecTask *)a3 valuesForEntitlements:(id)a4 error:(id *)a5;
- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5;
- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4;
@end

@implementation CNEntitlementVerifier

- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v19.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v19.val[4] = v12;
  SecTaskRef v13 = SecTaskCreateWithAuditToken(0, &v19);
  if (v13)
  {
    SecTaskRef v14 = v13;
    BOOL v15 = [(CNEntitlementVerifier *)self secTask:v13 hasArrayWithStringValue:v10 forAnyEntitlement:v11 error:a6];
    CFRelease(v14);
  }
  else
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    v17 = v16;
    if (a6) {
      *a6 = v16;
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  SecTaskRef v10 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v10)
  {
    SecTaskRef v11 = v10;
    BOOL v12 = [(CNEntitlementVerifier *)self secTask:v10 hasArrayWithStringValue:v8 forAnyEntitlement:v9 error:a5];
    CFRelease(v11);
  }
  else
  {
    SecTaskRef v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    SecTaskRef v14 = v13;
    if (a5) {
      *a5 = v13;
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v14.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v14.val[4] = v7;
  SecTaskRef v8 = SecTaskCreateWithAuditToken(v6, &v14);
  if (v8)
  {
    SecTaskRef v9 = v8;
    BOOL v10 = [(CNEntitlementVerifier *)self secTask:v8 allowsHighPriorityWithError:a4];
    CFRelease(v9);
  }
  else
  {
    SecTaskRef v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    BOOL v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    return 0;
  }
  return v10;
}

- (BOOL)secTask:(__SecTask *)a3 allowsHighPriorityWithError:(id *)a4
{
  CFAllocatorRef v6 = (__CFString *)SecTaskCopySigningIdentifier(a3, 0);
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v6))
  {
    long long v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    id v8 = v7;
    if (a4)
    {
      id v8 = v7;
      char v9 = 0;
      *a4 = v8;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    id v8 = [(CNEntitlementVerifier *)self highPriorityBundleIdentifiers];
    char v9 = [v8 containsObject:v6];
  }

  return v9;
}

- (BOOL)secTask:(__SecTask *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__CNEntitlementVerifier_secTask_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v15[3] = &unk_1E569F568;
  v17 = &v19;
  v18 = a3;
  id v11 = v9;
  id v16 = v11;
  char v12 = objc_msgSend(v10, "_cn_any:", v15);
  SecTaskRef v13 = (void *)v20[5];
  if (v13)
  {
    char v12 = 0;
    if (a6) {
      *a6 = v13;
    }
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __81__CNEntitlementVerifier_secTask_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke(uint64_t a1, const __CFString *a2)
{
  CFErrorRef error = 0;
  v3 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 48), a2, &error);
  if (error)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = error;
    CFAllocatorRef v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v3 containsObject:*(void *)(a1 + 32)];
  }

  return v7;
}

- (id)highPriorityBundleIdentifiers
{
  if (highPriorityBundleIdentifiers_cn_once_token_1[0] != -1) {
    dispatch_once(highPriorityBundleIdentifiers_cn_once_token_1, &__block_literal_global_4);
  }
  v2 = (void *)highPriorityBundleIdentifiers_cn_once_object_1;

  return v2;
}

- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a4;
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v9;
  SecTaskRef v10 = SecTaskCreateWithAuditToken(0, &v16);
  if (v10)
  {
    SecTaskRef v11 = v10;
    BOOL v12 = [(CNEntitlementVerifier *)self secTask:v10 hasBooleanEntitlement:v8 error:a5];
    CFRelease(v11);
  }
  else
  {
    SecTaskRef v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    audit_token_t v14 = v13;
    if (a5) {
      *a5 = v13;
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  SecTaskRef v7 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v7)
  {
    SecTaskRef v8 = v7;
    BOOL v9 = [(CNEntitlementVerifier *)self secTask:v7 hasBooleanEntitlement:v6 error:a4];
    CFRelease(v8);
  }
  else
  {
    SecTaskRef v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    SecTaskRef v11 = v10;
    if (a4) {
      *a4 = v10;
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)secTask:(__SecTask *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  CFErrorRef error = 0;
  id v6 = (void *)SecTaskCopyValueForEntitlement(a3, (CFStringRef)a4, &error);
  if (a5) {
    *a5 = error;
  }
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v14.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v14.val[4] = v7;
  SecTaskRef v8 = SecTaskCreateWithAuditToken(v6, &v14);
  if (v8)
  {
    SecTaskRef v9 = v8;
    BOOL v10 = [(CNEntitlementVerifier *)self secTask:v8 isFirstOrSecondPartyWithError:a4];
    CFRelease(v9);
  }
  else
  {
    SecTaskRef v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    BOOL v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    return 0;
  }
  return v10;
}

- (BOOL)secTask:(__SecTask *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  v5 = (__CFString *)SecTaskCopySigningIdentifier(a3, 0);
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v5))
  {
    CFAllocatorRef v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    long long v7 = v6;
    if (a4) {
      *a4 = v6;
    }

    char v8 = 0;
  }
  else
  {
    char v8 = [(__CFString *)v5 hasPrefix:@"com.apple."];
  }

  return v8;
}

- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  SecTaskRef v7 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v7)
  {
    SecTaskRef v8 = v7;
    SecTaskRef v9 = [(CNEntitlementVerifier *)self secTask:v7 valuesForEntitlements:v6 error:a4];
    CFRelease(v8);
  }
  else
  {
    BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    SecTaskRef v11 = v10;
    if (a4) {
      *a4 = v10;
    }

    SecTaskRef v9 = 0;
  }

  return v9;
}

- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5
{
  id v8 = a4;
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v9;
  SecTaskRef v10 = SecTaskCreateWithAuditToken(0, &v16);
  if (v10)
  {
    SecTaskRef v11 = v10;
    BOOL v12 = [(CNEntitlementVerifier *)self secTask:v10 valuesForEntitlements:v8 error:a5];
    CFRelease(v11);
  }
  else
  {
    SecTaskRef v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    audit_token_t v14 = v13;
    if (a5) {
      *a5 = v13;
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (id)secTask:(__SecTask *)a3 valuesForEntitlements:(id)a4 error:(id *)a5
{
  CFArrayRef v7 = (const __CFArray *)a4;
  CFArrayRef v8 = v7;
  if ([(__CFArray *)v7 containsObject:@"com.apple.private.contacts"])
  {
    CFArrayRef v8 = [(__CFArray *)v7 arrayByAddingObject:@"com.apple.private.contactsui"];
  }
  CFErrorRef error = 0;
  CFDictionaryRef v9 = SecTaskCopyValuesForEntitlements(a3, v8, &error);
  CFDictionaryRef v10 = v9;
  if (a5)
  {
    *a5 = error;
  }
  else if (!v9)
  {
    CFDictionaryRef v10 = (CFDictionaryRef)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3
{
  SecTaskRef v5 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v5)
  {
    SecTaskRef v6 = v5;
    BOOL v7 = [(CNEntitlementVerifier *)self secTask:v5 isFirstOrSecondPartyWithError:a3];
    CFRelease(v6);
    return v7;
  }
  else
  {
    CFDictionaryRef v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:3 userInfo:0];
    CFDictionaryRef v10 = v9;
    if (a3) {
      *a3 = v9;
    }

    return 0;
  }
}

void __54__CNEntitlementVerifier_highPriorityBundleIdentifiers__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.telephonyutilities.callservicesd";
  v4[1] = @"com.apple.TelephonyUtilities";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)highPriorityBundleIdentifiers_cn_once_object_1;
  highPriorityBundleIdentifiers_cn_once_object_1 = v2;
}

@end