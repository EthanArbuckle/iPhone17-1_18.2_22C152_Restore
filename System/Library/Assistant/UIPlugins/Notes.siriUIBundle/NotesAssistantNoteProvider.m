@interface NotesAssistantNoteProvider
+ (id)htmlManagedObjectContext;
- (ICNote)note;
- (NSString)noteContents;
- (NSString)noteTitle;
- (NoteObject)htmlNote;
- (NotesAssistantNoteProvider)initWithAceObject:(id)a3;
- (id)stringForExpression:(id)a3;
- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4;
- (void)setHtmlNote:(id)a3;
- (void)setNote:(id)a3;
- (void)setNoteContents:(id)a3;
- (void)setNoteTitle:(id)a3;
@end

@implementation NotesAssistantNoteProvider

+ (id)htmlManagedObjectContext
{
  v2 = +[NoteContext sharedContext];
  v3 = [v2 managedObjectContext];

  return v3;
}

- (NotesAssistantNoteProvider)initWithAceObject:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NotesAssistantNoteProvider;
  v5 = [(NotesAssistantNoteProvider *)&v24 init];
  if (v5)
  {
    v6 = [v4 identifier];
    v7 = os_log_create("com.apple.notes", "Siri");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_C218(v6, v4, v7);
    }

    v8 = +[ICNoteContext sharedContext];
    v9 = [v8 managedObjectContext];
    v10 = [(id)objc_opt_class() htmlManagedObjectContext];
    v11 = +[NotesAssistantUtilities searchIndexableNoteForObject:v4 modernNoteContext:v9 htmlNoteContext:v10];

    objc_opt_class();
    uint64_t v12 = ICDynamicCast();
    note = v5->_note;
    v5->_note = (ICNote *)v12;

    objc_opt_class();
    uint64_t v14 = ICDynamicCast();
    htmlNote = v5->_htmlNote;
    v5->_htmlNote = (NoteObject *)v14;

    uint64_t v16 = [v4 title];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [v4 contents];

      if (v18)
      {
        uint64_t v19 = [v4 title];
        noteTitle = v5->_noteTitle;
        v5->_noteTitle = (NSString *)v19;

        uint64_t v21 = [v4 contents];
        noteContents = v5->_noteContents;
        v5->_noteContents = (NSString *)v21;
      }
    }
  }
  return v5;
}

- (id)stringForExpression:(id)a3
{
  return [(NotesAssistantNoteProvider *)self stringForExpression:a3 containsPrivacySensitiveContents:0];
}

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4) {
    *a4 = 1;
  }
  if (![v6 isEqualToString:SANoteObjectDeferredTitleKeyValue])
  {
    if (![v7 isEqualToString:SANoteObjectDeferredContentsKeyValue])
    {
      uint64_t v19 = 0;
      if (a4) {
        *a4 = 0;
      }
      goto LABEL_22;
    }
    v10 = [(NotesAssistantNoteProvider *)self note];

    if (v10)
    {
      v11 = [(NotesAssistantNoteProvider *)self note];
      unsigned __int8 v12 = [v11 isPasswordProtected];

      v13 = [(NotesAssistantNoteProvider *)self note];
      uint64_t v14 = v13;
      if (v12)
      {
        v15 = [v13 title];
        uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"This note is password protected." value:&stru_186B0 table:@"NotesAssistant"];
        v18 = [v15 stringByAppendingFormat:@"\n\n%@", v17];

LABEL_19:
LABEL_20:
        objc_super v24 = objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", @"(\n)+", @"\n", 1024, 0, objc_msgSend(v18, "length"));

        uint64_t v19 = [v24 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\x1B\\pause=500\\""];

        goto LABEL_22;
      }
      uint64_t v23 = [v13 noteAsPlainText];
    }
    else
    {
      v22 = [(NotesAssistantNoteProvider *)self htmlNote];

      if (!v22)
      {
        v18 = [(NotesAssistantNoteProvider *)self noteContents];
        goto LABEL_20;
      }
      uint64_t v14 = [(NotesAssistantNoteProvider *)self htmlNote];
      uint64_t v23 = [v14 contentAsPlainTextPreservingNewlines];
    }
    v18 = (void *)v23;
    goto LABEL_19;
  }
  v8 = [(NotesAssistantNoteProvider *)self note];

  if (v8)
  {
    v9 = [(NotesAssistantNoteProvider *)self note];
LABEL_14:
    uint64_t v21 = v9;
    uint64_t v19 = [v9 title];

    goto LABEL_22;
  }
  v20 = [(NotesAssistantNoteProvider *)self htmlNote];

  if (v20)
  {
    v9 = [(NotesAssistantNoteProvider *)self htmlNote];
    goto LABEL_14;
  }
  uint64_t v19 = [(NotesAssistantNoteProvider *)self noteTitle];
LABEL_22:

  return v19;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NoteObject)htmlNote
{
  return self->_htmlNote;
}

- (void)setHtmlNote:(id)a3
{
}

- (NSString)noteTitle
{
  return self->_noteTitle;
}

- (void)setNoteTitle:(id)a3
{
}

- (NSString)noteContents
{
  return self->_noteContents;
}

- (void)setNoteContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteContents, 0);
  objc_storeStrong((id *)&self->_noteTitle, 0);
  objc_storeStrong((id *)&self->_htmlNote, 0);

  objc_storeStrong((id *)&self->_note, 0);
}

@end