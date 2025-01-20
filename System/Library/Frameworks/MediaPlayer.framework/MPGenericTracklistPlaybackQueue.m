@interface MPGenericTracklistPlaybackQueue
+ (BOOL)supportsSecureCoding;
- (BOOL)verifyWithError:(id *)a3;
- (MPGenericTracklistPlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4;
- (MPIdentifierSet)collectionIdentifierSet;
- (NSArray)trackIdentifiers;
- (NSString)firstTrackIdentifier;
- (id)description;
- (int64_t)repeatType;
- (int64_t)shuffleType;
@end

@implementation MPGenericTracklistPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);
  objc_storeStrong((id *)&self->_trackIdentifiers, 0);

  objc_storeStrong((id *)&self->_firstTrackIdentifier, 0);
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (MPIdentifierSet)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (NSArray)trackIdentifiers
{
  return self->_trackIdentifiers;
}

- (NSString)firstTrackIdentifier
{
  return self->_firstTrackIdentifier;
}

- (BOOL)verifyWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = [(MPGenericTracklistPlaybackQueue *)self trackIdentifiers];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Empty track IDs array provided";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPErrorDomain" code:100 userInfo:v6];
    v8 = v7;
    if (a3) {
      *a3 = v7;
    }
  }
  return v5 != 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = MPNSStringFromShuffleType(self->_shuffleType);
  v6 = [v3 stringWithFormat:@"<%@ %p, shuffleType = %@, trackIDs = %@>", v4, self, v5, self->_trackIdentifiers];

  return v6;
}

- (MPGenericTracklistPlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)MPGenericTracklistPlaybackQueue;
  uint64_t v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v18, sel_initWithMediaRemotePlaybackQueue_options_);
  if (v4)
  {
    uint64_t v5 = (void *)MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers();
    uint64_t v6 = objc_msgSend(v5, "msv_map:", &__block_literal_global_4456);
    trackIdentifiers = v4->_trackIdentifiers;
    v4->_trackIdentifiers = (NSArray *)v6;

    uint64_t v8 = MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier();
    firstTrackIdentifier = v4->_firstTrackIdentifier;
    v4->_firstTrackIdentifier = (NSString *)v8;

    unsigned int TracklistShuffleMode = MRSystemAppPlaybackQueueGetTracklistShuffleMode();
    if (TracklistShuffleMode > 3) {
      int64_t v11 = 0;
    }
    else {
      int64_t v11 = qword_19568C4B8[TracklistShuffleMode];
    }
    v4->_shuffleType = v11;
    unsigned int TracklistRepeatMode = MRSystemAppPlaybackQueueGetTracklistRepeatMode();
    if (TracklistRepeatMode > 3) {
      int64_t v13 = 0;
    }
    else {
      int64_t v13 = qword_19568C498[TracklistRepeatMode];
    }
    v4->_repeatType = v13;
    v14 = MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData();
    if (v14)
    {
      objc_opt_class();
      uint64_t v15 = MSVUnarchivedObjectOfClass();
      collectionIdentifierSet = v4->_collectionIdentifierSet;
      v4->_collectionIdentifierSet = (MPIdentifierSet *)v15;
    }
  }
  return v4;
}

id __76__MPGenericTracklistPlaybackQueue_initWithMediaRemotePlaybackQueue_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (_NSIsNSString())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 stringValue];
  }
  uint64_t v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end