@interface LAPSFetchOldPasscodeViewControllerInput
- (LAPSPasscodeType)passcodeType;
- (NSString)errorMessage;
- (NSString)nextButton;
- (NSString)prompt;
- (NSString)title;
- (int64_t)backoffTimeout;
- (void)setBackoffTimeout:(int64_t)a3;
- (void)setErrorMessage:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setPasscodeType:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LAPSFetchOldPasscodeViewControllerInput

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (int64_t)backoffTimeout
{
  return self->_backoffTimeout;
}

- (void)setBackoffTimeout:(int64_t)a3
{
  self->_backoffTimeout = a3;
}

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end