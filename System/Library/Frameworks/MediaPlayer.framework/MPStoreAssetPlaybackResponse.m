@interface MPStoreAssetPlaybackResponse
- (BOOL)isLiveRadioStream;
- (BOOL)isSubscriptionRequired;
- (BOOL)onlineSubscriptionKeysRequired;
- (MPStoreHLSAssetInfo)hlsAssetInfo;
- (NSArray)fileAssetInfoList;
- (NSArray)radioStreamAssetInfoList;
- (NSDate)expirationDate;
- (NSDictionary)dialogDictionary;
- (id)_copyWithPlaybackResponseClass:(Class)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)suzeLeaseID;
@end

@implementation MPStoreAssetPlaybackResponse

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suzeLeaseID, 0);
  objc_storeStrong((id *)&self->_radioStreamAssetInfoList, 0);
  objc_storeStrong((id *)&self->_hlsAssetInfo, 0);
  objc_storeStrong((id *)&self->_fileAssetInfoList, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_dialogDictionary, 0);
}

- (BOOL)onlineSubscriptionKeysRequired
{
  return self->_onlineSubscriptionKeysRequired;
}

- (BOOL)isSubscriptionRequired
{
  return self->_subscriptionRequired;
}

- (id)suzeLeaseID
{
  return self->_suzeLeaseID;
}

- (NSArray)radioStreamAssetInfoList
{
  return self->_radioStreamAssetInfoList;
}

- (BOOL)isLiveRadioStream
{
  return self->_liveRadioStream;
}

- (MPStoreHLSAssetInfo)hlsAssetInfo
{
  return self->_hlsAssetInfo;
}

- (NSArray)fileAssetInfoList
{
  return self->_fileAssetInfoList;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (id)_copyWithPlaybackResponseClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_dialogDictionary copy];
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    objc_storeStrong((id *)v4 + 2, self->_expirationDate);
    objc_storeStrong((id *)v4 + 3, self->_fileAssetInfoList);
    objc_storeStrong((id *)v4 + 4, self->_hlsAssetInfo);
    *((unsigned char *)v4 + 40) = self->_liveRadioStream;
    uint64_t v7 = [(NSArray *)self->_radioStreamAssetInfoList copy];
    v8 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v7;

    objc_storeStrong((id *)v4 + 7, self->_suzeLeaseID);
    *((unsigned char *)v4 + 64) = self->_subscriptionRequired;
    *((unsigned char *)v4 + 65) = self->_onlineSubscriptionKeysRequired;
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPStoreAssetPlaybackResponse *)self _copyWithPlaybackResponseClass:v4];
}

@end