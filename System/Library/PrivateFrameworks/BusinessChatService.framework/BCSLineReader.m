@interface BCSLineReader
- (BCSLineReader)initWithFileURL:(id)a3;
- (BCSLineReader)initWithFileURL:(id)a3 bufferSize:(unint64_t)a4 maxLineSize:(unint64_t)a5;
- (BOOL)hasValidURL;
- (NSInputStream)inputStream;
- (NSMutableData)lineBuffer;
- (NSMutableData)readBuffer;
- (NSURL)URL;
- (char)beginLine;
- (char)endBuffer;
- (char)endLine;
- (id)readLine;
- (unint64_t)bufferSize;
- (unint64_t)maxLineSize;
- (void)dealloc;
- (void)refillReadBuffer;
- (void)setBeginLine:(char *)a3;
- (void)setEndBuffer:(char *)a3;
- (void)setEndLine:(char *)a3;
- (void)setInputStream:(id)a3;
- (void)setReadBuffer:(id)a3;
@end

@implementation BCSLineReader

- (BCSLineReader)initWithFileURL:(id)a3
{
  return [(BCSLineReader *)self initWithFileURL:a3 bufferSize:2048 maxLineSize:0x80000];
}

- (BCSLineReader)initWithFileURL:(id)a3 bufferSize:(unint64_t)a4 maxLineSize:(unint64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCSLineReader;
  v10 = [(BCSLineReader *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    v11->_bufferSize = a4;
    v11->_maxLineSize = a5;
    uint64_t v12 = [MEMORY[0x263EFF990] dataWithLength:a4];
    readBuffer = v11->_readBuffer;
    v11->_readBuffer = (NSMutableData *)v12;

    v11->_beginLine = (char *)[(NSMutableData *)v11->_readBuffer mutableBytes];
    v11->_endLine = (char *)[(NSMutableData *)v11->_readBuffer mutableBytes];
    v11->_endBuffer = (char *)[(NSMutableData *)v11->_readBuffer mutableBytes];
    uint64_t v14 = [MEMORY[0x263EFF990] data];
    lineBuffer = v11->_lineBuffer;
    v11->_lineBuffer = (NSMutableData *)v14;
  }
  return v11;
}

- (id)readLine
{
  BOOL v4 = 0;
  uint64_t v35 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 136315394;
  long long v30 = v2;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v5 = [(BCSLineReader *)self beginLine];
        if (v5 == [(BCSLineReader *)self endBuffer])
        {
          v6 = [(BCSLineReader *)self inputStream];
          int v7 = [v6 hasBytesAvailable];

          if (!v7)
          {
            v28 = 0;
            goto LABEL_23;
          }
        }
        for (i = [(BCSLineReader *)self beginLine]; ; i = [(BCSLineReader *)self endLine] + 1)
        {
          [(BCSLineReader *)self setEndLine:i];
          id v9 = [(BCSLineReader *)self endLine];
          if (v9 >= [(BCSLineReader *)self endBuffer] || *[(BCSLineReader *)self endLine] == 10) {
            break;
          }
        }
        if (!v4) {
          break;
        }
        if (*[(BCSLineReader *)self endLine] == 10)
        {
          [(BCSLineReader *)self setBeginLine:[(BCSLineReader *)self endLine] + 1];
          BOOL v4 = 0;
        }
        else
        {
          [(BCSLineReader *)self refillReadBuffer];
          BOOL v4 = 1;
        }
      }
      v10 = [(BCSLineReader *)self lineBuffer];
      uint64_t v11 = [v10 length];
      uint64_t v12 = [(BCSLineReader *)self endLine];
      unint64_t v13 = (unint64_t)&v12[v11 - (unint64_t)[(BCSLineReader *)self beginLine]];
      unint64_t v14 = [(BCSLineReader *)self maxLineSize];

      if (v13 <= v14) {
        break;
      }
      v15 = [(BCSLineReader *)self lineBuffer];
      [v15 setLength:0];

      v16 = ABSLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v22 = [(BCSLineReader *)self maxLineSize];
        *(_DWORD *)buf = v30;
        v32 = "-[BCSLineReader readLine]";
        __int16 v33 = 2048;
        unint64_t v34 = v22;
        _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "%s Dropping line since it exceeds max size limit of %ld", buf, 0x16u);
      }

      [(BCSLineReader *)self setBeginLine:[(BCSLineReader *)self endLine] + 1];
      BOOL v4 = *[(BCSLineReader *)self endLine] != 10;
    }
    objc_super v17 = [(BCSLineReader *)self endLine];
    if ((uint64_t)&v17[-(uint64_t)[(BCSLineReader *)self beginLine]] >= 1)
    {
      v18 = [(BCSLineReader *)self lineBuffer];
      objc_msgSend(v18, "appendBytes:length:", -[BCSLineReader beginLine](self, "beginLine"), -[BCSLineReader endLine](self, "endLine") - -[BCSLineReader beginLine](self, "beginLine"));
    }
    v19 = [(BCSLineReader *)self endLine];
    if (v19 != [(BCSLineReader *)self endBuffer]) {
      break;
    }
    [(BCSLineReader *)self refillReadBuffer];
    v20 = [(BCSLineReader *)self inputStream];
    char v21 = [v20 hasBytesAvailable];

    BOOL v4 = 0;
    if ((v21 & 1) == 0)
    {
      id v26 = [NSString alloc];
      v27 = [(BCSLineReader *)self lineBuffer];
      v28 = (void *)[v26 initWithData:v27 encoding:4];

      goto LABEL_23;
    }
  }
  id v23 = [NSString alloc];
  v24 = [(BCSLineReader *)self lineBuffer];
  v28 = (void *)[v23 initWithData:v24 encoding:4];

  v25 = [(BCSLineReader *)self lineBuffer];
  [v25 setLength:0];

  [(BCSLineReader *)self setBeginLine:[(BCSLineReader *)self endLine] + 1];
LABEL_23:

  return v28;
}

- (void)refillReadBuffer
{
  id v3 = [(BCSLineReader *)self readBuffer];
  uint64_t v4 = [v3 mutableBytes];

  v5 = [(BCSLineReader *)self inputStream];
  uint64_t v6 = objc_msgSend(v5, "read:maxLength:", v4, -[BCSLineReader bufferSize](self, "bufferSize") - 1);

  [(BCSLineReader *)self setEndBuffer:v4 + v6];

  [(BCSLineReader *)self setBeginLine:v4];
}

- (NSInputStream)inputStream
{
  if (!self->_inputStream && [(BCSLineReader *)self hasValidURL])
  {
    id v3 = (void *)MEMORY[0x263EFF950];
    uint64_t v4 = [(BCSLineReader *)self URL];
    v5 = [v3 inputStreamWithURL:v4];
    inputStream = self->_inputStream;
    self->_inputStream = v5;

    [(NSInputStream *)self->_inputStream open];
  }
  int v7 = self->_inputStream;

  return v7;
}

- (BOOL)hasValidURL
{
  long long v2 = [(BCSLineReader *)self URL];
  char v3 = [v2 isFileURL];

  return v3;
}

- (void)dealloc
{
  [(NSInputStream *)self->_inputStream close];
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)BCSLineReader;
  [(BCSLineReader *)&v4 dealloc];
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)maxLineSize
{
  return self->_maxLineSize;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setInputStream:(id)a3
{
}

- (NSMutableData)readBuffer
{
  return self->_readBuffer;
}

- (void)setReadBuffer:(id)a3
{
}

- (char)endBuffer
{
  return self->_endBuffer;
}

- (void)setEndBuffer:(char *)a3
{
  self->_endBuffer = a3;
}

- (char)beginLine
{
  return self->_beginLine;
}

- (void)setBeginLine:(char *)a3
{
  self->_beginLine = a3;
}

- (char)endLine
{
  return self->_endLine;
}

- (void)setEndLine:(char *)a3
{
  self->_endLine = a3;
}

- (NSMutableData)lineBuffer
{
  return self->_lineBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineBuffer, 0);
  objc_storeStrong((id *)&self->_readBuffer, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end