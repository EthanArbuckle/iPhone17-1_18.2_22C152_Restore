@interface _AFAudioSessionCoordinationSnapshotMutation
- (BOOL)getIsAudioSessionActive;
- (BOOL)isDirty;
- (_AFAudioSessionCoordinationSnapshotMutation)initWithBase:(id)a3;
- (id)getCurrentOrUpNextDateInterval;
- (id)getLocalActiveAssertionContexts;
- (id)getLocalDevice;
- (id)getLocalPendingAssertionContexts;
- (id)getRemoteActiveAssertionContexts;
- (id)getRemoteDisqualifiedDevices;
- (id)getRemotePendingAssertionContexts;
- (id)getRemoteQualifiedInRangeDevices;
- (id)getRemoteQualifiedOutOfRangeDevices;
- (void)setCurrentOrUpNextDateInterval:(id)a3;
- (void)setIsAudioSessionActive:(BOOL)a3;
- (void)setLocalActiveAssertionContexts:(id)a3;
- (void)setLocalDevice:(id)a3;
- (void)setLocalPendingAssertionContexts:(id)a3;
- (void)setRemoteActiveAssertionContexts:(id)a3;
- (void)setRemoteDisqualifiedDevices:(id)a3;
- (void)setRemotePendingAssertionContexts:(id)a3;
- (void)setRemoteQualifiedInRangeDevices:(id)a3;
- (void)setRemoteQualifiedOutOfRangeDevices:(id)a3;
@end

@implementation _AFAudioSessionCoordinationSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisqualifiedDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedOutOfRangeDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedInRangeDevices, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_remotePendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_remoteActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localPendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setRemoteDisqualifiedDevices:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getRemoteDisqualifiedDevices
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_remoteDisqualifiedDevices;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base remoteDisqualifiedDevices];
  }
  return v2;
}

- (void)setRemoteQualifiedOutOfRangeDevices:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getRemoteQualifiedOutOfRangeDevices
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_remoteQualifiedOutOfRangeDevices;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base remoteQualifiedOutOfRangeDevices];
  }
  return v2;
}

- (void)setRemoteQualifiedInRangeDevices:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getRemoteQualifiedInRangeDevices
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_remoteQualifiedInRangeDevices;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base remoteQualifiedInRangeDevices];
  }
  return v2;
}

- (void)setLocalDevice:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getLocalDevice
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_localDevice;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base localDevice];
  }
  return v2;
}

- (void)setRemotePendingAssertionContexts:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getRemotePendingAssertionContexts
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_remotePendingAssertionContexts;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base remotePendingAssertionContexts];
  }
  return v2;
}

- (void)setRemoteActiveAssertionContexts:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getRemoteActiveAssertionContexts
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_remoteActiveAssertionContexts;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base remoteActiveAssertionContexts];
  }
  return v2;
}

- (void)setLocalPendingAssertionContexts:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getLocalPendingAssertionContexts
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_localPendingAssertionContexts;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base localPendingAssertionContexts];
  }
  return v2;
}

- (void)setLocalActiveAssertionContexts:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getLocalActiveAssertionContexts
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_localActiveAssertionContexts;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base localActiveAssertionContexts];
  }
  return v2;
}

- (void)setIsAudioSessionActive:(BOOL)a3
{
  self->_isAudioSessionActive = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsAudioSessionActive
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_isAudioSessionActive;
  }
  else {
    return [(AFAudioSessionCoordinationSnapshot *)self->_base isAudioSessionActive];
  }
}

- (void)setCurrentOrUpNextDateInterval:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getCurrentOrUpNextDateInterval
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_currentOrUpNextDateInterval;
  }
  else
  {
    v2 = [(AFAudioSessionCoordinationSnapshot *)self->_base currentOrUpNextDateInterval];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFAudioSessionCoordinationSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationSnapshotMutation;
  v6 = [(_AFAudioSessionCoordinationSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end