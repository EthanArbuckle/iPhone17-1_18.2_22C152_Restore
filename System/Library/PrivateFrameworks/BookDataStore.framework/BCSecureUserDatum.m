@interface BCSecureUserDatum
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromUserDatum:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCSecureUserDatum

- (id)mutableCopy
{
  v3 = [BCMutableSecureUserDatum alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromUserDatum_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361FB0DC();
    }
  }
}

- (void)_configureFromUserDatum:(id)a3 withMergers:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)BCSecureUserDatum;
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
      _os_log_impl(&dword_2360BC000, v49, OS_LOG_TYPE_DEFAULT, "\"\\\"BCSecureUserDatum configured: %@ %@ from userDatum:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = BUProtocolCast();
  v53.receiver = self;
  v53.super_class = (Class)BCSecureUserDatum;
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
  uint64_t v268 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v261.receiver = self;
  v261.super_class = (Class)BCSecureUserDatum;
  [(BCCloudData *)&v261 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_key(self, v14, v15, v16, v17, v18, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v13, v23, v24, v25, v26, v27);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v36 = BDSCloudKitLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_2361FB1A8(self, v13, v36, v37, v38, v39, v40, v41);
      }

      objc_msgSend_setKey_(self, v42, (uint64_t)v13, v43, v44, v45, v46, v47);
    }
    uint64_t v48 = objc_msgSend_modificationDate(self, v29, v30, v31, v32, v33, v34, v35);
    if (v48)
    {
      uint64_t v56 = (void *)v48;
      v57 = objc_msgSend_modificationDate(self, v49, v50, v51, v52, v53, v54, v55);
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
          v92 = objc_msgSend_key(self, v85, v86, v87, v88, v89, v90, v91);
          v100 = objc_msgSend_recordID(v6, v93, v94, v95, v96, v97, v98, v99);
          v108 = objc_msgSend_recordName(v100, v101, v102, v103, v104, v105, v106, v107);
          v116 = objc_msgSend_modificationDate(self, v109, v110, v111, v112, v113, v114, v115);
          objc_msgSend_timeIntervalSinceReferenceDate(v116, v117, v118, v119, v120, v121, v122, v123);
          double v125 = v124;
          v133 = objc_msgSend_modificationDate(v6, v126, v127, v128, v129, v130, v131, v132);
          objc_msgSend_timeIntervalSinceReferenceDate(v133, v134, v135, v136, v137, v138, v139, v140);
          v141 = @"newer";
          *(_DWORD *)buf = 138412802;
          v263 = v92;
          if (v125 == v142) {
            v141 = @"the same";
          }
          __int16 v264 = 2112;
          v265 = v108;
          __int16 v266 = 2114;
          v267 = v141;
          _os_log_impl(&dword_2360BC000, v84, OS_LOG_TYPE_INFO, "BCSecureUserDatum %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        objc_msgSend_incrementEditGeneration(self, v143, v144, v145, v146, v147, v148, v149);
        goto LABEL_25;
      }
    }
    v150 = objc_msgSend_objectForKey_(v6, v49, @"value", v51, v52, v53, v54, v55);
    objc_msgSend_setDifferentString_forKey_(self, v151, (uint64_t)v150, @"value", v152, v153, v154, v155);
    v163 = objc_msgSend_modificationDate(v6, v156, v157, v158, v159, v160, v161, v162);
    objc_msgSend_setDifferentDate_forKey_(self, v164, (uint64_t)v163, @"modificationDate", v165, v166, v167, v168);
    int hasChanges = objc_msgSend_hasChanges(self, v169, v170, v171, v172, v173, v174, v175);
    v184 = objc_msgSend_shared(MEMORY[0x263F2BA58], v177, v178, v179, v180, v181, v182, v183);
    int v192 = objc_msgSend_verboseLoggingEnabled(v184, v185, v186, v187, v188, v189, v190, v191);

    if (hasChanges)
    {
      if (v192)
      {
        v193 = BDSCloudKitDevelopmentLog();
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          v201 = objc_msgSend_key(self, v194, v195, v196, v197, v198, v199, v200);
          v209 = objc_msgSend_recordID(v6, v202, v203, v204, v205, v206, v207, v208);
          v217 = objc_msgSend_recordName(v209, v210, v211, v212, v213, v214, v215, v216);
          objc_msgSend_debugDescription(self, v218, v219, v220, v221, v222, v223, v224);
          v225 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v263 = v201;
          __int16 v264 = 2112;
          v265 = v217;
          __int16 v266 = 2112;
          v267 = v225;
          v226 = "\"\\\"BCSecureUserDatum %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_22:
          _os_log_impl(&dword_2360BC000, v193, OS_LOG_TYPE_DEFAULT, v226, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v192)
    {
      v193 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
      {
        v201 = objc_msgSend_key(self, v233, v234, v235, v236, v237, v238, v239);
        v209 = objc_msgSend_recordID(v6, v240, v241, v242, v243, v244, v245, v246);
        v217 = objc_msgSend_recordName(v209, v247, v248, v249, v250, v251, v252, v253);
        objc_msgSend_debugDescription(self, v254, v255, v256, v257, v258, v259, v260);
        v225 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v263 = v201;
        __int16 v264 = 2112;
        v265 = v217;
        __int16 v266 = 2112;
        v267 = v225;
        v226 = "\"\\\"BCSecureUserDatum %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_22;
      }
LABEL_23:
    }
    goto LABEL_25;
  }
  BDSCloudKitLog();
  uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_2361FB110(self, v13, v227, v228, v229, v230, v231, v232);
  }
LABEL_25:
}

- (id)recordType
{
  return @"SecureUserData";
}

+ (id)propertyIDKey
{
  return @"key";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
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