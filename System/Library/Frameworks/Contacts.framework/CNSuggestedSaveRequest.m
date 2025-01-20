@interface CNSuggestedSaveRequest
- (NSMutableSet)mutableConfirmedSuggestions;
- (NSMutableSet)mutableRejectedSuggestions;
- (NSSet)confirmedSuggestions;
- (NSSet)rejectedSuggestions;
- (id)storeIdentifier;
- (void)confirmSuggestion:(id)a3;
- (void)rejectSuggestion:(id)a3;
- (void)setMutableConfirmedSuggestions:(id)a3;
- (void)setMutableRejectedSuggestions:(id)a3;
@end

@implementation CNSuggestedSaveRequest

- (id)storeIdentifier
{
  return +[CNSuggestedContactStore storeIdentifier];
}

- (void)confirmSuggestion:(id)a3
{
  id v7 = a3;
  if ([v7 isSuggested])
  {
    mutableConfirmedSuggestions = self->_mutableConfirmedSuggestions;
    if (!mutableConfirmedSuggestions)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v6 = self->_mutableConfirmedSuggestions;
      self->_mutableConfirmedSuggestions = v5;

      mutableConfirmedSuggestions = self->_mutableConfirmedSuggestions;
    }
    [(NSMutableSet *)mutableConfirmedSuggestions addObject:v7];
  }
}

- (void)rejectSuggestion:(id)a3
{
  id v7 = a3;
  if ([v7 isSuggested])
  {
    mutableRejectedSuggestions = self->_mutableRejectedSuggestions;
    if (!mutableRejectedSuggestions)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v6 = self->_mutableRejectedSuggestions;
      self->_mutableRejectedSuggestions = v5;

      mutableRejectedSuggestions = self->_mutableRejectedSuggestions;
    }
    [(NSMutableSet *)mutableRejectedSuggestions addObject:v7];
  }
}

- (NSSet)confirmedSuggestions
{
  v2 = (void *)[(NSMutableSet *)self->_mutableConfirmedSuggestions copy];

  return (NSSet *)v2;
}

- (NSSet)rejectedSuggestions
{
  v2 = (void *)[(NSMutableSet *)self->_mutableRejectedSuggestions copy];

  return (NSSet *)v2;
}

- (NSMutableSet)mutableConfirmedSuggestions
{
  return self->_mutableConfirmedSuggestions;
}

- (void)setMutableConfirmedSuggestions:(id)a3
{
}

- (NSMutableSet)mutableRejectedSuggestions
{
  return self->_mutableRejectedSuggestions;
}

- (void)setMutableRejectedSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRejectedSuggestions, 0);

  objc_storeStrong((id *)&self->_mutableConfirmedSuggestions, 0);
}

@end