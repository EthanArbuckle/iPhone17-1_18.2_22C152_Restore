@interface SYOutputStreamTransaction
- (BOOL)prepare:(id *)a3;
- (NSDictionary)metadata;
- (NSOutputStream)outputStream;
- (NSProgress)progress;
- (NSURL)fileURL;
- (SYOutputStreamTransaction)initWithMetadata:(id)a3;
- (id)finalizeOutput:(id *)a3;
- (int64_t)type;
- (void)dealloc;
@end

@implementation SYOutputStreamTransaction

- (SYOutputStreamTransaction)initWithMetadata:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYOutputStreamTransaction;
  v5 = [(SYOutputStreamTransaction *)&v12 init];
  if (v5
    && (uint64_t v6 = [v4 copy],
        metadata = v5->_metadata,
        v5->_metadata = (NSDictionary *)v6,
        metadata,
        stream = v5->_stream,
        v5->_stream = 0,
        stream,
        v5->_stream))
  {
    fileURL = v5->_fileURL;
    v5->_fileURL = 0;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  v5 = a2;
  uint64_t v6 = _SYObfuscate(a3);
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_ERROR, "SYOutputStreamTransaction failed to clean up a temporary file at URL %@: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (int64_t)type
{
  return 1;
}

- (BOOL)prepare:(id *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __37__SYOutputStreamTransaction_prepare___block_invoke;
  v20 = &unk_264423FC0;
  uint64_t v6 = v5;
  v21 = v6;
  [(SYStreamEventHandlerBlocks *)self->_stream setOnOpenComplete:&v17];
  int v7 = [(SYStreamEventHandlerBlocks *)self->_stream onOpenComplete];
  [(SYStreamEventHandlerBlocks *)self->_stream setOnError:v7];

  [(SYStreamEventHandlerBlocks *)self->_stream open];
  dispatch_time_t v8 = dispatch_walltime(0, 30000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    [(SYStreamEventHandlerBlocks *)self->_stream close];
    if (a3)
    {
      id v9 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v10 = *MEMORY[0x263F08570];
      fileURL = self->_fileURL;
      uint64_t v22 = *MEMORY[0x263F08578];
      v23[0] = fileURL;
      objc_super v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      *a3 = (id)[v9 initWithDomain:v10 code:-1001 userInfo:v12];
    }
  }
  uint64_t v13 = [(SYStreamEventHandlerBlocks *)self->_stream streamStatus];
  if (v13 == 7)
  {
    if (a3)
    {
      *a3 = [(SYStreamEventHandlerBlocks *)self->_stream streamError];
    }
  }
  else
  {
    v14 = (NSProgress *)[objc_alloc(MEMORY[0x263F08AB8]) initWithParent:0 userInfo:0];
    progress = self->_progress;
    self->_progress = v14;

    [(NSProgress *)self->_progress setTotalUnitCount:1000];
  }

  return v13 != 7;
}

intptr_t __37__SYOutputStreamTransaction_prepare___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)finalizeOutput:(id *)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SYStreamEventHandlerBlocks *)self->_stream streamStatus];
  if (v5 != 6)
  {
    if (v5 == 7)
    {
      if (a3)
      {
        [(SYStreamEventHandlerBlocks *)self->_stream streamError];
        uint64_t v6 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = 0;
      }
      goto LABEL_9;
    }
    [(SYStreamEventHandlerBlocks *)self->_stream close];
  }
  int v7 = objc_opt_new();
  objc_msgSend(v7, "setDecompressedFileSize:", -[SYStreamEventHandlerBlocks bytesThroughput](self->_stream, "bytesThroughput"));
  if (_MakeFileTransferAnchor_onceToken != -1) {
    dispatch_once(&_MakeFileTransferAnchor_onceToken, &__block_literal_global_12);
  }
  dispatch_time_t v8 = (void *)_MakeFileTransferAnchor___formatter;
  id v9 = objc_opt_new();
  uint64_t v10 = [v8 stringFromDate:v9];

  [v7 setEndAnchor:v10];
  uint64_t v6 = objc_opt_new();
  [v6 setFileURL:self->_fileURL];
  [v6 setMetadata:self->_metadata];
  [v6 setPbHeaderInfo:v7];
  uint64_t v11 = *MEMORY[0x263F49EC8];
  v14[0] = *MEMORY[0x263F49ED0];
  v14[1] = v11;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA80];
  objc_super v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v6 setExtraIDSOptions:v12];

LABEL_9:
  return v6;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)self->_stream;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end