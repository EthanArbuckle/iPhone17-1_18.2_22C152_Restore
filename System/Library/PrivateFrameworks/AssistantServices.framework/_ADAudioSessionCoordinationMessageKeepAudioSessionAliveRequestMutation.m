@interface _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (void)setExpirationDuration:(double)a3;
@end

@implementation _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation

- (void).cxx_destruct
{
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (double)getExpirationDuration
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_expirationDuration;
  }
  [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self->_base expirationDuration];
  return result;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation;
  v6 = [(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end