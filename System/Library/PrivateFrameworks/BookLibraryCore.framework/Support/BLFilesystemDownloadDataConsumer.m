@interface BLFilesystemDownloadDataConsumer
- (BLFilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5;
- (BOOL)_checkHashForByteCount:(int64_t)a3;
- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4;
- (BOOL)_openFile;
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)_truncateToSize:(int64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)suspend;
- (void)truncate;
@end

@implementation BLFilesystemDownloadDataConsumer

- (BLFilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BLFilesystemDownloadDataConsumer;
  v10 = [(BLFilesystemDownloadDataConsumer *)&v16 init];
  if (v10)
  {
    id v11 = [v9 copy];
    v12 = *(void **)(v10 + 25);
    *(void *)(v10 + 25) = v11;

    *(void *)(v10 + 129) = a5;
    id v13 = [v8 copy];
    v14 = *(void **)(v10 + 137);
    *(void *)(v10 + 137) = v13;

    [v10 _openFile];
    if (*(_DWORD *)(v10 + 17) == -1)
    {

      v10 = 0;
    }
  }

  return (BLFilesystemDownloadDataConsumer *)v10;
}

- (void)dealloc
{
  int v3 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v3 != -1) {
    close(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)BLFilesystemDownloadDataConsumer;
  [(BLFilesystemDownloadDataConsumer *)&v4 dealloc];
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1)
  {
    int v10 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
    id v11 = v6;
    ssize_t v12 = write(v10, [v11 bytes], (size_t)objc_msgSend(v11, "length"));
    if (v12 < 0)
    {
      id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      BOOL v8 = 0;
    }
    else
    {
      id v9 = 0;
      *(void *)(&self->super._overrideProgress + 1) += v12;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v12;
      BOOL v8 = 1;
    }
  }
  else
  {
    id v16 = 0;
    BOOL v8 = [(BLFilesystemDownloadDataConsumer *)self _hashAndWriteData:v6 error:&v16];
    id v9 = v16;
  }
  if (BYTE5(self->_bytesWritten)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(void *)(&self->super._overrideProgress + 1) > 0;
  }
  BYTE5(self->_bytesWritten) = v13;
  if (a4) {
    char v14 = v8;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    *a4 = v9;
  }

  return v8;
}

- (unint64_t)diskUsage
{
  return *(void *)(&self->super._overrideProgress + 1);
}

- (BOOL)finish:(id *)a3
{
  v5 = BLServiceDownloadFilesystemLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(int64_t *)((char *)&self->_numberOfBytesToHash + 1);
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Download-FileSys]: Finishing for file: %@", (uint8_t *)&v12, 0xCu);
  }

  if (*(_DWORD *)((char *)&self->_bytesWritten + 1) == -1)
  {
    id v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1
      || *(int64_t *)((char *)&self->_resumptionOffset + 1) >= *(void *)(&self->super._overrideProgress + 1)
      || -[BLFilesystemDownloadDataConsumer _checkHashForByteCount:](self, "_checkHashForByteCount:"))
    {
      id v7 = 0;
      BOOL v8 = 1;
    }
    else
    {
      sub_10004B6AC(8, 0, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [(BLFilesystemDownloadDataConsumer *)self _truncateToSize:*(unint64_t *)((char *)&self->_resumptionOffset + 1)];
      BOOL v8 = 0;
    }
    close(*(_DWORD *)((char *)&self->_bytesWritten + 1));
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
    if (a3 && !v8)
    {
      id v7 = v7;
      *a3 = v7;
      id v9 = BLServiceDownloadFilesystemLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(int64_t *)((char *)&self->_numberOfBytesToHash + 1);
        int v12 = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Download-FileSys]: Error finishing for file: %@, error:  %@", (uint8_t *)&v12, 0x16u);
      }

      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)reset
{
  int v3 = BLServiceDownloadFilesystemLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->_numberOfBytesToHash + 1);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[Download-FileSys]: Resetting file: %@", (uint8_t *)&v5, 0xCu);
  }

  [(BLFilesystemDownloadDataConsumer *)self suspend];
  [(BLFilesystemDownloadDataConsumer *)self _openFile];
  BYTE5(self->_bytesWritten) = *(NSString **)((char *)&self->_path + 1) != 0;
}

- (void)suspend
{
  int v3 = BLServiceDownloadFilesystemLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(int64_t *)((char *)&self->_numberOfBytesToHash + 1);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[Download-FileSys]: Suspending file: %@", (uint8_t *)&v6, 0xCu);
  }

  int v5 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v5 != -1)
  {
    close(v5);
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
  }
}

- (void)truncate
{
}

- (BOOL)_checkHashForByteCount:(int64_t)a3
{
  CC_MD5_Final(md, (CC_MD5_CTX *)((char *)&self->_hashes + 1));
  int v5 = sub_1000666B0(md, 0x10u);
  float v6 = (double)a3 / (double)*(uint64_t *)((char *)&self->_md5Context.num + 1);
  unint64_t v7 = (uint64_t)(float)(ceilf(v6) + -1.0);
  if ((unint64_t)[*(id *)((char *)&self->_fd + 1) count] <= v7)
  {
    BOOL v8 = BLServiceDownloadFilesystemLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = *(void **)((char *)&self->_md5Context.num + 1);
      int v14 = 134218496;
      unint64_t v15 = v7;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      __int16 v18 = 2048;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[Download-FileSys]: Invalid chunk index: %ld, for bytes written: %lld, bytes to hash: %ld", (uint8_t *)&v14, 0x20u);
    }
    unsigned __int8 v9 = 0;
  }
  else
  {
    BOOL v8 = [*(id *)((char *)&self->_fd + 1) objectAtIndex:v7];
    unsigned __int8 v9 = [v5 isEqualToString:v8];
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = BLServiceDownloadFilesystemLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v11 = *(void *)((char *)&self->_md5Context.num + 1) * v7;
        int v14 = 134218754;
        unint64_t v15 = v11;
        __int16 v16 = 2048;
        int64_t v17 = a3;
        __int16 v18 = 2114;
        v19 = v5;
        __int16 v20 = 2114;
        v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[Download-FileSys]: Hash mismatch for chunk: (%lld:%lld), %{public}@ should be %{public}@", (uint8_t *)&v14, 0x2Au);
      }
    }
  }

  return v9;
}

- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *(void *)(&self->super._overrideProgress + 1);
  uint64_t v8 = *(void *)((char *)&self->_md5Context.num + 1);
  uint64_t v9 = (uint64_t)[v6 length];
  if (v9 < 1)
  {
LABEL_13:
    id v16 = 0;
    BOOL v17 = 1;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  v19 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = v7 % v8;
  while (1)
  {
    uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    uint64_t v14 = v13 - v12 >= v10 - v11 ? v10 - v11 : v13 - v12;
    if (v14 >= 1)
    {
      CC_MD5_Update((CC_MD5_CTX *)((char *)&self->_hashes + 1), (char *)[v6 bytes] + v11, v14);
      uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    }
    if (v14 + v12 == v13) {
      break;
    }
LABEL_11:
    ssize_t v15 = write(*(_DWORD *)((char *)&self->_bytesWritten + 1), (char *)[v6 bytes] + v11, v14);
    if (v15 < v14)
    {
      sub_10004B6AC(7, 0, 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    uint64_t v12 = 0;
    v11 += v14;
    *(void *)(&self->super._overrideProgress + 1) += v15;
    if (v11 >= v10) {
      goto LABEL_13;
    }
  }
  if ([(BLFilesystemDownloadDataConsumer *)self _checkHashForByteCount:*(void *)(&self->super._overrideProgress + 1) + v14])
  {
    CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
    *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v13;
    goto LABEL_11;
  }
  sub_10004B6AC(8, 0, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [(BLFilesystemDownloadDataConsumer *)self _truncateToSize:*(unint64_t *)((char *)&self->_resumptionOffset + 1)];
LABEL_16:
  if (v19)
  {
    id v16 = v16;
    BOOL v17 = 0;
    id *v19 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)_openFile
{
  int v3 = (const char *)[*(id *)((char *)&self->_numberOfBytesToHash + 1) fileSystemRepresentation];
  *(_DWORD *)((char *)&self->_bytesWritten + 1) = open(v3, 522, 420);
  uint64_t v4 = BLServiceDownloadFilesystemLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(int64_t *)((char *)&self->_numberOfBytesToHash + 1);
    buf.st_dev = 138412290;
    *(void *)&buf.st_mode = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[Download-FileSys]: Opening file: %@", (uint8_t *)&buf, 0xCu);
  }

  int v6 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v6 == -1) {
    return 0;
  }
  fcntl(v6, 48, 1);
  fcntl(*(_DWORD *)((char *)&self->_bytesWritten + 1), 76, 1);
  CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
  memset(&buf, 0, sizeof(buf));
  if (stat(v3, &buf) != -1)
  {
    st_size = (NSString *)buf.st_size;
    *(void *)(&self->super._overrideProgress + 1) = buf.st_size;
    *(NSString **)((char *)&self->_path + 1) = st_size;
  }
  uint64_t v8 = *(void *)((char *)&self->_md5Context.num + 1);
  if (v8 >= 1)
  {
    unint64_t v9 = *(unint64_t *)((char *)&self->_path + 1);
    if (v9)
    {
      off_t v10 = v9 / v8 * v8;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) = v10;
      if ((NSString *)v10 != *(NSString **)((char *)&self->_path + 1))
      {
        if (lseek(*(_DWORD *)((char *)&self->_bytesWritten + 1), v10, 0) == -1) {
          goto LABEL_23;
        }
        uint64_t v11 = *(unint64_t *)((char *)&self->_resumptionOffset + 1);
        uint64_t v12 = *(uint64_t *)((char *)&self->_path + 1) - v11;
        uint64_t v13 = v12 >= 0x4000 ? (NSString *)0x4000 : (NSString *)(*(char **)((char *)&self->_path + 1) - v11);
        uint64_t v14 = malloc_type_malloc((size_t)v13, 0x100004077774924uLL);
        if (!v14) {
          goto LABEL_23;
        }
        ssize_t v15 = v14;
        if (v12 < 1)
        {
          uint64_t i = 0;
        }
        else
        {
          for (uint64_t i = 0; i < v12; i += v18)
          {
            ssize_t v17 = read(*(_DWORD *)((char *)&self->_bytesWritten + 1), v15, (size_t)v13);
            if (!v17) {
              break;
            }
            ssize_t v18 = v17;
            if (!CC_MD5_Update((CC_MD5_CTX *)((char *)&self->_hashes + 1), v15, v17)) {
              break;
            }
          }
        }
        free(v15);
        if (i != v12) {
LABEL_23:
        }
          [(BLFilesystemDownloadDataConsumer *)self _truncateToSize:0];
      }
    }
  }
  return *(_DWORD *)((char *)&self->_bytesWritten + 1) != -1;
}

- (void)_truncateToSize:(int64_t)a3
{
  *(void *)(&self->super._overrideProgress + 1) = a3;
  BYTE5(self->_bytesWritten) = a3 > 0;
  *(NSString **)((char *)&self->_path + 1) = (NSString *)a3;
  *(unint64_t *)((char *)&self->_resumptionOffset + 1) = a3;
}

- (BOOL)hasConsumedData
{
  return BYTE5(self->_bytesWritten);
}

- (unint64_t)resumptionOffset
{
  return *(unint64_t *)((char *)&self->_path + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_numberOfBytesToHash + 1), 0);

  objc_storeStrong((id *)((char *)&self->_fd + 1), 0);
}

@end