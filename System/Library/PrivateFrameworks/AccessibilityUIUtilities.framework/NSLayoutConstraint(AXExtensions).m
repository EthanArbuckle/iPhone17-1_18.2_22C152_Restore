@interface NSLayoutConstraint(AXExtensions)
+ (id)ax_constraintsToMakeItem:()AXExtensions sameDimensionsAsItem:;
- (void)ax_removeFromContainer;
@end

@implementation NSLayoutConstraint(AXExtensions)

+ (id)ax_constraintsToMakeItem:()AXExtensions sameDimensionsAsItem:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [&unk_1F1F20320 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(&unk_1F1F20320);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue];
        v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:v12 relatedBy:0 toItem:v6 attribute:v12 multiplier:1.0 constant:0.0];
        [v7 addObject:v13];
      }
      uint64_t v9 = [&unk_1F1F20320 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)ax_removeFromContainer
{
  id v15 = [a1 firstItem];
  v2 = [a1 secondItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v15;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v4) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    objc_msgSend(v4, "ax_firstCommonAncestorWithView:", v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v10)
  {
    while (1)
    {
      uint64_t v12 = [v11 constraints];
      int v13 = [v12 containsObject:a1];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 superview];

      v11 = (void *)v14;
      if (!v14) {
        goto LABEL_21;
      }
    }
    [v11 removeConstraint:a1];
  }
LABEL_21:
}

@end