@interface GSVolPath
+ (id)_volPathOnVolume:(id)a3 withFD:(int)a4 withPath:(id)a5 error:(id *)a6;
+ (id)volPathOnVolume:(id)a3 withFD:(int)a4 error:(id *)a5;
+ (id)volPathOnVolume:(id)a3 withPath:(id)a4 error:(id *)a5;
- (BOOL)_canReadFileWithCreds:(const GSCredential *)a3;
- (BOOL)isInIgnoredLocation;
- (BOOL)isValidForCreds:(const GSCredential *)a3 documentIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setCopyOnWrite;
- (GSManager)library;
- (NSString)path;
- (id)description;
- (int)device;
- (unint64_t)docID;
- (unint64_t)fileID;
- (unint64_t)parentID;
- (void)performOnResolvedPath:(id)a3;
@end

@implementation GSVolPath

- (void)performOnResolvedPath:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void, void))v4;
  library = self->_library;
  if (library)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003220;
    v16[3] = &unk_100041218;
    v16[4] = self;
    id v17 = v4;
    [(GSManager *)library dispatchSync:v16];
  }
  else
  {
    v7 = +[NSString stringWithFormat:@"No library for volPath"];
    v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100029208((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    v15 = sub_100003600(101, v7, 0);

    ((void (**)(void, void, void, void *))v5)[2](v5, 0, 0, v15);
  }
}

- (GSManager)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)description
{
  unint64_t docID = self->_docID;
  unint64_t parentID = self->_parentID;
  path = self->_path;
  uint64_t device = self->_device;
  v7 = [(NSString *)path lastPathComponent];
  v8 = +[NSString stringWithFormat:@"<%@ dev:%x docID:%lld parentid:%lld name:%@ fileid:%lld>", path, device, docID, parentID, v7, self->_fileID];

  return v8;
}

- (BOOL)isInIgnoredLocation
{
  uint64_t v3 = 0;
  do
  {
    BOOL result = [(NSString *)self->_path hasPrefix:off_1000411E0[v3]];
    if (result) {
      break;
    }
  }
  while (v3++ != 4);
  return result;
}

- (BOOL)setCopyOnWrite
{
  unint64_t docID = self->_docID;
  if (docID) {
    return docID != 0;
  }
  int v4 = openat([(GSManager *)self->_library volDirFd], [(NSString *)self->_path fileSystemRepresentation] + 1, 256);
  int v15 = 0;
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    unsigned int v6 = sub_10000C184(v4, &v15);
    if (v6)
    {
      self->_unint64_t docID = v6;
    }
    else
    {
      unsigned int v9 = sub_10000C238(v5);
      self->_unint64_t docID = v9;
      if (!v9)
      {
        uint64_t v10 = sub_100002D4C();
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
          sub_100029008();
        }
        goto LABEL_11;
      }
    }
    uint64_t v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v12 = self->_docID;
      path = self->_path;
      int device = self->_device;
      *(_DWORD *)buf = 134218498;
      unint64_t v17 = v12;
      __int16 v18 = 2112;
      v19 = path;
      __int16 v20 = 1024;
      int v21 = device;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] allocated docID:%lld to %@ on device %x", buf, 0x1Cu);
    }
LABEL_11:

    int v11 = *__error();
    close(v5);
    *__error() = v11;
    unint64_t docID = self->_docID;
    return docID != 0;
  }
  v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    sub_100028F70();
  }

  return 0;
}

- (BOOL)_canReadFileWithCreds:(const GSCredential *)a3
{
  if (fcntl([(GSManager *)self->_library volDirFd], 50, v8) < 0) {
    return 0;
  }
  id v5 = +[NSString stringWithFormat:@"%s%@", v8, self->_path];
  BOOL v6 = sub_1000135F4((uint64_t)a3, (const char *)[v5 fileSystemRepresentation], 1);

  return v6;
}

- (BOOL)isValidForCreds:(const GSCredential *)a3 documentIdentifier:(id)a4 error:(id *)a5
{
  v8 = a4;
  if (!self->_docID)
  {
    int v11 = +[NSString stringWithFormat:@"File has no storage"];
    uint64_t v14 = sub_100002D4C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000290A0();
    }

    if (!a5) {
      goto LABEL_20;
    }
    int v13 = 102;
    goto LABEL_19;
  }
  if (![(GSVolPath *)self isInIgnoredLocation]
    && (!a3 || [(GSVolPath *)self _canReadFileWithCreds:a3]))
  {
    if (!v8
      || (uint64_t v17 = 0,
          uint64_t v18 = 0,
          [(GSManager *)self->_library volumeUUID],
          unsigned int v9 = objc_claimAutoreleasedReturnValue(),
          [v9 getUUIDBytes:&v17],
          v9,
          self->_docID == v8[3])
      && (v17 == v8[1] ? (BOOL v10 = v18 == v8[2]) : (BOOL v10 = 0), v10))
    {
      BOOL v15 = 1;
      goto LABEL_21;
    }
  }
  int v11 = +[NSString stringWithFormat:@"invalid path"];
  unint64_t v12 = sub_100002D4C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100029108();
  }

  if (a5)
  {
    int v13 = 104;
LABEL_19:
    sub_100003600(v13, v11, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  BOOL v15 = 0;
LABEL_21:

  return v15;
}

+ (id)_volPathOnVolume:(id)a3 withFD:(int)a4 withPath:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  int v11 = v10;
  long long v27 = xmmword_1000322C8;
  uint64_t v28 = 0x400000000;
  memset(v31, 0, 480);
  long long v29 = 0u;
  long long v30 = 0u;
  if (a4 < 0)
  {
    if (!v10)
    {
LABEL_16:
      v16 = 0;
      goto LABEL_23;
    }
    if (getattrlist((const char *)objc_msgSend(v10, "fileSystemRepresentation", v27, v28), &v27, &v29, 0x428uLL, 0x20u) < 0)
    {
      unint64_t v12 = +[NSString stringWithFormat:@"invalid path"];
      int v13 = sub_100002D4C();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if (fgetattrlist(a4, &v27, &v29, 0x428uLL, 0x20u) < 0)
  {
    unint64_t v12 = +[NSString stringWithFormat:@"invalid path", v27, v28];
    int v13 = sub_100002D4C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!v9)
  {
    id v9 = +[GSStorageManager createLibraryForDevice:DWORD1(v29) error:a6];
    if (!v9) {
      goto LABEL_16;
    }
  }
  unsigned int v14 = objc_msgSend(v9, "device", v27, v28);
  if (v14 == DWORD1(v29))
  {
    BOOL v15 = (char *)v31 + SLODWORD(v31[0]);
    if (*v15 != 47) {
      sub_1000291DC();
    }
    unint64_t v12 = +[NSFileManager defaultManager];
    v16 = objc_alloc_init(GSVolPath);
    *(_OWORD *)&v16->_fileID = v30;
    v16->_int device = DWORD1(v29);
    objc_storeStrong((id *)&v16->_library, v9);
    v16->_unint64_t docID = HIDWORD(v29);
    uint64_t v17 = [v12 stringWithFileSystemRepresentation:v15 length:strlen(v15)];
    path = v16->_path;
    v16->_path = (NSString *)v17;

    v16->_resolveTime = time(0);
    v19 = sub_100002D4C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100029170((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);
    }

    goto LABEL_22;
  }
  unint64_t v12 = +[NSString stringWithFormat:@"path isn't on the proper device"];
  int v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
LABEL_18:
  }
    sub_100029108();
LABEL_19:

  if (a6)
  {
    sub_100003600(104, v12, 0);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_22:

LABEL_23:
  return v16;
}

+ (id)volPathOnVolume:(id)a3 withFD:(int)a4 error:(id *)a5
{
  return +[GSVolPath _volPathOnVolume:a3 withFD:*(void *)&a4 withPath:0 error:a5];
}

+ (id)volPathOnVolume:(id)a3 withPath:(id)a4 error:(id *)a5
{
  return +[GSVolPath _volPathOnVolume:a3 withFD:0xFFFFFFFFLL withPath:a4 error:a5];
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (unint64_t)parentID
{
  return self->_parentID;
}

- (int)device
{
  return self->_device;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)docID
{
  return self->_docID;
}

@end