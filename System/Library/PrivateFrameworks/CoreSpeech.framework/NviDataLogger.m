@interface NviDataLogger
- (NSOutputStream)oStream;
- (NviDataLogger)initWithFilePath:(id)a3 appendHdr:(id)a4;
- (void)endRequest;
- (void)logData:(id)a3;
- (void)setOStream:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation NviDataLogger

- (void).cxx_destruct
{
}

- (void)setOStream:(id)a3
{
}

- (NSOutputStream)oStream
{
  return self->_oStream;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[NviDataLogger stream:handleEvent:]";
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Got event! %lu\n", (uint8_t *)&v9, 0x16u);
  }
  if (a4 != 4)
  {
    if (a4 == 16)
    {
      [v5 close];
      v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v5 removeFromRunLoop:v7 forMode:*MEMORY[0x1E4F1C3A0]];
    }
    else
    {
      v8 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        v10 = "-[NviDataLogger stream:handleEvent:]";
        __int16 v11 = 2048;
        unint64_t v12 = a4;
        _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Got unhandled evt code %lu \n", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (void)endRequest
{
  [(NSOutputStream *)self->_oStream close];
  oStream = self->_oStream;
  v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(NSOutputStream *)oStream removeFromRunLoop:v4 forMode:*MEMORY[0x1E4F1C3A0]];

  id v5 = self->_oStream;
  self->_oStream = 0;
}

- (void)logData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSOutputStream *)self->_oStream hasSpaceAvailable])
  {
    id v5 = [NSString stringWithFormat:@"%@\n", v4];
    uint64_t v6 = [v5 lengthOfBytesUsingEncoding:4];
    oStream = self->_oStream;
    id v8 = v5;
    if (-[NSOutputStream write:maxLength:](oStream, "write:maxLength:", [v8 cStringUsingEncoding:4], v6) == -1)
    {
      int v9 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v11 = "-[NviDataLogger logData:]";
        _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to write to o/p stream ! \n", buf, 0xCu);
      }
    }
  }
}

- (NviDataLogger)initWithFilePath:(id)a3 appendHdr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NviDataLogger;
  id v8 = [(NviDataLogger *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:v6 append:0];
    oStream = v8->_oStream;
    v8->_oStream = (NSOutputStream *)v9;

    [(NSOutputStream *)v8->_oStream setDelegate:v8];
    __int16 v11 = v8->_oStream;
    uint64_t v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(NSOutputStream *)v11 scheduleInRunLoop:v12 forMode:*MEMORY[0x1E4F1C3A0]];

    [(NSOutputStream *)v8->_oStream open];
    if ([(NSOutputStream *)v8->_oStream hasSpaceAvailable])
    {
      uint64_t v13 = [NSString stringWithFormat:@"%@\n", v7];
      uint64_t v14 = [v13 lengthOfBytesUsingEncoding:4];
      v15 = v8->_oStream;
      id v16 = v13;
      -[NSOutputStream write:maxLength:](v15, "write:maxLength:", [v16 cStringUsingEncoding:4], v14);
    }
  }

  return v8;
}

@end