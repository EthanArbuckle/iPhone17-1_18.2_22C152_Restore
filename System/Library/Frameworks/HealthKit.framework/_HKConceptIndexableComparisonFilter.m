@interface _HKConceptIndexableComparisonFilter
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (BOOL)supportsKeyPath:(id)a3 forTypes:(id)a4;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)_acceptsDataObjectWithValue:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKConceptIndexableComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return 0;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);

  return v6;
}

+ (BOOL)supportsKeyPath:(id)a3 forTypes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64___HKConceptIndexableComparisonFilter_supportsKeyPath_forTypes___block_invoke;
    v9[3] = &unk_1E58C85B8;
    id v10 = v5;
    char v7 = objc_msgSend(v6, "hk_allObjectsPassTestWithError:test:", 0, v9);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS____HKConceptIndexableComparisonFilter;
  if (objc_msgSendSuper2(&v16, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, a4, a5, a6, a7))
  {
    uint64_t v13 = objc_opt_class();
    char v14 = HKIsValueOrContainerValidForOperatorType(a5, v12, v13, (uint64_t)a7);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return a3 == 4 || a3 == 10;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v5 = objc_opt_class(),
        [(_HKComparisonFilter *)self keyPath],
        id v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = _ClassSupportsConceptIndexableKeyPath(v5, v6),
        v6,
        v5))
  {
    char v7 = [(_HKComparisonFilter *)self keyPath];
    v8 = [v4 valueForKeyPath:v7];

    v9 = [v8 identifier];
    BOOL v10 = [(_HKConceptIndexableComparisonFilter *)self _acceptsDataObjectWithValue:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_acceptsDataObjectWithValue:(id)a3
{
  id v5 = a3;
  if ([(_HKComparisonFilter *)self operatorType] == 10)
  {
    id v6 = [(_HKComparisonFilter *)self value];
    char v7 = [v6 containsObject:v5];
  }
  else
  {
    if ([(_HKComparisonFilter *)self operatorType] != 4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"_HKConceptIndexableComparisonFilter.m" lineNumber:113 description:@"Unreachable code has been executed"];
      BOOL v8 = 0;
      goto LABEL_7;
    }
    id v6 = [(_HKComparisonFilter *)self value];
    char v7 = [v6 isEqual:v5];
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

@end