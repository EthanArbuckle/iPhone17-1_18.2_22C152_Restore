@interface HMDMediaSessionState
- (BOOL)isEqual:(id)a3;
- (HMDMediaSessionState)initWithSessionIdentifier:(id)a3;
- (NSNumber)muted;
- (NSNumber)volume;
- (NSString)description;
- (NSString)mediaUniqueIdentifier;
- (NSString)sessionIdentifier;
- (id)dumpState;
- (int64_t)playbackState;
- (int64_t)repeatState;
- (int64_t)shuffleState;
- (unint64_t)hash;
- (unint64_t)sleepWakeState;
- (void)setMediaUniqueIdentifier:(id)a3;
- (void)setMuted:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setRepeatState:(int64_t)a3;
- (void)setShuffleState:(int64_t)a3;
- (void)setSleepWakeState:(unint64_t)a3;
- (void)setVolume:(id)a3;
@end

@implementation HMDMediaSessionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_muted, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)dumpState
{
  v3 = NSString;
  v4 = [(HMDMediaSessionState *)self sessionIdentifier];
  [(HMDMediaSessionState *)self playbackState];
  v5 = playbackStateAsString();
  unint64_t v6 = [(HMDMediaSessionState *)self shuffleState] - 1;
  if (v6 > 2) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_264A21778[v6];
  }
  unint64_t v8 = [(HMDMediaSessionState *)self repeatState] - 1;
  if (v8 > 2) {
    v9 = @"Unknown";
  }
  else {
    v9 = off_264A21790[v8];
  }
  v10 = [(HMDMediaSessionState *)self volume];
  v11 = [(HMDMediaSessionState *)self mediaUniqueIdentifier];
  v12 = [v3 stringWithFormat:@"MediaSession state sessionIdentifier: %@, Playback state: %@, Shuffle state: %@, Repeat state: %@, Volume: %@, Media identifier: %@", v4, v5, v7, v9, v10, v11];

  v13 = [NSDictionary dictionaryWithObject:v12 forKey:*MEMORY[0x263F41FA8]];

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDMediaSessionState *)self sessionIdentifier];
  [(HMDMediaSessionState *)self playbackState];
  v5 = playbackStateAsString();
  unint64_t v6 = [(HMDMediaSessionState *)self shuffleState] - 1;
  if (v6 > 2) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_264A21778[v6];
  }
  unint64_t v8 = [(HMDMediaSessionState *)self repeatState] - 1;
  if (v8 > 2) {
    v9 = @"Unknown";
  }
  else {
    v9 = off_264A21790[v8];
  }
  v10 = [(HMDMediaSessionState *)self volume];
  v11 = [(HMDMediaSessionState *)self mediaUniqueIdentifier];
  v12 = [v3 stringWithFormat:@"[HMDMediaSessionState sessionIdentifier: %@, Playback state: %@, Shuffle state: %@, Repeat state: %@, Volume: %@, Media identifier: %@]", v4, v5, v7, v9, v10, v11];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMediaSessionState *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    unint64_t v6 = v5;
    if (!v6) {
      goto LABEL_12;
    }
    v7 = [(HMDMediaSessionState *)self sessionIdentifier];
    unint64_t v8 = [(HMDMediaSessionState *)v6 sessionIdentifier];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_12;
    }
    int64_t v10 = [(HMDMediaSessionState *)self playbackState];
    if (v10 == [(HMDMediaSessionState *)v6 playbackState]
      && (int64_t v11 = [(HMDMediaSessionState *)self shuffleState],
          v11 == [(HMDMediaSessionState *)v6 shuffleState])
      && (int64_t v12 = [(HMDMediaSessionState *)self repeatState],
          v12 == [(HMDMediaSessionState *)v6 repeatState]))
    {
      v13 = [(HMDMediaSessionState *)self volume];
      [v13 floatValue];
      float v15 = v14;
      v16 = [(HMDMediaSessionState *)v6 volume];
      [v16 floatValue];
      if (vabds_f32(v15, v17) >= *MEMORY[0x263F0E928])
      {
        char v20 = 0;
      }
      else
      {
        v18 = [(HMDMediaSessionState *)self mediaUniqueIdentifier];
        v19 = [(HMDMediaSessionState *)v6 mediaUniqueIdentifier];
        char v20 = [v18 isEqual:v19];
      }
    }
    else
    {
LABEL_12:
      char v20 = 0;
    }
  }
  return v20;
}

- (unint64_t)hash
{
  v2 = [(HMDMediaSessionState *)self sessionIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setSleepWakeState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_sleepWakeState != a3) {
    self->_sleepWakeState = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)sleepWakeState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t sleepWakeState = self->_sleepWakeState;
  os_unfair_lock_unlock(p_lock);
  return sleepWakeState;
}

- (void)setMediaUniqueIdentifier:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaUniqueIdentifier = &self->_mediaUniqueIdentifier;
  if (([v7 isEqualToString:*p_mediaUniqueIdentifier] & 1) == 0) {
    objc_storeStrong((id *)p_mediaUniqueIdentifier, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)mediaUniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMuted:(id)a3
{
  v5 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_muted != v5) {
    objc_storeStrong((id *)&self->_muted, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)muted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_muted;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setVolume:(id)a3
{
  v5 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_volume != v5) {
    objc_storeStrong((id *)&self->_volume, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)volume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_volume;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRepeatState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_repeatState != a3) {
    self->_repeatState = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)repeatState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t repeatState = self->_repeatState;
  os_unfair_lock_unlock(p_lock);
  return repeatState;
}

- (void)setShuffleState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shuffleState != a3) {
    self->_shuffleState = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)shuffleState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t shuffleState = self->_shuffleState;
  os_unfair_lock_unlock(p_lock);
  return shuffleState;
}

- (void)setPlaybackState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_playbackState != a3) {
    self->_playbackState = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)playbackState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t playbackState = self->_playbackState;
  os_unfair_lock_unlock(p_lock);
  return playbackState;
}

- (HMDMediaSessionState)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v16.receiver = self;
    v16.super_class = (Class)HMDMediaSessionState;
    unint64_t v6 = [(HMDMediaSessionState *)&v16 init];
    id v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      uint64_t v8 = [v5 copy];
      sessionIdentifier = v7->_sessionIdentifier;
      v7->_sessionIdentifier = (NSString *)v8;

      v7->_int64_t playbackState = 0;
      v7->_int64_t shuffleState = 0;
      v7->_int64_t repeatState = 0;
      uint64_t v10 = [NSNumber numberWithFloat:0.0];
      volume = v7->_volume;
      v7->_volume = (NSNumber *)v10;

      muted = v7->_muted;
      v7->_muted = (NSNumber *)MEMORY[0x263EFFA80];

      v7->_unint64_t sleepWakeState = 0;
    }

    return v7;
  }
  else
  {
    float v14 = (void *)_HMFPreconditionFailure();
    return (HMDMediaSessionState *)+[HMDHomeManagerModel properties];
  }
}

@end