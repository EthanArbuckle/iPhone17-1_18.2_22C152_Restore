@interface NotesDataclassOwner
+ (id)dataclasses;
- (BOOL)_createNoteAccountForACAccount:(id)a3 withChildren:(id)a4;
- (BOOL)_drainLocalStore;
- (BOOL)_removeNoteAccountForACAccount:(id)a3 withChildren:(id)a4;
- (BOOL)accountHasLocalUnsyncedData:(id)a3;
- (BOOL)htmlAccountHasLocalUnsyncedData:(id)a3;
- (BOOL)modernAccountHasLocalUnsyncedData:(id)a3;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (NotesDataclassOwner)init;
- (id)_accountStore;
- (id)_noteContext;
- (id)_syncingAccountForParentAccount:(id)a3 withChildren:(id)a4;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (void)setUpSharedContextIfNecessary;
@end

@implementation NotesDataclassOwner

+ (id)dataclasses
{
  uint64_t v4 = ACAccountDataclassNotes;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (NotesDataclassOwner)init
{
  v7.receiver = self;
  v7.super_class = (Class)NotesDataclassOwner;
  v2 = [(NotesDataclassOwner *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dco.notes", v3);
    noteContextQueue = v2->_noteContextQueue;
    v2->_noteContextQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setUpSharedContextIfNecessary
{
  if (qword_C8C8 != -1) {
    dispatch_once(&qword_C8C8, &stru_81E0);
  }
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return [(NotesDataclassOwner *)self actionsForEnablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return [(NotesDataclassOwner *)self actionsForDisablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  uint64_t v6 = ACAccountDataclassNotes;
  if ([a4 isEqualToString:ACAccountDataclassNotes]
    && [v5 isProvisionedForDataclass:v6])
  {
    objc_super v7 = +[ACDataclassAction actionWithType:1];
    v10 = v7;
    v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if ([v5 isProvisionedForDataclass:ACAccountDataclassNotes])
  {
    [(NotesDataclassOwner *)self setUpSharedContextIfNecessary];
    if ([(NotesDataclassOwner *)self accountHasLocalUnsyncedData:v5]) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 3;
    }
    objc_super v7 = +[ACDataclassAction destructiveActionWithType:v6];
    v11[0] = v7;
    v8 = +[ACDataclassAction actionWithType:0];
    v11[1] = v8;
    v9 = +[NSArray arrayWithObjects:v11 count:2];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)accountHasLocalUnsyncedData:(id)a3
{
  uint64_t v44 = 0;
  v45[0] = &v44;
  v45[1] = 0x2020000000;
  char v46 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_51B4;
  v42 = sub_51C4;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_51B4;
  v36 = sub_51C4;
  id v37 = 0;
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_63B8();
  }

  uint64_t v6 = [v4 parentAccount];

  objc_super v7 = v4;
  if (v6)
  {
    objc_super v7 = [v4 parentAccount];
  }
  v8 = +[ICNoteContext sharedContext];
  v9 = [v8 workerManagedObjectContext];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_51CC;
  v28[3] = &unk_8208;
  v31 = &v38;
  id v10 = v7;
  id v29 = v10;
  id v11 = v9;
  id v30 = v11;
  [v11 performBlockAndWait:v28];
  v12 = (void *)v39[5];
  if (v12 && [v12 didChooseToMigrate])
  {
    v13 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend((id)v39[5], "ic_loggingDescription");
      sub_6368(v14, (uint64_t)buf, v13);
    }

    unsigned __int8 v15 = [(NotesDataclassOwner *)self modernAccountHasLocalUnsyncedData:v39[5]];
    *(unsigned char *)(v45[0] + 24) = v15;
  }
  else
  {
    noteContextQueue = self->_noteContextQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5248;
    block[3] = &unk_8230;
    block[4] = self;
    id v17 = v4;
    id v25 = v17;
    v26 = &v32;
    v27 = &v44;
    dispatch_sync((dispatch_queue_t)noteContextQueue, block);
    if (!v39[5] && !v33[5])
    {
      v18 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v17 description];
        id v23 = [v22 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v48 = v23;
        _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "unable to find a modern or HTML account for %s", buf, 0xCu);
      }
    }
  }
  v19 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_62E8((uint64_t)v45, v19);
  }

  BOOL v20 = *(unsigned char *)(v45[0] + 24) != 0;
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v20;
}

- (BOOL)modernAccountHasLocalUnsyncedData:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [v3 managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5488;
  v7[3] = &unk_8280;
  id v5 = v3;
  id v8 = v5;
  v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (BOOL)htmlAccountHasLocalUnsyncedData:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [v3 managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5700;
  v7[3] = &unk_82E8;
  v9 = &v10;
  id v5 = v3;
  id v8 = v5;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 accountType];
  char v13 = [v12 identifier];
  if ([v13 isEqualToString:ACAccountTypeIdentifierExchange])
  {
  }
  else
  {
    v14 = [v12 identifier];
    unsigned int v15 = [v14 isEqualToString:ACAccountTypeIdentifierHotmail];

    if (!v15)
    {
      v18 = [v12 supportedDataclasses];
      unsigned int v19 = [v18 containsObject:ACAccountDataclassNotes];

      if (v19)
      {
        if ([v9 type] == (char *)&dword_0 + 1) {
          goto LABEL_13;
        }
        if ([v9 type] == (char *)&dword_0 + 3)
        {
LABEL_15:
          unsigned __int8 v20 = [(NotesDataclassOwner *)self _removeNoteAccountForACAccount:v10 withChildren:v11];
          goto LABEL_16;
        }
      }
LABEL_17:
      LOBYTE(v17) = 0;
      goto LABEL_18;
    }
  }
  if ([v9 type] != (char *)&dword_4 + 2)
  {
    if ([v9 type] != (char *)&dword_0 + 1 && objc_msgSend(v9, "type") != &dword_4)
    {
      if ([v9 type] != (char *)&dword_0 + 3 && objc_msgSend(v9, "type") != &dword_8) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
LABEL_13:
    unsigned __int8 v20 = [(NotesDataclassOwner *)self _createNoteAccountForACAccount:v10 withChildren:v11];
LABEL_16:
    LOBYTE(v17) = v20;
    goto LABEL_18;
  }
  unsigned int v16 = [(NotesDataclassOwner *)self _drainLocalStore];
  unsigned int v17 = v16 & [(NotesDataclassOwner *)self _createNoteAccountForACAccount:v10 withChildren:v11];
LABEL_18:

  return v17;
}

- (BOOL)_createNoteAccountForACAccount:(id)a3 withChildren:(id)a4
{
  return 1;
}

- (BOOL)_removeNoteAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v8 = [(NotesDataclassOwner *)self _syncingAccountForParentAccount:v6 withChildren:v7];
  id v9 = v8;
  if (v8)
  {
    noteContextQueue = self->_noteContextQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5B2C;
    block[3] = &unk_8310;
    block[4] = self;
    id v16 = v8;
    unsigned int v17 = &v18;
    dispatch_sync((dispatch_queue_t)noteContextQueue, block);
    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = [v6 username];
      sub_64BC(v13, (uint64_t)v22, v12);
    }

    BOOL v11 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)_drainLocalStore
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  noteContextQueue = self->_noteContextQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5D94;
  v5[3] = &unk_8280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)noteContextQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_syncingAccountForParentAccount:(id)a3 withChildren:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 accountType];
  uint64_t v8 = [v7 syncableDataclasses];
  uint64_t v9 = ACAccountDataclassNotes;
  unsigned int v10 = [v8 containsObject:ACAccountDataclassNotes];

  if (v10)
  {
    id v11 = v5;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          unsigned int v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v18 = [v17 accountType];
          unsigned int v19 = [v18 syncableDataclasses];
          unsigned __int8 v20 = [v19 containsObject:v9];

          if (v20)
          {
            id v11 = v17;

            goto LABEL_15;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    char v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_6654(v5, v21);
    }

    id v11 = 0;
LABEL_15:
    id v6 = v23;
  }

  return v11;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = +[ACAccountStore defaultStore];
    id v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)_noteContext
{
  noteContext = self->_noteContext;
  if (noteContext)
  {
    [(NoteContext *)noteContext invalidate];
  }
  else
  {
    id v4 = (NoteContext *)[objc_alloc((Class)NoteContext) initWithPrivateQueue];
    id v5 = self->_noteContext;
    self->_noteContext = v4;

    [(NoteContext *)self->_noteContext enableChangeLogging:0];
  }
  id v6 = self->_noteContext;
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_noteContextQueue, 0);
  objc_storeStrong((id *)&self->_noteContext, 0);
}

@end