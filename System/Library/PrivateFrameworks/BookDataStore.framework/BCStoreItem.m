@interface BCStoreItem
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromStoreItem:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCStoreItem

- (id)mutableCopy
{
  v3 = [BCMutableStoreItem alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromStoreItem_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F8AE0();
    }
  }
}

- (void)_configureFromStoreItem:(id)a3 withMergers:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BCStoreItem;
  [(BCCloudData *)&v53 configureFromCloudData:v6 withMergers:a4];
  v14 = objc_msgSend_shared(MEMORY[0x263F2BA58], v7, v8, v9, v10, v11, v12, v13);
  int v22 = objc_msgSend_verboseLoggingEnabled(v14, v15, v16, v17, v18, v19, v20, v21);

  if (v22)
  {
    v30 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend_storeID(self, v31, v32, v33, v34, v35, v36, v37);
      v46 = objc_msgSend_storeID(v6, v39, v40, v41, v42, v43, v44, v45);
      *(_DWORD *)buf = 138412546;
      v55 = v38;
      __int16 v56 = 2112;
      v57 = v46;
      _os_log_impl(&dword_2360BC000, v30, OS_LOG_TYPE_DEFAULT, "\"\\\"Configuring storeItem:%@ from storeItem:%@\\\"\"", buf, 0x16u);
    }
  }
  v47 = objc_msgSend_storeID(v6, v23, v24, v25, v26, v27, v28, v29);
  objc_msgSend_setDifferentString_forKey_(self, v48, (uint64_t)v47, @"storeID", v49, v50, v51, v52);
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = BUProtocolCast();
  v32.receiver = self;
  v32.super_class = (Class)BCStoreItem;
  LOBYTE(v4) = [(BCCloudData *)&v32 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v15 = objc_msgSend_storeID(self, v8, v9, v10, v11, v12, v13, v14);
  v23 = objc_msgSend_storeID(v7, v16, v17, v18, v19, v20, v21, v22);
  char isEqualToString = objc_msgSend_isEqualToString_(v15, v24, (uint64_t)v23, v25, v26, v27, v28, v29);

  return v4 & isEqualToString;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v216.receiver = self;
  v216.super_class = (Class)BCStoreItem;
  [(BCCloudData *)&v216 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_storeID(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v36 = BDSCloudKitLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_2361F8BAC(self, v13, v36, v37, v38, v39, v40, v41);
      }

      objc_msgSend_setStoreID_(self, v42, (uint64_t)v13, v43, v44, v45, v46, v47);
    }
    uint64_t v48 = objc_msgSend_modificationDate(self, v29, v30, v31, v32, v33, v34, v35);
    if (!v48) {
      goto LABEL_13;
    }
    __int16 v56 = (void *)v48;
    v57 = objc_msgSend_modificationDate(self, v49, v50, v51, v52, v53, v54, v55);
    objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60, v61, v62, v63, v64);
    double v66 = v65;
    v74 = objc_msgSend_modificationDate(v6, v67, v68, v69, v70, v71, v72, v73);
    objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78, v79, v80, v81);
    double v83 = v82;

    if (v66 > v83)
    {
      v84 = BDSCloudKitLog();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        v92 = objc_msgSend_storeID(self, v85, v86, v87, v88, v89, v90, v91);
        v100 = objc_msgSend_recordID(v6, v93, v94, v95, v96, v97, v98, v99);
        v108 = objc_msgSend_recordName(v100, v101, v102, v103, v104, v105, v106, v107);
        v116 = objc_msgSend_modificationDate(self, v109, v110, v111, v112, v113, v114, v115);
        objc_msgSend_timeIntervalSinceReferenceDate(v116, v117, v118, v119, v120, v121, v122, v123);
        double v125 = v124;
        v133 = objc_msgSend_modificationDate(v6, v126, v127, v128, v129, v130, v131, v132);
        objc_msgSend_timeIntervalSinceReferenceDate(v133, v134, v135, v136, v137, v138, v139, v140);
        v141 = @"newer";
        *(_DWORD *)buf = 138412802;
        v218 = v92;
        if (v125 == v142) {
          v141 = @"the same";
        }
        __int16 v219 = 2112;
        v220 = v108;
        __int16 v221 = 2114;
        v222 = v141;
        _os_log_impl(&dword_2360BC000, v84, OS_LOG_TYPE_INFO, "BCStoreItem %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
      }
      objc_msgSend_incrementEditGeneration(self, v143, v144, v145, v146, v147, v148, v149);
    }
    else
    {
LABEL_13:
      v150 = objc_msgSend_shared(MEMORY[0x263F2BA58], v49, v50, v51, v52, v53, v54, v55);
      int v158 = objc_msgSend_verboseLoggingEnabled(v150, v151, v152, v153, v154, v155, v156, v157);

      if (v158)
      {
        v166 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
        {
          v174 = objc_msgSend_storeID(self, v167, v168, v169, v170, v171, v172, v173);
          v182 = objc_msgSend_recordID(v6, v175, v176, v177, v178, v179, v180, v181);
          v190 = objc_msgSend_recordName(v182, v183, v184, v185, v186, v187, v188, v189);
          *(_DWORD *)buf = 138412546;
          v218 = v174;
          __int16 v219 = 2114;
          v220 = v190;
          _os_log_impl(&dword_2360BC000, v166, OS_LOG_TYPE_DEFAULT, "\"\\\"BCStoreItem %@ Resolving conflicts from record %{public}@\\\"\"", buf, 0x16u);
        }
      }
      v191 = objc_msgSend_storeID(self, v159, v160, v161, v162, v163, v164, v165);
      objc_msgSend_setDifferentString_forKey_(self, v192, (uint64_t)v191, @"storeID", v193, v194, v195, v196);

      v204 = objc_msgSend_modificationDate(v6, v197, v198, v199, v200, v201, v202, v203);
      objc_msgSend_setDifferentDate_forKey_(self, v205, (uint64_t)v204, @"modificationDate", v206, v207, v208, v209);
    }
  }
  else
  {
    BDSCloudKitLog();
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_2361F8B14(self, v13, v210, v211, v212, v213, v214, v215);
    }
  }
}

- (id)recordType
{
  return @"storeItem";
}

+ (id)propertyIDKey
{
  return @"storeID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  uint64_t v8 = NSString;
  uint64_t v9 = objc_msgSend_storeID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v8, v10, @"storeID: %@, ", v11, v12, v13, v14, v15, v9);

  return (NSString *)v16;
}

@end