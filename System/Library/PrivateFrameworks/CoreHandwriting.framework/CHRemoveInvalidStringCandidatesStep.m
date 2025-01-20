@interface CHRemoveInvalidStringCandidatesStep
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHRemoveInvalidStringCandidatesStep

- (id)process:(id)a3 options:(id)a4
{
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v266 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidStringCandidatesStep is running", buf, 2u);
  }

  v12 = objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v18 = objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  BOOL v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23) == 0;

  if (v24)
  {
    id v216 = v5;
    goto LABEL_61;
  }
  v267 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
  for (unint64_t i = 0; ; ++i)
  {
    v36 = objc_msgSend_result(v5, v30, v31, v32, v33, v34);
    v42 = objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    BOOL v48 = i < objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (!v48) {
      break;
    }
    v54 = objc_msgSend_result(v5, v49, v50, v51, v52, v53);
    v60 = objc_msgSend_transcriptionPaths(v54, v55, v56, v57, v58, v59);
    v65 = objc_msgSend_objectAtIndexedSubscript_(v60, v61, i, v62, v63, v64);

    v71 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v66, v67, v68, v69, v70);
    v77 = objc_msgSend_result(v5, v72, v73, v74, v75, v76);
    v83 = objc_msgSend_result(v5, v78, v79, v80, v81, v82);
    uint64_t v89 = objc_msgSend_tokenColumnCount(v83, v84, v85, v86, v87, v88);
    v275[0] = MEMORY[0x1E4F143A8];
    v275[1] = 3221225472;
    v275[2] = sub_1C493E73C;
    v275[3] = &unk_1E64E0CD8;
    id v90 = v71;
    id v276 = v90;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v77, v91, (uint64_t)v65, 0, v89, (uint64_t)v275);

    objc_msgSend_addObject_(v267, v92, (uint64_t)v90, v93, v94, v95);
  }
  v96 = objc_msgSend_result(v5, v49, v50, v51, v52, v53);
  v102 = objc_msgSend_transcriptionPaths(v96, v97, v98, v99, v100, v101);
  unint64_t v108 = objc_msgSend_count(v102, v103, v104, v105, v106, v107);
  unint64_t v109 = v108;
  *(void *)buf = 0;
  v273 = 0;
  v274 = 0;
  if (v108)
  {
    if (v108 >> 61) {
      sub_1C494A220();
    }
    v110 = (char *)operator new(8 * v108);
    v111 = &v110[8 * v109];
    *(void *)buf = v110;
    v274 = v111;
    bzero(v110, 8 * v109);
    v273 = v111;
  }

  for (uint64_t j = 0; ; ++j)
  {
    v118 = objc_msgSend_result(v5, v112, v113, v114, v115, v116);
    BOOL v124 = j < objc_msgSend_tokenColumnCount(v118, v119, v120, v121, v122, v123);

    if (!v124) {
      break;
    }
    v130 = objc_msgSend_result(v5, v125, v126, v127, v128, v129);
    v135 = objc_msgSend_tokenRowsAtColumnIndex_(v130, v131, j, v132, v133, v134);

    if ((unint64_t)objc_msgSend_count(v135, v136, v137, v138, v139, v140) >= 2)
    {
      v151 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v141, v142, v143, v144, v145);
      for (unint64_t k = 0; k < objc_msgSend_count(v135, v146, v147, v148, v149, v150); ++k)
      {
        long long v270 = 0u;
        long long v271 = 0u;
        long long v268 = 0u;
        long long v269 = 0u;
        v158 = objc_msgSend_objectAtIndexedSubscript_(v135, v153, k, v155, v156, v157);
        uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v268, (uint64_t)v278, 16, v160);
        if (v166)
        {
          uint64_t v167 = *(void *)v269;
          while (2)
          {
            for (uint64_t m = 0; m != v166; ++m)
            {
              if (*(void *)v269 != v167) {
                objc_enumerationMutation(v158);
              }
              if (!objc_msgSend_properties(*(void **)(*((void *)&v268 + 1) + 8 * m), v161, v162, v163, v164, v165))
              {
                objc_msgSend_addIndex_(v151, v161, k, v163, v164, v165);
                goto LABEL_27;
              }
            }
            uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v268, (uint64_t)v278, 16, v165);
            if (v166) {
              continue;
            }
            break;
          }
        }
LABEL_27:
      }
      for (unint64_t n = 0; ; ++n)
      {
        v170 = objc_msgSend_result(v5, v153, v154, v155, v156, v157);
        v176 = objc_msgSend_transcriptionPaths(v170, v171, v172, v173, v174, v175);
        BOOL v182 = n < objc_msgSend_count(v176, v177, v178, v179, v180, v181);

        if (!v182) {
          break;
        }
        v188 = objc_msgSend_result(v5, v183, v184, v185, v186, v187);
        v194 = objc_msgSend_transcriptionPaths(v188, v189, v190, v191, v192, v193);
        v199 = objc_msgSend_objectAtIndexedSubscript_(v194, v195, n, v196, v197, v198);

        uint64_t v204 = objc_msgSend_indexAtPosition_(v199, v200, j, v201, v202, v203);
        if (objc_msgSend_containsIndex_(v151, v205, v204, v206, v207, v208)) {
          ++*(void *)(*(void *)buf + 8 * n);
        }
      }
    }
  }
  unint64_t v209 = objc_msgSend_count(v267, v125, v126, v127, v128, v129);
  unint64_t v210 = v209;
  if (!v209)
  {
    v212 = 0;
    v213 = 0;
    goto LABEL_45;
  }
  if (v209 >> 61) {
    sub_1C494A220();
  }
  uint64_t v211 = 8 * v209;
  v212 = (int64x2_t *)operator new(8 * v209);
  bzero(v212, 8 * v210);
  v213 = &v212->i64[(unint64_t)v211 / 8];
  if ((unint64_t)(v211 - 8) < 0x18)
  {
    uint64_t v214 = 0;
    v215 = (uint64_t *)v212;
    do
LABEL_44:
      *v215++ = v214++;
    while (v215 != v213);
    goto LABEL_45;
  }
  unint64_t v217 = ((unint64_t)(v211 - 8) >> 3) + 1;
  uint64_t v214 = v217 & 0x3FFFFFFFFFFFFFFCLL;
  v215 = &v212->i64[v217 & 0x3FFFFFFFFFFFFFFCLL];
  int64x2_t v218 = (int64x2_t)xmmword_1C4C39B30;
  v219 = v212 + 1;
  int64x2_t v220 = vdupq_n_s64(2uLL);
  int64x2_t v221 = vdupq_n_s64(4uLL);
  uint64_t v222 = v217 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v219[-1] = v218;
    int64x2_t *v219 = vaddq_s64(v218, v220);
    int64x2_t v218 = vaddq_s64(v218, v221);
    v219 += 2;
    v222 -= 4;
  }
  while (v222);
  if (v217 != v214) {
    goto LABEL_44;
  }
LABEL_45:
  v277 = buf;
  unint64_t v223 = ((char *)v213 - (char *)v212) >> 3;
  unint64_t v224 = 126 - 2 * __clz(v223);
  if (v210) {
    uint64_t v225 = v224;
  }
  else {
    uint64_t v225 = 0;
  }
  sub_1C494BBB0((uint64_t)v212, v213, (uint64_t **)&v277, v225, 1);
  v231 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v226, v227, v228, v229, v230);
  v237 = objc_msgSend_firstObject(v267, v232, v233, v234, v235, v236);
  objc_msgSend_addObject_(v231, v238, (uint64_t)v237, v239, v240, v241);

  if (v210)
  {
    if (v223 <= 1) {
      unint64_t v223 = 1;
    }
    v246 = (uint64_t *)v212;
    do
    {
      uint64_t v248 = *v246++;
      uint64_t v247 = v248;
      if (v248)
      {
        if (*(void *)(*(void *)buf + 8 * v247) > **(void **)buf) {
          break;
        }
        v249 = objc_msgSend_objectAtIndexedSubscript_(v267, v242, v247, v243, v244, v245);
        objc_msgSend_addObject_(v231, v250, (uint64_t)v249, v251, v252, v253);
      }
      --v223;
    }
    while (v223);
  }
  v254 = [CHTokenizedMathResult alloc];
  v259 = objc_msgSend_initWithBestPathTokens_(v254, v255, (uint64_t)v231, v256, v257, v258);
  objc_msgSend_setResult_(v5, v260, (uint64_t)v259, v261, v262, v263);

  id v264 = v5;
  if (v212) {
    operator delete(v212);
  }
  if (*(void *)buf)
  {
    v273 = *(char **)buf;
    operator delete(*(void **)buf);
  }

LABEL_61:
  return v5;
}

@end