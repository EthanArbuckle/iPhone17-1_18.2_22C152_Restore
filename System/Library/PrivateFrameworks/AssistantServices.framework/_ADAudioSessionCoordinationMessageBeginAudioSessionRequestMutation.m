@interface _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (id)getEffectiveDate;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDuration:(double)a3;
@end

@implementation _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (double)getExpirationDuration
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_expirationDuration;
  }
  [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self->_base expirationDuration];
  return result;
}

- (void)setEffectiveDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getEffectiveDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_effectiveDate;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self->_base effectiveDate];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation;
  v6 = [(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end