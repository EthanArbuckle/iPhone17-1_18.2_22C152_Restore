@interface BCMutableAssetDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableAssetDetail)initWithAssetID:(id)a3;
- (BCMutableAssetDetail)initWithCloudData:(id)a3;
- (BCMutableAssetDetail)initWithCoder:(id)a3;
- (BCMutableAssetDetail)initWithRecord:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isFinished;
- (BOOL)notFinished;
- (NSData)readingPositionUserData;
- (NSDate)dateFinished;
- (NSDate)datePlaybackTimeUpdated;
- (NSDate)lastOpenDate;
- (NSDate)readingPositionLocationUpdateDate;
- (NSString)assetID;
- (NSString)description;
- (NSString)readingPositionAnnotationVersion;
- (NSString)readingPositionAssetVersion;
- (NSString)readingPositionCFIString;
- (NSString)readingPositionStorageUUID;
- (double)bookmarkTime;
- (float)readingProgress;
- (float)readingProgressHighWaterMark;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)readingPositionAbsolutePhysicalLocation;
- (int)readingPositionLocationRangeEnd;
- (int)readingPositionLocationRangeStart;
- (signed)finishedDateKind;
- (signed)taste;
- (signed)tasteSyncedToStore;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setDateFinished:(id)a3;
- (void)setDatePlaybackTimeUpdated:(id)a3;
- (void)setFinishedDateKind:(signed __int16)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setLastOpenDate:(id)a3;
- (void)setNotFinished:(BOOL)a3;
- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3;
- (void)setReadingPositionAnnotationVersion:(id)a3;
- (void)setReadingPositionAssetVersion:(id)a3;
- (void)setReadingPositionCFIString:(id)a3;
- (void)setReadingPositionLocationRangeEnd:(int)a3;
- (void)setReadingPositionLocationRangeStart:(int)a3;
- (void)setReadingPositionLocationUpdateDate:(id)a3;
- (void)setReadingPositionStorageUUID:(id)a3;
- (void)setReadingPositionUserData:(id)a3;
- (void)setReadingProgress:(float)a3;
- (void)setReadingProgressHighWaterMark:(float)a3;
- (void)setTaste:(signed __int16)a3;
- (void)setTasteSyncedToStore:(signed __int16)a3;
@end

@implementation BCMutableAssetDetail

- (BCMutableAssetDetail)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361FCA4C();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableAssetDetail;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableAssetDetail *)*((void *)v12 + 12);
    *((void *)v12 + 12) = v13;
LABEL_7:
  }
  return (BCMutableAssetDetail *)v12;
}

- (BCMutableAssetDetail)initWithCloudData:(id)a3
{
  id v4 = a3;
  v260.receiver = self;
  v260.super_class = (Class)BCMutableAssetDetail;
  v5 = [(BCMutableCloudData *)&v260 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_assetID(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      assetID = v5->_assetID;
      v5->_assetID = (NSString *)v23;

      v5->_isFinished = objc_msgSend_isFinished(v14, v25, v26, v27, v28, v29, v30, v31);
      v5->_notFinished = objc_msgSend_notFinished(v14, v32, v33, v34, v35, v36, v37, v38);
      v5->_taste = objc_msgSend_taste(v14, v39, v40, v41, v42, v43, v44, v45);
      v5->_tasteSyncedToStore = objc_msgSend_tasteSyncedToStore(v14, v46, v47, v48, v49, v50, v51, v52);
      v60 = objc_msgSend_dateFinished(v14, v53, v54, v55, v56, v57, v58, v59);
      uint64_t v68 = objc_msgSend_copy(v60, v61, v62, v63, v64, v65, v66, v67);
      dateFinished = v5->_dateFinished;
      v5->_dateFinished = (NSDate *)v68;

      v5->_finishedDateKind = objc_msgSend_finishedDateKind(v14, v70, v71, v72, v73, v74, v75, v76);
      v84 = objc_msgSend_lastOpenDate(v14, v77, v78, v79, v80, v81, v82, v83);
      uint64_t v92 = objc_msgSend_copy(v84, v85, v86, v87, v88, v89, v90, v91);
      lastOpenDate = v5->_lastOpenDate;
      v5->_lastOpenDate = (NSDate *)v92;

      objc_msgSend_readingProgress(v14, v94, v95, v96, v97, v98, v99, v100);
      v5->_readingProgress = v101;
      objc_msgSend_readingProgressHighWaterMark(v14, v102, v103, v104, v105, v106, v107, v108);
      v5->_readingProgressHighWaterMark = v109;
      v117 = objc_msgSend_readingPositionCFIString(v14, v110, v111, v112, v113, v114, v115, v116);
      uint64_t v125 = objc_msgSend_copy(v117, v118, v119, v120, v121, v122, v123, v124);
      readingPositionCFIString = v5->_readingPositionCFIString;
      v5->_readingPositionCFIString = (NSString *)v125;

      v134 = objc_msgSend_readingPositionAnnotationVersion(v14, v127, v128, v129, v130, v131, v132, v133);
      uint64_t v142 = objc_msgSend_copy(v134, v135, v136, v137, v138, v139, v140, v141);
      readingPositionAnnotationVersion = v5->_readingPositionAnnotationVersion;
      v5->_readingPositionAnnotationVersion = (NSString *)v142;

      v151 = objc_msgSend_readingPositionAssetVersion(v14, v144, v145, v146, v147, v148, v149, v150);
      uint64_t v159 = objc_msgSend_copy(v151, v152, v153, v154, v155, v156, v157, v158);
      readingPositionAssetVersion = v5->_readingPositionAssetVersion;
      v5->_readingPositionAssetVersion = (NSString *)v159;

      v168 = objc_msgSend_readingPositionUserData(v14, v161, v162, v163, v164, v165, v166, v167);
      uint64_t v176 = objc_msgSend_copy(v168, v169, v170, v171, v172, v173, v174, v175);
      readingPositionUserData = v5->_readingPositionUserData;
      v5->_readingPositionUserData = (NSData *)v176;

      v5->_readingPositionLocationRangeStart = objc_msgSend_readingPositionLocationRangeStart(v14, v178, v179, v180, v181, v182, v183, v184);
      v5->_readingPositionLocationRangeEnd = objc_msgSend_readingPositionLocationRangeEnd(v14, v185, v186, v187, v188, v189, v190, v191);
      v5->_readingPositionAbsolutePhysicalLocation = objc_msgSend_readingPositionAbsolutePhysicalLocation(v14, v192, v193, v194, v195, v196, v197, v198);
      v206 = objc_msgSend_readingPositionStorageUUID(v14, v199, v200, v201, v202, v203, v204, v205);
      uint64_t v214 = objc_msgSend_copy(v206, v207, v208, v209, v210, v211, v212, v213);
      readingPositionStorageUUID = v5->_readingPositionStorageUUID;
      v5->_readingPositionStorageUUID = (NSString *)v214;

      v223 = objc_msgSend_readingPositionLocationUpdateDate(v14, v216, v217, v218, v219, v220, v221, v222);
      uint64_t v231 = objc_msgSend_copy(v223, v224, v225, v226, v227, v228, v229, v230);
      readingPositionLocationUpdateDate = v5->_readingPositionLocationUpdateDate;
      v5->_readingPositionLocationUpdateDate = (NSDate *)v231;

      v240 = objc_msgSend_datePlaybackTimeUpdated(v14, v233, v234, v235, v236, v237, v238, v239);
      uint64_t v248 = objc_msgSend_copy(v240, v241, v242, v243, v244, v245, v246, v247);
      datePlaybackTimeUpdated = v5->_datePlaybackTimeUpdated;
      v5->_datePlaybackTimeUpdated = (NSDate *)v248;

      objc_msgSend_bookmarkTime(v14, v250, v251, v252, v253, v254, v255, v256);
      v5->_bookmarkTime = v257;
    }
    else
    {
      v258 = BDSCloudKitLog();
      if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR)) {
        sub_2361FC8D0();
      }

      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableAssetDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v33 = BDSCloudKitLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_2361FCA80();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v235.receiver = self;
  v235.super_class = (Class)BCMutableAssetDetail;
  uint64_t v11 = [(BCMutableCloudData *)&v235 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    assetID = v11->_assetID;
    v11->_assetID = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, @"isFinished", v15, v16, v17, v18, v19);
    self = (BCMutableAssetDetail *)objc_claimAutoreleasedReturnValue();
    v11->_isFinished = objc_msgSend_BOOLValue(self, v20, v21, v22, v23, v24, v25, v26);
    uint64_t v33 = objc_msgSend_objectForKey_(v4, v27, @"notFinished", v28, v29, v30, v31, v32);
    v11->_notFinished = objc_msgSend_BOOLValue(v33, v34, v35, v36, v37, v38, v39, v40);
    uint64_t v234 = objc_msgSend_objectForKey_(v4, v41, @"taste", v42, v43, v44, v45, v46);
    v11->_taste = objc_msgSend_integerValue(v234, v47, v48, v49, v50, v51, v52, v53);
    v233 = objc_msgSend_objectForKey_(v4, v54, @"tasteSyncedToStore", v55, v56, v57, v58, v59);
    v11->_tasteSyncedToStore = objc_msgSend_integerValue(v233, v60, v61, v62, v63, v64, v65, v66);
    uint64_t v73 = objc_msgSend_objectForKey_(v4, v67, @"dateFinished", v68, v69, v70, v71, v72);
    dateFinished = v11->_dateFinished;
    v11->_dateFinished = (NSDate *)v73;

    uint64_t v82 = objc_msgSend_encryptedValues(v4, v75, v76, v77, v78, v79, v80, v81);
    v232 = objc_msgSend_objectForKeyedSubscript_(v82, v83, @"finishedDateKind", v84, v85, v86, v87, v88);

    v11->_finishedDateKind = objc_msgSend_integerValue(v232, v89, v90, v91, v92, v93, v94, v95);
    uint64_t v102 = objc_msgSend_objectForKey_(v4, v96, @"lastOpenDate", v97, v98, v99, v100, v101);
    lastOpenDate = v11->_lastOpenDate;
    v11->_lastOpenDate = (NSDate *)v102;

    v110 = objc_msgSend_objectForKey_(v4, v104, @"readingProgress", v105, v106, v107, v108, v109);
    objc_msgSend_floatValue(v110, v111, v112, v113, v114, v115, v116, v117);
    v11->_readingProgress = v118;
    uint64_t v125 = objc_msgSend_objectForKey_(v4, v119, @"readingProgressHighWaterMark", v120, v121, v122, v123, v124);
    objc_msgSend_floatValue(v125, v126, v127, v128, v129, v130, v131, v132);
    v11->_readingProgressHighWaterMark = v133;
    uint64_t v140 = objc_msgSend_objectForKey_(v4, v134, @"readingPositionCFIString", v135, v136, v137, v138, v139);
    readingPositionCFIString = v11->_readingPositionCFIString;
    v11->_readingPositionCFIString = (NSString *)v140;

    uint64_t v148 = objc_msgSend_objectForKey_(v4, v142, @"readingPositionUserData", v143, v144, v145, v146, v147);
    readingPositionUserData = v11->_readingPositionUserData;
    v11->_readingPositionUserData = (NSData *)v148;

    uint64_t v156 = objc_msgSend_objectForKey_(v4, v150, @"readingPositionLocationRangeStart", v151, v152, v153, v154, v155);
    v11->_readingPositionLocationRangeStart = objc_msgSend_intValue(v156, v157, v158, v159, v160, v161, v162, v163);
    uint64_t v170 = objc_msgSend_objectForKey_(v4, v164, @"readingPositionLocationRangeEnd", v165, v166, v167, v168, v169);
    v11->_readingPositionLocationRangeEnd = objc_msgSend_intValue(v170, v171, v172, v173, v174, v175, v176, v177);
    uint64_t v184 = objc_msgSend_objectForKey_(v4, v178, @"readingPositionAbsolutePhysicalLocation", v179, v180, v181, v182, v183);
    v11->_readingPositionAbsolutePhysicalLocation = objc_msgSend_intValue(v184, v185, v186, v187, v188, v189, v190, v191);
    uint64_t v198 = objc_msgSend_objectForKey_(v4, v192, @"readingPositionStorageUUID", v193, v194, v195, v196, v197);
    readingPositionStorageUUID = v11->_readingPositionStorageUUID;
    v11->_readingPositionStorageUUID = (NSString *)v198;

    uint64_t v206 = objc_msgSend_objectForKey_(v4, v200, @"readingPositionLocationUpdateDate", v201, v202, v203, v204, v205);
    readingPositionLocationUpdateDate = v11->_readingPositionLocationUpdateDate;
    v11->_readingPositionLocationUpdateDate = (NSDate *)v206;

    uint64_t v214 = objc_msgSend_objectForKey_(v4, v208, @"datePlaybackTimeUpdated", v209, v210, v211, v212, v213);
    datePlaybackTimeUpdated = v11->_datePlaybackTimeUpdated;
    v11->_datePlaybackTimeUpdated = (NSDate *)v214;

    uint64_t v222 = objc_msgSend_objectForKey_(v4, v216, @"bookmarkTime", v217, v218, v219, v220, v221);
    objc_msgSend_doubleValue(v222, v223, v224, v225, v226, v227, v228, v229);
    v11->_bookmarkTime = v230;

LABEL_7:
  }

  return v11;
}

- (NSString)description
{
  uint64_t v182 = NSString;
  uint64_t v181 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_isFinished(self, v9, v10, v11, v12, v13, v14, v15)) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  uint64_t v180 = v23;
  if (objc_msgSend_notFinished(self, v16, v17, v18, v19, v20, v21, v22)) {
    uint64_t v31 = @"YES";
  }
  else {
    uint64_t v31 = @"NO";
  }
  uint64_t v179 = v31;
  v178 = objc_msgSend_dateFinished(self, v24, v25, v26, v27, v28, v29, v30);
  int v177 = objc_msgSend_finishedDateKind(self, v32, v33, v34, v35, v36, v37, v38);
  uint64_t v176 = objc_msgSend_lastOpenDate(self, v39, v40, v41, v42, v43, v44, v45);
  int v175 = objc_msgSend_taste(self, v46, v47, v48, v49, v50, v51, v52);
  int v174 = objc_msgSend_tasteSyncedToStore(self, v53, v54, v55, v56, v57, v58, v59);
  objc_msgSend_readingProgress(self, v60, v61, v62, v63, v64, v65, v66);
  double v68 = v67;
  objc_msgSend_readingProgressHighWaterMark(self, v69, v70, v71, v72, v73, v74, v75);
  double v77 = v76;
  uint64_t v85 = objc_msgSend_readingPositionCFIString(self, v78, v79, v80, v81, v82, v83, v84);
  uint64_t v173 = objc_msgSend_readingPositionAnnotationVersion(self, v86, v87, v88, v89, v90, v91, v92);
  uint64_t v172 = objc_msgSend_readingPositionAssetVersion(self, v93, v94, v95, v96, v97, v98, v99);
  uint64_t v107 = objc_msgSend_readingPositionUserData(self, v100, v101, v102, v103, v104, v105, v106);
  uint64_t v115 = objc_msgSend_readingPositionLocationRangeStart(self, v108, v109, v110, v111, v112, v113, v114);
  uint64_t v123 = objc_msgSend_readingPositionLocationRangeEnd(self, v116, v117, v118, v119, v120, v121, v122);
  uint64_t v131 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v124, v125, v126, v127, v128, v129, v130);
  uint64_t v139 = objc_msgSend_readingPositionStorageUUID(self, v132, v133, v134, v135, v136, v137, v138);
  uint64_t v147 = objc_msgSend_readingPositionLocationUpdateDate(self, v140, v141, v142, v143, v144, v145, v146);
  uint64_t v155 = objc_msgSend_datePlaybackTimeUpdated(self, v148, v149, v150, v151, v152, v153, v154);
  objc_msgSend_bookmarkTime(self, v156, v157, v158, v159, v160, v161, v162);
  objc_msgSend_stringWithFormat_(v182, v163, @"BCMutableAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)", v164, v165, v166, v167, v168, v181, v180, v179, v178, v177, v176, v175, v174, *(void *)&v68, *(void *)&v77, v85,
    v173,
    v172,
    v107,
    v115,
    v123,
    v131,
    v139,
    v147,
    v155,
  uint64_t v170 = v169);

  return (NSString *)v170;
}

- (id)recordType
{
  return @"assetDetail";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  float readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
  if (readingProgressHighWaterMark >= a3)
  {
    if (readingProgressHighWaterMark > a3)
    {
      uint64_t v6 = BDSCloudKitLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend_assetID(self, v7, v8, v9, v10, v11, v12, v13);
        double v15 = self->_readingProgressHighWaterMark;
        int v16 = 138412802;
        uint64_t v17 = v14;
        __int16 v18 = 2048;
        double v19 = v15;
        __int16 v20 = 2048;
        double v21 = a3;
        _os_log_impl(&dword_2360BC000, v6, OS_LOG_TYPE_INFO, "BCMutableAssetDetail %@ attempt to move readingProgressHighWaterMark backwards from %f to %f", (uint8_t *)&v16, 0x20u);
      }
    }
  }
  else
  {
    self->_float readingProgressHighWaterMark = a3;
  }
}

- (id)configuredRecordFromAttributes
{
  v354.receiver = self;
  v354.super_class = (Class)BCMutableAssetDetail;
  uint64_t v3 = [(BCMutableCloudData *)&v354 configuredRecordFromAttributes];
  uint64_t v4 = NSNumber;
  uint64_t isFinished = objc_msgSend_isFinished(self, v5, v6, v7, v8, v9, v10, v11);
  double v19 = objc_msgSend_numberWithBool_(v4, v13, isFinished, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v3, v20, (uint64_t)v19, @"isFinished", v21, v22, v23, v24);

  uint64_t v25 = NSNumber;
  uint64_t v33 = objc_msgSend_notFinished(self, v26, v27, v28, v29, v30, v31, v32);
  uint64_t v40 = objc_msgSend_numberWithBool_(v25, v34, v33, v35, v36, v37, v38, v39);
  objc_msgSend_setObject_forKey_(v3, v41, (uint64_t)v40, @"notFinished", v42, v43, v44, v45);

  uint64_t v46 = NSNumber;
  uint64_t v54 = objc_msgSend_taste(self, v47, v48, v49, v50, v51, v52, v53);
  uint64_t v61 = objc_msgSend_numberWithShort_(v46, v55, v54, v56, v57, v58, v59, v60);
  objc_msgSend_setObject_forKey_(v3, v62, (uint64_t)v61, @"taste", v63, v64, v65, v66);

  float v67 = NSNumber;
  uint64_t v75 = objc_msgSend_tasteSyncedToStore(self, v68, v69, v70, v71, v72, v73, v74);
  uint64_t v82 = objc_msgSend_numberWithShort_(v67, v76, v75, v77, v78, v79, v80, v81);
  objc_msgSend_setObject_forKey_(v3, v83, (uint64_t)v82, @"tasteSyncedToStore", v84, v85, v86, v87);

  uint64_t v95 = objc_msgSend_lastOpenDate(self, v88, v89, v90, v91, v92, v93, v94);
  objc_msgSend_setObject_forKey_(v3, v96, (uint64_t)v95, @"lastOpenDate", v97, v98, v99, v100);

  uint64_t v108 = objc_msgSend_dateFinished(self, v101, v102, v103, v104, v105, v106, v107);
  objc_msgSend_setObject_forKey_(v3, v109, (uint64_t)v108, @"dateFinished", v110, v111, v112, v113);

  if (_os_feature_enabled_impl())
  {
    uint64_t v121 = NSNumber;
    uint64_t v122 = objc_msgSend_finishedDateKind(self, v114, v115, v116, v117, v118, v119, v120);
    uint64_t v129 = objc_msgSend_numberWithShort_(v121, v123, v122, v124, v125, v126, v127, v128);
    uint64_t v137 = objc_msgSend_encryptedValues(v3, v130, v131, v132, v133, v134, v135, v136);
    objc_msgSend_setObject_forKeyedSubscript_(v137, v138, (uint64_t)v129, @"finishedDateKind", v139, v140, v141, v142);
  }
  uint64_t v143 = NSNumber;
  objc_msgSend_readingProgress(self, v114, v115, v116, v117, v118, v119, v120);
  uint64_t v151 = objc_msgSend_numberWithFloat_(v143, v144, v145, v146, v147, v148, v149, v150);
  objc_msgSend_setObject_forKey_(v3, v152, (uint64_t)v151, @"readingProgress", v153, v154, v155, v156);

  uint64_t v157 = NSNumber;
  objc_msgSend_readingProgressHighWaterMark(self, v158, v159, v160, v161, v162, v163, v164);
  uint64_t v172 = objc_msgSend_numberWithFloat_(v157, v165, v166, v167, v168, v169, v170, v171);
  objc_msgSend_setObject_forKey_(v3, v173, (uint64_t)v172, @"readingProgressHighWaterMark", v174, v175, v176, v177);

  v185 = objc_msgSend_readingPositionCFIString(self, v178, v179, v180, v181, v182, v183, v184);
  objc_msgSend_setObject_forKey_(v3, v186, (uint64_t)v185, @"readingPositionCFIString", v187, v188, v189, v190);

  uint64_t v198 = objc_msgSend_readingPositionAnnotationVersion(self, v191, v192, v193, v194, v195, v196, v197);
  objc_msgSend_setObject_forKey_(v3, v199, (uint64_t)v198, @"readingPositionAnnotationVersion", v200, v201, v202, v203);

  uint64_t v211 = objc_msgSend_readingPositionAssetVersion(self, v204, v205, v206, v207, v208, v209, v210);
  objc_msgSend_setObject_forKey_(v3, v212, (uint64_t)v211, @"readingPositionAssetVersion", v213, v214, v215, v216);

  uint64_t v224 = objc_msgSend_readingPositionUserData(self, v217, v218, v219, v220, v221, v222, v223);
  objc_msgSend_setObject_forKey_(v3, v225, (uint64_t)v224, @"readingPositionUserData", v226, v227, v228, v229);

  double v230 = NSNumber;
  uint64_t v238 = objc_msgSend_readingPositionLocationRangeStart(self, v231, v232, v233, v234, v235, v236, v237);
  uint64_t v245 = objc_msgSend_numberWithInt_(v230, v239, v238, v240, v241, v242, v243, v244);
  objc_msgSend_setObject_forKey_(v3, v246, (uint64_t)v245, @"readingPositionLocationRangeStart", v247, v248, v249, v250);

  uint64_t v251 = NSNumber;
  uint64_t v259 = objc_msgSend_readingPositionLocationRangeEnd(self, v252, v253, v254, v255, v256, v257, v258);
  v266 = objc_msgSend_numberWithInt_(v251, v260, v259, v261, v262, v263, v264, v265);
  objc_msgSend_setObject_forKey_(v3, v267, (uint64_t)v266, @"readingPositionLocationRangeEnd", v268, v269, v270, v271);

  v272 = NSNumber;
  uint64_t v280 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v273, v274, v275, v276, v277, v278, v279);
  v287 = objc_msgSend_numberWithInt_(v272, v281, v280, v282, v283, v284, v285, v286);
  objc_msgSend_setObject_forKey_(v3, v288, (uint64_t)v287, @"readingPositionAbsolutePhysicalLocation", v289, v290, v291, v292);

  v300 = objc_msgSend_readingPositionStorageUUID(self, v293, v294, v295, v296, v297, v298, v299);
  objc_msgSend_setObject_forKey_(v3, v301, (uint64_t)v300, @"readingPositionStorageUUID", v302, v303, v304, v305);

  v313 = objc_msgSend_readingPositionLocationUpdateDate(self, v306, v307, v308, v309, v310, v311, v312);
  objc_msgSend_setObject_forKey_(v3, v314, (uint64_t)v313, @"readingPositionLocationUpdateDate", v315, v316, v317, v318);

  v326 = objc_msgSend_datePlaybackTimeUpdated(self, v319, v320, v321, v322, v323, v324, v325);
  objc_msgSend_setObject_forKey_(v3, v327, (uint64_t)v326, @"datePlaybackTimeUpdated", v328, v329, v330, v331);

  v332 = NSNumber;
  objc_msgSend_bookmarkTime(self, v333, v334, v335, v336, v337, v338, v339);
  v347 = objc_msgSend_numberWithDouble_(v332, v340, v341, v342, v343, v344, v345, v346);
  objc_msgSend_setObject_forKey_(v3, v348, (uint64_t)v347, @"bookmarkTime", v349, v350, v351, v352);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v267.receiver = self;
  v267.super_class = (Class)BCMutableAssetDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v267 encodeWithCoder:v4];
  uint64_t isFinished = objc_msgSend_isFinished(self, v5, v6, v7, v8, v9, v10, v11, v267.receiver, v267.super_class);
  objc_msgSend_encodeBool_forKey_(v4, v13, isFinished, @"isFinished", v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_notFinished(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeBool_forKey_(v4, v26, v25, @"notFinished", v27, v28, v29, v30);
  uint64_t v38 = objc_msgSend_taste(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeInt32_forKey_(v4, v39, v38, @"taste", v40, v41, v42, v43);
  uint64_t v51 = objc_msgSend_tasteSyncedToStore(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeInt32_forKey_(v4, v52, v51, @"tasteSyncedToStore", v53, v54, v55, v56);
  uint64_t v64 = objc_msgSend_dateFinished(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"dateFinished", v66, v67, v68, v69);

  uint64_t v77 = objc_msgSend_finishedDateKind(self, v70, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeInt32_forKey_(v4, v78, v77, @"finishedDateKind", v79, v80, v81, v82);
  uint64_t v90 = objc_msgSend_lastOpenDate(self, v83, v84, v85, v86, v87, v88, v89);
  objc_msgSend_encodeObject_forKey_(v4, v91, (uint64_t)v90, @"lastOpenDate", v92, v93, v94, v95);

  objc_msgSend_readingProgress(self, v96, v97, v98, v99, v100, v101, v102);
  objc_msgSend_encodeDouble_forKey_(v4, v104, @"readingProgress", v105, v106, v107, v108, v109, v103);
  objc_msgSend_readingProgressHighWaterMark(self, v110, v111, v112, v113, v114, v115, v116);
  objc_msgSend_encodeDouble_forKey_(v4, v118, @"readingProgressHighWaterMark", v119, v120, v121, v122, v123, v117);
  uint64_t v131 = objc_msgSend_readingPositionCFIString(self, v124, v125, v126, v127, v128, v129, v130);
  objc_msgSend_encodeObject_forKey_(v4, v132, (uint64_t)v131, @"readingPositionCFIString", v133, v134, v135, v136);

  uint64_t v144 = objc_msgSend_readingPositionAnnotationVersion(self, v137, v138, v139, v140, v141, v142, v143);
  objc_msgSend_encodeObject_forKey_(v4, v145, (uint64_t)v144, @"readingPositionAnnotationVersion", v146, v147, v148, v149);

  uint64_t v157 = objc_msgSend_readingPositionAssetVersion(self, v150, v151, v152, v153, v154, v155, v156);
  objc_msgSend_encodeObject_forKey_(v4, v158, (uint64_t)v157, @"readingPositionAssetVersion", v159, v160, v161, v162);

  uint64_t v170 = objc_msgSend_readingPositionUserData(self, v163, v164, v165, v166, v167, v168, v169);
  objc_msgSend_encodeObject_forKey_(v4, v171, (uint64_t)v170, @"readingPositionUserData", v172, v173, v174, v175);

  uint64_t v183 = objc_msgSend_readingPositionLocationRangeStart(self, v176, v177, v178, v179, v180, v181, v182);
  objc_msgSend_encodeInt32_forKey_(v4, v184, v183, @"readingPositionLocationRangeStart", v185, v186, v187, v188);
  uint64_t v196 = objc_msgSend_readingPositionLocationRangeEnd(self, v189, v190, v191, v192, v193, v194, v195);
  objc_msgSend_encodeInt32_forKey_(v4, v197, v196, @"readingPositionLocationRangeEnd", v198, v199, v200, v201);
  uint64_t v209 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v202, v203, v204, v205, v206, v207, v208);
  objc_msgSend_encodeInt32_forKey_(v4, v210, v209, @"readingPositionAbsolutePhysicalLocation", v211, v212, v213, v214);
  uint64_t v222 = objc_msgSend_readingPositionStorageUUID(self, v215, v216, v217, v218, v219, v220, v221);
  objc_msgSend_encodeObject_forKey_(v4, v223, (uint64_t)v222, @"readingPositionStorageUUID", v224, v225, v226, v227);

  uint64_t v235 = objc_msgSend_readingPositionLocationUpdateDate(self, v228, v229, v230, v231, v232, v233, v234);
  objc_msgSend_encodeObject_forKey_(v4, v236, (uint64_t)v235, @"readingPositionLocationUpdateDate", v237, v238, v239, v240);

  uint64_t v248 = objc_msgSend_datePlaybackTimeUpdated(self, v241, v242, v243, v244, v245, v246, v247);
  objc_msgSend_encodeObject_forKey_(v4, v249, (uint64_t)v248, @"datePlaybackTimeUpdated", v250, v251, v252, v253);

  objc_msgSend_bookmarkTime(self, v254, v255, v256, v257, v258, v259, v260);
  objc_msgSend_encodeDouble_forKey_(v4, v261, @"bookmarkTime", v262, v263, v264, v265, v266);
}

- (BCMutableAssetDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v158.receiver = self;
  v158.super_class = (Class)BCMutableAssetDetail;
  uint64_t v5 = [(BCMutableCloudData *)&v158 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    assetID = v13->_assetID;
    v13->_assetID = (NSString *)v14;

    v13->_uint64_t isFinished = objc_msgSend_decodeBoolForKey_(v4, v16, @"isFinished", v17, v18, v19, v20, v21);
    v13->_notFinished = objc_msgSend_decodeBoolForKey_(v4, v22, @"notFinished", v23, v24, v25, v26, v27);
    v13->_taste = objc_msgSend_decodeInt32ForKey_(v4, v28, @"taste", v29, v30, v31, v32, v33);
    v13->_tasteSyncedToStore = objc_msgSend_decodeInt32ForKey_(v4, v34, @"tasteSyncedToStore", v35, v36, v37, v38, v39);
    uint64_t v40 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"dateFinished", v42, v43, v44, v45);
    dateFinished = v13->_dateFinished;
    v13->_dateFinished = (NSDate *)v46;

    v13->_finishedDateKind = objc_msgSend_decodeInt32ForKey_(v4, v48, @"finishedDateKind", v49, v50, v51, v52, v53);
    uint64_t v54 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"lastOpenDate", v56, v57, v58, v59);
    lastOpenDate = v13->_lastOpenDate;
    v13->_lastOpenDate = (NSDate *)v60;

    objc_msgSend_decodeDoubleForKey_(v4, v62, @"readingProgress", v63, v64, v65, v66, v67);
    *(float *)&double v68 = v68;
    v13->_readingProgress = *(float *)&v68;
    objc_msgSend_decodeDoubleForKey_(v4, v69, @"readingProgressHighWaterMark", v70, v71, v72, v73, v74);
    *(float *)&double v75 = v75;
    v13->_float readingProgressHighWaterMark = *(float *)&v75;
    uint64_t v76 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"readingPositionCFIString", v78, v79, v80, v81);
    readingPositionCFIString = v13->_readingPositionCFIString;
    v13->_readingPositionCFIString = (NSString *)v82;

    uint64_t v84 = objc_opt_class();
    uint64_t v90 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v84, @"readingPositionAnnotationVersion", v86, v87, v88, v89);
    readingPositionAnnotationVersion = v13->_readingPositionAnnotationVersion;
    v13->_readingPositionAnnotationVersion = (NSString *)v90;

    uint64_t v92 = objc_opt_class();
    uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, @"readingPositionAssetVersion", v94, v95, v96, v97);
    readingPositionAssetVersion = v13->_readingPositionAssetVersion;
    v13->_readingPositionAssetVersion = (NSString *)v98;

    uint64_t v100 = objc_opt_class();
    uint64_t v106 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, @"readingPositionUserData", v102, v103, v104, v105);
    readingPositionUserData = v13->_readingPositionUserData;
    v13->_readingPositionUserData = (NSData *)v106;

    v13->_readingPositionLocationRangeStart = objc_msgSend_decodeInt32ForKey_(v4, v108, @"readingPositionLocationRangeStart", v109, v110, v111, v112, v113);
    v13->_readingPositionLocationRangeEnd = objc_msgSend_decodeInt32ForKey_(v4, v114, @"readingPositionLocationRangeEnd", v115, v116, v117, v118, v119);
    v13->_readingPositionAbsolutePhysicalLocation = objc_msgSend_decodeInt32ForKey_(v4, v120, @"readingPositionAbsolutePhysicalLocation", v121, v122, v123, v124, v125);
    uint64_t v126 = objc_opt_class();
    uint64_t v132 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v127, v126, @"readingPositionStorageUUID", v128, v129, v130, v131);
    readingPositionStorageUUID = v13->_readingPositionStorageUUID;
    v13->_readingPositionStorageUUID = (NSString *)v132;

    uint64_t v134 = objc_opt_class();
    uint64_t v140 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v135, v134, @"readingPositionLocationUpdateDate", v136, v137, v138, v139);
    readingPositionLocationUpdateDate = v13->_readingPositionLocationUpdateDate;
    v13->_readingPositionLocationUpdateDate = (NSDate *)v140;

    uint64_t v142 = objc_opt_class();
    uint64_t v148 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v143, v142, @"datePlaybackTimeUpdated", v144, v145, v146, v147);
    datePlaybackTimeUpdated = v13->_datePlaybackTimeUpdated;
    v13->_datePlaybackTimeUpdated = (NSDate *)v148;

    objc_msgSend_decodeDoubleForKey_(v4, v150, @"bookmarkTime", v151, v152, v153, v154, v155);
    v13->_bookmarkTime = v156;
  }

  return v13;
}

- (BOOL)isAudiobook
{
  uint64_t v8 = objc_msgSend_datePlaybackTimeUpdated(self, a2, v2, v3, v4, v5, v6, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_uint64_t isFinished = a3;
}

- (BOOL)notFinished
{
  return self->_notFinished;
}

- (void)setNotFinished:(BOOL)a3
{
  self->_notFinished = a3;
}

- (signed)taste
{
  return self->_taste;
}

- (void)setTaste:(signed __int16)a3
{
  self->_taste = a3;
}

- (signed)tasteSyncedToStore
{
  return self->_tasteSyncedToStore;
}

- (void)setTasteSyncedToStore:(signed __int16)a3
{
  self->_tasteSyncedToStore = a3;
}

- (NSDate)dateFinished
{
  return self->_dateFinished;
}

- (void)setDateFinished:(id)a3
{
}

- (signed)finishedDateKind
{
  return self->_finishedDateKind;
}

- (void)setFinishedDateKind:(signed __int16)a3
{
  self->_finishedDateKind = a3;
}

- (NSDate)lastOpenDate
{
  return self->_lastOpenDate;
}

- (void)setLastOpenDate:(id)a3
{
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(float)a3
{
  self->_readingProgress = a3;
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (NSString)readingPositionCFIString
{
  return self->_readingPositionCFIString;
}

- (void)setReadingPositionCFIString:(id)a3
{
}

- (NSString)readingPositionAnnotationVersion
{
  return self->_readingPositionAnnotationVersion;
}

- (void)setReadingPositionAnnotationVersion:(id)a3
{
}

- (NSString)readingPositionAssetVersion
{
  return self->_readingPositionAssetVersion;
}

- (void)setReadingPositionAssetVersion:(id)a3
{
}

- (NSData)readingPositionUserData
{
  return self->_readingPositionUserData;
}

- (void)setReadingPositionUserData:(id)a3
{
}

- (int)readingPositionLocationRangeStart
{
  return self->_readingPositionLocationRangeStart;
}

- (void)setReadingPositionLocationRangeStart:(int)a3
{
  self->_readingPositionLocationRangeStart = a3;
}

- (int)readingPositionLocationRangeEnd
{
  return self->_readingPositionLocationRangeEnd;
}

- (void)setReadingPositionLocationRangeEnd:(int)a3
{
  self->_readingPositionLocationRangeEnd = a3;
}

- (int)readingPositionAbsolutePhysicalLocation
{
  return self->_readingPositionAbsolutePhysicalLocation;
}

- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3
{
  self->_readingPositionAbsolutePhysicalLocation = a3;
}

- (NSString)readingPositionStorageUUID
{
  return self->_readingPositionStorageUUID;
}

- (void)setReadingPositionStorageUUID:(id)a3
{
}

- (NSDate)datePlaybackTimeUpdated
{
  return self->_datePlaybackTimeUpdated;
}

- (void)setDatePlaybackTimeUpdated:(id)a3
{
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (NSDate)readingPositionLocationUpdateDate
{
  return self->_readingPositionLocationUpdateDate;
}

- (void)setReadingPositionLocationUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingPositionLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_datePlaybackTimeUpdated, 0);
  objc_storeStrong((id *)&self->_readingPositionStorageUUID, 0);
  objc_storeStrong((id *)&self->_readingPositionUserData, 0);
  objc_storeStrong((id *)&self->_readingPositionAssetVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionAnnotationVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionCFIString, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_dateFinished, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end