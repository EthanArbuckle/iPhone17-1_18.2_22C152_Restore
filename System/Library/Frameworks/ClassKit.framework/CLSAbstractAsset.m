@interface CLSAbstractAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)devModeOn;
- (BOOL)hasNotBeenRereferencedByServer;
- (BOOL)isDownloaded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOriginal;
- (BOOL)isValidFileURL:(id)a3 isThumbnail:(BOOL)a4;
- (BOOL)isValidStreamingURL:(id)a3;
- (BOOL)validateObject:(id *)a3;
- (CLSAbstractAsset)initWithCoder:(id)a3;
- (Class)parentEntityClass;
- (NSDate)urlExpirationDate;
- (NSError)downloadError;
- (NSString)brItemID;
- (NSString)brOwnerName;
- (NSString)brShareName;
- (NSString)brZoneName;
- (NSString)filenameExtension;
- (NSString)originalFilename;
- (NSString)ownerPersonID;
- (NSString)relativePathWithinContainer;
- (NSString)title;
- (NSString)ubiquitousContainerName;
- (NSURL)URL;
- (NSURL)thumbnailURL;
- (UTType)fileUTType;
- (double)durationInSeconds;
- (double)fractionDownloaded;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downloadObservers;
- (id)filenameForCKContentStoreCache;
- (id)pendingStreamingURLCompletions;
- (id)pendingThumbnailURLCompletions;
- (id)pendingURLCompletions;
- (id)thumbnailFilenameForCKContentStoreCache;
- (int64_t)displayOrder;
- (int64_t)fileSizeInBytes;
- (int64_t)parentEntityType;
- (int64_t)schoolworkSyncStatus;
- (int64_t)type;
- (void)addDownloadObserver:(id)a3;
- (void)addToPendingStreamingURLCompletions:(id)a3;
- (void)addToPendingThumbnailURLCompletions:(id)a3;
- (void)addToPendingURLCompletions:(id)a3;
- (void)becomeChildOf:(id)a3;
- (void)clientRemote_downloadCompleted:(BOOL)a3 error:(id)a4;
- (void)clientRemote_downloadProgressFraction:(double)a3 error:(id)a4;
- (void)clientRemote_invalidate;
- (void)cloudKitAssetUrlSuitableForOpeningWithCompletion:(id)a3;
- (void)cloudKitThumbnailUrlSuitableForOpeningWithCompletion:(id)a3;
- (void)dealloc;
- (void)driveAssetUrlSuitableForOpeningWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)queued_notifyDownloadCompletion;
- (void)queued_notifyDownloadProgressFraction:(double)a3;
- (void)removeDownloadObserver:(id)a3;
- (void)setBrItemID:(id)a3;
- (void)setBrOwnerName:(id)a3;
- (void)setBrShareName:(id)a3;
- (void)setBrZoneName:(id)a3;
- (void)setDisplayOrder:(int64_t)a3;
- (void)setDownloadError:(id)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setFileSizeInBytes:(int64_t)a3;
- (void)setFileSizeInBytesFromURL:(id)a3;
- (void)setFileUTType:(id)a3;
- (void)setFileUTTypeFromURL:(id)a3;
- (void)setFilenameExtension:(id)a3;
- (void)setFractionDownloaded:(double)a3;
- (void)setOriginal:(BOOL)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setOwnerPersonID:(id)a3;
- (void)setParentEntityType:(int64_t)a3;
- (void)setRelativePathWithinContainer:(id)a3;
- (void)setSchoolworkSyncStatus:(int64_t)a3;
- (void)setThumbnailURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setURL:(id)a3;
- (void)setUbiquitousContainerName:(id)a3;
- (void)setUrlExpirationDate:(id)a3;
- (void)thumbnailURLSuitableForOpeningWithCompletion:(id)a3;
- (void)urlSuitableForOpeningWithCompletion:(id)a3;
- (void)urlSuitableForStreamingWithCompletion:(id)a3;
@end

@implementation CLSAbstractAsset

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)CLSAbstractAsset;
  v2 = [(CLSObject *)&v13 _init];
  v3 = v2;
  if (v2)
  {
    atomic_store(0, v2 + 280);
    atomic_store(0, v2 + 281);
    atomic_store(0, v2 + 282);
    uint64_t v4 = objc_opt_new();
    v5 = (void *)*((void *)v3 + 19);
    *((void *)v3 + 19) = v4;

    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v3 + 36);
    *((void *)v3 + 36) = v6;

    uint64_t v8 = objc_opt_new();
    v9 = (void *)*((void *)v3 + 37);
    *((void *)v3 + 37) = v8;

    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v3 + 38);
    *((void *)v3 + 38) = v10;
  }
  return v3;
}

- (void)dealloc
{
  URL = self->_URL;
  if (URL && self->_URLIsSecurityScoped) {
    objc_msgSend_stopAccessingSecurityScopedResource(URL, a2, v2);
  }
  v5.receiver = self;
  v5.super_class = (Class)CLSAbstractAsset;
  [(CLSAbstractAsset *)&v5 dealloc];
}

- (CLSAbstractAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CLSAbstractAsset;
  objc_super v5 = [(CLSObject *)&v86 initWithCoder:v4];
  v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v6, @"type");
  uint64_t v7 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"url");
  URL = v5->_URL;
  v5->_URL = (NSURL *)v9;

  uint64_t v11 = objc_opt_class();
  uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"urlExpirationDate");
  urlExpirationDate = v5->_urlExpirationDate;
  v5->_urlExpirationDate = (NSDate *)v13;

  uint64_t v15 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"url_sb");
  if (v18)
  {
    objc_msgSend_attachSandboxExtensionToken_(v5->_URL, v17, (uint64_t)v18);
    if ((CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0() & 1) == 0) {
      v5->_URLIsSecurityScoped = objc_msgSend_startAccessingSecurityScopedResource(v5->_URL, v19, v20);
    }
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"thumbnailURL");
  thumbnailURL = v5->_thumbnailURL;
  v5->_thumbnailURL = (NSURL *)v23;

  uint64_t v25 = objc_opt_class();
  v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"thumbnailURL_sb");
  if (v28) {
    objc_msgSend_attachSandboxExtensionToken_(v5->_thumbnailURL, v27, (uint64_t)v28);
  }
  v5->_original = objc_msgSend_decodeBoolForKey_(v4, v27, @"original");
  v5->_schoolworkSyncStatus = objc_msgSend_decodeIntegerForKey_(v4, v29, @"schoolworkSyncStatus");
  v5->_fileSizeInBytes = objc_msgSend_decodeIntegerForKey_(v4, v30, @"fileSizeInBytes");
  uint64_t v31 = objc_opt_class();
  v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"fileUTTypeIdentifier");
  if (v34)
  {
    uint64_t v35 = objc_msgSend_typeWithIdentifier_(MEMORY[0x1E4F442D8], v33, (uint64_t)v34);
    fileUTType = v5->_fileUTType;
    v5->_fileUTType = (UTType *)v35;
  }
  uint64_t v37 = objc_opt_class();
  uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"originalFilename");
  originalFilename = v5->_originalFilename;
  v5->_originalFilename = (NSString *)v39;

  uint64_t v41 = objc_opt_class();
  uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"title");
  title = v5->_title;
  v5->_title = (NSString *)v43;

  v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v45, @"displayOrder");
  uint64_t v46 = objc_opt_class();
  uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"ownerPersonID");
  ownerPersonID = v5->_ownerPersonID;
  v5->_ownerPersonID = (NSString *)v48;

  objc_msgSend_decodeDoubleForKey_(v4, v50, @"durationInSeconds");
  v5->_durationInSeconds = v51;
  v5->_parentEntityType = objc_msgSend_decodeIntegerForKey_(v4, v52, @"parentEntityType");
  uint64_t v53 = objc_opt_class();
  uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v54, v53, @"brItemID");
  brItemID = v5->_brItemID;
  v5->_brItemID = (NSString *)v55;

  uint64_t v57 = objc_opt_class();
  uint64_t v59 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, @"brOwnerName");
  brOwnerName = v5->_brOwnerName;
  v5->_brOwnerName = (NSString *)v59;

  uint64_t v61 = objc_opt_class();
  uint64_t v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"brZoneName");
  brZoneName = v5->_brZoneName;
  v5->_brZoneName = (NSString *)v63;

  uint64_t v65 = objc_opt_class();
  uint64_t v67 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, @"brShareName");
  brShareName = v5->_brShareName;
  v5->_brShareName = (NSString *)v67;

  uint64_t v69 = objc_opt_class();
  uint64_t v71 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v70, v69, @"ubiquitousContainerName");
  ubiquitousContainerName = v5->_ubiquitousContainerName;
  v5->_ubiquitousContainerName = (NSString *)v71;

  uint64_t v73 = objc_opt_class();
  uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, @"relativePathWithinContainer");
  relativePathWithinContainer = v5->_relativePathWithinContainer;
  v5->_relativePathWithinContainer = (NSString *)v75;

  if (v5->_ubiquitousContainerName)
  {
    if (!v5->_type) {
      v5->_type = 1;
    }
    if (!v5->_parentEntityType) {
      v5->_parentEntityType = 2;
    }
  }
  atomic_store(0, (unsigned __int8 *)&v5->_thumbnailURLRequested);
  atomic_store(0, (unsigned __int8 *)&v5->_URLRequested);
  atomic_store(0, (unsigned __int8 *)&v5->_streamingURLRequested);
  uint64_t v77 = objc_opt_new();
  downloadObservers = v5->_downloadObservers;
  v5->_downloadObservers = (NSMutableArray *)v77;

  uint64_t v79 = objc_opt_new();
  pendingURLCompletions = v5->_pendingURLCompletions;
  v5->_pendingURLCompletions = (NSMutableArray *)v79;

  uint64_t v81 = objc_opt_new();
  pendingStreamingURLCompletions = v5->_pendingStreamingURLCompletions;
  v5->_pendingStreamingURLCompletions = (NSMutableArray *)v81;

  uint64_t v83 = objc_opt_new();
  pendingThumbnailURLCompletions = v5->_pendingThumbnailURLCompletions;
  v5->_pendingThumbnailURLCompletions = (NSMutableArray *)v83;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CLSAbstractAsset;
  [(CLSObject *)&v39 encodeWithCoder:v4];
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, @"type");
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_urlExpirationDate, @"urlExpirationDate");
  URL = self->_URL;
  if (URL)
  {
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)URL, @"url");
    v12 = objc_msgSend_sandboxExtensionTokenForAnyProcess(self->_URL, v9, v10);
    if (v12) {
      objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v12, @"url_sb");
    }
  }
  thumbnailURL = self->_thumbnailURL;
  if (thumbnailURL)
  {
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)thumbnailURL, @"thumbnailURL");
    v17 = objc_msgSend_sandboxExtensionTokenForAnyProcess(self->_thumbnailURL, v14, v15);
    if (v17) {
      objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v17, @"thumbnailURL_sb");
    }
  }
  objc_msgSend_encodeBool_forKey_(v4, v7, self->_original, @"original");
  objc_msgSend_encodeInteger_forKey_(v4, v18, self->_schoolworkSyncStatus, @"schoolworkSyncStatus");
  objc_msgSend_encodeInteger_forKey_(v4, v19, self->_fileSizeInBytes, @"fileSizeInBytes");
  v22 = objc_msgSend_fileUTType(self, v20, v21);
  uint64_t v25 = v22;
  if (v22)
  {
    v27 = objc_msgSend_identifier(v22, v23, v24);
    if (v27) {
      objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v27, @"fileUTTypeIdentifier");
    }
  }
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_originalFilename, @"originalFilename");
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)self->_title, @"title");
  objc_msgSend_encodeInteger_forKey_(v4, v29, self->_displayOrder, @"displayOrder");
  objc_msgSend_encodeDouble_forKey_(v4, v30, @"durationInSeconds", self->_durationInSeconds);
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)self->_ownerPersonID, @"ownerPersonID");
  objc_msgSend_encodeInteger_forKey_(v4, v32, self->_parentEntityType, @"parentEntityType");
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)self->_brItemID, @"brItemID");
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)self->_brZoneName, @"brZoneName");
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)self->_brOwnerName, @"brOwnerName");
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)self->_brShareName, @"brShareName");
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)self->_ubiquitousContainerName, @"ubiquitousContainerName");
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)self->_relativePathWithinContainer, @"relativePathWithinContainer");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend__init(v7, v8, v9);
  objc_msgSend_lock(self, v11, v12);
  URL = self->_URL;
  v14 = self->_thumbnailURL;
  uint64_t v15 = URL;
  objc_msgSend_unlock(self, v16, v17);
  uint64_t v20 = objc_msgSend_objectID(self, v18, v19);
  uint64_t v23 = objc_msgSend_copy(v20, v21, v22);
  objc_msgSend_setObjectID_(v10, v24, (uint64_t)v23);

  v27 = objc_msgSend_dateCreated(self, v25, v26);
  v30 = objc_msgSend_copy(v27, v28, v29);
  objc_msgSend_setDateCreated_(v10, v31, (uint64_t)v30);

  v34 = objc_msgSend_dateLastModified(self, v32, v33);
  uint64_t v37 = objc_msgSend_copy(v34, v35, v36);
  objc_msgSend_setDateLastModified_(v10, v38, (uint64_t)v37);

  uint64_t v41 = objc_msgSend_parentObjectID(self, v39, v40);
  v44 = objc_msgSend_copy(v41, v42, v43);
  objc_msgSend_setParentObjectID_(v10, v45, (uint64_t)v44);

  uint64_t v48 = objc_msgSend_type(self, v46, v47);
  objc_msgSend_setType_(v10, v49, v48);
  v52 = objc_msgSend_copy(v15, v50, v51);
  objc_msgSend_setURL_(v10, v53, (uint64_t)v52);

  v56 = objc_msgSend_urlExpirationDate(self, v54, v55);
  uint64_t v59 = objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setUrlExpirationDate_(v10, v60, (uint64_t)v59);

  uint64_t v63 = objc_msgSend_copy(v14, v61, v62);
  objc_msgSend_setThumbnailURL_(v10, v64, (uint64_t)v63);

  uint64_t isOriginal = objc_msgSend_isOriginal(self, v65, v66);
  objc_msgSend_setOriginal_(v10, v68, isOriginal);
  uint64_t v71 = objc_msgSend_originalFilename(self, v69, v70);
  v74 = objc_msgSend_copy(v71, v72, v73);
  objc_msgSend_setOriginalFilename_(v10, v75, (uint64_t)v74);

  uint64_t v78 = objc_msgSend_schoolworkSyncStatus(self, v76, v77);
  objc_msgSend_setSchoolworkSyncStatus_(v10, v79, v78);
  uint64_t v82 = objc_msgSend_fileSizeInBytes(self, v80, v81);
  objc_msgSend_setFileSizeInBytes_(v10, v83, v82);
  objc_super v86 = objc_msgSend_filenameExtension(self, v84, v85);
  v89 = objc_msgSend_copy(v86, v87, v88);
  objc_msgSend_setFilenameExtension_(v10, v90, (uint64_t)v89);

  v93 = objc_msgSend_fileUTType(self, v91, v92);
  v96 = objc_msgSend_copy(v93, v94, v95);
  objc_msgSend_setFileUTType_(v10, v97, (uint64_t)v96);

  v100 = objc_msgSend_title(self, v98, v99);
  v103 = objc_msgSend_copy(v100, v101, v102);
  objc_msgSend_setTitle_(v10, v104, (uint64_t)v103);

  uint64_t v107 = objc_msgSend_displayOrder(self, v105, v106);
  objc_msgSend_setDisplayOrder_(v10, v108, v107);
  objc_msgSend_durationInSeconds(self, v109, v110);
  objc_msgSend_setDurationInSeconds_(v10, v111, v112);
  v115 = objc_msgSend_ownerPersonID(self, v113, v114);
  v118 = objc_msgSend_copy(v115, v116, v117);
  objc_msgSend_setOwnerPersonID_(v10, v119, (uint64_t)v118);

  uint64_t v122 = objc_msgSend_parentEntityType(self, v120, v121);
  objc_msgSend_setParentEntityType_(v10, v123, v122);
  v126 = objc_msgSend_brItemID(self, v124, v125);
  v129 = objc_msgSend_copy(v126, v127, v128);
  objc_msgSend_setBrItemID_(v10, v130, (uint64_t)v129);

  v133 = objc_msgSend_brOwnerName(self, v131, v132);
  v136 = objc_msgSend_copy(v133, v134, v135);
  objc_msgSend_setBrOwnerName_(v10, v137, (uint64_t)v136);

  v140 = objc_msgSend_brZoneName(self, v138, v139);
  v143 = objc_msgSend_copy(v140, v141, v142);
  objc_msgSend_setBrZoneName_(v10, v144, (uint64_t)v143);

  v147 = objc_msgSend_brShareName(self, v145, v146);
  v150 = objc_msgSend_copy(v147, v148, v149);
  objc_msgSend_setBrShareName_(v10, v151, (uint64_t)v150);

  v154 = objc_msgSend_ubiquitousContainerName(self, v152, v153);
  v157 = objc_msgSend_copy(v154, v155, v156);
  objc_msgSend_setUbiquitousContainerName_(v10, v158, (uint64_t)v157);

  v161 = objc_msgSend_relativePathWithinContainer(self, v159, v160);
  v164 = objc_msgSend_copy(v161, v162, v163);
  objc_msgSend_setRelativePathWithinContainer_(v10, v165, (uint64_t)v164);

  uint64_t isDownloaded = objc_msgSend_isDownloaded(self, v166, v167);
  objc_msgSend_setDownloaded_(v10, v169, isDownloaded);
  objc_msgSend_fractionDownloaded(self, v170, v171);
  objc_msgSend_setFractionDownloaded_(v10, v172, v173);
  v176 = objc_msgSend_downloadError(self, v174, v175);
  v179 = objc_msgSend_copy(v176, v177, v178);
  objc_msgSend_setDownloadError_(v10, v180, (uint64_t)v179);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char isEqual = 0;
    goto LABEL_182;
  }
  objc_super v5 = (id *)v4;
  objc_msgSend_lock(self, v6, v7);
  unint64_t v8 = self->_URL;
  uint64_t isOriginal = 120;
  unint64_t v10 = self->_thumbnailURL;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_lock(v5, v13, v14);
  unint64_t v15 = (unint64_t)v5[14];
  unint64_t v16 = (unint64_t)v5[15];
  objc_msgSend_unlock(v5, v17, v18);
  uint64_t v23 = objc_msgSend_objectID(self, v19, v20);
  v412 = (void *)v10;
  v413 = (void *)v8;
  v410 = (void *)v16;
  v411 = (void *)v15;
  if (!v23)
  {
    v351 = objc_msgSend_objectID(v5, v21, v22);
    if (!v351)
    {
      v351 = 0;
      uint64_t isOriginal = 0;
      goto LABEL_12;
    }
  }
  uint64_t v24 = objc_msgSend_objectID(self, v21, v22);
  if (!v24)
  {
    v354 = 0;
    uint64_t v396 = 0;
    uint64_t v417 = 0;
    BOOL v409 = 0;
    int v422 = 0;
    int v393 = 0;
    int v389 = 0;
    BOOL v421 = 0;
    int v392 = 0;
    BOOL v408 = 0;
    int v420 = 0;
    int v387 = 0;
    int v383 = 0;
    BOOL v419 = 0;
    int v386 = 0;
    BOOL v407 = 0;
    int v418 = 0;
    int v382 = 0;
    int v380 = 0;
    int v35 = 0;
    BOOL v406 = 0;
    int v36 = 0;
    int v379 = 0;
    int v381 = 0;
    BOOL v405 = 0;
    int v416 = 0;
    int v375 = 0;
    int v373 = 0;
    int v376 = 0;
    BOOL v404 = 0;
    int v415 = 0;
    int v364 = 0;
    int v355 = 0;
    int v374 = 0;
    BOOL v403 = 0;
    int v414 = 0;
    int v363 = 0;
    int v356 = 0;
    int v371 = 0;
    BOOL v402 = 0;
    int v400 = 0;
    uint64_t v361 = 0;
    int v368 = 0;
    BOOL v401 = 0;
    int v398 = 0;
    int v357 = 0;
    int v359 = 0;
    int v365 = 0;
    BOOL v399 = 0;
    int v394 = 0;
    int v358 = 0;
    int v360 = 0;
    int v367 = 0;
    BOOL v397 = 0;
    int v390 = 0;
    int v362 = 0;
    int v366 = 0;
    int v370 = 0;
    BOOL v395 = 0;
    int v388 = 0;
    int v369 = 0;
    int v372 = 0;
    uint64_t v378 = 0;
    BOOL v391 = 0;
    int v384 = 0;
    int v377 = 0;
    int v37 = 0;
    BOOL v385 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    char isEqual = 0;
    unsigned int v423 = 1;
    goto LABEL_29;
  }
  v354 = (void *)v24;
  uint64_t v27 = objc_msgSend_objectID(v5, v25, v26);
  if (!v27)
  {
    v353 = 0;
    uint64_t v396 = 0x100000000;
    uint64_t v417 = 0;
    BOOL v409 = 0;
    int v422 = 0;
    int v393 = 0;
    int v389 = 0;
    BOOL v421 = 0;
    int v392 = 0;
    BOOL v408 = 0;
    int v420 = 0;
    int v387 = 0;
    int v383 = 0;
    BOOL v419 = 0;
    int v386 = 0;
    BOOL v407 = 0;
    int v418 = 0;
    int v382 = 0;
    int v380 = 0;
    int v35 = 0;
    BOOL v406 = 0;
    int v36 = 0;
    int v379 = 0;
    int v381 = 0;
    BOOL v405 = 0;
    int v416 = 0;
    int v375 = 0;
    int v373 = 0;
    int v376 = 0;
    BOOL v404 = 0;
    int v415 = 0;
    int v364 = 0;
    int v355 = 0;
    int v374 = 0;
    BOOL v403 = 0;
    int v414 = 0;
    int v363 = 0;
    int v356 = 0;
    int v371 = 0;
    BOOL v402 = 0;
    int v400 = 0;
    uint64_t v361 = 0;
    int v368 = 0;
    BOOL v401 = 0;
    int v398 = 0;
    int v357 = 0;
    int v359 = 0;
    int v365 = 0;
    BOOL v399 = 0;
    int v394 = 0;
    int v358 = 0;
    int v360 = 0;
    int v367 = 0;
    BOOL v397 = 0;
    int v390 = 0;
    int v362 = 0;
    int v366 = 0;
    int v370 = 0;
    BOOL v395 = 0;
    int v388 = 0;
    int v369 = 0;
    int v372 = 0;
    uint64_t v378 = 0;
    BOOL v391 = 0;
    int v384 = 0;
    int v377 = 0;
    int v37 = 0;
    BOOL v385 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    char isEqual = 0;
    unsigned int v423 = 1;
    goto LABEL_29;
  }
  v353 = (void *)v27;
  v30 = objc_msgSend_objectID(self, v28, v29);
  objc_msgSend_objectID(v5, v31, v32);
  v349 = v350 = v30;
  int isEqualToString = objc_msgSend_isEqualToString_(v30, v33, (uint64_t)v349);
  uint64_t isOriginal = 1;
  if (isEqualToString)
  {
LABEL_12:
    v348 = objc_msgSend_parentObjectID(self, v21, v22);
    unsigned int v423 = isOriginal;
    BOOL v409 = v348 == 0;
    if (v348
      || (objc_msgSend_parentObjectID(v5, v42, v43), (v345 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v44 = objc_msgSend_parentObjectID(self, v42, v43);
      if (!v44)
      {
        v347 = 0;
        int v393 = 0;
        int v389 = 0;
        BOOL v421 = 0;
        int v392 = 0;
        BOOL v408 = 0;
        int v420 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v422 = 1;
        goto LABEL_29;
      }
      v347 = (void *)v44;
      uint64_t v47 = objc_msgSend_parentObjectID(v5, v45, v46);
      if (!v47)
      {
        v346 = 0;
        int v389 = 0;
        BOOL v421 = 0;
        int v392 = 0;
        BOOL v408 = 0;
        int v420 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v422 = 1;
        int v393 = 1;
        goto LABEL_29;
      }
      id v261 = v4;
      v50 = v23;
      v346 = (void *)v47;
      uint64_t v51 = objc_msgSend_parentObjectID(self, v48, v49);
      objc_msgSend_parentObjectID(v5, v52, v53);
      v343 = v344 = v51;
      if (!objc_msgSend_isEqualToString_(v51, v54, (uint64_t)v343))
      {
        uint64_t v417 = 1;
        BOOL v421 = 0;
        int v392 = 0;
        BOOL v408 = 0;
        int v420 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v422 = 1;
        int v393 = 1;
        int v389 = 1;
        uint64_t v23 = v50;
        id v4 = v261;
        goto LABEL_29;
      }
      int v422 = 1;
      uint64_t v23 = v50;
      id v4 = v261;
    }
    else
    {
      v345 = 0;
      int v422 = 0;
    }
    uint64_t isOriginal = objc_msgSend_type(self, v42, v43);
    if (isOriginal != objc_msgSend_type(v5, v55, v56))
    {
      BOOL v421 = 0;
      int v392 = 0;
      BOOL v408 = 0;
      int v420 = 0;
      int v387 = 0;
      int v383 = 0;
      BOOL v419 = 0;
      int v386 = 0;
      BOOL v407 = 0;
      int v418 = 0;
      int v382 = 0;
      int v380 = 0;
      int v35 = 0;
      BOOL v406 = 0;
      int v36 = 0;
      int v379 = 0;
      int v381 = 0;
      BOOL v405 = 0;
      int v416 = 0;
      int v375 = 0;
      int v373 = 0;
      int v376 = 0;
      BOOL v404 = 0;
      int v415 = 0;
      int v364 = 0;
      int v355 = 0;
      int v374 = 0;
      BOOL v403 = 0;
      int v414 = 0;
      int v363 = 0;
      int v356 = 0;
      int v371 = 0;
      BOOL v402 = 0;
      int v400 = 0;
      uint64_t v361 = 0;
      int v368 = 0;
      BOOL v401 = 0;
      int v398 = 0;
      int v357 = 0;
      int v359 = 0;
      int v365 = 0;
      BOOL v399 = 0;
      int v394 = 0;
      int v358 = 0;
      int v360 = 0;
      int v367 = 0;
      BOOL v397 = 0;
      int v390 = 0;
      int v362 = 0;
      int v366 = 0;
      int v370 = 0;
      BOOL v395 = 0;
      int v388 = 0;
      int v369 = 0;
      int v372 = 0;
      uint64_t v378 = 0;
      BOOL v391 = 0;
      int v384 = 0;
      int v377 = 0;
      int v37 = 0;
      BOOL v385 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      char isEqual = 0;
      uint64_t v417 = 1;
      LODWORD(v396) = v423;
      HIDWORD(v396) = v423;
      int v393 = v422;
      int v389 = v422;
      goto LABEL_29;
    }
    BOOL v421 = (v8 | v15) != 0;
    uint64_t isOriginal = v423;
    if (v8 | v15)
    {
      if (!v8 || !v15)
      {
        uint64_t v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v420 = 0;
        BOOL v421 = 0;
        BOOL v408 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v392 = 0;
        char isEqual = 0;
        goto LABEL_29;
      }
      uint64_t isOriginal = objc_msgSend_absoluteString((void *)v8, v57, v58);
      objc_msgSend_absoluteString((void *)v15, v59, v60);
      v338 = v339 = (void *)isOriginal;
      if (objc_msgSend_caseInsensitiveCompare_((void *)isOriginal, v61, (uint64_t)v338))
      {
        int v392 = 0;
        BOOL v408 = 0;
        int v420 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        BOOL v421 = 1;
        goto LABEL_29;
      }
      uint64_t isOriginal = v423;
    }
    uint64_t v69 = objc_msgSend_urlExpirationDate(self, v57, v58);
    BOOL v408 = v69 == 0;
    v342 = (void *)v69;
    if (v69
      || (objc_msgSend_urlExpirationDate(v5, v70, v71), (v352 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v72 = objc_msgSend_urlExpirationDate(self, v70, v71);
      if (!v72)
      {
        v341 = 0;
        int v387 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v420 = 1;
        goto LABEL_29;
      }
      v341 = (void *)v72;
      uint64_t v75 = objc_msgSend_urlExpirationDate(v5, v73, v74);
      if (!v75)
      {
        v340 = 0;
        int v383 = 0;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v420 = 1;
        int v387 = 1;
        goto LABEL_29;
      }
      v340 = (void *)v75;
      uint64_t isOriginal = objc_msgSend_urlExpirationDate(self, v76, v77);
      objc_msgSend_urlExpirationDate(v5, v78, v79);
      v336 = v337 = (void *)isOriginal;
      if (!objc_msgSend_isEqualToDate_((void *)isOriginal, v80, (uint64_t)v336))
      {
        uint64_t v417 = 1;
        BOOL v419 = 0;
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v420 = 1;
        int v387 = 1;
        int v82 = 1;
LABEL_202:
        int v383 = v82;
        goto LABEL_29;
      }
      int v420 = 1;
      uint64_t v81 = v352;
      uint64_t isOriginal = v423;
    }
    else
    {
      uint64_t v81 = 0;
      int v420 = 0;
    }
    BOOL v419 = (v10 | v16) != 0;
    v352 = v81;
    if (v10 | v16)
    {
      if (!v10 || !v16)
      {
        uint64_t v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        int v418 = 0;
        BOOL v419 = 0;
        BOOL v407 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        char isEqual = 0;
        int v40 = 0;
        int v386 = 0;
        goto LABEL_29;
      }
      uint64_t isOriginal = objc_msgSend_absoluteString((void *)v10, v70, v71);
      objc_msgSend_absoluteString((void *)v16, v83, v84);
      v332 = v333 = (void *)isOriginal;
      if (objc_msgSend_caseInsensitiveCompare_((void *)isOriginal, v85, (uint64_t)v332))
      {
        int v386 = 0;
        BOOL v407 = 0;
        int v418 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        BOOL v419 = 1;
        goto LABEL_29;
      }
    }
    uint64_t isOriginal = objc_msgSend_isOriginal(self, v70, v71);
    if (isOriginal != objc_msgSend_isOriginal(v5, v86, v87))
    {
      int v386 = 0;
      BOOL v407 = 0;
      int v418 = 0;
      int v382 = 0;
      int v380 = 0;
      int v35 = 0;
      BOOL v406 = 0;
      int v36 = 0;
      int v379 = 0;
      int v381 = 0;
      BOOL v405 = 0;
      int v416 = 0;
      int v375 = 0;
      int v373 = 0;
      int v376 = 0;
      BOOL v404 = 0;
      int v415 = 0;
      int v364 = 0;
      int v355 = 0;
      int v374 = 0;
      BOOL v403 = 0;
      int v414 = 0;
      int v363 = 0;
      int v356 = 0;
      int v371 = 0;
      BOOL v402 = 0;
      int v400 = 0;
      uint64_t v361 = 0;
      int v368 = 0;
      BOOL v401 = 0;
      int v398 = 0;
      int v357 = 0;
      int v359 = 0;
      int v365 = 0;
      BOOL v399 = 0;
      int v394 = 0;
      int v358 = 0;
      int v360 = 0;
      int v367 = 0;
      BOOL v397 = 0;
      int v390 = 0;
      int v362 = 0;
      int v366 = 0;
      int v370 = 0;
      BOOL v395 = 0;
      int v388 = 0;
      int v369 = 0;
      int v372 = 0;
      uint64_t v378 = 0;
      BOOL v391 = 0;
      int v384 = 0;
      int v377 = 0;
      int v37 = 0;
      BOOL v385 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      char isEqual = 0;
      uint64_t v417 = 1;
      LODWORD(v396) = v423;
      HIDWORD(v396) = v423;
      int v393 = v422;
      int v389 = v422;
      int v392 = 1;
      int v82 = v420;
      int v387 = v420;
      goto LABEL_202;
    }
    uint64_t v90 = objc_msgSend_originalFilename(self, v88, v89);
    BOOL v407 = v90 == 0;
    uint64_t isOriginal = v423;
    v335 = (void *)v90;
    if (v90
      || (objc_msgSend_originalFilename(v5, v91, v92), (v330 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v93 = objc_msgSend_originalFilename(self, v91, v92);
      if (!v93)
      {
        v334 = 0;
        int v382 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        int v386 = 1;
        int v418 = 1;
        goto LABEL_29;
      }
      v334 = (void *)v93;
      uint64_t v96 = objc_msgSend_originalFilename(v5, v94, v95);
      if (!v96)
      {
        v331 = 0;
        int v380 = 0;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        uint64_t v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        int v386 = 1;
        int v418 = 1;
        int v382 = 1;
        goto LABEL_29;
      }
      v331 = (void *)v96;
      uint64_t isOriginal = objc_msgSend_originalFilename(self, v97, v98);
      objc_msgSend_originalFilename(v5, v99, v100);
      v328 = v329 = (void *)isOriginal;
      if (!objc_msgSend_isEqualToString_((void *)isOriginal, v101, (uint64_t)v328))
      {
        uint64_t v417 = 1;
        int v35 = 0;
        BOOL v406 = 0;
        int v36 = 0;
        int v379 = 0;
        int v381 = 0;
        BOOL v405 = 0;
        int v416 = 0;
        int v375 = 0;
        int v373 = 0;
        int v376 = 0;
        BOOL v404 = 0;
        int v415 = 0;
        int v364 = 0;
        int v355 = 0;
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        int v386 = 1;
        int v418 = 1;
        int v382 = 1;
        int v102 = 1;
        goto LABEL_223;
      }
      int v418 = 1;
    }
    else
    {
      v330 = 0;
      int v418 = 0;
    }
    uint64_t isOriginal = objc_msgSend_schoolworkSyncStatus(self, v91, v92);
    if (isOriginal == objc_msgSend_schoolworkSyncStatus(v5, v103, v104))
    {
      uint64_t isOriginal = objc_msgSend_fileSizeInBytes(self, v105, v106);
      if (isOriginal == objc_msgSend_fileSizeInBytes(v5, v107, v108))
      {
        uint64_t v111 = objc_msgSend_filenameExtension(self, v109, v110);
        BOOL v406 = v111 == 0;
        v326 = (void *)v111;
        if (v111
          || (objc_msgSend_filenameExtension(v5, v112, v113), (v324 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v327 = objc_msgSend_filenameExtension(self, v112, v113);
          if (!v327)
          {
            v327 = 0;
            int v36 = 0;
            int v379 = 0;
            int v381 = 0;
            BOOL v405 = 0;
            int v416 = 0;
            int v375 = 0;
            int v373 = 0;
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            uint64_t v417 = 0x100000001;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            goto LABEL_29;
          }
          v262 = v5;
          v325 = objc_msgSend_filenameExtension(v5, v114, v115);
          if (!v325)
          {
            v325 = 0;
            int v379 = 0;
            int v381 = 0;
            BOOL v405 = 0;
            int v416 = 0;
            int v375 = 0;
            int v373 = 0;
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            uint64_t v417 = 0x100000001;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = 1;
            goto LABEL_258;
          }
          v118 = objc_msgSend_filenameExtension(self, v116, v117);
          v321 = objc_msgSend_filenameExtension(v262, v119, v120);
          v322 = v118;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqualToString_(v118, v121, (uint64_t)v321))
          {
            int v381 = 0;
            BOOL v405 = 0;
            int v416 = 0;
            int v375 = 0;
            int v373 = 0;
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            HIDWORD(v417) = 1;
            int v36 = 1;
            int v379 = 1;
            goto LABEL_258;
          }
          HIDWORD(v417) = 1;
        }
        else
        {
          v262 = v5;
          v324 = 0;
          HIDWORD(v417) = 0;
        }
        uint64_t v122 = objc_msgSend_fileUTType(self, v112, v113);
        BOOL v405 = v122 == 0;
        v320 = (void *)v122;
        if (v122
          || (objc_msgSend_fileUTType(v262, v123, v124), (v318 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v323 = objc_msgSend_fileUTType(self, v123, v124);
          if (!v323)
          {
            v323 = 0;
            int v375 = 0;
            int v373 = 0;
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v416 = 1;
            goto LABEL_258;
          }
          v319 = objc_msgSend_fileUTType(self, v125, v126);
          if (!v319)
          {
            v319 = 0;
            int v373 = 0;
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v416 = 1;
            int v375 = 1;
            goto LABEL_258;
          }
          v129 = objc_msgSend_fileUTType(self, v127, v128);
          v315 = objc_msgSend_fileUTType(v262, v130, v131);
          v316 = v129;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqual_(v129, v132, (uint64_t)v315))
          {
            int v376 = 0;
            BOOL v404 = 0;
            int v415 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v416 = 1;
            int v375 = 1;
            int v373 = 1;
            goto LABEL_258;
          }
          int v416 = 1;
        }
        else
        {
          v318 = 0;
          int v416 = 0;
        }
        uint64_t v133 = objc_msgSend_title(self, v123, v124);
        BOOL v404 = v133 == 0;
        v314 = (void *)v133;
        if (v133 || (objc_msgSend_title(v262, v134, v135), (v312 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v317 = objc_msgSend_title(self, v134, v135);
          if (!v317)
          {
            v317 = 0;
            int v364 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v375 = v416;
            int v373 = v416;
            int v376 = 1;
            int v415 = 1;
            goto LABEL_258;
          }
          v313 = objc_msgSend_title(v262, v136, v137);
          if (!v313)
          {
            v313 = 0;
            int v355 = 0;
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v375 = v416;
            int v373 = v416;
            int v376 = 1;
            int v415 = 1;
            int v364 = 1;
            goto LABEL_258;
          }
          v140 = objc_msgSend_title(self, v138, v139);
          v310 = objc_msgSend_title(v262, v141, v142);
          v311 = v140;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqualToString_(v140, v143, (uint64_t)v310))
          {
            int v374 = 0;
            BOOL v403 = 0;
            int v414 = 0;
            int v363 = 0;
            int v356 = 0;
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v375 = v416;
            int v373 = v416;
            int v376 = 1;
            int v415 = 1;
            int v364 = 1;
            int v144 = 1;
            goto LABEL_257;
          }
          int v415 = 1;
        }
        else
        {
          v312 = 0;
          int v415 = 0;
        }
        uint64_t isOriginal = objc_msgSend_displayOrder(self, v134, v135);
        if (isOriginal == objc_msgSend_displayOrder(v262, v145, v146))
        {
          objc_msgSend_durationInSeconds(self, v147, v148);
          double v150 = v149;
          objc_msgSend_durationInSeconds(v262, v151, v152);
          if (v150 == v155)
          {
            uint64_t v156 = objc_msgSend_ownerPersonID(self, v153, v154);
            BOOL v403 = v156 == 0;
            v308 = (void *)v156;
            if (v156
              || (objc_msgSend_ownerPersonID(v262, v157, v158),
                  (v306 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v309 = objc_msgSend_ownerPersonID(self, v157, v158);
              if (!v309)
              {
                v309 = 0;
                int v363 = 0;
                int v356 = 0;
                int v371 = 0;
                BOOL v402 = 0;
                int v400 = 0;
                uint64_t v361 = 0;
                int v368 = 0;
                BOOL v401 = 0;
                int v398 = 0;
                int v357 = 0;
                int v359 = 0;
                int v365 = 0;
                BOOL v399 = 0;
                int v394 = 0;
                int v358 = 0;
                int v360 = 0;
                int v367 = 0;
                BOOL v397 = 0;
                int v390 = 0;
                int v362 = 0;
                int v366 = 0;
                int v370 = 0;
                BOOL v395 = 0;
                int v388 = 0;
                int v369 = 0;
                int v372 = 0;
                uint64_t v378 = 0;
                BOOL v391 = 0;
                int v384 = 0;
                int v377 = 0;
                int v37 = 0;
                BOOL v385 = 0;
                int v38 = 0;
                int v39 = 0;
                int v40 = 0;
                char isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                int v393 = v422;
                int v389 = v422;
                int v392 = 1;
                int v387 = v420;
                int v383 = v420;
                int v386 = 1;
                int v382 = v418;
                int v380 = v418;
                int v35 = 1;
                int v36 = HIDWORD(v417);
                int v379 = HIDWORD(v417);
                int v381 = 1;
                int v375 = v416;
                int v373 = v416;
                int v376 = 1;
                int v364 = v415;
                int v355 = v415;
                int v374 = 1;
                int v414 = 1;
                goto LABEL_258;
              }
              v307 = objc_msgSend_ownerPersonID(v262, v159, v160);
              if (!v307)
              {
                v307 = 0;
                int v356 = 0;
                int v371 = 0;
                BOOL v402 = 0;
                int v400 = 0;
                uint64_t v361 = 0;
                int v368 = 0;
                BOOL v401 = 0;
                int v398 = 0;
                int v357 = 0;
                int v359 = 0;
                int v365 = 0;
                BOOL v399 = 0;
                int v394 = 0;
                int v358 = 0;
                int v360 = 0;
                int v367 = 0;
                BOOL v397 = 0;
                int v390 = 0;
                int v362 = 0;
                int v366 = 0;
                int v370 = 0;
                BOOL v395 = 0;
                int v388 = 0;
                int v369 = 0;
                int v372 = 0;
                uint64_t v378 = 0;
                BOOL v391 = 0;
                int v384 = 0;
                int v377 = 0;
                int v37 = 0;
                BOOL v385 = 0;
                int v38 = 0;
                int v39 = 0;
                int v40 = 0;
                char isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                int v393 = v422;
                int v389 = v422;
                int v392 = 1;
                int v387 = v420;
                int v383 = v420;
                int v386 = 1;
                int v382 = v418;
                int v380 = v418;
                int v35 = 1;
                int v36 = HIDWORD(v417);
                int v379 = HIDWORD(v417);
                int v381 = 1;
                int v375 = v416;
                int v373 = v416;
                int v376 = 1;
                int v364 = v415;
                int v355 = v415;
                int v374 = 1;
                int v414 = 1;
                int v363 = 1;
                goto LABEL_258;
              }
              uint64_t v163 = objc_msgSend_ownerPersonID(self, v161, v162);
              v304 = objc_msgSend_ownerPersonID(v262, v164, v165);
              v305 = v163;
              LODWORD(v417) = 1;
              if (!objc_msgSend_isEqualToString_(v163, v166, (uint64_t)v304))
              {
                int v371 = 0;
                BOOL v402 = 0;
                int v400 = 0;
                uint64_t v361 = 0;
                int v368 = 0;
                BOOL v401 = 0;
                int v398 = 0;
                int v357 = 0;
                int v359 = 0;
                int v365 = 0;
                BOOL v399 = 0;
                int v394 = 0;
                int v358 = 0;
                int v360 = 0;
                int v367 = 0;
                BOOL v397 = 0;
                int v390 = 0;
                int v362 = 0;
                int v366 = 0;
                int v370 = 0;
                BOOL v395 = 0;
                int v388 = 0;
                int v369 = 0;
                int v372 = 0;
                uint64_t v378 = 0;
                BOOL v391 = 0;
                int v384 = 0;
                int v377 = 0;
                int v37 = 0;
                BOOL v385 = 0;
                int v38 = 0;
                int v39 = 0;
                int v40 = 0;
                char isEqual = 0;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                int v393 = v422;
                int v389 = v422;
                int v392 = 1;
                int v387 = v420;
                int v383 = v420;
                int v386 = 1;
                int v382 = v418;
                int v380 = v418;
                int v35 = 1;
                int v36 = HIDWORD(v417);
                int v379 = HIDWORD(v417);
                int v381 = 1;
                int v375 = v416;
                int v373 = v416;
                int v376 = 1;
                int v364 = v415;
                int v355 = v415;
                int v374 = 1;
                int v414 = 1;
                int v363 = 1;
                int v167 = 1;
                goto LABEL_271;
              }
              int v414 = 1;
            }
            else
            {
              v306 = 0;
              int v414 = 0;
            }
            uint64_t isOriginal = objc_msgSend_parentEntityType(self, v157, v158);
            if (isOriginal == objc_msgSend_parentEntityType(v262, v168, v169))
            {
              uint64_t v172 = objc_msgSend_brItemID(self, v170, v171);
              BOOL v402 = v172 == 0;
              v302 = (void *)v172;
              if (v172
                || (objc_msgSend_brItemID(v262, v173, v174), (v300 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v303 = objc_msgSend_brItemID(self, v173, v174);
                if (!v303)
                {
                  v303 = 0;
                  uint64_t v361 = 0;
                  int v368 = 0;
                  BOOL v401 = 0;
                  int v398 = 0;
                  int v357 = 0;
                  int v359 = 0;
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  int v400 = 1;
                  goto LABEL_258;
                }
                v301 = objc_msgSend_brItemID(v262, v175, v176);
                if (!v301)
                {
                  v301 = 0;
                  int v368 = 0;
                  BOOL v401 = 0;
                  int v398 = 0;
                  int v357 = 0;
                  int v359 = 0;
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  int v400 = 1;
                  uint64_t v361 = 1;
                  goto LABEL_258;
                }
                v179 = objc_msgSend_brItemID(self, v177, v178);
                v298 = objc_msgSend_brItemID(v262, v180, v181);
                v299 = v179;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v179, v182, (uint64_t)v298))
                {
                  int v368 = 0;
                  BOOL v401 = 0;
                  int v398 = 0;
                  int v357 = 0;
                  int v359 = 0;
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  int v400 = 1;
                  uint64_t v361 = 0x100000001;
                  goto LABEL_258;
                }
                int v400 = 1;
              }
              else
              {
                v300 = 0;
                int v400 = 0;
              }
              uint64_t v183 = objc_msgSend_brOwnerName(self, v173, v174);
              BOOL v401 = v183 == 0;
              v296 = (void *)v183;
              if (v183
                || (objc_msgSend_brOwnerName(v262, v184, v185),
                    (v295 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v297 = objc_msgSend_brOwnerName(self, v184, v185);
                if (!v297)
                {
                  v297 = 0;
                  int v357 = 0;
                  int v359 = 0;
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v398 = 1;
                  goto LABEL_258;
                }
                v294 = objc_msgSend_brOwnerName(v262, v186, v187);
                if (!v294)
                {
                  v294 = 0;
                  int v359 = 0;
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v398 = 1;
                  int v357 = 1;
                  goto LABEL_258;
                }
                v190 = objc_msgSend_brOwnerName(self, v188, v189);
                v291 = objc_msgSend_brOwnerName(v262, v191, v192);
                v292 = v190;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v190, v193, (uint64_t)v291))
                {
                  int v365 = 0;
                  BOOL v399 = 0;
                  int v394 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v398 = 1;
                  int v357 = 1;
                  int v359 = 1;
                  goto LABEL_258;
                }
                int v398 = 1;
              }
              else
              {
                v295 = 0;
                int v398 = 0;
              }
              uint64_t v194 = objc_msgSend_brZoneName(self, v184, v185);
              BOOL v399 = v194 == 0;
              v290 = (void *)v194;
              if (v194
                || (objc_msgSend_brZoneName(v262, v195, v196),
                    (v289 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v293 = objc_msgSend_brZoneName(self, v195, v196);
                if (!v293)
                {
                  v293 = 0;
                  int v358 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v394 = 1;
                  goto LABEL_258;
                }
                v288 = objc_msgSend_brZoneName(v262, v197, v198);
                if (!v288)
                {
                  v288 = 0;
                  int v360 = 0;
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v394 = 1;
                  int v358 = 1;
                  goto LABEL_258;
                }
                v201 = objc_msgSend_brZoneName(self, v199, v200);
                v286 = objc_msgSend_brZoneName(v262, v202, v203);
                v287 = v201;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v201, v204, (uint64_t)v286))
                {
                  int v367 = 0;
                  BOOL v397 = 0;
                  int v390 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v394 = 1;
                  int v358 = 1;
                  int v360 = 1;
                  goto LABEL_258;
                }
                int v394 = 1;
              }
              else
              {
                v289 = 0;
                int v394 = 0;
              }
              uint64_t v205 = objc_msgSend_brShareName(self, v195, v196);
              BOOL v397 = v205 == 0;
              v285 = (void *)v205;
              if (v205
                || (objc_msgSend_brShareName(v262, v206, v207),
                    (v284 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v283 = objc_msgSend_brShareName(self, v206, v207);
                if (!v283)
                {
                  v283 = 0;
                  int v362 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v390 = 1;
                  goto LABEL_258;
                }
                v282 = objc_msgSend_brShareName(v262, v208, v209);
                if (!v282)
                {
                  v282 = 0;
                  int v366 = 0;
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v390 = 1;
                  int v362 = 1;
                  goto LABEL_258;
                }
                v212 = objc_msgSend_brShareName(self, v210, v211);
                v280 = objc_msgSend_brShareName(v262, v213, v214);
                v281 = v212;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v212, v215, (uint64_t)v280))
                {
                  int v370 = 0;
                  BOOL v395 = 0;
                  int v388 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v390 = 1;
                  int v362 = 1;
                  int v366 = 1;
                  goto LABEL_258;
                }
                int v390 = 1;
              }
              else
              {
                v284 = 0;
                int v390 = 0;
              }
              uint64_t v216 = objc_msgSend_ubiquitousContainerName(self, v206, v207);
              BOOL v395 = v216 == 0;
              v279 = (void *)v216;
              if (v216
                || (objc_msgSend_ubiquitousContainerName(v262, v217, v218),
                    (v278 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v277 = objc_msgSend_ubiquitousContainerName(self, v217, v218);
                if (!v277)
                {
                  v277 = 0;
                  int v369 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v362 = v390;
                  int v366 = v390;
                  int v370 = 1;
                  int v388 = 1;
                  goto LABEL_258;
                }
                v276 = objc_msgSend_ubiquitousContainerName(v262, v219, v220);
                if (!v276)
                {
                  v276 = 0;
                  int v372 = 0;
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v362 = v390;
                  int v366 = v390;
                  int v370 = 1;
                  int v388 = 1;
                  int v369 = 1;
                  goto LABEL_258;
                }
                v223 = objc_msgSend_ubiquitousContainerName(self, v221, v222);
                v274 = objc_msgSend_ubiquitousContainerName(v262, v224, v225);
                v275 = v223;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v223, v226, (uint64_t)v274))
                {
                  uint64_t v378 = 0;
                  BOOL v391 = 0;
                  int v384 = 0;
                  int v377 = 0;
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v362 = v390;
                  int v366 = v390;
                  int v370 = 1;
                  int v388 = 1;
                  int v369 = 1;
                  int v372 = 1;
                  goto LABEL_258;
                }
                int v388 = 1;
              }
              else
              {
                v278 = 0;
                int v388 = 0;
              }
              uint64_t v227 = objc_msgSend_relativePathWithinContainer(self, v217, v218);
              BOOL v391 = v227 == 0;
              v273 = (void *)v227;
              if (!v227)
              {
                v272 = objc_msgSend_relativePathWithinContainer(v262, v228, v229);
                if (!v272)
                {
                  v272 = 0;
                  int v384 = 0;
                  goto LABEL_326;
                }
              }
              v271 = objc_msgSend_relativePathWithinContainer(self, v228, v229);
              if (v271)
              {
                v270 = objc_msgSend_relativePathWithinContainer(v262, v230, v231);
                if (v270)
                {
                  v234 = objc_msgSend_relativePathWithinContainer(self, v232, v233);
                  v268 = objc_msgSend_relativePathWithinContainer(v262, v235, v236);
                  v269 = v234;
                  LODWORD(v417) = 1;
                  if (!objc_msgSend_isEqualToString_(v234, v237, (uint64_t)v268))
                  {
                    int v37 = 0;
                    BOOL v385 = 0;
                    int v38 = 0;
                    int v39 = 0;
                    int v40 = 0;
                    char isEqual = 0;
                    LODWORD(v396) = v423;
                    HIDWORD(v396) = v423;
                    int v393 = v422;
                    int v389 = v422;
                    int v392 = 1;
                    int v387 = v420;
                    int v383 = v420;
                    int v386 = 1;
                    int v382 = v418;
                    int v380 = v418;
                    int v35 = 1;
                    int v36 = HIDWORD(v417);
                    int v379 = HIDWORD(v417);
                    int v381 = 1;
                    int v375 = v416;
                    int v373 = v416;
                    int v376 = 1;
                    int v364 = v415;
                    int v355 = v415;
                    int v374 = 1;
                    int v363 = v414;
                    int v356 = v414;
                    int v371 = 1;
                    LODWORD(v361) = v400;
                    HIDWORD(v361) = v400;
                    int v368 = 1;
                    int v357 = v398;
                    int v359 = v398;
                    int v365 = 1;
                    int v358 = v394;
                    int v360 = v394;
                    int v367 = 1;
                    int v362 = v390;
                    int v366 = v390;
                    int v370 = 1;
                    int v369 = v388;
                    int v372 = v388;
                    LODWORD(v378) = 1;
                    int v384 = 1;
                    int v377 = 1;
                    int v238 = 1;
LABEL_334:
                    HIDWORD(v378) = v238;
                    goto LABEL_258;
                  }
                  int v384 = 1;
LABEL_326:
                  uint64_t isOriginal = objc_msgSend_isDownloaded(self, v228, v229);
                  if (isOriginal == objc_msgSend_isDownloaded(v262, v239, v240))
                  {
                    objc_msgSend_fractionDownloaded(self, v241, v242);
                    double v244 = v243;
                    objc_msgSend_fractionDownloaded(v262, v245, v246);
                    if (v244 == v249)
                    {
                      uint64_t v250 = objc_msgSend_downloadError(self, v247, v248);
                      BOOL v385 = v250 == 0;
                      v267 = (void *)v250;
                      if (v250
                        || (objc_msgSend_downloadError(v262, v251, v252),
                            (v266 = objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        v265 = objc_msgSend_downloadError(self, v251, v252);
                        if (v265)
                        {
                          v264 = objc_msgSend_downloadError(self, v253, v254);
                          if (v264)
                          {
                            v257 = objc_msgSend_downloadError(self, v255, v256);
                            objc_super v5 = v262;
                            uint64_t isOriginal = objc_msgSend_downloadError(v262, v258, v259);
                            v263 = v257;
                            char isEqual = objc_msgSend_isEqual_(v257, v260, isOriginal);
                            LODWORD(v417) = 1;
                            LODWORD(v396) = v423;
                            HIDWORD(v396) = v423;
                            int v393 = v422;
                            int v389 = v422;
                            int v392 = 1;
                            int v387 = v420;
                            int v383 = v420;
                            int v386 = 1;
                            int v382 = v418;
                            int v380 = v418;
                            int v35 = 1;
                            int v36 = HIDWORD(v417);
                            int v379 = HIDWORD(v417);
                            int v381 = 1;
                            int v375 = v416;
                            int v373 = v416;
                            int v376 = 1;
                            int v364 = v415;
                            int v355 = v415;
                            int v374 = 1;
                            int v363 = v414;
                            int v356 = v414;
                            int v371 = 1;
                            LODWORD(v361) = v400;
                            HIDWORD(v361) = v400;
                            int v368 = 1;
                            int v357 = v398;
                            int v359 = v398;
                            int v365 = 1;
                            int v358 = v394;
                            int v360 = v394;
                            int v367 = 1;
                            int v362 = v390;
                            int v366 = v390;
                            int v370 = 1;
                            int v369 = v388;
                            int v372 = v388;
                            LODWORD(v378) = 1;
                            int v377 = v384;
                            HIDWORD(v378) = v384;
                            int v37 = 1;
                            int v38 = 1;
                            int v39 = 1;
                            int v40 = 1;
                            goto LABEL_29;
                          }
                          v264 = 0;
                          int v40 = 0;
                          char isEqual = 0;
                          LODWORD(v417) = 1;
                          LODWORD(v396) = v423;
                          HIDWORD(v396) = v423;
                          int v393 = v422;
                          int v389 = v422;
                          int v392 = 1;
                          int v387 = v420;
                          int v383 = v420;
                          int v386 = 1;
                          int v382 = v418;
                          int v380 = v418;
                          int v35 = 1;
                          int v36 = HIDWORD(v417);
                          int v379 = HIDWORD(v417);
                          int v381 = 1;
                          int v375 = v416;
                          int v373 = v416;
                          int v376 = 1;
                          int v364 = v415;
                          int v355 = v415;
                          int v374 = 1;
                          int v363 = v414;
                          int v356 = v414;
                          int v371 = 1;
                          LODWORD(v361) = v400;
                          HIDWORD(v361) = v400;
                          int v368 = 1;
                          int v357 = v398;
                          int v359 = v398;
                          int v365 = 1;
                          int v358 = v394;
                          int v360 = v394;
                          int v367 = 1;
                          int v362 = v390;
                          int v366 = v390;
                          int v370 = 1;
                          int v369 = v388;
                          int v372 = v388;
                          LODWORD(v378) = 1;
                          int v377 = v384;
                          HIDWORD(v378) = v384;
                          int v37 = 1;
                          int v38 = 1;
                          int v39 = 1;
                        }
                        else
                        {
                          v265 = 0;
                          int v39 = 0;
                          int v40 = 0;
                          char isEqual = 0;
                          LODWORD(v417) = 1;
                          LODWORD(v396) = v423;
                          HIDWORD(v396) = v423;
                          int v393 = v422;
                          int v389 = v422;
                          int v392 = 1;
                          int v387 = v420;
                          int v383 = v420;
                          int v386 = 1;
                          int v382 = v418;
                          int v380 = v418;
                          int v35 = 1;
                          int v36 = HIDWORD(v417);
                          int v379 = HIDWORD(v417);
                          int v381 = 1;
                          int v375 = v416;
                          int v373 = v416;
                          int v376 = 1;
                          int v364 = v415;
                          int v355 = v415;
                          int v374 = 1;
                          int v363 = v414;
                          int v356 = v414;
                          int v371 = 1;
                          LODWORD(v361) = v400;
                          HIDWORD(v361) = v400;
                          int v368 = 1;
                          int v357 = v398;
                          int v359 = v398;
                          int v365 = 1;
                          int v358 = v394;
                          int v360 = v394;
                          int v367 = 1;
                          int v362 = v390;
                          int v366 = v390;
                          int v370 = 1;
                          int v369 = v388;
                          int v372 = v388;
                          LODWORD(v378) = 1;
                          int v377 = v384;
                          HIDWORD(v378) = v384;
                          int v37 = 1;
                          int v38 = 1;
                        }
                      }
                      else
                      {
                        v266 = 0;
                        v267 = 0;
                        int v38 = 0;
                        int v39 = 0;
                        int v40 = 0;
                        LODWORD(v417) = 1;
                        LODWORD(v396) = v423;
                        HIDWORD(v396) = v423;
                        int v393 = v422;
                        int v389 = v422;
                        int v392 = 1;
                        int v387 = v420;
                        int v383 = v420;
                        int v386 = 1;
                        int v382 = v418;
                        int v380 = v418;
                        int v35 = 1;
                        int v36 = HIDWORD(v417);
                        int v379 = HIDWORD(v417);
                        int v381 = 1;
                        int v375 = v416;
                        int v373 = v416;
                        int v376 = 1;
                        int v364 = v415;
                        int v355 = v415;
                        int v374 = 1;
                        int v363 = v414;
                        int v356 = v414;
                        int v371 = 1;
                        LODWORD(v361) = v400;
                        HIDWORD(v361) = v400;
                        int v368 = 1;
                        int v357 = v398;
                        int v359 = v398;
                        int v365 = 1;
                        int v358 = v394;
                        int v360 = v394;
                        int v367 = 1;
                        int v362 = v390;
                        int v366 = v390;
                        int v370 = 1;
                        int v369 = v388;
                        int v372 = v388;
                        LODWORD(v378) = 1;
                        int v377 = v384;
                        HIDWORD(v378) = v384;
                        int v37 = 1;
                        BOOL v385 = 1;
                        char isEqual = 1;
                      }
                      goto LABEL_258;
                    }
                  }
                  int v37 = 0;
                  BOOL v385 = 0;
                  int v38 = 0;
                  int v39 = 0;
                  int v40 = 0;
                  char isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  int v393 = v422;
                  int v389 = v422;
                  int v392 = 1;
                  int v387 = v420;
                  int v383 = v420;
                  int v386 = 1;
                  int v382 = v418;
                  int v380 = v418;
                  int v35 = 1;
                  int v36 = HIDWORD(v417);
                  int v379 = HIDWORD(v417);
                  int v381 = 1;
                  int v375 = v416;
                  int v373 = v416;
                  int v376 = 1;
                  int v364 = v415;
                  int v355 = v415;
                  int v374 = 1;
                  int v363 = v414;
                  int v356 = v414;
                  int v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  int v368 = 1;
                  int v357 = v398;
                  int v359 = v398;
                  int v365 = 1;
                  int v358 = v394;
                  int v360 = v394;
                  int v367 = 1;
                  int v362 = v390;
                  int v366 = v390;
                  int v370 = 1;
                  int v369 = v388;
                  int v372 = v388;
                  LODWORD(v378) = 1;
                  int v238 = v384;
                  int v377 = v384;
                  goto LABEL_334;
                }
                v270 = 0;
                int v37 = 0;
                BOOL v385 = 0;
                int v38 = 0;
                int v39 = 0;
                int v40 = 0;
                char isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                int v393 = v422;
                int v389 = v422;
                int v392 = 1;
                int v387 = v420;
                int v383 = v420;
                int v386 = 1;
                int v382 = v418;
                int v380 = v418;
                int v35 = 1;
                int v36 = HIDWORD(v417);
                int v379 = HIDWORD(v417);
                int v381 = 1;
                int v375 = v416;
                int v373 = v416;
                int v376 = 1;
                int v364 = v415;
                int v355 = v415;
                int v374 = 1;
                int v363 = v414;
                int v356 = v414;
                int v371 = 1;
                LODWORD(v361) = v400;
                HIDWORD(v361) = v400;
                int v368 = 1;
                int v357 = v398;
                int v359 = v398;
                int v365 = 1;
                int v358 = v394;
                int v360 = v394;
                int v367 = 1;
                int v362 = v390;
                int v366 = v390;
                int v370 = 1;
                int v369 = v388;
                int v372 = v388;
                uint64_t v378 = 1;
                int v384 = 1;
                int v377 = 1;
              }
              else
              {
                v271 = 0;
                int v377 = 0;
                int v37 = 0;
                BOOL v385 = 0;
                int v38 = 0;
                int v39 = 0;
                int v40 = 0;
                char isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                int v393 = v422;
                int v389 = v422;
                int v392 = 1;
                int v387 = v420;
                int v383 = v420;
                int v386 = 1;
                int v382 = v418;
                int v380 = v418;
                int v35 = 1;
                int v36 = HIDWORD(v417);
                int v379 = HIDWORD(v417);
                int v381 = 1;
                int v375 = v416;
                int v373 = v416;
                int v376 = 1;
                int v364 = v415;
                int v355 = v415;
                int v374 = 1;
                int v363 = v414;
                int v356 = v414;
                int v371 = 1;
                LODWORD(v361) = v400;
                HIDWORD(v361) = v400;
                int v368 = 1;
                int v357 = v398;
                int v359 = v398;
                int v365 = 1;
                int v358 = v394;
                int v360 = v394;
                int v367 = 1;
                int v362 = v390;
                int v366 = v390;
                int v370 = 1;
                int v369 = v388;
                int v372 = v388;
                uint64_t v378 = 1;
                int v384 = 1;
              }
LABEL_258:
              objc_super v5 = v262;
              goto LABEL_29;
            }
            int v371 = 0;
            BOOL v402 = 0;
            int v400 = 0;
            uint64_t v361 = 0;
            int v368 = 0;
            BOOL v401 = 0;
            int v398 = 0;
            int v357 = 0;
            int v359 = 0;
            int v365 = 0;
            BOOL v399 = 0;
            int v394 = 0;
            int v358 = 0;
            int v360 = 0;
            int v367 = 0;
            BOOL v397 = 0;
            int v390 = 0;
            int v362 = 0;
            int v366 = 0;
            int v370 = 0;
            BOOL v395 = 0;
            int v388 = 0;
            int v369 = 0;
            int v372 = 0;
            uint64_t v378 = 0;
            BOOL v391 = 0;
            int v384 = 0;
            int v377 = 0;
            int v37 = 0;
            BOOL v385 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            char isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            int v393 = v422;
            int v389 = v422;
            int v392 = 1;
            int v387 = v420;
            int v383 = v420;
            int v386 = 1;
            int v382 = v418;
            int v380 = v418;
            int v35 = 1;
            int v36 = HIDWORD(v417);
            int v379 = HIDWORD(v417);
            int v381 = 1;
            int v375 = v416;
            int v373 = v416;
            int v376 = 1;
            int v364 = v415;
            int v355 = v415;
            int v374 = 1;
            int v167 = v414;
            int v363 = v414;
LABEL_271:
            int v356 = v167;
            goto LABEL_258;
          }
        }
        int v374 = 0;
        BOOL v403 = 0;
        int v414 = 0;
        int v363 = 0;
        int v356 = 0;
        int v371 = 0;
        BOOL v402 = 0;
        int v400 = 0;
        uint64_t v361 = 0;
        int v368 = 0;
        BOOL v401 = 0;
        int v398 = 0;
        int v357 = 0;
        int v359 = 0;
        int v365 = 0;
        BOOL v399 = 0;
        int v394 = 0;
        int v358 = 0;
        int v360 = 0;
        int v367 = 0;
        BOOL v397 = 0;
        int v390 = 0;
        int v362 = 0;
        int v366 = 0;
        int v370 = 0;
        BOOL v395 = 0;
        int v388 = 0;
        int v369 = 0;
        int v372 = 0;
        uint64_t v378 = 0;
        BOOL v391 = 0;
        int v384 = 0;
        int v377 = 0;
        int v37 = 0;
        BOOL v385 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        char isEqual = 0;
        LODWORD(v417) = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        int v393 = v422;
        int v389 = v422;
        int v392 = 1;
        int v387 = v420;
        int v383 = v420;
        int v386 = 1;
        int v382 = v418;
        int v380 = v418;
        int v35 = 1;
        int v36 = HIDWORD(v417);
        int v379 = HIDWORD(v417);
        int v381 = 1;
        int v375 = v416;
        int v373 = v416;
        int v376 = 1;
        int v144 = v415;
        int v364 = v415;
LABEL_257:
        int v355 = v144;
        goto LABEL_258;
      }
    }
    int v35 = 0;
    BOOL v406 = 0;
    int v36 = 0;
    int v379 = 0;
    int v381 = 0;
    BOOL v405 = 0;
    int v416 = 0;
    int v375 = 0;
    int v373 = 0;
    int v376 = 0;
    BOOL v404 = 0;
    int v415 = 0;
    int v364 = 0;
    int v355 = 0;
    int v374 = 0;
    BOOL v403 = 0;
    int v414 = 0;
    int v363 = 0;
    int v356 = 0;
    int v371 = 0;
    BOOL v402 = 0;
    int v400 = 0;
    uint64_t v361 = 0;
    int v368 = 0;
    BOOL v401 = 0;
    int v398 = 0;
    int v357 = 0;
    int v359 = 0;
    int v365 = 0;
    BOOL v399 = 0;
    int v394 = 0;
    int v358 = 0;
    int v360 = 0;
    int v367 = 0;
    BOOL v397 = 0;
    int v390 = 0;
    int v362 = 0;
    int v366 = 0;
    int v370 = 0;
    BOOL v395 = 0;
    int v388 = 0;
    int v369 = 0;
    int v372 = 0;
    uint64_t v378 = 0;
    BOOL v391 = 0;
    int v384 = 0;
    int v377 = 0;
    int v37 = 0;
    BOOL v385 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    char isEqual = 0;
    uint64_t v417 = 1;
    LODWORD(v396) = v423;
    HIDWORD(v396) = v423;
    int v393 = v422;
    int v389 = v422;
    int v392 = 1;
    int v387 = v420;
    int v383 = v420;
    int v386 = 1;
    int v102 = v418;
    int v382 = v418;
LABEL_223:
    int v380 = v102;
    goto LABEL_29;
  }
  int v422 = 0;
  unsigned int v423 = 1;
  uint64_t v417 = 0;
  BOOL v409 = 0;
  int v393 = 0;
  int v389 = 0;
  BOOL v421 = 0;
  int v392 = 0;
  BOOL v408 = 0;
  int v420 = 0;
  int v387 = 0;
  int v383 = 0;
  BOOL v419 = 0;
  int v386 = 0;
  BOOL v407 = 0;
  int v418 = 0;
  int v382 = 0;
  int v380 = 0;
  int v35 = 0;
  BOOL v406 = 0;
  int v36 = 0;
  int v379 = 0;
  int v381 = 0;
  BOOL v405 = 0;
  int v416 = 0;
  int v375 = 0;
  int v373 = 0;
  int v376 = 0;
  BOOL v404 = 0;
  int v415 = 0;
  int v364 = 0;
  int v355 = 0;
  int v374 = 0;
  BOOL v403 = 0;
  int v414 = 0;
  int v363 = 0;
  int v356 = 0;
  int v371 = 0;
  BOOL v402 = 0;
  int v400 = 0;
  uint64_t v361 = 0;
  int v368 = 0;
  BOOL v401 = 0;
  int v398 = 0;
  int v357 = 0;
  int v359 = 0;
  int v365 = 0;
  BOOL v399 = 0;
  int v394 = 0;
  int v358 = 0;
  int v360 = 0;
  int v367 = 0;
  BOOL v397 = 0;
  int v390 = 0;
  int v362 = 0;
  int v366 = 0;
  int v370 = 0;
  BOOL v395 = 0;
  int v388 = 0;
  int v369 = 0;
  int v372 = 0;
  uint64_t v378 = 0;
  BOOL v391 = 0;
  int v384 = 0;
  int v377 = 0;
  int v37 = 0;
  BOOL v385 = 0;
  int v38 = 0;
  int v39 = 0;
  int v40 = 0;
  char isEqual = 0;
  uint64_t v396 = 0x100000001;
LABEL_29:
  if (v40)
  {
    int v62 = v36;
    char v63 = isEqual;
    int v64 = v37;
    int v65 = v38;
    int v66 = v35;
    int v67 = v39;

    int v39 = v67;
    int v35 = v66;
    int v38 = v65;
    int v37 = v64;
    char isEqual = v63;
    int v36 = v62;
  }
  if (v39) {

  }
  if (v38) {
  if (v385)
  }

  if (v37) {
  if (HIDWORD(v378))
  }
  {
  }
  if (v377) {

  }
  if (v384) {
  if (v391)
  }

  if (v378) {
  if (v372)
  }
  {
  }
  if (v369) {

  }
  if (v388) {
  if (v395)
  }

  if (v370) {
  if (v366)
  }
  {
  }
  if (v362) {

  }
  if (v390) {
  if (v397)
  }

  if (v367) {
  if (v360)
  }
  {
  }
  if (v358) {

  }
  if (v394) {
  if (v399)
  }

  if (v365) {
  if (v359)
  }
  {
  }
  if (v357) {

  }
  if (v398) {
  if (v401)
  }

  if (v368) {
  if (HIDWORD(v361))
  }
  {
  }
  if (v361) {

  }
  if (v400) {
  if (v402)
  }

  if (v371) {
  if (v356)
  }
  {
  }
  if (v363) {

  }
  if (v414) {
  if (v403)
  }

  if (v374) {
  if (v355)
  }
  {
  }
  if (v364) {

  }
  if (v415) {
  if (v404)
  }

  if (v376) {
  if (v373)
  }
  {
  }
  if (v375) {

  }
  if (v416) {
  if (v405)
  }

  if (v381) {
  if (v379)
  }
  {
  }
  if (v36) {

  }
  if (HIDWORD(v417)) {
  if (v406)
  }

  if (v35) {
  if (v380)
  }
  {
  }
  if (v382) {

  }
  if (v418) {
  if (v407)
  }

  if (v386) {
  if (v419)
  }
  {
  }
  if (v383)
  {
  }
  if (v387) {

  }
  if (v420) {
  if (v408)
  }

  if (v392) {
  if (v421)
  }
  {
  }
  if (v389)
  {
  }
  if (v393) {

  }
  if (v422) {
  if (v409)
  }

  if (v417) {
  if (v396)
  }
  {
  }
  if (HIDWORD(v396)) {

  }
  if (v423) {
  if (!v23)
  }

LABEL_182:
  return isEqual;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)devModeOn
{
  v3 = objc_msgSend_currentUser(CLSDataStore, a2, v2);
  BOOL v6 = objc_msgSend_devMode(v3, v4, v5) != 0;

  return v6;
}

- (void)setFileSizeInBytesFromURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4
    && objc_msgSend_isFileURL(v4, v5, v6)
    && (objc_msgSend_type(self, v8, v9) & 0xFFFFFFFFFFFFFFFDLL) == 1
    && objc_msgSend_cls_fileExists(v7, v10, v11))
  {
    id v25 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1C5F8];
    id v24 = 0;
    int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v7, v12, (uint64_t)&v25, v13, &v24);
    id v15 = v25;
    id v18 = v24;
    if (ResourceValue_forKey_error)
    {
      objc_msgSend_lock(self, v16, v17);
      self->_fileSizeInBytes = objc_msgSend_integerValue(v15, v19, v20);
      objc_msgSend_unlock(self, v21, v22);
    }
    else
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v23 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v7;
        __int16 v28 = 2114;
        id v29 = v18;
        _os_log_error_impl(&dword_1DC60F000, v23, OS_LOG_TYPE_ERROR, "Failed to get fileSize resource from URL: '%{public}@', error:  '%{public}@'.", buf, 0x16u);
      }
    }
  }
}

- (void)setFileUTTypeFromURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6 && (objc_msgSend_type(self, v4, v5) & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (objc_msgSend_cls_fileExists(v6, v7, v8))
    {
      id v26 = 0;
      uint64_t v11 = *MEMORY[0x1E4F1C538];
      id v25 = 0;
      char ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v6, v9, (uint64_t)&v26, v11, &v25);
      uint64_t v13 = (UTType *)v26;
      id v16 = v25;
      if (ResourceValue_forKey_error)
      {
LABEL_16:
        objc_msgSend_lock(self, v14, v15);
        fileUTType = self->_fileUTType;
        self->_fileUTType = v13;

        objc_msgSend_unlock(self, v23, v24);
        goto LABEL_17;
      }
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v17 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = v6;
        __int16 v29 = 2114;
        id v30 = v16;
        _os_log_error_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_ERROR, "Failed to get UTTYpe resource from URL: '%{public}@', error:  '%{public}@'. Trying to use the file extension to get UTType.", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = 0;
      id v16 = 0;
    }
    id v18 = objc_msgSend_pathExtension(v6, v9, v10);
    uint64_t v20 = objc_msgSend_typeWithFilenameExtension_(MEMORY[0x1E4F442D8], v19, (uint64_t)v18);

    if (!v20)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v21 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v18;
        _os_log_error_impl(&dword_1DC60F000, v21, OS_LOG_TYPE_ERROR, "Failed to get UTTYpe from file extension: '%@'.", buf, 0xCu);
      }
    }

    uint64_t v13 = (UTType *)v20;
    goto LABEL_16;
  }
LABEL_17:
}

- (NSURL)URL
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_URL;
  objc_msgSend_unlock(self, v5, v6);
  if (CurrentProcessBundleIdentiferMatches(@"com.apple.schoolwork.ClassKitApp"))
  {
    int64_t type = self->_type;
    if ((type | 2) == 3 && self->_schoolworkSyncStatus == 2)
    {
      if (type != 3)
      {
        if (type != 1) {
          goto LABEL_12;
        }
LABEL_10:
        if (objc_msgSend_isValidFileURL_isThumbnail_(self, v7, (uint64_t)v4, 0)) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      uint64_t v10 = objc_msgSend_fileUTType(self, v7, v8);
      int v12 = objc_msgSend_conformsToType_(v10, v11, *MEMORY[0x1E4F44338]);

      if (!v12) {
        goto LABEL_10;
      }
      if ((objc_msgSend_isValidStreamingURL_(self, v7, (uint64_t)v4) & 1) == 0)
      {
LABEL_11:

        id v4 = 0;
      }
    }
  }
LABEL_12:

  return v4;
}

- (void)setURL:(id)a3
{
  id v35 = a3;
  objc_msgSend_lock(self, v6, v7);
  p_URL = (void **)&self->_URL;
  uint64_t v13 = objc_msgSend_path(self->_URL, v9, v10);
  if (!v13)
  {
    v3 = objc_msgSend_path(v35, v11, v12);
    if (!v3) {
      goto LABEL_22;
    }
  }
  uint64_t v14 = objc_msgSend_path(*p_URL, v11, v12);
  if (!v14)
  {
LABEL_9:
    if (!v13) {

    }
    goto LABEL_12;
  }
  uint64_t v17 = (void *)v14;
  uint64_t v18 = objc_msgSend_path(v35, v15, v16);
  if (!v18)
  {

    goto LABEL_9;
  }
  uint64_t v21 = (void *)v18;
  uint64_t v22 = objc_msgSend_path(*p_URL, v19, v20);
  id v25 = objc_msgSend_path(v35, v23, v24);
  char isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

  if (v13)
  {

    if (isEqualToString) {
      goto LABEL_22;
    }
LABEL_12:
    if (*p_URL && self->_URLIsSecurityScoped && (CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0() & 1) == 0)
    {
      objc_msgSend_stopAccessingSecurityScopedResource(*p_URL, v28, v29);
      self->_URLIsSecurityScoped = 0;
    }
    objc_storeStrong((id *)&self->_URL, a3);
    if (*p_URL)
    {
      char v31 = CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0();
      uint64_t v32 = *p_URL;
      if ((v31 & 1) == 0)
      {
        self->_URLIsSecurityScoped = objc_msgSend_startAccessingSecurityScopedResource(*p_URL, v30, (uint64_t)v32);
        objc_msgSend_setFileSizeInBytesFromURL_(self, v33, (uint64_t)*p_URL);
LABEL_21:
        objc_msgSend_setFileUTTypeFromURL_(self, v34, (uint64_t)*p_URL);
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
    objc_msgSend_setFileSizeInBytesFromURL_(self, v30, (uint64_t)v32);
    goto LABEL_21;
  }

  if ((isEqualToString & 1) == 0) {
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend_unlock(self, v11, v12);
}

- (NSURL)thumbnailURL
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_thumbnailURL;
  objc_msgSend_unlock(self, v5, v6);
  if (CurrentProcessBundleIdentiferMatches(@"com.apple.schoolwork.ClassKitApp")
    && (objc_msgSend_isValidFileURL_isThumbnail_(self, v7, (uint64_t)v4, 1) & 1) == 0)
  {

    id v4 = 0;
  }

  return v4;
}

- (void)setThumbnailURL:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  if (objc_msgSend_isFileURL(v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_pathExtension(v9, v10, v11);
    if (v13)
    {
      v3 = objc_msgSend_typeWithFilenameExtension_(MEMORY[0x1E4F442D8], v12, (uint64_t)v13);
      int v15 = objc_msgSend_conformsToType_(v3, v14, *MEMORY[0x1E4F44410]);
    }
    else
    {
      int v15 = 0;
    }
    objc_msgSend_sizeOfImageAtURL_(CLSImageUtils, v12, (uint64_t)v9);
    double v17 = v16;
    double v19 = v18;

    if (v15)
    {
      if (v17 <= 1024.0 && v19 <= 1024.0)
      {
LABEL_11:
        objc_msgSend_lock(self, v7, v8);
        p_thumbnailURL = (void **)&self->_thumbnailURL;
        id v26 = objc_msgSend_path(self->_thumbnailURL, v22, v23);
        if (!v26)
        {
          v3 = objc_msgSend_path(v9, v24, v25);
          if (!v3) {
            goto LABEL_27;
          }
        }
        uint64_t v27 = objc_msgSend_path(*p_thumbnailURL, v24, v25);
        if (v27)
        {
          id v30 = (void *)v27;
          uint64_t v31 = objc_msgSend_path(v9, v28, v29);
          if (v31)
          {
            v34 = (void *)v31;
            v42 = v3;
            id v35 = objc_msgSend_path(*p_thumbnailURL, v32, v33);
            int v38 = objc_msgSend_path(v9, v36, v37);
            char isEqualToString = objc_msgSend_isEqualToString_(v35, v39, (uint64_t)v38);

            if (v26)
            {

              if (isEqualToString) {
                goto LABEL_27;
              }
            }
            else
            {

              if (isEqualToString) {
                goto LABEL_27;
              }
            }
LABEL_26:
            objc_storeStrong((id *)&self->_thumbnailURL, a3);
LABEL_27:
            objc_msgSend_unlock(self, v24, v25);
            goto LABEL_28;
          }
        }
        if (!v26) {

        }
        goto LABEL_26;
      }
    }
  }
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v41 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = v9;
    _os_log_error_impl(&dword_1DC60F000, v41, OS_LOG_TYPE_ERROR, "Failed to set thumbnailURL since the supplied thumbnail is either not a JPEG or at least one of its dimensions is > 1024. thumbnailURL: %@", buf, 0xCu);
  }
LABEL_28:
}

- (void)mergeWithObject:(id)a3
{
  v35[12] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  v33.receiver = self;
  v33.super_class = (Class)CLSAbstractAsset;
  [(CLSObject *)&v33 mergeWithObject:v4];
  v35[0] = @"ownerPersonID";
  v35[1] = @"brItemID";
  v35[2] = @"brZoneName";
  v35[3] = @"brOwnerName";
  v35[4] = @"brShareName";
  v35[5] = @"ubiquitousContainerName";
  v35[6] = @"relativePathWithinContainer";
  v35[7] = @"parentObjectID";
  v35[8] = @"schoolworkSyncStatus";
  v35[9] = @"downloaded";
  v35[10] = @"fractionDownloaded";
  v35[11] = @"displayOrder";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v35, 12);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, v34, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v29);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v29, v34, 16);
    }
    while (v10);
  }

  id v16 = v4[15];
  id v17 = v4[14];
  double v19 = objc_msgSend_valueForKey_(v4, v18, @"urlExpirationDate");
  objc_msgSend_lock(self, v20, v21);
  uint64_t v22 = self->_thumbnailURL;
  uint64_t v23 = self->_URL;
  objc_msgSend_unlock(self, v24, v25);
  if (v19)
  {
    urlExpirationDate = self->_urlExpirationDate;
    if (!urlExpirationDate || objc_msgSend_compare_(v19, v26, (uint64_t)urlExpirationDate) == 1)
    {
      objc_storeStrong((id *)&self->_urlExpirationDate, v19);
      objc_msgSend_setURL_(self, v28, (uint64_t)v17);
    }
  }
  if (!v23 && v17) {
    objc_msgSend_setURL_(self, v26, (uint64_t)v17);
  }
  if (!v22 && v16) {
    objc_msgSend_setThumbnailURL_(self, v26, (uint64_t)v16);
  }
}

- (NSString)filenameExtension
{
  v3 = objc_msgSend_fileUTType(self, a2, v2);
  id v6 = objc_msgSend_preferredFilenameExtension(v3, v4, v5);

  return (NSString *)v6;
}

- (UTType)fileUTType
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_fileUTType;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setFileUTType:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  id v12 = v5;
  if ((objc_msgSend_isEqual_(self->_fileUTType, v8, (uint64_t)v12) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileUTType, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, v9, v10);
}

- (int64_t)schoolworkSyncStatus
{
  objc_msgSend_lock(self, a2, v2);
  int64_t schoolworkSyncStatus = self->_schoolworkSyncStatus;
  objc_msgSend_unlock(self, v5, v6);
  if (schoolworkSyncStatus == 4)
  {
    if (CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0()) {
      return 4;
    }
    else {
      return 3;
    }
  }
  return schoolworkSyncStatus;
}

- (void)setSchoolworkSyncStatus:(int64_t)a3
{
  objc_msgSend_lock(self, a2, a3);
  if (self->_schoolworkSyncStatus != a3)
  {
    self->_int64_t schoolworkSyncStatus = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)isDownloaded
{
  objc_msgSend_lock(self, a2, v2);
  BOOL downloaded = self->_downloaded;
  objc_msgSend_unlock(self, v5, v6);
  return downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_downloaded != v3)
  {
    self->_BOOL downloaded = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)title
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v8 = (uint64_t)v5;
  title = self->_title;
  id v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);
}

- (int64_t)displayOrder
{
  objc_msgSend_lock(self, a2, v2);
  int64_t displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_int64_t displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLSAbstractAsset;
  return [(CLSObject *)&v4 validateObject:a3];
}

- (void)addDownloadObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1DC60F000, v7, OS_LOG_TYPE_DEFAULT, "adding download observer: %@", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend_addObject_(self->_downloadObservers, v8, (uint64_t)v4);
  objc_msgSend_unlock(self, v9, v10);
  if (objc_msgSend_devModeOn(self, v11, v12))
  {
    objc_msgSend_setDownloaded_(self, v13, 1);
    objc_msgSend_queued_notifyDownloadCompletion(self, v14, v15);
  }
}

- (void)removeDownloadObserver:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1DC60F000, v7, OS_LOG_TYPE_DEFAULT, "removing download observer: %@", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend_removeObject_(self->_downloadObservers, v8, (uint64_t)v4);
  objc_msgSend_unlock(self, v9, v10);
}

- (id)downloadObservers
{
  objc_msgSend_lock(self, a2, v2);
  uint64_t v6 = objc_msgSend_copy(self->_downloadObservers, v4, v5);
  objc_msgSend_unlock(self, v7, v8);

  return v6;
}

- (void)queued_notifyDownloadProgressFraction:(double)a3
{
  uint64_t v5 = objc_msgSend_downloadObservers(self, a2, v3, a3);
  if (objc_msgSend_count(v5, v6, v7))
  {
    objc_initWeak(&location, self);
    uint64_t v8 = sub_1DC61C944();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC61C998;
    block[3] = &unk_1E6C95B30;
    objc_copyWeak(&v11, &location);
    id v10 = v5;
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)queued_notifyDownloadCompletion
{
  id v4 = objc_msgSend_downloadObservers(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_initWeak(&location, self);
    uint64_t v7 = sub_1DC61C944();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC61CC30;
    block[3] = &unk_1E6C95B30;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)becomeChildOf:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  if ((objc_msgSend_isSubclassOfClass_(v6, v8, v7) & 1) != 0
    || (uint64_t v11 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v12, v11) & 1) != 0))
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v33 = objc_opt_class();
    if ((objc_msgSend_isSubclassOfClass_(v6, v34, v33) & 1) != 0
      || (uint64_t v35 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v36, v35) & 1) != 0))
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v56 = objc_opt_class();
      if ((objc_msgSend_isSubclassOfClass_(v6, v57, v56) & 1) != 0
        || (uint64_t v58 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v59, v58) & 1) != 0))
      {
        uint64_t v13 = 3;
      }
      else
      {
        uint64_t v60 = objc_opt_class();
        if (objc_msgSend_isSubclassOfClass_(v6, v61, v60))
        {
          uint64_t v13 = 4;
        }
        else
        {
          uint64_t v62 = objc_opt_class();
          if ((objc_msgSend_isSubclassOfClass_(v6, v63, v62) & 1) != 0
            || (uint64_t v64 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v65, v64) & 1) != 0))
          {
            uint64_t v13 = 5;
          }
          else
          {
            uint64_t v66 = objc_opt_class();
            if (objc_msgSend_isSubclassOfClass_(v6, v67, v66))
            {
              uint64_t v13 = 6;
            }
            else
            {
              if (qword_1EB5D4D10 != -1) {
                dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
              }
              v68 = CLSLogMultimedia;
              if (os_log_type_enabled((os_log_t)CLSLogMultimedia, OS_LOG_TYPE_ERROR))
              {
                int v69 = 138543618;
                uint64_t v70 = self;
                __int16 v71 = 2114;
                id v72 = v5;
                _os_log_error_impl(&dword_1DC60F000, v68, OS_LOG_TYPE_ERROR, "Asset '%{public}@' cannot be added to %{public}@", (uint8_t *)&v69, 0x16u);
              }
              uint64_t v13 = 0;
            }
          }
        }
      }
    }
  }
  if (objc_msgSend_type(self, v9, v10) == 3)
  {
    id v17 = objc_msgSend_parentObjectID(self, v14, v15);
    if (v17 || (objc_msgSend_objectID(v5, v14, v16), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v18 = objc_msgSend_parentObjectID(self, v14, v16);
      if (v18)
      {
        uint64_t v21 = (void *)v18;
        uint64_t v22 = objc_msgSend_objectID(v5, v19, v20);
        if (v22)
        {
          uint64_t v25 = (void *)v22;
          id v26 = objc_msgSend_parentObjectID(self, v23, v24);
          long long v29 = objc_msgSend_objectID(v5, v27, v28);
          char isEqualToString = objc_msgSend_isEqualToString_(v26, v30, (uint64_t)v29);

          if (v17)
          {

            if (isEqualToString) {
              goto LABEL_20;
            }
          }
          else
          {

            if (isEqualToString) {
              goto LABEL_20;
            }
          }
          goto LABEL_19;
        }
      }
      if (!v17) {

      }
LABEL_19:
      objc_msgSend_removeFromParentWithoutDeleting(self, v14, v32);
    }
  }
LABEL_20:
  objc_msgSend_addChild_changedPropertyName_(v5, v14, (uint64_t)self, @"assets");
  uint64_t v41 = objc_msgSend_parentObjectID(self, v37, v38);
  if (!v41)
  {
    uint64_t v3 = objc_msgSend_objectID(v5, v39, v40);
    if (!v3) {
      goto LABEL_33;
    }
  }
  uint64_t v42 = objc_msgSend_parentObjectID(self, v39, v40);
  if (!v42)
  {
    if (v41)
    {
LABEL_29:

      goto LABEL_34;
    }
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v45 = (void *)v42;
  uint64_t v46 = objc_msgSend_objectID(v5, v43, v44);
  if (!v46)
  {

    if (v41) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v49 = (void *)v46;
  v50 = objc_msgSend_parentObjectID(self, v47, v48);
  uint64_t v53 = objc_msgSend_objectID(v5, v51, v52);
  int v55 = objc_msgSend_isEqualToString_(v50, v54, (uint64_t)v53);

  if (v41)
  {

    if (!v55) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  if (v55) {
LABEL_33:
  }
    objc_msgSend_setParentEntityType_(self, v39, v13);
LABEL_34:
}

- (Class)parentEntityClass
{
  if ((unint64_t)(objc_msgSend_parentEntityType(self, a2, v2) - 1) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (id)filenameForCKContentStoreCache
{
  id v4 = objc_msgSend_originalFilename(self, a2, v2);
  uint64_t v7 = objc_msgSend_pathExtension(v4, v5, v6);

  if (!v7)
  {
    uint64_t v10 = objc_msgSend_fileUTType(self, v8, v9);
    uint64_t v7 = objc_msgSend_preferredFilenameExtension(v10, v11, v12);
  }
  uint64_t v13 = NSString;
  uint64_t v14 = objc_msgSend_objectID(self, v8, v9);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v13, v15, @"file_%@.%@", v14, v7);

  return v16;
}

- (id)thumbnailFilenameForCKContentStoreCache
{
  id v4 = objc_msgSend_preferredFilenameExtension((void *)*MEMORY[0x1E4F44410], a2, v2);
  id v5 = NSString;
  uint64_t v8 = objc_msgSend_objectID(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v9, @"thumb_%@.%@", v8, v4);

  return v10;
}

- (BOOL)hasNotBeenRereferencedByServer
{
  uint64_t v3 = objc_msgSend_brZoneName(self, a2, v2);
  char hasSuffix = objc_msgSend_hasSuffix_(v3, v4, @"_Asset");

  return hasSuffix;
}

- (void)urlSuitableForOpeningWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v7 = objc_msgSend_type(self, v5, v6);
  switch(v7)
  {
    case 3:
      objc_msgSend_cloudKitAssetUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
      break;
    case 2:
      uint64_t v10 = objc_msgSend_URL(self, v8, v9);
      v4[2](v4, v10, 0);

      break;
    case 1:
      objc_msgSend_driveAssetUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
      break;
    default:
      qos_class_t v11 = qos_class_self();
      uint64_t v12 = dispatch_get_global_queue(v11, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1DC61D500;
      block[3] = &unk_1E6C95B58;
      uint64_t v14 = v4;
      dispatch_async(v12, block);

      break;
  }
}

- (void)driveAssetUrlSuitableForOpeningWithCompletion:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1DC61DA14;
  v49[3] = &unk_1E6C95BA8;
  v49[4] = self;
  id v5 = v4;
  id v50 = v5;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1E01A05F0](v49);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = sub_1DC61DC18;
  v48[3] = &unk_1E6C95BD0;
  v48[4] = self;
  uint64_t v9 = (void *)MEMORY[0x1E01A05F0](v48);
  if (self->_type == 1)
  {
    objc_msgSend_lock(self, v7, v8);
    uint64_t v10 = self->_URL;
    objc_msgSend_unlock(self, v11, v12);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v13, (uint64_t)v10, 0))
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v14 = (void *)CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v14;
        double v19 = objc_msgSend_objectID(self, v17, v18);
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v19;
        _os_log_impl(&dword_1DC60F000, v16, OS_LOG_TYPE_DEFAULT, "driveAssetUrlSuitableForOpeningWithCompletion, file exists on device, returning cached url for iCloudDrive asset: %@", buf, 0xCu);
      }
      objc_msgSend_setDownloaded_(self, v15, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v20, 1, 0);
      ((void (**)(void, NSURL *, void))v6)[2](v6, v10, 0);
    }
    else
    {
      unsigned __int8 v21 = atomic_exchange(&self->_URLRequested._Value, 1u);
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v22 = (void *)CLSLogAsset;
      if (v21)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          uint64_t v41 = v22;
          uint64_t v44 = objc_msgSend_objectID(self, v42, v43);
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v44;
          _os_log_impl(&dword_1DC60F000, v41, OS_LOG_TYPE_INFO, "There is a pending request to look up url for iCloudDrive asset '%@'. Will complete the request when the pending request completes.", buf, 0xCu);
        }
        objc_msgSend_addToPendingURLCompletions_(self, v40, (uint64_t)v5);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = v22;
          uint64_t v28 = objc_msgSend_objectID(self, v26, v27);
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v28;
          _os_log_impl(&dword_1DC60F000, v25, OS_LOG_TYPE_DEFAULT, "looking up url for iCloudDrive asset: %@", buf, 0xCu);
        }
        long long v29 = objc_msgSend_brItemID(self, v23, v24);
        v34 = objc_msgSend_dataStore(self, v30, v31);
        if (!v34)
        {
          v34 = objc_msgSend_shared(CLSDataStore, v32, v33);
        }
        uint64_t v35 = objc_msgSend_brOwnerName(self, v32, v33);
        uint64_t v38 = objc_msgSend_brZoneName(self, v36, v37);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = sub_1DC61DEB4;
        v45[3] = &unk_1E6C95BF8;
        v45[4] = self;
        uint64_t v46 = v6;
        id v47 = v9;
        objc_msgSend_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_(v34, v39, (uint64_t)v10, v29, v35, v38, v45);
      }
    }
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E4F28C58], v7, 2, @"driveAssetUrlSuitableForOpeningWithCompletion called for an asset type != CLSAssetTypeiCloudDrive");
    uint64_t v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, NSURL *))v6)[2](v6, 0, v10);
  }
}

- (BOOL)isValidFileURL:(id)a3 isThumbnail:(BOOL)a4
{
  id v6 = a3;
  uint64_t v9 = v6;
  if (!v6 || !objc_msgSend_isFileURL(v6, v7, v8))
  {
    LOBYTE(v20) = 0;
    goto LABEL_14;
  }
  int started = objc_msgSend_startAccessingSecurityScopedResource(v9, v10, v11);
  uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v13, v14);
  uint64_t v18 = objc_msgSend_path(v9, v16, v17);
  int v20 = objc_msgSend_fileExistsAtPath_(v15, v19, (uint64_t)v18);

  if (started) {
    objc_msgSend_stopAccessingSecurityScopedResource(v9, v21, v22);
  }
  if (v20 && !a4 && self->_type == 1)
  {
    uint64_t v23 = objc_msgSend_br_itemID(v9, v21, v22);
    uint64_t v25 = v23;
    brItemID = self->_brItemID;
    if (v23)
    {
      if (brItemID && (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)brItemID) & 1) != 0) {
        goto LABEL_12;
      }
    }
    else if (!brItemID)
    {
      goto LABEL_12;
    }
    LOBYTE(v20) = 0;
LABEL_12:
  }
LABEL_14:

  return v20;
}

- (BOOL)isValidStreamingURL:(id)a3
{
  id v6 = a3;
  if (v6 && self->_type == 3)
  {
    uint64_t v7 = objc_msgSend_urlExpirationDate(self, v4, v5);
    uint64_t v10 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9);
    BOOL v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10) == 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)pendingURLCompletions
{
  objc_msgSend_lock(self, a2, v2);
  id v6 = objc_msgSend_copy(self->_pendingURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);

  return v6;
}

- (void)addToPendingURLCompletions:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingURLCompletions = self->_pendingURLCompletions;
  uint64_t v8 = (void *)MEMORY[0x1E01A05F0](v4);

  objc_msgSend_addObject_(pendingURLCompletions, v9, (uint64_t)v8);

  objc_msgSend_unlock(self, v10, v11);
}

- (id)pendingStreamingURLCompletions
{
  objc_msgSend_lock(self, a2, v2);
  uint64_t v6 = objc_msgSend_copy(self->_pendingStreamingURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingStreamingURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);

  return v6;
}

- (void)addToPendingStreamingURLCompletions:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingStreamingURLCompletions = self->_pendingStreamingURLCompletions;
  uint64_t v8 = (void *)MEMORY[0x1E01A05F0](v4);

  objc_msgSend_addObject_(pendingStreamingURLCompletions, v9, (uint64_t)v8);

  objc_msgSend_unlock(self, v10, v11);
}

- (id)pendingThumbnailURLCompletions
{
  objc_msgSend_lock(self, a2, v2);
  uint64_t v6 = objc_msgSend_copy(self->_pendingThumbnailURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingThumbnailURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);

  return v6;
}

- (void)addToPendingThumbnailURLCompletions:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingThumbnailURLCompletions = self->_pendingThumbnailURLCompletions;
  uint64_t v8 = (void *)MEMORY[0x1E01A05F0](v4);

  objc_msgSend_addObject_(pendingThumbnailURLCompletions, v9, (uint64_t)v8);

  objc_msgSend_unlock(self, v10, v11);
}

- (void)cloudKitAssetUrlSuitableForOpeningWithCompletion:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1DC61E9BC;
  v41[3] = &unk_1E6C95BA8;
  v41[4] = self;
  id v5 = v4;
  id v42 = v5;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1E01A05F0](v41);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1DC61EB98;
  v40[3] = &unk_1E6C95BD0;
  v40[4] = self;
  uint64_t v8 = (void *)MEMORY[0x1E01A05F0](v40);
  if (self->_type == 3)
  {
    if (objc_msgSend_conformsToType_(self->_fileUTType, v7, *MEMORY[0x1E4F44338]))
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v11 = (void *)CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = v11;
        uint64_t v15 = (CLSAbstractAsset *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = v15;
        _os_log_impl(&dword_1DC60F000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: %@", buf, 0xCu);
      }
    }
    objc_msgSend_lock(self, v9, v10);
    uint64_t v16 = self->_URL;
    objc_msgSend_unlock(self, v17, v18);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v19, (uint64_t)v16, 0))
    {
      objc_msgSend_setDownloaded_(self, v20, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v21, 1, 0);
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v22 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = self;
        _os_log_impl(&dword_1DC60F000, v22, OS_LOG_TYPE_DEFAULT, "cloudKitAssetUrlSuitableForOpeningWithCompletion, file exists on device, returning cached url for cloudkit asset: %@", buf, 0xCu);
      }
      ((void (**)(void, NSURL *, void))v6)[2](v6, v16, 0);
    }
    else if (self->_brItemID)
    {
      unsigned __int8 v23 = atomic_exchange(&self->_URLRequested._Value, 1u);
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v24 = CLSLogAsset;
      if (v23)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = v24;
          objc_msgSend_objectID(self, v34, v35);
          int v36 = (CLSAbstractAsset *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v36;
          _os_log_impl(&dword_1DC60F000, v33, OS_LOG_TYPE_INFO, "There is a pending request to look up url for CloudKit asset: '%@'. Will complete the request when the pending request completes", buf, 0xCu);
        }
        objc_msgSend_addToPendingURLCompletions_(self, v32, (uint64_t)v5);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = self;
          _os_log_impl(&dword_1DC60F000, v24, OS_LOG_TYPE_DEFAULT, "looking up url for CloudKit asset: %@", buf, 0xCu);
        }
        long long v29 = objc_msgSend_dataStore(self, v25, v26);
        if (!v29)
        {
          long long v29 = objc_msgSend_shared(CLSDataStore, v27, v28);
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = sub_1DC61EE14;
        v37[3] = &unk_1E6C95BF8;
        v37[4] = self;
        uint64_t v38 = v6;
        id v39 = v8;
        objc_msgSend_cloudKitUrlSuitableForOpeningForAsset_completion_(v29, v30, (uint64_t)self, v37);
      }
    }
    else
    {
      uint64_t v31 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v20, 344, @"CKAsset is not available for this asset.");
      ((void (**)(void, void, void *))v6)[2](v6, 0, v31);
    }
  }
  else
  {
    uint64_t v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, NSURL *))v6)[2](v6, 0, v16);
  }
}

- (void)thumbnailURLSuitableForOpeningWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_type(self, v5, v6) == 3
    && (objc_msgSend_conformsToType_(self->_fileUTType, v7, *MEMORY[0x1E4F44330]) & 1) == 0)
  {
    objc_msgSend_cloudKitThumbnailUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
  }
  else
  {
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = dispatch_get_global_queue(v9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC61EFEC;
    block[3] = &unk_1E6C95B58;
    id v12 = v4;
    dispatch_async(v10, block);
  }
}

- (void)cloudKitThumbnailUrlSuitableForOpeningWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1DC61F4A8;
  v33[3] = &unk_1E6C95BA8;
  v33[4] = self;
  id v5 = v4;
  id v34 = v5;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1E01A05F0](v33);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1DC61F684;
  v32[3] = &unk_1E6C95BD0;
  v32[4] = self;
  qos_class_t v9 = (void *)MEMORY[0x1E01A05F0](v32);
  if (self->_type == 3)
  {
    objc_msgSend_lock(self, v7, v8);
    uint64_t v10 = self->_thumbnailURL;
    objc_msgSend_unlock(self, v11, v12);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v13, (uint64_t)v10, 1))
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v15 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v36 = self;
        _os_log_impl(&dword_1DC60F000, v15, OS_LOG_TYPE_DEFAULT, "cloudKitThumbnailUrlSuitableForOpeningWithCompletion, file exists on device, returning cached thumbnailURL for cloudkit asset: %@", buf, 0xCu);
      }
      objc_msgSend_setDownloaded_(self, v16, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v17, 1, 0);
      ((void (**)(void, NSURL *, void))v6)[2](v6, v10, 0);
    }
    else if (self->_brItemID)
    {
      unsigned __int8 v18 = atomic_exchange(&self->_thumbnailURLRequested._Value, 1u);
      if (qword_1EB5D4D10 != -1)
      {
        unsigned __int8 v28 = v18;
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        unsigned __int8 v18 = v28;
      }
      double v19 = CLSLogAsset;
      if (v18)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v36 = self;
          _os_log_impl(&dword_1DC60F000, v19, OS_LOG_TYPE_INFO, "there is a pending request to look up thumbnailURL for CloudKit asset: '%@'. will complete this request when the pending request completes", buf, 0xCu);
        }
        objc_msgSend_addToPendingThumbnailURLCompletions_(self, v27, (uint64_t)v5);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v36 = self;
          _os_log_impl(&dword_1DC60F000, v19, OS_LOG_TYPE_DEFAULT, "looking up thumbnailURL for CloudKit asset: %@", buf, 0xCu);
        }
        uint64_t v24 = objc_msgSend_dataStore(self, v20, v21);
        if (!v24)
        {
          uint64_t v24 = objc_msgSend_shared(CLSDataStore, v22, v23);
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = sub_1DC61F900;
        v29[3] = &unk_1E6C95BF8;
        v29[4] = self;
        long long v30 = v6;
        id v31 = v9;
        objc_msgSend_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_(v24, v25, (uint64_t)self, v29);
      }
    }
    else
    {
      uint64_t v26 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v14, 344, @"Thumbnail is not available for this asset.");
      ((void (**)(void, void, void *))v6)[2](v6, 0, v26);
    }
  }
  else
  {
    uint64_t v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, NSURL *))v6)[2](v6, 0, v10);
  }
}

- (void)urlSuitableForStreamingWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1DC61FE00;
  v31[3] = &unk_1E6C95BA8;
  v31[4] = self;
  id v5 = v4;
  id v32 = v5;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1E01A05F0](v31);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1DC61FFDC;
  v30[3] = &unk_1E6C95BD0;
  v30[4] = self;
  qos_class_t v9 = (void *)MEMORY[0x1E01A05F0](v30);
  if (self->_type == 3)
  {
    objc_msgSend_lock(self, v7, v8);
    uint64_t v10 = self->_URL;
    objc_msgSend_unlock(self, v11, v12);
    if (objc_msgSend_isValidStreamingURL_(self, v13, (uint64_t)v10))
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v15 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = (CLSAbstractAsset *)v10;
        _os_log_impl(&dword_1DC60F000, v15, OS_LOG_TYPE_DEFAULT, "done getting streaming url for CloudKit asset, returning cached url: %@", buf, 0xCu);
      }
      ((void (**)(void, NSURL *, void))v6)[2](v6, v10, 0);
    }
    else if (self->_brItemID)
    {
      unsigned __int8 v16 = atomic_exchange(&self->_streamingURLRequested._Value, 1u);
      if (qword_1EB5D4D10 != -1)
      {
        unsigned __int8 v26 = v16;
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        unsigned __int8 v16 = v26;
      }
      uint64_t v17 = CLSLogAsset;
      if (v16)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = self;
          _os_log_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_INFO, "there is a pending request to look up streaming url for CloudKit asset: '%@'. will complete the request when the pending request completes", buf, 0xCu);
        }
        objc_msgSend_addToPendingStreamingURLCompletions_(self, v25, (uint64_t)v5);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = self;
          _os_log_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_DEFAULT, "looking up streaming url for CloudKit asset: %@", buf, 0xCu);
        }
        uint64_t v22 = objc_msgSend_dataStore(self, v18, v19);
        if (!v22)
        {
          uint64_t v22 = objc_msgSend_shared(CLSDataStore, v20, v21);
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = sub_1DC620258;
        v27[3] = &unk_1E6C95C20;
        v27[4] = self;
        unsigned __int8 v28 = v6;
        id v29 = v9;
        objc_msgSend_cloudKitUrlSuitableForStreamingAsset_completion_(v22, v23, (uint64_t)self, v27);
      }
    }
    else
    {
      uint64_t v24 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v14, 344, @"Streaming URL is not available for this asset.");
      ((void (**)(void, void, void *))v6)[2](v6, 0, v24);
    }
  }
  else
  {
    uint64_t v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, NSURL *))v6)[2](v6, 0, v10);
  }
}

- (void)clientRemote_invalidate
{
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v2 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_debug_impl(&dword_1DC60F000, v2, OS_LOG_TYPE_DEBUG, "CLSAssetDownloadProgressNotifiable clientRemote_invalidate called", v3, 2u);
  }
}

- (void)clientRemote_downloadProgressFraction:(double)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSError *)a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218242;
    double v16 = a3;
    __int16 v17 = 2112;
    unsigned __int8 v18 = v6;
    _os_log_debug_impl(&dword_1DC60F000, v7, OS_LOG_TYPE_DEBUG, "clientRemote_downloadProgressFraction called: progressFraction = %4.2f, error = %@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend_lock(self, v8, v9);
  downloadError = self->_downloadError;
  self->_downloadError = v6;

  self->_fractionDownloaded = a3;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_queued_notifyDownloadProgressFraction_(self, v13, v14, a3);
}

- (void)clientRemote_downloadCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSError *)a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    __int16 v17 = v6;
    _os_log_debug_impl(&dword_1DC60F000, v7, OS_LOG_TYPE_DEBUG, "clientRemote_downloadCompleted called: completed = %d, error = %@", (uint8_t *)v15, 0x12u);
  }
  objc_msgSend_lock(self, v8, v9);
  downloadError = self->_downloadError;
  self->_downloadError = v6;

  self->_BOOL downloaded = v4;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_queued_notifyDownloadCompletion(self, v13, v14);
}

- (double)fractionDownloaded
{
  return self->_fractionDownloaded;
}

- (void)setFractionDownloaded:(double)a3
{
  self->_fractionDownloaded = a3;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSDate)urlExpirationDate
{
  return self->_urlExpirationDate;
}

- (void)setUrlExpirationDate:(id)a3
{
}

- (BOOL)isOriginal
{
  return self->_original;
}

- (void)setOriginal:(BOOL)a3
{
  self->_original = a3;
}

- (int64_t)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (void)setFileSizeInBytes:(int64_t)a3
{
  self->_fileSizeInBytes = a3;
}

- (void)setFilenameExtension:(id)a3
{
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (int64_t)parentEntityType
{
  return self->_parentEntityType;
}

- (void)setParentEntityType:(int64_t)a3
{
  self->_parentEntityType = a3;
}

- (NSString)brItemID
{
  return self->_brItemID;
}

- (void)setBrItemID:(id)a3
{
}

- (NSString)brOwnerName
{
  return self->_brOwnerName;
}

- (void)setBrOwnerName:(id)a3
{
}

- (NSString)brZoneName
{
  return self->_brZoneName;
}

- (void)setBrZoneName:(id)a3
{
}

- (NSString)brShareName
{
  return self->_brShareName;
}

- (void)setBrShareName:(id)a3
{
}

- (NSString)ubiquitousContainerName
{
  return self->_ubiquitousContainerName;
}

- (void)setUbiquitousContainerName:(id)a3
{
}

- (NSString)relativePathWithinContainer
{
  return self->_relativePathWithinContainer;
}

- (void)setRelativePathWithinContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameExtension, 0);
  objc_storeStrong((id *)&self->_urlExpirationDate, 0);
  objc_storeStrong((id *)&self->_pendingThumbnailURLCompletions, 0);
  objc_storeStrong((id *)&self->_pendingStreamingURLCompletions, 0);
  objc_storeStrong((id *)&self->_pendingURLCompletions, 0);
  objc_storeStrong((id *)&self->_relativePathWithinContainer, 0);
  objc_storeStrong((id *)&self->_ubiquitousContainerName, 0);
  objc_storeStrong((id *)&self->_brShareName, 0);
  objc_storeStrong((id *)&self->_brZoneName, 0);
  objc_storeStrong((id *)&self->_brOwnerName, 0);
  objc_storeStrong((id *)&self->_brItemID, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fileUTType, 0);
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end