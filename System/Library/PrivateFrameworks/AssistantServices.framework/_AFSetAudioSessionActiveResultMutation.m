@interface _AFSetAudioSessionActiveResultMutation
- (BOOL)isDirty;
- (_AFSetAudioSessionActiveResultMutation)initWithBase:(id)a3;
- (id)getError;
- (unsigned)getAudioSessionID;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setError:(id)a3;
@end

@implementation _AFSetAudioSessionActiveResultMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setError:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getError
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_error;
  }
  else
  {
    v2 = [(AFSetAudioSessionActiveResult *)self->_base error];
  }
  return v2;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unsigned)getAudioSessionID
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_audioSessionID;
  }
  else {
    return [(AFSetAudioSessionActiveResult *)self->_base audioSessionID];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSetAudioSessionActiveResultMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSetAudioSessionActiveResultMutation;
  v6 = [(_AFSetAudioSessionActiveResultMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end