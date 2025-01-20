@interface ECDNSClient
- (id)_txtRecordsForDomain:(id)a3 error:(id *)a4;
- (id)getDMARCRecordsFromDomain:(id)a3 error:(id *)a4;
- (void)getPublicKeyRecordsFromDomain:(id)a3 withSelector:(id)a4 completionHandler:(id)a5;
@end

@implementation ECDNSClient

- (void)getPublicKeyRecordsFromDomain:(id)a3 withSelector:(id)a4 completionHandler:(id)a5
{
  v8 = a5;
  v9 = [NSString stringWithFormat:@"%@._domainkey.%@", a4, a3];
  id v13 = 0;
  v10 = [(ECDNSClient *)self _txtRecordsForDomain:v9 error:&v13];
  v11 = (void (*)(void *, void *, id))v8[2];
  id v12 = v13;
  v11(v8, v10, v12);
}

- (id)getDMARCRecordsFromDomain:(id)a3 error:(id *)a4
{
  v6 = [NSString stringWithFormat:@"_dmarc.%@", a3];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id obj = 0;
  v7 = [(ECDNSClient *)self _txtRecordsForDomain:v6 error:&obj];
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ECDNSClient_getDMARCRecordsFromDomain_error___block_invoke;
  v10[3] = &unk_1E63EE378;
  v10[4] = &v12;
  v8 = objc_msgSend(v7, "ef_compactMap:", v10);
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

id __47__ECDNSClient_getDMARCRecordsFromDomain_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v11 = 0;
  v3 = +[ECTagValueList tagValueListFromString:a2 error:&v11];
  id v4 = v11;
  id v5 = v11;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v5 == 0;
  }
  if (!v9) {
    objc_storeStrong(v7, v4);
  }

  return v3;
}

- (id)_txtRecordsForDomain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = (id)objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__ECDNSClient__txtRecordsForDomain_error___block_invoke;
  v16[3] = &unk_1E63EE3A0;
  v16[4] = &v23;
  v16[5] = &v17;
  context = (void *)MEMORY[0x1C18A3120](v16);
  DNSServiceRef sdRef = (DNSServiceRef)0xAAAAAAAAAAAAAAAALL;
  v7 = +[ECIDNAEncoder stringByEncodingDomainName:v5];
  uint64_t v8 = DNSServiceAttributeCreate();
  int v9 = DNSServiceAttributeSetResolverOverride();
  if (v9)
  {
    DNSServiceAttributeDeallocate(v8);
    if (a4)
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDNSClient" code:v9 userInfo:0];
LABEL_11:
      id v13 = 0;
      *a4 = v10;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  DNSServiceErrorType v11 = DNSServiceQueryRecordWithAttribute(&sdRef, 0x11000u, 0, (const char *)[v7 cStringUsingEncoding:1], 0x10u, 1u, v8, (DNSServiceQueryRecordReply)query_callback, context);
  DNSServiceAttributeDeallocate(v8);
  if (v11)
  {
    DNSServiceRefDeallocate(sdRef);
    if (a4)
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDNSClient" code:v11 userInfo:0];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  DNSServiceErrorType v12 = DNSServiceProcessResult(sdRef);
  DNSServiceRefDeallocate(sdRef);
  if (v12 || (DNSServiceErrorType v12 = *((_DWORD *)v24 + 6)) != 0)
  {
    if (a4)
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDNSClient" code:v12 userInfo:0];
      goto LABEL_11;
    }
LABEL_12:
    id v13 = 0;
    goto LABEL_13;
  }
  id v13 = (id)v18[5];
LABEL_13:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __42__ECDNSClient__txtRecordsForDomain_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  else if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

@end