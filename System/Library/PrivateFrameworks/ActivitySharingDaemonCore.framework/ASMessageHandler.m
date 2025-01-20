@interface ASMessageHandler
- (Class)protobufClass;
- (SEL)handleErrorSendingMessageAction;
- (SEL)handleReceiveMessageAction;
- (void)setHandleErrorSendingMessageAction:(SEL)a3;
- (void)setHandleReceiveMessageAction:(SEL)a3;
- (void)setProtobufClass:(Class)a3;
@end

@implementation ASMessageHandler

- (Class)protobufClass
{
  return self->_protobufClass;
}

- (void)setProtobufClass:(Class)a3
{
  self->_protobufClass = a3;
}

- (SEL)handleReceiveMessageAction
{
  if (self->_handleReceiveMessageAction) {
    return self->_handleReceiveMessageAction;
  }
  else {
    return 0;
  }
}

- (void)setHandleReceiveMessageAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_handleReceiveMessageAction = v3;
}

- (SEL)handleErrorSendingMessageAction
{
  if (self->_handleErrorSendingMessageAction) {
    return self->_handleErrorSendingMessageAction;
  }
  else {
    return 0;
  }
}

- (void)setHandleErrorSendingMessageAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_handleErrorSendingMessageAction = v3;
}

@end