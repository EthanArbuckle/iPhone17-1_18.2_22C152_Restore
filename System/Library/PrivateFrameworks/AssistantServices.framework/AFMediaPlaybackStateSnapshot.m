@interface AFMediaPlaybackStateSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFMediaPlaybackStateSnapshot)init;
- (AFMediaPlaybackStateSnapshot)initWithBuilder:(id)a3;
- (AFMediaPlaybackStateSnapshot)initWithCoder:(id)a3;
- (AFMediaPlaybackStateSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFMediaPlaybackStateSnapshot)initWithPlaybackState:(int64_t)a3 nowPlayingTimestamp:(id)a4 mediaType:(id)a5 groupIdentifier:(id)a6 isProxyGroupPlayer:(BOOL)a7;
- (AFMediaPlaybackStateSnapshot)initWithSerializedBackingStore:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxyGroupPlayer;
- (NSDate)nowPlayingTimestamp;
- (NSString)description;
- (NSString)groupIdentifier;
- (NSString)mediaType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)playbackState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFMediaPlaybackStateSnapshot

- (id)ad_shortDescription
{
  v3 = NSString;
  unint64_t v4 = [(AFMediaPlaybackStateSnapshot *)self playbackState];
  if (v4 > 5) {
    v5 = @"(unknown)";
  }
  else {
    v5 = *(&off_1E5928EB8 + v4);
  }
  v6 = v5;
  v7 = [(AFMediaPlaybackStateSnapshot *)self nowPlayingTimestamp];
  v8 = [(AFMediaPlaybackStateSnapshot *)self mediaType];
  v9 = [(AFMediaPlaybackStateSnapshot *)self groupIdentifier];
  v10 = [v3 stringWithFormat:@"(playstate: %@, time: %@, mediaType: %@, group: %@)", v6, v7, v8, v9];

  return v10;
}

- (AFMediaPlaybackStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFMediaPlaybackStateSnapshot *)self initWithDictionaryRepresentation:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_nowPlayingTimestamp, 0);
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSDate)nowPlayingTimestamp
{
  return self->_nowPlayingTimestamp;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t playbackState = self->_playbackState;
  if (playbackState > 5) {
    v5 = @"(unknown)";
  }
  else {
    v5 = *(&off_1E5928EB8 + playbackState);
  }
  v6 = v5;
  [v3 setObject:v6 forKey:@"playbackState"];

  nowPlayingTimestamp = self->_nowPlayingTimestamp;
  if (nowPlayingTimestamp) {
    [v3 setObject:nowPlayingTimestamp forKey:@"nowPlayingTimestamp"];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v3 setObject:mediaType forKey:@"mediaType"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 setObject:groupIdentifier forKey:@"groupIdentifier"];
  }
  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isProxyGroupPlayer];
  [v3 setObject:v10 forKey:@"isProxyGroupPlayer"];

  v11 = (void *)[v3 copy];
  return v11;
}

- (AFMediaPlaybackStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"playbackState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = AFMediaPlaybackStateGetFromName(v6);
    }
    else {
      uint64_t v7 = 0;
    }

    v9 = [v5 objectForKey:@"nowPlayingTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v5 objectForKey:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [v5 objectForKey:@"groupIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = [v5 objectForKey:@"isProxyGroupPlayer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    uint64_t v17 = [v16 BOOLValue];
    self = [(AFMediaPlaybackStateSnapshot *)self initWithPlaybackState:v7 nowPlayingTimestamp:v10 mediaType:v12 groupIdentifier:v14 isProxyGroupPlayer:v17];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t playbackState = self->_playbackState;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithInteger:playbackState];
  [v6 encodeObject:v7 forKey:@"AFMediaPlaybackStateSnapshot::playbackState"];

  [v6 encodeObject:self->_nowPlayingTimestamp forKey:@"AFMediaPlaybackStateSnapshot::nowPlayingTimestamp"];
  [v6 encodeObject:self->_mediaType forKey:@"AFMediaPlaybackStateSnapshot::mediaType"];
  [v6 encodeObject:self->_groupIdentifier forKey:@"AFMediaPlaybackStateSnapshot::groupIdentifier"];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isProxyGroupPlayer];
  [v6 encodeObject:v8 forKey:@"AFMediaPlaybackStateSnapshot::isProxyGroupPlayer"];
}

- (AFMediaPlaybackStateSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMediaPlaybackStateSnapshot::playbackState"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMediaPlaybackStateSnapshot::nowPlayingTimestamp"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMediaPlaybackStateSnapshot::mediaType"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMediaPlaybackStateSnapshot::groupIdentifier"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMediaPlaybackStateSnapshot::isProxyGroupPlayer"];

  uint64_t v11 = [v10 BOOLValue];
  id v12 = [(AFMediaPlaybackStateSnapshot *)self initWithPlaybackState:v6 nowPlayingTimestamp:v7 mediaType:v8 groupIdentifier:v9 isProxyGroupPlayer:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFMediaPlaybackStateSnapshot *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t playbackState = self->_playbackState;
      if (playbackState == [(AFMediaPlaybackStateSnapshot *)v5 playbackState]
        && (BOOL isProxyGroupPlayer = self->_isProxyGroupPlayer,
            isProxyGroupPlayer == [(AFMediaPlaybackStateSnapshot *)v5 isProxyGroupPlayer]))
      {
        id v8 = [(AFMediaPlaybackStateSnapshot *)v5 nowPlayingTimestamp];
        nowPlayingTimestamp = self->_nowPlayingTimestamp;
        if (nowPlayingTimestamp == v8 || [(NSDate *)nowPlayingTimestamp isEqual:v8])
        {
          id v10 = [(AFMediaPlaybackStateSnapshot *)v5 mediaType];
          mediaType = self->_mediaType;
          if (mediaType == v10 || [(NSString *)mediaType isEqual:v10])
          {
            id v12 = [(AFMediaPlaybackStateSnapshot *)v5 groupIdentifier];
            groupIdentifier = self->_groupIdentifier;
            BOOL v14 = groupIdentifier == v12 || [(NSString *)groupIdentifier isEqual:v12];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_playbackState];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSDate *)self->_nowPlayingTimestamp hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_mediaType hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_groupIdentifier hash] ^ v4;
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isProxyGroupPlayer];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFMediaPlaybackStateSnapshot;
  uint64_t v5 = [(AFMediaPlaybackStateSnapshot *)&v13 description];
  unint64_t playbackState = self->_playbackState;
  if (playbackState > 5) {
    NSUInteger v7 = @"(unknown)";
  }
  else {
    NSUInteger v7 = *(&off_1E5928EB8 + playbackState);
  }
  id v8 = v7;
  unint64_t v9 = v8;
  if (self->_isProxyGroupPlayer) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  v11 = (void *)[v4 initWithFormat:@"%@ {unint64_t playbackState = %@, nowPlayingTimestamp = %@, mediaType = %@, groupIdentifier = %@, isProxyGroupPlayer = %@}", v5, v8, *(_OWORD *)&self->_nowPlayingTimestamp, self->_groupIdentifier, v10];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(AFMediaPlaybackStateSnapshot *)self _descriptionWithIndent:0];
}

- (AFMediaPlaybackStateSnapshot)initWithPlaybackState:(int64_t)a3 nowPlayingTimestamp:(id)a4 mediaType:(id)a5 groupIdentifier:(id)a6 isProxyGroupPlayer:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__AFMediaPlaybackStateSnapshot_initWithPlaybackState_nowPlayingTimestamp_mediaType_groupIdentifier_isProxyGroupPlayer___block_invoke;
  v20[3] = &unk_1E592C138;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  int64_t v24 = a3;
  BOOL v25 = a7;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  v18 = [(AFMediaPlaybackStateSnapshot *)self initWithBuilder:v20];

  return v18;
}

void __119__AFMediaPlaybackStateSnapshot_initWithPlaybackState_nowPlayingTimestamp_mediaType_groupIdentifier_isProxyGroupPlayer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = a2;
  [v4 setPlaybackState:v3];
  [v4 setNowPlayingTimestamp:*(void *)(a1 + 32)];
  [v4 setMediaType:*(void *)(a1 + 40)];
  [v4 setGroupIdentifier:*(void *)(a1 + 48)];
  [v4 setIsProxyGroupPlayer:*(unsigned __int8 *)(a1 + 64)];
}

- (AFMediaPlaybackStateSnapshot)init
{
  return [(AFMediaPlaybackStateSnapshot *)self initWithBuilder:0];
}

- (AFMediaPlaybackStateSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFMediaPlaybackStateSnapshotMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFMediaPlaybackStateSnapshot;
  uint64_t v5 = [(AFMediaPlaybackStateSnapshot *)&v18 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFMediaPlaybackStateSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFMediaPlaybackStateSnapshotMutation *)v7 isDirty])
    {
      v6->_unint64_t playbackState = [(_AFMediaPlaybackStateSnapshotMutation *)v7 getPlaybackState];
      id v8 = [(_AFMediaPlaybackStateSnapshotMutation *)v7 getNowPlayingTimestamp];
      uint64_t v9 = [v8 copy];
      nowPlayingTimestamp = v6->_nowPlayingTimestamp;
      v6->_nowPlayingTimestamp = (NSDate *)v9;

      uint64_t v11 = [(_AFMediaPlaybackStateSnapshotMutation *)v7 getMediaType];
      uint64_t v12 = [v11 copy];
      mediaType = v6->_mediaType;
      v6->_mediaType = (NSString *)v12;

      id v14 = [(_AFMediaPlaybackStateSnapshotMutation *)v7 getGroupIdentifier];
      uint64_t v15 = [v14 copy];
      groupIdentifier = v6->_groupIdentifier;
      v6->_groupIdentifier = (NSString *)v15;

      v6->_BOOL isProxyGroupPlayer = [(_AFMediaPlaybackStateSnapshotMutation *)v7 getIsProxyGroupPlayer];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFMediaPlaybackStateSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFMediaPlaybackStateSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFMediaPlaybackStateSnapshotMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFMediaPlaybackStateSnapshot);
      v6->_unint64_t playbackState = [(_AFMediaPlaybackStateSnapshotMutation *)v5 getPlaybackState];
      NSUInteger v7 = [(_AFMediaPlaybackStateSnapshotMutation *)v5 getNowPlayingTimestamp];
      uint64_t v8 = [v7 copy];
      nowPlayingTimestamp = v6->_nowPlayingTimestamp;
      v6->_nowPlayingTimestamp = (NSDate *)v8;

      id v10 = [(_AFMediaPlaybackStateSnapshotMutation *)v5 getMediaType];
      uint64_t v11 = [v10 copy];
      mediaType = v6->_mediaType;
      v6->_mediaType = (NSString *)v11;

      id v13 = [(_AFMediaPlaybackStateSnapshotMutation *)v5 getGroupIdentifier];
      uint64_t v14 = [v13 copy];
      groupIdentifier = v6->_groupIdentifier;
      v6->_groupIdentifier = (NSString *)v14;

      v6->_BOOL isProxyGroupPlayer = [(_AFMediaPlaybackStateSnapshotMutation *)v5 getIsProxyGroupPlayer];
    }
    else
    {
      NSUInteger v6 = (AFMediaPlaybackStateSnapshot *)[(AFMediaPlaybackStateSnapshot *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFMediaPlaybackStateSnapshot *)[(AFMediaPlaybackStateSnapshot *)self copy];
  }

  return v6;
}

@end