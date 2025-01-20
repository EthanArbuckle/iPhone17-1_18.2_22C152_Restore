@interface LAPSFetchNewPasscodeViewControllerInput
- (BOOL)isPasscodeRecoveryEnabled;
- (BOOL)isPasscodeRecoveryMessageHidden;
- (BOOL)isPasscodeRecoveryOptionVisible;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRecoverySupported;
- (LAPSPasscodeType)passcodeType;
- (NSOrderedSet)allowedPasscodeTypes;
- (NSString)footerRecoveryDisabled;
- (NSString)footerRecoveryEnabled;
- (NSString)nextButton;
- (NSString)passcodeOptionsCancelTitle;
- (NSString)passcodeOptionsTitle;
- (NSString)passcodeRecoveryDisabledTitle;
- (NSString)passcodeRecoveryEnabledTitle;
- (NSString)passcodeRecoveryTitle;
- (NSString)prompt;
- (NSString)title;
- (NSString)verifyNextButton;
- (NSString)verifyPrompt;
- (void)setAllowedPasscodeTypes:(id)a3;
- (void)setFooterRecoveryDisabled:(id)a3;
- (void)setFooterRecoveryEnabled:(id)a3;
- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3;
- (void)setIsPasscodeRecoveryMessageHidden:(BOOL)a3;
- (void)setIsPasscodeRecoveryOptionVisible:(BOOL)a3;
- (void)setIsPasscodeRecoveryRestricted:(BOOL)a3;
- (void)setIsPasscodeRecoverySupported:(BOOL)a3;
- (void)setNextButton:(id)a3;
- (void)setPasscodeOptionsCancelTitle:(id)a3;
- (void)setPasscodeOptionsTitle:(id)a3;
- (void)setPasscodeRecoveryDisabledTitle:(id)a3;
- (void)setPasscodeRecoveryEnabledTitle:(id)a3;
- (void)setPasscodeRecoveryTitle:(id)a3;
- (void)setPasscodeType:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVerifyNextButton:(id)a3;
- (void)setVerifyPrompt:(id)a3;
@end

@implementation LAPSFetchNewPasscodeViewControllerInput

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

- (NSString)footerRecoveryEnabled
{
  return self->_footerRecoveryEnabled;
}

- (void)setFooterRecoveryEnabled:(id)a3
{
}

- (NSString)footerRecoveryDisabled
{
  return self->_footerRecoveryDisabled;
}

- (void)setFooterRecoveryDisabled:(id)a3
{
}

- (NSString)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (NSString)passcodeOptionsTitle
{
  return self->_passcodeOptionsTitle;
}

- (void)setPasscodeOptionsTitle:(id)a3
{
}

- (NSString)passcodeOptionsCancelTitle
{
  return self->_passcodeOptionsCancelTitle;
}

- (void)setPasscodeOptionsCancelTitle:(id)a3
{
}

- (NSString)passcodeRecoveryTitle
{
  return self->_passcodeRecoveryTitle;
}

- (void)setPasscodeRecoveryTitle:(id)a3
{
}

- (NSString)passcodeRecoveryEnabledTitle
{
  return self->_passcodeRecoveryEnabledTitle;
}

- (void)setPasscodeRecoveryEnabledTitle:(id)a3
{
}

- (NSString)passcodeRecoveryDisabledTitle
{
  return self->_passcodeRecoveryDisabledTitle;
}

- (void)setPasscodeRecoveryDisabledTitle:(id)a3
{
}

- (NSOrderedSet)allowedPasscodeTypes
{
  return self->_allowedPasscodeTypes;
}

- (void)setAllowedPasscodeTypes:(id)a3
{
}

- (BOOL)isPasscodeRecoveryOptionVisible
{
  return self->_isPasscodeRecoveryOptionVisible;
}

- (void)setIsPasscodeRecoveryOptionVisible:(BOOL)a3
{
  self->_isPasscodeRecoveryOptionVisible = a3;
}

- (BOOL)isPasscodeRecoveryMessageHidden
{
  return self->_isPasscodeRecoveryMessageHidden;
}

- (void)setIsPasscodeRecoveryMessageHidden:(BOOL)a3
{
  self->_isPasscodeRecoveryMessageHidden = a3;
}

- (BOOL)isPasscodeRecoverySupported
{
  return self->_isPasscodeRecoverySupported;
}

- (void)setIsPasscodeRecoverySupported:(BOOL)a3
{
  self->_isPasscodeRecoverySupported = a3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3
{
  self->_isPasscodeRecoveryEnabled = a3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return self->_isPasscodeRecoveryRestricted;
}

- (void)setIsPasscodeRecoveryRestricted:(BOOL)a3
{
  self->_isPasscodeRecoveryRestricted = a3;
}

- (NSString)verifyPrompt
{
  return self->_verifyPrompt;
}

- (void)setVerifyPrompt:(id)a3
{
}

- (NSString)verifyNextButton
{
  return self->_verifyNextButton;
}

- (void)setVerifyNextButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifyNextButton, 0);
  objc_storeStrong((id *)&self->_verifyPrompt, 0);
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryDisabledTitle, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryEnabledTitle, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryTitle, 0);
  objc_storeStrong((id *)&self->_passcodeOptionsCancelTitle, 0);
  objc_storeStrong((id *)&self->_passcodeOptionsTitle, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_footerRecoveryDisabled, 0);
  objc_storeStrong((id *)&self->_footerRecoveryEnabled, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end