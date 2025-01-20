@interface _HKValidationErrorTracker
- (NSMutableString)errorMessage;
- (_HKValidationErrorTracker)init;
- (int64_t)errorCount;
- (void)setErrorCount:(int64_t)a3;
- (void)setErrorMessage:(id)a3;
@end

@implementation _HKValidationErrorTracker

- (_HKValidationErrorTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKValidationErrorTracker;
  v2 = [(_HKValidationErrorTracker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_errorCount = 0;
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    errorMessage = v3->_errorMessage;
    v3->_errorMessage = v4;
  }
  return v3;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int64_t)a3
{
  self->_errorCount = a3;
}

- (NSMutableString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end