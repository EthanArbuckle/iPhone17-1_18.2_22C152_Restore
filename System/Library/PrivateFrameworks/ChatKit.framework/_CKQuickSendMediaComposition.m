@interface _CKQuickSendMediaComposition
+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4;
+ (id)compositionWithMediaObjects:(id)a3 subject:(id)a4;
- (BOOL)isSendAnimated;
@end

@implementation _CKQuickSendMediaComposition

+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = @"AdaptiveImageGlyphMediaObject";
    v18[0] = v5;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v8 = (id *)v18;
    v9 = &v17;
LABEL_5:
    v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = (void *)[v11 initWithString:*MEMORY[0x1E4F6C110] attributes:v10];

    goto LABEL_6;
  }
  if (v5)
  {
    v15 = @"MediaObjectForTextAttachment";
    id v16 = v5;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v8 = &v16;
    v9 = &v15;
    goto LABEL_5;
  }
  v12 = 0;
LABEL_6:
  v13 = [(CKComposition *)[_CKQuickSendMediaComposition alloc] initWithText:v12 subject:v6];

  return v13;
}

+ (id)compositionWithMediaObjects:(id)a3 subject:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [(CKComposition *)[_CKQuickSendMediaComposition alloc] initWithText:0 subject:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = +[_CKQuickSendMediaComposition compositionWithMediaObject:subject:](_CKQuickSendMediaComposition, "compositionWithMediaObject:subject:", *(void *)(*((void *)&v16 + 1) + 8 * v12), 0, (void)v16);
        v7 = [(CKComposition *)v13 compositionByAppendingComposition:v14];

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isSendAnimated
{
  return 0;
}

@end