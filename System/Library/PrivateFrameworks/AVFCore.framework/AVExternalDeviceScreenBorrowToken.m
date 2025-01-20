@interface AVExternalDeviceScreenBorrowToken
- (AVExternalDeviceScreenBorrowToken)init;
- (AVExternalDeviceScreenBorrowToken)initWithExternalDevice:(id)a3 client:(id)a4 reason:(id)a5;
- (NSString)client;
- (NSString)reason;
- (void)dealloc;
@end

@implementation AVExternalDeviceScreenBorrowToken

- (AVExternalDeviceScreenBorrowToken)initWithExternalDevice:(id)a3 client:(id)a4 reason:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AVExternalDeviceScreenBorrowToken;
  v8 = [(AVExternalDeviceScreenBorrowToken *)&v17 init];
  if (v8)
  {
    v8->_externalDevice = (AVExternalDevice *)a3;
    v8->_client = (NSString *)[a4 copy];
    v8->_reason = (NSString *)[a5 copy];
    uint64_t v9 = [(AVExternalDevice *)v8->_externalDevice figEndpoint];
    if (v9)
    {
      uint64_t v10 = v9;
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
        v15 = *(void (**)(uint64_t, NSString *, NSString *))(v14 + 16);
        if (v15) {
          v15(v10, client, reason);
        }
      }
    }
  }
  return v8;
}

- (AVExternalDeviceScreenBorrowToken)init
{
  return [(AVExternalDeviceScreenBorrowToken *)self initWithExternalDevice:0 client:0 reason:0];
}

- (void)dealloc
{
  v3 = [(AVExternalDevice *)self->_externalDevice figEndpoint];
  if (v3)
  {
    v4 = v3;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      client = self->_client;
      reason = self->_reason;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(void (**)(OpaqueFigEndpoint *, NSString *, NSString *))(v8 + 24);
      if (v9) {
        v9(v4, client, reason);
      }
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)AVExternalDeviceScreenBorrowToken;
  [(AVExternalDeviceScreenBorrowToken *)&v10 dealloc];
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