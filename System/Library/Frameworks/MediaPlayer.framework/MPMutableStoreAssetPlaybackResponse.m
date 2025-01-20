@interface MPMutableStoreAssetPlaybackResponse
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDialogDictionary:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFileAssetInfoList:(id)a3;
- (void)setHlsAssetInfo:(id)a3;
- (void)setLiveRadioStream:(BOOL)a3;
- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3;
- (void)setRadioStreamAssetInfoList:(id)a3;
- (void)setSubscriptionRequired:(BOOL)a3;
- (void)setSuzeLeaseID:(id)a3;
@end

@implementation MPMutableStoreAssetPlaybackResponse

- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3
{
  self->super._onlineSubscriptionKeysRequired = a3;
}

- (void)setSubscriptionRequired:(BOOL)a3
{
  self->super._subscriptionRequired = a3;
}

- (void)setSuzeLeaseID:(id)a3
{
}

- (void)setRadioStreamAssetInfoList:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  radioStreamAssetInfoList = self->super._radioStreamAssetInfoList;
  self->super._radioStreamAssetInfoList = v4;
}

- (void)setLiveRadioStream:(BOOL)a3
{
  self->super._liveRadioStream = a3;
}

- (void)setHlsAssetInfo:(id)a3
{
}

- (void)setFileAssetInfoList:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  fileAssetInfoList = self->super._fileAssetInfoList;
  self->super._fileAssetInfoList = v4;
}

- (void)setExpirationDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  expirationDate = self->super._expirationDate;
  self->super._expirationDate = v4;
}

- (void)setDialogDictionary:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  dialogDictionary = self->super._dialogDictionary;
  self->super._dialogDictionary = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPStoreAssetPlaybackResponse *)self _copyWithPlaybackResponseClass:v4];
}

@end