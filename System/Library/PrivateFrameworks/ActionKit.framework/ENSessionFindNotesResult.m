@interface ENSessionFindNotesResult
- (BOOL)hasResources;
- (ENNoteRef)noteRef;
- (ENNotebook)notebook;
- (NSDate)created;
- (NSDate)updated;
- (NSString)title;
- (id)description;
- (int)updateSequenceNum;
- (void)setCreated:(id)a3;
- (void)setHasResources:(BOOL)a3;
- (void)setNoteRef:(id)a3;
- (void)setNotebook:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateSequenceNum:(int)a3;
- (void)setUpdated:(id)a3;
@end

@implementation ENSessionFindNotesResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
  objc_storeStrong((id *)&self->_noteRef, 0);
}

- (void)setUpdateSequenceNum:(int)a3
{
  self->_updateSequenceNum = a3;
}

- (int)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setHasResources:(BOOL)a3
{
  self->_hasResources = a3;
}

- (BOOL)hasResources
{
  return self->_hasResources;
}

- (void)setUpdated:(id)a3
{
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setCreated:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setNotebook:(id)a3
{
}

- (ENNotebook)notebook
{
  return self->_notebook;
}

- (void)setNoteRef:(id)a3
{
}

- (ENNoteRef)noteRef
{
  return self->_noteRef;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ENSessionFindNotesResult *)self title];
  v6 = [(ENSessionFindNotesResult *)self notebook];
  v7 = [v6 name];
  v8 = [(ENSessionFindNotesResult *)self created];
  v9 = [(ENSessionFindNotesResult *)self updated];
  uint64_t v10 = [(ENSessionFindNotesResult *)self updateSequenceNum];
  v11 = [(ENSessionFindNotesResult *)self noteRef];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title = \"%@\"; notebook name = \"%@\"; created = %@; updated = %@; usn = %d; noteRef = %p>",
    v4,
    self,
    v5,
    v7,
    v8,
    v9,
    v10,
  v12 = v11);

  return v12;
}

@end