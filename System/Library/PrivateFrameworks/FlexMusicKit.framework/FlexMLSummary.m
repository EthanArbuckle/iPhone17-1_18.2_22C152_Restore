@interface FlexMLSummary
+ (id)summaryFromSummaries:(id)a3 targetTimeScale:(int)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (FlexMLSummary)initWithDictionary:(id)a3 targetTimeScale:(int)a4;
- (NSArray)allBars;
- (NSArray)allBeats;
- (NSArray)loopPoints;
- (NSArray)segments;
- (NSDictionary)videoCues;
- (double)lkfsValue;
- (float)peakValue;
- (void)setDuration:(id *)a3;
- (void)setLkfsValue:(double)a3;
- (void)setPeakValue:(float)a3;
- (void)setSegments:(id)a3;
- (void)setVideoCues:(id)a3;
@end

@implementation FlexMLSummary

+ (id)summaryFromSummaries:(id)a3 targetTimeScale:(int)a4
{
  uint64_t v352 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6, v7, v8);
  CMTime v340 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  v306 = objc_msgSend_array(MEMORY[0x263EFF980], v10, v11, v12, v13);
  v18 = objc_msgSend_array(MEMORY[0x263EFF980], v14, v15, v16, v17);
  v23 = objc_msgSend_array(MEMORY[0x263EFF980], v19, v20, v21, v22);
  v28 = objc_msgSend_array(MEMORY[0x263EFF980], v24, v25, v26, v27);
  v302 = objc_msgSend_array(MEMORY[0x263EFF980], v29, v30, v31, v32);
  long long v336 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  id v33 = v4;
  uint64_t v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v336, (uint64_t)v351, 16);
  if (v298)
  {
    uint64_t v292 = *(void *)v337;
    v301 = &unk_26C807018;
    v296 = v18;
    v297 = v9;
    v294 = v28;
    v295 = v23;
    v293 = v33;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v337 != v292) {
          objc_enumerationMutation(v33);
        }
        uint64_t v300 = v39;
        v40 = *(void **)(*((void *)&v336 + 1) + 8 * v39);
        v41 = objc_msgSend_lastObject(v33, v35, v36, v37, v38);

        v46 = v40;
        v303 = v40;
        if (v40 != v41)
        {
          v47 = objc_msgSend_objectForKey_(v9, v42, @"loopTimes", v44, v45);

          if (v47)
          {
            v56 = objc_msgSend_objectForKey_(v9, v48, @"loopTimes", v50, v51);
            memset(&v335, 0, sizeof(v335));
            if (v303) {
              objc_msgSend_duration(v303, v52, v53, v54, v55);
            }
            else {
              memset(&rhs, 0, sizeof(rhs));
            }
            CMTime lhs = v340;
            CMTimeAdd(&v335, &lhs, &rhs);
            v61 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v58, (uint64_t)v56, v59, v60);
            v62 = NSNumber;
            CMTime lhs = v335;
            Float64 Seconds = CMTimeGetSeconds(&lhs);
            v68 = objc_msgSend_numberWithDouble_(v62, v64, v65, v66, v67, Seconds);
            objc_msgSend_addObject_(v61, v69, (uint64_t)v68, v70, v71);

            objc_msgSend_setObject_forKey_(v9, v72, (uint64_t)v61, @"loopTimes", v73);
          }
          else
          {
            v57 = NSNumber;
            if (v40) {
              objc_msgSend_duration(v40, v48, v49, v50, v51);
            }
            else {
              memset(&time, 0, sizeof(time));
            }
            Float64 v74 = CMTimeGetSeconds(&time);
            v56 = objc_msgSend_numberWithDouble_(v57, v75, v76, v77, v78, v74);
            v350 = v56;
            v61 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v79, (uint64_t)&v350, 1, v80);
            objc_msgSend_setObject_forKey_(v9, v81, (uint64_t)v61, @"loopTimes", v82);
          }

          v46 = v303;
        }
        long long v330 = 0u;
        long long v331 = 0u;
        long long v328 = 0u;
        long long v329 = 0u;
        objc_msgSend_segments(v46, v42, v43, v44, v45);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v307 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v83, (uint64_t)&v328, (uint64_t)v349, 16);
        if (v307)
        {
          uint64_t v305 = *(void *)v329;
          do
          {
            uint64_t v88 = 0;
            do
            {
              if (*(void *)v329 != v305) {
                objc_enumerationMutation(obj);
              }
              uint64_t v309 = v88;
              v89 = *(void **)(*((void *)&v328 + 1) + 8 * v88);
              v90 = objc_msgSend_array(MEMORY[0x263EFF980], v84, v85, v86, v87);
              long long v324 = 0u;
              long long v325 = 0u;
              long long v326 = 0u;
              long long v327 = 0u;
              v308 = v89;
              v95 = objc_msgSend_gainFunction(v89, v91, v92, v93, v94);
              uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v324, (uint64_t)v348, 16);
              if (v97)
              {
                uint64_t v102 = v97;
                uint64_t v103 = *(void *)v325;
                do
                {
                  for (uint64_t i = 0; i != v102; ++i)
                  {
                    if (*(void *)v325 != v103) {
                      objc_enumerationMutation(v95);
                    }
                    v105 = *(void **)(*((void *)&v324 + 1) + 8 * i);
                    v346[0] = @"gain";
                    v106 = NSNumber;
                    objc_msgSend_gain(v105, v98, v99, v100, v101);
                    v115 = objc_msgSend_numberWithFloat_(v106, v107, v108, v109, v110);
                    v347[0] = v115;
                    v346[1] = @"segmentTime";
                    v116 = NSNumber;
                    if (v105) {
                      objc_msgSend_segmentTime(v105, v111, v112, v113, v114);
                    }
                    else {
                      memset(&v323, 0, sizeof(v323));
                    }
                    Float64 v117 = CMTimeGetSeconds(&v323);
                    v122 = objc_msgSend_numberWithDouble_(v116, v118, v119, v120, v121, v117);
                    v347[1] = v122;
                    v124 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v123, (uint64_t)v347, (uint64_t)v346, 2);
                    objc_msgSend_addObject_(v90, v125, (uint64_t)v124, v126, v127);
                  }
                  uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v324, (uint64_t)v348, 16);
                }
                while (v102);
              }

              v344[0] = @"duration";
              v132 = NSNumber;
              if (v308) {
                objc_msgSend_duration(v308, v128, v129, v130, v131);
              }
              else {
                memset(&v322, 0, sizeof(v322));
              }
              Float64 v133 = CMTimeGetSeconds(&v322);
              v142 = objc_msgSend_numberWithDouble_(v132, v134, v135, v136, v137, v133);
              v345[0] = v142;
              v344[1] = @"trackTime";
              v143 = NSNumber;
              if (v308) {
                objc_msgSend_trackTime(v308, v138, v139, v140, v141);
              }
              else {
                memset(&v321, 0, sizeof(v321));
              }
              Float64 v144 = CMTimeGetSeconds(&v321);
              v153 = objc_msgSend_numberWithDouble_(v143, v145, v146, v147, v148, v144);
              v345[1] = v153;
              v344[2] = @"summaryTime";
              v154 = NSNumber;
              if (v308) {
                objc_msgSend_summaryTime(v308, v149, v150, v151, v152);
              }
              else {
                memset(&v319, 0, sizeof(v319));
              }
              CMTime v335 = v340;
              CMTimeAdd(&v320, &v319, &v335);
              Float64 v155 = CMTimeGetSeconds(&v320);
              v160 = objc_msgSend_numberWithDouble_(v154, v156, v157, v158, v159, v155);
              v344[3] = @"gainFunction";
              v345[2] = v160;
              v345[3] = v90;
              v162 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v161, (uint64_t)v345, (uint64_t)v344, 4);
              objc_msgSend_addObject_(v306, v163, (uint64_t)v162, v164, v165);

              uint64_t v88 = v309 + 1;
            }
            while (v309 + 1 != v307);
            uint64_t v307 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v328, (uint64_t)v349, 16);
          }
          while (v307);
        }

        v9 = v297;
        objc_msgSend_setObject_forKey_(v297, v166, (uint64_t)v306, @"segments", v167);
        v316[0] = MEMORY[0x263EF8330];
        v316[1] = 3221225472;
        v316[2] = sub_217A3FBB4;
        v316[3] = &unk_2642B7210;
        int v317 = a4;
        CMTime v318 = v340;
        v168 = (void (**)(void, void, void))MEMORY[0x21D453A80](v316);
        v173 = objc_msgSend_allBeats(v303, v169, v170, v171, v172);
        v18 = v296;
        ((void (**)(void, void *, void *))v168)[2](v168, v296, v173);

        v178 = objc_msgSend_allBars(v303, v174, v175, v176, v177);
        v23 = v295;
        ((void (**)(void, void *, void *))v168)[2](v168, v295, v178);

        v183 = objc_msgSend_videoCues(v303, v179, v180, v181, v182);
        v187 = objc_msgSend_objectForKeyedSubscript_(v183, v184, @"goodCues", v185, v186);
        v28 = v294;
        ((void (**)(void, void *, void *))v168)[2](v168, v294, v187);

        v192 = objc_msgSend_videoCues(v303, v188, v189, v190, v191);
        v196 = objc_msgSend_objectForKeyedSubscript_(v192, v193, @"greatCues", v194, v195);
        ((void (**)(void, void *, void *))v168)[2](v168, v302, v196);

        id v33 = v293;
        v201 = objc_msgSend_lastObject(v293, v197, v198, v199, v200);

        if (v303 == v201)
        {
          v207 = objc_msgSend_videoCues(v303, v202, v203, v204, v205);
          v211 = objc_msgSend_objectForKeyedSubscript_(v207, v208, @"fadeToBlack", v209, v210);

          memset(&v335, 0, sizeof(v335));
          if (v211)
          {
            objc_msgSend_doubleValue(v211, v212, v213, v214, v215);
            CMTimeMakeWithSeconds(&v315, v216, a4);
          }
          else
          {
            CMTime v315 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
          }
          CMTime lhs = v340;
          CMTimeAdd(&v335, &v315, &lhs);
          v217 = NSNumber;
          CMTime lhs = v335;
          Float64 v218 = CMTimeGetSeconds(&lhs);
          uint64_t v206 = objc_msgSend_numberWithDouble_(v217, v219, v220, v221, v222, v218);
        }
        else
        {
          uint64_t v206 = (uint64_t)v301;
        }
        objc_msgSend_sortUsingSelector_(v296, v202, (uint64_t)sel_compare_, v204, v205);
        objc_msgSend_sortUsingSelector_(v295, v223, (uint64_t)sel_compare_, v224, v225);
        v342[0] = @"goodCues";
        v342[1] = @"greatCues";
        v343[0] = v294;
        v343[1] = v302;
        v342[2] = @"fadeToBlack";
        v301 = (void *)v206;
        v343[2] = v206;
        v227 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v226, (uint64_t)v343, (uint64_t)v342, 3);
        objc_msgSend_setObject_forKey_(v297, v228, (uint64_t)v227, @"videoScores", v229);

        objc_msgSend_setObject_forKey_(v297, v230, (uint64_t)v296, @"beatTimes", v231);
        objc_msgSend_setObject_forKey_(v297, v232, (uint64_t)v295, @"barTimes", v233);
        if (v303) {
          objc_msgSend_duration(v303, v234, v235, v236, v237);
        }
        else {
          memset(&v314, 0, sizeof(v314));
        }
        CMTime v335 = v340;
        CMTimeAdd(&v340, &v335, &v314);
        v238 = NSNumber;
        CMTime v335 = v340;
        Float64 v239 = CMTimeGetSeconds(&v335);
        v244 = objc_msgSend_numberWithDouble_(v238, v240, v241, v242, v243, v239);
        objc_msgSend_setObject_forKey_(v297, v245, (uint64_t)v244, @"duration", v246);

        uint64_t v39 = v300 + 1;
      }
      while (v300 + 1 != v298);
      uint64_t v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(v293, v35, (uint64_t)&v336, (uint64_t)v351, 16);
    }
    while (v298);
  }
  else
  {
    v301 = &unk_26C807018;
  }

  long long v312 = 0u;
  long long v313 = 0u;
  long long v310 = 0u;
  long long v311 = 0u;
  id v247 = v33;
  uint64_t v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v248, (uint64_t)&v310, (uint64_t)v341, 16);
  if (v249)
  {
    uint64_t v254 = v249;
    uint64_t v255 = *(void *)v311;
    double v256 = 0.0;
    float v257 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v254; ++j)
      {
        if (*(void *)v311 != v255) {
          objc_enumerationMutation(v247);
        }
        v259 = *(void **)(*((void *)&v310 + 1) + 8 * j);
        objc_msgSend_peakValue(v259, v250, v251, v252, v253);
        if (v264 > v257) {
          float v257 = v264;
        }
        objc_msgSend_lkfsValue(v259, v260, v261, v262, v263);
        double v270 = v269;
        memset(&v335, 0, sizeof(v335));
        if (v259) {
          objc_msgSend_duration(v259, v265, v266, v267, v268);
        }
        CMTime lhs = v335;
        double v271 = CMTimeGetSeconds(&lhs);
        CMTime lhs = v340;
        double v256 = v256 + v270 * (v271 / CMTimeGetSeconds(&lhs));
      }
      uint64_t v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v250, (uint64_t)&v310, (uint64_t)v341, 16);
    }
    while (v254);
  }
  else
  {
    double v256 = 0.0;
    float v257 = 0.0;
  }

  v276 = objc_msgSend_numberWithDouble_(NSNumber, v272, v273, v274, v275, v256);
  objc_msgSend_setObject_forKey_(v9, v277, (uint64_t)v276, @"lkfs", v278);

  *(float *)&double v279 = v257;
  v284 = objc_msgSend_numberWithFloat_(NSNumber, v280, v281, v282, v283, v279);
  objc_msgSend_setObject_forKey_(v9, v285, (uint64_t)v284, @"peak", v286);

  v287 = [FlexMLSummary alloc];
  v290 = objc_msgSend_initWithDictionary_targetTimeScale_(v287, v288, (uint64_t)v9, a4, v289);

  return v290;
}

- (FlexMLSummary)initWithDictionary:(id)a3 targetTimeScale:(int)a4
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v187.receiver = self;
  v187.super_class = (Class)FlexMLSummary;
  uint64_t v6 = [(FlexMLSummary *)&v187 init];
  v10 = v6;
  if (v6)
  {
    p_duration = &v6->_duration;
    uint64_t v12 = objc_msgSend_objectForKey_(v5, v7, @"duration", v8, v9);
    uint64_t v17 = v12;
    if (v12)
    {
      objc_msgSend_doubleValue(v12, v13, v14, v15, v16);
      CMTimeMakeWithSeconds(&v186, v18, a4);
    }
    else
    {
      CMTime v186 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
    }
    *(_OWORD *)&p_duration->value = *(_OWORD *)&v186.value;
    v10->_duration.epoch = v186.epoch;

    uint64_t v26 = objc_msgSend_objectForKey_(v5, v19, @"segments", v20, v21);
    if (v26)
    {
      uint64_t v165 = v10;
      id v166 = v5;
      objc_msgSend_array(MEMORY[0x263EFF980], v22, v23, v24, v25);
      v169 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      uint64_t v164 = v26;
      obuint64_t j = v26;
      uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v182, (uint64_t)v189, 16);
      if (v170)
      {
        uint64_t v168 = *(void *)v183;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v183 != v168) {
              objc_enumerationMutation(obj);
            }
            uint64_t v32 = *(void **)(*((void *)&v182 + 1) + 8 * v31);
            memset(&v186, 0, sizeof(v186));
            id v33 = objc_msgSend_objectForKey_(v32, v28, @"duration", v29, v30);
            uint64_t v38 = v33;
            if (v33)
            {
              objc_msgSend_doubleValue(v33, v34, v35, v36, v37);
              CMTimeMakeWithSeconds(&v186, v39, a4);
            }
            else
            {
              CMTime v186 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
            }

            memset(&v181, 0, sizeof(v181));
            uint64_t v43 = objc_msgSend_objectForKey_(v32, v40, @"trackTime", v41, v42);
            v48 = v43;
            if (v43)
            {
              objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
              CMTimeMakeWithSeconds(&v181, v49, a4);
            }
            else
            {
              CMTime v181 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
            }

            memset(&v180, 0, sizeof(v180));
            uint64_t v53 = objc_msgSend_objectForKey_(v32, v50, @"summaryTime", v51, v52);
            v58 = v53;
            uint64_t v171 = v31;
            if (v53)
            {
              objc_msgSend_doubleValue(v53, v54, v55, v56, v57);
              CMTimeMakeWithSeconds(&v180, v59, a4);
            }
            else
            {
              CMTime v180 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
            }

            v63 = objc_msgSend_objectForKey_(v32, v60, @"gainFunction", v61, v62);
            v64 = (void *)MEMORY[0x263EFF980];
            uint64_t v69 = objc_msgSend_count(v63, v65, v66, v67, v68);
            uint64_t v73 = objc_msgSend_arrayWithCapacity_(v64, v70, v69, v71, v72);
            long long v176 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            id v74 = v63;
            uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v176, (uint64_t)v188, 16);
            if (v76)
            {
              uint64_t v80 = v76;
              uint64_t v81 = *(void *)v177;
              do
              {
                for (uint64_t i = 0; i != v80; ++i)
                {
                  if (*(void *)v177 != v81) {
                    objc_enumerationMutation(v74);
                  }
                  v83 = *(void **)(*((void *)&v176 + 1) + 8 * i);
                  uint64_t v84 = objc_msgSend_objectForKey_(v83, v77, @"gain", v78, v79);
                  if (v84)
                  {
                    uint64_t v85 = (void *)v84;
                    uint64_t v86 = objc_msgSend_objectForKey_(v83, v77, @"segmentTime", v78, v79);

                    if (v86)
                    {
                      uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v83, v77, @"gain", v78, v79);
                      objc_msgSend_floatValue(v87, v88, v89, v90, v91);
                      unsigned int v93 = v92;

                      memset(&v175, 0, sizeof(v175));
                      uint64_t v97 = objc_msgSend_objectForKeyedSubscript_(v83, v94, @"segmentTime", v95, v96);
                      uint64_t v102 = v97;
                      if (v97)
                      {
                        objc_msgSend_doubleValue(v97, v98, v99, v100, v101);
                        CMTimeMakeWithSeconds(&v175, v103, a4);
                      }
                      else
                      {
                        CMTime v175 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
                      }

                      v104 = [FlexMLGainValue alloc];
                      CMTime v174 = v175;
                      uint64_t v108 = objc_msgSend_initWithGain_segmentTime_(v104, v105, (uint64_t)&v174, v106, v107, COERCE_DOUBLE(__PAIR64__(HIDWORD(v175.value), v93)));
                      objc_msgSend_addObject_(v73, v109, (uint64_t)v108, v110, v111);
                    }
                  }
                }
                uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v176, (uint64_t)v188, 16);
              }
              while (v80);
            }

            uint64_t v112 = [FlexMLSegment alloc];
            CMTime v175 = v186;
            CMTime v174 = v181;
            CMTime v173 = v180;
            uint64_t v114 = objc_msgSend_initWithDuration_trackTime_summaryTime_gainFunction_(v112, v113, (uint64_t)&v175, (uint64_t)&v174, (uint64_t)&v173, v73);
            objc_msgSend_addObject_(v169, v115, (uint64_t)v114, v116, v117);

            uint64_t v31 = v171 + 1;
          }
          while (v171 + 1 != v170);
          uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v182, (uint64_t)v189, 16);
        }
        while (v170);
      }

      v10 = v165;
      segments = v165->_segments;
      v165->_segments = v169;

      id v5 = v166;
      uint64_t v26 = v164;
    }
    uint64_t v119 = objc_msgSend_objectForKey_(v5, v22, @"videoScores", v24, v25);
    objc_storeStrong((id *)&v10->_videoCues, v119);
    v123 = objc_msgSend_objectForKey_(v5, v120, @"lkfs", v121, v122);
    objc_msgSend_doubleValue(v123, v124, v125, v126, v127);
    v10->_lkfsValue = v128;

    v132 = objc_msgSend_objectForKey_(v5, v129, @"peak", v130, v131);
    objc_msgSend_floatValue(v132, v133, v134, v135, v136);
    v10->_peakValue = v137;

    uint64_t v141 = objc_msgSend_objectForKey_(v5, v138, @"beatTimes", v139, v140);

    if (v141)
    {
      objc_msgSend_objectForKey_(v5, v142, @"beatTimes", v143, v144);
    }
    else
    {
      v145 = objc_msgSend_objectForKey_(v119, v142, @"beatTimes", v143, v144);

      if (!v145) {
        goto LABEL_41;
      }
      objc_msgSend_objectForKey_(v119, v146, @"beatTimes", v147, v148);
    uint64_t v149 = };
    allBeats = v10->_allBeats;
    v10->_allBeats = (NSArray *)v149;

LABEL_41:
    uint64_t v151 = objc_msgSend_objectForKey_(v5, v146, @"barTimes", v147, v148);

    if (v151)
    {
      objc_msgSend_objectForKey_(v5, v152, @"barTimes", v153, v154);
    }
    else
    {
      Float64 v155 = objc_msgSend_objectForKey_(v119, v152, @"barTimes", v153, v154);

      if (!v155)
      {
LABEL_46:
        uint64_t v161 = objc_msgSend_objectForKey_(v5, v156, @"loopTimes", v157, v158);
        loopPoints = v10->_loopPoints;
        v10->_loopPoints = (NSArray *)v161;

        goto LABEL_47;
      }
      objc_msgSend_objectForKey_(v119, v156, @"barTimes", v157, v158);
    uint64_t v159 = };
    allBars = v10->_allBars;
    v10->_allBars = (NSArray *)v159;

    goto LABEL_46;
  }
LABEL_47:

  return v10;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (NSDictionary)videoCues
{
  return self->_videoCues;
}

- (void)setVideoCues:(id)a3
{
}

- (NSArray)allBeats
{
  return self->_allBeats;
}

- (NSArray)allBars
{
  return self->_allBars;
}

- (NSArray)loopPoints
{
  return self->_loopPoints;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (double)lkfsValue
{
  return self->_lkfsValue;
}

- (void)setLkfsValue:(double)a3
{
  self->_lkfsValue = a3;
}

- (float)peakValue
{
  return self->_peakValue;
}

- (void)setPeakValue:(float)a3
{
  self->_peakValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopPoints, 0);
  objc_storeStrong((id *)&self->_allBars, 0);
  objc_storeStrong((id *)&self->_allBeats, 0);
  objc_storeStrong((id *)&self->_videoCues, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end