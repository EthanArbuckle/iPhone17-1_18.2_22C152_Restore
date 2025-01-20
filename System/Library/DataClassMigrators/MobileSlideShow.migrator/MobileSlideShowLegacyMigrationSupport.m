@interface MobileSlideShowLegacyMigrationSupport
+ (BOOL)requiresLegacyMigrationForLibraryURL:(id)a3;
- (BOOL)_migrateCameraRollFiles;
- (BOOL)_migrateMetadataFilesToPhotoData;
- (BOOL)performMigration;
- (MobileSlideShowLegacyMigrationSupport)initWithLibraryURL:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (void)_generateMigrationFilegroupsAndOptions;
- (void)_migrateAssetsdPreferencesDomain;
- (void)_removeOldLargeThubnails;
@end

@implementation MobileSlideShowLegacyMigrationSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_strayFileGroups, 0);
  objc_storeStrong((id *)&self->_fileGroupProcessingOptions, 0);

  objc_storeStrong((id *)&self->_fileGroupsToMigrate, 0);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)_removeOldLargeThubnails
{
  v3 = +[PLFileUtilities fileManager];
  v4 = [(MobileSlideShowLegacyMigrationSupport *)self pathManager];
  uint64_t v5 = [v4 photoDirectoryWithType:28];

  v20 = (void *)v5;
  uint64_t v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  NSURLResourceKey v32 = NSURLNameKey;
  v7 = +[NSArray arrayWithObjects:&v32 count:1];
  v19 = (void *)v6;
  v8 = [v3 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:1 errorHandler:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v22 = 7;
        if (+[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:v14 assetsKind:&v22])BOOL v15 = v22 > 1; {
        else
        }
          BOOL v15 = 1;
        if (!v15)
        {
          id v21 = 0;
          unsigned __int8 v16 = [v3 removeItemAtURL:v14 error:&v21];
          id v17 = v21;
          if ((v16 & 1) == 0)
          {
            v18 = PLMigrationGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v28 = v14;
              __int16 v29 = 2112;
              id v30 = v17;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Could not remove the old large thumbnails directory %@. Error: %@", buf, 0x16u);
            }
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v11);
  }
}

- (BOOL)_migrateMetadataFilesToPhotoData
{
  v2 = [(MobileSlideShowLegacyMigrationSupport *)self pathManager];
  v3 = [v2 photoDirectoryWithType:1];

  v4 = [v3 stringByAppendingPathComponent:@"DCIM"];
  uint64_t v5 = [v3 stringByAppendingPathComponent:@"PhotoData/MISC"];
  uint64_t v6 = [v3 stringByAppendingPathComponent:@"PhotoData"];
  v7 = [v3 stringByAppendingPathComponent:@"Photos/Videos"];
  v130 = [v4 stringByAppendingPathComponent:@".MISC"];
  v8 = [v6 stringByAppendingPathComponent:@"Videos"];
  v129 = +[PLFileUtilities fileManager];
  v126 = v6;
  if (([v129 fileExistsAtPath:v6] & 1) == 0)
  {
    id v159 = 0;
    unsigned __int8 v9 = +[PLFileUtilities createDirectoryAtPath:v6 error:&v159];
    id v10 = v159;
    if ((v9 & 1) == 0)
    {
      id v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v167 = v126;
        __int16 v168 = 2114;
        v169 = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Unable to create directory: %{public}@, reason: %{public}@", buf, 0x16u);
      }
    }
  }
  uint64_t v12 = v129;
  if (([v129 fileExistsAtPath:v130] & 1) != 0
    || ([v129 fileExistsAtPath:v8] & 1) == 0)
  {
    v124 = v4;
    v125 = v5;
    v118 = v8;
    if (![v129 fileExistsAtPath:v130])
    {
LABEL_42:
      id v151 = 0;
      v33 = [v12 contentsOfDirectoryAtPath:v4 error:&v151];
      id v116 = v151;
      v117 = v33;
      if (v116)
      {
        v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v167 = v4;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@. No *APPLE or *IMPRT directories will be migrated.", buf, 0xCu);
        }
        LODWORD(v13) = 1;
        goto LABEL_90;
      }
      v114 = v3;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      v34 = v33;
      id v35 = [v34 countByEnumeratingWithState:&v147 objects:v165 count:16];
      if (!v35)
      {
        LODWORD(v13) = 1;
        goto LABEL_90;
      }
      id v36 = v35;
      v112 = v7;
      uint64_t v127 = *(void *)v148;
      while (1)
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v148 != v127) {
            objc_enumerationMutation(v34);
          }
          v38 = *(void **)(*((void *)&v147 + 1) + 8 * i);
          [v38 rangeOfString:@"APPLE"];
          if (!v39)
          {
            [v38 rangeOfString:@"IMPRT"];
            if (!v40) {
              continue;
            }
          }
          v41 = [v4 stringByAppendingPathComponent:v38];
          v42 = [v41 stringByAppendingPathComponent:@".MISC"];

          v43 = [v126 stringByAppendingPathComponent:v38];
          v44 = v129;
          v45 = [v129 contentsOfDirectoryAtPath:v42 error:0];
          if ([v129 fileExistsAtPath:v42] && objc_msgSend(v45, "count"))
          {
            if ([v129 fileExistsAtPath:v43])
            {
              id v145 = 0;
              unsigned __int8 v46 = [v129 removeItemAtPath:v43 error:&v145];
              v47 = v145;
              v48 = v47;
              if (v46)
              {

                v44 = v129;
                goto LABEL_58;
              }
              uint64_t v5 = v125;
              if (v47)
              {
                v59 = PLMigrationGetLog();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v167 = v43;
                  __int16 v168 = 2114;
                  v169 = v42;
                  __int16 v170 = 2114;
                  v171 = v48;
                  v60 = v59;
                  v61 = "Failed to delete existing %{public}@ [Migration will skip %{public}@.] Error: %{public}@";
                  uint32_t v62 = 32;
LABEL_78:
                  _os_log_impl(&dword_0, v60, OS_LOG_TYPE_ERROR, v61, buf, v62);
                }
                goto LABEL_79;
              }
              goto LABEL_80;
            }
LABEL_58:
            NSFileAttributeKey v163 = NSFileProtectionKey;
            NSFileProtectionType v164 = NSFileProtectionCompleteUntilFirstUserAuthentication;
            v49 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
            id v144 = 0;
            unsigned __int8 v50 = [v44 setAttributes:v49 ofItemAtPath:v42 error:&v144];
            v51 = v144;

            if ((v50 & 1) == 0)
            {
              v52 = PLMigrationGetLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v167 = v42;
                __int16 v168 = 2114;
                v169 = v51;
                _os_log_impl(&dword_0, v52, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%{public}@\": %{public}@", buf, 0x16u);
              }
            }
            id v143 = 0;
            unsigned __int8 v53 = [v129 moveItemAtPath:v42 toPath:v43 error:&v143];
            v54 = v143;
            v55 = v54;
            if ((v53 & 1) == 0 && v54)
            {
              v56 = PLMigrationGetLog();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v167 = v42;
                __int16 v168 = 2114;
                v169 = v43;
                __int16 v170 = 2114;
                v171 = v55;
                _os_log_impl(&dword_0, v56, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ to %{public}@ [Migration will fail.] Error: %{public}@", buf, 0x20u);
              }
            }
            v4 = v124;
            uint64_t v5 = v125;
            if ((v53 & 1) == 0)
            {

              LODWORD(v13) = 0;
              goto LABEL_85;
            }
          }
          else if ([v129 fileExistsAtPath:v42])
          {
            id v146 = 0;
            unsigned __int8 v57 = [v129 removeItemAtPath:v42 error:&v146];
            v58 = v146;
            v48 = v58;
            if ((v57 & 1) != 0 || !v58)
            {
              uint64_t v5 = v125;
            }
            else
            {
              v59 = PLMigrationGetLog();
              uint64_t v5 = v125;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v167 = v42;
                __int16 v168 = 2114;
                v169 = v48;
                v60 = v59;
                v61 = "Failed to remove empty %{public}@. Error: %{public}@";
                uint32_t v62 = 22;
                goto LABEL_78;
              }
LABEL_79:
            }
LABEL_80:
          }
          continue;
        }
        id v36 = [v34 countByEnumeratingWithState:&v147 objects:v165 count:16];
        if (!v36)
        {
          LODWORD(v13) = 1;
LABEL_85:
          v7 = v112;
          v3 = v114;
LABEL_90:

          v63 = [v5 stringByAppendingPathComponent:@"Info.plist"];
          v64 = v129;
          v128 = v63;
          v8 = v118;
          if ([v129 fileExistsAtPath:v63])
          {
            uint64_t v65 = +[PLSimpleDCIMDirectory cameraRollPlistName];
            v66 = v5;
            v67 = (void *)v65;
            v68 = [v66 stringByAppendingPathComponent:v65];

            if (([v129 fileExistsAtPath:v68] & 1) == 0)
            {
              v69 = +[NSDictionary dictionaryWithContentsOfFile:v63];
              v70 = +[PLSimpleDCIMDirectory migrateOldPlistToNewPlist:v69];
              if (v70)
              {
                v71 = v7;
                v72 = +[NSPropertyListSerialization dataWithPropertyList:v70 format:100 options:0 error:0];
                [v72 writeToFile:v68 options:1073741825 error:0];
                id v142 = 0;
                unsigned __int8 v73 = +[PLFileUtilities changeFileOwnerToMobileAtPath:v68 error:&v142];
                v74 = v142;
                if ((v73 & 1) == 0)
                {
                  v75 = PLMigrationGetLog();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v167 = v68;
                    __int16 v168 = 2114;
                    v169 = v74;
                    _os_log_impl(&dword_0, v75, OS_LOG_TYPE_ERROR, "Unable to change owner of file at path: %{public}@, reason: %{public}@", buf, 0x16u);
                  }

                  v4 = v124;
                }

                v7 = v71;
                v8 = v118;
                v63 = v128;
              }
            }
            v64 = v129;
            [v129 removeItemAtPath:v63 error:0];

            uint64_t v5 = v125;
          }
          if (([v64 fileExistsAtPath:v8] & 1) == 0)
          {
            id v141 = 0;
            unsigned __int8 v76 = +[PLFileUtilities createDirectoryAtPath:v8 error:&v141];
            v77 = v141;
            if (v76)
            {

              if (v13)
              {
                id v140 = 0;
                v78 = [v129 subpathsOfDirectoryAtPath:v7 error:&v140];
                v110 = v140;
                if (!v78)
                {
                  if ([v129 fileExistsAtPath:v7 isDirectory:0])
                  {
                    v105 = PLMigrationGetLog();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v167 = v7;
                      __int16 v168 = 2114;
                      v169 = v110;
                      _os_log_impl(&dword_0, v105, OS_LOG_TYPE_ERROR, "Failed to enumerate old iTunes videos paths at %{public}@ [Migration will continue.] Error: %{public}@", buf, 0x16u);
                    }
                  }
                  v79 = 0;
                  LOBYTE(v13) = 1;
                  goto LABEL_157;
                }
                long long v138 = 0u;
                long long v139 = 0u;
                long long v136 = 0u;
                long long v137 = 0u;
                v79 = v78;
                id v123 = [v79 countByEnumeratingWithState:&v136 objects:v162 count:16];
                if (!v123)
                {
                  LOBYTE(v13) = 1;
                  goto LABEL_156;
                }
                v115 = v3;
                uint64_t v122 = *(void *)v137;
                *(void *)&long long v80 = 138543874;
                long long v109 = v80;
                v120 = v79;
LABEL_106:
                v81 = 0;
                while (1)
                {
                  if (*(void *)v137 != v122) {
                    objc_enumerationMutation(v79);
                  }
                  uint64_t v82 = *(void *)(*((void *)&v136 + 1) + 8 * (void)v81);
                  v13 = -[NSObject stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v82, v109);
                  char v135 = 0;
                  if ([v129 fileExistsAtPath:v13 isDirectory:&v135]) {
                    BOOL v83 = v135 == 0;
                  }
                  else {
                    BOOL v83 = 1;
                  }
                  if (v83)
                  {
                    if (!v135) {
                      goto LABEL_131;
                    }
                  }
                  else
                  {
                    v84 = [v13 pathExtension];
                    unsigned __int8 v85 = [v84 isEqualToString:@"MISC"];

                    if ((v85 & 1) == 0) {
                      goto LABEL_131;
                    }
                  }
                  v86 = [v8 stringByAppendingPathComponent:v82];
                  v87 = [v86 stringByDeletingLastPathComponent];
                  if ([v129 fileExistsAtPath:v87])
                  {
                    id v134 = 0;
                    unsigned __int8 v88 = [v129 removeItemAtPath:v87 error:&v134];
                    v89 = v134;
                    v90 = v89;
                    if ((v88 & 1) == 0)
                    {
                      uint64_t v5 = v125;
                      v3 = v115;
                      if (v89)
                      {
                        v107 = PLMigrationGetLog();
                        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v167 = v87;
                          __int16 v168 = 2114;
                          v169 = v90;
                          _os_log_impl(&dword_0, v107, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ to replace it with the current version [Migration will fail.] Error: %{public}@", buf, 0x16u);
                        }

                        v79 = v120;
                      }

                      goto LABEL_155;
                    }
                  }
                  id v133 = 0;
                  unsigned __int8 v91 = +[PLFileUtilities createDirectoryAtPath:v87 error:&v133];
                  v92 = v133;
                  v93 = v92;
                  if ((v91 & 1) == 0)
                  {
                    uint64_t v5 = v125;
                    v3 = v115;
                    if (v92)
                    {
                      v106 = PLMigrationGetLog();
                      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v167 = v87;
                        __int16 v168 = 2114;
                        v169 = v93;
                        _os_log_impl(&dword_0, v106, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ to hold the video's metadata [Migration will fail.] Error: %{public}@", buf, 0x16u);
                      }

                      v79 = v120;
                    }

                    v4 = v124;
LABEL_155:

                    LOBYTE(v13) = 0;
                    v63 = v128;
                    goto LABEL_156;
                  }
                  v94 = v8;
                  v95 = v7;
                  NSFileAttributeKey v160 = NSFileProtectionKey;
                  NSFileProtectionType v161 = NSFileProtectionCompleteUntilFirstUserAuthentication;
                  v96 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
                  id v132 = 0;
                  unsigned __int8 v97 = [v129 setAttributes:v96 ofItemAtPath:v13 error:&v132];
                  v98 = v132;

                  if ((v97 & 1) == 0)
                  {
                    v99 = PLMigrationGetLog();
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v167 = v13;
                      __int16 v168 = 2114;
                      v169 = v98;
                      _os_log_impl(&dword_0, v99, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%{public}@\": %{public}@", buf, 0x16u);
                    }
                  }
                  id v131 = 0;
                  unsigned __int8 v100 = [v129 moveItemAtPath:v13 toPath:v86 error:&v131];
                  v101 = v131;
                  v102 = v101;
                  if ((v100 & 1) == 0 && v101)
                  {
                    v103 = PLMigrationGetLog();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v109;
                      v167 = v13;
                      __int16 v168 = 2114;
                      v169 = v86;
                      __int16 v170 = 2114;
                      v171 = v102;
                      _os_log_impl(&dword_0, v103, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ to %{public}@ [Migration will continue.] Error: %{public}@", buf, 0x20u);
                    }
                  }
                  v4 = v124;
                  v7 = v95;
                  v8 = v94;
                  v63 = v128;
                  v79 = v120;
LABEL_131:

                  v81 = (char *)v81 + 1;
                  uint64_t v5 = v125;
                  if (v123 == v81)
                  {
                    id v123 = [v79 countByEnumeratingWithState:&v136 objects:v162 count:16];
                    if (v123) {
                      goto LABEL_106;
                    }
                    LOBYTE(v13) = 1;
                    v3 = v115;
LABEL_156:

LABEL_157:
                    v104 = v110;
                    goto LABEL_158;
                  }
                }
              }
            }
            else
            {
              if (v77)
              {
                v110 = v77;
                v79 = PLMigrationGetLog();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v167 = v8;
                  __int16 v168 = 2114;
                  v169 = v110;
                  _os_log_impl(&dword_0, v79, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ [Migration will fail.] Error: %{public}@", buf, 0x16u);
                }
                LOBYTE(v13) = 0;
                goto LABEL_157;
              }
              v104 = 0;
              LOBYTE(v13) = 0;
LABEL_158:
            }
          }

          goto LABEL_160;
        }
      }
    }
    id v158 = 0;
    uint64_t v14 = [v129 contentsOfDirectoryAtPath:v130 error:&v158];
    BOOL v15 = v158;
    if ([v14 count])
    {
      id v157 = 0;
      unsigned __int8 v16 = +[PLFileUtilities createDirectoryAtPath:v5 error:&v157];
      id v17 = v157;
      if ((v16 & 1) == 0)
      {
        v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v167 = v5;
          __int16 v168 = 2114;
          v169 = v17;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@ Error: %{public}@", buf, 0x16u);
        }
      }
      v119 = v17;
      v121 = v15;
      v111 = v7;
      v113 = v3;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      id v19 = v14;
      id v20 = [v19 countByEnumeratingWithState:&v153 objects:v172 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v154;
        do
        {
          long long v23 = 0;
          do
          {
            if (*(void *)v154 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v153 + 1) + 8 * (void)v23);
            long long v25 = [v130 stringByAppendingPathComponent:v24];
            long long v26 = [v5 stringByAppendingPathComponent:v24];
            if ([v19 count] == (char *)&dword_0 + 1
              && [v24 isEqualToString:@"Info.plist"]
              && ([v129 fileExistsAtPath:v26] & 1) != 0
              || ([v24 isEqualToString:@"Incoming"] & 1) != 0
              || ([v24 isEqualToString:@"Timelapse"] & 1) != 0
              || ([v24 isEqualToString:@"LastTimelapse"] & 1) != 0
              || ([v24 isEqualToString:@"Iris"] & 1) != 0
              || ([v24 isEqualToString:@"nebuladkeepalive"] & 1) != 0)
            {
              v27 = 0;
            }
            else
            {
              id v152 = 0;
              unsigned __int8 v28 = [v129 moveItemAtPath:v25 toPath:v26 error:&v152];
              __int16 v29 = v152;
              v27 = v29;
              if ((v28 & 1) == 0 && v29)
              {
                id v30 = PLMigrationGetLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v167 = v25;
                  __int16 v168 = 2114;
                  v169 = v26;
                  __int16 v170 = 2114;
                  v171 = v27;
                  _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ to %{public}@ [Migration will continue.] Error: %{public}@", buf, 0x20u);
                }
              }
              uint64_t v5 = v125;
            }

            long long v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          id v31 = [v19 countByEnumeratingWithState:&v153 objects:v172 count:16];
          id v21 = v31;
        }
        while (v31);
      }

      v7 = v111;
      v3 = v113;
      uint64_t v12 = v129;
      BOOL v15 = v121;
      NSURLResourceKey v32 = v119;
    }
    else
    {
      if (!v15) {
        goto LABEL_41;
      }
      NSURLResourceKey v32 = PLMigrationGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v167 = v130;
        __int16 v168 = 2114;
        v169 = v5;
        __int16 v170 = 2114;
        v171 = v15;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@. Its files won't be moved to %{public}@. Error %{public}@", buf, 0x20u);
      }
    }

LABEL_41:
    goto LABEL_42;
  }
  LOBYTE(v13) = 1;
LABEL_160:

  return (char)v13;
}

- (BOOL)_migrateCameraRollFiles
{
  [(MobileSlideShowLegacyMigrationSupport *)self _generateMigrationFilegroupsAndOptions];
  id v30 = self;
  v3 = (char *)[(NSMutableArray *)self->_fileGroupsToMigrate count];
  v4 = +[PLFileUtilities fileManager];
  __int16 v29 = v3;
  if ((uint64_t)v3 >= 1)
  {
    uint64_t v6 = 0;
    *(void *)&long long v5 = 138543618;
    long long v28 = v5;
    do
    {
      v7 = -[NSMutableArray objectAtIndex:](v30->_fileGroupsToMigrate, "objectAtIndex:", v6, v28);
      v8 = [(NSMutableArray *)v30->_fileGroupProcessingOptions objectAtIndex:v6];
      unsigned __int8 v9 = [v8 intValue];

      [v7 createMetadataDirectoryIfNecessary];
      id v10 = [v7 pathForContainingDirectory];
      id v11 = [v7 pathForThumbnailFile];
      uint64_t v12 = [v7 thumbnailFilename];
      v13 = [v10 stringByAppendingPathComponent:v12];

      NSFileAttributeKey v41 = NSFileProtectionKey;
      NSFileProtectionType v42 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v35 = 0;
      BOOL v15 = v4;
      unsigned __int8 v16 = [v4 setAttributes:v14 ofItemAtPath:v13 error:&v35];
      id v17 = v35;

      if ((v16 & 1) == 0 && [v17 code] != &dword_4)
      {
        v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v38 = v13;
          __int16 v39 = 2114;
          id v40 = v17;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }
      v4 = v15;
      [v15 moveItemAtPath:v13 toPath:v11 error:0];
      if ((v9 & 0x10) != 0) {
        [v7 deleteObsoleteFiles];
      }
      if ((v9 & 0x20) != 0) {
        [v7 deleteFiles];
      }
      else {
        [v7 setWriteIsPending:0];
      }

      ++v6;
    }
    while (v29 != v6);
  }
  strayFileGroups = v30->_strayFileGroups;
  if (strayFileGroups)
  {
    id v20 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = strayFileGroups;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v26 deleteFiles];
          [v26 setWriteIsPending:0];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v23);
    }

    v4 = v20;
  }

  return 1;
}

- (void)_generateMigrationFilegroupsAndOptions
{
  v2 = self;
  v3 = [(MobileSlideShowLegacyMigrationSupport *)self pathManager];
  v4 = [v3 photoDirectoryWithType:4];

  long long v5 = +[PLFileUtilities fileManager];
  if ([v5 fileExistsAtPath:v4])
  {
    int v38 = MGGetBoolAnswer();
    long long v31 = v4;
    id v30 = [objc_alloc((Class)PLPhotoDCIMDirectory) initWithDCIMPath:v4];
    [v30 dcfDirectories];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v34 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (!v34) {
      goto LABEL_44;
    }
    uint64_t v33 = *(void *)v49;
    v37 = v5;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v6;
        v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        [v7 setConsiderInvalidFileGroups:1];
        v8 = [v7 fileGroups];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v39 = v8;
        id v41 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v41)
        {
          uint64_t v40 = *(void *)v45;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v45 != v40) {
                objc_enumerationMutation(v39);
              }
              id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              unsigned int v12 = [v10 hasVideoFile];
              if (v12) {
                [v10 pathForVideoFile];
              }
              else {
              v13 = [v10 pathForFullSizeImage];
              }
              uint64_t v14 = [v10 pathForThumbnailFile];
              v43 = [v10 pathForPrebakedThumbnail];
              unsigned int v15 = [v10 hasObsoleteFiles];
              unsigned int v16 = [v5 fileExistsAtPath:v13];
              if ((v16 & 1) == 0 && !v15)
              {
                [(NSMutableArray *)v2->_strayFileGroups addObject:v10];
                goto LABEL_40;
              }
              if (v15) {
                int v17 = 16;
              }
              else {
                int v17 = 0;
              }
              if (v16) {
                int v18 = v17;
              }
              else {
                int v18 = v17 | 0x20;
              }
              NSFileProtectionType v42 = v11;
              if (v12)
              {
                id v19 = [v10 pathForVideoPreviewFile];
                unsigned int v20 = [v5 fileExistsAtPath:v19];

                if (v20) {
                  v18 |= 8u;
                }
              }
              else
              {
                unsigned int v20 = 0;
              }
              if (v38)
              {
                id v21 = [v10 pathForPrebakedWildcatThumbnailsFile];
                unsigned int v22 = [v5 fileExistsAtPath:v21];
                id v23 = v2;
                unsigned int v24 = v22;

                BOOL v25 = v24 == 0;
                v2 = v23;
                if (v25) {
                  v18 |= 4u;
                }
              }
              id v11 = v42;
              if ((v12 & 1) == 0)
              {
                long long v5 = v37;
                if (![v37 fileExistsAtPath:v43]) {
                  v18 |= 2u;
                }
                unsigned int v26 = [v37 fileExistsAtPath:v14];
LABEL_39:
                uint64_t v27 = v18 | v26 ^ 1;
                [(NSMutableArray *)v2->_fileGroupsToMigrate addObject:v10];
                fileGroupProcessingOptions = v2->_fileGroupProcessingOptions;
                __int16 v29 = +[NSNumber numberWithInt:v27];
                [(NSMutableArray *)fileGroupProcessingOptions addObject:v29];

                id v11 = v42;
                goto LABEL_40;
              }
              long long v5 = v37;
              unsigned int v26 = [v37 fileExistsAtPath:v14];
              if (v20) {
                goto LABEL_39;
              }
LABEL_40:
              [v10 setWriteIsPending:1];
            }
            id v41 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v41);
        }

        uint64_t v6 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v34)
      {
LABEL_44:

        v4 = v31;
        break;
      }
    }
  }
}

- (void)_migrateAssetsdPreferencesDomain
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"DCFLastDirectoryNumber", @"assetsd");
  if (v2)
  {
    v3 = v2;
    CFPreferencesSetAppValue(@"DCFLastDirectoryNumber", v2, @"com.apple.assetsd");
    CFPreferencesAppSynchronize(@"com.apple.assetsd");
    CFPreferencesSetAppValue(@"DCFLastDirectoryNumber", 0, @"assetsd");
    CFPreferencesAppSynchronize(@"assetsd");
    CFRelease(v3);
  }
}

- (BOOL)performMigration
{
  [(MobileSlideShowLegacyMigrationSupport *)self _migrateAssetsdPreferencesDomain];
  if ([(MobileSlideShowLegacyMigrationSupport *)self _migrateCameraRollFiles]) {
    BOOL v3 = [(MobileSlideShowLegacyMigrationSupport *)self _migrateMetadataFilesToPhotoData];
  }
  else {
    BOOL v3 = 0;
  }
  [(MobileSlideShowLegacyMigrationSupport *)self _removeOldLargeThubnails];
  return v3;
}

- (MobileSlideShowLegacyMigrationSupport)initWithLibraryURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MobileSlideShowLegacyMigrationSupport;
  long long v5 = [(MobileSlideShowLegacyMigrationSupport *)&v15 init];
  if (v5)
  {
    uint64_t v6 = (PLPhotoLibraryPathManager *)[objc_alloc((Class)PLPhotoLibraryPathManager) initWithLibraryURL:v4];
    pathManager = v5->_pathManager;
    v5->_pathManager = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fileGroupsToMigrate = v5->_fileGroupsToMigrate;
    v5->_fileGroupsToMigrate = v8;

    id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fileGroupProcessingOptions = v5->_fileGroupProcessingOptions;
    v5->_fileGroupProcessingOptions = v10;

    unsigned int v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    strayFileGroups = v5->_strayFileGroups;
    v5->_strayFileGroups = v12;
  }
  return v5;
}

+ (BOOL)requiresLegacyMigrationForLibraryURL:(id)a3
{
  return 1;
}

@end