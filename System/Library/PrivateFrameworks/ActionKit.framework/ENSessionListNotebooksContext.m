@interface ENSessionListNotebooksContext
- (NSCountedSet)sharedBusinessNotebookGuids;
- (NSError)error;
- (NSMutableArray)linkedPersonalNotebooks;
- (NSMutableArray)resultNotebooks;
- (NSMutableDictionary)businessNotebooks;
- (NSMutableDictionary)sharedBusinessNotebooks;
- (NSMutableDictionary)sharedNotebooks;
- (id)completion;
- (int64_t)pendingSharedNotebooks;
- (void)setBusinessNotebooks:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setError:(id)a3;
- (void)setLinkedPersonalNotebooks:(id)a3;
- (void)setPendingSharedNotebooks:(int64_t)a3;
- (void)setResultNotebooks:(id)a3;
- (void)setSharedBusinessNotebookGuids:(id)a3;
- (void)setSharedBusinessNotebooks:(id)a3;
- (void)setSharedNotebooks:(id)a3;
@end

@implementation ENSessionListNotebooksContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sharedNotebooks, 0);
  objc_storeStrong((id *)&self->_businessNotebooks, 0);
  objc_storeStrong((id *)&self->_sharedBusinessNotebookGuids, 0);
  objc_storeStrong((id *)&self->_sharedBusinessNotebooks, 0);
  objc_storeStrong((id *)&self->_linkedPersonalNotebooks, 0);
  objc_storeStrong((id *)&self->_resultNotebooks, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setPendingSharedNotebooks:(int64_t)a3
{
  self->_pendingSharedNotebooks = a3;
}

- (int64_t)pendingSharedNotebooks
{
  return self->_pendingSharedNotebooks;
}

- (void)setSharedNotebooks:(id)a3
{
}

- (NSMutableDictionary)sharedNotebooks
{
  return self->_sharedNotebooks;
}

- (void)setBusinessNotebooks:(id)a3
{
}

- (NSMutableDictionary)businessNotebooks
{
  return self->_businessNotebooks;
}

- (void)setSharedBusinessNotebookGuids:(id)a3
{
}

- (NSCountedSet)sharedBusinessNotebookGuids
{
  return self->_sharedBusinessNotebookGuids;
}

- (void)setSharedBusinessNotebooks:(id)a3
{
}

- (NSMutableDictionary)sharedBusinessNotebooks
{
  return self->_sharedBusinessNotebooks;
}

- (void)setLinkedPersonalNotebooks:(id)a3
{
}

- (NSMutableArray)linkedPersonalNotebooks
{
  return self->_linkedPersonalNotebooks;
}

- (void)setResultNotebooks:(id)a3
{
}

- (NSMutableArray)resultNotebooks
{
  return self->_resultNotebooks;
}

@end