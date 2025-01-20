@interface _ADAudioSessionCoordinationMessageMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageMutation)initWithBase:(id)a3;
- (id)getPayloadBeginAudioSessionRequest;
- (id)getPayloadBeginAudioSessionResponse;
- (id)getPayloadEndAudioSessionRequest;
- (id)getPayloadEndAudioSessionResponse;
- (id)getPayloadKeepAudioSessionAliveRequest;
- (id)getPayloadKeepAudioSessionAliveResponse;
- (int64_t)getType;
- (unint64_t)getHostTime;
- (void)setHostTime:(unint64_t)a3;
- (void)setPayloadBeginAudioSessionRequest:(id)a3;
- (void)setPayloadBeginAudioSessionResponse:(id)a3;
- (void)setPayloadEndAudioSessionRequest:(id)a3;
- (void)setPayloadEndAudioSessionResponse:(id)a3;
- (void)setPayloadKeepAudioSessionAliveRequest:(id)a3;
- (void)setPayloadKeepAudioSessionAliveResponse:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _ADAudioSessionCoordinationMessageMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEndAudioSessionResponse, 0);
  objc_storeStrong((id *)&self->_payloadEndAudioSessionRequest, 0);
  objc_storeStrong((id *)&self->_payloadKeepAudioSessionAliveResponse, 0);
  objc_storeStrong((id *)&self->_payloadKeepAudioSessionAliveRequest, 0);
  objc_storeStrong((id *)&self->_payloadBeginAudioSessionResponse, 0);
  objc_storeStrong((id *)&self->_payloadBeginAudioSessionRequest, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setPayloadEndAudioSessionResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getPayloadEndAudioSessionResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_payloadEndAudioSessionResponse;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadEndAudioSessionResponse];
  }
  return v2;
}

- (void)setPayloadEndAudioSessionRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getPayloadEndAudioSessionRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_payloadEndAudioSessionRequest;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadEndAudioSessionRequest];
  }
  return v2;
}

- (void)setPayloadKeepAudioSessionAliveResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getPayloadKeepAudioSessionAliveResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_payloadKeepAudioSessionAliveResponse;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadKeepAudioSessionAliveResponse];
  }
  return v2;
}

- (void)setPayloadKeepAudioSessionAliveRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getPayloadKeepAudioSessionAliveRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_payloadKeepAudioSessionAliveRequest;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadKeepAudioSessionAliveRequest];
  }
  return v2;
}

- (void)setPayloadBeginAudioSessionResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getPayloadBeginAudioSessionResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_payloadBeginAudioSessionResponse;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadBeginAudioSessionResponse];
  }
  return v2;
}

- (void)setPayloadBeginAudioSessionRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getPayloadBeginAudioSessionRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_payloadBeginAudioSessionRequest;
  }
  else
  {
    v2 = [(ADAudioSessionCoordinationMessage *)self->_base payloadBeginAudioSessionRequest];
  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_type;
  }
  else {
    return [(ADAudioSessionCoordinationMessage *)self->_base type];
  }
}

- (void)setHostTime:(unint64_t)a3
{
  self->_hostTime = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getHostTime
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_hostTime;
  }
  else {
    return [(ADAudioSessionCoordinationMessage *)self->_base hostTime];
  }
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_ADAudioSessionCoordinationMessageMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADAudioSessionCoordinationMessageMutation;
  v6 = [(_ADAudioSessionCoordinationMessageMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end