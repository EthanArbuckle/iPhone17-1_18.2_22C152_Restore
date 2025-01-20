@interface CHDecodeMathFunctionStep
+ (BOOL)isFunctionInTranscriptionPathWrappedByAnyStringFromArray:(id)a3 functionName:(id)a4 pathTranscription:(id)a5 functionStartLocation:(int64_t)a6;
+ (id)definedMathFunctionNameMapping;
+ (id)definedMathFunctionNameSet;
- (CHDecodeMathFunctionStep)init;
- (id)_sortedFunctionNames:(id)a3;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHDecodeMathFunctionStep

+ (id)definedMathFunctionNameMapping
{
  return &unk_1F203CE00;
}

+ (id)definedMathFunctionNameSet
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v8 = objc_msgSend_definedMathFunctionNameMapping(v2, v3, v4, v5, v6, v7);
  v14 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v9, v10, v11, v12, v13);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v20 = objc_msgSend_allKeys(v8, v15, v16, v17, v18, v19, 0);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v41, (uint64_t)v45, 16, v22);
  if (v26)
  {
    uint64_t v27 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v20);
        }
        v29 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(*(void **)(*((void *)&v41 + 1) + 8 * i), v23, @" ", (uint64_t)&stru_1F20141C8, v24, v25);
        objc_msgSend_addObject_(v14, v30, (uint64_t)v29, v31, v32, v33);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v41, (uint64_t)v45, 16, v25);
    }
    while (v26);
  }

  v39 = objc_msgSend_copy(v14, v34, v35, v36, v37, v38);
  return v39;
}

- (CHDecodeMathFunctionStep)init
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v108.receiver = self;
  v108.super_class = (Class)CHDecodeMathFunctionStep;
  v2 = [(CHDecodeMathFunctionStep *)&v108 init];
  if (v2)
  {
    v3 = objc_opt_class();
    uint64_t v9 = objc_msgSend_definedMathFunctionNameMapping(v3, v4, v5, v6, v7, v8);
    mathFunctionNameMapping = v2->_mathFunctionNameMapping;
    v95 = v2;
    v2->_mathFunctionNameMapping = (NSDictionary *)v9;

    obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v16 = objc_msgSend_allKeys(v2->_mathFunctionNameMapping, v11, v12, v13, v14, v15);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v104, (uint64_t)v111, 16, v18);
    if (v19)
    {
      v90 = v16;
      uint64_t v91 = *(void *)v105;
      do
      {
        uint64_t v20 = 0;
        uint64_t v92 = v19;
        do
        {
          if (*(void *)v105 != v91) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v104 + 1) + 8 * v20);
          id v94 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          uint64_t v27 = objc_msgSend_allKeys(v95->_mathFunctionNameMapping, v22, v23, v24, v25, v26);
          uint64_t v93 = v20;
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v100, (uint64_t)v110, 16, v29);
          if (v35)
          {
            uint64_t v36 = *(void *)v101;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v101 != v36) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v38 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                unint64_t v39 = objc_msgSend_length(v38, v30, v31, v32, v33, v34);
                if (v39 > objc_msgSend_length(v21, v40, v41, v42, v43, v44)
                  && objc_msgSend_rangeOfString_(v38, v30, (uint64_t)v21, v32, v33, v34) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v45 = objc_msgSend_objectForKey_(v95->_mathFunctionNameMapping, v30, (uint64_t)v38, v32, v33, v34);
                  BOOL v50 = objc_msgSend_rangeOfString_(v45, v46, @"\\mathrm", v47, v48, v49) == 0x7FFFFFFFFFFFFFFFLL;

                  if (!v50)
                  {
                    v51 = objc_msgSend_objectForKey_(v95->_mathFunctionNameMapping, v30, (uint64_t)v38, v32, v33, v34);
                    objc_msgSend_addObject_(v94, v52, (uint64_t)v51, v53, v54, v55);
                  }
                }
              }
              uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v100, (uint64_t)v110, 16, v34);
            }
            while (v35);
          }

          if (objc_msgSend_count(v94, v56, v57, v58, v59, v60)) {
            objc_msgSend_setValue_forKey_(obj, v61, (uint64_t)v94, (uint64_t)v21, v62, v63);
          }

          uint64_t v20 = v93 + 1;
          uint64_t v16 = v90;
        }
        while (v93 + 1 != v92);
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v64, (uint64_t)&v104, (uint64_t)v111, 16, v65);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v95->_stemFunctionMappings, obj);
    v66 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v72 = objc_msgSend_allKeys(v95->_stemFunctionMappings, v67, v68, v69, v70, v71);
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v96, (uint64_t)v109, 16, v74);
    if (v79)
    {
      uint64_t v80 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v97 != v80) {
            objc_enumerationMutation(v72);
          }
          v82 = objc_msgSend_objectForKey_(v95->_stemFunctionMappings, v75, *(void *)(*((void *)&v96 + 1) + 8 * j), v76, v77, v78);
          objc_msgSend_addObjectsFromArray_(v66, v83, (uint64_t)v82, v84, v85, v86);
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v96, (uint64_t)v109, 16, v78);
      }
      while (v79);
    }

    decoratedFunctions = v95->_decoratedFunctions;
    v95->_decoratedFunctions = v66;

    return v95;
  }
  return v2;
}

- (id)_sortedFunctionNames:(id)a3
{
  uint64_t v6 = objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v11 = objc_msgSend_sortedArrayUsingComparator_(v6, v7, (uint64_t)&unk_1F2012970, v8, v9, v10);

  return v11;
}

+ (BOOL)isFunctionInTranscriptionPathWrappedByAnyStringFromArray:(id)a3 functionName:(id)a4 pathTranscription:(id)a5 functionStartLocation:(int64_t)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v55 = a5;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v9;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v56, (uint64_t)v60, 16, v12);
  if (v18)
  {
    uint64_t v19 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v57 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_length(v21, v13, v14, v15, v16, v17);
        unint64_t v24 = objc_msgSend_rangeOfString_options_range_(v21, v23, (uint64_t)v10, 0, 0, v22);
        unint64_t v25 = v24;
        if (v24 != 0x7FFFFFFFFFFFFFFFLL && a6 >= v24)
        {
          uint64_t v27 = objc_msgSend_length(v21, v13, v14, v15, v16, v17);
          unint64_t v33 = objc_msgSend_length(v55, v28, v29, v30, v31, v32);
          uint64_t v14 = a6 - v25;
          if (v27 + a6 - v25 <= v33)
          {
            uint64_t v34 = objc_msgSend_substringWithRange_(v55, v13, v14, v27, v16, v17);
            v40 = objc_msgSend_lowercaseString(v34, v35, v36, v37, v38, v39);
            uint64_t v46 = objc_msgSend_lowercaseString(v21, v41, v42, v43, v44, v45);
            char isEqualToString = objc_msgSend_isEqualToString_(v40, v47, (uint64_t)v46, v48, v49, v50);

            if (isEqualToString)
            {
              BOOL v52 = 1;
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v56, (uint64_t)v60, 16, v17);
    }
    while (v18);
  }
  BOOL v52 = 0;
LABEL_17:

  return v52;
}

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v332 = *MEMORY[0x1E4F143B8];
  id v314 = a3;
  id v310 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v5 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHDecodeMathFunctionStep is running", buf, 2u);
  }

  v312 = objc_msgSend__sortedFunctionNames_(self, v6, (uint64_t)self->_mathFunctionNameMapping, v7, v8, v9);
  v311 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v20 = objc_msgSend_result(v314, v15, v16, v17, v18, v19, v310);
    uint64_t v26 = objc_msgSend_transcriptionPaths(v20, v21, v22, v23, v24, v25);
    BOOL v32 = i < objc_msgSend_count(v26, v27, v28, v29, v30, v31);

    if (!v32) {
      break;
    }
    uint64_t v38 = objc_msgSend_result(v314, v33, v34, v35, v36, v37);
    uint64_t v44 = objc_msgSend_transcriptionPaths(v38, v39, v40, v41, v42, v43);
    v313 = objc_msgSend_objectAtIndexedSubscript_(v44, v45, i, v46, v47, v48);

    uint64_t v54 = objc_msgSend_result(v314, v49, v50, v51, v52, v53);
    uint64_t v60 = objc_msgSend_result(v314, v55, v56, v57, v58, v59);
    uint64_t v66 = objc_msgSend_tokenColumnCount(v60, v61, v62, v63, v64, v65);
    v323 = objc_msgSend_transcriptionWithPath_columnRange_(v54, v67, (uint64_t)v313, 0, v66, v68);

    v72 = objc_msgSend_retrievePathTokens_atPathIndex_(self, v69, (uint64_t)v314, i, v70, v71);
    uint64_t v78 = objc_msgSend_mutableCopy(v72, v73, v74, v75, v76, v77);

    long long v328 = 0u;
    long long v329 = 0u;
    long long v326 = 0u;
    long long v327 = 0u;
    obuint64_t j = v312;
    uint64_t v319 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v326, (uint64_t)v331, 16, v80);
    if (v319)
    {
      uint64_t v318 = *(void *)v327;
      do
      {
        for (uint64_t j = 0; j != v319; ++j)
        {
          if (*(void *)v327 != v318) {
            objc_enumerationMutation(obj);
          }
          v325 = *(void **)(*((void *)&v326 + 1) + 8 * j);
          v320 = objc_msgSend_objectForKeyedSubscript_(self->_mathFunctionNameMapping, v81, (uint64_t)v325, v82, v83, v84);
          unint64_t v90 = 0;
LABEL_14:
          for (uint64_t k = objc_msgSend_length(v323, v85, v86, v87, v88, v89);
                v90 <= k - objc_msgSend_length(v325, v92, v93, v94, v95, v96);
                uint64_t k = objc_msgSend_length(v317, v290, v291, v292, v293, v294))
          {
            uint64_t v102 = objc_msgSend_length(v323, v97, v98, v99, v100, v101);
            uint64_t v104 = objc_msgSend_rangeOfString_options_range_(v323, v103, (uint64_t)v325, 1, v90, v102 - v90);
            uint64_t v105 = v104;
            uint64_t v106 = (uint64_t)v85;
            if (v104)
            {
              if (v104 == 0x7FFFFFFFFFFFFFFFLL) {
                break;
              }
              long long v107 = objc_msgSend_substringWithRange_(v323, v85, v104 - 1, 1, v88, v89);
              int isEqualToString = objc_msgSend_isEqualToString_(v107, v108, @" ", v109, v110, v111);

              if (!isEqualToString) {
                goto LABEL_13;
              }
            }
            v113 = objc_msgSend_objectForKey_(self->_stemFunctionMappings, v85, (uint64_t)v325, v87, v88, v89);
            BOOL v114 = v113 == 0;

            if (!v114)
            {
              v115 = objc_msgSend_objectForKeyedSubscript_(self->_stemFunctionMappings, v85, (uint64_t)v325, v87, v88, v89);
              v116 = objc_opt_class();
              char isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation = objc_msgSend_isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation_(v116, v117, (uint64_t)v115, (uint64_t)v325, (uint64_t)v323, v105);

              if (isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation) {
                goto LABEL_13;
              }
            }
            uint64_t v119 = 0;
            if (v105)
            {
              uint64_t v120 = 0;
              do
              {
                v121 = objc_msgSend_objectAtIndexedSubscript_(v78, v85, v119, v87, v88, v89);
                v127 = objc_msgSend_string(v121, v122, v123, v124, v125, v126);
                uint64_t v133 = objc_msgSend_length(v127, v128, v129, v130, v131, v132);

                v120 += v133 + 1;
                ++v119;
              }
              while (v120 != v105);
            }
            v134 = objc_msgSend_componentsSeparatedByString_(v325, v85, @" ", v87, v88, v89);
            uint64_t v140 = objc_msgSend_count(v134, v135, v136, v137, v138, v139);

            uint64_t v141 = v140 - 1;
            if (v140 < 1) {
              goto LABEL_13;
            }
            int v142 = 0;
            for (uint64_t m = 0; m != v140; ++m)
            {
              v144 = objc_msgSend_objectAtIndexedSubscript_(v78, v85, v119 + m, v87, v88, v89);
              unsigned int v150 = objc_msgSend_properties(v144, v145, v146, v147, v148, v149);

              int v142 = (v142 | (v150 >> 8)) & 1;
            }
            if (!v142)
            {
LABEL_13:
              unint64_t v90 = v105 + 1;
              goto LABEL_14;
            }
            v317 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v323, v85, v105, v106, (uint64_t)v320, v89);

            if (objc_msgSend_containsObject_(self->_decoratedFunctions, v151, (uint64_t)v320, v152, v153, v154))
            {
              for (uint64_t n = 0; n != v140; ++n)
              {
                v160 = objc_msgSend_objectAtIndexedSubscript_(v78, v155, v119 + n, v156, v157, v158);
                v161 = [CHTokenizedMathResultToken alloc];
                v324 = objc_msgSend_string(v160, v162, v163, v164, v165, v166);
                v172 = objc_msgSend_strokeIndexes(v160, v167, v168, v169, v170, v171);
                objc_msgSend_score(v160, v173, v174, v175, v176, v177);
                double v179 = v178;
                objc_msgSend_bounds(v160, v180, v181, v182, v183, v184);
                double v186 = v185;
                double v188 = v187;
                double v190 = v189;
                double v192 = v191;
                v198 = objc_msgSend_maskedAlternative(v160, v193, v194, v195, v196, v197);
                objc_msgSend_maskedAlternativeScore(v160, v199, v200, v201, v202, v203);
                v206 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v161, v204, (uint64_t)v324, (uint64_t)v172, 256, (uint64_t)v198, v179, v186, v188, v190, v192, v205);

                objc_msgSend_setObject_atIndexedSubscript_(v78, v207, (uint64_t)v206, v119 + n, v208, v209);
              }
              v210 = [CHTokenizedMathResultToken alloc];
              v216 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v211, v212, v213, v214, v215);
              v219 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v210, v217, @"\\mathrm", (uint64_t)v216, 1, v218, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

              v220 = [CHTokenizedMathResultToken alloc];
              v226 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v221, v222, v223, v224, v225);
              v229 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v220, v227, @"{", (uint64_t)v226, 1, v228, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

              v230 = [CHTokenizedMathResultToken alloc];
              v236 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v231, v232, v233, v234, v235);
              v239 = objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v230, v237, @"}", (uint64_t)v236, 1, v238, 1.0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

              objc_msgSend_insertObject_atIndex_(v78, v240, (uint64_t)v239, v140 + v119, v241, v242);
              objc_msgSend_insertObject_atIndex_(v78, v243, (uint64_t)v229, v119, v244, v245);
              objc_msgSend_insertObject_atIndex_(v78, v246, (uint64_t)v219, v119, v247, v248);
            }
            else
            {
              v249 = objc_msgSend_objectAtIndexedSubscript_(v78, v155, v119, v156, v157, v158);
              v219 = objc_msgSend_mutableCopy(v249, v250, v251, v252, v253, v254);

              if (v140 >= 2)
              {
                uint64_t v259 = v119 + 1;
                do
                {
                  v260 = objc_msgSend_objectAtIndexedSubscript_(v78, v255, v259, v256, v257, v258);
                  objc_msgSend_appendToken_(v219, v261, (uint64_t)v260, v262, v263, v264);

                  ++v259;
                  --v141;
                }
                while (v141);
              }
              objc_msgSend_setString_(v219, v255, (uint64_t)v320, v256, v257, v258);
              objc_msgSend_setProperties_(v219, v265, 256, v266, v267, v268);
              v272 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E4F28D60], v269, v119, v140, v270, v271);
              objc_msgSend_removeObjectsAtIndexes_(v78, v273, (uint64_t)v272, v274, v275, v276);

              v229 = objc_msgSend_copy(v219, v277, v278, v279, v280, v281);
              objc_msgSend_insertObject_atIndex_(v78, v282, (uint64_t)v229, v119, v283, v284);
            }

            unint64_t v90 = objc_msgSend_length(v320, v285, v286, v287, v288, v289) + v105;
            v323 = v317;
          }
        }
        uint64_t v319 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v326, (uint64_t)v331, 16, v84);
      }
      while (v319);
    }

    objc_msgSend_addObject_(v311, v295, (uint64_t)v78, v296, v297, v298);
  }
  v299 = [CHTokenizedMathResult alloc];
  v304 = objc_msgSend_initWithBestPathTokens_(v299, v300, (uint64_t)v311, v301, v302, v303);
  objc_msgSend_setResult_(v314, v305, (uint64_t)v304, v306, v307, v308);

  return v314;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedFunctions, 0);
  objc_storeStrong((id *)&self->_stemFunctionMappings, 0);
  objc_storeStrong((id *)&self->_mathFunctionNameMapping, 0);
}

@end