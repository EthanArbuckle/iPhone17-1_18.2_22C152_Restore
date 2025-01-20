@interface _AFAudioSessionCoordinationSystemInfoMutation
- (BOOL)getIsSupportedAndEnabled;
- (BOOL)isDirty;
- (_AFAudioSessionCoordinationSystemInfoMutation)initWithBase:(id)a3;
- (id)getHomeKitMediaSystemIdentifier;
- (id)getHomeKitRoomName;
- (id)getMediaRemoteGroupIdentifier;
- (id)getMediaRemoteRouteIdentifier;
- (void)setHomeKitMediaSystemIdentifier:(id)a3;
- (void)setHomeKitRoomName:(id)a3;
- (void)setIsSupportedAndEnabled:(BOOL)a3;
- (void)setMediaRemoteGroupIdentifier:(id)a3;
- (void)setMediaRemoteRouteIdentifier:(id)a3;
@end

@implementation _AFAudioSessionCoordinationSystemInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitRoomName, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMediaRemoteRouteIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getMediaRemoteRouteIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_mediaRemoteRouteIdentifier;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSystemInfo *)self->_base mediaRemoteRouteIdentifier];
  }
  return v2;
}

- (void)setMediaRemoteGroupIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getMediaRemoteGroupIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_mediaRemoteGroupIdentifier;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSystemInfo *)self->_base mediaRemoteGroupIdentifier];
  }
  return v2;
}

- (void)setHomeKitMediaSystemIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getHomeKitMediaSystemIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_homeKitMediaSystemIdentifier;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSystemInfo *)self->_base homeKitMediaSystemIdentifier];
  }
  return v2;
}

- (void)setHomeKitRoomName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getHomeKitRoomName
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_homeKitRoomName;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSystemInfo *)self->_base homeKitRoomName];
  }
  return v2;
}

- (void)setIsSupportedAndEnabled:(BOOL)a3
{
  self->_isSupportedAndEnabled = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsSupportedAndEnabled
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_isSupportedAndEnabled;
  }
  else {
    return [(AFAudioSessionCoordinationSystemInfo *)self->_base isSupportedAndEnabled];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFAudioSessionCoordinationSystemInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationSystemInfoMutation;
  v6 = [(_AFAudioSessionCoordinationSystemInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end