@interface HMMutableMediaPlaybackAction
- (void)setMediaProfiles:(id)a3;
- (void)setPlaybackArchive:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVolume:(id)a3;
@end

@implementation HMMutableMediaPlaybackAction

- (void)setPlaybackArchive:(id)a3
{
  v4 = (MPPlaybackArchive *)a3;
  os_unfair_lock_lock_with_options();
  playbackArchive = self->super._playbackArchive;
  self->super._playbackArchive = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setVolume:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)[v6 copy];
  volume = self->super._volume;
  self->super._volume = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setState:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->super._state = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setMediaProfiles:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSSet *)[v6 copy];
  mediaProfiles = self->super._mediaProfiles;
  self->super._mediaProfiles = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

@end