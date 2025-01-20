@interface BLPrepareDownloadResponse
- (BLDownloadDataConsumer)dataConsumer;
- (BLPrepareDownloadResponse)initWithDownload:(id)a3;
- (BLPrepareDownloadResponse)initWithInstallInfo:(id)a3;
- (BOOL)allowsCellularAccess;
- (BOOL)canPause;
- (BOOL)isCellularAllowedForRestores;
- (BOOL)isDiscretionary;
- (BOOL)isLocalCacheServer;
- (BOOL)isPerDeviceVPP;
- (BOOL)isPurchase;
- (BOOL)isRestore;
- (BOOL)isSample;
- (BOOL)requiresPowerPluggedIn;
- (NSArray)backgroundOperations;
- (NSDate)purchaseDate;
- (NSError)error;
- (NSNumber)downloadRestoreState;
- (NSNumber)playlistIdentifier;
- (NSNumber)storeAccountIdentifier;
- (NSString)URLSessionIdentifier;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)cancelDownloadURL;
- (NSString)clientIdentifier;
- (NSString)clientSecondaryIdentifier;
- (NSString)collectionArtistName;
- (NSString)collectionTitle;
- (NSString)destinationPath;
- (NSString)downloadIdentifier;
- (NSString)genre;
- (NSString)kind;
- (NSString)permLink;
- (NSString)subtitle;
- (NSString)thumbnailImageURL;
- (NSString)title;
- (NSString)transactionIdentifier;
- (NSURLRequest)URLRequest;
- (double)transferProgressFraction;
- (id)sessionConfiguration;
- (id)sessionTaskWithSession:(id)a3;
- (int64_t)assetIdentifier;
- (int64_t)automaticType;
- (int64_t)mediaAssetSize;
- (int64_t)persistentIdentifier;
- (int64_t)result;
- (int64_t)taskPriority;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setArtistName:(id)a3;
- (void)setAssetIdentifier:(int64_t)a3;
- (void)setAutomaticType:(int64_t)a3;
- (void)setBackgroundOperations:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCanPause:(BOOL)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientSecondaryIdentifier:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadIdentifier:(id)a3;
- (void)setDownloadRestoreState:(id)a3;
- (void)setError:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIsCellularAllowedForRestores:(BOOL)a3;
- (void)setIsLocalCacheServer:(BOOL)a3;
- (void)setIsPerDeviceVPP:(BOOL)a3;
- (void)setIsPurchase:(BOOL)a3;
- (void)setIsRestore:(BOOL)a3;
- (void)setIsSample:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setMediaAssetSize:(int64_t)a3;
- (void)setPermLink:(id)a3;
- (void)setPersistentIdentifier:(int64_t)a3;
- (void)setPlaylistIdentifier:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setResult:(int64_t)a3;
- (void)setStoreAccountIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTaskPriority:(int64_t)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransferProgressFraction:(double)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation BLPrepareDownloadResponse

- (BLPrepareDownloadResponse)initWithDownload:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BLPrepareDownloadResponse;
  v5 = [(BLPrepareDownloadResponse *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 downloadID];
    downloadIdentifier = v5->_downloadIdentifier;
    v5->_downloadIdentifier = (NSString *)v6;

    v8 = [v4 storeIdentifier];
    v5->_assetIdentifier = (int64_t)[v8 longLongValue];

    uint64_t v9 = [v4 storePlaylistIdentifier];
    playlistIdentifier = v5->_playlistIdentifier;
    v5->_playlistIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v11;

    uint64_t v13 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v13;

    uint64_t v15 = [v4 subtitle];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v15;

    uint64_t v17 = [v4 collectionArtistName];
    collectionArtistName = v5->_collectionArtistName;
    v5->_collectionArtistName = (NSString *)v17;

    uint64_t v19 = [v4 collectionTitle];
    collectionTitle = v5->_collectionTitle;
    v5->_collectionTitle = (NSString *)v19;

    uint64_t v21 = [v4 genre];
    genre = v5->_genre;
    v5->_genre = (NSString *)v21;

    uint64_t v23 = [v4 thumbnailImageURL];
    thumbnailImageURL = v5->_thumbnailImageURL;
    v5->_thumbnailImageURL = (NSString *)v23;

    uint64_t v25 = [v4 kind];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = @"ebook";
    }
    objc_storeStrong((id *)&v5->_kind, v27);
    v28 = [v4 isRestore];
    v5->_isRestore = [v28 BOOLValue];

    v29 = [v4 isSample];
    v5->_isSample = [v29 BOOLValue];

    v30 = [v4 isPurchase];
    v5->_isPurchase = [v30 BOOLValue];

    v31 = [v4 persistentIdentifier];
    v5->_persistentIdentifier = (int64_t)[v31 longLongValue];

    uint64_t v32 = [v4 accountID];
    storeAccountIdentifier = v5->_storeAccountIdentifier;
    v5->_storeAccountIdentifier = (NSNumber *)v32;

    uint64_t v34 = [v4 permlink];
    permLink = v5->_permLink;
    v5->_permLink = (NSString *)v34;

    v36 = [v4 isLocalCacheServer];
    v5->_isLocalCacheServer = [v36 BOOLValue];

    uint64_t v37 = [v4 transactionIdentifier];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v37;

    uint64_t v39 = [v4 cancelDownloadURL];
    cancelDownloadURL = v5->_cancelDownloadURL;
    v5->_cancelDownloadURL = (NSString *)v39;
  }
  return v5;
}

- (BLPrepareDownloadResponse)initWithInstallInfo:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BLPrepareDownloadResponse;
  v5 = [(BLPrepareDownloadResponse *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 downloadID];
    downloadIdentifier = v5->_downloadIdentifier;
    v5->_downloadIdentifier = (NSString *)v6;

    v8 = [v4 storeIdentifier];
    v5->_assetIdentifier = (int64_t)[v8 longLongValue];

    uint64_t v9 = [v4 storePlaylistIdentifier];
    playlistIdentifier = v5->_playlistIdentifier;
    v5->_playlistIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v11;

    uint64_t v13 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v13;

    uint64_t v15 = [v4 subtitle];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v15;

    uint64_t v17 = [v4 collectionArtistName];
    collectionArtistName = v5->_collectionArtistName;
    v5->_collectionArtistName = (NSString *)v17;

    uint64_t v19 = [v4 collectionTitle];
    collectionTitle = v5->_collectionTitle;
    v5->_collectionTitle = (NSString *)v19;

    uint64_t v21 = [v4 genre];
    genre = v5->_genre;
    v5->_genre = (NSString *)v21;

    uint64_t v23 = [v4 thumbnailImageURL];
    thumbnailImageURL = v5->_thumbnailImageURL;
    v5->_thumbnailImageURL = (NSString *)v23;

    uint64_t v25 = [v4 kind];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = @"ebook";
    }
    objc_storeStrong((id *)&v5->_kind, v27);
    v28 = [v4 isRestore];
    v5->_isRestore = [v28 BOOLValue];

    v29 = [v4 isSample];
    v5->_isSample = [v29 BOOLValue];

    v30 = [v4 isPurchase];
    v5->_isPurchase = [v30 BOOLValue];

    v31 = [v4 persistentIdentifier];
    v5->_persistentIdentifier = (int64_t)[v31 longLongValue];

    uint64_t v32 = [v4 accountIdentifier];
    storeAccountIdentifier = v5->_storeAccountIdentifier;
    v5->_storeAccountIdentifier = (NSNumber *)v32;

    uint64_t v34 = [v4 permlink];
    permLink = v5->_permLink;
    v5->_permLink = (NSString *)v34;

    uint64_t v36 = [v4 transactionIdentifier];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v36;

    uint64_t v38 = [v4 cancelDownloadURL];
    cancelDownloadURL = v5->_cancelDownloadURL;
    v5->_cancelDownloadURL = (NSString *)v38;
  }
  return v5;
}

- (id)sessionConfiguration
{
  v3 = [(BLPrepareDownloadResponse *)self URLSessionIdentifier];
  id v4 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v3];

  objc_msgSend(v4, "setAllowsCellularAccess:", -[NSURLRequest allowsCellularAccess](self->_URLRequest, "allowsCellularAccess"));
  objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[NSURLRequest allowsExpensiveNetworkAccess](self->_URLRequest, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "set_infersDiscretionaryFromOriginatingClient:", self->_discretionary);
  [v4 setHTTPCookieAcceptPolicy:1];
  [v4 setHTTPShouldSetCookies:0];
  [v4 setHTTPShouldUsePipelining:1];
  [v4 setRequestCachePolicy:1];
  [v4 setSessionSendsLaunchEvents:1];
  objc_msgSend(v4, "set_allowsRetryForBackgroundDataTasks:", 1);
  objc_msgSend(v4, "set_requiresPowerPluggedIn:", self->_requiresPowerPluggedIn);
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", self->_clientIdentifier);
  objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", self->_clientSecondaryIdentifier);
  [v4 setSessionSendsLaunchEvents:0];
  v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Prepare]: Created a background session", v7, 2u);
  }

  return v4;
}

- (id)sessionTaskWithSession:(id)a3
{
  URLRequest = self->_URLRequest;
  if (URLRequest)
  {
    v5 = [a3 dataTaskWithRequest:URLRequest];
    objc_msgSend(v5, "bl_setDataConsumer:", self->_dataConsumer);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "set_priority:", self->_taskPriority);

  return v5;
}

- (NSString)URLSessionIdentifier
{
  v3 = +[NSMutableString stringWithString:@"com.apple.bookassetd."];
  id v4 = v3;
  if (self->_clientIdentifier)
  {
    objc_msgSend(v3, "appendString:");
    [v4 appendString:@"."];
  }
  if (self->_clientSecondaryIdentifier)
  {
    objc_msgSend(v4, "appendString:");
    [v4 appendString:@"."];
  }
  if (self->_discretionary) {
    [v4 appendString:@"discretionary."];
  }
  if (self->_requiresPowerPluggedIn) {
    [v4 appendString:@"powered."];
  }
  if (![(NSURLRequest *)self->_URLRequest allowsCellularAccess]) {
    [v4 appendString:@"wifi."];
  }
  if (![(NSURLRequest *)self->_URLRequest allowsExpensiveNetworkAccess]) {
    [v4 appendString:@"inexpensive."];
  }
  [v4 appendString:@"default"];

  return (NSString *)v4;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSString)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(id)a3
{
}

- (int64_t)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(int64_t)a3
{
  self->_assetIdentifier = a3;
}

- (NSNumber)playlistIdentifier
{
  return self->_playlistIdentifier;
}

- (void)setPlaylistIdentifier:(id)a3
{
}

- (NSString)permLink
{
  return self->_permLink;
}

- (void)setPermLink:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (int64_t)automaticType
{
  return self->_automaticType;
}

- (void)setAutomaticType:(int64_t)a3
{
  self->_automaticType = a3;
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (NSArray)backgroundOperations
{
  return self->_backgroundOperations;
}

- (void)setBackgroundOperations:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isCellularAllowedForRestores
{
  return self->_isCellularAllowedForRestores;
}

- (void)setIsCellularAllowedForRestores:(BOOL)a3
{
  self->_isCellularAllowedForRestores = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (int64_t)mediaAssetSize
{
  return self->_mediaAssetSize;
}

- (void)setMediaAssetSize:(int64_t)a3
{
  self->_mediaAssetSize = a3;
}

- (double)transferProgressFraction
{
  return self->_transferProgressFraction;
}

- (void)setTransferProgressFraction:(double)a3
{
  self->_transferProgressFraction = a3;
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

- (NSNumber)downloadRestoreState
{
  return self->_downloadRestoreState;
}

- (void)setDownloadRestoreState:(id)a3
{
}

- (BOOL)isPerDeviceVPP
{
  return self->_isPerDeviceVPP;
}

- (void)setIsPerDeviceVPP:(BOOL)a3
{
  self->_isPerDeviceVPP = a3;
}

- (BOOL)isLocalCacheServer
{
  return self->_isLocalCacheServer;
}

- (void)setIsLocalCacheServer:(BOOL)a3
{
  self->_isLocalCacheServer = a3;
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

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)canPause
{
  return self->_canPause;
}

- (void)setCanPause:(BOOL)a3
{
  self->_canPause = a3;
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(BOOL)a3
{
  self->_isSample = a3;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (void)setIsPurchase:(BOOL)a3
{
  self->_isPurchase = a3;
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (int64_t)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(int64_t)a3
{
  self->_persistentIdentifier = a3;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void)setStoreAccountIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientSecondaryIdentifier
{
  return self->_clientSecondaryIdentifier;
}

- (void)setClientSecondaryIdentifier:(id)a3
{
}

- (BLDownloadDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (int64_t)taskPriority
{
  return self->_taskPriority;
}

- (void)setTaskPriority:(int64_t)a3
{
  self->_taskPriority = a3;
}

- (NSURLRequest)URLRequest
{
  return self->_URLRequest;
}

- (void)setURLRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLRequest, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_clientSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_downloadRestoreState, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_backgroundOperations, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_playlistIdentifier, 0);

  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
}

@end