@interface BLJaliscoItem
+ (id)arrayWithServerItems:(id)a3;
+ (id)itemWithServerItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)expectedDate;
- (NSDate)purchasedAt;
- (NSDictionary)additionalAudiobookInfo;
- (NSNumber)containsAudio;
- (NSNumber)duration;
- (NSNumber)isAudiobook;
- (NSNumber)isDisabled;
- (NSNumber)isExplicit;
- (NSNumber)isHidden;
- (NSNumber)isPictureBook;
- (NSNumber)isReadAloud;
- (NSNumber)needsImport;
- (NSNumber)purchaseHistoryID;
- (NSNumber)storeAccountID;
- (NSSet)booklets;
- (NSString)artist;
- (NSString)artworkTokenCode;
- (NSString)artworkURLString;
- (NSString)chapterMetadataURLString;
- (NSString)cloudID;
- (NSString)displayVersion;
- (NSString)fileExtension;
- (NSString)genre;
- (NSString)hlsPlaylistURLString;
- (NSString)purchasedTokenCode;
- (NSString)sortedAuthor;
- (NSString)sortedTitle;
- (NSString)storeDownloadParameters;
- (NSString)storeID;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)setAdditionalAudiobookInfo:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkTokenCode:(id)a3;
- (void)setArtworkURLString:(id)a3;
- (void)setBooklets:(id)a3;
- (void)setChapterMetadataURLString:(id)a3;
- (void)setCloudID:(id)a3;
- (void)setContainsAudio:(id)a3;
- (void)setDisplayVersion:(id)a3;
- (void)setExpectedDate:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setGenre:(id)a3;
- (void)setHlsPlaylistURLString:(id)a3;
- (void)setIsAudiobook:(id)a3;
- (void)setIsDisabled:(id)a3;
- (void)setIsExplicit:(id)a3;
- (void)setIsHidden:(id)a3;
- (void)setIsPictureBook:(id)a3;
- (void)setIsReadAloud:(id)a3;
- (void)setNeedsImport:(id)a3;
- (void)setPurchaseHistoryID:(id)a3;
- (void)setPurchasedAt:(id)a3;
- (void)setPurchasedTokenCode:(id)a3;
- (void)setSortedAuthor:(id)a3;
- (void)setSortedTitle:(id)a3;
- (void)setStoreAccountID:(id)a3;
- (void)setStoreDownloadParameters:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BLJaliscoItem

+ (id)itemWithServerItem:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_storeID(v3, v5, v6, v7);
  objc_msgSend_setStoreID_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_artist(v3, v11, v12, v13);
  objc_msgSend_setArtist_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_artworkTokenCode(v3, v17, v18, v19);
  objc_msgSend_setArtworkTokenCode_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_artworkURLString(v3, v23, v24, v25);
  objc_msgSend_setArtworkURLString_(v4, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_cloudID(v3, v29, v30, v31);
  objc_msgSend_setCloudID_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_genre(v3, v35, v36, v37);
  objc_msgSend_setGenre_(v4, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_isHidden(v3, v41, v42, v43);
  objc_msgSend_setIsHidden_(v4, v45, (uint64_t)v44, v46);

  v50 = objc_msgSend_purchasedAt(v3, v47, v48, v49);
  objc_msgSend_setPurchasedAt_(v4, v51, (uint64_t)v50, v52);

  v56 = objc_msgSend_purchasedTokenCode(v3, v53, v54, v55);
  objc_msgSend_setPurchasedTokenCode_(v4, v57, (uint64_t)v56, v58);

  v62 = objc_msgSend_purchaseHistoryID(v3, v59, v60, v61);
  objc_msgSend_setPurchaseHistoryID_(v4, v63, (uint64_t)v62, v64);

  v68 = objc_msgSend_title(v3, v65, v66, v67);
  objc_msgSend_setTitle_(v4, v69, (uint64_t)v68, v70);

  v74 = objc_msgSend_isExplicit(v3, v71, v72, v73);
  objc_msgSend_setIsExplicit_(v4, v75, (uint64_t)v74, v76);

  v80 = objc_msgSend_isDisabled(v3, v77, v78, v79);
  objc_msgSend_setIsDisabled_(v4, v81, (uint64_t)v80, v82);

  v86 = objc_msgSend_expectedDate(v3, v83, v84, v85);
  objc_msgSend_setExpectedDate_(v4, v87, (uint64_t)v86, v88);

  v92 = objc_msgSend_sortedTitle(v3, v89, v90, v91);
  objc_msgSend_setSortedTitle_(v4, v93, (uint64_t)v92, v94);

  v98 = objc_msgSend_sortedAuthor(v3, v95, v96, v97);
  objc_msgSend_setSortedAuthor_(v4, v99, (uint64_t)v98, v100);

  v104 = objc_msgSend_displayVersion(v3, v101, v102, v103);
  objc_msgSend_setDisplayVersion_(v4, v105, (uint64_t)v104, v106);

  v110 = objc_msgSend_storeDownloadParameters(v3, v107, v108, v109);
  objc_msgSend_setStoreDownloadParameters_(v4, v111, (uint64_t)v110, v112);

  v116 = objc_msgSend_fileExtension(v3, v113, v114, v115);
  objc_msgSend_setFileExtension_(v4, v117, (uint64_t)v116, v118);

  v122 = objc_msgSend_isPictureBook(v3, v119, v120, v121);
  objc_msgSend_setIsPictureBook_(v4, v123, (uint64_t)v122, v124);

  v128 = objc_msgSend_containsAudio(v3, v125, v126, v127);
  objc_msgSend_setContainsAudio_(v4, v129, (uint64_t)v128, v130);

  v134 = objc_msgSend_isReadAloud(v3, v131, v132, v133);
  objc_msgSend_setIsReadAloud_(v4, v135, (uint64_t)v134, v136);

  v140 = objc_msgSend_chapterMetadataURLString(v3, v137, v138, v139);
  objc_msgSend_setChapterMetadataURLString_(v4, v141, (uint64_t)v140, v142);

  v146 = objc_msgSend_isAudiobook(v3, v143, v144, v145);
  objc_msgSend_setIsAudiobook_(v4, v147, (uint64_t)v146, v148);

  v152 = objc_msgSend_hlsPlaylistURLString(v3, v149, v150, v151);
  objc_msgSend_setHlsPlaylistURLString_(v4, v153, (uint64_t)v152, v154);

  v158 = objc_msgSend_storeAccountID(v3, v155, v156, v157);
  objc_msgSend_setStoreAccountID_(v4, v159, (uint64_t)v158, v160);

  v164 = objc_msgSend_additionalAudiobookInfo(v3, v161, v162, v163);
  objc_msgSend_setAdditionalAudiobookInfo_(v4, v165, (uint64_t)v164, v166);

  v170 = objc_msgSend_needsImport(v3, v167, v168, v169);
  objc_msgSend_setNeedsImport_(v4, v171, (uint64_t)v170, v172);

  v176 = objc_msgSend_booklets(v3, v173, v174, v175);

  if (objc_msgSend_count(v176, v177, v178, v179))
  {
    v183 = (void *)MEMORY[0x263EFFA08];
    v184 = objc_msgSend_allObjects(v176, v180, v181, v182);
    v187 = objc_msgSend_arrayWithServerBookletItems_(BLJaliscoBookletItem, v185, (uint64_t)v184, v186);
    v190 = objc_msgSend_setWithArray_(v183, v188, (uint64_t)v187, v189);
    objc_msgSend_setBooklets_(v4, v191, (uint64_t)v190, v192);
  }

  return v4;
}

- (NSNumber)duration
{
  v4 = objc_msgSend_additionalAudiobookInfo(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"daap.songtime", v6);

  objc_opt_class();
  v8 = BUDynamicCast();
  uint64_t v12 = v8;
  uint64_t v13 = NSNumber;
  if (v8)
  {
    objc_msgSend_doubleValue(v8, v9, v10, v11);
    objc_msgSend_numberWithDouble_(v13, v14, v15, v16);
  }
  else
  {
    objc_opt_class();
    BUDynamicCast();
  v17 = };

  return (NSNumber *)v17;
}

+ (id)arrayWithServerItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = objc_msgSend_itemWithServerItem_(BLJaliscoItem, v8, *(void *)(*((void *)&v17 + 1) + 8 * i), v9, (void)v17);
        objc_msgSend_addObject_(v4, v14, (uint64_t)v13, v15);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_storeAccountID(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_storeAccountID(v4, v8, v9, v10);
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  uint64_t v17 = objc_msgSend_storeID(self, v14, v15, v16);
  if (v17
    && ((v21 = (void *)v17,
         objc_msgSend_storeID(v4, v18, v19, v20),
         uint64_t v22 = objc_claimAutoreleasedReturnValue(),
         v22,
         v21,
         !v22)
      ? (char v26 = 1)
      : (char v26 = v13),
        (v26 & 1) == 0))
  {
    uint64_t v28 = objc_msgSend_storeAccountID(v4, v23, v24, v25);
    v32 = objc_msgSend_storeAccountID(self, v29, v30, v31);
    if (objc_msgSend_isEqualToNumber_(v28, v33, (uint64_t)v32, v34))
    {
      v38 = objc_msgSend_storeID(v4, v35, v36, v37);
      uint64_t v42 = objc_msgSend_storeID(self, v39, v40, v41);
      char isEqualToString = objc_msgSend_isEqualToString_(v38, v43, (uint64_t)v42, v44);
    }
    else
    {
      char isEqualToString = 0;
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_storeID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  BOOL v13 = objc_msgSend_storeAccountID(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_title(self, v6, v7, v8);
  BOOL v13 = objc_msgSend_artist(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_storeID(self, v14, v15, v16);
  v21 = objc_msgSend_storeAccountID(self, v18, v19, v20);
  uint64_t v24 = objc_msgSend_stringWithFormat_(v3, v22, @"<%@:%p title=%@ author=%@ storeID=%@ storeAccountID=%@ >", v23, v5, self, v9, v13, v17, v21);

  return v24;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)artworkTokenCode
{
  return self->_artworkTokenCode;
}

- (void)setArtworkTokenCode:(id)a3
{
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
}

- (NSString)cloudID
{
  return self->_cloudID;
}

- (void)setCloudID:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(id)a3
{
}

- (NSDate)purchasedAt
{
  return self->_purchasedAt;
}

- (void)setPurchasedAt:(id)a3
{
}

- (NSString)purchasedTokenCode
{
  return self->_purchasedTokenCode;
}

- (void)setPurchasedTokenCode:(id)a3
{
}

- (NSNumber)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (void)setPurchaseHistoryID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSNumber)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(id)a3
{
}

- (NSNumber)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(id)a3
{
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (void)setExpectedDate:(id)a3
{
}

- (NSString)sortedTitle
{
  return self->_sortedTitle;
}

- (void)setSortedTitle:(id)a3
{
}

- (NSString)sortedAuthor
{
  return self->_sortedAuthor;
}

- (void)setSortedAuthor:(id)a3
{
}

- (NSString)displayVersion
{
  return self->_displayVersion;
}

- (void)setDisplayVersion:(id)a3
{
}

- (NSString)storeDownloadParameters
{
  return self->_storeDownloadParameters;
}

- (void)setStoreDownloadParameters:(id)a3
{
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
}

- (NSNumber)isPictureBook
{
  return self->_isPictureBook;
}

- (void)setIsPictureBook:(id)a3
{
}

- (NSNumber)containsAudio
{
  return self->_containsAudio;
}

- (void)setContainsAudio:(id)a3
{
}

- (NSNumber)isReadAloud
{
  return self->_isReadAloud;
}

- (void)setIsReadAloud:(id)a3
{
}

- (NSString)chapterMetadataURLString
{
  return self->_chapterMetadataURLString;
}

- (void)setChapterMetadataURLString:(id)a3
{
}

- (NSNumber)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(id)a3
{
}

- (NSString)hlsPlaylistURLString
{
  return self->_hlsPlaylistURLString;
}

- (void)setHlsPlaylistURLString:(id)a3
{
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setStoreAccountID:(id)a3
{
}

- (NSDictionary)additionalAudiobookInfo
{
  return self->_additionalAudiobookInfo;
}

- (void)setAdditionalAudiobookInfo:(id)a3
{
}

- (NSNumber)needsImport
{
  return self->_needsImport;
}

- (void)setNeedsImport:(id)a3
{
}

- (NSSet)booklets
{
  return self->_booklets;
}

- (void)setBooklets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_booklets, 0);
  objc_storeStrong((id *)&self->_needsImport, 0);
  objc_storeStrong((id *)&self->_additionalAudiobookInfo, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistURLString, 0);
  objc_storeStrong((id *)&self->_isAudiobook, 0);
  objc_storeStrong((id *)&self->_chapterMetadataURLString, 0);
  objc_storeStrong((id *)&self->_isReadAloud, 0);
  objc_storeStrong((id *)&self->_containsAudio, 0);
  objc_storeStrong((id *)&self->_isPictureBook, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_storeDownloadParameters, 0);
  objc_storeStrong((id *)&self->_displayVersion, 0);
  objc_storeStrong((id *)&self->_sortedAuthor, 0);
  objc_storeStrong((id *)&self->_sortedTitle, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_isDisabled, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryID, 0);
  objc_storeStrong((id *)&self->_purchasedTokenCode, 0);
  objc_storeStrong((id *)&self->_purchasedAt, 0);
  objc_storeStrong((id *)&self->_isHidden, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_cloudID, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_artworkTokenCode, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end