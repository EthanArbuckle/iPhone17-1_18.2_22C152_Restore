@interface BRKLogFileWriter
- (void)_lock_close;
- (void)_lock_writeJSON:(id)a3;
- (void)close;
- (void)writeJSON:(id)a3;
@end

@implementation BRKLogFileWriter

- (void)writeJSON:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__BRKLogFileWriter_writeJSON___block_invoke;
  v6[3] = &unk_264BF6FD8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRKWriter *)self performWithLock:v6];
}

uint64_t __30__BRKLogFileWriter_writeJSON___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_writeJSON:", *(void *)(a1 + 40));
}

- (void)_lock_writeJSON:(id)a3
{
  id v4 = a3;
  json = self->_json;
  id v8 = v4;
  if (!json)
  {
    v6 = [MEMORY[0x263EFF980] array];
    id v7 = self->_json;
    self->_json = v6;

    id v4 = v8;
    json = self->_json;
  }
  [(NSMutableArray *)json addObject:v4];
}

- (void)close
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __25__BRKLogFileWriter_close__block_invoke;
  v2[3] = &unk_264BF6EF0;
  v2[4] = self;
  [(BRKWriter *)self performWithLock:v2];
}

uint64_t __25__BRKLogFileWriter_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_close");
}

- (void)_lock_close
{
  json = self->_json;
  if (json)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x263F08900] dataWithJSONObject:json options:4 error:&v8];
    id v5 = v8;
    v6 = [(BRKWriter *)self path];
    [v4 writeToFile:v6 atomically:1];

    id v7 = self->_json;
    self->_json = 0;
  }
}

- (void).cxx_destruct
{
}

@end