@interface NSError
@end

@implementation NSError

BOOL __45__NSError_EmailFoundationAdditions__ef_match__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) domain];
  if ([v6 isEqualToString:v5]) {
    BOOL v7 = [*(id *)(a1 + 32) code] == a3;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

void __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:*MEMORY[0x1E4F28A50]]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = objc_msgSend(v6, "ef_secureCodableError");
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
    if (([v7 isEqual:v6] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F28750]] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke_2;
    v10[3] = &unk_1E6122638;
    v10[4] = &v11;
    v8 = objc_msgSend(v6, "ef_map:", v10);
    v9 = *(void **)(a1 + 32);
    if (*((unsigned char *)v12 + 24))
    {
      [v9 setObject:v8 forKeyedSubscript:v5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      [v9 setObject:v6 forKeyedSubscript:v5];
    }

    _Block_object_dispose(&v11, 8);
  }
  else if (([v5 isEqualToString:@"NSErrorPeerCertificateChainKey"] & 1) != 0 {
         || ([v5 isEqualToString:@"NSErrorClientCertificateChainKey"] & 1) != 0
  }
         || [v5 isEqualToString:*MEMORY[0x1E4F289B8]]
         || ![v6 conformsToProtocol:&unk_1F0EC38B0]
         || ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

id __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "ef_secureCodableError");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (([v4 isEqual:v3] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

void __63__NSError_EFPubliclyDescribableAdditions__ef_publicDescription__block_invoke(uint64_t a1)
{
  v2 = (void *)sErrorDecoders;
  id v3 = [*(id *)(a1 + 32) domain];
  id v8 = [v2 objectForKeyedSubscript:v3];

  id v4 = v8;
  if (v8)
  {
    uint64_t v5 = (*((void (**)(id, uint64_t))v8 + 2))(v8, [*(id *)(a1 + 32) code]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v4 = v8;
  }
}

void __67__NSError_EFPubliclyDescribableAdditions__ef_setDecoder_forDomain___block_invoke(uint64_t a1)
{
  id v1 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend((id)sErrorDecoders, "setObject:forKeyedSubscript:");
}

@end