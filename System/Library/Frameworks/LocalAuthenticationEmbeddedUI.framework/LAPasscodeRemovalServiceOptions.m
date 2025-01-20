@interface LAPasscodeRemovalServiceOptions
- (NSString)passcodePrompt;
- (NSString)title;
- (id)description;
- (void)setPasscodePrompt:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LAPasscodeRemovalServiceOptions

- (id)description
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v12[0] = @"title";
  v5 = [(LAPasscodeRemovalServiceOptions *)self title];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9D0] null];
  }
  v12[1] = @"passcodePrompt";
  v13[0] = v6;
  v7 = [(LAPasscodeRemovalServiceOptions *)self passcodePrompt];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x263EFF9D0] null];
  }
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v9];

  if (!v7) {
  if (!v5)
  }

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodePrompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end