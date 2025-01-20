@interface HFMediaActionSetting
- (HFMediaActionSetting)initWithActionBuilder:(id)a3;
- (HFMediaPlaybackActionBuilder)mediaActionBuilder;
- (HFPlaybackArchive)playbackArchive;
- (int64_t)originalHMNonPausePlaybackState;
- (void)setOriginalHMNonPausePlaybackState:(int64_t)a3;
- (void)setPlaybackArchive:(id)a3;
- (void)updatePlaybackState:(int64_t)a3;
@end

@implementation HFMediaActionSetting

- (HFMediaActionSetting)initWithActionBuilder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMediaActionSetting;
  v6 = [(HFMediaActionSetting *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaActionBuilder, a3);
    if ([v5 targetPlayState] != 2)
    {
      v7->_originalHMNonPausePlaybackState = [v5 targetPlayState];
      v8 = [v5 playbackArchive];
      goto LABEL_6;
    }
    v7->_originalHMNonPausePlaybackState = 1;
    if (!+[HFUtilities isAMac])
    {
      v8 = [[HFPlaybackArchive alloc] initWithMediaPlayerPlaybackArchive:0];
LABEL_6:
      playbackArchive = v7->_playbackArchive;
      v7->_playbackArchive = v8;
    }
  }

  return v7;
}

- (void)updatePlaybackState:(int64_t)a3
{
  if (a3 != 2)
  {
    -[HFMediaActionSetting setOriginalHMNonPausePlaybackState:](self, "setOriginalHMNonPausePlaybackState:");
    id v6 = [(HFMediaActionSetting *)self mediaActionBuilder];
    id v5 = [v6 playbackArchive];
    [(HFMediaActionSetting *)self setPlaybackArchive:v5];
  }
}

- (HFMediaPlaybackActionBuilder)mediaActionBuilder
{
  return self->_mediaActionBuilder;
}

- (int64_t)originalHMNonPausePlaybackState
{
  return self->_originalHMNonPausePlaybackState;
}

- (void)setOriginalHMNonPausePlaybackState:(int64_t)a3
{
  self->_originalHMNonPausePlaybackState = a3;
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaActionBuilder, 0);
}

@end