@interface MPCPlayerRequest
+ (Class)responseClass;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tracklistRange;
- (BOOL)disablePlaybackRateValidation;
- (BOOL)disablePlaybackStateValidation;
- (ICUserIdentity)userIdentity;
- (MPCPlayerPath)playerPath;
- (MPCPlayerRequest)init;
- (MPPropertySet)playingItemProperties;
- (MPPropertySet)queueItemProperties;
- (MPPropertySet)queueSectionProperties;
- (NSString)description;
- (NSString)preferredFallbackItemRelationship;
- (id)_stateDumpObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)middlewareClasses;
- (void)setDisablePlaybackRateValidation:(BOOL)a3;
- (void)setDisablePlaybackStateValidation:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPlayingItemProperties:(id)a3;
- (void)setPreferredFallbackItemRelationship:(id)a3;
- (void)setQueueItemProperties:(id)a3;
- (void)setQueueSectionProperties:(id)a3;
- (void)setTracklistRange:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPCPlayerRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (MPPropertySet)queueSectionProperties
{
  return self->_queueSectionProperties;
}

- (void)setPlayingItemProperties:(id)a3
{
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerRequest;
  v3 = [(MPRequest *)&v7 description];
  v4 = [NSString stringWithFormat:@" playerPath=%@", self->_playerPath];
  v5 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);

  return (NSString *)v5;
}

- (id)middlewareClasses
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:3];
  if (objc_msgSend(MEMORY[0x263F11E40], "authorizationStatus", v5, v6) == 3)
  {
    uint64_t v3 = [v2 arrayByAddingObject:objc_opt_class()];

    v2 = (void *)v3;
  }

  return v2;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (BOOL)disablePlaybackStateValidation
{
  return self->_disablePlaybackStateValidation;
}

- (MPPropertySet)playingItemProperties
{
  return self->_playingItemProperties;
}

- (MPPropertySet)queueItemProperties
{
  return self->_queueItemProperties;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tracklistRange
{
  p_tracklistRange = &self->_tracklistRange;
  int64_t reverseCount = self->_tracklistRange.reverseCount;
  int64_t forwardCount = p_tracklistRange->forwardCount;
  result.var1 = forwardCount;
  result.var0 = reverseCount;
  return result;
}

- (void)setQueueItemProperties:(id)a3
{
}

- (void)setPlayerPath:(id)a3
{
  v4 = (MPCPlayerPath *)a3;
  p_playerPath = &self->_playerPath;
  if (*p_playerPath != v4)
  {
    if (!v4)
    {
      v4 = +[MPCPlayerPath deviceActivePlayerPath];
    }
    obj = v4;
    objc_storeStrong((id *)p_playerPath, v4);
    v4 = obj;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPCPlayerRequest;
  v4 = [(MPRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 10, self->_playerPath);
  objc_storeStrong(v4 + 11, self->_playingItemProperties);
  objc_storeStrong(v4 + 13, self->_queueItemProperties);
  objc_storeStrong(v4 + 12, self->_queueSectionProperties);
  *((_OWORD *)v4 + 8) = self->_tracklistRange;
  *((unsigned char *)v4 + 72) = self->_disablePlaybackStateValidation;
  *((unsigned char *)v4 + 73) = self->_disablePlaybackRateValidation;
  objc_storeStrong(v4 + 14, self->_preferredFallbackItemRelationship);
  return v4;
}

- (MPCPlayerRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerRequest;
  v2 = [(MPRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[MPCPlayerPath deviceActivePlayerPath];
    playerPath = v2->_playerPath;
    v2->_playerPath = (MPCPlayerPath *)v3;

    uint64_t v5 = [MEMORY[0x263F893C0] activeAccount];
    userIdentity = v2->_userIdentity;
    v2->_userIdentity = (ICUserIdentity *)v5;
  }
  return v2;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setQueueSectionProperties:(id)a3
{
}

- (void)setTracklistRange:(id)a3
{
  self->_tracklistRange = ($EDD789FAE14CB1383AECE2BCA1AA9AB0)a3;
}

- (NSString)preferredFallbackItemRelationship
{
  return self->_preferredFallbackItemRelationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_preferredFallbackItemRelationship, 0);
  objc_storeStrong((id *)&self->_queueItemProperties, 0);
  objc_storeStrong((id *)&self->_queueSectionProperties, 0);
  objc_storeStrong((id *)&self->_playingItemProperties, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

- (void)setPreferredFallbackItemRelationship:(id)a3
{
}

- (void)setDisablePlaybackRateValidation:(BOOL)a3
{
  self->_disablePlaybackRateValidation = a3;
}

- (BOOL)disablePlaybackRateValidation
{
  return self->_disablePlaybackRateValidation;
}

- (void)setDisablePlaybackStateValidation:(BOOL)a3
{
  self->_disablePlaybackStateValidation = a3;
}

- (id)_stateDumpObject
{
  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerRequest;
  uint64_t v3 = [(MPRequest *)&v7 _stateDumpObject];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [NSString stringWithFormat:@"{-%ld, +%ld}", self->_tracklistRange.reverseCount, self->_tracklistRange.forwardCount];
  [v4 setObject:v5 forKeyedSubscript:@"tracklistRange"];

  [v4 setObject:self->_playerPath forKeyedSubscript:@"playerPath"];
  [v4 setObject:self->_playingItemProperties forKeyedSubscript:@"playingItemProperties"];

  return v4;
}

- (void)setUserIdentity:(id)a3
{
  v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    v4 = [MEMORY[0x263F893C0] activeAccount];
  }
  if (self->_userIdentity != v4)
  {
    uint64_t v5 = v4;
    objc_storeStrong((id *)&self->_userIdentity, v4);
    v4 = v5;
  }
}

@end