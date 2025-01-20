@interface BLBookInstallInfo
- (BLBookInstallOperationProgressDelegate)progressDelegate;
- (BLDatabaseManager)databaseManager;
- (BOOL)isAudiobook;
- (BOOL)isStoreDownload;
- (NSArray)sinfs;
- (NSData)dpInfo;
- (NSDictionary)fileAttributes;
- (NSDictionary)itunesMetadata;
- (NSNumber)accountIdentifier;
- (NSNumber)artworkFileSize;
- (NSNumber)assetFileSize;
- (NSNumber)familyAccountIdentifier;
- (NSNumber)isPurchase;
- (NSNumber)isRestore;
- (NSNumber)isSample;
- (NSNumber)persistentIdentifier;
- (NSNumber)storeIdentifier;
- (NSNumber)storePlaylistIdentifier;
- (NSNumber)storePublicationVersion;
- (NSString)artistName;
- (NSString)artworkPath;
- (NSString)assetPath;
- (NSString)cancelDownloadURL;
- (NSString)collectionArtistName;
- (NSString)collectionTitle;
- (NSString)destinationFilename;
- (NSString)downloadID;
- (NSString)encryptionKey;
- (NSString)epubRightsPath;
- (NSString)fullRestoreFilePath;
- (NSString)genre;
- (NSString)kind;
- (NSString)libraryItemIdentifier;
- (NSString)permlink;
- (NSString)plistPath;
- (NSString)salt;
- (NSString)subtitle;
- (NSString)thumbnailImageURL;
- (NSString)title;
- (NSString)transactionIdentifier;
- (NSString)uniqueID;
- (NSUUID)racGUID;
- (id)_estimatedDownloadSize;
- (id)_itunesMetadataPlistDictionaryFromPath:(id)a3;
- (id)_manifestEntryWithStoreInfo:(BOOL)a3 withStoreAccountInfo:(BOOL)a4 withFileName:(id)a5;
- (id)assetFlavor;
- (id)manifestEntry:(BOOL)a3 withFileName:(id)a4;
- (id)storeAccountInfoEntries;
- (id)storeInfoEntries;
- (void)setAccountIdentifier:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkFileSize:(id)a3;
- (void)setArtworkPath:(id)a3;
- (void)setAssetFileSize:(id)a3;
- (void)setAssetPath:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDestinationFilename:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDpInfo:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setEpubRightsPath:(id)a3;
- (void)setFamilyAccountIdentifier:(id)a3;
- (void)setFileAttributes:(id)a3;
- (void)setFullRestoreFilePath:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsPurchase:(id)a3;
- (void)setIsRestore:(id)a3;
- (void)setIsSample:(id)a3;
- (void)setItunesMetadata:(id)a3;
- (void)setKind:(id)a3;
- (void)setLibraryItemIdentifier:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setPlistPath:(id)a3;
- (void)setProgressDelegate:(id)a3;
- (void)setRacGUID:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSinfs:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation BLBookInstallInfo

- (void)setPlistPath:(id)a3
{
  id v10 = a3;
  v4 = [(BLBookInstallInfo *)self plistPath];
  unsigned __int8 v5 = [v10 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)[v10 copy];
    plistPath = self->_plistPath;
    self->_plistPath = v6;

    if ([v10 length])
    {
      v9 = [(BLBookInstallInfo *)self _itunesMetadataPlistDictionaryFromPath:v10];
      [(BLBookInstallInfo *)self setItunesMetadata:v9];
    }
    else
    {
      [(BLBookInstallInfo *)self setItunesMetadata:0];
    }
  }
}

- (NSString)permlink
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  v3 = [v2 objectForKeyedSubscript:@"p0"];

  return (NSString *)v3;
}

- (NSNumber)storeIdentifier
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  v3 = [v2 objectForKeyedSubscript:@"itemId"];

  return (NSNumber *)v3;
}

- (NSNumber)storePlaylistIdentifier
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  v3 = [v2 objectForKeyedSubscript:@"playlistId"];
  v4 = BLGetNSNumberFromValue();

  return (NSNumber *)v4;
}

- (NSNumber)storePublicationVersion
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  v3 = [v2 objectForKeyedSubscript:@"publication-version"];

  return (NSNumber *)v3;
}

- (BOOL)isStoreDownload
{
  v2 = [(BLBookInstallInfo *)self storePublicationVersion];
  BOOL v3 = BLGetUnsignedLongLongFromValue() != 0;

  return v3;
}

- (NSString)libraryItemIdentifier
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  BOOL v3 = [v2 objectForKeyedSubscript:@"Q"];

  return (NSString *)v3;
}

- (id)assetFlavor
{
  v2 = [(BLBookInstallInfo *)self itunesMetadata];
  BOOL v3 = [v2 objectForKeyedSubscript:@"asset-info"];

  if (v3)
  {
    v4 = [v3 objectForKey:@"flavor"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)manifestEntry:(BOOL)a3 withFileName:(id)a4
{
  return [(BLBookInstallInfo *)self _manifestEntryWithStoreInfo:1 withStoreAccountInfo:!a3 withFileName:a4];
}

- (id)_manifestEntryWithStoreInfo:(BOOL)a3 withStoreAccountInfo:(BOOL)a4 withFileName:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = +[NSMutableDictionary dictionary];
  id v10 = [(BLBookInstallInfo *)self itunesMetadata];
  if ([v8 length])
  {
    [v9 setObject:v8 forKey:@"Path"];
  }
  else
  {
    v11 = [(BLBookInstallInfo *)self destinationFilename];
    id v12 = [v11 length];

    if (v12)
    {
      v13 = [(BLBookInstallInfo *)self destinationFilename];
      [v9 setObject:v13 forKey:@"Path"];
    }
    else
    {
      v13 = BLBookInstallLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No destination file name available for manifest.", v46, 2u);
      }
    }
  }
  v14 = [(BLBookInstallInfo *)self uniqueID];
  id v15 = [v14 length];

  if (v15)
  {
    v16 = [(BLBookInstallInfo *)self uniqueID];
    v17 = +[IMLibraryPlist keyNameForUniqueId];
    [v9 setObject:v16 forKey:v17];
  }
  uint64_t v18 = [v10 objectForKeyedSubscript:@"isSample"];
  v19 = (void *)v18;
  if (v18) {
    v20 = (void *)v18;
  }
  else {
    v20 = &__kCFBooleanFalse;
  }
  [v9 setObject:v20 forKey:@"isSample"];
  v21 = [v10 objectForKeyedSubscript:@"playlistName"];

  if (v21) {
    [v9 setObject:v21 forKey:@"Album"];
  }
  v22 = [v10 objectForKeyedSubscript:@"artistName"];

  if (v22) {
    [v9 setObject:v22 forKey:@"Artist"];
  }
  v23 = [v10 objectForKeyedSubscript:@"artwork-template-name"];

  if (v23) {
    [v9 setObject:v23 forKey:@"artwork-template-name"];
  }
  v24 = [v10 objectForKeyedSubscript:@"genre"];

  if (v24) {
    [v9 setObject:v24 forKey:@"Genre"];
  }
  v25 = [v10 objectForKeyedSubscript:@"Q"];

  if (v25) {
    [v9 setObject:v25 forKey:@"Persistent ID"];
  }
  if (v6)
  {
    v26 = [(BLBookInstallInfo *)self storeInfoEntries];
    [v9 addEntriesFromDictionary:v26];
  }
  if (v5)
  {
    v27 = [(BLBookInstallInfo *)self storeAccountInfoEntries];
    [v9 addEntriesFromDictionary:v27];
  }
  v28 = [v10 objectForKeyedSubscript:@"p0"];

  if (v28) {
    [v9 setObject:v28 forKey:@"iTunesU Permlink"];
  }
  v29 = [v10 objectForKeyedSubscript:@"xid"];

  if (v29) {
    [v9 setObject:v29 forKey:@"XID"];
  }
  v30 = [v10 objectForKeyedSubscript:@"itemName"];

  if (v30) {
    [v9 setObject:v30 forKey:@"Name"];
  }
  v31 = [v10 objectForKeyedSubscript:@"copyright"];

  if (v31) {
    [v9 setObject:v31 forKey:@"Copyright"];
  }
  objc_opt_class();
  v32 = [v10 objectForKeyedSubscript:@"explicit"];
  v33 = BUDynamicCast();

  if ([v33 integerValue] == (id)1) {
    [v9 setObject:&__kCFBooleanTrue forKey:@"isExplicit"];
  }
  v34 = [v10 objectForKeyedSubscript:@"human-friendly-publication-version"];

  if (v34) {
    [v9 setObject:v34 forKey:@"Human Readable Publication Version"];
  }
  v35 = [v10 objectForKeyedSubscript:@"languages"];

  if (v35) {
    [v9 setObject:v35 forKey:@"Languages"];
  }
  v36 = [v10 objectForKeyedSubscript:@"PageProgression"];

  if (v36) {
    [v9 setObject:v36 forKey:@"PageProgression"];
  }
  v37 = [v10 objectForKeyedSubscript:@"page-progression-direction"];

  if (v37) {
    [v9 setObject:v37 forKey:@"Page Progression Direction"];
  }
  v38 = [v10 objectForKeyedSubscript:@"publication-version"];

  if (v38) {
    [v9 setObject:v38 forKey:@"Publication Version"];
  }
  v39 = [v10 objectForKeyedSubscript:@"releaseDate"];

  if (v39) {
    [v9 setObject:v39 forKey:@"Release Date"];
  }
  v40 = [v10 objectForKeyedSubscript:@"sort-artist"];

  if (v40) {
    [v9 setObject:v40 forKey:@"Sort Artist"];
  }
  v41 = [v10 objectForKeyedSubscript:@"sort-album"];

  if (v41) {
    [v9 setObject:v41 forKey:@"Sort Album"];
  }
  v42 = [v10 objectForKeyedSubscript:@"sort-name"];

  if (v42) {
    [v9 setObject:v42 forKey:@"Sort Name"];
  }
  v43 = [(BLBookInstallInfo *)self assetFlavor];

  if (v43) {
    [v9 setObject:v43 forKey:@"Flavor"];
  }
  v44 = [(BLBookInstallInfo *)self _estimatedDownloadSize];

  if (v44) {
    [v9 setObject:v44 forKey:@"Estimated Download Size"];
  }

  return v9;
}

- (id)storeInfoEntries
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  v4 = [(BLBookInstallInfo *)self itunesMetadata];
  BOOL v5 = [v4 objectForKeyedSubscript:@"s"];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"Storefront ID"];
  }
  BOOL v6 = [v4 objectForKeyedSubscript:@"itemId"];
  uint64_t v7 = BLGetUnsignedLongLongFromValue();

  if (v7)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:v7];
    [v3 setObject:v8 forKeyedSubscript:@"s"];
  }
  v9 = [v4 objectForKeyedSubscript:@"playlistId"];

  if (v9)
  {
    id v10 = +[NSNumber numberWithUnsignedLongLong:BLGetUnsignedLongLongFromValue()];
    [v3 setObject:v10 forKeyedSubscript:@"PlaylistID"];
  }

  return v3;
}

- (id)storeAccountInfoEntries
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  v4 = [(BLBookInstallInfo *)self itunesMetadata];
  objc_opt_class();
  BOOL v5 = [v4 objectForKeyedSubscript:@"com.apple.iTunesStore.downloadInfo"];
  BOOL v6 = BUDynamicCast();

  objc_opt_class();
  uint64_t v7 = [v6 objectForKeyedSubscript:@"accountInfo"];
  id v8 = BUDynamicCast();

  v9 = [v8 objectForKeyedSubscript:@"DSPersonID"];
  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"DSID"];
  }
  id v10 = [v8 objectForKeyedSubscript:@"AppleID"];
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:@"AppleID"];
  }
  if (+[BLLibraryUtility _isMultiUser]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"usesSharedAsset"];
  }

  return v3;
}

- (id)_itunesMetadataPlistDictionaryFromPath:(id)a3
{
  return +[BLITunesMetadataHelper itunesMetadataPlistDictionaryFromPath:a3];
}

- (id)_estimatedDownloadSize
{
  BOOL v3 = [(BLBookInstallInfo *)self assetFileSize];
  if (v3)
  {
    v4 = [(BLBookInstallInfo *)self artworkFileSize];
    if (v4)
    {
      uint64_t v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v3 unsignedLongLongValue] + (void)objc_msgSend(v4, "unsignedLongLongValue"));

      BOOL v3 = (void *)v5;
    }
  }

  return v3;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (NSNumber)assetFileSize
{
  return self->_assetFileSize;
}

- (void)setAssetFileSize:(id)a3
{
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (NSString)epubRightsPath
{
  return self->_epubRightsPath;
}

- (void)setEpubRightsPath:(id)a3
{
}

- (NSString)artworkPath
{
  return self->_artworkPath;
}

- (void)setArtworkPath:(id)a3
{
}

- (NSNumber)artworkFileSize
{
  return self->_artworkFileSize;
}

- (void)setArtworkFileSize:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSString)destinationFilename
{
  return self->_destinationFilename;
}

- (void)setDestinationFilename:(id)a3
{
}

- (NSData)dpInfo
{
  return self->_dpInfo;
}

- (void)setDpInfo:(id)a3
{
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (NSNumber)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(id)a3
{
}

- (NSNumber)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(id)a3
{
}

- (NSNumber)isPurchase
{
  return self->_isPurchase;
}

- (void)setIsPurchase:(id)a3
{
}

- (NSString)fullRestoreFilePath
{
  return self->_fullRestoreFilePath;
}

- (void)setFullRestoreFilePath:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)collectionArtistName
{
  return self->_collectionArtistName;
}

- (void)setCollectionArtistName:(id)a3
{
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (void)setCollectionTitle:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)familyAccountIdentifier
{
  return self->_familyAccountIdentifier;
}

- (void)setFamilyAccountIdentifier:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSString)cancelDownloadURL
{
  return self->_cancelDownloadURL;
}

- (void)setCancelDownloadURL:(id)a3
{
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
}

- (NSUUID)racGUID
{
  return self->_racGUID;
}

- (void)setRacGUID:(id)a3
{
}

- (NSString)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSString)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSDictionary)itunesMetadata
{
  return self->_itunesMetadata;
}

- (void)setItunesMetadata:(id)a3
{
}

- (void)setLibraryItemIdentifier:(id)a3
{
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (void)setFileAttributes:(id)a3
{
}

- (BLBookInstallOperationProgressDelegate)progressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressDelegate);

  return (BLBookInstallOperationProgressDelegate *)WeakRetained;
}

- (void)setProgressDelegate:(id)a3
{
}

- (BLDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_libraryItemIdentifier, 0);
  objc_storeStrong((id *)&self->_itunesMetadata, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_racGUID, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_familyAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_fullRestoreFilePath, 0);
  objc_storeStrong((id *)&self->_isPurchase, 0);
  objc_storeStrong((id *)&self->_isSample, 0);
  objc_storeStrong((id *)&self->_isRestore, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_destinationFilename, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_artworkFileSize, 0);
  objc_storeStrong((id *)&self->_artworkPath, 0);
  objc_storeStrong((id *)&self->_epubRightsPath, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_assetFileSize, 0);

  objc_storeStrong((id *)&self->_assetPath, 0);
}

@end