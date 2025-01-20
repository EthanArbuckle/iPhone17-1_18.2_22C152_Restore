@interface _AFMediaPlaybackStateSnapshotMutation
- (BOOL)getIsProxyGroupPlayer;
- (BOOL)isDirty;
- (_AFMediaPlaybackStateSnapshotMutation)initWithBase:(id)a3;
- (id)getGroupIdentifier;
- (id)getMediaType;
- (id)getNowPlayingTimestamp;
- (int64_t)getPlaybackState;
- (void)setGroupIdentifier:(id)a3;
- (void)setIsProxyGroupPlayer:(BOOL)a3;
- (void)setMediaType:(id)a3;
- (void)setNowPlayingTimestamp:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
@end

@implementation _AFMediaPlaybackStateSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_nowPlayingTimestamp, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  self->_isProxyGroupPlayer = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsProxyGroupPlayer
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_isProxyGroupPlayer;
  }
  else {
    return [(AFMediaPlaybackStateSnapshot *)self->_base isProxyGroupPlayer];
  }
}

- (void)setGroupIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getGroupIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_groupIdentifier;
  }
  else
  {
    v2 = [(AFMediaPlaybackStateSnapshot *)self->_base groupIdentifier];
  }
  return v2;
}

- (void)setMediaType:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getMediaType
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_mediaType;
  }
  else
  {
    v2 = [(AFMediaPlaybackStateSnapshot *)self->_base mediaType];
  }
  return v2;
}

- (void)setNowPlayingTimestamp:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getNowPlayingTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_nowPlayingTimestamp;
  }
  else
  {
    v2 = [(AFMediaPlaybackStateSnapshot *)self->_base nowPlayingTimestamp];
  }
  return v2;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getPlaybackState
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_playbackState;
  }
  else {
    return [(AFMediaPlaybackStateSnapshot *)self->_base playbackState];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMediaPlaybackStateSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMediaPlaybackStateSnapshotMutation;
  v6 = [(_AFMediaPlaybackStateSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end