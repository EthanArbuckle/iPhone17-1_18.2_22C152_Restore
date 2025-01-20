@interface ATFileBufferedPipe
+ (id)pipe;
- (ATFileBufferedPipe)init;
- (NSFileHandle)fileHandleForReading;
- (NSFileHandle)fileHandleForWriting;
- (id)_bufferedWrite:(id)a3;
- (void)_inputReadyForReading:(unint64_t)a3;
- (void)_outputReadyForWriting:(unint64_t)a3;
@end

@implementation ATFileBufferedPipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForWriting, 0);
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_outputPipe, 0);
  objc_storeStrong((id *)&self->_inputPipe, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (NSFileHandle)fileHandleForWriting
{
  return self->_fileHandleForWriting;
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (id)_bufferedWrite:(id)a3
{
  v4 = [MEMORY[0x263EFF990] dataWithData:a3];
  while (self->_readyForData && [v4 length])
  {
    v5 = [(NSPipe *)self->_outputPipe fileHandleForWriting];
    int v6 = [v5 fileDescriptor];
    id v7 = v4;
    ssize_t v8 = write(v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"));

    if (v8 < 1)
    {
      if (*__error() == 35)
      {
        self->_readyForData = 0;
        break;
      }
    }
    else
    {
      objc_msgSend(v7, "replaceBytesInRange:withBytes:length:", 0, v8, 0, 0);
    }
  }
  return v4;
}

- (void)_inputReadyForReading:(unint64_t)a3
{
  if (a3)
  {
    v5 = [(NSPipe *)self->_inputPipe fileHandleForReading];
    id v7 = [v5 readDataOfLength:a3];

    if (self->_readyForData)
    {
      int v6 = [(ATFileBufferedPipe *)self _bufferedWrite:v7];
      [(ATFileBuffer *)self->_buffer appendData:v6];
    }
    else
    {
      [(ATFileBuffer *)self->_buffer appendData:v7];
    }
  }
  else
  {
    dispatch_source_cancel((dispatch_source_t)self->_readSource);
    if ([(ATFileBuffer *)self->_buffer length])
    {
      self->_readyToClose = 1;
      return;
    }
    id v7 = [(NSPipe *)self->_outputPipe fileHandleForWriting];
    [v7 closeFile];
  }
}

- (void)_outputReadyForWriting:(unint64_t)a3
{
  if (!a3) {
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  }
  self->_readyForData = 1;
  if ([(ATFileBuffer *)self->_buffer length])
  {
    id v6 = [(ATFileBuffer *)self->_buffer readDataOfLength:a3];
    v5 = -[ATFileBufferedPipe _bufferedWrite:](self, "_bufferedWrite:");
    [(ATFileBuffer *)self->_buffer rewindData:v5];
  }
  else
  {
    if (!self->_readyToClose) {
      return;
    }
    id v6 = [(NSPipe *)self->_outputPipe fileHandleForWriting];
    [v6 closeFile];
  }
}

- (ATFileBufferedPipe)init
{
  v38.receiver = self;
  v38.super_class = (Class)ATFileBufferedPipe;
  id v2 = [(ATFileBufferedPipe *)&v38 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    id v7 = objc_alloc_init(ATFileBuffer);
    ssize_t v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    uint64_t v9 = [MEMORY[0x263F08A80] pipe];
    v10 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v9;

    uint64_t v11 = [MEMORY[0x263F08A80] pipe];
    v12 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v11;

    uint64_t v13 = [*((id *)v2 + 4) fileHandleForReading];
    v14 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v13;

    uint64_t v15 = [*((id *)v2 + 3) fileHandleForWriting];
    v16 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v15;

    v17 = [*((id *)v2 + 4) fileHandleForWriting];
    int v18 = [v17 fileDescriptor];

    int v19 = fcntl(v18, 3);
    fcntl(v18, 4, v19 | 4u);
    *((_WORD *)v2 + 28) = 0;
    objc_initWeak(&location, v2);
    v20 = [*((id *)v2 + 4) fileHandleForWriting];
    int v21 = [v20 fileDescriptor];
    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x263EF8418], v21, 0, *((dispatch_queue_t *)v2 + 2));

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __26__ATFileBufferedPipe_init__block_invoke;
    handler[3] = &unk_264280FE8;
    v23 = v22;
    v35 = v23;
    objc_copyWeak(&v36, &location);
    dispatch_source_set_event_handler(v23, handler);
    objc_storeStrong((id *)v2 + 5, v22);
    dispatch_resume(*((dispatch_object_t *)v2 + 5));
    v24 = [*((id *)v2 + 3) fileHandleForReading];
    int v25 = [v24 fileDescriptor];
    dispatch_source_t v26 = dispatch_source_create(MEMORY[0x263EF83E8], v25, 0, *((dispatch_queue_t *)v2 + 2));

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __26__ATFileBufferedPipe_init__block_invoke_2;
    v31[3] = &unk_264280FE8;
    v27 = v26;
    v32 = v27;
    objc_copyWeak(&v33, &location);
    dispatch_source_set_event_handler(v27, v31);
    v28 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v27;
    v29 = v27;

    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return (ATFileBufferedPipe *)v2;
}

void __26__ATFileBufferedPipe_init__block_invoke(uint64_t a1)
{
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _outputReadyForWriting:data];
}

void __26__ATFileBufferedPipe_init__block_invoke_2(uint64_t a1)
{
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _inputReadyForReading:data];
}

+ (id)pipe
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

@end