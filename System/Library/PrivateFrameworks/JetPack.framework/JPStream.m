@interface JPStream
- (BOOL)releaseBackingOnDealloc;
- (BOOL)writeToFile:(id)a3 blockSize:(unint64_t)a4 error:(id *)a5;
- (JPStream)initWithBacking:(JetPackStream *)a3 releaseOnDealloc:(BOOL)a4;
- (JetPackStream)backing;
- (id)readData;
- (id)readDataWithLength:(unint64_t)a3;
- (unint64_t)readBytes:(char *)a3 length:(unint64_t)a4;
- (void)dealloc;
@end

@implementation JPStream

- (id)readData
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  v4 = [MEMORY[0x263EFF990] dataWithLength:2048];
  if ((JetPackStreamIsFinished((uint64_t *)[(JPStream *)self backing]) & 1) == 0)
  {
    do
    {
      v5 = [(JPStream *)self backing];
      id v6 = v4;
      [v6 mutableBytes];
      [v6 length];
      objc_msgSend(v3, "appendBytes:length:", objc_msgSend(v6, "mutableBytes"), JetPackStreamRead((uint64_t *)v5));
    }
    while (!JetPackStreamIsFinished((uint64_t *)[(JPStream *)self backing]));
  }

  return v3;
}

- (JetPackStream)backing
{
  return self->_backing;
}

- (JPStream)initWithBacking:(JetPackStream *)a3 releaseOnDealloc:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JPStream;
  result = [(JPStream *)&v7 init];
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

- (void)dealloc
{
  if ([(JPStream *)self releaseBackingOnDealloc]) {
    JetPackStreamDestroy((uint64_t)[(JPStream *)self backing]);
  }
  v3.receiver = self;
  v3.super_class = (Class)JPStream;
  [(JPStream *)&v3 dealloc];
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

- (unint64_t)readBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = [(JPStream *)self backing];
  return JetPackStreamRead((uint64_t *)v4);
}

- (id)readDataWithLength:(unint64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
  v5 = [(JPStream *)self backing];
  id v6 = v4;
  [v6 mutableBytes];
  [v6 setLength:JetPackStreamRead((uint64_t *)v5)];
  return v6;
}

- (BOOL)writeToFile:(id)a3 blockSize:(unint64_t)a4 error:(id *)a5
{
  v8 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:a3];
  v9 = [MEMORY[0x263EFF990] dataWithLength:a4];
  id v10 = 0;
  while (1)
  {
    char IsFinished = JetPackStreamIsFinished((uint64_t *)[(JPStream *)self backing]);
    if (IsFinished) {
      break;
    }
    v12 = [(JPStream *)self backing];
    id v13 = v9;
    [v13 mutableBytes];
    [v13 length];
    [v13 setLength:JetPackStreamRead((uint64_t *)v12)];
    id v16 = 0;
    [v8 writeData:v13 error:&v16];
    id v14 = v16;

    id v10 = v14;
    if (a5)
    {
      id v10 = v14;
      if (v14)
      {
        id v10 = v14;
        *a5 = v10;
        break;
      }
    }
  }

  return IsFinished;
}

@end