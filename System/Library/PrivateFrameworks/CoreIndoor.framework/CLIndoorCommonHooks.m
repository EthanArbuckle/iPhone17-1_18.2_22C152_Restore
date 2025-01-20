@interface CLIndoorCommonHooks
+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4;
+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:;
@end

@implementation CLIndoorCommonHooks

+ (id)nearestVenues:()time_point<std:(std:()std:(1000000000>>>)a3 :(id)a4 ratio<1 :(id)a5 chrono:(double)a6 :(const NearestVenueSettings *)a7 duration<long)long :(BOOL)a8 chrono::steady_clock availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v110 = a4;
  id v109 = a5;
  if (a7->var0)
  {
    id v16 = a7->var0;
    goto LABEL_45;
  }
  if (!a7->var2 && (objc_msgSend_isStaleFix_(v109, v13, a3.var0.__rep_, v14, v15) & 1) != 0)
  {
    id v16 = 0;
    goto LABEL_45;
  }
  v111 = a7;
  v108 = objc_msgSend_filterLocationGroups_isRegionalSupported_(CLIndoorCommonHooks, v13, (uint64_t)v110, a7->var3, v15);
  if (objc_msgSend_count(v108, v17, v18, v19, v20))
  {
    id var2 = a7->var2;
    if (var2 || (id var2 = v109) != 0) {
      objc_msgSend_gpsLocation(var2, v21, v22, v23, v24);
    }
    else {
      memset(v124, 0, 156);
    }
    v26 = [GeographicCoordinate alloc];
    v31 = objc_msgSend_initWithLatitude_longitude_andAltitude_(v26, v27, v28, v29, v30, *(_OWORD *)((char *)v124 + 4), 0.0);
    v35 = objc_msgSend_fromLatLon_(ECEFCoordinate, v32, (uint64_t)v31, v33, v34);

    double v36 = *(double *)((char *)&v124[1] + 4) * a6;
    if (a8)
    {
      id v37 = objc_alloc(MEMORY[0x263EFF9C0]);
      uint64_t v42 = objc_msgSend_count(v108, v38, v39, v40, v41);
      id v16 = (id)objc_msgSend_initWithCapacity_(v37, v43, v42, v44, v45);
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v46 = v108;
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v112, (uint64_t)v125, 16);
      if (v52)
      {
        uint64_t v53 = *(void *)v113;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v113 != v53) {
              objc_enumerationMutation(v46);
            }
            v55 = *(void **)(*((void *)&v112 + 1) + 8 * i);
            v56 = objc_msgSend_groupId(v55, v48, v49, v50, v51);
            v60 = objc_msgSend_stringByAppendingString_(@"G", v57, (uint64_t)v56, v58, v59);

            if ((objc_msgSend_containsObject_(v16, v61, (uint64_t)v60, v62, v63) & 1) == 0)
            {
              objc_msgSend_distance_(v55, v64, (uint64_t)v35, v65, v66);
              double v68 = v67;
              objc_msgSend_tolerance(v55, v69, v70, v71, v72);
              if (v68 - v36 - v76 < v111->var1) {
                objc_msgSend_addObject_(v16, v73, (uint64_t)v60, v74, v75);
              }
            }
          }
          uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v112, (uint64_t)v125, 16);
        }
        while (v52);
      }

      goto LABEL_43;
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v123 = 0;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v77 = v108;
    uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v118, (uint64_t)v126, 16);
    if (v82)
    {
      uint64_t v83 = *(void *)v119;
      double v84 = INFINITY;
      do
      {
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v119 != v83) {
            objc_enumerationMutation(v77);
          }
          v86 = *(void **)(*((void *)&v118 + 1) + 8 * j);
          objc_msgSend_distance_(v86, v79, (uint64_t)v35, v80, v81);
          double v89 = v88;
          if (v88 < v84)
          {
            objc_msgSend_tolerance(v86, v79, v87, v80, v81);
            if (v89 <= v36 + v91)
            {
              objc_msgSend_groupId(v86, v79, v90, v80, v81);
              id v92 = objc_claimAutoreleasedReturnValue();
              uint64_t v97 = objc_msgSend_UTF8String(v92, v93, v94, v95, v96);
              MEMORY[0x223C92530](__p, v97);

              double v84 = v89;
            }
          }
        }
        uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v79, (uint64_t)&v118, (uint64_t)v126, 16);
      }
      while (v82);
    }

    v98 = (void *)HIBYTE(v123);
    if (v123 < 0) {
      v98 = __p[1];
    }
    if (v98)
    {
      std::operator+<char>();
      if (SHIBYTE(v123) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = v116;
      uint64_t v123 = v117;
      v102 = (void *)MEMORY[0x263EFFA08];
      if (v117 >= 0) {
        objc_msgSend_stringWithUTF8String_(NSString, v99, (uint64_t)__p, v100, v101);
      }
      else {
      v103 = objc_msgSend_stringWithUTF8String_(NSString, v99, v116, v100, v101);
      }
      objc_msgSend_setWithObject_(v102, v104, (uint64_t)v103, v105, v106);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if ((v123 & 0x8000000000000000) == 0) {
        goto LABEL_43;
      }
    }
    else
    {
      id v16 = 0;
      if ((v123 & 0x8000000000000000) == 0) {
        goto LABEL_43;
      }
    }
    operator delete(__p[0]);
LABEL_43:

    goto LABEL_44;
  }
  id v16 = 0;
LABEL_44:

LABEL_45:
  return v16;
}

+ (id)filterLocationGroups:(id)a3 isRegionalSupported:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10 = v5;
  if (v4)
  {
    id v11 = (id)objc_msgSend_copy(v5, v6, v7, v8, v9);
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v10;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend_locationContext(v17, v18, v19, v20, v21, (void)v31);
          if ((objc_msgSend_isRegional_(CLLocationContextUtil, v23, v22, v24, v25) & 1) == 0) {
            objc_msgSend_addObject_(v11, v26, (uint64_t)v17, v27, v28);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v29, (uint64_t)&v31, (uint64_t)v35, 16);
      }
      while (v14);
    }
  }
  return v11;
}

@end