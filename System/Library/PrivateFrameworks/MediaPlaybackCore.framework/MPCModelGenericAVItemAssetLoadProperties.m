@interface MPCModelGenericAVItemAssetLoadProperties
- (BOOL)allowsHLSContent;
- (BOOL)isFollowUp;
- (BOOL)isRadioPlayback;
- (BOOL)prefersHighQualityContent;
- (BOOL)prefersVideoContent;
- (BOOL)supportsVocalAttenuation;
- (MPCAudioAssetTypeSelection)audioAssetTypeSelection;
- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider;
- (MPIdentifierSet)itemIdentifiers;
- (MPModelFileAsset)fileAsset;
- (MPModelGenericObject)genericObject;
- (MPModelHomeSharingAsset)homeSharingAsset;
- (MPModelStoreAsset)storeAsset;
- (NSString)householdID;
- (NSString)storefrontID;
- (int64_t)HLSContentPolicy;
- (int64_t)preferredAudioAssetType;
- (unint64_t)accountID;
- (unint64_t)delegatedAccountID;
- (void)setAccountID:(unint64_t)a3;
- (void)setAssetCacheProvider:(id)a3;
- (void)setAudioAssetTypeSelection:(id)a3;
- (void)setDelegatedAccountID:(unint64_t)a3;
- (void)setFileAsset:(id)a3;
- (void)setFollowUp:(BOOL)a3;
- (void)setGenericObject:(id)a3;
- (void)setHLSContentPolicy:(int64_t)a3;
- (void)setHomeSharingAsset:(id)a3;
- (void)setHouseholdID:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setPreferredAudioAssetType:(int64_t)a3;
- (void)setPrefersHighQualityContent:(BOOL)a3;
- (void)setPrefersVideoContent:(BOOL)a3;
- (void)setRadioPlayback:(BOOL)a3;
- (void)setStoreAsset:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setSupportsVocalAttenuation:(BOOL)a3;
@end

@implementation MPCModelGenericAVItemAssetLoadProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssetTypeSelection, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_storeAsset, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_homeSharingAsset, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);
  objc_storeStrong((id *)&self->_fileAsset, 0);

  objc_storeStrong((id *)&self->_assetCacheProvider, 0);
}

- (void)setSupportsVocalAttenuation:(BOOL)a3
{
  self->_supportsVocalAttenuation = a3;
}

- (BOOL)supportsVocalAttenuation
{
  return self->_supportsVocalAttenuation;
}

- (void)setAudioAssetTypeSelection:(id)a3
{
}

- (MPCAudioAssetTypeSelection)audioAssetTypeSelection
{
  return self->_audioAssetTypeSelection;
}

- (void)setPreferredAudioAssetType:(int64_t)a3
{
  self->_preferredAudioAssetType = a3;
}

- (int64_t)preferredAudioAssetType
{
  return self->_preferredAudioAssetType;
}

- (void)setStorefrontID:(id)a3
{
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setHouseholdID:(id)a3
{
}

- (NSString)householdID
{
  return self->_householdID;
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

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setStoreAsset:(id)a3
{
}

- (MPModelStoreAsset)storeAsset
{
  return self->_storeAsset;
}

- (void)setRadioPlayback:(BOOL)a3
{
  self->_radioPlayback = a3;
}

- (BOOL)isRadioPlayback
{
  return self->_radioPlayback;
}

- (void)setPrefersHighQualityContent:(BOOL)a3
{
  self->_prefersHighQualityContent = a3;
}

- (BOOL)prefersHighQualityContent
{
  return self->_prefersHighQualityContent;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (MPIdentifierSet)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setHomeSharingAsset:(id)a3
{
}

- (MPModelHomeSharingAsset)homeSharingAsset
{
  return self->_homeSharingAsset;
}

- (void)setGenericObject:(id)a3
{
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (void)setFileAsset:(id)a3
{
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (void)setAssetCacheProvider:(id)a3
{
}

- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider
{
  return self->_assetCacheProvider;
}

- (void)setPrefersVideoContent:(BOOL)a3
{
  self->_prefersVideoContent = a3;
}

- (BOOL)prefersVideoContent
{
  return self->_prefersVideoContent;
}

- (void)setHLSContentPolicy:(int64_t)a3
{
  self->_HLSContentPolicy = a3;
}

- (int64_t)HLSContentPolicy
{
  return self->_HLSContentPolicy;
}

- (BOOL)allowsHLSContent
{
  return [(MPCModelGenericAVItemAssetLoadProperties *)self HLSContentPolicy] != 3;
}

@end