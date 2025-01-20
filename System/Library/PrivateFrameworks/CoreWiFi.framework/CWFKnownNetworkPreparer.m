@interface CWFKnownNetworkPreparer
- (BOOL)profilesContainsHomeProfile:(id)a3;
- (CWFKnownNetworkPreparer)initWithNetworkProfiles:(id)a3;
- (NSArray)profiles;
- (id)_filterForPrimaryHomeNetworkProfile:(id)a3;
- (id)_filterProfilesForHomeNetworksExceedingMaximumDistance:(id)a3;
- (id)_homeNetworkComparator;
- (id)_homeNetworkFilter;
- (id)_lastJoinedComparator;
- (id)_localNetworkFilter;
- (id)_networkProfileUsageComparator;
- (id)_removeProfilesAtSimilarLocations:(id)a3;
- (id)_similarLocationComparator;
- (id)localNetworkPromptProfiles;
- (id)prepareLocalNetworkProfilesForPresentation:(id)a3;
- (unint64_t)maxResults;
- (void)setMaxResults:(unint64_t)a3;
- (void)setProfiles:(id)a3;
@end

@implementation CWFKnownNetworkPreparer

- (CWFKnownNetworkPreparer)initWithNetworkProfiles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(CWFKnownNetworkPreparer);
    objc_msgSend_setProfiles_(v5, v6, (uint64_t)v4, v7, v8);
    objc_msgSend_setMaxResults_(v5, v9, 4, v10, v11);
  }
  else
  {
    v13 = CWFGetOSLog();
    if (v13)
    {
      v14 = CWFGetOSLog();
    }
    else
    {
      v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }

    v5 = 0;
  }

  return v5;
}

- (id)localNetworkPromptProfiles
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_profiles(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend__localNetworkFilter(self, v7, v8, v9, v10);
  id v15 = objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);

  v16 = CWFGetOSLog();
  if (v16)
  {
    v17 = CWFGetOSLog();
  }
  else
  {
    v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v15;
    int v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  v23 = objc_msgSend__lastJoinedComparator(self, v19, v20, v21, v22);
  v27 = objc_msgSend_sortedArrayUsingComparator_(v15, v24, (uint64_t)v23, v25, v26);

  v28 = CWFGetOSLog();
  if (v28)
  {
    v29 = CWFGetOSLog();
  }
  else
  {
    v29 = MEMORY[0x1E4F14500];
    id v30 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v27;
    int v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  v35 = objc_msgSend_profiles(self, v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend__filterForPrimaryHomeNetworkProfile_(self, v36, (uint64_t)v35, v37, v38);

  v128 = v15;
  v126 = (void *)v39;
  if (v39)
  {
    if ((objc_msgSend_containsObject_(v27, v40, v39, v41, v42) & 1) == 0)
    {
      v47 = objc_msgSend_mutableCopy(v27, v43, v44, v45, v46);
      objc_msgSend_addObject_(v47, v48, v39, v49, v50);

      v27 = v47;
    }
    v51 = CWFGetOSLog();
    if (v51)
    {
      v52 = CWFGetOSLog();
    }
    else
    {
      v52 = MEMORY[0x1E4F14500];
      id v53 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      int v134 = 138412290;
      uint64_t v135 = v39;
      int v122 = 12;
      v120 = &v134;
      _os_log_send_and_compose_impl();
    }
  }
  v127 = self;
  objc_msgSend__removeProfilesAtSimilarLocations_(self, v40, (uint64_t)v27, v41, v42, v120, v122);
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v124 = long long v132 = 0u;
  v125 = v27;
  v57 = objc_msgSend_differenceFromArray_(v124, v54, (uint64_t)v27, v55, v56);
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v129, (uint64_t)v133, 16);
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v130;
    v62 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v130 != v61) {
          objc_enumerationMutation(v57);
        }
        v64 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        v65 = CWFGetOSLog();
        if (v65)
        {
          v66 = CWFGetOSLog();
        }
        else
        {
          v67 = v62;
          v66 = v62;
        }

        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v72 = objc_msgSend_object(v64, v68, v69, v70, v71);
          int v134 = 138412290;
          uint64_t v135 = (uint64_t)v72;
          LODWORD(v123) = 12;
          v121 = &v134;
          _os_log_send_and_compose_impl();
        }
      }
      uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v73, (uint64_t)&v129, (uint64_t)v133, 16);
    }
    while (v60);
  }

  id v74 = v124;
  v79 = objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);
  v84 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v80, v81, v82, v83);
  for (unint64_t j = objc_msgSend_count(v84, v85, v86, v87, v88);
        j < objc_msgSend_maxResults(v127, v89, v90, v91, v92, v121, v123) && objc_msgSend_count(v79, v94, v95, v96, v97);
        unint64_t j = objc_msgSend_count(v84, v105, v106, v107, v108))
  {
    v98 = objc_msgSend_firstObject(v79, v94, v95, v96, v97);
    objc_msgSend_addObject_(v84, v99, (uint64_t)v98, v100, v101);

    objc_msgSend_removeObjectAtIndex_(v79, v102, 0, v103, v104);
  }
  v109 = objc_msgSend_allObjects(v84, v94, v95, v96, v97);
  v110 = CWFGetOSLog();
  if (v110)
  {
    v111 = CWFGetOSLog();
  }
  else
  {
    v111 = MEMORY[0x1E4F14500];
    id v112 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v109;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(v109, v113, v114, v115, v116)) {
    v117 = v109;
  }
  else {
    v117 = 0;
  }
  id v118 = v117;

  return v118;
}

- (id)prepareLocalNetworkProfilesForPresentation:(id)a3
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6, v7, v8))
  {
    v209 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12, v13);
    v211 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
    uint64_t v22 = objc_msgSend__presentationSortComparator(self, v18, v19, v20, v21);
    uint64_t v26 = objc_msgSend_sortedArrayUsingComparator_(v9, v23, (uint64_t)v22, v24, v25);

    uint64_t v30 = objc_msgSend__filterProfilesForHomeNetworksExceedingMaximumDistance_(self, v27, (uint64_t)v26, v28, v29);
    v210 = v9;
    v208 = (void *)v30;
    if (v30)
    {
      uint64_t v35 = v30;
      v36 = CWFGetOSLog();
      if (v36)
      {
        uint64_t v37 = CWFGetOSLog();
      }
      else
      {
        uint64_t v37 = MEMORY[0x1E4F14500];
        id v39 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v220 = 138412290;
        uint64_t v221 = v35;
        int v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      uint64_t v44 = objc_msgSend_mutableCopy(v26, v40, v41, v42, v43);
      objc_msgSend_removeObjectsInArray_(v44, v45, v35, v46, v47);
      if ((unint64_t)objc_msgSend_count(v44, v48, v49, v50, v51) >= 3)
      {
        uint64_t v56 = objc_msgSend_count(v44, v52, v53, v54, v55) - 2;
        v57 = CWFGetOSLog();
        if (v57)
        {
          v58 = CWFGetOSLog();
        }
        else
        {
          v58 = MEMORY[0x1E4F14500];
          id v59 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v226.location = 2;
          v226.length = v56;
          uint64_t v60 = NSStringFromRange(v226);
          int v220 = 138412290;
          uint64_t v221 = (uint64_t)v60;
          int v206 = 12;
          v204 = &v220;
          _os_log_send_and_compose_impl();
        }
        objc_msgSend_removeObjectsInRange_(v44, v61, 2, v56, v62);
      }
      id v38 = v44;

      v63 = CWFGetOSLog();
      if (v63)
      {
        v64 = CWFGetOSLog();
      }
      else
      {
        v64 = MEMORY[0x1E4F14500];
        id v65 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        int v220 = 138412290;
        uint64_t v221 = (uint64_t)v38;
        int v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_firstObject(v38, v66, v67, v68, v69, v204, v206);
    }
    else
    {
      id v38 = v26;
      objc_msgSend_firstObject(v26, v31, v32, v33, v34);
    uint64_t v70 = };
    v212 = objc_msgSend__location(v70, v71, v72, v73, v74);

    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    obunint64_t j = v38;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v214, (uint64_t)v224, 16);
    if (v76)
    {
      uint64_t v81 = v76;
      uint64_t v82 = *(void *)v215;
      do
      {
        for (uint64_t i = 0; i != v81; ++i)
        {
          if (*(void *)v215 != v82) {
            objc_enumerationMutation(obj);
          }
          v84 = *(void **)(*((void *)&v214 + 1) + 8 * i);
          v85 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v77, v78, v79, v80, v205, v207);
          uint64_t v90 = objc_msgSend_networkName(v84, v86, v87, v88, v89);

          if (v90)
          {
            uint64_t v95 = objc_msgSend_networkName(v84, v91, v92, v93, v94);
            objc_msgSend_setObject_forKey_(v85, v96, (uint64_t)v95, @"mapLabelCalloutTitleKey", v97);

            v102 = objc_msgSend_discoveredDevices(v84, v98, v99, v100, v101);

            if (v102)
            {
              uint64_t v107 = objc_msgSend_discoveredDevices(v84, v103, v104, v105, v106);
              v111 = objc_msgSend_objectForKeyedSubscript_(v107, v108, @"DevicesCount", v109, v110);

              if (v111)
              {
                objc_msgSend_setObject_forKey_(v85, v112, (uint64_t)v111, @"mapLabelCalloutDeviceCountKey", v113);
              }
              else
              {
                v121 = CWFGetOSLog();
                if (v121)
                {
                  int v122 = CWFGetOSLog();
                }
                else
                {
                  int v122 = MEMORY[0x1E4F14500];
                  id v125 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412290;
                  uint64_t v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }
              v126 = objc_msgSend_discoveredDevices(v84, v114, v115, v116, v117, v205, v207);
              long long v130 = objc_msgSend_objectForKeyedSubscript_(v126, v127, @"DevicesNames", v128, v129);

              if (v130 && objc_msgSend__shouldDisplayDeviceNames(v84, v131, v132, v133, v134))
              {
                v139 = objc_msgSend__shuffled(v130, v135, v136, v137, v138);
                v144 = objc_msgSend__removeBackslashAndSpaceCharacter(v130, v140, v141, v142, v143);

                objc_msgSend_setObject_forKey_(v85, v145, (uint64_t)v144, @"mapLabelCalloutDeviceNamesKey", v146);
              }
              else
              {
                v147 = CWFGetOSLog();
                if (v147)
                {
                  v144 = CWFGetOSLog();
                }
                else
                {
                  v144 = MEMORY[0x1E4F14500];
                  id v148 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412290;
                  uint64_t v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }
            }
            else
            {
              v120 = CWFGetOSLog();
              if (v120)
              {
                v111 = CWFGetOSLog();
              }
              else
              {
                v111 = MEMORY[0x1E4F14500];
                id v124 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                int v220 = 138412290;
                uint64_t v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }
            }

            uint64_t v153 = objc_msgSend__location(v84, v149, v150, v151, v152);
            if (v153)
            {
              v119 = v153;
              objc_msgSend_distanceFromLocation_(v212, v154, v153, v155, v156);
              if (v161 >= 4000000.0)
              {
                double v188 = v161;
                v189 = CWFGetOSLog();
                if (v189)
                {
                  v190 = CWFGetOSLog();
                }
                else
                {
                  v190 = MEMORY[0x1E4F14500];
                  id v192 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412546;
                  uint64_t v221 = (uint64_t)v84;
                  __int16 v222 = 2048;
                  double v223 = v188;
                  LODWORD(v207) = 22;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }
              else
              {
                v218[0] = @"mapLabelCalloutLatKey";
                v162 = NSNumber;
                objc_msgSend_coordinate(v119, v157, v158, v159, v160);
                v167 = objc_msgSend_numberWithDouble_(v162, v163, v164, v165, v166);
                v218[1] = @"mapLabelCalloutLngKey";
                v219[0] = v167;
                v168 = NSNumber;
                objc_msgSend_coordinate(v119, v169, v170, v171, v172);
                v178 = objc_msgSend_numberWithDouble_(v168, v173, v174, v175, v176, v177);
                v219[1] = v178;
                v180 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v179, (uint64_t)v219, (uint64_t)v218, 2);

                objc_msgSend_setObject_forKey_(v85, v181, (uint64_t)v180, @"mapLabelCalloutLocationKey", v182);
                objc_msgSend_addObject_(v211, v183, (uint64_t)v85, v184, v185);
              }
            }
            else
            {
              v186 = CWFGetOSLog();
              if (v186)
              {
                v187 = CWFGetOSLog();
              }
              else
              {
                v187 = MEMORY[0x1E4F14500];
                id v191 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
              {
                int v220 = 138412290;
                uint64_t v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }

              v119 = 0;
            }
          }
          else
          {
            id v118 = CWFGetOSLog();
            if (v118)
            {
              v119 = CWFGetOSLog();
            }
            else
            {
              v119 = MEMORY[0x1E4F14500];
              id v123 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
            {
              int v220 = 138412290;
              uint64_t v221 = (uint64_t)v84;
              LODWORD(v207) = 12;
              v205 = &v220;
              _os_log_send_and_compose_impl();
            }
          }
        }
        uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v214, (uint64_t)v224, 16);
      }
      while (v81);
    }
    v193 = obj;

    v194 = v209;
    v195 = v211;
    objc_msgSend_setObject_forKey_(v209, v196, (uint64_t)v211, @"mapLabelArrayForCalloutsKey", v197);
    uint64_t v9 = v210;
    v198 = v208;
  }
  else
  {
    v201 = CWFGetOSLog();
    if (v201)
    {
      v202 = CWFGetOSLog();
    }
    else
    {
      v202 = MEMORY[0x1E4F14500];
      id v203 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
    {
      LOWORD(v220) = 0;
      _os_log_send_and_compose_impl();
    }

    v212 = 0;
    v198 = 0;
    v195 = 0;
    v194 = 0;
    v193 = 0;
  }
  id v199 = v194;

  return v199;
}

- (id)_filterProfilesForHomeNetworksExceedingMaximumDistance:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = sub_1B4F8BF88;
  v84[3] = &unk_1E60BC150;
  id v9 = v8;
  id v85 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v10, (uint64_t)v84, v11, v12);
  if (objc_msgSend_count(v9, v13, v14, v15, v16))
  {
    id v71 = v3;
    v75 = objc_msgSend_mutableCopy(v3, v17, v18, v19, v20);
    objc_msgSend_removeObjectsInArray_(v75, v21, (uint64_t)v9, v22, v23);
    uint64_t v73 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25, v26, v27);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v70 = v9;
    obuint64_t j = v9;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v80, (uint64_t)v93, 16);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v74 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v81 != v74) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v33 = v75;
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v76, (uint64_t)v92, 16);
          if (v35)
          {
            uint64_t v40 = v35;
            uint64_t v41 = *(void *)v77;
            while (2)
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v77 != v41) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v43 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                uint64_t v44 = objc_msgSend__location(v32, v36, v37, v38, v39, v68, v69);
                uint64_t v49 = objc_msgSend__location(v43, v45, v46, v47, v48);
                objc_msgSend_distanceFromLocation_(v44, v50, (uint64_t)v49, v51, v52);
                double v54 = v53;

                if (v54 >= 4000000.0)
                {
                  uint64_t v55 = CWFGetOSLog();
                  if (v55)
                  {
                    uint64_t v56 = CWFGetOSLog();
                  }
                  else
                  {
                    uint64_t v56 = MEMORY[0x1E4F14500];
                    id v57 = MEMORY[0x1E4F14500];
                  }

                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    int v86 = 138412802;
                    uint64_t v87 = v32;
                    __int16 v88 = 2112;
                    uint64_t v89 = v43;
                    __int16 v90 = 2048;
                    double v91 = v54;
                    LODWORD(v69) = 32;
                    uint64_t v68 = &v86;
                    _os_log_send_and_compose_impl();
                  }

                  objc_msgSend_addObject_(v73, v58, (uint64_t)v32, v59, v60);
                  goto LABEL_22;
                }
              }
              uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v76, (uint64_t)v92, 16);
              if (v40) {
                continue;
              }
              break;
            }
          }
LABEL_22:
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v80, (uint64_t)v93, 16);
      }
      while (v30);
    }

    if (objc_msgSend_count(v73, v62, v63, v64, v65)) {
      id v66 = v73;
    }
    else {
      id v66 = 0;
    }
    id v9 = v70;
    id v3 = v71;
  }
  else
  {
    id v66 = 0;
  }

  return v66;
}

- (BOOL)profilesContainsHomeProfile:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend__isHomeNetwork(*(void **)(*((void *)&v13 + 1) + 8 * i), v5, v6, v7, v8, (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_filterForPrimaryHomeNetworkProfile:(id)a3
{
  uint64_t v6 = objc_msgSend_profiles(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend__homeNetworkFilter(self, v7, v8, v9, v10);
  long long v15 = objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);

  uint64_t v20 = objc_msgSend_count(v15, v16, v17, v18, v19);
  if (v20)
  {
    uint64_t v25 = objc_msgSend__networkProfileUsageComparator(self, v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_sortedArrayUsingComparator_(v15, v26, (uint64_t)v25, v27, v28);

    uint64_t v20 = objc_msgSend_firstObject(v29, v30, v31, v32, v33);
  }
  else
  {
    uint64_t v29 = 0;
  }
  id v34 = v20;

  return v34;
}

- (id)_removeProfilesAtSimilarLocations:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!qword_1EB4B2600)
  {
    uint64_t v109 = MEMORY[0x1E4F143A8];
    uint64_t v110 = 3221225472;
    v111 = sub_1B4F8D380;
    id v112 = &unk_1E60BAFB0;
    uint64_t v113 = 0;
    long long v117 = xmmword_1E60BC200;
    uint64_t v118 = 0;
    qword_1EB4B2600 = _sl_dlopen();
  }
  if (qword_1EB4B2600)
  {
    uint64_t v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7);
    uint64_t v96 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12, v13);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v91 = v8;
    id v14 = v8;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v105, (uint64_t)v116, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v106;
      id v93 = v14;
      uint64_t v94 = self;
      uint64_t v92 = *(void *)v106;
      do
      {
        uint64_t v22 = 0;
        uint64_t v95 = v20;
        do
        {
          if (*(void *)v106 != v21) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(void **)(*((void *)&v105 + 1) + 8 * v22);
          if ((objc_msgSend_containsObject_(v9, v17, (uint64_t)v23, v18, v19) & 1) == 0)
          {
            uint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v24, v18, v19);
            uint64_t v30 = objc_msgSend__location(v23, v26, v27, v28, v29);
            if (v30)
            {
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v31 = v14;
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v101, (uint64_t)v115, 16);
              if (v33)
              {
                uint64_t v37 = v33;
                uint64_t v38 = *(void *)v102;
                do
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v102 != v38) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v40 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                    if ((objc_msgSend_isEqual_(v40, v34, (uint64_t)v23, v35, v36) & 1) == 0
                      && (objc_msgSend_containsObject_(v9, v34, (uint64_t)v40, v35, v36) & 1) == 0)
                    {
                      objc_msgSend__location(v40, v34, v41, v35, v36);
                    }
                  }
                  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v101, (uint64_t)v115, 16);
                }
                while (v37);
              }

              objc_msgSend_setObject_forKey_(v96, v42, (uint64_t)v25, (uint64_t)v23, v43);
              id v14 = v93;
              self = v94;
              uint64_t v21 = v92;
              uint64_t v20 = v95;
            }
          }
          ++v22;
        }
        while (v22 != v20);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v105, (uint64_t)v116, 16);
      }
      while (v20);
    }

    objc_msgSend_array(MEMORY[0x1E4F1CA48], v44, v45, v46, v47);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    double v53 = objc_msgSend_allKeys(v96, v49, v50, v51, v52);
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v97, (uint64_t)v114, 16);
    if (v55)
    {
      uint64_t v59 = v55;
      uint64_t v60 = *(void *)v98;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v98 != v60) {
            objc_enumerationMutation(v53);
          }
          uint64_t v62 = *(void *)(*((void *)&v97 + 1) + 8 * j);
          uint64_t v63 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v56, v62, v57, v58);
          uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v96, v64, v62, v65, v66);
          objc_msgSend_addObjectsFromArray_(v63, v68, (uint64_t)v67, v69, v70);

          v75 = objc_msgSend__similarLocationComparator(self, v71, v72, v73, v74);
          objc_msgSend_sortUsingComparator_(v63, v76, (uint64_t)v75, v77, v78);

          long long v83 = objc_msgSend_firstObject(v63, v79, v80, v81, v82);
          objc_msgSend_addObject_(v48, v84, (uint64_t)v83, v85, v86);
        }
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v97, (uint64_t)v114, 16);
      }
      while (v59);
    }

    id v8 = v91;
  }
  else
  {
    uint64_t v87 = CWFGetOSLog();
    if (v87)
    {
      __int16 v88 = CWFGetOSLog();
    }
    else
    {
      __int16 v88 = MEMORY[0x1E4F14500];
      id v89 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v109) = 0;
      _os_log_send_and_compose_impl();
    }

    id v48 = v8;
  }

  return v48;
}

- (id)_homeNetworkFilter
{
  return (id)objc_msgSend_predicateWithBlock_(MEMORY[0x1E4F28F60], a2, (uint64_t)&unk_1F0DA3EF0, v2, v3);
}

- (id)_localNetworkFilter
{
  uint64_t v5 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend__dateByAddingDays_(v5, v6, -2, v7, v8);

  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B4F8C730;
  v17[3] = &unk_1E60BC198;
  id v18 = v9;
  id v11 = v9;
  long long v15 = objc_msgSend_predicateWithBlock_(v10, v12, (uint64_t)v17, v13, v14);

  return v15;
}

- (id)_similarLocationComparator
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1B4F8C8B4;
  v4[3] = &unk_1E60BC1C0;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1BA995F60](v4, a2);
  return v2;
}

- (id)_lastJoinedComparator
{
  return &unk_1F0DA4230;
}

- (id)_networkProfileUsageComparator
{
  return &unk_1F0DA34F0;
}

- (id)_homeNetworkComparator
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1B4F8CD14;
  v4[3] = &unk_1E60BC1C0;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1BA995F60](v4, a2);
  return v2;
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end