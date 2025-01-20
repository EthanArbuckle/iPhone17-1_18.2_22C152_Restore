@interface CDPUICodeEntryViewModel
- (CDPRemoteValidationEscapeOffer)escapeOffer;
- (NSString)promptMessage;
- (NSString)promptTitle;
- (id)codeEnteredAction;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCodeEnteredAction:(id)a3;
- (void)setEscapeOffer:(id)a3;
- (void)setPromptMessage:(id)a3;
- (void)setPromptTitle:(id)a3;
@end

@implementation CDPUICodeEntryViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CDPUICodeEntryViewModel allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_promptTitle copy];
  promptTitle = v4->_promptTitle;
  v4->_promptTitle = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_promptMessage copy];
  promptMessage = v4->_promptMessage;
  v4->_promptMessage = (NSString *)v7;

  uint64_t v9 = [self->_codeEnteredAction copy];
  id codeEnteredAction = v4->_codeEnteredAction;
  v4->_id codeEnteredAction = (id)v9;

  objc_storeStrong((id *)&v4->_escapeOffer, self->_escapeOffer);
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

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_codeEnteredAction, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);

  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end