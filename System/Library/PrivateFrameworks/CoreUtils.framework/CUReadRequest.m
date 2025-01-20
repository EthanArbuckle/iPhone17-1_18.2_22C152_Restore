@interface CUReadRequest
- (BOOL)hasMessageUUID;
- (NSData)data;
- (NSError)error;
- (NSMutableData)bufferData;
- (char)messageUUID;
- (id)completion;
- (unint64_t)length;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (unsigned)statusFlags;
- (void)bufferBytes;
- (void)setBufferBytes:(void *)a3;
- (void)setBufferData:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setData:(id)a3;
- (void)setHasMessageUUID:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setStatusFlags:(unsigned int)a3;
@end

@implementation CUReadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setStatusFlags:(unsigned int)a3
{
  self->_statusFlags = a3;
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void)setHasMessageUUID:(BOOL)a3
{
  self->_hasMessageUUID = a3;
}

- (BOOL)hasMessageUUID
{
  return self->_hasMessageUUID;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSError)error
{
  return self->_error;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setBufferData:(id)a3
{
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (void)setBufferBytes:(void *)a3
{
  self->_bufferBytes = a3;
}

- (void)bufferBytes
{
  return self->_bufferBytes;
}

- (char)messageUUID
{
  return (char *)self->_messageUUID;
}

@end