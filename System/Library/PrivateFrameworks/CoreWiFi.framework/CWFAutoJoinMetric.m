@interface CWFAutoJoinMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)autoHotspotResult;
- (BOOL)autoHotspotWasAborted;
- (BOOL)autoHotspotWasAttempted;
- (BOOL)didDeferJoinToDiscoverMorePreferredNetwork;
- (BOOL)didDetectColocatedNetworkEnvironment;
- (BOOL)didFallbackToJoinLessPreferredNetwork;
- (BOOL)didIncludeRemainingNon2GHzChannels;
- (BOOL)didPerformSeamlessSSIDTransition;
- (BOOL)didTriggerReassoc;
- (BOOL)didUseLocationOptimizedChannelList;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinMetric:(id)a3;
- (BOOL)result;
- (BOOL)was6EDisabled;
- (BOOL)was6EPreferOn;
- (BOOL)was6GHzDeprioritized;
- (BOOL)wasAborted;
- (BOOL)wasAlreadyAssociated;
- (BOOL)wasCancelled;
- (BOOL)wasDiscoveredViaFILSD;
- (BOOL)wasDiscoveredViaRNR;
- (CWFAutoJoinMetric)initWithCoder:(id)a3;
- (CWFAutoJoinParameters)autoJoinParameters;
- (CWFScanResult)associatedNetwork;
- (CWFScanResult)network;
- (NSArray)GASQueryErrors;
- (NSArray)GASQueryNetworks;
- (NSArray)autoHotspotJoinErrors;
- (NSArray)candidates;
- (NSArray)followup6GHzScanChannels;
- (NSArray)joinErrors;
- (NSArray)knownNetworks;
- (NSArray)optimizedChannelList;
- (NSArray)preAssociationScanChannels;
- (NSArray)preferredChannelList;
- (NSArray)recentChannelList;
- (NSArray)remainingChannelList;
- (NSArray)scanChannels;
- (NSArray)scanErrors;
- (NSDictionary)coreAnalyticsEventPayload;
- (NSError)autoHotspotBrowseError;
- (NSError)autoHotspotError;
- (NSError)error;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (SFRemoteHotspotDevice)hotspot;
- (id)JSONCompatibleKeyValueMap;
- (id)__descriptionForError:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)autoHotspotMode;
- (int64_t)previousNonRetryAutoJoinTrigger;
- (int64_t)retrySchedule;
- (unint64_t)GASQueryDuration;
- (unint64_t)autoHotspotBrowseDuration;
- (unint64_t)autoHotspotDuration;
- (unint64_t)autoHotspotJoinDuration;
- (unint64_t)duration;
- (unint64_t)durationFromDeviceUnlockTrigger;
- (unint64_t)durationFromDisplayOnTrigger;
- (unint64_t)durationFromLinkDownTrigger;
- (unint64_t)durationFromNonRetryAutoJoinTrigger;
- (unint64_t)durationFromWiFiPowerOnTrigger;
- (unint64_t)followup6GHzScanDuration;
- (unint64_t)hash;
- (unint64_t)joinDuration;
- (unint64_t)preAssociationScanDuration;
- (unint64_t)retryScheduleIndex;
- (unint64_t)scanDuration;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedNetwork:(id)a3;
- (void)setAutoHotspotBrowseDuration:(unint64_t)a3;
- (void)setAutoHotspotBrowseError:(id)a3;
- (void)setAutoHotspotDuration:(unint64_t)a3;
- (void)setAutoHotspotError:(id)a3;
- (void)setAutoHotspotJoinDuration:(unint64_t)a3;
- (void)setAutoHotspotJoinErrors:(id)a3;
- (void)setAutoHotspotMode:(int64_t)a3;
- (void)setAutoHotspotResult:(BOOL)a3;
- (void)setAutoHotspotWasAborted:(BOOL)a3;
- (void)setAutoHotspotWasAttempted:(BOOL)a3;
- (void)setAutoJoinParameters:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setDidDeferJoinToDiscoverMorePreferredNetwork:(BOOL)a3;
- (void)setDidDetectColocatedNetworkEnvironment:(BOOL)a3;
- (void)setDidFallbackToJoinLessPreferredNetwork:(BOOL)a3;
- (void)setDidIncludeRemainingNon2GHzChannels:(BOOL)a3;
- (void)setDidPerformSeamlessSSIDTransition:(BOOL)a3;
- (void)setDidTriggerReassoc:(BOOL)a3;
- (void)setDidUseLocationOptimizedChannelList:(BOOL)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setDurationFromDeviceUnlockTrigger:(unint64_t)a3;
- (void)setDurationFromDisplayOnTrigger:(unint64_t)a3;
- (void)setDurationFromLinkDownTrigger:(unint64_t)a3;
- (void)setDurationFromNonRetryAutoJoinTrigger:(unint64_t)a3;
- (void)setDurationFromWiFiPowerOnTrigger:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setFollowup6GHzScanChannels:(id)a3;
- (void)setFollowup6GHzScanDuration:(unint64_t)a3;
- (void)setGASQueryDuration:(unint64_t)a3;
- (void)setGASQueryErrors:(id)a3;
- (void)setGASQueryNetworks:(id)a3;
- (void)setHotspot:(id)a3;
- (void)setJoinDuration:(unint64_t)a3;
- (void)setJoinErrors:(id)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setOptimizedChannelList:(id)a3;
- (void)setPreAssociationScanChannels:(id)a3;
- (void)setPreAssociationScanDuration:(unint64_t)a3;
- (void)setPreferredChannelList:(id)a3;
- (void)setPreviousNonRetryAutoJoinTrigger:(int64_t)a3;
- (void)setRecentChannelList:(id)a3;
- (void)setRemainingChannelList:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setRetrySchedule:(int64_t)a3;
- (void)setRetryScheduleIndex:(unint64_t)a3;
- (void)setScanChannels:(id)a3;
- (void)setScanDuration:(unint64_t)a3;
- (void)setScanErrors:(id)a3;
- (void)setWas6EDisabled:(BOOL)a3;
- (void)setWas6EPreferOn:(BOOL)a3;
- (void)setWas6GHzDeprioritized:(BOOL)a3;
- (void)setWasAborted:(BOOL)a3;
- (void)setWasAlreadyAssociated:(BOOL)a3;
- (void)setWasCancelled:(BOOL)a3;
- (void)setWasDiscoveredViaFILSD:(BOOL)a3;
- (void)setWasDiscoveredViaRNR:(BOOL)a3;
@end

@implementation CWFAutoJoinMetric

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = objc_msgSend_coreAnalyticsEventPayload(self, v4, v5, v6, v7);
  if (v12) {
    objc_msgSend_addEntriesFromDictionary_(v3, v8, (uint64_t)v12, v10, v11);
  }
  v13 = objc_msgSend_optimizedChannelList(self, v8, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"optimized_channel_list", v15);

  v19 = sub_1B4F59CC8(v3, 0, 1u);
  if (v19)
  {
    v20 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v19, v17, v18);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)__descriptionForError:(id)a3
{
  id v3 = a3;
  v8 = objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13 = objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x1E4F28568], v11, v12);

  uint64_t v18 = objc_msgSend_userInfo(v3, v14, v15, v16, v17);
  v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E4F28A50], v20, v21);

  v27 = objc_msgSend_userInfo(v22, v23, v24, v25, v26);
  v31 = objc_msgSend_objectForKeyedSubscript_(v27, v28, v9, v29, v30);

  v36 = v22;
  v37 = v31;
  if (v22 || (v36 = v3, v37 = v13, v3))
  {
    v38 = NSString;
    uint64_t v39 = objc_msgSend_code(v36, v32, v33, v34, v35);
    v43 = objc_msgSend_stringWithFormat_(v38, v40, @"%ld '%@'", v41, v42, v39, v37);
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.wifi.autojoin";
}

- (NSDictionary)coreAnalyticsEventPayload
{
  uint64_t v1558 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4);
  uint64_t v7 = NSNumber;
  uint64_t v12 = objc_msgSend_result(self, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_numberWithBool_(v7, v13, v12, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, @"result", v18);

  v19 = NSNumber;
  uint64_t v24 = objc_msgSend_wasAborted(self, v20, v21, v22, v23);
  v28 = objc_msgSend_numberWithBool_(v19, v25, v24, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, @"wasAborted", v30);

  v31 = NSNumber;
  uint64_t v36 = objc_msgSend_wasCancelled(self, v32, v33, v34, v35);
  v40 = objc_msgSend_numberWithBool_(v31, v37, v36, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, @"wasCancelled", v42);

  v43 = NSNumber;
  uint64_t v48 = objc_msgSend_duration(self, v44, v45, v46, v47);
  v52 = objc_msgSend_numberWithUnsignedInteger_(v43, v49, v48, v50, v51);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, @"duration", v54);

  v55 = NSNumber;
  uint64_t v60 = objc_msgSend_durationFromLinkDownTrigger(self, v56, v57, v58, v59);
  v64 = objc_msgSend_numberWithUnsignedInteger_(v55, v61, v60, v62, v63);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, @"durationFromLinkDownTrigger", v66);

  v67 = NSNumber;
  uint64_t v72 = objc_msgSend_durationFromDisplayOnTrigger(self, v68, v69, v70, v71);
  v76 = objc_msgSend_numberWithUnsignedInteger_(v67, v73, v72, v74, v75);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, @"durationFromDisplayOnTrigger", v78);

  v79 = NSNumber;
  uint64_t v84 = objc_msgSend_durationFromDeviceUnlockTrigger(self, v80, v81, v82, v83);
  v88 = objc_msgSend_numberWithUnsignedInteger_(v79, v85, v84, v86, v87);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, @"durationFromDeviceUnlockTrigger", v90);

  v91 = NSNumber;
  uint64_t v96 = objc_msgSend_durationFromWiFiPowerOnTrigger(self, v92, v93, v94, v95);
  v100 = objc_msgSend_numberWithUnsignedInteger_(v91, v97, v96, v98, v99);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v101, (uint64_t)v100, @"durationFromWiFiPowerOnTrigger", v102);

  unint64_t v107 = objc_msgSend_previousNonRetryAutoJoinTrigger(self, v103, v104, v105, v106);
  v112 = sub_1B4F520D4(v107, v108, v109, v110, v111);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v112, @"previousNonRetryTrigger", v114);

  v115 = NSNumber;
  uint64_t v120 = objc_msgSend_durationFromNonRetryAutoJoinTrigger(self, v116, v117, v118, v119);
  v124 = objc_msgSend_numberWithUnsignedInteger_(v115, v121, v120, v122, v123);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v125, (uint64_t)v124, @"durationFromNonRetryTrigger", v126);

  v135 = objc_msgSend_error(self, v127, v128, v129, v130);
  if (v135)
  {
    v136 = objc_msgSend_error(self, v131, v132, v133, v134);
    v140 = objc_msgSend___descriptionForError_(self, v137, (uint64_t)v136, v138, v139);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v141, (uint64_t)v140, @"error", v142);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v131, @"none", @"error", v134);
  }

  v143 = NSNumber;
  uint64_t v148 = objc_msgSend_wasCancelled(self, v144, v145, v146, v147);
  v152 = objc_msgSend_numberWithBool_(v143, v149, v148, v150, v151);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v153, (uint64_t)v152, @"wasCancelled", v154);

  v155 = NSNumber;
  uint64_t v160 = objc_msgSend_wasAborted(self, v156, v157, v158, v159);
  v164 = objc_msgSend_numberWithBool_(v155, v161, v160, v162, v163);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v165, (uint64_t)v164, @"wasAborted", v166);

  v171 = objc_msgSend_autoJoinParameters(self, v167, v168, v169, v170);
  unint64_t v176 = objc_msgSend_trigger(v171, v172, v173, v174, v175);
  v181 = sub_1B4F520D4(v176, v177, v178, v179, v180);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v182, (uint64_t)v181, @"trigger", v183);

  v188 = objc_msgSend_autoJoinParameters(self, v184, v185, v186, v187);
  unint64_t v193 = objc_msgSend_mode(v188, v189, v190, v191, v192);
  v198 = sub_1B4F52138(v193, v194, v195, v196, v197);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v199, (uint64_t)v198, @"mode", v200);

  v205 = objc_msgSend_autoJoinParameters(self, v201, v202, v203, v204);
  v212 = objc_msgSend_targetNetworkProfile(v205, v206, v207, v208, v209);
  uint64_t v213 = MEMORY[0x1E4F1CC38];
  uint64_t v214 = MEMORY[0x1E4F1CC28];
  if (v212) {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v210, MEMORY[0x1E4F1CC38], @"didTargetSpecificNetwork", v211);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v210, MEMORY[0x1E4F1CC28], @"didTargetSpecificNetwork", v211);
  }

  unint64_t v219 = objc_msgSend_retrySchedule(self, v215, v216, v217, v218);
  v224 = sub_1B4F54A8C(v219, v220, v221, v222, v223);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v225, (uint64_t)v224, @"retrySchedule", v226);

  v227 = NSNumber;
  uint64_t v232 = objc_msgSend_retryScheduleIndex(self, v228, v229, v230, v231);
  v236 = objc_msgSend_numberWithUnsignedInteger_(v227, v233, v232, v234, v235);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v237, (uint64_t)v236, @"retryScheduleIndex", v238);

  v239 = NSNumber;
  uint64_t v244 = objc_msgSend_didUseLocationOptimizedChannelList(self, v240, v241, v242, v243);
  v248 = objc_msgSend_numberWithBool_(v239, v245, v244, v246, v247);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v249, (uint64_t)v248, @"didUseLocationOptimizedChannelList", v250);

  v251 = NSNumber;
  uint64_t v256 = objc_msgSend_didDetectColocatedNetworkEnvironment(self, v252, v253, v254, v255);
  v260 = objc_msgSend_numberWithBool_(v251, v257, v256, v258, v259);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v261, (uint64_t)v260, @"didDetectColocatedNetworkEnvironment", v262);

  v263 = NSNumber;
  uint64_t v268 = objc_msgSend_wasAlreadyAssociated(self, v264, v265, v266, v267);
  v272 = objc_msgSend_numberWithBool_(v263, v269, v268, v270, v271);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v273, (uint64_t)v272, @"wasAlreadyAssociated", v274);

  v275 = NSNumber;
  uint64_t v280 = objc_msgSend_didDeferJoinToDiscoverMorePreferredNetwork(self, v276, v277, v278, v279);
  v284 = objc_msgSend_numberWithBool_(v275, v281, v280, v282, v283);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v285, (uint64_t)v284, @"didDeferJoinToDiscoverMorePreferredNetwork", v286);

  v287 = NSNumber;
  uint64_t v292 = objc_msgSend_didFallbackToJoinLessPreferredNetwork(self, v288, v289, v290, v291);
  v296 = objc_msgSend_numberWithBool_(v287, v293, v292, v294, v295);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v297, (uint64_t)v296, @"didFallbackToJoinLessPreferredNetwork", v298);

  v1512 = objc_msgSend_network(self, v299, v300, v301, v302);
  uint64_t v307 = objc_msgSend_matchingKnownNetworkProfile(v1512, v303, v304, v305, v306);
  v1511 = (void *)v307;
  if (v307)
  {
    v312 = (void *)v307;
    v313 = objc_msgSend_autoJoinParameters(self, v308, v309, v310, v311);
    v318 = objc_msgSend_targetNetworkProfile(v313, v314, v315, v316, v317);
    v323 = objc_msgSend_identifier(v318, v319, v320, v321, v322);
    v328 = objc_msgSend_identifier(v312, v324, v325, v326, v327);
    if (objc_msgSend_isEqualToString_(v323, v329, (uint64_t)v328, v330, v331)) {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v332, v213, @"didJoinTargetNetwork", v333);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v332, v214, @"didJoinTargetNetwork", v333);
    }
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v308, MEMORY[0x1E4F1CC28], @"didJoinTargetNetwork", v311);
  }
  v338 = NSNumber;
  uint64_t v339 = objc_msgSend_scanDuration(self, v334, v335, v336, v337);
  v343 = objc_msgSend_numberWithUnsignedInteger_(v338, v340, v339, v341, v342);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v344, (uint64_t)v343, @"scanDuration", v345);

  v346 = NSNumber;
  v351 = objc_msgSend_scanChannels(self, v347, v348, v349, v350);
  uint64_t v356 = objc_msgSend_count(v351, v352, v353, v354, v355);
  v360 = objc_msgSend_numberWithUnsignedInteger_(v346, v357, v356, v358, v359);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v361, (uint64_t)v360, @"scanChannelCount", v362);

  long long v1549 = 0u;
  long long v1550 = 0u;
  long long v1547 = 0u;
  long long v1548 = 0u;
  v367 = objc_msgSend_scanChannels(self, v363, v364, v365, v366);
  uint64_t v369 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v368, (uint64_t)&v1547, (uint64_t)v1557, 16);
  if (v369)
  {
    uint64_t v374 = v369;
    uint64_t v1521 = 0;
    uint64_t v375 = 0;
    uint64_t v376 = 0;
    uint64_t v377 = *(void *)v1548;
    do
    {
      for (uint64_t i = 0; i != v374; ++i)
      {
        if (*(void *)v1548 != v377) {
          objc_enumerationMutation(v367);
        }
        v379 = *(void **)(*((void *)&v1547 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v379, v370, v371, v372, v373))
        {
          ++v376;
        }
        else if (objc_msgSend_is5GHz(v379, v370, v371, v372, v373))
        {
          ++v375;
        }
        else
        {
          v1521 += objc_msgSend_is6GHz(v379, v370, v371, v372, v373);
        }
      }
      uint64_t v374 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v370, (uint64_t)&v1547, (uint64_t)v1557, 16);
    }
    while (v374);
  }
  else
  {
    uint64_t v1521 = 0;
    uint64_t v375 = 0;
    uint64_t v376 = 0;
  }

  v383 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v380, v376, v381, v382);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v384, (uint64_t)v383, @"scanChannelCount2GHz", v385);

  v389 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v386, v375, v387, v388);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v390, (uint64_t)v389, @"scanChannelCount5GHz", v391);

  v395 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v392, v1521, v393, v394);
  v1514 = v6;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v396, (uint64_t)v395, @"scanChannelCount6GHz", v397);

  long long v1545 = 0u;
  long long v1546 = 0u;
  long long v1543 = 0u;
  long long v1544 = 0u;
  v1513 = self;
  v402 = objc_msgSend_preAssociationScanChannels(self, v398, v399, v400, v401);
  uint64_t v404 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v403, (uint64_t)&v1543, (uint64_t)v1556, 16);
  if (v404)
  {
    uint64_t v409 = v404;
    uint64_t v410 = 0;
    uint64_t v411 = 0;
    uint64_t v412 = 0;
    uint64_t v413 = *(void *)v1544;
    do
    {
      for (uint64_t j = 0; j != v409; ++j)
      {
        if (*(void *)v1544 != v413) {
          objc_enumerationMutation(v402);
        }
        v415 = *(void **)(*((void *)&v1543 + 1) + 8 * j);
        if (objc_msgSend_is2GHz(v415, v405, v406, v407, v408))
        {
          ++v412;
        }
        else if (objc_msgSend_is5GHz(v415, v405, v406, v407, v408))
        {
          ++v410;
        }
        else
        {
          v411 += objc_msgSend_is6GHz(v415, v405, v406, v407, v408);
        }
      }
      uint64_t v409 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v405, (uint64_t)&v1543, (uint64_t)v1556, 16);
    }
    while (v409);
  }
  else
  {
    uint64_t v410 = 0;
    uint64_t v411 = 0;
    uint64_t v412 = 0;
  }

  v416 = NSNumber;
  uint64_t v421 = objc_msgSend_preAssociationScanDuration(v1513, v417, v418, v419, v420);
  v425 = objc_msgSend_numberWithUnsignedInteger_(v416, v422, v421, v423, v424);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v426, (uint64_t)v425, @"preAssocScanDuration", v427);

  v428 = NSNumber;
  v433 = objc_msgSend_preAssociationScanChannels(v1513, v429, v430, v431, v432);
  uint64_t v438 = objc_msgSend_count(v433, v434, v435, v436, v437);
  v442 = objc_msgSend_numberWithUnsignedInteger_(v428, v439, v438, v440, v441);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v443, (uint64_t)v442, @"preAssocScanChannelCount", v444);

  v448 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v445, v412, v446, v447);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v449, (uint64_t)v448, @"preAssocScanChannelCount2GHz", v450);

  v454 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v451, v410, v452, v453);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v455, (uint64_t)v454, @"preAssocScanChannelCount5GHz", v456);

  v460 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v457, v411, v458, v459);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v461, (uint64_t)v460, @"preAssocScanChannelCount6GHz", v462);

  v463 = NSNumber;
  uint64_t v468 = objc_msgSend_followup6GHzScanDuration(v1513, v464, v465, v466, v467);
  v472 = objc_msgSend_numberWithUnsignedInteger_(v463, v469, v468, v470, v471);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v473, (uint64_t)v472, @"followup6GHzScanDuration", v474);

  v475 = NSNumber;
  v480 = objc_msgSend_followup6GHzScanChannels(v1513, v476, v477, v478, v479);
  uint64_t v485 = objc_msgSend_count(v480, v481, v482, v483, v484);
  v489 = objc_msgSend_numberWithUnsignedInteger_(v475, v486, v485, v487, v488);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v490, (uint64_t)v489, @"followup6GHzScanChannelCount", v491);

  uint64_t v496 = objc_msgSend_scanDuration(v1513, v492, v493, v494, v495);
  uint64_t v501 = objc_msgSend_preAssociationScanDuration(v1513, v497, v498, v499, v500) + v496;
  uint64_t v1519 = v501 + objc_msgSend_followup6GHzScanDuration(v1513, v502, v503, v504, v505);
  v510 = objc_msgSend_scanChannels(v1513, v506, v507, v508, v509);
  uint64_t v515 = objc_msgSend_count(v510, v511, v512, v513, v514);

  v520 = objc_msgSend_preAssociationScanChannels(v1513, v516, v517, v518, v519);
  uint64_t v525 = objc_msgSend_count(v520, v521, v522, v523, v524) + v515;

  v530 = objc_msgSend_followup6GHzScanChannels(v1513, v526, v527, v528, v529);
  uint64_t v535 = v525 + objc_msgSend_count(v530, v531, v532, v533, v534);

  uint64_t v536 = v410 + v375;
  v541 = objc_msgSend_followup6GHzScanChannels(v1513, v537, v538, v539, v540);
  uint64_t v546 = v411 + v1521 + objc_msgSend_count(v541, v542, v543, v544, v545);

  v550 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v547, v1519, v548, v549);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v551, (uint64_t)v550, @"combinedScanDuration", v552);

  v556 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v553, v535, v554, v555);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v557, (uint64_t)v556, @"combinedScanChannelCount", v558);

  v562 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v559, v412 + v376, v560, v561);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v563, (uint64_t)v562, @"combinedScanChannelCount2GHz", v564);

  v568 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v565, v536, v566, v567);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v569, (uint64_t)v568, @"combinedScanChannelCount5GHz", v570);

  v574 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v571, v546, v572, v573);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v575, (uint64_t)v574, @"combinedScanChannelCount6GHz", v576);

  int v581 = objc_msgSend_didIncludeRemainingNon2GHzChannels(v1513, v577, v578, v579, v580);
  uint64_t v584 = MEMORY[0x1E4F1CC38];
  uint64_t v585 = MEMORY[0x1E4F1CC28];
  if (v581) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v582, MEMORY[0x1E4F1CC38], @"didIncludeRemainingNon2GHzChannels", v583);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v582, MEMORY[0x1E4F1CC28], @"didIncludeRemainingNon2GHzChannels", v583);
  }
  v590 = NSNumber;
  v591 = objc_msgSend_scanErrors(v1513, v586, v587, v588, v589);
  uint64_t v596 = objc_msgSend_count(v591, v592, v593, v594, v595);
  v600 = objc_msgSend_numberWithUnsignedInteger_(v590, v597, v596, v598, v599);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v601, (uint64_t)v600, @"scanErrorCount", v602);

  v607 = objc_msgSend_scanErrors(v1513, v603, v604, v605, v606);
  if (objc_msgSend_count(v607, v608, v609, v610, v611))
  {
    v616 = objc_msgSend_scanErrors(v1513, v612, v613, v614, v615);
    v621 = objc_msgSend_lastObject(v616, v617, v618, v619, v620);
    v625 = objc_msgSend___descriptionForError_(v1513, v622, (uint64_t)v621, v623, v624);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v626, (uint64_t)v625, @"lastScanError", v627);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v612, @"none", @"lastScanError", v615);
  }

  v628 = NSNumber;
  uint64_t v633 = objc_msgSend_GASQueryDuration(v1513, v629, v630, v631, v632);
  v637 = objc_msgSend_numberWithUnsignedInteger_(v628, v634, v633, v635, v636);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v638, (uint64_t)v637, @"GASQueryDuration", v639);

  v640 = NSNumber;
  v645 = objc_msgSend_GASQueryNetworks(v1513, v641, v642, v643, v644);
  uint64_t v650 = objc_msgSend_count(v645, v646, v647, v648, v649);
  v654 = objc_msgSend_numberWithUnsignedInteger_(v640, v651, v650, v652, v653);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v655, (uint64_t)v654, @"GASQueryCount", v656);

  v657 = NSNumber;
  v662 = objc_msgSend_GASQueryErrors(v1513, v658, v659, v660, v661);
  uint64_t v667 = objc_msgSend_count(v662, v663, v664, v665, v666);
  v671 = objc_msgSend_numberWithUnsignedInteger_(v657, v668, v667, v669, v670);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v672, (uint64_t)v671, @"GASQueryErrorCount", v673);

  v678 = objc_msgSend_GASQueryErrors(v1513, v674, v675, v676, v677);
  if (objc_msgSend_count(v678, v679, v680, v681, v682))
  {
    v687 = objc_msgSend_GASQueryErrors(v1513, v683, v684, v685, v686);
    v692 = objc_msgSend_lastObject(v687, v688, v689, v690, v691);
    v696 = objc_msgSend___descriptionForError_(v1513, v693, (uint64_t)v692, v694, v695);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v697, (uint64_t)v696, @"lastGASQueryError", v698);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v683, @"none", @"lastGASQueryError", v686);
  }

  v699 = NSNumber;
  uint64_t v704 = objc_msgSend_joinDuration(v1513, v700, v701, v702, v703);
  v708 = objc_msgSend_numberWithUnsignedInteger_(v699, v705, v704, v706, v707);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v709, (uint64_t)v708, @"joinDuration", v710);

  v711 = NSNumber;
  v716 = objc_msgSend_joinErrors(v1513, v712, v713, v714, v715);
  uint64_t v721 = objc_msgSend_count(v716, v717, v718, v719, v720);
  v725 = objc_msgSend_numberWithUnsignedInteger_(v711, v722, v721, v723, v724);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v726, (uint64_t)v725, @"joinErrorCount", v727);

  v732 = objc_msgSend_joinErrors(v1513, v728, v729, v730, v731);
  if (objc_msgSend_count(v732, v733, v734, v735, v736))
  {
    v741 = objc_msgSend_joinErrors(v1513, v737, v738, v739, v740);
    v746 = objc_msgSend_lastObject(v741, v742, v743, v744, v745);
    v750 = objc_msgSend___descriptionForError_(v1513, v747, (uint64_t)v746, v748, v749);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v751, (uint64_t)v750, @"lastJoinError", v752);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v737, @"none", @"lastJoinError", v740);
  }

  if (v1512)
  {
    uint64_t v757 = objc_msgSend_supportedSecurityTypes(v1512, v753, v754, v755, v756);
    v762 = (const char *)objc_msgSend_WEPSubtype(v1511, v758, v759, v760, v761);
    uint64_t v767 = objc_msgSend_WAPISubtype(v1511, v763, v764, v765, v766);
    v770 = sub_1B4F3FE58(v757, v762, v767, v768, v769);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v771, (uint64_t)v770, @"networkSecurityType", v772);

    int v777 = objc_msgSend_supportedPHYModes(v1512, v773, v774, v775, v776);
    v782 = sub_1B4F54CEC(v777, v778, v779, v780, v781);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v783, (uint64_t)v782, @"networkPHYMode", v784);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v753, @"none", @"networkSecurityType", v756);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v789, @"none", @"networkPHYMode", v790);
  }
  if (objc_msgSend_hiddenState(v1511, v785, v786, v787, v788) == 1) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v791, v584, @"networkIsHidden", v792);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v791, v585, @"networkIsHidden", v792);
  }
  if ((objc_msgSend_isCaptive(v1511, v793, v794, v795, v796) & 1) != 0
    || objc_msgSend_wasCaptive(v1511, v797, v798, v799, v800))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v797, MEMORY[0x1E4F1CC38], @"networkIsCaptive", v800);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v797, MEMORY[0x1E4F1CC28], @"networkIsCaptive", v800);
  }
  if ((objc_msgSend_isPasspoint(v1511, v801, v802, v803, v804) & 1) != 0
    || objc_msgSend_isPasspoint(v1512, v805, v806, v807, v808))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v805, MEMORY[0x1E4F1CC38], @"networkIsPasspoint", v808);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v805, MEMORY[0x1E4F1CC28], @"networkIsPasspoint", v808);
  }
  if ((objc_msgSend_isPersonalHotspot(v1511, v809, v810, v811, v812) & 1) != 0
    || objc_msgSend_isPersonalHotspot(v1512, v813, v814, v815, v816))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v813, MEMORY[0x1E4F1CC38], @"networkIsPersonalHotspot", v816);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v813, MEMORY[0x1E4F1CC28], @"networkIsPersonalHotspot", v816);
  }
  if ((objc_msgSend_isCarPlay(v1511, v817, v818, v819, v820) & 1) != 0
    || objc_msgSend_supportsCarPlay(v1512, v821, v822, v823, v824))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v821, MEMORY[0x1E4F1CC38], @"networkIsCarPlay", v824);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v821, MEMORY[0x1E4F1CC28], @"networkIsCarPlay", v824);
  }
  v829 = NSNumber;
  uint64_t v830 = objc_msgSend_RSSI(v1512, v825, v826, v827, v828);
  v834 = objc_msgSend_numberWithInteger_(v829, v831, v830, v832, v833);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v835, (uint64_t)v834, @"networkRSSI", v836);

  v841 = objc_msgSend_channel(v1512, v837, v838, v839, v840);
  v1510 = v841;
  if (v841)
  {
    v846 = v841;
    v847 = NSString;
    uint64_t v848 = objc_msgSend_channel(v841, v842, v843, v844, v845);
    uint64_t v853 = objc_msgSend_band(v846, v849, v850, v851, v852);
    v858 = sub_1B4F54C88(v853, v854, v855, v856, v857);
    uint64_t v863 = objc_msgSend_width(v846, v859, v860, v861, v862);
    v867 = objc_msgSend_stringWithFormat_(v847, v864, @"%ld (%@, %dMHz)", v865, v866, v848, v858, v863);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v868, (uint64_t)v867, @"networkChannel", v869);

    uint64_t v874 = objc_msgSend_band(v846, v870, v871, v872, v873);
    v879 = sub_1B4F54C88(v874, v875, v876, v877, v878);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v880, (uint64_t)v879, @"networkChannelBand", v881);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v842, @"none", @"networkChannel", v845);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v886, @"none", @"networkChannelBand", v887);
  }
  if (objc_msgSend_was6EDisabled(v1513, v882, v883, v884, v885)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v888, v584, @"was6EDisabled", v889);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v888, v585, @"was6EDisabled", v889);
  }
  if (objc_msgSend_was6EPreferOn(v1513, v890, v891, v892, v893)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v894, v584, @"was6EPreferOn", v895);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v894, v585, @"was6EPreferOn", v895);
  }
  if (objc_msgSend_isWiFi6E(v1512, v896, v897, v898, v899)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v900, v584, @"networkIsWiFi6E", v901);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v900, v585, @"networkIsWiFi6E", v901);
  }
  if (objc_msgSend_wasDiscoveredViaRNR(v1513, v902, v903, v904, v905)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v906, v584, @"wasDiscoveredViaRNR", v907);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v906, v585, @"wasDiscoveredViaRNR", v907);
  }
  if (objc_msgSend_wasDiscoveredViaFILSD(v1513, v908, v909, v910, v911)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v912, v584, @"wasDiscoveredViaFILSD", v913);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v912, v585, @"wasDiscoveredViaFILSD", v913);
  }
  if (objc_msgSend_was6GHzDeprioritized(v1513, v914, v915, v916, v917)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v918, v584, @"was6GHzDeprioritized", v919);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v918, v585, @"was6GHzDeprioritized", v919);
  }
  v924 = objc_msgSend_matchingKnownNetworkProfile(v1512, v920, v921, v922, v923);
  if (objc_msgSend_isStandalone6G(v924, v925, v926, v927, v928)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v929, v584, @"networkIsSplitSSID6GHz", v930);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v929, v585, @"networkIsSplitSSID6GHz", v930);
  }

  if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v1511, v931, v932, v933, v934)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v935, v584, @"networkIs6GHzOnly", v936);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v935, v585, @"networkIs6GHzOnly", v936);
  }
  v941 = objc_msgSend_BSSID(v1512, v937, v938, v939, v940);
  v945 = objc_msgSend_substringToIndex_(v941, v942, 8, v943, v944);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v946, (uint64_t)v945, @"networkOUI", v947);

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v948, v949, v950, v951);
  double v953 = v952;
  v958 = objc_msgSend_lastJoinedAt(v1511, v954, v955, v956, v957);
  v1509 = v958;
  if (v958)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v958, v959, v960, v961, v962);
    v967 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v964, (unint64_t)((v953 - v963) / 86400.0 / 30.4375), v965, v966);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v968, (uint64_t)v967, @"numberOfMonthsSinceLastJoin", v969);

    objc_msgSend_setObject_forKeyedSubscript_(v1514, v970, MEMORY[0x1E4F1CC38], @"networkWasJoinedBefore", v971);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v959, (uint64_t)&unk_1F0DC8550, @"numberOfMonthsSinceLastJoin", v962);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v976, MEMORY[0x1E4F1CC28], @"networkWasJoinedBefore", v977);
  }
  if (objc_msgSend_didPerformSeamlessSSIDTransition(v1513, v972, v973, v974, v975)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v978, v584, @"didPerformSeamlessSSIDTransition", v979);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v978, v585, @"didPerformSeamlessSSIDTransition", v979);
  }
  if (objc_msgSend_didTriggerReassoc(v1513, v980, v981, v982, v983)) {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v984, v584, @"didTriggerReassoc", v985);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v984, v585, @"didTriggerReassoc", v985);
  }
  long long v1541 = 0u;
  long long v1542 = 0u;
  long long v1539 = 0u;
  long long v1540 = 0u;
  v990 = objc_msgSend_preferredChannelList(v1513, v986, v987, v988, v989);
  uint64_t v992 = objc_msgSend_countByEnumeratingWithState_objects_count_(v990, v991, (uint64_t)&v1539, (uint64_t)v1555, 16);
  if (v992)
  {
    uint64_t v996 = v992;
    uint64_t v997 = *(void *)v1540;
    while (2)
    {
      for (uint64_t k = 0; k != v996; ++k)
      {
        if (*(void *)v1540 != v997) {
          objc_enumerationMutation(v990);
        }
        v999 = *(void **)(*((void *)&v1539 + 1) + 8 * k);
        if (v999 == v1510
          || v1510 && v999 && objc_msgSend_isEqual_(v999, v993, (uint64_t)v1510, v994, v995))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v993, MEMORY[0x1E4F1CC38], @"didJoinPreferredChannel", v995);
          goto LABEL_124;
        }
      }
      uint64_t v996 = objc_msgSend_countByEnumeratingWithState_objects_count_(v990, v993, (uint64_t)&v1539, (uint64_t)v1555, 16);
      if (v996) {
        continue;
      }
      break;
    }
  }
LABEL_124:

  long long v1537 = 0u;
  long long v1538 = 0u;
  long long v1535 = 0u;
  long long v1536 = 0u;
  v1004 = objc_msgSend_recentChannelList(v1513, v1000, v1001, v1002, v1003);
  uint64_t v1006 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1004, v1005, (uint64_t)&v1535, (uint64_t)v1554, 16);
  if (v1006)
  {
    uint64_t v1010 = v1006;
    uint64_t v1011 = *(void *)v1536;
    while (2)
    {
      for (uint64_t m = 0; m != v1010; ++m)
      {
        if (*(void *)v1536 != v1011) {
          objc_enumerationMutation(v1004);
        }
        v1013 = *(void **)(*((void *)&v1535 + 1) + 8 * m);
        if (v1013 == v1510
          || v1510 && v1013 && objc_msgSend_isEqual_(v1013, v1007, (uint64_t)v1510, v1008, v1009))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v1007, MEMORY[0x1E4F1CC38], @"didJoinRecentChannel", v1009);
          goto LABEL_137;
        }
      }
      uint64_t v1010 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1004, v1007, (uint64_t)&v1535, (uint64_t)v1554, 16);
      if (v1010) {
        continue;
      }
      break;
    }
  }
LABEL_137:

  long long v1533 = 0u;
  long long v1534 = 0u;
  long long v1531 = 0u;
  long long v1532 = 0u;
  v1018 = objc_msgSend_remainingChannelList(v1513, v1014, v1015, v1016, v1017);
  uint64_t v1020 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1018, v1019, (uint64_t)&v1531, (uint64_t)v1553, 16);
  if (v1020)
  {
    uint64_t v1024 = v1020;
    uint64_t v1025 = *(void *)v1532;
    while (2)
    {
      for (uint64_t n = 0; n != v1024; ++n)
      {
        if (*(void *)v1532 != v1025) {
          objc_enumerationMutation(v1018);
        }
        v1027 = *(void **)(*((void *)&v1531 + 1) + 8 * n);
        if (v1027 == v1510
          || v1510 && v1027 && objc_msgSend_isEqual_(v1027, v1021, (uint64_t)v1510, v1022, v1023))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v1021, MEMORY[0x1E4F1CC38], @"didJoinRemainingChannel", v1023);
          goto LABEL_150;
        }
      }
      uint64_t v1024 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1018, v1021, (uint64_t)&v1531, (uint64_t)v1553, 16);
      if (v1024) {
        continue;
      }
      break;
    }
  }
LABEL_150:

  v1516 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v1028, v1029, v1030, v1031);
  uint64_t v1036 = objc_msgSend_RSSI(v1512, v1032, v1033, v1034, v1035);
  long long v1527 = 0u;
  long long v1528 = 0u;
  long long v1529 = 0u;
  long long v1530 = 0u;
  v1041 = objc_msgSend_candidates(v1513, v1037, v1038, v1039, v1040);
  uint64_t v1043 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1041, v1042, (uint64_t)&v1527, (uint64_t)v1552, 16);
  if (v1043)
  {
    uint64_t v1048 = v1043;
    uint64_t v1049 = *(void *)v1528;
    do
    {
      for (iuint64_t i = 0; ii != v1048; ++ii)
      {
        if (*(void *)v1528 != v1049) {
          objc_enumerationMutation(v1041);
        }
        v1051 = *(void **)(*((void *)&v1527 + 1) + 8 * ii);
        v1056 = objc_msgSend_SSID(v1051, v1044, v1045, v1046, v1047);
        if (v1056) {
          objc_msgSend_addObject_(v1516, v1052, (uint64_t)v1056, v1054, v1055);
        }
        if (v1036 <= objc_msgSend_RSSI(v1051, v1052, v1053, v1054, v1055)) {
          uint64_t v1036 = objc_msgSend_RSSI(v1051, v1057, v1058, v1059, v1060);
        }
      }
      uint64_t v1048 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1041, v1044, (uint64_t)&v1527, (uint64_t)v1552, 16);
    }
    while (v1048);
  }

  v1061 = NSNumber;
  v1066 = objc_msgSend_candidates(v1513, v1062, v1063, v1064, v1065);
  uint64_t v1071 = objc_msgSend_count(v1066, v1067, v1068, v1069, v1070);
  v1075 = objc_msgSend_numberWithUnsignedInteger_(v1061, v1072, v1071, v1073, v1074);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1076, (uint64_t)v1075, @"candidateBSSCount", v1077);

  v1078 = NSNumber;
  uint64_t v1083 = objc_msgSend_count(v1516, v1079, v1080, v1081, v1082);
  v1087 = objc_msgSend_numberWithUnsignedInteger_(v1078, v1084, v1083, v1085, v1086);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1088, (uint64_t)v1087, @"candidateSSIDCount", v1089);

  v1090 = NSNumber;
  uint64_t v1095 = objc_msgSend_RSSI(v1512, v1091, v1092, v1093, v1094);
  v1099 = objc_msgSend_numberWithInteger_(v1090, v1096, v1095 - v1036, v1097, v1098);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1100, (uint64_t)v1099, @"bestRSSIDelta", v1101);

  v1106 = objc_msgSend_associatedNetwork(v1513, v1102, v1103, v1104, v1105);

  if (v1106)
  {
    v1111 = NSNumber;
    uint64_t v1112 = objc_msgSend_RSSI(v1512, v1107, v1108, v1109, v1110);
    v1117 = objc_msgSend_associatedNetwork(v1513, v1113, v1114, v1115, v1116);
    uint64_t v1122 = objc_msgSend_RSSI(v1117, v1118, v1119, v1120, v1121);
    v1126 = objc_msgSend_numberWithInteger_(v1111, v1123, v1112 - v1122, v1124, v1125);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1127, (uint64_t)v1126, @"associatedRSSIDelta", v1128);
  }
  long long v1525 = 0u;
  long long v1526 = 0u;
  long long v1523 = 0u;
  long long v1524 = 0u;
  objc_msgSend_knownNetworks(v1513, v1107, v1108, v1109, v1110);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1518 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v1129, (uint64_t)&v1523, (uint64_t)v1551, 16);
  uint64_t v1134 = 0;
  uint64_t v1135 = 0;
  uint64_t v1136 = 0;
  uint64_t v1137 = 0;
  uint64_t v1138 = 0;
  uint64_t v1139 = 0;
  uint64_t v1140 = 0;
  if (v1518)
  {
    uint64_t v1520 = 0;
    uint64_t v1522 = 0;
    uint64_t v1517 = *(void *)v1524;
    do
    {
      for (juint64_t j = 0; jj != v1518; ++jj)
      {
        if (*(void *)v1524 != v1517) {
          objc_enumerationMutation(obj);
        }
        v1142 = *(void **)(*((void *)&v1523 + 1) + 8 * jj);
        unsigned int isCaptive = objc_msgSend_isCaptive(v1142, v1130, v1131, v1132, v1133);
        v1134 += isCaptive;
        v1135 += isCaptive ^ 1;
        if (objc_msgSend_hiddenState(v1142, v1144, v1145, v1146, v1147) == 1) {
          ++v1136;
        }
        v1152 = objc_msgSend_lastJoinedAt(v1142, v1148, v1149, v1150, v1151);
        objc_msgSend_timeIntervalSinceReferenceDate(v1152, v1153, v1154, v1155, v1156);
        double v1158 = v953 - v1157;

        if (v1158 < 604800.0) {
          ++v1137;
        }
        v1163 = objc_msgSend_lastJoinedAt(v1142, v1159, v1160, v1161, v1162);
        objc_msgSend_timeIntervalSinceReferenceDate(v1163, v1164, v1165, v1166, v1167);
        double v1169 = v953 - v1168;

        if (v1169 < 2629800.0) {
          ++v1138;
        }
        v1174 = objc_msgSend_lastJoinedAt(v1142, v1170, v1171, v1172, v1173);
        objc_msgSend_timeIntervalSinceReferenceDate(v1174, v1175, v1176, v1177, v1178);
        double v1180 = v953 - v1179;

        if (v1180 < 7889400.0) {
          ++v1139;
        }
        v1185 = objc_msgSend_lastJoinedAt(v1142, v1181, v1182, v1183, v1184);
        objc_msgSend_timeIntervalSinceReferenceDate(v1185, v1186, v1187, v1188, v1189);
        double v1191 = v953 - v1190;

        if (v1191 < 15778800.0) {
          ++v1140;
        }
        v1196 = objc_msgSend_lastJoinedAt(v1142, v1192, v1193, v1194, v1195);
        objc_msgSend_timeIntervalSinceReferenceDate(v1196, v1197, v1198, v1199, v1200);
        double v1202 = v953 - v1201;

        uint64_t v1207 = v1520;
        if (v1202 < 31557600.0) {
          uint64_t v1207 = v1520 + 1;
        }
        uint64_t v1520 = v1207;
        v1208 = objc_msgSend_lastJoinedAt(v1142, v1203, v1204, v1205, v1206);
        objc_msgSend_timeIntervalSinceReferenceDate(v1208, v1209, v1210, v1211, v1212);
        double v1214 = v953 - v1213;

        uint64_t v1215 = v1522;
        if (v1214 < 63115200.0) {
          uint64_t v1215 = v1522 + 1;
        }
        uint64_t v1522 = v1215;
      }
      uint64_t v1518 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v1130, (uint64_t)&v1523, (uint64_t)v1551, 16);
    }
    while (v1518);
  }
  else
  {
    uint64_t v1520 = 0;
    uint64_t v1522 = 0;
  }

  v1216 = NSNumber;
  v1221 = objc_msgSend_knownNetworks(v1513, v1217, v1218, v1219, v1220);
  uint64_t v1226 = objc_msgSend_count(v1221, v1222, v1223, v1224, v1225);
  v1230 = objc_msgSend_numberWithUnsignedInteger_(v1216, v1227, v1226, v1228, v1229);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1231, (uint64_t)v1230, @"knownNetworksCount", v1232);

  v1236 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1233, v1134, v1234, v1235);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1237, (uint64_t)v1236, @"captiveKnownNetworksCount", v1238);

  v1242 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1239, v1135, v1240, v1241);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1243, (uint64_t)v1242, @"nonCaptiveKnownNetworksCount", v1244);

  v1248 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1245, v1136, v1246, v1247);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1249, (uint64_t)v1248, @"hiddenKnownNetworksCount", v1250);

  v1254 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1251, v1137, v1252, v1253);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1255, (uint64_t)v1254, @"joinedKnownNetworksCountLastWeek", v1256);

  v1260 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1257, v1138, v1258, v1259);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1261, (uint64_t)v1260, @"joinedKnownNetworksCountLastMonth", v1262);

  v1266 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1263, v1139, v1264, v1265);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1267, (uint64_t)v1266, @"joinedKnownNetworksCountLast3Months", v1268);

  v1272 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1269, v1140, v1270, v1271);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1273, (uint64_t)v1272, @"joinedKnownNetworksCountLast6Months", v1274);

  v1278 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1275, v1520, v1276, v1277);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1279, (uint64_t)v1278, @"joinedKnownNetworksCountLastYear", v1280);

  v1284 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v1281, v1522, v1282, v1283);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1285, (uint64_t)v1284, @"joinedKnownNetworksCountLast2Years", v1286);

  v1287 = NSNumber;
  uint64_t v1292 = objc_msgSend_autoHotspotWasAttempted(v1513, v1288, v1289, v1290, v1291);
  v1296 = objc_msgSend_numberWithBool_(v1287, v1293, v1292, v1294, v1295);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1297, (uint64_t)v1296, @"autoHotspotWasAttempted", v1298);

  v1299 = NSNumber;
  uint64_t v1304 = objc_msgSend_autoHotspotResult(v1513, v1300, v1301, v1302, v1303);
  v1308 = objc_msgSend_numberWithBool_(v1299, v1305, v1304, v1306, v1307);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1309, (uint64_t)v1308, @"autoHotspotResult", v1310);

  unint64_t v1315 = objc_msgSend_autoHotspotMode(v1513, v1311, v1312, v1313, v1314);
  v1320 = sub_1B4F549C4(v1315, v1316, v1317, v1318, v1319);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1321, (uint64_t)v1320, @"autoHotspotMode", v1322);

  v1323 = NSNumber;
  uint64_t v1328 = objc_msgSend_autoHotspotWasAborted(v1513, v1324, v1325, v1326, v1327);
  v1332 = objc_msgSend_numberWithBool_(v1323, v1329, v1328, v1330, v1331);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1333, (uint64_t)v1332, @"autoHotspotWasAborted", v1334);

  v1335 = NSNumber;
  uint64_t v1340 = objc_msgSend_autoHotspotDuration(v1513, v1336, v1337, v1338, v1339);
  v1344 = objc_msgSend_numberWithUnsignedInteger_(v1335, v1341, v1340, v1342, v1343);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1345, (uint64_t)v1344, @"autoHotspotDuration", v1346);

  v1355 = objc_msgSend_autoHotspotError(v1513, v1347, v1348, v1349, v1350);
  if (v1355)
  {
    v1356 = objc_msgSend_autoHotspotError(v1513, v1351, v1352, v1353, v1354);
    v1360 = objc_msgSend___descriptionForError_(v1513, v1357, (uint64_t)v1356, v1358, v1359);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1361, (uint64_t)v1360, @"autoHotspotError", v1362);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1351, @"none", @"autoHotspotError", v1354);
  }

  v1363 = NSNumber;
  uint64_t v1368 = objc_msgSend_autoHotspotBrowseDuration(v1513, v1364, v1365, v1366, v1367);
  v1372 = objc_msgSend_numberWithUnsignedInteger_(v1363, v1369, v1368, v1370, v1371);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1373, (uint64_t)v1372, @"autoHotspotBrowseDuration", v1374);

  v1383 = objc_msgSend_autoHotspotBrowseError(v1513, v1375, v1376, v1377, v1378);
  if (v1383)
  {
    v1384 = objc_msgSend_autoHotspotBrowseError(v1513, v1379, v1380, v1381, v1382);
    v1388 = objc_msgSend___descriptionForError_(v1513, v1385, (uint64_t)v1384, v1386, v1387);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1389, (uint64_t)v1388, @"autoHotspotBrowseError", v1390);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1379, @"none", @"autoHotspotBrowseError", v1382);
  }

  v1391 = NSNumber;
  v1396 = objc_msgSend_autoHotspotJoinErrors(v1513, v1392, v1393, v1394, v1395);
  uint64_t v1401 = objc_msgSend_count(v1396, v1397, v1398, v1399, v1400);
  v1405 = objc_msgSend_numberWithUnsignedInteger_(v1391, v1402, v1401, v1403, v1404);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1406, (uint64_t)v1405, @"autoHotspotJoinErrorCount", v1407);

  v1412 = objc_msgSend_autoHotspotJoinErrors(v1513, v1408, v1409, v1410, v1411);
  if (objc_msgSend_count(v1412, v1413, v1414, v1415, v1416))
  {
    v1421 = objc_msgSend_autoHotspotJoinErrors(v1513, v1417, v1418, v1419, v1420);
    v1426 = objc_msgSend_lastObject(v1421, v1422, v1423, v1424, v1425);
    v1430 = objc_msgSend___descriptionForError_(v1513, v1427, (uint64_t)v1426, v1428, v1429);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1431, (uint64_t)v1430, @"autoHotspotLastJoinError", v1432);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1417, @"none", @"autoHotspotLastJoinError", v1420);
  }

  v1437 = objc_msgSend_hotspot(v1513, v1433, v1434, v1435, v1436);
  unsigned int v1442 = objc_msgSend_networkType(v1437, v1438, v1439, v1440, v1441);
  v1447 = sub_1B4F54B3C(v1442, v1443, v1444, v1445, v1446);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1448, (uint64_t)v1447, @"autoHotspotHotspotNetworkType", v1449);

  v1454 = objc_msgSend_hotspot(v1513, v1450, v1451, v1452, v1453);
  unint64_t v1459 = objc_msgSend_group(v1454, v1455, v1456, v1457, v1458);
  v1464 = sub_1B4F54BB4(v1459, v1460, v1461, v1462, v1463);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1465, (uint64_t)v1464, @"autoHotspotHotspotDeviceGroup", v1466);

  v1471 = objc_msgSend_hotspot(v1513, v1467, v1468, v1469, v1470);
  v1476 = objc_msgSend_batteryLife(v1471, v1472, v1473, v1474, v1475);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1477, (uint64_t)v1476, @"autoHotspotHotspotBatteryLevel", v1478);

  v1483 = objc_msgSend_hotspot(v1513, v1479, v1480, v1481, v1482);
  v1488 = objc_msgSend_signalStrength(v1483, v1484, v1485, v1486, v1487);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1489, (uint64_t)v1488, @"autoHotspotHotspotSignalStrength", v1490);

  v1495 = objc_msgSend_hotspot(v1513, v1491, v1492, v1493, v1494);
  v1500 = objc_msgSend_model(v1495, v1496, v1497, v1498, v1499);
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1501, (uint64_t)v1500, @"autoHotspotHotspotDeviceModel", v1502);

  v1507 = objc_msgSend_copy(v1514, v1503, v1504, v1505, v1506);
  return (NSDictionary *)v1507;
}

- (NSString)description
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4);
  uint64_t v58 = self;
  uint64_t v11 = objc_msgSend_coreAnalyticsEventPayload(self, v7, v8, v9, v10);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v16 = objc_msgSend_allKeys(v11, v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_sortedArrayUsingSelector_(v16, v17, (uint64_t)sel_caseInsensitiveCompare_, v18, v19);

  uint64_t v21 = v20;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v59, (uint64_t)v63, 16);
  if (v23)
  {
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v60 != v28) {
          objc_enumerationMutation(v21);
        }
        uint64_t v30 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v31 = NSString;
        v32 = objc_msgSend_objectForKeyedSubscript_(v11, v24, v30, v25, v26);
        uint64_t v36 = objc_msgSend_stringWithFormat_(v31, v33, @"%@=%@", v34, v35, v30, v32);
        objc_msgSend_addObject_(v6, v37, (uint64_t)v36, v38, v39);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v59, (uint64_t)v63, 16);
    }
    while (v27);
  }

  v40 = NSString;
  uint64_t v45 = objc_msgSend_optimizedChannelList(v58, v41, v42, v43, v44);
  v49 = objc_msgSend_stringWithFormat_(v40, v46, @"optimizedChannelList=%@", v47, v48, v45);
  objc_msgSend_addObject_(v6, v50, (uint64_t)v49, v51, v52);

  v56 = objc_msgSend_componentsJoinedByString_(v6, v53, @", ", v54, v55);

  return (NSString *)v56;
}

- (BOOL)isEqualToAutoJoinMetric:(id)a3
{
  id v7 = a3;
  duratiouint64_t n = self->_result;
  if (duration != objc_msgSend_result(v7, v9, v10, v11, v12)
    || (duratiouint64_t n = self->_duration, duration != objc_msgSend_duration(v7, v13, v14, v15, v16))
    || (duratiouint64_t n = self->_durationFromLinkDownTrigger, duration != objc_msgSend_duration(v7, v17, v18, v19, v20))
    || (duratiouint64_t n = self->_durationFromDisplayOnTrigger,
        duration != objc_msgSend_durationFromDisplayOnTrigger(v7, v21, v22, v23, v24))
    || (duratiouint64_t n = self->_durationFromDeviceUnlockTrigger,
        duration != objc_msgSend_durationFromDeviceUnlockTrigger(v7, v25, v26, v27, v28))
    || (duratiouint64_t n = self->_durationFromWiFiPowerOnTrigger,
        duration != objc_msgSend_durationFromWiFiPowerOnTrigger(v7, v29, v30, v31, v32))
    || (duratiouint64_t n = self->_previousNonRetryAutoJoinTrigger,
        duration != objc_msgSend_previousNonRetryAutoJoinTrigger(v7, v33, v34, v35, v36))
    || (duratiouint64_t n = self->_durationFromNonRetryAutoJoinTrigger,
        duration != objc_msgSend_durationFromNonRetryAutoJoinTrigger(v7, v37, v38, v39, v40)))
  {
    int v502 = 0;
    uint64_t v513 = 0;
    long long v499 = 0uLL;
    uint64_t v500 = 0;
    int v497 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v495 = 0;
    uint64_t v493 = 0;
    uint64_t v492 = 0;
    uint64_t v491 = 0;
    memset(v512, 0, sizeof(v512));
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    int v496 = 0;
    BOOL v501 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    goto LABEL_15;
  }
  duratiouint64_t n = (unint64_t)self->_error;
  uint64_t v474 = objc_msgSend_error(v7, v41, v42, v43, v44);
  BOOL v49 = duration != (void)v474;
  if ((void *)duration != v474)
  {
    error = self->_error;
    if (!error)
    {
      uint64_t v513 = 0;
      long long v499 = 0uLL;
      uint64_t v500 = 0;
      int v497 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      int v496 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      goto LABEL_15;
    }
    uint64_t v51 = objc_msgSend_error(v7, v45, v46, v47, v48);
    if (!v51)
    {
      v473 = 0;
      long long v499 = 0uLL;
      uint64_t v500 = 0;
      int v497 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      int v496 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      uint64_t v513 = 1;
      goto LABEL_15;
    }
    v473 = (void *)v51;
    duratiouint64_t n = (unint64_t)self->_error;
    v472 = objc_msgSend_error(v7, v52, v53, v54, v55);
    if (!objc_msgSend_isEqual_((void *)duration, v56, (uint64_t)v472, v57, v58))
    {
      uint64_t v500 = 0;
      int v497 = 0;
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      int v496 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      uint64_t v513 = 1;
      *((void *)&v499 + 1) = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_wasCancelled;
  LODWORD(v513) = v49;
  if (duration != objc_msgSend_wasCancelled(v7, v45, v46, v47, v48)
    || (duratiouint64_t n = self->_wasAborted, duration != objc_msgSend_wasAborted(v7, v71, v72, v73, v74)))
  {
    uint64_t v500 = 0;
    HIDWORD(v513) = 0;
    int v497 = 0;
    int v59 = 0;
    *(void *)&long long v499 = 0;
    int v60 = 0;
    uint64_t v495 = 0;
    uint64_t v493 = 0;
    uint64_t v492 = 0;
    uint64_t v491 = 0;
    memset(v512, 0, sizeof(v512));
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    int v496 = 0;
    uint64_t v498 = 0;
    *((void *)&v499 + 1) = v49;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    goto LABEL_15;
  }
  duratiouint64_t n = (unint64_t)self->_autoJoinParameters;
  uint64_t v471 = objc_msgSend_autoJoinParameters(v7, v75, v76, v77, v78);
  uint64_t v3 = duration != (void)v471;
  if ((void *)duration != v471)
  {
    error = self->_autoJoinParameters;
    if (!error)
    {
      HIDWORD(v513) = 0;
      int v497 = 0;
      uint64_t v500 = 0x100000000;
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      int v496 = 0;
      uint64_t v498 = 0;
      *((void *)&v499 + 1) = v49;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      goto LABEL_15;
    }
    uint64_t v470 = objc_msgSend_autoJoinParameters(v7, v79, v80, v81, v82);
    if (!v470)
    {
      uint64_t v470 = 0;
      int v497 = 0;
      uint64_t v500 = 0x100000000;
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      int v496 = 0;
      uint64_t v498 = 0;
      *((void *)&v499 + 1) = v49;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      HIDWORD(v513) = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_autoJoinParameters;
    v469 = objc_msgSend_autoJoinParameters(v7, v83, v84, v85, v86);
    if (!objc_msgSend_isEqual_((void *)duration, v87, (uint64_t)v469, v88, v89))
    {
      uint64_t v500 = 0x100000000;
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      *((void *)&v499 + 1) = v49;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      HIDWORD(v513) = 1;
      int v496 = 0;
      int v497 = 1;
      goto LABEL_15;
    }
  }
  HIDWORD(v513) = v3;
  duratiouint64_t n = self->_retrySchedule;
  if (duration != objc_msgSend_retrySchedule(v7, v79, v80, v81, v82)
    || (duratiouint64_t n = self->_retryScheduleIndex, duration != objc_msgSend_retryScheduleIndex(v7, v90, v91, v92, v93)))
  {
    LODWORD(v500) = 0;
    int v59 = 0;
    *(void *)&long long v499 = 0;
    int v60 = 0;
    uint64_t v495 = 0;
    uint64_t v493 = 0;
    uint64_t v492 = 0;
    uint64_t v491 = 0;
    memset(v512, 0, sizeof(v512));
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    int v496 = 0;
    uint64_t v498 = 0;
    *((void *)&v499 + 1) = v49;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
LABEL_169:
    HIDWORD(v500) = 1;
    int v497 = v3;
    goto LABEL_15;
  }
  duratiouint64_t n = self->_didUseLocationOptimizedChannelList;
  if (duration != objc_msgSend_didUseLocationOptimizedChannelList(v7, v94, v95, v96, v97)
    || (duratiouint64_t n = self->_didDetectColocatedNetworkEnvironment,
        duration != objc_msgSend_didDetectColocatedNetworkEnvironment(v7, v98, v99, v100, v101))
    || (duratiouint64_t n = self->_wasAlreadyAssociated,
        duration != objc_msgSend_wasAlreadyAssociated(v7, v102, v103, v104, v105))
    || (duratiouint64_t n = self->_didDeferJoinToDiscoverMorePreferredNetwork,
        duration != objc_msgSend_didDeferJoinToDiscoverMorePreferredNetwork(v7, v106, v107, v108, v109))|| (duratiouint64_t n = self->_didFallbackToJoinLessPreferredNetwork, duration != objc_msgSend_didFallbackToJoinLessPreferredNetwork(v7, v110, v111, v112, v113)))
  {
    LODWORD(v500) = 0;
    int v59 = 0;
    *(void *)&long long v499 = 0;
    int v60 = 0;
    uint64_t v495 = 0;
    uint64_t v493 = 0;
    uint64_t v492 = 0;
    uint64_t v491 = 0;
    memset(v512, 0, sizeof(v512));
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    int v496 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    *((void *)&v499 + 1) = v49;
    goto LABEL_169;
  }
  duratiouint64_t n = (unint64_t)self->_preferredChannelList;
  uint64_t v468 = objc_msgSend_preferredChannelList(v7, v114, v115, v116, v117);
  *(_DWORD *)&v512[24] = duration != (void)v468;
  if ((void *)duration != v468)
  {
    error = self->_preferredChannelList;
    if (!error)
    {
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, sizeof(v512));
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      goto LABEL_15;
    }
    uint64_t v467 = objc_msgSend_preferredChannelList(v7, v118, v119, v120, v121);
    if (!v467)
    {
      uint64_t v467 = 0;
      int v59 = 0;
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      memset(v512, 0, 24);
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(_DWORD *)&v512[24] = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_preferredChannelList;
    uint64_t v465 = objc_msgSend_preferredChannelList(v7, v122, v123, v124, v125);
    if (!objc_msgSend_isEqual_((void *)duration, v126, (uint64_t)v465, v127, v128))
    {
      *(void *)&long long v499 = 0;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      memset(v512, 0, 24);
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(_DWORD *)&v512[24] = 1;
      int v59 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_recentChannelList;
  uint64_t v466 = objc_msgSend_recentChannelList(v7, v118, v119, v120, v121);
  *(_DWORD *)&v512[20] = duration != (void)v466;
  if ((void *)duration != v466)
  {
    error = self->_recentChannelList;
    if (!error)
    {
      *(void *)&long long v499 = 0x100000000;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      memset(v512, 0, 24);
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      goto LABEL_15;
    }
    v464 = objc_msgSend_recentChannelList(v7, v129, v130, v131, v132);
    if (!v464)
    {
      v464 = 0;
      *(void *)&long long v499 = 0x100000000;
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, 20);
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(_DWORD *)&v512[20] = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_recentChannelList;
    uint64_t v462 = objc_msgSend_recentChannelList(v7, v133, v134, v135, v136);
    if (!objc_msgSend_isEqual_((void *)duration, v137, (uint64_t)v462, v138, v139))
    {
      int v60 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, 20);
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(_DWORD *)&v512[20] = 1;
      *(void *)&long long v499 = 0x100000001;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_remainingChannelList;
  v463 = objc_msgSend_remainingChannelList(v7, v129, v130, v131, v132);
  *(_DWORD *)&v512[16] = duration != (void)v463;
  if ((void *)duration != v463)
  {
    error = self->_remainingChannelList;
    if (!error)
    {
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      memset(v512, 0, 20);
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      goto LABEL_15;
    }
    v461 = objc_msgSend_remainingChannelList(v7, v140, v141, v142, v143);
    if (!v461)
    {
      v461 = 0;
      uint64_t v495 = 0;
      *(void *)&v512[8] = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      *(_DWORD *)&v512[16] = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_remainingChannelList;
    uint64_t v459 = objc_msgSend_remainingChannelList(v7, v144, v145, v146, v147);
    if (!objc_msgSend_isEqual_((void *)duration, v148, (uint64_t)v459, v149, v150))
    {
      uint64_t v495 = 0x100000000;
      *(void *)&v512[8] = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      *(_DWORD *)&v512[16] = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_optimizedChannelList;
  v460 = objc_msgSend_optimizedChannelList(v7, v140, v141, v142, v143);
  *(_DWORD *)&v512[12] = duration != (void)v460;
  if ((void *)duration != v460)
  {
    error = self->_optimizedChannelList;
    if (!error)
    {
      *(void *)&v512[8] = 0;
      uint64_t v493 = 0;
      uint64_t v492 = 0;
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      goto LABEL_15;
    }
    uint64_t v458 = objc_msgSend_optimizedChannelList(v7, v151, v152, v153, v154);
    if (!v458)
    {
      uint64_t v458 = 0;
      uint64_t v493 = 0;
      *(void *)&v512[4] = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      *(_DWORD *)uint64_t v512 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      *(_DWORD *)&v512[12] = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_optimizedChannelList;
    v457 = objc_msgSend_optimizedChannelList(v7, v155, v156, v157, v158);
    if (!objc_msgSend_isEqual_((void *)duration, v159, (uint64_t)v457, v160, v161))
    {
      HIDWORD(v493) = 0;
      *(void *)&v512[4] = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      *(_DWORD *)uint64_t v512 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      *(_DWORD *)&v512[12] = 1;
      int v162 = 1;
LABEL_198:
      LODWORD(v493) = v162;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_scanDuration;
  if (duration != objc_msgSend_scanDuration(v7, v151, v152, v153, v154))
  {
    HIDWORD(v493) = 0;
    *(void *)&v512[4] = 0;
    uint64_t v492 = 0;
    uint64_t v491 = 0;
    *(_DWORD *)uint64_t v512 = 0;
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    int v162 = *(_DWORD *)&v512[12];
    goto LABEL_198;
  }
  duratiouint64_t n = (unint64_t)self->_scanChannels;
  uint64_t v456 = objc_msgSend_scanChannels(v7, v163, v164, v165, v166);
  *(_DWORD *)&v512[8] = duration != (void)v456;
  if ((void *)duration != v456)
  {
    error = self->_scanChannels;
    if (!error)
    {
      *(void *)&v512[4] = 0;
      uint64_t v492 = 0;
      uint64_t v491 = 0;
      *(_DWORD *)uint64_t v512 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      goto LABEL_15;
    }
    v455 = objc_msgSend_scanChannels(v7, v167, v168, v169, v170);
    if (!v455)
    {
      v455 = 0;
      uint64_t v492 = 0;
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      *(_DWORD *)&v512[8] = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_scanChannels;
    v454 = objc_msgSend_scanChannels(v7, v171, v172, v173, v174);
    if (!objc_msgSend_isEqual_((void *)duration, v175, (uint64_t)v454, v176, v177))
    {
      HIDWORD(v492) = 0;
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      *(_DWORD *)&v512[8] = 1;
      int v178 = 1;
LABEL_208:
      LODWORD(v492) = v178;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_preAssociationScanDuration;
  if (duration != objc_msgSend_preAssociationScanDuration(v7, v167, v168, v169, v170))
  {
    HIDWORD(v492) = 0;
    *(void *)uint64_t v512 = 0;
    uint64_t v491 = 0;
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    int v178 = *(_DWORD *)&v512[8];
    goto LABEL_208;
  }
  duratiouint64_t n = (unint64_t)self->_preAssociationScanChannels;
  uint64_t v453 = objc_msgSend_preAssociationScanChannels(v7, v179, v180, v181, v182);
  *(_DWORD *)&v512[4] = duration != (void)v453;
  if ((void *)duration != v453)
  {
    error = self->_preAssociationScanChannels;
    if (!error)
    {
      *(void *)uint64_t v512 = 0;
      uint64_t v491 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      goto LABEL_15;
    }
    uint64_t v452 = objc_msgSend_preAssociationScanChannels(v7, v183, v184, v185, v186);
    if (!v452)
    {
      uint64_t v452 = 0;
      uint64_t v491 = 0;
      *(void *)uint64_t v512 = 0x100000000;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_preAssociationScanChannels;
    v451 = objc_msgSend_preAssociationScanChannels(v7, v187, v188, v189, v190);
    if (!objc_msgSend_isEqual_((void *)duration, v191, (uint64_t)v451, v192, v193))
    {
      HIDWORD(v491) = 0;
      *(void *)uint64_t v512 = 0x100000000;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      int v194 = 1;
LABEL_218:
      LODWORD(v491) = v194;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_followup6GHzScanDuration;
  if (duration != objc_msgSend_followup6GHzScanDuration(v7, v183, v184, v185, v186))
  {
    HIDWORD(v491) = 0;
    *(_DWORD *)uint64_t v512 = 0;
    int v490 = 0;
    int v489 = 0;
    BOOL v511 = 0;
    int v487 = 0;
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    int v194 = *(_DWORD *)&v512[4];
    goto LABEL_218;
  }
  duratiouint64_t n = (unint64_t)self->_followup6GHzScanChannels;
  uint64_t v450 = objc_msgSend_followup6GHzScanChannels(v7, v195, v196, v197, v198);
  *(_DWORD *)uint64_t v512 = duration != (void)v450;
  if ((void *)duration != v450)
  {
    error = self->_followup6GHzScanChannels;
    if (!error)
    {
      *(_DWORD *)uint64_t v512 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      goto LABEL_15;
    }
    v449 = objc_msgSend_followup6GHzScanChannels(v7, v199, v200, v201, v202);
    if (!v449)
    {
      v449 = 0;
      int v490 = 0;
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      *(_DWORD *)uint64_t v512 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_followup6GHzScanChannels;
    v448 = objc_msgSend_followup6GHzScanChannels(v7, v203, v204, v205, v206);
    if (!objc_msgSend_isEqual_((void *)duration, v207, (uint64_t)v448, v208, v209))
    {
      int v489 = 0;
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      *(_DWORD *)uint64_t v512 = 1;
      int v490 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_scanErrors;
  uint64_t v447 = objc_msgSend_scanErrors(v7, v199, v200, v201, v202);
  BOOL v511 = duration != (void)v447;
  if ((void *)duration != v447)
  {
    error = self->_scanErrors;
    if (!error)
    {
      BOOL v511 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      goto LABEL_15;
    }
    uint64_t v446 = objc_msgSend_scanErrors(v7, v210, v211, v212, v213);
    if (!v446)
    {
      uint64_t v446 = 0;
      int v487 = 0;
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      BOOL v511 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_scanErrors;
    v445 = objc_msgSend_scanErrors(v7, v214, v215, v216, v217);
    if (!objc_msgSend_isEqual_((void *)duration, v218, (uint64_t)v445, v219, v220))
    {
      int v488 = 0;
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      BOOL v511 = 1;
      int v221 = 1;
LABEL_235:
      int v487 = v221;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_GASQueryDuration;
  if (duration != objc_msgSend_GASQueryDuration(v7, v210, v211, v212, v213))
  {
    int v488 = 0;
    BOOL v510 = 0;
    int v486 = 0;
    int v485 = 0;
    BOOL v509 = 0;
    int v482 = 0;
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v221 = v511;
    goto LABEL_235;
  }
  duratiouint64_t n = (unint64_t)self->_GASQueryNetworks;
  uint64_t v444 = objc_msgSend_GASQueryNetworks(v7, v222, v223, v224, v225);
  BOOL v510 = duration != (void)v444;
  if ((void *)duration != v444)
  {
    error = self->_GASQueryNetworks;
    if (!error)
    {
      BOOL v510 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      goto LABEL_15;
    }
    v443 = objc_msgSend_GASQueryNetworks(v7, v226, v227, v228, v229);
    if (!v443)
    {
      v443 = 0;
      int v486 = 0;
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      BOOL v510 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_GASQueryNetworks;
    v442 = objc_msgSend_GASQueryNetworks(v7, v230, v231, v232, v233);
    if (!objc_msgSend_isEqual_((void *)duration, v234, (uint64_t)v442, v235, v236))
    {
      int v485 = 0;
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      BOOL v510 = 1;
      int v486 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_GASQueryErrors;
  uint64_t v441 = objc_msgSend_GASQueryErrors(v7, v226, v227, v228, v229);
  BOOL v509 = duration != (void)v441;
  if ((void *)duration != v441)
  {
    error = self->_GASQueryErrors;
    if (!error)
    {
      BOOL v509 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      goto LABEL_15;
    }
    uint64_t v440 = objc_msgSend_GASQueryErrors(v7, v237, v238, v239, v240);
    if (!v440)
    {
      uint64_t v440 = 0;
      int v482 = 0;
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      BOOL v509 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_GASQueryErrors;
    v439 = objc_msgSend_GASQueryErrors(v7, v241, v242, v243, v244);
    if (!objc_msgSend_isEqual_((void *)duration, v245, (uint64_t)v439, v246, v247))
    {
      int v484 = 0;
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      BOOL v509 = 1;
      int v248 = 1;
LABEL_252:
      int v482 = v248;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_joinDuration;
  if (duration != objc_msgSend_joinDuration(v7, v237, v238, v239, v240))
  {
    int v484 = 0;
    BOOL v508 = 0;
    uint64_t v483 = 0;
    BOOL v507 = 0;
    int v481 = 0;
    int v480 = 0;
    BOOL v506 = 0;
    int v477 = 0;
    int v476 = 0;
    BOOL v505 = 0;
    int v478 = 0;
    int v479 = 0;
    BOOL v504 = 0;
    int v475 = 0;
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v487 = v511;
    int v488 = 1;
    int v486 = v510;
    int v485 = 1;
    int v248 = v509;
    goto LABEL_252;
  }
  duratiouint64_t n = (unint64_t)self->_joinErrors;
  uint64_t v438 = objc_msgSend_joinErrors(v7, v249, v250, v251, v252);
  BOOL v508 = duration != (void)v438;
  if ((void *)duration != v438)
  {
    error = self->_joinErrors;
    if (!error)
    {
      BOOL v508 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      goto LABEL_15;
    }
    uint64_t v437 = objc_msgSend_joinErrors(v7, v253, v254, v255, v256);
    if (!v437)
    {
      uint64_t v437 = 0;
      uint64_t v483 = 0;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      BOOL v508 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_joinErrors;
    uint64_t v436 = objc_msgSend_joinErrors(v7, v257, v258, v259, v260);
    if (!objc_msgSend_isEqual_((void *)duration, v261, (uint64_t)v436, v262, v263))
    {
      uint64_t v483 = 0x100000000;
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      BOOL v508 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_network;
  uint64_t v435 = objc_msgSend_network(v7, v253, v254, v255, v256);
  BOOL v507 = duration != (void)v435;
  if ((void *)duration != v435)
  {
    error = self->_network;
    if (!error)
    {
      BOOL v507 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      goto LABEL_15;
    }
    v434 = objc_msgSend_network(v7, v264, v265, v266, v267);
    if (!v434)
    {
      v434 = 0;
      int v481 = 0;
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      BOOL v507 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_network;
    v433 = objc_msgSend_network(v7, v268, v269, v270, v271);
    if (!objc_msgSend_isEqual_((void *)duration, v272, (uint64_t)v433, v273, v274))
    {
      int v480 = 0;
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      BOOL v507 = 1;
      int v481 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_associatedNetwork;
  uint64_t v432 = objc_msgSend_associatedNetwork(v7, v264, v265, v266, v267);
  BOOL v506 = duration != (void)v432;
  if ((void *)duration != v432)
  {
    error = self->_associatedNetwork;
    if (!error)
    {
      BOOL v506 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      goto LABEL_15;
    }
    uint64_t v431 = objc_msgSend_associatedNetwork(v7, v275, v276, v277, v278);
    if (!v431)
    {
      uint64_t v431 = 0;
      int v477 = 0;
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      BOOL v506 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_associatedNetwork;
    uint64_t v430 = objc_msgSend_associatedNetwork(v7, v279, v280, v281, v282);
    if (!objc_msgSend_isEqual_((void *)duration, v283, (uint64_t)v430, v284, v285))
    {
      int v476 = 0;
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      BOOL v506 = 1;
      int v477 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_candidates;
  v429 = objc_msgSend_candidates(v7, v275, v276, v277, v278);
  BOOL v505 = duration != (void)v429;
  if ((void *)duration != v429)
  {
    error = self->_candidates;
    if (!error)
    {
      BOOL v505 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      goto LABEL_15;
    }
    v428 = objc_msgSend_candidates(v7, v286, v287, v288, v289);
    if (!v428)
    {
      v428 = 0;
      int v478 = 0;
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      BOOL v505 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_candidates;
    uint64_t v427 = objc_msgSend_candidates(v7, v290, v291, v292, v293);
    if (!objc_msgSend_isEqual_((void *)duration, v294, (uint64_t)v427, v295, v296))
    {
      int v479 = 0;
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      uint64_t v500 = 0x100000001;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      int v496 = 0;
      int v497 = v3;
      *((void *)&v499 + 1) = v49;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      BOOL v505 = 1;
      int v478 = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = (unint64_t)self->_knownNetworks;
  v426 = objc_msgSend_knownNetworks(v7, v286, v287, v288, v289);
  BOOL v504 = duration != (void)v426;
  if ((void *)duration != v426)
  {
    error = self->_knownNetworks;
    if (!error)
    {
      BOOL v504 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      uint64_t v500 = 0x100000001;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      int v496 = 0;
      int v497 = v3;
      *((void *)&v499 + 1) = v49;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      goto LABEL_15;
    }
    v425 = objc_msgSend_knownNetworks(v7, v297, v298, v299, v300);
    if (!v425)
    {
      v425 = 0;
      int v475 = 0;
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      uint64_t v500 = 0x100000001;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      int v496 = 0;
      int v497 = v3;
      *((void *)&v499 + 1) = v49;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      BOOL v504 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_knownNetworks;
    uint64_t v424 = objc_msgSend_knownNetworks(v7, v301, v302, v303, v304);
    if (!objc_msgSend_isEqual_((void *)duration, v305, (uint64_t)v424, v306, v307))
    {
      uint64_t v494 = 0;
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      uint64_t v500 = 0x100000001;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      int v496 = 0;
      int v497 = v3;
      *((void *)&v499 + 1) = v49;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      BOOL v504 = 1;
      int v308 = 1;
LABEL_301:
      int v475 = v308;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_didTriggerReassoc;
  if (duration != objc_msgSend_didTriggerReassoc(v7, v297, v298, v299, v300)) {
    goto LABEL_299;
  }
  duratiouint64_t n = self->_didPerformSeamlessSSIDTransition;
  if (duration != objc_msgSend_didPerformSeamlessSSIDTransition(v7, v309, v310, v311, v312)) {
    goto LABEL_299;
  }
  duratiouint64_t n = self->_wasDiscoveredViaRNR;
  if (duration != objc_msgSend_wasDiscoveredViaRNR(v7, v313, v314, v315, v316)
    || (duratiouint64_t n = self->_wasDiscoveredViaFILSD,
        duration != objc_msgSend_wasDiscoveredViaFILSD(v7, v317, v318, v319, v320))
    || (duratiouint64_t n = self->_was6EDisabled,
        duration != objc_msgSend_was6EDisabled(v7, v321, v322, v323, v324))
    || (duratiouint64_t n = self->_was6EPreferOn,
        duration != objc_msgSend_was6EPreferOn(v7, v325, v326, v327, v328))
    || (duratiouint64_t n = self->_was6GHzDeprioritized,
        duration != objc_msgSend_was6GHzDeprioritized(v7, v329, v330, v331, v332))
    || (duratiouint64_t n = self->_didIncludeRemainingNon2GHzChannels,
        duration != objc_msgSend_didIncludeRemainingNon2GHzChannels(v7, v333, v334, v335, v336))
    || (duratiouint64_t n = self->_autoHotspotWasAttempted,
        duration != objc_msgSend_autoHotspotWasAttempted(v7, v337, v338, v339, v340))
    || (duratiouint64_t n = self->_autoHotspotResult,
        duration != objc_msgSend_autoHotspotResult(v7, v341, v342, v343, v344)))
  {
LABEL_299:
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    uint64_t v500 = 0x100000001;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    int v496 = 0;
    int v497 = v3;
    DWORD1(v499) = 1;
    *((void *)&v499 + 1) = v49;
LABEL_300:
    LODWORD(v499) = *(_DWORD *)&v512[20];
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v487 = v511;
    int v488 = 1;
    int v486 = v510;
    int v485 = 1;
    int v482 = v509;
    int v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    int v481 = v507;
    int v480 = 1;
    int v477 = v506;
    int v476 = 1;
    int v478 = v505;
    int v479 = 1;
    int v308 = v504;
    goto LABEL_301;
  }
  duratiouint64_t n = self->_autoHotspotWasAborted;
  if (duration != objc_msgSend_autoHotspotWasAborted(v7, v345, v346, v347, v348)
    || (duratiouint64_t n = self->_autoHotspotDuration, duration != objc_msgSend_autoHotspotDuration(v7, v349, v350, v351, v352)))
  {
    uint64_t v494 = 0;
    uint64_t v503 = 0;
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    DWORD1(v499) = 1;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    goto LABEL_300;
  }
  duratiouint64_t n = (unint64_t)self->_autoHotspotError;
  uint64_t v423 = objc_msgSend_autoHotspotError(v7, v353, v354, v355, v356);
  HIDWORD(v503) = duration != (void)v423;
  if ((void *)duration != v423)
  {
    error = self->_autoHotspotError;
    if (!error)
    {
      uint64_t v503 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      uint64_t v494 = 1;
      goto LABEL_15;
    }
    v422 = objc_msgSend_autoHotspotError(v7, v357, v358, v359, v360);
    if (!v422)
    {
      v422 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      LOBYTE(v503) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      uint64_t v494 = 1;
      HIDWORD(v503) = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_autoHotspotError;
    uint64_t v421 = objc_msgSend_autoHotspotError(v7, v361, v362, v363, v364);
    if (!objc_msgSend_isEqual_((void *)duration, v365, (uint64_t)v421, v366, v367))
    {
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      LOBYTE(v503) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v496 = 0;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      uint64_t v494 = 0x100000001;
      HIDWORD(v503) = 1;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_autoHotspotMode;
  if (duration != objc_msgSend_autoHotspotMode(v7, v357, v358, v359, v360)
    || (duratiouint64_t n = self->_autoHotspotBrowseDuration,
        duration != objc_msgSend_autoHotspotBrowseDuration(v7, v368, v369, v370, v371)))
  {
    uint64_t v498 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    LOBYTE(v503) = 0;
    BOOL v501 = 0;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v496 = 0;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v487 = v511;
    int v488 = 1;
    int v486 = v510;
    int v485 = 1;
    int v482 = v509;
    int v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    int v481 = v507;
    int v480 = 1;
    int v477 = v506;
    int v476 = 1;
    int v478 = v505;
    int v479 = 1;
    int v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    goto LABEL_15;
  }
  duratiouint64_t n = (unint64_t)self->_autoHotspotBrowseError;
  uint64_t v420 = objc_msgSend_autoHotspotBrowseError(v7, v372, v373, v374, v375);
  BOOL v501 = duration != (void)v420;
  if ((void *)duration != v420)
  {
    error = self->_autoHotspotBrowseError;
    if (!error)
    {
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LOBYTE(v503) = 0;
      BOOL v501 = 0;
      int v502 = 1;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      goto LABEL_15;
    }
    uint64_t v419 = objc_msgSend_autoHotspotBrowseError(v7, v376, v377, v378, v379);
    if (!v419)
    {
      uint64_t v419 = 0;
      uint64_t v498 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      BOOL v501 = 1;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_autoHotspotBrowseError;
    uint64_t v418 = objc_msgSend_autoHotspotBrowseError(v7, v380, v381, v382, v383);
    if (!objc_msgSend_isEqual_((void *)duration, v384, (uint64_t)v418, v385, v386))
    {
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      HIDWORD(v498) = 0;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      BOOL v501 = 1;
      int v387 = 1;
LABEL_323:
      LODWORD(v498) = v387;
      goto LABEL_15;
    }
  }
  duratiouint64_t n = self->_autoHotspotJoinDuration;
  if (duration != objc_msgSend_autoHotspotJoinDuration(v7, v376, v377, v378, v379))
  {
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    LODWORD(error) = 0;
    int v502 = 1;
    LOBYTE(v503) = 0;
    int v59 = *(_DWORD *)&v512[24];
    *((void *)&v499 + 1) = v49;
    int v497 = v3;
    uint64_t v500 = 0x100000001;
    HIDWORD(v498) = 0;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    int v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v487 = v511;
    int v488 = 1;
    int v486 = v510;
    int v485 = 1;
    int v482 = v509;
    int v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    int v481 = v507;
    int v480 = 1;
    int v477 = v506;
    int v476 = 1;
    int v478 = v505;
    int v479 = 1;
    int v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    int v496 = 1;
    int v387 = v501;
    goto LABEL_323;
  }
  duratiouint64_t n = (unint64_t)self->_autoHotspotJoinErrors;
  v417 = objc_msgSend_autoHotspotJoinErrors(v7, v388, v389, v390, v391);
  HIDWORD(v499) = duration != (void)v417;
  if ((void *)duration != v417)
  {
    error = self->_autoHotspotJoinErrors;
    if (!error)
    {
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      uint64_t v498 = v501 | 0x100000000;
      goto LABEL_15;
    }
    v416 = objc_msgSend_autoHotspotJoinErrors(v7, v392, v393, v394, v395);
    if (!v416)
    {
      v416 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      *((void *)&v499 + 1) = v49 | 0x100000000;
      int v497 = v3;
      uint64_t v500 = 0x100000001;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      int v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      uint64_t v498 = v501 | 0x100000000;
      goto LABEL_15;
    }
    duratiouint64_t n = (unint64_t)self->_autoHotspotJoinErrors;
    uint64_t v3 = objc_msgSend_autoHotspotJoinErrors(v7, v396, v397, v398, v399);
    if (!objc_msgSend_isEqual_((void *)duration, v400, v3, v401, v402))
    {
      int v62 = 0;
      int v63 = 0;
      LODWORD(error) = 0;
      int v60 = 1;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      int v497 = HIDWORD(v513);
      uint64_t v500 = 0x100000001;
      *((void *)&v499 + 1) = v49 | 0x100000000;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      uint64_t v498 = v501 | 0x100000000;
      int v61 = 1;
      goto LABEL_15;
    }
  }
  hotspot = self->_hotspot;
  uint64_t v403 = objc_msgSend_hotspot(v7, v392, v393, v394, v395);
  if (hotspot == (void *)v403)
  {
    int v63 = 0;
    LODWORD(error) = 0;
    int v60 = 1;
    int v502 = 1;
    int v59 = *(_DWORD *)&v512[24];
    int v497 = HIDWORD(v513);
    uint64_t v500 = 0x100000001;
    DWORD2(v499) = v49;
    *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
    uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
    uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
    int v490 = *(_DWORD *)v512;
    int v489 = 1;
    int v487 = v511;
    int v488 = 1;
    int v486 = v510;
    int v485 = 1;
    int v482 = v509;
    int v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    int v481 = v507;
    duratiouint64_t n = (unint64_t)hotspot;
    int v480 = 1;
    int v477 = v506;
    int v476 = 1;
    int v478 = v505;
    int v479 = 1;
    int v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    int v496 = 1;
    uint64_t v498 = v501 | 0x100000000;
    int v61 = HIDWORD(v499);
    int v62 = 1;
    LOBYTE(v503) = 1;
  }
  else
  {
    duratiouint64_t n = v403;
    error = self->_hotspot;
    if (error)
    {
      hotspot = objc_msgSend_hotspot(v7, v404, v405, v406, v407);
      if (hotspot)
      {
        uint64_t v412 = self->_hotspot;
        uint64_t v5 = objc_msgSend_hotspot(v7, v408, v409, v410, v411);
        int v60 = 1;
        int v502 = 1;
        LOBYTE(v503) = objc_msgSend_isEqual_(v412, v413, (uint64_t)v5, v414, v415);
        int v59 = *(_DWORD *)&v512[24];
        int v497 = HIDWORD(v513);
        uint64_t v500 = 0x100000001;
        DWORD2(v499) = v49;
        *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
        LODWORD(v495) = 1;
        HIDWORD(v495) = *(_DWORD *)&v512[16];
        uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
        uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
        uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
        int v490 = *(_DWORD *)v512;
        int v489 = 1;
        int v487 = v511;
        int v488 = 1;
        int v486 = v510;
        int v485 = 1;
        int v482 = v509;
        int v484 = 1;
        HIDWORD(v483) = v508;
        LODWORD(v483) = 1;
        int v481 = v507;
        int v480 = 1;
        int v477 = v506;
        int v476 = 1;
        int v478 = v505;
        int v479 = 1;
        int v475 = v504;
        LODWORD(v494) = 1;
        HIDWORD(v494) = HIDWORD(v503);
        int v496 = 1;
        LODWORD(error) = 1;
      }
      else
      {
        LODWORD(error) = 0;
        int v60 = 1;
        int v502 = 1;
        LOBYTE(v503) = 0;
        int v59 = *(_DWORD *)&v512[24];
        int v497 = HIDWORD(v513);
        uint64_t v500 = 0x100000001;
        DWORD2(v499) = v49;
        *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
        LODWORD(v495) = 1;
        HIDWORD(v495) = *(_DWORD *)&v512[16];
        uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
        uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
        uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
        int v490 = *(_DWORD *)v512;
        int v489 = 1;
        int v487 = v511;
        int v488 = 1;
        int v486 = v510;
        int v485 = 1;
        int v482 = v509;
        int v484 = 1;
        HIDWORD(v483) = v508;
        LODWORD(v483) = 1;
        int v481 = v507;
        int v480 = 1;
        int v477 = v506;
        int v476 = 1;
        int v478 = v505;
        int v479 = 1;
        int v475 = v504;
        LODWORD(v494) = 1;
        HIDWORD(v494) = HIDWORD(v503);
        int v496 = 1;
      }
      uint64_t v498 = v501 | 0x100000000;
      int v61 = HIDWORD(v499);
      int v62 = 1;
      int v63 = 1;
    }
    else
    {
      int v63 = 0;
      int v60 = 1;
      int v502 = 1;
      LOBYTE(v503) = 0;
      int v59 = *(_DWORD *)&v512[24];
      int v497 = HIDWORD(v513);
      uint64_t v500 = 0x100000001;
      DWORD2(v499) = v49;
      *(void *)&long long v499 = *(unsigned int *)&v512[20] | 0x100000000;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      uint64_t v493 = *(unsigned int *)&v512[12] | 0x100000000;
      uint64_t v492 = *(unsigned int *)&v512[8] | 0x100000000;
      uint64_t v491 = *(unsigned int *)&v512[4] | 0x100000000;
      int v490 = *(_DWORD *)v512;
      int v489 = 1;
      int v487 = v511;
      int v488 = 1;
      int v486 = v510;
      int v485 = 1;
      int v482 = v509;
      int v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      int v481 = v507;
      int v480 = 1;
      int v477 = v506;
      int v476 = 1;
      int v478 = v505;
      int v479 = 1;
      int v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      int v496 = 1;
      uint64_t v498 = v501 | 0x100000000;
      int v61 = HIDWORD(v499);
      int v62 = 1;
    }
  }
LABEL_15:
  if (error)
  {
    int v64 = v60;
    int v65 = v61;
    int v66 = v62;
    int v67 = v59;
    int v68 = v63;

    int v69 = v68;
    int v59 = v67;
    int v62 = v66;
    int v61 = v65;
    int v60 = v64;
    if (!v69) {
      goto LABEL_17;
    }
  }
  else if (!v63)
  {
LABEL_17:
    if (v62) {
      goto LABEL_18;
    }
LABEL_22:
    if (!v61) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  if (!v62) {
    goto LABEL_22;
  }
LABEL_18:

  if (v61) {
LABEL_23:
  }

LABEL_24:
  if (HIDWORD(v499)) {

  }
  if (HIDWORD(v498)) {
  if (v498)
  }

  if (v501) {
  if (v496)
  }

  if (HIDWORD(v494)) {
  if (HIDWORD(v503))
  }

  if (v494) {
  if (v475)
  }

  if (v504) {
  if (v479)
  }

  if (v478) {
  if (v505)
  }

  if (v476) {
  if (v477)
  }

  if (v506) {
  if (v480)
  }

  if (v481) {
  if (v507)
  }

  if (v483) {
  if (HIDWORD(v483))
  }

  if (v508) {
  if (v484)
  }

  if (v482) {
  if (v509)
  }

  if (v485) {
  if (v486)
  }

  if (v510) {
  if (v488)
  }

  if (v487) {
  if (v511)
  }

  if (v489) {
  if (v490)
  }

  if (*(_DWORD *)v512) {
  if (HIDWORD(v491))
  }

  if (v491) {
  if (*(_DWORD *)&v512[4])
  }

  if (HIDWORD(v492)) {
  if (v492)
  }

  if (*(_DWORD *)&v512[8]) {
  if (HIDWORD(v493))
  }

  if (v493) {
  if (*(_DWORD *)&v512[12])
  }

  if (v495) {
  if (HIDWORD(v495))
  }

  if (*(_DWORD *)&v512[16]) {
  if (v60)
  }

  if (v499) {
  if (*(_DWORD *)&v512[20])
  }

  if (DWORD1(v499)) {
  if (v59)
  }

  if (*(_DWORD *)&v512[24]) {
  if (v500)
  }

  if (v497) {
  if (HIDWORD(v513))
  }

  if (HIDWORD(v500)) {
  if (DWORD2(v499))
  }

  if (v513) {
  if (v502)
  }

  return v503;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAutoJoinMetric *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinMetric = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinMetric = objc_msgSend_isEqualToAutoJoinMetric_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAutoJoinMetric = 0;
  }

  return isEqualToAutoJoinMetric;
}

- (unint64_t)hash
{
  duratiouint64_t n = self->_duration;
  int8x16_t v134 = *(int8x16_t *)&self->_durationFromLinkDownTrigger;
  __int32 v6 = v134.i32[0];
  int8x16_t v135 = *(int8x16_t *)&self->_durationFromDeviceUnlockTrigger;
  p_didTriggerReassoc = &self->_didTriggerReassoc;
  p_didPerformSeamlessSSIDTransitiouint64_t n = &self->_didPerformSeamlessSSIDTransition;
  LOBYTE(v6) = self->_result;
  __int32 v140 = v6;
  int8x16_t v132 = *(int8x16_t *)&self->_previousNonRetryAutoJoinTrigger;
  uint64_t v136 = objc_msgSend_hash(self->_error, a2, v2, v3, v4);
  __int32 v7 = v140;
  BYTE1(v7) = self->_wasCancelled;
  BYTE2(v7) = self->_wasAborted;
  __int32 v141 = v7;
  uint64_t v133 = objc_msgSend_hash(self->_autoJoinParameters, v8, v9, v10, v11);
  LOBYTE(v12) = self->_wasAlreadyAssociated;
  BYTE4(v12) = self->_didUseLocationOptimizedChannelList;
  uint64_t v113 = v12;
  LOBYTE(v12) = self->_didDetectColocatedNetworkEnvironment;
  BYTE4(v12) = self->_didDeferJoinToDiscoverMorePreferredNetwork;
  uint64_t v112 = v12;
  didFallbackToJoinLessPreferredNetworuint64_t k = self->_didFallbackToJoinLessPreferredNetwork;
  int8x16_t v128 = *(int8x16_t *)&self->_retrySchedule;
  uint64_t v131 = objc_msgSend_hash(self->_preferredChannelList, v14, v15, v16, v17);
  uint64_t v130 = objc_msgSend_hash(self->_recentChannelList, v18, v19, v20, v21);
  uint64_t v129 = objc_msgSend_hash(self->_remainingChannelList, v22, v23, v24, v25);
  uint64_t v127 = objc_msgSend_hash(self->_optimizedChannelList, v26, v27, v28, v29);
  scanDuratiouint64_t n = self->_scanDuration;
  uint64_t v126 = objc_msgSend_hash(self->_scanChannels, v30, v31, v32, v33);
  v34.i64[0] = scanDuration;
  v34.i64[1] = self->_preAssociationScanDuration;
  int8x16_t v145 = v34;
  uint64_t v125 = objc_msgSend_hash(self->_preAssociationScanChannels, v35, v36, v37, v38);
  followup6GHzScanDuratiouint64_t n = self->_followup6GHzScanDuration;
  uint64_t v122 = objc_msgSend_hash(self->_followup6GHzScanChannels, v39, v40, v41, v42);
  uint64_t v120 = objc_msgSend_hash(self->_scanErrors, v43, v44, v45, v46);
  v47.i64[0] = followup6GHzScanDuration;
  v47.i64[1] = self->_GASQueryDuration;
  int8x16_t v143 = v47;
  uint64_t v119 = objc_msgSend_hash(self->_GASQueryNetworks, v48, v49, v50, v51);
  uint64_t v118 = objc_msgSend_hash(self->_GASQueryErrors, v52, v53, v54, v55);
  joinDuratiouint64_t n = self->_joinDuration;
  uint64_t v117 = objc_msgSend_hash(self->_joinErrors, v56, v57, v58, v59);
  uint64_t v116 = objc_msgSend_hash(self->_network, v60, v61, v62, v63);
  uint64_t v115 = objc_msgSend_hash(self->_associatedNetwork, v64, v65, v66, v67);
  uint64_t v72 = objc_msgSend_hash(self->_candidates, v68, v69, v70, v71);
  uint64_t v77 = objc_msgSend_hash(self->_knownNetworks, v73, v74, v75, v76);
  v78.i32[0] = v141;
  v78.i8[3] = self->_was6EDisabled;
  v78.i16[2] = *(_WORD *)&self->_was6EPreferOn;
  v78.i8[6] = v113;
  v78.i8[7] = BYTE4(v113);
  v78.i8[8] = v112;
  v78.i8[9] = BYTE4(v112);
  v78.i8[10] = didFallbackToJoinLessPreferredNetwork;
  v78.i8[11] = *p_didPerformSeamlessSSIDTransition;
  v78.i32[3] = *(_DWORD *)p_didTriggerReassoc;
  uint16x8_t v79 = vmovl_u8(*(uint8x8_t *)v78.i8);
  int8x16_t v124 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v79.i8);
  uint16x8_t v80 = vmovl_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
  int8x16_t v114 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v80.i8);
  int8x16_t v111 = (int8x16_t)vmovl_high_u16(v79);
  int8x16_t v110 = (int8x16_t)vmovl_high_u16(v80);
  BOOL autoHotspotWasAttempted = self->_autoHotspotWasAttempted;
  BOOL autoHotspotResult = self->_autoHotspotResult;
  BOOL autoHotspotWasAborted = self->_autoHotspotWasAborted;
  v79.i64[0] = joinDuration;
  v79.i64[1] = self->_autoHotspotDuration;
  int8x16_t v139 = (int8x16_t)v79;
  uint64_t v88 = objc_msgSend_hash(self->_autoHotspotError, v84, v85, v86, v87);
  int8x16_t v109 = *(int8x16_t *)&self->_autoHotspotMode;
  uint64_t v93 = objc_msgSend_hash(self->_autoHotspotBrowseError, v89, v90, v91, v92);
  autoHotspotJoinDuratiouint64_t n = self->_autoHotspotJoinDuration;
  uint64_t v99 = objc_msgSend_hash(self->_autoHotspotJoinErrors, v95, v96, v97, v98);
  uint64_t v104 = objc_msgSend_hash(self->_hotspot, v100, v101, v102, v103);
  int8x8_t v105 = veor_s8(veor_s8(veor_s8(*(int8x8_t *)v124.i8, *(int8x8_t *)v114.i8), veor_s8(*(int8x8_t *)v111.i8, *(int8x8_t *)v110.i8)), veor_s8(veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v124, v124, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v114, v114, 8uLL)), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v111, v111, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v110, v110, 8uLL))));
  v106.i64[0] = v105.u32[0];
  v106.i64[1] = v105.u32[1];
  int8x16_t v107 = veorq_s8(v106, veorq_s8(veorq_s8(veorq_s8(v134, v145), veorq_s8(v132, v139)), veorq_s8(veorq_s8(v135, v143), veorq_s8(v128, v109))));
  return *(void *)&veor_s8(*(int8x8_t *)v107.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v107, v107, 8uLL)) ^ autoHotspotWasAttempted ^ autoHotspotResult ^ autoHotspotWasAborted ^ duration ^ autoHotspotJoinDuration ^ v104 ^ v99 ^ v93 ^ v88 ^ v77 ^ v72 ^ v115 ^ v116 ^ v117 ^ v118 ^ v119 ^ v120 ^ v122 ^ v125 ^ v126 ^ v127 ^ v129 ^ v130 ^ v131 ^ v133 ^ v136;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int32 v6 = objc_msgSend_allocWithZone_(CWFAutoJoinMetric, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setResult_(v11, v12, self->_result, v13, v14);
  objc_msgSend_setDuration_(v11, v15, self->_duration, v16, v17);
  objc_msgSend_setDurationFromLinkDownTrigger_(v11, v18, self->_durationFromLinkDownTrigger, v19, v20);
  objc_msgSend_setDurationFromDisplayOnTrigger_(v11, v21, self->_durationFromDisplayOnTrigger, v22, v23);
  objc_msgSend_setDurationFromDeviceUnlockTrigger_(v11, v24, self->_durationFromDeviceUnlockTrigger, v25, v26);
  objc_msgSend_setDurationFromWiFiPowerOnTrigger_(v11, v27, self->_durationFromWiFiPowerOnTrigger, v28, v29);
  objc_msgSend_setPreviousNonRetryAutoJoinTrigger_(v11, v30, self->_previousNonRetryAutoJoinTrigger, v31, v32);
  objc_msgSend_setDurationFromNonRetryAutoJoinTrigger_(v11, v33, self->_durationFromNonRetryAutoJoinTrigger, v34, v35);
  objc_msgSend_setError_(v11, v36, (uint64_t)self->_error, v37, v38);
  objc_msgSend_setWasCancelled_(v11, v39, self->_wasCancelled, v40, v41);
  objc_msgSend_setWasAborted_(v11, v42, self->_wasAborted, v43, v44);
  objc_msgSend_setAutoJoinParameters_(v11, v45, (uint64_t)self->_autoJoinParameters, v46, v47);
  objc_msgSend_setRetrySchedule_(v11, v48, self->_retrySchedule, v49, v50);
  objc_msgSend_setRetryScheduleIndex_(v11, v51, self->_retryScheduleIndex, v52, v53);
  objc_msgSend_setDidUseLocationOptimizedChannelList_(v11, v54, self->_didUseLocationOptimizedChannelList, v55, v56);
  objc_msgSend_setDidDetectColocatedNetworkEnvironment_(v11, v57, self->_didDetectColocatedNetworkEnvironment, v58, v59);
  objc_msgSend_setWasAlreadyAssociated_(v11, v60, self->_wasAlreadyAssociated, v61, v62);
  objc_msgSend_setDidDeferJoinToDiscoverMorePreferredNetwork_(v11, v63, self->_didDeferJoinToDiscoverMorePreferredNetwork, v64, v65);
  objc_msgSend_setDidFallbackToJoinLessPreferredNetwork_(v11, v66, self->_didFallbackToJoinLessPreferredNetwork, v67, v68);
  objc_msgSend_setPreferredChannelList_(v11, v69, (uint64_t)self->_preferredChannelList, v70, v71);
  objc_msgSend_setRecentChannelList_(v11, v72, (uint64_t)self->_recentChannelList, v73, v74);
  objc_msgSend_setRemainingChannelList_(v11, v75, (uint64_t)self->_remainingChannelList, v76, v77);
  objc_msgSend_setOptimizedChannelList_(v11, v78, (uint64_t)self->_optimizedChannelList, v79, v80);
  objc_msgSend_setScanDuration_(v11, v81, self->_scanDuration, v82, v83);
  objc_msgSend_setScanChannels_(v11, v84, (uint64_t)self->_scanChannels, v85, v86);
  objc_msgSend_setPreAssociationScanDuration_(v11, v87, self->_preAssociationScanDuration, v88, v89);
  objc_msgSend_setPreAssociationScanChannels_(v11, v90, (uint64_t)self->_preAssociationScanChannels, v91, v92);
  objc_msgSend_setFollowup6GHzScanDuration_(v11, v93, self->_followup6GHzScanDuration, v94, v95);
  objc_msgSend_setFollowup6GHzScanChannels_(v11, v96, (uint64_t)self->_followup6GHzScanChannels, v97, v98);
  objc_msgSend_setScanErrors_(v11, v99, (uint64_t)self->_scanErrors, v100, v101);
  objc_msgSend_setGASQueryDuration_(v11, v102, self->_GASQueryDuration, v103, v104);
  objc_msgSend_setGASQueryNetworks_(v11, v105, (uint64_t)self->_GASQueryNetworks, v106, v107);
  objc_msgSend_setGASQueryErrors_(v11, v108, (uint64_t)self->_GASQueryErrors, v109, v110);
  objc_msgSend_setJoinDuration_(v11, v111, self->_joinDuration, v112, v113);
  objc_msgSend_setJoinErrors_(v11, v114, (uint64_t)self->_joinErrors, v115, v116);
  objc_msgSend_setNetwork_(v11, v117, (uint64_t)self->_network, v118, v119);
  objc_msgSend_setAssociatedNetwork_(v11, v120, (uint64_t)self->_associatedNetwork, v121, v122);
  objc_msgSend_setCandidates_(v11, v123, (uint64_t)self->_candidates, v124, v125);
  objc_msgSend_setKnownNetworks_(v11, v126, (uint64_t)self->_knownNetworks, v127, v128);
  objc_msgSend_setDidTriggerReassoc_(v11, v129, self->_didTriggerReassoc, v130, v131);
  objc_msgSend_setDidPerformSeamlessSSIDTransition_(v11, v132, self->_didPerformSeamlessSSIDTransition, v133, v134);
  objc_msgSend_setWasDiscoveredViaRNR_(v11, v135, self->_wasDiscoveredViaRNR, v136, v137);
  objc_msgSend_setWasDiscoveredViaFILSD_(v11, v138, self->_wasDiscoveredViaFILSD, v139, v140);
  objc_msgSend_setWas6EDisabled_(v11, v141, self->_was6EDisabled, v142, v143);
  objc_msgSend_setWas6EPreferOn_(v11, v144, self->_was6EPreferOn, v145, v146);
  objc_msgSend_setWas6GHzDeprioritized_(v11, v147, self->_was6GHzDeprioritized, v148, v149);
  objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(v11, v150, self->_didIncludeRemainingNon2GHzChannels, v151, v152);
  objc_msgSend_setAutoHotspotWasAttempted_(v11, v153, self->_autoHotspotWasAttempted, v154, v155);
  objc_msgSend_setAutoHotspotResult_(v11, v156, self->_autoHotspotResult, v157, v158);
  objc_msgSend_setAutoHotspotWasAborted_(v11, v159, self->_autoHotspotWasAborted, v160, v161);
  objc_msgSend_setAutoHotspotDuration_(v11, v162, self->_autoHotspotDuration, v163, v164);
  objc_msgSend_setAutoHotspotError_(v11, v165, (uint64_t)self->_autoHotspotError, v166, v167);
  objc_msgSend_setAutoHotspotMode_(v11, v168, self->_autoHotspotMode, v169, v170);
  objc_msgSend_setAutoHotspotBrowseDuration_(v11, v171, self->_autoHotspotBrowseDuration, v172, v173);
  objc_msgSend_setAutoHotspotBrowseError_(v11, v174, (uint64_t)self->_autoHotspotBrowseError, v175, v176);
  objc_msgSend_setAutoHotspotJoinDuration_(v11, v177, self->_autoHotspotJoinDuration, v178, v179);
  objc_msgSend_setAutoHotspotJoinErrors_(v11, v180, (uint64_t)self->_autoHotspotJoinErrors, v181, v182);
  objc_msgSend_setHotspot_(v11, v183, (uint64_t)self->_hotspot, v184, v185);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL result = self->_result;
  id v181 = a3;
  objc_msgSend_encodeBool_forKey_(v181, v5, result, @"_result", v6);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, self->_duration, v8, v9);
  objc_msgSend_encodeObject_forKey_(v181, v11, (uint64_t)v10, @"_duration", v12);

  uint64_t v16 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v13, self->_durationFromLinkDownTrigger, v14, v15);
  objc_msgSend_encodeObject_forKey_(v181, v17, (uint64_t)v16, @"_durationFromLinkDownTrigger", v18);

  uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, self->_durationFromDisplayOnTrigger, v20, v21);
  objc_msgSend_encodeObject_forKey_(v181, v23, (uint64_t)v22, @"_durationFromDisplayOnTrigger", v24);

  uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, self->_durationFromDeviceUnlockTrigger, v26, v27);
  objc_msgSend_encodeObject_forKey_(v181, v29, (uint64_t)v28, @"_durationFromDeviceUnlockTrigger", v30);

  uint64_t v34 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v31, self->_durationFromWiFiPowerOnTrigger, v32, v33);
  objc_msgSend_encodeObject_forKey_(v181, v35, (uint64_t)v34, @"_durationFromWiFiPowerOnTrigger", v36);

  objc_msgSend_encodeInteger_forKey_(v181, v37, self->_previousNonRetryAutoJoinTrigger, @"_previousNonRetryAutoJoinTrigger", v38);
  uint64_t v42 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, self->_durationFromNonRetryAutoJoinTrigger, v40, v41);
  objc_msgSend_encodeObject_forKey_(v181, v43, (uint64_t)v42, @"_durationFromNonRetryAutoJoinTrigger", v44);

  objc_msgSend_encodeObject_forKey_(v181, v45, (uint64_t)self->_error, @"_error", v46);
  objc_msgSend_encodeBool_forKey_(v181, v47, self->_wasCancelled, @"_wasCancelled", v48);
  objc_msgSend_encodeBool_forKey_(v181, v49, self->_wasAborted, @"_wasAborted", v50);
  objc_msgSend_encodeObject_forKey_(v181, v51, (uint64_t)self->_autoJoinParameters, @"_autoJoinParameters", v52);
  objc_msgSend_encodeInteger_forKey_(v181, v53, self->_retrySchedule, @"_retrySchedule", v54);
  uint64_t v58 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v55, self->_retryScheduleIndex, v56, v57);
  objc_msgSend_encodeObject_forKey_(v181, v59, (uint64_t)v58, @"_retryScheduleIndex", v60);

  objc_msgSend_encodeBool_forKey_(v181, v61, self->_didUseLocationOptimizedChannelList, @"_didUseLocationOptimizedChannelList", v62);
  objc_msgSend_encodeBool_forKey_(v181, v63, self->_didDetectColocatedNetworkEnvironment, @"_didDetectColocatedNetworkEnvironment", v64);
  objc_msgSend_encodeBool_forKey_(v181, v65, self->_wasAlreadyAssociated, @"_wasAlreadyAssociated", v66);
  objc_msgSend_encodeBool_forKey_(v181, v67, self->_didDeferJoinToDiscoverMorePreferredNetwork, @"_didDeferJoinToDiscoverMorePreferredNetwork", v68);
  objc_msgSend_encodeBool_forKey_(v181, v69, self->_didFallbackToJoinLessPreferredNetwork, @"_didFallbackToJoinLessPreferredNetwork", v70);
  objc_msgSend_encodeObject_forKey_(v181, v71, (uint64_t)self->_preferredChannelList, @"_preferredChannelList", v72);
  objc_msgSend_encodeObject_forKey_(v181, v73, (uint64_t)self->_recentChannelList, @"_recentChannelList", v74);
  objc_msgSend_encodeObject_forKey_(v181, v75, (uint64_t)self->_remainingChannelList, @"_remainingChannelList", v76);
  objc_msgSend_encodeObject_forKey_(v181, v77, (uint64_t)self->_optimizedChannelList, @"_optimizedChannelList", v78);
  uint64_t v82 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v79, self->_scanDuration, v80, v81);
  objc_msgSend_encodeObject_forKey_(v181, v83, (uint64_t)v82, @"_scanDuration", v84);

  objc_msgSend_encodeObject_forKey_(v181, v85, (uint64_t)self->_scanChannels, @"_scanChannels", v86);
  uint64_t v90 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v87, self->_preAssociationScanDuration, v88, v89);
  objc_msgSend_encodeObject_forKey_(v181, v91, (uint64_t)v90, @"_preAssociationScanDuration", v92);

  objc_msgSend_encodeObject_forKey_(v181, v93, (uint64_t)self->_preAssociationScanChannels, @"_preAssociationScanChannels", v94);
  uint64_t v98 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v95, self->_followup6GHzScanDuration, v96, v97);
  objc_msgSend_encodeObject_forKey_(v181, v99, (uint64_t)v98, @"_followup6GHzScanDuration", v100);

  objc_msgSend_encodeObject_forKey_(v181, v101, (uint64_t)self->_followup6GHzScanChannels, @"_followup6GHzScanChannels", v102);
  objc_msgSend_encodeObject_forKey_(v181, v103, (uint64_t)self->_scanErrors, @"_scanErrors", v104);
  uint64_t v108 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v105, self->_GASQueryDuration, v106, v107);
  objc_msgSend_encodeObject_forKey_(v181, v109, (uint64_t)v108, @"_GASQueryDuration", v110);

  objc_msgSend_encodeObject_forKey_(v181, v111, (uint64_t)self->_GASQueryNetworks, @"_GASQueryNetworks", v112);
  objc_msgSend_encodeObject_forKey_(v181, v113, (uint64_t)self->_GASQueryErrors, @"_GASQueryErrors", v114);
  uint64_t v118 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v115, self->_joinDuration, v116, v117);
  objc_msgSend_encodeObject_forKey_(v181, v119, (uint64_t)v118, @"_joinDuration", v120);

  objc_msgSend_encodeObject_forKey_(v181, v121, (uint64_t)self->_joinErrors, @"_joinErrors", v122);
  objc_msgSend_encodeObject_forKey_(v181, v123, (uint64_t)self->_network, @"_network", v124);
  objc_msgSend_encodeObject_forKey_(v181, v125, (uint64_t)self->_associatedNetwork, @"_associatedNetwork", v126);
  objc_msgSend_encodeObject_forKey_(v181, v127, (uint64_t)self->_candidates, @"_candidates", v128);
  objc_msgSend_encodeObject_forKey_(v181, v129, (uint64_t)self->_knownNetworks, @"_knownNetworks", v130);
  objc_msgSend_encodeBool_forKey_(v181, v131, self->_didTriggerReassoc, @"_didTriggerReassoc", v132);
  objc_msgSend_encodeBool_forKey_(v181, v133, self->_didPerformSeamlessSSIDTransition, @"_didPerformSeamlessSSIDTransition", v134);
  objc_msgSend_encodeBool_forKey_(v181, v135, self->_wasDiscoveredViaRNR, @"_wasDiscoveredViaRNR", v136);
  objc_msgSend_encodeBool_forKey_(v181, v137, self->_wasDiscoveredViaFILSD, @"_wasDiscoveredViaFILSD", v138);
  objc_msgSend_encodeBool_forKey_(v181, v139, self->_was6EDisabled, @"_was6EDisabled", v140);
  objc_msgSend_encodeBool_forKey_(v181, v141, self->_was6EPreferOn, @"_was6EPreferOn", v142);
  objc_msgSend_encodeBool_forKey_(v181, v143, self->_was6GHzDeprioritized, @"_was6GHzDeprioritized", v144);
  objc_msgSend_encodeBool_forKey_(v181, v145, self->_didIncludeRemainingNon2GHzChannels, @"_didIncludeRemainingNon2GHzChannels", v146);
  objc_msgSend_encodeBool_forKey_(v181, v147, self->_autoHotspotWasAttempted, @"_autoHotspotWasAttempted", v148);
  objc_msgSend_encodeBool_forKey_(v181, v149, self->_autoHotspotResult, @"_autoHotspotResult", v150);
  objc_msgSend_encodeBool_forKey_(v181, v151, self->_autoHotspotWasAborted, @"_autoHotspotWasAborted", v152);
  uint64_t v156 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v153, self->_autoHotspotDuration, v154, v155);
  objc_msgSend_encodeObject_forKey_(v181, v157, (uint64_t)v156, @"_autoHotspotDuration", v158);

  objc_msgSend_encodeObject_forKey_(v181, v159, (uint64_t)self->_autoHotspotError, @"_autoHotspotError", v160);
  objc_msgSend_encodeInteger_forKey_(v181, v161, self->_autoHotspotMode, @"_autoHotspotMode", v162);
  uint64_t v166 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v163, self->_autoHotspotBrowseDuration, v164, v165);
  objc_msgSend_encodeObject_forKey_(v181, v167, (uint64_t)v166, @"_autoHotspotBrowseDuration", v168);

  objc_msgSend_encodeObject_forKey_(v181, v169, (uint64_t)self->_autoHotspotBrowseError, @"_autoHotspotBrowseError", v170);
  uint64_t v174 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v171, self->_autoHotspotJoinDuration, v172, v173);
  objc_msgSend_encodeObject_forKey_(v181, v175, (uint64_t)v174, @"_autoHotspotJoinDuration", v176);

  objc_msgSend_encodeObject_forKey_(v181, v177, (uint64_t)self->_autoHotspotJoinErrors, @"_autoHotspotJoinErrors", v178);
  objc_msgSend_encodeObject_forKey_(v181, v179, (uint64_t)self->_hotspot, @"_hotspot", v180);
}

- (CWFAutoJoinMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v384.receiver = self;
  v384.super_class = (Class)CWFAutoJoinMetric;
  uint64_t v8 = [(CWFAutoJoinMetric *)&v384 init];
  if (v8)
  {
    v8->_BOOL result = objc_msgSend_decodeBoolForKey_(v4, v5, @"_result", v6, v7);
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"_duration", v11);
    v8->_duratiouint64_t n = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15, v16);

    uint64_t v17 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"_durationFromLinkDownTrigger", v19);
    v8->_durationFromLinkDownTrigger = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    uint64_t v25 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"_durationFromDisplayOnTrigger", v27);
    v8->_durationFromDisplayOnTrigger = objc_msgSend_unsignedIntegerValue(v28, v29, v30, v31, v32);

    uint64_t v33 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"_durationFromDeviceUnlockTrigger", v35);
    v8->_durationFromDeviceUnlockTrigger = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39, v40);

    uint64_t v41 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"_durationFromWiFiPowerOnTrigger", v43);
    v8->_durationFromWiFiPowerOnTrigger = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47, v48);

    v8->_previousNonRetryAutoJoinTrigger = objc_msgSend_decodeIntegerForKey_(v4, v49, @"_previousNonRetryAutoJoinTrigger", v50, v51);
    uint64_t v52 = objc_opt_class();
    uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, @"_durationFromNonRetryAutoJoinTrigger", v54);
    v8->_durationFromNonRetryAutoJoinTrigger = objc_msgSend_unsignedIntegerValue(v55, v56, v57, v58, v59);

    uint64_t v60 = objc_opt_class();
    uint64_t v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, @"_error", v62);
    error = v8->_error;
    v8->_error = (NSError *)v63;

    v8->_wasCancelled = objc_msgSend_decodeBoolForKey_(v4, v65, @"_wasCancelled", v66, v67);
    v8->_wasAborted = objc_msgSend_decodeBoolForKey_(v4, v68, @"_wasAborted", v69, v70);
    uint64_t v71 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, @"_autoJoinParameters", v73);
    autoJoinParameters = v8->_autoJoinParameters;
    v8->_autoJoinParameters = (CWFAutoJoinParameters *)v74;

    v8->_retrySchedule = objc_msgSend_decodeIntegerForKey_(v4, v76, @"_retrySchedule", v77, v78);
    uint64_t v79 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, @"_retryScheduleIndex", v81);
    v8->_retryScheduleIndex = objc_msgSend_unsignedIntegerValue(v82, v83, v84, v85, v86);

    v8->_didUseLocationOptimizedChannelList = objc_msgSend_decodeBoolForKey_(v4, v87, @"_didUseLocationOptimizedChannelList", v88, v89);
    v8->_didDetectColocatedNetworkEnvironment = objc_msgSend_decodeBoolForKey_(v4, v90, @"_didDetectColocatedNetworkEnvironment", v91, v92);
    v8->_wasAlreadyAssociated = objc_msgSend_decodeBoolForKey_(v4, v93, @"_wasAlreadyAssociated", v94, v95);
    v8->_didDeferJoinToDiscoverMorePreferredNetworuint64_t k = objc_msgSend_decodeBoolForKey_(v4, v96, @"_didDeferJoinToDiscoverMorePreferredNetwork", v97, v98);
    v8->_didFallbackToJoinLessPreferredNetworuint64_t k = objc_msgSend_decodeBoolForKey_(v4, v99, @"_didFallbackToJoinLessPreferredNetwork", v100, v101);
    uint64_t v102 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v103 = objc_opt_class();
    uint64_t v104 = objc_opt_class();
    uint64_t v108 = objc_msgSend_setWithObjects_(v102, v105, v103, v106, v107, v104, 0);
    uint64_t v111 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v109, (uint64_t)v108, @"_preferredChannelList", v110);
    preferredChannelList = v8->_preferredChannelList;
    v8->_preferredChannelList = (NSArray *)v111;

    uint64_t v113 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v114 = objc_opt_class();
    uint64_t v115 = objc_opt_class();
    uint64_t v119 = objc_msgSend_setWithObjects_(v113, v116, v114, v117, v118, v115, 0);
    uint64_t v122 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v120, (uint64_t)v119, @"_recentChannelList", v121);
    recentChannelList = v8->_recentChannelList;
    v8->_recentChannelList = (NSArray *)v122;

    uint64_t v124 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v125 = objc_opt_class();
    uint64_t v126 = objc_opt_class();
    uint64_t v130 = objc_msgSend_setWithObjects_(v124, v127, v125, v128, v129, v126, 0);
    uint64_t v133 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v131, (uint64_t)v130, @"_remainingChannelList", v132);
    remainingChannelList = v8->_remainingChannelList;
    v8->_remainingChannelList = (NSArray *)v133;

    int8x16_t v135 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v136 = objc_opt_class();
    uint64_t v137 = objc_opt_class();
    __int32 v141 = objc_msgSend_setWithObjects_(v135, v138, v136, v139, v140, v137, 0);
    uint64_t v144 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v142, (uint64_t)v141, @"_optimizedChannelList", v143);
    optimizedChannelList = v8->_optimizedChannelList;
    v8->_optimizedChannelList = (NSArray *)v144;

    uint64_t v146 = objc_opt_class();
    uint64_t v149 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v147, v146, @"_scanDuration", v148);
    v8->_scanDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v149, v150, v151, v152, v153);

    uint64_t v154 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v155 = objc_opt_class();
    uint64_t v156 = objc_opt_class();
    uint64_t v160 = objc_msgSend_setWithObjects_(v154, v157, v155, v158, v159, v156, 0);
    uint64_t v163 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v161, (uint64_t)v160, @"_scanChannels", v162);
    scanChannels = v8->_scanChannels;
    v8->_scanChannels = (NSArray *)v163;

    uint64_t v165 = objc_opt_class();
    uint64_t v168 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, @"_preAssociationScanDuration", v167);
    v8->_preAssociationScanDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v168, v169, v170, v171, v172);

    uint64_t v173 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v174 = objc_opt_class();
    uint64_t v175 = objc_opt_class();
    uint64_t v179 = objc_msgSend_setWithObjects_(v173, v176, v174, v177, v178, v175, 0);
    uint64_t v182 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v180, (uint64_t)v179, @"_preAssociationScanChannels", v181);
    preAssociationScanChannels = v8->_preAssociationScanChannels;
    v8->_preAssociationScanChannels = (NSArray *)v182;

    uint64_t v184 = objc_opt_class();
    uint64_t v187 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, @"_followup6GHzScanDuration", v186);
    v8->_followup6GHzScanDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v187, v188, v189, v190, v191);

    uint64_t v192 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v193 = objc_opt_class();
    uint64_t v194 = objc_opt_class();
    uint64_t v198 = objc_msgSend_setWithObjects_(v192, v195, v193, v196, v197, v194, 0);
    uint64_t v201 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v199, (uint64_t)v198, @"_followup6GHzScanChannels", v200);
    followup6GHzScanChannels = v8->_followup6GHzScanChannels;
    v8->_followup6GHzScanChannels = (NSArray *)v201;

    uint64_t v203 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v204 = objc_opt_class();
    uint64_t v205 = objc_opt_class();
    uint64_t v209 = objc_msgSend_setWithObjects_(v203, v206, v204, v207, v208, v205, 0);
    uint64_t v212 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v210, (uint64_t)v209, @"_scanErrors", v211);
    scanErrors = v8->_scanErrors;
    v8->_scanErrors = (NSArray *)v212;

    uint64_t v214 = objc_opt_class();
    uint64_t v217 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v215, v214, @"_GASQueryDuration", v216);
    v8->_GASQueryDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v217, v218, v219, v220, v221);

    uint64_t v222 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v223 = objc_opt_class();
    uint64_t v224 = objc_opt_class();
    uint64_t v228 = objc_msgSend_setWithObjects_(v222, v225, v223, v226, v227, v224, 0);
    uint64_t v231 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v229, (uint64_t)v228, @"_GASQueryNetworks", v230);
    GASQueryNetworks = v8->_GASQueryNetworks;
    v8->_GASQueryNetworks = (NSArray *)v231;

    uint64_t v233 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v234 = objc_opt_class();
    uint64_t v235 = objc_opt_class();
    uint64_t v239 = objc_msgSend_setWithObjects_(v233, v236, v234, v237, v238, v235, 0);
    uint64_t v242 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v240, (uint64_t)v239, @"_GASQueryErrors", v241);
    GASQueryErrors = v8->_GASQueryErrors;
    v8->_GASQueryErrors = (NSArray *)v242;

    uint64_t v244 = objc_opt_class();
    uint64_t v247 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v245, v244, @"_joinDuration", v246);
    v8->_joinDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v247, v248, v249, v250, v251);

    uint64_t v252 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v253 = objc_opt_class();
    uint64_t v254 = objc_opt_class();
    uint64_t v258 = objc_msgSend_setWithObjects_(v252, v255, v253, v256, v257, v254, 0);
    uint64_t v261 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v259, (uint64_t)v258, @"_joinErrors", v260);
    joinErrors = v8->_joinErrors;
    v8->_joinErrors = (NSArray *)v261;

    uint64_t v263 = objc_opt_class();
    uint64_t v266 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v264, v263, @"_network", v265);
    networuint64_t k = v8->_network;
    v8->_networuint64_t k = (CWFScanResult *)v266;

    uint64_t v268 = objc_opt_class();
    uint64_t v271 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v269, v268, @"_associatedNetwork", v270);
    associatedNetworuint64_t k = v8->_associatedNetwork;
    v8->_associatedNetworuint64_t k = (CWFScanResult *)v271;

    uint64_t v273 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v274 = objc_opt_class();
    uint64_t v275 = objc_opt_class();
    uint64_t v279 = objc_msgSend_setWithObjects_(v273, v276, v274, v277, v278, v275, 0);
    uint64_t v282 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v280, (uint64_t)v279, @"_candidates", v281);
    candidates = v8->_candidates;
    v8->_candidates = (NSArray *)v282;

    uint64_t v284 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v285 = objc_opt_class();
    uint64_t v286 = objc_opt_class();
    uint64_t v290 = objc_msgSend_setWithObjects_(v284, v287, v285, v288, v289, v286, 0);
    uint64_t v293 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v291, (uint64_t)v290, @"_knownNetworks", v292);
    knownNetworks = v8->_knownNetworks;
    v8->_knownNetworks = (NSArray *)v293;

    v8->_didTriggerReassoc = objc_msgSend_decodeBoolForKey_(v4, v295, @"_didTriggerReassoc", v296, v297);
    v8->_didPerformSeamlessSSIDTransitiouint64_t n = objc_msgSend_decodeBoolForKey_(v4, v298, @"_didPerformSeamlessSSIDTransition", v299, v300);
    v8->_wasDiscoveredViaRNR = objc_msgSend_decodeBoolForKey_(v4, v301, @"_wasDiscoveredViaRNR", v302, v303);
    v8->_wasDiscoveredViaFILSD = objc_msgSend_decodeBoolForKey_(v4, v304, @"_wasDiscoveredViaFILSD", v305, v306);
    v8->_was6EDisabled = objc_msgSend_decodeBoolForKey_(v4, v307, @"_was6EDisabled", v308, v309);
    v8->_was6EPreferOuint64_t n = objc_msgSend_decodeBoolForKey_(v4, v310, @"_was6EPreferOn", v311, v312);
    v8->_was6GHzDeprioritized = objc_msgSend_decodeBoolForKey_(v4, v313, @"_was6GHzDeprioritized", v314, v315);
    v8->_didIncludeRemainingNon2GHzChannels = objc_msgSend_decodeBoolForKey_(v4, v316, @"_didIncludeRemainingNon2GHzChannels", v317, v318);
    v8->_BOOL autoHotspotWasAttempted = objc_msgSend_decodeBoolForKey_(v4, v319, @"_autoHotspotWasAttempted", v320, v321);
    v8->_BOOL autoHotspotResult = objc_msgSend_decodeBoolForKey_(v4, v322, @"_autoHotspotResult", v323, v324);
    v8->_BOOL autoHotspotWasAborted = objc_msgSend_decodeBoolForKey_(v4, v325, @"_autoHotspotWasAborted", v326, v327);
    uint64_t v328 = objc_opt_class();
    uint64_t v331 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v329, v328, @"_autoHotspotDuration", v330);
    v8->_autoHotspotDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v331, v332, v333, v334, v335);

    uint64_t v336 = objc_opt_class();
    uint64_t v339 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v337, v336, @"_autoHotspotError", v338);
    autoHotspotError = v8->_autoHotspotError;
    v8->_autoHotspotError = (NSError *)v339;

    v8->_autoHotspotMode = objc_msgSend_decodeIntegerForKey_(v4, v341, @"_autoHotspotMode", v342, v343);
    uint64_t v344 = objc_opt_class();
    uint64_t v347 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v345, v344, @"_autoHotspotBrowseDuration", v346);
    v8->_autoHotspotBrowseDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v347, v348, v349, v350, v351);

    uint64_t v352 = objc_opt_class();
    uint64_t v355 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v353, v352, @"_autoHotspotBrowseError", v354);
    autoHotspotBrowseError = v8->_autoHotspotBrowseError;
    v8->_autoHotspotBrowseError = (NSError *)v355;

    uint64_t v357 = objc_opt_class();
    uint64_t v360 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v358, v357, @"_autoHotspotJoinDuration", v359);
    v8->_autoHotspotJoinDuratiouint64_t n = objc_msgSend_unsignedIntegerValue(v360, v361, v362, v363, v364);

    uint64_t v365 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v366 = objc_opt_class();
    uint64_t v367 = objc_opt_class();
    uint64_t v371 = objc_msgSend_setWithObjects_(v365, v368, v366, v369, v370, v367, 0);
    uint64_t v374 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v372, (uint64_t)v371, @"_autoHotspotJoinErrors", v373);
    autoHotspotJoinErrors = v8->_autoHotspotJoinErrors;
    v8->_autoHotspotJoinErrors = (NSArray *)v374;

    if (sub_1B501D350())
    {
      uint64_t v386 = 0;
      int v387 = &v386;
      uint64_t v388 = 0x2050000000;
      uint64_t v376 = (void *)qword_1E9D45C20;
      uint64_t v389 = qword_1E9D45C20;
      if (!qword_1E9D45C20)
      {
        v385[0] = MEMORY[0x1E4F143A8];
        v385[1] = 3221225472;
        v385[2] = sub_1B501D494;
        v385[3] = &unk_1E60BAFD8;
        v385[4] = &v386;
        sub_1B501D494(v385);
        uint64_t v376 = (void *)v387[3];
      }
      id v377 = v376;
      _Block_object_dispose(&v386, 8);
      uint64_t v378 = objc_opt_class();
      uint64_t v381 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v379, v378, @"_hotspot", v380);
      hotspot = v8->_hotspot;
      v8->_hotspot = (SFRemoteHotspotDevice *)v381;
    }
  }

  return v8;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_BOOL result = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duratiouint64_t n = a3;
}

- (unint64_t)durationFromLinkDownTrigger
{
  return self->_durationFromLinkDownTrigger;
}

- (void)setDurationFromLinkDownTrigger:(unint64_t)a3
{
  self->_durationFromLinkDownTrigger = a3;
}

- (unint64_t)durationFromDisplayOnTrigger
{
  return self->_durationFromDisplayOnTrigger;
}

- (void)setDurationFromDisplayOnTrigger:(unint64_t)a3
{
  self->_durationFromDisplayOnTrigger = a3;
}

- (unint64_t)durationFromDeviceUnlockTrigger
{
  return self->_durationFromDeviceUnlockTrigger;
}

- (void)setDurationFromDeviceUnlockTrigger:(unint64_t)a3
{
  self->_durationFromDeviceUnlockTrigger = a3;
}

- (unint64_t)durationFromWiFiPowerOnTrigger
{
  return self->_durationFromWiFiPowerOnTrigger;
}

- (void)setDurationFromWiFiPowerOnTrigger:(unint64_t)a3
{
  self->_durationFromWiFiPowerOnTrigger = a3;
}

- (int64_t)previousNonRetryAutoJoinTrigger
{
  return self->_previousNonRetryAutoJoinTrigger;
}

- (void)setPreviousNonRetryAutoJoinTrigger:(int64_t)a3
{
  self->_previousNonRetryAutoJoinTrigger = a3;
}

- (unint64_t)durationFromNonRetryAutoJoinTrigger
{
  return self->_durationFromNonRetryAutoJoinTrigger;
}

- (void)setDurationFromNonRetryAutoJoinTrigger:(unint64_t)a3
{
  self->_durationFromNonRetryAutoJoinTrigger = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)wasCancelled
{
  return self->_wasCancelled;
}

- (void)setWasCancelled:(BOOL)a3
{
  self->_wasCancelled = a3;
}

- (BOOL)wasAborted
{
  return self->_wasAborted;
}

- (void)setWasAborted:(BOOL)a3
{
  self->_wasAborted = a3;
}

- (CWFAutoJoinParameters)autoJoinParameters
{
  return self->_autoJoinParameters;
}

- (void)setAutoJoinParameters:(id)a3
{
}

- (int64_t)retrySchedule
{
  return self->_retrySchedule;
}

- (void)setRetrySchedule:(int64_t)a3
{
  self->_retrySchedule = a3;
}

- (unint64_t)retryScheduleIndex
{
  return self->_retryScheduleIndex;
}

- (void)setRetryScheduleIndex:(unint64_t)a3
{
  self->_retryScheduleIndex = a3;
}

- (BOOL)was6EDisabled
{
  return self->_was6EDisabled;
}

- (void)setWas6EDisabled:(BOOL)a3
{
  self->_was6EDisabled = a3;
}

- (BOOL)was6EPreferOn
{
  return self->_was6EPreferOn;
}

- (void)setWas6EPreferOn:(BOOL)a3
{
  self->_was6EPreferOuint64_t n = a3;
}

- (BOOL)was6GHzDeprioritized
{
  return self->_was6GHzDeprioritized;
}

- (void)setWas6GHzDeprioritized:(BOOL)a3
{
  self->_was6GHzDeprioritized = a3;
}

- (BOOL)wasAlreadyAssociated
{
  return self->_wasAlreadyAssociated;
}

- (void)setWasAlreadyAssociated:(BOOL)a3
{
  self->_wasAlreadyAssociated = a3;
}

- (BOOL)didUseLocationOptimizedChannelList
{
  return self->_didUseLocationOptimizedChannelList;
}

- (void)setDidUseLocationOptimizedChannelList:(BOOL)a3
{
  self->_didUseLocationOptimizedChannelList = a3;
}

- (BOOL)didDetectColocatedNetworkEnvironment
{
  return self->_didDetectColocatedNetworkEnvironment;
}

- (void)setDidDetectColocatedNetworkEnvironment:(BOOL)a3
{
  self->_didDetectColocatedNetworkEnvironment = a3;
}

- (BOOL)didDeferJoinToDiscoverMorePreferredNetwork
{
  return self->_didDeferJoinToDiscoverMorePreferredNetwork;
}

- (void)setDidDeferJoinToDiscoverMorePreferredNetwork:(BOOL)a3
{
  self->_didDeferJoinToDiscoverMorePreferredNetworuint64_t k = a3;
}

- (BOOL)didFallbackToJoinLessPreferredNetwork
{
  return self->_didFallbackToJoinLessPreferredNetwork;
}

- (void)setDidFallbackToJoinLessPreferredNetwork:(BOOL)a3
{
  self->_didFallbackToJoinLessPreferredNetworuint64_t k = a3;
}

- (unint64_t)scanDuration
{
  return self->_scanDuration;
}

- (void)setScanDuration:(unint64_t)a3
{
  self->_scanDuratiouint64_t n = a3;
}

- (NSArray)scanChannels
{
  return self->_scanChannels;
}

- (void)setScanChannels:(id)a3
{
}

- (unint64_t)preAssociationScanDuration
{
  return self->_preAssociationScanDuration;
}

- (void)setPreAssociationScanDuration:(unint64_t)a3
{
  self->_preAssociationScanDuratiouint64_t n = a3;
}

- (NSArray)preAssociationScanChannels
{
  return self->_preAssociationScanChannels;
}

- (void)setPreAssociationScanChannels:(id)a3
{
}

- (NSArray)scanErrors
{
  return self->_scanErrors;
}

- (void)setScanErrors:(id)a3
{
}

- (unint64_t)GASQueryDuration
{
  return self->_GASQueryDuration;
}

- (void)setGASQueryDuration:(unint64_t)a3
{
  self->_GASQueryDuratiouint64_t n = a3;
}

- (NSArray)GASQueryNetworks
{
  return self->_GASQueryNetworks;
}

- (void)setGASQueryNetworks:(id)a3
{
}

- (NSArray)GASQueryErrors
{
  return self->_GASQueryErrors;
}

- (void)setGASQueryErrors:(id)a3
{
}

- (unint64_t)joinDuration
{
  return self->_joinDuration;
}

- (void)setJoinDuration:(unint64_t)a3
{
  self->_joinDuratiouint64_t n = a3;
}

- (NSArray)joinErrors
{
  return self->_joinErrors;
}

- (void)setJoinErrors:(id)a3
{
}

- (CWFScanResult)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (CWFScanResult)associatedNetwork
{
  return self->_associatedNetwork;
}

- (void)setAssociatedNetwork:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
}

- (BOOL)didPerformSeamlessSSIDTransition
{
  return self->_didPerformSeamlessSSIDTransition;
}

- (void)setDidPerformSeamlessSSIDTransition:(BOOL)a3
{
  self->_didPerformSeamlessSSIDTransitiouint64_t n = a3;
}

- (BOOL)didTriggerReassoc
{
  return self->_didTriggerReassoc;
}

- (void)setDidTriggerReassoc:(BOOL)a3
{
  self->_didTriggerReassoc = a3;
}

- (NSArray)preferredChannelList
{
  return self->_preferredChannelList;
}

- (void)setPreferredChannelList:(id)a3
{
}

- (NSArray)recentChannelList
{
  return self->_recentChannelList;
}

- (void)setRecentChannelList:(id)a3
{
}

- (NSArray)remainingChannelList
{
  return self->_remainingChannelList;
}

- (void)setRemainingChannelList:(id)a3
{
}

- (NSArray)optimizedChannelList
{
  return self->_optimizedChannelList;
}

- (void)setOptimizedChannelList:(id)a3
{
}

- (BOOL)wasDiscoveredViaRNR
{
  return self->_wasDiscoveredViaRNR;
}

- (void)setWasDiscoveredViaRNR:(BOOL)a3
{
  self->_wasDiscoveredViaRNR = a3;
}

- (BOOL)wasDiscoveredViaFILSD
{
  return self->_wasDiscoveredViaFILSD;
}

- (void)setWasDiscoveredViaFILSD:(BOOL)a3
{
  self->_wasDiscoveredViaFILSD = a3;
}

- (unint64_t)followup6GHzScanDuration
{
  return self->_followup6GHzScanDuration;
}

- (void)setFollowup6GHzScanDuration:(unint64_t)a3
{
  self->_followup6GHzScanDuratiouint64_t n = a3;
}

- (NSArray)followup6GHzScanChannels
{
  return self->_followup6GHzScanChannels;
}

- (void)setFollowup6GHzScanChannels:(id)a3
{
}

- (BOOL)didIncludeRemainingNon2GHzChannels
{
  return self->_didIncludeRemainingNon2GHzChannels;
}

- (void)setDidIncludeRemainingNon2GHzChannels:(BOOL)a3
{
  self->_didIncludeRemainingNon2GHzChannels = a3;
}

- (BOOL)autoHotspotWasAttempted
{
  return self->_autoHotspotWasAttempted;
}

- (void)setAutoHotspotWasAttempted:(BOOL)a3
{
  self->_BOOL autoHotspotWasAttempted = a3;
}

- (BOOL)autoHotspotResult
{
  return self->_autoHotspotResult;
}

- (void)setAutoHotspotResult:(BOOL)a3
{
  self->_BOOL autoHotspotResult = a3;
}

- (unint64_t)autoHotspotDuration
{
  return self->_autoHotspotDuration;
}

- (void)setAutoHotspotDuration:(unint64_t)a3
{
  self->_autoHotspotDuratiouint64_t n = a3;
}

- (BOOL)autoHotspotWasAborted
{
  return self->_autoHotspotWasAborted;
}

- (void)setAutoHotspotWasAborted:(BOOL)a3
{
  self->_BOOL autoHotspotWasAborted = a3;
}

- (NSError)autoHotspotError
{
  return self->_autoHotspotError;
}

- (void)setAutoHotspotError:(id)a3
{
}

- (int64_t)autoHotspotMode
{
  return self->_autoHotspotMode;
}

- (void)setAutoHotspotMode:(int64_t)a3
{
  self->_autoHotspotMode = a3;
}

- (unint64_t)autoHotspotBrowseDuration
{
  return self->_autoHotspotBrowseDuration;
}

- (void)setAutoHotspotBrowseDuration:(unint64_t)a3
{
  self->_autoHotspotBrowseDuratiouint64_t n = a3;
}

- (NSError)autoHotspotBrowseError
{
  return self->_autoHotspotBrowseError;
}

- (void)setAutoHotspotBrowseError:(id)a3
{
}

- (unint64_t)autoHotspotJoinDuration
{
  return self->_autoHotspotJoinDuration;
}

- (void)setAutoHotspotJoinDuration:(unint64_t)a3
{
  self->_autoHotspotJoinDuratiouint64_t n = a3;
}

- (NSArray)autoHotspotJoinErrors
{
  return self->_autoHotspotJoinErrors;
}

- (void)setAutoHotspotJoinErrors:(id)a3
{
}

- (SFRemoteHotspotDevice)hotspot
{
  return self->_hotspot;
}

- (void)setHotspot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspot, 0);
  objc_storeStrong((id *)&self->_autoHotspotJoinErrors, 0);
  objc_storeStrong((id *)&self->_autoHotspotBrowseError, 0);
  objc_storeStrong((id *)&self->_autoHotspotError, 0);
  objc_storeStrong((id *)&self->_followup6GHzScanChannels, 0);
  objc_storeStrong((id *)&self->_optimizedChannelList, 0);
  objc_storeStrong((id *)&self->_remainingChannelList, 0);
  objc_storeStrong((id *)&self->_recentChannelList, 0);
  objc_storeStrong((id *)&self->_preferredChannelList, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_associatedNetwork, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_joinErrors, 0);
  objc_storeStrong((id *)&self->_GASQueryErrors, 0);
  objc_storeStrong((id *)&self->_GASQueryNetworks, 0);
  objc_storeStrong((id *)&self->_scanErrors, 0);
  objc_storeStrong((id *)&self->_preAssociationScanChannels, 0);
  objc_storeStrong((id *)&self->_scanChannels, 0);
  objc_storeStrong((id *)&self->_autoJoinParameters, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end