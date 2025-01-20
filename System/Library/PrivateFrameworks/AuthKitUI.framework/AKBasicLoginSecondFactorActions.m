@interface AKBasicLoginSecondFactorActions
- (id)ak_cancelAction;
- (id)codeEnteredAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)regenerateCodeAction;
- (void)setAk_cancelAction:(id)a3;
- (void)setCodeEnteredAction:(id)a3;
- (void)setRegenerateCodeAction:(id)a3;
@end

@implementation AKBasicLoginSecondFactorActions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [self->_regenerateCodeAction copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [self->_codeEnteredAction copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [self->_ak_cancelAction copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (id)regenerateCodeAction
{
  return self->_regenerateCodeAction;
}

- (void)setRegenerateCodeAction:(id)a3
{
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
}

- (id)ak_cancelAction
{
  return self->_ak_cancelAction;
}

- (void)setAk_cancelAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ak_cancelAction, 0);
  objc_storeStrong(&self->_codeEnteredAction, 0);

  objc_storeStrong(&self->_regenerateCodeAction, 0);
}

@end