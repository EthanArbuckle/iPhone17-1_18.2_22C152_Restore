@interface ENLinkedNoteStoreClient
+ (id)noteStoreClientForLinkedNotebookRef:(id)a3;
- (ENLinkedNoteStoreClientDelegate)delegate;
- (ENLinkedNotebookRef)linkedNotebookRef;
- (id)authenticationToken;
- (id)noteStoreUrl;
- (void)setDelegate:(id)a3;
- (void)setLinkedNotebookRef:(id)a3;
@end

@implementation ENLinkedNoteStoreClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedNotebookRef, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLinkedNotebookRef:(id)a3
{
}

- (ENLinkedNotebookRef)linkedNotebookRef
{
  return self->_linkedNotebookRef;
}

- (void)setDelegate:(id)a3
{
}

- (ENLinkedNoteStoreClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENLinkedNoteStoreClientDelegate *)WeakRetained;
}

- (id)noteStoreUrl
{
  v2 = [(ENLinkedNoteStoreClient *)self linkedNotebookRef];
  v3 = [v2 noteStoreUrl];

  return v3;
}

- (id)authenticationToken
{
  v4 = [(ENLinkedNoteStoreClient *)self delegate];

  if (!v4)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ENLinkedNoteStoreClient.m" lineNumber:46 description:@"ENLinkedNoteStoreClient delegate not set"];
  }
  v5 = [(ENLinkedNoteStoreClient *)self delegate];
  v6 = [(ENLinkedNoteStoreClient *)self linkedNotebookRef];
  v7 = [v5 authenticationTokenForLinkedNotebookRef:v6];

  return v7;
}

+ (id)noteStoreClientForLinkedNotebookRef:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ENLinkedNoteStoreClient);
  [(ENLinkedNoteStoreClient *)v4 setLinkedNotebookRef:v3];

  return v4;
}

@end