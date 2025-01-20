@interface BLPipelineDownloadTaskState
- (BLPipelineDownloadTaskState)initWithPrepareDownloadResponse:(id)a3;
- (BOOL)canPause;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalCacheServer;
- (BOOL)isPurchase;
- (BOOL)isRestore;
- (BOOL)isSample;
- (BOOL)requiresDownloadHandler;
- (NSDate)purchaseDate;
- (NSNumber)playlistIdentifier;
- (NSNumber)storeAccountIdentifier;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)cancelDownloadURL;
- (NSString)collectionArtistName;
- (NSString)collectionTitle;
- (NSString)downloadIdentifier;
- (NSString)genre;
- (NSString)kind;
- (NSString)permLink;
- (NSString)subtitle;
- (NSString)thumbnailImageURL;
- (NSString)title;
- (NSString)transactionIdentifier;
- (double)transferProgressFraction;
- (id)_overallProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)assetIdentifier;
- (int64_t)automaticType;
- (int64_t)downloadPhase;
- (int64_t)persistentIdentifier;
- (int64_t)transferBytesExpected;
- (int64_t)transferBytesWritten;
- (unint64_t)hash;
- (unint64_t)transferResumptionOffset;
- (void)setArtistName:(id)a3;
- (void)setAssetIdentifier:(int64_t)a3;
- (void)setAutomaticType:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setDownloadIdentifier:(id)a3;
- (void)setDownloadPhase:(int64_t)a3;
- (void)setFinishProgress:(double)a3;
- (void)setGenre:(id)a3;
- (void)setIsLocalCacheServer:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setOverallProgress:(id)a3;
- (void)setPermLink:(id)a3;
- (void)setPlaylistIdentifier:(id)a3;
- (void)setRequiresDownloadHandler:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransferBytesExpected:(int64_t)a3;
- (void)setTransferBytesWritten:(int64_t)a3;
- (void)setTransferProgress:(double)a3;
- (void)setTransferProgressFraction:(double)a3;
- (void)setTransferProgressWithBytesWritten:(int64_t)a3 totalBytesExpected:(int64_t)a4;
- (void)setTransferResumptionOffset:(unint64_t)a3;
@end

@implementation BLPipelineDownloadTaskState

- (BLPipelineDownloadTaskState)initWithPrepareDownloadResponse:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BLPipelineDownloadTaskState;
  v5 = [(BLPipelineDownloadTaskState *)&v40 init];
  if (v5)
  {
    v5->_assetIdentifier = (int64_t)[v4 assetIdentifier];
    uint64_t v6 = [v4 playlistIdentifier];
    playlistIdentifier = v5->_playlistIdentifier;
    v5->_playlistIdentifier = (NSNumber *)v6;

    uint64_t v8 = [v4 permLink];
    permLink = v5->_permLink;
    v5->_permLink = (NSString *)v8;

    v5->_automaticType = (int64_t)[v4 automaticType];
    uint64_t v10 = [v4 bundleIdentifier];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 kind];
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    uint64_t v14 = [v4 downloadIdentifier];
    downloadIdentifier = v5->_downloadIdentifier;
    v5->_downloadIdentifier = (NSString *)v14;

    [v4 transferProgressFraction];
    v5->_transferProgressFraction = v16;
    uint64_t v17 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v17;

    uint64_t v19 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v19;

    uint64_t v21 = [v4 subtitle];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v21;

    uint64_t v23 = [v4 collectionArtistName];
    collectionArtistName = v5->_collectionArtistName;
    v5->_collectionArtistName = (NSString *)v23;

    uint64_t v25 = [v4 collectionTitle];
    collectionTitle = v5->_collectionTitle;
    v5->_collectionTitle = (NSString *)v25;

    uint64_t v27 = [v4 genre];
    genre = v5->_genre;
    v5->_genre = (NSString *)v27;

    uint64_t v29 = [v4 thumbnailImageURL];
    thumbnailImageURL = v5->_thumbnailImageURL;
    v5->_thumbnailImageURL = (NSString *)v29;

    v5->_isLocalCacheServer = [v4 isLocalCacheServer];
    uint64_t v31 = [v4 transactionIdentifier];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v31;

    uint64_t v33 = [v4 cancelDownloadURL];
    cancelDownloadURL = v5->_cancelDownloadURL;
    v5->_cancelDownloadURL = (NSString *)v33;

    v5->_isRestore = [v4 isRestore];
    v5->_isSample = [v4 isSample];
    v5->_isPurchase = [v4 isPurchase];
    uint64_t v35 = [v4 purchaseDate];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v35;

    v5->_persistentIdentifier = (int64_t)[v4 persistentIdentifier];
    uint64_t v37 = [v4 storeAccountIdentifier];
    storeAccountIdentifier = v5->_storeAccountIdentifier;
    v5->_storeAccountIdentifier = (NSNumber *)v37;
  }
  return v5;
}

- (void)setFinishProgress:(double)a3
{
  double v3 = self->_transferProgressFraction + (1.0 - self->_transferProgressFraction) * a3;
  id v4 = [(BLPipelineDownloadTaskState *)self _overallProgress];
  objc_msgSend(v4, "setCurrentValue:", (uint64_t)(v3 * (double)(uint64_t)objc_msgSend(v4, "maxValue")));
}

- (void)setTransferProgress:(double)a3
{
  double v3 = self->_transferProgressFraction * a3;
  id v4 = [(BLPipelineDownloadTaskState *)self _overallProgress];
  objc_msgSend(v4, "setCurrentValue:", (uint64_t)(v3 * (double)(uint64_t)objc_msgSend(v4, "maxValue")));
}

- (void)setTransferProgressWithBytesWritten:(int64_t)a3 totalBytesExpected:(int64_t)a4
{
  self->_transferBytesExpected = a4;
  self->_transferBytesWritten = a3;
  if (a4 >= 1) {
    [(BLPipelineDownloadTaskState *)self setTransferProgress:(double)a3 / (double)a4];
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_downloadIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = [(BLPipelineDownloadTaskState *)self downloadIdentifier];
    uint64_t v8 = [v4 downloadIdentifier];
    unsigned __int8 v6 = [v7 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAutomaticType:", -[BLPipelineDownloadTaskState automaticType](self, "automaticType"));
  unsigned __int8 v6 = [(BLPipelineDownloadTaskState *)self bundleIdentifier];
  id v7 = [v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  uint64_t v8 = [(BLPipelineDownloadTaskState *)self downloadIdentifier];
  id v9 = [v8 copyWithZone:a3];
  [v5 setDownloadIdentifier:v9];

  uint64_t v10 = [(BLPipelineDownloadTaskState *)self kind];
  id v11 = [v10 copyWithZone:a3];
  [v5 setKind:v11];

  objc_msgSend(v5, "setAssetIdentifier:", -[BLPipelineDownloadTaskState assetIdentifier](self, "assetIdentifier"));
  uint64_t v12 = [(BLPipelineDownloadTaskState *)self playlistIdentifier];
  [v5 setPlaylistIdentifier:v12];

  v13 = [(BLPipelineDownloadTaskState *)self overallProgress];
  id v14 = [v13 copyWithZone:a3];
  [v5 setOverallProgress:v14];

  objc_msgSend(v5, "setRequiresDownloadHandler:", -[BLPipelineDownloadTaskState requiresDownloadHandler](self, "requiresDownloadHandler"));
  objc_msgSend(v5, "setDownloadPhase:", -[BLPipelineDownloadTaskState downloadPhase](self, "downloadPhase"));
  objc_msgSend(v5, "setTransferBytesExpected:", -[BLPipelineDownloadTaskState transferBytesExpected](self, "transferBytesExpected"));
  objc_msgSend(v5, "setTransferBytesWritten:", -[BLPipelineDownloadTaskState transferBytesWritten](self, "transferBytesWritten"));
  [(BLPipelineDownloadTaskState *)self transferProgressFraction];
  objc_msgSend(v5, "setTransferProgressFraction:");
  v15 = [(BLPipelineDownloadTaskState *)self artistName];
  [v5 setArtistName:v15];

  double v16 = [(BLPipelineDownloadTaskState *)self title];
  [v5 setTitle:v16];

  uint64_t v17 = [(BLPipelineDownloadTaskState *)self subtitle];
  [v5 setSubtitle:v17];

  v18 = [(BLPipelineDownloadTaskState *)self collectionArtistName];
  [v5 setCollectionArtistName:v18];

  uint64_t v19 = [(BLPipelineDownloadTaskState *)self collectionTitle];
  [v5 setCollectionTitle:v19];

  v20 = [(BLPipelineDownloadTaskState *)self genre];
  [v5 setGenre:v20];

  uint64_t v21 = [(BLPipelineDownloadTaskState *)self thumbnailImageURL];
  [v5 setThumbnailImageURL:v21];

  v22 = [(BLPipelineDownloadTaskState *)self cancelDownloadURL];
  [v5 setCancelDownloadURL:v22];

  uint64_t v23 = [(BLPipelineDownloadTaskState *)self transactionIdentifier];
  [v5 setTransactionIdentifier:v23];

  return v5;
}

- (id)_overallProgress
{
  overallProgress = self->_overallProgress;
  if (!overallProgress)
  {
    id v4 = objc_alloc_init(BLOperationProgress);
    id v5 = self->_overallProgress;
    self->_overallProgress = v4;

    [(BLOperationProgress *)self->_overallProgress setMaxValue:1000000];
    overallProgress = self->_overallProgress;
  }

  return overallProgress;
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

- (int64_t)automaticType
{
  return self->_automaticType;
}

- (void)setAutomaticType:(int64_t)a3
{
  self->_automaticType = a3;
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

- (BOOL)requiresDownloadHandler
{
  return self->_requiresDownloadHandler;
}

- (void)setRequiresDownloadHandler:(BOOL)a3
{
  self->_requiresDownloadHandler = a3;
}

- (BOOL)isLocalCacheServer
{
  return self->_isLocalCacheServer;
}

- (void)setIsLocalCacheServer:(BOOL)a3
{
  self->_isLocalCacheServer = a3;
}

- (int64_t)transferBytesExpected
{
  return self->_transferBytesExpected;
}

- (void)setTransferBytesExpected:(int64_t)a3
{
  self->_transferBytesExpected = a3;
}

- (int64_t)transferBytesWritten
{
  return self->_transferBytesWritten;
}

- (void)setTransferBytesWritten:(int64_t)a3
{
  self->_transferBytesWritten = a3;
}

- (double)transferProgressFraction
{
  return self->_transferProgressFraction;
}

- (void)setTransferProgressFraction:(double)a3
{
  self->_transferProgressFraction = a3;
}

- (unint64_t)transferResumptionOffset
{
  return self->_transferResumptionOffset;
}

- (void)setTransferResumptionOffset:(unint64_t)a3
{
  self->_transferResumptionOffset = a3;
}

- (int64_t)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(int64_t)a3
{
  self->_downloadPhase = a3;
}

- (void)setOverallProgress:(id)a3
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

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (BOOL)canPause
{
  return self->_canPause;
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (int64_t)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_overallProgress, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_playlistIdentifier, 0);

  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
}

@end