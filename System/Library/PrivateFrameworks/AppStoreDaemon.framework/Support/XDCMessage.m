@interface XDCMessage
@end

@implementation XDCMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_messagePayload, 0);
}

@end