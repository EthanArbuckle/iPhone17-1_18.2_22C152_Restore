@interface DIAttachParams
+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
- (BOOL)autoMount;
- (BOOL)emulateExternalDisk;
- (BOOL)handleRefCount;
- (BOOL)onDiskCache;
- (BOOL)reOpenIfWritableWithError:(id *)a3;
- (BOOL)shouldValidateShadows;
- (BOOL)uniqueDevice;
- (BOOL)updateStatFSWithError:(id *)a3;
- (DIAttachParams)initWithCoder:(id)a3;
- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4;
- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4;
- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5;
- (DIStatFS)inputStatFS;
- (NSString)inputMountedFrom;
- (NSURL)customCacheURL;
- (id)newAttachWithError:(id *)a3;
- (id)toDI1ParamsWithError:(id *)a3;
- (int64_t)fileMode;
- (unint64_t)commandSize;
- (unint64_t)regEntryID;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoMount:(BOOL)a3;
- (void)setCommandSize:(unint64_t)a3;
- (void)setCustomCacheURL:(id)a3;
- (void)setEmulateExternalDisk:(BOOL)a3;
- (void)setFileMode:(int64_t)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setInputMountedFrom:(id)a3;
- (void)setInputStatFS:(id)a3;
- (void)setOnDiskCache:(BOOL)a3;
- (void)setRegEntryID:(unint64_t)a3;
- (void)setShouldValidateShadows:(BOOL)a3;
- (void)setUniqueDevice:(BOOL)a3;
- (void)setupDefaults;
@end

@implementation DIAttachParams

- (DIAttachParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttachParams;
  v5 = [(DIBaseParams *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_autoMount = [v4 decodeBoolForKey:@"autoMount"];
    v5->_commandSize = [v4 decodeIntegerForKey:@"commandSize"];
    v5->_regEntryID = [v4 decodeInt64ForKey:@"regEntryID"];
    v5->_handleRefCount = [v4 decodeBoolForKey:@"handleRefCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputStatFS"];
    inputStatFS = v5->_inputStatFS;
    v5->_inputStatFS = (DIStatFS *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputMountedFrom"];
    inputMountedFrom = v5->_inputMountedFrom;
    v5->_inputMountedFrom = (NSString *)v8;

    v5->_fileMode = [v4 decodeIntegerForKey:@"fileMode"];
    v5->_onDiskCache = [v4 decodeBoolForKey:@"onDiskCache"];
    v5->_uniqueDevice = [v4 decodeBoolForKey:@"uniqueDevice"];
    v5->_emulateExternalDisk = [v4 decodeBoolForKey:@"emulateExternalDisk"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIAttachParams;
  [(DIBaseParams *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams autoMount](self, "autoMount"), @"autoMount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams commandSize](self, "commandSize"), @"commandSize");
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIAttachParams regEntryID](self, "regEntryID"), @"regEntryID");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams handleRefCount](self, "handleRefCount"), @"handleRefCount");
  v5 = [(DIAttachParams *)self inputStatFS];
  [v4 encodeObject:v5 forKey:@"inputStatFS"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams fileMode](self, "fileMode"), @"fileMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams onDiskCache](self, "onDiskCache"), @"onDiskCache");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams uniqueDevice](self, "uniqueDevice"), @"uniqueDevice");
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams emulateExternalDisk](self, "emulateExternalDisk"), @"emulateExternalDisk");
}

- (void)setupDefaults
{
  self->_fileMode = 1;
  self->_autoMount = ![(DIBaseParams *)self RAMdisk];
  self->_onDiskCache = 0;
  customCacheURL = self->_customCacheURL;
  self->_customCacheURL = 0;
}

- (void)setCustomCacheURL:(id)a3
{
  self->_onDiskCache = a3 != 0;
}

- (void)setOnDiskCache:(BOOL)a3
{
  self->_onDiskCache = a3;
  if (!a3)
  {
    self->_customCacheURL = 0;
    MEMORY[0x270F9A758]();
  }
}

- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF8C0] array];
  uint64_t v8 = [(DIAttachParams *)self initWithURL:v6 shadowURLs:v7 error:a4];

  return v8;
}

- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DIAttachParams;
  v10 = [(DIBaseParams *)&v17 initWithURL:v8 error:a5];
  objc_super v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if (![(DIBaseParams *)v10 openExistingImageWithFlags:0 error:a5]) {
    goto LABEL_9;
  }
  [(DIAttachParams *)v11 setupDefaults];
  if (![v9 count])
  {
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }
  if (![(DIBaseParams *)v11 isPstack])
  {
    v13 = [(DIBaseParams *)v11 shadowChain];
    char v14 = [v13 addShadowURLs:v9 error:a5];

    if (v14) {
      goto LABEL_7;
    }
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v12 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Custom cache or shadow is not supported for pstack based images." error:a5];
LABEL_8:
  v15 = v12;
LABEL_10:

  return v15;
}

- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 inputURL];
  v16.receiver = self;
  v16.super_class = (Class)DIAttachParams;
  id v8 = [(DIBaseParams *)&v16 initWithURL:v7 error:a4];

  if (!v8) {
    goto LABEL_3;
  }
  id v9 = [v6 diskImageParamsXPC];
  [(DIBaseParams *)v8 setDiskImageParamsXPC:v9];

  [(DIAttachParams *)v8 setupDefaults];
  v10 = [(DIBaseParams *)v8 shadowChain];
  objc_super v11 = [v6 shadowChain];
  v12 = [v11 nodes];
  char v13 = [v10 addShadowNodes:v12 error:a4];

  if ((v13 & 1) == 0) {
    char v14 = 0;
  }
  else {
LABEL_3:
  }
    char v14 = v8;

  return v14;
}

- (BOOL)shouldValidateShadows
{
  v2 = [(DIBaseParams *)self shadowChain];
  char v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DIBaseParams *)self shadowChain];
  [v4 setShouldValidate:v3];
}

- (BOOL)reOpenIfWritableWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v5 = [(DIBaseParams *)self inputURL];
  if ([v5 isFileURL])
  {
  }
  else
  {
    id v6 = [(DIBaseParams *)self diskImageParamsXPC];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return 1;
    }
  }
  id v8 = [(DIBaseParams *)self shadowChain];
  id v9 = [v8 activeShadowURL];

  if (!v9)
  {
    [(DIBaseParams *)self backend];
    char v10 = (*(uint64_t (**)(void))(**(void **)buf + 48))(*(void *)buf);
    if (*(void *)v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v43);
    }
    if ((v10 & 1) == 0)
    {
      char v13 = [(DIBaseParams *)self diskImageParamsXPC];
      int v14 = [v13 isWritableFormat];

      int v15 = *__error();
      if (DIForwardLogs())
      {
        objc_super v16 = getDIOSLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        objc_super v17 = "NO";
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 44;
        *(void *)&v43[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
        *(_WORD *)v43 = 2080;
        if (v14) {
          objc_super v17 = "YES";
        }
        __int16 v44 = 2080;
        v45 = v17;
        LODWORD(v41) = 28;
        v40 = buf;
        v18 = (char *)_os_log_send_and_compose_impl();

        if (v18)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v18);
          free(v18);
        }
      }
      else
      {
        v19 = getDIOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = "NO";
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 44;
          *(void *)&v43[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
          *(_WORD *)v43 = 2080;
          if (v14) {
            v20 = "YES";
          }
          __int16 v44 = 2080;
          v45 = v20;
          _os_log_impl(&dword_21E237000, v19, OS_LOG_TYPE_DEFAULT, "%.*s: isWritableFormat: %s", buf, 0x1Cu);
        }
      }
      *__error() = v15;
      int64_t v21 = [(DIAttachParams *)self fileMode];
      if (v14)
      {
        if (v21 != 2)
        {
          v22 = [(DIBaseParams *)self diskImageParamsXPC];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();

          if (v23)
          {
            v24 = [PluginBackendXPC alloc];
            v25 = [(DIBaseParams *)self inputURL];
            uint64_t v26 = [(PluginBackendXPC *)v24 initWithURL:v25 openMode:2];

            v27 = (void *)v26;
          }
          else
          {
            v28 = [(DIBaseParams *)self inputURL];
            id v29 = +[BackendXPC newFileBackendWithURL:v28 fileOpenFlags:2 error:a3];

            v27 = v29;
            if (!v29) {
              return 0;
            }
          }
          int v30 = *__error();
          if (DIForwardLogs())
          {
            v31 = getDIOSLog();
            os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            v32 = [(DIBaseParams *)self inputURL];
            v33 = [v32 path];
            *(_DWORD *)buf = 68158211;
            *(_DWORD *)&buf[4] = 44;
            *(_WORD *)v43 = 2080;
            *(void *)&v43[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
            __int16 v44 = 2113;
            v45 = v33;
            v34 = (char *)_os_log_send_and_compose_impl();

            if (v34)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v34);
              free(v34);
            }
          }
          else
          {
            v35 = getDIOSLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [(DIBaseParams *)self inputURL];
              v37 = [v36 path];
              *(_DWORD *)buf = 68158211;
              *(_DWORD *)&buf[4] = 44;
              *(_WORD *)v43 = 2080;
              *(void *)&v43[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
              __int16 v44 = 2113;
              v45 = v37;
              _os_log_impl(&dword_21E237000, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Image %{private}@ re-opened with RW permissions", buf, 0x1Cu);
            }
          }
          *__error() = v30;
          v38 = [(DIBaseParams *)self diskImageParamsXPC];
          v39 = [v38 backendXPC];
          [v39 replaceWithBackendXPC:v27];
        }
      }
      else if (v21 == 4)
      {
        return +[DIError failWithPOSIXCode:22 verboseInfo:@"Image has a read-only format, attach failed due to force RW flag" error:a3];
      }
    }
  }
  return 1;
}

- (BOOL)updateStatFSWithError:(id *)a3
{
  v5 = [(DIBaseParams *)self inputURL];
  int v6 = [v5 isFileURL];

  if (v6)
  {
    [(DIBaseParams *)self backend];
    get_sink_backend((uint64_t)&v17, &v19);
    uint64_t fd_from_backend = get_fd_from_backend((uint64_t)&v19);
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if ((fd_from_backend & 0x80000000) != 0) {
      return +[DIError failWithEnumValue:150 verboseInfo:@"Unexpected backend type for file" error:a3];
    }
    id v8 = [[DIStatFS alloc] initWithFileDescriptor:fd_from_backend error:a3];
    [(DIAttachParams *)self setInputStatFS:v8];

    id v9 = [(DIAttachParams *)self inputStatFS];

    if (!v9) {
      return 0;
    }
    char v10 = [(DIAttachParams *)self inputStatFS];
    [v10 logWithHeader:@"Input underlying FS"];
  }
  objc_super v11 = [(DIBaseParams *)self shadowChain];
  char v12 = [v11 isEmpty];

  if (v12) {
    return 1;
  }
  int v14 = [(DIBaseParams *)self shadowChain];
  int v15 = [v14 statWithError:a3];
  BOOL v13 = v15 != 0;

  return v13;
}

- (id)newAttachWithError:(id *)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  if (![(DIBaseParams *)self isPstack])
  {
    v5 = [(DIBaseParams *)self shadowChain];
    int v6 = [v5 hasBaseImageCache];

    if (v6)
    {
      v7 = [(DIBaseParams *)self shadowChain];
      id v8 = [v7 nodes];
      [v8 removeObjectAtIndex:0];
    }
  }
  if (![(DIBaseParams *)self isPstack] || ![(DIAttachParams *)self onDiskCache])
  {
    char v10 = [(DIAttachParams *)self customCacheURL];

    if (v10)
    {
      objc_super v11 = [DIShadowNode alloc];
      char v12 = [(DIAttachParams *)self customCacheURL];
      BOOL v13 = [(DIShadowNode *)v11 initWithURL:v12 isCache:1];

      int v14 = [(DIBaseParams *)self shadowChain];
      v45[0] = v13;
      int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
      char v16 = [v14 verifyNodes:v15 error:a3];

      if ((v16 & 1) == 0)
      {

        return 0;
      }
      uint64_t v17 = [(DIBaseParams *)self shadowChain];
      v18 = [v17 nodes];
      [v18 insertObject:v13 atIndex:0];
    }
    uint64_t v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
    int v20 = *__error();
    if (DIForwardLogs())
    {
      int64_t v21 = getDIOSLog();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v40 = 37;
      __int16 v41 = 2080;
      v42 = "-[DIAttachParams newAttachWithError:]";
      __int16 v43 = 2114;
      __int16 v44 = self;
      LODWORD(v38) = 28;
      v37 = buf;
      v22 = (char *)_os_log_send_and_compose_impl();

      if (v22)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v22);
        free(v22);
      }
    }
    else
    {
      char v23 = getDIOSLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v40 = 37;
        __int16 v41 = 2080;
        v42 = "-[DIAttachParams newAttachWithError:]";
        __int16 v43 = 2114;
        __int16 v44 = self;
        _os_log_impl(&dword_21E237000, v23, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }
    *__error() = v20;
    if ([(DIBaseParams *)self RAMdisk] && [(DIAttachParams *)self fileMode] == 2)
    {
      v24 = @"Cannot attach RAM disk as a read-only device";
    }
    else
    {
      v25 = [(DIBaseParams *)self shadowChain];
      if ([v25 isEmpty])
      {
      }
      else
      {
        BOOL v26 = [(DIBaseParams *)self rawBlockSize] == 512;

        if (!v26)
        {
          v24 = @"The image has a 4KB block size, shadow and cache files are not supported";
          goto LABEL_41;
        }
      }
      if (![(DIBaseParams *)self RAMdisk]
        || ([(DIBaseParams *)self shadowChain],
            v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = [v27 isEmpty],
            v27,
            (v28 & 1) != 0))
      {
        if (![(DIBaseParams *)self requiresRootDaemon])
        {
          if ([(DIClient2Controller_XPCHandler *)v19 connectWithError:a3]
            && [(DIBaseParams *)self prepareImageWithXpcHandler:v19 fileMode:[(DIAttachParams *)self fileMode] error:a3]&& [(DIAttachParams *)self reOpenIfWritableWithError:a3]&& [(DIAttachParams *)self updateStatFSWithError:a3])
          {
            int v30 = [QuarantineFileHandler alloc];
            v31 = [(DIBaseParams *)self inputURL];
            v32 = [(QuarantineFileHandler *)v30 initWithURL:v31 error:a3];

            if (v32)
            {
              if ([(DIAttachParams *)self handleRefCount]
                && [(DIAttachParams *)self uniqueDevice])
              {
                v33 = [MEMORY[0x263F08C38] UUID];
                v34 = [(DIBaseParams *)self diskImageParamsXPC];
                [v34 setInstanceID:v33];
              }
              id v9 = [(DIClient2Controller_XPCHandler *)v19 newAttachWithParams:self error:a3];
              if (v9 && [(QuarantineFileHandler *)v32 isQuarantined])
              {
                v35 = [v9 BSDName];
                [(QuarantineFileHandler *)v32 applyMountPointsWithBSDName:v35 error:0];
              }
            }
            else
            {
              id v9 = 0;
            }
          }
          else
          {
            id v9 = 0;
          }
          goto LABEL_43;
        }
        uint64_t v29 = +[DIError nilWithPOSIXCode:45 verboseInfo:@"Sparsebundles on SMB mounts are not supported on this system" error:a3];
LABEL_42:
        id v9 = (id)v29;
LABEL_43:

        return v9;
      }
      v24 = @"Cannot attach RAM disk with a shadow or a cache file";
    }
LABEL_41:
    uint64_t v29 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, v24, a3, v37);
    goto LABEL_42;
  }
  +[DIError nilWithPOSIXCode:22 description:@"Cache is not supported when using pstack." error:a3];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 description];
  objc_super v11 = (const char *)[v10 UTF8String];

  if (!v11 || !*v11)
  {
    BOOL v13 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Failed converting URL to UTF8" error:a6];
LABEL_7:
    BOOL v12 = v13;
    goto LABEL_8;
  }
  if (strlcpy(a4, v11, a5) >= a5)
  {
    BOOL v13 = +[DIError failWithPOSIXCode:22 description:@"Disk image URL is too long" error:a6];
    goto LABEL_7;
  }
  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)autoMount
{
  return self->_autoMount;
}

- (void)setAutoMount:(BOOL)a3
{
  self->_autoMount = a3;
}

- (int64_t)fileMode
{
  return self->_fileMode;
}

- (void)setFileMode:(int64_t)a3
{
  self->_fileMode = a3;
}

- (BOOL)onDiskCache
{
  return self->_onDiskCache;
}

- (NSURL)customCacheURL
{
  return self->_customCacheURL;
}

- (BOOL)uniqueDevice
{
  return self->_uniqueDevice;
}

- (void)setUniqueDevice:(BOOL)a3
{
  self->_uniqueDevice = a3;
}

- (unint64_t)commandSize
{
  return self->_commandSize;
}

- (void)setCommandSize:(unint64_t)a3
{
  self->_commandSize = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (void)setRegEntryID:(unint64_t)a3
{
  self->_regEntryID = a3;
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIStatFS)inputStatFS
{
  return self->_inputStatFS;
}

- (void)setInputStatFS:(id)a3
{
}

- (NSString)inputMountedFrom
{
  return self->_inputMountedFrom;
}

- (void)setInputMountedFrom:(id)a3
{
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMountedFrom, 0);
  objc_storeStrong((id *)&self->_inputStatFS, 0);
  objc_storeStrong((id *)&self->_customCacheURL, 0);
}

- (id)toDI1ParamsWithError:(id *)a3
{
  return (id)MEMORY[0x263EFFA78];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end