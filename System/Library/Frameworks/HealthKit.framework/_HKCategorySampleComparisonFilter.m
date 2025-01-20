@interface _HKCategorySampleComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKCategorySampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return [a3 isEqualToString:@"value"];
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKCategorySampleComparisonFilter;
  if (!objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    goto LABEL_5;
  }
  if ([v8 count] != 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"expected 1 category type but got %ld %@", objc_msgSend(v8, "count"), v8);
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 value];
    v6 = [(_HKComparisonFilter *)self value];
    unint64_t v7 = HKCompareIntegers(v5, [v6 integerValue]);

    BOOL v8 = HKComparisonResultMatchesPredicateOperator(v7, [(_HKComparisonFilter *)self operatorType]);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end