@interface MPStoreAssetInfoPlaybackCacheRequest
- (BOOL)isEqual:(id)a3;
- (NSString)cloudUniversalLibraryID;
- (NSString)redownloadParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)requestType;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeRadioAdamID;
- (int64_t)storeSubscriptionAdamID;
- (unint64_t)accountID;
- (unint64_t)delegatedAccountID;
- (unint64_t)hash;
- (unint64_t)storeCloudID;
- (void)setAccountID:(unint64_t)a3;
- (void)setCloudUniversalLibraryID:(id)a3;
- (void)setDelegatedAccountID:(unint64_t)a3;
- (void)setRedownloadParameters:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setStoreCloudID:(unint64_t)a3;
- (void)setStorePurchasedAdamID:(int64_t)a3;
- (void)setStoreRadioAdamID:(int64_t)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
@end

@implementation MPStoreAssetInfoPlaybackCacheRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);

  objc_storeStrong((id *)&self->_redownloadParameters, 0);
}

- (void)setStoreRadioAdamID:(int64_t)a3
{
  self->_storeRadioAdamID = a3;
}

- (int64_t)storeRadioAdamID
{
  return self->_storeRadioAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setRedownloadParameters:(id)a3
{
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setDelegatedAccountID:(unint64_t)a3
{
  self->_delegatedAccountID = a3;
}

- (unint64_t)delegatedAccountID
{
  return self->_delegatedAccountID;
}

- (void)setAccountID:(unint64_t)a3
{
  self->_accountID = a3;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPStoreAssetInfoPlaybackCacheRequest *)a3;
  if (v4 == self)
  {
LABEL_18:
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_accountID == v4->_accountID
      && self->_delegatedAccountID == v4->_delegatedAccountID
      && (int64_t requestType = self->_requestType, requestType == v4->_requestType))
    {
      switch(requestType)
      {
        case 0:
        case 1:
          redownloadParameters = self->_redownloadParameters;
          if (redownloadParameters == v4->_redownloadParameters) {
            goto LABEL_18;
          }
          goto LABEL_8;
        case 2:
          int64_t storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
          int64_t storeRadioAdamID = v4->_storeSubscriptionAdamID;
          goto LABEL_11;
        case 3:
          int64_t storeSubscriptionAdamID = self->_storeRadioAdamID;
          int64_t storeRadioAdamID = v4->_storeRadioAdamID;
LABEL_11:
          char v7 = storeSubscriptionAdamID == storeRadioAdamID;
          break;
        case 4:
          if (self->_storeCloudID != v4->_storeCloudID
            || self->_storePurchasedAdamID != v4->_storePurchasedAdamID
            || self->_storeSubscriptionAdamID != v4->_storeSubscriptionAdamID)
          {
            goto LABEL_17;
          }
          redownloadParameters = self->_cloudUniversalLibraryID;
          if (redownloadParameters == v4->_cloudUniversalLibraryID) {
            goto LABEL_18;
          }
LABEL_8:
          char v7 = -[NSString isEqual:](redownloadParameters, "isEqual:");
          break;
        default:
          goto LABEL_18;
      }
    }
    else
    {
LABEL_17:
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t requestType = self->_requestType;
  unint64_t v3 = self->_delegatedAccountID ^ self->_accountID ^ requestType;
  switch(requestType)
  {
    case 0:
    case 1:
      v3 ^= [(NSString *)self->_redownloadParameters hash];
      return v3;
    case 2:
      NSUInteger storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
      goto LABEL_6;
    case 3:
      NSUInteger storeSubscriptionAdamID = self->_storeRadioAdamID;
      goto LABEL_6;
    case 4:
      unint64_t storeCloudID = self->_storeCloudID;
      int64_t storePurchasedAdamID = self->_storePurchasedAdamID;
      int64_t v7 = self->_storeSubscriptionAdamID;
      NSUInteger storeSubscriptionAdamID = v7 ^ storeCloudID ^ storePurchasedAdamID ^ [(NSString *)self->_cloudUniversalLibraryID hash];
LABEL_6:
      v3 ^= storeSubscriptionAdamID;
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 8) = self->_accountID;
    objc_storeStrong((id *)(v4 + 40), self->_cloudUniversalLibraryID);
    *(void *)(v5 + 16) = self->_delegatedAccountID;
    objc_storeStrong((id *)(v5 + 32), self->_redownloadParameters);
    *(void *)(v5 + 24) = self->_requestType;
    *(void *)(v5 + 72) = self->_storeRadioAdamID;
    *(void *)(v5 + 56) = self->_storeCloudID;
    *(void *)(v5 + 64) = self->_storePurchasedAdamID;
    *(void *)(v5 + 48) = self->_storeSubscriptionAdamID;
  }
  return (id)v5;
}

@end