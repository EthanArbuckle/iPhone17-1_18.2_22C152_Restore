@interface GEOAnalyticsDataFile
- (BOOL)prepareFileWithFilePath:(id)a3 isForWrite:(BOOL)a4;
- (BOOL)unsafe_readAnalyticDataWithVisitorBlock:(id)a3;
- (BOOL)writeAnalyticData:(id)a3;
- (id)initForReadWithFileMagic:(unsigned int)a3 fileDescriptor:(int)a4;
- (id)initForReadWithFileMagic:(unsigned int)a3 filePath:(id)a4;
- (id)initForWriteWithFileMagic:(unsigned int)a3 filePath:(id)a4;
- (int)unlinkAndReturnOpenFileDescriptor;
- (void)close;
- (void)commonInitWithMagic:(unsigned int)a3;
- (void)dealloc;
@end

@implementation GEOAnalyticsDataFile

- (BOOL)writeAnalyticData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_forWrite || self->_fd < 0)
  {
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  v5 = GEOGetAnalyticDataFileLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    uint64_t v13 = [v4 length];
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "will write analytic data of size %llu", (uint8_t *)&v12, 0xCu);
  }

  self->_hdr.header_len = [v4 length];
  id v6 = v4;
  self->_iov[1].iov_base = (void *)[v6 bytes];
  self->_iov[1].iov_len = [v6 length];
  if (writev(self->_fd, self->_iov, 2) < 0)
  {
    v8 = GEOGetAnalyticDataFileLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      int v12 = 136315138;
      uint64_t v13 = (uint64_t)v10;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "failed to write analytic data (%s)", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)initForWriteWithFileMagic:(unsigned int)a3 filePath:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOAnalyticsDataFile;
  BOOL v7 = [(GEOAnalyticsDataFile *)&v11 init];
  v8 = v7;
  if (v7
    && ([(GEOAnalyticsDataFile *)v7 commonInitWithMagic:v4],
        ![(GEOAnalyticsDataFile *)v8 prepareFileWithFilePath:v6 isForWrite:1]))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)prepareFileWithFilePath:(id)a3 isForWrite:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = GEOGetAnalyticDataFileLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = @"read";
    if (v4) {
      v8 = @"write";
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "will open '%@' for %@", buf, 0x16u);
  }

  self->_forWrite = v4;
  id v9 = v6;
  v10 = (const char *)[v9 fileSystemRepresentation];
  if (v4) {
    int v11 = open(v10, 521, 384);
  }
  else {
    int v11 = open(v10, 0);
  }
  int v12 = v11;
  self->_int fd = v11;
  uint64_t v13 = GEOGetAnalyticDataFileLog();
  uint64_t v14 = v13;
  if (v12 < 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2080;
      v28 = v20;
      v16 = "could not open '%@' (%s)";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_188D96000, v17, v18, v16, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = @"write";
    if (!self->_forWrite) {
      v15 = @"read";
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v9;
    __int16 v27 = 2112;
    v28 = v15;
    v16 = "opened '%@' for %@";
    v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    goto LABEL_15;
  }

  v21 = (NSString *)[v9 copy];
  filePath = self->_filePath;
  self->_filePath = v21;

  int fd = self->_fd;
  return fd >= 0;
}

- (void)commonInitWithMagic:(unsigned int)a3
{
  self->_hdr.header_magic = a3;
  p_hdr = &self->_hdr;
  p_hdr[1] = ($5127856EA3D99C87C3BC970EB1F4D520)p_hdr;
  p_hdr[2] = ($5127856EA3D99C87C3BC970EB1F4D520)8;
}

- (void)close
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
}

- (void)dealloc
{
  [(GEOAnalyticsDataFile *)self close];
  v3.receiver = self;
  v3.super_class = (Class)GEOAnalyticsDataFile;
  [(GEOAnalyticsDataFile *)&v3 dealloc];
}

- (id)initForReadWithFileMagic:(unsigned int)a3 fileDescriptor:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOAnalyticsDataFile;
  id v6 = [(GEOAnalyticsDataFile *)&v10 init];
  if (v6)
  {
    BOOL v7 = GEOGetAnalyticDataFileLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "preparing for read from file descriptor", v9, 2u);
    }

    [(GEOAnalyticsDataFile *)v6 commonInitWithMagic:v5];
    v6->_int fd = a4;
    v6->_forWrite = 0;
  }
  return v6;
}

- (id)initForReadWithFileMagic:(unsigned int)a3 filePath:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOAnalyticsDataFile;
  BOOL v7 = [(GEOAnalyticsDataFile *)&v11 init];
  v8 = v7;
  if (v7
    && ([(GEOAnalyticsDataFile *)v7 commonInitWithMagic:v4],
        ![(GEOAnalyticsDataFile *)v8 prepareFileWithFilePath:v6 isForWrite:0]))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (BOOL)unsafe_readAnalyticDataWithVisitorBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  if (self->_forWrite
    || (int fd = self->_fd, fd < 0)
    || (memset(&v17, 0, sizeof(v17)), fstat(fd, &v17) < 0)
    || (unint64_t st_size = v17.st_size, lseek(self->_fd, 0, 0) < 0))
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v7 = malloc_type_malloc(0x400uLL, 0x2560AF5FuLL);
    size_t v16 = 0;
    if (st_size >= 8)
    {
      size_t v11 = 1024;
      while (read(self->_fd, &v16, 8uLL) == 8)
      {
        if (v16 != self->_hdr.header_magic) {
          break;
        }
        ssize_t v12 = HIDWORD(v16);
        unint64_t v8 = st_size - 8 - HIDWORD(v16);
        if (st_size - 8 < HIDWORD(v16)) {
          break;
        }
        if (v11 < HIDWORD(v16))
        {
          size_t v11 = (unint64_t)((double)HIDWORD(v16) * 1.2);
          uint64_t v13 = malloc_type_realloc(v7, v11, 0xEFBDF82uLL);
          if (!v13) {
            break;
          }
          BOOL v7 = v13;
        }
        if (read(self->_fd, v7, v12) < v12) {
          break;
        }
        uint64_t v14 = (void *)MEMORY[0x18C1203C0]();
        v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:v12 freeWhenDone:0];
        v4[2](v4, v15);

        unint64_t st_size = v8;
        if (v8 <= 7) {
          goto LABEL_7;
        }
      }
    }
    unint64_t v8 = st_size;
LABEL_7:
    BOOL v9 = v8 == 0;
    if (v7) {
      free(v7);
    }
  }

  return v9;
}

- (int)unlinkAndReturnOpenFileDescriptor
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_forWrite || self->_fd < 0) {
    return -1;
  }
  if (unlink([(NSString *)self->_filePath fileSystemRepresentation]) < 0)
  {
    objc_super v3 = GEOGetAnalyticDataFileLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      filePath = self->_filePath;
      uint64_t v5 = __error();
      id v6 = strerror(*v5);
      int v8 = 138412546;
      BOOL v9 = filePath;
      __int16 v10 = 2080;
      size_t v11 = v6;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "unlink of %@ failed (%s)", (uint8_t *)&v8, 0x16u);
    }
  }
  return dup(self->_fd);
}

- (void).cxx_destruct
{
}

@end