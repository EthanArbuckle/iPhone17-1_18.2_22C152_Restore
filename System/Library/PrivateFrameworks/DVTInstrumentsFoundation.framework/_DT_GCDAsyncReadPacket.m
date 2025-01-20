@interface _DT_GCDAsyncReadPacket
- (_DT_GCDAsyncReadPacket)initWithData:(id)a3 startOffset:(unint64_t)a4 maxLength:(unint64_t)a5 timeout:(double)a6 readLength:(unint64_t)a7 terminator:(id)a8 tag:(int64_t)a9;
- (int64_t)searchForTermAfterPreBuffering:(int64_t)a3;
- (unint64_t)optimalReadLengthWithDefault:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4;
- (unint64_t)readLengthForNonTermWithHint:(unint64_t)a3;
- (unint64_t)readLengthForTermWithHint:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4;
- (unint64_t)readLengthForTermWithPreBuffer:(id)a3 found:(BOOL *)a4;
- (void)ensureCapacityForAdditionalDataOfLength:(unint64_t)a3;
@end

@implementation _DT_GCDAsyncReadPacket

- (_DT_GCDAsyncReadPacket)initWithData:(id)a3 startOffset:(unint64_t)a4 maxLength:(unint64_t)a5 timeout:(double)a6 readLength:(unint64_t)a7 terminator:(id)a8 tag:(int64_t)a9
{
  id v17 = a3;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_DT_GCDAsyncReadPacket;
  v19 = [(_DT_GCDAsyncReadPacket *)&v30 init];
  v20 = v19;
  if (v19)
  {
    v19->bytesDone = 0;
    v19->maxLength = a5;
    v19->timeout = a6;
    v19->unint64_t readLength = a7;
    uint64_t v21 = [v18 copy];
    term = v20->term;
    v20->term = (NSData *)v21;

    v20->tag = a9;
    if (v17)
    {
      objc_storeStrong((id *)&v20->buffer, a3);
      v20->startOffset = a4;
      v20->bufferOwner = 0;
      uint64_t v23 = [v17 length];
    }
    else
    {
      unint64_t readLength = v20->readLength;
      id v25 = objc_alloc(MEMORY[0x263EFF990]);
      if (readLength) {
        unint64_t v26 = v20->readLength;
      }
      else {
        unint64_t v26 = 0;
      }
      uint64_t v27 = [v25 initWithLength:v26];
      buffer = v20->buffer;
      v20->buffer = (NSMutableData *)v27;

      uint64_t v23 = 0;
      v20->startOffset = 0;
      v20->bufferOwner = 1;
    }
    v20->originalBufferLength = v23;
  }

  return v20;
}

- (void)ensureCapacityForAdditionalDataOfLength:(unint64_t)a3
{
  if (a3 > [(NSMutableData *)self->buffer length] - (self->startOffset + self->bytesDone))
  {
    buffer = self->buffer;
    MEMORY[0x270F9A6D0](buffer, sel_increaseLengthBy_);
  }
}

- (unint64_t)optimalReadLengthWithDefault:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4
{
  NSUInteger v5 = a3;
  unint64_t readLength = self->readLength;
  if (readLength)
  {
    unint64_t v7 = readLength - self->bytesDone;
    if (v7 < a3) {
      NSUInteger v5 = v7;
    }
    if (a4)
    {
      BOOL v8 = 0;
LABEL_11:
      *a4 = v8;
    }
  }
  else
  {
    unint64_t maxLength = self->maxLength;
    if (maxLength)
    {
      unint64_t v10 = maxLength - self->bytesDone;
      if (v10 < a3) {
        NSUInteger v5 = v10;
      }
    }
    if (a4)
    {
      BOOL v8 = [(NSMutableData *)self->buffer length] - (self->startOffset + self->bytesDone) < v5;
      goto LABEL_11;
    }
  }
  return v5;
}

- (unint64_t)readLengthForNonTermWithHint:(unint64_t)a3
{
  if (self->term)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:505 description:@"This method does not apply to term reads"];

    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    unint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:506 description:@"Invalid parameter: bytesAvailable"];

    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t readLength = self->readLength;
  if (!readLength)
  {
    unint64_t readLength = self->maxLength;
    if (!readLength) {
      return a3;
    }
  }
  unint64_t v7 = readLength - self->bytesDone;
  if (v7 >= a3) {
    return a3;
  }
  else {
    return v7;
  }
}

- (unint64_t)readLengthForTermWithHint:(unint64_t)a3 shouldPreBuffer:(BOOL *)a4
{
  NSUInteger v5 = a3;
  if (!self->term)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:558 description:@"This method does not apply to non-term reads"];

    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:559 description:@"Invalid parameter: bytesAvailable"];

    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t maxLength = self->maxLength;
  if (maxLength)
  {
    unint64_t v9 = maxLength - self->bytesDone;
    if (v9 < v5) {
      NSUInteger v5 = v9;
    }
  }
  if (a4) {
    *a4 = [(NSMutableData *)self->buffer length] - (self->startOffset + self->bytesDone) < v5;
  }
  return v5;
}

- (unint64_t)readLengthForTermWithPreBuffer:(id)a3 found:(BOOL *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!self->term)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:632 description:@"This method does not apply to non-term reads"];
  }
  if (![v7 availableBytes])
  {
    objc_super v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:633 description:@"Invoked with empty pre buffer!"];
  }
  size_t v8 = [(NSData *)self->term length];
  unint64_t v9 = [v7 availableBytes];
  unint64_t v10 = v9;
  unint64_t bytesDone = self->bytesDone;
  if (bytesDone + v9 < v8) {
    goto LABEL_27;
  }
  v34 = &v31;
  unint64_t maxLength = self->maxLength;
  unint64_t v13 = maxLength - bytesDone;
  if (v9 < v13) {
    unint64_t v13 = v9;
  }
  if (maxLength) {
    unint64_t v10 = v13;
  }
  v35 = [(NSData *)self->term bytes];
  if (self->bytesDone >= v8 - 1) {
    size_t v14 = v8 - 1;
  }
  else {
    size_t v14 = self->bytesDone;
  }
  v15 = [(NSMutableData *)self->buffer mutableBytes];
  unint64_t startOffset = self->startOffset;
  unint64_t v17 = self->bytesDone;
  uint64_t v18 = [v7 readBuffer];
  unint64_t v19 = v10 - v8 + v14;
  unint64_t v20 = v10;
  unint64_t v21 = v19 + 1;
  if (v19 != -1)
  {
    v22 = (char *)v18;
    id v32 = v7;
    v33 = a4;
    size_t v23 = v8 - v14;
    v24 = &v15[startOffset + v17 - v14];
    unint64_t v31 = v20;
    size_t v25 = v20 + v14 - v8;
    BOOL v26 = 1;
    uint64_t v27 = -1;
    while (1)
    {
      if (v14)
      {
        memcpy((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v14);
        memcpy((char *)&v31 + v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v23);
        if (!memcmp((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v35, v8))
        {
          unint64_t v10 = v23;
          id v7 = v32;
          a4 = v33;
          if (!v33) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
        ++v24;
        --v14;
        ++v23;
      }
      else
      {
        if (!memcmp(v22, v35, v8))
        {
          id v7 = v32;
          unint64_t v10 = (unint64_t)&v22[v8 - [v32 readBuffer]];
          a4 = v33;
          if (v33) {
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        size_t v14 = 0;
        ++v22;
      }
      BOOL v26 = v27 + 2 < v21;
      if (v25 == ++v27)
      {
        id v7 = v32;
        a4 = v33;
        unint64_t v10 = v31;
        if (v33) {
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
  }
  BOOL v26 = 0;
  unint64_t v10 = v20;
  if (a4) {
LABEL_26:
  }
    *a4 = v26;
LABEL_27:

  return v10;
}

- (int64_t)searchForTermAfterPreBuffering:(int64_t)a3
{
  if (!self->term)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:763 description:@"This method does not apply to non-term reads"];
  }
  NSUInteger v5 = [(NSMutableData *)self->buffer mutableBytes];
  unint64_t bytesDone = self->bytesDone;
  id v7 = [(NSData *)self->term bytes];
  NSUInteger v8 = [(NSData *)self->term length];
  size_t v9 = v8;
  if (bytesDone >= v8) {
    uint64_t v10 = bytesDone - v8 + 1;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = &v5[v10];
  unint64_t v12 = v10 + v8;
  while (v12 <= bytesDone + a3)
  {
    int v13 = memcmp(&v11[self->startOffset], v7, v9);
    ++v11;
    ++v12;
    if (!v13) {
      return bytesDone + a3 - v12 + 1;
    }
  }
  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->term, 0);
  objc_storeStrong((id *)&self->buffer, 0);
}

@end