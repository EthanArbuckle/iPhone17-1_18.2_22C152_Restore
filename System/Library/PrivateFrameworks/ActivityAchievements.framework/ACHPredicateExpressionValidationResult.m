@interface ACHPredicateExpressionValidationResult
- (ACHPredicateExpressionValidationResult)initWithValid:(BOOL)a3 issues:(id)a4;
- (BOOL)isValid;
- (NSArray)issues;
@end

@implementation ACHPredicateExpressionValidationResult

- (void).cxx_destruct
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (ACHPredicateExpressionValidationResult)initWithValid:(BOOL)a3 issues:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACHPredicateExpressionValidationResult;
  v8 = [(ACHPredicateExpressionValidationResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_valid = a3;
    objc_storeStrong((id *)&v8->_issues, a4);
  }

  return v9;
}

- (NSArray)issues
{
  return self->_issues;
}

@end