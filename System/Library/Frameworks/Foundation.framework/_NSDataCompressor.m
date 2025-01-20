@interface _NSDataCompressor
- (BOOL)finishProcessing;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5;
- (_NSDataCompressor)initWithAlgorithm:(int)a3 operation:(int)a4 dataHandler:(id)a5;
- (void)dealloc;
@end

@implementation _NSDataCompressor

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4
{
  return [(_NSDataCompressor *)self processBytes:a3 size:a4 flags:0];
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5
{
  int status = self->_status;
  if (status)
  {
    return !a4 && status == 1;
  }
  else
  {
    p_stream = &self->_stream;
    dst_ptr = self->_stream.dst_ptr;
    self->_stream.src_ptr = a3;
    self->_stream.src_size = a4;
    if (dst_ptr == (char *)&_NSDataCompressorEmptyBuffer)
    {
      self->_stream.dst_ptr = (char *)self->_buffer;
      self->_stream.dst_size = 1024;
    }
    int v12 = 0;
    buffer = self->_buffer;
    while (!v12)
    {
      if ((a5 & 1) == 0 && !self->_stream.src_size)
      {
        BOOL result = 1;
        goto LABEL_26;
      }
      int v12 = compression_stream_process((compression_stream *)p_stream, a5);
      self->_int status = v12;
      if (!v12 && !self->_stream.dst_size)
      {
        (*((void (**)(void))self->_dataHandler + 2))();
        self->_stream.dst_ptr = (char *)buffer;
        self->_stream.dst_size = 1024;
        int v12 = self->_status;
      }
    }
    if (v12 == 1)
    {
      (*((void (**)(void))self->_dataHandler + 2))();
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0;
      int v12 = self->_status;
    }
    else if (v12 == -1 && buffer != (unsigned __int8 *)&_NSDataCompressorEmptyBuffer)
    {
      BOOL result = 0;
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0;
      goto LABEL_26;
    }
    BOOL result = v12 != -1 && self->_stream.src_size == 0;
LABEL_26:
    self->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
    self->_stream.src_size = 0;
  }
  return result;
}

- (_NSDataCompressor)initWithAlgorithm:(int)a3 operation:(int)a4 dataHandler:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_NSDataCompressor;
  v8 = [(_NSDataCompressor *)&v11 init];
  v9 = (_NSDataCompressor *)v8;
  if (v8)
  {
    if (compression_stream_init((compression_stream *)(v8 + 8), (compression_stream_operation)a4, (compression_algorithm)a3))
    {

      return 0;
    }
    else
    {
      v9->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.dst_size = 0;
      v9->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.src_size = 0;
      v9->_operation = a4;
      v9->_int status = 0;
      v9->_dataHandler = (id)[a5 copy];
    }
  }
  return v9;
}

- (BOOL)finishProcessing
{
  return [(_NSDataCompressor *)self processBytes:&_NSDataCompressorEmptyBuffer size:0 flags:1];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  compression_stream_destroy((compression_stream *)&self->_stream);

  v3.receiver = self;
  v3.super_class = (Class)_NSDataCompressor;
  [(_NSDataCompressor *)&v3 dealloc];
}

@end