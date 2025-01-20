@interface NotesAssistantUtilities
+ (id)URLForSearchIndexableNote:(id)a3;
+ (id)saNoteObjectForSearchIndexableNote:(id)a3;
+ (id)searchIndexableNoteForObject:(id)a3 modernNoteContext:(id)a4 htmlNoteContext:(id)a5;
+ (id)sharedHTMLNoteManagedObjectContext;
@end

@implementation NotesAssistantUtilities

+ (id)sharedHTMLNoteManagedObjectContext
{
  v2 = +[NoteContext sharedContext];
  v3 = [v2 managedObjectContext];

  return v3;
}

+ (id)saNoteObjectForSearchIndexableNote:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_B7C4;
  v16 = sub_B7D4;
  id v17 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 managedObjectContext];
    v6 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B7DC;
    v11[3] = &unk_18600;
    v11[5] = &v12;
    v11[4] = v4;
    [v5 performBlockAndWait:v11];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = v3;
    v5 = [v7 managedObjectContext];
    v6 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_B8EC;
    v10[3] = &unk_18600;
    v10[5] = &v12;
    v10[4] = v7;
    [v5 performBlockAndWait:v10];
  }

LABEL_6:
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

+ (id)searchIndexableNoteForObject:(id)a3 modernNoteContext:(id)a4 htmlNoteContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_B7C4;
  v34 = sub_B7D4;
  ICProtocolCast();
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v31[5];
  if (!v10)
  {
    objc_opt_class();
    v11 = ICDynamicCast();
    objc_opt_class();
    uint64_t v12 = ICDynamicCast();
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 identifier];

      v11 = (void *)v14;
    }
    if (!v11) {
      goto LABEL_12;
    }
    if (+[ICAppURLUtilities isShowNoteURL:v11])
    {
      v15 = +[ICAppURLUtilities predicateForNotesMentionedInURL:v11];
      id v16 = v15;
      if (!v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_BCEC;
      v26[3] = &unk_18628;
      id v16 = v15;
      id v27 = v16;
      id v28 = v8;
      v29 = &v30;
      [v28 performBlockAndWait:v26];

      id v17 = v27;
    }
    else
    {
      if (!+[ICAppURLUtilities isShowHTMLNoteURL:v11])
      {
LABEL_12:

        v10 = (void *)v31[5];
        goto LABEL_13;
      }
      id v16 = +[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:v11];
      v18 = [v9 persistentStoreCoordinator];
      v19 = [v18 managedObjectIDForURIRepresentation:v16];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_BD84;
      v22[3] = &unk_18650;
      v25 = &v30;
      id v23 = v9;
      id v17 = v19;
      id v24 = v17;
      [v23 performBlockAndWait:v22];
    }
    goto LABEL_11;
  }
LABEL_13:
  id v20 = v10;
  _Block_object_dispose(&v30, 8);

  return v20;
}

+ (id)URLForSearchIndexableNote:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[ICAppURLUtilities appURLForNote:v3];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[ICAppURLUtilities appURLForHTMLNote:v3];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end