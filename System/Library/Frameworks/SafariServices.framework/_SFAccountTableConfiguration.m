@interface _SFAccountTableConfiguration
- (BOOL)isForFillingIndividualAccountFields;
- (BOOL)shouldConfigureMultipleSelectionDuringEditing;
- (BOOL)shouldShowSearchBar;
- (BOOL)supportsDelete;
- (BOOL)supportsOngoingCredentialSharing;
- (BOOL)supportsShare;
- (void)setIsForFillingIndividualAccountFields:(BOOL)a3;
- (void)setShouldConfigureMultipleSelectionDuringEditing:(BOOL)a3;
- (void)setShouldShowSearchBar:(BOOL)a3;
- (void)setSupportsDelete:(BOOL)a3;
- (void)setSupportsOngoingCredentialSharing:(BOOL)a3;
- (void)setSupportsShare:(BOOL)a3;
@end

@implementation _SFAccountTableConfiguration

- (BOOL)shouldShowSearchBar
{
  return self->_shouldShowSearchBar;
}

- (void)setShouldShowSearchBar:(BOOL)a3
{
  self->_shouldShowSearchBar = a3;
}

- (BOOL)supportsDelete
{
  return self->_supportsDelete;
}

- (void)setSupportsDelete:(BOOL)a3
{
  self->_supportsDelete = a3;
}

- (BOOL)supportsShare
{
  return self->_supportsShare;
}

- (void)setSupportsShare:(BOOL)a3
{
  self->_supportsShare = a3;
}

- (BOOL)shouldConfigureMultipleSelectionDuringEditing
{
  return self->_shouldConfigureMultipleSelectionDuringEditing;
}

- (void)setShouldConfigureMultipleSelectionDuringEditing:(BOOL)a3
{
  self->_shouldConfigureMultipleSelectionDuringEditing = a3;
}

- (BOOL)supportsOngoingCredentialSharing
{
  return self->_supportsOngoingCredentialSharing;
}

- (void)setSupportsOngoingCredentialSharing:(BOOL)a3
{
  self->_supportsOngoingCredentialSharing = a3;
}

- (BOOL)isForFillingIndividualAccountFields
{
  return self->_isForFillingIndividualAccountFields;
}

- (void)setIsForFillingIndividualAccountFields:(BOOL)a3
{
  self->_isForFillingIndividualAccountFields = a3;
}

@end