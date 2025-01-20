@interface LACustomPasswordControllerConfiguration
+ (LACustomPasswordControllerConfiguration)enterCustomPasswordConfiguration;
+ (LACustomPasswordControllerConfiguration)registerCustomPasswordConfiguration;
+ (id)enterCustomPasswordConfigurationWithPrompt:(id)a3;
+ (id)registerCustomPasswordControllerConfigurationWithPrompt:(id)a3 verifyPrompt:(id)a4;
- (LACustomPasswordControllerStyle)style;
- (NSString)cancelButtonTitle;
- (id)initWithPrompt:(void *)a3 verifyPromptPrompt:(void *)a4 mode:;
- (id)prompt;
- (id)verifyPrompt;
- (int64_t)passwordType;
- (unint64_t)mode;
- (void)setCancelButtonTitle:(id)a3;
- (void)setPasswordType:(int64_t)a3;
- (void)setStyle:(id)a3;
@end

@implementation LACustomPasswordControllerConfiguration

- (id)initWithPrompt:(void *)a3 verifyPromptPrompt:(void *)a4 mode:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)LACustomPasswordControllerConfiguration;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      uint64_t v11 = +[LACustomPasswordControllerStyle sheetStyle];
      id v12 = a1[6];
      a1[6] = (id)v11;
    }
  }

  return a1;
}

+ (LACustomPasswordControllerConfiguration)registerCustomPasswordConfiguration
{
  v2 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], 0, 0, (void *)1);

  return (LACustomPasswordControllerConfiguration *)v2;
}

+ (LACustomPasswordControllerConfiguration)enterCustomPasswordConfiguration
{
  v2 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], 0, 0, 0);

  return (LACustomPasswordControllerConfiguration *)v2;
}

+ (id)registerCustomPasswordControllerConfigurationWithPrompt:(id)a3 verifyPrompt:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], v6, v5, (void *)1);

  return v7;
}

+ (id)enterCustomPasswordConfigurationWithPrompt:(id)a3
{
  id v3 = a3;
  v4 = -[LACustomPasswordControllerConfiguration initWithPrompt:verifyPromptPrompt:mode:]((id *)[LACustomPasswordControllerConfiguration alloc], v3, 0, 0);

  return v4;
}

- (id)prompt
{
  return self->_prompt;
}

- (id)verifyPrompt
{
  return self->_verifyPrompt;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (int64_t)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int64_t)a3
{
  self->_passwordType = a3;
}

- (LACustomPasswordControllerStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_verifyPrompt, 0);

  objc_storeStrong((id *)&self->_prompt, 0);
}

@end