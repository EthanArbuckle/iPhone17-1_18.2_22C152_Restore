@interface NSError(HFErrorHandlerAdditions)
+ (id)hf_errorWithCode:()HFErrorHandlerAdditions operation:options:;
- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions failedItemName:;
- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions options:;
@end

@implementation NSError(HFErrorHandlerAdditions)

+ (id)hf_errorWithCode:()HFErrorHandlerAdditions operation:options:
{
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", a3);
  v10 = v9;
  if (v7 | v8)
  {
    objc_msgSend(v9, "hf_errorWithOperationType:options:", v7, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v9;
  }
  v12 = v11;

  return v12;
}

- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions options:
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [a1 userInfo];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
  }
  else
  {
    id v11 = [NSDictionary dictionary];
    v10 = (void *)[v11 mutableCopy];
  }
  objc_msgSend(v10, "na_safeSetObject:forKey:", v7, @"HFErrorUserInfoOperationKey");

  objc_msgSend(v10, "na_safeSetObject:forKey:", v6, @"HFErrorUserInfoOptionsKey");
  v12 = (void *)MEMORY[0x263F087E8];
  v13 = [a1 domain];
  v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(a1, "code"), v10);

  return v14;
}

- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions failedItemName:
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v14 = @"HFErrorHandlerOptionFailedItemName";
    v15[0] = v6;
    unint64_t v8 = NSDictionary;
    id v9 = a3;
    v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v11 = objc_msgSend(a1, "hf_errorWithOperationType:options:", v9, v10);
  }
  else
  {
    id v12 = a3;
    id v11 = objc_msgSend(a1, "hf_errorWithOperationType:options:", v12, 0);
  }
  return v11;
}

@end