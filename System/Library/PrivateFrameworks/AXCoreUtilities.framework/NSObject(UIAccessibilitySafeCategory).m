@interface NSObject(UIAccessibilitySafeCategory)
- (double)safeCGPointForKey:()UIAccessibilitySafeCategory;
- (double)safeCGRectForKey:()UIAccessibilitySafeCategory;
- (double)safeCGSizeForKey:()UIAccessibilitySafeCategory;
- (double)safeDoubleForKey:()UIAccessibilitySafeCategory;
- (float)safeFloatForKey:()UIAccessibilitySafeCategory;
- (id)safeArrayForKey:()UIAccessibilitySafeCategory;
- (id)safeDictionaryForKey:()UIAccessibilitySafeCategory;
- (id)safeSetForKey:()UIAccessibilitySafeCategory;
- (id)safeStringForKey:()UIAccessibilitySafeCategory;
- (id)safeUIViewForKey:()UIAccessibilitySafeCategory;
- (id)safeValueForKey:()UIAccessibilitySafeCategory;
- (id)safeValueForKeyPath:()UIAccessibilitySafeCategory;
- (ptrdiff_t)safeIvarForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeBoolForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeIntForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeIntegerForIvarKey:()UIAccessibilitySafeCategory onClass:;
- (uint64_t)safeIntegerForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeRangeForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeUnsignedIntForKey:()UIAccessibilitySafeCategory;
- (uint64_t)safeUnsignedIntegerForKey:()UIAccessibilitySafeCategory;
- (void)_accessibilityPerformSafeValueKeyBlock:()UIAccessibilitySafeCategory withKey:onClass:;
@end

@implementation NSObject(UIAccessibilitySafeCategory)

- (id)safeSetForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:0];

  return v5;
}

- (id)safeDictionaryForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:0];

  return v5;
}

- (id)safeValueForKeyPath:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NSObject_UIAccessibilitySafeCategory__safeValueForKeyPath___block_invoke;
  v8[3] = &unk_1E5672F48;
  v10 = &v11;
  v8[4] = a1;
  id v5 = v4;
  id v9 = v5;
  [a1 _accessibilityPerformSafeValueKeyBlock:v8 withKey:v5 onClass:objc_opt_class()];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)safeIntForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", "I", "q", "Q", "q", "Q", 0);

  uint64_t v6 = [v5 intValue];
  return v6;
}

- (id)safeArrayForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:0];

  return v5;
}

- (id)safeStringForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:0];

  return v5;
}

- (uint64_t)safeBoolForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "c", "B", "B", 0);

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (uint64_t)safeIntegerForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "q", "Q", "c", "s", "i", "q", 0);

  uint64_t v6 = [v5 integerValue];
  return v6;
}

- (id)safeUIViewForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:NSClassFromString(&cfstr_Uiview.isa) expectedTypeEncoding:0];

  return v5;
}

- (id)safeValueForKey:()UIAccessibilitySafeCategory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NSObject_UIAccessibilitySafeCategory__safeValueForKey___block_invoke;
  v8[3] = &unk_1E5672F48;
  v10 = &v11;
  v8[4] = a1;
  id v5 = v4;
  id v9 = v5;
  [a1 _accessibilityPerformSafeValueKeyBlock:v8 withKey:v5 onClass:objc_opt_class()];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_accessibilityPerformSafeValueKeyBlock:()UIAccessibilitySafeCategory withKey:onClass:
{
  id v5 = a3;
  id v6 = a4;
  v5[2](v5);
}

- (ptrdiff_t)safeIvarForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = v4;
  InstanceVariable = class_getInstanceVariable(v5, (const char *)[v6 UTF8String]);
  if (InstanceVariable)
  {
    ptrdiff_t v8 = ivar_getOffset(InstanceVariable) + a1;
  }
  else
  {
    if (AXShouldReportValidationErrors())
    {
      id v9 = +[AXValidationManager sharedInstance];
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      [v9 sendExceptionForSafeIVarKey:v6 onTarget:v11 overrideProcessName:0];
    }
    if (AXShouldLogValidationErrors())
    {
      v12 = AXLogValidations();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(NSObject(UIAccessibilitySafeCategory) *)(uint64_t)v6 safeIvarForKey:v12];
      }
    }
    if (AXShouldCrashOnValidationErrors())
    {
      uint64_t v13 = AXLogValidations();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(NSObject(UIAccessibilitySafeCategory) *)(uint64_t)v6 safeIvarForKey:v13];
      }
    }
    ptrdiff_t v8 = 0;
  }

  return v8;
}

- (uint64_t)safeUnsignedIntForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", "I", "q", "Q", "q", "Q", 0);

  uint64_t v6 = [v5 unsignedIntValue];
  return v6;
}

- (uint64_t)safeUnsignedIntegerForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "Q", "q", "Q", "C", "S", "I", "Q", 0);

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (float)safeFloatForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "f", "d", 0);

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (double)safeDoubleForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "d", "f", 0);

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (uint64_t)safeRangeForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{_NSRange=QQ}"];

  uint64_t v6 = [v5 rangeValue];
  return v6;
}

- (double)safeCGPointForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGPoint=dd}"];

  [v5 pointValue];
  double v7 = v6;

  return v7;
}

- (double)safeCGSizeForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGSize=dd}"];

  [v5 sizeValue];
  double v7 = v6;

  return v7;
}

- (double)safeCGRectForKey:()UIAccessibilitySafeCategory
{
  id v4 = a3;
  id v5 = [a1 _safeValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  [v5 rectValue];
  double v7 = v6;

  return v7;
}

- (uint64_t)safeIntegerForIvarKey:()UIAccessibilitySafeCategory onClass:
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NSObject_UIAccessibilitySafeCategory__safeIntegerForIvarKey_onClass___block_invoke;
  v10[3] = &unk_1E5673588;
  uint64_t v14 = a4;
  id v7 = v6;
  v12 = a1;
  uint64_t v13 = &v15;
  id v11 = v7;
  [a1 _accessibilityPerformSafeValueKeyBlock:v10 withKey:v7 onClass:a4];
  uint64_t v8 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (void)safeIvarForKey:()UIAccessibilitySafeCategory .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_18FC6C000, a3, OS_LOG_TYPE_FAULT, "UIAccessibility Error. Could not safe access iVar: %{public}@ on class: %{public}@", v6, 0x16u);
}

- (void)safeIvarForKey:()UIAccessibilitySafeCategory .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_18FC6C000, a3, OS_LOG_TYPE_ERROR, "UIAccessibility Error. Could not safe access iVar: %{public}@ on class: %{public}@", v6, 0x16u);
}

@end