@interface AAUICodeEntryContext
- (NSString)escapeTitle;
- (NSString)promptMessage;
- (NSString)promptTitle;
- (id)cancelEntryAction;
- (id)codeEnteredAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)escapeAction;
- (void)setCancelEntryAction:(id)a3;
- (void)setCodeEnteredAction:(id)a3;
- (void)setEscapeAction:(id)a3;
- (void)setEscapeTitle:(id)a3;
- (void)setPromptMessage:(id)a3;
- (void)setPromptTitle:(id)a3;
@end

@implementation AAUICodeEntryContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = [(NSString *)self->_promptTitle copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_promptMessage copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_escapeTitle copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [self->_escapeAction copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [self->_codeEnteredAction copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [self->_cancelEntryAction copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (void)setPromptMessage:(id)a3
{
}

- (NSString)escapeTitle
{
  return self->_escapeTitle;
}

- (void)setEscapeTitle:(id)a3
{
}

- (id)escapeAction
{
  return self->_escapeAction;
}

- (void)setEscapeAction:(id)a3
{
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
}

- (id)cancelEntryAction
{
  return self->_cancelEntryAction;
}

- (void)setCancelEntryAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelEntryAction, 0);
  objc_storeStrong(&self->_codeEnteredAction, 0);
  objc_storeStrong(&self->_escapeAction, 0);
  objc_storeStrong((id *)&self->_escapeTitle, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end