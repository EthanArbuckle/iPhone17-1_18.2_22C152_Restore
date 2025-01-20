@interface _AFCommandExecutionInfoMutation
- (BOOL)isDirty;
- (_AFCommandExecutionInfoMutation)initWithBase:(id)a3;
- (id)getCurrentHomeInfo;
- (id)getDeviceRestrictions;
- (id)getEndpointInfo;
- (id)getExecutionID;
- (id)getInstanceInfo;
- (id)getOriginPeerInfo;
- (id)getRequestHandlingContextSnapshot;
- (id)getRequestID;
- (id)getSpeechInfo;
- (id)getTurnId;
- (id)getUserInfo;
- (void)setCurrentHomeInfo:(id)a3;
- (void)setDeviceRestrictions:(id)a3;
- (void)setEndpointInfo:(id)a3;
- (void)setExecutionID:(id)a3;
- (void)setInstanceInfo:(id)a3;
- (void)setOriginPeerInfo:(id)a3;
- (void)setRequestHandlingContextSnapshot:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSpeechInfo:(id)a3;
- (void)setTurnId:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _AFCommandExecutionInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_requestHandlingContextSnapshot, 0);
  objc_storeStrong((id *)&self->_speechInfo, 0);
  objc_storeStrong((id *)&self->_instanceInfo, 0);
  objc_storeStrong((id *)&self->_endpointInfo, 0);
  objc_storeStrong((id *)&self->_currentHomeInfo, 0);
  objc_storeStrong((id *)&self->_originPeerInfo, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_executionID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setUserInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getUserInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base userInfo];
  }
  return v2;
}

- (void)setDeviceRestrictions:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getDeviceRestrictions
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_deviceRestrictions;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base deviceRestrictions];
  }
  return v2;
}

- (void)setRequestHandlingContextSnapshot:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getRequestHandlingContextSnapshot
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_requestHandlingContextSnapshot;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base requestHandlingContextSnapshot];
  }
  return v2;
}

- (void)setSpeechInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getSpeechInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_speechInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base speechInfo];
  }
  return v2;
}

- (void)setInstanceInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getInstanceInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_instanceInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base instanceInfo];
  }
  return v2;
}

- (void)setEndpointInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getEndpointInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_endpointInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base endpointInfo];
  }
  return v2;
}

- (void)setCurrentHomeInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getCurrentHomeInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_currentHomeInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base currentHomeInfo];
  }
  return v2;
}

- (void)setOriginPeerInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getOriginPeerInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_originPeerInfo;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base originPeerInfo];
  }
  return v2;
}

- (void)setTurnId:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getTurnId
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_turnId;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base turnId];
  }
  return v2;
}

- (void)setRequestID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getRequestID
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestID;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base requestID];
  }
  return v2;
}

- (void)setExecutionID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getExecutionID
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_executionID;
  }
  else
  {
    v2 = [(AFCommandExecutionInfo *)self->_base executionID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFCommandExecutionInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCommandExecutionInfoMutation;
  v6 = [(_AFCommandExecutionInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end