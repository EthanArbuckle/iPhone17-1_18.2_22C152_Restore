@interface _HKListUserDomainConceptComparisonFilter
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKListUserDomainConceptComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return [a3 isEqualToString:@"listType"];
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  if ([a3 isEqualToString:@"listType"])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"_HKListUserDomainConceptComparisonFilter.m" lineNumber:41 description:@"Unreachable code has been executed"];

    v8 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v8;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  if ([a4 isEqualToString:@"listType"]) {
    return a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:a1 file:@"_HKListUserDomainConceptComparisonFilter.m" lineNumber:55 description:@"Unreachable code has been executed"];

  return 0;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKListUserDomainConceptComparisonFilter;
  if (!objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_5; {
  if (![v14 isEqualToString:@"listType"])
  }
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"_HKListUserDomainConceptComparisonFilter.m" lineNumber:73 description:@"Unreachable code has been executed"];

LABEL_5:
    char v16 = 0;
    goto LABEL_6;
  }
  uint64_t v15 = objc_opt_class();
  char v16 = HKIsValueOrContainerValidForOperatorType(a5, v13, v15, (uint64_t)a7);
LABEL_6:

  return v16;
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