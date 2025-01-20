@interface LAPSPasscodeChangeControllerOptions
- (BOOL)dismissUIAfterCompletion;
- (BOOL)skipNewPasscode;
- (BOOL)skipOldPasscode;
- (LAExtractablePassword)newPasscode;
- (LAExtractablePassword)oldPasscode;
- (void)setDismissUIAfterCompletion:(BOOL)a3;
- (void)setNewPasscode:(id)a3;
- (void)setOldPasscode:(id)a3;
- (void)setSkipNewPasscode:(BOOL)a3;
- (void)setSkipOldPasscode:(BOOL)a3;
@end

@implementation LAPSPasscodeChangeControllerOptions

- (BOOL)skipOldPasscode
{
  return self->_skipOldPasscode;
}

- (void)setSkipOldPasscode:(BOOL)a3
{
  self->_skipOldPasscode = a3;
}

- (BOOL)skipNewPasscode
{
  return self->_skipNewPasscode;
}

- (void)setSkipNewPasscode:(BOOL)a3
{
  self->_skipNewPasscode = a3;
}

- (LAExtractablePassword)oldPasscode
{
  return self->_oldPasscode;
}

- (void)setOldPasscode:(id)a3
{
}

- (LAExtractablePassword)newPasscode
{
  return self->_newPasscode;
}

- (void)setNewPasscode:(id)a3
{
}

- (BOOL)dismissUIAfterCompletion
{
  return self->_dismissUIAfterCompletion;
}

- (void)setDismissUIAfterCompletion:(BOOL)a3
{
  self->_dismissUIAfterCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newPasscode, 0);

  objc_storeStrong((id *)&self->_oldPasscode, 0);
}

@end