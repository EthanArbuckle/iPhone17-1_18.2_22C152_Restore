@interface _HKActivitySummaryComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (int64_t)acceptsActivitySummary:(id)a3;
@end

@implementation _HKActivitySummaryComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return [a3 isEqualToString:@"activityMoveMode"];
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

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKActivitySummaryComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    char v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_97);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS____HKActivitySummaryComparisonFilter;
  if (!objc_msgSendSuper2(&v15, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, a4, a5, a6, a7))goto LABEL_5; {
  if (!_HKActivityMoveModeIsValid([v12 integerValue]))
  }
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Value '%@' is not a valid activity move mode", v12);
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_6;
  }
  BOOL v13 = 1;
LABEL_6:

  return v13;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return 0;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  uint64_t v4 = [a3 activityMoveMode];
  v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(v4, [v5 integerValue]);

  return HKComparisonResultMatchesPredicateOperator(v6, [(_HKComparisonFilter *)self operatorType]);
}

@end