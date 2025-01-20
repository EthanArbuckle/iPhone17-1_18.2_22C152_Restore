@interface DEDecompressWriter
- (BOOL)streamEnded;
- (BOOL)streamInitialized;
- (DEDecompressWriter)init;
- (DEDecompressWriter)initWithWriter:(id)a3;
- (DEWriter)writer;
- (id)decompress:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setStream:(z_stream_s *)a3;
- (void)setStreamEnded:(BOOL)a3;
- (void)setStreamInitialized:(BOOL)a3;
- (void)setWriter:(id)a3;
- (void)writeData:(id)a3;
- (z_stream_s)stream;
@end

@implementation DEDecompressWriter

- (void).cxx_destruct
{
}

- (void)setStreamEnded:(BOOL)a3
{
  self->_streamEnded = a3;
}

- (BOOL)streamEnded
{
  return self->_streamEnded;
}

- (void)setStreamInitialized:(BOOL)a3
{
  self->_streamInitialized = a3;
}

- (BOOL)streamInitialized
{
  return self->_streamInitialized;
}

- (void)setStream:(z_stream_s *)a3
{
  long long v3 = *(_OWORD *)&a3->next_in;
  long long v4 = *(_OWORD *)&a3->total_in;
  *(_OWORD *)&self->_stream.avail_out = *(_OWORD *)&a3->avail_out;
  *(_OWORD *)&self->_stream.total_in = v4;
  *(_OWORD *)&self->_stream.next_in = v3;
  long long v5 = *(_OWORD *)&a3->msg;
  long long v6 = *(_OWORD *)&a3->zalloc;
  long long v7 = *(_OWORD *)&a3->opaque;
  *(_OWORD *)&self->_stream.adler = *(_OWORD *)&a3->adler;
  *(_OWORD *)&self->_stream.opaque = v7;
  *(_OWORD *)&self->_stream.zalloc = v6;
  *(_OWORD *)&self->_stream.msg = v5;
}

- (z_stream_s)stream
{
  long long v3 = *(_OWORD *)&self->zfree;
  long long v4 = *(_OWORD *)&self->reserved;
  *(_OWORD *)&retstr->zalloc = *(_OWORD *)&self->data_type;
  *(_OWORD *)&retstr->opaque = v4;
  *(_OWORD *)&retstr->adler = *(_OWORD *)&self[1].avail_in;
  long long v5 = *(_OWORD *)&self->total_out;
  *(_OWORD *)&retstr->next_in = *(_OWORD *)&self->next_out;
  *(_OWORD *)&retstr->total_in = v5;
  *(_OWORD *)&retstr->avail_out = *(_OWORD *)&self->state;
  *(_OWORD *)&retstr->msg = v3;
  return self;
}

- (void)setWriter:(id)a3
{
}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)writeData:(id)a3
{
  writer = self->_writer;
  id v4 = [(DEDecompressWriter *)self decompress:a3];
  -[DEWriter writeData:](writer, "writeData:");
}

- (void)close
{
  writer = self->_writer;
  if (writer)
  {
    [(DEWriter *)writer close];
    id v4 = self->_writer;
    self->_writer = 0;
  }
}

- (id)decompress:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4 && [v4 length])
  {
    if (self->_streamEnded && [v5 length])
    {
      +[DELog error:@"Attempt to write after stream end"];
      id v6 = 0;
    }
    else
    {
      long long v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v5, "length"));
      if (+[DECompressUtil advanceZStream:&self->_stream function:MEMORY[0x1E4FBA9E0] input:v5 output:v7 flush:0 streamEnded:&self->_streamEnded])
      {
        id v6 = v7;
      }
      else
      {
        +[DELog error:@"Failed to advance compress z_stream!"];
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (void)dealloc
{
  writer = self->_writer;
  if (writer)
  {
    [(DEWriter *)writer close];
    id v4 = self->_writer;
    self->_writer = 0;
  }
  if (self->_streamInitialized)
  {
    if (inflateEnd(&self->_stream)) {
      +[DELog error:@"Failed to deallocate deflate stream"];
    }
    self->_streamInitialized = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DEDecompressWriter;
  [(DEDecompressWriter *)&v5 dealloc];
}

- (DEDecompressWriter)init
{
  return [(DEDecompressWriter *)self initWithWriter:0];
}

- (DEDecompressWriter)initWithWriter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDecompressWriter;
  id v6 = [(DEDecompressWriter *)&v9 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_writer, a3);
    *(_WORD *)&v7->_streamInitialized = 0;
    +[DECompressUtil initZStream:&v7->_stream];
    if (inflateInit2_(&v7->_stream, 47, "1.2.12", 112))
    {

      long long v7 = 0;
    }
    else
    {
      v7->_streamInitialized = 1;
    }
  }

  return v7;
}

@end