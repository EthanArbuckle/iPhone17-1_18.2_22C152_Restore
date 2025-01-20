@interface FigCaptureMachPortSendRight
- (FigCaptureMachPortSendRight)initWithPort:(unsigned int)a3;
- (id)description;
- (unsigned)port;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FigCaptureMachPortSendRight

- (void)dealloc
{
  [(FigCaptureMachPortSendRight *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMachPortSendRight;
  [(FigCaptureMachPortSendRight *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalid && self->_port + 1 >= 2)
  {
    FigMachPortReleaseSendRight_();
    self->_port = 0;
    self->_invalid = 1;
  }
}

- (unsigned)port
{
  return self->_port;
}

- (FigCaptureMachPortSendRight)initWithPort:(unsigned int)a3
{
  if (a3 - 1 >= 0xFFFFFFFE)
  {

    return 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FigCaptureMachPortSendRight;
    result = [(FigCaptureMachPortSendRight *)&v5 init];
    if (result) {
      result->_port = a3;
    }
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"port=%d", self->_port);
}

@end