@interface BRCSideCarInfo
- (BOOL)hasfieldsToSync;
- (BRFieldCKInfo)ckInfo;
- (NSData)finderTags;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithContext:(id)a3;
- (int64_t)favoriteRank;
- (int64_t)lastUsedTime;
- (void)setCkInfo:(id)a3;
- (void)setFavoriteRank:(int64_t)a3;
- (void)setFinderTags:(id)a3;
- (void)setLastUsedTime:(int64_t)a3;
@end

@implementation BRCSideCarInfo

- (id)descriptionWithContext:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    v6 = [(BRFieldCKInfo *)ckInfo etag];
    [v4 appendFormat:@" etag:%@", v6];
  }
  if (self->_favoriteRank) {
    objc_msgSend(v4, "appendFormat:", @" fav:%lld", self->_favoriteRank);
  }
  if (self->_lastUsedTime) {
    objc_msgSend(v4, "appendFormat:", @" lu:%lld", self->_lastUsedTime);
  }
  if (self->_finderTags) {
    [v4 appendFormat:@" has-finder-tags"];
  }
  return v4;
}

- (id)description
{
  return [(BRCSideCarInfo *)self descriptionWithContext:0];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BRFieldCKInfo *)self->_ckInfo etag];
  v6 = (void *)v5;
  if (self->_finderTags) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p {etag : %@; fr: %lld; lu : %lld; ft: %s}>",
    v4,
    self,
    v5,
    self->_favoriteRank,
    self->_lastUsedTime,
  v8 = v7);

  return v8;
}

- (BOOL)hasfieldsToSync
{
  return self->_favoriteRank || self->_lastUsedTime || self->_finderTags != 0;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void)setCkInfo:(id)a3
{
}

- (int64_t)favoriteRank
{
  return self->_favoriteRank;
}

- (void)setFavoriteRank:(int64_t)a3
{
  self->_favoriteRank = a3;
}

- (int64_t)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(int64_t)a3
{
  self->_lastUsedTime = a3;
}

- (NSData)finderTags
{
  return self->_finderTags;
}

- (void)setFinderTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finderTags, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

@end