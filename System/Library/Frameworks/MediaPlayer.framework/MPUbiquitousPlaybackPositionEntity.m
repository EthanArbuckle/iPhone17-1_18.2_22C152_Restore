@interface MPUbiquitousPlaybackPositionEntity
+ (id)ubiquitousIdentifierWithStoreAdamID:(int64_t)a3;
- (BOOL)bookmarkTimeModified;
- (BOOL)bookmarkTimestampModified;
- (BOOL)hasBeenPlayed;
- (BOOL)hasBeenPlayedModified;
- (BOOL)userPlayCountModified;
- (MPUbiquitousPlaybackPositionEntity)init;
- (MPUbiquitousPlaybackPositionEntity)initWithUbiquitousIdentifier:(id)a3;
- (NSNumber)accountDSID;
- (NSString)libraryIdentifier;
- (NSString)ubiquitousIdentifier;
- (double)bookmarkTime;
- (double)bookmarkTimestamp;
- (unint64_t)userPlayCount;
- (void)setAccountDSID:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setBookmarkTimestamp:(double)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setLibraryIdentifier:(id)a3;
- (void)setUserPlayCount:(unint64_t)a3;
@end

@implementation MPUbiquitousPlaybackPositionEntity

+ (id)ubiquitousIdentifierWithStoreAdamID:(int64_t)a3
{
  return (id)[MEMORY[0x1E4FB86E0] ubiquitousIdentifierWithUniqueStoreID:a3];
}

- (void).cxx_destruct
{
}

- (void)setAccountDSID:(id)a3
{
  self->_accountDSID = (NSNumber *)a3;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (unint64_t)userPlayCount
{
  return self->_userPlayCount;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (double)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (void)setLibraryIdentifier:(id)a3
{
  self->_libraryIdentifier = (NSString *)a3;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)ubiquitousIdentifier
{
  return self->_ubiquitousIdentifier;
}

- (BOOL)bookmarkTimestampModified
{
  return (propertyMonitor_0 >> 1) & 1;
}

- (BOOL)bookmarkTimeModified
{
  return propertyMonitor_0 & 1;
}

- (BOOL)userPlayCountModified
{
  return (propertyMonitor_0 >> 2) & 1;
}

- (BOOL)hasBeenPlayedModified
{
  return (propertyMonitor_0 >> 3) & 1;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
  propertyMonitor_0 |= 8u;
}

- (void)setUserPlayCount:(unint64_t)a3
{
  self->_userPlayCount = a3;
  propertyMonitor_0 |= 4u;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
  propertyMonitor_0 |= 1u;
}

- (void)setBookmarkTimestamp:(double)a3
{
  self->_bookmarkTimestamp = a3;
  propertyMonitor_0 |= 2u;
}

- (MPUbiquitousPlaybackPositionEntity)init
{
  return [(MPUbiquitousPlaybackPositionEntity *)self initWithUbiquitousIdentifier:0];
}

- (MPUbiquitousPlaybackPositionEntity)initWithUbiquitousIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPUbiquitousPlaybackPositionEntity;
  v6 = [(MPUbiquitousPlaybackPositionEntity *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ubiquitousIdentifier, a3);
    propertyMonitor_0 = 0;
  }

  return v7;
}

@end