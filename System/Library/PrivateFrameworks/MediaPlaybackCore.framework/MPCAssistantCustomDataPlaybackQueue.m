@interface MPCAssistantCustomDataPlaybackQueue
+ (id)customDataQueueWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5;
- (MPCAssistantCustomDataPlaybackQueue)initWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5;
- (NSData)customData;
- (NSString)identifier;
- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue;
- (id)description;
@end

@implementation MPCAssistantCustomDataPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)customData
{
  return self->_customData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  v3 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  [(MPCAssistantPlaybackQueue *)self shouldImmediatelyStartPlayback];
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  v4 = [(MPCAssistantPlaybackQueue *)self siriRecommendationID];
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

  v5 = [(MPCAssistantPlaybackQueue *)self siriAssetInfo];
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  v6 = [(MPCAssistantPlaybackQueue *)self featureName];
  MRSystemAppPlaybackQueueSetFeatureName();

  v7 = [(MPCAssistantPlaybackQueue *)self siriWHAMetricsInfo];
  MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

  v8 = [(MPCAssistantCustomDataPlaybackQueue *)self identifier];
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  v9 = [(MPCAssistantCustomDataPlaybackQueue *)self customData];
  MRSystemAppPlaybackQueueSetCustomData();

  return v3;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantCustomDataPlaybackQueue;
  v4 = [(MPCAssistantCustomDataPlaybackQueue *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ identifier=%@", v4, self->_identifier];

  return v5;
}

- (MPCAssistantCustomDataPlaybackQueue)initWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCAssistantCustomDataPlaybackQueue;
  v10 = [(MPCAssistantPlaybackQueue *)&v16 initWithContextID:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    customData = v10->_customData;
    v10->_customData = (NSData *)v13;
  }
  return v10;
}

+ (id)customDataQueueWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithContextID:v10 identifier:v9 customData:v8];

  return v11;
}

@end