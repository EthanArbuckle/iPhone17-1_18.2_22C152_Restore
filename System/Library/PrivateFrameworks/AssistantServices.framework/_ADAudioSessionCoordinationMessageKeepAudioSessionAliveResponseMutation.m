@interface _ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation)initWithBase:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation

- (void).cxx_destruct
{
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation;
  v6 = [(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end