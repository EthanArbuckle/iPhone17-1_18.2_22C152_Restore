@interface CBReadRequest
- (NSData)data;
- (NSError)error;
- (NSMutableData)bufferData;
- (id)completion;
- (unint64_t)length;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (void)setBufferData:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setData:(id)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
@end

@implementation CBReadRequest

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (void)setBufferData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end