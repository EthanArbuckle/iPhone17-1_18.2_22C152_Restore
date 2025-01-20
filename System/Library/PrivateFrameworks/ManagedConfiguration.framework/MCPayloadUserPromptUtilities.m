@interface MCPayloadUserPromptUtilities
+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5;
+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12;
@end

@implementation MCPayloadUserPromptUtilities

+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v17 length]) {
    [v24 setObject:v17 forKey:@"UUID"];
  }
  if ([v18 length]) {
    [v24 setObject:v18 forKey:@"title"];
  }
  if ([v19 length]) {
    [v24 setObject:v19 forKey:@"description"];
  }
  if ([v20 length]) {
    [v24 setObject:v20 forKey:@"retryDescription"];
  }
  if ([v21 length]) {
    [v24 setObject:v21 forKey:@"finePrint"];
  }
  if ([v22 length]) {
    [v24 setObject:v22 forKey:@"defaultValue"];
  }
  if ([v23 length]) {
    [v24 setObject:v23 forKey:@"placeholderValue"];
  }
  if (a10)
  {
    v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a10];
    [v24 setObject:v25 forKey:@"minimumLength"];
  }
  v26 = [MEMORY[0x1E4F28ED0] numberWithInt:a11];
  [v24 setObject:v26 forKey:@"fieldType"];

  v27 = [MEMORY[0x1E4F28ED0] numberWithInt:a12];
  [v24 setObject:v27 forKey:@"flags"];

  return v24;
}

+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7)
  {
    id v21 = v9;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
        id v17 = [v16 objectForKey:@"UUID"];
        char v18 = [v17 isEqualToString:v8];

        if (v18) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = [v16 objectForKey:@"response"];

      v10 = v21;
      if (v19) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      v10 = v21;
    }
  }
  id v19 = v10;
LABEL_13:

  return v19;
}

@end