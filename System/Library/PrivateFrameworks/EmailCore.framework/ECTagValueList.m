@interface ECTagValueList
+ (id)_errorWithCode:(void *)a3 failureReason:;
+ (id)tagValueListFromDictionary:(id)a3 error:(id *)a4;
+ (id)tagValueListFromString:(id)a3 error:(id *)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSString)stringRepresentation;
- (id)_initWithDictionaryRepresentation:(id)a3;
- (id)_initWithDictionaryRepresentation:(id)a3 stringRepresentation:(id)a4;
- (id)objectForKeyedSubscript:(id)a3;
- (id)valueForTag:(id)a3;
- (void)dealloc;
@end

@implementation ECTagValueList

uint64_t ___ef_log_ECTagValueList_block_invoke()
{
  _ef_log_ECTagValueList_log = (uint64_t)os_log_create("com.apple.email", "ECTagValueList");
  return MEMORY[0x1F41817F8]();
}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECTagValueList;
  v5 = [(ECTagValueList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

- (id)_initWithDictionaryRepresentation:(id)a3 stringRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ECTagValueList *)self _initWithDictionaryRepresentation:v6];
  if (v8) {
    id v9 = (id)EFAtomicObjectSetIfNil();
  }

  return v8;
}

- (void)dealloc
{
  id v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)ECTagValueList;
  [(ECTagValueList *)&v4 dealloc];
}

+ (id)tagValueListFromString:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  objc_super v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v5 = objc_msgSend(v25, "ef_stringByTrimmingTrailingCharactersInSet:", v4);

  v24 = v5;
  v23 = [v5 componentsSeparatedByString:@";"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v23;
  id v8 = (void *)[v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {
    char v28 = 1;
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)v30;
  char v28 = 1;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if ([v11 length])
      {
        v12 = objc_msgSend(v11, "ef_componentsSeparatedByString:maxSeparations:", @"=", 1);
        if ([v12 count] == 2)
        {
          v13 = [v12 firstObject];
          v14 = objc_msgSend(v13, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");

          v15 = [v12 lastObject];
          v16 = objc_msgSend(v15, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");

          v17 = [v6 objectForKeyedSubscript:v14];

          if (!v17)
          {
            [v6 setObject:v16 forKeyedSubscript:v14];

            continue;
          }
          v18 = [NSString stringWithFormat:@"Duplicate '%@' tags in tag value list", v14];
          id v8 = +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 2, v18);
        }
        else
        {
          id v8 = +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);
        }

        goto LABEL_18;
      }
      char v28 = 0;
    }
    id v8 = (void *)[v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_18:

  if (![v6 count])
  {
    uint64_t v19 = +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);

    id v6 = 0;
    id v8 = (void *)v19;
  }
  if (a4) {
    *a4 = v8;
  }
  if (v8)
  {
    v20 = 0;
  }
  else
  {
    if (v28) {
      uint64_t v21 = [objc_alloc((Class)a1) _initWithDictionaryRepresentation:v6 stringRepresentation:v25];
    }
    else {
      uint64_t v21 = [objc_alloc((Class)a1) _initWithDictionaryRepresentation:v6];
    }
    v20 = (void *)v21;
  }

  return v20;
}

+ (id)_errorWithCode:(void *)a3 failureReason:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if (v4)
  {
    uint64_t v8 = *MEMORY[0x1E4F28588];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v5 = 0;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECTagValueListErrorDomain" code:a2 userInfo:v5];

  return v6;
}

+ (id)tagValueListFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (void *)[objc_alloc((Class)a1) _initWithDictionaryRepresentation:v6];
  }
  else if (a4)
  {
    +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)stringRepresentation
{
  id v3 = EFAtomicObjectLoad();
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(ECTagValueList *)self dictionaryRepresentation];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __38__ECTagValueList_stringRepresentation__block_invoke;
    v9[3] = &unk_1E63EEFA0;
    id v6 = v4;
    id v10 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];

    id v7 = [v6 componentsJoinedByString:@";"];
    id v3 = EFAtomicObjectSetIfNil();
  }
  return (NSString *)v3;
}

void __38__ECTagValueList_stringRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@=%@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");
}

- (id)valueForTag:(id)a3
{
  id v4 = a3;
  v5 = [(ECTagValueList *)self dictionaryRepresentation];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v3 = [(ECTagValueList *)self valueForTag:a3];
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end