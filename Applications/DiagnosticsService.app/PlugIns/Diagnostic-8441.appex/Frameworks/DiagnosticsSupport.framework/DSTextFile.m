@interface DSTextFile
+ (id)textFileWithPath:(id)a3;
- (BOOL)advanceToNextLine:(id *)a3;
- (BOOL)cancelEnumeration;
- (BOOL)isEnumerating;
- (BOOL)searchForNextLineFromCurrentPosition:(id *)a3;
- (DSTextFile)initWithFilePath:(id)a3;
- (DSTextFile)initWithFilePath:(id)a3 withBufferSize:(unint64_t)a4;
- (NSData)lineBreak;
- (NSFileHandle)fileHandle;
- (NSMutableArray)linePositions;
- (id)extractLine:(unint64_t)a3;
- (id)readDataOfLength:(unint64_t)a3;
- (int64_t)skipCount;
- (unint64_t)bufferSize;
- (unint64_t)currentLineIndex;
- (unint64_t)currentOffset;
- (unint64_t)getOffsetAtLineIndex:(unint64_t)a3;
- (void)enumerateUsingBlock:(id)a3;
- (void)resetEnumerator;
- (void)seekToBeginning;
- (void)seekToOffset:(unint64_t)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setCancelEnumeration:(BOOL)a3;
- (void)setCurrentLineIndex:(unint64_t)a3;
- (void)setFileHandle:(id)a3;
- (void)setIsEnumerating:(BOOL)a3;
- (void)setLineBreak:(id)a3;
- (void)setLinePositions:(id)a3;
- (void)setSkipCount:(int64_t)a3;
@end

@implementation DSTextFile

- (DSTextFile)initWithFilePath:(id)a3
{
  return [(DSTextFile *)self initWithFilePath:a3 withBufferSize:1024];
}

- (DSTextFile)initWithFilePath:(id)a3 withBufferSize:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DSTextFile;
  v7 = [(DSTextFile *)&v17 init];
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = +[NSFileHandle fileHandleForReadingAtPath:v6];
  fileHandle = v7->_fileHandle;
  v7->_fileHandle = (NSFileHandle *)v8;

  if (v7->_fileHandle)
  {
    v7->_bufferSize = a4;
    uint64_t v10 = +[NSMutableArray arrayWithObject:&off_1EEC8];
    linePositions = v7->_linePositions;
    v7->_linePositions = (NSMutableArray *)v10;

    uint64_t v12 = +[NSData dataWithBytes:&kDALineBreak length:1];
    lineBreak = v7->_lineBreak;
    v7->_lineBreak = (NSData *)v12;

    v7->_isEnumerating = 0;
    v7->_skipCount = 0;
    v7->_currentLineIndex = 0;
LABEL_4:
    v14 = v7;
    goto LABEL_8;
  }
  v15 = DiagnosticLogHandleForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[DSTextFile initWithFilePath:withBufferSize:]((uint64_t)v6, v15);
  }

  v14 = 0;
LABEL_8:

  return v14;
}

- (void)enumerateUsingBlock:(id)a3
{
  v4 = (void (**)(id, id, id, unint64_t))a3;
  objc_initWeak(&location, self);
  [(DSTextFile *)self setIsEnumerating:1];
  do
  {
    if ([(DSTextFile *)self skipCount])
    {
      unsigned int v5 = [(DSTextFile *)self advanceToNextLine:0];
      [(DSTextFile *)self setSkipCount:(char *)[(DSTextFile *)self skipCount] - 1];
    }
    else
    {
      id v10 = 0;
      unsigned int v5 = [(DSTextFile *)self advanceToNextLine:&v10];
      id v7 = v10;
      id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];

      id v9 = objc_loadWeakRetained(&location);
      v4[2](v4, v8, v9, [(DSTextFile *)self currentLineIndex]);
    }
  }
  while (([(DSTextFile *)self isEnumerating] & v5 & 1) != 0);
  [(DSTextFile *)self resetEnumerator];
  objc_destroyWeak(&location);
}

+ (id)textFileWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithFilePath:v4];

  return v5;
}

- (id)readDataOfLength:(unint64_t)a3
{
  id v4 = [(DSTextFile *)self fileHandle];
  id v5 = [v4 readDataOfLength:a3];

  return v5;
}

- (unint64_t)currentOffset
{
  v2 = [(DSTextFile *)self fileHandle];
  id v3 = [v2 offsetInFile];

  return (unint64_t)v3;
}

- (void)seekToBeginning
{
  id v2 = [(DSTextFile *)self fileHandle];
  [v2 seekToFileOffset:0];
}

- (void)seekToOffset:(unint64_t)a3
{
  id v4 = [(DSTextFile *)self fileHandle];
  [v4 seekToFileOffset:a3];
}

- (void)resetEnumerator
{
  [(DSTextFile *)self setIsEnumerating:0];
  [(DSTextFile *)self setSkipCount:0];

  [(DSTextFile *)self setCurrentLineIndex:0];
}

- (BOOL)advanceToNextLine:(id *)a3
{
  id v5 = [(DSTextFile *)self linePositions];
  id v6 = [v5 count];
  unint64_t v7 = [(DSTextFile *)self currentLineIndex];

  if ((unint64_t)v6 > v7) {
    [(DSTextFile *)self seekToOffset:[(DSTextFile *)self getOffsetAtLineIndex:[(DSTextFile *)self currentLineIndex]]];
  }
  id v8 = [(DSTextFile *)self linePositions];
  id v9 = (char *)[v8 count];
  id v10 = (char *)[(DSTextFile *)self currentLineIndex] + 1;

  if (v9 <= v10)
  {
    BOOL v11 = [(DSTextFile *)self searchForNextLineFromCurrentPosition:a3];
  }
  else
  {
    if (a3)
    {
      *a3 = [(DSTextFile *)self extractLine:[(DSTextFile *)self currentLineIndex]];
    }
    BOOL v11 = 1;
  }
  [(DSTextFile *)self setCurrentLineIndex:(char *)[(DSTextFile *)self currentLineIndex] + 1];
  return v11;
}

- (unint64_t)getOffsetAtLineIndex:(unint64_t)a3
{
  id v4 = [(DSTextFile *)self linePositions];
  id v5 = [v4 objectAtIndex:a3];
  id v6 = [v5 unsignedLongLongValue];

  return (unint64_t)v6;
}

- (id)extractLine:(unint64_t)a3
{
  unint64_t v5 = -[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:");
  id v6 = (char *)[(DSTextFile *)self getOffsetAtLineIndex:a3 + 1] + ~v5;

  return [(DSTextFile *)self readDataOfLength:v6];
}

- (BOOL)searchForNextLineFromCurrentPosition:(id *)a3
{
  if (a3)
  {
    unint64_t v5 = +[NSMutableData dataWithCapacity:[(DSTextFile *)self bufferSize]];
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v7 = 0;
  while (1)
  {
    id v8 = v7;
    unint64_t v7 = [(DSTextFile *)self readDataOfLength:[(DSTextFile *)self bufferSize]];

    id v9 = [v7 length];
    if (!v9) {
      break;
    }
    id v10 = [v7 length];
    BOOL v11 = [(DSTextFile *)self lineBreak];
    uint64_t v12 = [v7 rangeOfData:v11 options:0 range:v10];

    if (v5 && v12 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
      [v5 appendData:v7];
    }
    if (v12 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v13 = [(DSTextFile *)self currentOffset];
      uint64_t v14 = &v12[v13] - (unsigned char *)[v7 length] + 1;
      if (a3 && v12)
      {
        v15 = [v7 subdataWithRange:0, v12];
        [v5 appendData:v15];
      }
      v16 = [(DSTextFile *)self linePositions];
      objc_super v17 = +[NSNumber numberWithUnsignedLongLong:v14];
      [v16 addObject:v17];

      goto LABEL_17;
    }
  }
  if (v5 && [v7 length]) {
    [v5 appendData:v7];
  }
LABEL_17:

  if (a3) {
    *a3 = v5;
  }

  return v9 != 0;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSMutableArray)linePositions
{
  return self->_linePositions;
}

- (void)setLinePositions:(id)a3
{
}

- (NSData)lineBreak
{
  return self->_lineBreak;
}

- (void)setLineBreak:(id)a3
{
}

- (BOOL)cancelEnumeration
{
  return self->_cancelEnumeration;
}

- (void)setCancelEnumeration:(BOOL)a3
{
  self->_cancelEnumeration = a3;
}

- (int64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(int64_t)a3
{
  self->_skipCount = a3;
}

- (BOOL)isEnumerating
{
  return self->_isEnumerating;
}

- (void)setIsEnumerating:(BOOL)a3
{
  self->_isEnumerating = a3;
}

- (unint64_t)currentLineIndex
{
  return self->_currentLineIndex;
}

- (void)setCurrentLineIndex:(unint64_t)a3
{
  self->_currentLineIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineBreak, 0);
  objc_storeStrong((id *)&self->_linePositions, 0);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

- (void)initWithFilePath:(uint64_t)a1 withBufferSize:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to init handle for file at path %@", (uint8_t *)&v2, 0xCu);
}

@end