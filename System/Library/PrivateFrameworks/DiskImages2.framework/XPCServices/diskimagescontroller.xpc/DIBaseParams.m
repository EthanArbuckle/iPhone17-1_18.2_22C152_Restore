@interface DIBaseParams
+ (BOOL)supportsSecureCoding;
- (BOOL)RAMdisk;
- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4;
- (BOOL)hasUnlockedBackend;
- (BOOL)isPstack;
- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4;
- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5;
- (BOOL)requiresRootDaemon;
- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4;
- (BOOL)supportsPstack;
- (BOOL)tryResolvePstackChain:(id *)a3;
- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (DIBaseParams)initWithCoder:(id)a3;
- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4;
- (DIShadowChain)shadowChain;
- (DIURL)inputURL;
- (DiskImageParamsXPC)diskImageParamsXPC;
- (NSError)deserializationError;
- (NSUUID)encryptionUUID;
- (NSUUID)instanceID;
- (id)description;
- (shared_ptr<Backend>)backend;
- (unint64_t)rawBlockSize;
- (unint64_t)readPassphraseFlags;
- (void)cryptoHeader;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setDeserializationError:(id)a3;
- (void)setDiskImageParamsXPC:(id)a3;
- (void)setInputURL:(id)a3;
- (void)setRawBlockSize:(unint64_t)a3;
- (void)setReadPassphraseFlags:(unint64_t)a3;
@end

@implementation DIBaseParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)RAMdisk
{
  v2 = [(DIBaseParams *)self diskImageParamsXPC];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (DIBaseParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIBaseParams;
  v5 = [(DIBaseParams *)&v20 init];
  if (v5)
  {
    id v6 = [v4 decodeBoolForKey:@"debugLogsEnabled"];
    id v7 = [v4 decodeBoolForKey:@"forwardLogs"];
    sub_1000D8518((uint64_t)v6);
    v8 = +[NSProcessInfo processInfo];
    v9 = [v8 processName];
    unsigned __int8 v10 = [v9 isEqualToString:@"diskimagesiod"];

    if ((v10 & 1) == 0) {
      sub_1000D8500((uint64_t)v7);
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputURL"];
    inputURL = v5->_inputURL;
    v5->_inputURL = (DIURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowChain"];
    shadowChain = v5->_shadowChain;
    v5->_shadowChain = (DIShadowChain *)v13;

    v5->_readPassphraseFlags = (unint64_t)[v4 decodeIntegerForKey:@"readPassphraseFlags"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskImageParams"];
    diskImageParamsXPC = v5->_diskImageParamsXPC;
    v5->_diskImageParamsXPC = (DiskImageParamsXPC *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deserializationError"];
    deserializationError = v5->_deserializationError;
    v5->_deserializationError = (NSError *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:sub_1000D8524() forKey:@"debugLogsEnabled"];
  [v8 encodeBool:sub_1000D850C() forKey:@"forwardLogs"];
  id v4 = [(DIBaseParams *)self diskImageParamsXPC];
  [v8 encodeObject:v4 forKey:@"diskImageParams"];

  v5 = [(DIBaseParams *)self inputURL];
  [v8 encodeObject:v5 forKey:@"inputURL"];

  id v6 = [(DIBaseParams *)self shadowChain];
  [v8 encodeObject:v6 forKey:@"shadowChain"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"), @"readPassphraseFlags");
  id v7 = [(DIBaseParams *)self deserializationError];
  [v8 encodeObject:v7 forKey:@"deserializationError"];
}

- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIBaseParams;
  id v7 = [(DIBaseParams *)&v17 init];
  if (v7)
  {
    id v8 = +[DIURL newDIURLWithNSURL:v6];
    inputURL = v7->_inputURL;
    v7->_inputURL = v8;

    v7->_readPassphraseFlags = 7;
    unsigned __int8 v10 = objc_alloc_init(DIShadowChain);
    shadowChain = v7->_shadowChain;
    v7->_shadowChain = v10;

    v12 = [(DIURL *)v7->_inputURL path];
    if (!v12
      || (+[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:1], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v12, !v13))
    {
      v14 = +[DIError nilWithPOSIXCode:22 description:@"Malformed URL format" error:a4];
      goto LABEL_9;
    }
    if (![(DIBaseParams *)v7 tryResolvePstackChain:a4])
    {
      uint64_t v15 = 0;
      goto LABEL_10;
    }
    if ([(DIBaseParams *)v7 isPstack] && ![(DIBaseParams *)v7 supportsPstack])
    {
      v14 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"This operation doesn't support pstack files" error:a4];
      goto LABEL_9;
    }
  }
  v14 = v7;
LABEL_9:
  uint64_t v15 = v14;
LABEL_10:

  return v15;
}

- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [(DIBaseParams *)self diskImageParamsXPC];

  if (v7)
  {
    int v8 = *__error();
    if (sub_1000D850C())
    {
      v9 = sub_1000D848C();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v18 = 49;
      __int16 v19 = 2080;
      objc_super v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
      unsigned __int8 v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      uint64_t v15 = sub_1000D848C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v18 = 49;
        __int16 v19 = 2080;
        objc_super v20 = "-[DIBaseParams openExistingImageWithFlags:error:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Using existing disk image params", buf, 0x12u);
      }
    }
    *__error() = v8;
    return 1;
  }
  else
  {
    uint64_t v11 = [(DIBaseParams *)self inputURL];
    id v12 = +[DiskImageParamsXPC newWithURL:v11 fileOpenFlags:v5 error:a4];
    [(DIBaseParams *)self setDiskImageParamsXPC:v12];

    uint64_t v13 = [(DIBaseParams *)self diskImageParamsXPC];
    BOOL v14 = v13 != 0;
  }
  return v14;
}

- (BOOL)supportsPstack
{
  return 1;
}

- (BOOL)tryResolvePstackChain:(id *)a3
{
  uint64_t v5 = [(DIBaseParams *)self inputURL];
  id v35 = 0;
  id v36 = 0;
  unsigned __int8 v6 = +[DiskImageGraph loadPlistDictFromURL:v5 dict:&v36 error:&v35];
  id v7 = v36;
  id v8 = v35;

  if (v6)
  {
    v9 = [v7 objectForKey:@"PstackVersion"];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      self->_isPstack = 1;
      uint64_t v11 = [DiskImageGraph alloc];
      id v12 = [(DIBaseParams *)self inputURL];
      uint64_t v13 = [(DiskImageGraph *)v11 initWithData:v7 pstackURL:v12 imported:0 error:a3];

      if (v13)
      {
        v34 = v13;
        BOOL v14 = +[NSMutableArray array];
        uint64_t v15 = [(DiskImageGraph *)v34 activeNode];
        if (v15)
        {
          do
          {
            v16 = [v15 toDIShadowNode];
            [v14 addObject:v16];

            uint64_t v17 = [v15 parent];

            uint64_t v15 = (void *)v17;
          }
          while (v17);
        }

        int v18 = [v14 lastObject];
        [v14 removeLastObject];
        __int16 v19 = [v14 reverseObjectEnumerator];
        objc_super v20 = [v19 allObjects];

        v21 = [(DIBaseParams *)self shadowChain];
        unsigned __int8 v22 = [v21 addShadowNodes:v20 error:a3];

        if (v22)
        {
          v23 = [v18 URL];
          inputURL = self->_inputURL;
          self->_inputURL = v23;
        }
      }
      else
      {
        unsigned __int8 v22 = 0;
      }

      goto LABEL_34;
    }
    if (sub_1000D8524())
    {
      int v27 = *__error();
      if (!sub_1000D850C())
      {
        v31 = sub_1000D848C();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68157954;
          int v38 = 38;
          __int16 v39 = 2080;
          v40 = "-[DIBaseParams tryResolvePstackChain:]";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
        }

        goto LABEL_32;
      }
      v30 = sub_1000D848C();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      *(_DWORD *)buf = 68157954;
      int v38 = 38;
      __int16 v39 = 2080;
      v40 = "-[DIBaseParams tryResolvePstackChain:]";
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29) {
        goto LABEL_14;
      }
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v25 = [v8 domain];
  if ([v25 isEqualToString:@"com.apple.DiskImages2.ErrorDomain"])
  {
    BOOL v26 = [v8 code] == (id)167;

    if (v26)
    {
      if (sub_1000D8524())
      {
        int v27 = *__error();
        if (!sub_1000D850C())
        {
          v32 = sub_1000D848C();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68157954;
            int v38 = 38;
            __int16 v39 = 2080;
            v40 = "-[DIBaseParams tryResolvePstackChain:]";
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
          }

          goto LABEL_32;
        }
        v28 = sub_1000D848C();
        os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68157954;
        int v38 = 38;
        __int16 v39 = 2080;
        v40 = "-[DIBaseParams tryResolvePstackChain:]";
        v29 = (char *)_os_log_send_and_compose_impl();

        if (v29)
        {
LABEL_14:
          fprintf(__stderrp, "%s\n", v29);
          free(v29);
        }
LABEL_32:
        *__error() = v27;
      }
LABEL_33:
      unsigned __int8 v22 = 1;
      goto LABEL_34;
    }
  }
  else
  {
  }
  unsigned __int8 v22 = 0;
  if (a3) {
    *a3 = v8;
  }
LABEL_34:

  return v22;
}

- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4
{
  unsigned __int8 v6 = @"Public key";
  if (a3) {
    unsigned __int8 v6 = @"Passphrase";
  }
  id v7 = v6;
  if (![(DIBaseParams *)self hasUnlockedBackend])
  {
    if ([(DIBaseParams *)self RAMdisk])
    {
      v9 = +[NSString stringWithFormat:@"A %@ cannot be specified for RAM disks", v7];
      unsigned __int8 v10 = +[DIError failWithEnumValue:150 verboseInfo:v9 error:a4];
    }
    else
    {
      uint64_t v11 = [(DIBaseParams *)self diskImageParamsXPC];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v8 = 1;
        goto LABEL_11;
      }
      v9 = +[NSString stringWithFormat:@"A %@ was specified, but the image file doesn't seem to be encrypted", v7];
      unsigned __int8 v10 = +[DIError failWithEnumValue:150 verboseInfo:v9 error:a4];
    }
    BOOL v8 = v10;

    goto LABEL_11;
  }
  BOOL v8 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Too many calls to set, the image is already unlocked" error:a4];
LABEL_11:

  return v8;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  if (-[DIBaseParams checkBeforeSetWithIsPassphrase:error:](self, "checkBeforeSetWithIsPassphrase:error:", 1))
  {
    id v7 = [(DIBaseParams *)self diskImageParamsXPC];
    id v8 = [v7 newWithPassphrase:a3 error:a4];
    BOOL v9 = v8 != 0;
    if (!v8)
    {
LABEL_19:

      return v9;
    }
    if (a3)
    {
      int v10 = *__error();
      if (!sub_1000D850C())
      {
        BOOL v14 = sub_1000D848C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 36;
          __int16 v21 = 2080;
          unsigned __int8 v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase is correct", buf, 0x12u);
        }

        goto LABEL_18;
      }
      uint64_t v11 = sub_1000D848C();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 36;
      __int16 v21 = 2080;
      unsigned __int8 v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      uint64_t v17 = buf;
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
      int v10 = *__error();
      if (!sub_1000D850C())
      {
        uint64_t v15 = sub_1000D848C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 36;
          __int16 v21 = 2080;
          unsigned __int8 v22 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Found certificate in keychain", buf, 0x12u);
        }

        goto LABEL_18;
      }
      uint64_t v13 = sub_1000D848C();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 36;
      __int16 v21 = 2080;
      unsigned __int8 v22 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v18) = 18;
      uint64_t v17 = buf;
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
LABEL_10:
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
LABEL_18:
    *__error() = v10;
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v8, v17, v18);
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3
{
  return [(DIBaseParams *)self setPassphrase:0 error:a3];
}

- (NSUUID)encryptionUUID
{
  if (*(void *)[(DIBaseParams *)self cryptoHeader]) {
    id v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", *(void *)-[DIBaseParams cryptoHeader](self, "cryptoHeader") + 36);
  }
  else {
    id v3 = 0;
  }
  return (NSUUID *)v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(DIBaseParams *)self diskImageParamsXPC];
  unsigned __int8 v6 = +[NSString stringWithFormat:@"%@[%@]", v4, v5];

  return v6;
}

- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!*(void *)[(DIBaseParams *)self cryptoHeader]
    || (v9 = [(DIEncryptionFrontend *)[DIEncryptionUnlocker alloc] initWithParams:self], unsigned int v10 = [(DIEncryptionUnlocker *)v9 unlockWithXpcHandler:v8 error:a5], v9, v10))
  {
    uint64_t v11 = [(DIBaseParams *)self shadowChain];
    unsigned int v12 = [v11 isEmpty];

    if (v12)
    {
      uint64_t v13 = [(DIBaseParams *)self shadowChain];
      BOOL v14 = [(DIBaseParams *)self diskImageParamsXPC];
      [v14 setShadowChain:v13];
    }
    else
    {
      if (a4 != 2)
      {
        uint64_t v15 = [(DIBaseParams *)self shadowChain];
        [v15 openWritable:1 createNonExisting:a4 != 3];

        v16 = [(DIBaseParams *)self shadowChain];
        uint64_t v17 = [(DIBaseParams *)self diskImageParamsXPC];
        [v17 setShadowChain:v16];
      }
      uint64_t v18 = [(DIBaseParams *)self diskImageParamsXPC];
      __int16 v19 = [v18 shadowChain];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        __int16 v21 = [(DIBaseParams *)self shadowChain];
        [v21 openWritable:0 createNonExisting:0];

        unsigned __int8 v22 = [(DIBaseParams *)self shadowChain];
        v23 = [(DIBaseParams *)self diskImageParamsXPC];
        [v23 setShadowChain:v22];
      }
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)hasUnlockedBackend
{
  v2 = [(DIBaseParams *)self diskImageParamsXPC];
  id v3 = [v2 backendXPC];
  unsigned __int8 v4 = [v3 isUnlocked];

  return v4;
}

- (void)invalidate
{
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  uint64_t v5 = [(DIBaseParams *)self deserializationError];

  if (a3 && v5)
  {
    *a3 = [(DIBaseParams *)self deserializationError];
  }
  return v5 == 0;
}

- (NSUUID)instanceID
{
  v2 = [(DIBaseParams *)self diskImageParamsXPC];
  id v3 = [v2 instanceID];

  return (NSUUID *)v3;
}

- (unint64_t)rawBlockSize
{
  v2 = [(DIBaseParams *)self diskImageParamsXPC];
  id v3 = [v2 blockSize];

  return (unint64_t)v3;
}

- (void)setRawBlockSize:(unint64_t)a3
{
  id v4 = [(DIBaseParams *)self diskImageParamsXPC];
  [v4 setBlockSize:a3];
}

- (BOOL)requiresRootDaemon
{
  [(DIBaseParams *)self backend];
  sub_1001493EC((uint64_t)&v9, &lpsrc);
  if (v10) {
    sub_100004944(v10);
  }
  v2 = lpsrc;
  if (!lpsrc) {
    goto LABEL_15;
  }
  if (!v3)
  {
    {
      uint64_t v5 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v6 = sub_10005B610();
      goto LABEL_13;
    }
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_18;
  }
  id v4 = v3;
  uint64_t v5 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!sub_10005B610())
  {
    BOOL v7 = 0;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  char v6 = (*(uint64_t (**)(void *))(*(void *)v4 + 48))(v4);
LABEL_13:
  BOOL v7 = v6;
  if (v5) {
LABEL_17:
  }
    sub_100004944(v5);
LABEL_18:
  if (v12) {
    sub_100004944(v12);
  }
  return v7;
}

- (unint64_t)readPassphraseFlags
{
  return self->_readPassphraseFlags;
}

- (void)setReadPassphraseFlags:(unint64_t)a3
{
  self->_readPassphraseFlags = a3;
}

- (DiskImageParamsXPC)diskImageParamsXPC
{
  return self->_diskImageParamsXPC;
}

- (void)setDiskImageParamsXPC:(id)a3
{
}

- (DIURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (BOOL)isPstack
{
  return self->_isPstack;
}

- (NSError)deserializationError
{
  return self->_deserializationError;
}

- (void)setDeserializationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deserializationError, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_storeStrong((id *)&self->_diskImageParamsXPC, 0);
}

- (shared_ptr<Backend>)backend
{
  id v3 = v2;
  id v8 = [(DIBaseParams *)self diskImageParamsXPC];
  id v4 = [v8 backendXPC];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 backend];
  }
  else
  {
    *id v3 = 0;
    v3[1] = 0;
  }

  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)cryptoHeader
{
  v2 = [(DIBaseParams *)self diskImageParamsXPC];
  id v3 = [v2 backendXPC];
  id v4 = [v3 cryptoHeader];

  return v4;
}

@end