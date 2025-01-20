@interface StoreItem
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation StoreItem

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[StoreItem allocWithZone:](StoreItem, "allocWithZone:") init];
  v6 = (NSData *)[(NSData *)self->_appReceiptData copyWithZone:a3];
  appReceiptData = v5->_appReceiptData;
  v5->_appReceiptData = v6;

  v8 = (NSString *)[(NSString *)self->_artistName copyWithZone:a3];
  artistName = v5->_artistName;
  v5->_artistName = v8;

  v10 = (NSString *)[(NSString *)self->_artworkURL copyWithZone:a3];
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = v10;

  v12 = (NSArray *)[(NSArray *)self->_assetDeltaPackages copyWithZone:a3];
  assetDeltaPackages = v5->_assetDeltaPackages;
  v5->_assetDeltaPackages = v12;

  objc_storeStrong((id *)&v5->_assetFullPackage, self->_assetFullPackage);
  v5->_automatic = self->_automatic;
  v14 = (NSNumber *)[(NSNumber *)self->_betaExternalVersionID copyWithZone:a3];
  betaExternalVersionID = v5->_betaExternalVersionID;
  v5->_betaExternalVersionID = v14;

  v16 = (NSString *)[(NSString *)self->_bundleDisplayName copyWithZone:a3];
  bundleDisplayName = v5->_bundleDisplayName;
  v5->_bundleDisplayName = v16;

  v18 = (NSString *)[(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = v18;

  v20 = (NSString *)[(NSString *)self->_bundleShortVersion copyWithZone:a3];
  bundleShortVersion = v5->_bundleShortVersion;
  v5->_bundleShortVersion = v20;

  v22 = (NSString *)[(NSString *)self->_bundleVersion copyWithZone:a3];
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = v22;

  v24 = (NSString *)[(NSString *)self->_cancelDownloadURL copyWithZone:a3];
  cancelDownloadURL = v5->_cancelDownloadURL;
  v5->_cancelDownloadURL = v24;

  v26 = (NSDictionary *)[(NSDictionary *)self->_capabilities copyWithZone:a3];
  capabilities = v5->_capabilities;
  v5->_capabilities = v26;

  v28 = (NSDictionary *)[(NSDictionary *)self->_capabilityOptions copyWithZone:a3];
  capabilityOptions = v5->_capabilityOptions;
  v5->_capabilityOptions = v28;

  v30 = (NSNumber *)[(NSNumber *)self->_evid copyWithZone:a3];
  evid = v5->_evid;
  v5->_evid = v30;

  v5->_gameCenterEnabled = self->_gameCenterEnabled;
  v5->_gameCenterEverEnabled = self->_gameCenterEverEnabled;
  v32 = (NSString *)[(NSString *)self->_genre copyWithZone:a3];
  genre = v5->_genre;
  v5->_genre = v32;

  v34 = (NSNumber *)[(NSNumber *)self->_genreID copyWithZone:a3];
  genreID = v5->_genreID;
  v5->_genreID = v34;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  objc_storeStrong((id *)&v5->_hasOrEverHasHadIAP, self->_hasOrEverHasHadIAP);
  v5->_hasWatchApp = self->_hasWatchApp;
  v5->_hasWatchIndependentApp = self->_hasWatchIndependentApp;
  v5->_hasWatchOnlyApp = self->_hasWatchOnlyApp;
  v36 = (NSNumber *)[(NSNumber *)self->_iAdAttribution copyWithZone:a3];
  iAdAttribution = v5->_iAdAttribution;
  v5->_iAdAttribution = v36;

  v38 = (NSString *)[(NSString *)self->_iAdConversionString copyWithZone:a3];
  iAdConversionString = v5->_iAdConversionString;
  v5->_iAdConversionString = v38;

  v40 = (NSString *)[(NSString *)self->_iAdImpressionString copyWithZone:a3];
  iAdImpressionString = v5->_iAdImpressionString;
  v5->_iAdImpressionString = v40;

  v42 = (NSString *)[(NSString *)self->_installVerificationToken copyWithZone:a3];
  installVerificationToken = v5->_installVerificationToken;
  v5->_installVerificationToken = v42;

  v5->_isRedownload = self->_isRedownload;
  v44 = (NSNumber *)[(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v5->_itemID;
  v5->_itemID = v44;

  v46 = (NSString *)[(NSString *)self->_itemName copyWithZone:a3];
  itemName = v5->_itemName;
  v5->_itemName = v46;

  v48 = (NSString *)[(NSString *)self->_kind copyWithZone:a3];
  kind = v5->_kind;
  v5->_kind = v48;

  v5->_launchProhibited = self->_launchProhibited;
  v50 = (NSString *)[(NSString *)self->_messagesArtworkURL copyWithZone:a3];
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = v50;

  objc_storeStrong((id *)&v5->_nameTranscriptions, self->_nameTranscriptions);
  v52 = [(TimeWindow *)self->_optimalDownloadWindow copyWithZone:a3];
  optimalDownloadWindow = v5->_optimalDownloadWindow;
  v5->_optimalDownloadWindow = v52;

  v54 = (NSURL *)[(NSURL *)self->_preflightPackageURL copyWithZone:a3];
  preflightPackageURL = v5->_preflightPackageURL;
  v5->_preflightPackageURL = v54;

  v56 = (NSString *)[(NSString *)self->_purchaseDate copyWithZone:a3];
  purchaseDate = v5->_purchaseDate;
  v5->_purchaseDate = v56;

  v5->_purchasedRedownload = self->_purchasedRedownload;
  v58 = (NSString *)[(NSString *)self->_ratingLabel copyWithZone:a3];
  ratingLabel = v5->_ratingLabel;
  v5->_ratingLabel = v58;

  v60 = (NSNumber *)[(NSNumber *)self->_ratingRank copyWithZone:a3];
  ratingRank = v5->_ratingRank;
  v5->_ratingRank = v60;

  v62 = (NSString *)[(NSString *)self->_redownloadParams copyWithZone:a3];
  redownloadParams = v5->_redownloadParams;
  v5->_redownloadParams = v62;

  v64 = (NSString *)[(NSString *)self->_releaseDate copyWithZone:a3];
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = v64;

  v5->_softwarePlatform = self->_softwarePlatform;
  v66 = (NSString *)[(NSString *)self->_storeCohort copyWithZone:a3];
  storeCohort = v5->_storeCohort;
  v5->_storeCohort = v66;

  v68 = (NSString *)[(NSString *)self->_storefront copyWithZone:a3];
  storefront = v5->_storefront;
  v5->_storefront = v68;

  v70 = (NSString *)[(NSString *)self->_storeTransactionID copyWithZone:a3];
  storeTransactionID = v5->_storeTransactionID;
  v5->_storeTransactionID = v70;

  v72 = (NSArray *)[(NSArray *)self->_subGenres copyWithZone:a3];
  subGenres = v5->_subGenres;
  v5->_subGenres = v72;

  v5->_supports32BitOnly = self->_supports32BitOnly;
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)StoreItem;
  v3 = [(StoreItem *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {bundleID = %@; itemID = %@; itemName = %@; EVID = %@}",
    v3,
    self->_bundleID,
    self->_itemID,
    self->_itemName,
  v4 = self->_evid);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPurchaseLinkOutTokenInfo, 0);
  objc_storeStrong((id *)&self->_nameTranscriptions, 0);
  objc_storeStrong((id *)&self->_optimalDownloadWindow, 0);
  objc_storeStrong((id *)&self->_subGenres, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_storeTransactionID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_preflightPackageURL, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installVerificationToken, 0);
  objc_storeStrong((id *)&self->_iAdImpressionString, 0);
  objc_storeStrong((id *)&self->_iAdConversionString, 0);
  objc_storeStrong((id *)&self->_iAdAttribution, 0);
  objc_storeStrong((id *)&self->_hasOrEverHasHadIAP, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_capabilityOptions, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleDisplayName, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionID, 0);
  objc_storeStrong((id *)&self->_assetFullPackage, 0);
  objc_storeStrong((id *)&self->_assetDeltaPackages, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_appReceiptData, 0);
  objc_storeStrong((id *)&self->_appBinaryTraits, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
}

@end