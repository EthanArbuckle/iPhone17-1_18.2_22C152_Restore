@interface CDXPrepareStoreOperation
- (BOOL)afterFirstUnlock;
- (BOOL)checkForExtensionsStuckLoading:(id *)a3;
- (BOOL)disableAllExtensionsWithError:(id *)a3;
- (BOOL)performWithError:(id *)a3;
- (BOOL)synchronizeExtensionsWithError:(id *)a3;
- (CDXPrepareStoreOperation)init;
- (CDXPrepareStoreOperation)initWithFirstUnlockStatus:(BOOL)a3;
- (void)setAfterFirstUnlock:(BOOL)a3;
@end

@implementation CDXPrepareStoreOperation

- (CDXPrepareStoreOperation)initWithFirstUnlockStatus:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDXPrepareStoreOperation;
  result = [(CDXPrepareStoreOperation *)&v5 init];
  if (result) {
    result->_afterFirstUnlock = a3;
  }
  return result;
}

- (CDXPrepareStoreOperation)init
{
  return 0;
}

- (BOOL)performWithError:(id *)a3
{
  id v39 = 0;
  id v5 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v39];
  id v6 = v39;
  unsigned int v7 = [v5 isCorrupt];
  v8 = [v5 url];

  if (!v7)
  {
    v14 = objc_alloc_init((Class)CXCallDirectoryStoreMigrator);
    id v35 = v6;
    v21 = [v14 performMigrationsWithError:&v35];
    id v12 = v35;

    if (!v21)
    {
      v26 = sub_100006944();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002550C();
      }
      goto LABEL_44;
    }
    if ([v21 requiresExtensionDisablement])
    {
      id v34 = v12;
      unsigned int v22 = [(CDXPrepareStoreOperation *)self disableAllExtensionsWithError:&v34];
      id v23 = v34;

      v24 = sub_100006944();
      v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Disabled all extensions successfully", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        sub_1000255DC();
      }

      if (v23) {
        goto LABEL_41;
      }
    }
    else
    {
      id v23 = v12;
      if (v12)
      {
LABEL_41:
        id v32 = v23;
        unsigned __int8 v30 = [(CDXPrepareStoreOperation *)self checkForExtensionsStuckLoading:&v32];
        id v12 = v32;

        if (v30)
        {
LABEL_45:

          goto LABEL_46;
        }
        v26 = sub_100006944();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100025574();
        }
LABEL_44:

        goto LABEL_45;
      }
    }
    if ([v21 requiresExtensionSynchronization])
    {
      id v33 = 0;
      unsigned int v27 = [(CDXPrepareStoreOperation *)self synchronizeExtensionsWithError:&v33];
      id v23 = v33;
      v28 = sub_100006944();
      v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Synchronized extensions successfully", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        sub_100024234();
      }
    }
    else
    {
      id v23 = 0;
    }
    goto LABEL_41;
  }
  v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000254C8(v9);
  }

  v10 = +[NSFileManager defaultManager];
  id v38 = v6;
  unsigned int v11 = [v10 removeItemAtURL:v8 error:&v38];
  id v12 = v38;

  v13 = sub_100006944();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully removed DB at URL '%@'", buf, 0xCu);
    }

    id v37 = v12;
    v14 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v37];
    id v15 = v37;

    v16 = sub_100006944();
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Created new store successfully", buf, 2u);
      }

      id v36 = v15;
      unsigned int v18 = [(CDXPrepareStoreOperation *)self synchronizeExtensionsWithError:&v36];
      id v12 = v36;

      v19 = sub_100006944();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Synchronized extensions successfully", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        sub_100024234();
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000253F8();
      }
      v14 = v17;
      id v12 = v15;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_100025460();
  }
LABEL_46:

  if (a3 && v12) {
    *a3 = v12;
  }

  return v12 == 0;
}

- (BOOL)disableAllExtensionsWithError:(id *)a3
{
  id v4 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:a3];
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 setStateForAllExtensions:1 error:a3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)synchronizeExtensionsWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x3032000000;
  v26[2] = sub_100014548;
  v26[3] = sub_100014558;
  id v27 = 0;
  id v5 = objc_alloc((Class)CXCallDirectoryStore);
  unsigned __int8 v6 = (id *)(v26[0] + 40);
  id obj = *(id *)(v26[0] + 40);
  id v7 = [v5 initForReadingAndWritingWithError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    v8 = [[CDXSynchronizeExtensionsOperation alloc] initWithStore:v7 firstUnlockStatus:[(CDXPrepareStoreOperation *)self afterFirstUnlock]];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100014560;
    v21[3] = &unk_1000350C8;
    id v23 = &v25;
    v9 = dispatch_semaphore_create(0);
    unsigned int v22 = v9;
    [(CDXSynchronizeExtensionsOperation *)v8 performWithCompletionHandler:v21];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v10 = sub_100006944();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100025644((uint64_t)v26, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    v8 = *(CDXSynchronizeExtensionsOperation **)(v26[0] + 40);
    *(void *)(v26[0] + 40) = v17;
  }

  unsigned int v18 = *(void **)(v26[0] + 40);
  if (a3 && v18)
  {
    *a3 = v18;
    unsigned int v18 = *(void **)(v26[0] + 40);
  }
  BOOL v19 = v18 == 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

- (BOOL)checkForExtensionsStuckLoading:(id *)a3
{
  id v39 = 0;
  id v4 = [objc_alloc((Class)CXCallDirectoryStore) initForReadingAndWritingWithError:&v39];
  id v5 = v39;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    id v38 = v5;
    id v7 = [v4 prioritizedExtensionsWithError:&v38];
    id v8 = v38;

    if (v7)
    {
      v29 = v7;
      unsigned __int8 v30 = a3;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v35;
        uint64_t v13 = &_s10Foundation13__DataStorageC5bytes6lengthACSVSg_Sitcfc_ptr;
        id v31 = v9;
        while (2)
        {
          uint64_t v14 = 0;
          id v32 = v11;
          do
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v14);
            uint64_t v16 = objc_msgSend(v13[296], "date", v29, v30);
            uint64_t v17 = [v15 stateLastModified];
            [v16 timeIntervalSinceDate:v17];
            double v19 = v18;
            if ([v15 state] == (id)3 && objc_msgSend(v17, "compare:", v16) != (id)1 && v19 > 3600.0)
            {
              uint64_t v20 = v12;
              v21 = v13;
              unsigned int v22 = v8;
              id v23 = sub_100006944();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v41 = v15;
                __int16 v42 = 2048;
                uint64_t v43 = 0x40AC200000000000;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Store extension %@ has Loading state but time interval since state last modified is %f. Assuming state is stuck and resetting to Enabled", buf, 0x16u);
              }

              id v24 = [v15 primaryKey];
              id v33 = v22;
              id v25 = v4;
              unsigned __int8 v26 = [v4 setState:4 forExtensionWithID:v24 error:&v33];
              id v8 = v33;

              if ((v26 & 1) == 0)
              {
                id v27 = sub_100006944();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  sub_1000256B8();
                }

                id v4 = v25;
                id v9 = v31;
                goto LABEL_21;
              }
              id v4 = v25;
              uint64_t v13 = v21;
              uint64_t v12 = v20;
              id v9 = v31;
              id v11 = v32;
            }

            uint64_t v14 = (char *)v14 + 1;
          }
          while (v11 != v14);
          id v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      id v7 = v29;
      a3 = v30;
    }

    unsigned __int8 v6 = v8;
  }
  if (a3 && v6) {
    *a3 = v6;
  }

  return v6 == 0;
}

- (BOOL)afterFirstUnlock
{
  return self->_afterFirstUnlock;
}

- (void)setAfterFirstUnlock:(BOOL)a3
{
  self->_afterFirstUnlock = a3;
}

@end