@interface BCGlobalMetadatum
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromMetadatum:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCGlobalMetadatum

- (id)mutableCopy
{
  v3 = [BCMutableGlobalMetadatum alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromMetadatum_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361FCAB4();
    }
  }
}

- (void)_configureFromMetadatum:(id)a3 withMergers:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)BCGlobalMetadatum;
  [(BCCloudData *)&v74 configureFromCloudData:v6 withMergers:a4];
  v14 = objc_msgSend_key(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"key", v16, v17, v18, v19);

  v27 = objc_msgSend_value(v6, v20, v21, v22, v23, v24, v25, v26);
  objc_msgSend_setDifferentString_forKey_(self, v28, (uint64_t)v27, @"value", v29, v30, v31, v32);

  v40 = objc_msgSend_shared(MEMORY[0x263F2BA58], v33, v34, v35, v36, v37, v38, v39);
  int v48 = objc_msgSend_verboseLoggingEnabled(v40, v41, v42, v43, v44, v45, v46, v47);

  if (v48)
  {
    v49 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend_key(self, v50, v51, v52, v53, v54, v55, v56);
      v65 = objc_msgSend_debugDescription(self, v58, v59, v60, v61, v62, v63, v64);
      v73 = objc_msgSend_key(v6, v66, v67, v68, v69, v70, v71, v72);
      *(_DWORD *)buf = 138412802;
      v76 = v57;
      __int16 v77 = 2112;
      v78 = v65;
      __int16 v79 = 2112;
      v80 = v73;
      _os_log_impl(&dword_2360BC000, v49, OS_LOG_TYPE_DEFAULT, "\"\\\"BCGlobalMetadatum configured: %@ %@ from metadatum:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = BUProtocolCast();
  v53.receiver = self;
  v53.super_class = (Class)BCGlobalMetadatum;
  LOBYTE(v4) = [(BCCloudData *)&v53 isEqualExceptForDate:v6 ignoringEmptySalt:v4];
  v14 = objc_msgSend_key(self, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = objc_msgSend_key(v6, v15, v16, v17, v18, v19, v20, v21);
  char isEqualToString = objc_msgSend_isEqualToString_(v14, v23, v22, v24, v25, v26, v27, v28);

  uint64_t v37 = objc_msgSend_value(self, v30, v31, v32, v33, v34, v35, v36);
  uint64_t v45 = objc_msgSend_value(v6, v38, v39, v40, v41, v42, v43, v44);
  LOBYTE(v22) = objc_msgSend_isEqualToString_(v37, v46, (uint64_t)v45, v47, v48, v49, v50, v51);

  return v4 & isEqualToString & v22;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v298 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v291.receiver = self;
  v291.super_class = (Class)BCGlobalMetadatum;
  [(BCCloudData *)&v291 resolveConflictsFromRecord:v6 withResolvers:v7];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v8, (uint64_t)v6, v9, v10, v11, v12, v13);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_key(self, v15, v16, v17, v18, v19, v20, v21);
    char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v14, v24, v25, v26, v27, v28);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v37 = BDSCloudKitLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_2361FCB80(self, v14, v37, v38, v39, v40, v41, v42);
      }

      objc_msgSend_setKey_(self, v43, (uint64_t)v14, v44, v45, v46, v47, v48);
    }
    uint64_t v49 = objc_msgSend_modificationDate(self, v30, v31, v32, v33, v34, v35, v36);
    if (v49)
    {
      v57 = (void *)v49;
      v58 = objc_msgSend_modificationDate(self, v50, v51, v52, v53, v54, v55, v56);
      objc_msgSend_timeIntervalSinceReferenceDate(v58, v59, v60, v61, v62, v63, v64, v65);
      double v67 = v66;
      v75 = objc_msgSend_modificationDate(v6, v68, v69, v70, v71, v72, v73, v74);
      objc_msgSend_timeIntervalSinceReferenceDate(v75, v76, v77, v78, v79, v80, v81, v82);
      double v84 = v83;

      if (v67 > v84)
      {
        v85 = BDSCloudKitLog();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v93 = objc_msgSend_key(self, v86, v87, v88, v89, v90, v91, v92);
          v101 = objc_msgSend_recordID(v6, v94, v95, v96, v97, v98, v99, v100);
          v109 = objc_msgSend_recordName(v101, v102, v103, v104, v105, v106, v107, v108);
          v117 = objc_msgSend_modificationDate(self, v110, v111, v112, v113, v114, v115, v116);
          objc_msgSend_timeIntervalSinceReferenceDate(v117, v118, v119, v120, v121, v122, v123, v124);
          double v126 = v125;
          v134 = objc_msgSend_modificationDate(v6, v127, v128, v129, v130, v131, v132, v133);
          objc_msgSend_timeIntervalSinceReferenceDate(v134, v135, v136, v137, v138, v139, v140, v141);
          v142 = @"newer";
          *(_DWORD *)buf = 138412802;
          v293 = v93;
          if (v126 == v143) {
            v142 = @"the same";
          }
          __int16 v294 = 2112;
          v295 = v109;
          __int16 v296 = 2114;
          v297 = v142;
          _os_log_impl(&dword_2360BC000, v85, OS_LOG_TYPE_INFO, "BCGlobalMetadatum %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v144, v145, v146, v147, v148, v149, v150);
        goto LABEL_27;
      }
    }
    v151 = objc_msgSend_objectForKey_(v6, v50, @"value", v52, v53, v54, v55, v56);
    uint64_t v159 = objc_msgSend_value(self, v152, v153, v154, v155, v156, v157, v158);
    id v160 = v151;
    uint64_t v168 = objc_msgSend_key(self, v161, v162, v163, v164, v165, v166, v167);
    uint64_t v175 = objc_msgSend_objectForKeyedSubscript_(v7, v169, v168, v170, v171, v172, v173, v174);
    v181 = (void *)v175;
    v182 = v160;
    if (v175)
    {
      v182 = (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v175 + 16))(v175, v168, v159, v160);
    }
    v289 = (void *)v168;
    v290 = (void *)v159;
    objc_msgSend_setDifferentString_forKey_(self, v176, (uint64_t)v182, @"value", v177, v178, v179, v180);
    v288 = objc_msgSend_modificationDate(v6, v183, v184, v185, v186, v187, v188, v189);
    objc_msgSend_setDifferentDate_forKey_(self, v190, (uint64_t)v288, @"modificationDate", v191, v192, v193, v194);
    int hasChanges = objc_msgSend_hasChanges(self, v195, v196, v197, v198, v199, v200, v201);
    v210 = objc_msgSend_shared(MEMORY[0x263F2BA58], v203, v204, v205, v206, v207, v208, v209);
    int v218 = objc_msgSend_verboseLoggingEnabled(v210, v211, v212, v213, v214, v215, v216, v217);

    if (hasChanges)
    {
      v219 = v290;
      if (v218)
      {
        v220 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
        {
          v286 = objc_msgSend_key(self, v221, v222, v223, v224, v225, v226, v227);
          v287 = objc_msgSend_recordID(v6, v228, v229, v230, v231, v232, v233, v234);
          v242 = objc_msgSend_recordName(v287, v235, v236, v237, v238, v239, v240, v241);
          objc_msgSend_debugDescription(self, v243, v244, v245, v246, v247, v248, v249);
          v250 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v293 = v286;
          __int16 v294 = 2112;
          v295 = v242;
          __int16 v296 = 2112;
          v297 = v250;
          v251 = "\"\\\"BCGlobalMetadatum %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_24:
          _os_log_impl(&dword_2360BC000, v220, OS_LOG_TYPE_DEFAULT, v251, buf, 0x20u);

          v219 = v290;
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v219 = v290;
      if (v218)
      {
        v220 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
        {
          v286 = objc_msgSend_key(self, v258, v259, v260, v261, v262, v263, v264);
          v287 = objc_msgSend_recordID(v6, v265, v266, v267, v268, v269, v270, v271);
          v242 = objc_msgSend_recordName(v287, v272, v273, v274, v275, v276, v277, v278);
          objc_msgSend_debugDescription(self, v279, v280, v281, v282, v283, v284, v285);
          v250 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v293 = v286;
          __int16 v294 = 2112;
          v295 = v242;
          __int16 v296 = 2112;
          v297 = v250;
          v251 = "\"\\\"BCGlobalMetadatum %@ Resolving: Identical properties from record: %@ %@\\\"\"";
          goto LABEL_24;
        }
LABEL_25:
      }
    }

    goto LABEL_27;
  }
  BDSCloudKitLog();
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
    sub_2361FCAE8(self, v14, v252, v253, v254, v255, v256, v257);
  }
LABEL_27:
}

- (id)recordType
{
  return @"globalMetadata";
}

+ (id)propertyIDKey
{
  return @"key";
}

- (id)zoneName
{
  return @"GlobalMetadata";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_key(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_value(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v9, v19, @"key: %@, value: %@", v20, v21, v22, v23, v24, v10, v18);

  return (NSString *)v25;
}

@end