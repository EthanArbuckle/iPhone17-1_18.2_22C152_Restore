@interface _HKCDADocumentSampleComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (void)configureInMemoryFilter;
@end

@implementation _HKCDADocumentSampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"author_name"] & 1) != 0
    || ([v3 isEqualToString:@"custodian_name"] & 1) != 0
    || ([v3 isEqualToString:@"patient_name"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"title"];
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
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKCDADocumentSampleComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    char v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_87);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  BOOL result = 1;
  if (a3 > 9 || ((1 << a3) & 0x3B0) == 0) {
    return a3 == 99;
  }
  return result;
}

- (void)configureInMemoryFilter
{
  v6.receiver = self;
  v6.super_class = (Class)_HKCDADocumentSampleComparisonFilter;
  [(_HKComparisonFilter *)&v6 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self value];
  uint64_t v4 = +[HKCDADocumentSample _comparisonExpressionForValue:v3 operatorType:[(_HKComparisonFilter *)self operatorType]];
  comparisonExpression = self->_comparisonExpression;
  self->_comparisonExpression = v4;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(_HKComparisonFilter *)self keyPath];
    char v7 = [v5 _predicateMatchForKeyPath:v6 pattern:self->_comparisonExpression];

    char v8 = v7 ^ ([(_HKComparisonFilter *)self operatorType] == 5);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end