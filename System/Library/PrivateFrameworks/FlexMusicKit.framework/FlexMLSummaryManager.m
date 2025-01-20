@interface FlexMLSummaryManager
- (FlexMLSummaryManager)initWithSummaryMapping:(id)a3 bundlePath:(id)a4 metadataPath:(id)a5 targetTimeScale:(int)a6;
- (NSArray)allDurations;
- (NSArray)allFileNames;
- (NSString)metadataPath;
- (NSString)rootPath;
- (double)averageGranularityBetweenSummaries;
- (id)_summaryForDuration:(id *)a3;
- (id)summaryForDuration:(id *)a3;
- (int)targetTimeScale;
@end

@implementation FlexMLSummaryManager

- (FlexMLSummaryManager)initWithSummaryMapping:(id)a3 bundlePath:(id)a4 metadataPath:(id)a5 targetTimeScale:(int)a6
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)FlexMLSummaryManager;
  v13 = [(FlexMLSummaryManager *)&v71 init];
  v18 = v13;
  if (v13)
  {
    id v59 = v12;
    id v60 = a4;
    id v62 = v11;
    v61 = v13;
    v13->_targetTimeScale = a6;
    objc_msgSend_array(MEMORY[0x263EFF980], v14, v15, v16, v17);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x263EFF980], v20, v21, v22, v23);
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v63 = v10;
    id obj = v10;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v67, (uint64_t)v72, 16);
    if (v26)
    {
      uint64_t v30 = v26;
      uint64_t v31 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v68 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v34 = objc_msgSend_objectAtIndex_(v33, v27, 0, v28, v29);
          v38 = objc_msgSend_objectAtIndex_(v33, v35, 1, v36, v37);
          memset(&v66, 0, sizeof(v66));
          objc_msgSend_doubleValue(v34, v39, v40, v41, v42);
          CMTimeMakeWithSeconds(&v66, v43, a6);
          CMTime v65 = v66;
          v47 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v44, (uint64_t)&v65, v45, v46);
          objc_msgSend_addObject_(v19, v48, (uint64_t)v38, v49, v50);
          objc_msgSend_addObject_(v24, v51, (uint64_t)v47, v52, v53);
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v67, (uint64_t)v72, 16);
      }
      while (v30);
    }

    v18 = v61;
    allFileNames = v61->_allFileNames;
    v61->_allFileNames = v19;
    v55 = v19;

    allDurations = v61->_allDurations;
    v61->_allDurations = v24;
    v57 = v24;

    objc_storeStrong((id *)&v61->_rootPath, v60);
    objc_storeStrong((id *)&v61->_metadataPath, a5);

    id v11 = v62;
    id v10 = v63;
    id v12 = v59;
  }

  return v18;
}

- (double)averageGranularityBetweenSummaries
{
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  v13 = (int *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  v6 = objc_msgSend_allDurations(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_217A39F28;
  v11[3] = &unk_2642B7048;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v7, 2, (uint64_t)v11, v8);

  double v9 = v17[3] / (double)v13[6];
  v17[3] = v9;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)summaryForDuration:(id *)a3
{
  v7 = objc_msgSend_allDurations(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v12 = objc_msgSend_lastObject(v7, v8, v9, v10, v11);

  memset(&v76[1], 0, sizeof(CMTime));
  if (v12) {
    objc_msgSend_CMTimeValue(v12, v13, v14, v15, v16);
  }
  uint64_t v17 = objc_msgSend_allDurations(self, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_firstObject(v17, v18, v19, v20, v21);

  memset(v76, 0, 24);
  if (v22) {
    objc_msgSend_CMTimeValue(v22, v23, v24, v25, v26);
  }
  CMTime time1 = (CMTime)*a3;
  CMTime time2 = v76[1];
  if (CMTimeCompare(&time1, &time2) < 1)
  {
    CMTime time1 = (CMTime)*a3;
    long long v69 = objc_msgSend__summaryForDuration_(self, v27, (uint64_t)&time1, v29, v30);
  }
  else
  {
    uint64_t v31 = objc_msgSend_array(MEMORY[0x263EFF980], v27, v28, v29, v30);
    CMTime time1 = (CMTime)*a3;
    CMTime time2 = v76[0];
    double Seconds = CMTimeGetSeconds(&time2);
    CMTime time2 = v76[1];
    Float64 v33 = CMTimeGetSeconds(&time2);
    CMTime time2 = (CMTime)*a3;
    double v34 = Seconds / v33;
    double v35 = CMTimeGetSeconds(&time2);
    CMTime time2 = v76[1];
    Float64 v36 = CMTimeGetSeconds(&time2);
    double v37 = v35 / v36 - (double)(int)llround(v35 / v36);
    objc_msgSend_averageGranularityBetweenSummaries(self, v38, v39, v40, v41);
    double v43 = v42;
    CMTime time2 = v76[1];
    Float64 v44 = CMTimeGetSeconds(&time2);
    BOOL v45 = v37 == 0.0;
    if (v37 <= v43 / v44) {
      BOOL v45 = 1;
    }
    char v46 = v37 >= v34 || v45;
    if ((v46 & 1) == 0)
    {
      CMTime time2 = time1;
      CMTime rhs = v76[0];
      CMTimeSubtract(&time1, &time2, &rhs);
    }
    CMTime time2 = time1;
    CMTime rhs = v76[0];
    if (CMTimeCompare(&time2, &rhs) >= 1)
    {
      do
      {
        CMTime time2 = time1;
        v51 = objc_msgSend__summaryForDuration_(self, v47, (uint64_t)&time2, v49, v50);
        objc_msgSend_addObject_(v31, v52, (uint64_t)v51, v53, v54);
        if (v51) {
          objc_msgSend_duration(v51, v55, v56, v57, v58);
        }
        else {
          memset(&v72, 0, sizeof(v72));
        }
        CMTime rhs = time1;
        CMTimeSubtract(&time2, &rhs, &v72);
        CMTime time1 = time2;

        CMTime time2 = time1;
        CMTime rhs = v76[0];
      }
      while (CMTimeCompare(&time2, &rhs) > 0);
    }
    if ((v46 & 1) == 0)
    {
      memset(&time2, 0, sizeof(time2));
      CMTime rhs = v76[0];
      CMTime v71 = time1;
      CMTimeAdd(&time2, &rhs, &v71);
      CMTime rhs = time2;
      id v62 = objc_msgSend__summaryForDuration_(self, v59, (uint64_t)&rhs, v60, v61);
      objc_msgSend_addObject_(v31, v63, (uint64_t)v62, v64, v65);
    }
    uint64_t v66 = objc_msgSend_targetTimeScale(self, v47, v48, v49, v50);
    long long v69 = objc_msgSend_summaryFromSummaries_targetTimeScale_(FlexMLSummary, v67, (uint64_t)v31, v66, v68);
  }
  return v69;
}

- (id)_summaryForDuration:(id *)a3
{
  uint64_t v325 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_allDurations(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v12 = objc_msgSend_count(v7, v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v17 = -1;
    while (1)
    {
      uint64_t v18 = objc_msgSend_allDurations(self, v13, v14, v15, v16);
      uint64_t v22 = objc_msgSend_objectAtIndex_(v18, v19, v17 + 1, v20, v21);

      memset(&v301, 0, 24);
      if (v22) {
        objc_msgSend_CMTimeValue(v22, v23, v24, v25, v26);
      }
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v301.start.value;
      time1.start.CMTimeEpoch epoch = v301.start.epoch;
      CMTime time2 = (CMTime)*a3;
      if (!CMTimeCompare(&time1.start, &time2))
      {

        uint64_t v34 = v17 + 1;
        goto LABEL_12;
      }
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v301.start.value;
      time1.start.CMTimeEpoch epoch = v301.start.epoch;
      CMTime time2 = (CMTime)*a3;
      int32_t v27 = CMTimeCompare(&time1.start, &time2);

      if ((v27 & 0x80000000) == 0) {
        break;
      }
      uint64_t v28 = objc_msgSend_allDurations(self, v13, v14, v15, v16);
      unint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

      uint64_t v34 = v17 + 1;
      unint64_t v35 = v17 + 2;
      ++v17;
      if (v35 >= v33) {
        goto LABEL_12;
      }
    }
    uint64_t v34 = v17;
  }
  else
  {
    uint64_t v34 = -1;
  }
LABEL_12:
  uint64_t v36 = v34 & ~(v34 >> 63);
  double v37 = objc_msgSend_rootPath(self, v13, v14, v15, v16);
  uint64_t v41 = objc_msgSend_stringByAppendingPathComponent_(v37, v38, @"Summaries", v39, v40);

  char v46 = objc_msgSend_allFileNames(self, v42, v43, v44, v45);
  uint64_t v50 = objc_msgSend_objectAtIndex_(v46, v47, v36, v48, v49);

  v276 = objc_msgSend_stringByAppendingPathComponent_(v41, v51, (uint64_t)v50, v52, v53);
  uint64_t v57 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x263EFF9A0], v54, (uint64_t)v276, v55, v56);
  uint64_t v58 = [FlexMLSummary alloc];
  uint64_t v63 = objc_msgSend_targetTimeScale(self, v59, v60, v61, v62);
  uint64_t v275 = v57;
  v277 = objc_msgSend_initWithDictionary_targetTimeScale_(v58, v64, v57, v63, v65);
  uint64_t v66 = (void *)MEMORY[0x263EFF9A0];
  CMTime v71 = objc_msgSend_metadataPath(self, v67, v68, v69, v70);
  v75 = objc_msgSend_dictionaryWithContentsOfFile_(v66, v72, (uint64_t)v71, v73, v74);

  v83 = objc_msgSend_objectForKeyedSubscript_(v75, v76, @"songBeats", v77, v78);
  if (v83)
  {
    v272 = v75;
    v273 = v50;
    v274 = v41;
    v285 = (CMTime *)a3;
    v290 = self;
    v283 = objc_msgSend_array(MEMORY[0x263EFF980], v79, v80, v81, v82);
    v287 = objc_msgSend_array(MEMORY[0x263EFF980], v84, v85, v86, v87);
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    long long v318 = 0u;
    v271 = v83;
    id obj = v83;
    uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v315, (uint64_t)v324, 16);
    if (v89)
    {
      uint64_t v93 = v89;
      uint64_t v94 = *(void *)v316;
      do
      {
        for (uint64_t i = 0; i != v93; ++i)
        {
          if (*(void *)v316 != v94) {
            objc_enumerationMutation(obj);
          }
          v96 = *(void **)(*((void *)&v315 + 1) + 8 * i);
          v97 = objc_msgSend_objectForKeyedSubscript_(v96, v90, @"time", v91, v92, v271);
          memset(&v301, 0, 24);
          objc_msgSend_doubleValue(v97, v98, v99, v100, v101);
          Float64 v103 = v102;
          int32_t v108 = objc_msgSend_targetTimeScale(v290, v104, v105, v106, v107);
          CMTimeMakeWithSeconds(&v301.start, v103, v108);
          *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&v301.start.value;
          time1.start.CMTimeEpoch epoch = v301.start.epoch;
          double Seconds = CMTimeGetSeconds(&time1.start);
          v114 = objc_msgSend_numberWithDouble_(NSNumber, v110, v111, v112, v113);
          objc_msgSend_addObject_(v283, v115, (uint64_t)v114, v116, v117);

          uint64_t v121 = objc_msgSend_objectForKey_(v96, v118, @"bar", v119, v120);
          if (v121)
          {
            v125 = (void *)v121;
            v126 = objc_msgSend_objectForKeyedSubscript_(v96, v122, @"bar", v123, v124);
            int v131 = objc_msgSend_BOOLValue(v126, v127, v128, v129, v130);

            if (v131)
            {
              v136 = objc_msgSend_numberWithDouble_(NSNumber, v132, v133, v134, v135, Seconds);
              objc_msgSend_addObject_(v287, v137, (uint64_t)v136, v138, v139);
            }
          }
        }
        uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v90, (uint64_t)&v315, (uint64_t)v324, 16);
      }
      while (v93);
    }

    objc_msgSend_sortUsingSelector_(v283, v140, (uint64_t)sel_compare_, v141, v142);
    objc_msgSend_sortUsingSelector_(v287, v143, (uint64_t)sel_compare_, v144, v145);
    v286 = objc_msgSend_orderedSet(MEMORY[0x263EFF9B0], v146, v147, v148, v149);
    v284 = objc_msgSend_orderedSet(MEMORY[0x263EFF9B0], v150, v151, v152, v153);
    uint64_t v154 = MEMORY[0x263F01090];
    CMTimeValue value = *MEMORY[0x263F01090];
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x263F01090] + 8);
    memset(&time2, 0, sizeof(time2));
    int32_t v159 = objc_msgSend_targetTimeScale(v290, v155, v156, v157, v158);
    CMTimeMake(&time2, 1, v159);
    v164 = objc_msgSend_segments(v277, v160, v161, v162, v163);
    long long v311 = 0u;
    long long v312 = 0u;
    long long v313 = 0u;
    long long v314 = 0u;
    objc_msgSend_segments(v277, v165, v166, v167, v168);
    id v278 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v169, (uint64_t)&v311, (uint64_t)v321, 16);
    if (v281)
    {
      CMTimeFlags flags = *(_DWORD *)(v154 + 12);
      CMTimeEpoch epoch = *(void *)(v154 + 16);
      uint64_t v279 = *(void *)v312;
      v280 = v164;
      do
      {
        uint64_t v176 = 0;
        do
        {
          if (*(void *)v312 != v279) {
            objc_enumerationMutation(v278);
          }
          v177 = *(void **)(*((void *)&v311 + 1) + 8 * v176);
          v178 = objc_msgSend_lastObject(v164, v170, v171, v172, v173, v271);

          uint64_t v282 = v176;
          if (v177 == v178)
          {
            v186 = 0;
          }
          else
          {
            uint64_t v182 = objc_msgSend_indexOfObject_(v164, v179, (uint64_t)v177, v180, v181);
            v186 = objc_msgSend_objectAtIndexedSubscript_(v164, v183, v182 + 1, v184, v185);
          }
          long long v309 = 0u;
          long long v310 = 0u;
          long long v307 = 0u;
          long long v308 = 0u;
          id obja = v283;
          uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v187, (uint64_t)&v307, (uint64_t)v320, 16);
          if (v188)
          {
            uint64_t v193 = v188;
            uint64_t v194 = *(void *)v308;
            do
            {
              for (uint64_t j = 0; j != v193; ++j)
              {
                if (*(void *)v308 != v194) {
                  objc_enumerationMutation(obja);
                }
                v196 = *(void **)(*((void *)&v307 + 1) + 8 * j);
                long long v305 = 0uLL;
                CMTimeEpoch v306 = 0;
                if (v177)
                {
                  objc_msgSend_trackTime(v177, v189, v190, v191, v192);
                  memset(&start, 0, sizeof(start));
                  objc_msgSend_duration(v177, v197, v198, v199, v200);
                  if (v186)
                  {
                    objc_msgSend_summaryTime(v186, v201, v202, v203, v204);
                    objc_msgSend_summaryTime(v177, v205, v206, v207, v208);
LABEL_41:
                    CMTimeSubtract(&v301.start, &lhs, &rhs);
                    int v209 = 0;
                    CMTime start = v301.start;
                    goto LABEL_43;
                  }
                }
                else
                {
                  memset(&start, 0, sizeof(start));
                  if (v186)
                  {
                    objc_msgSend_summaryTime(v186, v189, v190, v191, v192);
                    memset(&rhs, 0, sizeof(rhs));
                    goto LABEL_41;
                  }
                }
                int v209 = 1;
LABEL_43:
                memset(&v301, 0, sizeof(v301));
                *(_OWORD *)&time1.start.CMTimeValue value = v305;
                time1.start.CMTimeEpoch epoch = v306;
                CMTime duration = start;
                CMTimeRangeMake(&v301, &time1.start, &duration);
                memset(&duration, 0, sizeof(duration));
                objc_msgSend_doubleValue(v196, v210, v211, v212, v213);
                Float64 v215 = v214;
                int32_t v220 = objc_msgSend_targetTimeScale(v290, v216, v217, v218, v219);
                CMTimeMakeWithSeconds(&duration, v215, v220);
                CMTimeRange time1 = v301;
                CMTime time = duration;
                if (!CMTimeRangeContainsTime(&time1, &time))
                {
                  memset(&time, 0, sizeof(time));
                  time1.CMTime start = duration;
                  CMTime v297 = time2;
                  CMTimeAdd(&time, &time1.start, &v297);
                  CMTimeRange time1 = v301;
                  CMTime v297 = time;
                  if (!CMTimeRangeContainsTime(&time1, &v297)) {
                    continue;
                  }
                  CMTime duration = time;
                }
                memset(&time1, 0, 24);
                if (v177)
                {
                  objc_msgSend_trackTime(v177, v189, v190, v191, v192);
                  objc_msgSend_summaryTime(v177, v221, v222, v223, v224);
                }
                else
                {
                  memset(&v296, 0, sizeof(v296));
                  memset(&v295, 0, sizeof(v295));
                }
                CMTimeSubtract(&time1.start, &v296, &v295);
                memset(&time, 0, sizeof(time));
                CMTime v297 = duration;
                CMTime v294 = time1.start;
                CMTimeSubtract(&time, &v297, &v294);
                if ((flags & 1) == 0) {
                  goto LABEL_69;
                }
                v297.CMTimeValue value = value;
                v297.CMTimeScale timescale = timescale;
                v297.CMTimeFlags flags = flags;
                v297.CMTimeEpoch epoch = epoch;
                CMTime v294 = time2;
                CMTimeSubtract(&v293, &v297, &v294);
                CMTime v297 = time;
                if (CMTimeCompare(&v297, &v293))
                {
                  v297.CMTimeValue value = value;
                  v297.CMTimeScale timescale = timescale;
                  v297.CMTimeFlags flags = flags;
                  v297.CMTimeEpoch epoch = epoch;
                  CMTime v294 = time2;
                  CMTimeAdd(&v292, &v297, &v294);
                  CMTime v297 = time;
                  if (CMTimeCompare(&v297, &v292))
                  {
LABEL_69:
                    if (!v209
                      || (CMTime v297 = *v285,
                          CMTime v294 = time2,
                          CMTimeSubtract(&v291, &v297, &v294),
                          CMTime v297 = time,
                          CMTimeCompare(&v297, &v291))
                      && (v297 = time, CMTime v294 = *v285, CMTimeCompare(&v297, &v294)))
                    {
                      CMTime v297 = time;
                      double v225 = CMTimeGetSeconds(&v297);
                      v230 = objc_msgSend_numberWithDouble_(NSNumber, v226, v227, v228, v229);
                      objc_msgSend_addObject_(v286, v231, (uint64_t)v230, v232, v233);

                      if (objc_msgSend_containsObject_(v287, v234, (uint64_t)v196, v235, v236))
                      {
                        v237 = objc_msgSend_numberWithDouble_(NSNumber, v189, v190, v191, v192, v225);
                        objc_msgSend_addObject_(v284, v238, (uint64_t)v237, v239, v240);
                      }
                      CMTimeValue value = time.value;
                      CMTimeFlags flags = time.flags;
                      CMTimeScale timescale = time.timescale;
                      CMTimeEpoch epoch = time.epoch;
                    }
                  }
                }
              }
              uint64_t v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v189, (uint64_t)&v307, (uint64_t)v320, 16);
            }
            while (v193);
          }

          uint64_t v176 = v282 + 1;
          v164 = v280;
        }
        while (v282 + 1 != v281);
        uint64_t v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v170, (uint64_t)&v311, (uint64_t)v321, 16);
      }
      while (v281);
    }

    v245 = objc_msgSend_array(v286, v241, v242, v243, v244);
    v250 = objc_msgSend_array(v284, v246, v247, v248, v249);
    v251 = (void *)v275;
    v255 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v252, v275, v253, v254);
    objc_msgSend_setObject_forKey_(v255, v256, (uint64_t)v245, @"beatTimes", v257);
    objc_msgSend_setObject_forKey_(v255, v258, (uint64_t)v250, @"barTimes", v259);
    v260 = [FlexMLSummary alloc];
    uint64_t v265 = objc_msgSend_targetTimeScale(v290, v261, v262, v263, v264);
    uint64_t v268 = objc_msgSend_initWithDictionary_targetTimeScale_(v260, v266, (uint64_t)v255, v265, v267);

    v269 = (void *)v268;
    uint64_t v50 = v273;
    uint64_t v41 = v274;
    v83 = v271;
    v75 = v272;
  }
  else
  {
    v251 = (void *)v275;
    v269 = v277;
  }

  return v269;
}

- (NSArray)allFileNames
{
  return self->_allFileNames;
}

- (NSArray)allDurations
{
  return self->_allDurations;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)metadataPath
{
  return self->_metadataPath;
}

- (int)targetTimeScale
{
  return self->_targetTimeScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_allDurations, 0);
  objc_storeStrong((id *)&self->_allFileNames, 0);
}

@end