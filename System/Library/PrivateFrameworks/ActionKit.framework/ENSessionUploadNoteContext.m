@interface ENSessionUploadNoteContext
- (EDAMNote)note;
- (ENNoteRef)noteRef;
- (ENNoteRef)refToReplace;
- (ENNoteStoreClient)noteStore;
- (ENNotebook)notebook;
- (id)completion;
- (id)progress;
- (int64_t)policy;
- (void)setCompletion:(id)a3;
- (void)setNote:(id)a3;
- (void)setNoteRef:(id)a3;
- (void)setNoteStore:(id)a3;
- (void)setNotebook:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setRefToReplace:(id)a3;
@end

@implementation ENSessionUploadNoteContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteRef, 0);
  objc_storeStrong((id *)&self->_noteStore, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
  objc_storeStrong((id *)&self->_refToReplace, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

- (void)setNoteRef:(id)a3
{
}

- (ENNoteRef)noteRef
{
  return self->_noteRef;
}

- (void)setNoteStore:(id)a3
{
}

- (ENNoteStoreClient)noteStore
{
  return self->_noteStore;
}

- (void)setProgress:(id)a3
{
}

- (id)progress
{
  return self->_progress;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setNotebook:(id)a3
{
}

- (ENNotebook)notebook
{
  return self->_notebook;
}

- (void)setRefToReplace:(id)a3
{
}

- (ENNoteRef)refToReplace
{
  return self->_refToReplace;
}

- (void)setNote:(id)a3
{
}

- (EDAMNote)note
{
  return self->_note;
}

@end