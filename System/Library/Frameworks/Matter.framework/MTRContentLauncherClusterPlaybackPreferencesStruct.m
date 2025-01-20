@interface MTRContentLauncherClusterPlaybackPreferencesStruct
- (MTRContentLauncherClusterPlaybackPreferencesStruct)init;
- (MTRContentLauncherClusterTrackPreferenceStruct)textTrack;
- (NSArray)audioTracks;
- (NSNumber)playbackPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioTracks:(id)a3;
- (void)setPlaybackPosition:(id)a3;
- (void)setTextTrack:(id)a3;
@end

@implementation MTRContentLauncherClusterPlaybackPreferencesStruct

- (MTRContentLauncherClusterPlaybackPreferencesStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRContentLauncherClusterPlaybackPreferencesStruct;
  v2 = [(MTRContentLauncherClusterPlaybackPreferencesStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    playbackPosition = v2->_playbackPosition;
    v2->_playbackPosition = (NSNumber *)&unk_26F9C8620;

    uint64_t v5 = objc_opt_new();
    textTrack = v3->_textTrack;
    v3->_textTrack = (MTRContentLauncherClusterTrackPreferenceStruct *)v5;

    audioTracks = v3->_audioTracks;
    v3->_audioTracks = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterPlaybackPreferencesStruct);
  v7 = objc_msgSend_playbackPosition(self, v5, v6);
  objc_msgSend_setPlaybackPosition_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_textTrack(self, v9, v10);
  objc_msgSend_setTextTrack_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_audioTracks(self, v13, v14);
  objc_msgSend_setAudioTracks_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: playbackPosition:%@; textTrack:%@; audioTracks:%@; >",
    v5,
    self->_playbackPosition,
    self->_textTrack,
  v7 = self->_audioTracks);

  return v7;
}

- (NSNumber)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(id)a3
{
}

- (MTRContentLauncherClusterTrackPreferenceStruct)textTrack
{
  return self->_textTrack;
}

- (void)setTextTrack:(id)a3
{
}

- (NSArray)audioTracks
{
  return self->_audioTracks;
}

- (void)setAudioTracks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTracks, 0);
  objc_storeStrong((id *)&self->_textTrack, 0);

  objc_storeStrong((id *)&self->_playbackPosition, 0);
}

@end