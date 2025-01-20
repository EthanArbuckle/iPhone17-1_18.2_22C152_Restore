@interface BLDownloadMetadata
- (BLDownloadMetadata)init;
- (BLDownloadMetadata)initWithDictionary:(id)a3;
- (BOOL)hasHDR;
- (BOOL)isAutomaticDownload;
- (BOOL)isCompilation;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isExplicitContent;
- (BOOL)isHighDefinition;
- (BOOL)isMusicShow;
- (BOOL)isRedownloadDownload;
- (BOOL)isRental;
- (BOOL)isSample;
- (BOOL)isSharedResource;
- (BOOL)shouldDownloadAutomatically;
- (NSArray)MD5HashStrings;
- (NSArray)sinfs;
- (NSData)epubRightsData;
- (NSDate)releaseDate;
- (NSDictionary)dictionary;
- (NSDictionary)primaryAssetDictionary;
- (NSNumber)downloaderAccountIdentifier;
- (NSNumber)numberOfBytesToHash;
- (NSNumber)releaseYear;
- (NSNumber)rentalID;
- (NSNumber)requestPersistentID;
- (NSString)appleID;
- (NSString)artistName;
- (NSString)copyright;
- (NSString)downloadKey;
- (NSString)fileExtension;
- (NSString)genre;
- (NSString)kind;
- (NSString)longDescription;
- (NSString)pageProgressionDirection;
- (NSString)preferredAssetFlavor;
- (NSString)redownloadActionParameters;
- (NSString)releaseDateString;
- (NSString)shortDescription;
- (NSString)sortArtistName;
- (NSString)sortCollectionName;
- (NSString)sortTitle;
- (NSString)title;
- (NSString)transactionIdentifier;
- (NSURL)cancelDownloadURL;
- (NSURL)fullSizeImageURL;
- (NSURL)hlsPlaylistURL;
- (NSURL)launchExtrasUrl;
- (NSURL)primaryAssetURL;
- (NSURL)thumbnailImageURL;
- (id)_assetDictionary;
- (id)_dateValueForValue:(id)a3;
- (id)_newDateFormatter;
- (id)_newImageCollectionWithURLString:(id)a3;
- (id)_releaseDateValue;
- (id)_stringValueForValue:(id)a3;
- (id)_thumbnailArtworkImage;
- (id)_urlValueForValue:(id)a3;
- (id)_valueForFirstAvailableTopLevelKey:(id)a3;
- (id)betaExternalVersionIdentifier;
- (id)bundleIdentifier;
- (id)cloudIdentifier;
- (id)collectionArtistName;
- (id)collectionIndexInCollectionGroup;
- (id)collectionName;
- (id)composerName;
- (id)contentRating;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downloadPermalink;
- (id)durationInMilliseconds;
- (id)episodeIdentifier;
- (id)episodeSortIdentifier;
- (id)indexInCollection;
- (id)longSeasonDescription;
- (id)movementCount;
- (id)movementName;
- (id)movementNumber;
- (id)networkName;
- (id)numberOfCollectionsInCollectionGroup;
- (id)numberOfItemsInCollection;
- (id)podcastEpisodeGUID;
- (id)podcastFeedURL;
- (id)podcastType;
- (id)publicationVersion;
- (id)purchaseDate;
- (id)racGUID;
- (id)requiredDeviceCapabilities;
- (id)seasonNumber;
- (id)seriesName;
- (id)showComposer;
- (id)thumbnailImageCollection;
- (id)valueForFirstAvailableKey:(id)a3;
- (id)valueForMetadataKey:(id)a3;
- (id)variantIdentifier;
- (id)videoDetailsDictionary;
- (id)viewStoreItemURL;
- (id)workName;
- (int64_t)keyStyle;
- (unint64_t)artistIdentifier;
- (unint64_t)collectionIdentifier;
- (unint64_t)composerIdentifier;
- (unint64_t)genreIdentifier;
- (unint64_t)itemIdentifier;
- (unint64_t)preOrderIdentifier;
- (void)_setValue:(id)a3 forTopLevelKey:(id)a4;
- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4;
- (void)setAppleID:(id)a3;
- (void)setArtistIdentifier:(unint64_t)a3;
- (void)setArtistName:(id)a3;
- (void)setAutomaticDownload:(BOOL)a3;
- (void)setBetaExternalVersionIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCloudIdentifier:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionIdentifier:(unint64_t)a3;
- (void)setCollectionIndexInCollectionGroup:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setCompilation:(BOOL)a3;
- (void)setComposerIdentifier:(unint64_t)a3;
- (void)setComposerName:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setCopyright:(id)a3;
- (void)setDeviceBasedVPP:(BOOL)a3;
- (void)setDictionary:(id)a3;
- (void)setDownloadKey:(id)a3;
- (void)setDownloadPermalink:(id)a3;
- (void)setDurationInMilliseconds:(id)a3;
- (void)setEpisodeIdentifier:(id)a3;
- (void)setEpisodeSortIdentifier:(id)a3;
- (void)setEpubRightsData:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setFileExtension:(id)a3;
- (void)setFullSizeImageURL:(id)a3;
- (void)setGenre:(id)a3;
- (void)setGenreIdentifier:(unint64_t)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setHlsPlaylistURL:(id)a3;
- (void)setIndexInCollection:(id)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setKeyStyle:(int64_t)a3;
- (void)setKind:(id)a3;
- (void)setLaunchExtrasUrl:(id)a3;
- (void)setLongDescription:(id)a3;
- (void)setLongSeasonDescription:(id)a3;
- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4;
- (void)setMusicShow:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setNumberOfCollectionsInCollectionGroup:(id)a3;
- (void)setNumberOfItemsInCollection:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setPodcastEpisodeGUID:(id)a3;
- (void)setPodcastFeedURL:(id)a3;
- (void)setPodcastType:(id)a3;
- (void)setPreOrderIdentifier:(unint64_t)a3;
- (void)setPreferredAssetFlavor:(id)a3;
- (void)setPrimaryAssetURL:(id)a3;
- (void)setPublicationVersion:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRacGUID:(id)a3;
- (void)setRedownloadActionParameters:(id)a3;
- (void)setRedownloadDownload:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseDateString:(id)a3;
- (void)setReleaseYear:(id)a3;
- (void)setRental:(BOOL)a3;
- (void)setRentalID:(id)a3;
- (void)setRequestPersistentID:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setSample:(BOOL)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setSeriesName:(id)a3;
- (void)setSharedResource:(BOOL)a3;
- (void)setShortDescription:(id)a3;
- (void)setShouldDownloadAutomatically:(BOOL)a3;
- (void)setSinfs:(id)a3;
- (void)setSortArtistName:(id)a3;
- (void)setSortCollectionName:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setThumbnailNewsstandBindingEdge:(id)a3;
- (void)setThumbnailNewsstandBindingType:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setValue:(id)a3 forMetadataKey:(id)a4;
- (void)setVariantIdentifier:(id)a3;
- (void)setVideoDetailsDictionary:(id)a3;
- (void)setViewStoreItemURL:(id)a3;
@end

@implementation BLDownloadMetadata

- (BLDownloadMetadata)init
{
  return (BLDownloadMetadata *)objc_msgSend_initWithDictionary_(self, a2, 0, v2);
}

- (BLDownloadMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLDownloadMetadata;
  v8 = [(BLDownloadMetadata *)&v14 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSMutableDictionary *)v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v8->_lock;
    v8->_lock = v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  objc_msgSend_lock(self->_lock, v13, v14, v15);
  uint64_t v18 = objc_msgSend_mutableCopyWithZone_(self->_dictionary, v16, (uint64_t)a3, v17);
  v19 = (void *)v12[1];
  v12[1] = v18;

  objc_msgSend_unlock(self->_lock, v20, v21, v22);
  return v12;
}

- (unint64_t)artistIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"artistId", v2, @"artist-id", 0);
  unint64_t v4 = BLGetItemIdentifierFromValue();

  return v4;
}

- (NSString)artistName
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"artistName", v2, @"artist-name", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)betaExternalVersionIdentifier
{
  v3 = objc_msgSend_valueForMetadataKey_(self, a2, @"betaExternalVersionIdentifier", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)bundleIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"softwareVersionBundleId", v2, @"bundle-id", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)cloudIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"cloud-id", v2, @"sagaId", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)collectionArtistName
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"playlistArtistName", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)collectionIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"playlistId", v2, @"collection-id", 0);
  unint64_t v4 = BLGetItemIdentifierFromValue();

  return v4;
}

- (id)collectionIndexInCollectionGroup
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"discNumber", v2, @"disc-number", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)collectionName
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"playlistName", v2, @"collection-name", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)composerIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"composerId", v2, @"composer-id", 0);
  unint64_t v4 = BLGetItemIdentifierFromValue();

  return v4;
}

- (id)composerName
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"composerName", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)contentRating
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"rating", v2, 0);
  objc_opt_class();
  unint64_t v4 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v5 = [BLItemContentRating alloc];
    unint64_t v4 = objc_msgSend_initWithDictionary_(v5, v6, (uint64_t)v3, v7);
  }

  return v4;
}

- (id)downloadPermalink
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"download-permalink", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)durationInMilliseconds
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"duration", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)episodeIdentifier
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"episode-number", v2, 0);
  uint64_t v7 = objc_msgSend__stringValueForValue_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (id)episodeSortIdentifier
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"episode-sort-id", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_indexInCollection(self, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

- (NSURL)fullSizeImageURL
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"artworkURL", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_URLWithString_(NSURL, v5, (uint64_t)v4, v6);
  }
  else
  {
    uint64_t v8 = objc_msgSend_valueForFirstAvailableKey_(self, v5, @"artwork-urls", v6, 0);

    if (v8)
    {
      uint64_t v9 = [BLItemImageCollection alloc];
      v12 = objc_msgSend_initWithImageCollection_(v9, v10, v8, v11);
      v16 = objc_msgSend_bestImageForSize_(v12, v13, v14, v15, 0.0, 0.0);
      uint64_t v7 = objc_msgSend_URL(v16, v17, v18, v19);

      unint64_t v4 = (void *)v8;
    }
    else
    {
      unint64_t v4 = 0;
      uint64_t v7 = 0;
    }
  }

  return (NSURL *)v7;
}

- (NSString)genre
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"genre", v2, @"genreName", @"genre-name", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)genreIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"genreId", v2, @"genre-id", 0);
  unint64_t v4 = BLGetItemIdentifierFromValue();

  return v4;
}

- (NSURL)hlsPlaylistURL
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"hls-playlist-url", v2, 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);
  }

  return (NSURL *)v6;
}

- (id)indexInCollection
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"trackNumber", v2, @"track-number", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isCompilation
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"compilation", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isDeviceBasedVPP
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"isDeviceBased", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isExplicitContent
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"explicit", v2, 0);
  BOOL v7 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_integerValue(v3, v4, v5, v6) == 1;

  return v7;
}

- (BOOL)hasHDR
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"has-hdr", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isHighDefinition
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"high-definition", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isRental
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"isRental", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isSample
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"isSample", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isSharedResource
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"isSharedResource", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)itemIdentifier
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"itemId", v2, @"songId", @"item-id", 0);
  unint64_t v4 = BLGetItemIdentifierFromValue();

  return v4;
}

- (NSString)kind
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"kind", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSURL)launchExtrasUrl
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"launch-extras-url", v2, 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);
  }

  return (NSURL *)v6;
}

- (NSString)longDescription
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"longDescription", v2, @"long-description", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)networkName
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"network-name", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)numberOfCollectionsInCollectionGroup
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"discCount", v2, @"disc-count", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)numberOfItemsInCollection
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"trackCount", v2, @"track-count", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)racGUID
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"sgGuid", v2, 0);
  char v7 = objc_msgSend__stringValueForValue_(self, v5, (uint64_t)v4, v6);

  if (objc_msgSend_length(v7, v8, v9, v10))
  {
    id v11 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v14 = objc_msgSend_initWithUUIDString_(v11, v12, (uint64_t)v7, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)podcastEpisodeGUID
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"episode-guid", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)podcastFeedURL
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"podcast-feed-url", v2, 0);
  char v7 = objc_msgSend__urlValueForValue_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (id)podcastType
{
  v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"podcast-type", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSDictionary)primaryAssetDictionary
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  uint64_t v8 = objc_msgSend__assetDictionary(self, v5, v6, v7);
  v12 = objc_msgSend_copy(v8, v9, v10, v11);

  objc_msgSend_unlock(self->_lock, v13, v14, v15);

  return (NSDictionary *)v12;
}

- (id)purchaseDate
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"purchaseDate", v2, 0);
  uint64_t v7 = objc_msgSend__dateValueForValue_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (NSDate)releaseDate
{
  id v5 = objc_msgSend__releaseDateValue(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__dateValueForValue_(self, v6, (uint64_t)v5, v7);

  return (NSDate *)v8;
}

- (NSNumber)releaseYear
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"year", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSNumber)rentalID
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"rental-id", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)seasonNumber
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"season-number", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)seriesName
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"show-name", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_collectionName(self, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)longSeasonDescription
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"longSeasonDescription", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setArtistIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_keyStyle(self, v5, v6, v7) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"artist-id");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"artistId");
  }
}

- (void)setArtistName:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend__setValueCopy_forMetadataKey_(self, v7, (uint64_t)v8, @"artist-name");
  }
  else {
    objc_msgSend__setValueCopy_forMetadataKey_(self, v7, (uint64_t)v8, @"artistName");
  }
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setCloudIdentifier:(id)a3
{
}

- (void)setCollectionArtistName:(id)a3
{
}

- (void)setCollectionIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_keyStyle(self, v5, v6, v7) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"collection-id");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"playlistId");
  }
}

- (void)setCollectionIndexInCollectionGroup:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"disc-number");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"discNumber");
  }
}

- (void)setCollectionName:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"collection-name");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"playlistName");
  }
}

- (void)setCompilation:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"compilation");
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"isDeviceBased");
}

- (void)setComposerIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_keyStyle(self, v5, v6, v7) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"composer-id");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"composerId");
  }
}

- (void)setComposerName:(id)a3
{
}

- (void)setContentRating:(id)a3
{
  objc_msgSend_contentRatingDictionary(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"rating");
}

- (void)setDurationInMilliseconds:(id)a3
{
}

- (void)setEpisodeIdentifier:(id)a3
{
}

- (void)setEpisodeSortIdentifier:(id)a3
{
}

- (void)setExplicitContent:(BOOL)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"explicit");
}

- (void)setFullSizeImageURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"artworkURL");
}

- (void)setGenre:(id)a3
{
}

- (void)setGenreIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_keyStyle(self, v5, v6, v7) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"genre-id");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"genreId");
  }
}

- (void)setHighDefinition:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"high-definition");
}

- (void)setHlsPlaylistURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"hls-playlist-url");
}

- (void)setIndexInCollection:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"track-number");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"trackNumber");
  }
}

- (void)setItemIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_keyStyle(self, v5, v6, v7) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"item-id");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v8, (uint64_t)v9, @"itemId");
  }
}

- (void)setKind:(id)a3
{
}

- (void)setLaunchExtrasUrl:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"launch-extras-url");
}

- (void)setLongDescription:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend__setValueCopy_forMetadataKey_(self, v7, (uint64_t)v8, @"long-description");
  }
  else {
    objc_msgSend__setValueCopy_forMetadataKey_(self, v7, (uint64_t)v8, @"longDescription");
  }
}

- (void)setNetworkName:(id)a3
{
}

- (void)setNumberOfCollectionsInCollectionGroup:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"disc-count");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"discCount");
  }
}

- (void)setNumberOfItemsInCollection:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"track-count");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"trackCount");
  }
}

- (void)setRacGUID:(id)a3
{
  objc_msgSend_UUIDString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"sgGuid");
}

- (void)setPodcastEpisodeGUID:(id)a3
{
}

- (void)setPodcastFeedURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"podcast-feed-url");
}

- (void)setPodcastType:(id)a3
{
}

- (void)setPurchaseDate:(id)a3
{
}

- (void)setReleaseDate:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"release-date");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"releaseDate");
  }
}

- (void)setReleaseYear:(id)a3
{
}

- (void)setRental:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"isRental");
}

- (void)setRentalID:(id)a3
{
}

- (void)setSample:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"isSample");
}

- (void)setMusicShow:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"is-apple-music-show");
}

- (void)setSeasonNumber:(id)a3
{
}

- (void)setSharedResource:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setValueCopy_forMetadataKey_(self, v5, (uint64_t)v6, @"isSharedResource");
}

- (void)setSeriesName:(id)a3
{
}

- (void)setLongSeasonDescription:(id)a3
{
}

- (void)setShortDescription:(id)a3
{
}

- (void)setSortArtistName:(id)a3
{
}

- (void)setSortCollectionName:(id)a3
{
}

- (void)setSortTitle:(id)a3
{
}

- (void)setThumbnailNewsstandBindingEdge:(id)a3
{
}

- (void)setThumbnailNewsstandBindingType:(id)a3
{
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"thumbnail-url");
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  objc_msgSend_setValue_forMetadataKey_(self, v4, (uint64_t)v6, @"title");
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"unmodified-title");
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (void)setVariantIdentifier:(id)a3
{
}

- (void)setVideoDetailsDictionary:(id)a3
{
}

- (void)setViewStoreItemURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"url");
}

- (NSString)shortDescription
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"description", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)sortArtistName
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"sort-artist", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_subtitle(self, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return (NSString *)v9;
}

- (NSString)sortCollectionName
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"sort-album", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_collectionName(self, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return (NSString *)v9;
}

- (NSString)sortTitle
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"sort-name", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_title(self, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return (NSString *)v9;
}

- (id)thumbnailImageCollection
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"thumbnail-url", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend__newImageCollectionWithURLString_(self, v5, (uint64_t)v4, v6);
    if (v7)
    {
      id v8 = (void *)v7;
LABEL_6:
      v16 = v4;
      goto LABEL_10;
    }
  }
  uint64_t v9 = objc_msgSend_valueForFirstAvailableKey_(self, v5, @"artwork-urls", v6, 0);
  if (v9)
  {
    v12 = (void *)v9;
    uint64_t v13 = [BLItemImageCollection alloc];
    id v8 = objc_msgSend_initWithImageCollection_(v13, v14, (uint64_t)v12, v15);

    if (v8) {
      goto LABEL_6;
    }
  }
  v16 = objc_msgSend_valueForFirstAvailableKey_(self, v10, @"softwareIcon57x57URL", v11, @"icon-url", 0);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = objc_msgSend__newImageCollectionWithURLString_(self, v17, (uint64_t)v16, v18);
  }
  else {
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (NSURL)thumbnailImageURL
{
  unint64_t v4 = objc_msgSend__thumbnailArtworkImage(self, a2, v2, v3);
  id v8 = objc_msgSend_URL(v4, v5, v6, v7);

  return (NSURL *)v8;
}

- (NSString)title
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"unmodified-title", v2, @"title", @"itemName", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)transactionIdentifier
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"download-id", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)variantIdentifier
{
  uint64_t v3 = objc_msgSend_valueForMetadataKey_(self, a2, @"variantId", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)videoDetailsDictionary
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"videoDetails", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)viewStoreItemURL
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"url", v2, 0);
  uint64_t v7 = objc_msgSend__urlValueForValue_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (id)showComposer
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"show-composer", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isMusicShow
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"is-apple-music-show", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)workName
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"work", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)movementName
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"movement", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)movementNumber
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"movement-number", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)movementCount
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"movement-count", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSURL)cancelDownloadURL
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"cancel-download-url", v2, 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);
  }

  return (NSURL *)v6;
}

- (NSString)copyright
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"copyright", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_dictionary;
}

- (NSNumber)downloaderAccountIdentifier
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"com.apple.iTunesStore.downloadInfo", v2, 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    char v7 = objc_msgSend_objectForKey_(v3, v4, @"accountInfo", v5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend_objectForKey_(v7, v8, @"DownloaderID", v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10;

  return v11;
}

- (NSString)downloadKey
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"downloadKey", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSData)epubRightsData
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"epr", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)fileExtension
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"fileExtension", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (int64_t)keyStyle
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  int64_t keyStyle = self->_keyStyle;
  objc_msgSend_unlock(self->_lock, v6, v7, v8);
  return keyStyle;
}

- (BOOL)isAutomaticDownload
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"is-auto-download", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isRedownloadDownload
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"is-redownload", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (NSArray)MD5HashStrings
{
  unint64_t v4 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"chunks", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = objc_msgSend_objectForKey_(v4, v5, @"chunks", v6);
  }
  else
  {
    uint64_t v8 = objc_msgSend_valueForFirstAvailableKey_(self, v5, @"md5", v6, 0);
    objc_opt_class();
    char v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      char v7 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v9, (uint64_t)v8, v10);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (NSNumber)numberOfBytesToHash
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"chunks", v2, 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"chunkSize", v5);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (NSString)pageProgressionDirection
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"page-progression-direction", v2, @"pageProgressionDirection", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)preferredAssetFlavor
{
  uint64_t v3 = objc_msgSend_valueForMetadataKey_(self, a2, @"com.apple.iTunesStore.downloadInfo", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"preferredAssetFlavor", v5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (id)publicationVersion
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"publication-version", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)preOrderIdentifier
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"preorder-id", v2, 0);
  objc_opt_class();
  unint64_t v7 = 0;
  if (objc_opt_isKindOfClass()) {
    unint64_t v7 = objc_msgSend_bl_itemIdentifierValue(v3, v4, v5, v6);
  }

  return v7;
}

- (NSURL)primaryAssetURL
{
  uint64_t v3 = objc_msgSend__valueForFirstAvailableTopLevelKey_(self, a2, @"URL", v2, @"url", 0);
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);
  }

  return (NSURL *)v6;
}

- (NSString)redownloadActionParameters
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"buy-params-256", v2, @"buyParams", @"action-params", @"redownload-params", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSString)releaseDateString
{
  uint64_t v5 = objc_msgSend__releaseDateValue(self, a2, v2, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend__newDateFormatter(self, v6, v7, v8);
    uint64_t v12 = objc_msgSend_stringFromDate_(v9, v10, (uint64_t)v5, v11);

    uint64_t v5 = (void *)v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13;

  return v14;
}

- (NSNumber)requestPersistentID
{
  uint64_t v3 = objc_msgSend_valueForMetadataKey_(self, a2, @"com.apple.iTunesStore.downloadInfo", v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"requestPersistentID", v5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = objc_msgSend_copy(v6, v7, v8, v9);
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (NSNumber *)v10;
}

- (id)requiredDeviceCapabilities
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"UIRequiredDeviceCapabilities", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSString)appleID
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"appleId", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setAutomaticDownload:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"is-auto-download");
}

- (void)setCancelDownloadURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"cancel-download-url");
}

- (void)setCopyright:(id)a3
{
}

- (void)setDictionary:(id)a3
{
  uint64_t v12 = (NSMutableDictionary *)a3;
  objc_msgSend_lock(self->_lock, v4, v5, v6);
  if (self->_dictionary != v12)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v12, v7, v8, v9);
    dictionary = self->_dictionary;
    self->_dictionary = v10;
  }
  objc_msgSend_unlock(self->_lock, v7, v8, v9);
}

- (void)setDownloadKey:(id)a3
{
}

- (void)setDownloadPermalink:(id)a3
{
}

- (void)setEpubRightsData:(id)a3
{
}

- (void)setFileExtension:(id)a3
{
}

- (void)setKeyStyle:(int64_t)a3
{
  objc_msgSend_lock(self->_lock, a2, a3, v3);
  self->_int64_t keyStyle = a3;
  lock = self->_lock;

  objc_msgSend_unlock(lock, v6, v7, v8);
}

- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (objc_msgSend_count(v28, v7, v8, v9))
  {
    if (objc_msgSend_count(v28, v10, v11, v12) == 1)
    {
      objc_msgSend_setValue_forMetadataKey_(self, v13, 0, @"chunks");
      objc_msgSend_objectAtIndex_(v28, v15, 0, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forMetadataKey_(self, v18, (uint64_t)v17, @"md5");
    }
    else
    {
      v20 = objc_msgSend_valueForFirstAvailableKey_(self, v13, @"chunks", v14, 0);
      id v17 = (id)objc_msgSend_mutableCopy(v20, v21, v22, v23);

      if (!v17) {
        id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      objc_msgSend_setObject_forKey_(v17, v24, (uint64_t)v28, @"chunks");
      objc_msgSend_setObject_forKey_(v17, v25, (uint64_t)v6, @"chunkSize");
      objc_msgSend_setValue_forMetadataKey_(self, v26, (uint64_t)v17, @"chunks");
      objc_msgSend_setValue_forMetadataKey_(self, v27, 0, @"md5");
    }
  }
  else
  {
    objc_msgSend_setValue_forMetadataKey_(self, v10, 0, @"chunks");
    objc_msgSend_setValue_forMetadataKey_(self, v19, 0, @"md5");
  }
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (void)setPublicationVersion:(id)a3
{
}

- (void)setPreferredAssetFlavor:(id)a3
{
  id v17 = (char *)a3;
  id v6 = objc_msgSend_valueForMetadataKey_(self, v4, @"com.apple.iTunesStore.downloadInfo", v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend_mutableCopy(v6, v7, v8, v9);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v10 = objc_msgSend_initWithCapacity_(v11, v12, 1, v13);
  }
  uint64_t v14 = (void *)v10;

  if (v17) {
    objc_msgSend_setObject_forKey_(v14, v17, (uint64_t)v17, @"preferredAssetFlavor");
  }
  else {
    objc_msgSend_removeObjectForKey_(v14, 0, @"preferredAssetFlavor", v15);
  }
  objc_msgSend_setValue_forMetadataKey_(self, v16, (uint64_t)v14, @"com.apple.iTunesStore.downloadInfo");
}

- (void)setPreOrderIdentifier:(unint64_t)a3
{
  objc_msgSend_bl_numberWithItemIdentifier_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"preorder-id");
}

- (void)setPrimaryAssetURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setValue_forTopLevelKey_(self, v5, (uint64_t)v6, @"URL");
}

- (void)setRedownloadActionParameters:(id)a3
{
}

- (void)setRedownloadDownload:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"is-redownload");
}

- (void)setReleaseDateString:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_keyStyle(self, v4, v5, v6) == 1) {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"release-date");
  }
  else {
    objc_msgSend_setValue_forMetadataKey_(self, v7, (uint64_t)v8, @"releaseDate");
  }
}

- (void)setRequestPersistentID:(id)a3
{
  id v17 = (char *)a3;
  uint64_t v6 = objc_msgSend_valueForMetadataKey_(self, v4, @"com.apple.iTunesStore.downloadInfo", v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend_mutableCopy(v6, v7, v8, v9);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v10 = objc_msgSend_initWithCapacity_(v11, v12, 1, v13);
  }
  uint64_t v14 = (void *)v10;

  if (v17) {
    objc_msgSend_setObject_forKey_(v14, v17, (uint64_t)v17, @"requestPersistentID");
  }
  else {
    objc_msgSend_removeObjectForKey_(v14, 0, @"requestPersistentID", v15);
  }
  objc_msgSend_setValue_forMetadataKey_(self, v16, (uint64_t)v14, @"com.apple.iTunesStore.downloadInfo");
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
}

- (void)setShouldDownloadAutomatically:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forMetadataKey_(self, v5, (uint64_t)v6, @"auto-download");
}

- (void)setSinfs:(id)a3
{
}

- (void)setAppleID:(id)a3
{
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  v31 = (char *)a3;
  id v6 = a4;
  objc_msgSend_lock(self->_lock, v7, v8, v9);
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v14 = self->_dictionary;
    self->_dictionary = v13;

    dictionary = self->_dictionary;
  }
  uint64_t v15 = objc_msgSend_objectForKey_(dictionary, v10, @"metadata", v11);
  if (v15)
  {
    uint64_t v16 = (NSMutableDictionary *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v20 = objc_msgSend_classForCoder(v16, v17, v18, v19),
          uint64_t v21 = objc_opt_class(),
          (objc_msgSend_isEqual_(v20, v22, v21, v23) & 1) == 0))
    {
      uint64_t v24 = objc_msgSend_mutableCopy(v16, v17, v18, v19);

      objc_msgSend_setObject_forKey_(self->_dictionary, v25, v24, @"metadata");
      uint64_t v16 = (NSMutableDictionary *)v24;
    }
  }
  else
  {
    uint64_t v16 = self->_dictionary;
  }
  if (v31)
  {
    objc_msgSend_setObject_forKey_(v16, v31, (uint64_t)v31, (uint64_t)v6);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(v16, 0, (uint64_t)v6, v19);
    objc_msgSend_removeObjectForKey_(self->_dictionary, v29, (uint64_t)v6, v30);
  }
  objc_msgSend_unlock(self->_lock, v26, v27, v28);
}

- (BOOL)shouldDownloadAutomatically
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"auto-download", v2, 0);
  if (objc_opt_respondsToSelector()) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (NSArray)sinfs
{
  uint64_t v3 = objc_msgSend_valueForFirstAvailableKey_(self, a2, @"sinfs", v2, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)valueForFirstAvailableKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self->_lock, v5, v6, v7);
  uint64_t v11 = objc_msgSend__assetDictionary(self, v8, v9, v10);
  id v17 = objc_msgSend_objectForKey_(self->_dictionary, v12, @"metadata", v13);
  if (!v17)
  {
    id v17 = objc_msgSend_objectForKey_(v11, v14, @"metadata", v16);
  }
  uint64_t v27 = (id *)&v29;
  if (v4)
  {
    do
    {
      v20 = objc_msgSend_objectForKey_(v11, v14, (uint64_t)v4, v16);
      if (!v20)
      {
        v20 = objc_msgSend_objectForKey_(v17, v18, (uint64_t)v4, v19);
        if (!v20)
        {
          v20 = objc_msgSend_objectForKey_(self->_dictionary, v21, (uint64_t)v4, v22);
        }
      }
      uint64_t v23 = v27++;
      id v24 = *v23;

      if (v24) {
        BOOL v25 = v20 == 0;
      }
      else {
        BOOL v25 = 0;
      }
      id v4 = v24;
    }
    while (v25);
  }
  else
  {
    v20 = 0;
    id v24 = 0;
  }
  objc_msgSend_unlock(self->_lock, v14, v15, v16);

  return v20;
}

- (id)valueForMetadataKey:(id)a3
{
  return (id)objc_msgSend_valueForFirstAvailableKey_(self, a2, (uint64_t)a3, v3, 0);
}

- (id)_assetDictionary
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_objectForKey_(self->_dictionary, a2, @"metadata", v2);
  objc_msgSend_objectForKey_(v4, v5, @"kind", v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_objectForKey_(self->_dictionary, v8, @"assets", v9);
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v13 = 0;
    }
  }
  if (!v7)
  {
    objc_msgSend_objectForKey_(self->_dictionary, v10, @"kind", v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      uint64_t v14 = objc_msgSend_firstObject(v13, v10, v11, v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = objc_msgSend_objectForKey_(v14, v15, @"metadata", v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = objc_msgSend_objectForKey_(v17, v18, @"kind", v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v7 = v20;
          }
          else {
            id v7 = 0;
          }
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  if (objc_msgSend_count(v13, v10, v11, v12))
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    v26 = objc_msgSend_objectForKey_(v4, v22, @"com.apple.iTunesStore.downloadInfo", v23);
    if (!v26)
    {
      v26 = objc_msgSend_objectForKey_(self->_dictionary, v24, @"com.apple.iTunesStore.downloadInfo", v25);
    }
    unint64_t v27 = 0x263EFF000uLL;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = objc_msgSend_objectForKey_(v26, v28, @"preferredAssetFlavor", v29);
      if (objc_msgSend_length(v30, v31, v32, v33)) {
        objc_msgSend_addObject_(v21, v34, (uint64_t)v30, v35);
      }
    }
    if (objc_msgSend_isEqualToString_(v7, v28, @"ebook", v29))
    {
      GSMainScreenScaleFactor();
      if (v41 == 1.0)
      {
        v42 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v39, @"lrpluspub", v40, @"lrpub", 0);
        objc_msgSend_addObjectsFromArray_(v21, v43, (uint64_t)v42, v44);
      }
      v45 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v39, @"pluspub", v40, @"pub", 0);
      objc_msgSend_addObjectsFromArray_(v21, v46, (uint64_t)v45, v47);
    }
    id v85 = v7;
    v86 = v4;
    v84 = v26;
    if (objc_msgSend_count(v21, v36, v37, v38))
    {
      uint64_t v51 = objc_msgSend_count(v13, v48, v49, v50);
      if (v51 < 1)
      {
        id v89 = 0;
      }
      else
      {
        uint64_t v54 = v51;
        uint64_t v55 = 0;
        id v89 = 0;
        v56 = @"flavor";
        uint64_t v87 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v57 = 0x263F08000uLL;
        do
        {
          v58 = objc_msgSend_objectAtIndex_(v13, v52, v55, v53);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v61 = objc_msgSend_objectForKey_(v58, v59, (uint64_t)v56, v60);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v64 = v56;
              v65 = v13;
              unint64_t v66 = v57;
              unint64_t v67 = v27;
              id v68 = v21;
              uint64_t v69 = objc_msgSend_indexOfObject_(v21, v62, (uint64_t)v61, v63);
              if (v69 < v87)
              {
                uint64_t v70 = v69;
                id v88 = v58;

                id v71 = v88;
                uint64_t v87 = v70;
                id v89 = v71;
              }
              id v21 = v68;
              unint64_t v27 = v67;
              unint64_t v57 = v66;
              uint64_t v13 = v65;
              v56 = v64;
            }
          }
          ++v55;
        }
        while (v54 != v55);
      }
    }
    else
    {
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v73 = v13;
      uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v90, (uint64_t)v94, 16);
      if (v75)
      {
        uint64_t v76 = v75;
        id v77 = v21;
        uint64_t v78 = *(void *)v91;
        while (2)
        {
          for (uint64_t i = 0; i != v76; ++i)
          {
            if (*(void *)v91 != v78) {
              objc_enumerationMutation(v73);
            }
            v80 = *(void **)(*((void *)&v90 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v89 = v80;
              goto LABEL_50;
            }
          }
          uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v81, (uint64_t)&v90, (uint64_t)v94, 16);
          if (v76) {
            continue;
          }
          break;
        }
        id v89 = 0;
LABEL_50:
        id v21 = v77;
      }
      else
      {
        id v89 = 0;
      }
    }
    id v7 = v85;
    id v4 = v86;
    v72 = v89;
  }
  else
  {
    v72 = 0;
  }
  id v82 = v72;

  return v82;
}

- (id)_dateValueForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend__newDateFormatter(self, v5, v6, v7);
    uint64_t v11 = objc_msgSend_dateFromString_(v8, v9, (uint64_t)v4, v10);

    id v4 = (id)v11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)_newImageCollectionWithURLString:(id)a3
{
  uint64_t v3 = (objc_class *)NSURL;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v8 = objc_msgSend_initWithString_(v5, v6, (uint64_t)v4, v7);

  if (v8)
  {
    uint64_t v9 = objc_alloc_init(BLItemArtworkImage);
    objc_msgSend_setURL_(v9, v10, (uint64_t)v8, v11);
    objc_msgSend_setImageKind_(v9, v12, @"download-queue-item.default", v13);
    uint64_t v14 = [BLItemImageCollection alloc];
    id v17 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v15, (uint64_t)v9, v16);
    v20 = objc_msgSend_initWithItemImages_(v14, v18, (uint64_t)v17, v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_newDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDateFormat_(v2, v3, @"yyyy-MM-dd'T'HH:mm:ss'Z'", v4);
  objc_msgSend_setLenient_(v2, v5, 1, v6);
  uint64_t v9 = objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x263EFFA18], v7, 0, v8);
  objc_msgSend_setTimeZone_(v2, v10, (uint64_t)v9, v11);

  return v2;
}

- (id)_releaseDateValue
{
  return (id)objc_msgSend_valueForFirstAvailableKey_(self, a2, @"releaseDate", v2, @"release-date", 0);
}

- (void)_setValue:(id)a3 forTopLevelKey:(id)a4
{
  id v17 = (char *)a3;
  id v6 = a4;
  objc_msgSend_lock(self->_lock, v7, v8, v9);
  if (!self->_dictionary)
  {
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = self->_dictionary;
    self->_dictionary = v11;
  }
  uint64_t v13 = self->_dictionary;
  if (v17) {
    objc_msgSend_setObject_forKey_(v13, v17, (uint64_t)v17, (uint64_t)v6);
  }
  else {
    objc_msgSend_removeObjectForKey_(v13, 0, (uint64_t)v6, v10);
  }
  objc_msgSend_unlock(self->_lock, v14, v15, v16);
}

- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4
{
  id v6 = a4;
  id v11 = (id)objc_msgSend_copy(a3, v7, v8, v9);
  objc_msgSend_setValue_forMetadataKey_(self, v10, (uint64_t)v11, (uint64_t)v6);
}

- (id)_stringValueForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_stringValue(v3, v4, v5, v6);

    id v3 = (id)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)_thumbnailArtworkImage
{
  uint64_t v4 = objc_msgSend_thumbnailImageCollection(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_imagesForKind_(v4, v5, @"download-queue-item.default", v6);
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_lastObject(v7, v11, v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_urlValueForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v3, v5);

    id v3 = (id)v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)_valueForFirstAvailableTopLevelKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self->_lock, v5, v6, v7);
  uint64_t v14 = objc_msgSend__assetDictionary(self, v8, v9, v10);
  uint64_t v22 = (id *)&v24;
  if (v4)
  {
    do
    {
      id v17 = objc_msgSend_objectForKey_(v14, v11, (uint64_t)v4, v13);
      if (!v17)
      {
        id v17 = objc_msgSend_objectForKey_(self->_dictionary, v15, (uint64_t)v4, v16);
      }
      uint64_t v18 = v22++;
      id v19 = *v18;

      if (v19) {
        BOOL v20 = v17 == 0;
      }
      else {
        BOOL v20 = 0;
      }
      id v4 = v19;
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
    id v19 = 0;
  }
  objc_msgSend_unlock(self->_lock, v11, v12, v13);

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end