@interface AVHomeIPCameraPlayerController
- (AVHomeIPCameraActionButtonHandling)delegate;
- (BOOL)hasContent;
- (BOOL)hasEnabledAudio;
- (BOOL)hasEnabledVideo;
- (BOOL)hasLiveStreamingContent;
- (BOOL)hasSeekableLiveStreamingContent;
- (BOOL)isMuted;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPlaying;
- (CGSize)presentationSize;
- (double)volume;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (void)setDelegate:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPresentationSize:(CGSize)a3;
- (void)setVolume:(double)a3;
- (void)togglePlaybackEvenWhenInBackground:(id)a3;
@end

@implementation AVHomeIPCameraPlayerController

- (void).cxx_destruct
{
}

- (BOOL)isMuted
{
  return LOBYTE(self->_volume);
}

- (void)setPresentationSize:(CGSize)a3
{
  *(CGSize *)&self->_delegate = a3;
}

- (CGSize)presentationSize
{
  delegate = self->_delegate;
  double width = self->_presentationSize.width;
  result.height = width;
  result.double width = *(double *)&delegate;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (AVHomeIPCameraActionButtonHandling)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_muted);

  return (AVHomeIPCameraActionButtonHandling *)WeakRetained;
}

- (BOOL)isPlaying
{
  return 1;
}

- (void)setMuted:(BOOL)a3
{
  if (LOBYTE(self->_volume) != a3)
  {
    BOOL v3 = a3;
    LOBYTE(self->_volume) = a3;
    id v4 = [(AVHomeIPCameraPlayerController *)self delegate];
    [v4 playbackControlsDidToggleMuted:v3];
  }
}

- (void)setVolume:(double)a3
{
  if (*(double *)&self->super._seekToTimeInternal.epoch != a3)
  {
    *(double *)&self->super._seekToTimeInternal.epoch = a3;
    v7.receiver = self;
    v7.super_class = (Class)AVHomeIPCameraPlayerController;
    [(AVPlayerController *)&v7 setVolume:a3];
    v5 = [(AVHomeIPCameraPlayerController *)self delegate];
    *(float *)&double v6 = a3;
    [v5 playbackControlsDidChangePlayerVolume:v6];
  }
}

- (double)volume
{
  return *(double *)&self->super._seekToTimeInternal.epoch;
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  id v3 = [(AVHomeIPCameraPlayerController *)self delegate];
  [v3 pictureInPictureActionButtonTapped];
}

- (int64_t)timeControlStatus
{
  return 2;
}

- (int64_t)status
{
  return 2;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (BOOL)hasLiveStreamingContent
{
  return 1;
}

- (BOOL)hasEnabledVideo
{
  return 1;
}

- (BOOL)hasEnabledAudio
{
  return 1;
}

- (BOOL)isPictureInPicturePossible
{
  return 1;
}

- (BOOL)hasContent
{
  return 1;
}

@end