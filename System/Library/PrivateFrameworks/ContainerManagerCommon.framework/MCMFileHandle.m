@interface MCMFileHandle
+ (int64_t)compareDataProtectionClassTarget:(id)a3 withExisting:(id)a4;
- (BOOL)checkAppContainerProtection:(BOOL *)a3 error:(id *)a4;
- (BOOL)expectOpenWithError:(id *)a3;
- (BOOL)invalid;
- (BOOL)isOpen;
- (BOOL)openLazily;
- (BOOL)openWithError:(id *)a3;
- (BOOL)registerAppContainerForProtectionWithError:(id *)a3;
- (BOOL)removeXattr:(id)a3 error:(id *)a4;
- (BOOL)setPermissions:(unsigned __int16)a3 andOwner:(id)a4 error:(id *)a5;
- (BOOL)setXattr:(id)a3 valueAsNumber:(id)a4 error:(id *)a5;
- (BOOL)setXattr:(id)a3 valueAsString:(id)a4 error:(id *)a5;
- (BOOL)setXattr:(id)a3 valueAsUUID:(id)a4 error:(id *)a5;
- (BOOL)withOpenFileDoBlock:(id)a3;
- (MCMFileHandle)initWithPath:(id)a3 relativeToFileHandle:(id)a4 direction:(unint64_t)a5 symlinks:(unint64_t)a6 createMode:(unsigned __int16)a7 createDPClass:(id)a8 openLazily:(BOOL)a9;
- (MCMFileHandle_Private)relativeToFileHandle;
- (NSError)openError;
- (NSNumber)createDPClass;
- (NSString)description;
- (NSString)path;
- (id)copyValueAsNumberFromXattr:(id)a3 error:(id *)a4;
- (id)copyValueAsStringFromXattr:(id)a3 maxLength:(unint64_t)a4 error:(id *)a5;
- (id)copyValueAsUUIDFromXattr:(id)a3 error:(id *)a4;
- (int)_computeFlags;
- (int)_openAbsolute;
- (int)_openRelative;
- (int)fd;
- (int)flags;
- (unint64_t)direction;
- (unint64_t)symlinks;
- (unsigned)_computeMode;
- (unsigned)createMode;
- (void)close;
- (void)dealloc;
- (void)setFd:(int)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setOpen:(BOOL)a3;
- (void)setOpenError:(id)a3;
- (void)setRelativeToFileHandle:(id)a3;
@end

@implementation MCMFileHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openError, 0);
  objc_storeStrong((id *)&self->_createDPClass, 0);
  objc_storeStrong((id *)&self->_relativeToFileHandle, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (id)copyValueAsNumberFromXattr:(id)a3 error:(id *)a4
{
  v19[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19[0] = 0;
  id v7 = [(MCMFileHandle *)self copyValueAsStringFromXattr:v6 maxLength:20 error:v19];
  id v8 = v19[0];
  if (v7)
  {
    __endptr = 0;
    id v9 = v7;
    unint64_t v10 = strtoull((const char *)[v9 UTF8String], &__endptr, 10);
    if (__endptr && !*__endptr)
    {
      v12 = [NSNumber numberWithUnsignedLongLong:v10];
      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke;
      v14[3] = &unk_1E6A7FFC8;
      id v15 = v6;
      v16 = self;
      id v17 = v9;
      uint64_t v11 = __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke((uint64_t)v14);

      v12 = 0;
      id v8 = (id)v11;
      if (!a4) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    v12 = 0;
    if (!a4) {
      goto LABEL_11;
    }
  }
  if (!v12) {
    *a4 = v8;
  }
LABEL_11:

  return v12;
}

- (id)copyValueAsUUIDFromXattr:(id)a3 error:(id *)a4
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17[0] = 0;
  id v7 = [(MCMFileHandle *)self copyValueAsStringFromXattr:v6 maxLength:36 error:v17];
  id v8 = v17[0];
  if (v7)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    if (v9)
    {
      unint64_t v10 = (void *)v9;
      goto LABEL_8;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke;
    v13[3] = &unk_1E6A7FFC8;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    uint64_t v11 = __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke((uint64_t)v13);

    id v8 = (id)v11;
  }
  if (a4)
  {
    id v8 = v8;
    unint64_t v10 = 0;
    *a4 = v8;
  }
  else
  {
    unint64_t v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(MCMFileHandle *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MCMFileHandle;
  [(MCMFileHandle *)&v3 dealloc];
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (MCMFileHandle)initWithPath:(id)a3 relativeToFileHandle:(id)a4 direction:(unint64_t)a5 symlinks:(unint64_t)a6 createMode:(unsigned __int16)a7 createDPClass:(id)a8 openLazily:(BOOL)a9
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MCMFileHandle;
  v19 = [(MCMFileHandle *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_path, a3);
    objc_storeStrong((id *)&v20->_relativeToFileHandle, a4);
    v20->_direction = a5;
    v20->_symlinks = a6;
    v20->_openLazily = a9;
    v20->_fd = -1;
    v20->_invalid = 0;
    openError = v20->_openError;
    v20->_openError = 0;

    v20->_open = 0;
    int v22 = [(MCMFileHandle *)v20 _computeFlags];
    createDPClass = v20->_createDPClass;
    v20->_flags = v22;
    v20->_createMode = 0;
    v20->_createDPClass = 0;

    if ((v20->_flags & 0x200) != 0)
    {
      v20->_createMode = a7;
      objc_storeStrong((id *)&v20->_createDPClass, a8);
    }
  }

  return v20;
}

- (int)_computeFlags
{
  unint64_t v2 = self->_direction - 1;
  if (v2 > 9) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = dword_1D7815A90[v2];
  }
  unint64_t symlinks = self->_symlinks;
  int v5 = v3 | 0x100;
  if (!symlinks) {
    v3 |= 0x20000000u;
  }
  if (symlinks == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)copyValueAsStringFromXattr:(id)a3 maxLength:(unint64_t)a4 error:(id *)a5
{
  __s[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v25 = 0;
  __s[0] = 0;
  BOOL v9 = [(MCMFileHandle *)self expectOpenWithError:&v25];
  id v10 = v25;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if (a4 + 1 > 1) {
    size_t v11 = a4 + 1;
  }
  else {
    size_t v11 = 1;
  }
  v12 = malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL);
  __s[0] = v12;
  if (!v12)
  {
LABEL_12:
    id v17 = 0;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v13 = *(uint64_t (**)(uint64_t, uint64_t, unsigned char *, unint64_t, void, void))(*MEMORY[0x1E4F14868]
                                                                                              + 264);
  uint64_t v14 = [(MCMFileHandle *)self fd];
  id v15 = v8;
  int64_t v16 = v13(v14, [v15 UTF8String], v12, a4, 0, 0);
  if (v16 < 1)
  {
    if (*__error() != 93)
    {
      int v19 = *__error();
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke;
      v21[3] = &unk_1E6A7FFA0;
      id v22 = v15;
      v23 = self;
      int v24 = v19;
      uint64_t v20 = __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke((uint64_t)v21);

      id v17 = 0;
      id v10 = (id)v20;
      if (!a5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16 < a4) {
    v12[v16] = 0;
  }
  id v17 = [NSString stringWithUTF8String:v12];
  if (a5)
  {
LABEL_13:
    if (!v17) {
      *a5 = v10;
    }
  }
LABEL_15:
  if (v12)
  {
    free(v12);
    memset_s(__s, 8uLL, 0, 8uLL);
  }

  return v17;
}

- (int)fd
{
  return self->_fd;
}

- (void)close
{
  if ([(MCMFileHandle *)self isOpen])
  {
    (*(void (**)(void))(*MEMORY[0x1E4F14868] + 152))([(MCMFileHandle *)self fd]);
    [(MCMFileHandle *)self setOpen:0];
    [(MCMFileHandle *)self setInvalid:1];
  }
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)expectOpenWithError:(id *)a3
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  if ([(MCMFileHandle *)self isOpen])
  {
    id v5 = 0;
    BOOL v6 = 1;
LABEL_8:

    return v6;
  }
  if ([(MCMFileHandle *)self invalid])
  {
    _os_crash();
    __break(1u);
  }
  else if ([(MCMFileHandle *)self openLazily])
  {
    v8[0] = 0;
    BOOL v6 = [(MCMFileHandle *)self openWithError:v8];
    id v5 = v8[0];
    if (a3)
    {
      if (!v6)
      {
        id v5 = v5;
        BOOL v6 = 0;
        *a3 = v5;
      }
    }
    goto LABEL_8;
  }
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (BOOL)openWithError:(id *)a3
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if (![(MCMFileHandle *)self isOpen])
  {
    if ([(MCMFileHandle *)self invalid])
    {
      BOOL result = _os_crash();
      __break(1u);
      return result;
    }
    id v5 = [(MCMFileHandle *)self openError];

    if (!v5)
    {
      BOOL v6 = [(MCMFileHandle *)self relativeToFileHandle];

      if (v6) {
        int v7 = [(MCMFileHandle *)self _openRelative];
      }
      else {
        int v7 = [(MCMFileHandle *)self _openAbsolute];
      }
      self->_fd = v7;
      if (v7 < 0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __31__MCMFileHandle_openWithError___block_invoke;
        v11[3] = &unk_1E6A80A30;
        v11[4] = self;
        id v8 = __31__MCMFileHandle_openWithError___block_invoke((uint64_t)v11);
        [(MCMFileHandle *)self setOpenError:v8];
      }
      else
      {
        [(MCMFileHandle *)self setOpen:1];
      }
    }
  }
  BOOL v9 = [(MCMFileHandle *)self isOpen];
  if (a3)
  {
    if (!v9)
    {
      *a3 = [(MCMFileHandle *)self openError];
    }
  }
  return [(MCMFileHandle *)self isOpen];
}

- (BOOL)isOpen
{
  return self->_open;
}

- (MCMFileHandle_Private)relativeToFileHandle
{
  return self->_relativeToFileHandle;
}

- (BOOL)openLazily
{
  return self->_openLazily;
}

- (NSError)openError
{
  return self->_openError;
}

- (int)_openAbsolute
{
  [(MCMFileHandle *)self _computeMode];
  int v3 = [(MCMFileHandle *)self createDPClass];

  uint64_t v4 = *MEMORY[0x1E4F14868];
  if (v3)
  {
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 520);
    id v6 = [(MCMFileHandle *)self path];
    uint64_t v7 = [v6 fileSystemRepresentation];
    uint64_t v8 = [(MCMFileHandle *)self flags];
    BOOL v9 = [(MCMFileHandle *)self createDPClass];
    int v10 = v5(v7, v8, [v9 intValue], 0);
  }
  else
  {
    size_t v11 = *(uint64_t (**)(uint64_t, void))(v4 + 512);
    id v6 = [(MCMFileHandle *)self path];
    int v10 = v11([v6 fileSystemRepresentation], -[MCMFileHandle flags](self, "flags"));
  }

  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (int)flags
{
  return self->_flags;
}

- (NSNumber)createDPClass
{
  return self->_createDPClass;
}

- (unsigned)_computeMode
{
  if ((self->_flags & 0x200) != 0) {
    return self->_createMode;
  }
  else {
    return 0;
  }
}

- (void)setOpenError:(id)a3
{
  p_openError = &self->_openError;

  objc_storeStrong((id *)p_openError, a3);
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unsigned)createMode
{
  return self->_createMode;
}

- (unint64_t)symlinks
{
  return self->_symlinks;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setRelativeToFileHandle:(id)a3
{
  p_relativeToFileHandle = &self->_relativeToFileHandle;

  objc_storeStrong((id *)p_relativeToFileHandle, a3);
}

- (int)_openRelative
{
  v19[1] = *(id *)MEMORY[0x1E4F143B8];
  int v3 = [(MCMFileHandle *)self relativeToFileHandle];
  v19[0] = 0;
  int v4 = [v3 expectOpenWithError:v19];
  id v5 = v19[0];

  if (!v4)
  {
    _os_crash();
    __break(1u);
  }
  [(MCMFileHandle *)self _computeMode];
  id v6 = [(MCMFileHandle *)self createDPClass];

  uint64_t v7 = *MEMORY[0x1E4F14868];
  if (v6)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v7 + 536);
    BOOL v9 = [(MCMFileHandle *)self relativeToFileHandle];
    uint64_t v10 = [v9 fd];
    id v11 = [(MCMFileHandle *)self path];
    uint64_t v12 = [v11 fileSystemRepresentation];
    uint64_t v13 = [(MCMFileHandle *)self flags];
    uint64_t v14 = [(MCMFileHandle *)self createDPClass];
    int v15 = v8(v10, v12, v13, [v14 intValue], 0);
  }
  else
  {
    int64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 528);
    BOOL v9 = [(MCMFileHandle *)self relativeToFileHandle];
    uint64_t v17 = [v9 fd];
    id v11 = [(MCMFileHandle *)self path];
    int v15 = v16(v17, [v11 fileSystemRepresentation], -[MCMFileHandle flags](self, "flags"));
  }

  return v15;
}

- (NSString)description
{
  return [(MCMFileHandle *)self path];
}

- (BOOL)registerAppContainerForProtectionWithError:(id *)a3
{
  return 1;
}

- (BOOL)checkAppContainerProtection:(BOOL *)a3 error:(id *)a4
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)removeXattr:(id)a3 error:(id *)a4
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20[0] = 0;
  BOOL v7 = [(MCMFileHandle *)self expectOpenWithError:v20];
  id v8 = v20[0];
  if (!v7) {
    goto LABEL_6;
  }
  BOOL v9 = *(unsigned int (**)(uint64_t, uint64_t, void))(*MEMORY[0x1E4F14868] + 304);
  uint64_t v10 = [(MCMFileHandle *)self fd];
  id v11 = v6;
  if (!v9(v10, [v11 UTF8String], 0))
  {
    BOOL v13 = 1;
    goto LABEL_10;
  }
  int v12 = *__error();
  BOOL v13 = 1;
  if (v12 && v12 != 93)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __35__MCMFileHandle_removeXattr_error___block_invoke;
    v16[3] = &unk_1E6A7FFA0;
    id v17 = v11;
    id v18 = self;
    int v19 = v12;
    uint64_t v14 = __35__MCMFileHandle_removeXattr_error___block_invoke((uint64_t)v16);

    id v8 = (id)v14;
LABEL_6:
    if (a4)
    {
      id v8 = v8;
      BOOL v13 = 0;
      *a4 = v8;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
LABEL_10:

  return v13;
}

id __35__MCMFileHandle_removeXattr_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) path];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"Could not clear xattr [%@] from [%@]; error = %{darwin.errno}d",
                 v3,
                 v4,
                 *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileHandle removeXattr:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11C30;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  BOOL v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 48) userInfo:v8];

  return v9;
}

- (BOOL)setXattr:(id)a3 valueAsNumber:(id)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [a4 stringValue];
  LOBYTE(a5) = [(MCMFileHandle *)self setXattr:v8 valueAsString:v9 error:a5];

  return (char)a5;
}

- (BOOL)setXattr:(id)a3 valueAsUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [a4 UUIDString];
  LOBYTE(a5) = [(MCMFileHandle *)self setXattr:v8 valueAsString:v9 error:a5];

  return (char)a5;
}

- (BOOL)setXattr:(id)a3 valueAsString:(id)a4 error:(id *)a5
{
  v28[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v28[0] = 0;
  BOOL v10 = [(MCMFileHandle *)self expectOpenWithError:v28];
  id v11 = v28[0];
  if (v10)
  {
    id v22 = a5;
    id v12 = v9;
    BOOL v13 = (const char *)[v12 UTF8String];
    size_t v14 = strlen(v13);
    int v15 = *(unsigned int (**)(uint64_t, uint64_t, const char *, size_t, void, void))(*MEMORY[0x1E4F14868]
                                                                                                + 328);
    uint64_t v16 = [(MCMFileHandle *)self fd];
    id v17 = v8;
    if (!v15(v16, [v17 UTF8String], v13, v14, 0, 0) || (int v18 = *__error()) == 0)
    {
      BOOL v20 = 1;
      goto LABEL_9;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke;
    v23[3] = &unk_1E6A7FFF0;
    id v24 = v17;
    id v25 = self;
    id v26 = v12;
    int v27 = v18;
    uint64_t v19 = __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke((uint64_t)v23);

    id v11 = (id)v19;
    a5 = v22;
  }
  if (a5)
  {
    id v11 = v11;
    BOOL v20 = 0;
    *a5 = v11;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_9:

  return v20;
}

id __46__MCMFileHandle_setXattr_valueAsString_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) path];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"Could not set xattr [%@] on [%@] to [%@]; error = %{darwin.errno}d",
                 v3,
                 v4,
                 *(void *)(a1 + 48),
                 *(unsigned int *)(a1 + 56));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileHandle setXattr:valueAsString:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11C18;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 56) userInfo:v8];

  return v9;
}

id __50__MCMFileHandle_copyValueAsNumberFromXattr_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) path];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"Xattr [%@] on [%@] was not a number; value = [%@]",
                 v3,
                 v4,
                 *(void *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileHandle copyValueAsNumberFromXattr:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11C00;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v8];

  return v9;
}

id __48__MCMFileHandle_copyValueAsUUIDFromXattr_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) path];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"Xattr [%@] on [%@] was not a UUID; value = [%@]",
                 v3,
                 v4,
                 *(void *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileHandle copyValueAsUUIDFromXattr:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11BE8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v8];

  return v9;
}

id __60__MCMFileHandle_copyValueAsStringFromXattr_maxLength_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) path];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"Could not read xattr [%@] from [%@]; error = %{darwin.errno}d",
                 v3,
                 v4,
                 *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileHandle copyValueAsStringFromXattr:maxLength:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11BD0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 48) userInfo:v8];

  return v9;
}

- (BOOL)setPermissions:(unsigned __int16)a3 andOwner:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a4;
  v23[0] = 0;
  BOOL v9 = [(MCMFileHandle *)self expectOpenWithError:v23];
  id v10 = v23[0];
  if (v9)
  {
    uint64_t v11 = MEMORY[0x1E4F14868];
    if ((*(unsigned int (**)(void, uint64_t))(*MEMORY[0x1E4F14868] + 208))([(MCMFileHandle *)self fd], v6)&& (int v12 = *__error()) != 0)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v20[2] = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke;
      v20[3] = &unk_1E6A7FF78;
      v20[4] = self;
      __int16 v22 = v6;
      int v21 = v12;
      uint64_t v13 = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke((uint64_t)v20);
    }
    else
    {
      if (!v8
        || !(*(unsigned int (**)(void, uint64_t, uint64_t))(*(void *)v11 + 224))(-[MCMFileHandle fd](self, "fd"), [v8 UID], objc_msgSend(v8, "primaryGID"))|| (int v14 = *__error()) == 0)
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v17[2] = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_26;
      v17[3] = &unk_1E6A7FFA0;
      v17[4] = self;
      id v18 = v8;
      int v19 = v14;
      uint64_t v13 = __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_26((uint64_t)v17);

      id v10 = v18;
    }

    id v10 = (id)v13;
  }
  if (a5)
  {
    id v10 = v10;
    BOOL v15 = 0;
    *a5 = v10;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_14:

  return v15;
}

id __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  int v4 = objc_msgSend(v2, "initWithFormat:", @"Could not chmod [%@] to [0%o]; error = %{darwin.errno}d",
                 v3,
                 *(unsigned __int16 *)(a1 + 44),
                 *(unsigned int *)(a1 + 40));

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileHandle setPermissions:andOwner:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11BA0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v7];

  return v8;
}

id __47__MCMFileHandle_setPermissions_andOwner_error___block_invoke_26(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  int v4 = objc_msgSend(v2, "initWithFormat:", @"Could not chown [%@] to [%@]; error = %{darwin.errno}d",
                 v3,
                 *(void *)(a1 + 40),
                 *(unsigned int *)(a1 + 48));

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileHandle setPermissions:andOwner:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11BB8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 48) userInfo:v7];

  return v8;
}

- (BOOL)withOpenFileDoBlock:(id)a3
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  int v4 = (uint64_t (**)(id, id))a3;
  v9[0] = 0;
  BOOL v5 = [(MCMFileHandle *)self openWithError:v9];
  id v6 = v9[0];
  BOOL v7 = v5 & v4[2](v4, v6);
  [(MCMFileHandle *)self close];

  return v7;
}

id __31__MCMFileHandle_openWithError___block_invoke(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  int v4 = (void *)[v2 initWithFormat:@"Failed to open [%@] with [%@]", v3, *(void *)(a1 + 32)];

  v10[0] = @"FunctionName";
  BOOL v5 = [NSString stringWithUTF8String:"-[MCMFileHandle openWithError:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11B88;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

+ (int64_t)compareDataProtectionClassTarget:(id)a3 withExisting:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [a3 intValue];
  int v7 = [v5 intValue];

  if ((v7 | v6) > 7 || v6 - 5 < 2) {
    return 0;
  }
  int v9 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v7];
  if ((v7 - 5) < 2) {
    int v9 = 2;
  }
  if (MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v6] <= v9) {
    return 2;
  }
  else {
    return 1;
  }
}

@end