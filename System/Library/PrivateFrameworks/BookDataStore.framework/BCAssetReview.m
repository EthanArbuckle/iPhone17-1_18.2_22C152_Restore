@interface BCAssetReview
+ (id)assetIDFromAssetReviewID:(id)a3;
+ (id)assetReviewIDWithUserID:(id)a3 assetID:(id)a4;
+ (id)propertyIDKey;
+ (id)userIDFromAssetReviewID:(id)a3;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (double)normalizedStarRating;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromAssetReview:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
- (void)setNormalizedStarRating:(double)a3;
@end

@implementation BCAssetReview

- (id)mutableCopy
{
  v3 = [BCMutableAssetReview alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromAssetReview_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F8F04();
    }
  }
}

- (void)_configureFromAssetReview:(id)a3 withMergers:(id)a4
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v128.receiver = self;
  v128.super_class = (Class)BCAssetReview;
  [(BCCloudData *)&v128 configureFromCloudData:v6 withMergers:a4];
  v14 = objc_msgSend_assetReviewID(v6, v7, v8, v9, v10, v11, v12, v13);
  v21 = objc_msgSend_userIDFromAssetReviewID_(BCAssetReview, v15, (uint64_t)v14, v16, v17, v18, v19, v20);

  objc_msgSend_setDifferentString_forKey_(self, v22, (uint64_t)v21, @"userID", v23, v24, v25, v26);
  v34 = objc_msgSend_assetReviewID(v6, v27, v28, v29, v30, v31, v32, v33);
  objc_msgSend_setDifferentString_forKey_(self, v35, (uint64_t)v34, @"assetReviewID", v36, v37, v38, v39);

  v40 = NSNumber;
  uint64_t v48 = objc_msgSend_starRating(v6, v41, v42, v43, v44, v45, v46, v47);
  v55 = objc_msgSend_numberWithShort_(v40, v49, v48, v50, v51, v52, v53, v54);
  objc_msgSend_setDifferentNumber_forKey_(self, v56, (uint64_t)v55, @"starRating", v57, v58, v59, v60);

  v68 = objc_msgSend_reviewTitle(v6, v61, v62, v63, v64, v65, v66, v67);
  objc_msgSend_setDifferentString_forKey_(self, v69, (uint64_t)v68, @"reviewTitle", v70, v71, v72, v73);

  v81 = objc_msgSend_reviewBody(v6, v74, v75, v76, v77, v78, v79, v80);
  objc_msgSend_setDifferentString_forKey_(self, v82, (uint64_t)v81, @"reviewBody", v83, v84, v85, v86);

  v94 = objc_msgSend_shared(MEMORY[0x263F2BA58], v87, v88, v89, v90, v91, v92, v93);
  int v102 = objc_msgSend_verboseLoggingEnabled(v94, v95, v96, v97, v98, v99, v100, v101);

  if (v102)
  {
    v103 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v111 = objc_msgSend_assetReviewID(self, v104, v105, v106, v107, v108, v109, v110);
      v119 = objc_msgSend_debugDescription(self, v112, v113, v114, v115, v116, v117, v118);
      v127 = objc_msgSend_assetReviewID(v6, v120, v121, v122, v123, v124, v125, v126);
      *(_DWORD *)buf = 138412802;
      v130 = v111;
      __int16 v131 = 2112;
      v132 = v119;
      __int16 v133 = 2112;
      v134 = v127;
      _os_log_impl(&dword_2360BC000, v103, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetReview configured: %@ %@ from assetReview:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t v8 = BUProtocolCast();
  v114.receiver = self;
  v114.super_class = (Class)BCAssetReview;
  unsigned __int8 v113 = [(BCCloudData *)&v114 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  uint64_t v16 = objc_msgSend_assetReviewID(self, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v24 = objc_msgSend_assetReviewID(v8, v17, v18, v19, v20, v21, v22, v23);
  char isEqualToString = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  int v39 = objc_msgSend_starRating(self, v32, v33, v34, v35, v36, v37, v38);
  int v47 = objc_msgSend_starRating(v8, v40, v41, v42, v43, v44, v45, v46);
  uint64_t v62 = objc_msgSend_reviewTitle(self, v48, v49, v50, v51, v52, v53, v54);
  if (!v62)
  {
    uint64_t v4 = objc_msgSend_reviewTitle(v8, v55, v56, v57, v58, v59, v60, v61);
    if (!v4)
    {
      char v78 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v63 = objc_msgSend_reviewTitle(self, v55, v56, v57, v58, v59, v60, v61);
  uint64_t v71 = objc_msgSend_reviewTitle(v8, v64, v65, v66, v67, v68, v69, v70);
  char v78 = objc_msgSend_isEqualToString_(v63, v72, (uint64_t)v71, v73, v74, v75, v76, v77);

  if (!v62) {
    goto LABEL_6;
  }
LABEL_7:

  uint64_t v93 = objc_msgSend_reviewBody(self, v79, v80, v81, v82, v83, v84, v85);
  if (v93
    || (objc_msgSend_reviewBody(v8, v86, v87, v88, v89, v90, v91, v92),
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v94 = objc_msgSend_reviewBody(self, v86, v87, v88, v89, v90, v91, v92);
    int v102 = objc_msgSend_reviewBody(v8, v95, v96, v97, v98, v99, v100, v101);
    char v109 = objc_msgSend_isEqualToString_(v94, v103, (uint64_t)v102, v104, v105, v106, v107, v108);

    if (v93) {
      goto LABEL_13;
    }
  }
  else
  {
    char v109 = 1;
  }

LABEL_13:
  char v110 = v113 & isEqualToString;
  if (v39 != v47) {
    char v110 = 0;
  }
  char v111 = v110 & v78 & v109;

  return v111;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v304 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v297.receiver = self;
  v297.super_class = (Class)BCAssetReview;
  [(BCCloudData *)&v297 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_assetReviewID(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v36 = BDSCloudKitLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_2361F8FD0(self, v13, v36, v37, v38, v39, v40, v41);
      }

      objc_msgSend_setAssetReviewID_(self, v42, (uint64_t)v13, v43, v44, v45, v46, v47);
      uint64_t v54 = objc_msgSend_userIDFromAssetReviewID_(BCAssetReview, v48, (uint64_t)v13, v49, v50, v51, v52, v53);
      objc_msgSend_setDifferentString_forKey_(self, v55, (uint64_t)v54, @"userID", v56, v57, v58, v59);
    }
    uint64_t v60 = objc_msgSend_modificationDate(self, v29, v30, v31, v32, v33, v34, v35);
    if (v60)
    {
      uint64_t v68 = (void *)v60;
      uint64_t v69 = objc_msgSend_modificationDate(self, v61, v62, v63, v64, v65, v66, v67);
      objc_msgSend_timeIntervalSinceReferenceDate(v69, v70, v71, v72, v73, v74, v75, v76);
      double v78 = v77;
      uint64_t v86 = objc_msgSend_modificationDate(v6, v79, v80, v81, v82, v83, v84, v85);
      objc_msgSend_timeIntervalSinceReferenceDate(v86, v87, v88, v89, v90, v91, v92, v93);
      double v95 = v94;

      if (v78 > v95)
      {
        uint64_t v96 = BDSCloudKitLog();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          uint64_t v104 = objc_msgSend_assetReviewID(self, v97, v98, v99, v100, v101, v102, v103);
          v112 = objc_msgSend_recordID(v6, v105, v106, v107, v108, v109, v110, v111);
          v120 = objc_msgSend_recordName(v112, v113, v114, v115, v116, v117, v118, v119);
          objc_super v128 = objc_msgSend_modificationDate(self, v121, v122, v123, v124, v125, v126, v127);
          objc_msgSend_timeIntervalSinceReferenceDate(v128, v129, v130, v131, v132, v133, v134, v135);
          double v137 = v136;
          v145 = objc_msgSend_modificationDate(v6, v138, v139, v140, v141, v142, v143, v144);
          objc_msgSend_timeIntervalSinceReferenceDate(v145, v146, v147, v148, v149, v150, v151, v152);
          v153 = @"newer";
          *(_DWORD *)buf = 138412802;
          v299 = v104;
          if (v137 == v154) {
            v153 = @"the same";
          }
          __int16 v300 = 2112;
          v301 = v120;
          __int16 v302 = 2114;
          v303 = v153;
          _os_log_impl(&dword_2360BC000, v96, OS_LOG_TYPE_INFO, "BCAssetReview %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v155, v156, v157, v158, v159, v160, v161);
        goto LABEL_25;
      }
    }
    v162 = objc_msgSend_objectForKey_(v6, v61, @"starRating", v63, v64, v65, v66, v67);
    objc_msgSend_setDifferentNumber_forKey_(self, v163, (uint64_t)v162, @"starRating", v164, v165, v166, v167);
    v174 = objc_msgSend_objectForKey_(v6, v168, @"reviewTitle", v169, v170, v171, v172, v173);
    objc_msgSend_setDifferentString_forKey_(self, v175, (uint64_t)v174, @"reviewTitle", v176, v177, v178, v179);
    v186 = objc_msgSend_objectForKey_(v6, v180, @"reviewBody", v181, v182, v183, v184, v185);
    objc_msgSend_setDifferentString_forKey_(self, v187, (uint64_t)v186, @"reviewBody", v188, v189, v190, v191);
    v199 = objc_msgSend_modificationDate(v6, v192, v193, v194, v195, v196, v197, v198);
    objc_msgSend_setDifferentDate_forKey_(self, v200, (uint64_t)v199, @"modificationDate", v201, v202, v203, v204);
    int hasChanges = objc_msgSend_hasChanges(self, v205, v206, v207, v208, v209, v210, v211);
    v220 = objc_msgSend_shared(MEMORY[0x263F2BA58], v213, v214, v215, v216, v217, v218, v219);
    int v228 = objc_msgSend_verboseLoggingEnabled(v220, v221, v222, v223, v224, v225, v226, v227);

    if (hasChanges)
    {
      if (v228)
      {
        v229 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
        {
          v237 = objc_msgSend_assetReviewID(self, v230, v231, v232, v233, v234, v235, v236);
          v296 = objc_msgSend_recordID(v6, v238, v239, v240, v241, v242, v243, v244);
          v252 = objc_msgSend_recordName(v296, v245, v246, v247, v248, v249, v250, v251);
          objc_msgSend_debugDescription(self, v253, v254, v255, v256, v257, v258, v259);
          v260 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v299 = v237;
          __int16 v300 = 2112;
          v301 = v252;
          __int16 v302 = 2112;
          v303 = v260;
          v261 = "\"\\\"BCAssetReview %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_22:
          _os_log_impl(&dword_2360BC000, v229, OS_LOG_TYPE_DEFAULT, v261, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v228)
    {
      v229 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
      {
        v237 = objc_msgSend_assetReviewID(self, v268, v269, v270, v271, v272, v273, v274);
        v296 = objc_msgSend_recordID(v6, v275, v276, v277, v278, v279, v280, v281);
        v252 = objc_msgSend_recordName(v296, v282, v283, v284, v285, v286, v287, v288);
        objc_msgSend_debugDescription(self, v289, v290, v291, v292, v293, v294, v295);
        v260 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v299 = v237;
        __int16 v300 = 2112;
        v301 = v252;
        __int16 v302 = 2112;
        v303 = v260;
        v261 = "\"\\\"BCAssetReview %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_22;
      }
LABEL_23:
    }
    goto LABEL_25;
  }
  BDSCloudKitLog();
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_2361F8F38(self, v13, v262, v263, v264, v265, v266, v267);
  }
LABEL_25:
}

- (id)recordType
{
  return @"assetReview";
}

+ (id)propertyIDKey
{
  return @"assetReviewID";
}

- (double)normalizedStarRating
{
  uint64_t v8 = NSNumber;
  uint64_t v9 = objc_msgSend_starRating(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_numberWithShort_(v8, v10, v9, v11, v12, v13, v14, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19, v20, v21, v22, v23);
  double v25 = v24 / 5.0;

  return v25;
}

- (void)setNormalizedStarRating:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, v5, v6, v7, v8, floor(a3 * 5.0));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v17 = objc_msgSend_integerValue(v24, v10, v11, v12, v13, v14, v15, v16);
  objc_msgSend_setStarRating_(self, v18, v17, v19, v20, v21, v22, v23);
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetReviewID(self, a2, v2, v3, v4, v5, v6, v7);
  int v18 = objc_msgSend_starRating(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_reviewTitle(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v34 = objc_msgSend_reviewBody(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v41 = objc_msgSend_stringWithFormat_(v9, v35, @"assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@", v36, v37, v38, v39, v40, v10, v18, v26, v34);

  return (NSString *)v41;
}

+ (id)assetReviewIDWithUserID:(id)a3 assetID:(id)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@|%@", (uint64_t)a4, v4, v5, v6, v7, a3, a4);
}

+ (id)assetIDFromAssetReviewID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = objc_msgSend_rangeOfString_(v3, v4, @"|", v5, v6, v7, v8, v9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_substringFromIndex_(v3, v11, (uint64_t)&v11[v10], v12, v13, v14, v15, v16);
  }

  return v17;
}

+ (id)userIDFromAssetReviewID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = objc_msgSend_rangeOfString_(v3, v4, @"|", v5, v6, v7, v8, v9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_substringToIndex_(v3, v11, v10, v12, v13, v14, v15, v16);
  }

  return v17;
}

@end