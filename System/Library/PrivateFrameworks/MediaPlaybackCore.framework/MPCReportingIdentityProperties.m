@interface MPCReportingIdentityProperties
- (BOOL)hasSubscriptionPlaybackCapability;
- (ICPlayActivityEnqueuerProperties)enqueuerProperties;
- (NSString)householdID;
- (NSString)storeFrontID;
- (unint64_t)storeAccountID;
- (void)setEnqueuerProperties:(id)a3;
- (void)setHasSubscriptionPlaybackCapability:(BOOL)a3;
- (void)setHouseholdID:(id)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setStoreFrontID:(id)a3;
@end

@implementation MPCReportingIdentityProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);

  objc_storeStrong((id *)&self->_householdID, 0);
}

- (void)setEnqueuerProperties:(id)a3
{
}

- (ICPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (void)setHasSubscriptionPlaybackCapability:(BOOL)a3
{
  self->_hasSubscriptionPlaybackCapability = a3;
}

- (BOOL)hasSubscriptionPlaybackCapability
{
  return self->_hasSubscriptionPlaybackCapability;
}

- (void)setStoreFrontID:(id)a3
{
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->_storeAccountID = a3;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setHouseholdID:(id)a3
{
}

- (NSString)householdID
{
  return self->_householdID;
}

@end