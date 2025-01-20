@interface PQLConnection
- (BOOL)_gotoV2;
- (BOOL)_gotoV3;
- (BOOL)_gotoV4;
- (BOOL)_gotoV5;
- (BOOL)_initializeDB;
- (BOOL)_installFunctions;
- (BOOL)_setupDBIfNeeded;
- (BOOL)_setupPragmas;
- (BOOL)_setupPragmasNotUpsetAboutWAL_17553237;
- (BOOL)_upgradeDB:(int64_t)a3;
- (BOOL)openAtPath:(id)a3 isReadOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)saveLibraryState:(id)a3;
- (NSError)translatedError;
- (id)loadLibraryState;
- (void)setCorruptionHandler:(id)a3;
@end

@implementation PQLConnection

- (void)setCorruptionHandler:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010138;
  v6[3] = &unk_100040F78;
  id v7 = a3;
  id v4 = v7;
  [(PQLConnection *)self setSqliteErrorHandler:v6];
  v5 = [(PQLConnection *)self sqliteErrorHandler];
  [(PQLConnection *)self setAutoRollbackHandler:v5];
}

- (NSError)translatedError
{
  v2 = [(PQLConnection *)self lastError];
  v3 = sub_100010294(v2);

  return (NSError *)v3;
}

- (BOOL)_initializeDB
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000105A0;
  v3[3] = &unk_100040FA0;
  v3[4] = self;
  return [(PQLConnection *)self performWithFlags:10 action:v3];
}

- (BOOL)_gotoV2
{
  return [(PQLConnection *)self performWithFlags:10 action:&stru_100040FE0];
}

- (BOOL)_gotoV3
{
  return [(PQLConnection *)self performWithFlags:10 action:&stru_100041000];
}

- (BOOL)_gotoV4
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001092C;
  v3[3] = &unk_100040FA0;
  v3[4] = self;
  return [(PQLConnection *)self performWithFlags:10 action:v3];
}

- (BOOL)_gotoV5
{
  return [(PQLConnection *)self performWithFlags:10 action:&stru_100041020];
}

- (BOOL)_upgradeDB:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      BOOL v4 = [(PQLConnection *)self _gotoV2];
      if (v4) {
        goto LABEL_3;
      }
      break;
    case 2:
LABEL_3:
      BOOL v4 = [(PQLConnection *)self _gotoV3];
      if (v4) {
        goto LABEL_4;
      }
      break;
    case 3:
LABEL_4:
      BOOL v4 = [(PQLConnection *)self _gotoV4];
      if (v4) {
        goto LABEL_5;
      }
      break;
    case 4:
LABEL_5:
      BOOL v4 = [(PQLConnection *)self _gotoV5];
      if (v4) {
        goto LABEL_6;
      }
      break;
    default:
LABEL_6:
      v5 = [(PQLConnection *)self userVersion];
      unsigned int v6 = [v5 intValue];

      if (v6 == 5)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        id v7 = +[NSError errorWithSqliteCode:24 andMessage:@"invalid user version"];
        [(PQLConnection *)self setLastError:v7];

        LOBYTE(v4) = 0;
      }
      break;
  }
  return v4;
}

- (BOOL)_setupDBIfNeeded
{
  v3 = [(PQLConnection *)self userVersion];
  id v4 = [v3 longLongValue];

  if (v4)
  {
    return -[PQLConnection _upgradeDB:](self, "_upgradeDB:");
  }
  else
  {
    return [(PQLConnection *)self _initializeDB];
  }
}

- (BOOL)_setupPragmasNotUpsetAboutWAL_17553237
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010E44;
  v3[3] = &unk_100040FA0;
  v3[4] = self;
  return [(PQLConnection *)self performWithFlags:2 action:v3];
}

- (BOOL)_setupPragmas
{
  id v3 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA locking_mode = exclusive"];
  if (([v3 isEqualToString:@"exclusive"] & 1) == 0)
  {
    v10 = +[NSError errorWithSqliteCode:2 andMessage:@"cannot set locking_mode to exclusive"];
    [(PQLConnection *)self setLastError:v10];

LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (![(PQLConnection *)self _setupPragmasNotUpsetAboutWAL]
    || ![(PQLConnection *)self execute:@"PRAGMA temp_store = MEMORY"]
    || ![(PQLConnection *)self execute:@"PRAGMA cache_size = 128"]
    || ![(PQLConnection *)self execute:@"PRAGMA cache_spill = 512"])
  {
    goto LABEL_13;
  }
  if ([(PQLConnection *)self _vacuumMode] != 2)
  {
    id v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(PQLConnection *)self url];
      int v13 = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Database %@ isn't in incremental vacuum mode, doing the conversion now", (uint8_t *)&v13, 0xCu);
    }
    [(PQLConnection *)self execute:@"PRAGMA auto_vacuum = incremental"];
    [(PQLConnection *)self execute:@"VACUUM"];
    unsigned int v6 = [(PQLConnection *)self _vacuumMode];
    id v7 = sub_100002D4C();
    v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(PQLConnection *)self url];
        int v13 = 138412290;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] Database %@ successfully converted to incremental vacuum mode", (uint8_t *)&v13, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      sub_100028A30(self, v8);
    }
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_installFunctions
{
  if (![(PQLConnection *)self registerFunction:@"gs_path_exists" nArgs:1 handler:&stru_100041060]|| ![(PQLConnection *)self registerFunction:@"gs_path_not_exists" nArgs:1 handler:&stru_100041080])
  {
    return 0;
  }
  return [(PQLConnection *)self registerFunction:@"gs_is_prunable" nArgs:2 handler:&stru_1000410A0];
}

- (BOOL)openAtPath:(id)a3 isReadOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  memset(&v30, 0, sizeof(v30));
  v8 = [a3 stringByAppendingPathComponent:@"db.sqlite"];
  v9 = +[NSURL URLWithString:v8];
  v10 = +[GSUserDefaults defaults];
  -[PQLConnection setTraced:](self, "setTraced:", [v10 BOOLForKey:@"db.trace" byDefault:0]);

  id v11 = v8;
  if (!lstat((const char *)[v11 fileSystemRepresentation], &v30))
  {
    if (v30.st_nlink == 1)
    {
      id v29 = 0;
      unsigned __int8 v16 = [(PQLConnection *)self openAtURL:v9 withFlags:2 error:&v29];
      id v17 = v29;
      v12 = v17;
      if (v16) {
        goto LABEL_23;
      }
      if (a5)
      {
        sub_100010294(v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        sub_100028B20();
      }
      goto LABEL_34;
    }
    v19 = +[NSFileManager defaultManager];
    [v19 removeItemAtPath:v11 error:0];

    v20 = sub_100002D4C();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      sub_100028C04((uint64_t)v11, v20);
    }

LABEL_16:
    if (v6)
    {
      v12 = +[NSString stringWithFormat:@"No valid database and storage is read-only"];
      v21 = sub_100002D4C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100028B88();
      }

      if (a5)
      {
        v15 = sub_100003600(111, v12, 0);
        goto LABEL_21;
      }
LABEL_35:
      BOOL v22 = 0;
      goto LABEL_36;
    }
    id v28 = 0;
    unsigned __int8 v23 = [(PQLConnection *)self openAtURL:v9 sharedCache:0 error:&v28];
    id v24 = v28;
    v12 = v24;
    if (v23)
    {
LABEL_23:
      [(PQLConnection *)self setAutoRollbackHandler:&stru_1000410E0];
      if ([(PQLConnection *)self _setupPragmas]
        && [(PQLConnection *)self _setupDBIfNeeded]
        && [(PQLConnection *)self _installFunctions])
      {
        v25 = +[GSUserDefaults defaults];
        [v25 doubleForKey:@"db.batchdelay" min:0.0 max:3.0 byDefault:0.2];
        -[PQLConnection useBatchingWithDelay:changeCount:](self, "useBatchingWithDelay:changeCount:", [v25 intForKey:@"db.batchsize" min:0 max:0x7FFFFFFFLL byDefault:10000], v26);

        BOOL v22 = 1;
        goto LABEL_36;
      }
      if (a5)
      {
        *a5 = [(PQLConnection *)self translatedError];
      }
      [(PQLConnection *)self close:0];
      goto LABEL_35;
    }
    if (a5)
    {
      sub_100010294(v24);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
      sub_100028B20();
    }
LABEL_34:

    goto LABEL_35;
  }
  if (*__error() == 2) {
    goto LABEL_16;
  }
  v12 = +[NSString stringWithFormat:@"Failed to access DB file at path \"%@\"", v11];
  int v13 = *__error();
  v14 = sub_100002D4C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000288AC((int)v12, v13);
  }

  if (!a5) {
    goto LABEL_35;
  }
  v15 = sub_100011F0C(v13, v12);
LABEL_21:
  BOOL v22 = 0;
  *a5 = v15;
LABEL_36:

  return v22;
}

- (id)loadLibraryState
{
  id v2 = [(PQLConnection *)self fetch:@"SELECT v FROM state"];
  if ([v2 next])
  {
    id v3 = [v2 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
    [v2 close];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)saveLibraryState:(id)a3
{
  return [(PQLConnection *)self execute:@"UPDATE state SET v = %@", a3];
}

@end