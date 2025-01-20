@interface BDSBookWidgetData
+ (BOOL)supportsSecureCoding;
- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 cloudAssetType:(id)a8 libraryAssetType:(id)a9;
- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 totalDuration:(id)a8 cloudAssetType:(id)a9 libraryAssetType:(id)a10;
- (BDSBookWidgetData)initWithCoder:(id)a3;
- (BOOL)hasSignificantDifferenceWith:(id)a3;
- (NSNumber)readingProgress;
- (NSNumber)totalDuration;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)coverURL;
- (NSString)libraryAssetType;
- (NSString)pageProgressionDirection;
- (NSString)title;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setCoverURL:(id)a3;
- (void)setLibraryAssetType:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setReadingProgress:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDuration:(id)a3;
@end

@implementation BDSBookWidgetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 totalDuration:(id)a8 cloudAssetType:(id)a9 libraryAssetType:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v17 = a9;
  v18 = (__CFString *)a10;
  v29.receiver = self;
  v29.super_class = (Class)BDSBookWidgetData;
  v19 = [(BDSBookWidgetData *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetID, a3);
    objc_storeStrong((id *)&v20->_title, a4);
    objc_storeStrong((id *)&v20->_pageProgressionDirection, a5);
    objc_storeStrong((id *)&v20->_coverURL, a6);
    objc_storeStrong((id *)&v20->_readingProgress, a7);
    objc_storeStrong((id *)&v20->_totalDuration, a8);
    objc_storeStrong((id *)&v20->_cloudAssetType, a9);
    if (v18) {
      v21 = v18;
    }
    else {
      v21 = @"LibraryContentAssetTypeUnknown";
    }
    objc_storeStrong((id *)&v20->_libraryAssetType, v21);
  }

  return v20;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 cloudAssetType:(id)a8 libraryAssetType:(id)a9
{
  return (BDSBookWidgetData *)objc_msgSend_initWithAssetID_title_pageProgressionDirection_coverURL_readingProgress_totalDuration_cloudAssetType_libraryAssetType_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8, a9);
}

- (BDSBookWidgetData)initWithCoder:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BDSBookWidgetData;
  v5 = [(BDSBookWidgetData *)&v71 init];
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
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"pageProgressionDirection", v24, v25, v26, v27);
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"coverURL", v32, v33, v34, v35);
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"readingProgress", v40, v41, v42, v43);
    readingProgress = v5->_readingProgress;
    v5->_readingProgress = (NSNumber *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"totalDuration", v48, v49, v50, v51);
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"cloudAssetType", v56, v57, v58, v59);
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v60;

    uint64_t v62 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"libraryContentAssetType", v64, v65, v66, v67);
    libraryAssetType = v5->_libraryAssetType;
    v5->_libraryAssetType = (NSString *)v68;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_assetID(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"assetID", v14, v15, v16, v17);

  uint64_t v25 = objc_msgSend_title(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"title", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_pageProgressionDirection(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"pageProgressionDirection", v40, v41, v42, v43);

  uint64_t v51 = objc_msgSend_coverURL(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, @"coverURL", v53, v54, v55, v56);

  uint64_t v64 = objc_msgSend_readingProgress(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"readingProgress", v66, v67, v68, v69);

  v77 = objc_msgSend_totalDuration(self, v70, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"totalDuration", v79, v80, v81, v82);

  v90 = objc_msgSend_cloudAssetType(self, v83, v84, v85, v86, v87, v88, v89);
  objc_msgSend_encodeObject_forKey_(v4, v91, (uint64_t)v90, @"cloudAssetType", v92, v93, v94, v95);

  objc_msgSend_libraryAssetType(self, v96, v97, v98, v99, v100, v101, v102);
  id v108 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v103, (uint64_t)v108, @"libraryContentAssetType", v104, v105, v106, v107);
}

- (BOOL)hasSignificantDifferenceWith:(id)a3
{
  uint64_t v202 = *MEMORY[0x263EF8340];
  id v4 = (BDSBookWidgetData *)a3;
  uint64_t v12 = v4;
  if (v4)
  {
    if (v4 == self) {
      goto LABEL_59;
    }
    v13 = objc_msgSend_assetID(self, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v21 = objc_msgSend_assetID(v12, v14, v15, v16, v17, v18, v19, v20);
    id v22 = v13;
    id v23 = v21;
    uint64_t v30 = v23;
    if (v22 == v23)
    {
    }
    else
    {
      id v31 = v22;
      if (!v23)
      {
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
      int isEqualToString = objc_msgSend_isEqualToString_(v22, v24, (uint64_t)v23, v25, v26, v27, v28, v29);

      if (!isEqualToString) {
        goto LABEL_43;
      }
    }
    uint64_t v41 = objc_msgSend_readingProgress(self, v33, v34, v35, v36, v37, v38, v39);
    uint64_t v49 = objc_msgSend_readingProgress(v12, v42, v43, v44, v45, v46, v47, v48);
    id v31 = v41;
    id v50 = v49;
    uint64_t v57 = v50;
    if (v31 == v50)
    {
    }
    else
    {
      id v58 = v31;
      if (!v50)
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      int isEqualToNumber = objc_msgSend_isEqualToNumber_(v31, v51, (uint64_t)v50, v52, v53, v54, v55, v56);

      if (!isEqualToNumber) {
        goto LABEL_41;
      }
    }
    uint64_t v67 = objc_msgSend_totalDuration(self, v60, v61, v62, v63, v64, v65, v66);
    uint64_t v75 = objc_msgSend_totalDuration(v12, v68, v69, v70, v71, v72, v73, v74);
    id v58 = v67;
    id v76 = v75;
    v83 = v76;
    if (v58 == v76)
    {
    }
    else
    {
      id v84 = v58;
      if (!v76)
      {
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      int v85 = objc_msgSend_isEqualToNumber_(v58, v77, (uint64_t)v76, v78, v79, v80, v81, v82);

      if (!v85) {
        goto LABEL_39;
      }
    }
    uint64_t v93 = objc_msgSend_title(self, v86, v87, v88, v89, v90, v91, v92);
    uint64_t v101 = objc_msgSend_title(v12, v94, v95, v96, v97, v98, v99, v100);
    id v84 = v93;
    id v102 = v101;
    v197 = v102;
    if (v84 == v102)
    {
    }
    else
    {
      id v109 = v84;
      if (!v102)
      {
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      int v195 = objc_msgSend_isEqualToString_(v84, v103, (uint64_t)v102, v104, v105, v106, v107, v108);

      if (!v195) {
        goto LABEL_37;
      }
    }
    v196 = v83;
    v117 = objc_msgSend_coverURL(self, v110, v111, v112, v113, v114, v115, v116);
    v125 = objc_msgSend_coverURL(v12, v118, v119, v120, v121, v122, v123, v124);
    id v109 = v117;
    id v126 = v125;
    v194 = v126;
    if (v109 == v126)
    {
    }
    else
    {
      v133 = v126;
      if (!v126)
      {

LABEL_35:
        v83 = v196;
        goto LABEL_36;
      }
      int v192 = objc_msgSend_isEqualToString_(v109, v127, (uint64_t)v126, v128, v129, v130, v131, v132);

      if (!v192) {
        goto LABEL_35;
      }
    }
    id v190 = v109;
    v141 = objc_msgSend_cloudAssetType(self, v134, v135, v136, v137, v138, v139, v140);
    v149 = objc_msgSend_cloudAssetType(v12, v142, v143, v144, v145, v146, v147, v148);
    id v150 = v141;
    id v151 = v149;
    v191 = v151;
    v193 = v150;
    if (v150 == v151)
    {
    }
    else
    {
      v158 = v151;
      if (!v151)
      {
        char v189 = 1;
LABEL_57:
        v167 = v190;

        char v166 = v189;
LABEL_58:

        if (v166)
        {
LABEL_44:
          uint64_t v40 = BDSWidgetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v199 = v12;
            __int16 v200 = 2112;
            v201 = self;
            goto LABEL_46;
          }
          goto LABEL_47;
        }
LABEL_59:
        BOOL v168 = 0;
        goto LABEL_60;
      }
      int v188 = objc_msgSend_isEqualToString_(v150, v152, (uint64_t)v151, v153, v154, v155, v156, v157);

      if (!v188)
      {
        char v166 = 1;
        v167 = v190;
        goto LABEL_58;
      }
    }
    v169 = objc_msgSend_libraryAssetType(self, v159, v160, v161, v162, v163, v164, v165);
    v177 = objc_msgSend_libraryAssetType(v12, v170, v171, v172, v173, v174, v175, v176);
    id v150 = v169;
    id v178 = v177;
    v185 = v178;
    if (v150 == v178)
    {
      char v189 = 0;
    }
    else
    {
      if (v178) {
        int v186 = objc_msgSend_isEqualToString_(v150, v179, (uint64_t)v178, v180, v181, v182, v183, v184) ^ 1;
      }
      else {
        LOBYTE(v186) = 1;
      }
      char v189 = v186;
    }

    goto LABEL_57;
  }
  uint64_t v40 = BDSWidgetLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v199 = 0;
    __int16 v200 = 2112;
    v201 = self;
LABEL_46:
    _os_log_impl(&dword_2360BC000, v40, OS_LOG_TYPE_DEFAULT, "Found changes between %@ and %@:", buf, 0x16u);
  }
LABEL_47:

  BOOL v168 = 1;
LABEL_60:

  return v168;
}

- (id)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_title(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_pageProgressionDirection(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v34 = objc_msgSend_cloudAssetType(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v42 = objc_msgSend_libraryAssetType(self, v35, v36, v37, v38, v39, v40, v41);
  id v50 = objc_msgSend_readingProgress(self, v43, v44, v45, v46, v47, v48, v49);
  objc_msgSend_doubleValue(v50, v51, v52, v53, v54, v55, v56, v57);
  double v59 = v58 * 100.0;
  uint64_t v67 = objc_msgSend_totalDuration(self, v60, v61, v62, v63, v64, v65, v66);
  uint64_t v81 = objc_msgSend_coverURL(self, v68, v69, v70, v71, v72, v73, v74);
  uint64_t v82 = &stru_26E976C40;
  if (!v81) {
    uint64_t v82 = @" missing coverURL";
  }
  v83 = objc_msgSend_stringWithFormat_(v9, v75, @"[%@ '%@' %@ %@ %@ (%.0f%%) %@%@]", v76, v77, v78, v79, v80, v10, v18, v26, v34, v42, *(void *)&v59, v67, v82);

  return v83;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
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

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
{
}

- (NSNumber)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (NSString)libraryAssetType
{
  return self->_libraryAssetType;
}

- (void)setLibraryAssetType:(id)a3
{
}

- (NSNumber)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_libraryAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end