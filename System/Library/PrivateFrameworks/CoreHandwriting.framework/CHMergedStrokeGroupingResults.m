@interface CHMergedStrokeGroupingResults
+ (BOOL)supportsSecureCoding;
- (CHMergedStrokeGroupingResults)initWithCoder:(id)a3;
- (CHMergedStrokeGroupingResults)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 groupingResultsByStrategyIdentifier:(id)a6;
- (NSDictionary)groupingResultsByStrategyIdentifier;
- (id)groupingResultUpdatedWithGroupReplacements:(id)a3;
- (id)strokeGroupsOfClass:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHMergedStrokeGroupingResults

- (CHMergedStrokeGroupingResults)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 groupingResultsByStrategyIdentifier:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHMergedStrokeGroupingResults;
  v12 = [(CHStrokeGroupingResult *)&v15 initWithStrokeGroups:a3 createdStrokeGroups:a4 deletedStrokeGroups:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_groupingResultsByStrategyIdentifier, a6);
  }

  return v13;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  uint64_t v551 = *MEMORY[0x1E4F143B8];
  id v509 = a3;
  if (objc_msgSend_count(v509, v3, v4, v5, v6, v7))
  {
    v13 = objc_msgSend_strokeGroups(self, v8, v9, v10, v11, v12);
    v511 = objc_msgSend_mutableCopy(v13, v14, v15, v16, v17, v18);

    v29 = objc_msgSend_createdStrokeGroups(self, v19, v20, v21, v22, v23);
    if (v29)
    {
      v30 = objc_msgSend_createdStrokeGroups(self, v24, v25, v26, v27, v28);
      v510 = objc_msgSend_mutableCopy(v30, v31, v32, v33, v34, v35);
    }
    else
    {
      v510 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v24, v25, v26, v27, v28);
    }

    v47 = objc_msgSend_deletedStrokeGroups(self, v37, v38, v39, v40, v41);
    if (v47)
    {
      v48 = objc_msgSend_deletedStrokeGroups(self, v42, v43, v44, v45, v46);
      v505 = objc_msgSend_mutableCopy(v48, v49, v50, v51, v52, v53);
    }
    else
    {
      v505 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v42, v43, v44, v45, v46);
    }

    v519 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v54, v55, v56, v57, v58);
    long long v537 = 0u;
    long long v538 = 0u;
    long long v535 = 0u;
    long long v536 = 0u;
    v64 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v59, v60, v61, v62, v63);
    v70 = objc_msgSend_keyEnumerator(v64, v65, v66, v67, v68, v69);

    obuint64_t j = v70;
    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v535, (uint64_t)v550, 16, v72);
    if (v78)
    {
      uint64_t v79 = *(void *)v536;
      do
      {
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v536 != v79) {
            objc_enumerationMutation(obj);
          }
          uint64_t v81 = *(void *)(*((void *)&v535 + 1) + 8 * i);
          v82 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v73, v74, v75, v76, v77);
          v87 = objc_msgSend_objectForKeyedSubscript_(v82, v83, v81, v84, v85, v86);

          v93 = objc_msgSend_strokeGroups(v87, v88, v89, v90, v91, v92);
          v99 = objc_msgSend_mutableCopy(v93, v94, v95, v96, v97, v98);

          v110 = objc_msgSend_createdStrokeGroups(v87, v100, v101, v102, v103, v104);
          if (v110)
          {
            v111 = objc_msgSend_createdStrokeGroups(v87, v105, v106, v107, v108, v109);
            v117 = objc_msgSend_mutableCopy(v111, v112, v113, v114, v115, v116);
          }
          else
          {
            v117 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v105, v106, v107, v108, v109);
          }

          v128 = objc_msgSend_deletedStrokeGroups(v87, v118, v119, v120, v121, v122);
          if (v128)
          {
            v129 = objc_msgSend_deletedStrokeGroups(v87, v123, v124, v125, v126, v127);
            v135 = objc_msgSend_mutableCopy(v129, v130, v131, v132, v133, v134);
          }
          else
          {
            v135 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v123, v124, v125, v126, v127);
          }

          v549[0] = v99;
          v549[1] = v117;
          v549[2] = v135;
          v139 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v136, (uint64_t)v549, 3, v137, v138);
          objc_msgSend_setObject_forKeyedSubscript_(v519, v140, (uint64_t)v139, v81, v141, v142);
        }
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v535, (uint64_t)v550, 16, v77);
      }
      while (v78);
    }

    long long v533 = 0u;
    long long v534 = 0u;
    long long v531 = 0u;
    long long v532 = 0u;
    v148 = objc_msgSend_allValues(v509, v143, v144, v145, v146, v147);
    uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v149, (uint64_t)&v531, (uint64_t)v548, 16, v150);
    if (v156)
    {
      uint64_t v157 = *(void *)v532;
      do
      {
        for (uint64_t j = 0; j != v156; ++j)
        {
          if (*(void *)v532 != v157) {
            objc_enumerationMutation(v148);
          }
          v159 = *(void **)(*((void *)&v531 + 1) + 8 * j);
          v160 = objc_msgSend_strategyIdentifier(v159, v151, v152, v153, v154, v155);
          v165 = objc_msgSend_objectForKeyedSubscript_(v519, v161, (uint64_t)v160, v162, v163, v164);
          BOOL v166 = v165 == 0;

          if (v166)
          {
            v167 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v151, v152, v153, v154, v155);
            v547[0] = v167;
            v173 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v168, v169, v170, v171, v172);
            v547[1] = v173;
            v179 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v174, v175, v176, v177, v178);
            v547[2] = v179;
            v183 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v180, (uint64_t)v547, 3, v181, v182);
            v189 = objc_msgSend_strategyIdentifier(v159, v184, v185, v186, v187, v188);
            objc_msgSend_setObject_forKeyedSubscript_(v519, v190, (uint64_t)v183, (uint64_t)v189, v191, v192);
          }
        }
        uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v151, (uint64_t)&v531, (uint64_t)v548, 16, v155);
      }
      while (v156);
    }

    long long v530 = 0u;
    long long v528 = 0u;
    long long v529 = 0u;
    long long v527 = 0u;
    v198 = objc_msgSend_strokeGroups(self, v193, v194, v195, v196, v197);
    uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v199, (uint64_t)&v527, (uint64_t)v546, 16, v200);
    if (v206)
    {
      uint64_t v207 = *(void *)v528;
      do
      {
        for (uint64_t k = 0; k != v206; ++k)
        {
          if (*(void *)v528 != v207) {
            objc_enumerationMutation(v198);
          }
          v209 = *(void **)(*((void *)&v527 + 1) + 8 * k);
          v210 = NSNumber;
          uint64_t v211 = objc_msgSend_uniqueIdentifier(v209, v201, v202, v203, v204, v205);
          v216 = objc_msgSend_numberWithInteger_(v210, v212, v211, v213, v214, v215);
          v221 = objc_msgSend_objectForKeyedSubscript_(v509, v217, (uint64_t)v216, v218, v219, v220);

          v227 = objc_msgSend_strategyIdentifier(v209, v222, v223, v224, v225, v226);
          uint64_t v233 = objc_msgSend_classification(v209, v228, v229, v230, v231, v232);
          v237 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v221, v234, (uint64_t)v227, v233, v235, v236);

          if (v237)
          {
            objc_msgSend_removeObject_(v511, v238, (uint64_t)v209, v239, v240, v241);
            v247 = objc_msgSend_strategyIdentifier(v209, v242, v243, v244, v245, v246);
            v252 = objc_msgSend_objectForKeyedSubscript_(v519, v248, (uint64_t)v247, v249, v250, v251);
            v257 = objc_msgSend_objectAtIndexedSubscript_(v252, v253, 0, v254, v255, v256);
            objc_msgSend_removeObject_(v257, v258, (uint64_t)v209, v259, v260, v261);

            objc_msgSend_addObject_(v511, v262, (uint64_t)v237, v263, v264, v265);
            v271 = objc_msgSend_strategyIdentifier(v237, v266, v267, v268, v269, v270);
            v276 = objc_msgSend_objectForKeyedSubscript_(v519, v272, (uint64_t)v271, v273, v274, v275);
            v281 = objc_msgSend_objectAtIndexedSubscript_(v276, v277, 0, v278, v279, v280);
            objc_msgSend_addObject_(v281, v282, (uint64_t)v237, v283, v284, v285);

            if (objc_msgSend_containsObject_(v510, v286, (uint64_t)v209, v287, v288, v289))
            {
              objc_msgSend_removeObject_(v510, v290, (uint64_t)v209, v291, v292, v293);
              v299 = objc_msgSend_strategyIdentifier(v209, v294, v295, v296, v297, v298);
              v304 = objc_msgSend_objectForKeyedSubscript_(v519, v300, (uint64_t)v299, v301, v302, v303);
              v309 = objc_msgSend_objectAtIndexedSubscript_(v304, v305, 1, v306, v307, v308);
              objc_msgSend_removeObject_(v309, v310, (uint64_t)v209, v311, v312, v313);

              objc_msgSend_addObject_(v510, v314, (uint64_t)v237, v315, v316, v317);
              v323 = objc_msgSend_strategyIdentifier(v237, v318, v319, v320, v321, v322);
              v328 = objc_msgSend_objectForKeyedSubscript_(v519, v324, (uint64_t)v323, v325, v326, v327);
              v333 = objc_msgSend_objectAtIndexedSubscript_(v328, v329, 1, v330, v331, v332);
              objc_msgSend_addObject_(v333, v334, (uint64_t)v237, v335, v336, v337);
            }
            else
            {
              objc_msgSend_addObject_(v505, v290, (uint64_t)v209, v291, v292, v293);
              v323 = objc_msgSend_strategyIdentifier(v209, v338, v339, v340, v341, v342);
              v328 = objc_msgSend_objectForKeyedSubscript_(v519, v343, (uint64_t)v323, v344, v345, v346);
              v333 = objc_msgSend_objectAtIndexedSubscript_(v328, v347, 2, v348, v349, v350);
              objc_msgSend_addObject_(v333, v351, (uint64_t)v209, v352, v353, v354);
            }
          }
        }
        uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v201, (uint64_t)&v527, (uint64_t)v546, 16, v205);
      }
      while (v206);
    }

    v507 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v355, v356, v357, v358, v359);
    long long v525 = 0u;
    long long v526 = 0u;
    long long v523 = 0u;
    long long v524 = 0u;
    objc_msgSend_keyEnumerator(v519, v360, v361, v362, v363, v364);
    id v502 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v371 = objc_msgSend_countByEnumeratingWithState_objects_count_(v502, v365, (uint64_t)&v523, (uint64_t)v545, 16, v366);
    if (v371)
    {
      uint64_t v506 = *(void *)v524;
      do
      {
        id obja = 0;
        uint64_t v501 = v371;
        do
        {
          if (*(void *)v524 != v506) {
            objc_enumerationMutation(v502);
          }
          uint64_t v372 = *(void *)(*((void *)&v523 + 1) + 8 * (void)obja);
          v515 = objc_msgSend_objectForKeyedSubscript_(v519, v367, v372, v368, v369, v370);
          v378 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v373, v374, v375, v376, v377);
          v383 = objc_msgSend_objectForKeyedSubscript_(v378, v379, v372, v380, v381, v382);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          uint64_t v514 = v372;
          if (isKindOfClass)
          {
            v390 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v385, v386, v387, v388, v389);
            v395 = objc_msgSend_objectForKeyedSubscript_(v390, v391, v372, v392, v393, v394);

            v396 = [CHBottomUpStrokeGroupingResult alloc];
            v401 = objc_msgSend_objectAtIndexedSubscript_(v515, v397, 0, v398, v399, v400);
            v406 = objc_msgSend_objectAtIndexedSubscript_(v515, v402, 1, v403, v404, v405);
            v411 = objc_msgSend_objectAtIndexedSubscript_(v515, v407, 2, v408, v409, v410);
            v417 = objc_msgSend_substrokePlacementsByStrokeIdentifier(v395, v412, v413, v414, v415, v416);
            v419 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v396, v418, (uint64_t)v401, (uint64_t)v406, (uint64_t)v411, (uint64_t)v417);
            objc_msgSend_setObject_forKeyedSubscript_(v507, v420, (uint64_t)v419, v514, v421, v422);

            goto LABEL_121;
          }
          v423 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v385, v386, v387, v388, v389);
          v433 = objc_msgSend_objectForKeyedSubscript_(v423, v424, v372, v425, v426, v427);
          if (v433)
          {
            v503 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v428, v429, v430, v431, v432);
            v504 = objc_msgSend_objectForKeyedSubscript_(v503, v434, v372, v435, v436, v437);
            v443 = objc_msgSend_cachedAdjacencies(v504, v438, v439, v440, v441, v442);
            v521 = 0;
            uint64_t v522 = 0;
            v520 = &v521;
            v444 = v443 + 1;
            v445 = (void *)*v443;
            if ((void *)*v443 != v443 + 1)
            {
              v512 = v433;
              v513 = v423;
              v508 = v443 + 1;
              do
              {
                v446 = sub_1C49EB478(&v520, &v521, v543, &v542, v445 + 4);
                if (*v446)
                {
                  v447 = (void *)v445[1];
                  if (!v447) {
                    goto LABEL_113;
                  }
                  goto LABEL_103;
                }
                v448 = operator new(0x50uLL);
                v539 = v448;
                v540 = &v521;
                char v541 = 0;
                v448[5] = 0;
                v448[4] = v448 + 5;
                v448[6] = 0;
                sub_1C499A568(v448 + 4, (void *)v445[4], v445 + 5);
                v448[7] = 0;
                v448[8] = 0;
                v448[9] = 0;
                uint64_t v449 = v445[7];
                uint64_t v450 = v445[8];
                v543[1] = v448 + 7;
                char v544 = 0;
                if (v450 != v449)
                {
                  if (0xCCCCCCCCCCCCCCCDLL * ((v450 - v449) >> 3) >= 0x666666666666667) {
                    sub_1C494A220();
                  }
                  v451 = (char *)operator new(v450 - v449);
                  v448[7] = v451;
                  v448[8] = v451;
                  v448[9] = &v451[8 * ((v450 - v449) >> 3)];
                  uint64_t v452 = (uint64_t)v451;
                  while (1)
                  {
                    *(_OWORD *)uint64_t v452 = 0u;
                    *(_OWORD *)(v452 + 16) = 0u;
                    *(_DWORD *)(v452 + 32) = *(_DWORD *)(v449 + 32);
                    size_t prime = *(void *)(v449 + 8);
                    if (prime == 1)
                    {
                      size_t prime = 2;
                    }
                    else if ((prime & (prime - 1)) != 0)
                    {
                      size_t prime = std::__next_prime(*(void *)(v449 + 8));
                      int8x8_t v455 = *(int8x8_t *)(v452 + 8);
                      BOOL v456 = prime >= *(void *)&v455;
                      if (prime <= *(void *)&v455)
                      {
LABEL_71:
                        if (v456) {
                          goto LABEL_64;
                        }
                        unint64_t v457 = vcvtps_u32_f32((float)*(unint64_t *)(v452 + 24) / *(float *)(v452 + 32));
                        if (*(void *)&v455 < 3uLL
                          || (uint8x8_t v458 = (uint8x8_t)vcnt_s8(v455), v458.i16[0] = vaddlv_u8(v458), v458.u32[0] > 1uLL))
                        {
                          unint64_t v457 = std::__next_prime(v457);
                        }
                        else
                        {
                          uint64_t v459 = 1 << -(char)__clz(v457 - 1);
                          if (v457 >= 2) {
                            unint64_t v457 = v459;
                          }
                        }
                        if (prime <= v457) {
                          size_t prime = v457;
                        }
                        if (prime >= *(void *)&v455) {
                          goto LABEL_64;
                        }
                      }
                    }
                    else
                    {
                      int8x8_t v455 = 0;
                      BOOL v456 = 1;
                      if (!prime) {
                        goto LABEL_71;
                      }
                    }
                    sub_1C4949C24(v452, prime);
LABEL_64:
                    for (m = *(void **)(v449 + 16); m; m = (void *)*m)
                      sub_1C49EBE48(v452, m + 2, (_OWORD *)m + 1);
                    v449 += 40;
                    v452 += 40;
                    if (v449 == v450)
                    {
                      v448[8] = v452;
                      v448 = v539;
                      uint64_t v372 = v514;
                      v444 = v508;
                      break;
                    }
                  }
                }
                char v541 = 1;
                uint64_t v460 = v543[0];
                void *v448 = 0;
                v448[1] = 0;
                v448[2] = v460;
                void *v446 = v448;
                v433 = v512;
                v423 = v513;
                if (*v520)
                {
                  v520 = (void *)*v520;
                  v448 = (void *)*v446;
                }
                v461 = v521;
                BOOL v462 = v448 == v521;
                *((unsigned char *)v448 + 24) = v448 == v521;
                if (v462)
                {
LABEL_102:
                  ++v522;
                  v447 = (void *)v445[1];
                  if (!v447) {
                    goto LABEL_113;
                  }
                  goto LABEL_103;
                }
                while (1)
                {
                  uint64_t v463 = v448[2];
                  if (*(unsigned char *)(v463 + 24)) {
                    goto LABEL_102;
                  }
                  v464 = *(void **)(v463 + 16);
                  uint64_t v465 = *v464;
                  if (*v464 != v463) {
                    break;
                  }
                  uint64_t v468 = v464[1];
                  if (!v468 || (int v469 = *(unsigned __int8 *)(v468 + 24), v466 = (unsigned char *)(v468 + 24), v469))
                  {
                    if (*(void **)v463 == v448)
                    {
                      *(unsigned char *)(v463 + 24) = 1;
                      *((unsigned char *)v464 + 24) = 0;
                      uint64_t v472 = *(void *)(v463 + 8);
                      void *v464 = v472;
                      if (v472) {
                        goto LABEL_100;
                      }
                    }
                    else
                    {
                      v470 = *(uint64_t **)(v463 + 8);
                      uint64_t v471 = *v470;
                      *(void *)(v463 + 8) = *v470;
                      if (v471)
                      {
                        *(void *)(v471 + 16) = v463;
                        v464 = *(void **)(v463 + 16);
                      }
                      v470[2] = (uint64_t)v464;
                      *(void *)(*(void *)(v463 + 16) + 8 * (**(void **)(v463 + 16) != v463)) = v470;
                      uint64_t *v470 = v463;
                      *(void *)(v463 + 16) = v470;
                      v464 = (void *)v470[2];
                      uint64_t v463 = *v464;
                      *((unsigned char *)v470 + 24) = 1;
                      *((unsigned char *)v464 + 24) = 0;
                      uint64_t v472 = *(void *)(v463 + 8);
                      void *v464 = v472;
                      if (v472) {
LABEL_100:
                      }
                        *(void *)(v472 + 16) = v464;
                    }
                    *(void *)(v463 + 16) = v464[2];
                    *(void *)(v464[2] + 8 * (*(void *)v464[2] != (void)v464)) = v463;
                    *(void *)(v463 + 8) = v464;
                    v464[2] = v463;
                    goto LABEL_102;
                  }
LABEL_88:
                  *(unsigned char *)(v463 + 24) = 1;
                  v448 = v464;
                  *((unsigned char *)v464 + 24) = v464 == v461;
                  unsigned char *v466 = 1;
                  if (v464 == v461) {
                    goto LABEL_102;
                  }
                }
                if (v465)
                {
                  int v467 = *(unsigned __int8 *)(v465 + 24);
                  v466 = (unsigned char *)(v465 + 24);
                  if (!v467) {
                    goto LABEL_88;
                  }
                }
                if (*(void **)v463 == v448)
                {
                  uint64_t v474 = v448[1];
                  *(void *)uint64_t v463 = v474;
                  if (v474)
                  {
                    *(void *)(v474 + 16) = v463;
                    v464 = *(void **)(v463 + 16);
                  }
                  v448[2] = v464;
                  *(void *)(*(void *)(v463 + 16) + 8 * (**(void **)(v463 + 16) != v463)) = v448;
                  v448[1] = v463;
                  *(void *)(v463 + 16) = v448;
                  v464 = (void *)v448[2];
                }
                else
                {
                  v448 = (void *)v448[2];
                }
                *((unsigned char *)v448 + 24) = 1;
                *((unsigned char *)v464 + 24) = 0;
                v475 = (uint64_t *)v464[1];
                uint64_t v476 = *v475;
                v464[1] = *v475;
                if (v476) {
                  *(void *)(v476 + 16) = v464;
                }
                v475[2] = v464[2];
                *(void *)(v464[2] + 8 * (*(void *)v464[2] != (void)v464)) = v475;
                uint64_t *v475 = (uint64_t)v464;
                v464[2] = v475;
                ++v522;
                v447 = (void *)v445[1];
                if (!v447)
                {
                  do
                  {
LABEL_113:
                    v473 = (void *)v445[2];
                    BOOL v462 = *v473 == (void)v445;
                    v445 = v473;
                  }
                  while (!v462);
                  goto LABEL_53;
                }
                do
                {
LABEL_103:
                  v473 = v447;
                  v447 = (void *)*v447;
                }
                while (v447);
LABEL_53:
                v445 = v473;
              }
              while (v473 != v444);
            }

            uint64_t v371 = v501;
          }
          else
          {
            v521 = 0;
            uint64_t v522 = 0;
            v520 = &v521;
          }

          v477 = [CHStrokeGroupingResult alloc];
          v482 = objc_msgSend_objectAtIndexedSubscript_(v515, v478, 0, v479, v480, v481);
          v487 = objc_msgSend_objectAtIndexedSubscript_(v515, v483, 1, v484, v485, v486);
          v492 = objc_msgSend_objectAtIndexedSubscript_(v515, v488, 2, v489, v490, v491);
          v494 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v477, v493, (uint64_t)v482, (uint64_t)v487, (uint64_t)v492, (uint64_t)&v520);
          objc_msgSend_setObject_forKeyedSubscript_(v507, v495, (uint64_t)v494, v372, v496, v497);

          sub_1C49EB298((uint64_t)&v520, v521);
LABEL_121:

          id obja = (char *)obja + 1;
        }
        while (obja != (id)v371);
        uint64_t v371 = objc_msgSend_countByEnumeratingWithState_objects_count_(v502, v367, (uint64_t)&v523, (uint64_t)v545, 16, v370);
      }
      while (v371);
    }

    v498 = [CHMergedStrokeGroupingResults alloc];
    v36 = (CHMergedStrokeGroupingResults *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(v498, v499, (uint64_t)v511, (uint64_t)v510, (uint64_t)v505, (uint64_t)v507);
  }
  else
  {
    v36 = self;
  }

  return v36;
}

- (id)strokeGroupsOfClass:(int64_t)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, a3, v3, v4, v5);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v14 = objc_msgSend_groupingResultsByStrategyIdentifier(self, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_allValues(v14, v15, v16, v17, v18, v19);

  obuint64_t j = v20;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v44, (uint64_t)v48, 16, v22);
  if (v28)
  {
    uint64_t v29 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = objc_msgSend_strokeGroups(*(void **)(*((void *)&v44 + 1) + 8 * i), v23, v24, v25, v26, v27);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = sub_1C49E52A8;
        v43[3] = &unk_1E64E1CF0;
        v43[4] = a3;
        v36 = objc_msgSend_objectsPassingTest_(v31, v32, (uint64_t)v43, v33, v34, v35);

        objc_msgSend_unionSet_(v8, v37, (uint64_t)v36, v38, v39, v40);
      }
      uint64_t v20 = obj;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v44, (uint64_t)v48, 16, v27);
    }
    while (v28);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  uint64_t v9 = objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)v9, @"strokeGroups", v11, v12);

  objc_msgSend_encodeObject_forKey_(v16, v13, (uint64_t)self->_groupingResultsByStrategyIdentifier, @"groupingResultsByStrategyIdentifier", v14, v15);
}

- (CHMergedStrokeGroupingResults)initWithCoder:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v37, 3, v7, v8);
  uint64_t v14 = objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13);
  uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"strokeGroups", v16, v17);

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v36, 3, v21, v22);
  uint64_t v28 = objc_msgSend_setWithArray_(v19, v24, (uint64_t)v23, v25, v26, v27);
  uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, @"groupingResultsByStrategyIdentifier", v30, v31);

  uint64_t v34 = (CHMergedStrokeGroupingResults *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(self, v33, (uint64_t)v18, (uint64_t)v18, 0, (uint64_t)v32);
  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)groupingResultsByStrategyIdentifier
{
  return self->_groupingResultsByStrategyIdentifier;
}

- (void).cxx_destruct
{
}

@end