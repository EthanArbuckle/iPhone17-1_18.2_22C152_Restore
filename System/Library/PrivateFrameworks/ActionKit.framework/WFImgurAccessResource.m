@interface WFImgurAccessResource
- (BOOL)usesAccount;
- (Class)accountClass;
- (WFImgurUploadAction)action;
- (unint64_t)status;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)setAction:(id)a3;
- (void)setUsesAccount:(BOOL)a3;
@end

@implementation WFImgurAccessResource

- (void).cxx_destruct
{
}

- (BOOL)usesAccount
{
  return self->_usesAccount;
}

- (WFImgurUploadAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFImgurUploadAction *)WeakRetained;
}

- (unint64_t)status
{
  if (![(WFImgurAccessResource *)self usesAccount]) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFImgurAccessResource;
  return [(WFAccountAccessResource *)&v4 status];
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v7 = a3;
  if ([a4 isEqualToString:@"WFImgurAnonymous"])
  {
    v6 = [v7 parameterValueForKey:@"WFImgurAnonymous" ofClass:objc_opt_class()];
    -[WFImgurAccessResource setUsesAccount:](self, "setUsesAccount:", [v6 BOOLValue] ^ 1);
  }
}

- (void)setUsesAccount:(BOOL)a3
{
  self->_usesAccount = a3;
  [(WFResource *)self refreshAvailabilityWithForcedNotification];
}

- (void)setAction:(id)a3
{
  p_action = &self->_action;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  id v6 = objc_storeWeak((id *)p_action, obj);
  [obj addEventObserver:self];
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

@end