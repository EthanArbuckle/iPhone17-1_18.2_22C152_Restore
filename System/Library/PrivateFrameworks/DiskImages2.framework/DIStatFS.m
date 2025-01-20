@interface DIStatFS
+ (BOOL)supportsSecureCoding;
- (DIStatFS)initWithCoder:(id)a3;
- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4;
- (NSString)mountedFrom;
- (NSURL)mountedOnURL;
- (unint64_t)blockSize;
- (void)encodeWithCoder:(id)a3;
- (void)logWithHeader:(id)a3;
@end

@implementation DIStatFS

- (DIStatFS)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStatFS;
  v5 = [(DIStatFS *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountedOnURL"];
    mountedOnURL = v5->_mountedOnURL;
    v5->_mountedOnURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountedFrom"];
    mountedFrom = v5->_mountedFrom;
    v5->_mountedFrom = (NSString *)v8;

    v5->_blockSize = [v4 decodeIntegerForKey:@"blockSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DIStatFS *)self mountedOnURL];
  [v6 encodeObject:v4 forKey:@"mountedOnURL"];

  v5 = [(DIStatFS *)self mountedFrom];
  [v6 encodeObject:v5 forKey:@"mountedFrom"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[DIStatFS blockSize](self, "blockSize"), @"blockSize");
}

- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)DIStatFS;
  id v6 = [(DIStatFS *)&v20 init];
  if (!v6)
  {
LABEL_14:
    v16 = v6;
    goto LABEL_15;
  }
  if ((fstatfs(a3, &v27) & 0x80000000) == 0)
  {
    v7 = NSURL;
    uint64_t v8 = [NSString stringWithUTF8String:v27.f_mntonname];
    uint64_t v9 = [v7 fileURLWithPath:v8 isDirectory:1];
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v9;

    v6->_blockSize = v27.f_bsize;
    id v11 = +[DIHelpers copyDevicePathWithStatfs:&v27];
    v12 = v11;
    if ((v27.f_flags & 0x1000) != 0 && [v11 hasPrefix:@"/dev/disk"]) {
      objc_storeStrong((id *)&v6->_mountedFrom, v12);
    }
    int v13 = *__error();
    if (DIForwardLogs())
    {
      v14 = getDIOSLog();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v22 = 41;
      __int16 v23 = 2080;
      v24 = "-[DIStatFS initWithFileDescriptor:error:]";
      __int16 v25 = 2082;
      f_fstypename = v27.f_fstypename;
      v15 = (char *)_os_log_send_and_compose_impl();

      if (v15)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v15);
        free(v15);
      }
    }
    else
    {
      v17 = getDIOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v22 = 41;
        __int16 v23 = 2080;
        v24 = "-[DIStatFS initWithFileDescriptor:error:]";
        __int16 v25 = 2082;
        f_fstypename = v27.f_fstypename;
        _os_log_impl(&dword_21E237000, v17, OS_LOG_TYPE_DEFAULT, "%.*s: File system is %{public}s", buf, 0x1Cu);
      }
    }
    *__error() = v13;

    goto LABEL_14;
  }
  v16 = +[DIError nilWithPOSIXCode:*__error() verboseInfo:@"fstatfs failed" error:a4];
LABEL_15:
  v18 = v16;

  return v18;
}

- (void)logWithHeader:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v22 = *__error();
  if (DIForwardLogs())
  {
    v7 = getDIOSLog();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    uint64_t v8 = [(DIStatFS *)self mountedOnURL];
    uint64_t v9 = [v8 path];
    int v10 = [(DIStatFS *)self blockSize];
    id v11 = [(DIStatFS *)self mountedFrom];
    if (v11)
    {
      v12 = NSString;
      id v4 = [(DIStatFS *)self mountedFrom];
      int v13 = [v12 stringWithFormat:@"locally mounted from %@", v4];
    }
    else
    {
      int v13 = @"remote mount";
    }
    *(_DWORD *)buf = 68158979;
    int v24 = 26;
    __int16 v25 = 2080;
    v26 = "-[DIStatFS logWithHeader:]";
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2113;
    v30 = v9;
    __int16 v31 = 1024;
    int v32 = v10;
    __int16 v33 = 2114;
    v34 = v13;
    v21 = (char *)_os_log_send_and_compose_impl();
    if (v11)
    {
    }
    if (v21)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v21);
      free(v21);
    }
  }
  else
  {
    v14 = getDIOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(DIStatFS *)self mountedOnURL];
      v16 = [v15 path];
      int v17 = [(DIStatFS *)self blockSize];
      v18 = [(DIStatFS *)self mountedFrom];
      if (v18)
      {
        v19 = NSString;
        v3 = [(DIStatFS *)self mountedFrom];
        objc_super v20 = [v19 stringWithFormat:@"locally mounted from %@", v3];
      }
      else
      {
        objc_super v20 = @"remote mount";
      }
      *(_DWORD *)buf = 68158979;
      int v24 = 26;
      __int16 v25 = 2080;
      v26 = "-[DIStatFS logWithHeader:]";
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2113;
      v30 = v16;
      __int16 v31 = 1024;
      int v32 = v17;
      __int16 v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_21E237000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@", buf, 0x36u);
      if (v18)
      {
      }
    }
  }
  *__error() = v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mountedOnURL
{
  return self->_mountedOnURL;
}

- (NSString)mountedFrom
{
  return self->_mountedFrom;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountedFrom, 0);
  objc_storeStrong((id *)&self->_mountedOnURL, 0);
}

@end