@interface _AFAudioPlaybackRequestMutation
- (BOOL)isDirty;
- (_AFAudioPlaybackRequestMutation)initWithBase:(id)a3;
- (double)getFadeInDuration;
- (double)getFadeOutDuration;
- (float)getVolume;
- (id)getHapticLibraryKey;
- (id)getItemData;
- (id)getItemURL;
- (id)getUUID;
- (id)getUserInfo;
- (int64_t)getNumberOfLoops;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setHapticLibraryKey:(id)a3;
- (void)setItemData:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setNumberOfLoops:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation _AFAudioPlaybackRequestMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_hapticLibraryKey, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setUUID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getUUID
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_UUID;
  }
  else
  {
    v2 = [(AFAudioPlaybackRequest *)self->_base UUID];
  }
  return v2;
}

- (void)setHapticLibraryKey:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getHapticLibraryKey
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_hapticLibraryKey;
  }
  else
  {
    v2 = [(AFAudioPlaybackRequest *)self->_base hapticLibraryKey];
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getUserInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    v2 = [(AFAudioPlaybackRequest *)self->_base userInfo];
  }
  return v2;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (double)getFadeOutDuration
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_fadeOutDuration;
  }
  [(AFAudioPlaybackRequest *)self->_base fadeOutDuration];
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (double)getFadeInDuration
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_fadeInDuration;
  }
  [(AFAudioPlaybackRequest *)self->_base fadeInDuration];
  return result;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (float)getVolume
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_volume;
  }
  [(AFAudioPlaybackRequest *)self->_base volume];
  return result;
}

- (void)setNumberOfLoops:(int64_t)a3
{
  self->_numberOfLoops = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getNumberOfLoops
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_numberOfLoops;
  }
  else {
    return [(AFAudioPlaybackRequest *)self->_base numberOfLoops];
  }
}

- (void)setItemData:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getItemData
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_itemData;
  }
  else
  {
    v2 = [(AFAudioPlaybackRequest *)self->_base itemData];
  }
  return v2;
}

- (void)setItemURL:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getItemURL
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_itemURL;
  }
  else
  {
    v2 = [(AFAudioPlaybackRequest *)self->_base itemURL];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFAudioPlaybackRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioPlaybackRequestMutation;
  v6 = [(_AFAudioPlaybackRequestMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end