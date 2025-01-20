@interface DECompressWriter
+ (BOOL)isCompressed:(id)a3;
- (BOOL)compressed;
- (BOOL)streamEnded;
- (BOOL)streamInitialized;
- (DECompressWriter)init;
- (DECompressWriter)initWithWriter:(id)a3;
- (DEWriter)writer;
- (id)compress:(id)a3 finalize:(BOOL)a4;
- (void)close;
- (void)dealloc;
- (void)setCompressed:(BOOL)a3;
- (void)setStream:(z_stream_s *)a3;
- (void)setStreamEnded:(BOOL)a3;
- (void)setStreamInitialized:(BOOL)a3;
- (void)setWriter:(id)a3;
- (void)writeData:(id)a3;
- (z_stream_s)stream;
@end

@implementation DECompressWriter

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

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)writeData:(id)a3
{
  writer = self->_writer;
  id v4 = [(DECompressWriter *)self compress:a3 finalize:0];
  -[DEWriter writeData:](writer, "writeData:");
}

- (void)close
{
  if (!self->_streamEnded)
  {
    writer = self->_writer;
    id v4 = [(DECompressWriter *)self compress:0 finalize:1];
    [(DEWriter *)writer writeData:v4];
  }
  long long v5 = self->_writer;
  if (v5)
  {
    [(DEWriter *)v5 close];
    long long v6 = self->_writer;
    self->_writer = 0;
  }
}

- (id)compress:(id)a3 finalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (self->_compressed)
  {
    if (!self->_stream.total_in
      && (!v6
       || (unint64_t)[v6 length] < 2
       || +[DECompressWriter isCompressed:v7]))
    {
      if ((unint64_t)[v7 length] <= 1) {
        +[DELog error:@"Failed to supply enough initial input data to determine if input is already compressed; assuming it is"];
      }
      self->_compressed = 0;
      goto LABEL_18;
    }
    if (v4)
    {
      if (!v7) {
        id v7 = (id)objc_opt_new();
      }
      goto LABEL_14;
    }
    if (v7 && [v7 length])
    {
LABEL_14:
      if (self->_streamEnded && v7 && [v7 length])
      {
        +[DELog error:@"Attempt to write after stream end"];
        id v8 = 0;
      }
      else
      {
        v9 = [MEMORY[0x1E4F1CA58] dataWithLength:getpagesize()];
        if (v4) {
          uint64_t v10 = 4;
        }
        else {
          uint64_t v10 = 0;
        }
        if (+[DECompressUtil advanceZStream:&self->_stream function:MEMORY[0x1E4FBA9D8] input:v7 output:v9 flush:v10 streamEnded:&self->_streamEnded])
        {
          id v8 = v9;
        }
        else
        {
          +[DELog error:@"Failed to advance compress z_stream!"];
          id v8 = 0;
        }
      }
      goto LABEL_26;
    }
  }
LABEL_18:
  id v7 = v7;
  id v8 = v7;
LABEL_26:

  return v8;
}

- (void)dealloc
{
  writer = self->_writer;
  if (writer)
  {
    [(DEWriter *)writer close];
    BOOL v4 = self->_writer;
    self->_writer = 0;
  }
  if (self->_streamInitialized)
  {
    if (deflateEnd(&self->_stream)) {
      +[DELog error:@"Failed to deallocate deflate stream"];
    }
    self->_streamInitialized = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DECompressWriter;
  [(DECompressWriter *)&v5 dealloc];
}

- (DECompressWriter)init
{
  return [(DECompressWriter *)self initWithWriter:0];
}

- (DECompressWriter)initWithWriter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DECompressWriter;
  id v6 = [(DECompressWriter *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_compressed = 1;
    objc_storeStrong((id *)&v6->_writer, a3);
    *(_WORD *)&v7->_streamInitialized = 0;
    +[DECompressUtil initZStream:&v7->_stream];
    if (deflateInit2_(&v7->_stream, -1, 8, 31, 8, 0, "1.2.12", 112))
    {

      id v7 = 0;
    }
    else
    {
      v7->_streamInitialized = 1;
    }
  }

  return v7;
}

+ (BOOL)isCompressed:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  BOOL v6 = v3
    && (unint64_t)[v3 length] >= 2
    && (id v5 = v4, *(unsigned char *)[v5 bytes] == 31)
    && *(unsigned __int8 *)([v5 bytes] + 1) == 139;

  return v6;
}

@end