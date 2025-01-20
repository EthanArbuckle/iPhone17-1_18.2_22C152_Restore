@interface MPCPlaybackContextRemotePlaybackQueue
- (BOOL)isRequestingImmediatePlayback;
- (BOOL)shouldSkipWaitingForReadyToPlayStatus;
- (MPCPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3;
- (id)description;
- (id)privateListeningOverride;
- (id)siriAssetInfo;
- (id)siriRecommendationIdentifier;
- (id)siriWHAMetricsInfo;
- (int64_t)replaceIntent;
- (void)getMusicPlaybackContextWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)setReplaceIntent:(int64_t)a3;
@end

@implementation MPCPlaybackContextRemotePlaybackQueue

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, playbackContext=%@>", objc_opt_class(), self, self->_playbackContext];
}

- (id)siriWHAMetricsInfo
{
  return (id)[(MPPlaybackContext *)self->_playbackContext siriWHAMetricsInfo];
}

- (id)siriRecommendationIdentifier
{
  return (id)[(MPPlaybackContext *)self->_playbackContext siriReferenceIdentifier];
}

- (id)siriAssetInfo
{
  return (id)[(MPPlaybackContext *)self->_playbackContext siriAssetInfo];
}

- (void)setReplaceIntent:(int64_t)a3
{
  self->_replaceIntent = a3;
}

- (int64_t)replaceIntent
{
  return self->_replaceIntent;
}

- (id)privateListeningOverride
{
  return (id)[(MPPlaybackContext *)self->_playbackContext privateListeningOverride];
}

- (BOOL)shouldSkipWaitingForReadyToPlayStatus
{
  return [(MPPlaybackContext *)self->_playbackContext actionAfterQueueLoad] == 0;
}

- (BOOL)isRequestingImmediatePlayback
{
  return [(MPPlaybackContext *)self->_playbackContext actionAfterQueueLoad] == 20;
}

- (void)getMusicPlaybackContextWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (MPCPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v5 = a3;
  v6 = [(MPCPlaybackContextRemotePlaybackQueue *)self initWithMediaRemotePlaybackQueue:0 options:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playbackContext, a3);
  }

  return v7;
}

@end