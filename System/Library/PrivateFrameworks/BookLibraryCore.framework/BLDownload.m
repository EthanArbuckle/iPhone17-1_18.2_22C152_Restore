@interface BLDownload
+ (BOOL)supportsSecureCoding;
- (BLDownload)initWithCoder:(id)a3;
- (NSData)dpInfo;
- (NSData)sinfData;
- (NSDate)lastStateChangeTime;
- (NSDate)purchaseDate;
- (NSDate)startTime;
- (NSNumber)accountID;
- (NSNumber)cleanupPending;
- (NSNumber)familyAccountID;
- (NSNumber)isAutomaticDownload;
- (NSNumber)isLocalCacheServer;
- (NSNumber)isPurchase;
- (NSNumber)isRestore;
- (NSNumber)isSample;
- (NSNumber)isZipStreamable;
- (NSNumber)persistentIdentifier;
- (NSNumber)publicationVersion;
- (NSNumber)serverNumberOfBytesToHash;
- (NSNumber)storeIdentifier;
- (NSNumber)storePlaylistIdentifier;
- (NSString)artistName;
- (NSString)assetPath;
- (NSString)buyParameters;
- (NSString)cancelDownloadURL;
- (NSString)clientIdentifier;
- (NSString)collectionArtistName;
- (NSString)collectionTitle;
- (NSString)downloadID;
- (NSString)downloadKey;
- (NSString)encryptionKey;
- (NSString)genre;
- (NSString)hashType;
- (NSString)kind;
- (NSString)md5HashStrings;
- (NSString)originalURL;
- (NSString)permlink;
- (NSString)salt;
- (NSString)subtitle;
- (NSString)targetDownloadDirectory;
- (NSString)thumbnailImageURL;
- (NSString)title;
- (NSString)transactionIdentifier;
- (NSString)url;
- (double)transferProgressFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfBytesToHash;
- (int64_t)state;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAssetPath:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setCancelDownloadURL:(id)a3;
- (void)setCleanupPending:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadKey:(id)a3;
- (void)setDpInfo:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setFamilyAccountID:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setGenre:(id)a3;
- (void)setHashType:(id)a3;
- (void)setIsAutomaticDownload:(id)a3;
- (void)setIsLocalCacheServer:(id)a3;
- (void)setIsPurchase:(id)a3;
- (void)setIsRestore:(id)a3;
- (void)setIsSample:(id)a3;
- (void)setIsZipStreamable:(id)a3;
- (void)setKind:(id)a3;
- (void)setLastStateChangeTime:(id)a3;
- (void)setMd5HashStrings:(id)a3;
- (void)setNumberOfBytesToHash:(int64_t)a3;
- (void)setOriginalURL:(id)a3;
- (void)setPermlink:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setPublicationVersion:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setSalt:(id)a3;
- (void)setServerNumberOfBytesToHash:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setStorePlaylistIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTargetDownloadDirectory:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BLDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)BLDownload;
  v5 = [(BLDownload *)&v67 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"downloadID");
    objc_msgSend_setDownloadID_(v5, v9, (uint64_t)v8, v10);

    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"buyParameters");
    objc_msgSend_setBuyParameters_(v5, v14, (uint64_t)v13, v15);

    uint64_t v16 = objc_opt_class();
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"permlink");
    objc_msgSend_setPermlink_(v5, v19, (uint64_t)v18, v20);

    uint64_t v21 = objc_opt_class();
    v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"storeIdentifier");
    objc_msgSend_setStoreIdentifier_(v5, v24, (uint64_t)v23, v25);

    uint64_t v26 = objc_opt_class();
    v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"persistentIdentifier");
    objc_msgSend_setPersistentIdentifier_(v5, v29, (uint64_t)v28, v30);

    uint64_t v31 = objc_opt_class();
    v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"originalURL");
    objc_msgSend_setUrl_(v5, v34, (uint64_t)v33, v35);

    uint64_t v36 = objc_opt_class();
    v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"url");
    objc_msgSend_setOriginalURL_(v5, v39, (uint64_t)v38, v40);

    uint64_t v41 = objc_opt_class();
    v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"target");
    objc_msgSend_setTargetDownloadDirectory_(v5, v44, (uint64_t)v43, v45);

    uint64_t v48 = objc_msgSend_decodeIntegerForKey_(v4, v46, @"state", v47);
    objc_msgSend_setState_(v5, v49, v48, v50);
    uint64_t v51 = objc_opt_class();
    v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"startTime");
    objc_msgSend_setStartTime_(v5, v54, (uint64_t)v53, v55);

    uint64_t v56 = objc_opt_class();
    v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, @"assetPath");
    objc_msgSend_setAssetPath_(v5, v59, (uint64_t)v58, v60);

    uint64_t v61 = objc_opt_class();
    v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"publicationVersion");
    objc_msgSend_setPublicationVersion_(v5, v64, (uint64_t)v63, v65);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_downloadID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"downloadID");

  v13 = objc_msgSend_buyParameters(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"buyParameters");

  v18 = objc_msgSend_permlink(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"permlink");

  v23 = objc_msgSend_storeIdentifier(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"storeIdentifier");

  v28 = objc_msgSend_url(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, @"url");

  v33 = objc_msgSend_originalURL(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"originalURL");

  v38 = objc_msgSend_targetDownloadDirectory(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"target");

  uint64_t v43 = objc_msgSend_state(self, v40, v41, v42);
  objc_msgSend_encodeInteger_forKey_(v4, v44, v43, @"state");
  uint64_t v48 = objc_msgSend_startTime(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, @"startTime");

  v53 = objc_msgSend_assetPath(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, @"assetPath");

  v58 = objc_msgSend_persistentIdentifier(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v4, v59, (uint64_t)v58, @"persistentIdentifier");

  objc_msgSend_publicationVersion(self, v60, v61, v62);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v63, (uint64_t)v64, @"publicationVersion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_opt_new();
  if (v7)
  {
    v8 = objc_msgSend_downloadID(self, v4, v5, v6);
    objc_msgSend_setDownloadID_(v7, v9, (uint64_t)v8, v10);

    v14 = objc_msgSend_url(self, v11, v12, v13);
    objc_msgSend_setUrl_(v7, v15, (uint64_t)v14, v16);

    uint64_t v20 = objc_msgSend_targetDownloadDirectory(self, v17, v18, v19);
    objc_msgSend_setTargetDownloadDirectory_(v7, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_state(self, v23, v24, v25);
    objc_msgSend_setState_(v7, v27, v26, v28);
    uint64_t v32 = objc_msgSend_startTime(self, v29, v30, v31);
    objc_msgSend_setStartTime_(v7, v33, (uint64_t)v32, v34);

    v38 = objc_msgSend_assetPath(self, v35, v36, v37);
    objc_msgSend_setAssetPath_(v7, v39, (uint64_t)v38, v40);

    v44 = objc_msgSend_buyParameters(self, v41, v42, v43);
    objc_msgSend_setBuyParameters_(v7, v45, (uint64_t)v44, v46);

    uint64_t v50 = objc_msgSend_permlink(self, v47, v48, v49);
    objc_msgSend_setPermlink_(v7, v51, (uint64_t)v50, v52);

    uint64_t v56 = objc_msgSend_storeIdentifier(self, v53, v54, v55);
    objc_msgSend_setStoreIdentifier_(v7, v57, (uint64_t)v56, v58);

    uint64_t v62 = objc_msgSend_storePlaylistIdentifier(self, v59, v60, v61);
    objc_msgSend_setStorePlaylistIdentifier_(v7, v63, (uint64_t)v62, v64);

    v68 = objc_msgSend_clientIdentifier(self, v65, v66, v67);
    objc_msgSend_setClientIdentifier_(v7, v69, (uint64_t)v68, v70);

    v74 = objc_msgSend_persistentIdentifier(self, v71, v72, v73);
    objc_msgSend_setPersistentIdentifier_(v7, v75, (uint64_t)v74, v76);

    uint64_t v80 = objc_msgSend_fileSize(self, v77, v78, v79);
    objc_msgSend_setFileSize_(v7, v81, v80, v82);
    v86 = objc_msgSend_lastStateChangeTime(self, v83, v84, v85);
    objc_msgSend_setLastStateChangeTime_(v7, v87, (uint64_t)v86, v88);

    v92 = objc_msgSend_hashType(self, v89, v90, v91);
    objc_msgSend_setHashType_(v7, v93, (uint64_t)v92, v94);

    v98 = objc_msgSend_md5HashStrings(self, v95, v96, v97);
    objc_msgSend_setMd5HashStrings_(v7, v99, (uint64_t)v98, v100);

    uint64_t v104 = objc_msgSend_numberOfBytesToHash(self, v101, v102, v103);
    objc_msgSend_setNumberOfBytesToHash_(v7, v105, v104, v106);
    v110 = objc_msgSend_serverNumberOfBytesToHash(self, v107, v108, v109);
    objc_msgSend_setServerNumberOfBytesToHash_(v7, v111, (uint64_t)v110, v112);

    v116 = objc_msgSend_publicationVersion(self, v113, v114, v115);
    objc_msgSend_setPublicationVersion_(v7, v117, (uint64_t)v116, v118);

    v122 = objc_msgSend_isAutomaticDownload(self, v119, v120, v121);
    objc_msgSend_setIsAutomaticDownload_(v7, v123, (uint64_t)v122, v124);

    v128 = objc_msgSend_isRestore(self, v125, v126, v127);
    objc_msgSend_setIsRestore_(v7, v129, (uint64_t)v128, v130);

    v134 = objc_msgSend_downloadKey(self, v131, v132, v133);
    objc_msgSend_setDownloadKey_(v7, v135, (uint64_t)v134, v136);

    v140 = objc_msgSend_accountID(self, v137, v138, v139);
    objc_msgSend_setAccountID_(v7, v141, (uint64_t)v140, v142);

    v146 = objc_msgSend_familyAccountID(self, v143, v144, v145);
    objc_msgSend_setFamilyAccountID_(v7, v147, (uint64_t)v146, v148);

    v152 = objc_msgSend_isZipStreamable(self, v149, v150, v151);
    objc_msgSend_setIsZipStreamable_(v7, v153, (uint64_t)v152, v154);

    v158 = objc_msgSend_dpInfo(self, v155, v156, v157);
    objc_msgSend_setDpInfo_(v7, v159, (uint64_t)v158, v160);

    v164 = objc_msgSend_sinfData(self, v161, v162, v163);
    objc_msgSend_setSinfData_(v7, v165, (uint64_t)v164, v166);

    v170 = objc_msgSend_isSample(self, v167, v168, v169);
    objc_msgSend_setIsSample_(v7, v171, (uint64_t)v170, v172);

    v176 = objc_msgSend_isPurchase(self, v173, v174, v175);
    objc_msgSend_setIsPurchase_(v7, v177, (uint64_t)v176, v178);

    v182 = objc_msgSend_isLocalCacheServer(self, v179, v180, v181);
    objc_msgSend_setIsLocalCacheServer_(v7, v183, (uint64_t)v182, v184);

    v188 = objc_msgSend_originalURL(self, v185, v186, v187);
    objc_msgSend_setOriginalURL_(v7, v189, (uint64_t)v188, v190);

    v194 = objc_msgSend_encryptionKey(self, v191, v192, v193);
    objc_msgSend_setEncryptionKey_(v7, v195, (uint64_t)v194, v196);

    v200 = objc_msgSend_salt(self, v197, v198, v199);
    objc_msgSend_setSalt_(v7, v201, (uint64_t)v200, v202);

    v206 = objc_msgSend_cleanupPending(self, v203, v204, v205);
    objc_msgSend_setCleanupPending_(v7, v207, (uint64_t)v206, v208);

    v212 = objc_msgSend_purchaseDate(self, v209, v210, v211);
    objc_msgSend_setPurchaseDate_(v7, v213, (uint64_t)v212, v214);

    v218 = objc_msgSend_artistName(self, v215, v216, v217);
    objc_msgSend_setArtistName_(v7, v219, (uint64_t)v218, v220);

    v224 = objc_msgSend_title(self, v221, v222, v223);
    objc_msgSend_setTitle_(v7, v225, (uint64_t)v224, v226);

    v230 = objc_msgSend_subtitle(self, v227, v228, v229);
    objc_msgSend_setSubtitle_(v7, v231, (uint64_t)v230, v232);

    v236 = objc_msgSend_collectionArtistName(self, v233, v234, v235);
    objc_msgSend_setCollectionArtistName_(v7, v237, (uint64_t)v236, v238);

    v242 = objc_msgSend_collectionTitle(self, v239, v240, v241);
    objc_msgSend_setCollectionTitle_(v7, v243, (uint64_t)v242, v244);

    v248 = objc_msgSend_genre(self, v245, v246, v247);
    objc_msgSend_setGenre_(v7, v249, (uint64_t)v248, v250);

    v254 = objc_msgSend_kind(self, v251, v252, v253);
    objc_msgSend_setKind_(v7, v255, (uint64_t)v254, v256);

    v260 = objc_msgSend_thumbnailImageURL(self, v257, v258, v259);
    objc_msgSend_setThumbnailImageURL_(v7, v261, (uint64_t)v260, v262);
  }
  return v7;
}

- (double)transferProgressFraction
{
  uint64_t v5 = objc_msgSend_dpInfo(self, a2, v2, v3);

  if (v5) {
    return 0.6;
  }
  uint64_t v10 = objc_msgSend_isZipStreamable(self, v6, v7, v8);
  int v14 = objc_msgSend_BOOLValue(v10, v11, v12, v13);

  double result = 0.8;
  if (v14) {
    return 1.0;
  }
  return result;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_downloadID(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_title(self, v7, v8, v9);
  unint64_t v14 = objc_msgSend_state(self, v11, v12, v13);
  uint64_t v15 = NSStringFromBLDownloadState(v14);
  uint64_t v16 = (void *)MEMORY[0x263F08790];
  uint64_t v20 = objc_msgSend_startTime(self, v17, v18, v19);
  uint64_t v22 = objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(v16, v21, (uint64_t)v20, 1, 3);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v5, v23, @"{ DownloadID: %@ Title: %@ State:%@ Started at: %@}", v24, v6, v10, v15, v22);

  return v25;
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)targetDownloadDirectory
{
  return self->_targetDownloadDirectory;
}

- (void)setTargetDownloadDirectory:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
}

- (NSString)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSNumber)storePlaylistIdentifier
{
  return self->_storePlaylistIdentifier;
}

- (void)setStorePlaylistIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
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

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)lastStateChangeTime
{
  return self->_lastStateChangeTime;
}

- (void)setLastStateChangeTime:(id)a3
{
}

- (NSString)hashType
{
  return self->_hashType;
}

- (void)setHashType:(id)a3
{
}

- (NSString)md5HashStrings
{
  return self->_md5HashStrings;
}

- (void)setMd5HashStrings:(id)a3
{
}

- (int64_t)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(int64_t)a3
{
  self->_numberOfBytesToHash = a3;
}

- (NSNumber)serverNumberOfBytesToHash
{
  return self->_serverNumberOfBytesToHash;
}

- (void)setServerNumberOfBytesToHash:(id)a3
{
}

- (NSNumber)publicationVersion
{
  return self->_publicationVersion;
}

- (void)setPublicationVersion:(id)a3
{
}

- (NSNumber)isAutomaticDownload
{
  return self->_isAutomaticDownload;
}

- (void)setIsAutomaticDownload:(id)a3
{
}

- (NSNumber)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(id)a3
{
}

- (NSString)downloadKey
{
  return self->_downloadKey;
}

- (void)setDownloadKey:(id)a3
{
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSNumber)familyAccountID
{
  return self->_familyAccountID;
}

- (void)setFamilyAccountID:(id)a3
{
}

- (NSNumber)isZipStreamable
{
  return self->_isZipStreamable;
}

- (void)setIsZipStreamable:(id)a3
{
}

- (NSData)dpInfo
{
  return self->_dpInfo;
}

- (void)setDpInfo:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
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

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSNumber)isLocalCacheServer
{
  return self->_isLocalCacheServer;
}

- (void)setIsLocalCacheServer:(id)a3
{
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
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

- (NSNumber)cleanupPending
{
  return self->_cleanupPending;
}

- (void)setCleanupPending:(id)a3
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

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_cleanupPending, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_isLocalCacheServer, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_isPurchase, 0);
  objc_storeStrong((id *)&self->_isSample, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_isZipStreamable, 0);
  objc_storeStrong((id *)&self->_familyAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_downloadKey, 0);
  objc_storeStrong((id *)&self->_isRestore, 0);
  objc_storeStrong((id *)&self->_isAutomaticDownload, 0);
  objc_storeStrong((id *)&self->_publicationVersion, 0);
  objc_storeStrong((id *)&self->_serverNumberOfBytesToHash, 0);
  objc_storeStrong((id *)&self->_md5HashStrings, 0);
  objc_storeStrong((id *)&self->_hashType, 0);
  objc_storeStrong((id *)&self->_lastStateChangeTime, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_storePlaylistIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_targetDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end