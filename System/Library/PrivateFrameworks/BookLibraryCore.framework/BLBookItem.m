@interface BLBookItem
+ (BOOL)supportsSecureCoding;
- (BLBookItem)initWithCoder:(id)a3;
- (BLBookItem)initWithEduCloudData:(id)a3 path:(id)a4;
- (BLBookItem)initWithEntry:(id)a3 basePath:(id)a4;
- (BLBookItem)initWithPeristentIdentifier:(id)a3 permlink:(id)a4 title:(id)a5;
- (BOOL)iTunesU;
- (BOOL)isSample;
- (NSDate)lastUserAccessDate;
- (NSDictionary)entry;
- (NSString)album;
- (NSString)author;
- (NSString)coverImagePath;
- (NSString)feedURL;
- (NSString)folderName;
- (NSString)identifier;
- (NSString)itunesuAssetID;
- (NSString)legacyUniqueIdentifier;
- (NSString)mimeType;
- (NSString)path;
- (NSString)persistentIdentifier;
- (NSString)publicationVersion;
- (NSString)publisherIdentifier;
- (NSString)storeIdentifier;
- (NSString)temporaryIdentifier;
- (NSString)title;
- (NSURL)fileURL;
- (NSURL)permlink;
- (id)_cloudCoverImageData;
- (id)_cloudDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)purgePriority;
- (int64_t)type;
- (void)_setCloudCoverImageData:(id)a3;
- (void)_setFileURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setCoverImagePath:(id)a3;
- (void)setEntry:(id)a3;
- (void)setFeedURL:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFolderName:(id)a3;
- (void)setITunesU:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setItunesuAssetID:(id)a3;
- (void)setLastUserAccessDate:(id)a3;
- (void)setLegacyUniqueIdentifier:(id)a3;
- (void)setPermlink:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setPublicationVersion:(id)a3;
- (void)setPublisherIdentifier:(id)a3;
- (void)setPurgePriority:(int64_t)a3;
- (void)setSample:(BOOL)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setTemporaryIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BLBookItem

- (BLBookItem)initWithEntry:(id)a3 basePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v116.receiver = self;
  v116.super_class = (Class)BLBookItem;
  v10 = [(BLBookItem *)&v116 init];
  if (v10)
  {
    v11 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v8, (uint64_t)v6, v9);
    v14 = objc_msgSend_stringByAppendingPathComponent_(v7, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_temporaryItemIdentifierFromPlistEntry_(IMLibraryPlist, v15, (uint64_t)v6, v16);
    objc_msgSend_setTemporaryIdentifier_(v10, v18, (uint64_t)v17, v19);

    v22 = objc_msgSend_uniqueIdFromPlistEntry_(IMLibraryPlist, v20, (uint64_t)v6, v21);
    objc_msgSend_setLegacyUniqueIdentifier_(v10, v23, (uint64_t)v22, v24);

    v27 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v25, (uint64_t)v6, v26);
    objc_msgSend_setStoreIdentifier_(v10, v28, (uint64_t)v27, v29);

    v32 = objc_msgSend_persistentIDFromPlistEntry_(IMLibraryPlist, v30, (uint64_t)v6, v31);
    objc_msgSend_setPersistentIdentifier_(v10, v33, (uint64_t)v32, v34);

    v37 = objc_msgSend_bookEpubIdFromPlistEntry_(IMLibraryPlist, v35, (uint64_t)v6, v36);
    objc_msgSend_setPublisherIdentifier_(v10, v38, (uint64_t)v37, v39);

    v42 = objc_msgSend_titleFromPlistEntry_(IMLibraryPlist, v40, (uint64_t)v6, v41);
    objc_msgSend_setTitle_(v10, v43, (uint64_t)v42, v44);

    v47 = objc_msgSend_authorFromPlistEntry_(IMLibraryPlist, v45, (uint64_t)v6, v46);
    objc_msgSend_setAuthor_(v10, v48, (uint64_t)v47, v49);

    v52 = objc_msgSend_isItunesUFromPlistEntry_(IMLibraryPlist, v50, (uint64_t)v6, v51);
    uint64_t v56 = objc_msgSend_BOOLValue(v52, v53, v54, v55);
    objc_msgSend_setITunesU_(v10, v57, v56, v58);

    v61 = objc_msgSend_feedURLFromPlistEntry_(IMLibraryPlist, v59, (uint64_t)v6, v60);
    objc_msgSend_setFeedURL_(v10, v62, (uint64_t)v61, v63);

    v66 = objc_msgSend_fileURLWithPath_(NSURL, v64, (uint64_t)v14, v65);
    objc_msgSend_setFileURL_(v10, v67, (uint64_t)v66, v68);

    v72 = objc_msgSend_pathExtension(v14, v69, v70, v71);
    uint64_t v76 = BLBookTypeFromPathExtension(v72, v73, v74, v75);
    objc_msgSend_setType_(v10, v77, v76, v78);

    v81 = objc_msgSend_isSampleFromPlistEntry_(IMLibraryPlist, v79, (uint64_t)v6, v80);
    uint64_t v85 = objc_msgSend_BOOLValue(v81, v82, v83, v84);
    objc_msgSend_setSample_(v10, v86, v85, v87);

    v90 = objc_msgSend_permlinkFromPlistEntry_(IMLibraryPlist, v88, (uint64_t)v6, v89);
    objc_msgSend_setPermlink_(v10, v91, (uint64_t)v90, v92);

    v95 = objc_msgSend_publicationVersionFromPlistEntry_(IMLibraryPlist, v93, (uint64_t)v6, v94);
    objc_msgSend_setPublicationVersion_(v10, v96, (uint64_t)v95, v97);

    v100 = objc_msgSend_albumFromPlistEntry_(IMLibraryPlist, v98, (uint64_t)v6, v99);
    objc_msgSend_setAlbum_(v10, v101, (uint64_t)v100, v102);

    v105 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v103, (uint64_t)v6, v104);
    objc_msgSend_setFolderName_(v10, v106, (uint64_t)v105, v107);

    v110 = objc_msgSend_accessDateFromPlistEntry_(IMLibraryPlist, v108, (uint64_t)v6, v109);
    objc_msgSend_setLastUserAccessDate_(v10, v111, (uint64_t)v110, v112);

    objc_msgSend_setEntry_(v10, v113, (uint64_t)v6, v114);
  }

  return v10;
}

- (BLBookItem)initWithPeristentIdentifier:(id)a3 permlink:(id)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)BLBookItem;
  v14 = [(BLBookItem *)&v37 init];
  if (v14)
  {
    v15 = objc_msgSend_identifierFromPermlink(v9, v11, v12, v13);
    objc_msgSend_setIdentifier_(v14, v16, (uint64_t)v15, v17);

    objc_msgSend_setTemporaryIdentifier_(v14, v18, (uint64_t)v8, v19);
    objc_msgSend_setTitle_(v14, v20, (uint64_t)v10, v21);
    objc_msgSend_setPermlink_(v14, v22, (uint64_t)v9, v23);
    objc_msgSend_setITunesU_(v14, v24, 1, v25);
    uint64_t v29 = objc_msgSend_pathExtension(v9, v26, v27, v28);
    uint64_t v33 = BLBookTypeFromPathExtension(v29, v30, v31, v32);
    objc_msgSend_setType_(v14, v34, v33, v35);
  }
  return v14;
}

- (BLBookItem)initWithEduCloudData:(id)a3 path:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)BLBookItem;
  id v10 = [(BLBookItem *)&v73 init];
  if (v10)
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(v6, v8, @"identifier", v9);
    objc_msgSend_setIdentifier_(v10, v12, (uint64_t)v11, v13);

    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v6, v14, @"temporaryIdentifier", v15);
    objc_msgSend_setTemporaryIdentifier_(v10, v17, (uint64_t)v16, v18);

    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v6, v19, @"title", v20);
    objc_msgSend_setTitle_(v10, v22, (uint64_t)v21, v23);

    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v6, v24, @"author", v25);
    objc_msgSend_setAuthor_(v10, v27, (uint64_t)v26, v28);

    uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v6, v29, @"permlink", v30);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v6, v32, @"permlink", v33);
    }
    else
    {
      uint64_t v34 = 0;
    }

    if (objc_msgSend_length(v34, v35, v36, v37))
    {
      v40 = objc_msgSend_URLWithString_(NSURL, v38, (uint64_t)v34, v39);
      objc_msgSend_setPermlink_(v10, v41, (uint64_t)v40, v42);
    }
    else
    {
      v40 = BLDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v7;
        _os_log_impl(&dword_21DFE3000, v40, OS_LOG_TYPE_INFO, "WARNING: Restoring item from cloud item {%@} that is missing a permlink!", buf, 0xCu);
      }
    }

    v45 = objc_msgSend_objectForKeyedSubscript_(v6, v43, @"type", v44);
    uint64_t v49 = BLBookTypeFromPathExtension(v45, v46, v47, v48);
    objc_msgSend_setType_(v10, v50, v49, v51);

    objc_msgSend_setITunesU_(v10, v52, 1, v53);
    if (objc_msgSend_length(v7, v54, v55, v56))
    {
      v59 = objc_msgSend_fileURLWithPath_(NSURL, v57, (uint64_t)v7, v58);
      objc_msgSend_setFileURL_(v10, v60, (uint64_t)v59, v61);
    }
    else
    {
      v59 = BLDefaultLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v59, OS_LOG_TYPE_INFO, "WARNING: Attempting to restore item from cloud item that is missing a path!", buf, 2u);
      }
    }

    v64 = objc_msgSend_objectForKeyedSubscript_(v6, v62, @"assetID", v63);
    objc_msgSend_setItunesuAssetID_(v10, v65, (uint64_t)v64, v66);

    v69 = objc_msgSend_objectForKeyedSubscript_(v6, v67, @"coverImagePath", v68);
    objc_msgSend_setCoverImagePath_(v10, v70, (uint64_t)v69, v71);
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v8 = objc_msgSend_identifier(self, v5, v6, v7);
  objc_msgSend_setIdentifier_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_temporaryIdentifier(self, v11, v12, v13);
  objc_msgSend_setTemporaryIdentifier_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_legacyUniqueIdentifier(self, v17, v18, v19);
  objc_msgSend_setLegacyUniqueIdentifier_(v4, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_storeIdentifier(self, v23, v24, v25);
  objc_msgSend_setStoreIdentifier_(v4, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_persistentIdentifier(self, v29, v30, v31);
  objc_msgSend_setPersistentIdentifier_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_publisherIdentifier(self, v35, v36, v37);
  objc_msgSend_setPublisherIdentifier_(v4, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_title(self, v41, v42, v43);
  objc_msgSend_setTitle_(v4, v45, (uint64_t)v44, v46);

  v50 = objc_msgSend_author(self, v47, v48, v49);
  objc_msgSend_setAuthor_(v4, v51, (uint64_t)v50, v52);

  uint64_t v56 = objc_msgSend_feedURL(self, v53, v54, v55);
  objc_msgSend_setFeedURL_(v4, v57, (uint64_t)v56, v58);

  v62 = objc_msgSend_fileURL(self, v59, v60, v61);
  objc_msgSend_setFileURL_(v4, v63, (uint64_t)v62, v64);

  uint64_t v68 = objc_msgSend_permlink(self, v65, v66, v67);
  objc_msgSend_setPermlink_(v4, v69, (uint64_t)v68, v70);

  uint64_t v74 = objc_msgSend_iTunesU(self, v71, v72, v73);
  objc_msgSend_setITunesU_(v4, v75, v74, v76);
  uint64_t isSample = objc_msgSend_isSample(self, v77, v78, v79);
  objc_msgSend_setSample_(v4, v81, isSample, v82);
  uint64_t v86 = objc_msgSend_type(self, v83, v84, v85);
  objc_msgSend_setType_(v4, v87, v86, v88);
  uint64_t v92 = objc_msgSend_publicationVersion(self, v89, v90, v91);
  objc_msgSend_setPublicationVersion_(v4, v93, (uint64_t)v92, v94);

  v98 = objc_msgSend_album(self, v95, v96, v97);
  objc_msgSend_setAlbum_(v4, v99, (uint64_t)v98, v100);

  uint64_t v104 = objc_msgSend_folderName(self, v101, v102, v103);
  objc_msgSend_setFolderName_(v4, v105, (uint64_t)v104, v106);

  uint64_t v110 = objc_msgSend_purgePriority(self, v107, v108, v109);
  objc_msgSend_setPurgePriority_(v4, v111, v110, v112);
  objc_super v116 = objc_msgSend_lastUserAccessDate(self, v113, v114, v115);
  objc_msgSend_setLastUserAccessDate_(v4, v117, (uint64_t)v116, v118);

  v122 = objc_msgSend_itunesuAssetID(self, v119, v120, v121);
  objc_msgSend_setItunesuAssetID_(v4, v123, (uint64_t)v122, v124);

  v128 = objc_msgSend_coverImagePath(self, v125, v126, v127);
  objc_msgSend_setCoverImagePath_(v4, v129, (uint64_t)v128, v130);

  v134 = objc_msgSend_entry(self, v131, v132, v133);
  objc_msgSend_setEntry_(v4, v135, (uint64_t)v134, v136);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_identifier(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"identifier");

  uint64_t v13 = objc_msgSend_temporaryIdentifier(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"temporaryIdentifier");

  uint64_t v18 = objc_msgSend_legacyUniqueIdentifier(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"legacyUniqueIdentifier");

  uint64_t v23 = objc_msgSend_storeIdentifier(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"storeIdentifier");

  uint64_t v28 = objc_msgSend_persistentIdentifier(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, @"persistentIdentifier");

  uint64_t v33 = objc_msgSend_publisherIdentifier(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"publisherIdentifier");

  v38 = objc_msgSend_title(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"title");

  uint64_t v43 = objc_msgSend_author(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, @"author");

  uint64_t v48 = objc_msgSend_feedURL(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, @"feedURL");

  uint64_t v53 = objc_msgSend_fileURL(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, @"fileURL");

  uint64_t v58 = objc_msgSend_permlink(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v4, v59, (uint64_t)v58, @"permlink");

  uint64_t v63 = objc_msgSend_iTunesU(self, v60, v61, v62);
  objc_msgSend_encodeBool_forKey_(v4, v64, v63, @"iTunesU");
  uint64_t isSample = objc_msgSend_isSample(self, v65, v66, v67);
  objc_msgSend_encodeBool_forKey_(v4, v69, isSample, @"sample");
  uint64_t v73 = objc_msgSend_type(self, v70, v71, v72);
  objc_msgSend_encodeInt_forKey_(v4, v74, v73, @"type");
  uint64_t v78 = objc_msgSend_publicationVersion(self, v75, v76, v77);
  objc_msgSend_encodeObject_forKey_(v4, v79, (uint64_t)v78, @"publicationVersion");

  uint64_t v83 = objc_msgSend_album(self, v80, v81, v82);
  objc_msgSend_encodeObject_forKey_(v4, v84, (uint64_t)v83, @"album");

  uint64_t v88 = objc_msgSend_folderName(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, @"folderName");

  uint64_t v93 = objc_msgSend_purgePriority(self, v90, v91, v92);
  objc_msgSend_encodeInt64_forKey_(v4, v94, v93, @"purgePriority");
  v98 = objc_msgSend_lastUserAccessDate(self, v95, v96, v97);
  objc_msgSend_encodeObject_forKey_(v4, v99, (uint64_t)v98, @"lastUserAccessDate");

  uint64_t v103 = objc_msgSend_itunesuAssetID(self, v100, v101, v102);
  objc_msgSend_encodeObject_forKey_(v4, v104, (uint64_t)v103, @"assetID");

  objc_msgSend_coverImagePath(self, v105, v106, v107);
  id v109 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v108, (uint64_t)v109, @"coverImagePath");
}

- (BLBookItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)BLBookItem;
  v5 = [(BLBookItem *)&v112 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"identifier");
    objc_msgSend_setIdentifier_(v5, v9, (uint64_t)v8, v10);

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"temporaryIdentifier");
    objc_msgSend_setTemporaryIdentifier_(v5, v14, (uint64_t)v13, v15);

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"legacyUniqueIdentifier");
    objc_msgSend_setLegacyUniqueIdentifier_(v5, v19, (uint64_t)v18, v20);

    uint64_t v21 = objc_opt_class();
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"storeIdentifier");
    objc_msgSend_setStoreIdentifier_(v5, v24, (uint64_t)v23, v25);

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"persistentIdentifier");
    objc_msgSend_setPersistentIdentifier_(v5, v29, (uint64_t)v28, v30);

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"publisherIdentifier");
    objc_msgSend_setPublisherIdentifier_(v5, v34, (uint64_t)v33, v35);

    uint64_t v36 = objc_opt_class();
    v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"title");
    objc_msgSend_setTitle_(v5, v39, (uint64_t)v38, v40);

    uint64_t v41 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"author");
    objc_msgSend_setAuthor_(v5, v44, (uint64_t)v43, v45);

    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"feedURL");
    objc_msgSend_setFeedURL_(v5, v49, (uint64_t)v48, v50);

    uint64_t v51 = objc_opt_class();
    uint64_t v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"fileURL");
    objc_msgSend_setFileURL_(v5, v54, (uint64_t)v53, v55);

    uint64_t v56 = objc_opt_class();
    uint64_t v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, @"permlink");
    objc_msgSend_setPermlink_(v5, v59, (uint64_t)v58, v60);

    uint64_t v63 = objc_msgSend_decodeBoolForKey_(v4, v61, @"iTunesU", v62);
    objc_msgSend_setITunesU_(v5, v64, v63, v65);
    uint64_t v68 = objc_msgSend_decodeBoolForKey_(v4, v66, @"sample", v67);
    objc_msgSend_setSample_(v5, v69, v68, v70);
    int v73 = objc_msgSend_decodeIntForKey_(v4, v71, @"type", v72);
    objc_msgSend_setType_(v5, v74, v73, v75);
    uint64_t v76 = objc_opt_class();
    uint64_t v78 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"publicationVersion");
    objc_msgSend_setPublicationVersion_(v5, v79, (uint64_t)v78, v80);

    uint64_t v81 = objc_opt_class();
    uint64_t v83 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, @"album");
    objc_msgSend_setAlbum_(v5, v84, (uint64_t)v83, v85);

    uint64_t v86 = objc_opt_class();
    uint64_t v88 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v87, v86, @"folderName");
    objc_msgSend_setFolderName_(v5, v89, (uint64_t)v88, v90);

    uint64_t v93 = objc_msgSend_decodeInt64ForKey_(v4, v91, @"purgePriority", v92);
    objc_msgSend_setPurgePriority_(v5, v94, v93, v95);
    uint64_t v96 = objc_opt_class();
    v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, @"lastUserAccessDate");
    objc_msgSend_setLastUserAccessDate_(v5, v99, (uint64_t)v98, v100);

    uint64_t v101 = objc_opt_class();
    uint64_t v103 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v102, v101, @"assetID");
    objc_msgSend_setItunesuAssetID_(v5, v104, (uint64_t)v103, v105);

    uint64_t v106 = objc_opt_class();
    uint64_t v108 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v107, v106, @"coverImagePath");
    objc_msgSend_setCoverImagePath_(v5, v109, (uint64_t)v108, v110);
  }
  return v5;
}

- (NSString)path
{
  id v4 = objc_msgSend_fileURL(self, a2, v2, v3);
  id v8 = objc_msgSend_path(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)identifier
{
  if (!self->_identifier)
  {
    v5 = objc_msgSend_entry(self, a2, v2, v3);

    if (v5)
    {
      uint64_t v9 = objc_msgSend_entry(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_fileURL(self, v10, v11, v12);
      uint64_t v17 = objc_msgSend_path(v13, v14, v15, v16);
      objc_msgSend_assetIDFromPlistEntry_forAssetAtPath_(IMLibraryPlist, v18, (uint64_t)v9, (uint64_t)v17);
      uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      self->_identifier = v19;
    }
  }
  uint64_t v21 = self->_identifier;

  return v21;
}

- (NSString)mimeType
{
  unint64_t v4 = objc_msgSend_type(self, a2, v2, v3);
  if (v4 > 2) {
    return 0;
  }
  else {
    return &off_26448C498[v4]->isa;
  }
}

- (id)_cloudCoverImageData
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_21E024D60;
  uint64_t v29 = sub_21E024D70;
  id v30 = 0;
  v5 = objc_msgSend_coverImagePath(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = NSURL;
    uint64_t v10 = objc_msgSend_coverImagePath(self, v6, v7, v8);
    v14 = objc_msgSend_fileURL(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_fileURLWithPath_relativeToURL_(v9, v15, (uint64_t)v10, (uint64_t)v14);

    uint64_t v17 = objc_opt_new();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_21E024D78;
    v23[3] = &unk_26448C428;
    v23[4] = &v25;
    id v24 = 0;
    objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v17, v18, (uint64_t)v16, 0, &v24, v23);
    id v19 = v24;

    if (v19)
    {
      uint64_t v20 = BLDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v19;
        _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "Encountered error retrieving cover image from promised item. Error:  %@", buf, 0xCu);
      }
    }
  }
  id v21 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v21;
}

- (void)_setCloudCoverImageData:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_permlink(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_identifierFromPermlink(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringByAppendingPathExtension_(v12, v13, @"coverData", v14);

  if (v15)
  {
    id v19 = NSURL;
    uint64_t v20 = objc_msgSend_fileURL(self, v16, v17, v18);
    uint64_t v22 = objc_msgSend_fileURLWithPath_relativeToURL_(v19, v21, (uint64_t)v15, (uint64_t)v20);
  }
  else
  {
    uint64_t v22 = 0;
  }
  objc_msgSend_setCoverImagePath_(self, v16, (uint64_t)v15, v18);
  if (v4)
  {
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = sub_21E0252F8;
    v76[3] = &unk_26448C450;
    id v77 = v4;
    id v23 = v22;
    id v78 = v23;
    id v24 = (unsigned int (**)(void, void))MEMORY[0x223C1EDC0](v76);
    uint64_t v64 = 0;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x2020000000;
    LOBYTE(v67) = 0;
    uint64_t v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v25, v26, v27);
    int isUbiquitousItemAtURL = objc_msgSend_isUbiquitousItemAtURL_(v28, v29, (uint64_t)v23, v30);

    if (isUbiquitousItemAtURL)
    {
      id v32 = objc_opt_new();
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = sub_21E025340;
      v71[3] = &unk_26448C478;
      uint64_t v74 = &v64;
      id v75 = 0;
      int v73 = v24;
      id v72 = v23;
      objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v32, v33, (uint64_t)v72, 0, &v75, v71);
      id v34 = v75;

      uint64_t v35 = v73;
    }
    else
    {
      uint64_t v48 = NSTemporaryDirectory();
      uint64_t v35 = objc_msgSend_stringByAppendingPathComponent_(v48, v49, (uint64_t)v15, v50);

      uint64_t v54 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v51, v52, v53);
      objc_msgSend_removeItemAtPath_error_(v54, v55, (uint64_t)v35, 0);
      if (((unsigned int (**)(void, void *))v24)[2](v24, v35))
      {
        uint64_t v58 = objc_msgSend_fileURLWithPath_(NSURL, v56, (uint64_t)v35, v57);
        id v70 = 0;
        char v60 = objc_msgSend_setUbiquitous_itemAtURL_destinationURL_error_(v54, v59, 1, (uint64_t)v58, v23, &v70);
        id v34 = v70;
        *((unsigned char *)v65 + 24) = v60;
      }
      else
      {
        id v34 = 0;
      }
    }
    if (!*((unsigned char *)v65 + 24))
    {
      uint64_t v61 = BLDefaultLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v80 = v23;
        __int16 v81 = 2112;
        id v82 = v34;
        _os_log_impl(&dword_21DFE3000, v61, OS_LOG_TYPE_ERROR, "Failed to coordinate write of thumbnail resource value for %@. Error:  %@", buf, 0x16u);
      }
    }
    _Block_object_dispose(&v64, 8);
  }
  else
  {
    uint64_t v64 = 0;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x3032000000;
    uint64_t v67 = sub_21E024D60;
    uint64_t v68 = sub_21E024D70;
    id v69 = 0;
    id v36 = objc_alloc(MEMORY[0x263F08830]);
    uint64_t v39 = objc_msgSend_initWithFilePresenter_(v36, v37, 0, v38);
    uint64_t v41 = (id *)(v65 + 5);
    uint64_t v40 = (void *)v65[5];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = sub_21E0253AC;
    v62[3] = &unk_26448C428;
    v62[4] = &v64;
    id obj = v40;
    objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v39, v42, (uint64_t)v22, 1, &obj, v62);
    objc_storeStrong(v41, obj);
    if (v65[5])
    {
      uint64_t v43 = BLDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = objc_msgSend_path(v22, v44, v45, v46);
        *(_DWORD *)buf = 138412290;
        id v80 = v47;
        _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_ERROR, "Error encountered removing cover image at %@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v64, 8);
  }
}

- (void)_setFileURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_isFileURL(v4, v5, v6, v7))
  {
    objc_msgSend_setFileURL_(self, v8, (uint64_t)v4, v9);
  }
  else
  {
    uint64_t v10 = BLDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "Invalid fileURL in setFileURL:%@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_cloudDictionaryRepresentation
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_identifier(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"identifier");

  id v12 = objc_msgSend_temporaryIdentifier(self, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, @"temporaryIdentifier");

  uint64_t v17 = objc_msgSend_title(self, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"title");

  uint64_t v22 = objc_msgSend_author(self, v19, v20, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, @"author");

  uint64_t v27 = objc_msgSend_permlink(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_absoluteString(v27, v28, v29, v30);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v31, @"permlink");

  unint64_t v36 = objc_msgSend_type(self, v33, v34, v35);
  if (v36 > 2) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v37, (uint64_t)&stru_26CED4330, @"type");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v37, (uint64_t)off_26448C4B0[v36], @"type");
  }
  uint64_t v41 = objc_msgSend_itunesuAssetID(self, v38, v39, v40);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v42, (uint64_t)v41, @"assetID");

  uint64_t v46 = objc_msgSend_coverImagePath(self, v43, v44, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, @"coverImagePath");

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@(%p)", v7, v5, self);

  id v12 = objc_msgSend_identifier(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringByAppendingFormat_(v8, v13, @" identifier='%@'", v14, v12);

  id v19 = objc_msgSend_temporaryIdentifier(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);

  if (v23)
  {
    uint64_t v27 = objc_msgSend_temporaryIdentifier(self, v24, v25, v26);
    uint64_t v30 = objc_msgSend_stringByAppendingFormat_(v15, v28, @" temporaryIdentifier='%@'", v29, v27);

    uint64_t v15 = (void *)v30;
  }
  uint64_t v31 = objc_msgSend_legacyUniqueIdentifier(self, v24, v25, v26);
  uint64_t v35 = objc_msgSend_length(v31, v32, v33, v34);

  if (v35)
  {
    uint64_t v39 = objc_msgSend_legacyUniqueIdentifier(self, v36, v37, v38);
    uint64_t v42 = objc_msgSend_stringByAppendingFormat_(v15, v40, @" legacyUniqueIdentifier='%@'", v41, v39);

    uint64_t v15 = (void *)v42;
  }
  uint64_t v43 = objc_msgSend_storeIdentifier(self, v36, v37, v38);
  uint64_t v47 = objc_msgSend_length(v43, v44, v45, v46);

  if (v47)
  {
    uint64_t v51 = objc_msgSend_storeIdentifier(self, v48, v49, v50);
    uint64_t v54 = objc_msgSend_stringByAppendingFormat_(v15, v52, @" storeIdentifier='%@'", v53, v51);

    uint64_t v15 = (void *)v54;
  }
  uint64_t v55 = objc_msgSend_persistentIdentifier(self, v48, v49, v50);
  uint64_t v59 = objc_msgSend_length(v55, v56, v57, v58);

  if (v59)
  {
    uint64_t v63 = objc_msgSend_persistentIdentifier(self, v60, v61, v62);
    uint64_t v66 = objc_msgSend_stringByAppendingFormat_(v15, v64, @" persistentIdentifier='%@'", v65, v63);

    uint64_t v15 = (void *)v66;
  }
  uint64_t v67 = objc_msgSend_publisherIdentifier(self, v60, v61, v62);
  uint64_t v71 = objc_msgSend_length(v67, v68, v69, v70);

  if (v71)
  {
    id v75 = objc_msgSend_publisherIdentifier(self, v72, v73, v74);
    uint64_t v78 = objc_msgSend_stringByAppendingFormat_(v15, v76, @" publisherIdentifier='%@'", v77, v75);

    uint64_t v15 = (void *)v78;
  }
  uint64_t v79 = objc_msgSend_title(self, v72, v73, v74);
  uint64_t v83 = objc_msgSend_length(v79, v80, v81, v82);

  if (v83)
  {
    uint64_t v87 = objc_msgSend_title(self, v84, v85, v86);
    uint64_t v90 = objc_msgSend_stringByAppendingFormat_(v15, v88, @" title='%@'", v89, v87);

    uint64_t v15 = (void *)v90;
  }
  uint64_t v91 = objc_msgSend_author(self, v84, v85, v86);
  uint64_t v95 = objc_msgSend_length(v91, v92, v93, v94);

  if (v95)
  {
    uint64_t v99 = objc_msgSend_author(self, v96, v97, v98);
    uint64_t v102 = objc_msgSend_stringByAppendingFormat_(v15, v100, @" author='%@'", v101, v99);

    uint64_t v15 = (void *)v102;
  }
  uint64_t v103 = objc_msgSend_feedURL(self, v96, v97, v98);

  if (v103)
  {
    uint64_t v107 = objc_msgSend_feedURL(self, v104, v105, v106);
    uint64_t v110 = objc_msgSend_stringByAppendingFormat_(v15, v108, @" feedURL='%@'", v109, v107);

    uint64_t v15 = (void *)v110;
  }
  v111 = objc_msgSend_publicationVersion(self, v104, v105, v106);
  uint64_t v115 = objc_msgSend_length(v111, v112, v113, v114);

  if (v115)
  {
    v119 = objc_msgSend_publicationVersion(self, v116, v117, v118);
    uint64_t v122 = objc_msgSend_stringByAppendingFormat_(v15, v120, @" publicationVersion='%@'", v121, v119);

    uint64_t v15 = (void *)v122;
  }
  v123 = objc_msgSend_album(self, v116, v117, v118);
  uint64_t v127 = objc_msgSend_length(v123, v124, v125, v126);

  if (v127)
  {
    v131 = objc_msgSend_album(self, v128, v129, v130);
    uint64_t v134 = objc_msgSend_stringByAppendingFormat_(v15, v132, @" album='%@'", v133, v131);

    uint64_t v15 = (void *)v134;
  }
  v135 = objc_msgSend_folderName(self, v128, v129, v130);
  uint64_t v139 = objc_msgSend_length(v135, v136, v137, v138);

  if (v139)
  {
    v143 = objc_msgSend_folderName(self, v140, v141, v142);
    uint64_t v146 = objc_msgSend_stringByAppendingFormat_(v15, v144, @" folderName='%@'", v145, v143);

    uint64_t v15 = (void *)v146;
  }
  v147 = objc_msgSend_mimeType(self, v140, v141, v142);
  uint64_t v151 = objc_msgSend_length(v147, v148, v149, v150);

  if (v151)
  {
    v155 = objc_msgSend_mimeType(self, v152, v153, v154);
    uint64_t v158 = objc_msgSend_stringByAppendingFormat_(v15, v156, @" mimeType='%@'", v157, v155);

    uint64_t v15 = (void *)v158;
  }
  v159 = objc_msgSend_itunesuAssetID(self, v152, v153, v154);
  uint64_t v163 = objc_msgSend_length(v159, v160, v161, v162);

  if (v163)
  {
    v167 = objc_msgSend_itunesuAssetID(self, v164, v165, v166);
    uint64_t v170 = objc_msgSend_stringByAppendingFormat_(v15, v168, @" itunesuAssetID='%@'", v169, v167);

    uint64_t v15 = (void *)v170;
  }
  unint64_t v171 = objc_msgSend_type(self, v164, v165, v166);
  if (v171 > 2) {
    objc_msgSend_stringByAppendingFormat_(v15, v172, @" type='%@'", v173, &stru_26CED4330);
  }
  else {
  v174 = objc_msgSend_stringByAppendingFormat_(v15, v172, @" type='%@'", v173, off_26448C4B0[v171]);
  }

  if (objc_msgSend_isSample(self, v175, v176, v177)) {
    objc_msgSend_stringByAppendingFormat_(v174, v178, @" isSample='%@'", v179, @"YES");
  }
  else {
  v180 = objc_msgSend_stringByAppendingFormat_(v174, v178, @" isSample='%@'", v179, @"NO");
  }

  if (objc_msgSend_iTunesU(self, v181, v182, v183)) {
    objc_msgSend_stringByAppendingFormat_(v180, v184, @" iTunesU='%@'", v185, @"YES");
  }
  else {
  v186 = objc_msgSend_stringByAppendingFormat_(v180, v184, @" iTunesU='%@'", v185, @"NO");
  }

  v190 = objc_msgSend_permlink(self, v187, v188, v189);

  if (v190)
  {
    v194 = objc_msgSend_permlink(self, v191, v192, v193);
    uint64_t v197 = objc_msgSend_stringByAppendingFormat_(v186, v195, @" permlink='%@'", v196, v194);

    v186 = (void *)v197;
  }
  v198 = objc_msgSend_fileURL(self, v191, v192, v193);

  if (v198)
  {
    v202 = objc_msgSend_fileURL(self, v199, v200, v201);
    v206 = objc_msgSend_path(v202, v203, v204, v205);
    uint64_t v209 = objc_msgSend_stringByAppendingFormat_(v186, v207, @" path='%@'", v208, v206);

    v186 = (void *)v209;
  }
  v210 = NSNumber;
  uint64_t v211 = objc_msgSend_purgePriority(self, v199, v200, v201);
  v214 = objc_msgSend_numberWithInteger_(v210, v212, v211, v213);
  v217 = objc_msgSend_stringByAppendingFormat_(v186, v215, @" purgePriority='%@'", v216, v214);

  v221 = objc_msgSend_lastUserAccessDate(self, v218, v219, v220);

  if (v221)
  {
    v225 = objc_msgSend_lastUserAccessDate(self, v222, v223, v224);
    uint64_t v228 = objc_msgSend_stringByAppendingFormat_(v217, v226, @" accessDate='%@'", v227, v225);

    v217 = (void *)v228;
  }
  v229 = objc_msgSend_stringByAppendingString_(v217, v222, @">", v224);

  return v229;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)temporaryIdentifier
{
  return self->_temporaryIdentifier;
}

- (void)setTemporaryIdentifier:(id)a3
{
}

- (NSString)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (void)setLegacyUniqueIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (NSString)publisherIdentifier
{
  return self->_publisherIdentifier;
}

- (void)setPublisherIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void)setFeedURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
}

- (BOOL)isSample
{
  return self->_sample;
}

- (void)setSample:(BOOL)a3
{
  self->_sample = a3;
}

- (BOOL)iTunesU
{
  return self->_iTunesU;
}

- (void)setITunesU:(BOOL)a3
{
  self->_iTunesU = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)publicationVersion
{
  return self->_publicationVersion;
}

- (void)setPublicationVersion:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
}

- (NSDictionary)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (int64_t)purgePriority
{
  return self->_purgePriority;
}

- (void)setPurgePriority:(int64_t)a3
{
  self->_purgePriority = a3;
}

- (NSDate)lastUserAccessDate
{
  return self->_lastUserAccessDate;
}

- (void)setLastUserAccessDate:(id)a3
{
}

- (NSString)itunesuAssetID
{
  return self->_itunesuAssetID;
}

- (void)setItunesuAssetID:(id)a3
{
}

- (NSString)coverImagePath
{
  return self->_coverImagePath;
}

- (void)setCoverImagePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverImagePath, 0);
  objc_storeStrong((id *)&self->_itunesuAssetID, 0);
  objc_storeStrong((id *)&self->_lastUserAccessDate, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_publicationVersion, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_legacyUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_temporaryIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end