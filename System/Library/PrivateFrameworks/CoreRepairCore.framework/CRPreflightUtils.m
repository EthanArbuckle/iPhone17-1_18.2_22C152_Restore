@interface CRPreflightUtils
+ (BOOL)_hasSameKey:(id)a3 this:(id)a4 other:(id)a5;
+ (id)_mergeActivationLocks:(id)a3;
+ (id)activationResults:(id)a3;
+ (id)filterResultsIdentifier:(id)a3;
+ (id)parseChallengeObject:(id)a3 withHandler:(id)a4;
+ (id)spcResults:(id)a3;
@end

@implementation CRPreflightUtils

+ (id)spcResults:(id)a3
{
  uint64_t v295 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    v8 = objc_msgSend_sharedSingleton(CRFDRDeviceController, v4, v5, v6);
    v12 = objc_msgSend_getHandlerForDevice(v8, v9, v10, v11);

    if (v12)
    {
      v15 = (void *)MEMORY[0x263EFF9C0];
      v16 = objc_msgSend_objectForKeyedSubscript_(v7, v13, @"passComponents", v14);
      v19 = objc_msgSend_filterResultsIdentifier_(a1, v17, (uint64_t)v16, v18);
      v257 = objc_msgSend_setWithArray_(v15, v20, (uint64_t)v19, v21);

      v22 = (void *)MEMORY[0x263EFF9C0];
      v25 = objc_msgSend_objectForKeyedSubscript_(v7, v23, @"failComponents", v24);
      v28 = objc_msgSend_filterResultsIdentifier_(a1, v26, (uint64_t)v25, v27);
      v255 = objc_msgSend_setWithArray_(v22, v29, (uint64_t)v28, v30);

      v31 = (void *)MEMORY[0x263EFF9C0];
      v34 = objc_msgSend_objectForKeyedSubscript_(v7, v32, @"lockComponents", v33);
      v37 = objc_msgSend_filterResultsIdentifier_(a1, v35, (uint64_t)v34, v36);
      v40 = objc_msgSend_setWithArray_(v31, v38, (uint64_t)v37, v39);

      v41 = (void *)MEMORY[0x263EFF9C0];
      v44 = objc_msgSend_objectForKeyedSubscript_(v7, v42, @"unauthComponents", v43);
      v47 = objc_msgSend_filterResultsIdentifier_(a1, v45, (uint64_t)v44, v46);
      v50 = objc_msgSend_setWithArray_(v41, v48, (uint64_t)v47, v49);

      v51 = (void *)MEMORY[0x263EFF9C0];
      v54 = objc_msgSend_objectForKeyedSubscript_(v7, v52, @"lostComponents", v53);
      v57 = objc_msgSend_filterResultsIdentifier_(a1, v55, (uint64_t)v54, v56);
      v60 = objc_msgSend_setWithArray_(v51, v58, (uint64_t)v57, v59);

      v61 = (void *)MEMORY[0x263EFF9C0];
      v64 = objc_msgSend_objectForKeyedSubscript_(v7, v62, @"deniedComponents", v63);
      v67 = objc_msgSend_filterResultsIdentifier_(a1, v65, (uint64_t)v64, v66);
      v249 = objc_msgSend_setWithArray_(v61, v68, (uint64_t)v67, v69);

      v70 = (void *)MEMORY[0x263EFF9C0];
      id v252 = v7;
      v73 = objc_msgSend_objectForKeyedSubscript_(v7, v71, @"sealedComponents", v72);
      v76 = objc_msgSend_filterResultsIdentifier_(a1, v74, (uint64_t)v73, v75);
      v246 = objc_msgSend_setWithArray_(v70, v77, (uint64_t)v76, v78);

      objc_msgSend_minusSet_(v255, v79, (uint64_t)v257, v80);
      v259 = objc_opt_new();
      long long v284 = 0u;
      long long v285 = 0u;
      long long v286 = 0u;
      long long v287 = 0u;
      id v81 = v257;
      uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v284, (uint64_t)v294, 16);
      if (v83)
      {
        uint64_t v86 = v83;
        uint64_t v87 = *(void *)v285;
        do
        {
          for (uint64_t i = 0; i != v86; ++i)
          {
            if (*(void *)v285 != v87) {
              objc_enumerationMutation(v81);
            }
            v91 = objc_msgSend_spcWithComponent_(v12, v84, *(void *)(*((void *)&v284 + 1) + 8 * i), v85);
            if (v91) {
              objc_msgSend_addObject_(v259, v89, (uint64_t)v91, v90);
            }
          }
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v84, (uint64_t)&v284, (uint64_t)v294, 16);
        }
        while (v86);
      }
      v251 = v81;

      v258 = objc_opt_new();
      long long v280 = 0u;
      long long v281 = 0u;
      long long v282 = 0u;
      long long v283 = 0u;
      id v92 = v255;
      uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v280, (uint64_t)v293, 16);
      if (v94)
      {
        uint64_t v97 = v94;
        uint64_t v98 = *(void *)v281;
        do
        {
          for (uint64_t j = 0; j != v97; ++j)
          {
            if (*(void *)v281 != v98) {
              objc_enumerationMutation(v92);
            }
            v102 = objc_msgSend_spcWithComponent_(v12, v95, *(void *)(*((void *)&v280 + 1) + 8 * j), v96);
            if (v102) {
              objc_msgSend_addObject_(v258, v100, (uint64_t)v102, v101);
            }
          }
          uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v280, (uint64_t)v293, 16);
        }
        while (v97);
      }

      v256 = objc_opt_new();
      long long v276 = 0u;
      long long v277 = 0u;
      long long v278 = 0u;
      long long v279 = 0u;
      id v103 = v40;
      uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v276, (uint64_t)v292, 16);
      if (v105)
      {
        uint64_t v108 = v105;
        uint64_t v109 = *(void *)v277;
        do
        {
          for (uint64_t k = 0; k != v108; ++k)
          {
            if (*(void *)v277 != v109) {
              objc_enumerationMutation(v103);
            }
            v113 = objc_msgSend_spcWithComponent_(v12, v106, *(void *)(*((void *)&v276 + 1) + 8 * k), v107);
            if (v113) {
              objc_msgSend_addObject_(v256, v111, (uint64_t)v113, v112);
            }
          }
          uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v106, (uint64_t)&v276, (uint64_t)v292, 16);
        }
        while (v108);
      }

      v254 = objc_opt_new();
      long long v272 = 0u;
      long long v273 = 0u;
      long long v274 = 0u;
      long long v275 = 0u;
      id v114 = v50;
      uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v115, (uint64_t)&v272, (uint64_t)v291, 16);
      if (v116)
      {
        uint64_t v119 = v116;
        uint64_t v120 = *(void *)v273;
        do
        {
          for (uint64_t m = 0; m != v119; ++m)
          {
            if (*(void *)v273 != v120) {
              objc_enumerationMutation(v114);
            }
            v124 = objc_msgSend_spcWithComponent_(v12, v117, *(void *)(*((void *)&v272 + 1) + 8 * m), v118);
            if (v124) {
              objc_msgSend_addObject_(v254, v122, (uint64_t)v124, v123);
            }
          }
          uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v117, (uint64_t)&v272, (uint64_t)v291, 16);
        }
        while (v119);
      }

      v125 = objc_opt_new();
      long long v268 = 0u;
      long long v269 = 0u;
      long long v270 = 0u;
      long long v271 = 0u;
      obuint64_t j = v60;
      uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v126, (uint64_t)&v268, (uint64_t)v290, 16);
      if (v127)
      {
        uint64_t v130 = v127;
        uint64_t v131 = *(void *)v269;
        do
        {
          for (uint64_t n = 0; n != v130; ++n)
          {
            if (*(void *)v269 != v131) {
              objc_enumerationMutation(obj);
            }
            v135 = objc_msgSend_spcWithComponent_(v12, v128, *(void *)(*((void *)&v268 + 1) + 8 * n), v129);
            if (v135) {
              objc_msgSend_addObject_(v125, v133, (uint64_t)v135, v134);
            }
          }
          uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v268, (uint64_t)v290, 16);
        }
        while (v130);
      }
      v247 = v114;

      v136 = objc_opt_new();
      long long v264 = 0u;
      long long v265 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      id v137 = v249;
      uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v138, (uint64_t)&v264, (uint64_t)v289, 16);
      if (v139)
      {
        uint64_t v142 = v139;
        uint64_t v143 = *(void *)v265;
        do
        {
          for (iuint64_t i = 0; ii != v142; ++ii)
          {
            if (*(void *)v265 != v143) {
              objc_enumerationMutation(v137);
            }
            v147 = objc_msgSend_spcWithComponent_(v12, v140, *(void *)(*((void *)&v264 + 1) + 8 * ii), v141);
            if (v147) {
              objc_msgSend_addObject_(v136, v145, (uint64_t)v147, v146);
            }
          }
          uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v140, (uint64_t)&v264, (uint64_t)v289, 16);
        }
        while (v142);
      }
      v248 = v103;
      v250 = v92;

      v148 = objc_opt_new();
      long long v260 = 0u;
      long long v261 = 0u;
      long long v262 = 0u;
      long long v263 = 0u;
      id v149 = v246;
      uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v260, (uint64_t)v288, 16);
      if (v151)
      {
        uint64_t v154 = v151;
        uint64_t v155 = *(void *)v261;
        do
        {
          for (juint64_t j = 0; jj != v154; ++jj)
          {
            if (*(void *)v261 != v155) {
              objc_enumerationMutation(v149);
            }
            v159 = objc_msgSend_spcWithComponent_(v12, v152, *(void *)(*((void *)&v260 + 1) + 8 * jj), v153);
            if (v159) {
              objc_msgSend_addObject_(v148, v157, (uint64_t)v159, v158);
            }
          }
          uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v152, (uint64_t)&v260, (uint64_t)v288, 16);
        }
        while (v154);
      }

      objc_msgSend_minusSet_(v148, v160, (uint64_t)v259, v161);
      objc_msgSend_minusSet_(v148, v162, (uint64_t)v256, v163);
      objc_msgSend_minusSet_(v148, v164, (uint64_t)v254, v165);
      objc_msgSend_minusSet_(v148, v166, (uint64_t)v258, v167);
      objc_msgSend_minusSet_(v148, v168, (uint64_t)v125, v169);
      objc_msgSend_minusSet_(v148, v170, (uint64_t)v136, v171);
      objc_msgSend_minusSet_(v259, v172, (uint64_t)v256, v173);
      objc_msgSend_minusSet_(v259, v174, (uint64_t)v254, v175);
      objc_msgSend_minusSet_(v259, v176, (uint64_t)v258, v177);
      objc_msgSend_minusSet_(v259, v178, (uint64_t)v125, v179);
      objc_msgSend_minusSet_(v259, v180, (uint64_t)v136, v181);
      objc_msgSend_minusSet_(v256, v182, (uint64_t)v254, v183);
      objc_msgSend_minusSet_(v256, v184, (uint64_t)v258, v185);
      objc_msgSend_minusSet_(v256, v186, (uint64_t)v125, v187);
      objc_msgSend_minusSet_(v256, v188, (uint64_t)v136, v189);
      objc_msgSend_minusSet_(v254, v190, (uint64_t)v258, v191);
      objc_msgSend_minusSet_(v254, v192, (uint64_t)v125, v193);
      objc_msgSend_minusSet_(v254, v194, (uint64_t)v136, v195);
      objc_msgSend_minusSet_(v258, v196, (uint64_t)v125, v197);
      objc_msgSend_minusSet_(v258, v198, (uint64_t)v136, v199);
      objc_msgSend_minusSet_(v125, v200, (uint64_t)v136, v201);
      v202 = handleForCategory(0);
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C6D4();
      }

      v203 = handleForCategory(0);
      if (os_log_type_enabled(v203, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C66C();
      }

      v204 = handleForCategory(0);
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C604();
      }

      v205 = handleForCategory(0);
      if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C59C();
      }

      v206 = handleForCategory(0);
      if (os_log_type_enabled(v206, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C534();
      }

      v207 = handleForCategory(0);
      if (os_log_type_enabled(v207, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C4CC();
      }

      v208 = handleForCategory(0);
      if (os_log_type_enabled(v208, OS_LOG_TYPE_DEBUG)) {
        sub_21FC5C464();
      }

      v209 = objc_opt_new();
      v213 = objc_msgSend_allObjects(v259, v210, v211, v212);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v214, (uint64_t)v213, @"pass");

      v218 = objc_msgSend_allObjects(v258, v215, v216, v217);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v219, (uint64_t)v218, @"fail");

      v223 = objc_msgSend_allObjects(v256, v220, v221, v222);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v224, (uint64_t)v223, @"lock");

      v228 = objc_msgSend_allObjects(v254, v225, v226, v227);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v229, (uint64_t)v228, @"unauth");

      v233 = objc_msgSend_allObjects(v125, v230, v231, v232);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v234, (uint64_t)v233, @"lost");

      v238 = objc_msgSend_allObjects(v136, v235, v236, v237);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v239, (uint64_t)v238, @"denied");

      v243 = objc_msgSend_allObjects(v148, v240, v241, v242);
      objc_msgSend_setObject_forKeyedSubscript_(v209, v244, (uint64_t)v243, @"sealed");

      id v7 = v252;
    }
    else
    {
      v209 = 0;
    }
  }
  else
  {
    v209 = 0;
  }

  return v209;
}

+ (id)activationResults:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v8 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"Challenges", v3);
    if (v8)
    {
      v9 = objc_msgSend_sharedSingleton(CRFDRDeviceController, v5, v6, v7);
      v13 = objc_msgSend_getHandlerForDevice(v9, v10, v11, v12);

      if (v13)
      {
        v17 = objc_msgSend_array(MEMORY[0x263EFF980], v14, v15, v16);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v33 = v8;
        uint64_t v18 = v8;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, (uint64_t)v40, 16);
        if (v20)
        {
          uint64_t v22 = v20;
          uint64_t v23 = *(void *)v37;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v18);
              }
              uint64_t v27 = objc_msgSend_parseChallengeObject_withHandler_(a1, v21, *(void *)(*((void *)&v36 + 1) + 8 * v24), (uint64_t)v13);
              if (v27)
              {
                objc_msgSend_addObject_(v17, v25, (uint64_t)v27, v26);
              }
              else
              {
                v28 = handleForCategory(0);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                  sub_21FC5C7D8(&buf, v35, v28);
                }
              }
              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v36, (uint64_t)v40, 16);
          }
          while (v22);
        }

        v31 = objc_msgSend__mergeActivationLocks_(a1, v29, (uint64_t)v17, v30);
        v8 = v33;
      }
      else
      {
        v17 = handleForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_21FC5C7A4();
        }
        v31 = 0;
      }
    }
    else
    {
      v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C770();
      }
      v31 = 0;
    }
  }
  else
  {
    v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C73C();
    }
    v31 = 0;
  }

  return v31;
}

+ (id)filterResultsIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_componentsSeparatedByString_(v13, v8, @"-", v9, (void)v24);
        if ((unint64_t)objc_msgSend_count(v14, v15, v16, v17) < 2)
        {
          objc_msgSend_addObject_(v4, v18, (uint64_t)v13, v19);
        }
        else
        {
          uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v14, v18, 0, v19);
          objc_msgSend_addObject_(v4, v21, (uint64_t)v20, v22);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v10);
  }

  return v4;
}

+ (id)parseChallengeObject:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Type", v8);

  if (!v9)
  {
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C818();
    }
    goto LABEL_17;
  }
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v5, v10, @"Properties", v11);
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:
    id v40 = 0;
    goto LABEL_18;
  }
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"activation", v14);
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_17;
  }
  uint64_t v19 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v16, v17, v18);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v5, v20, @"Type", v21);
  long long v25 = objc_msgSend_objectForKeyedSubscript_(v15, v23, @"status", v24);
  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v15, v26, @"fmipUrl", v27);
  uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v15, v29, @"activationToken", v30);
  v35 = objc_msgSend_spcWithComponent_(v6, v32, (uint64_t)v22, v33);
  uint64_t v43 = (void *)v31;
  if (v25)
  {
    objc_msgSend_setObject_forKey_(v19, v34, (uint64_t)v25, @"status");
    if (v22)
    {
      objc_msgSend_setObject_forKey_(v19, v36, (uint64_t)v22, @"type");
      if (v35)
      {
        objc_msgSend_setObject_forKey_(v19, v37, (uint64_t)v35, @"spc");
        if (v31) {
          objc_msgSend_setObject_forKey_(v19, v38, v31, @"token");
        }
        if (v28) {
          objc_msgSend_setObject_forKey_(v19, v38, v28, @"endpoint");
        }
        long long v39 = (void *)v28;
        id v40 = v19;
        goto LABEL_28;
      }
      long long v39 = (void *)v28;
      v42 = handleForCategory(0);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C880();
      }
    }
    else
    {
      long long v39 = (void *)v28;
      v42 = handleForCategory(0);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C818();
      }
    }
  }
  else
  {
    long long v39 = (void *)v28;
    v42 = handleForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C84C();
    }
  }

  id v40 = 0;
LABEL_28:

LABEL_18:
  return v40;
}

+ (BOOL)_hasSameKey:(id)a3 this:(id)a4 other:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v10, (uint64_t)v7, v11);
  if (v12)
  {
  }
  else
  {
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)v7, v14);

    if (!v17)
    {
      LOBYTE(v20) = 1;
      goto LABEL_9;
    }
  }
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v7, v16);
  if (v20)
  {
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v9, v18, (uint64_t)v7, v19);

    if (v21)
    {
      uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v8, v22, (uint64_t)v7, v23);
      uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v9, v25, (uint64_t)v7, v26);
      LOBYTE(v20) = objc_msgSend_isEqualToString_(v24, v28, (uint64_t)v27, v29);
    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }
LABEL_9:

  return (char)v20;
}

+ (id)_mergeActivationLocks:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v58 = (id)objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v4;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v65, (uint64_t)v72, 16);
  if (v59)
  {
    uint64_t v57 = *(void *)v66;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v66 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v6;
        id v7 = *(void **)(*((void *)&v65 + 1) + 8 * v6);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v8 = v58;
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v61, (uint64_t)v71, 16);
        if (v10)
        {
          uint64_t v12 = v10;
          uint64_t v13 = *(void *)v62;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v62 != v13) {
                objc_enumerationMutation(v8);
              }
              uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              if (objc_msgSend__hasSameKey_this_other_(a1, v11, @"token", (uint64_t)v15, v7)&& objc_msgSend__hasSameKey_this_other_(a1, v11, @"status", (uint64_t)v15, v7)&& objc_msgSend__hasSameKey_this_other_(a1, v11, @"endpoint", (uint64_t)v15, v7))
              {
                long long v38 = objc_msgSend_objectForKeyedSubscript_(v15, v11, @"spc", v16);
                uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v7, v39, @"spc", v40);
                objc_msgSend_addObject_(v38, v42, (uint64_t)v41, v43);

                uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v15, v44, @"type", v45);
                uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v7, v47, @"type", v48);
                objc_msgSend_addObject_(v46, v50, (uint64_t)v49, v51);

                goto LABEL_18;
              }
            }
            uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v61, (uint64_t)v71, 16);
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v19 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v17, (uint64_t)v7, v18);
        uint64_t v20 = (void *)MEMORY[0x263EFF980];
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v7, v21, @"spc", v22);
        uint64_t v26 = objc_msgSend_arrayWithObject_(v20, v24, (uint64_t)v23, v25);
        objc_msgSend_setObject_forKeyedSubscript_(v19, v27, (uint64_t)v26, @"spc");

        uint64_t v28 = (void *)MEMORY[0x263EFF980];
        uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v7, v29, @"type", v30);
        v34 = objc_msgSend_arrayWithObject_(v28, v32, (uint64_t)v31, v33);
        objc_msgSend_setObject_forKeyedSubscript_(v19, v35, (uint64_t)v34, @"type");

        objc_msgSend_addObject_(v8, v36, (uint64_t)v19, v37);
        id v8 = v19;
LABEL_18:

        uint64_t v6 = v60 + 1;
      }
      while (v60 + 1 != v59);
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v65, (uint64_t)v72, 16);
    }
    while (v59);
  }

  uint64_t v53 = handleForCategory(0);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    id v70 = obj;
    _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "activation locks: %@", buf, 0xCu);
  }

  v54 = handleForCategory(0);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    id v70 = v58;
    _os_log_impl(&dword_21FBF2000, v54, OS_LOG_TYPE_DEFAULT, "merged activation locks: %@", buf, 0xCu);
  }

  return v58;
}

@end