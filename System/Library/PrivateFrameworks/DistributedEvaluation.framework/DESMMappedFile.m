@interface DESMMappedFile
- (DESMMappedFile)initWithURL:(id)a3;
- (NSData)data;
- (NSURL)fileURL;
- (int)_munmap:(void *)a3 len:(unint64_t)a4;
- (void)_mmap:(void *)a3 len:(unint64_t)a4 protectionFlags:(int)a5 sharenFlags:(int)a6 filedHandle:(int)a7 offset:(int64_t)a8;
- (void)dealloc;
@end

@implementation DESMMappedFile

- (DESMMappedFile)initWithURL:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DESMMappedFile;
  v5 = [(DESMMappedFile *)&v19 init];
  if (!v5) {
    goto LABEL_17;
  }
  id v6 = v4;
  uint64_t v7 = open((const char *)[v6 fileSystemRepresentation], 0);
  if (v7 == -1)
  {
    v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DESMMappedFile initWithURL:]();
    }

    goto LABEL_17;
  }
  uint64_t v8 = v7;
  memset(&v18, 0, sizeof(v18));
  if (fstat(v7, &v18) == -1)
  {
    v16 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DESMMappedFile initWithURL:]();
    }
    goto LABEL_16;
  }
  if ((v18.st_mode & 0xF000) != 0x8000)
  {
    v16 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DESMMappedFile initWithURL:].cold.4((uint64_t)v6, v16);
    }
    goto LABEL_16;
  }
  off_t st_size = v18.st_size;
  uint64_t v10 = [(DESMMappedFile *)v5 _mmap:0 len:v18.st_size protectionFlags:1 sharenFlags:2 filedHandle:v8 offset:0];
  if (v10 == -1)
  {
    v16 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DESMMappedFile initWithURL:]();
    }
LABEL_16:

    close(v8);
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  close(v8);
  uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:st_size freeWhenDone:0];
  data = v5->_data;
  v5->_data = (NSData *)v12;

  objc_storeStrong((id *)&v5->_fileURL, v6);
  v14 = v5;
LABEL_18:

  return v14;
}

- (void)_mmap:(void *)a3 len:(unint64_t)a4 protectionFlags:(int)a5 sharenFlags:(int)a6 filedHandle:(int)a7 offset:(int64_t)a8
{
  return mmap(a3, a4, a5, a6, a7, a8);
}

- (int)_munmap:(void *)a3 len:(unint64_t)a4
{
  return munmap(a3, a4);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = __error();
  v3 = strerror(*v2);
  int v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_1BECCB000, a1, OS_LOG_TYPE_ERROR, "Fail to munmap with error=%s", (uint8_t *)&v4, 0xCu);
}

- (NSData)data
{
  return self->_data;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithURL:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v1, v2, "Fail to open file=%@ with error=%s", v3, v4, v5, v6, v7);
}

- (void)initWithURL:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v1, v2, "Fail to read file statistics of file=%@ with error=%s", v3, v4, v5, v6, v7);
}

- (void)initWithURL:.cold.3()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v1, v2, "Fail to mmap file=%@ with error=%s", v3, v4, v5, v6, v7);
}

- (void)initWithURL:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "%@u is not reguar file", (uint8_t *)&v2, 0xCu);
}

@end