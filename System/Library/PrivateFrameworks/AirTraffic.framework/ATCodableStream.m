@interface ATCodableStream
+ (BOOL)supportsSecureCoding;
- (ATCodableStream)init;
- (ATCodableStream)initWithCoder:(id)a3;
- (ATCodableStream)initWithInputStream:(id)a3;
- (NSFileHandle)fileHandleForReading;
- (NSInputStream)inputStream;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATCodableStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATCodableStream)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATCodableStream *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileHandleForReading"];
    v7 = (void *)[objc_alloc(MEMORY[0x263F54F40]) initWithQueue:0];
    [v7 start];
    uint64_t v8 = [v7 inputStream];
    inputStream = v5->_inputStream;
    v5->_inputStream = (NSInputStream *)v8;

    objc_storeStrong((id *)&v5->_writer, v7);
    int v10 = dup([v6 fileDescriptor]);
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF83E8], v10, 0, (dispatch_queue_t)v5->_queue);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __33__ATCodableStream_initWithCoder___block_invoke;
    handler[3] = &unk_264281060;
    int v20 = v10;
    id v18 = v7;
    dispatch_source_t v19 = v11;
    v12 = v11;
    id v13 = v7;
    dispatch_source_set_event_handler(v12, handler);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __33__ATCodableStream_initWithCoder___block_invoke_2;
    v15[3] = &__block_descriptor_36_e5_v8__0l;
    int v16 = v10;
    dispatch_source_set_cancel_handler(v12, v15);
    dispatch_resume(v12);
  }
  return v5;
}

void __33__ATCodableStream_initWithCoder___block_invoke(uint64_t a1)
{
  size_t v2 = NSPageSize();
  v3 = malloc_type_malloc(v2, 0x740AC6D8uLL);
  ssize_t v4 = read(*(_DWORD *)(a1 + 48), v3, v2);
  if (v4)
  {
    id v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v3 length:v4 freeWhenDone:1];
    [*(id *)(a1 + 32) writeAllData:v6 error:0];
  }
  else
  {
    [*(id *)(a1 + 32) stop];
    free(v3);
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    v5 = *(NSObject **)(a1 + 40);
    dispatch_source_set_event_handler(v5, 0);
  }
}

uint64_t __33__ATCodableStream_initWithCoder___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  [(NSFileHandle *)self->_fileHandleForReading closeFile];
  v3.receiver = self;
  v3.super_class = (Class)ATCodableStream;
  [(ATCodableStream *)&v3 dealloc];
}

- (ATCodableStream)initWithInputStream:(id)a3
{
  id v6 = a3;
  v7 = [(ATCodableStream *)self init];
  if (v7)
  {
    if (!v6)
    {
      int v20 = [MEMORY[0x263F08690] currentHandler];
      [v20 handleFailureInMethod:a2 object:v7 file:@"ATCodableStream.m" lineNumber:37 description:@"inputStream cannot be nil"];
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F54F38]) initWithInputStream:v6 queue:0];
    [v8 setMaximumBufferSize:NSPageSize()];
    reader = v7->_reader;
    v7->_reader = (MSVStreamReader *)v8;
    id v10 = v8;

    objc_storeStrong((id *)&v7->_inputStream, a3);
    dispatch_source_t v11 = [MEMORY[0x263F08A80] pipe];
    v12 = [v11 fileHandleForWriting];
    uint64_t v13 = [v11 fileHandleForReading];
    fileHandleForReading = v7->_fileHandleForReading;
    v7->_fileHandleForReading = (NSFileHandle *)v13;

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __39__ATCodableStream_initWithInputStream___block_invoke;
    v27[3] = &unk_264281010;
    id v15 = v12;
    id v28 = v15;
    [v10 setDidReadDataBlock:v27];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __39__ATCodableStream_initWithInputStream___block_invoke_2;
    v24[3] = &unk_2642813C8;
    id v16 = v15;
    id v25 = v16;
    v17 = v7;
    v26 = v17;
    [v10 setDidFinishReadingBlock:v24];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __39__ATCodableStream_initWithInputStream___block_invoke_3;
    v21[3] = &unk_264281038;
    id v22 = v16;
    v23 = v17;
    id v18 = v16;
    [v10 setDidEncounterErrorBlock:v21];
    [v10 start];
  }
  return v7;
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeData:a2];
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  [*(id *)(*(void *)(a1 + 40) + 8) setDidReadDataBlock:0];
  [*(id *)(*(void *)(a1 + 40) + 8) setDidEncounterErrorBlock:0];
  size_t v2 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v2 setDidFinishReadingBlock:0];
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  [*(id *)(*(void *)(a1 + 40) + 8) setDidReadDataBlock:0];
  [*(id *)(*(void *)(a1 + 40) + 8) setDidFinishReadingBlock:0];
  size_t v2 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v2 setDidEncounterErrorBlock:0];
}

- (ATCodableStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATCodableStream;
  size_t v2 = [(ATCodableStream *)&v8 init];
  if (v2)
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end