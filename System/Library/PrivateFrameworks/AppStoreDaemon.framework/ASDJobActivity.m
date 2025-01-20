@interface ASDJobActivity
+ (BOOL)supportsSecureCoding;
- (ASDJobActivity)initWithCoder:(id)a3;
- (BOOL)cancelIfDuplicate;
- (BOOL)explicitContent;
- (BOOL)hasMessagesExtension;
- (BOOL)hasWatchApp;
- (BOOL)is32BitOnly;
- (BOOL)isAutomatic;
- (BOOL)isCompatibilityUpdate;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isFromStore;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInQueue;
- (BOOL)isPendingApproval;
- (BOOL)isPurchasedRedownload;
- (BOOL)isRestore;
- (BOOL)isShared;
- (BOOL)isTVTemplate;
- (BOOL)isUpdate;
- (BOOL)isValid;
- (BOOL)launchProhibited;
- (BOOL)softwareIconNeedsShine;
- (NSArray)assets;
- (NSData)appReceiptData;
- (NSDate)iAdConversionDate;
- (NSDate)iAdImpressionDate;
- (NSDate)purchaseDate;
- (NSDate)releaseDate;
- (NSDictionary)storeDownloadInfo;
- (NSNumber)artistID;
- (NSNumber)betaExternalVersionIdentifier;
- (NSNumber)divertedTrackingID;
- (NSNumber)enableExtensions;
- (NSNumber)externalOrderKey;
- (NSNumber)genreID;
- (NSNumber)iAdAttribution;
- (NSNumber)itemID;
- (NSNumber)persistentID;
- (NSNumber)purchaseID;
- (NSNumber)ratingRank;
- (NSNumber)softwareVersionExternalIdentifier;
- (NSNumber)storeAccountID;
- (NSString)artistName;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)buyParams;
- (NSString)cancelDownloadURL;
- (NSString)clientID;
- (NSString)collectionName;
- (NSString)genre;
- (NSString)kind;
- (NSString)messagesArtworkURL;
- (NSString)ratingLabel;
- (NSString)storeAccountName;
- (NSString)storeCohort;
- (NSString)storeCorrelationKey;
- (NSString)storeDownloadKey;
- (NSString)storeTransactionID;
- (NSString)storefront;
- (NSString)thumbnailURL;
- (NSString)title;
- (NSString)variantID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppReceiptData:(id)a3;
- (void)setArtistID:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAssets:(id)a3;
- (void)setBetaExternalVersionIdentifier:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCancelIfDuplicate:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setDivertedTrackingID:(id)a3;
- (void)setEnableExtensions:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setExternalOrderKey:(id)a3;
- (void)setGenre:(id)a3;
- (void)setGenreID:(id)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setHasWatchApp:(BOOL)a3;
- (void)setIAdAttribution:(id)a3;
- (void)setIAdConversionDate:(id)a3;
- (void)setIAdImpressionDate:(id)a3;
- (void)setIsAutomatic:(BOOL)a3;
- (void)setIsCompatibilityUpdate:(BOOL)a3;
- (void)setIsDeviceBasedVPP:(BOOL)a3;
- (void)setIsFromStore:(BOOL)a3;
- (void)setIsGameCenterEnabled:(BOOL)a3;
- (void)setIsInQueue:(BOOL)a3;
- (void)setIsPendingApproval:(BOOL)a3;
- (void)setIsPurchasedRedownload:(BOOL)a3;
- (void)setIsRestore:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setIsTVTemplate:(BOOL)a3;
- (void)setIsUpdate:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setKind:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setMessagesArtworkURL:(id)a3;
- (void)setPersistentID:(uint64_t)a1;
- (void)setPurchaseDate:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingRank:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSoftwareIconNeedsShine:(BOOL)a3;
- (void)setSoftwareVersionExternalIdentifier:(id)a3;
- (void)setStoreAccountID:(id)a3;
- (void)setStoreAccountName:(id)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStoreCorrelationKey:(id)a3;
- (void)setStoreDownloadInfo:(id)a3;
- (void)setStoreDownloadKey:(id)a3;
- (void)setStoreTransactionID:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setThirtyTwoBitOnly:(BOOL)a3;
- (void)setThumbnailURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVariantID:(id)a3;
@end

@implementation ASDJobActivity

- (BOOL)isValid
{
  return [(NSString *)self->_bundleID length] != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDJobActivity allocWithZone:](ASDJobActivity, "allocWithZone:") init];
  uint64_t v6 = [(NSData *)self->_appReceiptData copyWithZone:a3];
  appReceiptData = v5->_appReceiptData;
  v5->_appReceiptData = (NSData *)v6;

  uint64_t v8 = [(NSNumber *)self->_artistID copyWithZone:a3];
  artistID = v5->_artistID;
  v5->_artistID = (NSNumber *)v8;

  uint64_t v10 = [(NSString *)self->_artistName copyWithZone:a3];
  artistName = v5->_artistName;
  v5->_artistName = (NSString *)v10;

  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithArray:copyItems:", self->_assets, 1);
  assets = v5->_assets;
  v5->_assets = (NSArray *)v12;

  uint64_t v14 = [(NSNumber *)self->_betaExternalVersionIdentifier copyWithZone:a3];
  betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
  v5->_betaExternalVersionIdentifier = (NSNumber *)v14;

  uint64_t v16 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_buyParams copyWithZone:a3];
  buyParams = v5->_buyParams;
  v5->_buyParams = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_cancelDownloadURL copyWithZone:a3];
  cancelDownloadURL = v5->_cancelDownloadURL;
  v5->_cancelDownloadURL = (NSString *)v22;

  v5->_cancelIfDuplicate = self->_cancelIfDuplicate;
  uint64_t v24 = [(NSString *)self->_clientID copyWithZone:a3];
  clientID = v5->_clientID;
  v5->_clientID = (NSString *)v24;

  uint64_t v26 = [(NSString *)self->_collectionName copyWithZone:a3];
  collectionName = v5->_collectionName;
  v5->_collectionName = (NSString *)v26;

  uint64_t v28 = [(NSNumber *)self->_divertedTrackingID copyWithZone:a3];
  divertedTrackingID = v5->_divertedTrackingID;
  v5->_divertedTrackingID = (NSNumber *)v28;

  uint64_t v30 = [(NSNumber *)self->_enableExtensions copyWithZone:a3];
  enableExtensions = v5->_enableExtensions;
  v5->_enableExtensions = (NSNumber *)v30;

  v5->_explicitContent = self->_explicitContent;
  objc_storeStrong((id *)&v5->_externalOrderKey, self->_externalOrderKey);
  uint64_t v32 = [(NSString *)self->_genre copyWithZone:a3];
  genre = v5->_genre;
  v5->_genre = (NSString *)v32;

  uint64_t v34 = [(NSNumber *)self->_genreID copyWithZone:a3];
  genreID = v5->_genreID;
  v5->_genreID = (NSNumber *)v34;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  v5->_hasWatchApp = self->_hasWatchApp;
  uint64_t v36 = [(NSNumber *)self->_iAdAttribution copyWithZone:a3];
  iAdAttribution = v5->_iAdAttribution;
  v5->_iAdAttribution = (NSNumber *)v36;

  uint64_t v38 = [(NSDate *)self->_iAdConversionDate copyWithZone:a3];
  iAdConversionDate = v5->_iAdConversionDate;
  v5->_iAdConversionDate = (NSDate *)v38;

  uint64_t v40 = [(NSDate *)self->_iAdImpressionDate copyWithZone:a3];
  iAdImpressionDate = v5->_iAdImpressionDate;
  v5->_iAdImpressionDate = (NSDate *)v40;

  v5->_isAutomatic = self->_isAutomatic;
  v5->_isCompatibilityUpdate = self->_isCompatibilityUpdate;
  v5->_isDeviceBasedVPP = self->_isDeviceBasedVPP;
  v5->_isFromStore = self->_isFromStore;
  v5->_isGameCenterEnabled = self->_isGameCenterEnabled;
  v5->_isInQueue = self->_isInQueue;
  v5->_isPendingApproval = self->_isPendingApproval;
  v5->_isPurchasedRedownload = self->_isPurchasedRedownload;
  v5->_isRestore = self->_isRestore;
  v5->_isShared = self->_isShared;
  v5->_isTVTemplate = self->_isTVTemplate;
  v5->_isUpdate = self->_isUpdate;
  uint64_t v42 = [(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v42;

  uint64_t v44 = [(NSString *)self->_kind copyWithZone:a3];
  kind = v5->_kind;
  v5->_kind = (NSString *)v44;

  v5->_launchProhibited = self->_launchProhibited;
  uint64_t v46 = [(NSString *)self->_messagesArtworkURL copyWithZone:a3];
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = (NSString *)v46;

  uint64_t v48 = [(NSNumber *)self->_persistentID copyWithZone:a3];
  persistentID = v5->_persistentID;
  v5->_persistentID = (NSNumber *)v48;

  uint64_t v50 = [(NSDate *)self->_purchaseDate copyWithZone:a3];
  purchaseDate = v5->_purchaseDate;
  v5->_purchaseDate = (NSDate *)v50;

  uint64_t v52 = [(NSNumber *)self->_purchaseID copyWithZone:a3];
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v52;

  uint64_t v54 = [(NSString *)self->_ratingLabel copyWithZone:a3];
  ratingLabel = v5->_ratingLabel;
  v5->_ratingLabel = (NSString *)v54;

  uint64_t v56 = [(NSNumber *)self->_ratingRank copyWithZone:a3];
  ratingRank = v5->_ratingRank;
  v5->_ratingRank = (NSNumber *)v56;

  uint64_t v58 = [(NSDate *)self->_releaseDate copyWithZone:a3];
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = (NSDate *)v58;

  v5->_softwareIconNeedsShine = self->_softwareIconNeedsShine;
  uint64_t v60 = [(NSNumber *)self->_softwareVersionExternalIdentifier copyWithZone:a3];
  softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
  v5->_softwareVersionExternalIdentifier = (NSNumber *)v60;

  uint64_t v62 = [(NSNumber *)self->_storeAccountID copyWithZone:a3];
  storeAccountID = v5->_storeAccountID;
  v5->_storeAccountID = (NSNumber *)v62;

  uint64_t v64 = [(NSString *)self->_storeAccountName copyWithZone:a3];
  storeAccountName = v5->_storeAccountName;
  v5->_storeAccountName = (NSString *)v64;

  uint64_t v66 = [(NSString *)self->_storeCohort copyWithZone:a3];
  storeCohort = v5->_storeCohort;
  v5->_storeCohort = (NSString *)v66;

  uint64_t v68 = [(NSDictionary *)self->_storeDownloadInfo copyWithZone:a3];
  storeDownloadInfo = v5->_storeDownloadInfo;
  v5->_storeDownloadInfo = (NSDictionary *)v68;

  uint64_t v70 = [(NSString *)self->_storeDownloadKey copyWithZone:a3];
  storeDownloadKey = v5->_storeDownloadKey;
  v5->_storeDownloadKey = (NSString *)v70;

  uint64_t v72 = [(NSString *)self->_storefront copyWithZone:a3];
  storefront = v5->_storefront;
  v5->_storefront = (NSString *)v72;

  uint64_t v74 = [(NSString *)self->_storeTransactionID copyWithZone:a3];
  storeTransactionID = v5->_storeTransactionID;
  v5->_storeTransactionID = (NSString *)v74;

  v5->_thirtyTwoBitOnly = self->_thirtyTwoBitOnly;
  uint64_t v76 = [(NSString *)self->_thumbnailURL copyWithZone:a3];
  thumbnailURL = v5->_thumbnailURL;
  v5->_thumbnailURL = (NSString *)v76;

  uint64_t v78 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v78;

  uint64_t v80 = [(NSString *)self->_variantID copyWithZone:a3];
  variantID = v5->_variantID;
  v5->_variantID = (NSString *)v80;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)ASDJobActivity;
  v5 = [(ASDJobActivity *)&v93 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appReceipt"];
    appReceiptData = v5->_appReceiptData;
    v5->_appReceiptData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artistID"];
    artistID = v5->_artistID;
    v5->_artistID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artistName"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"assets"];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"betaExternalVersionIdentifier"];
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buyParams"];
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelDownloadURL"];
    cancelDownloadURL = v5->_cancelDownloadURL;
    v5->_cancelDownloadURL = (NSString *)v25;

    v5->_cancelIfDuplicate = [v4 decodeBoolForKey:@"cancelIfDuplicate"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionName"];
    collectionName = v5->_collectionName;
    v5->_collectionName = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"divertedTrackingID"];
    divertedTrackingID = v5->_divertedTrackingID;
    v5->_divertedTrackingID = (NSNumber *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enableExtensions"];
    enableExtensions = v5->_enableExtensions;
    v5->_enableExtensions = (NSNumber *)v33;

    v5->_explicitContent = [v4 decodeBoolForKey:@"explicitContent"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalOrderKey"];
    externalOrderKey = v5->_externalOrderKey;
    v5->_externalOrderKey = (NSNumber *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    genre = v5->_genre;
    v5->_genre = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genreID"];
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v39;

    v5->_hasMessagesExtension = [v4 decodeBoolForKey:@"hasMessagesExtension"];
    v5->_hasWatchApp = [v4 decodeBoolForKey:@"hasWatchApp"];
    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdAttribution"];
    iAdAttribution = v5->_iAdAttribution;
    v5->_iAdAttribution = (NSNumber *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdConversionDate"];
    iAdConversionDate = v5->_iAdConversionDate;
    v5->_iAdConversionDate = (NSDate *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdImpressionDate"];
    iAdImpressionDate = v5->_iAdImpressionDate;
    v5->_iAdImpressionDate = (NSDate *)v45;

    v5->_isAutomatic = [v4 decodeBoolForKey:@"isAutomatic"];
    v5->_isCompatibilityUpdate = [v4 decodeBoolForKey:@"isCompatibilityUpdate"];
    v5->_isDeviceBasedVPP = [v4 decodeBoolForKey:@"isDeviceBasedVPP"];
    v5->_isFromStore = [v4 decodeBoolForKey:@"isFromStore"];
    v5->_isGameCenterEnabled = [v4 decodeBoolForKey:@"isGameCenterEnabled"];
    v5->_isInQueue = [v4 decodeBoolForKey:@"isInQueue"];
    v5->_isPendingApproval = [v4 decodeBoolForKey:@"isPendingApproval"];
    v5->_isPurchasedRedownload = [v4 decodeBoolForKey:@"isPurchasedRedownload"];
    v5->_isRestore = [v4 decodeBoolForKey:@"isRestore"];
    v5->_isShared = [v4 decodeBoolForKey:@"isShared"];
    v5->_isTVTemplate = [v4 decodeBoolForKey:@"isTVTemplate"];
    v5->_isUpdate = [v4 decodeBoolForKey:@"isUpdate"];
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v49;

    v5->_launchProhibited = [v4 decodeBoolForKey:@"launchProhibited"];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagesArtworkURL"];
    messagesArtworkURL = v5->_messagesArtworkURL;
    v5->_messagesArtworkURL = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseDate"];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseID"];
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingLabel"];
    ratingLabel = v5->_ratingLabel;
    v5->_ratingLabel = (NSString *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingRank"];
    ratingRank = v5->_ratingRank;
    v5->_ratingRank = (NSNumber *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v63;

    v5->_softwareIconNeedsShine = [v4 decodeBoolForKey:@"softwareIconNeedsShine"];
    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeAccountID"];
    storeAccountID = v5->_storeAccountID;
    v5->_storeAccountID = (NSNumber *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeAccountName"];
    storeAccountName = v5->_storeAccountName;
    v5->_storeAccountName = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    v73 = objc_msgSend(v69, "setWithObjects:", v70, v71, v72, objc_opt_class(), 0);
    uint64_t v74 = [v4 decodeObjectOfClasses:v73 forKey:@"storeDownloadInfo"];
    storeDownloadInfo = v5->_storeDownloadInfo;
    v5->_storeDownloadInfo = (NSDictionary *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"softwareVersionExternalIdentifier"];
    softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
    v5->_softwareVersionExternalIdentifier = (NSNumber *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeDownloadKey"];
    storeDownloadKey = v5->_storeDownloadKey;
    v5->_storeDownloadKey = (NSString *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeTransactionID"];
    storeTransactionID = v5->_storeTransactionID;
    v5->_storeTransactionID = (NSString *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeCohort"];
    storeCohort = v5->_storeCohort;
    v5->_storeCohort = (NSString *)v84;

    v5->_thirtyTwoBitOnly = [v4 decodeBoolForKey:@"thirtyTwoBitOnly"];
    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailURL"];
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSString *)v86;

    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantID"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v90;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appReceiptData = self->_appReceiptData;
  id v5 = a3;
  [v5 encodeObject:appReceiptData forKey:@"appReceipt"];
  [v5 encodeObject:self->_artistID forKey:@"artistID"];
  [v5 encodeObject:self->_artistName forKey:@"artistName"];
  [v5 encodeObject:self->_assets forKey:@"assets"];
  [v5 encodeObject:self->_betaExternalVersionIdentifier forKey:@"betaExternalVersionIdentifier"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v5 encodeObject:self->_buyParams forKey:@"buyParams"];
  [v5 encodeObject:self->_cancelDownloadURL forKey:@"cancelDownloadURL"];
  [v5 encodeBool:self->_cancelIfDuplicate forKey:@"cancelIfDuplicate"];
  [v5 encodeObject:self->_clientID forKey:@"clientID"];
  [v5 encodeObject:self->_collectionName forKey:@"collectionName"];
  [v5 encodeObject:self->_divertedTrackingID forKey:@"divertedTrackingID"];
  [v5 encodeObject:self->_enableExtensions forKey:@"enableExtensions"];
  [v5 encodeBool:self->_explicitContent forKey:@"explicitContent"];
  [v5 encodeObject:self->_externalOrderKey forKey:@"externalOrderKey"];
  [v5 encodeObject:self->_genre forKey:@"genre"];
  [v5 encodeObject:self->_genreID forKey:@"genreID"];
  [v5 encodeBool:self->_hasMessagesExtension forKey:@"hasMessagesExtension"];
  [v5 encodeBool:self->_hasWatchApp forKey:@"hasWatchApp"];
  [v5 encodeObject:self->_iAdAttribution forKey:@"iAdAttribution"];
  [v5 encodeObject:self->_iAdConversionDate forKey:@"iAdConversionDate"];
  [v5 encodeObject:self->_iAdImpressionDate forKey:@"iAdImpressionDate"];
  [v5 encodeBool:self->_isAutomatic forKey:@"isAutomatic"];
  [v5 encodeBool:self->_isCompatibilityUpdate forKey:@"isCompatibilityUpdate"];
  [v5 encodeBool:self->_isDeviceBasedVPP forKey:@"isDeviceBasedVPP"];
  [v5 encodeBool:self->_isFromStore forKey:@"isFromStore"];
  [v5 encodeBool:self->_isGameCenterEnabled forKey:@"isGameCenterEnabled"];
  [v5 encodeBool:self->_isInQueue forKey:@"isInQueue"];
  [v5 encodeBool:self->_isPendingApproval forKey:@"isPendingApproval"];
  [v5 encodeBool:self->_isPurchasedRedownload forKey:@"isPurchasedRedownload"];
  [v5 encodeBool:self->_isRestore forKey:@"isRestore"];
  [v5 encodeBool:self->_isShared forKey:@"isShared"];
  [v5 encodeBool:self->_isTVTemplate forKey:@"isDeviceBasedVPP"];
  [v5 encodeBool:self->_isUpdate forKey:@"isUpdate"];
  [v5 encodeObject:self->_itemID forKey:@"itemID"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  [v5 encodeBool:self->_launchProhibited forKey:@"launchProhibited"];
  [v5 encodeObject:self->_messagesArtworkURL forKey:@"messagesArtworkURL"];
  [v5 encodeObject:self->_persistentID forKey:@"persistentID"];
  [v5 encodeObject:self->_purchaseDate forKey:@"purchaseDate"];
  [v5 encodeObject:self->_purchaseID forKey:@"purchaseID"];
  [v5 encodeObject:self->_ratingLabel forKey:@"ratingLabel"];
  [v5 encodeObject:self->_ratingRank forKey:@"ratingRank"];
  [v5 encodeObject:self->_releaseDate forKey:@"releaseDate"];
  [v5 encodeBool:self->_softwareIconNeedsShine forKey:@"softwareIconNeedsShine"];
  [v5 encodeObject:self->_softwareVersionExternalIdentifier forKey:@"softwareVersionExternalIdentifier"];
  [v5 encodeObject:self->_storeAccountID forKey:@"storeAccountID"];
  [v5 encodeObject:self->_storeAccountName forKey:@"storeAccountName"];
  [v5 encodeObject:self->_storeCohort forKey:@"storeCohort"];
  [v5 encodeObject:self->_storeDownloadInfo forKey:@"storeDownloadInfo"];
  [v5 encodeObject:self->_storeDownloadKey forKey:@"storeDownloadKey"];
  [v5 encodeObject:self->_storefront forKey:@"storefront"];
  [v5 encodeObject:self->_storeTransactionID forKey:@"storeTransactionID"];
  [v5 encodeBool:self->_thirtyTwoBitOnly forKey:@"thirtyTwoBitOnly"];
  [v5 encodeObject:self->_thumbnailURL forKey:@"thumbnailURL"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_variantID forKey:@"variantID"];
}

- (NSData)appReceiptData
{
  return self->_appReceiptData;
}

- (void)setAppReceiptData:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSNumber)artistID
{
  return self->_artistID;
}

- (void)setArtistID:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (NSString)cancelDownloadURL
{
  return self->_cancelDownloadURL;
}

- (void)setCancelDownloadURL:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (BOOL)cancelIfDuplicate
{
  return self->_cancelIfDuplicate;
}

- (void)setCancelIfDuplicate:(BOOL)a3
{
  self->_cancelIfDuplicate = a3;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
}

- (NSNumber)divertedTrackingID
{
  return self->_divertedTrackingID;
}

- (void)setDivertedTrackingID:(id)a3
{
}

- (NSNumber)enableExtensions
{
  return self->_enableExtensions;
}

- (void)setEnableExtensions:(id)a3
{
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSNumber)externalOrderKey
{
  return self->_externalOrderKey;
}

- (void)setExternalOrderKey:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(id)a3
{
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (BOOL)hasWatchApp
{
  return self->_hasWatchApp;
}

- (void)setHasWatchApp:(BOOL)a3
{
  self->_hasWatchApp = a3;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void)setIsAutomatic:(BOOL)a3
{
  self->_isAutomatic = a3;
}

- (BOOL)isCompatibilityUpdate
{
  return self->_isCompatibilityUpdate;
}

- (void)setIsCompatibilityUpdate:(BOOL)a3
{
  self->_isCompatibilityUpdate = a3;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_isDeviceBasedVPP;
}

- (void)setIsDeviceBasedVPP:(BOOL)a3
{
  self->_isDeviceBasedVPP = a3;
}

- (BOOL)isGameCenterEnabled
{
  return self->_isGameCenterEnabled;
}

- (void)setIsGameCenterEnabled:(BOOL)a3
{
  self->_isGameCenterEnabled = a3;
}

- (BOOL)isInQueue
{
  return self->_isInQueue;
}

- (void)setIsInQueue:(BOOL)a3
{
  self->_isInQueue = a3;
}

- (BOOL)isFromStore
{
  return self->_isFromStore;
}

- (void)setIsFromStore:(BOOL)a3
{
  self->_isFromStore = a3;
}

- (BOOL)isPurchasedRedownload
{
  return self->_isPurchasedRedownload;
}

- (void)setIsPurchasedRedownload:(BOOL)a3
{
  self->_isPurchasedRedownload = a3;
}

- (BOOL)isPendingApproval
{
  return self->_isPendingApproval;
}

- (void)setIsPendingApproval:(BOOL)a3
{
  self->_isPendingApproval = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (BOOL)isTVTemplate
{
  return self->_isTVTemplate;
}

- (void)setIsTVTemplate:(BOOL)a3
{
  self->_isTVTemplate = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void)setIsUpdate:(BOOL)a3
{
  self->_isUpdate = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (BOOL)launchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (NSNumber)ratingRank
{
  return self->_ratingRank;
}

- (void)setRatingRank:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setStoreAccountID:(id)a3
{
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (void)setStoreAccountName:(id)a3
{
}

- (NSString)storeCorrelationKey
{
  return self->_storeCorrelationKey;
}

- (void)setStoreCorrelationKey:(id)a3
{
}

- (NSDictionary)storeDownloadInfo
{
  return self->_storeDownloadInfo;
}

- (void)setStoreDownloadInfo:(id)a3
{
}

- (NSString)storeDownloadKey
{
  return self->_storeDownloadKey;
}

- (void)setStoreDownloadKey:(id)a3
{
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSString)storeTransactionID
{
  return self->_storeTransactionID;
}

- (void)setStoreTransactionID:(id)a3
{
}

- (BOOL)softwareIconNeedsShine
{
  return self->_softwareIconNeedsShine;
}

- (void)setSoftwareIconNeedsShine:(BOOL)a3
{
  self->_softwareIconNeedsShine = a3;
}

- (NSNumber)softwareVersionExternalIdentifier
{
  return self->_softwareVersionExternalIdentifier;
}

- (void)setSoftwareVersionExternalIdentifier:(id)a3
{
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (void)setStoreCohort:(id)a3
{
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
}

- (BOOL)is32BitOnly
{
  return self->_thirtyTwoBitOnly;
}

- (void)setThirtyTwoBitOnly:(BOOL)a3
{
  self->_thirtyTwoBitOnly = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
}

- (NSNumber)iAdAttribution
{
  return self->_iAdAttribution;
}

- (void)setIAdAttribution:(id)a3
{
}

- (NSDate)iAdConversionDate
{
  return self->_iAdConversionDate;
}

- (void)setIAdConversionDate:(id)a3
{
}

- (NSDate)iAdImpressionDate
{
  return self->_iAdImpressionDate;
}

- (void)setIAdImpressionDate:(id)a3
{
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 344), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_iAdImpressionDate, 0);
  objc_storeStrong((id *)&self->_iAdConversionDate, 0);
  objc_storeStrong((id *)&self->_iAdAttribution, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_softwareVersionExternalIdentifier, 0);
  objc_storeStrong((id *)&self->_storeTransactionID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_storeDownloadKey, 0);
  objc_storeStrong((id *)&self->_storeDownloadInfo, 0);
  objc_storeStrong((id *)&self->_storeCorrelationKey, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_externalOrderKey, 0);
  objc_storeStrong((id *)&self->_enableExtensions, 0);
  objc_storeStrong((id *)&self->_divertedTrackingID, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_appReceiptData, 0);
}

@end