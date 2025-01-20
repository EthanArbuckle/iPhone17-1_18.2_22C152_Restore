@interface MPPlaybackContextRemotePlaybackQueue
- (BOOL)isRequestingImmediatePlayback;
- (MPPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3;
- (id)asMusicPlaybackContextWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)privateListeningOverride;
- (id)siriAssetInfo;
- (id)siriRecommendationIdentifier;
- (id)siriWHAMetricsInfo;
- (int64_t)replaceIntent;
- (void)setReplaceIntent:(int64_t)a3;
@end

@implementation MPPlaybackContextRemotePlaybackQueue

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, playbackContext=%@>", objc_opt_class(), self, self->_playbackContext];
}

- (id)siriWHAMetricsInfo
{
  return [(MPPlaybackContext *)self->_playbackContext siriWHAMetricsInfo];
}

- (id)siriRecommendationIdentifier
{
  return [(MPPlaybackContext *)self->_playbackContext siriReferenceIdentifier];
}

- (id)siriAssetInfo
{
  return [(MPPlaybackContext *)self->_playbackContext siriAssetInfo];
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
  return [(MPPlaybackContext *)self->_playbackContext privateListeningOverride];
}

- (BOOL)isRequestingImmediatePlayback
{
  return 0;
}

- (id)asMusicPlaybackContextWithOptions:(unint64_t)a3 error:(id *)a4
{
  return self->_playbackContext;
}

- (MPPlaybackContextRemotePlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v5 = a3;
  v6 = [(MPRemotePlaybackQueue *)self initWithMediaRemotePlaybackQueue:0 options:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playbackContext, a3);
  }

  return v7;
}

@end