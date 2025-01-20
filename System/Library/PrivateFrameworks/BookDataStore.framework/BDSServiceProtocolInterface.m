@interface BDSServiceProtocolInterface
+ (void)configureInterface:(id)a3;
@end

@implementation BDSServiceProtocolInterface

+ (void)configureInterface:(id)a3
{
  v489[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  v489[0] = objc_opt_class();
  v489[1] = objc_opt_class();
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v489, 2, v6, v7, v8, v9);
  uint64_t v17 = objc_msgSend_setWithArray_(v3, v11, (uint64_t)v10, v12, v13, v14, v15, v16);

  v18 = (void *)MEMORY[0x263EFFA08];
  v488[0] = objc_opt_class();
  v488[1] = objc_opt_class();
  v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v488, 2, v20, v21, v22, v23);
  uint64_t v31 = objc_msgSend_setWithArray_(v18, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  v32 = (void *)MEMORY[0x263EFFA08];
  v487[0] = objc_opt_class();
  v487[1] = objc_opt_class();
  v487[2] = objc_opt_class();
  v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)v487, 3, v34, v35, v36, v37);
  v45 = objc_msgSend_setWithArray_(v32, v39, (uint64_t)v38, v40, v41, v42, v43, v44);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v46, (uint64_t)v45, (uint64_t)sel_setAssetDetails_completion_, 0, 0, v47, v48);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v49, v17, (uint64_t)sel_getAssetDetailChangesSince_completion_, 0, 1, v50, v51);
  v466 = (void *)v31;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v52, v31, (uint64_t)sel_assetDetailsForAssetIDs_completion_, 0, 1, v53, v54);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v55, v31, (uint64_t)sel_fetchAssetDetailsIncludingDeleted_completion_, 0, 1, v56, v57);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v58, v31, (uint64_t)sel_fetchAssetDetailsForUnsyncedTastes_, 0, 1, v59, v60);
  v61 = (void *)MEMORY[0x263EFFA08];
  v486[0] = objc_opt_class();
  v486[1] = objc_opt_class();
  v67 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v62, (uint64_t)v486, 2, v63, v64, v65, v66);
  v465 = objc_msgSend_setWithArray_(v61, v68, (uint64_t)v67, v69, v70, v71, v72, v73);

  v74 = (void *)MEMORY[0x263EFFA08];
  v485[0] = objc_opt_class();
  v485[1] = objc_opt_class();
  v485[2] = objc_opt_class();
  v80 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v75, (uint64_t)v485, 3, v76, v77, v78, v79);
  v87 = objc_msgSend_setWithArray_(v74, v81, (uint64_t)v80, v82, v83, v84, v85, v86);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v88, (uint64_t)v87, (uint64_t)sel_setReadingNowDetails_completion_, 0, 0, v89, v90);

  uint64_t v91 = v17;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v92, v17, (uint64_t)sel_getReadingNowDetailChangesSince_completion_, 0, 1, v93, v94);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v95, (uint64_t)v465, (uint64_t)sel_readingNowDetailsForAssetIDs_completion_, 0, 1, v96, v97);
  v98 = (void *)MEMORY[0x263EFFA08];
  v484[0] = objc_opt_class();
  v484[1] = objc_opt_class();
  v104 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v99, (uint64_t)v484, 2, v100, v101, v102, v103);
  uint64_t v111 = objc_msgSend_setWithArray_(v98, v105, (uint64_t)v104, v106, v107, v108, v109, v110);

  v112 = (void *)MEMORY[0x263EFFA08];
  v483[0] = objc_opt_class();
  v483[1] = objc_opt_class();
  v483[2] = objc_opt_class();
  v118 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v113, (uint64_t)v483, 3, v114, v115, v116, v117);
  v125 = objc_msgSend_setWithArray_(v112, v119, (uint64_t)v118, v120, v121, v122, v123, v124);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v126, (uint64_t)v125, (uint64_t)sel_setAssetReviews_completion_, 0, 0, v127, v128);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v129, v91, (uint64_t)sel_getAssetReviewChangesSince_completion_, 0, 1, v130, v131);
  v464 = (void *)v111;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v132, v111, (uint64_t)sel_assetReviewsForAssetReviewIDs_completion_, 0, 1, v133, v134);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v135, v111, (uint64_t)sel_fetchAssetReviewsForUserID_includingDeleted_completion_, 0, 1, v136, v137);
  v138 = (void *)MEMORY[0x263EFFA08];
  v482[0] = objc_opt_class();
  v482[1] = objc_opt_class();
  v144 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v139, (uint64_t)v482, 2, v140, v141, v142, v143);
  v463 = objc_msgSend_setWithArray_(v138, v145, (uint64_t)v144, v146, v147, v148, v149, v150);

  v151 = (void *)MEMORY[0x263EFFA08];
  v481[0] = objc_opt_class();
  v481[1] = objc_opt_class();
  v481[2] = objc_opt_class();
  v157 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v152, (uint64_t)v481, 3, v153, v154, v155, v156);
  v164 = objc_msgSend_setWithArray_(v151, v158, (uint64_t)v157, v159, v160, v161, v162, v163);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v165, (uint64_t)v164, (uint64_t)sel_addStoreItems_completion_, 0, 0, v166, v167);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v168, (uint64_t)v463, (uint64_t)sel_fetchStoreItemsIncludingDeleted_completion_, 0, 1, v169, v170);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v171, v91, (uint64_t)sel_getStoreItemChangesSince_completion_, 0, 1, v172, v173);
  v174 = (void *)MEMORY[0x263EFFA08];
  v480[0] = objc_opt_class();
  v480[1] = objc_opt_class();
  v180 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v175, (uint64_t)v480, 2, v176, v177, v178, v179);
  uint64_t v187 = objc_msgSend_setWithArray_(v174, v181, (uint64_t)v180, v182, v183, v184, v185, v186);

  v188 = (void *)MEMORY[0x263EFFA08];
  v479[0] = objc_opt_class();
  v479[1] = objc_opt_class();
  v479[2] = objc_opt_class();
  v194 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v189, (uint64_t)v479, 3, v190, v191, v192, v193);
  v201 = objc_msgSend_setWithArray_(v188, v195, (uint64_t)v194, v196, v197, v198, v199, v200);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v202, (uint64_t)v201, (uint64_t)sel_setCollectionDetails_completion_, 0, 0, v203, v204);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v205, v91, (uint64_t)sel_getCollectionDetailChangesSince_completion_, 0, 1, v206, v207);
  v462 = (void *)v187;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v208, v187, (uint64_t)sel_collectionDetailsForCollectionIDs_completion_, 0, 1, v209, v210);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v211, v187, (uint64_t)sel_fetchCollectionDetailsIncludingDeleted_completion_, 0, 1, v212, v213);
  v214 = (void *)MEMORY[0x263EFFA08];
  v478[0] = objc_opt_class();
  v478[1] = objc_opt_class();
  v220 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v215, (uint64_t)v478, 2, v216, v217, v218, v219);
  uint64_t v227 = objc_msgSend_setWithArray_(v214, v221, (uint64_t)v220, v222, v223, v224, v225, v226);

  v228 = (void *)MEMORY[0x263EFFA08];
  v477[0] = objc_opt_class();
  v477[1] = objc_opt_class();
  v477[2] = objc_opt_class();
  v234 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v229, (uint64_t)v477, 3, v230, v231, v232, v233);
  v241 = objc_msgSend_setWithArray_(v228, v235, (uint64_t)v234, v236, v237, v238, v239, v240);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v242, (uint64_t)v241, (uint64_t)sel_setCollectionMembers_completion_, 0, 0, v243, v244);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v245, v91, (uint64_t)sel_getCollectionMemberChangesSince_completion_, 0, 1, v246, v247);
  v461 = (void *)v227;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v248, v227, (uint64_t)sel_fetchCollectionMembersIncludingDeleted_completion_, 0, 1, v249, v250);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v251, v227, (uint64_t)sel_fetchCollectionMembersInCollectionID_completion_, 0, 1, v252, v253);
  v254 = (void *)MEMORY[0x263EFFA08];
  v476[0] = objc_opt_class();
  v476[1] = objc_opt_class();
  v260 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v255, (uint64_t)v476, 2, v256, v257, v258, v259);
  v267 = objc_msgSend_setWithArray_(v254, v261, (uint64_t)v260, v262, v263, v264, v265, v266);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v268, (uint64_t)v267, (uint64_t)sel_setBookWidgetInfo_completion_, 0, 0, v269, v270);

  v271 = (void *)MEMORY[0x263EFFA08];
  v475[0] = objc_opt_class();
  v475[1] = objc_opt_class();
  v277 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v272, (uint64_t)v475, 2, v273, v274, v275, v276);
  v284 = objc_msgSend_setWithArray_(v271, v278, (uint64_t)v277, v279, v280, v281, v282, v283);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v285, (uint64_t)v284, (uint64_t)sel_getBookWidgetDataWithLimit_completion_, 0, 1, v286, v287);

  v288 = (void *)MEMORY[0x263EFFA08];
  v474[0] = objc_opt_class();
  v474[1] = objc_opt_class();
  v294 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v289, (uint64_t)v474, 2, v290, v291, v292, v293);
  v301 = objc_msgSend_setWithArray_(v288, v295, (uint64_t)v294, v296, v297, v298, v299, v300);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v302, (uint64_t)v301, (uint64_t)sel_getBookWidgetInfoWithLimit_completion_, 0, 1, v303, v304);

  v305 = (void *)MEMORY[0x263EFFA08];
  v473[0] = objc_opt_class();
  v473[1] = objc_opt_class();
  v311 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v306, (uint64_t)v473, 2, v307, v308, v309, v310);
  uint64_t v318 = objc_msgSend_setWithArray_(v305, v312, (uint64_t)v311, v313, v314, v315, v316, v317);

  v319 = (void *)v318;
  v460 = (void *)v318;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v320, v318, (uint64_t)sel_setUserDatum_completion_, 0, 0, v321, v322);
  v472[0] = objc_opt_class();
  v472[1] = objc_opt_class();
  v328 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v323, (uint64_t)v472, 2, v324, v325, v326, v327);
  v335 = objc_msgSend_setByAddingObjectsFromArray_(v319, v329, (uint64_t)v328, v330, v331, v332, v333, v334);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v336, (uint64_t)v335, (uint64_t)sel_setUserData_completion_, 0, 0, v337, v338);

  v339 = (void *)MEMORY[0x263EFFA08];
  v471[0] = objc_opt_class();
  v471[1] = objc_opt_class();
  v345 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v340, (uint64_t)v471, 2, v341, v342, v343, v344);
  v459 = objc_msgSend_setWithArray_(v339, v346, (uint64_t)v345, v347, v348, v349, v350, v351);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v352, (uint64_t)v459, (uint64_t)sel_fetchUserDataIncludingDeleted_completion_, 0, 1, v353, v354);
  uint64_t v355 = v91;
  v458 = (void *)v91;
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v356, v91, (uint64_t)sel_getUserDataChangesSince_completion_, 0, 1, v357, v358);
  v359 = (void *)MEMORY[0x263EFFA08];
  v470[0] = objc_opt_class();
  v470[1] = objc_opt_class();
  v365 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v360, (uint64_t)v470, 2, v361, v362, v363, v364);
  v372 = objc_msgSend_setWithArray_(v359, v366, (uint64_t)v365, v367, v368, v369, v370, v371);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v373, (uint64_t)v372, (uint64_t)sel_setEngagementData_completion_, 0, 0, v374, v375);
  v469[0] = objc_opt_class();
  v469[1] = objc_opt_class();
  v381 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v376, (uint64_t)v469, 2, v377, v378, v379, v380);
  v388 = objc_msgSend_setByAddingObjectsFromArray_(v372, v382, (uint64_t)v381, v383, v384, v385, v386, v387);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v389, (uint64_t)v388, (uint64_t)sel_setEngagementDatas_completion_, 0, 0, v390, v391);

  v392 = (void *)MEMORY[0x263EFFA08];
  v468[0] = objc_opt_class();
  v468[1] = objc_opt_class();
  v398 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v393, (uint64_t)v468, 2, v394, v395, v396, v397);
  v405 = objc_msgSend_setWithArray_(v392, v399, (uint64_t)v398, v400, v401, v402, v403, v404);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v406, (uint64_t)v405, (uint64_t)sel_fetchEngagementDatasIncludingDeleted_completion_, 0, 1, v407, v408);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v409, v355, (uint64_t)sel_getEngagementDataChangesSince_completion_, 0, 1, v410, v411);
  v412 = (void *)MEMORY[0x263EFFA08];
  uint64_t v413 = objc_opt_class();
  uint64_t v414 = objc_opt_class();
  uint64_t v415 = objc_opt_class();
  uint64_t v416 = objc_opt_class();
  v423 = objc_msgSend_setWithObjects_(v412, v417, v413, v418, v419, v420, v421, v422, v414, v415, v416, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v424, (uint64_t)v423, (uint64_t)sel_priceTrackingSetConfiguration_completion_, 0, 0, v425, v426);

  v427 = (void *)MEMORY[0x263EFFA08];
  v467[0] = objc_opt_class();
  v467[1] = objc_opt_class();
  v433 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v428, (uint64_t)v467, 2, v429, v430, v431, v432);
  v440 = objc_msgSend_setWithArray_(v427, v434, (uint64_t)v433, v435, v436, v437, v438, v439);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v441, (uint64_t)v440, (uint64_t)sel_priceTrackingCtlAddTrackedItems_completion_, 0, 0, v442, v443);

  v444 = (void *)MEMORY[0x263EFFA08];
  uint64_t v445 = objc_opt_class();
  uint64_t v446 = objc_opt_class();
  uint64_t v447 = objc_opt_class();
  v454 = objc_msgSend_setWithObjects_(v444, v448, v445, v449, v450, v451, v452, v453, v446, v447, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v455, (uint64_t)v454, (uint64_t)sel_priceTrackingCtlOverrideReferencePrices_completion_, 0, 0, v456, v457);
}

@end