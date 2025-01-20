@interface HUCameraPlayerConfiguration
- (AVPlayerViewController)playerViewController;
- (BOOL)isConfiguredForLiveStream;
- (HFCameraPlaybackEngine)playbackEngine;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (HUCameraPlayerConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4 notificationUUID:(id)a5 clipUUID:(id)a6;
- (NSDate)startingPlaybackDate;
- (NSUUID)clipUUID;
- (NSUUID)notificationUUID;
- (id)description;
- (void)setPlaybackEngine:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setStartingPlaybackDate:(id)a3;
@end

@implementation HUCameraPlayerConfiguration

- (HUCameraPlayerConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4 notificationUUID:(id)a5 clipUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HUCameraPlayerConfiguration;
  v15 = [(HUCameraPlayerConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_home, a3);
    objc_storeStrong((id *)&v16->_cameraProfile, a4);
    objc_storeStrong((id *)&v16->_notificationUUID, a5);
    objc_storeStrong((id *)&v16->_clipUUID, a6);
  }

  return v16;
}

- (BOOL)isConfiguredForLiveStream
{
  v3 = [(HUCameraPlayerConfiguration *)self cameraProfile];
  if (objc_msgSend(v3, "hf_supportsRecordingEvents"))
  {
    v4 = [(HUCameraPlayerConfiguration *)self startingPlaybackDate];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HUCameraPlayerConfiguration *)self cameraProfile];
  BOOL v5 = [v4 uniqueIdentifier];
  v6 = [(HUCameraPlayerConfiguration *)self cameraProfile];
  v7 = [v6 accessory];
  v8 = [v7 name];
  v9 = [(HUCameraPlayerConfiguration *)self startingPlaybackDate];
  v10 = [(HUCameraPlayerConfiguration *)self notificationUUID];
  id v11 = [(HUCameraPlayerConfiguration *)self clipUUID];
  id v12 = [v3 stringWithFormat:@"\nHUCameraPlayerConfiguration:\nCamera Profile:%@/%@\nStarting PlaybackDate:%@\nNotificationUUID:%@\nClipUUID:%@", v5, v8, v9, v10, v11];

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (NSUUID)clipUUID
{
  return self->_clipUUID;
}

- (NSDate)startingPlaybackDate
{
  return self->_startingPlaybackDate;
}

- (void)setStartingPlaybackDate:(id)a3
{
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_startingPlaybackDate, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end