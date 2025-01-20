@interface NSDictionary(FPFrameworkAdditions)
- (id)fp_filter:()FPFrameworkAdditions;
- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions;
- (id)fp_valueForKeyPath:()FPFrameworkAdditions;
@end

@implementation NSDictionary(FPFrameworkAdditions)

- (id)fp_filter:()FPFrameworkAdditions
{
  id v4 = a3;
  v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__NSDictionary_FPFrameworkAdditions__fp_filter___block_invoke;
  v11[3] = &unk_1E5AF63A8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NSDictionary_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke;
  v11[3] = &unk_1E5AF44F0;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fp_valueForKeyPath:()FPFrameworkAdditions
{
  id v4 = a3;
  id v5 = [a1 allKeys];
  id v6 = v4;
  id v7 = v6;
  if (!v6 || ![v6 length])
  {
    v15 = 0;
    id v19 = 0;
    int v20 = 0;
    goto LABEL_21;
  }
  v8 = [v7 componentsSeparatedByString:@"."];
  if ([v8 count])
  {
    if (![v8 count])
    {
LABEL_8:
      id v12 = v7;
      uint64_t v13 = [v8 count];
      v14 = v12;
      if ([v5 containsObject:v12])
      {
LABEL_12:
        v15 = v14;
        unint64_t v18 = [v15 length];
        if (v18 >= [v12 length])
        {
          id v19 = 0;
        }
        else
        {
          objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v15, "length") + 1);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        int v20 = 1;
        v16 = v15;
      }
      else
      {
        v15 = (char *)(v13 - 1);
        v16 = (char *)v12;
        while (v15)
        {
          v17 = [v8 objectAtIndex:v15];
          v14 = objc_msgSend(v16, "substringWithRange:", 0, objc_msgSend(v16, "length") + ~objc_msgSend(v17, "length"));

          --v15;
          v16 = (char *)v14;
          if ([v5 containsObject:v14]) {
            goto LABEL_12;
          }
        }
        id v19 = 0;
        int v20 = 0;
      }

      goto LABEL_20;
    }
    uint64_t v9 = 0;
    while (1)
    {
      v10 = [v8 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 length];

      if (!v11) {
        break;
      }
      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_8;
      }
    }
  }
  v15 = 0;
  id v19 = 0;
  int v20 = 0;
LABEL_20:

LABEL_21:
  v21 = v15;
  id v22 = v19;

  if (!v20)
  {
    v26 = 0;
    goto LABEL_31;
  }
  v23 = [a1 objectForKey:v21];
  v24 = v23;
  if (v23)
  {
    if (!v22)
    {
      id v25 = v23;
      goto LABEL_29;
    }
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v24, "fp_valueForKeyPath:", v22);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      v26 = v25;
      goto LABEL_30;
    }
  }
  v26 = 0;
LABEL_30:

LABEL_31:

  return v26;
}

@end