@interface LBFTrialStatusDetector
- (LBFTrialStatusDetector)init;
- (NSDictionary)observedTrialStatusHolder;
- (id)getTrialStatus:(id)a3 deploymentId:(id)a4;
@end

@implementation LBFTrialStatusDetector

- (LBFTrialStatusDetector)init
{
  uint64_t v501 = *MEMORY[0x263EF8340];
  v492.receiver = self;
  v492.super_class = (Class)LBFTrialStatusDetector;
  v2 = [(LBFTrialStatusDetector *)&v492 init];
  v3 = v2;
  if (v2)
  {
    v471 = v2;
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = objc_msgSend_sharedInstance(LBFEventManager, v5, v6, v7, v8);
    v473 = objc_msgSend_ensureBiomeManagerTrial(v9, v10, v11, v12, v13);

    v18 = objc_msgSend_sharedInstance(LBFEventManager, v14, v15, v16, v17);
    v472 = objc_msgSend_ensureBiomeManagerMLRuntimed(v18, v19, v20, v21, v22);

    uint64_t v27 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v23, v24, v25, v26, -7776000.0);
    uint64_t v32 = objc_msgSend_now(MEMORY[0x263EFF910], v28, v29, v30, v31);
    v33 = LBFLogContextTrialStatusDetector;
    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v498 = v27;
      __int16 v499 = 2112;
      uint64_t v500 = v32;
      _os_log_impl(&dword_254547000, v33, OS_LOG_TYPE_INFO, "Searching for events for Trial detection from %@ to %@.", buf, 0x16u);
    }
    v36 = objc_msgSend_readData_endDate_(v473, v34, v27, v32, v35);
    v474 = (void *)v27;
    v470 = (void *)v32;
    v476 = objc_msgSend_readData_endDate_(v472, v37, v27, v32, v38);
    long long v488 = 0u;
    long long v489 = 0u;
    long long v490 = 0u;
    long long v491 = 0u;
    id obj = v36;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v488, (uint64_t)v496, 16);
    v481 = v4;
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v489;
      uint64_t v482 = *(void *)v489;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v489 != v42) {
            objc_enumerationMutation(obj);
          }
          v44 = *(void **)(*((void *)&v488 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v46 = v44;
            v51 = objc_msgSend_trialIdentifiers(v46, v47, v48, v49, v50);
            v56 = objc_msgSend_bmltIdentifiers(v51, v52, v53, v54, v55);
            v61 = objc_msgSend_trialTaskID(v56, v57, v58, v59, v60);
            v66 = v61;
            if (v61)
            {
              id v67 = v61;
            }
            else
            {
              v68 = objc_msgSend_trialIdentifiers(v46, v62, v63, v64, v65);
              v73 = objc_msgSend_experimentIdentifiers(v68, v69, v70, v71, v72);
              objc_msgSend_trialExperimentID(v73, v74, v75, v76, v77);
              id v67 = (id)objc_claimAutoreleasedReturnValue();
            }
            v82 = objc_msgSend_trialIdentifiers(v46, v78, v79, v80, v81);
            v87 = objc_msgSend_bmltIdentifiers(v82, v83, v84, v85, v86);
            v92 = objc_msgSend_trialDeploymentID(v87, v88, v89, v90, v91);
            v97 = v92;
            if (v92)
            {
              id v98 = v92;
            }
            else
            {
              v99 = objc_msgSend_trialIdentifiers(v46, v93, v94, v95, v96);
              v104 = objc_msgSend_experimentIdentifiers(v99, v100, v101, v102, v103);
              objc_msgSend_trialDeploymentID(v104, v105, v106, v107, v108);
              id v98 = (id)objc_claimAutoreleasedReturnValue();

              v4 = v481;
            }

            if (v67 && v98)
            {
              v112 = objc_msgSend_objectForKey_(v4, v109, (uint64_t)v67, v110, v111);

              if (!v112)
              {
                id v116 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                objc_msgSend_setObject_forKeyedSubscript_(v4, v117, (uint64_t)v116, (uint64_t)v67, v118);
              }
              v119 = objc_msgSend_objectForKeyedSubscript_(v4, v113, (uint64_t)v67, v114, v115);
              v123 = objc_msgSend_objectForKey_(v119, v120, (uint64_t)v98, v121, v122);

              if (!v123)
              {
                v128 = [LBFObservedTrialStatus alloc];
                v131 = objc_msgSend_initWithObservedStatus_deploymentId_(v128, v129, (uint64_t)v67, (uint64_t)v98, v130);
                v135 = objc_msgSend_objectForKeyedSubscript_(v4, v132, (uint64_t)v67, v133, v134);
                objc_msgSend_setObject_forKeyedSubscript_(v135, v136, (uint64_t)v131, (uint64_t)v98, v137);
              }
              v138 = objc_msgSend_timestamp(v46, v124, v125, v126, v127);
              v142 = objc_msgSend_objectForKeyedSubscript_(v4, v139, (uint64_t)v67, v140, v141);
              v146 = objc_msgSend_objectForKeyedSubscript_(v142, v143, (uint64_t)v98, v144, v145);
              objc_msgSend_setLastObservedTimestamp_(v146, v147, (uint64_t)v138, v148, v149);

              int v154 = objc_msgSend_eventType(v46, v150, v151, v152, v153);
              switch(v154)
              {
                case 1:
                  if (objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158))
                  {
                    v218 = objc_msgSend_numberWithBool_(NSNumber, v215, 1, v216, v217);
                    v222 = objc_msgSend_objectForKeyedSubscript_(v4, v219, (uint64_t)v67, v220, v221);
                    v226 = objc_msgSend_objectForKeyedSubscript_(v222, v223, (uint64_t)v98, v224, v225);
                    objc_msgSend_setIsAllocated_(v226, v227, (uint64_t)v218, v228, v229);

                    v177 = objc_msgSend_objectForKeyedSubscript_(v4, v230, (uint64_t)v67, v231, v232);
                    v181 = objc_msgSend_objectForKeyedSubscript_(v177, v233, (uint64_t)v98, v234, v235);
                    objc_msgSend_setIsAllocated_implicit_(v181, v236, 1, v237, v238);
LABEL_32:
                  }
                  else
                  {
                    v264 = objc_msgSend_numberWithBool_(NSNumber, v215, 0, v216, v217);
                    v268 = objc_msgSend_objectForKeyedSubscript_(v4, v265, (uint64_t)v67, v266, v267);
                    v272 = objc_msgSend_objectForKeyedSubscript_(v268, v269, (uint64_t)v98, v270, v271);
                    objc_msgSend_setIsAllocated_(v272, v273, (uint64_t)v264, v274, v275);

                    v279 = objc_msgSend_objectForKeyedSubscript_(v4, v276, (uint64_t)v67, v277, v278);
                    v283 = objc_msgSend_objectForKeyedSubscript_(v279, v280, (uint64_t)v98, v281, v282);
                    objc_msgSend_setIsAllocated_implicit_(v283, v284, 0, v285, v286);

                    uint64_t v287 = LBFLogContextTrialStatusDetector;
                    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v498 = (uint64_t)v67;
                      __int16 v499 = 2112;
                      uint64_t v500 = (uint64_t)v98;
                      v213 = v287;
                      v214 = "BMLighthouseLedgerTrialdEventEventTypeAllocation failed experimentOrTaskId:%@ deploymentId:%@";
LABEL_39:
                      _os_log_impl(&dword_254547000, v213, OS_LOG_TYPE_INFO, v214, buf, 0x16u);
                    }
                  }
                  break;
                case 3:
                  char v185 = objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158);
                  v189 = objc_msgSend_numberWithBool_(NSNumber, v186, 0, v187, v188);
                  v193 = objc_msgSend_objectForKeyedSubscript_(v4, v190, (uint64_t)v67, v191, v192);
                  v197 = objc_msgSend_objectForKeyedSubscript_(v193, v194, (uint64_t)v98, v195, v196);
                  objc_msgSend_setIsActivated_(v197, v198, (uint64_t)v189, v199, v200);

                  v4 = v481;
                  v204 = objc_msgSend_objectForKeyedSubscript_(v481, v201, (uint64_t)v67, v202, v203);
                  v208 = objc_msgSend_objectForKeyedSubscript_(v204, v205, (uint64_t)v98, v206, v207);
                  objc_msgSend_setIsActivated_implicit_(v208, v209, 0, v210, v211);

                  if ((v185 & 1) == 0)
                  {
                    uint64_t v212 = LBFLogContextTrialStatusDetector;
                    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v498 = (uint64_t)v67;
                      __int16 v499 = 2112;
                      uint64_t v500 = (uint64_t)v98;
                      v213 = v212;
                      v214 = "BMLighthouseLedgerTrialdEventEventTypeDeactivation failed experimentOrTaskId:%@ deploymentId:%@";
                      goto LABEL_39;
                    }
                  }
                  break;
                case 2:
                  if (objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158))
                  {
                    v162 = objc_msgSend_numberWithBool_(NSNumber, v159, 1, v160, v161);
                    v166 = objc_msgSend_objectForKeyedSubscript_(v4, v163, (uint64_t)v67, v164, v165);
                    v170 = objc_msgSend_objectForKeyedSubscript_(v166, v167, (uint64_t)v98, v168, v169);
                    objc_msgSend_setIsActivated_(v170, v171, (uint64_t)v162, v172, v173);

                    v177 = objc_msgSend_objectForKeyedSubscript_(v4, v174, (uint64_t)v67, v175, v176);
                    v181 = objc_msgSend_objectForKeyedSubscript_(v177, v178, (uint64_t)v98, v179, v180);
                    objc_msgSend_setIsActivated_implicit_(v181, v182, 1, v183, v184);
                    goto LABEL_32;
                  }
                  v240 = objc_msgSend_numberWithBool_(NSNumber, v159, 0, v160, v161);
                  v244 = objc_msgSend_objectForKeyedSubscript_(v4, v241, (uint64_t)v67, v242, v243);
                  v248 = objc_msgSend_objectForKeyedSubscript_(v244, v245, (uint64_t)v98, v246, v247);
                  objc_msgSend_setIsActivated_(v248, v249, (uint64_t)v240, v250, v251);

                  v255 = objc_msgSend_objectForKeyedSubscript_(v4, v252, (uint64_t)v67, v253, v254);
                  v259 = objc_msgSend_objectForKeyedSubscript_(v255, v256, (uint64_t)v98, v257, v258);
                  objc_msgSend_setIsActivated_implicit_(v259, v260, 0, v261, v262);

                  uint64_t v263 = LBFLogContextTrialStatusDetector;
                  if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v498 = (uint64_t)v67;
                    __int16 v499 = 2112;
                    uint64_t v500 = (uint64_t)v98;
                    v213 = v263;
                    v214 = "BMLighthouseLedgerTrialdEventEventTypeActivation failed experimentOrTaskId:%@ deploymentId:%@";
                    goto LABEL_39;
                  }
                  break;
                default:
                  v239 = (void *)LBFLogContextTrialStatusDetector;
                  if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_ERROR)) {
                    sub_2545869A4(v494, v239, v46, v495);
                  }
                  break;
              }
            }

            uint64_t v42 = v482;
            continue;
          }
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v488, (uint64_t)v496, 16);
      }
      while (v41);
    }

    long long v486 = 0u;
    long long v487 = 0u;
    long long v484 = 0u;
    long long v485 = 0u;
    id v288 = v476;
    uint64_t v290 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v289, (uint64_t)&v484, (uint64_t)v493, 16);
    v291 = v474;
    if (!v290) {
      goto LABEL_75;
    }
    uint64_t v292 = v290;
    uint64_t v293 = *(void *)v485;
    id v477 = v288;
    uint64_t v478 = *(void *)v485;
LABEL_45:
    uint64_t v294 = 0;
    uint64_t v479 = v292;
    while (1)
    {
      if (*(void *)v485 != v293) {
        objc_enumerationMutation(v288);
      }
      v295 = *(void **)(*((void *)&v484 + 1) + 8 * v294);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_73;
      }
      id v297 = v295;
      v302 = objc_msgSend_trialIdentifiers(v297, v298, v299, v300, v301);
      v307 = objc_msgSend_bmltIdentifiers(v302, v303, v304, v305, v306);
      v312 = objc_msgSend_trialTaskID(v307, v308, v309, v310, v311);
      v317 = v312;
      if (v312)
      {
        id v318 = v312;
      }
      else
      {
        v319 = objc_msgSend_trialIdentifiers(v297, v313, v314, v315, v316);
        v324 = objc_msgSend_experimentIdentifiers(v319, v320, v321, v322, v323);
        objc_msgSend_trialExperimentID(v324, v325, v326, v327, v328);
        id v318 = (id)objc_claimAutoreleasedReturnValue();

        v4 = v481;
      }

      v333 = objc_msgSend_trialIdentifiers(v297, v329, v330, v331, v332);
      v338 = objc_msgSend_bmltIdentifiers(v333, v334, v335, v336, v337);
      v343 = objc_msgSend_trialDeploymentID(v338, v339, v340, v341, v342);
      v348 = v343;
      v483 = v297;
      if (v343)
      {
        id v349 = v343;
      }
      else
      {
        v350 = objc_msgSend_trialIdentifiers(v297, v344, v345, v346, v347);
        v355 = objc_msgSend_experimentIdentifiers(v350, v351, v352, v353, v354);
        objc_msgSend_trialDeploymentID(v355, v356, v357, v358, v359);
        id v349 = (id)objc_claimAutoreleasedReturnValue();

        v4 = v481;
      }

      if (v318 && v349)
      {
        v363 = objc_msgSend_objectForKey_(v4, v360, (uint64_t)v318, v361, v362);

        if (!v363)
        {
          id v367 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          objc_msgSend_setObject_forKeyedSubscript_(v4, v368, (uint64_t)v367, (uint64_t)v318, v369);
        }
        v370 = objc_msgSend_objectForKeyedSubscript_(v4, v364, (uint64_t)v318, v365, v366);
        v374 = objc_msgSend_objectForKey_(v370, v371, (uint64_t)v349, v372, v373);

        if (!v374)
        {
          v378 = [LBFObservedTrialStatus alloc];
          v381 = objc_msgSend_initWithObservedStatus_deploymentId_(v378, v379, (uint64_t)v318, (uint64_t)v349, v380);
          v385 = objc_msgSend_objectForKeyedSubscript_(v4, v382, (uint64_t)v318, v383, v384);
          objc_msgSend_setObject_forKeyedSubscript_(v385, v386, (uint64_t)v381, (uint64_t)v349, v387);
        }
        v388 = objc_msgSend_objectForKeyedSubscript_(v4, v375, (uint64_t)v318, v376, v377);
        v392 = objc_msgSend_objectForKeyedSubscript_(v388, v389, (uint64_t)v349, v390, v391);
        if (objc_msgSend_isActivated_implicit(v392, v393, v394, v395, v396))
        {
          v400 = objc_msgSend_objectForKeyedSubscript_(v4, v397, (uint64_t)v318, v398, v399);
          v404 = objc_msgSend_objectForKeyedSubscript_(v400, v401, (uint64_t)v349, v402, v403);
          char isAllocated_implicit = objc_msgSend_isAllocated_implicit(v404, v405, v406, v407, v408);

          v4 = v481;
          if (isAllocated_implicit) {
            goto LABEL_72;
          }
        }
        else
        {
        }
        v413 = objc_msgSend_objectForKeyedSubscript_(v4, v410, (uint64_t)v318, v411, v412);
        v417 = objc_msgSend_objectForKeyedSubscript_(v413, v414, (uint64_t)v349, v415, v416);
        uint64_t v422 = objc_msgSend_lastObservedTimestamp(v417, v418, v419, v420, v421);
        if (!v422)
        {

LABEL_69:
          v445 = LBFLogContextTrialStatusDetector;
          if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v498 = (uint64_t)v318;
            __int16 v499 = 2112;
            uint64_t v500 = (uint64_t)v349;
            _os_log_impl(&dword_254547000, v445, OS_LOG_TYPE_INFO, "set implicit trial status experimentOrTaskId:%@ deploymentId:%@", buf, 0x16u);
          }
          v449 = objc_msgSend_objectForKeyedSubscript_(v4, v446, (uint64_t)v318, v447, v448);
          v453 = objc_msgSend_objectForKeyedSubscript_(v449, v450, (uint64_t)v349, v451, v452);
          objc_msgSend_setIsActivated_implicit_(v453, v454, 1, v455, v456);

          v460 = objc_msgSend_objectForKeyedSubscript_(v4, v457, (uint64_t)v318, v458, v459);
          v464 = objc_msgSend_objectForKeyedSubscript_(v460, v461, (uint64_t)v349, v462, v463);
          objc_msgSend_setIsAllocated_implicit_(v464, v465, 1, v466, v467);

          id v288 = v477;
          goto LABEL_72;
        }
        v427 = (void *)v422;
        v428 = objc_msgSend_timestamp(v483, v423, v424, v425, v426);
        v432 = objc_msgSend_objectForKeyedSubscript_(v4, v429, (uint64_t)v318, v430, v431);
        v436 = objc_msgSend_objectForKeyedSubscript_(v432, v433, (uint64_t)v349, v434, v435);
        v441 = objc_msgSend_lastObservedTimestamp(v436, v437, v438, v439, v440);
        uint64_t v475 = objc_msgSend_compare_(v428, v442, (uint64_t)v441, v443, v444);

        id v288 = v477;
        v291 = v474;

        v4 = v481;
        if (v475 == 1) {
          goto LABEL_69;
        }
      }
LABEL_72:

      uint64_t v293 = v478;
      uint64_t v292 = v479;
LABEL_73:
      if (v292 == ++v294)
      {
        uint64_t v292 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v296, (uint64_t)&v484, (uint64_t)v493, 16);
        if (!v292)
        {
LABEL_75:

          v3 = v471;
          observedTrialStatusHolder = v471->_observedTrialStatusHolder;
          v471->_observedTrialStatusHolder = v4;

          return v3;
        }
        goto LABEL_45;
      }
    }
  }
  return v3;
}

- (id)getTrialStatus:(id)a3 deploymentId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(self->_observedTrialStatusHolder, v8, (uint64_t)v6, v9, v10);

  if (v11
    && (objc_msgSend_objectForKeyedSubscript_(self->_observedTrialStatusHolder, v12, (uint64_t)v6, v13, v14),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v15, v16, (uint64_t)v7, v17, v18),
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v15,
        v19))
  {
    v23 = objc_msgSend_objectForKeyedSubscript_(self->_observedTrialStatusHolder, v20, (uint64_t)v6, v21, v22);
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v7, v25, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (NSDictionary)observedTrialStatusHolder
{
  return self->_observedTrialStatusHolder;
}

- (void).cxx_destruct
{
}

@end