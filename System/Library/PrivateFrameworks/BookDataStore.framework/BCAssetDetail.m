@interface BCAssetDetail
+ (id)propertyIDKey;
- (BOOL)isAudiobook;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (BOOL)setDifferentBookmarkTime:(double)a3;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromAssetDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCAssetDetail

- (id)mutableCopy
{
  v3 = [BCMutableAssetDetail alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromAssetDetail_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361FC8D0();
    }
  }
}

- (void)_configureFromAssetDetail:(id)a3 withMergers:(id)a4
{
  uint64_t v525 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v514.receiver = self;
  v514.super_class = (Class)BCAssetDetail;
  [(BCCloudData *)&v514 configureFromCloudData:v6 withMergers:a4];
  v14 = objc_msgSend_assetID(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"assetID", v16, v17, v18, v19);

  v20 = NSNumber;
  uint64_t isFinished = objc_msgSend_isFinished(v6, v21, v22, v23, v24, v25, v26, v27);
  v35 = objc_msgSend_numberWithBool_(v20, v29, isFinished, v30, v31, v32, v33, v34);
  objc_msgSend_setDifferentNumber_forKey_(self, v36, (uint64_t)v35, @"isFinished", v37, v38, v39, v40);

  v41 = NSNumber;
  uint64_t v49 = objc_msgSend_notFinished(v6, v42, v43, v44, v45, v46, v47, v48);
  v56 = objc_msgSend_numberWithBool_(v41, v50, v49, v51, v52, v53, v54, v55);
  objc_msgSend_setDifferentNumber_forKey_(self, v57, (uint64_t)v56, @"notFinished", v58, v59, v60, v61);

  v62 = NSNumber;
  unsigned __int8 v70 = objc_msgSend_taste(self, v63, v64, v65, v66, v67, v68, v69);
  unsigned __int8 v78 = objc_msgSend_taste(v6, v71, v72, v73, v74, v75, v76, v77);
  int v85 = v70 & 3;
  if ((v78 & 3) != 0) {
    int v85 = v78 & 3;
  }
  v86 = objc_msgSend_numberWithShort_(v62, v79, v85 | (v78 | v70) & 4u, v80, v81, v82, v83, v84);
  objc_msgSend_setDifferentNumber_forKey_(self, v87, (uint64_t)v86, @"taste", v88, v89, v90, v91);

  v92 = NSNumber;
  uint64_t v100 = objc_msgSend_tasteSyncedToStore(v6, v93, v94, v95, v96, v97, v98, v99);
  v107 = objc_msgSend_numberWithShort_(v92, v101, v100, v102, v103, v104, v105, v106);
  objc_msgSend_setDifferentNumber_forKey_(self, v108, (uint64_t)v107, @"tasteSyncedToStore", v109, v110, v111, v112);

  v120 = objc_msgSend_dateFinished(v6, v113, v114, v115, v116, v117, v118, v119);
  objc_msgSend_setDifferentDate_forKey_(self, v121, (uint64_t)v120, @"dateFinished", v122, v123, v124, v125);

  v126 = NSNumber;
  uint64_t v134 = objc_msgSend_finishedDateKind(v6, v127, v128, v129, v130, v131, v132, v133);
  v141 = objc_msgSend_numberWithShort_(v126, v135, v134, v136, v137, v138, v139, v140);
  objc_msgSend_setDifferentNumber_forKey_(self, v142, (uint64_t)v141, @"finishedDateKind", v143, v144, v145, v146);

  v154 = objc_msgSend_lastOpenDate(v6, v147, v148, v149, v150, v151, v152, v153);
  objc_msgSend_setDifferentDate_forKey_(self, v155, (uint64_t)v154, @"lastOpenDate", v156, v157, v158, v159);

  v167 = objc_msgSend_readingPositionLocationUpdateDate(v6, v160, v161, v162, v163, v164, v165, v166);
  v175 = v167;
  if (v167)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v167, v168, v169, v170, v171, v172, v173, v174);
    double v177 = v176;
    v185 = objc_msgSend_readingPositionLocationUpdateDate(self, v178, v179, v180, v181, v182, v183, v184);
    objc_msgSend_timeIntervalSinceReferenceDate(v185, v186, v187, v188, v189, v190, v191, v192);
    double v194 = v193;

    if (v177 > v194)
    {
      v195 = NSNumber;
      objc_msgSend_readingProgress(v6, v168, v169, v170, v171, v172, v173, v174);
      v203 = objc_msgSend_numberWithFloat_(v195, v196, v197, v198, v199, v200, v201, v202);
      objc_msgSend_setDifferentNumber_forKey_(self, v204, (uint64_t)v203, @"readingProgress", v205, v206, v207, v208);

      v209 = NSNumber;
      objc_msgSend_readingProgressHighWaterMark(v6, v210, v211, v212, v213, v214, v215, v216);
      v224 = objc_msgSend_numberWithFloat_(v209, v217, v218, v219, v220, v221, v222, v223);
      objc_msgSend_setDifferentNumber_forKey_(self, v225, (uint64_t)v224, @"readingProgressHighWaterMark", v226, v227, v228, v229);

      v237 = objc_msgSend_readingPositionCFIString(v6, v230, v231, v232, v233, v234, v235, v236);
      objc_msgSend_setDifferentString_forKey_(self, v238, (uint64_t)v237, @"readingPositionCFIString", v239, v240, v241, v242);

      v250 = objc_msgSend_readingPositionAnnotationVersion(v6, v243, v244, v245, v246, v247, v248, v249);
      objc_msgSend_setDifferentString_forKey_(self, v251, (uint64_t)v250, @"readingPositionAnnotationVersion", v252, v253, v254, v255);

      v263 = objc_msgSend_readingPositionAssetVersion(v6, v256, v257, v258, v259, v260, v261, v262);
      objc_msgSend_setDifferentString_forKey_(self, v264, (uint64_t)v263, @"readingPositionAssetVersion", v265, v266, v267, v268);

      v276 = objc_msgSend_readingPositionUserData(v6, v269, v270, v271, v272, v273, v274, v275);
      uint64_t v277 = objc_opt_class();
      objc_msgSend_setDifferentValue_forKey_klass_(self, v278, (uint64_t)v276, @"readingPositionUserData", v277, v279, v280, v281);

      v282 = NSNumber;
      uint64_t v290 = objc_msgSend_readingPositionLocationRangeStart(v6, v283, v284, v285, v286, v287, v288, v289);
      v297 = objc_msgSend_numberWithInt_(v282, v291, v290, v292, v293, v294, v295, v296);
      objc_msgSend_setDifferentNumber_forKey_(self, v298, (uint64_t)v297, @"readingPositionLocationRangeStart", v299, v300, v301, v302);

      v303 = NSNumber;
      uint64_t v311 = objc_msgSend_readingPositionLocationRangeEnd(v6, v304, v305, v306, v307, v308, v309, v310);
      v318 = objc_msgSend_numberWithInt_(v303, v312, v311, v313, v314, v315, v316, v317);
      objc_msgSend_setDifferentNumber_forKey_(self, v319, (uint64_t)v318, @"readingPositionLocationRangeEnd", v320, v321, v322, v323);

      v324 = NSNumber;
      uint64_t v332 = objc_msgSend_readingPositionAbsolutePhysicalLocation(v6, v325, v326, v327, v328, v329, v330, v331);
      v339 = objc_msgSend_numberWithInt_(v324, v333, v332, v334, v335, v336, v337, v338);
      objc_msgSend_setDifferentNumber_forKey_(self, v340, (uint64_t)v339, @"readingPositionAbsolutePhysicalLocation", v341, v342, v343, v344);

      v352 = objc_msgSend_readingPositionStorageUUID(v6, v345, v346, v347, v348, v349, v350, v351);
      objc_msgSend_setDifferentString_forKey_(self, v353, (uint64_t)v352, @"readingPositionStorageUUID", v354, v355, v356, v357);

      objc_msgSend_setDifferentDate_forKey_(self, v358, (uint64_t)v175, @"readingPositionLocationUpdateDate", v359, v360, v361, v362);
    }
  }
  v370 = objc_msgSend_datePlaybackTimeUpdated(v6, v168, v169, v170, v171, v172, v173, v174);
  if (v370)
  {
    uint64_t v371 = objc_msgSend_datePlaybackTimeUpdated(self, v363, v364, v365, v366, v367, v368, v369);
    if (!v371) {
      goto LABEL_9;
    }
    v379 = (void *)v371;
    objc_msgSend_timeIntervalSinceReferenceDate(v370, v372, v373, v374, v375, v376, v377, v378);
    double v381 = v380;
    v389 = objc_msgSend_datePlaybackTimeUpdated(self, v382, v383, v384, v385, v386, v387, v388);
    objc_msgSend_timeIntervalSinceReferenceDate(v389, v390, v391, v392, v393, v394, v395, v396);
    double v398 = v397;

    if (v381 <= v398)
    {
      v446 = BDSCloudKitAudiobookLog();
      if (os_log_type_enabled(v446, OS_LOG_TYPE_DEFAULT))
      {
        v454 = objc_msgSend_assetID(self, v447, v448, v449, v450, v451, v452, v453);
        v462 = objc_msgSend_datePlaybackTimeUpdated(self, v455, v456, v457, v458, v459, v460, v461);
        objc_msgSend_bookmarkTime(self, v463, v464, v465, v466, v467, v468, v469);
        v471 = v470;
        objc_msgSend_bookmarkTime(v6, v472, v473, v474, v475, v476, v477, v478);
        *(_DWORD *)buf = 138413314;
        v516 = v454;
        __int16 v517 = 2112;
        v518 = v462;
        __int16 v519 = 2048;
        v520 = v471;
        __int16 v521 = 2112;
        v522 = v370;
        __int16 v523 = 2048;
        double v524 = v479;
        _os_log_impl(&dword_2360BC000, v446, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time, ignoring as my bookmark time is same or newer old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
      }
    }
    else
    {
LABEL_9:
      objc_msgSend_bookmarkTime(v6, v372, v373, v374, v375, v376, v377, v378);
      double v400 = v399;
      v401 = BDSCloudKitAudiobookLog();
      if (os_log_type_enabled(v401, OS_LOG_TYPE_DEFAULT))
      {
        v409 = objc_msgSend_assetID(self, v402, v403, v404, v405, v406, v407, v408);
        v417 = objc_msgSend_datePlaybackTimeUpdated(self, v410, v411, v412, v413, v414, v415, v416);
        objc_msgSend_bookmarkTime(self, v418, v419, v420, v421, v422, v423, v424);
        *(_DWORD *)buf = 138413314;
        v516 = v409;
        __int16 v517 = 2112;
        v518 = v417;
        __int16 v519 = 2048;
        v520 = v425;
        __int16 v521 = 2112;
        v522 = v370;
        __int16 v523 = 2048;
        double v524 = v400;
        _os_log_impl(&dword_2360BC000, v401, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
      }
      v433 = objc_msgSend_datePlaybackTimeUpdated(v6, v426, v427, v428, v429, v430, v431, v432);
      objc_msgSend_setDifferentDate_forKey_(self, v434, (uint64_t)v433, @"datePlaybackTimeUpdated", v435, v436, v437, v438);

      objc_msgSend_setDifferentBookmarkTime_(self, v439, v440, v441, v442, v443, v444, v445, v400);
    }
  }
  v480 = objc_msgSend_shared(MEMORY[0x263F2BA58], v363, v364, v365, v366, v367, v368, v369);
  int v488 = objc_msgSend_verboseLoggingEnabled(v480, v481, v482, v483, v484, v485, v486, v487);

  if (v488)
  {
    v489 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v489, OS_LOG_TYPE_DEFAULT))
    {
      v497 = objc_msgSend_assetID(self, v490, v491, v492, v493, v494, v495, v496);
      v505 = objc_msgSend_debugDescription(self, v498, v499, v500, v501, v502, v503, v504);
      v513 = objc_msgSend_assetID(v6, v506, v507, v508, v509, v510, v511, v512);
      *(_DWORD *)buf = 138412802;
      v516 = v497;
      __int16 v517 = 2112;
      v518 = v505;
      __int16 v519 = 2112;
      v520 = v513;
      _os_log_impl(&dword_2360BC000, v489, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail configured: %@ %@ from assetDetail:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)setDifferentBookmarkTime:(double)a3
{
  objc_msgSend_bookmarkTime(self, a2, v3, v4, v5, v6, v7, v8);
  if (v18 == a3 || vabdd_f64(a3, v18) <= 0.001) {
    return 0;
  }
  objc_msgSend_setBookmarkTime_(self, v11, v12, v13, v14, v15, v16, v17, a3);
  return 1;
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = BUProtocolCast();
  v486.receiver = self;
  v486.super_class = (Class)BCAssetDetail;
  unsigned int v8 = [(BCCloudData *)&v486 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  uint64_t v16 = objc_msgSend_assetID(self, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v24 = objc_msgSend_assetID(v7, v17, v18, v19, v20, v21, v22, v23);
  int isEqualToString = objc_msgSend_isEqualToString_(v16, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  uint64_t isFinished = objc_msgSend_isFinished(self, v31, v32, v33, v34, v35, v36, v37);
  int v46 = objc_msgSend_isFinished(v7, v39, v40, v41, v42, v43, v44, v45);
  int v482 = objc_msgSend_notFinished(self, v47, v48, v49, v50, v51, v52, v53);
  int v481 = objc_msgSend_notFinished(v7, v54, v55, v56, v57, v58, v59, v60);
  int v68 = objc_msgSend_taste(self, v61, v62, v63, v64, v65, v66, v67);
  int v464 = objc_msgSend_taste(v7, v69, v70, v71, v72, v73, v74, v75);
  int v463 = objc_msgSend_tasteSyncedToStore(self, v76, v77, v78, v79, v80, v81, v82);
  int v462 = objc_msgSend_tasteSyncedToStore(v7, v83, v84, v85, v86, v87, v88, v89);
  uint64_t v104 = objc_msgSend_dateFinished(self, v90, v91, v92, v93, v94, v95, v96);
  if (!v104)
  {
    uint64_t v24 = objc_msgSend_dateFinished(v7, v97, v98, v99, v100, v101, v102, v103);
    if (!v24)
    {
      int isEqualToDate = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v105 = objc_msgSend_dateFinished(self, v97, v98, v99, v100, v101, v102, v103);
  v113 = objc_msgSend_dateFinished(v7, v106, v107, v108, v109, v110, v111, v112);
  int isEqualToDate = objc_msgSend_isEqualToDate_(v105, v114, (uint64_t)v113, v115, v116, v117, v118, v119);

  if (!v104) {
    goto LABEL_6;
  }
LABEL_7:

  int v479 = objc_msgSend_finishedDateKind(self, v120, v121, v122, v123, v124, v125, v126);
  int v478 = objc_msgSend_finishedDateKind(v7, v127, v128, v129, v130, v131, v132, v133);
  uint64_t v148 = objc_msgSend_lastOpenDate(self, v134, v135, v136, v137, v138, v139, v140);
  if (!v148)
  {
    uint64_t v24 = objc_msgSend_lastOpenDate(v7, v141, v142, v143, v144, v145, v146, v147);
    if (!v24)
    {
      int v477 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v149 = objc_msgSend_lastOpenDate(self, v141, v142, v143, v144, v145, v146, v147);
  uint64_t v157 = objc_msgSend_lastOpenDate(v7, v150, v151, v152, v153, v154, v155, v156);
  int v477 = objc_msgSend_isEqualToDate_(v149, v158, (uint64_t)v157, v159, v160, v161, v162, v163);

  if (!v148) {
    goto LABEL_12;
  }
LABEL_13:

  objc_msgSend_readingProgress(self, v164, v165, v166, v167, v168, v169, v170);
  float v172 = v171;
  objc_msgSend_readingProgress(v7, v173, v174, v175, v176, v177, v178, v179);
  float v181 = v180;
  objc_msgSend_readingProgressHighWaterMark(self, v182, v183, v184, v185, v186, v187, v188);
  float v190 = v189;
  objc_msgSend_readingProgressHighWaterMark(v7, v191, v192, v193, v194, v195, v196, v197);
  float v199 = v198;
  uint64_t v214 = objc_msgSend_readingPositionCFIString(self, v200, v201, v202, v203, v204, v205, v206);
  if (!v214)
  {
    uint64_t v24 = objc_msgSend_readingPositionCFIString(v7, v207, v208, v209, v210, v211, v212, v213);
    if (!v24)
    {
      int v476 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  uint64_t v215 = objc_msgSend_readingPositionCFIString(self, v207, v208, v209, v210, v211, v212, v213);
  uint64_t v223 = objc_msgSend_readingPositionCFIString(v7, v216, v217, v218, v219, v220, v221, v222);
  int v476 = objc_msgSend_isEqualToString_(v215, v224, (uint64_t)v223, v225, v226, v227, v228, v229);

  if (!v214) {
    goto LABEL_18;
  }
LABEL_19:

  uint64_t v244 = objc_msgSend_readingPositionAssetVersion(self, v230, v231, v232, v233, v234, v235, v236);
  if (!v244)
  {
    uint64_t v24 = objc_msgSend_readingPositionAssetVersion(v7, v237, v238, v239, v240, v241, v242, v243);
    if (!v24)
    {
      int v474 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  uint64_t v245 = objc_msgSend_readingPositionAssetVersion(self, v237, v238, v239, v240, v241, v242, v243);
  uint64_t v253 = objc_msgSend_readingPositionAssetVersion(v7, v246, v247, v248, v249, v250, v251, v252);
  int v474 = objc_msgSend_isEqualToString_(v245, v254, (uint64_t)v253, v255, v256, v257, v258, v259);

  if (!v244) {
    goto LABEL_24;
  }
LABEL_25:

  uint64_t v274 = objc_msgSend_readingPositionAnnotationVersion(self, v260, v261, v262, v263, v264, v265, v266);
  if (!v274)
  {
    uint64_t v24 = objc_msgSend_readingPositionAnnotationVersion(v7, v267, v268, v269, v270, v271, v272, v273);
    if (!v24)
    {
      int v473 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  uint64_t v275 = objc_msgSend_readingPositionAnnotationVersion(self, v267, v268, v269, v270, v271, v272, v273);
  v283 = objc_msgSend_readingPositionAnnotationVersion(v7, v276, v277, v278, v279, v280, v281, v282);
  int v473 = objc_msgSend_isEqualToString_(v275, v284, (uint64_t)v283, v285, v286, v287, v288, v289);

  if (!v274) {
    goto LABEL_30;
  }
LABEL_31:

  v304 = objc_msgSend_readingPositionUserData(self, v290, v291, v292, v293, v294, v295, v296);
  unsigned int v485 = v8;
  if (!v304)
  {
    uint64_t v24 = objc_msgSend_readingPositionUserData(v7, v297, v298, v299, v300, v301, v302, v303);
    if (!v24)
    {
      int isEqual = 1;
LABEL_36:

      goto LABEL_37;
    }
  }
  uint64_t v305 = objc_msgSend_readingPositionUserData(self, v297, v298, v299, v300, v301, v302, v303);
  uint64_t v313 = objc_msgSend_readingPositionUserData(v7, v306, v307, v308, v309, v310, v311, v312);
  int isEqual = objc_msgSend_isEqual_(v305, v314, (uint64_t)v313, v315, v316, v317, v318, v319);

  if (!v304) {
    goto LABEL_36;
  }
LABEL_37:

  int v472 = objc_msgSend_readingPositionLocationRangeStart(self, v320, v321, v322, v323, v324, v325, v326);
  int v471 = objc_msgSend_readingPositionLocationRangeStart(v7, v327, v328, v329, v330, v331, v332, v333);
  int v470 = objc_msgSend_readingPositionLocationRangeEnd(self, v334, v335, v336, v337, v338, v339, v340);
  int v469 = objc_msgSend_readingPositionLocationRangeEnd(v7, v341, v342, v343, v344, v345, v346, v347);
  int v468 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v348, v349, v350, v351, v352, v353, v354);
  int v467 = objc_msgSend_readingPositionAbsolutePhysicalLocation(v7, v355, v356, v357, v358, v359, v360, v361);
  uint64_t v369 = objc_msgSend_readingPositionStorageUUID(self, v362, v363, v364, v365, v366, v367, v368);
  uint64_t v377 = objc_msgSend_readingPositionStorageUUID(v7, v370, v371, v372, v373, v374, v375, v376);

  uint64_t v466 = v369;
  uint64_t v392 = objc_msgSend_readingPositionLocationUpdateDate(self, v378, v379, v380, v381, v382, v383, v384);
  if (!v392)
  {
    uint64_t v24 = objc_msgSend_readingPositionLocationUpdateDate(v7, v385, v386, v387, v388, v389, v390, v391);
    if (!v24)
    {
      int v465 = 1;
LABEL_42:

      goto LABEL_43;
    }
  }
  objc_msgSend_readingPositionLocationUpdateDate(self, v385, v386, v387, v388, v389, v390, v391);
  v394 = uint64_t v393 = isFinished;
  objc_msgSend_readingPositionLocationUpdateDate(v7, v395, v396, v397, v398, v399, v400, v401);
  uint64_t v403 = v402 = v46;
  int v465 = objc_msgSend_isEqualToDate_(v394, v404, (uint64_t)v403, v405, v406, v407, v408, v409);

  int v46 = v402;
  uint64_t isFinished = v393;
  if (!v392) {
    goto LABEL_42;
  }
LABEL_43:
  int v410 = isFinished ^ v46;
  int v411 = v482 ^ v481;

  v426 = objc_msgSend_datePlaybackTimeUpdated(self, v412, v413, v414, v415, v416, v417, v418);
  if (!v426)
  {
    uint64_t isFinished = objc_msgSend_datePlaybackTimeUpdated(v7, v419, v420, v421, v422, v423, v424, v425);
    if (!isFinished)
    {
      char v483 = 1;
LABEL_48:

      goto LABEL_49;
    }
  }
  uint64_t v427 = objc_msgSend_datePlaybackTimeUpdated(self, v419, v420, v421, v422, v423, v424, v425);
  objc_msgSend_datePlaybackTimeUpdated(v7, v428, v429, v430, v431, v432, v433, v434);
  v436 = int v435 = v68;
  char v483 = objc_msgSend_isEqualToDate_(v427, v437, (uint64_t)v436, v438, v439, v440, v441, v442);

  int v68 = v435;
  if (!v426) {
    goto LABEL_48;
  }
LABEL_49:

  objc_msgSend_bookmarkTime(self, v443, v444, v445, v446, v447, v448, v449);
  double v451 = v450;
  objc_msgSend_bookmarkTime(v7, v452, v453, v454, v455, v456, v457, v458);
  BOOL v460 = 0;
  if (((v485 & isEqualToString ^ 1 | v410 | v411) & 1) == 0
    && ((isEqualToDate ^ 1) & 1) == 0
    && v479 == v478
    && ((v477 ^ 1) & 1) == 0
    && v172 == v181
    && v190 == v199
    && ((v476 ^ 1) & 1) == 0
    && ((isEqual ^ 1) & 1) == 0
    && ((v474 ^ 1) & 1) == 0
    && ((v473 ^ 1) & 1) == 0
    && v472 == v471
    && v470 == v469
    && v468 == v467
    && v466 == v377
    && ((v465 ^ 1) & 1) == 0
    && v68 == v464
    && v463 == v462)
  {
    if (v451 == v459) {
      BOOL v460 = v483;
    }
    else {
      BOOL v460 = 0;
    }
  }

  return v460;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v998 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v987.receiver = self;
  v987.super_class = (Class)BCAssetDetail;
  [(BCCloudData *)&v987 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    uint64_t v14 = objc_msgSend_shared(MEMORY[0x263F2BA58], v7, v8, v9, v10, v11, v12, v13);
    int v22 = objc_msgSend_verboseLoggingEnabled(v14, v15, v16, v17, v18, v19, v20, v21);

    if (v22)
    {
      uint64_t v29 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2360BC000, v29, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail resolveConflictsFromRecord:withResolvers: record != nil\\\"\"", buf, 2u);
      }
    }
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v23, (uint64_t)v6, v24, v25, v26, v27, v28);
    uint64_t v30 = (const char *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_assetID(self, v31, v32, v33, v34, v35, v36, v37);
    char isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)v30, v40, v41, v42, v43, v44);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v53 = BDSCloudKitLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_2361FC99C(self, v30, v53, v54, v55, v56, v57, v58);
      }

      objc_msgSend_setAssetID_(self, v59, (uint64_t)v30, v60, v61, v62, v63, v64);
    }
    v986 = (char *)v30;
    uint64_t v65 = objc_msgSend_modificationDate(self, v46, v47, v48, v49, v50, v51, v52);
    if (!v65) {
      goto LABEL_12;
    }
    uint64_t v73 = (void *)v65;
    uint64_t v74 = objc_msgSend_modificationDate(self, v66, v67, v68, v69, v70, v71, v72);
    objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78, v79, v80, v81);
    double v83 = v82;
    uint64_t v91 = objc_msgSend_modificationDate(v6, v84, v85, v86, v87, v88, v89, v90);
    objc_msgSend_timeIntervalSinceReferenceDate(v91, v92, v93, v94, v95, v96, v97, v98);
    double v100 = v99;

    if (v83 >= v100)
    {
      uint64_t v492 = objc_msgSend_modificationDate(self, v101, v102, v103, v104, v105, v106, v107);
      if (v492)
      {
        uint64_t v493 = objc_msgSend_modificationDate(v6, v485, v486, v487, v488, v489, v490, v491);
        objc_msgSend_timeIntervalSinceReferenceDate(v493, v494, v495, v496, v497, v498, v499, v500);
        double v502 = v501;
        uint64_t v510 = objc_msgSend_modificationDate(self, v503, v504, v505, v506, v507, v508, v509);
        objc_msgSend_timeIntervalSinceReferenceDate(v510, v511, v512, v513, v514, v515, v516, v517);
        BOOL v262 = v502 != v518;
      }
      else
      {
        BOOL v262 = 0;
      }

      uint64_t v139 = BDSCloudKitLog();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        v929 = objc_msgSend_assetID(self, v922, v923, v924, v925, v926, v927, v928);
        v937 = objc_msgSend_recordID(v6, v930, v931, v932, v933, v934, v935, v936);
        v945 = objc_msgSend_recordName(v937, v938, v939, v940, v941, v942, v943, v944);
        v953 = objc_msgSend_modificationDate(self, v946, v947, v948, v949, v950, v951, v952);
        objc_msgSend_timeIntervalSinceReferenceDate(v953, v954, v955, v956, v957, v958, v959, v960);
        double v962 = v961;
        v970 = objc_msgSend_modificationDate(v6, v963, v964, v965, v966, v967, v968, v969);
        objc_msgSend_timeIntervalSinceReferenceDate(v970, v971, v972, v973, v974, v975, v976, v977);
        v978 = @"newer";
        *(_DWORD *)buf = 138412802;
        v989 = v929;
        if (v962 == v979) {
          v978 = @"the same";
        }
        __int16 v990 = 2112;
        v991 = v945;
        __int16 v992 = 2114;
        v993 = v978;
        _os_log_impl(&dword_2360BC000, v139, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my basic properties as my modification date is %{public}@.", buf, 0x20u);
      }
    }
    else
    {
LABEL_12:
      uint64_t v108 = BDSCloudKitLog();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        uint64_t v116 = objc_msgSend_assetID(self, v109, v110, v111, v112, v113, v114, v115);
        uint64_t v124 = objc_msgSend_recordID(v6, v117, v118, v119, v120, v121, v122, v123);
        uint64_t v132 = objc_msgSend_recordName(v124, v125, v126, v127, v128, v129, v130, v131);
        *(_DWORD *)buf = 138412546;
        v989 = v116;
        __int16 v990 = 2112;
        v991 = v132;
        _os_log_impl(&dword_2360BC000, v108, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting general record properties.", buf, 0x16u);
      }
      uint64_t v139 = objc_msgSend_objectForKey_(v6, v133, @"isFinished", v134, v135, v136, v137, v138);
      objc_msgSend_setDifferentNumber_forKey_(self, v140, (uint64_t)v139, @"isFinished", v141, v142, v143, v144);
      uint64_t v151 = objc_msgSend_objectForKey_(v6, v145, @"notFinished", v146, v147, v148, v149, v150);
      objc_msgSend_setDifferentNumber_forKey_(self, v152, (uint64_t)v151, @"notFinished", v153, v154, v155, v156);
      uint64_t v163 = objc_msgSend_objectForKey_(v6, v157, @"taste", v158, v159, v160, v161, v162);
      unsigned __int8 v171 = objc_msgSend_taste(self, v164, v165, v166, v167, v168, v169, v170);
      unsigned __int8 v179 = objc_msgSend_shortValue(v163, v172, v173, v174, v175, v176, v177, v178);
      int v186 = v171 & 3;
      if ((v179 & 3) != 0) {
        int v186 = v179 & 3;
      }
      uint64_t v187 = objc_msgSend_numberWithShort_(NSNumber, v180, v186 | (v179 | v171) & 4u, v181, v182, v183, v184, v185);
      objc_msgSend_setDifferentNumber_forKey_(self, v188, (uint64_t)v187, @"taste", v189, v190, v191, v192);

      float v199 = objc_msgSend_objectForKey_(v6, v193, @"tasteSyncedToStore", v194, v195, v196, v197, v198);
      objc_msgSend_setDifferentNumber_forKey_(self, v200, (uint64_t)v199, @"tasteSyncedToStore", v201, v202, v203, v204);
      uint64_t v211 = objc_msgSend_objectForKey_(v6, v205, @"dateFinished", v206, v207, v208, v209, v210);
      objc_msgSend_setDifferentDate_forKey_(self, v212, (uint64_t)v211, @"dateFinished", v213, v214, v215, v216);
      v224 = objc_msgSend_encryptedValues(v6, v217, v218, v219, v220, v221, v222, v223);
      uint64_t v231 = objc_msgSend_objectForKeyedSubscript_(v224, v225, @"finishedDateKind", v226, v227, v228, v229, v230);

      objc_msgSend_setDifferentNumber_forKey_(self, v232, (uint64_t)v231, @"finishedDateKind", v233, v234, v235, v236);
      uint64_t v243 = objc_msgSend_objectForKey_(v6, v237, @"lastOpenDate", v238, v239, v240, v241, v242);
      objc_msgSend_setDifferentDate_forKey_(self, v244, (uint64_t)v243, @"lastOpenDate", v245, v246, v247, v248);
      uint64_t v256 = objc_msgSend_modificationDate(v6, v249, v250, v251, v252, v253, v254, v255);
      objc_msgSend_setDifferentDate_forKey_(self, v257, (uint64_t)v256, @"modificationDate", v258, v259, v260, v261);

      BOOL v262 = 0;
    }

    uint64_t v269 = objc_msgSend_objectForKey_(v6, v263, @"readingPositionLocationUpdateDate", v264, v265, v266, v267, v268);
    uint64_t v277 = v269;
    if (v269
      && (objc_msgSend_timeIntervalSinceReferenceDate(v269, v270, v271, v272, v273, v274, v275, v276),
          double v279 = v278,
          objc_msgSend_readingPositionLocationUpdateDate(self, v280, v281, v282, v283, v284, v285, v286),
          uint64_t v287 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_timeIntervalSinceReferenceDate(v287, v288, v289, v290, v291, v292, v293, v294),
          double v296 = v295,
          v287,
          v279 > v296))
    {
      BOOL v984 = v262;
      v985 = v277;
      v297 = BDSCloudKitLog();
      if (os_log_type_enabled(v297, OS_LOG_TYPE_INFO))
      {
        uint64_t v305 = objc_msgSend_assetID(self, v298, v299, v300, v301, v302, v303, v304);
        uint64_t v313 = objc_msgSend_recordID(v6, v306, v307, v308, v309, v310, v311, v312);
        uint64_t v321 = objc_msgSend_recordName(v313, v314, v315, v316, v317, v318, v319, v320);
        *(_DWORD *)buf = 138412546;
        v989 = v305;
        __int16 v990 = 2112;
        v991 = v321;
        _os_log_impl(&dword_2360BC000, v297, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting reading position properties.", buf, 0x16u);
      }
      uint64_t v328 = objc_msgSend_objectForKey_(v6, v322, @"readingProgress", v323, v324, v325, v326, v327);
      objc_msgSend_setDifferentNumber_forKey_(self, v329, (uint64_t)v328, @"readingProgress", v330, v331, v332, v333);
      v983 = objc_msgSend_objectForKey_(v6, v334, @"readingProgressHighWaterMark", v335, v336, v337, v338, v339);
      objc_msgSend_setDifferentNumber_forKey_(self, v340, (uint64_t)v983, @"readingProgressHighWaterMark", v341, v342, v343, v344);
      v982 = objc_msgSend_objectForKey_(v6, v345, @"readingPositionCFIString", v346, v347, v348, v349, v350);
      objc_msgSend_setDifferentString_forKey_(self, v351, (uint64_t)v982, @"readingPositionCFIString", v352, v353, v354, v355);
      v981 = objc_msgSend_objectForKey_(v6, v356, @"readingPositionAssetVersion", v357, v358, v359, v360, v361);
      objc_msgSend_setDifferentString_forKey_(self, v362, (uint64_t)v981, @"readingPositionAssetVersion", v363, v364, v365, v366);
      v980 = objc_msgSend_objectForKey_(v6, v367, @"readingPositionAnnotationVersion", v368, v369, v370, v371, v372);
      objc_msgSend_setDifferentString_forKey_(self, v373, (uint64_t)v980, @"readingPositionAnnotationVersion", v374, v375, v376, v377);
      uint64_t v384 = objc_msgSend_objectForKey_(v6, v378, @"readingPositionUserData", v379, v380, v381, v382, v383);
      uint64_t v385 = objc_opt_class();
      objc_msgSend_setDifferentValue_forKey_klass_(self, v386, (uint64_t)v384, @"readingPositionUserData", v385, v387, v388, v389);
      uint64_t v396 = objc_msgSend_objectForKey_(v6, v390, @"readingPositionLocationRangeStart", v391, v392, v393, v394, v395);
      objc_msgSend_setDifferentNumber_forKey_(self, v397, (uint64_t)v396, @"readingPositionLocationRangeStart", v398, v399, v400, v401);
      uint64_t v408 = objc_msgSend_objectForKey_(v6, v402, @"readingPositionLocationRangeEnd", v403, v404, v405, v406, v407);
      objc_msgSend_setDifferentNumber_forKey_(self, v409, (uint64_t)v408, @"readingPositionLocationRangeEnd", v410, v411, v412, v413);
      uint64_t v420 = objc_msgSend_objectForKey_(v6, v414, @"readingPositionAbsolutePhysicalLocation", v415, v416, v417, v418, v419);
      objc_msgSend_setDifferentNumber_forKey_(self, v421, (uint64_t)v420, @"readingPositionAbsolutePhysicalLocation", v422, v423, v424, v425);
      uint64_t v432 = objc_msgSend_objectForKey_(v6, v426, @"readingPositionStorageUUID", v427, v428, v429, v430, v431);
      objc_msgSend_setDifferentString_forKey_(self, v433, (uint64_t)v432, @"readingPositionStorageUUID", v434, v435, v436, v437);
      uint64_t v444 = objc_msgSend_objectForKey_(v6, v438, @"readingPositionLocationUpdateDate", v439, v440, v441, v442, v443);
      objc_msgSend_setDifferentDate_forKey_(self, v445, (uint64_t)v444, @"readingPositionLocationUpdateDate", v446, v447, v448, v449);

      uint64_t v277 = v985;
      int v450 = v984;
    }
    else
    {
      uint64_t v458 = objc_msgSend_readingPositionLocationUpdateDate(self, v270, v271, v272, v273, v274, v275, v276);
      if (v458)
      {
        objc_msgSend_timeIntervalSinceReferenceDate(v277, v451, v452, v453, v454, v455, v456, v457);
        double v460 = v459;
        int v468 = objc_msgSend_readingPositionLocationUpdateDate(self, v461, v462, v463, v464, v465, v466, v467);
        objc_msgSend_timeIntervalSinceReferenceDate(v468, v469, v470, v471, v472, v473, v474, v475);
        BOOL v477 = v460 != v476;
      }
      else
      {
        BOOL v477 = 0;
      }

      int v450 = v477 || v262;
      uint64_t v328 = BDSCloudKitLog();
      if (os_log_type_enabled(v328, OS_LOG_TYPE_INFO))
      {
        v526 = objc_msgSend_assetID(self, v519, v520, v521, v522, v523, v524, v525);
        v534 = objc_msgSend_recordID(v6, v527, v528, v529, v530, v531, v532, v533);
        v542 = objc_msgSend_recordName(v534, v535, v536, v537, v538, v539, v540, v541);
        v550 = objc_msgSend_readingPositionLocationUpdateDate(self, v543, v544, v545, v546, v547, v548, v549);
        objc_msgSend_timeIntervalSinceReferenceDate(v550, v551, v552, v553, v554, v555, v556, v557);
        double v559 = v558;
        objc_msgSend_timeIntervalSinceReferenceDate(v277, v560, v561, v562, v563, v564, v565, v566);
        v567 = @"newer";
        *(_DWORD *)buf = 138412802;
        v989 = v526;
        if (v559 == v568) {
          v567 = @"the same";
        }
        __int16 v990 = 2112;
        v991 = v542;
        __int16 v992 = 2114;
        v993 = v567;
        _os_log_impl(&dword_2360BC000, v328, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my reading position properties as my reading position update date is %{public}@.", buf, 0x20u);
      }
    }

    v582 = objc_msgSend_objectForKey_(v6, v569, @"datePlaybackTimeUpdated", v570, v571, v572, v573, v574);
    if (v582)
    {
      uint64_t v583 = objc_msgSend_datePlaybackTimeUpdated(self, v575, v576, v577, v578, v579, v580, v581);
      if (!v583) {
        goto LABEL_36;
      }
      v591 = (void *)v583;
      objc_msgSend_timeIntervalSinceReferenceDate(v582, v584, v585, v586, v587, v588, v589, v590);
      double v593 = v592;
      v601 = objc_msgSend_datePlaybackTimeUpdated(self, v594, v595, v596, v597, v598, v599, v600);
      objc_msgSend_timeIntervalSinceReferenceDate(v601, v602, v603, v604, v605, v606, v607, v608);
      double v610 = v609;

      if (v593 > v610)
      {
LABEL_36:
        v611 = BDSCloudKitLog();
        if (os_log_type_enabled(v611, OS_LOG_TYPE_DEFAULT))
        {
          v619 = objc_msgSend_assetID(self, v612, v613, v614, v615, v616, v617, v618);
          v627 = objc_msgSend_recordID(v6, v620, v621, v622, v623, v624, v625, v626);
          v635 = objc_msgSend_recordName(v627, v628, v629, v630, v631, v632, v633, v634);
          *(_DWORD *)buf = 138412546;
          v989 = v619;
          __int16 v990 = 2112;
          v991 = v635;
          _os_log_impl(&dword_2360BC000, v611, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@ adopting playback time properties.", buf, 0x16u);
        }
        v642 = objc_msgSend_objectForKey_(v6, v636, @"bookmarkTime", v637, v638, v639, v640, v641);
        v650 = v642;
        if (v642)
        {
          objc_msgSend_doubleValue(v642, v643, v644, v645, v646, v647, v648, v649);
          double v652 = v651;
          v653 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v653, OS_LOG_TYPE_DEFAULT))
          {
            v661 = objc_msgSend_assetID(self, v654, v655, v656, v657, v658, v659, v660);
            v669 = objc_msgSend_datePlaybackTimeUpdated(self, v662, v663, v664, v665, v666, v667, v668);
            objc_msgSend_bookmarkTime(self, v670, v671, v672, v673, v674, v675, v676);
            *(_DWORD *)buf = 138413314;
            v989 = v661;
            __int16 v990 = 2112;
            v991 = v669;
            __int16 v992 = 2048;
            v993 = v677;
            __int16 v994 = 2112;
            v995 = v582;
            __int16 v996 = 2048;
            double v997 = v652;
            _os_log_impl(&dword_2360BC000, v653, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
          }
          objc_msgSend_setDifferentDate_forKey_(self, v678, (uint64_t)v582, @"datePlaybackTimeUpdated", v679, v680, v681, v682);
          objc_msgSend_setDifferentBookmarkTime_(self, v683, v684, v685, v686, v687, v688, v689, v652);
        }
        else
        {
          v819 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v819, OS_LOG_TYPE_DEFAULT))
          {
            v827 = objc_msgSend_assetID(self, v820, v821, v822, v823, v824, v825, v826);
            *(_DWORD *)buf = 138412290;
            v989 = v827;
            _os_log_impl(&dword_2360BC000, v819, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as bookmark time is NULL.", buf, 0xCu);
          }
        }
LABEL_62:

        if ((v450 & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
    }
    v697 = objc_msgSend_datePlaybackTimeUpdated(self, v575, v576, v577, v578, v579, v580, v581);
    if (v697)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(v582, v690, v691, v692, v693, v694, v695, v696);
      double v699 = v698;
      v707 = objc_msgSend_datePlaybackTimeUpdated(self, v700, v701, v702, v703, v704, v705, v706);
      objc_msgSend_timeIntervalSinceReferenceDate(v707, v708, v709, v710, v711, v712, v713, v714);
      double v716 = v715;

      if (v699 != v716) {
        int v450 = 1;
      }
    }

    if (!v582)
    {
      v761 = BDSCloudKitAudiobookLog();
      if (os_log_type_enabled(v761, OS_LOG_TYPE_DEFAULT))
      {
        v769 = objc_msgSend_assetID(self, v762, v763, v764, v765, v766, v767, v768);
        v777 = objc_msgSend_recordID(v6, v770, v771, v772, v773, v774, v775, v776);
        v785 = objc_msgSend_recordName(v777, v778, v779, v780, v781, v782, v783, v784);
        v793 = objc_msgSend_datePlaybackTimeUpdated(self, v786, v787, v788, v789, v790, v791, v792);
        objc_msgSend_timeIntervalSinceReferenceDate(v793, v794, v795, v796, v797, v798, v799, v800);
        double v802 = v801;
        objc_msgSend_timeIntervalSinceReferenceDate(0, v803, v804, v805, v806, v807, v808, v809);
        v810 = @"newer";
        *(_DWORD *)buf = 138412802;
        v989 = v769;
        if (v802 == v811) {
          v810 = @"the same";
        }
        __int16 v990 = 2112;
        v991 = v785;
        __int16 v992 = 2114;
        v993 = v810;
        _os_log_impl(&dword_2360BC000, v761, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my playback time properties as my playback time update date is %{public}@.", buf, 0x20u);
      }
      if (!v450)
      {
LABEL_64:
        int hasChanges = objc_msgSend_hasChanges(self, v812, v813, v814, v815, v816, v817, v818);
        v851 = objc_msgSend_shared(MEMORY[0x263F2BA58], v844, v845, v846, v847, v848, v849, v850);
        int v859 = objc_msgSend_verboseLoggingEnabled(v851, v852, v853, v854, v855, v856, v857, v858);

        if (hasChanges)
        {
          if (v859)
          {
            v860 = BDSCloudKitDevelopmentLog();
            if (os_log_type_enabled(v860, OS_LOG_TYPE_DEFAULT))
            {
              v868 = objc_msgSend_assetID(self, v861, v862, v863, v864, v865, v866, v867);
              v876 = objc_msgSend_recordID(v6, v869, v870, v871, v872, v873, v874, v875);
              v884 = objc_msgSend_recordName(v876, v877, v878, v879, v880, v881, v882, v883);
              objc_msgSend_debugDescription(self, v885, v886, v887, v888, v889, v890, v891);
              v892 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v989 = v868;
              __int16 v990 = 2112;
              v991 = v884;
              __int16 v992 = 2112;
              v993 = v892;
              v893 = "\"\\\"BCAssetDetail %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_71:
              _os_log_impl(&dword_2360BC000, v860, OS_LOG_TYPE_DEFAULT, v893, buf, 0x20u);

              goto LABEL_72;
            }
            goto LABEL_72;
          }
        }
        else if (v859)
        {
          v860 = BDSCloudKitDevelopmentLog();
          if (os_log_type_enabled(v860, OS_LOG_TYPE_DEFAULT))
          {
            v868 = objc_msgSend_assetID(self, v894, v895, v896, v897, v898, v899, v900);
            v876 = objc_msgSend_recordID(v6, v901, v902, v903, v904, v905, v906, v907);
            v884 = objc_msgSend_recordName(v876, v908, v909, v910, v911, v912, v913, v914);
            objc_msgSend_debugDescription(self, v915, v916, v917, v918, v919, v920, v921);
            v892 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v989 = v868;
            __int16 v990 = 2112;
            v991 = v884;
            __int16 v992 = 2112;
            v993 = v892;
            v893 = "\"\\\"BCAssetDetail %@ Resolving: Identical properties from record: %@ %@\\\"\"";
            goto LABEL_71;
          }
LABEL_72:
        }
        int v478 = v986;
        goto LABEL_74;
      }
LABEL_63:
      objc_msgSend_incrementEditGeneration(self, v812, v813, v814, v815, v816, v817, v818);
      goto LABEL_64;
    }
    v650 = objc_msgSend_objectForKey_(v6, v717, @"bookmarkTime", v718, v719, v720, v721, v722);
    v723 = BDSCloudKitAudiobookLog();
    BOOL v724 = os_log_type_enabled(v723, OS_LOG_TYPE_DEFAULT);
    if (v650)
    {
      if (v724)
      {
        v732 = objc_msgSend_assetID(self, v725, v726, v727, v728, v729, v730, v731);
        v740 = objc_msgSend_datePlaybackTimeUpdated(self, v733, v734, v735, v736, v737, v738, v739);
        objc_msgSend_bookmarkTime(self, v741, v742, v743, v744, v745, v746, v747);
        v749 = v748;
        objc_msgSend_doubleValue(v650, v750, v751, v752, v753, v754, v755, v756);
        *(_DWORD *)buf = 138413314;
        v989 = v732;
        __int16 v990 = 2112;
        v991 = v740;
        __int16 v992 = 2048;
        v993 = v749;
        __int16 v994 = 2112;
        v995 = v582;
        __int16 v996 = 2048;
        double v997 = v757;
        v758 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f]"
               " new:[%@ = %.2f].";
        v759 = v723;
        uint32_t v760 = 52;
LABEL_60:
        _os_log_impl(&dword_2360BC000, v759, OS_LOG_TYPE_DEFAULT, v758, buf, v760);
      }
    }
    else if (v724)
    {
      v732 = objc_msgSend_assetID(self, v725, v726, v727, v728, v729, v730, v731);
      v740 = objc_msgSend_datePlaybackTimeUpdated(self, v828, v829, v830, v831, v832, v833, v834);
      objc_msgSend_bookmarkTime(self, v835, v836, v837, v838, v839, v840, v841);
      *(_DWORD *)buf = 138413058;
      v989 = v732;
      __int16 v990 = 2112;
      v991 = v740;
      __int16 v992 = 2048;
      v993 = v842;
      __int16 v994 = 2112;
      v995 = v582;
      v758 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f] new:[%@ = NULL].";
      v759 = v723;
      uint32_t v760 = 42;
      goto LABEL_60;
    }

    goto LABEL_62;
  }
  BDSCloudKitLog();
  int v478 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v478, OS_LOG_TYPE_ERROR)) {
    sub_2361FC904(self, v478, v479, v480, v481, v482, v483, v484);
  }
LABEL_74:
}

- (id)recordType
{
  return @"assetDetail";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (BOOL)isAudiobook
{
  uint64_t v8 = objc_msgSend_datePlaybackTimeUpdated(self, a2, v2, v3, v4, v5, v6, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (NSString)debugDescription
{
  uint64_t v182 = NSString;
  uint64_t v181 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_isFinished(self, v9, v10, v11, v12, v13, v14, v15)) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  float v180 = v23;
  if (objc_msgSend_notFinished(self, v16, v17, v18, v19, v20, v21, v22)) {
    uint64_t v31 = @"YES";
  }
  else {
    uint64_t v31 = @"NO";
  }
  unsigned __int8 v179 = v31;
  uint64_t v178 = objc_msgSend_dateFinished(self, v24, v25, v26, v27, v28, v29, v30);
  int v177 = objc_msgSend_finishedDateKind(self, v32, v33, v34, v35, v36, v37, v38);
  uint64_t v176 = objc_msgSend_lastOpenDate(self, v39, v40, v41, v42, v43, v44, v45);
  int v175 = objc_msgSend_taste(self, v46, v47, v48, v49, v50, v51, v52);
  int v174 = objc_msgSend_tasteSyncedToStore(self, v53, v54, v55, v56, v57, v58, v59);
  objc_msgSend_readingProgress(self, v60, v61, v62, v63, v64, v65, v66);
  double v68 = v67;
  objc_msgSend_readingProgressHighWaterMark(self, v69, v70, v71, v72, v73, v74, v75);
  double v77 = v76;
  uint64_t v85 = objc_msgSend_readingPositionCFIString(self, v78, v79, v80, v81, v82, v83, v84);
  uint64_t v173 = objc_msgSend_readingPositionAnnotationVersion(self, v86, v87, v88, v89, v90, v91, v92);
  float v172 = objc_msgSend_readingPositionAssetVersion(self, v93, v94, v95, v96, v97, v98, v99);
  uint64_t v107 = objc_msgSend_readingPositionUserData(self, v100, v101, v102, v103, v104, v105, v106);
  uint64_t v115 = objc_msgSend_readingPositionLocationRangeStart(self, v108, v109, v110, v111, v112, v113, v114);
  uint64_t v123 = objc_msgSend_readingPositionLocationRangeEnd(self, v116, v117, v118, v119, v120, v121, v122);
  uint64_t v131 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v124, v125, v126, v127, v128, v129, v130);
  uint64_t v139 = objc_msgSend_readingPositionStorageUUID(self, v132, v133, v134, v135, v136, v137, v138);
  uint64_t v147 = objc_msgSend_readingPositionLocationUpdateDate(self, v140, v141, v142, v143, v144, v145, v146);
  uint64_t v155 = objc_msgSend_datePlaybackTimeUpdated(self, v148, v149, v150, v151, v152, v153, v154);
  objc_msgSend_bookmarkTime(self, v156, v157, v158, v159, v160, v161, v162);
  objc_msgSend_stringWithFormat_(v182, v163, @"BCAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)", v164, v165, v166, v167, v168, v181, v180, v179, v178, v177, v176, v175, v174, *(void *)&v68, *(void *)&v77, v85,
    v173,
    v172,
    v107,
    v115,
    v123,
    v131,
    v139,
    v147,
    v155,
  uint64_t v170 = v169);

  return (NSString *)v170;
}

@end