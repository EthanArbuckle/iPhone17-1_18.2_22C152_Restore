@interface HFCameraPlaybackEngineConfiguration
- (HFCameraClipScrubbing)clipScrubber;
- (HFCameraPlaybackEngineConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4;
- (HFCameraPlaybackPosition)playbackPosition;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (NSUUID)notificationClipUUID;
- (NSUUID)notificationUUID;
- (void)assertConfigurationIsValid;
- (void)assertIsValid:(id)a3 cameraProfile:(id)a4;
- (void)setClipScrubber:(id)a3;
- (void)setNotificationClipUUID:(id)a3;
- (void)setNotificationUUID:(id)a3;
- (void)setPlaybackPosition:(id)a3;
@end

@implementation HFCameraPlaybackEngineConfiguration

- (HFCameraPlaybackEngineConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraPlaybackEngineConfiguration;
  v9 = [(HFCameraPlaybackEngineConfiguration *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(HFCameraPlaybackEngineConfiguration *)v9 assertIsValid:v7 cameraProfile:v8];
    objc_storeStrong((id *)&v10->_home, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
    uint64_t v11 = +[HFCameraPlaybackPosition livePosition];
    playbackPosition = v10->_playbackPosition;
    v10->_playbackPosition = (HFCameraPlaybackPosition *)v11;
  }
  return v10;
}

- (void)assertConfigurationIsValid
{
  if (!+[HFUtilities isInternalTest])
  {
    v4 = [(HFCameraPlaybackEngineConfiguration *)self cameraProfile];

    if (!v4)
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"HFCameraPlaybackEngineConfiguration.m" lineNumber:36 description:@"Missing camera profile"];
    }
    v5 = [(HFCameraPlaybackEngineConfiguration *)self home];

    if (!v5)
    {
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"HFCameraPlaybackEngineConfiguration.m" lineNumber:37 description:@"Missing home"];
    }
    v6 = [(HFCameraPlaybackEngineConfiguration *)self playbackPosition];

    if (!v6)
    {
      id v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"HFCameraPlaybackEngineConfiguration.m" lineNumber:38 description:@"Missing playback position"];
    }
  }
}

- (void)assertIsValid:(id)a3 cameraProfile:(id)a4
{
  if (!+[HFUtilities isInternalTest])
  {
    if (a4)
    {
      if (a3) {
        return;
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"HFCameraPlaybackEngineConfiguration.m" lineNumber:47 description:@"Missing camera profile"];

      if (a3) {
        return;
      }
    }
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HFCameraPlaybackEngineConfiguration.m" lineNumber:48 description:@"Missing home"];
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFCameraPlaybackPosition)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(id)a3
{
}

- (HFCameraClipScrubbing)clipScrubber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipScrubber);
  return (HFCameraClipScrubbing *)WeakRetained;
}

- (void)setClipScrubber:(id)a3
{
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
}

- (NSUUID)notificationClipUUID
{
  return self->_notificationClipUUID;
}

- (void)setNotificationClipUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationClipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_destroyWeak((id *)&self->_clipScrubber);
  objc_storeStrong((id *)&self->_playbackPosition, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end