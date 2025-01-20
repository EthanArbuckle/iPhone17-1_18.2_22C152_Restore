@interface BLDownloadStatus
- (BOOL)canPause;
- (BOOL)isAudiobook;
- (BOOL)isPurchase;
- (BOOL)isRestore;
- (BOOL)isSample;
- (NSDate)purchaseDate;
- (NSNumber)estimatedTimeRemaining;
- (NSNumber)percentComplete;
- (NSNumber)storeAccountIdentifier;
- (NSNumber)storeID;
- (NSNumber)storePlaylistID;
- (NSNumber)transferBytesExpected;
- (NSNumber)transferBytesWritten;
- (NSString)artistName;
- (NSString)assetKind;
- (NSString)collectionArtistName;
- (NSString)collectionTitle;
- (NSString)downloadID;
- (NSString)genre;
- (NSString)permLink;
- (NSString)subtitle;
- (NSString)thumbnailImageURL;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downloadPhase;
- (int64_t)persistentIdentifier;
- (void)setArtistName:(id)a3;
- (void)setAssetKind:(id)a3;
- (void)setCanPause:(BOOL)a3;
- (void)setCollectionArtistName:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadPhase:(int64_t)a3;
- (void)setEstimatedTimeRemaining:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsPurchase:(BOOL)a3;
- (void)setIsRestore:(BOOL)a3;
- (void)setIsSample:(BOOL)a3;
- (void)setPercentComplete:(id)a3;
- (void)setPermLink:(id)a3;
- (void)setPersistentIdentifier:(int64_t)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setStoreAccountIdentifier:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setStorePlaylistID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransferBytesExpected:(id)a3;
- (void)setTransferBytesWritten:(id)a3;
@end

@implementation BLDownloadStatus

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_setStoreID_(v4, v5, (uint64_t)self->_storeID, v6);
    v11 = objc_msgSend_storePlaylistID(self, v8, v9, v10);
    objc_msgSend_setStorePlaylistID_(v7, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_permLink(self, v14, v15, v16);
    objc_msgSend_setPermLink_(v7, v18, (uint64_t)v17, v19);

    v23 = objc_msgSend_downloadID(self, v20, v21, v22);
    objc_msgSend_setDownloadID_(v7, v24, (uint64_t)v23, v25);

    uint64_t v29 = objc_msgSend_persistentIdentifier(self, v26, v27, v28);
    objc_msgSend_setPersistentIdentifier_(v7, v30, v29, v31);
    v35 = objc_msgSend_percentComplete(self, v32, v33, v34);
    objc_msgSend_setPercentComplete_(v7, v36, (uint64_t)v35, v37);

    v41 = objc_msgSend_estimatedTimeRemaining(self, v38, v39, v40);
    objc_msgSend_setEstimatedTimeRemaining_(v7, v42, (uint64_t)v41, v43);

    v47 = objc_msgSend_transferBytesWritten(self, v44, v45, v46);
    objc_msgSend_setTransferBytesWritten_(v7, v48, (uint64_t)v47, v49);

    v53 = objc_msgSend_transferBytesExpected(self, v50, v51, v52);
    objc_msgSend_setTransferBytesExpected_(v7, v54, (uint64_t)v53, v55);

    uint64_t v59 = objc_msgSend_downloadPhase(self, v56, v57, v58);
    objc_msgSend_setDownloadPhase_(v7, v60, v59, v61);
    uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v62, v63, v64);
    objc_msgSend_setIsAudiobook_(v7, v66, isAudiobook, v67);
    uint64_t isRestore = objc_msgSend_isRestore(self, v68, v69, v70);
    objc_msgSend_setIsRestore_(v7, v72, isRestore, v73);
    uint64_t isSample = objc_msgSend_isSample(self, v74, v75, v76);
    objc_msgSend_setIsSample_(v7, v78, isSample, v79);
    uint64_t isPurchase = objc_msgSend_isPurchase(self, v80, v81, v82);
    objc_msgSend_setIsPurchase_(v7, v84, isPurchase, v85);
    v89 = objc_msgSend_purchaseDate(self, v86, v87, v88);
    objc_msgSend_setPurchaseDate_(v7, v90, (uint64_t)v89, v91);

    uint64_t v95 = objc_msgSend_persistentIdentifier(self, v92, v93, v94);
    objc_msgSend_setPersistentIdentifier_(v7, v96, v95, v97);
    v101 = objc_msgSend_storeAccountIdentifier(self, v98, v99, v100);
    objc_msgSend_setStoreAccountIdentifier_(v7, v102, (uint64_t)v101, v103);

    v107 = objc_msgSend_artistName(self, v104, v105, v106);
    objc_msgSend_setArtistName_(v7, v108, (uint64_t)v107, v109);

    v113 = objc_msgSend_title(self, v110, v111, v112);
    objc_msgSend_setTitle_(v7, v114, (uint64_t)v113, v115);

    v119 = objc_msgSend_subtitle(self, v116, v117, v118);
    objc_msgSend_setSubtitle_(v7, v120, (uint64_t)v119, v121);

    v125 = objc_msgSend_collectionArtistName(self, v122, v123, v124);
    objc_msgSend_setCollectionArtistName_(v7, v126, (uint64_t)v125, v127);

    v131 = objc_msgSend_collectionTitle(self, v128, v129, v130);
    objc_msgSend_setCollectionTitle_(v7, v132, (uint64_t)v131, v133);

    v137 = objc_msgSend_genre(self, v134, v135, v136);
    objc_msgSend_setGenre_(v7, v138, (uint64_t)v137, v139);

    v143 = objc_msgSend_thumbnailImageURL(self, v140, v141, v142);
    objc_msgSend_setThumbnailImageURL_(v7, v144, (uint64_t)v143, v145);

    v149 = objc_msgSend_assetKind(self, v146, v147, v148);
    objc_msgSend_setAssetKind_(v7, v150, (uint64_t)v149, v151);
  }
  return v7;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSNumber)storePlaylistID
{
  return self->_storePlaylistID;
}

- (void)setStorePlaylistID:(id)a3
{
}

- (NSString)permLink
{
  return self->_permLink;
}

- (void)setPermLink:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSNumber)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(id)a3
{
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(id)a3
{
}

- (NSNumber)transferBytesWritten
{
  return self->_transferBytesWritten;
}

- (void)setTransferBytesWritten:(id)a3
{
}

- (NSNumber)transferBytesExpected
{
  return self->_transferBytesExpected;
}

- (void)setTransferBytesExpected:(id)a3
{
}

- (int64_t)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(int64_t)a3
{
  self->_downloadPhase = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_uint64_t isAudiobook = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_uint64_t isRestore = a3;
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
  self->_uint64_t isSample = a3;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (void)setIsPurchase:(BOOL)a3
{
  self->_uint64_t isPurchase = a3;
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

- (NSString)assetKind
{
  return self->_assetKind;
}

- (void)setAssetKind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKind, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_transferBytesExpected, 0);
  objc_storeStrong((id *)&self->_transferBytesWritten, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_percentComplete, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_storePlaylistID, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end