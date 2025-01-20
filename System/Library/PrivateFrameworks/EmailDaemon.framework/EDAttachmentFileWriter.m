@interface EDAttachmentFileWriter
- (BOOL)updateDigestWithData:(BOOL)result;
- (EDAttachmentFileWriter)initWithFinalURL:(id)a3 queue:(id)a4 compressionQueue:(id)a5 completion:(id)a6;
- (EDAttachmentFileWriter)initWithTemporaryURL:(id)a3 finalURL:(id)a4 protection:(int)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8;
- (char)finalizedDigest;
- (dispatch_io_t)makeTemporaryFileIOForFile:(int)a3 protection:(void *)a4 callbackQueue:;
- (void)close;
- (void)closeTemporaryFile;
- (void)dealloc;
- (void)failAndClose;
- (void)ioDidRelinquishControlWithError:(uint64_t)a1;
- (void)makePurgeable;
- (void)moveTemporaryFileIntoPlace;
- (void)writeData:(id)a3;
@end

@implementation EDAttachmentFileWriter

- (EDAttachmentFileWriter)initWithFinalURL:(id)a3 queue:(id)a4 compressionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 URLByAppendingPathExtension:@"download"];
  v15 = [(EDAttachmentFileWriter *)self initWithTemporaryURL:v14 finalURL:v10 protection:2 queue:v11 compressionQueue:v12 completion:v13];

  return v15;
}

- (EDAttachmentFileWriter)initWithTemporaryURL:(id)a3 finalURL:(id)a4 protection:(int)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v28 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)EDAttachmentFileWriter;
  v18 = [(EDAttachmentFileWriter *)&v30 init];
  p_super = &v18->super;
  if (v18)
  {
    if (CC_SHA256_Init(&v18->_digestContext) != 1
      || (objc_storeStrong((id *)&p_super[15].isa, a3),
          objc_storeStrong((id *)&p_super[16].isa, a4),
          objc_storeStrong((id *)&p_super[19].isa, a6),
          objc_storeStrong((id *)&p_super[20].isa, a7),
          -[EDAttachmentFileWriter makeTemporaryFileIOForFile:protection:callbackQueue:](p_super, v29, a5, v15),
          (v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&p_super[18].isa, v20);
    uint64_t v21 = objc_msgSend(v17, "copy", v28);
    Class isa = p_super[21].isa;
    p_super[21].Class isa = (Class)v21;

    v23 = EDAttachmentsLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = p_super[15].isa;
      v25 = [(objc_class *)v24 path];
      *(_DWORD *)buf = 134218242;
      v32 = p_super;
      __int16 v33 = 2114;
      v34 = v25;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Did create EDAttachmentFileWriter %p for MIME part file \"%{public}@\".", buf, 0x16u);
    }
  }
  v26 = p_super;
LABEL_9:

  return v26;
}

- (dispatch_io_t)makeTemporaryFileIOForFile:(int)a3 protection:(void *)a4 callbackQueue:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = a4;
  if (a1)
  {
    char v9 = 0;
    HIDWORD(a1[14].isa) = -1;
    while (1)
    {
      id v10 = v7;
      dispatch_fd_t v11 = open_dprotected_np((const char *)[v10 fileSystemRepresentation], 2818, a3, 0, 384);
      if ((v11 & 0x80000000) == 0)
      {
        HIDWORD(a1[14].isa) = v11;
        cleanup_handler[0] = MEMORY[0x1E4F143A8];
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __78__EDAttachmentFileWriter_makeTemporaryFileIOForFile_protection_callbackQueue___block_invoke;
        cleanup_handler[3] = &unk_1E6BFF2C8;
        cleanup_handler[4] = a1;
        a1 = dispatch_io_create(0, v11, v8, cleanup_handler);
        goto LABEL_10;
      }
      if (v9) {
        break;
      }
      unlink((const char *)[v10 fileSystemRepresentation]);
      char v9 = 1;
    }
    id v12 = EDAttachmentsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v10 path];
      int v15 = *__error();
      *(_DWORD *)buf = 134218498;
      dispatch_io_t v18 = a1;
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 1024;
      int v22 = v15;
      _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "<%p> Failed to create temporary MIME part file \"%{public}@\": %{errno}d", buf, 0x1Cu);
    }
    a1 = 0;
  }
LABEL_10:

  return a1;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v3 = self->_tempURL;
    if (v3)
    {
      v4 = v3;
      v5 = self->_io;
      if (v5)
      {
        unsigned __int8 v6 = atomic_exchange(&self->_didClose._Value, 1u);

        if ((v6 & 1) == 0)
        {
          id v7 = EDAttachmentsLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            v8 = self->_tempURL;
            char v9 = [(NSURL *)v8 path];
            *(_DWORD *)buf = 134218242;
            id v12 = self;
            __int16 v13 = 2114;
            v14 = v9;
            _os_log_error_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_ERROR, "Deallocating EDAttachmentFileWriter %p while temporary MIME part file \"%{public}@\" is still open.", buf, 0x16u);
          }
          dispatch_io_close((dispatch_io_t)self->_io, 1uLL);
        }
      }
      else
      {
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EDAttachmentFileWriter;
  [(EDAttachmentFileWriter *)&v10 dealloc];
}

- (void)writeData:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (self) {
    self->_byteCount += dispatch_data_get_size(v4);
  }
  if (dispatch_data_get_size(v5))
  {
    -[EDAttachmentFileWriter updateDigestWithData:]((BOOL)self, v5);
    if (self)
    {
      unsigned __int8 v6 = self->_io;
      queue = self->_queue;
    }
    else
    {
      unsigned __int8 v6 = 0;
      queue = 0;
    }
    io_handler[0] = MEMORY[0x1E4F143A8];
    io_handler[1] = 3221225472;
    io_handler[2] = __36__EDAttachmentFileWriter_writeData___block_invoke;
    io_handler[3] = &unk_1E6BFF278;
    io_handler[4] = self;
    dispatch_io_write((dispatch_io_t)v6, 0, v5, queue, io_handler);
  }
}

- (BOOL)updateDigestWithData:(BOOL)result
{
  if (result)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __47__EDAttachmentFileWriter_updateDigestWithData___block_invoke;
    applier[3] = &unk_1E6BFF2A0;
    applier[4] = result;
    return dispatch_data_apply(data, applier);
  }
  return result;
}

void __36__EDAttachmentFileWriter_writeData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __36__EDAttachmentFileWriter_writeData___block_invoke_cold_1(a1);
    }
  }
}

uint64_t __47__EDAttachmentFileWriter_updateDigestWithData___block_invoke(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  return 1;
}

- (void)close
{
}

- (void)failAndClose
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_didFail._Value, 1u) & 1) == 0 && (atomic_exchange(&self->_didClose._Value, 1u) & 1) == 0)
  {
    v3 = EDAttachmentsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      unsigned __int8 v6 = self;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "<%p> Fail and close temporary MIME part file.", (uint8_t *)&v5, 0xCu);
    }

    if (self) {
      io = self->_io;
    }
    else {
      io = 0;
    }
    dispatch_io_close(io, 1uLL);
  }
}

void __78__EDAttachmentFileWriter_makeTemporaryFileIOForFile_protection_callbackQueue___block_invoke(uint64_t a1, int a2)
{
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 152));
    if (a2)
    {
      v4 = EDAttachmentsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentFileWriter ioDidRelinquishControlWithError:](a1, v4, v5, v6, v7, v8, v9, v10);
      }

      -[EDAttachmentFileWriter closeTemporaryFile](a1);
      if (*(void *)(a1 + 168))
      {
        dispatch_fd_t v11 = *(void (**)(void))(*(void *)(a1 + 168) + 16);
LABEL_15:
        v11();
      }
    }
    else if (atomic_exchange((atomic_uchar *volatile)(a1 + 9), 1u))
    {
      id v12 = EDAttachmentsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EDAttachmentFileWriter ioDidRelinquishControlWithError:](a1, v12, v13, v14, v15, v16, v17, v18);
      }

      -[EDAttachmentFileWriter closeTemporaryFile](a1);
      if (*(void *)(a1 + 168))
      {
        dispatch_fd_t v11 = *(void (**)(void))(*(void *)(a1 + 168) + 16);
        goto LABEL_15;
      }
    }
    else
    {
      -[EDAttachmentFileWriter makePurgeable](a1);
    }
  }
}

- (void)closeTemporaryFile
{
  int v4 = *a2;
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "<%p> Failed to close temporary MIME part file: %{errno}d", buf, 0x12u);
}

- (void)makePurgeable
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB39C000, v1, v2, "<%p> Failed to mark file as purgeable: %{errno}d.", (void)v3, DWORD2(v3));
}

- (void)moveTemporaryFileIntoPlace
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB39C000, v1, v2, "<%p> Failed to move temporary MIME part file into place: %{errno}d", (void)v3, DWORD2(v3));
}

- (char)finalizedDigest
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    if (CC_SHA256_Final((unsigned __int8 *)[v2 mutableBytes], (CC_SHA256_CTX *)(v1 + 12)) == 1) {
      uint64_t v1 = (char *)v2;
    }
    else {
      uint64_t v1 = 0;
    }
  }

  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_compressionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_finalURL, 0);

  objc_storeStrong((id *)&self->_tempURL, 0);
}

void __36__EDAttachmentFileWriter_writeData___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DB39C000, v1, v2, "<%p> Failed to write data to temporary MIME part file.: %{errno}d", (void)v3, DWORD2(v3));
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end