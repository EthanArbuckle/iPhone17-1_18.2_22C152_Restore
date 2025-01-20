@interface ENSessionFindNotesContext
- (BOOL)requiresLocalMerge;
- (BOOL)sortAscending;
- (EDAMNoteFilter)noteFilter;
- (EDAMNotesMetadataResultSpec)resultSpec;
- (ENNotebook)scopeNotebook;
- (NSArray)allNotebooks;
- (NSArray)results;
- (NSMutableArray)findMetadataResults;
- (NSMutableArray)linkedNotebooksToSearch;
- (NSSet)resultGuidsFromBusiness;
- (id)completion;
- (unint64_t)maxResults;
- (unint64_t)scope;
- (unint64_t)sortOrder;
- (void)setAllNotebooks:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFindMetadataResults:(id)a3;
- (void)setLinkedNotebooksToSearch:(id)a3;
- (void)setMaxResults:(unint64_t)a3;
- (void)setNoteFilter:(id)a3;
- (void)setRequiresLocalMerge:(BOOL)a3;
- (void)setResultGuidsFromBusiness:(id)a3;
- (void)setResultSpec:(id)a3;
- (void)setResults:(id)a3;
- (void)setScope:(unint64_t)a3;
- (void)setScopeNotebook:(id)a3;
- (void)setSortAscending:(BOOL)a3;
- (void)setSortOrder:(unint64_t)a3;
@end

@implementation ENSessionFindNotesContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_resultGuidsFromBusiness, 0);
  objc_storeStrong((id *)&self->_findMetadataResults, 0);
  objc_storeStrong((id *)&self->_linkedNotebooksToSearch, 0);
  objc_storeStrong((id *)&self->_allNotebooks, 0);
  objc_storeStrong((id *)&self->_resultSpec, 0);
  objc_storeStrong((id *)&self->_noteFilter, 0);
  objc_storeStrong((id *)&self->_scopeNotebook, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResultGuidsFromBusiness:(id)a3
{
}

- (NSSet)resultGuidsFromBusiness
{
  return self->_resultGuidsFromBusiness;
}

- (void)setFindMetadataResults:(id)a3
{
}

- (NSMutableArray)findMetadataResults
{
  return self->_findMetadataResults;
}

- (void)setLinkedNotebooksToSearch:(id)a3
{
}

- (NSMutableArray)linkedNotebooksToSearch
{
  return self->_linkedNotebooksToSearch;
}

- (void)setAllNotebooks:(id)a3
{
}

- (NSArray)allNotebooks
{
  return self->_allNotebooks;
}

- (void)setSortAscending:(BOOL)a3
{
  self->_sortAscending = a3;
}

- (BOOL)sortAscending
{
  return self->_sortAscending;
}

- (void)setRequiresLocalMerge:(BOOL)a3
{
  self->_requiresLocalMerge = a3;
}

- (BOOL)requiresLocalMerge
{
  return self->_requiresLocalMerge;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setResultSpec:(id)a3
{
}

- (EDAMNotesMetadataResultSpec)resultSpec
{
  return self->_resultSpec;
}

- (void)setNoteFilter:(id)a3
{
}

- (EDAMNoteFilter)noteFilter
{
  return self->_noteFilter;
}

- (void)setSortOrder:(unint64_t)a3
{
  self->_sortOrder = a3;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScopeNotebook:(id)a3
{
}

- (ENNotebook)scopeNotebook
{
  return self->_scopeNotebook;
}

@end