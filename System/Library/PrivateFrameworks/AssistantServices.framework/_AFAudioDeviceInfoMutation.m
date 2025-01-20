@interface _AFAudioDeviceInfoMutation
- (BOOL)getIsRemoteDevice;
- (BOOL)isDirty;
- (_AFAudioDeviceInfoMutation)initWithBase:(id)a3;
- (id)getDeviceUID;
- (id)getRoute;
- (void)setDeviceUID:(id)a3;
- (void)setIsRemoteDevice:(BOOL)a3;
- (void)setRoute:(id)a3;
@end

@implementation _AFAudioDeviceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeviceUID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getDeviceUID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deviceUID;
  }
  else
  {
    v2 = [(AFAudioDeviceInfo *)self->_base deviceUID];
  }
  return v2;
}

- (void)setIsRemoteDevice:(BOOL)a3
{
  self->_isRemoteDevice = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsRemoteDevice
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_isRemoteDevice;
  }
  else {
    return [(AFAudioDeviceInfo *)self->_base isRemoteDevice];
  }
}

- (void)setRoute:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getRoute
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_route;
  }
  else
  {
    v2 = [(AFAudioDeviceInfo *)self->_base route];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFAudioDeviceInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioDeviceInfoMutation;
  v6 = [(_AFAudioDeviceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end