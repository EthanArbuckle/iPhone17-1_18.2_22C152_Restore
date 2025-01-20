@interface PKMathRecognitionError
- (NSString)errorReasonString;
- (NSString)errorString;
- (void)setErrorReasonString:(id)a3;
- (void)setErrorString:(id)a3;
@end

@implementation PKMathRecognitionError

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
}

- (NSString)errorReasonString
{
  return self->_errorReasonString;
}

- (void)setErrorReasonString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReasonString, 0);

  objc_storeStrong((id *)&self->_errorString, 0);
}

@end