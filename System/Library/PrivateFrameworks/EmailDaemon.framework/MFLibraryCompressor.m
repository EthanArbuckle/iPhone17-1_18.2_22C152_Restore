@interface MFLibraryCompressor
+ (BOOL)libraryCompressionComplete;
+ (OS_os_log)log;
- (BOOL)_mailboxNeedsCompression:(id)a3;
- (MFLibraryCompressor)initWithMailboxUIDs:(id)a3;
- (NSArray)mailboxUIDs;
- (OS_os_activity)libraryCompressionActivity;
- (id)mailboxesNeedingCompression;
- (void)_markMailboxCompressed:(id)a3;
- (void)_removeCompressedXAttr:(id)a3;
- (void)runLibraryCompressionShouldDefer:(id)a3 completion:(id)a4;
- (void)setLibraryCompressionActivity:(id)a3;
@end

@implementation MFLibraryCompressor

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FCB0;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BB30 != -1) {
    dispatch_once(&qword_10016BB30, block);
  }
  v2 = (void *)qword_10016BB28;

  return (OS_os_log *)v2;
}

- (MFLibraryCompressor)initWithMailboxUIDs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFLibraryCompressor;
  v5 = [(MFLibraryCompressor *)&v11 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    mailboxUIDs = v5->_mailboxUIDs;
    v5->_mailboxUIDs = v6;

    os_activity_t v8 = _os_activity_create((void *)&_mh_execute_header, "Mail library compression activity", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
    libraryCompressionActivity = v5->_libraryCompressionActivity;
    v5->_libraryCompressionActivity = (OS_os_activity *)v8;
  }
  return v5;
}

+ (BOOL)libraryCompressionComplete
{
  v2 = +[NSUserDefaults em_userDefaults];
  BOOL v3 = [v2 integerForKey:@"MFLibraryCompressorDefaultsUpgradeStateKey"] == (id)1;

  return v3;
}

- (void)runLibraryCompressionShouldDefer:(id)a3 completion:(id)a4
{
  id v42 = a3;
  v36 = (void (**)(id, uint64_t, void))a4;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v6 = [(MFLibraryCompressor *)self libraryCompressionActivity];
  os_activity_scope_enter(v6, &state);

  if (+[MFLibraryCompressor libraryCompressionComplete])
  {
    v7 = +[MFLibraryCompressor log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C191C(v7);
    }
    char v38 = 0;
    uint64_t v8 = 1;
    goto LABEL_44;
  }
  v9 = +[MFLibraryCompressor log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Running library compression", buf, 2u);
  }

  [(MFLibraryCompressor *)self mailboxesNeedingCompression];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v10)
  {

    char v38 = 0;
    goto LABEL_33;
  }
  id v40 = v10;
  uint64_t v41 = *(void *)v51;
  char v37 = 1;
  char v38 = 0;
  *(void *)&long long v11 = 138412546;
  long long v35 = v11;
  do
  {
    for (i = 0; i != v40; i = (char *)i + 1)
    {
      if (*(void *)v51 != v41) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "fullPath", v35);
      v15 = +[NSURL fileURLWithPath:v14 isDirectory:1];

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000705C0;
      v48[3] = &unk_10013C3D0;
      id v16 = v42;
      v48[4] = v13;
      id v49 = v16;
      v17 = objc_retainBlock(v48);
      v18 = +[MFLibraryCompressor log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v13 URL];
        *(_DWORD *)buf = 138412290;
        v57 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Begin compressing mailbox directory \"%@\"", buf, 0xCu);
      }
      id v47 = 0;
      unsigned int v20 = +[EFFileCompression compressDirectory:v15 shouldCancel:v17 error:&v47];
      id v21 = v47;
      v22 = v21;
      if (v20)
      {
        if (v21 && ([v21 code] == (id)1 || objc_msgSend(v22, "code") == (id)4))
        {
LABEL_24:
          int v25 = 0;
          char v37 = 0;
          char v38 = 1;
          goto LABEL_26;
        }
        [(MFLibraryCompressor *)self _markMailboxCompressed:v13];
        v23 = +[MFLibraryCompressor log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [v13 URL];
          *(_DWORD *)buf = 138412290;
          v57 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Finished compressing mailbox directory \"%@\"", buf, 0xCu);
        }
      }
      else
      {
        v23 = +[MFLibraryCompressor log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v26 = [v13 URL];
          v27 = objc_msgSend(v22, "ef_publicDescription");
          *(_DWORD *)buf = v35;
          v57 = v26;
          __int16 v58 = 2114;
          v59 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error occured attempting to compress directory \"%@\": %{public}@", buf, 0x16u);
        }
      }

      if (v42 && ((*((uint64_t (**)(id, void *))v42 + 2))(v16, v13) & 1) != 0) {
        goto LABEL_24;
      }
      int v25 = 1;
LABEL_26:

      if (!v25) {
        goto LABEL_29;
      }
    }
    id v40 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v40);
LABEL_29:

  if ((v37 & 1) == 0)
  {
    uint64_t v8 = 0;
    goto LABEL_43;
  }
LABEL_33:
  v28 = +[MFLibraryCompressor log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Finishing Library Compression", buf, 2u);
  }

  v29 = +[NSNumber numberWithInteger:1];
  v30 = +[NSUserDefaults em_userDefaults];
  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v29, "integerValue"), @"MFLibraryCompressorDefaultsUpgradeStateKey");

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v31 = [(MFLibraryCompressor *)self mailboxUIDs];
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
        [(MFLibraryCompressor *)self _removeCompressedXAttr:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
      }
      id v32 = [v31 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v32);
  }

  uint64_t v8 = 1;
LABEL_43:
  v7 = obj;
LABEL_44:

  if (v36) {
    v36[2](v36, v8, v38 & 1);
  }
  os_activity_scope_leave(&state);
}

- (id)mailboxesNeedingCompression
{
  BOOL v3 = [(MFLibraryCompressor *)self mailboxUIDs];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070694;
  v6[3] = &unk_10013AA18;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "ef_filter:", v6);

  return v4;
}

- (BOOL)_mailboxNeedsCompression:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fullPath];
  if (v4)
  {
    v5 = +[NSFileManager defaultManager];
    id v11 = 0;
    v6 = objc_msgSend(v5, "mf_valueForExtendedAttribute:ofItemAtPath:error:", @"com_apple_mail_mailboxDirectoryCompressed", v4, &v11);
    id v7 = v11;

    if (!v6)
    {
      uint64_t v8 = +[MFLibraryCompressor log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 URL];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C1960();
      }
    }
    BOOL v9 = [v6 length] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_markMailboxCompressed:(id)a3
{
  id v3 = a3;
  id v4 = +[NSData dataWithBytes:"1" length:1];
  v5 = +[NSFileManager defaultManager];
  v6 = [v3 fullPath];
  id v10 = 0;
  unsigned __int8 v7 = objc_msgSend(v5, "mf_setValue:forExtendedAttribute:ofItemAtPath:error:", v4, @"com_apple_mail_mailboxDirectoryCompressed", v6, &v10);
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    BOOL v9 = +[MFLibraryCompressor log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v3 URL];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C19A8();
    }
  }
}

- (void)_removeCompressedXAttr:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v5 = [v3 fullPath];
  id v9 = 0;
  unsigned __int8 v6 = objc_msgSend(v4, "mf_setValue:forExtendedAttribute:ofItemAtPath:error:", 0, @"com_apple_mail_mailboxDirectoryCompressed", v5, &v9);
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = +[MFLibraryCompressor log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v3 URL];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C19A8();
    }
  }
}

- (NSArray)mailboxUIDs
{
  return self->_mailboxUIDs;
}

- (OS_os_activity)libraryCompressionActivity
{
  return self->_libraryCompressionActivity;
}

- (void)setLibraryCompressionActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCompressionActivity, 0);

  objc_storeStrong((id *)&self->_mailboxUIDs, 0);
}

@end