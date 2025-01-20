@interface MPCPodcastPlaybackPositionEvent
- (BOOL)completed;
- (BOOL)subscribable;
- (NSNumber)accountID;
- (NSString)episodeAdamID;
- (NSString)episodeUUID;
- (NSString)feedURL;
- (NSString)podcastAdamID;
- (double)duration;
- (double)position;
- (double)timestamp;
- (void)setAccountID:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEpisodeAdamID:(id)a3;
- (void)setEpisodeUUID:(id)a3;
- (void)setFeedURL:(id)a3;
- (void)setPodcastAdamID:(id)a3;
- (void)setPosition:(double)a3;
- (void)setSubscribable:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MPCPodcastPlaybackPositionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_episodeUUID, 0);
  objc_storeStrong((id *)&self->_episodeAdamID, 0);

  objc_storeStrong((id *)&self->_podcastAdamID, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setSubscribable:(BOOL)a3
{
  self->_subscribable = a3;
}

- (BOOL)subscribable
{
  return self->_subscribable;
}

- (void)setPosition:(double)a3
{
  self->_position = a3;
}

- (double)position
{
  return self->_position;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setAccountID:(id)a3
{
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setFeedURL:(id)a3
{
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void)setEpisodeUUID:(id)a3
{
}

- (NSString)episodeUUID
{
  return self->_episodeUUID;
}

- (void)setEpisodeAdamID:(id)a3
{
}

- (NSString)episodeAdamID
{
  return self->_episodeAdamID;
}

- (void)setPodcastAdamID:(id)a3
{
}

- (NSString)podcastAdamID
{
  return self->_podcastAdamID;
}

@end