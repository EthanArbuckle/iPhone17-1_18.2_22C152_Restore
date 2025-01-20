@interface TransactionLog
+ (id)serializeTransaction:(id)a3;
- (NSString)defaultLogDirectory;
- (NSString)defaultLogFileName;
- (NSString)path;
- (TransactionLog)init;
- (TransactionLog)initWithDescription:(const char *)a3;
- (TransactionLog)initWithFileName:(id)a3 withDescription:(const char *)a4;
- (id)getDefaultLogDirectory;
- (id)getNTransactions:(unint64_t)a3;
- (id)getNTransactionsSync:(unint64_t)a3;
- (id)getSomeTransactions;
- (id)getSomeTransactionsSync;
- (id)getTransactions;
- (unint64_t)fileOffset;
- (unint64_t)getTransactionCount;
- (unint64_t)transactionCount;
- (void)append:(id)a3;
- (void)appendSync:(id)a3;
- (void)appendTransactionSync:(id)a3 withFileHandle:(id)a4;
- (void)clear;
- (void)clearSync;
- (void)createLogDirectoryAndFile;
- (void)initializeTransactionCountSync;
- (void)migrateFromKeyedArchiverSync;
- (void)readFileOffset;
- (void)readTransactionsProcessed:(unint64_t)a3;
- (void)readTransactionsProcessedSync:(unint64_t)a3;
- (void)setFileOffset:(unint64_t)a3;
- (void)setPath:(id)a3;
- (void)setTransactionCount:(unint64_t)a3;
- (void)writeFileOffset;
@end

@implementation TransactionLog

- (id)getDefaultLogDirectory
{
  v2 = getMobileUserLibraryDirectoryPath();
  v3 = [v2 URLByAppendingPathComponent:@"CallHistoryTransactions"];
  v4 = [v3 path];

  return v4;
}

- (void)createLogDirectoryAndFile
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000260B4;
  v2[3] = &unk_100048BC8;
  v2[4] = self;
  [(TransactionLog *)self execute:v2];
}

- (void)initializeTransactionCountSync
{
  uint64_t v3 = 0;
  do
  {
    v5 = [(TransactionLog *)self getSomeTransactionsSync];
    id v6 = [v5 count];

    v3 += (uint64_t)v6;
  }
  while (v6);
  [(TransactionLog *)self setTransactionCount:v3];
  [(TransactionLog *)self readFileOffset];
}

- (TransactionLog)init
{
  return [(TransactionLog *)self initWithDescription:"TransactionLog"];
}

- (TransactionLog)initWithDescription:(const char *)a3
{
  return [(TransactionLog *)self initWithFileName:@"transactions" withDescription:a3];
}

- (TransactionLog)initWithFileName:(id)a3 withDescription:(const char *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TransactionLog;
  v7 = [(TransactionLog *)&v16 initWithName:a4];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(TransactionLog *)v7 getDefaultLogDirectory];
    defaultLogDirectory = v8->_defaultLogDirectory;
    v8->_defaultLogDirectory = (NSString *)v9;

    uint64_t v11 = [v6 stringByAppendingString:@".log"];
    defaultLogFileName = v8->_defaultLogFileName;
    v8->_defaultLogFileName = (NSString *)v11;

    uint64_t v13 = [(NSString *)v8->_defaultLogDirectory stringByAppendingPathComponent:v8->_defaultLogFileName];
    path = v8->_path;
    v8->_path = (NSString *)v13;

    v8->_transactionCount = 0;
    [(TransactionLog *)v8 readFileOffset];
    [(TransactionLog *)v8 createLogDirectoryAndFile];
  }

  return v8;
}

- (void)readFileOffset
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 objectForKey:self->_path];
  v5 = v4;
  if (v4)
  {
    self->_fileOffset = (unint64_t)[v4 unsignedLongLongValue];
  }
  else
  {
    self->_fileOffset = 0;
    id v6 = [(TransactionLog *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not find file offset key in the preferences", v7, 2u);
    }
  }
}

- (void)writeFileOffset
{
  id v5 = +[NSNumber numberWithUnsignedLongLong:[(TransactionLog *)self fileOffset]];
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(TransactionLog *)self path];
  [v3 setObject:v5 forKey:v4];

  [v3 synchronize];
}

- (void)append:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000266C0;
  v4[3] = &unk_1000490D8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(TransactionLog *)v5 executeSync:v4];
}

- (void)appendSync:(id)a3
{
  id v4 = a3;
  id v5 = [(TransactionLog *)self path];
  id v6 = +[NSFileHandle fileHandleForWritingAtPath:v5];

  if (!v6)
  {
    v12 = [(TransactionLog *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002F2F4(self);
    }
LABEL_29:

    goto LABEL_30;
  }
  [v6 seekToEndOfFile];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        [(TransactionLog *)self appendTransactionSync:*(void *)(*((void *)&v30 + 1) + 8 * i) withFileHandle:v6];
      }
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v9);
  }

  [v6 synchronizeFile];
  -[TransactionLog setTransactionCount:](self, "setTransactionCount:", (char *)[v7 count] + -[TransactionLog transactionCount](self, "transactionCount"));
  if ([(TransactionLog *)self transactionCount])
  {
    v12 = objc_opt_new();
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:[(TransactionLog *)self transactionCount]];
    [v12 setObject:v13 forKeyedSubscript:@"kCHTransactionCountKey"];

    v14 = [(TransactionLog *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = [(TransactionLog *)self transactionCount];
      unint64_t v16 = [(TransactionLog *)self transactionCount];
      v17 = "s";
      if (v16 == 1) {
        v17 = "";
      }
      *(_DWORD *)buf = 134218242;
      unint64_t v36 = v15;
      __int16 v37 = 2080;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Now have %lu transaction%s", buf, 0x16u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v7;
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      v22 = off_100049188;
      while (2)
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          if (objc_msgSend(v24, "transactionType", (void)v26) == (id)1) {
            goto LABEL_27;
          }
          if ([v24 transactionType] == (id)2)
          {
            v22 = off_100049190;
LABEL_27:
            [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:*v22];
            goto LABEL_28;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 postNotificationName:@"kCallHistoryTransactionAddedNotification" object:0 userInfo:v12];

    goto LABEL_29;
  }
LABEL_30:
}

- (void)clear
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100026ACC;
  v2[3] = &unk_100048BC8;
  v2[4] = self;
  [(TransactionLog *)self executeSync:v2];
}

- (void)clearSync
{
  id v3 = [(TransactionLog *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TransactionLog *)self path];
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Truncating file %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = [(TransactionLog *)self path];
  id v6 = +[NSFileHandle fileHandleForWritingAtPath:v5];

  [v6 truncateFileAtOffset:0];
  [(TransactionLog *)self setTransactionCount:0];
  [(TransactionLog *)self setFileOffset:0];
  [(TransactionLog *)self writeFileOffset];
}

- (id)getNTransactions:(unint64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026C74;
  v5[3] = &unk_1000498A0;
  v5[4] = self;
  v5[5] = a3;
  id v3 = [(TransactionLog *)self executeSyncWithResult:v5];
  return v3;
}

- (id)getSomeTransactions
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026D00;
  v4[3] = &unk_1000498C8;
  void v4[4] = self;
  v2 = [(TransactionLog *)self executeSyncWithResult:v4];
  return v2;
}

- (id)getSomeTransactionsSync
{
  return [(TransactionLog *)self getNTransactionsSync:100];
}

- (id)getNTransactionsSync:(unint64_t)a3
{
  id v22 = (id)objc_opt_new();
  id v5 = [(TransactionLog *)self path];
  id v6 = +[NSFileHandle fileHandleForReadingAtPath:v5];

  int v7 = (char *)[v6 seekToEndOfFile];
  objc_msgSend(v6, "seekToFileOffset:", -[TransactionLog fileOffset](self, "fileOffset"));
  unint64_t v8 = [(TransactionLog *)self fileOffset];
  uint64_t v10 = (char *)v8;
  if (a3 && v8 < (unint64_t)v7)
  {
    unint64_t v11 = a3 - 1;
    *(void *)&long long v9 = 67109120;
    long long v21 = v9;
    do
    {
      unsigned int v23 = 0;
      v12 = objc_msgSend(v6, "readDataOfLength:", 4, v21);
      uint64_t v13 = &v10[(void)[v12 length]];
      [v12 getBytes:&v23 length:4];
      v14 = [(TransactionLog *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v21;
        LODWORD(v25) = v23;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reading transaction of %u bytes", buf, 8u);
      }

      unint64_t v15 = [v6 readDataOfLength:v23];
      uint64_t v10 = &v13[(void)[v15 length]];
      unint64_t v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:0];
      [v22 addObject:v16];

      BOOL v17 = v11-- != 0;
    }
    while (v17 && v10 < v7);
  }
  [(TransactionLog *)self setFileOffset:v10];
  id v18 = [(TransactionLog *)self logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v22 count];
    *(_DWORD *)buf = 134217984;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Returning %lu transactions", buf, 0xCu);
  }

  return v22;
}

- (void)readTransactionsProcessed:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027070;
  v3[3] = &unk_1000498F0;
  v3[4] = self;
  v3[5] = a3;
  [(TransactionLog *)self executeSync:v3];
}

- (void)readTransactionsProcessedSync:(unint64_t)a3
{
  id v5 = [(TransactionLog *)self path];
  id v7 = +[NSFileHandle fileHandleForReadingAtPath:v5];

  id v6 = [v7 seekToEndOfFile];
  if ((id)[(TransactionLog *)self fileOffset] >= v6)
  {
    [(TransactionLog *)self clearSync];
  }
  else
  {
    [(TransactionLog *)self setTransactionCount:(char *)[(TransactionLog *)self transactionCount] - a3];
    [(TransactionLog *)self writeFileOffset];
  }
}

- (id)getTransactions
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000271B4;
  v4[3] = &unk_1000498C8;
  void v4[4] = self;
  v2 = [(TransactionLog *)self executeSyncWithResult:v4];
  return v2;
}

- (unint64_t)getTransactionCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002727C;
  v4[3] = &unk_100048BF0;
  void v4[4] = self;
  void v4[5] = &v5;
  [(TransactionLog *)self executeSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)migrateFromKeyedArchiverSync
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(NSString *)self->_defaultLogDirectory stringByAppendingPathComponent:@"tx.log"];
  if ([v3 fileExistsAtPath:v4])
  {
    id v36 = 0;
    uint64_t v5 = [v3 attributesOfItemAtPath:v4 error:&v36];
    id v6 = v36;
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(TransactionLog *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002F540();
      }
      goto LABEL_40;
    }
    long long v9 = [v5 valueForKey:@"NSFileSize"];
    uint64_t v8 = v9;
    if (v9)
    {
      BOOL v10 = (uint64_t)[v9 longValue] <= 0x100000;
      unint64_t v11 = [(TransactionLog *)self logHandle];
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (!v10)
      {
        if (v12)
        {
          id v27 = [v8 longValue];
          *(_DWORD *)buf = 134218240;
          id v38 = v27;
          __int16 v39 = 2048;
          uint64_t v40 = 0x100000;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Old transaction log is %ld bytes, above maximum limit of %ld", buf, 0x16u);
        }
        goto LABEL_27;
      }
      if (v12)
      {
        id v13 = [v8 longValue];
        *(_DWORD *)buf = 134217984;
        id v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Old transaction log is %ld bytes, proceeding with migration", buf, 0xCu);
      }

      uint64_t v14 = objc_opt_class();
      unint64_t v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
      unint64_t v16 = +[NSData dataWithContentsOfFile:v4];
      BOOL v17 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v15 fromData:v16 error:0];

      id v18 = [(TransactionLog *)self logHandle];
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          id v20 = [v17 count];
          *(_DWORD *)buf = 134217984;
          id v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Migrating %lu transactions", buf, 0xCu);
        }

        long long v21 = [(TransactionLog *)self path];
        id v22 = +[NSFileHandle fileHandleForWritingAtPath:v21];

        [v22 seekToEndOfFile];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        unint64_t v11 = v17;
        id v23 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v33;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v33 != v24) {
                objc_enumerationMutation(v11);
              }
              [(TransactionLog *)self appendTransactionSync:*(void *)(*((void *)&v32 + 1) + 8 * i) withFileHandle:v22];
            }
            id v23 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v23);
        }

        [v22 synchronizeFile];
LABEL_27:

        long long v28 = [(TransactionLog *)self logHandle];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v38 = v4;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removing old transaction log at %{public}@", buf, 0xCu);
        }

        id v31 = 0;
        [v3 removeItemAtPath:v4 error:&v31];
        uint64_t v7 = v31;
        long long v29 = [(TransactionLog *)self logHandle];
        long long v30 = v29;
        if (v7)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10002F470();
          }

          goto LABEL_40;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Cleared local transaction log", buf, 2u);
        }

        goto LABEL_39;
      }
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Did not find transactions to migrate", buf, 2u);
      }
    }
    else
    {
      long long v26 = [(TransactionLog *)self logHandle];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002F3EC((uint64_t)v4, v26);
      }
    }
LABEL_39:
    uint64_t v7 = 0;
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v7 = [(TransactionLog *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Old transaction log at %{public}@ does not exist, skipping migration", buf, 0xCu);
  }
LABEL_41:
}

+ (id)serializeTransaction:(id)a3
{
  uint64_t v7 = 0;
  id v3 = [a3 archivedDataWithError:&v7];
  unsigned int v6 = [v3 length];
  id v4 = +[NSMutableData dataWithBytes:&v6 length:4];
  [v4 appendData:v3];

  return v4;
}

- (void)appendTransactionSync:(id)a3 withFileHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TransactionLog serializeTransaction:v6];
  [v7 writeData:v8];
  long long v9 = [(TransactionLog *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = [v8 length];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wrote %lu bytes of transaction to file", (uint8_t *)&v10, 0xCu);
  }
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)defaultLogDirectory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)defaultLogFileName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(unint64_t)a3
{
  self->_fileOffset = a3;
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLogFileName, 0);
  objc_storeStrong((id *)&self->_defaultLogDirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end