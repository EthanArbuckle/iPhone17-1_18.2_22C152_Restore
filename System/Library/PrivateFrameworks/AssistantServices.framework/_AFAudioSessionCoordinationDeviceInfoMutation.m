@interface _AFAudioSessionCoordinationDeviceInfoMutation
- (BOOL)isDirty;
- (_AFAudioSessionCoordinationDeviceInfoMutation)initWithBase:(id)a3;
- (id)getPeerInfo;
- (id)getSystemInfo;
- (void)setPeerInfo:(id)a3;
- (void)setSystemInfo:(id)a3;
@end

@implementation _AFAudioSessionCoordinationDeviceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSystemInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getSystemInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_systemInfo;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationDeviceInfo *)self->_base systemInfo];
  }
  return v2;
}

- (void)setPeerInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getPeerInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_peerInfo;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationDeviceInfo *)self->_base peerInfo];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFAudioSessionCoordinationDeviceInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationDeviceInfoMutation;
  v6 = [(_AFAudioSessionCoordinationDeviceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end