@interface MFMarkLibraryPurgeableUpgrader
+ (BOOL)isComplete;
+ (OS_os_log)log;
- (BOOL)_canRun;
- (BOOL)_mailboxNeedsToBeMarkedPurgeable:(id)a3;
- (BOOL)markDirectoryPurgeable:(id)a3 account:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
- (MFMarkLibraryPurgeableUpgrader)initWithMailboxUIDs:(id)a3;
- (NSArray)mailboxUIDs;
- (OS_os_activity)activity;
- (id)mailboxesNeededToBeMarkedPurgeable;
- (void)_removePurgeableXAttrForMailbox:(id)a3;
- (void)_setPurgeableXAttrForMailbox:(id)a3;
- (void)runMarkLibraryPurgeableUpgraderShouldDefer:(id)a3 completion:(id)a4;
- (void)setActivity:(id)a3;
@end

@implementation MFMarkLibraryPurgeableUpgrader

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076424;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BB98 != -1) {
    dispatch_once(&qword_10016BB98, block);
  }
  v2 = (void *)qword_10016BB90;

  return (OS_os_log *)v2;
}

- (MFMarkLibraryPurgeableUpgrader)initWithMailboxUIDs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMarkLibraryPurgeableUpgrader;
  v5 = [(MFMarkLibraryPurgeableUpgrader *)&v11 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    mailboxUIDs = v5->_mailboxUIDs;
    v5->_mailboxUIDs = v6;

    os_activity_t v8 = _os_activity_create((void *)&_mh_execute_header, "Mail mark library purgeable activity", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
    activity = v5->_activity;
    v5->_activity = (OS_os_activity *)v8;
  }
  return v5;
}

+ (BOOL)isComplete
{
  v2 = +[NSUserDefaults em_userDefaults];
  BOOL v3 = [v2 integerForKey:EMUserDefaultFilesMarkedPurgeable] == (id)1;

  return v3;
}

- (void)runMarkLibraryPurgeableUpgraderShouldDefer:(id)a3 completion:(id)a4
{
  id v42 = a3;
  v37 = (void (**)(id, uint64_t, void))a4;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v6 = [(MFMarkLibraryPurgeableUpgrader *)self activity];
  os_activity_scope_enter(v6, &state);

  if (![(MFMarkLibraryPurgeableUpgrader *)self _canRun])
  {
    v27 = +[MFMarkLibraryPurgeableUpgrader log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Library purgeable upgrader should not run", buf, 2u);
    }

    uint64_t v26 = 0;
    uint64_t v28 = 0;
    goto LABEL_44;
  }
  v7 = +[MFMarkLibraryPurgeableUpgrader log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Marking library purgeable", buf, 2u);
  }

  [(MFMarkLibraryPurgeableUpgrader *)self mailboxesNeededToBeMarkedPurgeable];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v8)
  {

    char v36 = 0;
    goto LABEL_33;
  }
  char v36 = 0;
  uint64_t v41 = *(void *)v51;
  id v40 = v8;
  char v38 = 1;
  *(void *)&long long v9 = 138412546;
  long long v35 = v9;
  do
  {
    for (i = 0; i != v40; i = (char *)i + 1)
    {
      if (*(void *)v51 != v41) {
        objc_enumerationMutation(obj);
      }
      objc_super v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "fullPath", v35);
      v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100076D44;
      v48[3] = &unk_10013C3D0;
      id v14 = v42;
      v48[4] = v11;
      id v49 = v14;
      v15 = objc_retainBlock(v48);
      v16 = +[MFMarkLibraryPurgeableUpgrader log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v11 fullPath];
        *(_DWORD *)buf = 138412290;
        v57 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Begin marking files in directory purgeable {%@}", buf, 0xCu);
      }
      v18 = [v11 account];
      id v47 = 0;
      unsigned int v19 = [(MFMarkLibraryPurgeableUpgrader *)self markDirectoryPurgeable:v13 account:v18 shouldCancel:v15 error:&v47];
      id v20 = v47;

      if (v19)
      {
        if (v20 && ([v20 code] == (id)1 || objc_msgSend(v20, "code") == (id)4))
        {
          char v38 = 0;
          int v21 = 0;
          goto LABEL_24;
        }
        [(MFMarkLibraryPurgeableUpgrader *)self _setPurgeableXAttrForMailbox:v11];
        v22 = +[MFMarkLibraryPurgeableUpgrader log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v11 fullPath];
          *(_DWORD *)buf = 138412290;
          v57 = v25;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Finished marking files purgeable in directory: {%@}", buf, 0xCu);
        }
      }
      else
      {
        v22 = +[MFMarkLibraryPurgeableUpgrader log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = [v11 fullPath];
          v24 = objc_msgSend(v20, "ef_publicDescription");
          *(_DWORD *)buf = v35;
          v57 = v23;
          __int16 v58 = 2114;
          v59 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error occured attempting to mark files purgeable in {%@}: %{public}@", buf, 0x16u);
        }
      }

      if (v42 && ((*((uint64_t (**)(id, void *))v42 + 2))(v14, v11) & 1) != 0)
      {
        char v38 = 0;
        int v21 = 0;
        char v36 = 1;
      }
      else
      {
        int v21 = 1;
      }
LABEL_24:

      if (!v21) {
        goto LABEL_27;
      }
    }
    id v40 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v40);
LABEL_27:

  if ((v38 & 1) == 0)
  {
    uint64_t v26 = 0;
    goto LABEL_43;
  }
LABEL_33:
  v29 = +[MFMarkLibraryPurgeableUpgrader log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Finishing Marking Library as Purgeable", buf, 2u);
  }

  v30 = +[NSUserDefaults em_userDefaults];
  [v30 setInteger:1 forKey:EMUserDefaultFilesMarkedPurgeable];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v31 = [(MFMarkLibraryPurgeableUpgrader *)self mailboxUIDs];
  id v32 = [v31 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v31);
        }
        [(MFMarkLibraryPurgeableUpgrader *)self _removePurgeableXAttrForMailbox:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
      }
      id v32 = [v31 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v32);
  }

  uint64_t v26 = 1;
LABEL_43:

  uint64_t v28 = v36 & 1;
LABEL_44:
  if (v37) {
    v37[2](v37, v26, v28);
  }
  os_activity_scope_leave(&state);
}

- (id)mailboxesNeededToBeMarkedPurgeable
{
  BOOL v3 = [(MFMarkLibraryPurgeableUpgrader *)self mailboxUIDs];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100076E18;
  v6[3] = &unk_10013AA18;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "ef_filter:", v6);

  return v4;
}

- (BOOL)_canRun
{
  if (+[MFMarkLibraryPurgeableUpgrader isComplete]) {
    return 0;
  }

  return +[MFLibraryCompressor libraryCompressionComplete];
}

- (BOOL)_mailboxNeedsToBeMarkedPurgeable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fullPath];
  if (v4
    && (+[NSFileManager defaultManager],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 fileExistsAtPath:v4],
        v5,
        v6))
  {
    v7 = +[NSFileManager defaultManager];
    id v13 = 0;
    id v8 = objc_msgSend(v7, "mf_valueForExtendedAttribute:ofItemAtPath:error:", @"com_apple_mail_markedPurgeable", v4, &v13);
    id v9 = v13;

    if (!v8)
    {
      v10 = +[MFMarkLibraryPurgeableUpgrader log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [v3 URL];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C1B18();
      }
    }
    BOOL v11 = [v8 length] == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_setPurgeableXAttrForMailbox:(id)a3
{
  id v3 = a3;
  id v4 = +[NSData dataWithBytes:"1" length:1];
  v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v3 fullPath];
  id v10 = 0;
  unsigned __int8 v7 = objc_msgSend(v5, "mf_setValue:forExtendedAttribute:ofItemAtPath:error:", v4, @"com_apple_mail_markedPurgeable", v6, &v10);
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    id v9 = +[MFMarkLibraryPurgeableUpgrader log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v3 URL];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C1B60();
    }
  }
}

- (void)_removePurgeableXAttrForMailbox:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v5 = [v3 fullPath];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    unsigned __int8 v7 = +[NSFileManager defaultManager];
    id v8 = [v3 fullPath];
    id v12 = 0;
    unsigned __int8 v9 = objc_msgSend(v7, "mf_setValue:forExtendedAttribute:ofItemAtPath:error:", 0, @"com_apple_mail_markedPurgeable", v8, &v12);
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      BOOL v11 = +[MFMarkLibraryPurgeableUpgrader log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [v3 URL];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C1BA8();
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

- (BOOL)markDirectoryPurgeable:(id)a3 account:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v39 = a4;
  id v42 = (unsigned int (**)(void))a5;
  id v9 = v8;
  if ([v9 fileSystemRepresentation])
  {
    id v38 = v9;
    v37 = strdup((const char *)[v38 fileSystemRepresentation]);
    v52[0] = v37;
    v52[1] = 0;
    id v10 = fts_open(v52, 80, 0);
    BOOL v11 = 0;
    int v12 = 0;
    char v40 = 1;
    while (1)
    {
      id v13 = fts_read(v10);
      if (!v13)
      {
LABEL_26:
        if (fts_close(v10) == -1)
        {
          uint64_t v32 = *__error();
          NSErrorUserInfoKey v48 = NSURLErrorKey;
          id v49 = v38;
          uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v32 userInfo:v33];

          v34 = +[MFMarkLibraryPurgeableUpgrader log];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            long long v35 = objc_msgSend(v26, "ef_publicDescription");
            sub_1000C1C4C(v35, (uint64_t)buf, (uint64_t)v38, v34);
          }

          char v27 = 0;
        }
        else
        {
          uint64_t v26 = v11;
          char v27 = v40;
        }
        free(v37);
        BOOL v31 = v27 & 1;
        goto LABEL_35;
      }
      id v15 = objc_alloc((Class)NSURL);
      v16 = +[NSString stringWithUTF8String:v13->fts_accpath];
      id v17 = [v15 initFileURLWithPath:v16];

      id v43 = 0;
      LODWORD(v16) = [v17 getResourceValue:&v43 forKey:NSURLIsDirectoryKey error:0];
      id v18 = v43;
      unsigned int v19 = v18;
      if (v16 && ([v18 BOOLValue] & 1) == 0)
      {
        char v21 = EFMarkFileAsPurgeable();
        id v22 = v11;

        if ((v21 & 1) == 0)
        {
          v25 = +[MFMarkLibraryPurgeableUpgrader log];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v38;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Error marking file purgeable: %@", buf, 0xCu);
          }

          if ([v22 code] == (id)1 || objc_msgSend(v22, "code") == (id)4)
          {
            char v40 = 0;
            char v20 = 0;
            goto LABEL_25;
          }
        }
        if (!v42) {
          goto LABEL_24;
        }
        if (v12 < 29)
        {
          char v20 = 1;
          BOOL v11 = v22;
        }
        else
        {
          if (!v42[2]())
          {
            int v12 = 0;
LABEL_24:
            char v20 = 1;
LABEL_25:
            BOOL v11 = v22;
            goto LABEL_7;
          }
          v23 = +[MFMarkLibraryPurgeableUpgrader log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v38;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Canceling marking directory purgeable: %@", buf, 0xCu);
          }

          NSErrorUserInfoKey v50 = NSURLErrorKey;
          id v51 = v38;
          v24 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          BOOL v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:4 userInfo:v24];

          char v40 = 0;
          char v20 = 0;
        }
        ++v12;
      }
      else
      {
        char v20 = 1;
      }
LABEL_7:

      if ((v20 & 1) == 0) {
        goto LABEL_26;
      }
    }
  }
  NSErrorUserInfoKey v44 = NSURLErrorKey;
  id v45 = v9;
  uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  uint64_t v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v28];

  v29 = +[MFMarkLibraryPurgeableUpgrader log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend(v26, "ef_publicDescription");
    sub_1000C1BF0(v30, (uint64_t)v9, (uint64_t)buf, v29);
  }

  BOOL v31 = 0;
LABEL_35:
  if (a6) {
    *a6 = v26;
  }

  return v31;
}

- (NSArray)mailboxUIDs
{
  return self->_mailboxUIDs;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_mailboxUIDs, 0);
}

@end