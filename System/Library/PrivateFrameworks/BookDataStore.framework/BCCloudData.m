@interface BCCloudData
+ (id)localIdentifierFromRecord:(id)a3;
+ (id)propertyIDKey;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BOOL)hasValidSalt;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (CKRecord)systemFields;
- (id)configuredRecordFromAttributes;
- (id)identifier;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)incrementEditGeneration;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSystemFields:(id)a3;
@end

@implementation BCCloudData

- (id)mutableCopy
{
  v3 = [BCMutableCloudData alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v236 = a3;
  uint64_t v5 = NSNumber;
  uint64_t v13 = objc_msgSend_deletedFlag(v236, v6, v7, v8, v9, v10, v11, v12);
  v20 = objc_msgSend_numberWithBool_(v5, v14, v13, v15, v16, v17, v18, v19);
  objc_msgSend_setDifferentNumber_forKey_(self, v21, (uint64_t)v20, @"deletedFlag", v22, v23, v24, v25);

  v33 = objc_msgSend_modificationDate(v236, v26, v27, v28, v29, v30, v31, v32);
  objc_msgSend_setDifferentDate_forKey_(self, v34, (uint64_t)v33, @"modificationDate", v35, v36, v37, v38);

  v53 = objc_msgSend_systemFields(self, v39, v40, v41, v42, v43, v44, v45);
  if (!v53) {
    goto LABEL_12;
  }
  v54 = objc_msgSend_systemFields(v236, v46, v47, v48, v49, v50, v51, v52);
  v69 = objc_msgSend_recordChangeTag(v54, v55, v56, v57, v58, v59, v60, v61);
  if (v69)
  {
    v70 = objc_msgSend_systemFields(self, v62, v63, v64, v65, v66, v67, v68);
    v78 = objc_msgSend_recordChangeTag(v70, v71, v72, v73, v74, v75, v76, v77);
    v86 = objc_msgSend_systemFields(v236, v79, v80, v81, v82, v83, v84, v85);
    v94 = objc_msgSend_recordChangeTag(v86, v87, v88, v89, v90, v91, v92, v93);
    if (!objc_msgSend_isEqualToString_(v78, v95, (uint64_t)v94, v96, v97, v98, v99, v100))
    {

      goto LABEL_12;
    }
    v230 = v86;
    v231 = v78;
    v232 = v70;
    v235 = v54;
    objc_msgSend_systemFields(v236, v101, v102, v103, v104, v105, v106, v107, v94);
  }
  else
  {
    v235 = v54;
    objc_msgSend_systemFields(v236, v62, v63, v64, v65, v66, v67, v68);
  v108 = };
  uint64_t v116 = objc_msgSend_recordID(v108, v109, v110, v111, v112, v113, v114, v115);
  if (!v116)
  {

    if (!v69)
    {
      v209 = v235;
      goto LABEL_17;
    }

    v209 = v235;
    v222 = v232;
LABEL_16:

LABEL_17:
    v171 = v236;
    goto LABEL_18;
  }
  v124 = (void *)v116;
  v233 = objc_msgSend_systemFields(v236, v117, v118, v119, v120, v121, v122, v123);
  v132 = objc_msgSend_recordID(v233, v125, v126, v127, v128, v129, v130, v131);
  v140 = objc_msgSend_recordName(v132, v133, v134, v135, v136, v137, v138, v139);
  v148 = objc_msgSend_systemFields(self, v141, v142, v143, v144, v145, v146, v147);
  v156 = objc_msgSend_recordID(v148, v149, v150, v151, v152, v153, v154, v155);
  v164 = objc_msgSend_recordName(v156, v157, v158, v159, v160, v161, v162, v163);
  char isEqualToString = objc_msgSend_isEqualToString_(v140, v165, (uint64_t)v164, v166, v167, v168, v169, v170);

  if (v69)
  {
  }
  v171 = v236;
  if ((isEqualToString & 1) == 0)
  {
LABEL_12:
    v172 = objc_msgSend_systemFields(v236, v46, v47, v48, v49, v50, v51, v52);
    objc_msgSend_setSystemFields_(self, v173, (uint64_t)v172, v174, v175, v176, v177, v178);

    v186 = objc_msgSend_privacyDelegate(self, v179, v180, v181, v182, v183, v184, v185);
    int v194 = objc_msgSend_establishedSalt(v186, v187, v188, v189, v190, v191, v192, v193);

    v171 = v236;
    if (!v194) {
      goto LABEL_18;
    }
    v53 = objc_msgSend_privacyDelegate(self, v195, v196, v197, v198, v199, v200, v201);
    v209 = objc_msgSend_recordType(v236, v202, v203, v204, v205, v206, v207, v208);
    v69 = objc_msgSend_identifier(v236, v210, v211, v212, v213, v214, v215, v216);
    v222 = objc_msgSend_recordNameFromRecordType_identifier_(v53, v217, (uint64_t)v209, (uint64_t)v69, v218, v219, v220, v221);
    objc_msgSend_setSaltedHashedID_(self, v223, (uint64_t)v222, v224, v225, v226, v227, v228);
    goto LABEL_16;
  }
LABEL_18:
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t v22 = objc_msgSend_systemFields(self, v8, v9, v10, v11, v12, v13, v14);
  if (!v22)
  {
    uint64_t v4 = objc_msgSend_systemFields(v7, v15, v16, v17, v18, v19, v20, v21);
    if (!v4)
    {
      LODWORD(v30) = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  uint64_t v30 = objc_msgSend_systemFields(self, v15, v16, v17, v18, v19, v20, v21);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_systemFields(v7, v23, v24, v25, v26, v27, v28, v29);
    uint64_t v39 = objc_msgSend_recordChangeTag(v31, v32, v33, v34, v35, v36, v37, v38);
    if (!v39)
    {

      LODWORD(v30) = 1;
      if (!v22) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    uint64_t v47 = (void *)v39;
    objc_msgSend_systemFields(self, v40, v41, v42, v43, v44, v45, v46);
    uint64_t v48 = v134 = v5;
    objc_msgSend_recordChangeTag(v48, v49, v50, v51, v52, v53, v54, v55);
    uint64_t v56 = v133 = v4;
    uint64_t v64 = objc_msgSend_systemFields(v7, v57, v58, v59, v60, v61, v62, v63);
    uint64_t v72 = objc_msgSend_recordChangeTag(v64, v65, v66, v67, v68, v69, v70, v71);
    int isEqualToString = objc_msgSend_isEqualToString_(v56, v73, (uint64_t)v72, v74, v75, v76, v77, v78);

    uint64_t v4 = v133;
    BOOL v5 = v134;

    LODWORD(v30) = isEqualToString;
  }
  if (!v22) {
    goto LABEL_11;
  }
LABEL_12:

  uint64_t v86 = objc_msgSend_saltedHashedID(self, v79, v80, v81, v82, v83, v84, v85);
  v94 = objc_msgSend_systemFields(v7, v87, v88, v89, v90, v91, v92, v93);
  uint64_t v102 = objc_msgSend_recordID(v94, v95, v96, v97, v98, v99, v100, v101);
  uint64_t v110 = objc_msgSend_recordName(v102, v103, v104, v105, v106, v107, v108, v109);

  if (v86 | v110 && (v86 ? (BOOL v118 = v110 == 0) : (BOOL v118 = 1), v118 ? (v119 = 0) : (v119 = 1), !v5 || v119)) {
    int v120 = objc_msgSend_isEqualToString_((void *)v86, v111, v110, v113, v114, v115, v116, v117);
  }
  else {
    int v120 = 1;
  }
  int v121 = objc_msgSend_deletedFlag(self, v111, v112, v113, v114, v115, v116, v117);
  int v129 = v120 & (v121 ^ objc_msgSend_deletedFlag(v7, v122, v123, v124, v125, v126, v127, v128) ^ 1);
  if (v30) {
    BOOL v130 = v129;
  }
  else {
    BOOL v130 = 0;
  }

  return v130;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v67 = a3;
  uint64_t v12 = objc_msgSend_systemFields(self, v5, v6, v7, v8, v9, v10, v11);
  if (!v12) {
    goto LABEL_3;
  }
  uint64_t v20 = (void *)v12;
  uint64_t v21 = objc_msgSend_systemFields(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v29 = objc_msgSend_recordChangeTag(v21, v22, v23, v24, v25, v26, v27, v28);
  uint64_t v37 = objc_msgSend_recordChangeTag(v67, v30, v31, v32, v33, v34, v35, v36);
  char isEqualToString = objc_msgSend_isEqualToString_(v29, v38, (uint64_t)v37, v39, v40, v41, v42, v43);

  if ((isEqualToString & 1) == 0)
  {
LABEL_3:
    objc_msgSend_setSystemFields_(self, v13, (uint64_t)v67, v15, v16, v17, v18, v19);
    uint64_t v52 = objc_msgSend_recordID(v67, v45, v46, v47, v48, v49, v50, v51);
    uint64_t v60 = objc_msgSend_recordName(v52, v53, v54, v55, v56, v57, v58, v59);
    objc_msgSend_setSaltedHashedID_(self, v61, (uint64_t)v60, v62, v63, v64, v65, v66);
  }
}

- (BOOL)hasValidSalt
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_privacyDelegate(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_ckSystemFields(self, v10, v11, v12, v13, v14, v15, v16);
  if (v17
    && (uint64_t v25 = (void *)v17,
        int v26 = objc_msgSend_establishedSalt(v9, v18, v19, v20, v21, v22, v23, v24),
        v25,
        v26))
  {
    uint64_t v34 = objc_msgSend_ckSystemFields(self, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v41 = objc_msgSend_decodeRecordFromSystemFields_(BCCloudKitDatabaseController, v35, (uint64_t)v34, v36, v37, v38, v39, v40);

    uint64_t v49 = objc_msgSend_recordType(self, v42, v43, v44, v45, v46, v47, v48);
    uint64_t v57 = objc_msgSend_identifier(self, v50, v51, v52, v53, v54, v55, v56);
    uint64_t v63 = objc_msgSend_recordNameFromRecordType_identifier_(v9, v58, (uint64_t)v49, (uint64_t)v57, v59, v60, v61, v62);

    uint64_t v71 = objc_msgSend_recordID(v41, v64, v65, v66, v67, v68, v69, v70);
    v79 = objc_msgSend_recordName(v71, v72, v73, v74, v75, v76, v77, v78);
    int isEqualToString = objc_msgSend_isEqualToString_(v79, v80, (uint64_t)v63, v81, v82, v83, v84, v85);

    v94 = objc_msgSend_shared(MEMORY[0x263F2BA58], v87, v88, v89, v90, v91, v92, v93);
    LODWORD(v79) = objc_msgSend_verboseLoggingEnabled(v94, v95, v96, v97, v98, v99, v100, v101);

    if (v79)
    {
      uint64_t v102 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v110 = objc_msgSend_recordID(v41, v103, v104, v105, v106, v107, v108, v109);
        BOOL v118 = objc_msgSend_recordName(v110, v111, v112, v113, v114, v115, v116, v117);
        int v125 = 138543874;
        uint64_t v126 = v118;
        __int16 v127 = 2114;
        uint64_t v128 = v63;
        __int16 v129 = 1024;
        int v130 = isEqualToString;
        _os_log_impl(&dword_2360BC000, v102, OS_LOG_TYPE_DEFAULT, "\"\\\"Comparing %{public}@ record name %{public}@  hasValidSalt:%{BOOL}d\\\"\"", (uint8_t *)&v125, 0x1Cu);
      }
    }
  }
  else
  {
    uint64_t v41 = BDSCloudKitLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_2361F9210(v9, (char *)self, (uint64_t)v41, v119, v120, v121, v122, v123);
    }
    LOBYTE(isEqualToString) = 1;
  }

  return isEqualToString;
}

- (CKRecord)systemFields
{
  uint64_t v9 = objc_msgSend_privacyDelegate(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_ckSystemFields(self, v10, v11, v12, v13, v14, v15, v16);

  if (v17)
  {
    uint64_t v25 = objc_msgSend_ckSystemFields(self, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v17 = objc_msgSend_decodeRecordFromSystemFields_(BCCloudKitDatabaseController, v26, (uint64_t)v25, v27, v28, v29, v30, v31);

    if (objc_msgSend_establishedSalt(v9, v32, v33, v34, v35, v36, v37, v38))
    {
      uint64_t v39 = objc_msgSend_recordType(self, v18, v19, v20, v21, v22, v23, v24);
      uint64_t v47 = objc_msgSend_identifier(self, v40, v41, v42, v43, v44, v45, v46);
      uint64_t v53 = objc_msgSend_recordNameFromRecordType_identifier_(v9, v48, (uint64_t)v39, (uint64_t)v47, v49, v50, v51, v52);

      uint64_t v61 = objc_msgSend_recordID(v17, v54, v55, v56, v57, v58, v59, v60);
      uint64_t v69 = objc_msgSend_recordName(v61, v62, v63, v64, v65, v66, v67, v68);
      char isEqualToString = objc_msgSend_isEqualToString_(v69, v70, (uint64_t)v53, v71, v72, v73, v74, v75);

      if ((isEqualToString & 1) == 0)
      {
        uint64_t v77 = BDSCloudKitLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_2361F9368(self);
        }

        objc_msgSend_setSystemFields_(self, v78, 0, v79, v80, v81, v82, v83);
        uint64_t v17 = 0;
      }
    }
  }
  uint64_t v84 = objc_msgSend_ckSystemFields(self, v18, v19, v20, v21, v22, v23, v24);

  if (!v84)
  {
    if (objc_msgSend_establishedSalt(v9, v85, v86, v87, v88, v89, v90, v91))
    {
      uint64_t v99 = objc_msgSend_identifier(self, v92, v93, v94, v95, v96, v97, v98);

      if (v99)
      {
        uint64_t v107 = objc_msgSend_recordType(self, v100, v101, v102, v103, v104, v105, v106);
        uint64_t v115 = objc_msgSend_identifier(self, v108, v109, v110, v111, v112, v113, v114);
        uint64_t v121 = objc_msgSend_recordNameFromRecordType_identifier_(v9, v116, (uint64_t)v107, (uint64_t)v115, v117, v118, v119, v120);

        if (v121)
        {
          __int16 v129 = objc_msgSend_saltedHashedID(self, v122, v123, v124, v125, v126, v127, v128);

          if (!v129) {
            objc_msgSend_setSaltedHashedID_(self, v130, (uint64_t)v121, v131, v132, v133, v134, v135);
          }
          id v136 = objc_alloc(MEMORY[0x263EFD808]);
          uint64_t v144 = objc_msgSend_zoneName(self, v137, v138, v139, v140, v141, v142, v143);
          uint64_t v150 = (char *)objc_msgSend_initWithZoneName_ownerName_(v136, v145, (uint64_t)v144, *MEMORY[0x263EFD488], v146, v147, v148, v149);

          id v151 = objc_alloc(MEMORY[0x263EFD7E8]);
          v157 = objc_msgSend_initWithRecordName_zoneID_(v151, v152, (uint64_t)v121, (uint64_t)v150, v153, v154, v155, v156);
          id v158 = objc_alloc(MEMORY[0x263EFD7C8]);
          uint64_t v166 = objc_msgSend_recordType(self, v159, v160, v161, v162, v163, v164, v165);
          uint64_t v172 = objc_msgSend_initWithRecordType_recordID_(v158, v167, (uint64_t)v166, (uint64_t)v157, v168, v169, v170, v171);

          objc_msgSend_setSystemFields_(self, v173, v172, v174, v175, v176, v177, v178);
          objc_msgSend_incrementEditGeneration(self, v179, v180, v181, v182, v183, v184, v185);

          uint64_t v17 = (void *)v172;
        }
        else
        {
          BDSCloudKitLog();
          uint64_t v150 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v150, OS_LOG_TYPE_ERROR)) {
            sub_2361F92D8(self, v150, v186, v187, v188, v189, v190, v191);
          }
        }
      }
    }
  }

  return (CKRecord *)v17;
}

- (void)setPrivacyDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_privacyDelegate, obj);
  }
  uint64_t v19 = objc_msgSend_saltedHashedID(self, v5, v6, v7, v8, v9, v10, v11);
  if (!v19)
  {
    uint64_t v19 = objc_msgSend_privacyDelegate(self, v12, v13, v14, v15, v16, v17, v18);
    if (objc_msgSend_establishedSalt(v19, v20, v21, v22, v23, v24, v25, v26))
    {
      uint64_t v34 = objc_msgSend_identifier(self, v27, v28, v29, v30, v31, v32, v33);

      if (!v34) {
        goto LABEL_8;
      }
      uint64_t v19 = objc_msgSend_privacyDelegate(self, v35, v36, v37, v38, v39, v40, v41);
      uint64_t v49 = objc_msgSend_recordType(self, v42, v43, v44, v45, v46, v47, v48);
      uint64_t v57 = objc_msgSend_identifier(self, v50, v51, v52, v53, v54, v55, v56);
      uint64_t v63 = objc_msgSend_recordNameFromRecordType_identifier_(v19, v58, (uint64_t)v49, (uint64_t)v57, v59, v60, v61, v62);
      objc_msgSend_setSaltedHashedID_(self, v64, (uint64_t)v63, v65, v66, v67, v68, v69);
    }
  }

LABEL_8:
}

- (void)setSystemFields:(id)a3
{
  uint64_t v4 = (const char *)a3;
  uint64_t v46 = (char *)v4;
  if (v4)
  {
    uint64_t v11 = objc_msgSend_encodeRecordSystemFields_(BCCloudKitDatabaseController, v4, (uint64_t)v4, v6, v7, v8, v9, v10);
    objc_msgSend_setCkSystemFields_(self, v12, (uint64_t)v11, v13, v14, v15, v16, v17);

    uint64_t v25 = objc_msgSend_recordID(v46, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v33 = objc_msgSend_recordName(v25, v26, v27, v28, v29, v30, v31, v32);
    objc_msgSend_setSaltedHashedID_(self, v34, (uint64_t)v33, v35, v36, v37, v38, v39);
  }
  else
  {
    objc_msgSend_setCkSystemFields_(self, v5, 0, v6, v7, v8, v9, v10);
    objc_msgSend_setSaltedHashedID_(self, v40, 0, v41, v42, v43, v44, v45);
  }
}

- (void)incrementEditGeneration
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_editGeneration(self, a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_setEditGeneration_(self, v10, v9 + 1, v11, v12, v13, v14, v15);
  uint64_t v23 = objc_msgSend_shared(MEMORY[0x263F2BA58], v16, v17, v18, v19, v20, v21, v22);
  int v31 = objc_msgSend_verboseLoggingEnabled(v23, v24, v25, v26, v27, v28, v29, v30);

  if (v31)
  {
    uint64_t v32 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134218242;
      uint64_t v41 = objc_msgSend_editGeneration(self, v33, v34, v35, v36, v37, v38, v39);
      __int16 v42 = 2112;
      uint64_t v43 = self;
      _os_log_impl(&dword_2360BC000, v32, OS_LOG_TYPE_DEFAULT, "\"\\\"Incrementing edit generation to: %lld for %@\\\"\"", (uint8_t *)&v40, 0x16u);
    }
  }
}

- (id)configuredRecordFromAttributes
{
  uint64_t v9 = objc_msgSend_systemFields(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_identifier(self, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend_encryptedValuesByKey(v9, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v17, @"localRecordIDEncrypted", v27, v28, v29, v30);

  return v9;
}

- (id)recordType
{
  uint64_t v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F9434();
  }

  return &stru_26E976C40;
}

- (id)identifier
{
  uint64_t v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F9468();
  }

  return 0;
}

- (id)zoneName
{
  uint64_t v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F949C();
  }

  return &stru_26E976C40;
}

+ (id)propertyIDKey
{
  uint64_t v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F94D0();
  }

  return &stru_26E976C40;
}

+ (id)localIdentifierFromRecord:(id)a3
{
  id v3 = a3;
  uint64_t v11 = objc_msgSend_encryptedValuesByKey(v3, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"localRecordIDEncrypted", v13, v14, v15, v16, v17);

  if (!v18)
  {
    objc_opt_class();
    uint64_t v25 = objc_msgSend_objectForKey_(v3, v19, @"localRecordID", v20, v21, v22, v23, v24);
    uint64_t v18 = BUDynamicCast();
  }
  return v18;
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end