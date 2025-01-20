@interface BDSBookWidgetInfo
+ (BOOL)supportsSecureCoding;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8 lastEngagedDate:(id)a9 isTrackedAsRecent:(BOOL)a10;
- (BDSBookWidgetInfo)initWithCoder:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isTrackedAsRecent;
- (NSDate)lastEngagedDate;
- (NSNumber)totalDuration;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)coverURL;
- (NSString)libraryContentAssetType;
- (NSString)pageProgressionDirection;
- (NSString)title;
- (id)description;
- (id)insertMatchingManagedObjectIntoContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setCoverURL:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setLibraryContentAssetType:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDuration:(id)a3;
@end

@implementation BDSBookWidgetInfo

- (BDSBookWidgetInfo)initWithAssetID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSBookWidgetInfo;
  v6 = [(BDSBookWidgetInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetID, a3);
  }

  return v7;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8
{
  id v28 = a4;
  id v27 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v24 = objc_msgSend_initWithAssetID_(self, v18, (uint64_t)a3, v19, v20, v21, v22, v23);
  v25 = (BDSBookWidgetInfo *)v24;
  if (v24)
  {
    objc_storeStrong((id *)(v24 + 48), a4);
    objc_storeStrong((id *)&v25->_coverURL, a5);
    objc_storeStrong((id *)&v25->_pageProgressionDirection, a6);
    objc_storeStrong((id *)&v25->_cloudAssetType, a7);
    objc_storeStrong((id *)&v25->_libraryContentAssetType, a8);
  }

  return v25;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8 lastEngagedDate:(id)a9 isTrackedAsRecent:(BOOL)a10
{
  id v17 = a9;
  uint64_t v19 = objc_msgSend_initWithAssetID_title_coverURL_pageProgressionDirection_cloudAssetType_libraryContentAssetType_(self, v18, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
  uint64_t v20 = (BDSBookWidgetInfo *)v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 72), a9);
    v20->_isTrackedAsRecent = a10;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v134 = a3;
  v11 = objc_msgSend_assetID(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v134, v12, (uint64_t)v11, @"assetID", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_title(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v134, v25, (uint64_t)v24, @"title", v26, v27, v28, v29);

  v37 = objc_msgSend_coverURL(self, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v134, v38, (uint64_t)v37, @"coverURL", v39, v40, v41, v42);

  v50 = objc_msgSend_pageProgressionDirection(self, v43, v44, v45, v46, v47, v48, v49);
  objc_msgSend_encodeObject_forKey_(v134, v51, (uint64_t)v50, @"pageProgressionDirection", v52, v53, v54, v55);

  v63 = objc_msgSend_libraryContentAssetType(self, v56, v57, v58, v59, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v134, v64, (uint64_t)v63, @"libraryContentAssetType", v65, v66, v67, v68);

  v76 = objc_msgSend_cloudAssetType(self, v69, v70, v71, v72, v73, v74, v75);
  objc_msgSend_encodeObject_forKey_(v134, v77, (uint64_t)v76, @"cloudAssetType", v78, v79, v80, v81);

  v89 = objc_msgSend_totalDuration(self, v82, v83, v84, v85, v86, v87, v88);
  objc_msgSend_encodeObject_forKey_(v134, v90, (uint64_t)v89, @"totalDuration", v91, v92, v93, v94);

  v102 = objc_msgSend_lastEngagedDate(self, v95, v96, v97, v98, v99, v100, v101);
  objc_msgSend_encodeObject_forKey_(v134, v103, (uint64_t)v102, @"lastEngagedDate", v104, v105, v106, v107);

  uint64_t isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v108, v109, v110, v111, v112, v113, v114);
  objc_msgSend_encodeBool_forKey_(v134, v116, isTrackedAsRecent, @"isTrackedAsRecent", v117, v118, v119, v120);
  uint64_t isExplicit = objc_msgSend_isExplicit(self, v121, v122, v123, v124, v125, v126, v127);
  objc_msgSend_encodeBool_forKey_(v134, v129, isExplicit, @"isExplicit", v130, v131, v132, v133);
}

- (BDSBookWidgetInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)BDSBookWidgetInfo;
  uint64_t v5 = [(BDSBookWidgetInfo *)&v83 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"assetID", v8, v9, v10, v11);
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"title", v16, v17, v18, v19);
    title = v5->_title;
    v5->_title = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"coverURL", v24, v25, v26, v27);
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"pageProgressionDirection", v32, v33, v34, v35);
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"libraryContentAssetType", v40, v41, v42, v43);
    libraryContentAssetType = v5->_libraryContentAssetType;
    v5->_libraryContentAssetType = (NSString *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"cloudAssetType", v48, v49, v50, v51);
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"totalDuration", v56, v57, v58, v59);
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v60;

    uint64_t v62 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"lastEngagedDate", v64, v65, v66, v67);
    lastEngagedDate = v5->_lastEngagedDate;
    v5->_lastEngagedDate = (NSDate *)v68;

    v5->_uint64_t isTrackedAsRecent = objc_msgSend_decodeBoolForKey_(v4, v70, @"isTrackedAsRecent", v71, v72, v73, v74, v75);
    v5->_uint64_t isExplicit = objc_msgSend_decodeBoolForKey_(v4, v76, @"isExplicit", v77, v78, v79, v80, v81);
  }

  return v5;
}

- (id)description
{
  uint64_t v101 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v100 = NSStringFromClass(v3);
  uint64_t v99 = objc_msgSend_assetID(self, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v98 = objc_msgSend_title(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_cloudAssetType(self, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v33 = objc_msgSend_lastEngagedDate(self, v26, v27, v28, v29, v30, v31, v32);
  unsigned int isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v34, v35, v36, v37, v38, v39, v40);
  uint64_t v49 = objc_msgSend_coverURL(self, v42, v43, v44, v45, v46, v47, v48);
  uint64_t v50 = NSNumber;
  uint64_t isExplicit = objc_msgSend_isExplicit(self, v51, v52, v53, v54, v55, v56, v57);
  uint64_t v65 = objc_msgSend_numberWithBool_(v50, v59, isExplicit, v60, v61, v62, v63, v64);
  uint64_t v73 = objc_msgSend_pageProgressionDirection(self, v66, v67, v68, v69, v70, v71, v72);
  uint64_t v81 = objc_msgSend_libraryContentAssetType(self, v74, v75, v76, v77, v78, v79, v80);
  v89 = objc_msgSend_totalDuration(self, v82, v83, v84, v85, v86, v87, v88);
  objc_msgSend_stringWithFormat_(v101, v90, @"<%@:%p assetID=%@ title=%@ cloudAssetType=%@ lastEngagedDate=%@ isTrackedAsRecent=%d coverURL=%@ isExplicit=%@ pageProgressionDirection=%@ libraryContentAssetType=%@ duration=%@>", v91, v92, v93, v94, v95, v100, self, v99, v98, v25, v33, isTrackedAsRecent, v49, v65, v73, v81,
  uint64_t v96 = v89);

  return v96;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (NSString)libraryContentAssetType
{
  return self->_libraryContentAssetType;
}

- (void)setLibraryContentAssetType:(id)a3
{
}

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)pageProgressionDirection
{
  return self->_pageProgressionDirection;
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (NSNumber)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(id)a3
{
}

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_uint64_t isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_libraryContentAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

- (id)insertMatchingManagedObjectIntoContext:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_2360ED434;
  uint64_t v21 = sub_2360ED444;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2360ED44C;
  v14[3] = &unk_264CA1088;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  uint64_t v16 = &v17;
  objc_msgSend_performBlockAndWait_(v5, v6, (uint64_t)v14, v7, v8, v9, v10, v11);
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

@end