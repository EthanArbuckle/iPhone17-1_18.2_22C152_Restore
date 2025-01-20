@interface AVOutputDeviceTurnByTurnToken
- (AVOutputDeviceTurnByTurnToken)init;
- (AVOutputDeviceTurnByTurnToken)initWithEndpoint:(OpaqueFigEndpoint *)a3;
- (void)dealloc;
@end

@implementation AVOutputDeviceTurnByTurnToken

- (AVOutputDeviceTurnByTurnToken)initWithEndpoint:(OpaqueFigEndpoint *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVOutputDeviceTurnByTurnToken;
  v4 = [(AVOutputDeviceTurnByTurnToken *)&v12 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = (OpaqueFigEndpoint *)CFRetain(a3);
      v5->_endpoint = v6;
      if (v6)
      {
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        v10 = *(void (**)(uint64_t, void, void))(v9 + 56);
        if (v10) {
          v10(CMBaseObject, *MEMORY[0x1E4F210A0], *MEMORY[0x1E4F1CFD0]);
        }
      }
    }
    else
    {
      v4->_endpoint = 0;
    }
  }
  return v5;
}

- (AVOutputDeviceTurnByTurnToken)init
{
  return [(AVOutputDeviceTurnByTurnToken *)self initWithEndpoint:0];
}

- (void)dealloc
{
  if (self->_endpoint)
  {
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(void (**)(uint64_t, void, void))(v5 + 56);
    if (v6) {
      v6(CMBaseObject, *MEMORY[0x1E4F210A0], *MEMORY[0x1E4F1CFC8]);
    }
    endpoint = self->_endpoint;
    if (endpoint) {
      CFRelease(endpoint);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceTurnByTurnToken;
  [(AVOutputDeviceTurnByTurnToken *)&v8 dealloc];
}

@end