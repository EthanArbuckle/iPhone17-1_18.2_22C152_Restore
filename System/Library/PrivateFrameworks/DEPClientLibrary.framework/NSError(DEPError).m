@interface NSError(DEPError)
+ (id)DEPErrorWithDomain:()DEPError code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:;
+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:errorType:;
+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:underlyingError:errorType:;
- (id)DEPFindPrimaryError;
- (id)DEPUSEnglishDescription;
@end

@implementation NSError(DEPError)

+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:errorType:
{
  return [a1 DEPErrorWithDomain:a3 code:a4 descriptionArray:a5 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:a6];
}

+ (uint64_t)DEPErrorWithDomain:()DEPError code:descriptionArray:underlyingError:errorType:
{
  return [a1 DEPErrorWithDomain:a3 code:a4 descriptionArray:a5 suggestion:0 USEnglishSuggestion:0 underlyingError:a6 errorType:a7];
}

+ (id)DEPErrorWithDomain:()DEPError code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((unint64_t)[v15 count] < 2)
  {
    v30 = DEPLocalizedString(@"UNKNOWN_ERROR");
    [v20 setObject:v30 forKey:*MEMORY[0x1E4F28568]];

    v28 = DEPUSEnglishString(@"UNKNOWN_ERROR");
    v29 = @"USEnglishDescription";
    goto LABEL_7;
  }
  id v38 = v17;
  id v21 = v14;
  uint64_t v22 = a4;
  v23 = [v15 objectAtIndex:0];
  [v20 setObject:v23 forKey:*MEMORY[0x1E4F28568]];

  v24 = [v15 objectAtIndex:1];
  v25 = [MEMORY[0x1E4F1CA98] null];
  char v26 = [v24 isEqual:v25];

  if ((v26 & 1) == 0)
  {
    v27 = [v15 objectAtIndex:1];
    [v20 setObject:v27 forKey:@"USEnglishDescription"];
  }
  a4 = v22;
  id v14 = v21;
  id v17 = v38;
  if ((unint64_t)[v15 count] >= 3)
  {
    v28 = objc_msgSend(v15, "subarrayWithRange:", 2, objc_msgSend(v15, "count") - 2);
    v29 = @"descriptionParameters";
LABEL_7:
    [v20 setObject:v28 forKey:v29];
  }
  if (!v16)
  {
    if (!v18) {
      goto LABEL_20;
    }
    id v39 = v17;
    id v31 = v14;
    uint64_t v32 = a4;
    id v33 = [v18 DEPFindPrimaryError];
    if (!v33) {
      id v33 = v18;
    }
    v34 = [v33 localizedDescription];
    [v20 setObject:v34 forKey:*MEMORY[0x1E4F285A0]];

    v35 = [v33 DEPUSEnglishDescription];
    if (v35) {
      [v20 setObject:v35 forKey:@"USEnglishSuggestion"];
    }

    a4 = v32;
    id v14 = v31;
    id v17 = v39;
    goto LABEL_19;
  }
  [v20 setObject:v16 forKey:*MEMORY[0x1E4F285A0]];
  if (v17) {
    [v20 setObject:v17 forKey:@"USEnglishSuggestion"];
  }
  if (v18) {
LABEL_19:
  }
    [v20 setObject:v18 forKey:*MEMORY[0x1E4F28A50]];
LABEL_20:
  if (v19) {
    [v20 setObject:v19 forKey:@"DEPErrorType"];
  }
  v36 = [MEMORY[0x1E4F28C58] errorWithDomain:v14 code:a4 userInfo:v20];

  return v36;
}

- (id)DEPUSEnglishDescription
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"USEnglishDescription"];

  return v2;
}

- (id)DEPFindPrimaryError
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
      v6 = [v3 userInfo];
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

@end