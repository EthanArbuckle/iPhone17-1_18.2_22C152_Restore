@interface DEValidatorResult
- (NSArray)errors;
- (NSArray)warnings;
- (NSString)status;
- (void)setErrors:(id)a3;
- (void)setStatus:(id)a3;
- (void)setWarnings:(id)a3;
@end

@implementation DEValidatorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)setWarnings:(id)a3
{
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setStatus:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

@end