@interface WFFileChunkInputStream
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSInputStream)inputStream;
- (WFFileChunkInputStream)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)offset;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
@end

@implementation WFFileChunkInputStream

- (void).cxx_destruct
{
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 0;
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFFileChunkInputStream *)self inputStream];
  [v8 removeFromRunLoop:v7 forMode:v6];
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFFileChunkInputStream *)self inputStream];
  [v8 scheduleInRunLoop:v7 forMode:v6];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFFileChunkInputStream *)self inputStream];
  char v9 = [v8 setProperty:v7 forKey:v6];

  return v9;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WFFileChunkInputStream *)self inputStream];
  id v6 = [v5 propertyForKey:v4];

  return v6;
}

- (void)close
{
  id v2 = [(WFFileChunkInputStream *)self inputStream];
  [v2 close];
}

- (void)open
{
  id v2 = [(WFFileChunkInputStream *)self inputStream];
  [v2 open];
}

- (unint64_t)streamStatus
{
  v3 = [(WFFileChunkInputStream *)self inputStream];
  id v4 = [v3 propertyForKey:*MEMORY[0x263EFF598]];
  unint64_t v5 = [v4 unsignedLongLongValue];

  unint64_t v6 = [(WFFileChunkInputStream *)self offset];
  if (v5 >= [(WFFileChunkInputStream *)self length] + v6)
  {
    unint64_t v8 = 5;
  }
  else
  {
    id v7 = [(WFFileChunkInputStream *)self inputStream];
    unint64_t v8 = [v7 streamStatus];
  }
  return v8;
}

- (id)streamError
{
  id v2 = [(WFFileChunkInputStream *)self inputStream];
  v3 = [v2 streamError];

  return v3;
}

- (BOOL)hasBytesAvailable
{
  return [(WFFileChunkInputStream *)self streamStatus] == 2;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if ([(WFFileChunkInputStream *)self streamStatus] > 4) {
    return 0;
  }
  unint64_t v8 = [(WFFileChunkInputStream *)self inputStream];
  char v9 = [v8 propertyForKey:*MEMORY[0x263EFF598]];
  uint64_t v10 = [v9 unsignedLongLongValue];

  unint64_t v11 = [(WFFileChunkInputStream *)self length];
  unint64_t v12 = [(WFFileChunkInputStream *)self offset];
  if (v11 - v12 - v10 >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v11 - v12 - v10;
  }
  int64_t v14 = [v8 read:a3 maxLength:v13];

  return v14;
}

- (WFFileChunkInputStream)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v9 = a3;
  if (([v9 isFileURL] & 1) == 0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFFileChunkInputStream.m", 22, @"Invalid parameter not satisfying: %@", @"URL.fileURL" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)WFFileChunkInputStream;
  uint64_t v10 = [(WFFileChunkInputStream *)&v23 init];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x263EFF950]) initWithURL:v9];
  inputStream = v10->_inputStream;
  v10->_inputStream = (NSInputStream *)v11;

  unint64_t v13 = (WFFileChunkInputStream *)v10->_inputStream;
  if (!v13) {
    goto LABEL_11;
  }
  int64_t v14 = [NSNumber numberWithUnsignedLongLong:a4];
  BOOL v15 = [(WFFileChunkInputStream *)v13 setProperty:v14 forKey:*MEMORY[0x263EFF598]];

  if (!v15)
  {
LABEL_10:
    unint64_t v13 = 0;
    goto LABEL_11;
  }
  v16 = [MEMORY[0x263F08850] defaultManager];
  v17 = [v9 path];
  v18 = [v16 attributesOfItemAtPath:v17 error:0];
  unint64_t v19 = [v18 fileSize];

  unint64_t v13 = 0;
  unint64_t v20 = v19 - a4;
  if (v19 >= a4)
  {
    v10->_offset = a4;
    if (v20 >= a5) {
      unint64_t v20 = a5;
    }
    v10->_length = v20;
    unint64_t v13 = v10;
  }
LABEL_11:

  return v13;
}

@end