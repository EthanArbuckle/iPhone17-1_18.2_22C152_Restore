@interface FKBackgroundRefreshConfirmationPromptDecision
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowPrompt;
- (FKBackgroundRefreshConfirmationPromptDecision)initWithShouldShowPrompt:(BOOL)a3 token:(id)a4;
- (FKBackgroundRefreshConfirmationPromptToken)token;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKBackgroundRefreshConfirmationPromptDecision

- (FKBackgroundRefreshConfirmationPromptDecision)initWithShouldShowPrompt:(BOOL)a3 token:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKBackgroundRefreshConfirmationPromptDecision;
  v7 = [(FKBackgroundRefreshConfirmationPromptDecision *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_shouldShowPrompt = a3;
    uint64_t v9 = [v6 copy];
    token = v8->_token;
    v8->_token = (FKBackgroundRefreshConfirmationPromptToken *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FKBackgroundRefreshConfirmationPromptDecision alloc];
  BOOL shouldShowPrompt = self->_shouldShowPrompt;
  token = self->_token;

  return [(FKBackgroundRefreshConfirmationPromptDecision *)v4 initWithShouldShowPrompt:shouldShowPrompt token:token];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [NSNumber numberWithBool:self->_shouldShowPrompt];
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_token];
  unint64_t v5 = FKCombinedHash(17, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FKBackgroundRefreshConfirmationPromptDecision *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && self->_shouldShowPrompt == v5->_shouldShowPrompt)
  {
    char v6 = FKEqualObjects(self->_token, v5->_token);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowPrompt
{
  return self->_shouldShowPrompt;
}

- (FKBackgroundRefreshConfirmationPromptToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end