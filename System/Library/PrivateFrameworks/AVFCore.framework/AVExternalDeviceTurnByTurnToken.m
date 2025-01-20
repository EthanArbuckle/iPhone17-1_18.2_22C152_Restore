@interface AVExternalDeviceTurnByTurnToken
- (AVExternalDeviceTurnByTurnToken)init;
- (AVExternalDeviceTurnByTurnToken)initWithExternalDevice:(id)a3;
- (void)dealloc;
@end

@implementation AVExternalDeviceTurnByTurnToken

- (AVExternalDeviceTurnByTurnToken)initWithExternalDevice:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVExternalDeviceTurnByTurnToken;
  v4 = [(AVExternalDeviceTurnByTurnToken *)&v11 init];
  if (v4)
  {
    v5 = (AVExternalDevice *)a3;
    v4->_externalDevice = v5;
    if ([(AVExternalDevice *)v5 figEndpoint])
    {
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = *(void (**)(uint64_t, void, void))(v8 + 56);
      if (v9) {
        v9(CMBaseObject, *MEMORY[0x1E4F210A0], *MEMORY[0x1E4F1CFD0]);
      }
    }
  }
  return v4;
}

- (AVExternalDeviceTurnByTurnToken)init
{
  return [(AVExternalDeviceTurnByTurnToken *)self initWithExternalDevice:0];
}

- (void)dealloc
{
  if ([(AVExternalDevice *)self->_externalDevice figEndpoint])
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
  }

  v7.receiver = self;
  v7.super_class = (Class)AVExternalDeviceTurnByTurnToken;
  [(AVExternalDeviceTurnByTurnToken *)&v7 dealloc];
}

@end