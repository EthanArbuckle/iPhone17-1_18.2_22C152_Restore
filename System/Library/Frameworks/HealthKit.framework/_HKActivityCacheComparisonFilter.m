@interface _HKActivityCacheComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (id)filterWithOperatorType:(unint64_t)a3 cacheIndex:(int64_t)a4;
- (BOOL)acceptsDataObject:(id)a3;
- (int64_t)cacheIndex;
- (void)configureInMemoryFilter;
@end

@implementation _HKActivityCacheComparisonFilter

+ (id)filterWithOperatorType:(unint64_t)a3 cacheIndex:(int64_t)a4
{
  v6 = [NSNumber numberWithLongLong:a4];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = +[HKObjectType activityCacheType];
  v9 = [v7 setWithObject:v8];
  v10 = [a1 filterForKeyPath:@"cacheIndex" operatorType:a3 value:v6 dataTypes:v9];

  return v10;
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"dateComponents"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"cacheIndex"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"dateComponents"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_5:
    uint64_t v7 = [v6 setWithObject:objc_opt_class()];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"cacheIndex"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:a1 file:@"_HKActivityCacheComparisonFilter.m" lineNumber:53 description:@"Unreachable code has been executed"];

  uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKActivityCacheComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    char v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_67);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS____HKActivityCacheComparisonFilter;
  if (objc_msgSendSuper2(&v18, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if ([v13 isEqualToString:@"dateComponents"])
    {
      id v17 = 0;
      BOOL v14 = +[HKActivitySummary _validateActivitySummaryDateComponents:v12 errorMessage:&v17];
      id v15 = v17;
      if (!v14) {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 3, v15);
      }
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)configureInMemoryFilter
{
  v9.receiver = self;
  v9.super_class = (Class)_HKActivityCacheComparisonFilter;
  [(_HKComparisonFilter *)&v9 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self keyPath];
  int v4 = [v3 isEqualToString:@"dateComponents"];

  if (v4)
  {
    id v5 = [(_HKComparisonFilter *)self value];
    int64_t v6 = _HKCacheIndexFromDateComponents(v5);
  }
  else
  {
    uint64_t v7 = [(_HKComparisonFilter *)self keyPath];
    int v8 = [v7 isEqualToString:@"cacheIndex"];

    if (!v8) {
      return;
    }
    id v5 = [(_HKComparisonFilter *)self value];
    int64_t v6 = [v5 integerValue];
  }
  self->_cacheIndex = v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = HKCompareIntegers([v4 cacheIndex], self->_cacheIndex);
    BOOL v6 = HKComparisonResultMatchesPredicateOperator(v5, [(_HKComparisonFilter *)self operatorType]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

@end