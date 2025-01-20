@interface PHImportDuplicateChecker
+ (id)_dateWithDate:(id)a3;
+ (id)_fetchAssetInfoFromLibrary:(id)a3 forFileSizes:(id)a4;
+ (id)duplicatesFromResults:(id)a3 forLibrary:(id)a4;
- (BOOL)_findFingerprint:(id)a3 forItem:(id)a4 inCache:(id)a5 considerTrash:(BOOL)a6;
- (PHImportDuplicateChecker)initWithLibrary:(id)a3;
- (PHPhotoLibrary)library;
- (id)_checkForDuplicate:(id)a3 considerItemsInTheTrash:(BOOL)a4;
- (id)_filterDuplicatesForItem:(id)a3 duplicateSet:(id)a4 considerItemsInTrash:(BOOL)a5;
- (id)_findMatchingAssetsForItem:(id)a3 inSet:(id)a4 matchingDate:(id *)a5 confidence:(unsigned __int8 *)a6;
- (unint64_t)_populateCachesWithAssetsInfos:(id)a3;
- (void)_populateCachesWithAssetInfo:(id)a3;
- (void)_setDupInfo:(id)a3 forFingerprint:(id)a4 inCache:(id)a5;
- (void)_updateAssetsFromDupInfos;
- (void)findDuplicatesOfItems:(id)a3 considerItemsInTrash:(BOOL)a4 forEach:(id)a5 atEnd:(id)a6;
- (void)setLibrary:(id)a3;
@end

@implementation PHImportDuplicateChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_updatedDupInfos, 0);
  objc_storeStrong((id *)&self->_lastChange, 0);
  objc_storeStrong((id *)&self->_assetIdentifierCache, 0);
  objc_storeStrong((id *)&self->_sizeNameCache, 0);

  objc_storeStrong((id *)&self->_avchdAssetIdentifierCache, 0);
}

- (void)setLibrary:(id)a3
{
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)findDuplicatesOfItems:(id)a3 considerItemsInTrash:(BOOL)a4 forEach:(id)a5 atEnd:(id)a6
{
  BOOL v35 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void *, void *, void))a5;
  v33 = (void (**)(id, void *))a6;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v41 + 1) + 8 * i) sizeKey];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v13);
  }

  v32 = v10;
  v31 = +[PHImportDuplicateChecker _fetchAssetInfoFromLibrary:self->_library forFileSizes:v10];
  -[PHImportDuplicateChecker _populateCachesWithAssetsInfos:](self, "_populateCachesWithAssetsInfos:");
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v18 = v17;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v11;
  uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = 0;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        int v25 = [v24 isDuplicate];
        v26 = [(PHImportDuplicateChecker *)self _checkForDuplicate:v24 considerItemsInTheTrash:v35];
        if (v26)
        {
          if (!v21) {
            v21 = objc_opt_new();
          }
          v27 = [v24 uuid];
          [v21 setObject:v26 forKey:v27];
        }
        if (v9) {
          v9[2](v9, v24, v26, v25 ^ [v24 isDuplicate]);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  v28 = PLImportGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = [v31 count];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    uint64_t v46 = v29;
    __int16 v47 = 2048;
    double v48 = v30 - v18;
    _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: time to CHECK caches for %lu asset infos: %g", buf, 0x16u);
  }

  if (v33) {
    v33[2](v33, v21);
  }
  [(PHImportDuplicateChecker *)self _updateAssetsFromDupInfos];
}

- (id)_checkForDuplicate:(id)a3 considerItemsInTheTrash:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  uint64_t v7 = [v6 lastDuplicateCheck];
  if (!v7
    || (id v8 = (void *)v7,
        [v6 lastDuplicateCheck],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 compare:self->_lastChange],
        v9,
        v8,
        v10 == -1))
  {
    [v6 setIsDuplicate:0];
    v24 = [v6 avchdAssetId];
    BOOL v25 = [(PHImportDuplicateChecker *)self _findFingerprint:v24 forItem:v6 inCache:self->_avchdAssetIdentifierCache considerTrash:v4];

    if (v25)
    {
      v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = [v6 nameKey];
        v28 = [v6 originatingAssetID];
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        __int16 v225 = 2112;
        v226 = v28;
        uint64_t v29 = "DUPLICATE CHECK: name: %@, avchdAssetId (UUID): %@ ==> FOUND";
LABEL_20:
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, v29, buf, 0x16u);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    double v30 = [v6 fingerprint];
    BOOL v31 = [(PHImportDuplicateChecker *)self _findFingerprint:v30 forItem:v6 inCache:self->_assetIdentifierCache considerTrash:v4];

    if (v31)
    {
      v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = [v6 nameKey];
        v28 = [v6 originatingAssetID];
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        __int16 v225 = 2112;
        v226 = v28;
        uint64_t v29 = "DUPLICATE CHECK: name: %@, assetId (fingerprint): %@ ==> FOUND";
        goto LABEL_20;
      }
LABEL_21:

LABEL_22:
      uint64_t v14 = 0;
      goto LABEL_23;
    }
    long long v38 = [v6 originatingAssetID];
    BOOL v39 = [(PHImportDuplicateChecker *)self _findFingerprint:v38 forItem:v6 inCache:self->_assetIdentifierCache considerTrash:v4];

    if (v39)
    {
      v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = [v6 nameKey];
        v28 = [v6 originatingAssetID];
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        __int16 v225 = 2112;
        v226 = v28;
        uint64_t v29 = "DUPLICATE CHECK: name: %@, originatingAssetID (fingerprint): %@ ==> FOUND";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    uint64_t v41 = [v6 sizeKey];
    long long v42 = [v6 nameKey];
    v185 = (void *)v41;
    if (!v41 || !v42)
    {

LABEL_67:
      goto LABEL_22;
    }
    v167 = v42;
    sizeNameCache = self->_sizeNameCache;
    if (sizeNameCache)
    {
      v166 = [(NSMutableDictionary *)sizeNameCache objectForKeyedSubscript:v41];
      if (v166)
      {
        long long v44 = [v6 url];
        id v217 = 0;
        uint64_t v45 = *MEMORY[0x1E4F1C8C8];
        id v216 = 0;
        v163 = v44;
        int v46 = [v44 getResourceValue:&v217 forKey:v45 error:&v216];
        id v165 = v217;
        v170 = v6;
        v164 = v216;
        if (v164)
        {
          __int16 v47 = PLImportGetLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            double v48 = [v6 sizeKey];
            v49 = [v6 nameKey];
            v50 = [v6 fileName];
            uint64_t v51 = [v6 dateKey];
            v52 = +[PHImportDuplicateChecker _dateWithDate:v51];
            *(_DWORD *)buf = 138413314;
            v224 = v48;
            __int16 v225 = 2112;
            v226 = v49;
            __int16 v227 = 2112;
            v228 = v50;
            __int16 v229 = 2112;
            v230 = v52;
            __int16 v231 = 2112;
            v232 = v164;
            _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: ERROR => File case sensitivity checking:\n%@", buf, 0x34u);

            v6 = v170;
          }
        }
        if (v46) {
          int v46 = [v165 BOOLValue];
        }
        uint64_t v161 = [v167 lowercaseString];
        v53 = objc_msgSend(v166, "objectForKeyedSubscript:");
        v54 = v53;
        if (v46)
        {
          unsigned int v182 = v4;
          v55 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v53, "count"));
          long long v212 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          id v56 = v54;
          uint64_t v57 = [v56 countByEnumeratingWithState:&v212 objects:v236 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v213;
            do
            {
              for (uint64_t i = 0; i != v58; ++i)
              {
                if (*(void *)v213 != v59) {
                  objc_enumerationMutation(v56);
                }
                v61 = *(void **)(*((void *)&v212 + 1) + 8 * i);
                v62 = [v170 fileName];
                v63 = [v61 fileName];
                int v64 = [v62 isEqualToString:v63];

                if (v64) {
                  [v55 addObject:v61];
                }
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v212 objects:v236 count:16];
            }
            while (v58);
          }

          v6 = v170;
          v54 = v55;
          uint64_t v4 = v182;
        }
        v162 = v54;
        if (!v54)
        {
          v67 = objc_opt_new();
          long long v194 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          long long v197 = 0u;
          obuint64_t j = v166;
          uint64_t v169 = [obj countByEnumeratingWithState:&v194 objects:v220 count:16];
          if (v169)
          {
            uint64_t v168 = *(void *)v195;
            do
            {
              uint64_t v84 = 0;
              do
              {
                if (*(void *)v195 != v168) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v171 = v84;
                uint64_t v85 = *(void *)(*((void *)&v194 + 1) + 8 * v84);
                long long v190 = 0u;
                long long v191 = 0u;
                long long v192 = 0u;
                long long v193 = 0u;
                uint64_t v175 = v85;
                objc_msgSend(obj, "objectForKeyedSubscript:");
                id v180 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v86 = [v180 countByEnumeratingWithState:&v190 objects:v219 count:16];
                if (v86)
                {
                  uint64_t v87 = v86;
                  uint64_t v88 = *(void *)v191;
                  uint64_t v172 = *(void *)v191;
                  do
                  {
                    uint64_t v89 = 0;
                    uint64_t v178 = v87;
                    do
                    {
                      if (*(void *)v191 != v88) {
                        objc_enumerationMutation(v180);
                      }
                      uint64_t v90 = *(void *)(*((void *)&v190 + 1) + 8 * v89);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v183 = v89;
                        long long v188 = 0u;
                        long long v189 = 0u;
                        long long v186 = 0u;
                        long long v187 = 0u;
                        v91 = [obj objectForKeyedSubscript:v175];
                        v92 = [v91 objectForKeyedSubscript:v90];

                        uint64_t v93 = [v92 countByEnumeratingWithState:&v186 objects:v218 count:16];
                        if (v93)
                        {
                          uint64_t v94 = v93;
                          uint64_t v95 = *(void *)v187;
                          do
                          {
                            for (uint64_t j = 0; j != v94; ++j)
                            {
                              if (*(void *)v187 != v95) {
                                objc_enumerationMutation(v92);
                              }
                              v97 = *(void **)(*((void *)&v186 + 1) + 8 * j);
                              if (([v97 isInTrash] & 1) == 0)
                              {
                                v98 = NSString;
                                v99 = [v97 fileName];
                                v100 = [v98 stringWithFormat:@"[size: %@, name: %@, date: %@]", v185, v99, v90];
                                [v67 addObject:v100];
                              }
                            }
                            uint64_t v94 = [v92 countByEnumeratingWithState:&v186 objects:v218 count:16];
                          }
                          while (v94);
                        }

                        uint64_t v88 = v172;
                        uint64_t v87 = v178;
                        uint64_t v89 = v183;
                      }
                      ++v89;
                    }
                    while (v89 != v87);
                    uint64_t v87 = [v180 countByEnumeratingWithState:&v190 objects:v219 count:16];
                  }
                  while (v87);
                }

                uint64_t v84 = v171 + 1;
              }
              while (v171 + 1 != v169);
              uint64_t v169 = [obj countByEnumeratingWithState:&v194 objects:v220 count:16];
            }
            while (v169);
          }

          v101 = PLImportGetLog();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v102 = [v170 sizeKey];
            v103 = [v170 nameKey];
            v104 = [v170 fileName];
            v105 = [v170 dateKey];
            v106 = +[PHImportDuplicateChecker _dateWithDate:v105];
            *(_DWORD *)buf = 138413058;
            v224 = v102;
            __int16 v225 = 2112;
            v226 = v103;
            __int16 v227 = 2112;
            v228 = v104;
            __int16 v229 = 2112;
            v230 = v106;
            _os_log_impl(&dword_19B043000, v101, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No matching name.", buf, 0x2Au);
          }
          if (![v67 count])
          {
            uint64_t v14 = 0;
            v109 = (void *)v161;
LABEL_138:

            v6 = v170;
            goto LABEL_23;
          }
          v107 = PLImportGetLog();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
          {
            v108 = [v67 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138412290;
            v224 = v108;
            _os_log_impl(&dword_19B043000, v107, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: In cache: %@", buf, 0xCu);
          }
          uint64_t v14 = 0;
          v109 = (void *)v161;
LABEL_137:

          goto LABEL_138;
        }
        v65 = [v6 dateKey];
        +[PHImportDuplicateChecker _dateWithDate:v65];
        v67 = v66 = v6;

        unsigned __int8 v211 = 0;
        id v210 = 0;
        v68 = [(PHImportDuplicateChecker *)self _findMatchingAssetsForItem:v66 inSet:v54 matchingDate:&v210 confidence:&v211];
        v174 = v210;
        if ([v68 count])
        {
          v69 = [(PHImportDuplicateChecker *)self _filterDuplicatesForItem:v66 duplicateSet:v68 considerItemsInTrash:v4];

          if ([v69 count])
          {
            [v66 setIsDuplicate:1];
            [v66 setDuplicateStateConfidence:v211];
            v70 = [(PHPhotoLibrary *)self->_library uuid];
            [v66 setDuplicates:v69 forLibrary:v70];

            if ([v66 isLivePhoto])
            {
              long long v208 = 0u;
              long long v209 = 0u;
              long long v206 = 0u;
              long long v207 = 0u;
              id v71 = v69;
              uint64_t v72 = [v71 countByEnumeratingWithState:&v206 objects:v235 count:16];
              if (v72)
              {
                uint64_t v73 = v72;
                uint64_t v74 = *(void *)v207;
                while (2)
                {
                  for (uint64_t k = 0; k != v73; ++k)
                  {
                    if (*(void *)v207 != v74) {
                      objc_enumerationMutation(v71);
                    }
                    if ([*(id *)(*((void *)&v206 + 1) + 8 * k) hasVideoComplement])
                    {
                      v153 = [v170 videoComplement];
                      [v153 setIsDuplicate:1];

                      goto LABEL_131;
                    }
                  }
                  uint64_t v73 = [v71 countByEnumeratingWithState:&v206 objects:v235 count:16];
                  if (v73) {
                    continue;
                  }
                  break;
                }
              }
LABEL_131:
            }
            v138 = PLImportGetLog();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
            {
              v154 = [v170 sizeKey];
              v155 = [v170 nameKey];
              v156 = [v170 fileName];
              [v170 dateKey];
              v158 = v157 = v138;
              v159 = +[PHImportDuplicateChecker _dateWithDate:v158];
              [v67 timeIntervalSinceDate:v174];
              *(_DWORD *)buf = 138413570;
              v224 = v154;
              __int16 v225 = 2112;
              v226 = v155;
              __int16 v227 = 2112;
              v228 = v156;
              __int16 v229 = 2112;
              v230 = v159;
              __int16 v231 = 2112;
              v232 = v174;
              __int16 v233 = 2048;
              double v234 = fabs(v160 / 3600.0);
              _os_log_impl(&dword_19B043000, v157, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> FOUND: dupDate: %@ (diff: %gh)", buf, 0x3Eu);

              v138 = v157;
              v107 = v174;

              uint64_t v14 = v69;
LABEL_134:
              v109 = (void *)v161;
LABEL_136:

              goto LABEL_137;
            }
          }
          else
          {
            v138 = PLImportGetLog();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
            {
              v139 = [v170 sizeKey];
              v140 = [v170 nameKey];
              v141 = [v170 fileName];
              [v170 dateKey];
              v143 = v142 = v138;
              v144 = +[PHImportDuplicateChecker _dateWithDate:v143];
              *(_DWORD *)buf = 138413058;
              v224 = v139;
              __int16 v225 = 2112;
              v226 = v140;
              __int16 v227 = 2112;
              v228 = v141;
              __int16 v229 = 2112;
              v230 = v144;
              _os_log_impl(&dword_19B043000, v142, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: Filtered out", buf, 0x2Au);

              v138 = v142;
            }
          }
          uint64_t v14 = v69;
          v109 = (void *)v161;
          v107 = v174;
          goto LABEL_136;
        }
        v173 = v68;
        v110 = objc_opt_new();
        v111 = [(NSMutableDictionary *)self->_sizeNameCache objectForKeyedSubscript:v185];
        v112 = [v111 objectForKeyedSubscript:v167];

        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        id v113 = v112;
        uint64_t v114 = [v113 countByEnumeratingWithState:&v202 objects:v222 count:16];
        id v179 = v113;
        if (v114)
        {
          uint64_t v115 = v114;
          id v116 = *(id *)v203;
          id obja = *(id *)v203;
          do
          {
            uint64_t v117 = 0;
            id v181 = (id)v115;
            do
            {
              if (*(id *)v203 != v116) {
                objc_enumerationMutation(v113);
              }
              uint64_t v118 = *(void *)(*((void *)&v202 + 1) + 8 * v117);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v184 = v117;
                long long v200 = 0u;
                long long v201 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                v119 = [v113 objectForKeyedSubscript:v118];
                uint64_t v120 = [v119 countByEnumeratingWithState:&v198 objects:v221 count:16];
                if (v120)
                {
                  uint64_t v121 = v120;
                  uint64_t v122 = *(void *)v199;
                  do
                  {
                    for (uint64_t m = 0; m != v121; ++m)
                    {
                      if (*(void *)v199 != v122) {
                        objc_enumerationMutation(v119);
                      }
                      v124 = *(void **)(*((void *)&v198 + 1) + 8 * m);
                      if (([v124 isInTrash] & 1) == 0)
                      {
                        v125 = NSString;
                        v126 = [v124 fileName];
                        [v67 timeIntervalSinceDate:v118];
                        v128 = [v125 stringWithFormat:@"[size: %@, name: %@, date: %@ (diff: %gh)]", v185, v126, v118, fabs(v127 / 3600.0)];
                        [v110 addObject:v128];
                      }
                    }
                    uint64_t v121 = [v119 countByEnumeratingWithState:&v198 objects:v221 count:16];
                  }
                  while (v121);
                }

                id v116 = obja;
                id v113 = v179;
                uint64_t v115 = (uint64_t)v181;
                uint64_t v117 = v184;
              }
              ++v117;
            }
            while (v117 != v115);
            uint64_t v115 = [v113 countByEnumeratingWithState:&v202 objects:v222 count:16];
          }
          while (v115);
        }

        v129 = [v170 creationDate];

        v130 = PLImportGetLog();
        BOOL v131 = os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG);
        if (v129)
        {
          if (v131)
          {
            v132 = [v170 sizeKey];
            v133 = [v170 sizeKey];
            v134 = [v170 fileName];
            v135 = [v170 dateKey];
            v136 = +[PHImportDuplicateChecker _dateWithDate:v135];
            v137 = [v170 creationDate];
            *(_DWORD *)buf = 138413314;
            v224 = v132;
            __int16 v225 = 2112;
            v226 = v133;
            __int16 v227 = 2112;
            v228 = v134;
            __int16 v229 = 2112;
            v230 = v136;
            __int16 v231 = 2112;
            v232 = v137;
            _os_log_impl(&dword_19B043000, v130, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: CHECKING EXIF date: %@ ==> NOT FOUND: No matching date.", buf, 0x34u);

            id v113 = v179;
          }
        }
        else if (v131)
        {
          v145 = [v170 sizeKey];
          v146 = [v170 nameKey];
          v147 = [v170 fileName];
          v148 = [v170 dateKey];
          v149 = +[PHImportDuplicateChecker _dateWithDate:v148];
          *(_DWORD *)buf = 138413314;
          v224 = v145;
          __int16 v225 = 2112;
          v226 = v146;
          __int16 v227 = 2112;
          v228 = v147;
          __int16 v229 = 2112;
          v230 = v149;
          __int16 v231 = 2112;
          v232 = v170;
          _os_log_impl(&dword_19B043000, v130, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No EXIF date, no matching date. %@", buf, 0x34u);
        }
        v138 = v110;
        uint64_t v150 = [v110 count];
        uint64_t v14 = v173;
        v107 = v174;
        if (v150)
        {
          v151 = PLImportGetLog();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
          {
            v152 = [v138 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138412290;
            v224 = v152;
            _os_log_impl(&dword_19B043000, v151, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: In cache: %@", buf, 0xCu);
          }
        }

        goto LABEL_134;
      }
      v76 = PLImportGetLog();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      v77 = [v6 sizeKey];
      v78 = [v6 nameKey];
      v79 = [v6 fileName];
      v83 = [v6 dateKey];
      v81 = +[PHImportDuplicateChecker _dateWithDate:v83];
      *(_DWORD *)buf = 138413058;
      v224 = v77;
      __int16 v225 = 2112;
      v226 = v78;
      __int16 v227 = 2112;
      v228 = v79;
      __int16 v229 = 2112;
      v230 = v81;
      _os_log_impl(&dword_19B043000, v76, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No matching size.", buf, 0x2Au);
    }
    else
    {
      v76 = PLImportGetLog();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
LABEL_66:

        goto LABEL_67;
      }
      v77 = [v6 sizeKey];
      v78 = [v6 nameKey];
      v79 = [v6 fileName];
      v80 = [v6 dateKey];
      v81 = +[PHImportDuplicateChecker _dateWithDate:v80];
      v82 = [(PHPhotoLibrary *)self->_library uuid];
      *(_DWORD *)buf = 138413314;
      v224 = v77;
      __int16 v225 = 2112;
      v226 = v78;
      __int16 v227 = 2112;
      v228 = v79;
      __int16 v229 = 2112;
      v230 = v81;
      __int16 v231 = 2112;
      v232 = v82;
      _os_log_impl(&dword_19B043000, v76, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: Can't dedup against databse %@ because it's not in the cache. Possibly shut down?", buf, 0x34u);
    }
    goto LABEL_66;
  }
  if (![v6 isDuplicate])
  {
    v26 = PLImportGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v32 = [v6 sizeKey];
      v33 = [v6 nameKey];
      v34 = [v6 fileName];
      BOOL v35 = [v6 dateKey];
      v36 = +[PHImportDuplicateChecker _dateWithDate:v35];
      long long v37 = [v6 nameKey];
      *(_DWORD *)buf = 138413314;
      v224 = v32;
      __int16 v225 = 2112;
      v226 = v33;
      __int16 v227 = 2112;
      v228 = v34;
      __int16 v229 = 2112;
      v230 = v36;
      __int16 v231 = 2112;
      v232 = v37;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: No change in DB since last check, %@ is not a dup", buf, 0x34u);
    }
    goto LABEL_21;
  }
  id v11 = [v6 duplicates];
  uint64_t v12 = [(PHPhotoLibrary *)self->_library uuid];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v14 = [(PHImportDuplicateChecker *)self _filterDuplicatesForItem:v6 duplicateSet:v13 considerItemsInTrash:v4];

  v15 = PLImportGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = [v6 sizeKey];
    double v17 = [v6 nameKey];
    double v18 = [v6 fileName];
    uint64_t v19 = [v6 dateKey];
    uint64_t v20 = +[PHImportDuplicateChecker _dateWithDate:v19];
    v21 = [v6 nameKey];
    uint64_t v22 = [v14 count];
    *(_DWORD *)buf = 138413570;
    v23 = &stru_1EEAC1950;
    v224 = v16;
    __int16 v225 = 2112;
    if (!v22) {
      v23 = @": Filtered out";
    }
    v226 = v17;
    __int16 v227 = 2112;
    v228 = v18;
    __int16 v229 = 2112;
    v230 = v20;
    __int16 v231 = 2112;
    v232 = v21;
    __int16 v233 = 2112;
    double v234 = *(double *)&v23;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: No change in DB since last check, %@ is a dup%@", buf, 0x3Eu);
  }
LABEL_23:

  return v14;
}

- (BOOL)_findFingerprint:(id)a3 forItem:(id)a4 inCache:(id)a5 considerTrash:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    uint64_t v12 = [a5 objectForKeyedSubscript:v10];
    if ([v12 count])
    {
      uint64_t v13 = [(PHImportDuplicateChecker *)self _filterDuplicatesForItem:v11 duplicateSet:v12 considerItemsInTrash:v6];

      if ([v13 count])
      {
        BOOL v14 = 1;
        [v11 setIsDuplicate:1];
        [v11 setDuplicateStateConfidence:2];
        v15 = [(PHPhotoLibrary *)self->_library uuid];
        [v11 setDuplicates:v13 forLibrary:v15];
      }
      else
      {
        double v18 = PLImportGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = [v11 nameKey];
          int v21 = 138412546;
          uint64_t v22 = v19;
          __int16 v23 = 2112;
          id v24 = v10;
          _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: name: %@, fingerprint: %@ ==> FOUND : Filtered out", (uint8_t *)&v21, 0x16u);
        }
        BOOL v14 = 0;
      }
    }
    else
    {
      v16 = PLImportGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        double v17 = [v11 nameKey];
        int v21 = 138412546;
        uint64_t v22 = v17;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: name: %@, fingerprint: %@ ==> NOT FOUND", (uint8_t *)&v21, 0x16u);
      }
      BOOL v14 = 0;
      uint64_t v13 = v12;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_findMatchingAssetsForItem:(id)a3 inSet:(id)a4 matchingDate:(id *)a5 confidence:(unsigned __int8 *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v42 = (id)objc_opt_new();
  id v11 = [v9 dateKey];
  uint64_t v12 = +[PHImportDuplicateChecker _dateWithDate:v11];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      uint64_t v16 = 0;
      do
      {
        double v17 = v9;
        double v18 = self;
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
        uint64_t v20 = [v19 imageDate];
        [v12 timeIntervalSinceDate:v20];
        double v22 = fabs(v21);

        if (v22 <= 86400.0)
        {
          v34 = PLImportGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Matched date against EXIF image date (CONFIDENT)", buf, 2u);
          }

          [v42 addObject:v19];
          BOOL v35 = a6;
          if (!a6) {
            goto LABEL_23;
          }
          char v36 = 2;
          goto LABEL_22;
        }
        uint64_t v23 = [v19 alternateImportImageDate];
        if (!v23
          || (id v24 = (void *)v23,
              [v19 alternateImportImageDate],
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              [v12 timeIntervalSinceDate:v25],
              double v27 = fabs(v26),
              v25,
              v24,
              v27 > 86400.0))
        {
          v28 = [v17 metadata];

          self = v18;
          id v9 = v17;
          if (!v28)
          {
            [v17 loadMetadataSync];
            uint64_t v29 = [v17 metadata];

            if (v29)
            {
              [(PHImportDuplicateChecker *)self _findMatchingAssetsForItem:v17 inSet:obj matchingDate:a5 confidence:a6];
              v31 = double v30 = self;
              if ([v31 count])
              {
                v32 = [v31 allObjects];
                [v42 addObjectsFromArray:v32];

                v33 = [v17 fileCreationDate];
                [v19 setAlternateImportImageDate:v33];

                [(NSMutableSet *)v30->_updatedDupInfos addObject:v19];
              }

              self = v30;
              id v9 = v17;
            }
            else
            {
              long long v38 = PLImportGetLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "DUPLICATE CHECK: Failed to load metadata for date check.", buf, 2u);
              }
            }
          }
          goto LABEL_25;
        }
        long long v37 = PLImportGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Matched date against Alternate Import image date (POSSIBLE)", buf, 2u);
        }

        [v42 addObject:v19];
        BOOL v35 = a6;
        if (a6)
        {
          char v36 = 1;
LABEL_22:
          *BOOL v35 = v36;
        }
LABEL_23:
        self = v18;
        id v9 = v17;
        if (a5)
        {
          *a5 = [v19 imageDate];
        }
LABEL_25:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      uint64_t v14 = v39;
    }
    while (v39);
  }

  return v42;
}

- (id)_filterDuplicatesForItem:(id)a3 duplicateSet:(id)a4 considerItemsInTrash:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a5)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isInTrash", (void)v16) & 1) == 0) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }

  return v8;
}

- (void)_populateCachesWithAssetInfo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[PHImportDuplicateInfo alloc] initWithAssetInfo:v4];

  id v6 = [(PHImportDuplicateInfo *)v5 fileName];
  uint64_t v7 = [(PHImportDuplicateInfo *)v5 fileSize];
  id v8 = (void *)v7;
  if (!v4 || (v6 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), v9))
  {
    uint64_t v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v27 = [(PHImportDuplicateInfo *)v5 objectID];
      v28 = [(PHImportDuplicateInfo *)v5 fileName];
      uint64_t v29 = [(PHImportDuplicateInfo *)v5 fileSize];
      *(_DWORD *)buf = 134218754;
      v34 = v5;
      __int16 v35 = 2112;
      char v36 = v27;
      __int16 v37 = 2112;
      long long v38 = v28;
      __int16 v39 = 2112;
      long long v40 = v29;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "DUPLICATE ERROR: Attempting to populate cache with assetIfo: <%p>(objectID: %@), fileName: %@, fileSize: %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v10 = [(PHImportDuplicateInfo *)v5 avchdFingerprint];
    [v10 containsString:v6];
    [(PHImportDuplicateChecker *)self _setDupInfo:v5 forFingerprint:v10 inCache:self->_avchdAssetIdentifierCache];
    uint64_t v11 = [(PHImportDuplicateInfo *)v5 fingerprint];
    [(PHImportDuplicateChecker *)self _setDupInfo:v5 forFingerprint:v11 inCache:self->_assetIdentifierCache];

    uint64_t v12 = [(PHImportDuplicateInfo *)v5 originatingAssetIdentifier];
    [(PHImportDuplicateChecker *)self _setDupInfo:v5 forFingerprint:v12 inCache:self->_assetIdentifierCache];

    uint64_t v13 = [(NSMutableDictionary *)self->_sizeNameCache objectForKeyedSubscript:v8];
    if (!v13)
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      [(NSMutableDictionary *)self->_sizeNameCache setObject:v13 forKeyedSubscript:v8];
    }
    uint64_t v14 = [(PHImportDuplicateInfo *)v6 lowercaseString];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];
    if (!v15)
    {
      uint64_t v15 = objc_opt_new();
      [v13 setObject:v15 forKeyedSubscript:v14];
    }
    [v15 addObject:v5];
    long long v16 = PLImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [(PHImportDuplicateInfo *)v5 imageDate];
      long long v18 = (void *)v17;
      long long v19 = &stru_1EEAC1950;
      if (v17) {
        long long v19 = (__CFString *)v17;
      }
      BOOL v31 = v19;
      uint64_t v20 = [(PHImportDuplicateInfo *)v5 alternateImportImageDate];
      v32 = v14;
      uint64_t v21 = (void *)v20;
      double v22 = &stru_1EEAC1950;
      if (v20) {
        double v22 = (__CFString *)v20;
      }
      double v30 = v22;
      BOOL v23 = [(PHImportDuplicateInfo *)v5 isInTrash];
      *(_DWORD *)buf = 138413314;
      id v24 = @"NO";
      v34 = v6;
      __int16 v35 = 2112;
      if (v23) {
        id v24 = @"YES";
      }
      char v36 = v8;
      __int16 v37 = 2112;
      long long v38 = v31;
      __int16 v39 = 2112;
      long long v40 = v30;
      __int16 v41 = 2112;
      id v42 = v24;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: name: %@, size: %@, dates: %@%@, isInTrash: %@", buf, 0x34u);

      uint64_t v14 = v32;
    }

    uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
    lastChange = self->_lastChange;
    self->_lastChange = v25;
  }
}

- (void)_setDupInfo:(id)a3 forFingerprint:(id)a4 inCache:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:v8];
    if (v11)
    {
      uint64_t v12 = (__CFString *)v11;
      uint64_t v13 = PLImportGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 138412802;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v7;
        __int16 v22 = 2112;
        BOOL v23 = v12;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: More than one master for fingerprint '%@': adding: %@, in cache: %@", (uint8_t *)&v18, 0x20u);
      }
    }
    else
    {
      uint64_t v12 = (__CFString *)objc_opt_new();
      [v10 setObject:v12 forKeyedSubscript:v8];
    }
    [(__CFString *)v12 addObject:v7];
    uint64_t v14 = PLImportGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [v7 fileName];
      int v16 = [v7 isInTrash];
      uint64_t v17 = @"NO";
      int v18 = 138412802;
      id v19 = v15;
      __int16 v20 = 2112;
      if (v16) {
        uint64_t v17 = @"YES";
      }
      id v21 = v8;
      __int16 v22 = 2112;
      BOOL v23 = v17;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: name: %@, fingerprint: %@, isInTrash: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)_updateAssetsFromDupInfos
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_updatedDupInfos = &self->_updatedDupInfos;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableSet count](self->_updatedDupInfos, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *p_updatedDupInfos;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = [v8 alternateImportImageDate];
        uint64_t v10 = [v8 objectID];
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }

  int v16 = [v3 allKeys];
  uint64_t v11 = [[PHManualFetchResult alloc] initWithOids:v16 photoLibrary:self->_library fetchType:@"PHAsset" fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, -[PHFetchResult count](v11, "count"));
  uint64_t v13 = 0;
  while (objc_msgSend(v12, "count", v16))
  {
    library = self->_library;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke;
    v19[3] = &unk_1E5844880;
    __int16 v20 = v11;
    id v21 = v12;
    BOOL v23 = v25;
    id v22 = v3;
    uint64_t v24 = 100;
    id v18 = v13;
    [(PHPhotoLibrary *)library performChangesAndWait:v19 error:&v18];
    id v15 = v18;

    uint64_t v13 = v15;
  }

  _Block_object_dispose(v25, 8);
}

void __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke_2;
  v6[3] = &unk_1E5841B58;
  uint64_t v9 = *(void *)(a1 + 56);
  id v7 = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v10 = v5;
  [v3 enumerateObjectsAtIndexes:v7 options:0 usingBlock:v6];
}

void __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [*(id *)(a1 + 32) removeIndex:a3];
  id v12 = v7;
  id v8 = +[PHAssetChangeRequest changeRequestForAsset:v12];
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v12 objectID];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  [v8 setAlternateImportImageDate:v11];

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56);
}

- (PHImportDuplicateChecker)initWithLibrary:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)PHImportDuplicateChecker;
    uint64_t v6 = [(PHImportDuplicateChecker *)&v17 init];
    id v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_library, a3);
      uint64_t v8 = objc_opt_new();
      sizeNameCache = v7->_sizeNameCache;
      v7->_sizeNameCache = (NSMutableDictionary *)v8;

      uint64_t v10 = objc_opt_new();
      avchdAssetIdentifierCache = v7->_avchdAssetIdentifierCache;
      v7->_avchdAssetIdentifierCache = (NSMutableDictionary *)v10;

      uint64_t v12 = objc_opt_new();
      assetIdentifierCache = v7->_assetIdentifierCache;
      v7->_assetIdentifierCache = (NSMutableDictionary *)v12;

      uint64_t v14 = objc_opt_new();
      updatedDupInfos = v7->_updatedDupInfos;
      v7->_updatedDupInfos = (NSMutableSet *)v14;
    }
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (unint64_t)_populateCachesWithAssetsInfos:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", v12, (void)v22);
        uint64_t v14 = NSNumber;
        id v15 = [v12 objectForKeyedSubscript:@"asset.kindSubtype"];
        int v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "integerValue") == 2);
        [v13 setObject:v16 forKeyedSubscript:@"hasVideoComplement"];

        [(PHImportDuplicateChecker *)self _populateCachesWithAssetInfo:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  objc_super v17 = PLImportGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v7 count];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = v18;
    __int16 v28 = 2048;
    double v29 = v19 - v6;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: time to POPULATE caches for %lu asset infos: %g", buf, 0x16u);
  }

  unint64_t v20 = [v7 count];
  return v20;
}

+ (id)_fetchAssetInfoFromLibrary:(id)a3 forFileSizes:(id)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  if (_fetchAssetInfoFromLibrary_forFileSizes__onceToken != -1) {
    dispatch_once(&_fetchAssetInfoFromLibrary_forFileSizes__onceToken, &__block_literal_global_62);
  }
  v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"originalFilesize", v5];
  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"asset.visibilityState", 0);
  v50[0] = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"asset.avalancheUUID");
  v49[0] = v11;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"asset.avalancheKind", 1);
  v49[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  uint64_t v14 = [v10 andPredicateWithSubpredicates:v13];
  v50[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  int v16 = [v8 orPredicateWithSubpredicates:v15];

  objc_super v17 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForUserLibrary"), 0, @"asset");
  uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  v48[0] = v33;
  v48[1] = v16;
  v48[2] = v17;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  unint64_t v20 = [v18 andPredicateWithSubpredicates:v19];

  id v21 = (void *)MEMORY[0x1E4F1C0D0];
  long long v22 = [MEMORY[0x1E4F8A670] entityName];
  long long v23 = [v21 fetchRequestWithEntityName:v22];

  [v23 setPredicate:v20];
  [v23 setPropertiesToFetch:_fetchAssetInfoFromLibrary_forFileSizes__properties];
  [v23 setResultType:2];
  long long v24 = [v32 managedObjectContext];
  uint64_t v38 = 0;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000;
  __int16 v41 = __Block_byref_object_copy_;
  id v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke_152;
  v34[3] = &unk_1E5848318;
  __int16 v37 = &v38;
  id v25 = v24;
  id v35 = v25;
  id v26 = v23;
  id v36 = v26;
  [v25 performBlockAndWait:v34];

  uint64_t v27 = PLImportGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = [v5 count];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    uint64_t v45 = v28;
    __int16 v46 = 2048;
    double v47 = v29 - v7;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEBUG, "DUPLICATE QUERY: time to FETCH asset info from database for %lu file sizes: %g", buf, 0x16u);
  }

  id v30 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v30;
}

void __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke_152(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke()
{
  v4[12] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"asset";
  v4[2] = @"originalFilesize";
  v4[3] = @"originalFilename";
  v4[4] = @"alternateImportImageDate";
  v4[5] = @"timeZoneOffset";
  v4[6] = @"originalStableHash";
  v4[7] = @"originatingAssetIdentifier";
  v4[8] = @"asset.dateCreated";
  v4[9] = @"asset.trashedState";
  v4[10] = @"asset.kindSubtype";
  v4[11] = @"asset.uuid";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:12];
  uint64_t v3 = (void *)_fetchAssetInfoFromLibrary_forFileSizes__properties;
  _fetchAssetInfoFromLibrary_forFileSizes__properties = v2;
}

+ (id)_dateWithDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v3 = NAN;
  }
  id v4 = (void *)MEMORY[0x1E4F1C9C8];

  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v3];
}

+ (id)duplicatesFromResults:(id)a3 forLibrary:(id)a4
{
  id v5 = a3;
  double v6 = [a4 photoLibraryURL];
  double v7 = [v6 path];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  uint64_t v9 = [v8 allObjects];

  return v9;
}

@end