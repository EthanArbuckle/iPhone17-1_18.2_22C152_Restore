@interface VCSessionMessageBufferElement
- (VCControlChannelMessageProtocol)message;
- (VCSessionMessageBufferElement)initWithMessage:(id)a3 sequenceNumber:(unint64_t)a4 retryNumber:(unint64_t)a5;
- (int64_t)retryNumber;
- (int64_t)sequenceNumber;
- (void)dealloc;
@end

@implementation VCSessionMessageBufferElement

- (VCSessionMessageBufferElement)initWithMessage:(id)a3 sequenceNumber:(unint64_t)a4 retryNumber:(unint64_t)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCSessionMessageBufferElement;
  v8 = [(VCSessionMessageBufferElement *)&v10 init];
  if (v8)
  {
    v8->_message = (VCControlChannelMessageProtocol *)a3;
    v8->_sequenceNumber = a4;
    v8->_retryNumber = a5;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMessageBufferElement;
  [(VCSessionMessageBufferElement *)&v3 dealloc];
}

- (VCControlChannelMessageProtocol)message
{
  return self->_message;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)retryNumber
{
  return self->_retryNumber;
}

@end