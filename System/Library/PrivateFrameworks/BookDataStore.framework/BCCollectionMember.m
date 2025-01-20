@interface BCCollectionMember
+ (id)assetIDFromCollectionMemberID:(id)a3;
+ (id)collectionIDFromCollectionMemberID:(id)a3;
+ (id)collectionMemberIDWithCollectionID:(id)a3 assetID:(id)a4;
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromCollectionMember:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCCollectionMember

- (id)mutableCopy
{
  v3 = [BCMutableCollectionMember alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromCollectionMember_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361FC6B4();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = BUProtocolCast();
  v49.receiver = self;
  v49.super_class = (Class)BCCollectionMember;
  unsigned int v8 = [(BCCloudData *)&v49 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v16 = objc_msgSend_collectionMemberID(self, v9, v10, v11, v12, v13, v14, v15);
  v24 = objc_msgSend_collectionMemberID(v7, v17, v18, v19, v20, v21, v22, v23);
  char isEqualToString = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  LODWORD(self) = objc_msgSend_sortOrder(self, v32, v33, v34, v35, v36, v37, v38);
  if (self == objc_msgSend_sortOrder(v7, v39, v40, v41, v42, v43, v44, v45)) {
    BOOL v46 = isEqualToString;
  }
  else {
    BOOL v46 = 0;
  }
  if (v8) {
    BOOL v47 = v46;
  }
  else {
    BOOL v47 = 0;
  }

  return v47;
}

- (void)_configureFromCollectionMember:(id)a3 withMergers:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v82.receiver = self;
  v82.super_class = (Class)BCCollectionMember;
  [(BCCloudData *)&v82 configureFromCloudData:v6 withMergers:a4];
  uint64_t v14 = objc_msgSend_collectionMemberID(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"collectionMemberID", v16, v17, v18, v19);

  uint64_t v20 = NSNumber;
  int v28 = objc_msgSend_sortOrder(v6, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v35 = objc_msgSend_numberWithInteger_(v20, v29, v28, v30, v31, v32, v33, v34);
  objc_msgSend_setDifferentNumber_forKey_(self, v36, (uint64_t)v35, @"sortOrder", v37, v38, v39, v40);

  v48 = objc_msgSend_shared(MEMORY[0x263F2BA58], v41, v42, v43, v44, v45, v46, v47);
  int v56 = objc_msgSend_verboseLoggingEnabled(v48, v49, v50, v51, v52, v53, v54, v55);

  if (v56)
  {
    v57 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v65 = objc_msgSend_collectionMemberID(self, v58, v59, v60, v61, v62, v63, v64);
      v73 = objc_msgSend_debugDescription(self, v66, v67, v68, v69, v70, v71, v72);
      v81 = objc_msgSend_collectionMemberID(v6, v74, v75, v76, v77, v78, v79, v80);
      *(_DWORD *)buf = 138412802;
      v84 = v65;
      __int16 v85 = 2112;
      v86 = v73;
      __int16 v87 = 2112;
      v88 = v81;
      _os_log_impl(&dword_2360BC000, v57, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionMember configured: %@ %@ from collectionMember:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v264 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v13 = a4;
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      uint64_t v22 = objc_msgSend_collectionMemberID(self, v14, v15, v16, v17, v18, v19, v20);
      char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v21, v24, v25, v26, v27, v28);

      if ((isEqualToString & 1) == 0)
      {
        uint64_t v30 = BDSCloudKitLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_2361FC71C(self, v21, v30, v31, v32, v33, v34, v35);
        }

        objc_msgSend_setCollectionMemberID_(self, v36, (uint64_t)v21, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      uint64_t v42 = BDSCloudKitLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_2361FC6E8();
      }
    }
    v257.receiver = self;
    v257.super_class = (Class)BCCollectionMember;
    [(BCCloudData *)&v257 resolveConflictsFromRecord:v6 withResolvers:v13];
    uint64_t v50 = objc_msgSend_modificationDate(self, v43, v44, v45, v46, v47, v48, v49);
    if (v50)
    {
      v58 = (void *)v50;
      uint64_t v59 = objc_msgSend_modificationDate(self, v51, v52, v53, v54, v55, v56, v57);
      objc_msgSend_timeIntervalSinceReferenceDate(v59, v60, v61, v62, v63, v64, v65, v66);
      double v68 = v67;
      uint64_t v76 = objc_msgSend_modificationDate(v6, v69, v70, v71, v72, v73, v74, v75);
      objc_msgSend_timeIntervalSinceReferenceDate(v76, v77, v78, v79, v80, v81, v82, v83);
      double v85 = v84;

      if (v68 > v85)
      {
        v86 = BDSCloudKitLog();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          v94 = objc_msgSend_collectionMemberID(self, v87, v88, v89, v90, v91, v92, v93);
          v102 = objc_msgSend_recordID(v6, v95, v96, v97, v98, v99, v100, v101);
          v110 = objc_msgSend_recordName(v102, v103, v104, v105, v106, v107, v108, v109);
          v118 = objc_msgSend_modificationDate(self, v111, v112, v113, v114, v115, v116, v117);
          objc_msgSend_timeIntervalSinceReferenceDate(v118, v119, v120, v121, v122, v123, v124, v125);
          double v127 = v126;
          v135 = objc_msgSend_modificationDate(v6, v128, v129, v130, v131, v132, v133, v134);
          objc_msgSend_timeIntervalSinceReferenceDate(v135, v136, v137, v138, v139, v140, v141, v142);
          v143 = @"newer";
          *(_DWORD *)buf = 138412802;
          v259 = v94;
          __int16 v260 = 2114;
          if (v127 == v144) {
            v143 = @"the same";
          }
          v261 = v110;
          __int16 v262 = 2114;
          v263 = v143;
          _os_log_impl(&dword_2360BC000, v86, OS_LOG_TYPE_INFO, "BCCollectionMember %@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v145, v146, v147, v148, v149, v150, v151);
        goto LABEL_27;
      }
    }
    v152 = objc_msgSend_objectForKey_(v6, v51, @"sortOrder", v53, v54, v55, v56, v57);
    objc_msgSend_setDifferentNumber_forKey_(self, v153, (uint64_t)v152, @"sortOrder", v154, v155, v156, v157);
    v165 = objc_msgSend_modificationDate(v6, v158, v159, v160, v161, v162, v163, v164);
    objc_msgSend_setDifferentDate_forKey_(self, v166, (uint64_t)v165, @"modificationDate", v167, v168, v169, v170);
    int hasChanges = objc_msgSend_hasChanges(self, v171, v172, v173, v174, v175, v176, v177);
    v186 = objc_msgSend_shared(MEMORY[0x263F2BA58], v179, v180, v181, v182, v183, v184, v185);
    int v194 = objc_msgSend_verboseLoggingEnabled(v186, v187, v188, v189, v190, v191, v192, v193);

    if (hasChanges)
    {
      if (v194)
      {
        v195 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
        {
          v203 = objc_msgSend_collectionMemberID(self, v196, v197, v198, v199, v200, v201, v202);
          v211 = objc_msgSend_recordID(v6, v204, v205, v206, v207, v208, v209, v210);
          v219 = objc_msgSend_recordName(v211, v212, v213, v214, v215, v216, v217, v218);
          objc_msgSend_debugDescription(self, v220, v221, v222, v223, v224, v225, v226);
          v227 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v259 = v203;
          __int16 v260 = 2112;
          v261 = v219;
          __int16 v262 = 2112;
          v263 = v227;
          v228 = "\"\\\"BCCollectionMember %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_24:
          _os_log_impl(&dword_2360BC000, v195, OS_LOG_TYPE_DEFAULT, v228, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v194)
    {
      v195 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
      {
        v203 = objc_msgSend_collectionMemberID(self, v229, v230, v231, v232, v233, v234, v235);
        v211 = objc_msgSend_recordID(v6, v236, v237, v238, v239, v240, v241, v242);
        v219 = objc_msgSend_recordName(v211, v243, v244, v245, v246, v247, v248, v249);
        objc_msgSend_debugDescription(self, v250, v251, v252, v253, v254, v255, v256);
        v227 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v259 = v203;
        __int16 v260 = 2112;
        v261 = v219;
        __int16 v262 = 2112;
        v263 = v227;
        v228 = "\"\\\"BCCollectionMember %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_24;
      }
LABEL_25:
    }
LABEL_27:
  }
}

- (id)recordType
{
  return @"collectionMember";
}

+ (id)propertyIDKey
{
  return @"collectionMemberID";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (NSString)debugDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v13 = objc_msgSend_collectionMemberID(self, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_sortOrder(self, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v29 = objc_msgSend_modificationDate(self, v22, v23, v24, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_stringWithFormat_(v3, v30, @"<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@", v31, v32, v33, v34, v35, v5, self, v13, v21, v29);

  return (NSString *)v36;
}

+ (id)collectionMemberIDWithCollectionID:(id)a3 assetID:(id)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@|%@", (uint64_t)a4, v4, v5, v6, v7, a3, a4);
}

+ (id)assetIDFromCollectionMemberID:(id)a3
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

+ (id)collectionIDFromCollectionMemberID:(id)a3
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