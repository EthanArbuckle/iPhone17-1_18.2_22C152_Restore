@interface BDSSecureEngagementData
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromEngagementData:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BDSSecureEngagementData

- (id)mutableCopy
{
  v3 = [BDSMutableSecureEngagementData alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromEngagementData_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F88C8();
    }
  }
}

- (void)_configureFromEngagementData:(id)a3 withMergers:(id)a4
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v117.receiver = self;
  v117.super_class = (Class)BDSSecureEngagementData;
  [(BCCloudData *)&v117 configureFromCloudData:v6 withMergers:a4];
  v14 = objc_msgSend_startTimestampString(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"startTimestampString", v16, v17, v18, v19);

  v20 = NSNumber;
  objc_msgSend_durationInterval(v6, v21, v22, v23, v24, v25, v26, v27);
  v35 = objc_msgSend_numberWithDouble_(v20, v28, v29, v30, v31, v32, v33, v34);
  objc_msgSend_setDifferentNumber_forKey_(self, v36, (uint64_t)v35, @"durationInterval", v37, v38, v39, v40);

  v48 = objc_msgSend_value(self, v41, v42, v43, v44, v45, v46, v47);
  v56 = objc_msgSend_value(v6, v49, v50, v51, v52, v53, v54, v55);
  v62 = objc_msgSend_mergedTimeSliceDataLocal_remote_(BDSSecureEngagementDataHelper, v57, (uint64_t)v48, (uint64_t)v56, v58, v59, v60, v61);

  if (v62) {
    objc_msgSend_setDifferentObject_forKey_(self, v63, (uint64_t)v62, @"value", v66, v67, v68, v69);
  }
  v70 = objc_msgSend_value(v6, v63, v64, v65, v66, v67, v68, v69);
  objc_msgSend_setDifferentObject_forKey_(self, v71, (uint64_t)v70, @"value", v72, v73, v74, v75);

  v83 = objc_msgSend_shared(MEMORY[0x263F2BA58], v76, v77, v78, v79, v80, v81, v82);
  int v91 = objc_msgSend_verboseLoggingEnabled(v83, v84, v85, v86, v87, v88, v89, v90);

  if (v91)
  {
    v92 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      v100 = objc_msgSend_startTimestampString(self, v93, v94, v95, v96, v97, v98, v99);
      v108 = objc_msgSend_debugDescription(self, v101, v102, v103, v104, v105, v106, v107);
      v116 = objc_msgSend_startTimestampString(v6, v109, v110, v111, v112, v113, v114, v115);
      *(_DWORD *)buf = 138412802;
      v119 = v100;
      __int16 v120 = 2112;
      v121 = v108;
      __int16 v122 = 2112;
      v123 = v116;
      _os_log_impl(&dword_2360BC000, v92, OS_LOG_TYPE_DEFAULT, "\"\\\"BDSSecureEngagementData configured: %@ %@ from engagementData:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = BUProtocolCast();
  v74.receiver = self;
  v74.super_class = (Class)BDSSecureEngagementData;
  LOBYTE(v4) = [(BCCloudData *)&v74 isEqualExceptForDate:v6 ignoringEmptySalt:v4];
  v14 = objc_msgSend_startTimestampString(self, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = objc_msgSend_startTimestampString(v6, v15, v16, v17, v18, v19, v20, v21);
  char isEqualToString = objc_msgSend_isEqualToString_(v14, v23, (uint64_t)v22, v24, v25, v26, v27, v28);

  objc_msgSend_durationInterval(self, v30, v31, v32, v33, v34, v35, v36);
  double v38 = v37;
  objc_msgSend_durationInterval(v6, v39, v40, v41, v42, v43, v44, v45);
  double v47 = v46;
  uint64_t v55 = objc_msgSend_value(self, v48, v49, v50, v51, v52, v53, v54);
  v63 = objc_msgSend_value(v6, v56, v57, v58, v59, v60, v61, v62);
  char isEqual = objc_msgSend_isEqual_(v55, v64, (uint64_t)v63, v65, v66, v67, v68, v69);

  BOOL v71 = v4 & isEqualToString;
  if (v38 != v47) {
    BOOL v71 = 0;
  }
  BOOL v72 = v71 & isEqual;

  return v72;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v289 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v282.receiver = self;
  v282.super_class = (Class)BDSSecureEngagementData;
  [(BCCloudData *)&v282 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_startTimestampString(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v36 = BDSCloudKitLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_2361F8994(self, v13, v36, v37, v38, v39, v40, v41);
      }

      objc_msgSend_setStartTimestampString_(self, v42, (uint64_t)v13, v43, v44, v45, v46, v47);
    }
    uint64_t v48 = objc_msgSend_modificationDate(self, v29, v30, v31, v32, v33, v34, v35);
    if (v48)
    {
      v56 = (void *)v48;
      uint64_t v57 = objc_msgSend_modificationDate(self, v49, v50, v51, v52, v53, v54, v55);
      objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60, v61, v62, v63, v64);
      double v66 = v65;
      objc_super v74 = objc_msgSend_modificationDate(v6, v67, v68, v69, v70, v71, v72, v73);
      objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78, v79, v80, v81);
      double v83 = v82;

      if (v66 > v83)
      {
        v84 = BDSCloudKitLog();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          v92 = objc_msgSend_startTimestampString(self, v85, v86, v87, v88, v89, v90, v91);
          v100 = objc_msgSend_recordID(v6, v93, v94, v95, v96, v97, v98, v99);
          v108 = objc_msgSend_recordName(v100, v101, v102, v103, v104, v105, v106, v107);
          v116 = objc_msgSend_modificationDate(self, v109, v110, v111, v112, v113, v114, v115);
          objc_msgSend_timeIntervalSinceReferenceDate(v116, v117, v118, v119, v120, v121, v122, v123);
          double v125 = v124;
          v133 = objc_msgSend_modificationDate(v6, v126, v127, v128, v129, v130, v131, v132);
          objc_msgSend_timeIntervalSinceReferenceDate(v133, v134, v135, v136, v137, v138, v139, v140);
          v141 = @"newer";
          *(_DWORD *)buf = 138412802;
          v284 = v92;
          if (v125 == v142) {
            v141 = @"the same";
          }
          __int16 v285 = 2112;
          v286 = v108;
          __int16 v287 = 2114;
          v288 = v141;
          _os_log_impl(&dword_2360BC000, v84, OS_LOG_TYPE_INFO, "BDSSecureEngagementData %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v143, v144, v145, v146, v147, v148, v149);
        goto LABEL_27;
      }
    }
    v150 = objc_msgSend_objectForKey_(v6, v49, @"durationInterval", v51, v52, v53, v54, v55);
    objc_msgSend_setDifferentNumber_forKey_(self, v151, (uint64_t)v150, @"durationInterval", v152, v153, v154, v155);
    v162 = objc_msgSend_objectForKey_(v6, v156, @"value", v157, v158, v159, v160, v161);
    v170 = objc_msgSend_value(self, v163, v164, v165, v166, v167, v168, v169);
    v176 = objc_msgSend_mergedTimeSliceDataLocal_remote_(BDSSecureEngagementDataHelper, v171, (uint64_t)v170, (uint64_t)v162, v172, v173, v174, v175);

    if (v176) {
      objc_msgSend_setDifferentObject_forKey_(self, v177, (uint64_t)v176, @"value", v180, v181, v182, v183);
    }
    v184 = objc_msgSend_modificationDate(v6, v177, v178, v179, v180, v181, v182, v183);
    objc_msgSend_setDifferentDate_forKey_(self, v185, (uint64_t)v184, @"modificationDate", v186, v187, v188, v189);
    int hasChanges = objc_msgSend_hasChanges(self, v190, v191, v192, v193, v194, v195, v196);
    v205 = objc_msgSend_shared(MEMORY[0x263F2BA58], v198, v199, v200, v201, v202, v203, v204);
    int v213 = objc_msgSend_verboseLoggingEnabled(v205, v206, v207, v208, v209, v210, v211, v212);

    if (hasChanges)
    {
      if (v213)
      {
        v214 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
        {
          v222 = objc_msgSend_startTimestampString(self, v215, v216, v217, v218, v219, v220, v221);
          v281 = objc_msgSend_recordID(v6, v223, v224, v225, v226, v227, v228, v229);
          v237 = objc_msgSend_recordName(v281, v230, v231, v232, v233, v234, v235, v236);
          objc_msgSend_debugDescription(self, v238, v239, v240, v241, v242, v243, v244);
          v245 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v284 = v222;
          __int16 v285 = 2112;
          v286 = v237;
          __int16 v287 = 2112;
          v288 = v245;
          v246 = "\"\\\"BDSSecureEngagementData %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_24:
          _os_log_impl(&dword_2360BC000, v214, OS_LOG_TYPE_DEFAULT, v246, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v213)
    {
      v214 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        v222 = objc_msgSend_startTimestampString(self, v253, v254, v255, v256, v257, v258, v259);
        v281 = objc_msgSend_recordID(v6, v260, v261, v262, v263, v264, v265, v266);
        v237 = objc_msgSend_recordName(v281, v267, v268, v269, v270, v271, v272, v273);
        objc_msgSend_debugDescription(self, v274, v275, v276, v277, v278, v279, v280);
        v245 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v284 = v222;
        __int16 v285 = 2112;
        v286 = v237;
        __int16 v287 = 2112;
        v288 = v245;
        v246 = "\"\\\"BDSSecureEngagementData %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_24;
      }
LABEL_25:
    }
    goto LABEL_27;
  }
  BDSCloudKitLog();
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_2361F88FC(self, v13, v247, v248, v249, v250, v251, v252);
  }
LABEL_27:
}

- (id)recordType
{
  return @"SecureEngagement";
}

+ (id)propertyIDKey
{
  return @"startTimestampString";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_startTimestampString(self, a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_durationInterval(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v9, v18, @"start timestamp: %@, duration: %.1lf", v19, v20, v21, v22, v23, v10, v24);

  return (NSString *)v25;
}

@end