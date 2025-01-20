@interface KGGraphLockFile
- (BOOL)isLocked;
- (BOOL)lock;
- (KGGraphLockFile)initWithDatabaseURL:(id)a3;
- (void)unlock;
@end

@implementation KGGraphLockFile

- (void).cxx_destruct
{
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)unlock
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_locked)
  {
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0)
    {
      if (flock(fd, 8))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v4 = __error();
          v5 = strerror(*v4);
          int v6 = *__error();
          int v7 = 136315394;
          v8 = v5;
          __int16 v9 = 1024;
          int v10 = v6;
          _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed unflocking: %s %d", (uint8_t *)&v7, 0x12u);
        }
      }
      else
      {
        close(self->_fd);
        self->_int fd = -1;
        self->_locked = 0;
      }
    }
  }
}

- (BOOL)lock
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_locked) {
    __assert_rtn("-[KGGraphLockFile lock]", "KGGraphLockFile.m", 28, "_locked == NO");
  }
  int v3 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 514, 384);
  if (v3 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      int v6 = strerror(*v5);
      int v7 = *__error();
      *(_DWORD *)buf = 136315394;
      v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed opening lock file: %s %d", buf, 0x12u);
    }
  }
  else
  {
    int v4 = v3;
    if (flock(v3, 6))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = __error();
        int v10 = strerror(*v9);
        int v11 = *__error();
        *(_DWORD *)buf = 136315394;
        v13 = v10;
        __int16 v14 = 1024;
        int v15 = v11;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "flock failed: %s %d", buf, 0x12u);
      }
      close(v4);
    }
    else
    {
      self->_locked = 1;
      self->_int fd = v4;
    }
  }
  return self->_locked;
}

- (KGGraphLockFile)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGGraphLockFile;
  v5 = [(KGGraphLockFile *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathExtension:@"lock"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_int fd = -1;
    v5->_locked = 0;
  }

  return v5;
}

@end