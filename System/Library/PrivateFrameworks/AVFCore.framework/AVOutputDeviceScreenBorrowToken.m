@interface AVOutputDeviceScreenBorrowToken
- (AVOutputDeviceScreenBorrowToken)init;
- (AVOutputDeviceScreenBorrowToken)initWithEndpoint:(OpaqueFigEndpoint *)a3 client:(id)a4 reason:(id)a5;
- (NSString)client;
- (NSString)reason;
- (void)dealloc;
@end

@implementation AVOutputDeviceScreenBorrowToken

- (AVOutputDeviceScreenBorrowToken)initWithEndpoint:(OpaqueFigEndpoint *)a3 client:(id)a4 reason:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AVOutputDeviceScreenBorrowToken;
  v8 = [(AVOutputDeviceScreenBorrowToken *)&v17 init];
  if (v8)
  {
    v9 = a3 ? (OpaqueFigEndpoint *)CFRetain(a3) : 0;
    v8->_endpoint = v9;
    v8->_client = (NSString *)[a4 copy];
    v8->_reason = (NSString *)[a5 copy];
    endpoint = v8->_endpoint;
    if (endpoint)
    {
      FigEndpointExtendedGetClassID();
      if (CMBaseObjectIsMemberOfClass())
      {
        client = v8->_client;
        reason = v8->_reason;
        uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 24);
        if (v13) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        v15 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(v14 + 16);
        if (v15) {
          v15(endpoint, client, reason);
        }
      }
    }
  }
  return v8;
}

- (AVOutputDeviceScreenBorrowToken)init
{
  return [(AVOutputDeviceScreenBorrowToken *)self initWithEndpoint:0 client:0 reason:0];
}

- (void)dealloc
{
  endpoint = self->_endpoint;
  if (endpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      client = self->_client;
      reason = self->_reason;
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v7 = v6 ? v6 : 0;
      v8 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(v7 + 24);
      if (v8) {
        v8(endpoint, client, reason);
      }
    }
    v9 = self->_endpoint;
    if (v9) {
      CFRelease(v9);
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)AVOutputDeviceScreenBorrowToken;
  [(AVOutputDeviceScreenBorrowToken *)&v10 dealloc];
}

- (NSString)client
{
  return self->_client;
}

- (NSString)reason
{
  return self->_reason;
}

@end