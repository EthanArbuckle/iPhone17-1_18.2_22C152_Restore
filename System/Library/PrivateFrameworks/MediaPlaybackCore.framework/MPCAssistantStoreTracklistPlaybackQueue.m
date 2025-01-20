@interface MPCAssistantStoreTracklistPlaybackQueue
+ (id)storeTracklistQueueWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5;
- (MPCAssistantStoreTracklistPlaybackQueue)initWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5;
- (MPIdentifierSet)collectionIdentifierSet;
- (NSArray)storeItemIDs;
- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue;
- (id)description;
- (int64_t)shuffleType;
- (void)setShuffleType:(int64_t)a3;
@end

@implementation MPCAssistantStoreTracklistPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);

  objc_storeStrong((id *)&self->_storeItemIDs, 0);
}

- (MPIdentifierSet)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (NSArray)storeItemIDs
{
  return self->_storeItemIDs;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  v3 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MPShuffleTypeToMediaRemoteShuffleMode();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetTracklistRepeatMode();
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if (collectionIdentifierSet)
  {
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:collectionIdentifierSet requiringSecureCoding:1 error:0];
    MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData();
  }
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
  [(MPCAssistantPlaybackQueue *)self shouldOverrideManuallyCuratedQueue];
  MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
  [(MPCAssistantPlaybackQueue *)self shouldImmediatelyStartPlayback];
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  v6 = [(MPCAssistantPlaybackQueue *)self siriRecommendationID];
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

  v7 = [(MPCAssistantPlaybackQueue *)self siriAssetInfo];
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  v8 = [(MPCAssistantPlaybackQueue *)self featureName];
  MRSystemAppPlaybackQueueSetFeatureName();

  v9 = [(MPCAssistantPlaybackQueue *)self siriWHAMetricsInfo];
  MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

  return v3;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantStoreTracklistPlaybackQueue;
  v4 = [(MPCAssistantStoreTracklistPlaybackQueue *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ collection=%@ identifiers=%@", v4, self->_collectionIdentifierSet, self->_storeItemIDs];

  return v5;
}

- (MPCAssistantStoreTracklistPlaybackQueue)initWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCAssistantStoreTracklistPlaybackQueue;
  v10 = [(MPCAssistantPlaybackQueue *)&v14 initWithContextID:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    storeItemIDs = v10->_storeItemIDs;
    v10->_storeItemIDs = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_collectionIdentifierSet, a5);
  }

  return v10;
}

+ (id)storeTracklistQueueWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithContextID:v10 storeItemIDs:v9 collectionIdentifierSet:v8];

  return v11;
}

@end