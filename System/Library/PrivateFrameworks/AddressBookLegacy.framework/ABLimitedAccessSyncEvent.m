@interface ABLimitedAccessSyncEvent
- (BOOL)isActive;
- (NSString)bundleID;
- (NSString)contactID;
- (int64_t)sequenceNumber;
- (void)setBundleID:(id)a3;
- (void)setContactID:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation ABLimitedAccessSyncEvent

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end