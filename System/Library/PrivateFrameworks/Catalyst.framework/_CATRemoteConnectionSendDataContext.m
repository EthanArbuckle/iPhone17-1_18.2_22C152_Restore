@interface _CATRemoteConnectionSendDataContext
- (BOOL)hasBytesRemaining;
- (NSData)data;
- (_CATRemoteConnectionSendDataContext)initWithData:(id)a3 userInfo:(id)a4;
- (id)bufferedDataWithError:(id *)a3;
- (id)userInfo;
- (unint64_t)bytesWritten;
- (unint64_t)clientBytesWritten;
- (unint64_t)headerLength;
- (void)setBytesWritten:(unint64_t)a3;
@end

@implementation _CATRemoteConnectionSendDataContext

- (_CATRemoteConnectionSendDataContext)initWithData:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 1019, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_CATRemoteConnectionSendDataContext;
  v9 = [(_CATRemoteConnectionSendDataContext *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    data = v9->_data;
    v9->_data = (NSData *)v10;

    objc_storeStrong(&v9->_userInfo, a4);
    uint64_t v12 = +[CATHTTPMessageParser encodeRequestData:v9->_data];
    mEncodedData = v9->mEncodedData;
    v9->mEncodedData = (NSData *)v12;
  }
  return v9;
}

- (BOOL)hasBytesRemaining
{
  unint64_t v3 = [(NSData *)self->mEncodedData length];
  return v3 > [(_CATRemoteConnectionSendDataContext *)self bytesWritten];
}

- (unint64_t)clientBytesWritten
{
  unint64_t v3 = [(_CATRemoteConnectionSendDataContext *)self bytesWritten];
  if (v3 <= [(_CATRemoteConnectionSendDataContext *)self headerLength]) {
    return 0;
  }
  unint64_t v4 = [(_CATRemoteConnectionSendDataContext *)self bytesWritten];
  return v4 - [(_CATRemoteConnectionSendDataContext *)self headerLength];
}

- (unint64_t)headerLength
{
  NSUInteger v3 = [(NSData *)self->mEncodedData length];
  unint64_t v4 = [(_CATRemoteConnectionSendDataContext *)self data];
  unint64_t v5 = v3 - [v4 length];

  return v5;
}

- (id)bufferedDataWithError:(id *)a3
{
  mEncodedData = self->mEncodedData;
  unint64_t v5 = [(_CATRemoteConnectionSendDataContext *)self bytesWritten];
  NSUInteger v6 = [(NSData *)self->mEncodedData length];
  NSUInteger v7 = v6 - [(_CATRemoteConnectionSendDataContext *)self bytesWritten];

  return -[NSData subdataWithRange:](mEncodedData, "subdataWithRange:", v5, v7);
}

- (NSData)data
{
  return self->_data;
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
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->mEncodedData, 0);
}

@end