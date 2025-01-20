@interface DRSLog
+ (Class)_moClass;
+ (id)entityName;
- (BOOL)_deleteOnDiskLog;
- (BOOL)_getSizeFromPath;
- (BOOL)isAvailableOnDisk;
- (BOOL)isEqual:(id)a3;
- (BOOL)transferOwnership;
- (NSString)name;
- (NSString)path;
- (id)_initWithLogMO_ON_MOC_QUEUE:(id)a3;
- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4;
- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4 size:(unint64_t)a5;
- (id)debugDescription;
- (id)fileDescription;
- (unint64_t)size;
- (void)_configureLogMO:(id)a3;
@end

@implementation DRSLog

- (id)_initWithLogMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v5 = [v4 path];
  uint64_t v6 = [v4 transferOwnership];
  uint64_t v7 = [v4 size];

  id v8 = [(DRSLog *)self _initWithLogPath:v5 transferOwnership:v6 size:v7];
  return v8;
}

- (void)_configureLogMO:(id)a3
{
  id v5 = a3;
  id v4 = [(DRSLog *)self path];
  [v5 setPath:v4];

  objc_msgSend(v5, "setSize:", -[DRSLog size](self, "size"));
  objc_msgSend(v5, "setTransferOwnership:", -[DRSLog transferOwnership](self, "transferOwnership"));
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSLogMO";
}

- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4 size:(unint64_t)a5
{
  id v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)DRSLog;
    v10 = [(DRSLog *)&v14 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_path, a3);
      v11->_transferOwnership = a4;
      v11->_size = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  id v8 = [v7 attributesOfItemAtPath:v6 error:&v19];
  id v9 = v19;

  if (v8)
  {
    uint64_t v10 = [v8 fileSize];
    if (v10)
    {
      v11 = [NSNumber numberWithUnsignedLongLong:v10];
      goto LABEL_13;
    }
    v12 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v16 = [v9 localizedDescription];
      objc_super v14 = (void *)v16;
      v15 = @"Unknown";
      if (v16) {
        v15 = (__CFString *)v16;
      }
LABEL_11:
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      v23 = v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeError", "Failed to get size of file for %{public}@ due to error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v12 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v13 = [v9 localizedDescription];
      objc_super v14 = (void *)v13;
      v15 = @"Unknown";
      if (v13) {
        v15 = (__CFString *)v13;
      }
      goto LABEL_11;
    }
  }

  v11 = 0;
LABEL_13:

  if (v11)
  {
    self = (DRSLog *)-[DRSLog _initWithLogPath:transferOwnership:size:](self, "_initWithLogPath:transferOwnership:size:", v6, v4, [v11 unsignedLongLongValue]);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isAvailableOnDisk
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  BOOL v4 = [(DRSLog *)self path];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_getSizeFromPath
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(DRSLog *)self path];

  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F08850] defaultManager];
    char v5 = [(DRSLog *)self path];
    id v17 = 0;
    id v6 = [v4 attributesOfItemAtPath:v5 error:&v17];
    id v7 = v17;

    if (v6)
    {
      unint64_t v8 = [v6 fileSize];
      if (v8)
      {
        self->_size = v8;
        BOOL v9 = 1;
LABEL_15:

        return v9;
      }
      uint64_t v10 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v10))
      {
        v11 = [(DRSLog *)self path];
        uint64_t v15 = [v7 localizedDescription];
        uint64_t v13 = (void *)v15;
        objc_super v14 = @"Unknown";
        if (v15) {
          objc_super v14 = (__CFString *)v15;
        }
LABEL_13:
        *(_DWORD *)buf = 138543618;
        id v19 = v11;
        __int16 v20 = 2114;
        id v21 = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeError", "Failed to get size of file for %{public}@ due to error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v10))
      {
        v11 = [(DRSLog *)self path];
        uint64_t v12 = [v7 localizedDescription];
        uint64_t v13 = (void *)v12;
        objc_super v14 = @"Unknown";
        if (v12) {
          objc_super v14 = (__CFString *)v12;
        }
        goto LABEL_13;
      }
    }

    BOOL v9 = 0;
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (DRSLog *)a3;
  char v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    unint64_t v7 = [(DRSLog *)self size];
    if (v7 == [(DRSLog *)v6 size])
    {
      unint64_t v8 = [(DRSLog *)self path];
      BOOL v9 = [(DRSLog *)v6 path];
      if ([v8 isEqualToString:v9])
      {
        BOOL v10 = [(DRSLog *)self transferOwnership];
        BOOL v11 = v10 ^ [(DRSLog *)v6 transferOwnership] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  BOOL v4 = [(DRSLog *)self path];
  unint64_t v5 = [(DRSLog *)self size];
  BOOL v6 = [(DRSLog *)self transferOwnership];
  unint64_t v7 = @"Copied";
  if (v6) {
    unint64_t v7 = @"Transferred";
  }
  unint64_t v8 = (void *)[v3 initWithFormat:@"%@ (%zuB) %@", v4, v5, v7];

  return v8;
}

- (BOOL)_deleteOnDiskLog
{
  v2 = [(DRSLog *)self path];
  char v3 = _deleteFileWithPath(v2);

  return v3;
}

- (NSString)name
{
  v2 = [(DRSLog *)self path];
  char v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (void).cxx_destruct
{
}

- (id)fileDescription
{
  char v3 = objc_alloc_init(DRSProtoFileDescription);
  BOOL v4 = [(DRSLog *)self path];
  unint64_t v5 = [v4 lastPathComponent];
  [(DRSProtoFileDescription *)v3 setFileName:v5];

  [(DRSProtoFileDescription *)v3 setLogSize:[(DRSLog *)self size]];
  BOOL v6 = [(DRSLog *)self path];
  unint64_t v7 = [v6 pathExtension];
  [(DRSProtoFileDescription *)v3 setLogType:v7];

  return v3;
}

@end