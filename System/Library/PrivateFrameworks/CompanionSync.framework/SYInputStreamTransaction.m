@interface SYInputStreamTransaction
- (NSDictionary)metadata;
- (NSInputStream)inputStream;
- (NSProgress)progress;
- (SYInputStreamTransaction)initWithURL:(id)a3 metadata:(id)a4 decompressedSize:(unint64_t)a5;
- (int64_t)type;
@end

@implementation SYInputStreamTransaction

- (SYInputStreamTransaction)initWithURL:(id)a3 metadata:(id)a4 decompressedSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SYInputStreamTransaction;
  v10 = [(SYInputStreamTransaction *)&v19 init];
  if (v10
    && (v11 = [[SYCompressedFileInputStream alloc] initWithCompressedFileAtURL:v8], stream = v10->_stream, v10->_stream = (SYStreamEventHandlerBlocks *)v11, stream, v10->_stream))
  {
    uint64_t v13 = [v9 copy];
    metadata = v10->_metadata;
    v10->_metadata = (NSDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:a5];
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v15;

    v17 = v10;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)type
{
  return 2;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)self->_stream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end