@interface IMDCoreSpotlightDispatchObject
+ (id)sharedInstance;
- (BOOL)allowsOverrideOfObjects;
- (BOOL)shouldAddToCoreRecents;
- (BOOL)shouldAddToSpotlight;
- (BOOL)shouldAddToSuggestions;
- (CRRecentContactsLibrary)recentsInstance;
- (IMDCoreSpotlightDispatchObject)init;
- (void)setAllowsOverrideOfObjects:(BOOL)a3;
- (void)setRecentsInstance:(id)a3;
- (void)setShouldAddToCoreRecents:(BOOL)a3;
- (void)setShouldAddToSpotlight:(BOOL)a3;
- (void)setShouldAddToSuggestions:(BOOL)a3;
@end

@implementation IMDCoreSpotlightDispatchObject

+ (id)sharedInstance
{
  if (qword_1EB5ABC00 != -1) {
    dispatch_once(&qword_1EB5ABC00, &unk_1F084C6A8);
  }
  v2 = (void *)qword_1EB5ABCE8;
  return v2;
}

- (IMDCoreSpotlightDispatchObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDCoreSpotlightDispatchObject;
  result = [(IMDCoreSpotlightDispatchObject *)&v3 init];
  if (result) {
    *(_DWORD *)&result->_allowsOverrideOfObjects = 16843009;
  }
  return result;
}

- (CRRecentContactsLibrary)recentsInstance
{
  return self->_recentsInstance;
}

- (void)setRecentsInstance:(id)a3
{
}

- (BOOL)allowsOverrideOfObjects
{
  return self->_allowsOverrideOfObjects;
}

- (void)setAllowsOverrideOfObjects:(BOOL)a3
{
  self->_allowsOverrideOfObjects = a3;
}

- (BOOL)shouldAddToSuggestions
{
  return self->_shouldAddToSuggestions;
}

- (void)setShouldAddToSuggestions:(BOOL)a3
{
  self->_shouldAddToSuggestions = a3;
}

- (BOOL)shouldAddToSpotlight
{
  return self->_shouldAddToSpotlight;
}

- (void)setShouldAddToSpotlight:(BOOL)a3
{
  self->_shouldAddToSpotlight = a3;
}

- (BOOL)shouldAddToCoreRecents
{
  return self->_shouldAddToCoreRecents;
}

- (void)setShouldAddToCoreRecents:(BOOL)a3
{
  self->_shouldAddToCoreRecents = a3;
}

- (void).cxx_destruct
{
}

@end