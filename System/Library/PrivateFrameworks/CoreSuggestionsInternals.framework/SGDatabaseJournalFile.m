@interface SGDatabaseJournalFile
- (SGDatabaseJournalFile)initWithPath:(id)a3;
- (id)description;
- (id)read;
- (void)clear;
- (void)dealloc;
- (void)destroy;
- (void)destroyAndUnlinkIfEmpty;
- (void)unlink;
- (void)write:(id)a3;
@end

@implementation SGDatabaseJournalFile

- (void).cxx_destruct
{
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGDatabaseJournalFile %@>", self->_path];
  return v2;
}

- (void)unlink
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_dead)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGDatabaseJournalFile.m", 171, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
  if (unlink([(NSString *)self->_path UTF8String]))
  {
    v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      int v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 138412802;
      v12 = path;
      __int16 v13 = 1024;
      int v14 = v6;
      __int16 v15 = 2080;
      v16 = v8;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "Could not remove %@: errno=%i: %s", buf, 0x1Cu);
    }
  }
  else
  {
    self->_dead = 1;
  }
}

- (void)clear
{
  if (self->_dead)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SGDatabaseJournalFile.m", 161, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  if (self->_len)
  {
    lseek(self->_fd, 0, 0);
    ftruncate(self->_fd, 0);
    self->_len = 0;
  }
}

- (id)read
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_dead)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SGDatabaseJournalFile.m", 105, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  len = (void *)self->_len;
  if (len)
  {
    if (!self->_written)
    {
      fcntl(self->_fd, 48, 1);
      len = (void *)self->_len;
    }
    v4 = (int *)malloc_type_malloc((size_t)len, 0xC031879CuLL);
    unint64_t v5 = pread(self->_fd, v4, self->_len, 0);
    unint64_t v6 = self->_len;
    if (v5 < v6)
    {
      v7 = sgLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        int v9 = *__error();
        v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 138412802;
        *(void *)v31 = path;
        *(_WORD *)&v31[8] = 1024;
        v32[0] = v9;
        LOWORD(v32[1]) = 2080;
        *(void *)((char *)&v32[1] + 2) = v11;
        v12 = "Could not read from journal file %@: errno=%i: %s";
        __int16 v13 = v7;
        uint32_t v14 = 28;
LABEL_13:
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
LABEL_28:

LABEL_29:
      free(v4);
      len = 0;
      goto LABEL_30;
    }
    if (v6 > 0xB)
    {
      int v16 = *v4;
      if (*v4 != -1347426410)
      {
        if (*v4 == 1768714338 && *(int *)((char *)v4 + 3) == 812938089)
        {
          len = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v4 length:self->_len freeWhenDone:1];
          goto LABEL_30;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v22 = self->_path;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v31 = -1347426410;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v16;
          LOWORD(v32[0]) = 2112;
          *(void *)((char *)v32 + 2) = v22;
          _os_log_error_impl(&dword_1CA650000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Journal file has invalid magic number: expected 0x%x, got 0x%x: %@", buf, 0x18u);
        }
        goto LABEL_29;
      }
      uint64_t v17 = v4[1];
      if (v6 - 12 == v17)
      {
        int v18 = adler32(0, (const Bytef *)v4 + 12, v17);
        if (v4[2] == v18)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v20 = v4[1];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __29__SGDatabaseJournalFile_read__block_invoke;
          v29[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
          v29[4] = v4;
          len = (void *)[v19 initWithBytesNoCopy:v4 + 3 length:v20 deallocator:v29];
          goto LABEL_30;
        }
        v7 = sgLogHandle();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        v25 = self->_path;
        int v26 = v4[2];
        *(_DWORD *)buf = 138412802;
        *(void *)v31 = v25;
        *(_WORD *)&v31[8] = 1024;
        v32[0] = v18;
        LOWORD(v32[1]) = 1024;
        *(_DWORD *)((char *)&v32[1] + 2) = v26;
        v12 = "Journal file checksum mismatch: %@: %u / %u";
        __int16 v13 = v7;
        uint32_t v14 = 24;
        goto LABEL_13;
      }
      v7 = sgLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      v23 = self->_path;
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v23;
      v12 = "Journal file truncated: %@";
    }
    else
    {
      v7 = sgLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      __int16 v15 = self->_path;
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v15;
      v12 = "Journal file truncated: %@";
    }
    __int16 v13 = v7;
    uint32_t v14 = 12;
    goto LABEL_13;
  }
LABEL_30:
  return len;
}

void __29__SGDatabaseJournalFile_read__block_invoke(uint64_t a1)
{
}

- (void)write:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_len)
  {
    uint32_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SGDatabaseJournalFile.m" lineNumber:81 description:@"Can not overwrite journal file"];
  }
  if ((unint64_t)[v5 length] >> 32)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGDatabaseJournalFile.m", 82, @"Invalid parameter not satisfying: %@", @"data.length <= UINT32_MAX" object file lineNumber description];
  }
  if (self->_dead)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDatabaseJournalFile.m", 83, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  id v6 = v5;
  int v7 = adler32(0, (const Bytef *)[v6 bytes], objc_msgSend(v6, "length"));
  v17[0] = -1347426410;
  v17[1] = [v6 length];
  v17[2] = v7;
  v24.iov_base = v17;
  v24.iov_len = 12;
  id v8 = v6;
  uint64_t v25 = [v8 bytes];
  uint64_t v26 = [v8 length];
  if (writev(self->_fd, &v24, 2) < 0)
  {
    int v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      int v11 = *__error();
      v12 = __error();
      __int16 v13 = strerror(*v12);
      *(_DWORD *)buf = 138412802;
      id v19 = path;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 2080;
      v23 = v13;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "Could not write to journal file %@: errno=%i: %s", buf, 0x1Cu);
    }
  }
  else
  {
    self->_len = [v8 length] + 12;
    self->_written = 1;
  }
}

- (void)dealloc
{
  [(SGDatabaseJournalFile *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)SGDatabaseJournalFile;
  [(SGDatabaseJournalFile *)&v3 dealloc];
}

- (void)destroyAndUnlinkIfEmpty
{
  if (!self->_len) {
    [(SGDatabaseJournalFile *)self unlink];
  }
  [(SGDatabaseJournalFile *)self destroy];
}

- (void)destroy
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  self->_dead = 1;
}

- (SGDatabaseJournalFile)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SGDatabaseJournalFile;
  id v6 = [(SGDatabaseJournalFile *)&v22 init];
  int v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  p_path = &v6->_path;
  objc_storeStrong((id *)&v6->_path, a3);
  int v9 = open_dprotected_np((const char *)[v5 UTF8String], 514, 2, 0, 384);
  v7->_int fd = v9;
  if (v9 < 0)
  {
    int v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = *p_path;
      int v19 = *__error();
      __int16 v20 = __error();
      int v21 = strerror(*v20);
      v29.st_dev = 138412802;
      *(void *)&v29.st_mode = v18;
      WORD2(v29.st_ino) = 1024;
      *(_DWORD *)((char *)&v29.st_ino + 6) = v19;
      HIWORD(v29.st_uid) = 2080;
      *(void *)&v29.st_gid = v21;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "Could not open %@: errno=%i: %s", (uint8_t *)&v29, 0x1Cu);
    }

    goto LABEL_10;
  }
  memset(&v29, 0, sizeof(v29));
  if (!fstat(v9, &v29))
  {
    v7->_len = v29.st_size;
LABEL_12:
    v12 = v7;
    goto LABEL_13;
  }
  v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint32_t v14 = *p_path;
    int v15 = *__error();
    int v16 = __error();
    uint64_t v17 = strerror(*v16);
    *(_DWORD *)buf = 138412802;
    iovec v24 = v14;
    __int16 v25 = 1024;
    int v26 = v15;
    __int16 v27 = 2080;
    v28 = v17;
    _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
  }

  close(v7->_fd);
LABEL_10:
  v12 = 0;
LABEL_13:

  return v12;
}

@end