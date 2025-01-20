@interface CKMergeableDeltaMetadata
+ (BOOL)supportsSecureCoding;
+ (id)deliverableDeltaMetadatasInDeltaSet:(id)a3 withMergeableValueCurrentStateVector:(id)a4 deliveryRequirements:(unint64_t)a5;
+ (id)mergeableDeltaMetadataByCombiningMetadatas:(id)a3;
+ (id)replacementDeltaMetadatasForDeltaDirectory:(id)a3 withNextDeltaMetadata:(id)a4 currentStateVector:(id)a5 deltaDirectoryDeliveryRequirements:(unint64_t)a6 error:(id *)a7;
- (BOOL)_isEquivalent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampClockVector)dependenciesVector;
- (CKDistributedTimestampClockVector)previousVector;
- (CKDistributedTimestampStateVector)contentsVector;
- (CKDistributedTimestampStateVector)removalsVector;
- (CKMergeableDeltaMetadata)initWithCoder:(id)a3;
- (CKMergeableDeltaMetadata)initWithIdentifier:(id)a3 vectors:(id)a4 replacedDeltaIdentifiers:(id)a5;
- (CKMergeableDeltaMetadata)initWithVectors:(id)a3;
- (CKMergeableDeltaVectors)vectors;
- (NSSet)replacedDeltaIdentifiers;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4;
- (unint64_t)hash;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setReplacedDeltaIdentifiers:(id)a3;
- (void)setVectors:(id)a3;
@end

@implementation CKMergeableDeltaMetadata

+ (id)replacementDeltaMetadatasForDeltaDirectory:(id)a3 withNextDeltaMetadata:(id)a4 currentStateVector:(id)a5 deltaDirectoryDeliveryRequirements:(unint64_t)a6 error:(id *)a7
{
  uint64_t v782 = *MEMORY[0x1E4F143B8];
  id v644 = a3;
  id v10 = a4;
  id v702 = a5;
  id v684 = (id)objc_opt_new();
  v635 = (void *)MEMORY[0x18C12ADA0]();
  v14 = objc_msgSend_vectors(v10, v11, v12, v13);
  v18 = objc_msgSend_contents(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_timestampCount(v18, v19, v20, v21);

  if (!v22)
  {

    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    id v641 = v644;
    id v10 = 0;
    char v57 = 1;
    goto LABEL_8;
  }
  v23 = objc_opt_new();
  v27 = objc_msgSend_vectors(v10, v24, v25, v26);
  v31 = objc_msgSend_previous(v27, v28, v29, v30);
  objc_msgSend_unionVector_(v23, v32, (uint64_t)v31, v33);

  v37 = objc_msgSend_vectors(v10, v34, v35, v36);
  uint64_t v41 = objc_msgSend_contents(v37, v38, v39, v40);
  v45 = objc_msgSend_clockVector((void *)v41, v42, v43, v44);
  objc_msgSend_unionVector_(v23, v46, (uint64_t)v45, v47);

  v51 = objc_msgSend_clockVector(v702, v48, v49, v50);
  LOBYTE(v41) = objc_msgSend_isEqual_(v23, v52, (uint64_t)v51, v53);

  if ((v41 & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v54, *MEMORY[0x1E4F1C3C8], @"Next delta %@ was not generated using current state vector %@", v10, v702);
  }

  objc_msgSend_setByAddingObject_(v644, v55, (uint64_t)v10, v56);
  id v641 = (id)objc_claimAutoreleasedReturnValue();
  char v57 = 0;
LABEL_8:
  v58 = objc_opt_new();
  v60 = objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(a1, v59, (uint64_t)v641, (uint64_t)v58, a6);

  unint64_t v634 = a6;
  if (v57)
  {
LABEL_18:
    id v10 = 0;
    goto LABEL_19;
  }
  if ((objc_msgSend_containsObject_(v60, v61, (uint64_t)v10, v62) & 1) == 0)
  {
    v69 = objc_msgSend_allObjects(v644, v63, v64, v65);
    v72 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v70, (uint64_t)v69, v71);

    v73 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v73);
    }

    v74 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v72;
      _os_log_fault_impl(&dword_18AF10000, v74, OS_LOG_TYPE_FAULT, "Next delta %@ may not be deliverable with aggregated delta directory metadata %@", buf, 0x16u);
    }

    goto LABEL_18;
  }
  if (!v10)
  {
LABEL_19:
    char v636 = 1;
    goto LABEL_20;
  }
  if (objc_msgSend_containsObject_(v644, v63, (uint64_t)v10, v65))
  {
    char v636 = 0;
LABEL_20:
    v701 = v10;
    id v637 = v60;
    goto LABEL_21;
  }
  v701 = v10;
  v421 = objc_msgSend_mutableCopy(v60, v66, v67, v68);
  objc_msgSend_removeObject_(v421, v422, (uint64_t)v10, v423);
  id v637 = (id)objc_msgSend_copy(v421, v424, v425, v426);

  char v636 = 0;
LABEL_21:
  id v638 = v60;

  v670 = objc_opt_new();
  v700 = objc_opt_new();
  v683 = objc_opt_new();
  v671 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v75, v76, v77);
  v672 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v78, v79, v80);
  long long v763 = 0u;
  long long v762 = 0u;
  long long v761 = 0u;
  long long v760 = 0u;
  obuint64_t j = v637;
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v760, (uint64_t)v781, 16);
  if (v82)
  {
    uint64_t v83 = *(void *)v761;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v761 != v83) {
          objc_enumerationMutation(obj);
        }
        v85 = *(void **)(*((void *)&v760 + 1) + 8 * i);
        v86 = (void *)MEMORY[0x18C12ADA0]();
        id v87 = v702;
        v91 = objc_msgSend_vectors(v85, v88, v89, v90);
        v95 = objc_msgSend_contents(v91, v92, v93, v94);
        char hasAtomStateNotInStateVector = objc_msgSend_hasAtomStateNotInStateVector_(v95, v96, (uint64_t)v87, v97);

        if ((hasAtomStateNotInStateVector & 1) == 0)
        {
          v102 = objc_msgSend_mutableCopy(v87, v99, v100, v101);
          v106 = objc_msgSend_vectors(v85, v103, v104, v105);
          v110 = objc_msgSend_contents(v106, v107, v108, v109);
          v114 = objc_msgSend_clockVector(v110, v111, v112, v113);
          objc_msgSend_intersectVector_(v102, v115, (uint64_t)v114, v116);

          v120 = objc_msgSend_mutableCopy(v102, v117, v118, v119);
          v124 = objc_msgSend_vectors(v85, v121, v122, v123);
          v128 = objc_msgSend_contents(v124, v125, v126, v127);
          objc_msgSend_minusStateVector_(v120, v129, (uint64_t)v128, v130);

          if (objc_msgSend_timestampCount(v120, v131, v132, v133))
          {
            objc_msgSend_addObject_(v670, v134, (uint64_t)v85, v135);
            objc_msgSend_unionStateVector_(v700, v136, (uint64_t)v120, v137);
            v141 = objc_msgSend_allSiteIdentifiers(v120, v138, v139, v140);
            objc_msgSend_unionSet_(v683, v142, (uint64_t)v141, v143);

            objc_msgSend_setObject_forKey_(v671, v144, (uint64_t)v102, (uint64_t)v85);
            objc_msgSend_setObject_forKey_(v672, v145, (uint64_t)v120, (uint64_t)v85);
          }
        }
      }
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v146, (uint64_t)&v760, (uint64_t)v781, 16);
    }
    while (v82);
  }

  uint64_t v658 = objc_msgSend_count(v670, v147, v148, v149);
  v150 = objc_opt_new();
  if (v658)
  {
    long long v759 = 0u;
    long long v758 = 0u;
    long long v757 = 0u;
    long long v756 = 0u;
    id v659 = v638;
    uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v659, v151, (uint64_t)&v756, (uint64_t)v780, 16);
    if (v152)
    {
      uint64_t v663 = *(void *)v757;
      do
      {
        uint64_t v153 = 0;
        id v666 = (id)v152;
        do
        {
          if (*(void *)v757 != v663) {
            objc_enumerationMutation(v659);
          }
          uint64_t v679 = v153;
          v154 = *(void **)(*((void *)&v756 + 1) + 8 * v153);
          context = (void *)MEMORY[0x18C12ADA0]();
          v158 = objc_msgSend_vectors(v154, v155, v156, v157);
          v162 = objc_msgSend_removals(v158, v159, v160, v161);
          v690 = objc_msgSend_mutableCopy(v162, v163, v164, v165);

          objc_msgSend_intersectStateVector_(v690, v166, (uint64_t)v700, v167);
          v171 = objc_msgSend_vectors(v154, v168, v169, v170);
          v175 = objc_msgSend_contents(v171, v172, v173, v174);
          id v686 = (id)objc_msgSend_mutableCopy(v175, v176, v177, v178);

          objc_msgSend_intersectStateVector_(v686, v179, (uint64_t)v700, v180);
          id v695 = v690;
          objc_msgSend_unionStateVector_(v695, v181, (uint64_t)v686, v182);
          if (objc_msgSend_timestampCount(v695, v183, v184, v185))
          {
            v188 = objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v695, v186, (uint64_t)v683, v187);
            v192 = objc_msgSend_allSiteIdentifiers(v188, v189, v190, v191);
            long long v755 = 0u;
            long long v754 = 0u;
            long long v753 = 0u;
            long long v752 = 0u;
            id v193 = v192;
            uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v752, (uint64_t)v779, 16);
            if (v197)
            {
              uint64_t v198 = *(void *)v753;
              do
              {
                for (uint64_t j = 0; j != v197; ++j)
                {
                  if (*(void *)v753 != v198) {
                    objc_enumerationMutation(v193);
                  }
                  uint64_t v200 = *(void *)(*((void *)&v752 + 1) + 8 * j);
                  v203 = objc_msgSend_objectForKeyedSubscript_(v150, v195, v200, v196);
                  if (!v203)
                  {
                    v203 = objc_opt_new();
                    objc_msgSend_setObject_forKeyedSubscript_(v150, v204, (uint64_t)v203, v200);
                  }
                  v205 = objc_msgSend_clockValuesForSiteIdentifier_(v188, v201, v200, v202);
                  objc_msgSend_addIndexes_withObject_(v203, v206, (uint64_t)v205, (uint64_t)v154);
                }
                uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v195, (uint64_t)&v752, (uint64_t)v779, 16);
              }
              while (v197);
            }
          }
          uint64_t v153 = v679 + 1;
        }
        while ((id)(v679 + 1) != v666);
        uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v659, v207, (uint64_t)&v756, (uint64_t)v780, 16);
      }
      while (v152);
    }
  }
  v645 = objc_opt_new();
  if (v658)
  {
    v691 = objc_opt_new();
    long long v751 = 0u;
    long long v750 = 0u;
    long long v749 = 0u;
    long long v748 = 0u;
    id v642 = v670;
    uint64_t v648 = objc_msgSend_countByEnumeratingWithState_objects_count_(v642, v208, (uint64_t)&v748, (uint64_t)v778, 16);
    if (v648)
    {
      uint64_t v646 = *(void *)v749;
      do
      {
        for (uint64_t k = 0; k != v648; ++k)
        {
          if (*(void *)v749 != v646) {
            objc_enumerationMutation(v642);
          }
          contexta = *(void **)(*((void *)&v748 + 1) + 8 * k);
          v650 = (void *)MEMORY[0x18C12ADA0]();
          v652 = objc_msgSend_objectForKey_(v671, v209, (uint64_t)contexta, v210);
          objc_msgSend_objectForKey_(v672, v211, (uint64_t)contexta, v212);
          id v667 = (id)objc_claimAutoreleasedReturnValue();
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v765) = 0;
          v216 = objc_msgSend_vectors(contexta, v213, v214, v215);
          v220 = objc_msgSend_dependencies(v216, v217, v218, v219);
          v224 = objc_msgSend_mutableCopy(v220, v221, v222, v223);

          v228 = objc_msgSend_allSiteIdentifiers(v667, v225, v226, v227);
          long long v747 = 0u;
          long long v745 = 0u;
          long long v746 = 0u;
          long long v744 = 0u;
          id v656 = v228;
          uint64_t v664 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v229, (uint64_t)&v744, (uint64_t)v777, 16);
          if (v664)
          {
            id v660 = *(id *)v745;
            while (2)
            {
              for (uint64_t m = 0; m != v664; ++m)
              {
                if (*(id *)v745 != v660) {
                  objc_enumerationMutation(v656);
                }
                uint64_t v233 = *(void *)(*((void *)&v744 + 1) + 8 * m);
                objc_msgSend_removeAllObjects(v691, v230, v231, v232);
                v236 = objc_msgSend_objectForKeyedSubscript_(v150, v234, v233, v235);
                v737[0] = MEMORY[0x1E4F143A8];
                v737[1] = 3221225472;
                v737[2] = sub_18B0BD1D0;
                v737[3] = &unk_1E5463BE0;
                id v687 = v236;
                id v738 = v687;
                id v237 = v691;
                id v739 = v237;
                v740 = contexta;
                id v741 = v700;
                id v742 = v702;
                v743 = buf;
                objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v667, v238, v233, (uint64_t)v737);
                if (*(unsigned char *)(*(void *)&buf[8] + 24))
                {

                  goto LABEL_76;
                }
                int v680 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
                long long v735 = 0u;
                long long v736 = 0u;
                long long v733 = 0u;
                long long v734 = 0u;
                id v239 = v237;
                uint64_t v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v240, (uint64_t)&v733, (uint64_t)v776, 16);
                if (v244)
                {
                  uint64_t v245 = *(void *)v734;
                  do
                  {
                    for (uint64_t n = 0; n != v244; ++n)
                    {
                      if (*(void *)v734 != v245) {
                        objc_enumerationMutation(v239);
                      }
                      v247 = *(void **)(*((void *)&v733 + 1) + 8 * n);
                      v248 = objc_msgSend_vectors(v247, v241, v242, v243);
                      v252 = objc_msgSend_contents(v248, v249, v250, v251);
                      v256 = objc_msgSend_clockVector(v252, v253, v254, v255);
                      objc_msgSend_unionVector_(v224, v257, (uint64_t)v256, v258);

                      v262 = objc_msgSend_vectors(v247, v259, v260, v261);
                      v266 = objc_msgSend_dependencies(v262, v263, v264, v265);
                      objc_msgSend_unionVector_(v224, v267, (uint64_t)v266, v268);
                    }
                    uint64_t v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v241, (uint64_t)&v733, (uint64_t)v776, 16);
                  }
                  while (v244);
                }

                if (v680) {
                  goto LABEL_76;
                }
              }
              uint64_t v664 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v230, (uint64_t)&v744, (uint64_t)v777, 16);
              if (v664) {
                continue;
              }
              break;
            }
          }
LABEL_76:

          if (!*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            v269 = [CKMergeableDeltaMetadata alloc];
            objc_msgSend_UUID(MEMORY[0x1E4F29128], v270, v271, v272);
            id v688 = (id)objc_claimAutoreleasedReturnValue();
            v697 = objc_msgSend_UUIDString(v688, v273, v274, v275);
            v276 = [CKMergeableDeltaVectors alloc];
            v280 = objc_msgSend_vectors(contexta, v277, v278, v279);
            v284 = objc_msgSend_previous(v280, v281, v282, v283);
            v288 = objc_msgSend_vectors(contexta, v285, v286, v287);
            v292 = objc_msgSend_removals(v288, v289, v290, v291);
            v294 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v276, v293, (uint64_t)v284, (uint64_t)v652, v292, v224);
            v295 = (void *)MEMORY[0x1E4F1CAD0];
            v299 = objc_msgSend_identifier(contexta, v296, v297, v298);
            v302 = objc_msgSend_setWithObject_(v295, v300, (uint64_t)v299, v301);
            v304 = objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v269, v303, (uint64_t)v697, (uint64_t)v294, v302);

            v308 = objc_msgSend_identifier(contexta, v305, v306, v307);
            objc_msgSend_setObject_forKeyedSubscript_(v645, v309, (uint64_t)v304, (uint64_t)v308);
          }
          _Block_object_dispose(buf, 8);
        }
        uint64_t v648 = objc_msgSend_countByEnumeratingWithState_objects_count_(v642, v310, (uint64_t)&v748, (uint64_t)v778, 16);
      }
      while (v648);
    }
  }
  v665 = objc_opt_new();
  if (v636)
  {
    v314 = 0;
    id v689 = 0;
    int contextb = 0;
  }
  else
  {
    v315 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v311, v312, v313);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18B0BD460;
    aBlock[3] = &unk_1E5463C08;
    id v647 = v315;
    id v732 = v647;
    v698 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v729 = 0u;
    long long v730 = 0u;
    long long v727 = 0u;
    long long v728 = 0u;
    id contextc = obj;
    uint64_t v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextc, v316, (uint64_t)&v727, (uint64_t)v775, 16);
    if (v317)
    {
      uint64_t v318 = *(void *)v728;
      do
      {
        for (iuint64_t i = 0; ii != v317; ++ii)
        {
          if (*(void *)v728 != v318) {
            objc_enumerationMutation(contextc);
          }
          v698[2](v698, *(void *)(*((void *)&v727 + 1) + 8 * ii));
        }
        uint64_t v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextc, v320, (uint64_t)&v727, (uint64_t)v775, 16);
      }
      while (v317);
    }

    v723[0] = MEMORY[0x1E4F143A8];
    v723[1] = 3221225472;
    v723[2] = sub_18B0BD680;
    v723[3] = &unk_1E5463C30;
    id v643 = v647;
    id v724 = v643;
    SEL v725 = a2;
    id v726 = a1;
    v681 = (uint64_t (**)(void *, void *, void))_Block_copy(v723);
    v324 = objc_msgSend_allObjects(contextc, v321, v322, v323);
    v651 = objc_msgSend_sortedArrayUsingComparator_(v324, v325, (uint64_t)v681, v326);

    v327 = [CKMergeableDeltaMetadata alloc];
    v328 = [CKMergeableDeltaVectors alloc];
    v329 = objc_opt_new();
    v330 = objc_opt_new();
    v331 = objc_opt_new();
    v332 = objc_opt_new();
    v334 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v328, v333, (uint64_t)v329, (uint64_t)v330, v331, v332);
    v337 = objc_msgSend_initWithVectors_(v327, v335, (uint64_t)v334, v336);

    objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v338, (uint64_t)v701, v339);
    id v649 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v649, v340, (uint64_t)v651, v341);
    long long v721 = 0u;
    long long v722 = 0u;
    long long v719 = 0u;
    long long v720 = 0u;
    id v668 = v649;
    uint64_t v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v668, v342, (uint64_t)&v719, (uint64_t)v774, 16);
    if (v343)
    {
      uint64_t v344 = *(void *)v720;
      do
      {
        uint64_t v345 = 0;
        v346 = v337;
        do
        {
          if (*(void *)v720 != v344) {
            objc_enumerationMutation(v668);
          }
          v347 = *(void **)(*((void *)&v719 + 1) + 8 * v345);
          v348 = (void *)MEMORY[0x18C12ADA0]();
          v352 = objc_msgSend_copy(v346, v349, v350, v351);
          v773[0] = v346;
          v773[1] = v347;
          v354 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v353, (uint64_t)v773, 2);
          v337 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v355, (uint64_t)v354, v356);

          int isEquivalent = objc_msgSend__isEquivalent_(v337, v357, (uint64_t)v352, v358);
          if (v347 == v701) {
            int v363 = 0;
          }
          else {
            int v363 = isEquivalent;
          }
          if (v363 == 1)
          {
            v364 = objc_msgSend_identifier(v347, v360, v361, v362);
            objc_msgSend_addObject_(v665, v365, (uint64_t)v364, v366);
          }
          ++v345;
          v346 = v337;
        }
        while (v343 != v345);
        uint64_t v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v668, v367, (uint64_t)&v719, (uint64_t)v774, 16);
      }
      while (v343);
    }

    v368 = objc_opt_new();
    v715[0] = MEMORY[0x1E4F143A8];
    v715[1] = 3221225472;
    v715[2] = sub_18B0BD940;
    v715[3] = &unk_1E5463C58;
    id v369 = v701;
    id v716 = v369;
    id v653 = v665;
    id v717 = v653;
    id v657 = v368;
    id v718 = v657;
    v655 = (void (**)(void *, void *))_Block_copy(v715);
    v692 = objc_opt_new();
    long long v713 = 0u;
    long long v714 = 0u;
    long long v711 = 0u;
    long long v712 = 0u;
    id v370 = contextc;
    uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v711, (uint64_t)v772, 16);
    if (v375)
    {
      uint64_t v376 = *(void *)v712;
      do
      {
        for (juint64_t j = 0; jj != v375; ++jj)
        {
          if (*(void *)v712 != v376) {
            objc_enumerationMutation(v370);
          }
          v378 = *(void **)(*((void *)&v711 + 1) + 8 * jj);
          v379 = objc_msgSend_identifier(v378, v372, v373, v374);
          objc_msgSend_setObject_forKeyedSubscript_(v692, v380, (uint64_t)v378, (uint64_t)v379);
        }
        uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v372, (uint64_t)&v711, (uint64_t)v772, 16);
      }
      while (v375);
    }

    v384 = objc_msgSend_allObjects(v653, v381, v382, v383);
    objc_msgSend_removeObjectsForKeys_(v692, v385, (uint64_t)v384, v386);

    v655[2](v655, v692);
    uint64_t v390 = objc_msgSend_mutableCopy(v645, v387, v388, v389);

    v693 = (void *)v390;
    v394 = objc_msgSend_allObjects(v653, v391, v392, v393);
    objc_msgSend_removeObjectsForKeys_(v693, v395, (uint64_t)v394, v396);

    v655[2](v655, v693);
    if (objc_msgSend_count(v657, v397, v398, v399))
    {
      v640 = objc_msgSend_mutableCopy(v657, v400, v401, v402);
      objc_msgSend_addObject_(v640, v403, (uint64_t)v369, v404);
      v314 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v405, (uint64_t)v640, v406);
      ((void (**)(void *, void *))v698)[2](v698, v314);
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v661 = v657;
      uint64_t v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v661, v407, (uint64_t)&v707, (uint64_t)v771, 16);
      if (v408)
      {
        id v689 = 0;
        char v409 = 0;
        uint64_t v410 = *(void *)v708;
        do
        {
          uint64_t v411 = 0;
          do
          {
            if (*(void *)v708 != v410) {
              objc_enumerationMutation(v661);
            }
            uint64_t v412 = *(void *)(*((void *)&v707 + 1) + 8 * v411);
            if (v681[2](v681, v314, v412) != -1)
            {
              v414 = ck_log_initialization_block;
              if (ck_log_initialization_predicate != -1) {
                dispatch_once(&ck_log_initialization_predicate, v414);
              }

              v415 = (id)ck_log_facility_distributed_sync;
              if (os_log_type_enabled(v415, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v314;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v412;
                _os_log_fault_impl(&dword_18AF10000, v415, OS_LOG_TYPE_FAULT, "Invariant violation while folding existing deltas into next delta: updated next delta %@ is not strictly greater than existing delta %@", buf, 0x16u);
              }

              uint64_t v417 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v416, @"CKErrorDomain", 1, @"Invariant violation while folding existing deltas into next delta: updated next delta %@ is not strictly greater than existing delta %@", v314, v412);

              char v409 = 1;
              id v689 = (id)v417;
            }
            ++v411;
          }
          while (v408 != v411);
          uint64_t v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v661, v413, (uint64_t)&v707, (uint64_t)v771, 16);
        }
        while (v408);
      }
      else
      {
        id v689 = 0;
        char v409 = 0;
      }
    }
    else
    {
      uint64_t v418 = objc_msgSend_copy(v369, v400, v401, v402);
      id v689 = 0;
      char v409 = 0;
      v314 = (void *)v418;
    }
    objc_msgSend_setReplacedDeltaIdentifiers_(v314, v419, (uint64_t)v653, v420);

    int contextb = v409 & 1;
  }
  objc_msgSend_setReplacementDeltaMetadatas_(v684, v311, (uint64_t)v645, v313);
  if (objc_msgSend_count(v665, v427, v428, v429))
  {
    objc_msgSend_setRemovableDeltaMetadatas_(v684, v430, (uint64_t)v665, v432);
    objc_msgSend_setUpdatedNextDeltaMetadata_(v684, v433, (uint64_t)v314, v434);
  }
  v435 = objc_msgSend_replacementDeltaMetadatas(v684, v430, v431, v432);
  id v669 = v314;
  if (objc_msgSend_count(v435, v436, v437, v438))
  {
  }
  else
  {
    v445 = objc_msgSend_removableDeltaMetadatas(v684, v439, v440, v441);
    BOOL v449 = objc_msgSend_count(v445, v446, v447, v448) == 0;

    if (v449) {
      goto LABEL_180;
    }
  }
  v450 = objc_msgSend_mutableCopy(obj, v442, v443, v444);
  v453 = v450;
  if ((v636 & 1) == 0) {
    objc_msgSend_addObject_(v450, v451, (uint64_t)v701, v452);
  }
  v699 = objc_opt_new();
  long long v705 = 0u;
  long long v706 = 0u;
  long long v703 = 0u;
  long long v704 = 0u;
  id v454 = v453;
  uint64_t v459 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v455, (uint64_t)&v703, (uint64_t)v770, 16);
  if (v459)
  {
    uint64_t v460 = *(void *)v704;
    do
    {
      for (uint64_t kk = 0; kk != v459; ++kk)
      {
        if (*(void *)v704 != v460) {
          objc_enumerationMutation(v454);
        }
        v462 = *(void **)(*((void *)&v703 + 1) + 8 * kk);
        if (v462 == v701)
        {
          uint64_t v475 = objc_msgSend_updatedNextDeltaMetadata(v684, v456, v457, v458);
          v476 = (void *)v475;
          v477 = v701;
          if (v475) {
            v477 = (void *)v475;
          }
          id v474 = v477;
        }
        else
        {
          v463 = objc_msgSend_removableDeltaMetadatas(v684, v456, v457, v458);
          v467 = objc_msgSend_identifier(v462, v464, v465, v466);
          char v470 = objc_msgSend_containsObject_(v463, v468, (uint64_t)v467, v469);

          if (v470)
          {
            id v474 = 0;
            goto LABEL_153;
          }
          v476 = objc_msgSend_replacementDeltaMetadatas(v684, v471, v472, v473);
          v481 = objc_msgSend_identifier(v462, v478, v479, v480);
          uint64_t v484 = objc_msgSend_objectForKeyedSubscript_(v476, v482, (uint64_t)v481, v483);
          v485 = (void *)v484;
          if (v484) {
            v486 = (void *)v484;
          }
          else {
            v486 = v462;
          }
          id v474 = v486;
        }
        if (v474) {
          objc_msgSend_addObject_(v699, v487, (uint64_t)v474, v488);
        }
LABEL_153:
      }
      uint64_t v459 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v456, (uint64_t)&v703, (uint64_t)v770, 16);
    }
    while (v459);
  }

  v492 = objc_msgSend_allObjects(v454, v489, v490, v491);
  v694 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v493, (uint64_t)v492, v494);

  v498 = objc_msgSend_allObjects(v699, v495, v496, v497);
  v682 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v499, (uint64_t)v498, v500);

  v504 = objc_msgSend_vectors(v694, v501, v502, v503);
  v508 = objc_msgSend_contents(v504, v505, v506, v507);
  v512 = objc_msgSend_vectors(v682, v509, v510, v511);
  v516 = objc_msgSend_contents(v512, v513, v514, v515);
  LODWORD(v498) = objc_msgSend_isEqual_(v508, v517, (uint64_t)v516, v518);

  v522 = objc_msgSend_vectors(v694, v519, v520, v521);
  v526 = objc_msgSend_removals(v522, v523, v524, v525);
  v530 = objc_msgSend_vectors(v682, v527, v528, v529);
  v534 = objc_msgSend_removals(v530, v531, v532, v533);
  LODWORD(v512) = objc_msgSend_isEqual_(v526, v535, (uint64_t)v534, v536);

  v537 = objc_opt_new();
  v539 = objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(CKMergeableDeltaMetadata, v538, (uint64_t)v699, (uint64_t)v537, v634);
  int isEqual = objc_msgSend_isEqual_(v539, v540, (uint64_t)v699, v541);

  if ((v498 & v512) != 1 || !v699)
  {
    v542 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v542);
    }

    v543 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v543, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v701;
      _os_log_impl(&dword_18AF10000, v543, OS_LOG_TYPE_INFO, "Invariant violation debug: next delta is %@", buf, 0xCu);
    }

    v544 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v544);
    }

    v545 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v545, OS_LOG_TYPE_INFO))
    {
      v549 = objc_msgSend_updatedNextDeltaMetadata(v684, v546, v547, v548);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v549;
      _os_log_impl(&dword_18AF10000, v545, OS_LOG_TYPE_INFO, "Invariant violation debug: updated next delta is %@", buf, 0xCu);
    }
    v550 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v550);
    }

    v551 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v551, OS_LOG_TYPE_INFO))
    {
      v555 = objc_msgSend_replacementDeltaMetadatas(v684, v552, v553, v554);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v555;
      _os_log_impl(&dword_18AF10000, v551, OS_LOG_TYPE_INFO, "Invariant violation debug: replaced deltas are %@", buf, 0xCu);
    }
    v556 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v556);
    }

    v557 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v557, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = obj;
      _os_log_impl(&dword_18AF10000, v557, OS_LOG_TYPE_INFO, "Invariant violation debug: deliverable server deltas are %@", buf, 0xCu);
    }

    v558 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v558);
    }

    v559 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v559, OS_LOG_TYPE_FAULT))
    {
      v602 = objc_msgSend_vectors(v694, v560, v561, v562);
      contexte = objc_msgSend_contents(v602, v603, v604, v605);
      v609 = objc_msgSend_vectors(v682, v606, v607, v608);
      v613 = objc_msgSend_contents(v609, v610, v611, v612);
      v617 = objc_msgSend_vectors(v694, v614, v615, v616);
      v621 = objc_msgSend_removals(v617, v618, v619, v620);
      v625 = objc_msgSend_vectors(v682, v622, v623, v624);
      uint64_t v629 = objc_msgSend_removals(v625, v626, v627, v628);
      v630 = (void *)v629;
      v631 = @"not ";
      if (isEqual) {
        v631 = &stru_1ED7F5C98;
      }
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = contexte;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v613;
      *(_WORD *)&buf[22] = 2112;
      v765 = v621;
      __int16 v766 = 2112;
      uint64_t v767 = v629;
      __int16 v768 = 2112;
      v769 = v631;
      _os_log_fault_impl(&dword_18AF10000, v559, OS_LOG_TYPE_FAULT, "Invariant violation while calculating replacement deltas: contents vector %@ vs. %@, removals vector %@ vs. %@, %@deliverable", buf, 0x34u);
    }
    v566 = objc_msgSend_vectors(v694, v563, v564, v565);
    contextd = objc_msgSend_contents(v566, v567, v568, v569);
    v573 = objc_msgSend_vectors(v682, v570, v571, v572);
    v577 = objc_msgSend_contents(v573, v574, v575, v576);
    v581 = objc_msgSend_vectors(v694, v578, v579, v580);
    v585 = objc_msgSend_removals(v581, v582, v583, v584);
    v589 = objc_msgSend_vectors(v682, v586, v587, v588);
    uint64_t v593 = objc_msgSend_removals(v589, v590, v591, v592);
    v595 = (void *)v593;
    v596 = @"not ";
    if (isEqual) {
      v596 = &stru_1ED7F5C98;
    }
    uint64_t v597 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v594, @"CKErrorDomain", 1, @"Invariant violation while calculating replacement deltas: contents vector %@ vs. %@, removals vector %@ vs. %@, %@deliverable", contextd, v577, v585, v593, v596);

    int contextb = 1;
    id v689 = (id)v597;
  }

LABEL_180:
  if (contextb)
  {
    if (a7) {
      *a7 = v689;
    }
    uint64_t v598 = objc_opt_new();

    v599 = (void *)v598;
  }
  else
  {
    v599 = v684;
  }
  id v600 = v599;

  return v600;
}

+ (id)deliverableDeltaMetadatasInDeltaSet:(id)a3 withMergeableValueCurrentStateVector:(id)a4 deliveryRequirements:(unint64_t)a5
{
  uint64_t v439 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v362 = a4;
  v348 = (void *)MEMORY[0x18C12ADA0]();
  v349 = v7;
  unint64_t v370 = a5;
  if (a5)
  {
    id v369 = objc_opt_new();
    v377 = objc_opt_new();
    uint64_t v376 = objc_opt_new();
    int v363 = objc_opt_new();
    long long v427 = 0u;
    long long v428 = 0u;
    long long v425 = 0u;
    long long v426 = 0u;
    id v8 = v7;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v425, (uint64_t)v438, 16);
    if (v10)
    {
      uint64_t v11 = *(void *)v426;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v426 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v425 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x18C12ADA0]();
          v18 = objc_msgSend_vectors(v13, v15, v16, v17);
          uint64_t v22 = objc_msgSend_previous(v18, v19, v20, v21);
          uint64_t v26 = objc_msgSend_allSiteIdentifiers(v22, v23, v24, v25);
          objc_msgSend_unionSet_(v363, v27, (uint64_t)v26, v28);

          v32 = objc_msgSend_vectors(v13, v29, v30, v31);
          uint64_t v36 = objc_msgSend_contents(v32, v33, v34, v35);
          uint64_t v40 = objc_msgSend_allSiteIdentifiers(v36, v37, v38, v39);
          objc_msgSend_unionSet_(v363, v41, (uint64_t)v40, v42);

          v46 = objc_msgSend_vectors(v13, v43, v44, v45);
          uint64_t v50 = objc_msgSend_removals(v46, v47, v48, v49);
          v54 = objc_msgSend_allSiteIdentifiers(v50, v51, v52, v53);
          objc_msgSend_unionSet_(v363, v55, (uint64_t)v54, v56);

          v60 = objc_msgSend_vectors(v13, v57, v58, v59);
          uint64_t v64 = objc_msgSend_dependencies(v60, v61, v62, v63);
          uint64_t v68 = objc_msgSend_allSiteIdentifiers(v64, v65, v66, v67);
          objc_msgSend_unionSet_(v363, v69, (uint64_t)v68, v70);
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v71, (uint64_t)&v425, (uint64_t)v438, 16);
      }
      while (v10);
    }

    v75 = objc_msgSend_allSiteIdentifiers(v362, v72, v73, v74);
    objc_msgSend_unionSet_(v363, v76, (uint64_t)v75, v77);

    uint64_t v361 = objc_opt_new();
    uint64_t v375 = objc_opt_new();
    v379 = objc_opt_new();
    v378 = objc_opt_new();
    long long v423 = 0u;
    long long v424 = 0u;
    long long v421 = 0u;
    long long v422 = 0u;
    obuint64_t j = v8;
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v421, (uint64_t)v437, 16);
    if (v79)
    {
      uint64_t v80 = *(void *)v422;
      do
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v422 != v80) {
            objc_enumerationMutation(obj);
          }
          uint64_t v82 = *(void **)(*((void *)&v421 + 1) + 8 * j);
          uint64_t v83 = (void *)MEMORY[0x18C12ADA0]();
          id v87 = objc_msgSend_vectors(v82, v84, v85, v86);
          v91 = objc_msgSend_contents(v87, v88, v89, v90);
          uint64_t v94 = objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v91, v92, (uint64_t)v363, v93);

          v98 = objc_msgSend_vectors(v82, v95, v96, v97);
          v102 = objc_msgSend_previous(v98, v99, v100, v101);
          uint64_t v105 = objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v102, v103, (uint64_t)v363, v104);

          uint64_t v109 = objc_msgSend_vectors(v82, v106, v107, v108);
          uint64_t v113 = objc_msgSend_dependencies(v109, v110, v111, v112);
          uint64_t v116 = objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v113, v114, (uint64_t)v363, v115);

          objc_msgSend_addAllClockValuesFromVector_(v361, v117, (uint64_t)v94, v118);
          uint64_t v122 = objc_msgSend_identifier(v82, v119, v120, v121);
          objc_msgSend_setObject_forKeyedSubscript_(v375, v123, (uint64_t)v94, (uint64_t)v122);

          if (v370)
          {
            uint64_t v127 = objc_msgSend_identifier(v82, v124, v125, v126);
            objc_msgSend_setObject_forKeyedSubscript_(v379, v128, (uint64_t)v105, (uint64_t)v127);
          }
          if (v370 >= 2)
          {
            v129 = objc_msgSend_identifier(v82, v124, v125, v126);
            objc_msgSend_setObject_forKeyedSubscript_(v378, v130, (uint64_t)v116, (uint64_t)v129);
          }
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v131, (uint64_t)&v421, (uint64_t)v437, 16);
      }
      while (v79);
    }

    v134 = objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v362, v132, (uint64_t)v363, v133);
    objc_msgSend_addAllClockValuesFromVector_(v361, v135, (uint64_t)v134, v136);

    long long v419 = 0u;
    long long v420 = 0u;
    long long v417 = 0u;
    long long v418 = 0u;
    id v355 = obj;
    uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v137, (uint64_t)&v417, (uint64_t)v436, 16);
    if (v138)
    {
      uint64_t v351 = *(void *)v418;
      do
      {
        uint64_t v139 = 0;
        v353 = (char *)v138;
        do
        {
          if (*(void *)v418 != v351) {
            objc_enumerationMutation(v355);
          }
          uint64_t v358 = v139;
          uint64_t v140 = *(void **)(*((void *)&v417 + 1) + 8 * (void)v139);
          context = (void *)MEMORY[0x18C12ADA0]();
          long long v415 = 0u;
          long long v416 = 0u;
          long long v413 = 0u;
          long long v414 = 0u;
          id obja = v363;
          uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v141, (uint64_t)&v413, (uint64_t)v435, 16);
          if (v144)
          {
            id v371 = *(id *)v414;
            do
            {
              for (uint64_t k = 0; k != v144; ++k)
              {
                if (*(id *)v414 != v371) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v146 = *(void *)(*((void *)&v413 + 1) + 8 * k);
                uint64_t v149 = objc_msgSend_objectForKeyedSubscript_(v377, v142, v146, v143);
                if (!v149)
                {
                  uint64_t v149 = objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v377, v150, (uint64_t)v149, v146);
                }
                v154 = objc_msgSend_objectForKeyedSubscript_(v376, v147, v146, v148);
                if (!v154)
                {
                  v154 = objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v376, v155, (uint64_t)v154, v146);
                }
                uint64_t v156 = objc_msgSend_identifier(v140, v151, v152, v153);
                v159 = objc_msgSend_objectForKeyedSubscript_(v375, v157, (uint64_t)v156, v158);

                v163 = objc_msgSend_identifier(v140, v160, v161, v162);
                v166 = objc_msgSend_objectForKeyedSubscript_(v379, v164, (uint64_t)v163, v165);

                uint64_t v170 = objc_msgSend_identifier(v140, v167, v168, v169);
                uint64_t v173 = objc_msgSend_objectForKeyedSubscript_(v378, v171, (uint64_t)v170, v172);

                v176 = objc_msgSend_clockValuesForSiteIdentifier_(v159, v174, v146, v175);
                objc_msgSend_addIndexes_withObject_(v149, v177, (uint64_t)v176, (uint64_t)v140);

                uint64_t v180 = objc_msgSend_clockValuesForSiteIdentifier_(v166, v178, v146, v179);
                objc_msgSend_addIndexes_withObject_(v154, v181, (uint64_t)v180, (uint64_t)v140);

                uint64_t v184 = objc_msgSend_clockValuesForSiteIdentifier_(v173, v182, v146, v183);
                objc_msgSend_addIndexes_withObject_(v154, v185, (uint64_t)v184, (uint64_t)v140);
              }
              uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v142, (uint64_t)&v413, (uint64_t)v435, 16);
            }
            while (v144);
          }

          uint64_t v139 = v358 + 1;
        }
        while (v358 + 1 != v353);
        uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v186, (uint64_t)&v417, (uint64_t)v436, 16);
      }
      while (v138);
    }

    long long v411 = 0u;
    long long v412 = 0u;
    long long v409 = 0u;
    long long v410 = 0u;
    id v350 = v363;
    uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v350, v187, (uint64_t)&v409, (uint64_t)v434, 16);
    if (v188)
    {
      uint64_t v352 = *(void *)v410;
      do
      {
        v189 = 0;
        v354 = (char *)v188;
        do
        {
          if (*(void *)v410 != v352) {
            objc_enumerationMutation(v350);
          }
          v359 = v189;
          uint64_t v190 = *(void *)(*((void *)&v409 + 1) + 8 * (void)v189);
          contexta = (void *)MEMORY[0x18C12ADA0]();
          objc_msgSend_clockValuesForSiteIdentifier_(v361, v191, v190, v192);
          id v372 = (id)objc_claimAutoreleasedReturnValue();
          long long v407 = 0u;
          long long v408 = 0u;
          long long v405 = 0u;
          long long v406 = 0u;
          id objb = v355;
          uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v193, (uint64_t)&v405, (uint64_t)v433, 16);
          if (v197)
          {
            uint64_t v198 = *(void *)v406;
            do
            {
              for (uint64_t m = 0; m != v197; ++m)
              {
                if (*(void *)v406 != v198) {
                  objc_enumerationMutation(objb);
                }
                uint64_t v200 = *(void **)(*((void *)&v405 + 1) + 8 * m);
                v201 = objc_msgSend_identifier(v200, v194, v195, v196);
                v204 = objc_msgSend_objectForKeyedSubscript_(v379, v202, (uint64_t)v201, v203);

                v208 = objc_msgSend_identifier(v200, v205, v206, v207);
                v211 = objc_msgSend_objectForKeyedSubscript_(v378, v209, (uint64_t)v208, v210);

                uint64_t v214 = objc_msgSend_clockValuesForSiteIdentifier_(v204, v212, v190, v213);
                if ((objc_msgSend_containsIndexes_(v372, v215, (uint64_t)v214, v216) & 1) == 0)
                {

LABEL_52:
                  objc_msgSend_addObject_(v369, v223, (uint64_t)v200, v224);
                  goto LABEL_53;
                }
                uint64_t v219 = objc_msgSend_clockValuesForSiteIdentifier_(v211, v217, v190, v218);
                char v222 = objc_msgSend_containsIndexes_(v372, v220, (uint64_t)v219, v221);

                if ((v222 & 1) == 0) {
                  goto LABEL_52;
                }
LABEL_53:
              }
              uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v194, (uint64_t)&v405, (uint64_t)v433, 16);
            }
            while (v197);
          }

          v189 = v359 + 1;
        }
        while (v359 + 1 != v354);
        uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v350, v225, (uint64_t)&v409, (uint64_t)v434, 16);
      }
      while (v188);
    }

    for (objc = 0; (unint64_t)objc < objc_msgSend_count(v369, v226, v227, v228); ++objc)
    {
      v360 = (void *)MEMORY[0x18C12ADA0]();
      v234 = objc_msgSend_objectAtIndexedSubscript_(v369, v232, (uint64_t)objc, v233);
      long long v403 = 0u;
      long long v404 = 0u;
      long long v401 = 0u;
      long long v402 = 0u;
      id v373 = v350;
      uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v235, (uint64_t)&v401, (uint64_t)v432, 16);
      if (v238)
      {
        uint64_t v239 = *(void *)v402;
        do
        {
          for (uint64_t n = 0; n != v238; ++n)
          {
            if (*(void *)v402 != v239) {
              objc_enumerationMutation(v373);
            }
            uint64_t v241 = *(void *)(*((void *)&v401 + 1) + 8 * n);
            uint64_t v242 = objc_msgSend_objectForKeyedSubscript_(v377, v236, v241, v237);
            uint64_t v245 = objc_msgSend_objectForKeyedSubscript_(v376, v243, v241, v244);
            v249 = objc_msgSend_identifier(v234, v246, v247, v248);
            v252 = objc_msgSend_objectForKeyedSubscript_(v375, v250, (uint64_t)v249, v251);

            uint64_t v255 = objc_msgSend_clockValuesForSiteIdentifier_(v252, v253, v241, v254);
            v392[0] = MEMORY[0x1E4F143A8];
            v392[1] = 3221225472;
            v392[2] = sub_18B0BF018;
            v392[3] = &unk_1E5463CA8;
            id v393 = v369;
            id v394 = v378;
            id v395 = v379;
            uint64_t v396 = v241;
            id v397 = v362;
            id v256 = v255;
            id v398 = v256;
            id v257 = v242;
            id v399 = v257;
            id v400 = v375;
            objc_msgSend_enumerateObjectsForIndexes_usingBlock_(v245, v258, (uint64_t)v256, (uint64_t)v392);
          }
          uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v236, (uint64_t)&v401, (uint64_t)v432, 16);
        }
        while (v238);
      }
    }
    id objd = (id)objc_msgSend_mutableCopy(v355, v229, v230, v231);
    v263 = objc_msgSend_set(v369, v260, v261, v262);
    objc_msgSend_minusSet_(objd, v264, (uint64_t)v263, v265);

    v269 = objc_msgSend_mutableCopy(v362, v266, v267, v268);
    long long v390 = 0u;
    long long v391 = 0u;
    long long v388 = 0u;
    long long v389 = 0u;
    id v270 = objd;
    uint64_t v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v271, (uint64_t)&v388, (uint64_t)v431, 16);
    if (v272)
    {
      uint64_t v273 = *(void *)v389;
      do
      {
        for (iuint64_t i = 0; ii != v272; ++ii)
        {
          if (*(void *)v389 != v273) {
            objc_enumerationMutation(v270);
          }
          uint64_t v275 = *(void **)(*((void *)&v388 + 1) + 8 * ii);
          v276 = (void *)MEMORY[0x18C12ADA0]();
          v280 = objc_msgSend_vectors(v275, v277, v278, v279);
          v284 = objc_msgSend_contents(v280, v281, v282, v283);
          objc_msgSend_unionStateVector_(v269, v285, (uint64_t)v284, v286);
        }
        uint64_t v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v287, (uint64_t)&v388, (uint64_t)v431, 16);
      }
      while (v272);
    }

    long long v386 = 0u;
    long long v387 = 0u;
    long long v384 = 0u;
    long long v385 = 0u;
    id v374 = v270;
    uint64_t v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(v374, v288, (uint64_t)&v384, (uint64_t)v430, 16);
    if (v289)
    {
      uint64_t v290 = *(void *)v385;
      do
      {
        for (juint64_t j = 0; jj != v289; ++jj)
        {
          if (*(void *)v385 != v290) {
            objc_enumerationMutation(v374);
          }
          v292 = *(void **)(*((void *)&v384 + 1) + 8 * jj);
          v293 = (void *)MEMORY[0x18C12ADA0]();
          uint64_t v297 = objc_msgSend_vectors(v292, v294, v295, v296);
          uint64_t v301 = objc_msgSend_removals(v297, v298, v299, v300);
          BOOL v305 = objc_msgSend_timestampCount(v301, v302, v303, v304) == 0;

          if (!v305)
          {
            v309 = objc_msgSend_vectors(v292, v306, v307, v308);
            uint64_t v313 = objc_msgSend_removals(v309, v310, v311, v312);
            uint64_t v317 = objc_msgSend_mutableCopy(v313, v314, v315, v316);

            v321 = objc_msgSend_clockVector(v269, v318, v319, v320);
            objc_msgSend_intersectVector_(v317, v322, (uint64_t)v321, v323);

            objc_msgSend_unionStateVector_(v269, v324, (uint64_t)v317, v325);
          }
        }
        uint64_t v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(v374, v326, (uint64_t)&v384, (uint64_t)v430, 16);
      }
      while (v289);
    }

    long long v382 = 0u;
    long long v383 = 0u;
    long long v380 = 0u;
    long long v381 = 0u;
    id v327 = v369;
    uint64_t v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v327, v328, (uint64_t)&v380, (uint64_t)v429, 16);
    if (v329)
    {
      uint64_t v330 = *(void *)v381;
      do
      {
        for (uint64_t kk = 0; kk != v329; ++kk)
        {
          if (*(void *)v381 != v330) {
            objc_enumerationMutation(v327);
          }
          v332 = *(void **)(*((void *)&v380 + 1) + 8 * kk);
          v333 = (void *)MEMORY[0x18C12ADA0]();
          v337 = objc_msgSend_vectors(v332, v334, v335, v336);
          uint64_t v341 = objc_msgSend_contents(v337, v338, v339, v340);
          char hasAtomStateNotInStateVector = objc_msgSend_hasAtomStateNotInStateVector_(v341, v342, (uint64_t)v269, v343);

          if ((hasAtomStateNotInStateVector & 1) == 0) {
            objc_msgSend_addObject_(v374, v345, (uint64_t)v332, v346);
          }
        }
        uint64_t v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v327, v347, (uint64_t)&v380, (uint64_t)v429, 16);
      }
      while (v329);
    }
  }
  else
  {
    id v374 = v7;
  }

  return v374;
}

- (CKMergeableDeltaMetadata)initWithVectors:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v9 = objc_msgSend_UUID(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_UUIDString(v9, v10, v11, v12);
  v15 = (CKMergeableDeltaMetadata *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v14, (uint64_t)v13, (uint64_t)v5, 0);

  return v15;
}

- (CKMergeableDeltaMetadata)initWithIdentifier:(id)a3 vectors:(id)a4 replacedDeltaIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (!v8 || !objc_msgSend_length(v8, v10, v11, v12)) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v10, *MEMORY[0x1E4F1C3C8], @"Identifier must not be nil or empty");
  }
  v28.receiver = self;
  v28.super_class = (Class)CKMergeableDeltaMetadata;
  uint64_t v17 = [(CKMergeableDeltaMetadata *)&v28 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v8, v14, v15, v16);
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v23 = objc_msgSend_copy(v9, v20, v21, v22);
    vectors = v17->_vectors;
    v17->_vectors = (CKMergeableDeltaVectors *)v23;

    objc_msgSend_setReplacedDeltaIdentifiers_(v17, v25, (uint64_t)v13, v26);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKMergeableDeltaMetadata alloc];
  id v8 = objc_msgSend_identifier(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_vectors(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_replacedDeltaIdentifiers(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

+ (id)mergeableDeltaMetadataByCombiningMetadatas:(id)a3
{
  v4 = objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1ED7EF4D8, v3);
  uint64_t v7 = objc_msgSend_mergeableDeltaMetadataVectorsByCombiningVectors_(CKMergeableDeltaVectors, v5, (uint64_t)v4, v6);
  id v8 = [CKMergeableDeltaMetadata alloc];
  uint64_t v11 = objc_msgSend_initWithVectors_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableDeltaMetadata)initWithCoder:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  uint64_t v15 = NSStringFromSelector(sel_replacedDeltaIdentifiers);
  uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v18 = objc_opt_class();
  uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"timestampsProtobuf");
  if (!v20)
  {
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = NSStringFromSelector(sel_previousVector);
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v34, (uint64_t)v35);

    uint64_t v37 = objc_opt_class();
    uint64_t v38 = NSStringFromSelector(sel_contentsVector);
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);

    uint64_t v40 = objc_opt_class();
    uint64_t v41 = NSStringFromSelector(sel_removalsVector);
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v40, (uint64_t)v41);

    uint64_t v44 = objc_opt_class();
    uint64_t v45 = NSStringFromSelector(sel_dependenciesVector);
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v44, (uint64_t)v45);

    uint64_t v48 = [CKMergeableDeltaVectors alloc];
    uint64_t v50 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v48, v49, (uint64_t)v24, (uint64_t)v26, v43, v47);
    uint64_t v52 = objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v51, (uint64_t)v8, (uint64_t)v50, v17);

LABEL_10:
    self = v52;
    uint64_t v33 = self;
    goto LABEL_11;
  }
  uint64_t v21 = [CKDPDistributedTimestamps alloc];
  uint64_t v24 = objc_msgSend_initWithData_(v21, v22, (uint64_t)v20, v23);
  id v54 = 0;
  uint64_t v26 = objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(CKMergeableDeltaVectors, v25, (uint64_t)v24, (uint64_t)&v54);
  id v27 = v54;
  if (!v27)
  {
    uint64_t v52 = objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v28, (uint64_t)v8, (uint64_t)v26, v17);
    goto LABEL_10;
  }
  uint64_t v29 = v27;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v30 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v56 = v29;
    _os_log_error_impl(&dword_18AF10000, v30, OS_LOG_TYPE_ERROR, "Error initializing mergeable delta metadata from data in coder: %@", buf, 0xCu);
  }
  objc_msgSend_failWithError_(v4, v31, (uint64_t)v29, v32);

  uint64_t v33 = 0;
LABEL_11:

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_vectors(self, v5, v6, v7);
  objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(CKMergeableDeltaVectors, v9, (uint64_t)v8, v10);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_msgSend_identifier(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_identifier);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_replacedDeltaIdentifiers(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel_replacedDeltaIdentifiers);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  uint64_t v26 = objc_msgSend_data(v28, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, @"timestampsProtobuf");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (CKMergeableDeltaMetadata *)a3;
  if (v6 == self)
  {
    char v16 = 1;
  }
  else if (objc_msgSend__isEquivalent_(self, v4, (uint64_t)v6, v5) {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    uint64_t v7 = v6;
    uint64_t v11 = objc_msgSend_identifier(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_identifier(v7, v12, v13, v14);

    char v16 = CKObjectsAreBothNilOrEqual(v11, v15);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_isEquivalent:(id)a3
{
  id v4 = (CKMergeableDeltaMetadata *)a3;
  if (v4 == self)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v9 = objc_msgSend_vectors(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_vectors(v5, v10, v11, v12);
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        uint64_t v17 = objc_msgSend_replacedDeltaIdentifiers(self, v14, v15, v16);
        uint64_t v21 = objc_msgSend_replacedDeltaIdentifiers(v5, v18, v19, v20);
        char v22 = CKObjectsAreBothNilOrEqual(v17, v21);
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_vectors(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_replacedDeltaIdentifiers(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (CKMergeableDeltaVectors)vectors
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_vectors;
  objc_sync_exit(v2);

  return v3;
}

- (void)setVectors:(id)a3
{
  uint64_t v10 = (CKMergeableDeltaVectors *)a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_vectors != v10)
  {
    uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
    vectors = v4->_vectors;
    v4->_vectors = (CKMergeableDeltaVectors *)v8;
  }
  objc_sync_exit(v4);
}

- (NSSet)replacedDeltaIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_replacedDeltaIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)setReplacedDeltaIdentifiers:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  replacedDeltaIdentifiers = v4->_replacedDeltaIdentifiers;
  v4->_replacedDeltaIdentifiers = (NSSet *)v8;

  objc_sync_exit(v4);
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = objc_opt_new();
  objc_msgSend_appendString_(v7, v8, @"{\n", v9);
  uint64_t v13 = objc_msgSend_identifier(self, v10, v11, v12);
  objc_msgSend_appendFormat_(v7, v14, @"  Identifier: %@\n", v15, v13);

  uint64_t v19 = objc_msgSend_vectors(self, v16, v17, v18);
  uint64_t v21 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v19, v20, v5, v4);
  uint64_t v23 = objc_msgSend_CKIndentedString_skippingFirstLine_(v21, v22, 2, 1);
  objc_msgSend_appendFormat_(v7, v24, @"  Vectors: %@\n", v25, v23);

  uint64_t v29 = objc_msgSend_replacedDeltaIdentifiers(self, v26, v27, v28);
  if (objc_msgSend_count(v29, v30, v31, v32))
  {
    uint64_t v36 = objc_msgSend_description(v29, v33, v34, v35);
    uint64_t v38 = objc_msgSend_CKIndentedString_skippingFirstLine_(v36, v37, 2, 1);
    objc_msgSend_appendFormat_(v7, v39, @"  ReplacedDeltas: %@\n", v40, v38);
  }
  objc_msgSend_appendString_(v7, v33, @"}", v35);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (unint64_t)size
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend_identifier(self, a2, v2, v3);
  unint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  unint64_t v10 = v9 + 2;
  if (v9 >= 0x80)
  {
    do
    {
      ++v10;
      unint64_t v11 = v9 >> 14;
      v9 >>= 7;
    }
    while (v11);
  }

  uint64_t v15 = objc_msgSend_vectors(self, v12, v13, v14);
  unint64_t v19 = objc_msgSend_protobufSize(v15, v16, v17, v18);
  unint64_t v20 = v19 + 2;
  if (v19 >= 0x80)
  {
    do
    {
      ++v20;
      unint64_t v21 = v19 >> 14;
      v19 >>= 7;
    }
    while (v21);
  }

  unint64_t v22 = v10 + v20 + 122;
  uint64_t v26 = objc_msgSend_replacedDeltaIdentifiers(self, v23, v24, v25);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v28)
  {
    uint64_t v32 = v28;
    uint64_t v33 = *(void *)v40;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v26);
        }
        unint64_t v35 = objc_msgSend_length(*(void **)(*((void *)&v39 + 1) + 8 * v34), v29, v30, v31);
        unint64_t v36 = v35 + 2;
        if (v35 >= 0x80)
        {
          do
          {
            ++v36;
            unint64_t v37 = v35 >> 14;
            v35 >>= 7;
          }
          while (v37);
        }
        v22 += v36;
        ++v34;
      }
      while (v34 != v32);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v32);
  }

  return v22;
}

- (CKDistributedTimestampClockVector)previousVector
{
  BOOL v4 = objc_msgSend_vectors(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_previous(v4, v5, v6, v7);

  return (CKDistributedTimestampClockVector *)v8;
}

- (CKDistributedTimestampStateVector)contentsVector
{
  BOOL v4 = objc_msgSend_vectors(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_contents(v4, v5, v6, v7);

  return (CKDistributedTimestampStateVector *)v8;
}

- (CKDistributedTimestampStateVector)removalsVector
{
  BOOL v4 = objc_msgSend_vectors(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_removals(v4, v5, v6, v7);

  return (CKDistributedTimestampStateVector *)v8;
}

- (CKDistributedTimestampClockVector)dependenciesVector
{
  BOOL v4 = objc_msgSend_vectors(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_dependencies(v4, v5, v6, v7);

  return (CKDistributedTimestampClockVector *)v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_replacedDeltaIdentifiers, 0);

  objc_storeStrong((id *)&self->_vectors, 0);
}

@end