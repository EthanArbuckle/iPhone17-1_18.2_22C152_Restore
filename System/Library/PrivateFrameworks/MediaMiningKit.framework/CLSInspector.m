@interface CLSInspector
- (CLSInspector)init;
- (Class)informantClassForIdentifier:(id)a3;
- (Class)profileClassForIdentifier:(id)a3;
- (id)informantClassesForAnyIdentifier:(id)a3;
- (id)informantClassesForFamilyIdentifier:(id)a3;
- (id)profileIdentifierForHash:(unint64_t)a3;
- (void)invalidateSharedPersistentCachesWithServiceManager:(id)a3 locationCache:(id)a4;
- (void)performInvestigation:(id)a3;
- (void)performInvestigation:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5;
- (void)performInvestigation:(id)a3 progressBlock:(id)a4;
@end

@implementation CLSInspector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informantClassesByFamilyIdentifier, 0);
  objc_storeStrong((id *)&self->_informantClassesByIdentifier, 0);
  objc_storeStrong((id *)&self->_informantClasses, 0);
  objc_storeStrong((id *)&self->_profileClassesByIdentifier, 0);
  objc_storeStrong((id *)&self->_profileClasses, 0);
}

- (void)invalidateSharedPersistentCachesWithServiceManager:(id)a3 locationCache:(id)a4
{
  obj = self;
  objc_sync_enter(obj);
  objc_sync_exit(obj);
}

- (void)performInvestigation:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5
{
  char v119 = a4;
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v139 = a3;
  id v122 = a5;
  v138 = (void (**)(void, void, double))MEMORY[0x1D2602540]();
  uint64_t v205 = 0;
  v206 = &v205;
  uint64_t v207 = 0x2020000000;
  char v208 = 0;
  v127 = objc_opt_new();
  v131 = objc_opt_new();
  v137 = objc_opt_new();
  v130 = objc_opt_new();
  v6 = objc_opt_new();
  v135 = objc_opt_new();
  v132 = objc_opt_new();
  long long v204 = 0u;
  long long v203 = 0u;
  long long v202 = 0u;
  long long v201 = 0u;
  v7 = [v139 profiles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v201 objects:v224 count:16];
  obuint64_t j = v7;
  if (v8)
  {
    uint64_t v120 = *(void *)v202;
    do
    {
      uint64_t v121 = 0;
      uint64_t v118 = v8;
      do
      {
        if (*(void *)v202 != v120) {
          objc_enumerationMutation(obj);
        }
        uint64_t v124 = *(void *)(*((void *)&v201 + 1) + 8 * v121);
        objc_msgSend(v135, "addObject:");
        v9 = [(id)objc_opt_class() identifier];
        [v132 setObject:v124 forKey:v9];

        long long v200 = 0u;
        long long v199 = 0u;
        long long v198 = 0u;
        long long v197 = 0u;
        v10 = [(id)objc_opt_class() profileDependenciesIdentifiers];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v197 objects:v223 count:16];
        if (!v11) {
          goto LABEL_29;
        }
        uint64_t v133 = *(void *)v198;
        id v136 = v10;
        while (2)
        {
          id v140 = 0;
          id v128 = (id)v11;
          do
          {
            if (*(void *)v198 != v133) {
              objc_enumerationMutation(v10);
            }
            v12 = *(objc_class **)(*((void *)&v197 + 1) + 8 * (void)v140);
            long long v193 = 0u;
            long long v194 = 0u;
            long long v195 = 0u;
            long long v196 = 0u;
            v13 = [v139 profiles];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v193 objects:v222 count:16];
            if (v14)
            {
              char v15 = 0;
              uint64_t v16 = *(void *)v194;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v194 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v18 = [(id)objc_opt_class() identifier];
                  int v19 = [v18 isEqualToString:v12];

                  if (v19)
                  {
                    [v6 addObject:objc_opt_class()];
                    char v15 = 1;
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v193 objects:v222 count:16];
              }
              while (v14);

              if (v15) {
                goto LABEL_27;
              }
            }
            else
            {
            }
            v20 = [(CLSInspector *)self profileClassForIdentifier:v12];
            if (!v20 || ![(objc_class *)v20 isSubclassOfClass:objc_opt_class()])
            {
              v52 = +[CLSLogging sharedLogging];
              v29 = [v52 loggingConnection];

              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v53 = [v139 uuid];
                *(_DWORD *)buf = 138412546;
                v219 = v53;
                __int16 v220 = 2112;
                v221 = v12;
                _os_log_error_impl(&dword_1D2150000, v29, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Profile dependency \"%@\" cannot be found or is incompatible\"", buf, 0x16u);
              }
              goto LABEL_107;
            }
            [v6 addObject:v20];
            id v21 = objc_alloc_init(v20);
            if (!v21)
            {
              v70 = +[CLSLogging sharedLogging];
              v29 = [v70 loggingConnection];

              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v71 = [v139 uuid];
                *(_DWORD *)buf = 138412546;
                v219 = v71;
                __int16 v220 = 2112;
                v221 = v20;
                _os_log_error_impl(&dword_1D2150000, v29, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Profile \"%@\" cannot be instantiated\"", buf, 0x16u);
              }
              goto LABEL_107;
            }
            [v135 addObject:v21];
            v22 = [(id)objc_opt_class() identifier];
            [v132 setObject:v21 forKey:v22];

LABEL_27:
            id v140 = (char *)v140 + 1;
            v10 = v136;
          }
          while (v140 != v128);
          uint64_t v11 = [v136 countByEnumeratingWithState:&v197 objects:v223 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_29:

        long long v191 = 0u;
        long long v192 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        v23 = [(id)objc_opt_class() informantDependenciesIdentifiers];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v189 objects:v217 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v190;
          id v136 = v23;
LABEL_31:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v190 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(objc_class **)(*((void *)&v189 + 1) + 8 * v26);
            v28 = [(CLSInspector *)self informantClassesForAnyIdentifier:v27];
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            v29 = v28;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v185 objects:v216 count:16];
            if (!v30) {
              break;
            }
            uint64_t v31 = *(void *)v186;
            while (2)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v186 != v31) {
                  objc_enumerationMutation(v29);
                }
                v33 = *(void **)(*((void *)&v185 + 1) + 8 * j);
                if (!v33 || ![v33 isSubclassOfClass:objc_opt_class()])
                {
                  v65 = +[CLSLogging sharedLogging];
                  v66 = [v65 loggingConnection];

                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  {
                    v103 = [v139 uuid];
                    *(_DWORD *)buf = 138412546;
                    v219 = v103;
                    __int16 v220 = 2112;
                    v221 = v27;
                    _os_log_error_impl(&dword_1D2150000, v66, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\"", buf, 0x16u);
                  }
                  v67 = v29;
                  goto LABEL_97;
                }
                [v127 addObject:v33];
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v185 objects:v216 count:16];
              if (v30) {
                continue;
              }
              break;
            }

            ++v26;
            v23 = v136;
            if (v26 == v24)
            {
              uint64_t v24 = [v136 countByEnumeratingWithState:&v189 objects:v217 count:16];
              if (v24) {
                goto LABEL_31;
              }
              goto LABEL_45;
            }
          }

          v113 = +[CLSLogging sharedLogging];
          v67 = [v113 loggingConnection];

          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            v114 = [v139 uuid];
            *(_DWORD *)buf = 138412546;
            v219 = v114;
            __int16 v220 = 2112;
            v221 = v27;
            _os_log_error_impl(&dword_1D2150000, v67, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\"", buf, 0x16u);
          }
LABEL_97:

LABEL_107:
          goto LABEL_108;
        }
LABEL_45:

        id v34 = (id)[v127 copy];
        v35 = 0;
        while ([v34 count])
        {
          v29 = objc_opt_new();

          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          id v136 = v34;
          uint64_t v36 = [v136 countByEnumeratingWithState:&v181 objects:v215 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v182;
            while (2)
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v182 != v37) {
                  objc_enumerationMutation(v136);
                }
                v39 = *(void **)(*((void *)&v181 + 1) + 8 * k);
                long long v177 = 0u;
                long long v178 = 0u;
                long long v179 = 0u;
                long long v180 = 0u;
                v40 = [v39 informantDependenciesIdentifiers];
                uint64_t v41 = [v40 countByEnumeratingWithState:&v177 objects:v214 count:16];
                id v141 = v40;
                if (v41)
                {
                  uint64_t v42 = *(void *)v178;
LABEL_54:
                  uint64_t v43 = 0;
                  while (1)
                  {
                    if (*(void *)v178 != v42) {
                      objc_enumerationMutation(v141);
                    }
                    v134 = *(objc_class **)(*((void *)&v177 + 1) + 8 * v43);
                    v44 = -[CLSInspector informantClassesForAnyIdentifier:](self, "informantClassesForAnyIdentifier:");
                    long long v175 = 0u;
                    long long v176 = 0u;
                    long long v173 = 0u;
                    long long v174 = 0u;
                    v45 = v44;
                    uint64_t v46 = [v45 countByEnumeratingWithState:&v173 objects:v213 count:16];
                    if (!v46) {
                      break;
                    }
                    uint64_t v117 = v43;
                    uint64_t v125 = v42;
                    uint64_t v129 = v37;
                    uint64_t v47 = *(void *)v174;
                    while (2)
                    {
                      for (uint64_t m = 0; m != v46; ++m)
                      {
                        if (*(void *)v174 != v47) {
                          objc_enumerationMutation(v45);
                        }
                        v49 = *(void **)(*((void *)&v173 + 1) + 8 * m);
                        if (!v49 || ![v49 isSubclassOfClass:objc_opt_class()])
                        {
                          v72 = +[CLSLogging sharedLogging];
                          v73 = [v72 loggingConnection];

                          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                          {
                            v112 = [v139 uuid];
                            *(_DWORD *)buf = 138412546;
                            v219 = v112;
                            __int16 v220 = 2112;
                            v221 = v134;
                            _os_log_error_impl(&dword_1D2150000, v73, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\"", buf, 0x16u);
                          }
                          v74 = v45;
                          goto LABEL_106;
                        }
                        [v127 addObject:v49];
                        [v29 addObject:v49];
                      }
                      uint64_t v46 = [v45 countByEnumeratingWithState:&v173 objects:v213 count:16];
                      if (v46) {
                        continue;
                      }
                      break;
                    }

                    uint64_t v37 = v129;
                    uint64_t v43 = v117 + 1;
                    uint64_t v42 = v125;
                    if (v117 + 1 == v41)
                    {
                      uint64_t v41 = [v141 countByEnumeratingWithState:&v177 objects:v214 count:16];
                      uint64_t v37 = v129;
                      uint64_t v42 = v125;
                      if (v41) {
                        goto LABEL_54;
                      }
                      goto LABEL_68;
                    }
                  }

                  v115 = +[CLSLogging sharedLogging];
                  v74 = [v115 loggingConnection];

                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    v116 = [v139 uuid];
                    *(_DWORD *)buf = 138412546;
                    v219 = v116;
                    __int16 v220 = 2112;
                    v221 = v134;
                    _os_log_error_impl(&dword_1D2150000, v74, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\"", buf, 0x16u);
                  }
LABEL_106:

                  goto LABEL_107;
                }
LABEL_68:
              }
              uint64_t v36 = [v136 countByEnumeratingWithState:&v181 objects:v215 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }

          id v34 = [v29 copy];
          v35 = v29;
        }

        ++v121;
      }
      while (v121 != v118);
      uint64_t v8 = [obj countByEnumeratingWithState:&v201 objects:v224 count:16];
    }
    while (v8);
  }

  if (v138)
  {
    char v172 = 0;
    ((void (**)(void, char *, double))v138)[2](v138, &v172, 0.1);
    char v50 = *((unsigned char *)v206 + 24) | v172;
    *((unsigned char *)v206 + 24) = v50;
    if (v50)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_108;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v219) = 307;
      v51 = MEMORY[0x1E4F14500];
LABEL_77:
      _os_log_impl(&dword_1D2150000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      goto LABEL_108;
    }
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v54 = v127;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v168 objects:v212 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v169;
    while (2)
    {
      for (uint64_t n = 0; n != v55; ++n)
      {
        if (*(void *)v169 != v56) {
          objc_enumerationMutation(v54);
        }
        v58 = *(objc_class **)(*((void *)&v168 + 1) + 8 * n);
        v59 = objc_opt_new();
        if (!v59)
        {
          v68 = +[CLSLogging sharedLogging];
          v69 = [v68 loggingConnection];

          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            v104 = [v139 uuid];
            *(_DWORD *)buf = 138412546;
            v219 = v104;
            __int16 v220 = 2112;
            v221 = v58;
            _os_log_error_impl(&dword_1D2150000, v69, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be instantiated\"", buf, 0x16u);
          }
          goto LABEL_108;
        }
        [v131 addObject:v59];
        v60 = [(id)objc_opt_class() identifier];
        [v137 setObject:v59 forKey:v60];

        v61 = [(id)objc_opt_class() familyIdentifier];
        v62 = [v130 objectForKey:v61];

        if (!v62)
        {
          v62 = objc_opt_new();
          v63 = [(id)objc_opt_class() familyIdentifier];
          [v137 setObject:v62 forKey:v63];
        }
        [v62 addObject:v59];
      }
      uint64_t v55 = [v54 countByEnumeratingWithState:&v168 objects:v212 count:16];
      if (v55) {
        continue;
      }
      break;
    }
  }

  if (v138)
  {
    char v172 = 0;
    ((void (**)(void, char *, double))v138)[2](v138, &v172, 0.2);
    char v64 = *((unsigned char *)v206 + 24) | v172;
    *((unsigned char *)v206 + 24) = v64;
    if (v64)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_108;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v219) = 333;
      v51 = MEMORY[0x1E4F14500];
      goto LABEL_77;
    }
  }
  [v139 _willBeginInvestigation:self];
  char v75 = v119;
  if (v119)
  {
    v81 = [v139 feeder];
    BOOL v82 = v81 == 0;

    if (v82)
    {
      v90 = [v139 clueCollection];
      v88 = v167;
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke;
      v167[3] = &unk_1E6910648;
      v167[4] = v138;
      v167[5] = &v205;
      [v90 prepareWithProgressBlock:v167];
    }
    else
    {
      v83 = [v139 feeder];
      v84 = [v139 helper];
      v85 = [v84 serviceManager];
      v86 = [v139 helper];
      v87 = [v86 locationCache];
      v88 = v164;
      v164[0] = MEMORY[0x1E4F143A8];
      v164[1] = 3221225472;
      v164[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_2;
      v164[3] = &unk_1E6910648;
      v89 = v138;
      id v165 = v89;
      v166 = &v205;
      v90 = [v83 prepareWithServiceManager:v85 locationCache:v87 progressBlock:v164];

      if (*((unsigned char *)v206 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v219) = 352;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        goto LABEL_108;
      }
      v105 = [v139 clueCollection];
      v106 = [v90 inputClues];
      [v105 mergeClues:v106];

      v107 = [v139 clueCollection];
      v108 = [v90 outputClues];
      [v107 mergeClues:v108];

      v109 = [v139 clueCollection];
      v110 = [v90 meaningClues];
      [v109 mergeClues:v110];

      v111 = [v139 clueCollection];
      v161[0] = MEMORY[0x1E4F143A8];
      v161[1] = 3221225472;
      v161[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_66;
      v161[3] = &unk_1E6910648;
      v162 = v89;
      v163 = &v205;
      [v111 prepareWithProgressBlock:v161];
    }
    char v75 = v119;
    if (*((unsigned char *)v206 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_108;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v219) = 362;
      v51 = MEMORY[0x1E4F14500];
      goto LABEL_77;
    }
  }
  if ((v75 & 2) != 0)
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v142 = v131;
    uint64_t v91 = [v142 countByEnumeratingWithState:&v157 objects:v211 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v158;
      while (2)
      {
        for (iuint64_t i = 0; ii != v91; ++ii)
        {
          if (*(void *)v158 != v92) {
            objc_enumerationMutation(v142);
          }
          v94 = *(void **)(*((void *)&v157 + 1) + 8 * ii);
          v154[0] = MEMORY[0x1E4F143A8];
          v154[1] = 3221225472;
          v154[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_67;
          v154[3] = &unk_1E6910648;
          v155 = v138;
          v156 = &v205;
          v95 = [v94 gatherCluesForInvestigation:v139 progressBlock:v154];
          v96 = v95;
          if (*((unsigned char *)v206 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v219) = 374;
              _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }

            goto LABEL_108;
          }
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v97 = v95;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v150 objects:v210 count:16];
          if (v98)
          {
            uint64_t v99 = *(void *)v151;
            do
            {
              for (juint64_t j = 0; jj != v98; ++jj)
              {
                if (*(void *)v151 != v99) {
                  objc_enumerationMutation(v97);
                }
                [*(id *)(*((void *)&v150 + 1) + 8 * jj) setInformant:v94];
              }
              uint64_t v98 = [v97 countByEnumeratingWithState:&v150 objects:v210 count:16];
            }
            while (v98);
          }

          v101 = [v139 clueCollection];
          [v101 mergeClues:v97];
        }
        uint64_t v91 = [v142 countByEnumeratingWithState:&v157 objects:v211 count:16];
        if (v91) {
          continue;
        }
        break;
      }
    }

    if (v138)
    {
      char v172 = 0;
      ((void (**)(void, char *, double))v138)[2](v138, &v172, 0.6);
      char v102 = *((unsigned char *)v206 + 24) | v172;
      *((unsigned char *)v206 + 24) = v102;
      if (v102)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_108;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v219) = 384;
        v51 = MEMORY[0x1E4F14500];
        goto LABEL_77;
      }
    }
  }
  if ((v119 & 4) != 0)
  {
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v76 = v135;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v146 objects:v209 count:16];
    if (v77)
    {
      uint64_t v78 = *(void *)v147;
      do
      {
        for (kuint64_t k = 0; kk != v77; ++kk)
        {
          if (*(void *)v147 != v78) {
            objc_enumerationMutation(v76);
          }
          v80 = *(void **)(*((void *)&v146 + 1) + 8 * kk);
          v143[0] = MEMORY[0x1E4F143A8];
          v143[1] = 3221225472;
          v143[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_68;
          v143[3] = &unk_1E6910648;
          v144 = v138;
          v145 = &v205;
          [v80 processResultsSynchronouslyForInvestigation:v139 withProgressBlock:v143];
        }
        uint64_t v77 = [v76 countByEnumeratingWithState:&v146 objects:v209 count:16];
      }
      while (v77);
    }
  }
  if (!*((unsigned char *)v206 + 24))
  {
    [v139 _didEndInvestigation:1];
    goto LABEL_108;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v219) = 398;
    v51 = MEMORY[0x1E4F14500];
    goto LABEL_77;
  }
LABEL_108:

  _Block_object_dispose(&v205, 8);
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_66(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_67(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_68(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (void)performInvestigation:(id)a3 progressBlock:(id)a4
{
}

- (void)performInvestigation:(id)a3
{
}

- (id)profileIdentifierForHash:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_profileClasses;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "valueForKey:", @"identifier", (void)v13);
        if ([v10 hash] == a3)
        {
          id v11 = v10;

          v7 = v11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)profileClassForIdentifier:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_profileClassesByIdentifier objectForKey:a3];
}

- (id)informantClassesForAnyIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CLSInspector *)self informantClassForIdentifier:v4];
  if (v5)
  {
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v6 = [(CLSInspector *)self informantClassesForFamilyIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)informantClassesForFamilyIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_informantClassesByFamilyIdentifier objectForKey:a3];
}

- (Class)informantClassForIdentifier:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_informantClassesByIdentifier objectForKey:a3];
}

- (CLSInspector)init
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)CLSInspector;
  v2 = [(CLSInspector *)&v43 init];
  v3 = v2;
  if (v2)
  {
    profileClasses = v2->_profileClasses;
    v2->_profileClasses = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = objc_opt_new();
    profileClassesByIdentifier = v3->_profileClassesByIdentifier;
    v3->_profileClassesByIdentifier = (NSMutableDictionary *)v5;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v7 = v3->_profileClasses;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v13 = v3->_profileClassesByIdentifier;
          long long v14 = [v12 identifier];
          [(NSMutableDictionary *)v13 setObject:v12 forKey:v14];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v45[2] = objc_opt_class();
    v45[3] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    informantClasses = v3->_informantClasses;
    v3->_informantClasses = (NSArray *)v15;

    uint64_t v17 = objc_opt_new();
    informantClassesByIdentifier = v3->_informantClassesByIdentifier;
    v3->_informantClassesByIdentifier = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    informantClassesByFamilyIdentifier = v3->_informantClassesByFamilyIdentifier;
    v3->_informantClassesByFamilyIdentifier = (NSMutableDictionary *)v19;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = v3->_informantClasses;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v27 = v3->_informantClassesByIdentifier;
          v28 = objc_msgSend(v26, "identifier", (void)v35);
          [(NSMutableDictionary *)v27 setObject:v26 forKey:v28];

          v29 = v3->_informantClassesByFamilyIdentifier;
          uint64_t v30 = [v26 familyIdentifier];
          uint64_t v31 = [(NSMutableDictionary *)v29 objectForKey:v30];

          if (!v31)
          {
            uint64_t v31 = objc_opt_new();
            v32 = v3->_informantClassesByFamilyIdentifier;
            v33 = [v26 familyIdentifier];
            [(NSMutableDictionary *)v32 setObject:v31 forKey:v33];
          }
          [v31 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v23);
    }
  }
  return v3;
}

@end