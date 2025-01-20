@interface _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation)initWithBase:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation

- (void).cxx_destruct
{
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation;
  v6 = [(_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end