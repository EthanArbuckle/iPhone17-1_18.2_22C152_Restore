@interface DAMailboxRequest
- (DAMailboxRequest)init;
- (NSString)messageID;
- (int)bodyFormat;
- (int)requestType;
- (void)setBodyFormat:(int)a3;
- (void)setMessageID:(id)a3;
- (void)setRequestType:(int)a3;
@end

@implementation DAMailboxRequest

- (DAMailboxRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DAMailboxRequest;
  result = [(DAMailboxRequest *)&v3 init];
  if (result) {
    result->_bodyFormat = -1;
  }
  return result;
}

- (int)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int)a3
{
  self->_requestType = a3;
}

- (int)bodyFormat
{
  return self->_bodyFormat;
}

- (void)setBodyFormat:(int)a3
{
  self->_bodyFormat = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end