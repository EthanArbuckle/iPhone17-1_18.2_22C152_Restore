@interface _AFServiceDeviceContextMutation
- (BOOL)isDirty;
- (_AFServiceDeviceContextMutation)initWithBase:(id)a3;
- (id)getAssistantIdentifier;
- (id)getIdentifier;
- (id)getMediaRouteIdentifier;
- (id)getMediaSystemIdentifier;
- (id)getMetricsContext;
- (id)getRoomName;
- (id)getSerializedContextByKey;
- (id)getSharedUserID;
- (int64_t)getProximity;
- (void)setAssistantIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setMetricsContext:(id)a3;
- (void)setProximity:(int64_t)a3;
- (void)setRoomName:(id)a3;
- (void)setSerializedContextByKey:(id)a3;
- (void)setSharedUserID:(id)a3;
@end

@implementation _AFServiceDeviceContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsContext, 0);
  objc_storeStrong((id *)&self->_serializedContextByKey, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMetricsContext:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getMetricsContext
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_metricsContext;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base metricsContext];
  }
  return v2;
}

- (void)setSerializedContextByKey:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getSerializedContextByKey
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_serializedContextByKey;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base serializedContextByKey];
  }
  return v2;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (int64_t)getProximity
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_proximity;
  }
  else {
    return [(AFServiceDeviceContext *)self->_base proximity];
  }
}

- (void)setRoomName:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getRoomName
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base roomName];
  }
  return v2;
}

- (void)setSharedUserID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSharedUserID
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_sharedUserID;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base sharedUserID];
  }
  return v2;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getMediaRouteIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_mediaRouteIdentifier;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base mediaRouteIdentifier];
  }
  return v2;
}

- (void)setMediaSystemIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getMediaSystemIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_mediaSystemIdentifier;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base mediaSystemIdentifier];
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAssistantIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base assistantIdentifier];
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    v2 = [(AFServiceDeviceContext *)self->_base identifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFServiceDeviceContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFServiceDeviceContextMutation;
  v6 = [(_AFServiceDeviceContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end