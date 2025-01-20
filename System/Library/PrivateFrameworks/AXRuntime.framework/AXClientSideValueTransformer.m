@interface AXClientSideValueTransformer
+ (BOOL)canTransformAttribute:(int64_t)a3;
+ (id)_transformArrayWithUserStrings:(id)a3;
+ (id)_transformAutomationDictionary:(id)a3;
+ (id)_transformUserString:(id)a3;
+ (id)transformValue:(id)a3 forAttribute:(int64_t)a4 withElement:(__AXUIElement *)a5;
+ (void)initialize;
@end

@implementation AXClientSideValueTransformer

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXClientSideValueTransformer;
  objc_msgSendSuper2(&v2, sel_initialize);
}

+ (BOOL)canTransformAttribute:(int64_t)a3
{
  BOOL result = 1;
  if (a3 > 2185)
  {
    if (a3 == 2186 || a3 == 5039 || a3 == 95006) {
      return result;
    }
    return 0;
  }
  if (a3 != 2001 && a3 != 2006) {
    return 0;
  }
  return result;
}

+ (id)transformValue:(id)a3 forAttribute:(int64_t)a4 withElement:(__AXUIElement *)a5
{
  id v7 = a3;
  v8 = 0;
  if (a4 <= 2185)
  {
    if (a4 == 2001 || a4 == 2006)
    {
      uint64_t v9 = [a1 _transformUserString:v7];
      goto LABEL_10;
    }
  }
  else
  {
    if (a4 == 2186)
    {
      uint64_t v9 = [a1 _transformArrayWithUserStrings:v7];
      goto LABEL_10;
    }
    if (a4 == 5039 || a4 == 95006)
    {
      uint64_t v9 = [a1 _transformAutomationDictionary:v7];
LABEL_10:
      v8 = (void *)v9;
    }
  }

  return v8;
}

+ (id)_transformUserString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    v5 = (void (*)(id, void *))getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr;
    v12 = getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr;
    if (!getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke;
      v8[3] = &unk_1E6220520;
      v8[4] = &v9;
      __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke((uint64_t)v8);
      v5 = (void (*)(id, void *))v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v5) {
      +[AXClientSideValueTransformer _transformUserString:]();
    }
    v6 = v5(v4, &unk_1F1423FE0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_transformArrayWithUserStrings:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x1BA9EDE10]();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__AXClientSideValueTransformer__transformArrayWithUserStrings___block_invoke;
    v8[3] = &__block_descriptor_40_e8__16__0_8l;
    v8[4] = a1;
    v6 = objc_msgSend(v4, "ax_mappedArrayUsingBlock:", v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __63__AXClientSideValueTransformer__transformArrayWithUserStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [*(id *)(a1 + 32) _transformUserString:v3];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (id)_transformAutomationDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    context = (void *)MEMORY[0x1BA9EDE10]();
    v5 = (void *)[v4 mutableCopy];
    v6 = [v5 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];
    id v7 = (void *)[v6 mutableCopy];

    v17 = [v7 objectForKeyedSubscript:&unk_1F1423F38];
    v8 = objc_msgSend(a1, "_transformUserString:");
    [v7 setObject:v8 forKeyedSubscript:&unk_1F1423F38];

    uint64_t v9 = [v7 objectForKeyedSubscript:&unk_1F1423F50];
    v10 = [a1 _transformUserString:v9];
    [v7 setObject:v10 forKeyedSubscript:&unk_1F1423F50];

    uint64_t v11 = [v5 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyChildren"];
    v12 = (void *)[v11 mutableCopy];

    if ([v12 count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = [v12 objectAtIndex:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [a1 _transformUserString:v14];
        }
        else {
        v15 = [a1 _transformAutomationDictionary:v14];
        }
        if (v15) {
          [v12 replaceObjectAtIndex:v13 withObject:v15];
        }

        ++v13;
      }
      while (v13 < [v12 count]);
    }
    [v5 setObject:v7 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];
    [v5 setObject:v12 forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildren"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)_transformUserString:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *soft_AXPerformPrivilegedAttributedStringTransformations(NSString *__strong, NSArray *__strong)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXClientSideValueTransformer.m", 17, @"%s", dlerror());

  __break(1u);
}

@end