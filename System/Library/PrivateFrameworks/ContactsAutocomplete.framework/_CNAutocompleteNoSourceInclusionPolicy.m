@interface _CNAutocompleteNoSourceInclusionPolicy
- (BOOL)includeCalendarServers;
- (BOOL)includeContacts;
- (BOOL)includeDirectoryServers;
- (BOOL)includeLocalExtensions;
- (BOOL)includePredictions;
- (BOOL)includeRecents;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)includeSupplementalResults;
@end

@implementation _CNAutocompleteNoSourceInclusionPolicy

- (BOOL)includeContacts
{
  return 0;
}

- (BOOL)includeRecents
{
  return 0;
}

- (BOOL)includeStewie
{
  return 0;
}

- (BOOL)includeSuggestions
{
  return 0;
}

- (BOOL)includeLocalExtensions
{
  return 0;
}

- (BOOL)includePredictions
{
  return 0;
}

- (BOOL)includeDirectoryServers
{
  return 0;
}

- (BOOL)includeCalendarServers
{
  return 0;
}

- (BOOL)includeSupplementalResults
{
  return 0;
}

@end