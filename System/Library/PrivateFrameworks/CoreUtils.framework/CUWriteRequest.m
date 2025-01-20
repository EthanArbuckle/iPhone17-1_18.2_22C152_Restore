@interface CUWriteRequest
- (BOOL)endOfData;
- (BOOL)hasMessageUUID;
- (CUWriteRequest)init;
- (NSArray)dataArray;
- (NSError)error;
- (char)messageUUID;
- (id)completion;
- (iovec)bytesIOArray;
- (unint64_t)bytesIOCount;
- (unint64_t)bytesIOMaxCount;
- (void)setBytesIOCount:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDataArray:(id)a3;
- (void)setEndOfData:(BOOL)a3;
- (void)setHasMessageUUID:(BOOL)a3;
@end

@implementation CUWriteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArray, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setHasMessageUUID:(BOOL)a3
{
  self->_hasMessageUUID = a3;
}

- (BOOL)hasMessageUUID
{
  return self->_hasMessageUUID;
}

- (NSError)error
{
  return self->_error;
}

- (void)setEndOfData:(BOOL)a3
{
  self->_endOfData = a3;
}

- (BOOL)endOfData
{
  return self->_endOfData;
}

- (void)setDataArray:(id)a3
{
}

- (NSArray)dataArray
{
  return self->_dataArray;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (unint64_t)bytesIOMaxCount
{
  return self->_bytesIOMaxCount;
}

- (void)setBytesIOCount:(unint64_t)a3
{
  self->_bytesIOCount = a3;
}

- (unint64_t)bytesIOCount
{
  return self->_bytesIOCount;
}

- (iovec)bytesIOArray
{
  return self->_bytesIOArray;
}

- (char)messageUUID
{
  return (char *)self->_messageUUID;
}

- (CUWriteRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUWriteRequest;
  result = [(CUWriteRequest *)&v3 init];
  if (result)
  {
    result->_bytesIOArray = result->_iov;
    result->_bytesIOMaxCount = 16;
  }
  return result;
}

@end