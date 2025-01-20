@interface VSJSAppResponsePayload
- (NSArray)userAccounts;
- (void)setUserAccounts:(id)a3;
@end

@implementation VSJSAppResponsePayload

- (void)setUserAccounts:(id)a3
{
  if (a3) {
    self->_userAccounts = (NSArray *)[a3 copy];
  }
  else {
    self->_userAccounts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  MEMORY[0x1F41817F8]();
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void).cxx_destruct
{
}

@end