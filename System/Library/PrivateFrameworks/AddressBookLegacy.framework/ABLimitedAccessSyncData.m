@interface ABLimitedAccessSyncData
- (BOOL)fullSyncRequired;
- (NSArray)syncEventsArray;
- (NSEnumerator)syncEvents;
- (int64_t)currentSequenceNumber;
- (void)setCurrentSequenceNumber:(int64_t)a3;
- (void)setFullSyncRequired:(BOOL)a3;
- (void)setSyncEventsArray:(id)a3;
@end

@implementation ABLimitedAccessSyncData

- (NSEnumerator)syncEvents
{
  v2 = [(ABLimitedAccessSyncData *)self syncEventsArray];
  v3 = [v2 objectEnumerator];

  return (NSEnumerator *)v3;
}

- (int64_t)currentSequenceNumber
{
  return self->_currentSequenceNumber;
}

- (void)setCurrentSequenceNumber:(int64_t)a3
{
  self->_currentSequenceNumber = a3;
}

- (BOOL)fullSyncRequired
{
  return self->_fullSyncRequired;
}

- (void)setFullSyncRequired:(BOOL)a3
{
  self->_fullSyncRequired = a3;
}

- (NSArray)syncEventsArray
{
  return self->_syncEventsArray;
}

- (void)setSyncEventsArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end