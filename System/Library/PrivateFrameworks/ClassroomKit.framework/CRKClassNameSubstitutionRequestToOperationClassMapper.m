@interface CRKClassNameSubstitutionRequestToOperationClassMapper
- (CRKClassNameSubstitutionRequestToOperationClassMapper)init;
- (CRKClassNameSubstitutionRequestToOperationClassMapper)initWithAllowedRequestPrefixes:(id)a3 operationPrefix:(id)a4;
- (Class)operationClassForRequest:(id)a3;
- (id)prefixForString:(id)a3;
- (id)stringByApplyingOperationPrefixToString:(id)a3;
- (id)stringByApplyingOperationSuffixToString:(id)a3;
@end

@implementation CRKClassNameSubstitutionRequestToOperationClassMapper

- (CRKClassNameSubstitutionRequestToOperationClassMapper)init
{
  v3 = objc_opt_new();
  v4 = [(CRKClassNameSubstitutionRequestToOperationClassMapper *)self initWithAllowedRequestPrefixes:v3 operationPrefix:&stru_26D7E7B00];

  return v4;
}

- (CRKClassNameSubstitutionRequestToOperationClassMapper)initWithAllowedRequestPrefixes:(id)a3 operationPrefix:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKClassNameSubstitutionRequestToOperationClassMapper;
  v8 = [(CRKClassNameSubstitutionRequestToOperationClassMapper *)&v16 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"length" ascending:0];
    v17[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    uint64_t v11 = [v6 sortedArrayUsingDescriptors:v10];
    mAllowedPrefixes = v8->mAllowedPrefixes;
    v8->mAllowedPrefixes = (NSArray *)v11;

    uint64_t v13 = [v7 copy];
    mOperationPrefix = v8->mOperationPrefix;
    v8->mOperationPrefix = (NSString *)v13;
  }
  return v8;
}

- (Class)operationClassForRequest:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (v5)
  {
    id v6 = [(CRKClassNameSubstitutionRequestToOperationClassMapper *)self stringByApplyingOperationSuffixToString:v5];
    if (v6)
    {
      id v7 = [(CRKClassNameSubstitutionRequestToOperationClassMapper *)self stringByApplyingOperationPrefixToString:v6];
      v8 = v7;
      if (v7) {
        id v7 = (NSString *)NSClassFromString(v7);
      }
      v9 = v7;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return (Class)v9;
}

- (id)stringByApplyingOperationSuffixToString:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"Request"])
  {
    uint64_t v4 = [v3 rangeOfString:@"Request" options:4];
    id v6 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, v5, @"Operation");
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)stringByApplyingOperationPrefixToString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKClassNameSubstitutionRequestToOperationClassMapper *)self prefixForString:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = NSString;
    mOperationPrefix = self->mOperationPrefix;
    v9 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length"));
    v10 = [v7 stringWithFormat:@"%@%@", mOperationPrefix, v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)prefixForString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->mAllowedPrefixes;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v4, "hasPrefix:", v9, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOperationPrefix, 0);

  objc_storeStrong((id *)&self->mAllowedPrefixes, 0);
}

@end