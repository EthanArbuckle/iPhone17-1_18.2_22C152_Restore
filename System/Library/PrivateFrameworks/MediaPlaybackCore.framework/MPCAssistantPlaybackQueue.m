@interface MPCAssistantPlaybackQueue
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldImmediatelyStartPlayback;
- (BOOL)shouldOverrideManuallyCuratedQueue;
- (ICUserIdentity)userIdentity;
- (MPCAssistantPlaybackQueue)initWithCoder:(id)a3;
- (MPCAssistantPlaybackQueue)initWithContextID:(id)a3;
- (NSDictionary)siriWHAMetricsInfo;
- (NSString)contextID;
- (NSString)featureName;
- (NSString)homeKitUserIdentifier;
- (NSString)queueGroupingID;
- (NSString)siriAssetInfo;
- (NSString)siriRecommendationID;
- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4;
- (void)setFeatureName:(id)a3;
- (void)setHomeKitUserIdentifier:(id)a3;
- (void)setQueueGroupingID:(id)a3;
- (void)setShouldImmediatelyStartPlayback:(BOOL)a3;
- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3;
- (void)setSiriAssetInfo:(id)a3;
- (void)setSiriRecommendationID:(id)a3;
- (void)setSiriWHAMetricsInfo:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPCAssistantPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_siriRecommendationID, 0);

  objc_storeStrong((id *)&self->_contextID, 0);
}

- (void)setHomeKitUserIdentifier:(id)a3
{
}

- (NSString)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setUserIdentity:(id)a3
{
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (void)setQueueGroupingID:(id)a3
{
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setFeatureName:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setSiriAssetInfo:(id)a3
{
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setSiriRecommendationID:(id)a3
{
}

- (NSString)siriRecommendationID
{
  return self->_siriRecommendationID;
}

- (void)setShouldImmediatelyStartPlayback:(BOOL)a3
{
  self->_shouldImmediatelyStartPlayback = a3;
}

- (BOOL)shouldImmediatelyStartPlayback
{
  return self->_shouldImmediatelyStartPlayback;
}

- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  self->_shouldOverrideManuallyCuratedQueue = a3;
}

- (BOOL)shouldOverrideManuallyCuratedQueue
{
  return self->_shouldOverrideManuallyCuratedQueue;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MPCAssistantPlaybackQueue *)self contextID];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 8) = [(MPCAssistantPlaybackQueue *)self shouldOverrideManuallyCuratedQueue];
  *(unsigned char *)(v4 + 9) = [(MPCAssistantPlaybackQueue *)self shouldImmediatelyStartPlayback];
  uint64_t v7 = [(MPCAssistantPlaybackQueue *)self siriRecommendationID];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(MPCAssistantPlaybackQueue *)self siriAssetInfo];
  v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(MPCAssistantPlaybackQueue *)self featureName];
  v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  uint64_t v13 = [(MPCAssistantPlaybackQueue *)self queueGroupingID];
  v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  uint64_t v15 = [(MPCAssistantPlaybackQueue *)self siriWHAMetricsInfo];
  v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  uint64_t v17 = [(MPCAssistantPlaybackQueue *)self userIdentity];
  v18 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v17;

  uint64_t v19 = [(MPCAssistantPlaybackQueue *)self homeKitUserIdentifier];
  v20 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v19;

  return (id)v4;
}

- (MPCAssistantPlaybackQueue)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPCAssistantPlaybackQueue;
  uint64_t v5 = [(MPCAssistantPlaybackQueue *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContextID"];
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

    v5->_shouldOverrideManuallyCuratedQueue = [v4 decodeBoolForKey:@"ShouldOverrideManuallyCuratedQueue"];
    v5->_shouldImmediatelyStartPlayback = [v4 decodeBoolForKey:@"ShouldImmediatelyStartPlayback"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriRecommendationID"];
    siriRecommendationID = v5->_siriRecommendationID;
    v5->_siriRecommendationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriAssetInfo"];
    siriAssetInfo = v5->_siriAssetInfo;
    v5->_siriAssetInfo = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FeatureName"];
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QueueGroupingID"];
    queueGroupingID = v5->_queueGroupingID;
    v5->_queueGroupingID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriWHAMetricsInfo"];
    siriWHAMetricsInfo = v5->_siriWHAMetricsInfo;
    v5->_siriWHAMetricsInfo = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserIdentity"];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeKitUserIdentifier"];
    homeKitUserIdentifier = v5->_homeKitUserIdentifier;
    v5->_homeKitUserIdentifier = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contextID = self->_contextID;
  id v5 = a3;
  [v5 encodeObject:contextID forKey:@"ContextID"];
  [v5 encodeBool:self->_shouldOverrideManuallyCuratedQueue forKey:@"ShouldOverrideManuallyCuratedQueue"];
  [v5 encodeBool:self->_shouldImmediatelyStartPlayback forKey:@"ShouldImmediatelyStartPlayback"];
  [v5 encodeObject:self->_siriRecommendationID forKey:@"SiriRecommendationID"];
  [v5 encodeObject:self->_siriAssetInfo forKey:@"SiriAssetInfo"];
  [v5 encodeObject:self->_featureName forKey:@"FeatureName"];
  [v5 encodeObject:self->_queueGroupingID forKey:@"QueueGroupingID"];
  [v5 encodeObject:self->_siriWHAMetricsInfo forKey:@"SiriWHAMetricsInfo"];
  [v5 encodeObject:self->_userIdentity forKey:@"UserIdentity"];
  [v5 encodeObject:self->_homeKitUserIdentifier forKey:@"HomeKitUserIdentifier"];
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__15147;
  uint64_t v20 = __Block_byref_object_dispose__15148;
  id v21 = 0;
  id v4 = +[MPCAssistantRemoteControlDestination nowPlayingApplicationDestination];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __54__MPCAssistantPlaybackQueue_createRemotePlaybackQueue__block_invoke;
  uint64_t v13 = &unk_2643C1C98;
  uint64_t v15 = &v16;
  id v5 = v3;
  uint64_t v14 = v5;
  [(MPCAssistantPlaybackQueue *)self getPlaybackQueueWithDestination:v4 completion:&v10];

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id) v17[5];
  objc_msgSend(v6, "_mediaRemotePlaybackQueue", v10, v11, v12, v13);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  uint64_t v8 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreateFromExternalRepresentation();

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __54__MPCAssistantPlaybackQueue_createRemotePlaybackQueue__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  id v6 = [(MPCAssistantPlaybackQueue *)self createRemotePlaybackQueue];
  id v7 = [MEMORY[0x263F121D8] queueWithMediaRemotePlaybackQueue:v6];
  v5[2](v5, v7, 0);
}

- (MPCAssistantPlaybackQueue)initWithContextID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCAssistantPlaybackQueue;
  id v5 = [(MPCAssistantPlaybackQueue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end