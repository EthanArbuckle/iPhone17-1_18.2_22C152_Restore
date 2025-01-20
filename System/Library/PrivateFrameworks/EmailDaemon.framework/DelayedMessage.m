@interface DelayedMessage
- (EFCancelable)token;
- (MFLibraryMessage)outboxCopy;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setOutboxCopy:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation DelayedMessage

- (EFCancelable)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (MFLibraryMessage)outboxCopy
{
  return self->_outboxCopy;
}

- (void)setOutboxCopy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outboxCopy, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end