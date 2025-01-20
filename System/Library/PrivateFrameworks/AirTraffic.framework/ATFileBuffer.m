@interface ATFileBuffer
- (ATFileBuffer)init;
- (id)readDataOfLength:(unint64_t)a3;
- (unint64_t)length;
- (void)appendData:(id)a3;
- (void)rewind:(unint64_t)a3;
- (void)rewindData:(id)a3;
@end

@implementation ATFileBuffer

- (void).cxx_destruct
{
}

- (unint64_t)length
{
  return self->_length;
}

- (void)rewind:(unint64_t)a3
{
  unint64_t currentReadLocation = self->_currentReadLocation;
  BOOL v4 = currentReadLocation >= a3;
  unint64_t v5 = currentReadLocation - a3;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_unint64_t currentReadLocation = v5;
}

- (id)readDataOfLength:(unint64_t)a3
{
  [(NSFileHandle *)self->_bufferFileHandle seekToFileOffset:self->_currentReadLocation];
  unint64_t v5 = [(NSFileHandle *)self->_bufferFileHandle readDataOfLength:a3];
  self->_currentReadLocation += [v5 length];
  unint64_t v6 = self->_length - [v5 length];
  self->_length = v6;
  if (!v6)
  {
    [(NSFileHandle *)self->_bufferFileHandle truncateFileAtOffset:0];
    self->_unint64_t currentReadLocation = 0;
  }
  [(NSFileHandle *)self->_bufferFileHandle seekToEndOfFile];
  return v5;
}

- (void)rewindData:(id)a3
{
  if (self->_currentReadLocation)
  {
    self->_currentReadLocation -= [a3 length];
  }
  else
  {
    [(ATFileBuffer *)self appendData:a3];
  }
}

- (void)appendData:(id)a3
{
  bufferFileHandle = self->_bufferFileHandle;
  id v5 = a3;
  [(NSFileHandle *)bufferFileHandle writeData:v5];
  uint64_t v6 = [v5 length];

  self->_length += v6;
}

- (ATFileBuffer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATFileBuffer;
  v2 = [(ATFileBuffer *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08840]);
    BOOL v4 = tmpfile();
    uint64_t v5 = [v3 initWithFileDescriptor:fileno(v4) closeOnDealloc:1];
    bufferFileHandle = v2->_bufferFileHandle;
    v2->_bufferFileHandle = (NSFileHandle *)v5;
  }
  return v2;
}

@end