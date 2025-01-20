@interface _CATRemoteConnectionSendDataWithStreamContext
- (BOOL)hasBytesRemaining;
- (NSInputStream)stream;
- (_CATRemoteConnectionSendDataWithStreamContext)initWithStream:(id)a3 length:(unint64_t)a4 bufferSize:(unint64_t)a5 userInfo:(id)a6;
- (id)bufferedDataWithError:(id *)a3;
- (id)userInfo;
- (unint64_t)bufferSize;
- (unint64_t)bytesWritten;
- (unint64_t)clientBytesWritten;
- (unint64_t)dataLength;
- (void)dealloc;
- (void)setBytesWritten:(unint64_t)a3;
@end

@implementation _CATRemoteConnectionSendDataWithStreamContext

- (_CATRemoteConnectionSendDataWithStreamContext)initWithStream:(id)a3 length:(unint64_t)a4 bufferSize:(unint64_t)a5 userInfo:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  if (!v12)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 1059, @"Invalid parameter not satisfying: %@", @"stream" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)_CATRemoteConnectionSendDataWithStreamContext;
  v14 = [(_CATRemoteConnectionSendDataWithStreamContext *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_stream, a3);
    v15->_dataLength = a4;
    v15->_bufferSize = a5;
    objc_storeStrong(&v15->_userInfo, a6);
    uint64_t v16 = +[CATHTTPMessageParser responseHeaderForContentWithLength:a4];
    mHeaderData = v15->mHeaderData;
    v15->mHeaderData = (NSData *)v16;

    [v12 open];
  }

  return v15;
}

- (void)dealloc
{
  [(NSInputStream *)self->_stream close];
  v3.receiver = self;
  v3.super_class = (Class)_CATRemoteConnectionSendDataWithStreamContext;
  [(_CATRemoteConnectionSendDataWithStreamContext *)&v3 dealloc];
}

- (BOOL)hasBytesRemaining
{
  NSUInteger v3 = [(NSData *)self->mHeaderData length];
  unint64_t v4 = [(_CATRemoteConnectionSendDataWithStreamContext *)self dataLength] + v3;
  return v4 > [(_CATRemoteConnectionSendDataWithStreamContext *)self bytesWritten];
}

- (unint64_t)clientBytesWritten
{
  unint64_t v3 = [(_CATRemoteConnectionSendDataWithStreamContext *)self bytesWritten];
  if (v3 <= [(NSData *)self->mHeaderData length]) {
    return 0;
  }
  unint64_t v4 = [(_CATRemoteConnectionSendDataWithStreamContext *)self bytesWritten];
  return v4 - [(NSData *)self->mHeaderData length];
}

- (id)bufferedDataWithError:(id *)a3
{
  unint64_t mBytesRead = self->mBytesRead;
  NSUInteger v6 = [(NSData *)self->mHeaderData length] + mBytesRead;
  unint64_t v7 = [(_CATRemoteConnectionSendDataWithStreamContext *)self bytesWritten];
  unint64_t v8 = v6 - v7;
  if (v6 - v7 >= [(_CATRemoteConnectionSendDataWithStreamContext *)self bufferSize]) {
    goto LABEL_19;
  }
  mBuffer = self->mBuffer;
  if (!mBuffer) {
    goto LABEL_7;
  }
  if (v8 >= [(NSMutableData *)mBuffer length]) {
    goto LABEL_19;
  }
  v10 = self->mBuffer;
  if (v10)
  {
    if (v6 == v7) {
      goto LABEL_12;
    }
    NSUInteger v11 = [(NSMutableData *)v10 length] - v8;
    id v12 = self->mBuffer;
    id v13 = (const void *)([(NSMutableData *)v12 bytes] + v11);
    v14 = v12;
    unint64_t v15 = v8;
  }
  else
  {
LABEL_7:
    uint64_t v16 = (void *)MEMORY[0x263EFF990];
    unint64_t v17 = [(_CATRemoteConnectionSendDataWithStreamContext *)self bufferSize];
    NSUInteger v18 = [(NSData *)self->mHeaderData length];
    unint64_t v19 = [(_CATRemoteConnectionSendDataWithStreamContext *)self dataLength];
    if (v17 >= v19 + v18) {
      unint64_t v20 = v19 + v18;
    }
    else {
      unint64_t v20 = v17;
    }
    v21 = [v16 dataWithLength:v20];
    v22 = self->mBuffer;
    self->mBuffer = v21;

    v23 = self->mBuffer;
    NSUInteger v24 = [(NSData *)self->mHeaderData length];
    id v13 = [(NSData *)self->mHeaderData bytes];
    v14 = v23;
    unint64_t v15 = v24;
  }
  -[NSMutableData replaceBytesInRange:withBytes:](v14, "replaceBytesInRange:withBytes:", 0, v15, v13);
LABEL_12:
  unint64_t v25 = self->mBytesRead;
  if (v25 >= [(_CATRemoteConnectionSendDataWithStreamContext *)self dataLength])
  {
LABEL_18:
    [(NSMutableData *)self->mBuffer setLength:v8];
    goto LABEL_19;
  }
  v26 = [(_CATRemoteConnectionSendDataWithStreamContext *)self stream];
  v27 = [(NSMutableData *)self->mBuffer mutableBytes] + v8;
  unint64_t v28 = [(NSMutableData *)self->mBuffer length] - v8;
  unint64_t v29 = [(_CATRemoteConnectionSendDataWithStreamContext *)self dataLength];
  if (v28 >= v29 - self->mBytesRead) {
    unint64_t v30 = v29 - self->mBytesRead;
  }
  else {
    unint64_t v30 = v28;
  }
  uint64_t v31 = [v26 read:v27 maxLength:v30];

  if ((v31 & 0x8000000000000000) == 0)
  {
    self->mBytesRead += v31;
    v8 += v31;
    if (v8 < [(NSMutableData *)self->mBuffer length]) {
      goto LABEL_18;
    }
LABEL_19:
    v32 = self->mBuffer;
    goto LABEL_20;
  }
  if (a3)
  {
    v34 = [(_CATRemoteConnectionSendDataWithStreamContext *)self stream];
    *a3 = [v34 streamError];
  }
  v32 = 0;
LABEL_20:

  return v32;
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->mHeaderData, 0);

  objc_storeStrong((id *)&self->mBuffer, 0);
}

@end