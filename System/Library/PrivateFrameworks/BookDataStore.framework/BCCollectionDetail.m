@interface BCCollectionDetail
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromCollectionDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCCollectionDetail

- (id)mutableCopy
{
  v3 = [BCMutableCollectionDetail alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromCollectionDetail_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F7F4C();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t v8 = BUProtocolCast();
  v138.receiver = self;
  v138.super_class = (Class)BCCollectionDetail;
  unsigned int v137 = [(BCCloudData *)&v138 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  v16 = objc_msgSend_name(self, v9, v10, v11, v12, v13, v14, v15);
  v24 = objc_msgSend_name(v8, v17, v18, v19, v20, v21, v22, v23);
  int isEqualToString = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  v39 = objc_msgSend_collectionID(self, v32, v33, v34, v35, v36, v37, v38);
  v47 = objc_msgSend_collectionID(v8, v40, v41, v42, v43, v44, v45, v46);
  int v54 = objc_msgSend_isEqualToString_(v39, v48, (uint64_t)v47, v49, v50, v51, v52, v53);

  v69 = objc_msgSend_collectionDescription(self, v55, v56, v57, v58, v59, v60, v61);
  if (!v69)
  {
    uint64_t v4 = objc_msgSend_collectionDescription(v8, v62, v63, v64, v65, v66, v67, v68);
    if (!v4)
    {
      int v85 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v70 = objc_msgSend_collectionDescription(self, v62, v63, v64, v65, v66, v67, v68);
  v78 = objc_msgSend_collectionDescription(v8, v71, v72, v73, v74, v75, v76, v77);
  int v85 = objc_msgSend_isEqualToString_(v70, v79, (uint64_t)v78, v80, v81, v82, v83, v84);

  if (!v69) {
    goto LABEL_6;
  }
LABEL_7:

  int v93 = objc_msgSend_hidden(self, v86, v87, v88, v89, v90, v91, v92);
  int v101 = objc_msgSend_hidden(v8, v94, v95, v96, v97, v98, v99, v100);
  int v109 = objc_msgSend_sortOrder(self, v102, v103, v104, v105, v106, v107, v108);
  int v117 = objc_msgSend_sortOrder(v8, v110, v111, v112, v113, v114, v115, v116);
  int v125 = objc_msgSend_sortMode(self, v118, v119, v120, v121, v122, v123, v124);
  int v133 = objc_msgSend_sortMode(v8, v126, v127, v128, v129, v130, v131, v132);
  BOOL v134 = 0;
  if ((v137 & isEqualToString & v54) == 1 && v85 && ((v93 ^ v101) & 1) == 0) {
    BOOL v134 = v109 == v117 && v125 == v133;
  }

  return v134;
}

- (void)_configureFromCollectionDetail:(id)a3 withMergers:(id)a4
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v158.receiver = self;
  v158.super_class = (Class)BCCollectionDetail;
  [(BCCloudData *)&v158 configureFromCloudData:v6 withMergers:a4];
  uint64_t v14 = objc_msgSend_collectionID(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"collectionID", v16, v17, v18, v19);

  uint64_t v27 = objc_msgSend_name(v6, v20, v21, v22, v23, v24, v25, v26);

  if (v27)
  {
    uint64_t v35 = objc_msgSend_name(v6, v28, v29, v30, v31, v32, v33, v34);
    objc_msgSend_setDifferentString_forKey_(self, v36, (uint64_t)v35, @"name", v37, v38, v39, v40);
  }
  else
  {
    objc_msgSend_setDifferentString_forKey_(self, v28, (uint64_t)&stru_26E976C40, @"name", v31, v32, v33, v34);
  }
  v48 = objc_msgSend_collectionDescription(v6, v41, v42, v43, v44, v45, v46, v47);
  objc_msgSend_setDifferentString_forKey_(self, v49, (uint64_t)v48, @"collectionDescription", v50, v51, v52, v53);

  int v54 = NSNumber;
  uint64_t v62 = objc_msgSend_hidden(v6, v55, v56, v57, v58, v59, v60, v61);
  v69 = objc_msgSend_numberWithBool_(v54, v63, v62, v64, v65, v66, v67, v68);
  objc_msgSend_setDifferentNumber_forKey_(self, v70, (uint64_t)v69, @"hidden", v71, v72, v73, v74);

  uint64_t v75 = NSNumber;
  int v83 = objc_msgSend_sortOrder(v6, v76, v77, v78, v79, v80, v81, v82);
  uint64_t v90 = objc_msgSend_numberWithInteger_(v75, v84, v83, v85, v86, v87, v88, v89);
  objc_msgSend_setDifferentNumber_forKey_(self, v91, (uint64_t)v90, @"sortOrder", v92, v93, v94, v95);

  uint64_t v96 = NSNumber;
  int v104 = objc_msgSend_sortMode(v6, v97, v98, v99, v100, v101, v102, v103);
  uint64_t v111 = objc_msgSend_numberWithInteger_(v96, v105, v104, v106, v107, v108, v109, v110);
  objc_msgSend_setDifferentNumber_forKey_(self, v112, (uint64_t)v111, @"sortMode", v113, v114, v115, v116);

  uint64_t v124 = objc_msgSend_shared(MEMORY[0x263F2BA58], v117, v118, v119, v120, v121, v122, v123);
  int v132 = objc_msgSend_verboseLoggingEnabled(v124, v125, v126, v127, v128, v129, v130, v131);

  if (v132)
  {
    int v133 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      v141 = objc_msgSend_collectionID(self, v134, v135, v136, v137, v138, v139, v140);
      v149 = objc_msgSend_debugDescription(self, v142, v143, v144, v145, v146, v147, v148);
      v157 = objc_msgSend_collectionID(v6, v150, v151, v152, v153, v154, v155, v156);
      *(_DWORD *)buf = 138543874;
      v160 = v141;
      __int16 v161 = 2112;
      v162 = v149;
      __int16 v163 = 2114;
      v164 = v157;
      _os_log_impl(&dword_2360BC000, v133, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionDetail configured: %{public}@ %@ from assetDetail:%{public}@\\\"\"", buf, 0x20u);
    }
  }
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v320 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v313.receiver = self;
  v313.super_class = (Class)BCCollectionDetail;
  [(BCCloudData *)&v313 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_collectionID(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v36 = BDSCloudKitLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_2361F8008(self, v13, v36, v37, v38, v39, v40, v41);
      }

      objc_msgSend_setCollectionID_(self, v42, (uint64_t)v13, v43, v44, v45, v46, v47);
    }
    uint64_t v48 = objc_msgSend_modificationDate(self, v29, v30, v31, v32, v33, v34, v35);
    if (v48)
    {
      uint64_t v56 = (void *)v48;
      uint64_t v57 = objc_msgSend_modificationDate(self, v49, v50, v51, v52, v53, v54, v55);
      objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60, v61, v62, v63, v64);
      double v66 = v65;
      uint64_t v74 = objc_msgSend_modificationDate(v6, v67, v68, v69, v70, v71, v72, v73);
      objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78, v79, v80, v81);
      double v83 = v82;

      if (v66 > v83)
      {
        uint64_t v84 = BDSCloudKitLog();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          uint64_t v92 = objc_msgSend_collectionID(self, v85, v86, v87, v88, v89, v90, v91);
          uint64_t v100 = objc_msgSend_recordID(v6, v93, v94, v95, v96, v97, v98, v99);
          uint64_t v108 = objc_msgSend_recordName(v100, v101, v102, v103, v104, v105, v106, v107);
          uint64_t v116 = objc_msgSend_modificationDate(self, v109, v110, v111, v112, v113, v114, v115);
          objc_msgSend_timeIntervalSinceReferenceDate(v116, v117, v118, v119, v120, v121, v122, v123);
          double v125 = v124;
          int v133 = objc_msgSend_modificationDate(v6, v126, v127, v128, v129, v130, v131, v132);
          objc_msgSend_timeIntervalSinceReferenceDate(v133, v134, v135, v136, v137, v138, v139, v140);
          v141 = @"newer";
          *(_DWORD *)buf = 138543874;
          v315 = v92;
          __int16 v316 = 2114;
          if (v125 == v142) {
            v141 = @"the same";
          }
          v317 = v108;
          __int16 v318 = 2114;
          v319 = v141;
          _os_log_impl(&dword_2360BC000, v84, OS_LOG_TYPE_INFO, "BCCollectionDetail %{public}@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v143, v144, v145, v146, v147, v148, v149);
        goto LABEL_32;
      }
    }
    v312 = objc_msgSend_objectForKey_(v6, v49, @"hidden", v51, v52, v53, v54, v55);
    objc_msgSend_setDifferentNumber_forKey_(self, v150, (uint64_t)v312, @"hidden", v151, v152, v153, v154);
    v311 = objc_msgSend_objectForKey_(v6, v155, @"sortOrder", v156, v157, v158, v159, v160);
    objc_msgSend_setDifferentNumber_forKey_(self, v161, (uint64_t)v311, @"sortOrder", v162, v163, v164, v165);
    v172 = objc_msgSend_objectForKey_(v6, v166, @"sortMode", v167, v168, v169, v170, v171);
    objc_msgSend_setDifferentNumber_forKey_(self, v173, (uint64_t)v172, @"sortMode", v174, v175, v176, v177);
    uint64_t v184 = objc_msgSend_objectForKey_(v6, v178, @"name", v179, v180, v181, v182, v183);
    v190 = (void *)v184;
    if (v184) {
      objc_msgSend_setDifferentString_forKey_(self, v185, v184, @"name", v186, v187, v188, v189);
    }
    else {
      objc_msgSend_setDifferentString_forKey_(self, v185, (uint64_t)&stru_26E976C40, @"name", v186, v187, v188, v189);
    }
    v198 = objc_msgSend_name(self, v191, v192, v193, v194, v195, v196, v197);

    if (!v198) {
      objc_msgSend_setName_(self, v199, (uint64_t)&stru_26E976C40, v200, v201, v202, v203, v204);
    }
    v212 = objc_msgSend_objectForKey_(v6, v199, @"collectionDescription", v200, v201, v202, v203, v204);
    if (v212) {
      objc_msgSend_setDifferentString_forKey_(self, v205, (uint64_t)v212, @"collectionDescription", v208, v209, v210, v211);
    }
    v213 = objc_msgSend_modificationDate(v6, v205, v206, v207, v208, v209, v210, v211);
    objc_msgSend_setDifferentDate_forKey_(self, v214, (uint64_t)v213, @"modificationDate", v215, v216, v217, v218);
    int hasChanges = objc_msgSend_hasChanges(self, v219, v220, v221, v222, v223, v224, v225);
    v234 = objc_msgSend_shared(MEMORY[0x263F2BA58], v227, v228, v229, v230, v231, v232, v233);
    int v242 = objc_msgSend_verboseLoggingEnabled(v234, v235, v236, v237, v238, v239, v240, v241);

    if (hasChanges)
    {
      if (v242)
      {
        v243 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
        {
          v251 = objc_msgSend_collectionID(self, v244, v245, v246, v247, v248, v249, v250);
          v310 = objc_msgSend_recordID(v6, v252, v253, v254, v255, v256, v257, v258);
          v266 = objc_msgSend_recordName(v310, v259, v260, v261, v262, v263, v264, v265);
          objc_msgSend_debugDescription(self, v267, v268, v269, v270, v271, v272, v273);
          v274 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v315 = v251;
          __int16 v316 = 2112;
          v317 = v266;
          __int16 v318 = 2112;
          v319 = v274;
          v275 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_29:
          _os_log_impl(&dword_2360BC000, v243, OS_LOG_TYPE_DEFAULT, v275, buf, 0x20u);

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else if (v242)
    {
      v243 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        v251 = objc_msgSend_collectionID(self, v282, v283, v284, v285, v286, v287, v288);
        v310 = objc_msgSend_recordID(v6, v289, v290, v291, v292, v293, v294, v295);
        v266 = objc_msgSend_recordName(v310, v296, v297, v298, v299, v300, v301, v302);
        objc_msgSend_debugDescription(self, v303, v304, v305, v306, v307, v308, v309);
        v274 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v315 = v251;
        __int16 v316 = 2112;
        v317 = v266;
        __int16 v318 = 2112;
        v319 = v274;
        v275 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_29;
      }
LABEL_30:
    }
    goto LABEL_32;
  }
  BDSCloudKitLog();
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_2361F7F80(self, v13, v276, v277, v278, v279, v280, v281);
  }
LABEL_32:
}

- (id)recordType
{
  return @"collectionDetail";
}

+ (id)propertyIDKey
{
  return @"collectionID";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_collectionID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_name(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_collectionDescription(self, v19, v20, v21, v22, v23, v24, v25);
  if (objc_msgSend_hidden(self, v27, v28, v29, v30, v31, v32, v33)) {
    uint64_t v41 = @"YES";
  }
  else {
    uint64_t v41 = @"NO";
  }
  uint64_t v42 = objc_msgSend_sortOrder(self, v34, v35, v36, v37, v38, v39, v40);
  uint64_t v50 = objc_msgSend_sortMode(self, v43, v44, v45, v46, v47, v48, v49);
  uint64_t v57 = objc_msgSend_stringWithFormat_(v9, v51, @"collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode %d", v52, v53, v54, v55, v56, v10, v18, v26, v41, v42, v50);

  return (NSString *)v57;
}

@end