@interface NSString(SLTwitterStringAdditions)
- (BOOL)isTwitterDuplicatePostError;
- (uint64_t)SLTwitterCharacterCountWithShortenedURLLength:()SLTwitterStringAdditions;
@end

@implementation NSString(SLTwitterStringAdditions)

- (uint64_t)SLTwitterCharacterCountWithShortenedURLLength:()SLTwitterStringAdditions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:&v30];
  id v23 = v30;
  v5 = (void *)[a1 mutableCopy];
  v24 = v4;
  objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = long long v29 = 0u;
  v6 = [v21 reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    uint64_t v25 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v25 = 0;
  uint64_t v10 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v12 resultType] == 32)
      {
        v13 = [v12 URL];
        v14 = [v13 scheme];
        if ([v14 compare:@"https" options:1])
        {
          if (![v14 compare:@"http" options:1])
          {
            ++v25;
            goto LABEL_11;
          }
        }
        else
        {
          ++v9;
LABEL_11:
          uint64_t v15 = [v12 range];
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v15, v16, &stru_1F1E28690);
        }

        continue;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  }
  while (v8);
LABEL_17:
  if (a3) {
    uint64_t v17 = a3;
  }
  else {
    uint64_t v17 = 20;
  }

  v18 = [v5 precomposedStringWithCanonicalMapping];
  uint64_t v19 = [v18 length];

  return v9 + v9 * v17 + v25 * v17 + v19;
}

- (BOOL)isTwitterDuplicatePostError
{
  return [a1 compare:@"Status is a duplicate."] == 0;
}

@end