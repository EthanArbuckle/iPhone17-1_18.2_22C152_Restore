@interface _HKSampleComparisonFilter
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (id)endDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5;
+ (id)startDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5;
- (void)configureInMemoryFilter;
@end

@implementation _HKSampleComparisonFilter

+ (id)startDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5
{
  return (id)[a1 filterForKeyPath:@"startDate" operatorType:a3 value:a4 dataTypes:a5];
}

+ (id)endDateFilterWithOperatorType:(unint64_t)a3 date:(id)a4 dataTypes:(id)a5
{
  return (id)[a1 filterForKeyPath:@"endDate" operatorType:a3 value:a4 dataTypes:a5];
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"startDate"] & 1) != 0
    || ([v3 isEqualToString:@"offsetFromStartDate"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"endDate"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"offsetFromStartDate"]) {
    BOOL v6 = a3 == 3;
  }
  else {
    BOOL v6 = +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:v5];
  }

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____HKSampleComparisonFilter;
  if (!objc_msgSendSuper2(&v12, sel_areValidTypes_forKeyPath_error_, v8, v9, a5)) {
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"offsetFromStartDate"]
    && [v8 count] != 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"expected 1 sample type but got %ld %@", objc_msgSend(v8, "count"), v8);
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"startDate"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"offsetFromStartDate"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"endDate"])
  {
    int64_t v6 = 2;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKSampleComparisonFilter.m" lineNumber:151 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKSampleComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (void)configureInMemoryFilter
{
  v8.receiver = self;
  v8.super_class = (Class)_HKSampleComparisonFilter;
  [(_HKComparisonFilter *)&v8 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self value];
  [v3 timeIntervalSinceReferenceDate];
  self->_comparisonTime = v4;

  id v5 = [(_HKComparisonFilter *)self dataTypes];
  int64_t v6 = [v5 anyObject];
  anySampleType = self->_anySampleType;
  self->_anySampleType = v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(_HKComparisonFilter *)self keyPathIntegerValue];
    [v5 _startTimestamp];
    double v8 = v7;
    [v5 _endTimestamp];
    double v10 = v9;

    BOOL v11 = _AcceptsDataObject(v6, self->_anySampleType, [(_HKComparisonFilter *)self operatorType], v8, v10, self->_comparisonTime);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  return _AcceptsDataObject([(_HKComparisonFilter *)self keyPathIntegerValue], self->_anySampleType, [(_HKComparisonFilter *)self operatorType], a3, a4, self->_comparisonTime);
}

- (void).cxx_destruct
{
}

@end