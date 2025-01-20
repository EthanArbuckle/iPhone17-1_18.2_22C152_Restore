@interface BMFileHandle
+ (BOOL)supportsSecureCoding;
- (BMFileAttributes)attributes;
- (BMFileHandle)initWithCoder:(id)a3;
- (BMFileHandle)initWithFileDescriptor:(int)a3 attributes:(id)a4;
- (BOOL)isStale;
- (BOOL)overwriteWithData:(id)a3 error:(id *)a4;
- (NSFileHandle)nsFileHandle;
- (id)_initWithFileDescriptor:(int)a3 attributes:(id)a4;
- (id)readDataWithError:(id *)a3;
- (int)error;
- (int)fd;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)isStale;
- (void)nsFileHandle;
- (void)performWithInProcessLock:(id)a3;
@end

@implementation BMFileHandle

- (void).cxx_destruct
{
}

- (BMFileAttributes)attributes
{
  return self->_attributes;
}

- (void)performWithInProcessLock:(id)a3
{
  v7 = (void (**)(void))a3;
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"BMFileHandle.m", 333, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  v7[2]();
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isStale
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  if (fstat(self->_fd, &v20))
  {
    v3 = __biome_log_for_category(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BMFileHandle isStale].cold.5();
    }
    goto LABEL_28;
  }
  if (v20.st_nlink)
  {
    v3 = bm_fd_get_path(self->_fd);
    v4 = [(BMFileAttributes *)self->_attributes path];
    int v5 = [v3 isEqualToString:v4];

    if (v5)
    {
      BOOL v6 = 0;
      if ((v20.st_mode & 0xF000) != 0x4000 || v20.st_nlink > 2u) {
        goto LABEL_29;
      }
      int v7 = dup(self->_fd);
      if (v7 < 0)
      {
        v15 = __biome_log_for_category(2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[BMFileHandle isStale]();
        }
      }
      else
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock(p_lock);
        v9 = fdopendir(v7);
        v10 = v9;
        if (v9)
        {
          memset(&v22, 0, 512);
          v19 = 0;
          int v11 = readdir_r(v9, &v22, &v19);
          if (v11)
          {
            v12 = __biome_log_for_category(2);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
              [(BMFileHandle *)v11 isStale];
            }
          }
          rewinddir(v10);
          if (closedir(v10) == -1)
          {
            v13 = __biome_log_for_category(2);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              v14 = __error();
              [(BMFileHandle *)v14 isStale];
            }
          }
          if (v19)
          {
            os_unfair_lock_unlock(p_lock);
            BOOL v6 = 0;
LABEL_29:

            return v6;
          }
        }
        else
        {
          v16 = __biome_log_for_category(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = __error();
            [(BMFileHandle *)v17 isStale];
          }

          close(v7);
        }
        os_unfair_lock_unlock(p_lock);
      }
    }
LABEL_28:
    BOOL v6 = 1;
    goto LABEL_29;
  }
  return 1;
}

- (int)fd
{
  return self->_fd;
}

- (BMFileHandle)initWithFileDescriptor:(int)a3 attributes:(id)a4
{
  if (a3 < 0)
  {
    v4 = 0;
  }
  else
  {
    self = (BMFileHandle *)-[BMFileHandle _initWithFileDescriptor:attributes:](self, "_initWithFileDescriptor:attributes:");
    v4 = self;
  }

  return v4;
}

- (id)_initWithFileDescriptor:(int)a3 attributes:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMFileHandle;
  v8 = [(BMFileHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_fd = a3;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_attributes, a4);
    v9->_initialized = 1;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = xpc_fd_create(self->_fd);
    [v5 encodeXPCObject:v4 forKey:@"xfd"];
    [v5 encodeObject:self->_attributes forKey:@"attr"];
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BiomeStorageError" code:4 userInfo:0];
    [v5 failWithError:v4];
  }
}

- (BMFileHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"xfd"];
    int v6 = xpc_fd_dup(v5);
    self->_fd = v6;
    if (v6 < 0) {
      self->_error = *__error();
    }
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attr"];
    attributes = self->_attributes;
    self->_attributes = v7;

    self->_initialized = 1;
    v9 = self;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BiomeStorageError" code:4 userInfo:0];
    [v4 failWithError:v5];
    v9 = 0;
  }

  return v9;
}

- (id)readDataWithError:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!self->_initialized)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"BMFileHandle.m" lineNumber:203 description:@"Attempting to use uninitialized BMFileHandle"];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:self->_fd closeOnDealloc:0];
  int v6 = v5;
  if (v5)
  {
    id v7 = 0;
    if ([v5 seekToOffset:0 error:a3])
    {
      id v7 = [v6 readDataToEndOfFileAndReturnError:a3];
    }
  }
  else
  {
    if (a3)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"Unspecified failure";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a3 = [v8 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v9];
    }
    id v7 = 0;
  }

  return v7;
}

- (BOOL)overwriteWithData:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_initialized)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"BMFileHandle.m" lineNumber:222 description:@"Attempting to use uninitialized BMFileHandle"];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:self->_fd closeOnDealloc:0];
  v9 = v8;
  if (!v8)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Unspecified failure";
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v10 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v11];

LABEL_8:
    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  if (![v8 truncateAtOffset:0 error:a4]) {
    goto LABEL_8;
  }
  LOBYTE(a4) = [v9 writeData:v7 error:a4];
LABEL_9:

  return (char)a4;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *__error();
  v5[0] = 67240448;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Failed to close fd %{public}d with %{darwin.errno}d", (uint8_t *)v5, 0xEu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileHandle)nsFileHandle
{
  if (!self->_initialized)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"BMFileHandle.m" lineNumber:190 description:@"Attempting to use uninitialized BMFileHandle"];
  }
  uint64_t v3 = dup(self->_fd);
  if ((v3 & 0x80000000) != 0)
  {
    id v5 = __biome_log_for_category(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMFileHandle nsFileHandle]();
    }

    int v4 = 0;
  }
  else
  {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v3 closeOnDealloc:1];
  }
  return (NSFileHandle *)v4;
}

- (int)error
{
  return self->_error;
}

- (void)nsFileHandle
{
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "dup() failed: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

- (void)isStale
{
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "fstat() failed: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

@end