@interface CHSynthesisContractViolation
- (CHSynthesisContractViolation)initWithLocationRange:(_NSRange)a3 comment:(id)a4 kind:(int64_t)a5;
- (NSString)comment;
- (_NSRange)locationRange;
- (int64_t)kind;
@end

@implementation CHSynthesisContractViolation

- (CHSynthesisContractViolation)initWithLocationRange:(_NSRange)a3 comment:(id)a4 kind:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSynthesisContractViolation;
  v11 = [(CHSynthesisContractViolation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_locationRange.NSUInteger location = location;
    v11->_locationRange.NSUInteger length = length;
    objc_storeStrong((id *)&v11->_comment, a4);
    v12->_kind = a5;
  }

  return v12;
}

- (_NSRange)locationRange
{
  NSUInteger length = self->_locationRange.length;
  NSUInteger location = self->_locationRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)comment
{
  return self->_comment;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

@end