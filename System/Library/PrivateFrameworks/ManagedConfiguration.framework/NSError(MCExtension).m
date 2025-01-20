@interface NSError(MCExtension)
+ (id)MCErrorWithDomain:()MCExtension code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:;
+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:errorType:;
+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:;
+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:underlyingError:errorType:;
- (id)MCErrorType;
- (id)MCFindPrimaryError;
- (id)MCUSEnglishDescription;
- (id)MCUSEnglishSuggestion;
- (id)MCVerboseDescription;
- (uint64_t)MCContainsErrorDomain:()MCExtension code:;
- (uint64_t)MCCopyAsPrimaryError;
@end

@implementation NSError(MCExtension)

+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:errorType:
{
  return [a1 MCErrorWithDomain:a3 code:a4 descriptionArray:a5 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:a6];
}

+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:underlyingError:errorType:
{
  return [a1 MCErrorWithDomain:a3 code:a4 descriptionArray:a5 suggestion:0 USEnglishSuggestion:0 underlyingError:a6 errorType:a7 extraUserInfo:0];
}

+ (uint64_t)MCErrorWithDomain:()MCExtension code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:
{
  return objc_msgSend(a1, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:", a9, 0);
}

+ (id)MCErrorWithDomain:()MCExtension code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:
{
  uint64_t v34 = a4;
  id v35 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((unint64_t)[v14 count] < 2)
  {
    v28 = MCLocalizedStringInTable(@"UNKNOWN_ERROR", @"Errors");
    [v20 setObject:v28 forKey:*MEMORY[0x1E4F28568]];

    v26 = MCUSEnglishErrorString(@"UNKNOWN_ERROR");
    v27 = @"USEnglishDescription";
    goto LABEL_7;
  }
  v21 = [v14 objectAtIndex:0];
  [v20 setObject:v21 forKey:*MEMORY[0x1E4F28568]];

  v22 = [v14 objectAtIndex:1];
  v23 = [MEMORY[0x1E4F1CA98] null];
  char v24 = [v22 isEqual:v23];

  if ((v24 & 1) == 0)
  {
    v25 = [v14 objectAtIndex:1];
    [v20 setObject:v25 forKey:@"USEnglishDescription"];
  }
  if ((unint64_t)objc_msgSend(v14, "count", v34) >= 3)
  {
    v26 = objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
    v27 = @"descriptionParameters";
LABEL_7:
    objc_msgSend(v20, "setObject:forKey:", v26, v27, v34);
  }
  if (!v15)
  {
    if (!v17) {
      goto LABEL_20;
    }
    id v29 = [v17 MCFindPrimaryError];
    if (!v29) {
      id v29 = v17;
    }
    v30 = [v29 localizedDescription];
    [v20 setObject:v30 forKey:*MEMORY[0x1E4F285A0]];

    v31 = [v29 MCUSEnglishDescription];
    if (v31) {
      [v20 setObject:v31 forKey:@"USEnglishSuggestion"];
    }

    goto LABEL_19;
  }
  [v20 setObject:v15 forKey:*MEMORY[0x1E4F285A0]];
  if (v16) {
    [v20 setObject:v16 forKey:@"USEnglishSuggestion"];
  }
  if (v17) {
LABEL_19:
  }
    [v20 setObject:v17 forKey:*MEMORY[0x1E4F28A50]];
LABEL_20:
  if (v18) {
    [v20 setObject:v18 forKey:@"MCErrorType"];
  }
  if (v19) {
    [v20 addEntriesFromDictionary:v19];
  }
  v32 = [MEMORY[0x1E4F28C58] errorWithDomain:v35 code:v34 userInfo:v20];

  return v32;
}

- (id)MCVerboseDescription
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@:\n", v4];

  uint64_t v6 = [a1 localizedDescription];
  v7 = (void *)v6;
  if (v6) {
    [v5 appendFormat:@"Desc   : %@\n", v6];
  }
  uint64_t v8 = [a1 localizedRecoverySuggestion];
  v9 = (void *)v8;
  if (v8) {
    [v5 appendFormat:@"Sugg   : %@\n", v8];
  }
  uint64_t v10 = [a1 MCUSEnglishDescription];
  v11 = (void *)v10;
  if (v10) {
    [v5 appendFormat:@"US Desc: %@\n", v10];
  }
  v27 = v7;
  uint64_t v12 = [a1 MCUSEnglishSuggestion];
  v13 = (void *)v12;
  if (v12) {
    [v5 appendFormat:@"US Sugg: %@\n", v12];
  }
  id v14 = [a1 domain];
  [v5 appendFormat:@"Domain : %@\nCode   : %d\n", v14, objc_msgSend(a1, "code")];

  id v15 = [a1 userInfo];
  id v16 = [v15 objectForKey:@"MCErrorType"];

  if (v16) {
    [v5 appendFormat:@"Type   : %@\n", v16];
  }
  v26 = v9;
  id v17 = [a1 userInfo];
  id v18 = [v17 objectForKey:@"descriptionParameters"];

  if (v18) {
    [v5 appendFormat:@"Params : %@\n", v18];
  }
  id v19 = [a1 userInfo];
  uint64_t v20 = *MEMORY[0x1E4F28A50];
  v21 = [v19 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v21)
  {
    v22 = [v21 MCVerboseDescription];
    [v5 appendFormat:@"...Underlying error:\n%@", v22];
  }
  v23 = [a1 userInfo];
  char v24 = (void *)[v23 mutableCopy];

  [v24 removeObjectForKey:*MEMORY[0x1E4F28568]];
  [v24 removeObjectForKey:*MEMORY[0x1E4F285A0]];
  [v24 removeObjectForKey:@"USEnglishDescription"];
  [v24 removeObjectForKey:@"USEnglishSuggestion"];
  [v24 removeObjectForKey:@"MCErrorType"];
  [v24 removeObjectForKey:@"descriptionParameters"];
  [v24 removeObjectForKey:v20];
  if ([v24 count]) {
    [v5 appendFormat:@"Extra info:\n%@", v24];
  }

  return v5;
}

- (id)MCFindPrimaryError
{
  v1 = [a1 userInfo];
  uint64_t v2 = *MEMORY[0x1E4F28A50];
  v3 = [v1 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v3)
  {
    while (1)
    {
      v4 = [v3 userInfo];
      v5 = [v4 objectForKey:@"isPrimary"];

      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v5 BOOLValue]) {
            break;
          }
        }
      }
      uint64_t v6 = [v3 userInfo];
      uint64_t v7 = [v6 objectForKey:v2];

      v3 = (void *)v7;
      if (!v7) {
        goto LABEL_6;
      }
    }
    id v8 = v3;
  }
  else
  {
LABEL_6:
    id v8 = 0;
  }

  return v8;
}

- (uint64_t)MCCopyAsPrimaryError
{
  uint64_t v2 = [a1 userInfo];
  v3 = (void *)[v2 mutableCopy];

  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [v3 setObject:v4 forKey:@"isPrimary"];

  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = [a1 domain];
  uint64_t v7 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v3);

  return v7;
}

- (uint64_t)MCContainsErrorDomain:()MCExtension code:
{
  id v6 = a3;
  id v7 = a1;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    do
    {
      uint64_t v10 = [v8 domain];
      if ([v10 isEqualToString:v6])
      {
        uint64_t v11 = [v8 code];

        if (v11 == a4)
        {
          uint64_t v14 = 1;
          goto LABEL_10;
        }
      }
      else
      {
      }
      uint64_t v12 = [v8 userInfo];
      uint64_t v13 = [v12 objectForKey:v9];

      id v8 = (void *)v13;
    }
    while (v13);
    uint64_t v14 = 0;
LABEL_10:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)MCUSEnglishDescription
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:@"USEnglishDescription"];

  return v2;
}

- (id)MCUSEnglishSuggestion
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:@"USEnglishSuggestion"];

  return v2;
}

- (id)MCErrorType
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:@"MCErrorType"];

  return v2;
}

@end