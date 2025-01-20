@interface MPInsertIntoPlaybackQueueCommandEvent
- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4 options:(id)a5;
- (MPRemotePlaybackQueue)playbackQueue;
- (NSArray)supportedInsertionPositions;
- (NSString)insertAfterContentItemID;
- (int64_t)destinationOffset;
- (int64_t)insertionPosition;
@end

@implementation MPInsertIntoPlaybackQueueCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertAfterContentItemID, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);

  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);
}

- (int64_t)destinationOffset
{
  return self->_destinationOffset;
}

- (NSString)insertAfterContentItemID
{
  return self->_insertAfterContentItemID;
}

- (MPRemotePlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (int64_t)insertionPosition
{
  return self->_insertionPosition;
}

- (NSArray)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4 options:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MPInsertIntoPlaybackQueueCommandEvent;
  v11 = [(MPRemoteCommandEvent *)&v22 initWithCommand:a3 mediaRemoteType:125 options:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackQueue, a4);
    v13 = [v10 objectForKeyedSubscript:@"MPRemoteCommandQueueInsertionPosition"];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 integerValue];
    }
    else
    {
      v16 = [v10 objectForKey:*MEMORY[0x1E4F776E8]];
      int v17 = [v16 intValue];

      uint64_t v18 = (v17 - 1);
      if (v18 < 3) {
        uint64_t v15 = v18 + 1;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    v12->_insertionPosition = v15;
    uint64_t v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F776B0]];
    insertAfterContentItemID = v12->_insertAfterContentItemID;
    v12->_insertAfterContentItemID = (NSString *)v19;
  }
  return v12;
}

- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MPInsertIntoPlaybackQueueCommandEvent;
  id v9 = [(MPRemoteCommandEvent *)&v22 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    id v10 = [v8 objectForKey:*MEMORY[0x1E4F776E8]];
    int v11 = [v10 intValue];

    uint64_t v12 = (v11 - 1);
    if (v12 < 3) {
      int64_t v13 = v12 + 1;
    }
    else {
      int64_t v13 = 0;
    }
    v9->_insertionPosition = v13;
    uint64_t v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776B0]];
    insertAfterContentItemID = v9->_insertAfterContentItemID;
    v9->_insertAfterContentItemID = (NSString *)v14;

    v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776E0]];
    int v17 = v16;
    if (v16) {
      uint64_t v18 = [v16 integerValue];
    }
    else {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9->_destinationOffset = v18;
    CFDictionaryGetValue((CFDictionaryRef)v8, (const void *)*MEMORY[0x1E4F777D0]);
    uint64_t v19 = +[MPRemotePlaybackQueue queueWithMediaRemotePlaybackQueue:MRSystemAppPlaybackQueueCreateFromExternalRepresentation() options:v8];
    playbackQueue = v9->_playbackQueue;
    v9->_playbackQueue = (MPRemotePlaybackQueue *)v19;
  }
  return v9;
}

@end