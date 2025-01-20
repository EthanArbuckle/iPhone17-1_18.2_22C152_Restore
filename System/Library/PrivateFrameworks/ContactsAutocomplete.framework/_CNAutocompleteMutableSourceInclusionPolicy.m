@interface _CNAutocompleteMutableSourceInclusionPolicy
- (BOOL)includeCalendarServers;
- (BOOL)includeContacts;
- (BOOL)includeDirectoryServers;
- (BOOL)includeLocalExtensions;
- (BOOL)includePredictions;
- (BOOL)includeRecents;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)includeSupplementalResults;
- (void)setIncludeCalendarServers:(BOOL)a3;
- (void)setIncludeContacts:(BOOL)a3;
- (void)setIncludeDirectoryServers:(BOOL)a3;
- (void)setIncludeLocalExtensions:(BOOL)a3;
- (void)setIncludePredictions:(BOOL)a3;
- (void)setIncludeRecents:(BOOL)a3;
- (void)setIncludeStewie:(BOOL)a3;
- (void)setIncludeSuggestions:(BOOL)a3;
- (void)setIncludeSupplementalResults:(BOOL)a3;
@end

@implementation _CNAutocompleteMutableSourceInclusionPolicy

- (BOOL)includeContacts
{
  return self->_includeContacts;
}

- (void)setIncludeContacts:(BOOL)a3
{
  self->_includeContacts = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeStewie
{
  return self->_includeStewie;
}

- (void)setIncludeStewie:(BOOL)a3
{
  self->_includeStewie = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeLocalExtensions
{
  return self->_includeLocalExtensions;
}

- (void)setIncludeLocalExtensions:(BOOL)a3
{
  self->_includeLocalExtensions = a3;
}

- (BOOL)includeDirectoryServers
{
  return self->_includeDirectoryServers;
}

- (void)setIncludeDirectoryServers:(BOOL)a3
{
  self->_includeDirectoryServers = a3;
}

- (BOOL)includeCalendarServers
{
  return self->_includeCalendarServers;
}

- (void)setIncludeCalendarServers:(BOOL)a3
{
  self->_includeCalendarServers = a3;
}

- (BOOL)includeSupplementalResults
{
  return self->_includeSupplementalResults;
}

- (void)setIncludeSupplementalResults:(BOOL)a3
{
  self->_includeSupplementalResults = a3;
}

- (BOOL)includePredictions
{
  return self->_includePredictions;
}

- (void)setIncludePredictions:(BOOL)a3
{
  self->_includePredictions = a3;
}

@end