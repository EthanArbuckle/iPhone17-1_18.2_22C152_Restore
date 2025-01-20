@interface _HKUserDomainConceptComparisonFilter
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKUserDomainConceptComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"semanticIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"udcTypeIdentifier"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"udcUUID"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"semanticIdentifier"])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, v13, v14);
  }
  else if ([v5 isEqualToString:@"udcTypeIdentifier"] {
         || [v5 isEqualToString:@"udcUUID"])
  }
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v6 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"_HKUserDomainConceptComparisonFilter.m" lineNumber:52 description:@"Unreachable code has been executed"];

    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  v10 = (void *)v6;

  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7 = a4;
  if ([v7 isEqualToString:@"semanticIdentifier"])
  {
    BOOL v8 = a3 == 4;
  }
  else
  {
    if (([v7 isEqualToString:@"udcTypeIdentifier"] & 1) == 0
      && ![v7 isEqualToString:@"udcUUID"])
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"_HKUserDomainConceptComparisonFilter.m" lineNumber:67 description:@"Unreachable code has been executed"];

      BOOL v9 = 0;
      goto LABEL_11;
    }
    BOOL v8 = a3 == 4 || a3 == 10;
  }
  BOOL v9 = v8;
LABEL_11:

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS____HKUserDomainConceptComparisonFilter;
  if (!objc_msgSendSuper2(&v20, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_9; {
  if (![v14 isEqualToString:@"semanticIdentifier"])
  }
  {
    if ([v14 isEqualToString:@"udcTypeIdentifier"]
      || [v14 isEqualToString:@"udcUUID"])
    {
      uint64_t v16 = objc_opt_class();
      char isKindOfClass = HKIsValueOrContainerValidForOperatorType(a5, v13, v16, (uint64_t)a7);
      goto LABEL_7;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"_HKUserDomainConceptComparisonFilter.m" lineNumber:87 description:@"Unreachable code has been executed"];

LABEL_9:
    char v17 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:
  char v17 = isKindOfClass;
LABEL_10:

  return v17 & 1;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return 0;
}

@end