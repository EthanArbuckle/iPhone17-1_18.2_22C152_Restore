@interface BCReadingNowDetail
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromReadingNowDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCReadingNowDetail

- (id)mutableCopy
{
  v3 = [BCMutableReadingNowDetail alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromReadingNowDetail_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361FC1EC();
    }
  }
}

- (void)_configureFromReadingNowDetail:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BCReadingNowDetail;
  id v7 = a4;
  [(BCCloudData *)&v81 configureFromCloudData:v6 withMergers:v7];
  v15 = objc_msgSend_assetID(v6, v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_setDifferentString_forKey_(self, v16, (uint64_t)v15, @"assetID", v17, v18, v19, v20);

  v21 = NSNumber;
  uint64_t isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(v6, v22, v23, v24, v25, v26, v27, v28);
  v36 = objc_msgSend_numberWithBool_(v21, v30, isTrackedAsRecent, v31, v32, v33, v34, v35);
  objc_msgSend_setDifferentNumber_forKey_(self, v37, (uint64_t)v36, @"isTrackedAsRecent", v38, v39, v40, v41);

  v49 = objc_msgSend_lastEngagedDate(v6, v42, v43, v44, v45, v46, v47, v48);
  objc_msgSend_setDifferentDate_forKey_(self, v50, (uint64_t)v49, @"lastEngagedDate", v51, v52, v53, v54);

  v62 = objc_msgSend_cloudAssetType(v6, v55, v56, v57, v58, v59, v60, v61);
  objc_msgSend_setDifferentString_forKey_(self, v63, (uint64_t)v62, @"cloudAssetType", v64, v65, v66, v67);

  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = sub_236110708;
  v80[3] = &unk_264CA2550;
  v80[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v68, (uint64_t)v80, v69, v70, v71, v72, v73);

  v74 = BDSCloudKitLog();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
    sub_2361FC220(self, (char *)v6, v74, v75, v76, v77, v78, v79);
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = BUProtocolCast();
  v115.receiver = self;
  v115.super_class = (Class)BCReadingNowDetail;
  unsigned int v114 = [(BCCloudData *)&v115 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  v16 = objc_msgSend_assetID(self, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v24 = objc_msgSend_assetID(v8, v17, v18, v19, v20, v21, v22, v23);
  int isEqualToString = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  int isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v32, v33, v34, v35, v36, v37, v38);
  uint64_t v47 = objc_msgSend_isTrackedAsRecent(v8, v40, v41, v42, v43, v44, v45, v46);
  v62 = objc_msgSend_lastEngagedDate(self, v48, v49, v50, v51, v52, v53, v54);
  if (!v62)
  {
    uint64_t v4 = objc_msgSend_lastEngagedDate(v8, v55, v56, v57, v58, v59, v60, v61);
    if (!v4)
    {
      int isEqualToDate = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v63 = objc_msgSend_lastEngagedDate(self, v55, v56, v57, v58, v59, v60, v61);
  uint64_t v71 = objc_msgSend_lastEngagedDate(v8, v64, v65, v66, v67, v68, v69, v70);
  int isEqualToDate = objc_msgSend_isEqualToDate_(v63, v72, (uint64_t)v71, v73, v74, v75, v76, v77);

  if (!v62) {
    goto LABEL_6;
  }
LABEL_7:
  int v79 = isTrackedAsRecent ^ v47;

  v94 = objc_msgSend_cloudAssetType(self, v80, v81, v82, v83, v84, v85, v86);
  if (v94
    || (objc_msgSend_cloudAssetType(v8, v87, v88, v89, v90, v91, v92, v93),
        (uint64_t v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v95 = objc_msgSend_cloudAssetType(self, v87, v88, v89, v90, v91, v92, v93);
    v103 = objc_msgSend_cloudAssetType(v8, v96, v97, v98, v99, v100, v101, v102);
    int v110 = objc_msgSend_isEqualToString_(v95, v104, (uint64_t)v103, v105, v106, v107, v108, v109);

    if (v94) {
      goto LABEL_13;
    }
  }
  else
  {
    int v110 = 1;
  }

LABEL_13:
  int v111 = v114 & isEqualToString & ~v79 & isEqualToDate & v110;
  v112 = BDSCloudKitLog();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v117 = v8;
    __int16 v118 = 2112;
    v119 = self;
    __int16 v120 = 1024;
    int v121 = v111;
    _os_log_debug_impl(&dword_2360BC000, v112, OS_LOG_TYPE_DEBUG, "BCReadingNowDetail compare %@ to self:%@ SAME:%{BOOL}d", buf, 0x1Cu);
  }

  return v111;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v256 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v249.receiver = self;
  v249.super_class = (Class)BCReadingNowDetail;
  [(BCCloudData *)&v249 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_assetID(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v35 = BDSCloudKitLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_2361FC544(self, v13, v35, v36, v37, v38, v39, v40);
      }

      objc_msgSend_setAssetID_(self, v41, (uint64_t)v13, v42, v43, v44, v45, v46);
    }
    uint64_t v47 = objc_msgSend_objectForKey_(v6, v29, @"lastEngagedDate", v30, v31, v32, v33, v34);
    v55 = objc_msgSend_modificationDate(self, v48, v49, v50, v51, v52, v53, v54);
    if (v55)
    {
    }
    else
    {
      v164 = objc_msgSend_lastEngagedDate(self, v56, v57, v58, v59, v60, v61, v62);

      if (v164)
      {
        if (!v47) {
          goto LABEL_9;
        }
        v165 = objc_msgSend_lastEngagedDate(self, v63, v64, v65, v66, v67, v68, v69);
        uint64_t v172 = objc_msgSend_compare_(v165, v166, (uint64_t)v47, v167, v168, v169, v170, v171);

        if (v172 == 1) {
          goto LABEL_9;
        }
        goto LABEL_19;
      }
    }
    uint64_t v70 = objc_msgSend_modificationDate(self, v63, v64, v65, v66, v67, v68, v69);
    uint64_t v78 = objc_msgSend_modificationDate(v6, v71, v72, v73, v74, v75, v76, v77);
    uint64_t v85 = objc_msgSend_compare_(v70, v79, (uint64_t)v78, v80, v81, v82, v83, v84);

    if (v85 == 1)
    {
LABEL_9:
      uint64_t v92 = BDSCloudKitLog();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        uint64_t v100 = objc_msgSend_assetID(self, v93, v94, v95, v96, v97, v98, v99);
        uint64_t v108 = objc_msgSend_recordID(v6, v101, v102, v103, v104, v105, v106, v107);
        v116 = objc_msgSend_recordName(v108, v109, v110, v111, v112, v113, v114, v115);
        v124 = objc_msgSend_modificationDate(self, v117, v118, v119, v120, v121, v122, v123);
        objc_msgSend_timeIntervalSinceReferenceDate(v124, v125, v126, v127, v128, v129, v130, v131);
        double v133 = v132;
        v141 = objc_msgSend_modificationDate(v6, v134, v135, v136, v137, v138, v139, v140);
        objc_msgSend_timeIntervalSinceReferenceDate(v141, v142, v143, v144, v145, v146, v147, v148);
        v149 = @"newer";
        *(_DWORD *)buf = 138412802;
        v251 = v100;
        if (v133 == v150) {
          v149 = @"the same";
        }
        __int16 v252 = 2112;
        v253 = v116;
        __int16 v254 = 2114;
        v255 = v149;
        _os_log_impl(&dword_2360BC000, v92, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
      }
      objc_msgSend_incrementEditGeneration(self, v151, v152, v153, v154, v155, v156, v157);
LABEL_29:

      goto LABEL_30;
    }
LABEL_19:
    v173 = objc_msgSend_objectForKey_(v6, v86, @"isTrackedAsRecent", v87, v88, v89, v90, v91);
    objc_msgSend_setDifferentNumber_forKey_(self, v174, (uint64_t)v173, @"isTrackedAsRecent", v175, v176, v177, v178);
    objc_msgSend_setDifferentDate_forKey_(self, v179, (uint64_t)v47, @"lastEngagedDate", v180, v181, v182, v183);
    v197 = objc_msgSend_objectForKey_(v6, v184, @"cloudAssetType", v185, v186, v187, v188, v189);
    if (v197)
    {
      v198 = BDSCloudKitLog();
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG)) {
        sub_2361FC470(self, (char *)v6, (uint64_t)v198, v199, v200, v201, v202, v203);
      }

      objc_msgSend_setDifferentString_forKey_(self, v204, (uint64_t)v197, @"cloudAssetType", v205, v206, v207, v208);
    }
    int hasChanges = objc_msgSend_hasChanges(self, v190, v191, v192, v193, v194, v195, v196);
    v210 = BDSCloudKitLog();
    v211 = v210;
    if (hasChanges)
    {
      if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
      {
        v219 = objc_msgSend_assetID(self, v212, v213, v214, v215, v216, v217, v218);
        v227 = objc_msgSend_recordID(v6, v220, v221, v222, v223, v224, v225, v226);
        v235 = objc_msgSend_recordName(v227, v228, v229, v230, v231, v232, v233, v234);
        objc_msgSend_debugDescription(self, v236, v237, v238, v239, v240, v241, v242);
        v243 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v251 = v219;
        __int16 v252 = 2112;
        v253 = v235;
        __int16 v254 = 2112;
        v255 = v243;
        _os_log_impl(&dword_2360BC000, v211, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving: Adopted properties from record: %@ %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
    {
      sub_2361FC39C(self, (char *)v6, (uint64_t)v211, v244, v245, v246, v247, v248);
    }

    goto LABEL_29;
  }
  BDSCloudKitLog();
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_2361FC304(self, v13, v158, v159, v160, v161, v162, v163);
  }
LABEL_30:
}

- (id)recordType
{
  return @"readingNowDetail";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_isTrackedAsRecent(self, v11, v12, v13, v14, v15, v16, v17)) {
    uint64_t v25 = @"YES";
  }
  else {
    uint64_t v25 = @"NO";
  }
  uint64_t v26 = objc_msgSend_lastEngagedDate(self, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v34 = objc_msgSend_cloudAssetType(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v41 = objc_msgSend_stringWithFormat_(v9, v35, @"assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@ , cloudAssetType:%@", v36, v37, v38, v39, v40, v10, v25, v26, v34);

  return (NSString *)v41;
}

@end