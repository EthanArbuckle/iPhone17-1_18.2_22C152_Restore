@interface CKDDirectoryContext
+ (id)daemonDatabaseDirectoryName;
- (CKContainerID)containerID;
- (CKDDirectoryContext)initWithContainer:(id)a3;
- (CKDDirectoryContext)initWithTestRootDirectory:(id)a3;
- (NSString)containerIdentifier;
- (NSString)dataSeparationHash;
- (NSURL)containerCloudKitDirectory;
- (NSURL)containerDirectory;
- (NSURL)daemonCachesDirectory;
- (NSURL)daemonDatabaseDirectory;
- (NSURL)fileDownloadDirectory;
- (NSURL)frameworkCachesDirectory;
- (NSURL)mmcsWorkingDirectory;
- (NSURL)packageStagingDirectory;
- (NSURL)recordCacheDirectory;
- (NSURL)temporaryDirectory;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)applicationCachesDirectoryForDataContainerDirectory:(id)a3 usingHomeCachesDirectory:(BOOL)a4;
- (id)description;
@end

@implementation CKDDirectoryContext

- (CKDDirectoryContext)initWithContainer:(id)a3
{
  uint64_t v216 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v211.receiver = self;
  v211.super_class = (Class)CKDDirectoryContext;
  id v7 = [(CKDDirectoryContext *)&v211 init];
  if (!v7) {
    goto LABEL_43;
  }
  uint64_t v8 = objc_msgSend_containerID(v4, v5, v6);
  v9 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v8;

  uint64_t v12 = objc_msgSend_containerIdentifier(*((void **)v7 + 1), v10, v11);
  v13 = (void *)*((void *)v7 + 3);
  *((void *)v7 + 3) = v12;

  v16 = objc_msgSend_applicationBundleID(v4, v14, v15);
  id v17 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v210 = 0;
  v19 = objc_msgSend_initWithBundleIdentifier_error_(v17, v18, (uint64_t)v16, &v210);
  id v22 = v210;
  if (v22)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v23 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v213 = v16;
      __int16 v214 = 2112;
      id v215 = v22;
      _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an extension: %@", buf, 0x16u);
    }
  }
  else if (v19)
  {
    v24 = objc_msgSend_containingBundleRecord(v19, v20, v21);
    uint64_t v27 = objc_msgSend_bundleIdentifier(v24, v25, v26);

    v16 = (void *)v27;
  }
  id v28 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v209 = v22;
  v30 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v28, v29, (uint64_t)v16, 0, &v209);
  id v31 = v209;

  if (v19) {
    v32 = v19;
  }
  else {
    v32 = v30;
  }
  id v33 = v32;
  v203 = v30;
  v36 = objc_msgSend_applicationState(v30, v34, v35);
  int isInstalled = objc_msgSend_isInstalled(v36, v37, v38);

  if (isInstalled)
  {
    uint64_t v42 = objc_msgSend_dataContainerURL(v33, v40, v41);
  }
  else
  {
    uint64_t v42 = 0;
  }
  v202 = v33;
  id obj = (id)v42;
  v43 = objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v40, v42, 0);
  v46 = objc_msgSend_applicationBundleID(v4, v44, v45);
  v49 = objc_msgSend_personaID(v4, v47, v48);

  if (v49)
  {
    v52 = objc_msgSend_personaID(v4, v50, v51);
    uint64_t v54 = objc_msgSend_stringByAppendingString_(v46, v53, (uint64_t)v52);

    v46 = (void *)v54;
  }
  v55 = objc_msgSend_stringByAppendingString_(v46, v50, *((void *)v7 + 3));

  objc_msgSend_environment(*((void **)v7 + 1), v56, v57);
  v58 = CKContainerEnvironmentString();
  v60 = objc_msgSend_stringByAppendingString_(v55, v59, (uint64_t)v58);

  v63 = objc_msgSend_accountOverrideInfo(v4, v61, v62);
  v66 = objc_msgSend_accountID(v63, v64, v65);

  v69 = objc_msgSend_accountOverrideInfo(v4, v67, v68);
  v72 = v69;
  if (v66)
  {
    uint64_t v73 = objc_msgSend_accountID(v69, v70, v71);
  }
  else
  {
    v75 = objc_msgSend_altDSID(v69, v70, v71);

    if (!v75) {
      goto LABEL_22;
    }
    v72 = objc_msgSend_accountOverrideInfo(v4, v76, v77);
    uint64_t v73 = objc_msgSend_altDSID(v72, v78, v79);
  }
  v80 = (void *)v73;
  uint64_t v81 = objc_msgSend_stringByAppendingString_(v60, v74, v73);

  v60 = (void *)v81;
LABEL_22:
  id v204 = v31;
  v207 = v43;
  if (*MEMORY[0x1E4F1A4E0])
  {
    v82 = objc_msgSend_options(v4, v76, v77);
    v85 = objc_msgSend_fakeEntitlements(v82, v83, v84);
    uint64_t v88 = objc_msgSend_count(v85, v86, v87);

    if (v88)
    {
      v89 = v60;
      v90 = (void *)MEMORY[0x1E4F28D90];
      v91 = objc_msgSend_options(v4, v76, v77);
      v94 = objc_msgSend_fakeEntitlements(v91, v92, v93);
      v96 = objc_msgSend_dataWithJSONObject_options_error_(v90, v95, (uint64_t)v94, 0, 0);

      if (v96
        && (id v97 = [NSString alloc],
            (uint64_t v99 = objc_msgSend_initWithData_encoding_(v97, v98, (uint64_t)v96, 4)) != 0))
      {
        v101 = (void *)v99;
        int v102 = 0;
        v103 = (void *)v99;
        objc_msgSend_stringByAppendingString_(v89, v100, v99);
      }
      else
      {
        int v102 = 1;
        v103 = CKShortRandomID();
        v101 = 0;
        objc_msgSend_stringByAppendingString_(v89, v104, (uint64_t)v103);
      uint64_t v105 = };

      if (v102) {
      v60 = (void *)v105;
      }
      v43 = v207;
    }
  }
  v106 = objc_msgSend_CKSafeHashStringForPathComponent(v60, v76, v77);
  objc_storeStrong((id *)v7 + 2, v106);
  v109 = objc_msgSend_deviceContext(v4, v107, v108);
  v112 = objc_msgSend_testDevice(v109, v110, v111);

  v205 = v19;
  v206 = v16;
  v201 = v60;
  if (v112)
  {
    v115 = objc_msgSend_deviceContext(v4, v113, v114);
    v118 = objc_msgSend_testDevice(v115, v116, v117);
    v121 = objc_msgSend_daemonServer(v118, v119, v120);
    v124 = objc_msgSend_dataDirectory(v121, v122, v123);

    v127 = objc_msgSend_deviceContext(v4, v125, v126);
    v130 = objc_msgSend_testDevice(v127, v128, v129);
    v133 = objc_msgSend_deviceID(v130, v131, v132);
    v135 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v134, (uint64_t)v133, 1);

    v137 = CKCurrentPersonaID();
    if (v137)
    {
      v138 = objc_msgSend_stringWithFormat_(NSString, v136, @"ClientData-%@", v137);
      v140 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v135, v139, (uint64_t)v138, 1);
    }
    else
    {
      v140 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v135, v136, @"ClientData", 1);
    }
    uint64_t v155 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v140, v141, @"cloudd_db", 1);
    v156 = (void *)*((void *)v7 + 7);
    *((void *)v7 + 7) = v155;

    v159 = objc_msgSend_applicationBundleID(v4, v157, v158);
    v162 = objc_msgSend_CKSafeStringForPathComponent(v159, v160, v161);
    v164 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v140, v163, (uint64_t)v162, 1);

    if (obj) {
      objc_storeStrong((id *)v7 + 4, v164);
    }
    uint64_t v166 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v164, v165, (uint64_t)v106, 1);
    v167 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v166;

    v169 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v164, v168, @"Caches", 1);
    uint64_t v171 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v169, v170, (uint64_t)v106, 1);
    v172 = (void *)*((void *)v7 + 6);
    *((void *)v7 + 6) = v171;

    v174 = v205;
    v173 = v206;
    v175 = v204;
  }
  else
  {
    if (obj)
    {
      objc_storeStrong((id *)v7 + 4, obj);
      v144 = objc_msgSend_containerDirectory(v7, v142, v143);
      v124 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v144, v145, @"CloudKit", 1);

      uint64_t v147 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v146, @"cloudd_db", 1);
      v148 = (void *)*((void *)v7 + 7);
      *((void *)v7 + 7) = v147;

      uint64_t v150 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v149, (uint64_t)v106, 1);
      v151 = (void *)*((void *)v7 + 5);
      *((void *)v7 + 5) = v150;

      uint64_t v153 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, v152, (uint64_t)v106, 1);
      v154 = (void *)*((void *)v7 + 6);
      *((void *)v7 + 6) = v153;
    }
    else
    {
      uint64_t v176 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, 0, @"cloudd_db", 1);
      v177 = (void *)*((void *)v7 + 7);
      *((void *)v7 + 7) = v176;

      v180 = objc_msgSend_applicationBundleID(v4, v178, v179);
      v183 = objc_msgSend_CKSafeStringForPathComponent(v180, v181, v182);
      v185 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, v184, (uint64_t)v183, 1);

      v187 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v185, v186, (uint64_t)v106, 1);

      v188 = (void *)*((void *)v7 + 4);
      *((void *)v7 + 4) = 0;

      objc_storeStrong((id *)v7 + 5, v187);
      v124 = (void *)*((void *)v7 + 6);
      *((void *)v7 + 6) = v187;
    }
    v175 = v204;
    v174 = v19;
    v173 = v206;
  }

  v190 = objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v189, (uint64_t)obj, 1);
  v191 = (void *)MEMORY[0x1E4F1A250];
  v194 = objc_msgSend_applicationBundleID(v4, v192, v193);
  v196 = objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(v191, v195, (uint64_t)v194);

  uint64_t v198 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v190, v197, (uint64_t)v196, 1);
  v199 = (void *)*((void *)v7 + 8);
  *((void *)v7 + 8) = v198;

LABEL_43:
  return (CKDDirectoryContext *)v7;
}

- (id)applicationCachesDirectoryForDataContainerDirectory:(id)a3 usingHomeCachesDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = v5;
  if (v5)
  {
    v9 = objc_msgSend_path(v5, v6, v7);
    uint64_t v11 = objc_msgSend_stringByAppendingPathComponent_(v9, v10, @"Library");
    v13 = objc_msgSend_stringByAppendingPathComponent_(v11, v12, @"Caches");
  }
  else
  {
    if (v4) {
      CKGetPersonaAwareHomeCacheDirectory();
    }
    else {
    v9 = CKGetPersonaAwareCacheDirectory();
    }
    v13 = objc_msgSend_stringByDeletingLastPathComponent(v9, v14, v15);
  }

  v16 = CKGetRealPath();

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v17 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v23 = v17;
    uint64_t v26 = objc_msgSend_CKSanitizedPath(v16, v24, v25);
    int v27 = 138412290;
    id v28 = v26;
    _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Got caches path: %@", (uint8_t *)&v27, 0xCu);
  }
  v19 = objc_msgSend_stringByAppendingPathComponent_(v16, v18, @"CloudKit");

  uint64_t v21 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v20, (uint64_t)v19, 1);

  return v21;
}

- (NSURL)packageStagingDirectory
{
  return self->_packageStagingDirectory;
}

- (NSURL)frameworkCachesDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, @"FrameworkCaches", 1);
}

- (NSURL)fileDownloadDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, @"Assets", 1);
}

- (NSURL)containerDirectory
{
  return self->_containerDirectory;
}

- (NSURL)temporaryDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, @"tmp", 1);
}

+ (id)daemonDatabaseDirectoryName
{
  return @"cloudd_db";
}

- (CKDDirectoryContext)initWithTestRootDirectory:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKDDirectoryContext;
  uint64_t v6 = [(CKDDirectoryContext *)&v33 init];
  uint64_t v7 = v6;
  if (v6)
  {
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)@"com.apple.test.container";

    v10 = objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v9, (uint64_t)v5, 0);
    objc_storeStrong((id *)&v7->_containerDirectory, a3);
    v13 = objc_msgSend_containerDirectory(v7, v11, v12);
    uint64_t v15 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v14, @"CloudKit", 1);
    uint64_t v17 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v15, v16, @"FakeTestHash", 1);
    containerCloudKitDirectory = v7->_containerCloudKitDirectory;
    v7->_containerCloudKitDirectory = (NSURL *)v17;

    uint64_t v20 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v10, v19, @"FakeTestHash", 1);
    daemonCachesDirectory = v7->_daemonCachesDirectory;
    v7->_daemonCachesDirectory = (NSURL *)v20;

    uint64_t v23 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v7->_daemonCachesDirectory, v22, @"SQLiteDBs", 1);
    daemonDatabaseDirectory = v7->_daemonDatabaseDirectory;
    v7->_daemonDatabaseDirectory = (NSURL *)v23;

    uint64_t v26 = objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v25, (uint64_t)v5, 1);
    id v28 = objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(MEMORY[0x1E4F1A250], v27, @"FakeTestStagingPathSuffix");
    uint64_t v30 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v26, v29, (uint64_t)v28, 1);
    packageStagingDirectory = v7->_packageStagingDirectory;
    v7->_packageStagingDirectory = (NSURL *)v30;
  }
  return v7;
}

- (NSURL)mmcsWorkingDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_containerCloudKitDirectory, a2, @"MMCS", 1);
}

- (NSURL)recordCacheDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_containerCloudKitDirectory, a2, @"Records", 1);
}

- (id)description
{
  return (id)((uint64_t (*)(CKDDirectoryContext *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  v39[3] = *MEMORY[0x1E4F143B8];
  v38[0] = @"containerCloudKitDirectory";
  uint64_t v6 = objc_msgSend_containerCloudKitDirectory(self, a2, a3, a4, a5);
  v9 = objc_msgSend_CKSanitizedPath(v6, v7, v8);
  v39[0] = v9;
  v38[1] = @"daemonCachesDirectory";
  uint64_t v12 = objc_msgSend_daemonCachesDirectory(self, v10, v11);
  uint64_t v15 = objc_msgSend_CKSanitizedPath(v12, v13, v14);
  v39[1] = v15;
  v38[2] = @"packageStagingDirectory";
  v18 = objc_msgSend_packageStagingDirectory(self, v16, v17);
  uint64_t v21 = objc_msgSend_CKSanitizedPath(v18, v19, v20);
  v39[2] = v21;
  uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v39, v38, 3);

  uint64_t v26 = objc_msgSend_containerDirectory(self, v24, v25);

  if (v26)
  {
    uint64_t v29 = objc_msgSend_mutableCopy(v23, v27, v28);

    v32 = objc_msgSend_containerDirectory(self, v30, v31);
    uint64_t v35 = objc_msgSend_CKSanitizedPath(v32, v33, v34);
    objc_msgSend_setObject_forKeyedSubscript_(v29, v36, (uint64_t)v35, @"containerDirectory");

    uint64_t v23 = v29;
  }
  return v23;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSString)dataSeparationHash
{
  return self->_dataSeparationHash;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSURL)containerCloudKitDirectory
{
  return self->_containerCloudKitDirectory;
}

- (NSURL)daemonCachesDirectory
{
  return self->_daemonCachesDirectory;
}

- (NSURL)daemonDatabaseDirectory
{
  return self->_daemonDatabaseDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageStagingDirectory, 0);
  objc_storeStrong((id *)&self->_daemonDatabaseDirectory, 0);
  objc_storeStrong((id *)&self->_daemonCachesDirectory, 0);
  objc_storeStrong((id *)&self->_containerCloudKitDirectory, 0);
  objc_storeStrong((id *)&self->_containerDirectory, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSeparationHash, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end