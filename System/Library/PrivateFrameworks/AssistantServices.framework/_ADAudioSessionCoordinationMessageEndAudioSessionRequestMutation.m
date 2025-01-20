@interface _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation)initWithBase:(id)a3;
- (id)getEffectiveDate;
- (void)setEffectiveDate:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_base, 0);
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
    v2 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self->_base effectiveDate];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation;
  v6 = [(_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end