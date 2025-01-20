@interface BRKAccelerationFileWriter
- (void)_lock_close;
- (void)_lock_openWithDataCount:(unint64_t)a3;
- (void)_lock_writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6;
- (void)close;
- (void)openWithDataCount:(unint64_t)a3;
- (void)writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6;
@end

@implementation BRKAccelerationFileWriter

- (void)writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__BRKAccelerationFileWriter_writeX_y_z_timestamp___block_invoke;
  v6[3] = &unk_264BF6F38;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  *(double *)&v6[6] = a4;
  *(double *)&v6[7] = a5;
  *(double *)&v6[8] = a6;
  [(BRKWriter *)self performWithLock:v6];
}

uint64_t __50__BRKAccelerationFileWriter_writeX_y_z_timestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_writeX:y:z:timestamp:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_lock_writeX:(double)a3 y:(double)a4 z:(double)a5 timestamp:(double)a6
{
  v6[4] = *MEMORY[0x263EF8340];
  *(double *)v6 = a6;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  [(NSOutputStream *)self->_outputStream write:v6 maxLength:32];
}

- (void)openWithDataCount:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__BRKAccelerationFileWriter_openWithDataCount___block_invoke;
  v3[3] = &unk_264BF6F60;
  v3[4] = self;
  v3[5] = a3;
  [(BRKWriter *)self performWithLock:v3];
}

uint64_t __47__BRKAccelerationFileWriter_openWithDataCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_openWithDataCount:", *(void *)(a1 + 40));
}

- (void)_lock_openWithDataCount:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x263EFF9E0]);
  v6 = [(BRKWriter *)self path];
  v7 = (NSOutputStream *)[v5 initToFileAtPath:v6 append:0];
  outputStream = self->_outputStream;
  self->_outputStream = v7;

  [(NSOutputStream *)self->_outputStream open];
  unint64_t v12 = a3;
  v9 = [MEMORY[0x263EFF8F8] dataWithBytes:&v12 length:8];
  v10 = self->_outputStream;
  id v11 = v9;
  -[NSOutputStream write:maxLength:](v10, "write:maxLength:", [v11 bytes], objc_msgSend(v11, "length"));
}

- (void)close
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__BRKAccelerationFileWriter_close__block_invoke;
  v2[3] = &unk_264BF6EF0;
  v2[4] = self;
  [(BRKWriter *)self performWithLock:v2];
}

uint64_t __34__BRKAccelerationFileWriter_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_close");
}

- (void)_lock_close
{
  [(NSOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  self->_outputStream = 0;
}

- (void).cxx_destruct
{
}

@end