@interface JXHTTPMultipartBody
+ (id)withDictionary:(id)a3;
- (JXHTTPMultipartBody)init;
- (JXHTTPMultipartBody)initWithDictionary:(id)a3;
- (NSData)finalBoundaryData;
- (NSInputStream)httpInputStream;
- (NSMutableArray)partsArray;
- (NSMutableData)bodyDataBuffer;
- (NSOutputStream)httpOutputStream;
- (NSString)boundaryString;
- (NSString)httpContentType;
- (int64_t)bytesWritten;
- (int64_t)httpContentLength;
- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4;
- (unint64_t)streamBufferLength;
- (void)addData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6;
- (void)addFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6;
- (void)addPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7;
- (void)addString:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)httpOperationDidFail:(id)a3;
- (void)httpOperationDidFinishLoading:(id)a3;
- (void)recreateStreamsForOperation:(id)a3;
- (void)scheduleOutputStreamOnThread:(id)a3;
- (void)setBodyDataBuffer:(id)a3;
- (void)setBoundaryString:(id)a3;
- (void)setBytesWritten:(int64_t)a3;
- (void)setData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6;
- (void)setFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6;
- (void)setFinalBoundaryData:(id)a3;
- (void)setHttpContentLength:(int64_t)a3;
- (void)setHttpContentType:(id)a3;
- (void)setHttpInputStream:(id)a3;
- (void)setHttpOutputStream:(id)a3;
- (void)setPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7;
- (void)setPartsArray:(id)a3;
- (void)setStreamBufferLength:(unint64_t)a3;
- (void)setString:(id)a3 forKey:(id)a4;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation JXHTTPMultipartBody

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyDataBuffer, 0);
  objc_storeStrong((id *)&self->_httpOutputStream, 0);
  objc_storeStrong((id *)&self->_httpInputStream, 0);
  objc_storeStrong((id *)&self->_httpContentType, 0);
  objc_storeStrong((id *)&self->_finalBoundaryData, 0);
  objc_storeStrong((id *)&self->_boundaryString, 0);
  objc_storeStrong((id *)&self->_partsArray, 0);
}

- (void)setBytesWritten:(int64_t)a3
{
  self->_bytesWritten = a3;
}

- (int64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setHttpContentLength:(int64_t)a3
{
  self->_httpContentLength = a3;
}

- (void)setBodyDataBuffer:(id)a3
{
}

- (NSMutableData)bodyDataBuffer
{
  return self->_bodyDataBuffer;
}

- (void)setHttpOutputStream:(id)a3
{
}

- (NSOutputStream)httpOutputStream
{
  return self->_httpOutputStream;
}

- (void)setHttpInputStream:(id)a3
{
}

- (NSInputStream)httpInputStream
{
  return self->_httpInputStream;
}

- (void)setHttpContentType:(id)a3
{
}

- (NSString)httpContentType
{
  return self->_httpContentType;
}

- (void)setFinalBoundaryData:(id)a3
{
}

- (NSData)finalBoundaryData
{
  return self->_finalBoundaryData;
}

- (void)setBoundaryString:(id)a3
{
}

- (NSString)boundaryString
{
  return self->_boundaryString;
}

- (void)setPartsArray:(id)a3
{
}

- (NSMutableArray)partsArray
{
  return self->_partsArray;
}

- (void)setStreamBufferLength:(unint64_t)a3
{
  self->_streamBufferLength = a3;
}

- (unint64_t)streamBufferLength
{
  return self->_streamBufferLength;
}

- (void)setFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 dataUsingEncoding:4];
  [(JXHTTPMultipartBody *)self setPartWithType:1 forKey:v12 contentType:v11 fileName:v10 data:v13];
}

- (void)addFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 dataUsingEncoding:4];
  [(JXHTTPMultipartBody *)self addPartWithType:1 forKey:v12 contentType:v11 fileName:v10 data:v13];
}

- (void)setData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
}

- (void)addData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  -[JXHTTPMultipartBody setData:forKey:contentType:fileName:](self, "setData:forKey:contentType:fileName:", v7, v6, @"text/plain; charset=utf-8",
    0);
}

- (void)addString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  -[JXHTTPMultipartBody addData:forKey:contentType:fileName:](self, "addData:forKey:contentType:fileName:", v7, v6, @"text/plain; charset=utf-8",
    0);
}

- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  [v25 setLength:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v24 = self;
  id v7 = [(JXHTTPMultipartBody *)self partsArray];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    NSUInteger v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        NSUInteger v15 = [v14 dataLength];
        v32.NSUInteger location = v11;
        v32.NSUInteger length = v15;
        v34.NSUInteger location = location;
        v34.NSUInteger length = length;
        NSRange v16 = NSIntersectionRange(v32, v34);
        if (v16.length) {
          v10 += objc_msgSend(v14, "loadMutableData:withDataInRange:", v25, v16.location - v11, v16.length);
        }
        v11 += v15;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
    NSUInteger v11 = 0;
  }

  v17 = [(JXHTTPMultipartBody *)v24 finalBoundaryData];
  NSUInteger v18 = [v17 length];

  v33.NSUInteger location = v11;
  v33.NSUInteger length = v18;
  v35.NSUInteger location = location;
  v35.NSUInteger length = length;
  NSRange v19 = NSIntersectionRange(v33, v35);
  if (v19.length)
  {
    NSUInteger v20 = v19.location - v11;
    v21 = [(JXHTTPMultipartBody *)v24 finalBoundaryData];
    v22 = objc_msgSend(v21, "subdataWithRange:", v20, v19.length);

    if (v22)
    {
      [v25 appendData:v22];
      v10 += [v22 length];
    }
  }
  return v10;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v22 = a3;
  id v6 = [(JXHTTPMultipartBody *)self httpOutputStream];

  id v7 = v22;
  if (v6 == v22)
  {
    if (a4 == 4)
    {
      int64_t v13 = [(JXHTTPMultipartBody *)self bytesWritten];
      if (v13 != [(JXHTTPMultipartBody *)self httpContentLength])
      {
        int64_t v14 = [(JXHTTPMultipartBody *)self httpContentLength];
        unint64_t v15 = v14 - [(JXHTTPMultipartBody *)self bytesWritten];
        if (v15 >= [(JXHTTPMultipartBody *)self streamBufferLength]) {
          unint64_t v15 = [(JXHTTPMultipartBody *)self streamBufferLength];
        }
        NSRange v16 = [(JXHTTPMultipartBody *)self bodyDataBuffer];
        unint64_t v17 = -[JXHTTPMultipartBody loadMutableData:withDataInRange:](self, "loadMutableData:withDataInRange:", v16, [(JXHTTPMultipartBody *)self bytesWritten], v15);

        if (v17)
        {
          NSUInteger v18 = [(JXHTTPMultipartBody *)self httpOutputStream];
          id v19 = [(JXHTTPMultipartBody *)self bodyDataBuffer];
          uint64_t v20 = objc_msgSend(v18, "write:maxLength:", objc_msgSend(v19, "bytes"), v17);

          if (v20 >= 1)
          {
            [(JXHTTPMultipartBody *)self setBytesWritten:[(JXHTTPMultipartBody *)self bytesWritten] + v20];
LABEL_13:
            id v7 = v22;
            goto LABEL_14;
          }
        }
      }
    }
    else
    {
      if (a4 != 8) {
        goto LABEL_14;
      }
      uint64_t v8 = [v22 streamError];

      if (v8)
      {
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPMultipartBody.m"];
        unint64_t v10 = [v9 lastPathComponent];
        NSUInteger v11 = [v22 streamError];
        uint64_t v12 = [v11 localizedDescription];
        NSLog(&cfstr_DError.isa, v10, 305, v12);
      }
    }
    v21 = [(JXHTTPMultipartBody *)self httpOutputStream];
    [v21 close];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)addPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  NSRange v16 = [(JXHTTPMultipartBody *)self boundaryString];
  id v18 = +[JXHTTPMultipartPart withMultipartType:v10 key:v15 data:v12 contentType:v14 fileName:v13 boundary:v16];

  unint64_t v17 = [(JXHTTPMultipartBody *)self partsArray];
  [v17 addObject:v18];

  [(JXHTTPMultipartBody *)self setHttpContentLength:-1];
}

- (void)setPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v27 = a5;
  id v25 = a6;
  id v24 = a7;
  id v12 = objc_alloc(MEMORY[0x263EFF980]);
  id v13 = [(JXHTTPMultipartBody *)self partsArray];
  id v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = [(JXHTTPMultipartBody *)self partsArray];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "key", v24);
        int v22 = [v21 isEqualToString:v11];

        if (v22) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  v23 = [(JXHTTPMultipartBody *)self partsArray];
  [v23 removeObjectsInArray:v14];

  [(JXHTTPMultipartBody *)self addPartWithType:a3 forKey:v11 contentType:v27 fileName:v25 data:v24];
}

- (void)scheduleOutputStreamOnThread:(id)a3
{
  id v8 = a3;
  if (!v8
    || ([MEMORY[0x263F08B88] currentThread],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v8))
  {
    v5 = [(JXHTTPMultipartBody *)self httpOutputStream];
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v5 scheduleInRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

    id v7 = [(JXHTTPMultipartBody *)self httpOutputStream];
    [v7 open];
  }
  else
  {
    [(JXHTTPMultipartBody *)self performSelector:sel_scheduleOutputStreamOnThread_ onThread:v8 withObject:v8 waitUntilDone:1];
  }
}

- (void)recreateStreamsForOperation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", -[JXHTTPMultipartBody streamBufferLength](self, "streamBufferLength"));
  [(JXHTTPMultipartBody *)self setBodyDataBuffer:v5];

  [(JXHTTPMultipartBody *)self setHttpContentLength:-1];
  [(JXHTTPMultipartBody *)self setBytesWritten:0];
  id v6 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v6 setDelegate:0];

  id v7 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v7 close];

  [(JXHTTPMultipartBody *)self setHttpInputStream:0];
  [(JXHTTPMultipartBody *)self setHttpOutputStream:0];
  CFTypeRef cf = 0;
  CFReadStreamRef readStream = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x263EFFB08], &readStream, (CFWriteStreamRef *)&cf, [(JXHTTPMultipartBody *)self streamBufferLength]);
  CFTypeRef v8 = cf;
  CFReadStreamRef v9 = readStream;
  if (readStream && cf)
  {
    [(JXHTTPMultipartBody *)self setHttpInputStream:readStream];

    uint64_t v10 = (void *)cf;
    [(JXHTTPMultipartBody *)self setHttpOutputStream:cf];

    id v11 = [(JXHTTPMultipartBody *)self httpOutputStream];
    [v11 setDelegate:self];

    id v12 = [(id)objc_opt_class() networkThread];
    [(JXHTTPMultipartBody *)self scheduleOutputStreamOnThread:v12];
  }
  else
  {
    if (readStream)
    {
      CFRelease(readStream);
      CFTypeRef v8 = cf;
    }
    if (v8) {
      CFRelease(v8);
    }
  }
}

- (void)httpOperationDidFail:(id)a3
{
  id v3 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v3 close];
}

- (void)httpOperationDidFinishLoading:(id)a3
{
  id v3 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v3 close];
}

- (int64_t)httpContentLength
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t result = self->_httpContentLength;
  if (result == -1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(JXHTTPMultipartBody *)self partsArray];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += [*(id *)(*((void *)&v10 + 1) + 8 * i) dataLength];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);

      if (v7 < 1) {
        goto LABEL_13;
      }
      id v4 = [(JXHTTPMultipartBody *)self finalBoundaryData];
      v7 += [v4 length];
    }
    else
    {
      uint64_t v7 = 0;
    }

LABEL_13:
    [(JXHTTPMultipartBody *)self setHttpContentLength:v7];
    return self->_httpContentLength;
  }
  return result;
}

- (JXHTTPMultipartBody)initWithDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(JXHTTPMultipartBody *)self init];
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = [v4 objectForKey:v11];
          [(JXHTTPMultipartBody *)v5 addString:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (JXHTTPMultipartBody)init
{
  v17.receiver = self;
  v17.super_class = (Class)JXHTTPMultipartBody;
  v2 = [(JXHTTPMultipartBody *)&v17 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
    [v4 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v3, "initWithFormat:", @"%.0f", v5);

    id v7 = [NSString alloc];
    uint64_t v8 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v9 = [v8 globallyUniqueString];
    long long v10 = (void *)[v7 initWithFormat:@"JXHTTP-%@-%@", v9, v6];

    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"--%@", v10];
    [(JXHTTPMultipartBody *)v2 setBoundaryString:v11];

    long long v12 = (void *)[[NSString alloc] initWithFormat:@"--%@--\r\n", v10];
    long long v13 = [v12 dataUsingEncoding:4];
    [(JXHTTPMultipartBody *)v2 setFinalBoundaryData:v13];

    long long v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"multipart/form-data; charset=utf-8; boundary=%@",
                    v10);
    [(JXHTTPMultipartBody *)v2 setHttpContentType:v14];

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(JXHTTPMultipartBody *)v2 setPartsArray:v15];

    [(JXHTTPMultipartBody *)v2 setStreamBufferLength:0x10000];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v3 setDelegate:0];

  id v4 = [(JXHTTPMultipartBody *)self httpOutputStream];
  [v4 close];

  v5.receiver = self;
  v5.super_class = (Class)JXHTTPMultipartBody;
  [(JXHTTPMultipartBody *)&v5 dealloc];
}

+ (id)withDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

@end