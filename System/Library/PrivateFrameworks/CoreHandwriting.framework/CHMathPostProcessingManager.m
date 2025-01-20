@interface CHMathPostProcessingManager
+ (BOOL)hasTransitionProperties:(unint64_t)a3 currentProperty:(unint64_t)a4 properties:(unint64_t)a5;
+ (id)concatenateTokensIntoTranscription:(id)a3 tokenSeparator:(id)a4;
+ (id)tokenizedTextResultFromTokenizedMathResult:(id)a3 locale:(id)a4;
+ (unique_ptr<CoreHandwriting::LaTeXSyntaxHelper,)createLatexHelperFromMathCodemap:(id)a3;
- (CHMathPostProcessingManager)init;
- (CHMathPostProcessingManager)initWithSequence:(id)a3;
- (CHMathPostProcessingManager)initWithStep:(id)a3;
- (NSArray)sequence;
- (id)process:(id)a3 options:(id)a4;
- (void)setSequence:(id)a3;
@end

@implementation CHMathPostProcessingManager

- (CHMathPostProcessingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHMathPostProcessingManager;
  v2 = [(CHMathPostProcessingManager *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    sequence = v2->_sequence;
    v2->_sequence = v3;
  }
  return v2;
}

- (CHMathPostProcessingManager)initWithStep:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  v10 = objc_msgSend_initWithObjects_(v5, v6, (uint64_t)v4, v7, v8, v9, 0);
  v15 = (CHMathPostProcessingManager *)objc_msgSend_initWithSequence_(self, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

- (CHMathPostProcessingManager)initWithSequence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHMathPostProcessingManager;
  objc_super v6 = [(CHMathPostProcessingManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sequence, a3);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v12 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v14 = objc_msgSend_sequence(self, v7, v8, v9, v10, v11);
    unint64_t v20 = objc_msgSend_count(v14, v15, v16, v17, v18, v19);

    if (i >= v20) {
      break;
    }
    v26 = objc_msgSend_sequence(self, v21, v22, v23, v24, v25);
    v31 = objc_msgSend_objectAtIndex_(v26, v27, i, v28, v29, v30);

    uint64_t v35 = objc_msgSend_process_options_(v31, v32, (uint64_t)v6, (uint64_t)v12, v33, v34);

    id v6 = (id)v35;
  }

  return v6;
}

+ (BOOL)hasTransitionProperties:(unint64_t)a3 currentProperty:(unint64_t)a4 properties:(unint64_t)a5
{
  return ((a5 & a3) != 0) ^ ((a5 & a4) != 0);
}

+ (id)tokenizedTextResultFromTokenizedMathResult:(id)a3 locale:(id)a4
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v182 = a3;
  id v177 = a4;
  v175 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  v174 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  uint64_t v25 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v15, v16, v17, v18, v19);
  for (unint64_t i = 0; ; ++i)
  {
    v26 = objc_msgSend_transcriptionPaths(v182, v20, v21, v22, v23, v24);
    BOOL v32 = i < objc_msgSend_count(v26, v27, v28, v29, v30, v31);

    if (!v32) {
      break;
    }
    v38 = objc_msgSend_transcriptionPaths(v182, v33, v34, v35, v36, v37);
    v181 = objc_msgSend_objectAtIndexedSubscript_(v38, v39, i, v40, v41, v42);

    v178 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v43, v44, v45, v46, v47);
    uint64_t v238 = 0;
    v239 = (double *)&v238;
    uint64_t v240 = 0x2020000000;
    uint64_t v241 = 0;
    uint64_t v234 = 0;
    v235 = &v234;
    uint64_t v236 = 0x2020000000;
    uint64_t v237 = 0;
    v179 = objc_msgSend_string(MEMORY[0x1E4F28E78], v48, v49, v50, v51, v52);
    v180 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v53, v54, v55, v56, v57);
    uint64_t v226 = 0;
    v227 = (double *)&v226;
    uint64_t v228 = 0x5012000000;
    v229 = sub_1C4934B44;
    v230 = nullsub_1;
    v231 = &unk_1C4CB5C62;
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v232 = *MEMORY[0x1E4F1DB20];
    long long v233 = v58;
    uint64_t v222 = 0;
    v223 = (double *)&v222;
    uint64_t v224 = 0x2020000000;
    uint64_t v225 = 0;
    uint64_t v218 = 0;
    v219 = &v218;
    uint64_t v220 = 0x2020000000;
    uint64_t v221 = 0;
    uint64_t v214 = 0;
    v215 = &v214;
    uint64_t v216 = 0x2020000000;
    uint64_t v217 = 8;
    uint64_t v210 = 0;
    v211 = &v210;
    uint64_t v212 = 0x2020000000;
    uint64_t v213 = 4;
    v209[0] = 0;
    v209[1] = v209;
    v209[2] = 0x2020000000;
    v209[3] = 0;
    v208[0] = 0;
    v208[1] = v208;
    v208[2] = 0x2020000000;
    v208[3] = 0;
    uint64_t v64 = objc_msgSend_tokenColumnCount(v182, v59, v60, v61, v62, v63);
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = sub_1C4934B54;
    v192[3] = &unk_1E64E0CB0;
    v197 = &v238;
    v198 = &v234;
    v199 = &v218;
    v200 = v208;
    id v65 = v180;
    id v193 = v65;
    id v66 = v179;
    id v194 = v66;
    v201 = &v222;
    v202 = &v214;
    id v67 = v177;
    id v195 = v67;
    v203 = &v210;
    v204 = &v226;
    id v68 = v178;
    id v196 = v68;
    v205 = v209;
    id v206 = a1;
    uint64_t v207 = 8388610;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v182, v69, (uint64_t)v181, 0, v64, (uint64_t)v192);
    v70 = v239;
    v70[3] = exp(v239[3] / (double)v235[3]);
    if (objc_msgSend_length(v66, v71, v72, v73, v74, v75))
    {
      v81 = v223;
      v81[3] = exp(v223[3] / (double)v219[3]);
      v87 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v82, v83, v84, v85, v86);
      v92 = objc_msgSend_stringByTrimmingCharactersInSet_(v66, v88, (uint64_t)v87, v89, v90, v91);
      v97 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v93, (uint64_t)v92, v94, v95, v96);

      v98 = [CHTokenizedTextResultToken alloc];
      v104 = objc_msgSend_copy(v65, v99, v100, v101, v102, v103);
      double v105 = v223[3];
      uint64_t v106 = v215[3];
      uint64_t v107 = v211[3];
      uint64_t v113 = objc_msgSend_count(v65, v108, v109, v110, v111, v112);
      v115 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v98, v114, (uint64_t)v97, (uint64_t)v104, 0, v106, v67, v107, v105, v105, v105, 1.0, v227[6], v227[7], v227[8], v227[9], v113);

      objc_msgSend_addObject_(v68, v116, (uint64_t)v115, v117, v118, v119);
    }
    if (!i)
    {
      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v120 = v68;
      uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v142, (uint64_t)&v188, (uint64_t)v245, 16, v143);
      if (v149)
      {
        uint64_t v150 = *(void *)v189;
        do
        {
          for (uint64_t j = 0; j != v149; ++j)
          {
            if (*(void *)v189 != v150) {
              objc_enumerationMutation(v120);
            }
            v152 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v188 + 1) + 8 * j), v144, v145, v146, v147, v148);
            objc_msgSend_addIndexes_(v25, v153, (uint64_t)v152, v154, v155, v156);
          }
          uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v144, (uint64_t)&v188, (uint64_t)v245, 16, v148);
        }
        while (v149);
      }
LABEL_26:

      objc_msgSend_addObject_(v175, v157, (uint64_t)v68, v158, v159, v160);
      objc_msgSend_numberWithDouble_(NSNumber, v161, v162, v163, v164, v165, v239[3]);
      id v120 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v174, v166, (uint64_t)v120, v167, v168, v169);
      goto LABEL_27;
    }
    objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v76, v77, v78, v79, v80);
    id v120 = (id)objc_claimAutoreleasedReturnValue();
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    id v121 = v68;
    uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v184, (uint64_t)v244, 16, v123);
    if (v129)
    {
      uint64_t v130 = *(void *)v185;
      do
      {
        for (uint64_t k = 0; k != v129; ++k)
        {
          if (*(void *)v185 != v130) {
            objc_enumerationMutation(v121);
          }
          v132 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v184 + 1) + 8 * k), v124, v125, v126, v127, v128);
          objc_msgSend_addIndexes_(v120, v133, (uint64_t)v132, v134, v135, v136);
        }
        uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v184, (uint64_t)v244, 16, v128);
      }
      while (v129);
    }

    if (objc_msgSend_isEqualToIndexSet_(v120, v137, (uint64_t)v25, v138, v139, v140)) {
      goto LABEL_26;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v141 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v243 = i;
      _os_log_impl(&dword_1C492D000, v141, OS_LOG_TYPE_ERROR, "Skipping invalid alternative math transcription path (%lu) during conversion to text result.", buf, 0xCu);
    }

LABEL_27:
    _Block_object_dispose(v208, 8);
    _Block_object_dispose(v209, 8);
    _Block_object_dispose(&v210, 8);
    _Block_object_dispose(&v214, 8);
    _Block_object_dispose(&v218, 8);
    _Block_object_dispose(&v222, 8);
    _Block_object_dispose(&v226, 8);

    _Block_object_dispose(&v234, 8);
    _Block_object_dispose(&v238, 8);
  }
  v170 = [CHTokenizedTextResult alloc];
  v172 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v170, v171, (uint64_t)v175, (uint64_t)v174, (uint64_t)&stru_1F20141C8, 2);

  return v172;
}

+ (id)concatenateTokensIntoTranscription:(id)a3 tokenSeparator:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_string(MEMORY[0x1E4F28E78], v7, v8, v9, v10, v11);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v5;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v13);
        }
        uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend_length(v12, v16, v17, v18, v19, v20, (void)v36)) {
          objc_msgSend_appendString_(v12, v25, (uint64_t)v6, v27, v28, v29);
        }
        uint64_t v30 = objc_msgSend_string(v24, v25, v26, v27, v28, v29);
        objc_msgSend_appendString_(v12, v31, (uint64_t)v30, v32, v33, v34);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v36, (uint64_t)v40, 16, v20);
    }
    while (v21);
  }

  return v12;
}

+ (unique_ptr<CoreHandwriting::LaTeXSyntaxHelper,)createLatexHelperFromMathCodemap:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0;
  v117[0] = 0;
  v117[1] = 0;
  id v105 = a3;
  v116 = v117;
  while (1)
  {
    if (objc_msgSend_count(v105, v4, v5, v6, v7, v8) <= v3)
    {
      __dst = 0;
      v114 = 0;
      unint64_t v115 = 0;
      __p[0] = &__dst;
      LOBYTE(__p[1]) = 0;
      uint64_t v25 = (char *)operator new(0x138uLL);
      unint64_t v115 = (unint64_t)(v25 + 312);
      *(void *)uint64_t v25 = 11356;
      v25[23] = 2;
      *((void *)v25 + 3) = 39;
      v25[47] = 1;
      *((void *)v25 + 6) = 10023;
      v25[71] = 2;
      *((void *)v25 + 9) = 45250;
      v25[95] = 2;
      *((void *)v25 + 12) = 0x287466656C5CLL;
      v25[119] = 6;
      *((void *)v25 + 15) = 0x7C7466656C5CLL;
      v25[143] = 6;
      strcpy(v25 + 144, "\\left\\lfloor");
      v25[157] = 0;
      *((_WORD *)v25 + 79) = 0;
      v25[167] = 12;
      *((void *)v25 + 21) = 0x636C5C7466656C5CLL;
      *((void *)v25 + 22) = 7104869;
      v25[191] = 11;
      *((void *)v25 + 24) = 0x2974686769725CLL;
      v25[215] = 7;
      *((void *)v25 + 27) = 0x7C74686769725CLL;
      v25[239] = 7;
      strcpy(v25 + 240, "\\right\\rfloor");
      *((_WORD *)v25 + 127) = 0;
      v25[263] = 13;
      strcpy(v25 + 264, "\\right\\rceil");
      v25[277] = 0;
      *((_WORD *)v25 + 139) = 0;
      v25[287] = 12;
      *((void *)v25 + 36) = 0x6D726874616D5CLL;
      v25[311] = 7;
      __dst = (void **)v25;
      v114 = (void **)(v25 + 312);
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      uint64_t v31 = objc_msgSend_definedMathFunctionNameMapping(CHDecodeMathFunctionStep, v26, v27, v28, v29, v30);
      objc_msgSend_allValues(v31, v32, v33, v34, v35, v36);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v109, (uint64_t)v118, 16, v38);
      if (!v39) {
        goto LABEL_53;
      }
      uint64_t v40 = *(void *)v110;
      while (2)
      {
        uint64_t v41 = 0;
LABEL_19:
        if (*(void *)v110 != v40) {
          objc_enumerationMutation(obj);
        }
        id v43 = *(id *)(*((void *)&v109 + 1) + 8 * v41);
        uint64_t v49 = (const char *)objc_msgSend_UTF8String(v43, v44, v45, v46, v47, v48);
        size_t v50 = strlen(v49);
        if (v50 > 0x7FFFFFFFFFFFFFF7) {
          sub_1C4949B7C();
        }
        v53 = (void *)v50;
        if (v50 >= 0x17)
        {
          uint64_t v57 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v50 | 7) != 0x17) {
            uint64_t v57 = v50 | 7;
          }
          uint64_t v58 = v57 + 1;
          uint64_t v54 = operator new(v57 + 1);
          __p[1] = v53;
          unint64_t v108 = v58 | 0x8000000000000000;
          __p[0] = v54;
        }
        else
        {
          HIBYTE(v108) = v50;
          uint64_t v54 = __p;
          if (!v50)
          {
            LOBYTE(__p[0]) = 0;
            uint64_t v56 = (char *)v114;
            unint64_t v55 = v115;
            if ((unint64_t)v114 >= v115)
            {
LABEL_30:
              v59 = (char *)__dst;
              unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((v56 - (char *)__dst) >> 3);
              unint64_t v61 = v60 + 1;
              if (v60 + 1 > 0xAAAAAAAAAAAAAAALL) {
                sub_1C494A220();
              }
              unint64_t v62 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)__dst) >> 3);
              if (2 * v62 > v61) {
                unint64_t v61 = 2 * v62;
              }
              if (v62 >= 0x555555555555555) {
                unint64_t v63 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v63 = v61;
              }
              if (v63)
              {
                if (v63 > 0xAAAAAAAAAAAAAAALL) {
                  sub_1C4949AA8();
                }
                uint64_t v64 = (char *)operator new(24 * v63);
              }
              else
              {
                uint64_t v64 = 0;
              }
              id v65 = &v64[24 * v60];
              *(_OWORD *)id v65 = *(_OWORD *)__p;
              *((void *)v65 + 2) = v108;
              __p[1] = 0;
              unint64_t v108 = 0;
              __p[0] = 0;
              id v66 = (void **)(v65 + 24);
              if (v56 == v59)
              {
                __dst = (void **)v65;
                v114 = (void **)(v65 + 24);
                unint64_t v115 = (unint64_t)&v64[24 * v63];
              }
              else
              {
                do
                {
                  long long v67 = *(_OWORD *)(v56 - 24);
                  *((void *)v65 - 1) = *((void *)v56 - 1);
                  *(_OWORD *)(v65 - 24) = v67;
                  v65 -= 24;
                  *((void *)v56 - 2) = 0;
                  *((void *)v56 - 1) = 0;
                  *((void *)v56 - 3) = 0;
                  v56 -= 24;
                }
                while (v56 != v59);
                uint64_t v56 = (char *)__dst;
                id v68 = v114;
                __dst = (void **)v65;
                v114 = v66;
                unint64_t v115 = (unint64_t)&v64[24 * v63];
                while (v68 != (void **)v56)
                {
                  if (*((char *)v68 - 1) < 0) {
                    operator delete(*(v68 - 3));
                  }
                  v68 -= 3;
                }
              }
              if (v56) {
                operator delete(v56);
              }
              v114 = v66;
              if (SHIBYTE(v108) < 0) {
                operator delete(__p[0]);
              }
LABEL_18:
              if (++v41 == v39)
              {
                uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v109, (uint64_t)v118, 16, v52);
                if (!v39)
                {
LABEL_53:

                  int v74 = objc_msgSend_count(v105, v69, v70, v71, v72, v73);
                  v76 = __dst;
                  uint64_t v75 = v114;
                  if (__dst != v114)
                  {
                    int v77 = v74;
                    do
                    {
                      uint64_t v78 = v117[0];
                      if (!v117[0]) {
                        goto LABEL_99;
                      }
                      int v79 = *((char *)v76 + 23);
                      size_t v80 = v79 >= 0 ? *((unsigned __int8 *)v76 + 23) : (size_t)v76[1];
                      v81 = v79 >= 0 ? v76 : (void **)*v76;
                      v82 = v117;
                      do
                      {
                        uint64_t v83 = v78;
                        uint64_t v84 = v82;
                        uint64_t v86 = (const void *)(v78 + 32);
                        uint64_t v85 = *(const void **)(v78 + 32);
                        int v87 = *(char *)(v83 + 55);
                        if (v87 >= 0) {
                          size_t v88 = *(unsigned __int8 *)(v83 + 55);
                        }
                        else {
                          size_t v88 = *(void *)(v83 + 40);
                        }
                        if (v87 >= 0) {
                          uint64_t v89 = v86;
                        }
                        else {
                          uint64_t v89 = v85;
                        }
                        if (v80 >= v88) {
                          size_t v90 = v88;
                        }
                        else {
                          size_t v90 = v80;
                        }
                        int v91 = memcmp(v89, v81, v90);
                        if (v91) {
                          BOOL v92 = v91 < 0;
                        }
                        else {
                          BOOL v92 = v88 < v80;
                        }
                        v93 = (uint64_t *)(v83 + 8);
                        if (v92)
                        {
                          v82 = v84;
                        }
                        else
                        {
                          v93 = (uint64_t *)v83;
                          v82 = (void *)v83;
                        }
                        uint64_t v78 = *v93;
                      }
                      while (v78);
                      if (v82 == v117) {
                        goto LABEL_99;
                      }
                      uint64_t v94 = v84 + 4;
                      BOOL v95 = !v92;
                      if (v92) {
                        uint64_t v96 = v84;
                      }
                      else {
                        uint64_t v96 = (void *)v83;
                      }
                      if (v95) {
                        uint64_t v94 = v86;
                      }
                      size_t v97 = *((unsigned __int8 *)v82 + 55);
                      v99 = (const void *)v96[4];
                      size_t v98 = v96[5];
                      if ((v97 & 0x80u) == 0) {
                        size_t v100 = v97;
                      }
                      else {
                        size_t v100 = v98;
                      }
                      if ((v97 & 0x80u) == 0) {
                        uint64_t v101 = v94;
                      }
                      else {
                        uint64_t v101 = v99;
                      }
                      if (v100 >= v80) {
                        size_t v102 = v80;
                      }
                      else {
                        size_t v102 = v100;
                      }
                      int v103 = memcmp(v81, v101, v102);
                      BOOL v104 = v80 < v100;
                      if (v103) {
                        BOOL v104 = v103 < 0;
                      }
                      if (v104)
                      {
LABEL_99:
                        __p[0] = v76;
                        *((_DWORD *)sub_1C494A238(&v116, (const void **)v76, (uint64_t)&unk_1C4C39B40, (long long **)__p)
                        + 14) = v77++;
                      }
                      v76 += 3;
                    }
                    while (v76 != v75);
                  }
                  operator new();
                }
                continue;
              }
              goto LABEL_19;
            }
LABEL_17:
            long long v42 = *(_OWORD *)__p;
            *((void *)v56 + 2) = v108;
            *(_OWORD *)uint64_t v56 = v42;
            v114 = (void **)(v56 + 24);
            goto LABEL_18;
          }
        }
        break;
      }
      memmove(v54, v49, (size_t)v53);
      *((unsigned char *)v53 + (void)v54) = 0;
      uint64_t v56 = (char *)v114;
      unint64_t v55 = v115;
      if ((unint64_t)v114 >= v115) {
        goto LABEL_30;
      }
      goto LABEL_17;
    }
    objc_msgSend_objectAtIndexedSubscript_(v105, v9, v3, v10, v11, v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16, v17, v18);
    size_t v20 = strlen(v19);
    if (v20 > 0x7FFFFFFFFFFFFFF7) {
      sub_1C4949B7C();
    }
    size_t v21 = v20;
    if (v20 >= 0x17) {
      break;
    }
    HIBYTE(v115) = v20;
    p_dst = (void **)&__dst;
    if (v20) {
      goto LABEL_10;
    }
LABEL_11:
    *((unsigned char *)p_dst + v21) = 0;
    __p[0] = &__dst;
    *((_DWORD *)sub_1C4949E58(&v116, (const void **)&__dst, (uint64_t)&unk_1C4C39B40, (_OWORD **)__p) + 14) = v3;
    if (SHIBYTE(v115) < 0) {
      operator delete(__dst);
    }

    ++v3;
  }
  uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v20 | 7) != 0x17) {
    uint64_t v23 = v20 | 7;
  }
  uint64_t v24 = v23 + 1;
  p_dst = (void **)operator new(v23 + 1);
  v114 = (void **)v21;
  unint64_t v115 = v24 | 0x8000000000000000;
  __dst = p_dst;
LABEL_10:
  memmove(p_dst, v19, v21);
  goto LABEL_11;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end