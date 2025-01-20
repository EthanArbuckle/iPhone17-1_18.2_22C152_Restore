@interface EKDirectorySearchQuery
- (BOOL)findGroups;
- (BOOL)findLocations;
- (BOOL)findResources;
- (BOOL)findUsers;
- (NSSet)terms;
- (unint64_t)resultLimit;
- (void)setFindGroups:(BOOL)a3;
- (void)setFindLocations:(BOOL)a3;
- (void)setFindResources:(BOOL)a3;
- (void)setFindUsers:(BOOL)a3;
- (void)setResultLimit:(unint64_t)a3;
- (void)setTerms:(id)a3;
@end

@implementation EKDirectorySearchQuery

- (NSSet)terms
{
  return self->_terms;
}

- (void)setTerms:(id)a3
{
}

- (BOOL)findGroups
{
  return self->_findGroups;
}

- (void)setFindGroups:(BOOL)a3
{
  self->_findGroups = a3;
}

- (BOOL)findLocations
{
  return self->_findLocations;
}

- (void)setFindLocations:(BOOL)a3
{
  self->_findLocations = a3;
}

- (BOOL)findResources
{
  return self->_findResources;
}

- (void)setFindResources:(BOOL)a3
{
  self->_findResources = a3;
}

- (BOOL)findUsers
{
  return self->_findUsers;
}

- (void)setFindUsers:(BOOL)a3
{
  self->_findUsers = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (void).cxx_destruct
{
}

@end