@interface ADAnnounceIncomingCallRequest
- (ADAnnounceIncomingCallRequest)initWithCall:(id)a3 completion:(id)a4;
- (AFSiriIncomingCall)call;
- (void)setCall:(id)a3;
@end

@implementation ADAnnounceIncomingCallRequest

- (void).cxx_destruct
{
}

- (void)setCall:(id)a3
{
}

- (AFSiriIncomingCall)call
{
  return self->_call;
}

- (ADAnnounceIncomingCallRequest)initWithCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADAnnounceIncomingCallRequest;
  v7 = [(ADAnnouncementRequest *)&v11 initWithAnnouncementRequestType:2 platform:1 completion:a4];
  if (v7)
  {
    v8 = (AFSiriIncomingCall *)[v6 copy];
    call = v7->_call;
    v7->_call = v8;
  }
  return v7;
}

@end