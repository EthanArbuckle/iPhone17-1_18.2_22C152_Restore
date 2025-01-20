@interface CNAuthorizationContextTestDouble
- (BOOL)isAddressingGrammarAccessGranted;
- (BOOL)isClientFirstOrSecondParty;
- (BOOL)isNotesAccessGranted;
- (void)setIsAddressingGrammarAccessGranted:(BOOL)a3;
- (void)setIsClientFirstOrSecondParty:(BOOL)a3;
- (void)setIsNotesAccessGranted:(BOOL)a3;
@end

@implementation CNAuthorizationContextTestDouble

- (BOOL)isNotesAccessGranted
{
  return self->_isNotesAccessGranted;
}

- (void)setIsNotesAccessGranted:(BOOL)a3
{
  self->_isNotesAccessGranted = a3;
}

- (BOOL)isAddressingGrammarAccessGranted
{
  return self->_isAddressingGrammarAccessGranted;
}

- (void)setIsAddressingGrammarAccessGranted:(BOOL)a3
{
  self->_isAddressingGrammarAccessGranted = a3;
}

- (BOOL)isClientFirstOrSecondParty
{
  return self->_isClientFirstOrSecondParty;
}

- (void)setIsClientFirstOrSecondParty:(BOOL)a3
{
  self->_isClientFirstOrSecondParty = a3;
}

@end