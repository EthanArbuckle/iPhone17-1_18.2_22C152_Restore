@interface NSObject(UIAccessibilitySafeCategory_Private)
- (id)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:possibleExpectedTypeEncodings:;
- (uint64_t)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:expectedTypeEncoding:;
@end

@implementation NSObject(UIAccessibilitySafeCategory_Private)

- (uint64_t)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:expectedTypeEncoding:
{
  return objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", 0);
}

- (id)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:possibleExpectedTypeEncodings:
{
  id v13 = a3;
  id v14 = [a1 safeValueForKey:v13];
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (AXShouldReportValidationErrors())
      {
        v18 = +[AXValidationManager sharedInstance];
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        [v18 sendExceptionForSafeValueKey:v13 onTarget:v20 overrideProcessName:0];
      }
      id v21 = v14;
      objc_opt_class();
      v22 = v21;
      if (objc_opt_isKindOfClass())
      {
        v23 = NSString;
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
        v22 = [v23 stringWithFormat:@"<redacted string. len=%@", v24];
      }
      if (!AXPerformValidationChecks()) {
        goto LABEL_17;
      }
      int v25 = AXShouldCrashOnValidationErrors();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = NSStringFromClass(a4);
      v29 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v29);
      int v35 = __UIAccessibilityHandleValidationErrorWithDescription(v25, 0, @"Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@",
              v30,
              v31,
              v32,
              v33,
              v34,
              (uint64_t)v13);

      if (!v35)
      {
LABEL_17:

LABEL_18:
        id v14 = 0;
        goto LABEL_19;
      }
      goto LABEL_36;
    }
    if (a5)
    {
      id v14 = v14;
      v15 = (const char *)[v14 objCType];
      if (strcmp(v15, a5))
      {
        char v16 = 0;
        v58 = (const char **)&a9;
        while (1)
        {
          v17 = v58++;
          if (!*v17) {
            break;
          }
          if ((v16 & 1) == 0) {
            char v16 = 1;
          }
          if (!strcmp(v15, *v17)) {
            goto LABEL_19;
          }
        }
        if (AXShouldReportValidationErrors())
        {
          v37 = +[AXValidationManager sharedInstance];
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          [v37 sendExceptionForSafeValueKey:v13 onTarget:v39 overrideProcessName:0];
        }
        if (!AXPerformValidationChecks()) {
          goto LABEL_35;
        }
        if (v16)
        {
          v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%s", a5);
          v59 = &a10;
          for (uint64_t i = a9; i; uint64_t i = *v43)
          {
            [v41 appendFormat:@"\", \"%s", i];
            v43 = v59++;
          }
          id v40 = v41;
          [v40 UTF8String];
        }
        else
        {
          id v40 = 0;
        }
        id v44 = v14;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v45 = NSString;
          v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
          uint64_t v47 = [v45 stringWithFormat:@"<redacted string. len=%@", v46];

          id v44 = (id)v47;
        }
        if (!AXPerformValidationChecks()
          || (int v48 = AXShouldCrashOnValidationErrors(),
              v49 = (objc_class *)objc_opt_class(),
              NSStringFromClass(v49),
              v56 = objc_claimAutoreleasedReturnValue(),
              int v55 = __UIAccessibilityHandleValidationErrorWithDescription(v48, 0, @"Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\".",
                      v50,
                      v51,
                      v52,
                      v53,
                      v54,
                      (uint64_t)v13),
              v56,
              !v55))
        {

LABEL_35:
          goto LABEL_18;
        }
LABEL_36:
        abort();
      }
    }
  }
LABEL_19:

  return v14;
}

@end