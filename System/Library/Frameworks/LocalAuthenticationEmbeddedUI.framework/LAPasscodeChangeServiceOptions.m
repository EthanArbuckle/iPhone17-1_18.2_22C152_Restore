@interface LAPasscodeChangeServiceOptions
- (BOOL)hidePasscodeRecoveryMessage;
- (BOOL)skipSuccessNotification;
- (LAExtractablePassword)currentPasscode;
- (LAExtractablePassword)newPasscode;
- (LAPasscodeChangeServiceOptions)init;
- (NSString)calloutReason;
- (NSString)passcodePrompt;
- (NSString)title;
- (NSURL)calloutURL;
- (id)description;
- (void)setCalloutReason:(id)a3;
- (void)setCalloutURL:(id)a3;
- (void)setCurrentPasscode:(id)a3;
- (void)setHidePasscodeRecoveryMessage:(BOOL)a3;
- (void)setNewPasscode:(id)a3;
- (void)setPasscodePrompt:(id)a3;
- (void)setSkipSuccessNotification:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation LAPasscodeChangeServiceOptions

- (LAPasscodeChangeServiceOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)LAPasscodeChangeServiceOptions;
  result = [(LAPasscodeChangeServiceOptions *)&v3 init];
  if (result) {
    result->_skipSuccessNotification = 1;
  }
  return result;
}

- (id)description
{
  v20[6] = *MEMORY[0x263EF8340];
  v18 = NSString;
  uint64_t v17 = objc_opt_class();
  v19[0] = @"title";
  uint64_t v3 = [(LAPasscodeChangeServiceOptions *)self title];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  v16 = (void *)v3;
  v20[0] = v3;
  v19[1] = @"passcodePrompt";
  v5 = [(LAPasscodeChangeServiceOptions *)self passcodePrompt];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9D0] null];
  }
  v20[1] = v6;
  v19[2] = @"calloutURL";
  v7 = [(LAPasscodeChangeServiceOptions *)self calloutURL];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x263EFF9D0] null];
  }
  v20[2] = v8;
  v19[3] = @"calloutReason";
  v9 = [(LAPasscodeChangeServiceOptions *)self calloutReason];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x263EFF9D0] null];
  }
  v20[3] = v10;
  v19[4] = @"skipSuccessNotification";
  if ([(LAPasscodeChangeServiceOptions *)self skipSuccessNotification]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v20[4] = v11;
  v19[5] = @"hidePasscodeRecoveryMessage";
  if ([(LAPasscodeChangeServiceOptions *)self hidePasscodeRecoveryMessage]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v20[5] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:6];
  v14 = [v18 stringWithFormat:@"<%@ %p; %@>", v17, self, v13];

  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v4)
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)passcodePrompt
{
  return self->_passcodePrompt;
}

- (void)setPasscodePrompt:(id)a3
{
}

- (LAExtractablePassword)currentPasscode
{
  return self->_currentPasscode;
}

- (void)setCurrentPasscode:(id)a3
{
}

- (LAExtractablePassword)newPasscode
{
  return self->_newPasscode;
}

- (void)setNewPasscode:(id)a3
{
}

- (NSURL)calloutURL
{
  return self->_calloutURL;
}

- (void)setCalloutURL:(id)a3
{
}

- (NSString)calloutReason
{
  return self->_calloutReason;
}

- (void)setCalloutReason:(id)a3
{
}

- (BOOL)skipSuccessNotification
{
  return self->_skipSuccessNotification;
}

- (void)setSkipSuccessNotification:(BOOL)a3
{
  self->_skipSuccessNotification = a3;
}

- (BOOL)hidePasscodeRecoveryMessage
{
  return self->_hidePasscodeRecoveryMessage;
}

- (void)setHidePasscodeRecoveryMessage:(BOOL)a3
{
  self->_hidePasscodeRecoveryMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutReason, 0);
  objc_storeStrong((id *)&self->_calloutURL, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_currentPasscode, 0);
  objc_storeStrong((id *)&self->_passcodePrompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end