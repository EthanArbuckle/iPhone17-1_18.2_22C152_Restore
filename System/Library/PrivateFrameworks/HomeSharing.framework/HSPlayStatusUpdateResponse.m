@interface HSPlayStatusUpdateResponse
- (NSDictionary)playStatusInformation;
- (id)description;
- (unint64_t)nowPlayingContainerID;
- (unint64_t)nowPlayingContainerItemID;
- (unint64_t)nowPlayingDatabaseID;
- (unint64_t)nowPlayingItemID;
- (unsigned)nextRevisionID;
- (void)setNextRevisionID:(unsigned int)a3;
- (void)setNowPlayingContainerID:(unint64_t)a3;
- (void)setNowPlayingContainerItemID:(unint64_t)a3;
- (void)setNowPlayingDatabaseID:(unint64_t)a3;
- (void)setNowPlayingItemID:(unint64_t)a3;
- (void)setPlayStatusInformation:(id)a3;
@end

@implementation HSPlayStatusUpdateResponse

- (void).cxx_destruct
{
}

- (void)setPlayStatusInformation:(id)a3
{
}

- (NSDictionary)playStatusInformation
{
  return self->_playStatusInformation;
}

- (void)setNowPlayingItemID:(unint64_t)a3
{
  self->_nowPlayingItemID = a3;
}

- (unint64_t)nowPlayingItemID
{
  return self->_nowPlayingItemID;
}

- (void)setNowPlayingDatabaseID:(unint64_t)a3
{
  self->_nowPlayingDatabaseID = a3;
}

- (unint64_t)nowPlayingDatabaseID
{
  return self->_nowPlayingDatabaseID;
}

- (void)setNowPlayingContainerItemID:(unint64_t)a3
{
  self->_nowPlayingContainerItemID = a3;
}

- (unint64_t)nowPlayingContainerItemID
{
  return self->_nowPlayingContainerItemID;
}

- (void)setNowPlayingContainerID:(unint64_t)a3
{
  self->_nowPlayingContainerID = a3;
}

- (unint64_t)nowPlayingContainerID
{
  return self->_nowPlayingContainerID;
}

- (void)setNextRevisionID:(unsigned int)a3
{
  self->_nextRevisionID = a3;
}

- (unsigned)nextRevisionID
{
  return self->_nextRevisionID;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p: nextRevisionID:%u playStatusInformation:%@>", v5, self, self->_nextRevisionID, self->_playStatusInformation];

  return v6;
}

@end