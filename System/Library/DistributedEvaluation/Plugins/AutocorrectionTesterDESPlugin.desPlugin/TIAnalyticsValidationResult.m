@interface TIAnalyticsValidationResult
- (BOOL)success;
- (NSString)errorSummary;
- (TIAnalyticsValidationResult)init;
- (void)addError:(id)a3;
@end

@implementation TIAnalyticsValidationResult

- (TIAnalyticsValidationResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIAnalyticsValidationResult;
  v2 = [(TIAnalyticsValidationResult *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_success = 1;
    uint64_t v4 = objc_opt_new();
    errors = v3->_errors;
    v3->_errors = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)addError:(id)a3
{
  self->_success = 0;
}

- (NSString)errorSummary
{
  if ([(NSMutableArray *)self->_errors count])
  {
    v3 = [(NSMutableArray *)self->_errors componentsJoinedByString:@"\n  "];
    uint64_t v4 = +[NSString stringWithFormat:@"Validation errors were found:\n  %@", v3];
  }
  else
  {
    uint64_t v4 = @"No validation errors were found";
  }

  return (NSString *)v4;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
}

@end