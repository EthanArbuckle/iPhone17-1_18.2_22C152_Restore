@interface CHTitleQuery
- (CHTitleQuery)initWithRecognitionSession:(id)a3;
- (NSSet)titleStrokeIdentifiers;
- (NSString)transcribedTitle;
- (id)debugName;
- (void)q_updateQueryResult;
@end

@implementation CHTitleQuery

- (CHTitleQuery)initWithRecognitionSession:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHTitleQuery;
  v5 = [(CHQuery *)&v13 initWithRecognitionSession:v4];
  v11 = v5;
  if (v5) {
    objc_msgSend_setPreferredUpdatesInterval_(v5, v6, v7, v8, v9, v10, 0.5);
  }

  return v11;
}

- (void)q_updateQueryResult
{
  uint64_t v371 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v349 = self;
  id v4 = (id)qword_1EA3C9FC8;
  v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHTitleQuery", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v6 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTitleQuery\"", buf, 2u);
  }

  v361.receiver = self;
  v361.super_class = (Class)CHTitleQuery;
  [(CHQuery *)&v361 q_updateQueryResult];
  v348 = objc_msgSend_q_sessionResult(self, v7, v8, v9, v10, v11);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v12 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_msgSend_debugName(v349, v13, v14, v15, v16, v17);
    v24 = objc_msgSend_strokeProviderVersion(v348, v19, v20, v21, v22, v23);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v18;
    __int16 v363 = 2112;
    v364 = v24;
    _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);
  }
  v30 = objc_msgSend_strokeGroupingResult(v348, v25, v26, v27, v28, v29);
  v36 = objc_msgSend_recognitionSession(v349, v31, v32, v33, v34, v35);
  uint64_t v42 = objc_msgSend_strokeGroupOrdering(v36, v37, v38, v39, v40, v41);
  v339 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v30, v43, v42, 1, v44, v45);

  v350 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v46, v47, v48, v49, v50);
  long long v359 = 0u;
  long long v360 = 0u;
  long long v357 = 0u;
  long long v358 = 0u;
  v56 = objc_msgSend_strokeGroupingResult(v348, v51, v52, v53, v54, v55);
  v62 = objc_msgSend_nontextStrokeGroups(v56, v57, v58, v59, v60, v61);

  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v357, (uint64_t)v370, 16, v64);
  if (v70)
  {
    uint64_t v71 = *(void *)v358;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v358 != v71) {
          objc_enumerationMutation(v62);
        }
        v73 = *(void **)(*((void *)&v357 + 1) + 8 * i);
        uint64_t v74 = objc_msgSend_classification(v73, v65, v66, v67, v68, v69);
        if ((objc_msgSend_isStrokeClassificationTextOrMath_(CHStrokeUtilities, v75, v74, v76, v77, v78) & 1) == 0
          && objc_msgSend_classification(v73, v65, v66, v67, v68, v69) != 6)
        {
          v79 = objc_msgSend_strokeIdentifiers(v73, v65, v66, v67, v68, v69);
          v85 = objc_msgSend_allObjects(v79, v80, v81, v82, v83, v84);
          v91 = objc_msgSend_recognitionSession(v349, v86, v87, v88, v89, v90);
          v97 = objc_msgSend_latestStrokeProvider(v91, v92, v93, v94, v95, v96);
          v101 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v98, (uint64_t)v85, (uint64_t)v97, v99, v100);

          v106 = objc_msgSend_polygonForStrokes_(CHStrokeUtilities, v102, (uint64_t)v101, v103, v104, v105);
          objc_msgSend_addObject_(v350, v107, (uint64_t)v106, v108, v109, v110);
        }
      }
      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v357, (uint64_t)v370, 16, v69);
    }
    while (v70);
  }

  long long v355 = 0u;
  long long v356 = 0u;
  long long v353 = 0u;
  long long v354 = 0u;
  obuint64_t j = v339;
  uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v111, (uint64_t)&v353, (uint64_t)v369, 16, v112);
  if (!v113)
  {
    char v341 = 0;
    v347 = 0;
    v342 = 0;
    goto LABEL_69;
  }
  char v341 = 0;
  v347 = 0;
  v342 = 0;
  uint64_t v345 = *(void *)v354;
  while (2)
  {
    uint64_t v346 = v113;
    for (uint64_t j = 0; j != v346; ++j)
    {
      while (1)
      {
        if (*(void *)v354 != v345) {
          objc_enumerationMutation(obj);
        }
        v120 = *(void **)(*((void *)&v353 + 1) + 8 * j);
        if (objc_msgSend_count(v350, v114, v115, v116, v117, v118))
        {
          v126 = objc_msgSend_strokeIdentifiers(v120, v121, v122, v123, v124, v125);
          v132 = objc_msgSend_allObjects(v126, v127, v128, v129, v130, v131);
          v138 = objc_msgSend_recognitionSession(v349, v133, v134, v135, v136, v137);
          v144 = objc_msgSend_latestStrokeProvider(v138, v139, v140, v141, v142, v143);
          v148 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v145, (uint64_t)v132, (uint64_t)v144, v146, v147);

          v151 = objc_msgSend_strokesIntersectingPolygons_fromStrokes_intersectedPolygons_(CHStrokeUtilities, v149, (uint64_t)v350, (uint64_t)v148, 0, v150);
          uint64_t v157 = objc_msgSend_count(v151, v152, v153, v154, v155, v156);

          uint64_t v163 = objc_msgSend_count(v148, v158, v159, v160, v161, v162);
          uint64_t v167 = objc_msgSend_minRectangleDistanceFromStrokes_toPolygons_(CHStrokeUtilities, v164, (uint64_t)v148, (uint64_t)v350, v165, v166);
          if ((double)v157 / (double)(unint64_t)v163 >= 0.2)
          {
            BOOL v175 = 1;
          }
          else
          {
            uint64_t v173 = v167;
            objc_msgSend_bounds(v120, v168, v169, v170, v171, v172);
            BOOL v175 = v174 * 0.35 > (double)v173;
          }
        }
        else
        {
          BOOL v175 = 0;
        }
        uint64_t v176 = objc_msgSend_uniqueIdentifier(v120, v121, v122, v123, v124, v125);
        v181 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v348, v177, v176, v178, v179, v180);
        v187 = objc_msgSend_mathResult(v181, v182, v183, v184, v185, v186);
        BOOL v188 = v187 == 0;

        if (v188) {
          break;
        }
        v194 = objc_msgSend_recognitionSession(v349, v189, v190, v191, v192, v193);
        id v352 = v347;
        v197 = objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_outStrokes_(v194, v195, (uint64_t)v120, (uint64_t)&v352, 0, v196);
        id v198 = v352;

        v203 = objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v199, (uint64_t)v197, v200, v201, v202);
        if (objc_msgSend_isNonTextCandidateTextTranscription_(CHTokenizedMathResult, v204, (uint64_t)v203, v205, v206, v207) & 1) != 0|| (objc_msgSend_mathResult(v181, v208, v209, v210, v211, v212), v213 = objc_claimAutoreleasedReturnValue(), char hasLowConfidence = objc_msgSend_hasLowConfidence(v213, v214, v215, v216, v217, v218), v213, (hasLowConfidence))
        {
          int v225 = 5;
LABEL_41:

          v347 = v198;
          goto LABEL_50;
        }
        if (v197)
        {
          v251 = objc_msgSend_mathResult(v181, v220, v221, v222, v223, v224);
          objc_msgSend_score(v251, v252, v253, v254, v255, v256);
          BOOL v258 = v257 < 0.5;

          if (v258)
          {
            int v225 = 4;
            char v341 = 1;
          }
          else
          {
            id v259 = v203;

            int v225 = 4;
            v342 = v259;
          }
          goto LABEL_41;
        }

LABEL_63:
        v347 = v198;
        if (v346 == ++j) {
          goto LABEL_66;
        }
      }
      *(void *)buf = 0;
      __int16 v351 = 0;
      v226 = objc_msgSend_recognitionResultsByLocale(v181, v189, v190, v191, v192, v193);
      v232 = objc_msgSend_preferredLocale(v181, v227, v228, v229, v230, v231);
      v237 = objc_msgSend_objectForKeyedSubscript_(v226, v233, (uint64_t)v232, v234, v235, v236);

      v244 = objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_isNonTextCandidateResult_(v181, v238, (uint64_t)v348, 0, (uint64_t)buf, (uint64_t)&v351 + 1, &v351);
      if ((_BYTE)v351) {
        BOOL v245 = v175;
      }
      else {
        BOOL v245 = 0;
      }
      if (v245
        || (objc_msgSend_shouldFilterSingleCharacterResult(v237, v239, v240, v241, v242, v243) & 1) != 0
        || (objc_msgSend_shouldFilterSingleTokenResult(v237, v246, v247, v248, v249, v250) & 1) != 0)
      {
        int v225 = 5;
      }
      else
      {
        if (!v244)
        {
          BOOL v260 = HIBYTE(v351) == 0;

          if (!v260)
          {

            goto LABEL_69;
          }
          id v198 = v347;
          goto LABEL_63;
        }
        if (*(double *)buf <= 0.45)
        {
          id v338 = v244;

          v266 = objc_msgSend_strokeIdentifiers(v120, v261, v262, v263, v264, v265);
          v343 = objc_msgSend_allObjects(v266, v267, v268, v269, v270, v271);
          v277 = objc_msgSend_recognitionSession(v349, v272, v273, v274, v275, v276);
          v283 = objc_msgSend_latestStrokeProvider(v277, v278, v279, v280, v281, v282);
          uint64_t v287 = objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v284, (uint64_t)v343, (uint64_t)v283, v285, v286);

          int v225 = 4;
          v347 = (void *)v287;
          v342 = v338;
        }
        else
        {
          int v225 = 4;
          char v341 = 1;
        }
      }

LABEL_50:
      if (v225 != 5) {
        goto LABEL_69;
      }
    }
LABEL_66:
    uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v114, (uint64_t)&v353, (uint64_t)v369, 16, v118);
    if (v113) {
      continue;
    }
    break;
  }
LABEL_69:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v288 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
  {
    v294 = objc_msgSend_debugName(v349, v289, v290, v291, v292, v293);
    v300 = objc_msgSend_recognitionSession(v349, v295, v296, v297, v298, v299);
    uint64_t v306 = objc_msgSend_length(v342, v301, v302, v303, v304, v305);
    v307 = "";
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v294;
    __int16 v363 = 2048;
    if (v341) {
      v307 = " Low confidence, reporting nil.";
    }
    v364 = v300;
    __int16 v365 = 2048;
    uint64_t v366 = v306;
    __int16 v367 = 2080;
    v368 = v307;
    _os_log_impl(&dword_1C492D000, v288, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. Length: %ld.%s", buf, 0x2Au);
  }
  if (v342 && v347)
  {
    v312 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v308, (uint64_t)v347, v309, v310, v311);
    v313 = v342;
    v314 = v312;
    v320 = v314;
    if (v349 && (v349->_transcribedTitle != v313 || v349->_titleStrokeIdentifiers != v314))
    {
      uint64_t v321 = objc_msgSend_copy(v313, v315, v316, v317, v318, v319);
      transcribedTitle = v349->_transcribedTitle;
      v349->_transcribedTitle = (NSString *)v321;

      uint64_t v328 = objc_msgSend_copy(v320, v323, v324, v325, v326, v327);
      titleStrokeIdentifiers = v349->_titleStrokeIdentifiers;
      v349->_titleStrokeIdentifiers = (NSSet *)v328;

      objc_msgSend_q_queryResultDidChange(v349, v330, v331, v332, v333, v334);
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v335 = (id)qword_1EA3C9FC8;
  v336 = v335;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v335))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v336, OS_SIGNPOST_INTERVAL_END, spid, "CHTitleQuery", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v337 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v337, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v337, OS_LOG_TYPE_DEFAULT, "END \"CHTitleQuery\"", buf, 2u);
  }
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Title Query %p", v2, v3, v4, self);
}

- (NSString)transcribedTitle
{
  return self->_transcribedTitle;
}

- (NSSet)titleStrokeIdentifiers
{
  return self->_titleStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transcribedTitle, 0);
}

@end