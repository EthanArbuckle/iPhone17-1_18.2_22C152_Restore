@interface NSString(SLWeiboStringAdditions)
- (BOOL)isWeiboDuplicatePostError;
- (uint64_t)SLWeiboCharacterCountWithShortenedURLLength:()SLWeiboStringAdditions;
@end

@implementation NSString(SLWeiboStringAdditions)

- (uint64_t)SLWeiboCharacterCountWithShortenedURLLength:()SLWeiboStringAdditions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v38 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:&v38];
  id v28 = v38;
  v29 = v4;
  v32 = (void *)[a1 mutableCopy];
  objc_msgSend(v4, "matchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = long long v37 = 0u;
  v5 = [v27 reverseObjectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v6)
  {
    uint64_t v33 = 0;
    uint64_t v31 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  uint64_t v8 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v35 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ([v10 resultType] == 32)
      {
        v11 = [v10 URL];
        v12 = [v11 scheme];
        uint64_t v13 = [v10 range];
        if (objc_msgSend(a1, "rangeOfString:options:range:", v12, 1, v13, v14) == v13)
        {
          if ([v12 compare:@"https" options:1])
          {
            if (![v12 compare:@"http" options:1])
            {
              ++v31;
              goto LABEL_12;
            }
          }
          else
          {
            ++v33;
LABEL_12:
            uint64_t v15 = [v10 range];
            objc_msgSend(v32, "replaceCharactersInRange:withString:", v15, v16, &stru_1F1E28690);
          }
        }

        continue;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  }
  while (v7);
LABEL_18:

  id v17 = v32;
  if ([v17 length])
  {
    uint64_t v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v22 = MEMORY[0x1E4F14390];
    while (1)
    {
      unsigned int v23 = [v17 characterAtIndex:v18];
      if (v23 > 0x7F) {
        break;
      }
      if ((*(_DWORD *)(v22 + 4 * v23 + 60) & 0x20000) != 0) {
        goto LABEL_24;
      }
      ++v21;
LABEL_26:
      if ([v17 length] <= (unint64_t)++v18) {
        goto LABEL_29;
      }
    }
    if (!__maskrune(v23, 0x20000uLL))
    {
      ++v19;
      goto LABEL_26;
    }
LABEL_24:
    ++v20;
    goto LABEL_26;
  }
  int v21 = 0;
  int v20 = 0;
  int v19 = 0;
LABEL_29:
  if (v21 | v19) {
    uint64_t v24 = (int)(v19 + vcvtps_s32_f32((float)(v20 + v21) * 0.5));
  }
  else {
    uint64_t v24 = 0;
  }
  if (a3) {
    uint64_t v25 = a3;
  }
  else {
    uint64_t v25 = 20;
  }

  return v33 + v33 * v25 + v31 * v25 + v24;
}

- (BOOL)isWeiboDuplicatePostError
{
  [a1 rangeOfString:@"repeat content!"];
  return v1 != 0;
}

@end