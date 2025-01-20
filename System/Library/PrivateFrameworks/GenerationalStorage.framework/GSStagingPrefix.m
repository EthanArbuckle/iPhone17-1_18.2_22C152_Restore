@interface GSStagingPrefix
- (BOOL)_refreshWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStagedPath:(id)a3;
- (GSStagingPrefix)init;
- (GSStagingPrefix)initWithDocumentID:(id)a3;
- (id)description;
- (id)stagingPathforCreatingAdditionWithError:(id *)a3;
- (unint64_t)hash;
- (void)_connectionWithDaemonWasLost;
- (void)_invalidate:(BOOL)a3;
- (void)cleanupStagingPath:(id)a3;
- (void)dealloc;
- (void)finalize;
@end

@implementation GSStagingPrefix

- (GSStagingPrefix)init
{
  v3 = _NSMethodExceptionProem();
  +[NSException raise:NSInvalidArgumentException, @"%@: cannot use -init for initialization", v3 format];

  return 0;
}

- (GSStagingPrefix)initWithDocumentID:(id)a3
{
  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GSStagingPrefix;
  v5 = [(GSStagingPrefix *)&v8 init];
  v6 = (GSStagingPrefix *)v5;
  if (v5)
  {
    *((void *)v5 + 7) = -1;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_DWORD *)v5 + 6) = *((_DWORD *)v4 + 8);
  }

  return v6;
}

- (BOOL)_refreshWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_sandboxHandle < 0)
  {
    v6 = +[GSDaemonProxySync proxy];
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v4->_volumeUUID];
    uint64_t deviceID = v4->_deviceID;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100004BF8;
    v15 = &unk_100040A98;
    v16 = v4;
    id v9 = v6;
    id v17 = v9;
    [v9 stagingPrefixForDevice:deviceID volumeUUID:v7 reply:&v12];
    v10 = objc_msgSend(v9, "result", v12, v13, v14, v15, v16);
    if (a3)
    {
      *a3 = [v9 error];
    }
    unsigned __int8 v5 = [v10 BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)_invalidate:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    path = v4->_path;
    if (path)
    {
      v6 = path;
      if (qword_10004CE40 != -1) {
        dispatch_once(&qword_10004CE40, &stru_100040AD8);
      }
      id v7 = qword_10004CE38;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004EAC;
      block[3] = &unk_100040B00;
      uint64_t v13 = v6;
      objc_super v8 = v6;
      dispatch_async(v7, block);
    }
  }
  if ((v4->_sandboxHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v4->_sandboxHandle = -1;
  }
  id v9 = v4->_path;
  v4->_path = 0;

  pathComponents = v4->_pathComponents;
  v4->_pathComponents = 0;

  extension = v4->_extension;
  v4->_extension = 0;

  objc_sync_exit(v4);
}

- (void)_connectionWithDaemonWasLost
{
}

- (void)finalize
{
  [(GSStagingPrefix *)self _invalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)GSStagingPrefix;
  [(GSStagingPrefix *)&v3 finalize];
}

- (void)dealloc
{
  [(GSStagingPrefix *)self _invalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)GSStagingPrefix;
  [(GSStagingPrefix *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GSStagingPath %p %@>", self, self->_path];
}

- (unint64_t)hash
{
  return [(NSString *)self->_path hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GSStagingPrefix *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(NSString *)self->_path isEqualToString:v4->_path];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)stagingPathforCreatingAdditionWithError:(id *)a3
{
  BOOL v5 = +[NSFileManager defaultManager];
  if (self->_sandboxHandle < 0 && ![(GSStagingPrefix *)self _refreshWithError:a3])
  {
    id v10 = 0;
    id v9 = 0;
  }
  else
  {
    path = self->_path;
    id v12 = 0;
    id v7 = objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", path, @"XXXXXXXX", &v12);
    id v8 = v12;
    id v9 = v8;
    if (v7)
    {
LABEL_4:
      id v10 = v7;
      goto LABEL_12;
    }
    if ([v8 code] == (id)642)
    {
      id v7 = 0;
      if (a3) {
        *a3 = v9;
      }
      goto LABEL_4;
    }
    [(GSStagingPrefix *)self _invalidate:1];
    if ([(GSStagingPrefix *)self _refreshWithError:a3])
    {
      id v7 = objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", self->_path, @"XXXXXXXX", a3);
      goto LABEL_4;
    }
    id v10 = 0;
  }
LABEL_12:

  return v10;
}

- (BOOL)isStagedPath:(id)a3
{
  objc_super v3 = sub_1000051DC(self->_path, self->_pathComponents, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)cleanupStagingPath:(id)a3
{
  objc_super v3 = sub_1000051DC(self->_path, self->_pathComponents, a3);
  if (v3)
  {
    id v4 = v3;
    sub_10000C530((char *)[v3 fileSystemRepresentation], 0, 0);
    objc_super v3 = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_pathComponents, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end