@interface MPMusicPlayerServerStateUpdateRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)audioFormatDidChange;
- (BOOL)hasContentItemIDs;
- (BOOL)hasNowPlaying;
- (BOOL)hasQueueDescriptor;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)hasTimeMetadata;
- (BOOL)hasTimeSnapshot;
- (BOOL)itemDidEnd;
- (BOOL)queueDidChange;
- (BOOL)queueDidEnd;
- (MPMusicPlayerControllerNowPlaying)nowPlaying;
- (MPMusicPlayerControllerNowPlayingTimeSnapshot)timeSnapshot;
- (MPMusicPlayerQueueDescriptor)queueDescriptor;
- (MPMusicPlayerServerStateUpdateRecord)initWithCoder:(id)a3;
- (NSArray)contentItemIDs;
- (int64_t)repeatMode;
- (int64_t)shuffleMode;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioFormatDidChange:(BOOL)a3;
- (void)setContentItemIDs:(id)a3;
- (void)setHasContentItemIDs:(BOOL)a3;
- (void)setHasNowPlaying:(BOOL)a3;
- (void)setHasQueueDescriptor:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasTimeMetadata:(BOOL)a3;
- (void)setHasTimeSnapshot:(BOOL)a3;
- (void)setItemDidEnd:(BOOL)a3;
- (void)setNowPlaying:(id)a3;
- (void)setQueueDescriptor:(id)a3;
- (void)setQueueDidChange:(BOOL)a3;
- (void)setQueueDidEnd:(BOOL)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleMode:(int64_t)a3;
- (void)setTimeSnapshot:(id)a3;
@end

@implementation MPMusicPlayerServerStateUpdateRecord

- (void)setQueueDidChange:(BOOL)a3
{
  self->_queueDidChange = a3;
}

- (void)setHasNowPlaying:(BOOL)a3
{
  self->_hasNowPlaying = a3;
}

- (void)setNowPlaying:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemIDs, 0);
  objc_storeStrong((id *)&self->_timeSnapshot, 0);
  objc_storeStrong((id *)&self->_nowPlaying, 0);

  objc_storeStrong((id *)&self->_queueDescriptor, 0);
}

- (void)setAudioFormatDidChange:(BOOL)a3
{
  self->_audioFormatDidChange = a3;
}

- (BOOL)audioFormatDidChange
{
  return self->_audioFormatDidChange;
}

- (void)setHasTimeMetadata:(BOOL)a3
{
  self->_hasTimeMetadata = a3;
}

- (BOOL)hasTimeMetadata
{
  return self->_hasTimeMetadata;
}

- (void)setQueueDidEnd:(BOOL)a3
{
  self->_queueDidEnd = a3;
}

- (BOOL)queueDidEnd
{
  return self->_queueDidEnd;
}

- (void)setItemDidEnd:(BOOL)a3
{
  self->_itemDidEnd = a3;
}

- (BOOL)itemDidEnd
{
  return self->_itemDidEnd;
}

- (BOOL)queueDidChange
{
  return self->_queueDidChange;
}

- (void)setContentItemIDs:(id)a3
{
}

- (NSArray)contentItemIDs
{
  return self->_contentItemIDs;
}

- (void)setHasContentItemIDs:(BOOL)a3
{
  self->_hasContentItemIDs = a3;
}

- (BOOL)hasContentItemIDs
{
  return self->_hasContentItemIDs;
}

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  self->_hasShuffleMode = a3;
}

- (BOOL)hasShuffleMode
{
  return self->_hasShuffleMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  self->_hasRepeatMode = a3;
}

- (BOOL)hasRepeatMode
{
  return self->_hasRepeatMode;
}

- (void)setTimeSnapshot:(id)a3
{
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)timeSnapshot
{
  return self->_timeSnapshot;
}

- (void)setHasTimeSnapshot:(BOOL)a3
{
  self->_hasTimeSnapshot = a3;
}

- (BOOL)hasTimeSnapshot
{
  return self->_hasTimeSnapshot;
}

- (MPMusicPlayerControllerNowPlaying)nowPlaying
{
  return self->_nowPlaying;
}

- (BOOL)hasNowPlaying
{
  return self->_hasNowPlaying;
}

- (void)setQueueDescriptor:(id)a3
{
}

- (MPMusicPlayerQueueDescriptor)queueDescriptor
{
  return self->_queueDescriptor;
}

- (void)setHasQueueDescriptor:(BOOL)a3
{
  self->_hasQueueDescriptor = a3;
}

- (BOOL)hasQueueDescriptor
{
  return self->_hasQueueDescriptor;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL hasQueueDescriptor = self->_hasQueueDescriptor;
  id v5 = a3;
  [v5 encodeBool:hasQueueDescriptor forKey:@"hd"];
  [v5 encodeObject:self->_queueDescriptor forKey:@"d"];
  [v5 encodeBool:self->_hasNowPlaying forKey:@"hn"];
  [v5 encodeObject:self->_nowPlaying forKey:@"n"];
  [v5 encodeBool:self->_hasTimeSnapshot forKey:@"ht"];
  [v5 encodeObject:self->_timeSnapshot forKey:@"t"];
  [v5 encodeBool:self->_hasRepeatMode forKey:@"hr"];
  [v5 encodeInteger:self->_repeatMode forKey:@"r"];
  [v5 encodeBool:self->_hasShuffleMode forKey:@"hs"];
  [v5 encodeInteger:self->_shuffleMode forKey:@"s"];
  [v5 encodeBool:self->_hasContentItemIDs forKey:@"hi"];
  [v5 encodeObject:self->_contentItemIDs forKey:@"i"];
  [v5 encodeBool:self->_queueDidChange forKey:@"qc"];
  [v5 encodeBool:self->_itemDidEnd forKey:@"ie"];
  [v5 encodeBool:self->_queueDidEnd forKey:@"qe"];
  [v5 encodeBool:self->_audioFormatDidChange forKey:@"af"];
  [v5 encodeBool:self->_hasTimeMetadata forKey:@"tm"];
}

- (MPMusicPlayerServerStateUpdateRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPMusicPlayerServerStateUpdateRecord;
  id v5 = [(MPMusicPlayerServerStateUpdateRecord *)&v18 init];
  if (v5)
  {
    v5->_BOOL hasQueueDescriptor = [v4 decodeBoolForKey:@"hd"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    queueDescriptor = v5->_queueDescriptor;
    v5->_queueDescriptor = (MPMusicPlayerQueueDescriptor *)v6;

    v5->_hasNowPlaying = [v4 decodeBoolForKey:@"hn"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"n"];
    nowPlaying = v5->_nowPlaying;
    v5->_nowPlaying = (MPMusicPlayerControllerNowPlaying *)v8;

    v5->_hasTimeSnapshot = [v4 decodeBoolForKey:@"ht"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
    timeSnapshot = v5->_timeSnapshot;
    v5->_timeSnapshot = (MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10;

    v5->_hasRepeatMode = [v4 decodeBoolForKey:@"hr"];
    v5->_repeatMode = [v4 decodeIntegerForKey:@"r"];
    v5->_hasShuffleMode = [v4 decodeBoolForKey:@"hs"];
    v5->_shuffleMode = [v4 decodeIntegerForKey:@"s"];
    v5->_hasContentItemIDs = [v4 decodeBoolForKey:@"hi"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"i"];
    contentItemIDs = v5->_contentItemIDs;
    v5->_contentItemIDs = (NSArray *)v15;

    v5->_queueDidChange = [v4 decodeBoolForKey:@"qc"];
    v5->_itemDidEnd = [v4 decodeBoolForKey:@"ie"];
    v5->_queueDidEnd = [v4 decodeBoolForKey:@"qe"];
    v5->_audioFormatDidChange = [v4 decodeBoolForKey:@"af"];
    v5->_hasTimeMetadata = [v4 decodeBoolForKey:@"tm"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end