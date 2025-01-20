@interface SSS_UIWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityRemoteSubstituteChildren:(id)a3;
@end

@implementation SSS_UIWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(id)*MEMORY[0x263F1D020] safeArrayForKey:@"_accessibilityWindows"];
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      [v4 addObject:v10];
      if ([v10 accessibilityViewIsModal]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

@end