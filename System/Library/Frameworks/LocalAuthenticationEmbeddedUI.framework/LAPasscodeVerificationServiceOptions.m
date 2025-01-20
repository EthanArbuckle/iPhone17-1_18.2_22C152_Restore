@interface LAPasscodeVerificationServiceOptions
- (BOOL)dismissUIAfterCompletion;
- (NSString)passcodePrompt;
- (NSString)title;
- (id)description;
- (void)setDismissUIAfterCompletion:(BOOL)a3;
- (void)setPasscodePrompt:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LAPasscodeVerificationServiceOptions

- (id)description
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v14[0] = @"title";
  v5 = [(LAPasscodeVerificationServiceOptions *)self title];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9D0] null];
  }
  v15[0] = v6;
  v14[1] = @"passcodePrompt";
  v7 = [(LAPasscodeVerificationServiceOptions *)self passcodePrompt];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x263EFF9D0] null];
  }
  v15[1] = v8;
  v14[2] = @"dismissUIAfterCompletion";
  BOOL v9 = [(LAPasscodeVerificationServiceOptions *)self dismissUIAfterCompletion];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v15[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v12 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v11];

  if (!v7) {
  if (!v5)
  }

  return v12;
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
  objc_storeStrong((id *)&self->_passcodePrompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end