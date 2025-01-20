@interface HMCameraStreamPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldTakeOwnershipOfExistingStream;
- (HMCameraStreamAudioPreferences)audioPreferences;
- (HMCameraStreamPreferences)initWithAudioPreferences:(id)a3 videoPreferences:(id)a4;
- (HMCameraStreamPreferences)initWithCoder:(id)a3;
- (HMCameraStreamVideoPreferences)videoPreferences;
- (id)description;
- (int64_t)minimumRequiredAvailableOrInUseStreams;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioPreferences:(id)a3;
- (void)setMinimumRequiredAvailableOrInUseStreams:(int64_t)a3;
- (void)setShouldTakeOwnershipOfExistingStream:(BOOL)a3;
- (void)setVideoPreferences:(id)a3;
@end

@implementation HMCameraStreamPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPreferences, 0);

  objc_storeStrong((id *)&self->_audioPreferences, 0);
}

- (void)setShouldTakeOwnershipOfExistingStream:(BOOL)a3
{
  self->_shouldTakeOwnershipOfExistingStream = a3;
}

- (BOOL)shouldTakeOwnershipOfExistingStream
{
  return self->_shouldTakeOwnershipOfExistingStream;
}

- (void)setMinimumRequiredAvailableOrInUseStreams:(int64_t)a3
{
  self->_minimumRequiredAvailableOrInUseStreams = a3;
}

- (int64_t)minimumRequiredAvailableOrInUseStreams
{
  return self->_minimumRequiredAvailableOrInUseStreams;
}

- (void)setVideoPreferences:(id)a3
{
}

- (HMCameraStreamVideoPreferences)videoPreferences
{
  return (HMCameraStreamVideoPreferences *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAudioPreferences:(id)a3
{
}

- (HMCameraStreamAudioPreferences)audioPreferences
{
  return (HMCameraStreamAudioPreferences *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  v3 = [(HMCameraStreamPreferences *)self audioPreferences];
  uint64_t v4 = [v3 hash];

  v5 = [(HMCameraStreamPreferences *)self videoPreferences];
  uint64_t v6 = [v5 hash] ^ v4;

  int64_t v7 = v6 ^ [(HMCameraStreamPreferences *)self minimumRequiredAvailableOrInUseStreams];
  return v7 ^ [(HMCameraStreamPreferences *)self shouldTakeOwnershipOfExistingStream];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_9;
  }
  int64_t v7 = [(HMCameraStreamPreferences *)self audioPreferences];
  v8 = [v6 audioPreferences];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_9;
  }
  v10 = [(HMCameraStreamPreferences *)self videoPreferences];
  v11 = [v6 videoPreferences];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_9;
  }
  int64_t v13 = [(HMCameraStreamPreferences *)self minimumRequiredAvailableOrInUseStreams];
  if (v13 == [v6 minimumRequiredAvailableOrInUseStreams])
  {
    BOOL v14 = [(HMCameraStreamPreferences *)self shouldTakeOwnershipOfExistingStream];
    int v15 = v14 ^ [v6 shouldTakeOwnershipOfExistingStream] ^ 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMCameraStreamPreferences *)self audioPreferences];
  [v6 encodeObject:v4 forKey:@"HM.CameraStreamAudioPreferences"];

  v5 = [(HMCameraStreamPreferences *)self videoPreferences];
  [v6 encodeObject:v5 forKey:@"HM.CameraStreamVideoPreferences"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMCameraStreamPreferences minimumRequiredAvailableOrInUseStreams](self, "minimumRequiredAvailableOrInUseStreams"), @"HMCameraStreamMinimumRequiredAvailableOrInUseStreams");
  objc_msgSend(v6, "encodeBool:forKey:", -[HMCameraStreamPreferences shouldTakeOwnershipOfExistingStream](self, "shouldTakeOwnershipOfExistingStream"), @"HM.CameraStreamShouldTakeOwnershipOfExistingStream");
}

- (HMCameraStreamPreferences)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamPreferences;
  id v3 = a3;
  id v4 = [(HMCameraStreamPreferences *)&v9 init];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"HM.CameraStreamAudioPreferences", v9.receiver, v9.super_class);
  [(HMCameraStreamPreferences *)v4 setAudioPreferences:v5];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.CameraStreamVideoPreferences"];
  [(HMCameraStreamPreferences *)v4 setVideoPreferences:v6];

  -[HMCameraStreamPreferences setMinimumRequiredAvailableOrInUseStreams:](v4, "setMinimumRequiredAvailableOrInUseStreams:", [v3 decodeIntegerForKey:@"HMCameraStreamMinimumRequiredAvailableOrInUseStreams"]);
  uint64_t v7 = [v3 decodeBoolForKey:@"HM.CameraStreamShouldTakeOwnershipOfExistingStream"];

  [(HMCameraStreamPreferences *)v4 setShouldTakeOwnershipOfExistingStream:v7];
  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(HMCameraStreamPreferences *)self videoPreferences];
  v5 = [(HMCameraStreamPreferences *)self audioPreferences];
  int64_t v6 = [(HMCameraStreamPreferences *)self minimumRequiredAvailableOrInUseStreams];
  [(HMCameraStreamPreferences *)self shouldTakeOwnershipOfExistingStream];
  uint64_t v7 = HMFBooleanToString();
  v8 = [v3 stringWithFormat:@"<HMCameraStreamPreferences Video Preferences: %@, Audio Preferences: %@, Minimum Required Available Or In-Use Streams: %ld, Should Take Ownership: %@", v4, v5, v6, v7];

  return v8;
}

- (HMCameraStreamPreferences)initWithAudioPreferences:(id)a3 videoPreferences:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamPreferences;
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMCameraStreamPreferences *)&v9 init];
  -[HMCameraStreamPreferences setAudioPreferences:](v7, "setAudioPreferences:", v6, v9.receiver, v9.super_class);

  [(HMCameraStreamPreferences *)v7 setVideoPreferences:v5];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end