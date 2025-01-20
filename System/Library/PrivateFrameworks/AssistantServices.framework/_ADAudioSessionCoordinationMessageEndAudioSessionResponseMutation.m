@interface _ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation)initWithBase:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation

- (void).cxx_destruct
{
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation;
  v6 = [(_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end