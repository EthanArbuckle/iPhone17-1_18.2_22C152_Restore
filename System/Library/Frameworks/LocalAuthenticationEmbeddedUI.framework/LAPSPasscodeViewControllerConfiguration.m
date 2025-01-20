@interface LAPSPasscodeViewControllerConfiguration
- (BOOL)shouldAvoidBecomingFirstResponderOnStart;
- (LAPSPasscodeOptionsViewControllerConfiguration)optionsConfiguration;
- (LAPSPasscodeType)passcodeType;
- (NSString)errorMessage;
- (NSString)footer;
- (NSString)nextButton;
- (NSString)prompt;
- (NSString)title;
- (void)setErrorMessage:(id)a3;
- (void)setFooter:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setOptionsConfiguration:(id)a3;
- (void)setPasscodeType:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setShouldAvoidBecomingFirstResponderOnStart:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation LAPSPasscodeViewControllerConfiguration

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

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
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

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (BOOL)shouldAvoidBecomingFirstResponderOnStart
{
  return self->_shouldAvoidBecomingFirstResponderOnStart;
}

- (void)setShouldAvoidBecomingFirstResponderOnStart:(BOOL)a3
{
  self->_shouldAvoidBecomingFirstResponderOnStart = a3;
}

- (LAPSPasscodeOptionsViewControllerConfiguration)optionsConfiguration
{
  return self->_optionsConfiguration;
}

- (void)setOptionsConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsConfiguration, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end