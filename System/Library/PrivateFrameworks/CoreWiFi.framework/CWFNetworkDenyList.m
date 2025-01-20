@interface CWFNetworkDenyList
- (BOOL)_evaluateTriggersForDenyListRemove:(id)a3 denyListRemoveReason:(unint64_t)a4 SSID:(id)a5;
- (BOOL)_evaluateTriggersForDenyListing:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 BSSID:(id)a6 SSID:(id)a7 state:(unint64_t)a8;
- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 denyListItem:(id)a4;
- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 forSSIDThresholds:(BOOL)a5 BSSID:(id)a6 SSID:(id)a7;
- (BOOL)enabled;
- (BOOL)isNetworkDenyListedForAutoJoinDueToTrigDisc:(id)a3 RSSI:(int64_t *)a4 timestamp:(double *)a5;
- (BOOL)isNetworkInDenyListedState:(unint64_t)a3 scanResult:(id)a4;
- (BOOL)isNetworkTemporarilyDenyListedForAutoJoin:(id)a3;
- (CWFNetworkDenyList)initWithDenyListDeviceProfile:(unint64_t)a3;
- (NSArray)BSSIDThresholds;
- (NSArray)SSIDThresholds;
- (double)BSSDenyListExpiry;
- (double)networkDenyListExpiry;
- (double)wowDenyListExpiry;
- (id)_findNetworkDenyListItem:(id)a3;
- (id)_findNetworkDenyListItemsForSSID:(id)a3;
- (id)batteryInfoHandler;
- (id)denyList;
- (id)denyListDidUpdateHandler;
- (id)denyListedNetworkSSIDs:(unint64_t)a3;
- (id)denyListedReasonHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (id)isUserModeInteractiveHandler;
- (id)networksInDenyListedState:(unint64_t)a3;
- (id)networksInDenyListedStateHistory:(unint64_t)a3;
- (id)reasonsForNetworkInDenyListedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (int64_t)RSSIWhenNetworkWasDenyListed:(id)a3;
- (int64_t)denyListThresholdForReason:(unint64_t)a3 forSSIDThresholds:(BOOL)a4;
- (unint64_t)denyListedNetworkCount;
- (void)_printDenyList;
- (void)_setDenyListState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)processDenyListedBSSForMetrics:(id)a3;
- (void)removeAllDenyListEntriesWithNetworkName:(id)a3;
- (void)removeAllDenyListedItems;
- (void)removeDenyListStateWithDenyListRemoveReason:(unint64_t)a3;
- (void)removeExpiredDenyListedState:(unint64_t)a3;
- (void)removeNetworkDenyListInfoForTrigger:(unint64_t)a3 forNetwork:(id)a4;
- (void)removeNetworkDenyListInfoWithReason:(unint64_t)a3 forScanResult:(id)a4;
- (void)setBSSDenyListExpiry:(double)a3;
- (void)setBSSIDThresholds:(id)a3;
- (void)setBatteryInfoHandler:(id)a3;
- (void)setDefaultDenyListThresholds;
- (void)setDenyListDidUpdateHandler:(id)a3;
- (void)setDenyListedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4;
- (void)setDenyListingThresholds:(unint64_t)a3 value:(unsigned int)a4 forSSIDThresholds:(BOOL)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setIsUserModeInteractiveHandler:(id)a3;
- (void)setNetworkDenyListExpiry:(double)a3;
- (void)setNetworkDenyListInfo:(id)a3 forScanResult:(id)a4;
- (void)setSSIDThresholds:(id)a3;
- (void)setWowDenyListExpiry:(double)a3;
@end

@implementation CWFNetworkDenyList

- (void)_printDenyList
{
  uint64_t v230 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1BA995D10](self, a2);
  if (objc_msgSend_count(self->_denyList, v4, v5, v6, v7))
  {
    v8 = CWFGetOSLog();
    if (v8)
    {
      v9 = CWFGetOSLog();
    }
    else
    {
      v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    v192 = v3;

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v224 = "-[CWFNetworkDenyList _printDenyList]";
      LODWORD(v191) = 12;
      v190 = buf;
      _os_log_send_and_compose_impl();
    }

    id v203 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend_setDateFormat_(v203, v11, @"MM/dd/yy HH:mm:ss.SSS", v12, v13);
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    obuint64_t j = self->_denyList;
    uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v216, (uint64_t)v229, 16);
    if (v195)
    {
      uint64_t v194 = *(void *)v217;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v217 != v194) {
            objc_enumerationMutation(obj);
          }
          uint64_t v198 = v15;
          v16 = *(void **)(*((void *)&v216 + 1) + 8 * v15);
          id v17 = [NSString alloc];
          v22 = objc_msgSend_scanResultForNetworkDenyListItem(v16, v18, v19, v20, v21);
          v27 = objc_msgSend_SSID(v22, v23, v24, v25, v26);
          uint64_t v30 = objc_msgSend_initWithData_encoding_(v17, v28, (uint64_t)v27, 4, v29);

          v35 = objc_msgSend_scanResultForNetworkDenyListItem(v16, v31, v32, v33, v34);
          v40 = objc_msgSend_BSSID(v35, v36, v37, v38, v39);
          uint64_t v45 = objc_msgSend_copy(v40, v41, v42, v43, v44);

          v50 = objc_msgSend_statesCurrent(v16, v46, v47, v48, v49);
          int v55 = objc_msgSend_count(v50, v51, v52, v53, v54);

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v59 = "YES";
            if (!v55) {
              v59 = "NO";
            }
            v224 = (const char *)v30;
            __int16 v225 = 2112;
            uint64_t v226 = v45;
            __int16 v227 = 2080;
            v228 = v59;
            _os_log_impl(&dword_1B4F30000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Network '%@' BSSID \"%@\" isDenyListed:%s ", buf, 0x20u);
          }
          v196 = (void *)v45;
          v197 = (void *)v30;
          v202 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v56, @" DenyListHistory: ", v57, v58, v190, v191);
          long long v212 = 0u;
          long long v213 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          id v199 = v16;
          v64 = objc_msgSend_statesHistory(v16, v60, v61, v62, v63);
          uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v212, (uint64_t)v222, 16);
          if (v66)
          {
            uint64_t v71 = v66;
            uint64_t v72 = 0;
            uint64_t v73 = *(void *)v213;
            do
            {
              for (uint64_t i = 0; i != v71; ++i)
              {
                if (*(void *)v213 != v73) {
                  objc_enumerationMutation(v64);
                }
                v75 = *(void **)(*((void *)&v212 + 1) + 8 * i);
                v76 = objc_msgSend_stateString(v75, v67, v68, v69, v70);
                objc_msgSend_stateTimestamp(v75, v77, v78, v79, v80);
                v81 = NSString;
                v86 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v82, v83, v84, v85);
                v90 = objc_msgSend_stringFromDate_(v203, v87, (uint64_t)v86, v88, v89);
                v94 = objc_msgSend_stringWithFormat_(v81, v91, @"[%d] %@ @ %@, ", v92, v93, v72 + i, v76, v90);

                objc_msgSend_appendString_(v202, v95, (uint64_t)v94, v96, v97);
              }
              uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v212, (uint64_t)v222, 16);
              uint64_t v72 = (v72 + i);
            }
            while (v71);
          }

          v98 = CWFGetOSLog();
          if (v98)
          {
            v99 = CWFGetOSLog();
          }
          else
          {
            v99 = MEMORY[0x1E4F14500];
            id v100 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v202;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          v201 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v101, @" States: ", v102, v103);
          long long v208 = 0u;
          long long v209 = 0u;
          long long v210 = 0u;
          long long v211 = 0u;
          v108 = objc_msgSend_statesCurrent(v199, v104, v105, v106, v107);
          uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v208, (uint64_t)v221, 16);
          if (v110)
          {
            uint64_t v115 = v110;
            uint64_t v116 = 0;
            uint64_t v117 = *(void *)v209;
            do
            {
              for (uint64_t j = 0; j != v115; ++j)
              {
                if (*(void *)v209 != v117) {
                  objc_enumerationMutation(v108);
                }
                v119 = *(void **)(*((void *)&v208 + 1) + 8 * j);
                v120 = objc_msgSend_stateString(v119, v111, v112, v113, v114, v190, v191);
                objc_msgSend_stateTimestamp(v119, v121, v122, v123, v124);
                v125 = NSString;
                v130 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v126, v127, v128, v129);
                v134 = objc_msgSend_stringFromDate_(v203, v131, (uint64_t)v130, v132, v133);
                v138 = objc_msgSend_stringWithFormat_(v125, v135, @"[%d] %@ @ %@, ", v136, v137, v116 + j, v120, v134);

                objc_msgSend_appendString_(v201, v139, (uint64_t)v138, v140, v141);
              }
              uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v111, (uint64_t)&v208, (uint64_t)v221, 16);
              uint64_t v116 = (v116 + j);
            }
            while (v115);
          }

          v142 = CWFGetOSLog();
          if (v142)
          {
            v143 = CWFGetOSLog();
          }
          else
          {
            v143 = MEMORY[0x1E4F14500];
            id v144 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v201;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          v148 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v145, @" Triggers: ", v146, v147);
          long long v204 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          long long v207 = 0u;
          objc_msgSend_denyListTriggers(v199, v149, v150, v151, v152);
          id v200 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v153, (uint64_t)&v204, (uint64_t)v220, 16);
          if (v154)
          {
            uint64_t v159 = v154;
            uint64_t v160 = 0;
            uint64_t v161 = *(void *)v205;
            do
            {
              for (uint64_t k = 0; k != v159; ++k)
              {
                if (*(void *)v205 != v161) {
                  objc_enumerationMutation(v200);
                }
                v163 = *(void **)(*((void *)&v204 + 1) + 8 * k);
                v164 = objc_msgSend_reasonString(v163, v155, v156, v157, v158, v190, v191);
                objc_msgSend_reasonTimestamp(v163, v165, v166, v167, v168);
                v169 = NSString;
                v174 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v170, v171, v172, v173);
                v178 = objc_msgSend_stringFromDate_(v203, v175, (uint64_t)v174, v176, v177);
                v182 = objc_msgSend_stringWithFormat_(v169, v179, @"[%d] %@ @ %@, ", v180, v181, v160 + k, v164, v178);

                objc_msgSend_appendString_(v148, v183, (uint64_t)v182, v184, v185);
              }
              uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v155, (uint64_t)&v204, (uint64_t)v220, 16);
              uint64_t v160 = (v160 + k);
            }
            while (v159);
          }

          v186 = CWFGetOSLog();
          if (v186)
          {
            v187 = CWFGetOSLog();
          }
          else
          {
            v187 = MEMORY[0x1E4F14500];
            id v188 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v224 = (const char *)v148;
            LODWORD(v191) = 12;
            v190 = buf;
            _os_log_send_and_compose_impl();
          }

          uint64_t v15 = v198 + 1;
        }
        while (v198 + 1 != v195);
        uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v189, (uint64_t)&v216, (uint64_t)v229, 16);
      }
      while (v195);
    }

    v3 = v192;
  }
}

- (void)removeDenyListStateWithDenyListRemoveReason:(unint64_t)a3
{
  uint64_t v271 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = v6;
  if (!v5)
  {
    v229 = CWFGetOSLog();
    if (v229)
    {
      uint64_t v230 = CWFGetOSLog();
    }
    else
    {
      uint64_t v230 = MEMORY[0x1E4F14500];
      id v232 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
      goto LABEL_110;
    }
    int v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
    goto LABEL_109;
  }
  if (!v6)
  {
    v231 = CWFGetOSLog();
    if (v231)
    {
      uint64_t v230 = CWFGetOSLog();
    }
    else
    {
      uint64_t v230 = MEMORY[0x1E4F14500];
      id v233 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
      goto LABEL_110;
    }
    int v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
LABEL_109:
    _os_log_send_and_compose_impl();
LABEL_110:

    goto LABEL_98;
  }
  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  obuint64_t j = self->_denyList;
  uint64_t v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v258, (uint64_t)v270, 16);
  int v9 = 0;
  if (!v241) {
    goto LABEL_87;
  }
  id v10 = 0;
  uint64_t v240 = *(void *)v259;
  v236 = v7;
  v244 = self;
  do
  {
    uint64_t v11 = 0;
    uint64_t v12 = v10;
    do
    {
      if (*(void *)v259 != v240) {
        objc_enumerationMutation(obj);
      }
      uint64_t v242 = v11;
      id v10 = *(id *)(*((void *)&v258 + 1) + 8 * v11);

      if (a3 == 7)
      {
        id v17 = objc_msgSend_denyListTriggers(v10, v13, v14, v15, v16);
        objc_msgSend_removeAllObjects(v17, v18, v19, v20, v21);

        uint64_t v26 = objc_msgSend_statesCurrent(v10, v22, v23, v24, v25);
        v256[0] = MEMORY[0x1E4F143A8];
        v256[1] = 3221225472;
        v256[2] = sub_1B4FDD0C8;
        v256[3] = &unk_1E60BCCC0;
        v27 = (char *)v10;
        v257 = v27;
        objc_msgSend_enumerateObjectsUsingBlock_(v26, v28, (uint64_t)v256, v29, v30);

        v35 = objc_msgSend_statesCurrent(v27, v31, v32, v33, v34);
        objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39);

        objc_msgSend_addObject_(v7, v40, (uint64_t)v27, v41, v42);
        int v9 = 1;
        uint64_t v43 = v257;
        goto LABEL_84;
      }
      id v44 = [NSString alloc];
      uint64_t v49 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v45, v46, v47, v48);
      uint64_t v54 = objc_msgSend_SSID(v49, v50, v51, v52, v53);
      uint64_t v43 = (char *)objc_msgSend_initWithData_encoding_(v44, v55, (uint64_t)v54, 4, v56);

      uint64_t v61 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v57, v58, v59, v60);
      objc_msgSend_BSSID(v61, v62, v63, v64, v65);
      v243 = (char *)objc_claimAutoreleasedReturnValue();

      uint64_t v70 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v66, v67, v68, v69);
      LODWORD(v49) = objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v71, 1, (uint64_t)v70, v72);

      double v77 = 0.0;
      int v239 = v9;
      id v238 = v10;
      if (v49)
      {
        uint64_t v78 = objc_msgSend_denyListTriggers(v10, v73, v74, v75, v76);
        objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

        long long v254 = 0u;
        long long v255 = 0u;
        long long v252 = 0u;
        long long v253 = 0u;
        v87 = objc_msgSend_statesCurrent(v10, v83, v84, v85, v86);
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v252, (uint64_t)v269, 16);
        if (!v89) {
          goto LABEL_50;
        }
        uint64_t v94 = v89;
        uint64_t v95 = *(void *)v253;
        while (1)
        {
          uint64_t v96 = 0;
          do
          {
            if (*(void *)v253 != v95) {
              objc_enumerationMutation(v87);
            }
            uint64_t v97 = *(void **)(*((void *)&v252 + 1) + 8 * v96);
            if (objc_msgSend_state(v97, v90, v91, v92, v93, v234, v235) != 1) {
              goto LABEL_36;
            }
            if (objc_msgSend_reason(v97, v98, v99, v100, v101) == 6) {
              goto LABEL_43;
            }
            if (a3 != 5) {
              goto LABEL_30;
            }
            objc_msgSend_stateTimestamp(v97, v90, v91, v92, v93);
            if (v106 > v77)
            {
              objc_msgSend_stateTimestamp(v97, v102, v103, v104, v105);
              double v77 = v107;
            }
            v108 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v102, v103, v104, v105);
            objc_msgSend_timeIntervalSince1970(v108, v109, v110, v111, v112);
            double v114 = v113;

            double v115 = v114 - v77;
            objc_msgSend_networkDenyListExpiry(v244, v116, v117, v118, v119);
            double v121 = v120;
            uint64_t v122 = CWFGetOSLog();
            uint64_t v123 = (void *)v122;
            if (v115 > v121)
            {
              if (v122)
              {
                uint64_t v124 = CWFGetOSLog();
              }
              else
              {
                uint64_t v124 = MEMORY[0x1E4F14500];
                id v126 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              {
                int v262 = 138543362;
                v263 = v43;
                LODWORD(v235) = 12;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_30:
              uint64_t v127 = CWFGetOSLog();
              if (v127)
              {
                uint64_t v128 = CWFGetOSLog();
              }
              else
              {
                uint64_t v128 = MEMORY[0x1E4F14500];
                id v129 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                int v262 = 136446466;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                __int16 v264 = 2114;
                v265 = v43;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v130, (uint64_t)v97, v131, v132);
LABEL_36:
              if (objc_msgSend_state(v97, v98, v99, v100, v101, v234, v235) == 3)
              {
                uint64_t v133 = CWFGetOSLog();
                if (v133)
                {
                  v134 = CWFGetOSLog();
                }
                else
                {
                  v134 = MEMORY[0x1E4F14500];
                  id v135 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  int v262 = 136446466;
                  v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                  __int16 v264 = 2114;
                  v265 = v43;
                  LODWORD(v235) = 22;
                  v234 = &v262;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_addObject_(v5, v136, (uint64_t)v97, v137, v138);
              }
              goto LABEL_43;
            }
            if (v122)
            {
              v125 = CWFGetOSLog();
            }
            else
            {
              v125 = MEMORY[0x1E4F14500];
              id v139 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              int v262 = 138543362;
              v263 = v43;
              LODWORD(v235) = 12;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }

LABEL_43:
            ++v96;
          }
          while (v94 != v96);
          uint64_t v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v252, (uint64_t)v269, 16);
          uint64_t v94 = v140;
          if (!v140)
          {
LABEL_50:

            uint64_t v7 = v236;
            self = v244;
            int v9 = v239;
            id v10 = v238;
            break;
          }
        }
      }
      uint64_t v141 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v73, v74, v75, v76, v234, v235);
      int isNetworkInDenyListedState_scanResult = objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v142, 2, (uint64_t)v141, v143);

      if (!isNetworkInDenyListedState_scanResult) {
        goto LABEL_83;
      }
      long long v250 = 0u;
      long long v251 = 0u;
      long long v248 = 0u;
      long long v249 = 0u;
      v149 = objc_msgSend_statesCurrent(v10, v145, v146, v147, v148);
      uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v248, (uint64_t)v268, 16);
      if (!v151) {
        goto LABEL_82;
      }
      uint64_t v156 = v151;
      uint64_t v157 = *(void *)v249;
      do
      {
        for (uint64_t i = 0; i != v156; ++i)
        {
          if (*(void *)v249 != v157) {
            objc_enumerationMutation(v149);
          }
          uint64_t v159 = *(void **)(*((void *)&v248 + 1) + 8 * i);
          if (objc_msgSend_state(v159, v152, v153, v154, v155, v234, v235) == 2)
          {
            if (a3 != 5) {
              goto LABEL_70;
            }
            objc_msgSend_stateTimestamp(v159, v152, v153, v154, v155);
            if (v164 > v77)
            {
              objc_msgSend_stateTimestamp(v159, v160, v161, v162, v163);
              double v77 = v165;
            }
            uint64_t v166 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v160, v161, v162, v163);
            objc_msgSend_timeIntervalSince1970(v166, v167, v168, v169, v170);
            double v172 = v171;

            double v173 = v172 - v77;
            objc_msgSend_BSSDenyListExpiry(v244, v174, v175, v176, v177);
            double v179 = v178;
            uint64_t v180 = CWFGetOSLog();
            uint64_t v181 = (void *)v180;
            if (v173 > v179)
            {
              if (v180)
              {
                v182 = CWFGetOSLog();
              }
              else
              {
                v182 = MEMORY[0x1E4F14500];
                id v184 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                int v262 = 138543618;
                v263 = v43;
                __int16 v264 = 2114;
                v265 = v243;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_70:
              uint64_t v185 = CWFGetOSLog();
              if (v185)
              {
                v186 = CWFGetOSLog();
              }
              else
              {
                v186 = MEMORY[0x1E4F14500];
                id v187 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                int v262 = 136446722;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                __int16 v264 = 2114;
                v265 = v43;
                __int16 v266 = 2114;
                v267 = v243;
                LODWORD(v235) = 32;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v188, (uint64_t)v159, v189, v190);
              continue;
            }
            if (v180)
            {
              v183 = CWFGetOSLog();
            }
            else
            {
              v183 = MEMORY[0x1E4F14500];
              id v191 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
            {
              int v262 = 138543618;
              v263 = v43;
              __int16 v264 = 2114;
              v265 = v243;
              LODWORD(v235) = 22;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }
          }
        }
        uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v152, (uint64_t)&v248, (uint64_t)v268, 16);
      }
      while (v156);
LABEL_82:

      uint64_t v7 = v236;
      self = v244;
      int v9 = v239;
      id v10 = v238;
LABEL_83:
      v245[0] = MEMORY[0x1E4F143A8];
      v245[1] = 3221225472;
      v245[2] = sub_1B4FDD0DC;
      v245[3] = &unk_1E60BCCE8;
      id v192 = v10;
      id v246 = v192;
      unint64_t v247 = a3;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v193, (uint64_t)v245, v194, v195);
      id v200 = objc_msgSend_statesCurrent(v192, v196, v197, v198, v199);
      objc_msgSend_removeObjectsInArray_(v200, v201, (uint64_t)v5, v202, v203);

      v9 |= objc_msgSend_count(v5, v204, v205, v206, v207) != 0;
      objc_msgSend_removeAllObjects(v5, v208, v209, v210, v211);

LABEL_84:
      uint64_t v11 = v242 + 1;
      uint64_t v12 = v10;
    }
    while (v242 + 1 != v241);
    uint64_t v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v212, (uint64_t)&v258, (uint64_t)v270, 16);
  }
  while (v241);

LABEL_87:
  if (objc_msgSend_count(v7, v213, v214, v215, v216))
  {
    v221 = CWFGetOSLog();
    if (v221)
    {
      v222 = CWFGetOSLog();
    }
    else
    {
      v222 = MEMORY[0x1E4F14500];
      id v223 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      int v262 = 136446210;
      v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
      LODWORD(v235) = 12;
      v234 = &v262;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeObjectsInArray_(self->_denyList, v224, (uint64_t)v7, v225, v226);
  }
  if (v9)
  {
    __int16 v227 = objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);

    if (v227)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);
      v228 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v228)[2](v228, &unk_1F0DA2730);
    }
  }
  objc_msgSend__printDenyList(self, v217, v218, v219, v220, v234, v235);
LABEL_98:
}

- (unint64_t)denyListedNetworkCount
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v2 = self->_denyList;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v34, (uint64_t)v43, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v10 = v6;
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v34 + 1) + 8 * i);

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v15 = objc_msgSend_statesCurrent(v6, v11, v12, v13, v14);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, (uint64_t)v42, 16);
        if (v17)
        {
          uint64_t v22 = v17;
          uint64_t v23 = *(void *)v31;
LABEL_8:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v15);
            }
            if (objc_msgSend_state(*(void **)(*((void *)&v30 + 1) + 8 * v24), v18, v19, v20, v21)) {
              break;
            }
            if (v22 == ++v24)
            {
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, (uint64_t)v42, 16);
              if (v22) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      v7 += v5;
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v25, (uint64_t)&v34, (uint64_t)v43, 16);
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  uint64_t v26 = CWFGetOSLog();
  if (v26)
  {
    v27 = CWFGetOSLog();
  }
  else
  {
    v27 = MEMORY[0x1E4F14500];
    id v28 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136446466;
    uint64_t v39 = "-[CWFNetworkDenyList denyListedNetworkCount]";
    __int16 v40 = 2048;
    unint64_t v41 = v7;
    _os_log_send_and_compose_impl();
  }

  return v7;
}

- (CWFNetworkDenyList)initWithDenyListDeviceProfile:(unint64_t)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)CWFNetworkDenyList;
  uint64_t v4 = [(CWFNetworkDenyList *)&v46 init];
  uint64_t v8 = v4;
  if (!v4)
  {
    long long v33 = CWFGetOSLog();
    if (v33)
    {
      long long v34 = CWFGetOSLog();
    }
    else
    {
      long long v34 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    uint64_t v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  objc_msgSend_setEnabled_(v4, v5, 0, v6, v7);
  objc_msgSend_setWowDenyListExpiry_(v8, v9, v10, v11, v12, 600.0);
  objc_msgSend_setNetworkDenyListExpiry_(v8, v13, v14, v15, v16, 300.0);
  objc_msgSend_setBSSDenyListExpiry_(v8, v17, v18, v19, v20, 300.0);
  v8->_profile = a3;
  uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  denyList = v8->_denyList;
  v8->_denyList = v21;

  if (!v8->_denyList)
  {
    long long v35 = CWFGetOSLog();
    if (v35)
    {
      long long v34 = CWFGetOSLog();
    }
    else
    {
      long long v34 = MEMORY[0x1E4F14500];
      id v39 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    uint64_t v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  uint64_t v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  SSIDThresholds = v8->_SSIDThresholds;
  v8->_SSIDThresholds = v23;

  if (!v8->_SSIDThresholds)
  {
    long long v36 = CWFGetOSLog();
    if (v36)
    {
      long long v34 = CWFGetOSLog();
    }
    else
    {
      long long v34 = MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    uint64_t v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }
  uint64_t v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  BSSIDThresholds = v8->_BSSIDThresholds;
  v8->_BSSIDThresholds = v25;

  if (!v8->_BSSIDThresholds)
  {
    long long v37 = CWFGetOSLog();
    if (v37)
    {
      long long v34 = CWFGetOSLog();
    }
    else
    {
      long long v34 = MEMORY[0x1E4F14500];
      id v41 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    uint64_t v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
LABEL_27:
    _os_log_send_and_compose_impl();
LABEL_28:

    objc_msgSend_removeAllObjects(v8->_denyList, v42, v43, v44, v45);
    long long v31 = 0;
    goto LABEL_6;
  }
  objc_msgSend_setDefaultDenyListThresholds(v8, v27, v28, v29, v30);
  long long v31 = v8;
LABEL_6:

  return v31;
}

- (void)setDefaultDenyListThresholds
{
  uint64_t v6 = (NSArray *)objc_msgSend_mutableCopy(self->_SSIDThresholds, a2, v2, v3, v4);
  uint64_t v11 = (NSArray *)objc_msgSend_mutableCopy(self->_BSSIDThresholds, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, 1, v13, v14);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v16, (uint64_t)v15, 0, v17);

  uint64_t v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v18, 1, v19, v20);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v22, (uint64_t)v21, 1, v23);

  v27 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v24, 1, v25, v26);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v28, (uint64_t)v27, 2, v29);

  long long v33 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v30, 3, v31, v32);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v34, (uint64_t)v33, 3, v35);

  id v39 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v36, 3, v37, v38);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v40, (uint64_t)v39, 4, v41);

  uint64_t v45 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, 10, v43, v44);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v46, (uint64_t)v45, 5, v47);

  uint64_t v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v48, 1, v49, v50);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v52, (uint64_t)v51, 6, v53);

  uint64_t v57 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v54, 3, v55, v56);
  objc_msgSend_setObject_atIndexedSubscript_(v11, v58, (uint64_t)v57, 7, v59);

  uint64_t v63 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v60, 1, v61, v62);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v64, (uint64_t)v63, 0, v65);

  uint64_t v69 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v66, 1, v67, v68);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v70, (uint64_t)v69, 1, v71);

  uint64_t v75 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v72, 1, v73, v74);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v76, (uint64_t)v75, 2, v77);

  uint64_t v81 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v78, 5, v79, v80);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v82, (uint64_t)v81, 3, v83);

  v87 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v84, 5, v85, v86);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v88, (uint64_t)v87, 4, v89);

  uint64_t v93 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v90, 10, v91, v92);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v94, (uint64_t)v93, 5, v95);

  uint64_t v99 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v96, 1, v97, v98);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v100, (uint64_t)v99, 6, v101);

  uint64_t v105 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v102, 3, v103, v104);
  objc_msgSend_setObject_atIndexedSubscript_(v6, v106, (uint64_t)v105, 7, v107);

  SSIDThresholds = self->_SSIDThresholds;
  self->_SSIDThresholds = v6;
  uint64_t v110 = v6;

  BSSIDThresholds = self->_BSSIDThresholds;
  self->_BSSIDThresholds = v11;
}

- (void)setDenyListedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  if (a4 == 3)
  {
    if (a3 == 0.0 || a3 > 3600.0)
    {
      uint64_t v9 = CWFGetOSLog();
      if (v9)
      {
        uint64_t v7 = CWFGetOSLog();
      }
      else
      {
        uint64_t v7 = MEMORY[0x1E4F14500];
        id v13 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    objc_msgSend_setWowDenyListExpiry_(self, a2, 3, v4, v5, a3);
  }
  else
  {
    if (a4 != 2)
    {
      if (a4 == 1)
      {
        if (a3 != 0.0 && a3 <= 86400.0)
        {
          objc_msgSend_setNetworkDenyListExpiry_(self, a2, 1, v4, v5, a3);
          return;
        }
        uint64_t v10 = CWFGetOSLog();
        if (v10)
        {
          uint64_t v7 = CWFGetOSLog();
        }
        else
        {
          uint64_t v7 = MEMORY[0x1E4F14500];
          id v14 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
LABEL_39:

          return;
        }
      }
      else
      {
        uint64_t v6 = CWFGetOSLog();
        if (v6)
        {
          uint64_t v7 = CWFGetOSLog();
        }
        else
        {
          uint64_t v7 = MEMORY[0x1E4F14500];
          id v11 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
      }
LABEL_38:
      _os_log_send_and_compose_impl();
      goto LABEL_39;
    }
    if (a3 == 0.0 || a3 > 300.0)
    {
      uint64_t v8 = CWFGetOSLog();
      if (v8)
      {
        uint64_t v7 = CWFGetOSLog();
      }
      else
      {
        uint64_t v7 = MEMORY[0x1E4F14500];
        id v12 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    objc_msgSend_setBSSDenyListExpiry_(self, a2, 2, v4, v5, a3);
  }
}

- (void)setDenyListingThresholds:(unint64_t)a3 value:(unsigned int)a4 forSSIDThresholds:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  if (a3 > 6 || a4 >= 0xFF)
  {
    long long v33 = CWFGetOSLog();
    if (v33)
    {
      long long v34 = CWFGetOSLog();
    }
    else
    {
      long long v34 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend_SSIDThresholds(self, a2, a3, *(uint64_t *)&a4, a5);
    id v39 = (id)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13);

    uint64_t v18 = objc_msgSend_BSSIDThresholds(self, v14, v15, v16, v17);
    uint64_t v23 = objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);

    uint64_t v29 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v24, v6, v25, v26);
    if (v5)
    {
      objc_msgSend_setObject_atIndexedSubscript_(v39, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setSSIDThresholds_(self, v30, (uint64_t)v39, v31, v32);
    }
    else
    {
      objc_msgSend_setObject_atIndexedSubscript_(v23, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setBSSIDThresholds_(self, v35, (uint64_t)v23, v36, v37);
    }
  }
}

- (int64_t)denyListThresholdForReason:(unint64_t)a3 forSSIDThresholds:(BOOL)a4
{
  if (a4) {
    objc_msgSend_SSIDThresholds(self, a2, a3, a4, v4);
  }
  else {
  uint64_t v6 = objc_msgSend_BSSIDThresholds(self, a2, a3, a4, v4);
  }
  uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, a3, v8, v9);
  int64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  return v15;
}

- (void)_setDenyListState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
}

- (void)setNetworkDenyListInfo:(id)a3 forScanResult:(id)a4
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_enabled(self, v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend__findNetworkDenyListItem_(self, v12, (uint64_t)v7, v13, v14);
    if (v15)
    {
      uint64_t v20 = v15;
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v23 = [CWFNetworkDenyListItem alloc];
      v27 = objc_msgSend_initWithDenyListNetwork_(v23, v24, (uint64_t)v7, v25, v26);
      if (!v27)
      {
        id v135 = CWFGetOSLog();
        if (v135)
        {
          uint64_t v134 = CWFGetOSLog();
        }
        else
        {
          uint64_t v134 = MEMORY[0x1E4F14500];
          id v136 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled((os_log_t)v134, OS_LOG_TYPE_ERROR))
        {
          int v141 = 136446210;
          v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
          _os_log_send_and_compose_impl();
        }
        uint64_t v21 = 0;
        uint64_t v35 = 0;
        uint64_t v20 = 0;
        goto LABEL_25;
      }
      uint64_t v21 = v27;
      uint64_t v20 = v21;
    }
    if (!objc_msgSend_state(v6, v16, v17, v18, v19)) {
      objc_msgSend_setState_(v6, v28, 5, v30, v31);
    }
    uint64_t v32 = objc_msgSend_reason(v6, v28, v29, v30, v31);
    if (objc_msgSend__ignoreTriggersForDeviceProfile_denyListItem_(self, v33, v32, (uint64_t)v20, v34))
    {
      uint64_t v35 = 0;
LABEL_26:

      goto LABEL_27;
    }
    id v36 = [NSString alloc];
    uint64_t v41 = objc_msgSend_scanResultForNetworkDenyListItem(v20, v37, v38, v39, v40);
    objc_super v46 = objc_msgSend_SSID(v41, v42, v43, v44, v45);
    uint64_t v35 = objc_msgSend_initWithData_encoding_(v36, v47, (uint64_t)v46, 4, v48);

    uint64_t v49 = CWFGetOSLog();
    if (v49)
    {
      uint64_t v50 = CWFGetOSLog();
    }
    else
    {
      uint64_t v50 = MEMORY[0x1E4F14500];
      id v52 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      unint64_t v57 = objc_msgSend_reason(v6, v53, v54, v55, v56);
      uint64_t v58 = CWFStringFromDenyListAddReason(v57);
      id v139 = objc_msgSend_BSSID(v6, v59, v60, v61, v62);
      uint64_t v140 = v21;
      uint64_t v67 = objc_msgSend_redactedForWiFi(v139, v63, v64, v65, v66);
      int v141 = 136448258;
      v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
      __int16 v143 = 2082;
      id v144 = "CWFNetworkDenyList.m";
      __int16 v145 = 1024;
      int v146 = 189;
      __int16 v147 = 2114;
      uint64_t v148 = v58;
      __int16 v149 = 2114;
      uint64_t v150 = v35;
      __int16 v151 = 2114;
      uint64_t v152 = v67;
      __int16 v153 = 2048;
      uint64_t v154 = objc_msgSend_reason(v6, v68, v69, v70, v71);
      __int16 v155 = 2048;
      uint64_t v156 = objc_msgSend_reasonData(v6, v72, v73, v74, v75);
      __int16 v157 = 2048;
      uint64_t v158 = objc_msgSend_state(v6, v76, v77, v78, v79);
      int v138 = 88;
      uint64_t v137 = &v141;
      _os_log_send_and_compose_impl();

      uint64_t v21 = v140;
    }

    uint64_t v84 = objc_msgSend_reason(v6, v80, v81, v82, v83);
    uint64_t v89 = objc_msgSend_reasonData(v6, v85, v86, v87, v88);
    uint64_t v94 = objc_msgSend_BSSID(v6, v90, v91, v92, v93);
    objc_msgSend_addDenyListTrigger_reasonData_BSSID_(v20, v95, v84, v89, (uint64_t)v94);

    uint64_t v100 = objc_msgSend_reason(v6, v96, v97, v98, v99);
    uint64_t v105 = objc_msgSend_reasonData(v6, v101, v102, v103, v104);
    uint64_t v110 = objc_msgSend_BSSID(v6, v106, v107, v108, v109);
    uint64_t v115 = objc_msgSend_state(v6, v111, v112, v113, v114);
    int v117 = objc_msgSend__evaluateTriggersForDenyListing_reason_reasonData_BSSID_SSID_state_(self, v116, (uint64_t)v20, v100, v105, v110, v35, v115);

    if ((objc_msgSend_containsObject_(self->_denyList, v118, (uint64_t)v20, v119, v120) & 1) == 0) {
      objc_msgSend_addObject_(self->_denyList, v121, (uint64_t)v20, v123, v124);
    }
    objc_msgSend__printDenyList(self, v121, v122, v123, v124, v137, v138);
    if (!v117) {
      goto LABEL_26;
    }
    id v129 = objc_msgSend_denyListDidUpdateHandler(self, v125, v126, v127, v128);

    if (!v129) {
      goto LABEL_26;
    }
    uint64_t v134 = objc_msgSend_denyListDidUpdateHandler(self, v130, v131, v132, v133);
    (*(void (**)(uint64_t, void *))(v134 + 16))(v134, &unk_1F0DA3FB0);
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v22 = CWFGetOSLog();
  if (v22)
  {
    uint64_t v20 = CWFGetOSLog();
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4F14500];
    id v51 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v141 = 136446210;
    v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
    _os_log_send_and_compose_impl();
  }
LABEL_27:
}

- (BOOL)_evaluateTriggersForDenyListing:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 BSSID:(id)a6 SSID:(id)a7 state:(unint64_t)a8
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v154 = a7;
  if (!v12)
  {
    int v146 = CWFGetOSLog();
    if (v146)
    {
      __int16 v147 = CWFGetOSLog();
    }
    else
    {
      __int16 v147 = MEMORY[0x1E4F14500];
      id v148 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      int v171 = 136446210;
      double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
      _os_log_send_and_compose_impl();
    }

    char v144 = 0;
    goto LABEL_122;
  }
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  uint64_t v18 = objc_msgSend_denyListTriggers(v12, v14, v15, v16, v17);
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v167, (uint64_t)v179, 16);
  if (!v166)
  {

    char v144 = 0;
    goto LABEL_121;
  }
  uint64_t v152 = 0;
  uint64_t v153 = 0;
  unint64_t v162 = 0;
  unsigned int v164 = 0;
  unsigned int v159 = 0;
  char v157 = 0;
  char v155 = 0;
  uint64_t v165 = *(void *)v168;
  unint64_t v151 = a8 & 0xFFFFFFFFFFFFFFFELL;
  id v158 = v13;
  unint64_t v160 = a8;
  obuint64_t j = v18;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v168 != v165) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v167 + 1) + 8 * v24);
      uint64_t v26 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v20, v21, v22, v23, v149, v150);
      objc_msgSend_timeIntervalSince1970(v26, v27, v28, v29, v30);
      double v32 = v31;

      unint64_t v37 = objc_msgSend_reason(v25, v33, v34, v35, v36);
      uint64_t v42 = objc_msgSend_reasonData(v25, v38, v39, v40, v41);
      objc_msgSend_reasonTimestamp(v25, v43, v44, v45, v46);
      double v48 = v47;
      if (!objc_msgSend_enterprisePolicy(v12, v49, v50, v51, v52)
        || a4 > 7
        || (double v57 = v32 - v48, v32 - v48 > 300.0))
      {
        if (!objc_msgSend_enterprisePolicy(v12, v53, v54, v55, v56, v57)) {
          goto LABEL_29;
        }
        uint64_t v66 = CWFGetOSLog();
        if (v66)
        {
          uint64_t v67 = CWFGetOSLog();
        }
        else
        {
          uint64_t v67 = MEMORY[0x1E4F14500];
          id v68 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          uint64_t v69 = CWFStringFromDenyListAddReason(v37);
          uint64_t v74 = objc_msgSend_BSSID(v25, v70, v71, v72, v73);
          uint64_t v79 = objc_msgSend_redactedForWiFi(v74, v75, v76, v77, v78);
          int v171 = 136446978;
          double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v69;
          __int16 v175 = 2114;
          uint64_t v176 = v79;
          __int16 v177 = 2048;
          double v178 = v32 - v48;
          LODWORD(v150) = 42;
          __int16 v149 = &v171;
          _os_log_send_and_compose_impl();

          a8 = v160;
          goto LABEL_27;
        }
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v58 = objc_msgSend_BSSID(v25, v53, v54, v55, v56, v57);
      uint64_t v61 = objc_msgSend_compare_options_(v58, v59, (uint64_t)v13, 1, v60);

      int v62 = v61 == 0;
      unsigned int v63 = v159;
      if (!v61) {
        unsigned int v63 = v159 + 1;
      }
      if (v37 != a4) {
        int v62 = 0;
      }
      v164 += v62;
      if (v37 == a4) {
        unsigned int v64 = v162 + 1;
      }
      else {
        unsigned int v64 = v162;
      }
      unint64_t v162 = __PAIR64__(HIDWORD(v162), v64) + 0x100000000;
      unsigned int v159 = v63;
      if (v63 > 0x12
        || (objc_msgSend__meetsThresholds_count_forSSIDThresholds_BSSID_SSID_(self, v20, a4, v164, 0, v13, v154) & 1) != 0
        || HIDWORD(v162) > 0x12
        || objc_msgSend__meetsThresholds_count_forSSIDThresholds_BSSID_SSID_(self, v20, a4, v162, 1, v13, v154))
      {
        if (a8 == 5 || a8 == 3)
        {
          objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 3, a4, a5);
          char v155 = 1;
          goto LABEL_29;
        }
        uint64_t v87 = CWFGetOSLog();
        if (v87)
        {
          uint64_t v67 = CWFGetOSLog();
        }
        else
        {
          uint64_t v67 = MEMORY[0x1E4F14500];
          id v88 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          uint64_t v69 = CWFStringFromDenyListAddReason(a4);
          uint64_t v74 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v89, v90, v91, v92, v32);
          int v171 = 136446722;
          double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v69;
          __int16 v175 = 2114;
          uint64_t v176 = v74;
          LODWORD(v150) = 32;
          __int16 v149 = &v171;
          _os_log_send_and_compose_impl();
LABEL_27:

          id v13 = v158;
        }
        goto LABEL_28;
      }
LABEL_29:
      if (v37 != a4)
      {
        uint64_t v82 = CWFGetOSLog();
        if (v82)
        {
          uint64_t v83 = CWFGetOSLog();
        }
        else
        {
          uint64_t v83 = MEMORY[0x1E4F14500];
          id v84 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v85 = CWFStringFromDenyListAddReason(v37);
          uint64_t v86 = CWFStringFromDenyListAddReason(a4);
          int v171 = 136446722;
          double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v85;
          __int16 v175 = 2114;
          uint64_t v176 = v86;
          LODWORD(v150) = 32;
          __int16 v149 = &v171;
          goto LABEL_48;
        }
        goto LABEL_49;
      }
      if (a4 <= 3)
      {
        if (a8 != 1 && a8 != 5)
        {
          if (a8 == 3)
          {
            objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 3, a4, a5);
            uint64_t v80 = CWFGetOSLog();
            if (v80)
            {
              uint64_t v81 = CWFGetOSLog();
            }
            else
            {
              uint64_t v81 = MEMORY[0x1E4F14500];
              id v93 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              uint64_t v98 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v94, v95, v96, v97, v32);
              int v171 = 136446466;
              double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
              __int16 v173 = 2114;
              v174 = v98;
              LODWORD(v150) = 22;
              __int16 v149 = &v171;
              _os_log_send_and_compose_impl();
            }
            char v155 = 1;
          }
          uint64_t v99 = CWFGetOSLog();
          if (v99)
          {
            uint64_t v83 = CWFGetOSLog();
          }
          else
          {
            uint64_t v83 = MEMORY[0x1E4F14500];
            id v100 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
LABEL_78:
            uint64_t v85 = CWFStringFromDenyListAddReason(a4);
            uint64_t v86 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v101, v102, v103, v104, v32);
            int v171 = 136446722;
            double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
            __int16 v173 = 2114;
            v174 = v85;
            __int16 v175 = 2114;
            uint64_t v176 = v86;
            LODWORD(v150) = 32;
            __int16 v149 = &v171;
            goto LABEL_48;
          }
LABEL_49:

          goto LABEL_50;
        }
        char v157 = 1;
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, a4, v42, v149, v150);
        goto LABEL_50;
      }
      switch(a4)
      {
        case 7uLL:
          if (++HIDWORD(v153) <= 2u) {
            goto LABEL_50;
          }
LABEL_62:
          if ((a8 | 4) == 5)
          {
            objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, a4, v42);
            char v157 = 1;
          }
          else
          {
            uint64_t v105 = CWFGetOSLog();
            if (v105)
            {
              double v106 = CWFGetOSLog();
            }
            else
            {
              double v106 = MEMORY[0x1E4F14500];
              id v108 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              uint64_t v109 = CWFStringFromDenyListAddReason(a4);
              uint64_t v114 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v110, v111, v112, v113, v32);
              int v171 = 136446722;
              double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
              __int16 v173 = 2114;
              v174 = v109;
              __int16 v175 = 2114;
              uint64_t v176 = v114;
              LODWORD(v150) = 32;
              __int16 v149 = &v171;
              _os_log_send_and_compose_impl();

              a8 = v160;
            }
          }
          goto LABEL_87;
        case 5uLL:
          LODWORD(v153) = v153 + 1;
          if (v153 < 5) {
            goto LABEL_50;
          }
          goto LABEL_62;
        case 4uLL:
          double v65 = v32 - v48;
          if (v32 - v48 <= 300.0)
          {
            LODWORD(v152) = v152 + 1;
            if (v152 >= 3)
            {
              if ((a8 | 4) != 5)
              {
                uint64_t v123 = CWFGetOSLog();
                if (v123)
                {
                  uint64_t v83 = CWFGetOSLog();
                }
                else
                {
                  uint64_t v83 = MEMORY[0x1E4F14500];
                  id v134 = MEMORY[0x1E4F14500];
                }

                if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
                  goto LABEL_49;
                }
                uint64_t v85 = CWFStringFromDenyListAddReason(4uLL);
                uint64_t v86 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v135, v136, v137, v138, v32);
                int v171 = 136446722;
                double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
                __int16 v173 = 2114;
                v174 = v85;
                __int16 v175 = 2114;
                uint64_t v176 = v86;
                LODWORD(v150) = 32;
                __int16 v149 = &v171;
                goto LABEL_48;
              }
              objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, 4, v42, v65, v149, v150);
LABEL_91:
              char v157 = 1;
              goto LABEL_50;
            }
          }
          goto LABEL_50;
      }
      if (a4 - 11 <= 1)
      {
        if (v151 != 4)
        {
          uint64_t v107 = CWFGetOSLog();
          if (v107)
          {
            uint64_t v83 = CWFGetOSLog();
          }
          else
          {
            uint64_t v83 = MEMORY[0x1E4F14500];
            id v122 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
            goto LABEL_78;
          }
          goto LABEL_49;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 4, a4, v42, v149, v150);
LABEL_98:
        char v157 = 1;
        goto LABEL_50;
      }
LABEL_87:
      if (a4 != 8)
      {
        if (a4 != 6) {
          goto LABEL_50;
        }
        if ((a8 | 4) != 5)
        {
          uint64_t v120 = CWFGetOSLog();
          if (v120)
          {
            uint64_t v83 = CWFGetOSLog();
          }
          else
          {
            uint64_t v83 = MEMORY[0x1E4F14500];
            id v124 = MEMORY[0x1E4F14500];
          }

          if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
            goto LABEL_49;
          }
          uint64_t v85 = CWFStringFromDenyListAddReason(6uLL);
          uint64_t v86 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v125, v126, v127, v128, v32);
          int v171 = 136446722;
          double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v85;
          __int16 v175 = 2114;
          uint64_t v176 = v86;
          LODWORD(v150) = 32;
          __int16 v149 = &v171;
          goto LABEL_48;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 1, 6, v42, v65, v149, v150);
        goto LABEL_91;
      }
      uint64_t v115 = objc_msgSend_BSSID(v25, v20, v21, v22, v23);
      uint64_t v118 = objc_msgSend_compare_options_(v115, v116, (uint64_t)v13, 1, v117);

      if (v118) {
        unsigned int v119 = HIDWORD(v152);
      }
      else {
        unsigned int v119 = HIDWORD(v152) + 1;
      }
      HIDWORD(v152) = v119;
      if (v119 >= 3)
      {
        if (a8 != 2)
        {
          double v121 = CWFGetOSLog();
          if (v121)
          {
            uint64_t v83 = CWFGetOSLog();
          }
          else
          {
            uint64_t v83 = MEMORY[0x1E4F14500];
            id v129 = MEMORY[0x1E4F14500];
          }

          if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
            goto LABEL_49;
          }
          uint64_t v85 = CWFStringFromDenyListAddReason(8uLL);
          uint64_t v86 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v130, v131, v132, v133, v32);
          int v171 = 136446722;
          double v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v85;
          __int16 v175 = 2114;
          uint64_t v176 = v86;
          LODWORD(v150) = 32;
          __int16 v149 = &v171;
LABEL_48:
          _os_log_send_and_compose_impl();

          a8 = v160;
          goto LABEL_49;
        }
        objc_msgSend__setDenyListState_state_reason_reasonData_(self, v20, (uint64_t)v12, 2, 8, v42, v149, v150);
        goto LABEL_98;
      }
LABEL_50:
      ++v24;
    }
    while (v166 != v24);
    uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v167, (uint64_t)v179, 16, v65);
    uint64_t v166 = v139;
  }
  while (v139);

  char v144 = v157;
  if (v155)
  {
    objc_msgSend_addDenyListStateHistory_state_reason_reasonData_(v12, v140, 0, a8, a4, a5);
    char v144 = 1;
  }
LABEL_121:
  objc_msgSend__printDenyList(self, v140, v141, v142, v143, v149, v150);
LABEL_122:

  return v144 & 1;
}

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 denyListItem:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v11 = v6;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  if (self->_profile == 2)
  {
    id v12 = CWFGetOSLog();
    if (v12)
    {
      id v13 = CWFGetOSLog();
    }
    else
    {
      id v13 = MEMORY[0x1E4F14500];
      id v35 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unint64_t profile = self->_profile;
      int v46 = 136446722;
      double v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
      __int16 v48 = 2048;
      unint64_t v49 = a3;
      __int16 v50 = 2048;
      unint64_t v51 = profile;
      _os_log_send_and_compose_impl();
    }

    BOOL v37 = 1;
  }
  else
  {
    if ((objc_msgSend_enterprisePolicy(v6, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_scanResultForNetworkDenyListItem(v11, v14, v15, v16, v17),
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_matchingKnownNetworkProfile(v18, v19, v20, v21, v22),
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          int isProfileBased = objc_msgSend_isProfileBased(v23, v24, v25, v26, v27),
          v23,
          v18,
          isProfileBased))
    {
      uint64_t v29 = objc_msgSend_batteryInfoHandler(self, v14, v15, v16, v17);

      if (v29)
      {
        uint64_t v34 = objc_msgSend_batteryInfoHandler(self, v30, v31, v32, v33);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = sub_1B4FDCED0;
        v41[3] = &unk_1E60BCC98;
        v41[4] = &v42;
        v41[5] = a3;
        (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v41);
      }
      else
      {
        uint64_t v38 = CWFGetOSLog();
        if (v38)
        {
          uint64_t v34 = CWFGetOSLog();
        }
        else
        {
          uint64_t v34 = MEMORY[0x1E4F14500];
          id v39 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
        {
          int v46 = 136446210;
          double v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
          _os_log_send_and_compose_impl();
        }
      }
    }
    BOOL v37 = *((unsigned char *)v43 + 24) != 0;
  }
  _Block_object_dispose(&v42, 8);

  return v37;
}

- (void)removeExpiredDenyListedState:(unint64_t)a3
{
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  id v215 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v215)
  {
    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    obuint64_t j = self->_denyList;
    uint64_t v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v227, (uint64_t)v243, 16);
    id v6 = 0;
    if (v211)
    {
      uint64_t v210 = *(void *)v228;
      uint64_t v216 = self;
LABEL_4:
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      while (1)
      {
        if (*(void *)v228 != v210) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v227 + 1) + 8 * v7);

        id v13 = objc_msgSend_statesCurrent(v6, v9, v10, v11, v12);

        if (v13) {
          break;
        }
LABEL_88:
        ++v7;
        uint64_t v8 = v6;
        if (v7 == v211)
        {
          uint64_t v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v227, (uint64_t)v243, 16);
          if (!v211)
          {
            id v200 = v6;
            id v6 = 0;
            goto LABEL_91;
          }
          goto LABEL_4;
        }
      }
      uint64_t v18 = objc_msgSend_scanResultForNetworkDenyListItem(v6, v14, v15, v16, v17);
      objc_msgSend_SSID(v18, v19, v20, v21, v22);
      *(double *)&uint64_t v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      uint64_t v214 = (void *)v23;
      if (*(double *)&v23 != 0.0)
      {
        uint64_t v28 = objc_msgSend_statesHistory(v6, v24, v25, v26, v27);
        uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

        uint64_t v212 = v7;
        if (v33)
        {
          long long v225 = 0u;
          long long v226 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          uint64_t v38 = objc_msgSend_statesHistory(v6, v34, v35, v36, v37);
          uint64_t v43 = objc_msgSend_reverseObjectEnumerator(v38, v39, v40, v41, v42);

          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v223, (uint64_t)v242, 16);
          double v50 = 0.0;
          if (!v45) {
            goto LABEL_22;
          }
          uint64_t v51 = v45;
          uint64_t v52 = *(void *)v224;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v224 != v52) {
                objc_enumerationMutation(v43);
              }
              uint64_t v54 = *(void **)(*((void *)&v223 + 1) + 8 * i);
              if (v54
                && (objc_msgSend_state(*(void **)(*((void *)&v223 + 1) + 8 * i), v46, v47, v48, v49) == a3
                 || objc_msgSend_state(v54, v46, v47, v48, v49) == 5))
              {
                objc_msgSend_stateTimestamp(v54, v46, v47, v48, v49);
                double v50 = v55;
                goto LABEL_22;
              }
            }
            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v223, (uint64_t)v242, 16);
          }
          while (v51);
LABEL_22:
        }
        else
        {
          double v50 = 0.0;
        }
        long long v221 = 0u;
        long long v222 = 0u;
        long long v219 = 0u;
        long long v220 = 0u;
        long long v213 = v6;
        uint64_t v56 = objc_msgSend_statesCurrent(v6, v34, v35, v36, v37);
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v219, (uint64_t)v241, 16);
        if (!v58) {
          goto LABEL_84;
        }
        uint64_t v63 = v58;
        uint64_t v64 = *(void *)v220;
LABEL_26:
        uint64_t v65 = 0;
        while (1)
        {
          if (*(void *)v220 != v64) {
            objc_enumerationMutation(v56);
          }
          uint64_t v66 = *(void **)(*((void *)&v219 + 1) + 8 * v65);
          uint64_t v67 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v59, v60, v61, v62, v205, v207);
          objc_msgSend_timeIntervalSince1970(v67, v68, v69, v70, v71);
          double v73 = v72;

          if (objc_msgSend_state(v66, v74, v75, v76, v77) == a3 && objc_msgSend_state(v66, v78, v79, v80, v81) == 3)
          {
            objc_msgSend_wowDenyListExpiry(v216, v78, v79, v80, v81);
            if (v50 == 0.0)
            {
              uint64_t v87 = CWFGetOSLog();
              if (v87)
              {
                id v88 = CWFGetOSLog();
              }
              else
              {
                id v88 = MEMORY[0x1E4F14500];
                id v97 = MEMORY[0x1E4F14500];
              }

              if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                goto LABEL_77;
              }
              int v231 = 136446210;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              LODWORD(v207) = 12;
              uint64_t v205 = &v231;
              goto LABEL_41;
            }
            double v89 = v86;
            if (objc_msgSend_reason(v66, v82, v83, v84, v85) == 2)
            {
              objc_msgSend_stateTimestamp(v66, v90, v91, v92, v93);
              if (v73 - v94 <= 3600.0)
              {
                id v108 = CWFGetOSLog();
                if (v108)
                {
                  id v88 = CWFGetOSLog();
                }
                else
                {
                  id v88 = MEMORY[0x1E4F14500];
                  id v172 = MEMORY[0x1E4F14500];
                }

                if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_77;
                }
                int v231 = 136446210;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                LODWORD(v207) = 12;
                uint64_t v205 = &v231;
LABEL_41:
                _os_log_send_and_compose_impl();
                goto LABEL_77;
              }
            }
            uint64_t v95 = CWFGetOSLog();
            if (v95)
            {
              uint64_t v96 = CWFGetOSLog();
            }
            else
            {
              uint64_t v96 = MEMORY[0x1E4F14500];
              id v98 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              int v231 = 136446722;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              __int16 v233 = 2048;
              double v234 = v73 - v50;
              __int16 v235 = 2048;
              double v236 = v89;
              LODWORD(v207) = 32;
              uint64_t v205 = &v231;
              _os_log_send_and_compose_impl();
            }

            if (v73 - v50 > v89)
            {
              uint64_t v99 = objc_msgSend_stateString(v66, v78, v79, v80, v81);
              objc_msgSend_stateTimestamp(v66, v100, v101, v102, v103);
              double v105 = v104;
              double v106 = CWFGetOSLog();
              if (v106)
              {
                uint64_t v107 = CWFGetOSLog();
              }
              else
              {
                uint64_t v107 = MEMORY[0x1E4F14500];
                id v109 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                uint64_t v114 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v110, v111, v112, v113, v105);
                int v231 = 136447234;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                __int16 v233 = 2114;
                double v234 = *(double *)&v214;
                __int16 v235 = 2114;
                double v236 = *(double *)&v99;
                __int16 v237 = 2114;
                id v238 = v114;
                __int16 v239 = 2114;
                uint64_t v240 = v214;
                LODWORD(v207) = 52;
                uint64_t v205 = &v231;
                _os_log_send_and_compose_impl();
              }
              objc_msgSend_addObject_(v215, v115, (uint64_t)v66, v116, v117);
            }
          }
          if (objc_msgSend_state(v66, v78, v79, v80, v81, v205, v207) == a3
            && objc_msgSend_state(v66, v118, v119, v120, v121) == 2
            && objc_msgSend_reason(v66, v118, v119, v120, v121) == 8)
          {
            objc_msgSend_BSSDenyListExpiry(v216, v118, v119, v120, v121);
            double v123 = v122;
            id v124 = CWFGetOSLog();
            if (v124)
            {
              v125 = CWFGetOSLog();
            }
            else
            {
              v125 = MEMORY[0x1E4F14500];
              id v126 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_stateTimestamp(v66, v127, v128, v129, v130);
              int v231 = 136446722;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              __int16 v233 = 2048;
              double v234 = v73 - v131;
              __int16 v235 = 2048;
              double v236 = v123;
              LODWORD(v208) = 32;
              uint64_t v206 = &v231;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_stateTimestamp(v66, v132, v133, v134, v135);
            if (v73 - v136 > v123)
            {
              uint64_t v137 = objc_msgSend_stateString(v66, v118, v119, v120, v121);
              objc_msgSend_stateTimestamp(v66, v138, v139, v140, v141);
              double v143 = v142;
              char v144 = CWFGetOSLog();
              if (v144)
              {
                __int16 v145 = CWFGetOSLog();
              }
              else
              {
                __int16 v145 = MEMORY[0x1E4F14500];
                id v146 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
              {
                unint64_t v151 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v147, v148, v149, v150, v143);
                int v231 = 136447234;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                __int16 v233 = 2114;
                double v234 = *(double *)&v214;
                __int16 v235 = 2114;
                double v236 = *(double *)&v137;
                __int16 v237 = 2114;
                id v238 = v151;
                __int16 v239 = 2114;
                uint64_t v240 = v214;
                LODWORD(v208) = 52;
                uint64_t v206 = &v231;
                _os_log_send_and_compose_impl();
              }
              objc_msgSend_addObject_(v215, v152, (uint64_t)v66, v153, v154);
            }
          }
          if (objc_msgSend_state(v66, v118, v119, v120, v121, v206, v208) != a3
            || objc_msgSend_state(v66, v59, v60, v61, v62) != 4)
          {
            goto LABEL_78;
          }
          id v88 = objc_msgSend_stateString(v66, v59, v60, v61, v62);
          objc_msgSend_stateTimestamp(v66, v155, v156, v157, v158);
          double v160 = v159;
          uint64_t v161 = CWFGetOSLog();
          if (v161)
          {
            unint64_t v162 = CWFGetOSLog();
          }
          else
          {
            unint64_t v162 = MEMORY[0x1E4F14500];
            id v163 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
          {
            long long v168 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v164, v165, v166, v167, v160);
            int v231 = 136447234;
            id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
            __int16 v233 = 2114;
            double v234 = *(double *)&v214;
            __int16 v235 = 2114;
            double v236 = *(double *)&v88;
            __int16 v237 = 2114;
            id v238 = v168;
            __int16 v239 = 2114;
            uint64_t v240 = v214;
            LODWORD(v207) = 52;
            uint64_t v205 = &v231;
            _os_log_send_and_compose_impl();
          }
          objc_msgSend_addObject_(v215, v169, (uint64_t)v66, v170, v171);
LABEL_77:

LABEL_78:
          if (v63 == ++v65)
          {
            uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v219, (uint64_t)v241, 16);
            uint64_t v63 = v173;
            if (!v173)
            {
LABEL_84:

              v217[0] = MEMORY[0x1E4F143A8];
              v217[1] = 3221225472;
              v217[2] = sub_1B4FDDE18;
              v217[3] = &unk_1E60BCCC0;
              id v6 = v213;
              v174 = v213;
              uint64_t v218 = v174;
              objc_msgSend_enumerateObjectsUsingBlock_(v215, v175, (uint64_t)v217, v176, v177);
              v182 = objc_msgSend_statesCurrent(v174, v178, v179, v180, v181);
              objc_msgSend_removeObjectsInArray_(v182, v183, (uint64_t)v215, v184, v185);

              if (objc_msgSend_count(v215, v186, v187, v188, v189))
              {
                uint64_t v194 = objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);

                if (v194)
                {
                  objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);
                  uint64_t v195 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                  ((void (**)(void, void *))v195)[2](v195, &unk_1F0DA2750);
                }
              }
              objc_msgSend_removeAllObjects(v215, v190, v191, v192, v193, v205, v207);
              objc_msgSend__printDenyList(v216, v196, v197, v198, v199);

              uint64_t v7 = v212;
              goto LABEL_88;
            }
            goto LABEL_26;
          }
        }
      }
      v201 = CWFGetOSLog();
      if (v201)
      {
        id v200 = CWFGetOSLog();
      }
      else
      {
        id v200 = MEMORY[0x1E4F14500];
        id v202 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        int v231 = 136446210;
        id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
        _os_log_send_and_compose_impl();
      }
LABEL_91:
    }
  }
  else
  {
    uint64_t v203 = CWFGetOSLog();
    if (v203)
    {
      id v6 = CWFGetOSLog();
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v204 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v231 = 136446210;
      id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)removeAllDenyListedItems
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v53 = 136446210;
    uint64_t v54 = "-[CWFNetworkDenyList removeAllDenyListedItems]";
    int v44 = 12;
    uint64_t v43 = &v53;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(self->_denyList, v6, v7, v8, v9))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = self->_denyList;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(id *)(*((void *)&v48 + 1) + 8 * i);

          objc_msgSend_addObject_(v14, v22, (uint64_t)v21, v23, v24);
          uint64_t v29 = objc_msgSend_statesCurrent(v21, v25, v26, v27, v28);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = sub_1B4FDE1D4;
          v46[3] = &unk_1E60BCCC0;
          id v18 = v21;
          id v47 = v18;
          objc_msgSend_enumerateObjectsUsingBlock_(v29, v30, (uint64_t)v46, v31, v32);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v48, (uint64_t)v52, 16);
      }
      while (v17);
    }
    objc_msgSend_removeObjectsInArray_(self->_denyList, v34, (uint64_t)v14, v35, v36);
    uint64_t v41 = objc_msgSend_denyListDidUpdateHandler(self, v37, v38, v39, v40);

    if (v41)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v10, v11, v12, v13);
      uint64_t v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v42)[2](v42, &unk_1F0DA3130);
    }
  }
  else
  {
    id v14 = 0;
  }
  objc_msgSend__printDenyList(self, v10, v11, v12, v13, v43, v44);
}

- (void)removeNetworkDenyListInfoWithReason:(unint64_t)a3 forScanResult:(id)a4
{
  uint64_t v365 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!v9)
  {
    objc_msgSend__printDenyList(self, v5, v6, v7, v8);
    uint64_t v10 = CWFGetOSLog();
    if (v10)
    {
      uint64_t v11 = CWFGetOSLog();
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v350 = 136446210;
      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v319) = 12;
      v316 = &v350;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllDenyListedItems(self, v13, v14, v15, v16);
  }
  if (a3 == 1)
  {
    uint64_t v17 = objc_msgSend_SSID(v9, v5, v6, v7, v8);
    objc_msgSend__findNetworkDenyListItemsForSSID_(self, v18, (uint64_t)v17, v19, v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v21, v22, v23, v24, v25)) {
      goto LABEL_24;
    }
    uint64_t v26 = CWFGetOSLog();
    if (v26)
    {
      uint64_t v27 = CWFGetOSLog();
    }
    else
    {
      uint64_t v27 = MEMORY[0x1E4F14500];
      id v37 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_msgSend_SSID(v9, v38, v39, v40, v41);
      id v47 = objc_msgSend_BSSID(v9, v43, v44, v45, v46);
      int v350 = 136446722;
      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      __int16 v352 = 2114;
      v353 = v42;
      __int16 v354 = 2114;
      v355 = v47;
      LODWORD(v319) = 32;
      v316 = &v350;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v31 = objc_msgSend__findNetworkDenyListItem_(self, v28, (uint64_t)v9, v29, v30);
    if (v31)
    {
      uint64_t v27 = v31;
      objc_msgSend_addObject_(v21, v32, v31, v33, v34);
    }
    else
    {
      uint64_t v35 = CWFGetOSLog();
      if (v35)
      {
        uint64_t v36 = CWFGetOSLog();
      }
      else
      {
        uint64_t v36 = MEMORY[0x1E4F14500];
        id v48 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v53 = objc_msgSend_SSID(v9, v49, v50, v51, v52);
        uint64_t v58 = objc_msgSend_BSSID(v9, v54, v55, v56, v57);
        int v350 = 136446722;
        v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
        __int16 v352 = 2114;
        v353 = v53;
        __int16 v354 = 2114;
        v355 = v58;
        LODWORD(v319) = 32;
        v316 = &v350;
        _os_log_send_and_compose_impl();
      }
      uint64_t v27 = 0;
    }
  }

LABEL_24:
  id v332 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v322 = v21;
  if (!v332)
  {
    v312 = CWFGetOSLog();
    if (v312)
    {
      uint64_t v59 = CWFGetOSLog();
    }
    else
    {
      uint64_t v59 = MEMORY[0x1E4F14500];
      id v314 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_151;
    }
    int v350 = 136446210;
    v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
    goto LABEL_150;
  }
  id v330 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v330)
  {
    v313 = CWFGetOSLog();
    if (v313)
    {
      uint64_t v59 = CWFGetOSLog();
    }
    else
    {
      uint64_t v59 = MEMORY[0x1E4F14500];
      id v315 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_151;
    }
    int v350 = 136446210;
    v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
LABEL_150:
    _os_log_send_and_compose_impl();
LABEL_151:
    v307 = 0;
    uint64_t v63 = 0;
    id v330 = 0;
    goto LABEL_139;
  }
  long long v347 = 0u;
  long long v348 = 0u;
  long long v345 = 0u;
  long long v346 = 0u;
  uint64_t v59 = v21;
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v345, (uint64_t)v364, 16);
  if (v61)
  {
    uint64_t v62 = v61;
    unint64_t v328 = a3;
    v331 = 0;
    uint64_t v63 = 0;
    unint64_t v64 = 0x1E4F29000uLL;
    uint64_t v325 = *(void *)v346;
    v323 = v59;
    do
    {
      uint64_t v65 = 0;
      uint64_t v324 = v62;
      do
      {
        uint64_t v66 = v63;
        if (*(void *)v346 != v325) {
          objc_enumerationMutation(v59);
        }
        uint64_t v326 = v65;
        uint64_t v67 = *(void **)(*((void *)&v345 + 1) + 8 * v65);
        id v68 = objc_alloc(*(Class *)(v64 + 24));
        double v73 = objc_msgSend_scanResultForNetworkDenyListItem(v67, v69, v70, v71, v72);
        uint64_t v78 = objc_msgSend_SSID(v73, v74, v75, v76, v77);
        uint64_t v63 = objc_msgSend_initWithData_encoding_(v68, v79, (uint64_t)v78, 4, v80);

        if (v63)
        {
          uint64_t v85 = objc_msgSend_scanResultForNetworkDenyListItem(v67, v81, v82, v83, v84);
          uint64_t v90 = objc_msgSend_BSSID(v85, v86, v87, v88, v89);

          if (v90)
          {
            v331 = (void *)v90;
            long long v343 = 0u;
            long long v344 = 0u;
            long long v341 = 0u;
            long long v342 = 0u;
            uint64_t v95 = objc_msgSend_statesCurrent(v67, v91, v92, v93, v94);
            uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v341, (uint64_t)v363, 16);
            if (v97)
            {
              uint64_t v102 = v97;
              uint64_t v103 = *(void *)v342;
              do
              {
                for (uint64_t i = 0; i != v102; ++i)
                {
                  if (*(void *)v342 != v103) {
                    objc_enumerationMutation(v95);
                  }
                  double v105 = *(void **)(*((void *)&v341 + 1) + 8 * i);
                  if (objc_msgSend_state(v105, v98, v99, v100, v101, v316, v319) == 1)
                  {
                    uint64_t v110 = CWFGetOSLog();
                    if (v110)
                    {
                      uint64_t v111 = CWFGetOSLog();
                    }
                    else
                    {
                      uint64_t v111 = MEMORY[0x1E4F14500];
                      id v112 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v320) = 32;
                      v317 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v113, (uint64_t)v105, v114, v115);
                  }
                  if (objc_msgSend_state(v105, v106, v107, v108, v109, v317, v320) == 3
                    && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_(self, v116, (uint64_t)v67, v328, (uint64_t)v63))
                  {
                    uint64_t v120 = CWFGetOSLog();
                    if (v120)
                    {
                      uint64_t v121 = CWFGetOSLog();
                    }
                    else
                    {
                      uint64_t v121 = MEMORY[0x1E4F14500];
                      id v122 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v321) = 32;
                      v318 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v123, (uint64_t)v105, v124, v125);
                  }
                  if (objc_msgSend_state(v105, v116, v117, v118, v119, v318, v321) == 2)
                  {
                    id v126 = CWFGetOSLog();
                    if (v126)
                    {
                      uint64_t v127 = CWFGetOSLog();
                    }
                    else
                    {
                      uint64_t v127 = MEMORY[0x1E4F14500];
                      id v128 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v319) = 32;
                      v316 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v129, (uint64_t)v105, v130, v131);
                  }
                }
                uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v341, (uint64_t)v363, 16);
              }
              while (v102);
            }

            long long v339 = 0u;
            long long v340 = 0u;
            long long v337 = 0u;
            long long v338 = 0u;
            objc_msgSend_denyListTriggers(v67, v132, v133, v134, v135);
            obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v136, (uint64_t)&v337, (uint64_t)v362, 16);
            if (v137)
            {
              uint64_t v142 = v137;
              uint64_t v143 = *(void *)v338;
              do
              {
                uint64_t v144 = 0;
                do
                {
                  if (*(void *)v338 != v143) {
                    objc_enumerationMutation(obj);
                  }
                  __int16 v145 = *(void **)(*((void *)&v337 + 1) + 8 * v144);
                  id v146 = objc_msgSend_reasonString(v145, v138, v139, v140, v141, v316, v319);
                  objc_msgSend_reasonTimestamp(v145, v147, v148, v149, v150);
                  double v152 = v151;
                  uint64_t v157 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v153, v154, v155, v156);
                  objc_msgSend_timeIntervalSince1970(v157, v158, v159, v160, v161);
                  double v163 = v162;

                  if (!objc_msgSend_reason(v145, v164, v165, v166, v167)
                    || objc_msgSend_reason(v145, v168, v169, v170, v171) == 1
                    || objc_msgSend_reason(v145, v172, v173, v174, v175) == 5
                    || objc_msgSend_reason(v145, v176, v177, v178, v179) == 7
                    || objc_msgSend_reason(v145, v180, v181, v182, v183) == 2
                    || objc_msgSend_reason(v145, v184, v185, v186, v187) == 3
                    || objc_msgSend_reason(v145, v188, v189, v190, v191) == 11
                    || objc_msgSend_reason(v145, v192, v193, v194, v195) == 12)
                  {
                    id v200 = CWFGetOSLog();
                    if (v200)
                    {
                      v201 = CWFGetOSLog();
                    }
                    else
                    {
                      v201 = MEMORY[0x1E4F14500];
                      id v202 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_79;
                    }
                    goto LABEL_81;
                  }
                  if (v328 == 1)
                  {
                    double v215 = v163 - v152;
                    if (objc_msgSend_reason(v145, v196, v197, v198, v199) == 4 && v152 != 0.0 && v215 > 300.0)
                    {
                      uint64_t v216 = CWFGetOSLog();
                      if (v216)
                      {
                        v201 = CWFGetOSLog();
                      }
                      else
                      {
                        v201 = MEMORY[0x1E4F14500];
                        id v231 = MEMORY[0x1E4F14500];
                      }

                      if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                      {
LABEL_79:
                        uint64_t v207 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v203, v204, v205, v206, v152);
                        int v350 = 136447234;
                        v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                        __int16 v352 = 2114;
                        v353 = v146;
                        __int16 v354 = 2114;
                        v355 = v207;
                        __int16 v356 = 2114;
                        v357 = v63;
                        __int16 v358 = 2114;
                        v359 = v331;
                        LODWORD(v319) = 52;
                        v316 = &v350;
                        goto LABEL_80;
                      }
LABEL_81:

                      objc_msgSend_addObject_(v330, v208, (uint64_t)v145, v209, v210);
                      goto LABEL_82;
                    }
                    if (objc_msgSend_reason(v145, v211, v212, v213, v214) == 8 && v152 != 0.0)
                    {
                      objc_msgSend_BSSDenyListExpiry(self, v196, v197, v198, v199);
                      if (v215 > v217)
                      {
                        uint64_t v218 = CWFGetOSLog();
                        if (v218)
                        {
                          v201 = CWFGetOSLog();
                        }
                        else
                        {
                          v201 = MEMORY[0x1E4F14500];
                          id v232 = MEMORY[0x1E4F14500];
                        }

                        if (!os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_81;
                        }
                        uint64_t v207 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v233, v234, v235, v236, v152);
                        objc_msgSend_reasonTimestamp(v145, v237, v238, v239, v240);
                        int v350 = 136447490;
                        v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                        __int16 v352 = 2114;
                        v353 = v146;
                        __int16 v354 = 2114;
                        v355 = v207;
                        __int16 v356 = 2114;
                        v357 = v63;
                        __int16 v358 = 2114;
                        v359 = v331;
                        __int16 v360 = 2048;
                        unint64_t v361 = (unint64_t)(v163 - v241);
                        LODWORD(v319) = 62;
                        v316 = &v350;
                        goto LABEL_80;
                      }
                    }
                  }
                  double v219 = dbl_1B5031890[objc_msgSend_reason(v145, v196, v197, v198, v199) == 2];
                  objc_msgSend_reasonTimestamp(v145, v220, v221, v222, v223);
                  if (v163 - v224 > v219)
                  {
                    long long v225 = CWFGetOSLog();
                    if (v225)
                    {
                      v201 = CWFGetOSLog();
                    }
                    else
                    {
                      v201 = MEMORY[0x1E4F14500];
                      id v226 = MEMORY[0x1E4F14500];
                    }

                    if (!os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_81;
                    }
                    uint64_t v207 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v227, v228, v229, v230, v163);
                    int v350 = 136446978;
                    v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                    __int16 v352 = 2114;
                    v353 = v146;
                    __int16 v354 = 2114;
                    v355 = v207;
                    __int16 v356 = 2114;
                    v357 = v63;
                    LODWORD(v319) = 42;
                    v316 = &v350;
LABEL_80:
                    _os_log_send_and_compose_impl();

                    goto LABEL_81;
                  }
LABEL_82:

                  ++v144;
                }
                while (v142 != v144);
                uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v138, (uint64_t)&v337, (uint64_t)v362, 16);
                uint64_t v142 = v242;
              }
              while (v242);
            }

            long long v335 = 0u;
            long long v336 = 0u;
            long long v333 = 0u;
            long long v334 = 0u;
            id v243 = v332;
            uint64_t v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(v243, v244, (uint64_t)&v333, (uint64_t)v349, 16);
            uint64_t v62 = v324;
            if (v245)
            {
              uint64_t v247 = v245;
              uint64_t v248 = *(void *)v334;
              do
              {
                for (uint64_t j = 0; j != v247; ++j)
                {
                  if (*(void *)v334 != v248) {
                    objc_enumerationMutation(v243);
                  }
                  objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(v67, v246, *(void *)(*((void *)&v333 + 1) + 8 * j), 1, 1, v316, v319);
                }
                uint64_t v247 = objc_msgSend_countByEnumeratingWithState_objects_count_(v243, v246, (uint64_t)&v333, (uint64_t)v349, 16);
              }
              while (v247);
            }

            long long v254 = objc_msgSend_statesCurrent(v67, v250, v251, v252, v253);
            objc_msgSend_removeObjectsInArray_(v254, v255, (uint64_t)v243, v256, v257);

            int v262 = objc_msgSend_denyListTriggers(v67, v258, v259, v260, v261);
            objc_msgSend_removeObjectsInArray_(v262, v263, (uint64_t)v330, v264, v265);

            uint64_t v59 = v323;
            if (objc_msgSend_count(v243, v266, v267, v268, v269))
            {
              v274 = objc_msgSend_denyListDidUpdateHandler(self, v270, v271, v272, v273);

              if (v274)
              {
                objc_msgSend_denyListDidUpdateHandler(self, v270, v271, v272, v273);
                v275 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                ((void (**)(void, void *))v275)[2](v275, &unk_1F0DA3170);
              }
            }
            v276 = objc_msgSend_statesCurrent(v67, v270, v271, v272, v273, v316, v319);
            unint64_t v64 = 0x1E4F29000;
            if (objc_msgSend_count(v276, v277, v278, v279, v280))
            {
            }
            else
            {
              v293 = objc_msgSend_denyListTriggers(v67, v281, v282, v283, v284);
              uint64_t v298 = objc_msgSend_count(v293, v294, v295, v296, v297);

              if (!v298) {
                objc_msgSend_removeObject_(self->_denyList, v285, (uint64_t)v67, v287, v288);
              }
            }
            objc_msgSend_removeAllObjects(v243, v285, v286, v287, v288);
            objc_msgSend_removeAllObjects(v330, v299, v300, v301, v302);
            uint64_t v304 = v326;
          }
          else
          {
            v291 = CWFGetOSLog();
            if (v291)
            {
              v292 = CWFGetOSLog();
            }
            else
            {
              v292 = MEMORY[0x1E4F14500];
              id v306 = MEMORY[0x1E4F14500];
            }
            uint64_t v304 = v326;

            if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
            {
              int v350 = 136446210;
              v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
              LODWORD(v319) = 12;
              v316 = &v350;
              _os_log_send_and_compose_impl();
            }

            v331 = 0;
          }
        }
        else
        {
          v289 = CWFGetOSLog();
          if (v289)
          {
            v290 = CWFGetOSLog();
          }
          else
          {
            v290 = MEMORY[0x1E4F14500];
            id v305 = MEMORY[0x1E4F14500];
          }
          uint64_t v304 = v326;

          if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
          {
            int v350 = 136446210;
            v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
            LODWORD(v319) = 12;
            v316 = &v350;
            _os_log_send_and_compose_impl();
          }
        }
        uint64_t v65 = v304 + 1;
      }
      while (v65 != v62);
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v303, (uint64_t)&v345, (uint64_t)v364, 16);
    }
    while (v62);
    v307 = v331;
  }
  else
  {
    v307 = 0;
    uint64_t v63 = 0;
  }
LABEL_139:

  objc_msgSend_removeAllObjects(v322, v308, v309, v310, v311);
}

- (BOOL)_evaluateTriggersForDenyListRemove:(id)a3 denyListRemoveReason:(unint64_t)a4 SSID:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v69 = a5;
  uint64_t v76 = 0;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v70 = v7;
  id v12 = objc_msgSend_statesHistory(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_count(v12, v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_isUserModeInteractiveHandler(self, v18, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_isUserModeInteractiveHandler(self, v23, v24, v25, v26);
    uint64_t v27 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = sub_1B4FDF9B4;
    v75[3] = &unk_1E60BCD10;
    v75[4] = &v76;
    ((void (**)(void, void *))v27)[2](v27, v75);

    uint64_t v28 = CWFGetOSLog();
    if (v28)
    {
      uint64_t v29 = CWFGetOSLog();
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      if (*((unsigned char *)v77 + 24)) {
        uint64_t v33 = "interactive";
      }
      else {
        uint64_t v33 = "non-interactive";
      }
      int v81 = 136446466;
      uint64_t v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      __int16 v83 = 2082;
      uint64_t v84 = v33;
      LODWORD(v67) = 22;
      uint64_t v66 = &v81;
      _os_log_send_and_compose_impl();
    }

    if (*((unsigned char *)v77 + 24))
    {
      LOBYTE(v38) = 1;
    }
    else
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v38 = objc_msgSend_statesHistory(v7, v34, v35, v36, v37);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v71, (uint64_t)v80, 16);
      if (v44)
      {
        uint64_t v45 = 0;
        char v46 = 0;
        uint64_t v47 = *(void *)v72;
        uint64_t v48 = v17 - 1;
        unint64_t v49 = 13;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v72 != v47) {
              objc_enumerationMutation(v38);
            }
            uint64_t v51 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (objc_msgSend_state(v51, v40, v41, v42, v43, v66, v67) != 1)
            {
              if (objc_msgSend_reason(v51, v40, v41, v42, v43) == 2)
              {
                uint64_t v52 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v40, v41, v42, v43);
                objc_msgSend_timeIntervalSince1970(v52, v53, v54, v55, v56);
                double v58 = v57;

                objc_msgSend_stateTimestamp(v51, v59, v60, v61, v62);
                v46 |= v58 - v63 < 21600.0;
              }
              if (v45 == v48) {
                unint64_t v49 = objc_msgSend_reason(v51, v40, v41, v42, v43);
              }
              ++v45;
            }
          }
          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v71, (uint64_t)v80, 16);
        }
        while (v44);
      }
      else
      {
        char v46 = 0;
        unint64_t v49 = 13;
      }

      LOBYTE(v38) = 0;
      if (!((a4 != 1) | v46 & 1) && v49 <= 7) {
        LODWORD(v38) = (0xB0u >> v49) & 1;
      }
    }
  }
  else
  {
    uint64_t v30 = CWFGetOSLog();
    if (v30)
    {
      uint64_t v31 = CWFGetOSLog();
    }
    else
    {
      uint64_t v31 = MEMORY[0x1E4F14500];
      id v64 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v81 = 136446210;
      uint64_t v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      _os_log_send_and_compose_impl();
    }

    LOBYTE(v38) = 1;
    *((unsigned char *)v77 + 24) = 1;
  }
  _Block_object_dispose(&v76, 8);

  return (char)v38;
}

- (void)processDenyListedBSSForMetrics:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = self->_denyList;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v64, (uint64_t)v74, 16);
    if (v6)
    {
      uint64_t v7 = v6;
      id v62 = v4;
      id v8 = 0;
      uint64_t v9 = *(void *)v65;
      do
      {
        uint64_t v10 = 0;
        uint64_t v11 = v8;
        do
        {
          if (*(void *)v65 != v9) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v64 + 1) + 8 * v10);

          id v12 = CWFGetOSLog();
          if (v12)
          {
            uint64_t v13 = CWFGetOSLog();
          }
          else
          {
            uint64_t v13 = MEMORY[0x1E4F14500];
            id v14 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v15, v16, v17, v18);
            uint64_t v24 = objc_msgSend_SSID(v19, v20, v21, v22, v23);
            uint64_t v29 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v25, v26, v27, v28);
            uint64_t v34 = objc_msgSend_BSSID(v29, v30, v31, v32, v33);
            int v68 = 136446722;
            id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
            __int16 v70 = 2114;
            long long v71 = v24;
            __int16 v72 = 2114;
            long long v73 = v34;
            _os_log_send_and_compose_impl();
          }
          ++v10;
          uint64_t v11 = v8;
        }
        while (v7 != v10);
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v64, (uint64_t)v74, 16);
      }
      while (v7);

      id v4 = v62;
    }

    uint64_t v36 = CWFGetOSLog();
    if (v36)
    {
      uint64_t v37 = CWFGetOSLog();
    }
    else
    {
      uint64_t v37 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend_SSID(v4, v39, v40, v41, v42);
      uint64_t v48 = objc_msgSend_BSSID(v4, v44, v45, v46, v47);
      int v68 = 136446722;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      __int16 v70 = 2114;
      long long v71 = v43;
      __int16 v72 = 2114;
      long long v73 = v48;
      _os_log_send_and_compose_impl();
    }
    uint64_t v52 = objc_msgSend__findNetworkDenyListItem_(self, v49, (uint64_t)v4, v50, v51);
    if (v52)
    {
      double v57 = v52;
      objc_msgSend_processDenyListedBSSForMetrics(v52, v53, v54, v55, v56);
      goto LABEL_22;
    }
    uint64_t v59 = CWFGetOSLog();
    if (v59)
    {
      double v57 = CWFGetOSLog();
    }
    else
    {
      double v57 = MEMORY[0x1E4F14500];
      id v61 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      int v68 = 136446210;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      goto LABEL_33;
    }
  }
  else
  {
    double v58 = CWFGetOSLog();
    if (v58)
    {
      double v57 = CWFGetOSLog();
    }
    else
    {
      double v57 = MEMORY[0x1E4F14500];
      id v60 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      int v68 = 136446210;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
LABEL_33:
      _os_log_send_and_compose_impl();
    }
  }
LABEL_22:
}

- (void)removeAllDenyListEntriesWithNetworkName:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v114, (uint64_t)v124, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v109 = self;
    uint64_t v110 = v5;
    char v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v115;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v115 != v11) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v114 + 1) + 8 * v12);

        id v14 = [NSString alloc];
        uint64_t v19 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v15, v16, v17, v18);
        uint64_t v24 = objc_msgSend_SSID(v19, v20, v21, v22, v23);
        uint64_t v27 = objc_msgSend_initWithData_encoding_(v14, v25, (uint64_t)v24, 4, v26);
        int isEqualToString = objc_msgSend_isEqualToString_(v4, v28, (uint64_t)v27, v29, v30);

        if (isEqualToString)
        {
          uint64_t v33 = CWFGetOSLog();
          if (v33)
          {
            uint64_t v34 = CWFGetOSLog();
          }
          else
          {
            uint64_t v34 = MEMORY[0x1E4F14500];
            id v35 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v36, v37, v38, v39);
            uint64_t v45 = objc_msgSend_SSID(v40, v41, v42, v43, v44);
            uint64_t v50 = objc_msgSend_scanResultForNetworkDenyListItem(v10, v46, v47, v48, v49);
            uint64_t v55 = objc_msgSend_SSID(v50, v51, v52, v53, v54);
            int v118 = 136446722;
            uint64_t v119 = "-[CWFNetworkDenyList removeAllDenyListEntriesWithNetworkName:]";
            __int16 v120 = 2114;
            uint64_t v121 = v45;
            __int16 v122 = 2114;
            double v123 = v55;
            _os_log_send_and_compose_impl();
          }
          id v60 = objc_msgSend_denyListTriggers(v10, v56, v57, v58, v59);
          objc_msgSend_removeAllObjects(v60, v61, v62, v63, v64);

          id v69 = objc_msgSend_statesCurrent(v10, v65, v66, v67, v68);
          v112[0] = MEMORY[0x1E4F143A8];
          v112[1] = 3221225472;
          v112[2] = sub_1B4FE01FC;
          v112[3] = &unk_1E60BCCC0;
          id v70 = v10;
          id v113 = v70;
          objc_msgSend_enumerateObjectsUsingBlock_(v69, v71, (uint64_t)v112, v72, v73);

          uint64_t v78 = objc_msgSend_statesCurrent(v70, v74, v75, v76, v77);
          objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

          uint64_t v87 = objc_msgSend_statesHistory(v70, v83, v84, v85, v86);
          objc_msgSend_removeAllObjects(v87, v88, v89, v90, v91);

          objc_msgSend_addObject_(v110, v92, (uint64_t)v70, v93, v94);
          char v9 = 1;
        }
        ++v12;
        uint64_t v13 = v10;
      }
      while (v8 != v12);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v114, (uint64_t)v124, 16);
    }
    while (v8);

    id v5 = v110;
    self = v109;
  }
  else
  {
    char v9 = 0;
  }

  if (objc_msgSend_count(v5, v95, v96, v97, v98)) {
    objc_msgSend_removeObjectsInArray_(self->_denyList, v99, (uint64_t)v5, v101, v102);
  }
  if (v9)
  {
    uint64_t v103 = objc_msgSend_denyListDidUpdateHandler(self, v99, v100, v101, v102);

    if (v103)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v104, v105, v106, v107);
      uint64_t v108 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v108)[2](v108, &unk_1F0DA2790);
    }
  }
}

- (void)removeNetworkDenyListInfoForTrigger:(unint64_t)a3 forNetwork:(id)a4
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v123 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [NSString alloc];
  uint64_t v13 = objc_msgSend_SSID(v6, v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_initWithData_encoding_(v8, v14, (uint64_t)v13, 4, v15);

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  uint64_t v130 = self;
  obuint64_t j = self->_denyList;
  uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v143, (uint64_t)v154, 16);
  if (v128)
  {
    uint64_t v22 = *(void *)v144;
    uint64_t v124 = *(void *)v144;
    id v125 = v6;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v144 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v129 = v23;
        uint64_t v24 = *(void **)(*((void *)&v143 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend_scanResultForNetworkDenyListItem(v24, v18, v19, v20, v21, v121, v122);
        uint64_t v30 = objc_msgSend_SSID(v25, v26, v27, v28, v29);
        id v35 = objc_msgSend_SSID(v6, v31, v32, v33, v34);
        int isEqual = objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38);

        if (isEqual)
        {
          long long v141 = 0u;
          long long v142 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          uint64_t v40 = objc_msgSend_denyListTriggers(v24, v18, v19, v20, v21);
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v139, (uint64_t)v153, 16);
          if (v42)
          {
            uint64_t v47 = v42;
            uint64_t v48 = *(void *)v140;
            do
            {
              for (uint64_t i = 0; i != v47; ++i)
              {
                if (*(void *)v140 != v48) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v50 = *(void **)(*((void *)&v139 + 1) + 8 * i);
                if (objc_msgSend_reason(v50, v43, v44, v45, v46) == a3) {
                  objc_msgSend_addObject_(v7, v43, (uint64_t)v50, v45, v46);
                }
              }
              uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v139, (uint64_t)v153, 16);
            }
            while (v47);
          }

          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          uint64_t v55 = objc_msgSend_statesCurrent(v24, v51, v52, v53, v54);
          uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v135, (uint64_t)v152, 16);
          if (v57)
          {
            uint64_t v62 = v57;
            uint64_t v63 = *(void *)v136;
            do
            {
              for (uint64_t j = 0; j != v62; ++j)
              {
                if (*(void *)v136 != v63) {
                  objc_enumerationMutation(v55);
                }
                long long v65 = *(void **)(*((void *)&v135 + 1) + 8 * j);
                if (objc_msgSend_reason(v65, v58, v59, v60, v61, v121, v122) == a3)
                {
                  if (objc_msgSend_state(v65, v58, v59, v60, v61) == 3
                    && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_(v130, v66, (uint64_t)v24, 1, (uint64_t)v16))
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                    id v69 = CWFGetOSLog();
                    if (v69)
                    {
                      id v70 = CWFGetOSLog();
                    }
                    else
                    {
                      id v70 = MEMORY[0x1E4F14500];
                      id v71 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    {
                      int v148 = 136446466;
                      uint64_t v149 = "-[CWFNetworkDenyList removeNetworkDenyListInfoForTrigger:forNetwork:]";
                      __int16 v150 = 2114;
                      double v151 = v16;
                      LODWORD(v122) = 22;
                      uint64_t v121 = &v148;
                      _os_log_send_and_compose_impl();
                    }
                  }
                  else
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                  }
                }
              }
              uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v135, (uint64_t)v152, 16);
            }
            while (v62);
          }

          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          id v72 = v126;
          uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v131, (uint64_t)v147, 16);
          if (v74)
          {
            uint64_t v76 = v74;
            uint64_t v77 = *(void *)v132;
            do
            {
              for (uint64_t k = 0; k != v76; ++k)
              {
                if (*(void *)v132 != v77) {
                  objc_enumerationMutation(v72);
                }
                objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(v24, v75, *(void *)(*((void *)&v131 + 1) + 8 * k), 1, 1, v121, v122);
              }
              uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v131, (uint64_t)v147, 16);
            }
            while (v76);
          }

          __int16 v83 = objc_msgSend_statesCurrent(v24, v79, v80, v81, v82);
          objc_msgSend_removeObjectsInArray_(v83, v84, (uint64_t)v72, v85, v86);

          uint64_t v91 = objc_msgSend_denyListTriggers(v24, v87, v88, v89, v90);
          objc_msgSend_removeObjectsInArray_(v91, v92, (uint64_t)v7, v93, v94);

          uint64_t v99 = objc_msgSend_denyListTriggers(v24, v95, v96, v97, v98);
          if (objc_msgSend_count(v99, v100, v101, v102, v103))
          {

            uint64_t v22 = v124;
            id v6 = v125;
          }
          else
          {
            uint64_t v108 = objc_msgSend_statesCurrent(v24, v104, v105, v106, v107);
            uint64_t v113 = objc_msgSend_count(v108, v109, v110, v111, v112);

            uint64_t v22 = v124;
            id v6 = v125;
            if (!v113) {
              objc_msgSend_addObject_(v123, v18, (uint64_t)v24, v20, v21);
            }
          }
        }
        uint64_t v23 = v129 + 1;
      }
      while (v129 + 1 != v128);
      uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v143, (uint64_t)v154, 16);
    }
    while (v128);
  }

  objc_msgSend_removeObjectsInArray_(v130->_denyList, v114, (uint64_t)v123, v115, v116);
  objc_msgSend_removeAllObjects(v123, v117, v118, v119, v120);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_enabled = 1;
  }
  else
  {
    self->_enabled = 0;
    objc_msgSend_removeAllDenyListedItems(self, a2, a3, v3, v4);
  }
}

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 forSSIDThresholds:(BOOL)a5 BSSID:(id)a6 SSID:(id)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v17 = a7;
  if (v8)
  {
    uint64_t v18 = objc_msgSend_SSIDThresholds(self, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3, v20, v21);
    LOBYTE(v27) = objc_msgSend_unsignedIntValue(v22, v23, v24, v25, v26) <= a4;

    uint64_t v28 = CWFGetOSLog();
    if (v28)
    {
      uint64_t v29 = CWFGetOSLog();
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = objc_msgSend_SSIDThresholds(self, v41, v42, v43, v44);
      uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v45, v46, a3, v47, v48);
      objc_msgSend_unsignedIntValue(v49, v50, v51, v52, v53);
LABEL_12:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    uint64_t v30 = objc_msgSend_BSSIDThresholds(self, v13, v14, v15, v16);
    uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, a3, v32, v33);
    BOOL v27 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38) <= a4;

    uint64_t v39 = CWFGetOSLog();
    if (v39)
    {
      uint64_t v29 = CWFGetOSLog();
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F14500];
      id v54 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = objc_msgSend_BSSIDThresholds(self, v55, v56, v57, v58);
      uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v45, v59, a3, v60, v61);
      objc_msgSend_unsignedIntValue(v49, v62, v63, v64, v65);
      goto LABEL_12;
    }
  }

  return v27;
}

- (id)_findNetworkDenyListItemsForSSID:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_denyList;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v11 = v8;
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v43 + 1) + 8 * i);

        uint64_t v16 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v12, v13, v14, v15);
        uint64_t v21 = objc_msgSend_SSID(v16, v17, v18, v19, v20);
        uint64_t v26 = v21;
        if (v4 && v21)
        {
          BOOL v27 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v22, v23, v24, v25);
          uint64_t v32 = objc_msgSend_SSID(v27, v28, v29, v30, v31);
          int isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35);

          if (isEqual) {
            objc_msgSend_addObject_(v41, v37, (uint64_t)v8, v38, v39);
          }
        }
        else
        {
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v7);
  }
  return v41;
}

- (id)_findNetworkDenyListItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    id v12 = v9;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(id *)(*((void *)&v18 + 1) + 8 * v11);

      if (objc_msgSend_containsNetwork_(v9, v13, (uint64_t)v4, v14, v15, (void)v18)) {
        break;
      }
      ++v11;
      id v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v18, (uint64_t)v22, 16);
        if (v8) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v9 = 0;
  }

  return v9;
}

- (id)networksInDenyListedState:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v6 = self->_denyList;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v45, (uint64_t)v50, 16);
    if (v40)
    {
      id v8 = 0;
      obuint64_t j = v6;
      uint64_t v39 = *(void *)v46;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v8;
        do
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v45 + 1) + 8 * v9);

          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v15 = objc_msgSend_statesCurrent(v8, v11, v12, v13, v14);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v41, (uint64_t)v49, 16);
          if (v17)
          {
            uint64_t v22 = v17;
            uint64_t v23 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v42 != v23) {
                  objc_enumerationMutation(v15);
                }
                if (objc_msgSend_state(*(void **)(*((void *)&v41 + 1) + 8 * i), v18, v19, v20, v21) == a3)
                {
                  uint64_t v25 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);

                  if (v25)
                  {
                    uint64_t v26 = objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);
                    uint64_t v30 = objc_msgSend_copyWithZone_(v26, v27, 0, v28, v29);

                    if (v30) {
                      objc_msgSend_addObject_(v5, v31, (uint64_t)v30, v32, v33);
                    }
                  }
                }
              }
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v41, (uint64_t)v49, 16);
            }
            while (v22);
          }

          ++v9;
          uint64_t v10 = v8;
        }
        while (v9 != v40);
        uint64_t v6 = obj;
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v45, (uint64_t)v50, 16);
      }
      while (v40);
    }
  }
  else
  {
    uint64_t v36 = CWFGetOSLog();
    if (v36)
    {
      CWFGetOSLog();
      uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = (NSMutableArray *)MEMORY[0x1E4F14500];
      id v37 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
    {
      int v51 = 136446210;
      uint64_t v52 = "-[CWFNetworkDenyList networksInDenyListedState:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)networksInDenyListedStateHistory:(unint64_t)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v41)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v5 = self->_denyList;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v48;
      obuint64_t j = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v12 = v9;
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(id *)(*((void *)&v47 + 1) + 8 * i);

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v17 = objc_msgSend_statesHistory(v9, v13, v14, v15, v16);
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v19)
          {
            uint64_t v24 = v19;
            uint64_t v25 = *(void *)v44;
            while (2)
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v44 != v25) {
                  objc_enumerationMutation(v17);
                }
                BOOL v27 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                if (objc_msgSend_state(v27, v20, v21, v22, v23) == a3
                  || objc_msgSend_state(v27, v20, v21, v22, v23) == 5)
                {
                  uint64_t v28 = objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);

                  if (v28)
                  {
                    uint64_t v29 = objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);
                    uint64_t v33 = objc_msgSend_copyWithZone_(v29, v30, 0, v31, v32);

                    if (v33) {
                      objc_msgSend_addObject_(v41, v34, (uint64_t)v33, v35, v36);
                    }

                    goto LABEL_21;
                  }
                }
              }
              uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v24) {
                continue;
              }
              break;
            }
          }
LABEL_21:
        }
        id v5 = obj;
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v47, (uint64_t)v52, 16);
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v39 = CWFGetOSLog();
    if (v39)
    {
      CWFGetOSLog();
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = (NSMutableArray *)MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_ERROR))
    {
      int v53 = 136446210;
      id v54 = "-[CWFNetworkDenyList networksInDenyListedStateHistory:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v41;
}

- (id)denyListedReasonHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v13, a4, (uint64_t)v10, v14))
  {
    id v88 = 0;
    goto LABEL_41;
  }
  long long v18 = objc_msgSend__findNetworkDenyListItem_(self, v15, (uint64_t)v10, v16, v17);
  if (v18)
  {
    id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v88)
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      uint64_t v23 = objc_msgSend_statesHistory(v18, v19, v20, v21, v22);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v89, (uint64_t)v93, 16);
      if (!v25) {
        goto LABEL_39;
      }
      uint64_t v30 = v25;
      uint64_t v85 = v18;
      id v86 = v10;
      uint64_t v31 = *(void *)v90;
      obuint64_t j = v23;
      while (1)
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v90 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v89 + 1) + 8 * v32);
          uint64_t v34 = objc_msgSend_reason(v33, v26, v27, v28, v29, v83, v84);
          objc_msgSend_stateTimestamp(v33, v35, v36, v37, v38);
          double v40 = v39;
          uint64_t v45 = objc_msgSend_reasonData(v33, v41, v42, v43, v44);
          int v53 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v46, v34, v47, v48);
          if (!v53)
          {
            uint64_t v67 = CWFGetOSLog();
            if (v67)
            {
              uint64_t v68 = CWFGetOSLog();
            }
            else
            {
              uint64_t v68 = MEMORY[0x1E4F14500];
              id v72 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              int v94 = 136446210;
              uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              __int16 v83 = &v94;
              goto LABEL_30;
            }
LABEL_31:

            uint64_t v58 = 0;
LABEL_36:
            uint64_t v63 = 0;
            goto LABEL_16;
          }
          uint64_t v54 = objc_msgSend_numberWithDouble_(NSNumber, v49, v50, v51, v52, v40);
          if (!v54)
          {
            id v69 = CWFGetOSLog();
            if (v69)
            {
              uint64_t v68 = CWFGetOSLog();
            }
            else
            {
              uint64_t v68 = MEMORY[0x1E4F14500];
              id v73 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              int v94 = 136446210;
              uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              __int16 v83 = &v94;
LABEL_30:
              _os_log_send_and_compose_impl();
            }
            goto LABEL_31;
          }
          uint64_t v58 = (void *)v54;
          uint64_t v59 = objc_msgSend_numberWithInteger_(NSNumber, v55, v45, v56, v57);
          if (!v59)
          {
            id v70 = CWFGetOSLog();
            if (v70)
            {
              id v71 = CWFGetOSLog();
            }
            else
            {
              id v71 = MEMORY[0x1E4F14500];
              id v74 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              int v94 = 136446210;
              uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              __int16 v83 = &v94;
              _os_log_send_and_compose_impl();
            }

            goto LABEL_36;
          }
          uint64_t v63 = (void *)v59;
          objc_msgSend_addObject_(v88, v60, (uint64_t)v53, v61, v62);
          if (v11) {
            objc_msgSend_addObject_(v11, v64, (uint64_t)v58, v65, v66);
          }
          if (v12) {
            objc_msgSend_addObject_(v12, v64, (uint64_t)v63, v65, v66);
          }
LABEL_16:

          ++v32;
        }
        while (v30 != v32);
        uint64_t v23 = obj;
        uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v89, (uint64_t)v93, 16);
        uint64_t v30 = v75;
        if (!v75)
        {
          long long v18 = v85;
          id v10 = v86;
          goto LABEL_39;
        }
      }
    }
    char v79 = CWFGetOSLog();
    if (v79)
    {
      uint64_t v80 = CWFGetOSLog();
    }
    else
    {
      uint64_t v80 = MEMORY[0x1E4F14500];
      id v82 = MEMORY[0x1E4F14500];
    }

    uint64_t v23 = v80;
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    int v94 = 136446210;
    uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
    goto LABEL_54;
  }
  uint64_t v77 = CWFGetOSLog();
  if (v77)
  {
    uint64_t v78 = CWFGetOSLog();
  }
  else
  {
    uint64_t v78 = MEMORY[0x1E4F14500];
    id v81 = MEMORY[0x1E4F14500];
  }

  uint64_t v23 = v78;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
  {
    int v94 = 136446210;
    uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
LABEL_54:
    _os_log_send_and_compose_impl();
  }
LABEL_55:
  id v88 = 0;
LABEL_39:

LABEL_41:
  return v88;
}

- (id)reasonsForNetworkInDenyListedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v89 = a5;
  id v11 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v12, a4, (uint64_t)v10, v13))
  {
    uint64_t v23 = 0;
    goto LABEL_36;
  }
  uint64_t v17 = objc_msgSend__findNetworkDenyListItem_(self, v14, (uint64_t)v10, v15, v16);
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v18)
    {
      uint64_t v23 = v18;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      uint64_t v24 = objc_msgSend_denyListTriggers(v17, v19, v20, v21, v22);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v90, (uint64_t)v94, 16);
      if (!v26) {
        goto LABEL_34;
      }
      uint64_t v31 = v26;
      id v87 = v10;
      obuint64_t j = v24;
      id v86 = v17;
      uint64_t v32 = *(void *)v91;
      while (1)
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v91 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void **)(*((void *)&v90 + 1) + 8 * v33);
          uint64_t v35 = objc_msgSend_reason(v34, v27, v28, v29, v30, v84, v85);
          objc_msgSend_reasonTimestamp(v34, v36, v37, v38, v39);
          double v41 = v40;
          uint64_t v46 = objc_msgSend_reasonData(v34, v42, v43, v44, v45);
          uint64_t v54 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v47, v35, v48, v49);
          if (v54)
          {
            uint64_t v55 = objc_msgSend_numberWithDouble_(NSNumber, v50, v51, v52, v53, v41);
            if (v55)
            {
              uint64_t v59 = v55;
              uint64_t v60 = objc_msgSend_numberWithInteger_(NSNumber, v56, v46, v57, v58);
              if (v60)
              {
                uint64_t v64 = (void *)v60;
                objc_msgSend_addObject_(v23, v61, (uint64_t)v54, v62, v63);
                objc_msgSend_addObject_(v89, v65, (uint64_t)v59, v66, v67);
                objc_msgSend_addObject_(v11, v68, (uint64_t)v64, v69, v70);
              }
              else
              {
                id v73 = CWFGetOSLog();
                if (v73)
                {
                  id v74 = CWFGetOSLog();
                }
                else
                {
                  id v74 = MEMORY[0x1E4F14500];
                  id v77 = MEMORY[0x1E4F14500];
                }

                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  int v95 = 136446210;
                  uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                  LODWORD(v85) = 12;
                  uint64_t v84 = &v95;
                  _os_log_send_and_compose_impl();
                }
              }
            }
            else
            {
              id v72 = CWFGetOSLog();
              if (v72)
              {
                uint64_t v59 = CWFGetOSLog();
              }
              else
              {
                uint64_t v59 = MEMORY[0x1E4F14500];
                id v76 = MEMORY[0x1E4F14500];
              }

              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                int v95 = 136446210;
                uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                LODWORD(v85) = 12;
                uint64_t v84 = &v95;
                goto LABEL_27;
              }
            }
          }
          else
          {
            id v71 = CWFGetOSLog();
            if (v71)
            {
              uint64_t v59 = CWFGetOSLog();
            }
            else
            {
              uint64_t v59 = MEMORY[0x1E4F14500];
              id v75 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              int v95 = 136446210;
              uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
              LODWORD(v85) = 12;
              uint64_t v84 = &v95;
LABEL_27:
              _os_log_send_and_compose_impl();
            }
          }

          ++v33;
        }
        while (v31 != v33);
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v90, (uint64_t)v94, 16);
        uint64_t v31 = v78;
        if (!v78)
        {
          uint64_t v17 = v86;
          id v10 = v87;
          uint64_t v24 = obj;
          goto LABEL_34;
        }
      }
    }
    id v81 = CWFGetOSLog();
    if (v81)
    {
      uint64_t v24 = CWFGetOSLog();
    }
    else
    {
      uint64_t v24 = MEMORY[0x1E4F14500];
      id v83 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    int v95 = 136446210;
    uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
    goto LABEL_49;
  }
  uint64_t v80 = CWFGetOSLog();
  if (v80)
  {
    uint64_t v24 = CWFGetOSLog();
  }
  else
  {
    uint64_t v24 = MEMORY[0x1E4F14500];
    id v82 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v95 = 136446210;
    uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
LABEL_49:
    _os_log_send_and_compose_impl();
  }
LABEL_50:
  uint64_t v23 = 0;
LABEL_34:

LABEL_36:
  return v23;
}

- (BOOL)isNetworkInDenyListedState:(unint64_t)a3 scanResult:(id)a4
{
  uint64_t v6 = objc_msgSend__findNetworkDenyListItem_(self, a2, (uint64_t)a4, (uint64_t)a4, v4);
  id v10 = v6;
  if (v6) {
    char hasDenyListState = objc_msgSend_hasDenyListState_(v6, v7, a3, v8, v9);
  }
  else {
    char hasDenyListState = 0;
  }

  return hasDenyListState;
}

- (BOOL)isNetworkTemporarilyDenyListedForAutoJoin:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_scanResultForNetworkDenyListItem(v15, v8, v9, v10, v11);
        uint64_t v21 = objc_msgSend_SSID(v16, v17, v18, v19, v20);
        uint64_t v26 = objc_msgSend_SSID(v4, v22, v23, v24, v25);
        int isEqual = objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29);

        if (isEqual && objc_msgSend_hasDenyListState_(v15, v8, 1, v10, v11))
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v31 = objc_msgSend_statesCurrent(v15, v8, v9, v10, v11, 0);
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v33)
          {
            uint64_t v38 = v33;
            uint64_t v39 = *(void *)v44;
            while (2)
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v44 != v39) {
                  objc_enumerationMutation(v31);
                }
                if (!objc_msgSend_reason(*(void **)(*((void *)&v43 + 1) + 8 * j), v34, v35, v36, v37))
                {

                  BOOL v41 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v38) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v47, (uint64_t)v52, 16);
      BOOL v41 = 0;
    }
    while (v12);
  }
  else
  {
    BOOL v41 = 0;
  }
LABEL_22:

  return v41;
}

- (int64_t)RSSIWhenNetworkWasDenyListed:(id)a3
{
  id v5 = objc_msgSend__findNetworkDenyListItem_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = v5;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_scanResultForNetworkDenyListItem(v5, v6, v7, v8, v9);
    int64_t v16 = objc_msgSend_RSSI(v11, v12, v13, v14, v15);
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (BOOL)isNetworkDenyListedForAutoJoinDueToTrigDisc:(id)a3 RSSI:(int64_t *)a4 timestamp:(double *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v8 = self->_denyList;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v62, (uint64_t)v67, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v55 = a4;
    uint64_t v56 = a5;
    id v12 = 0;
    uint64_t v13 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v15 = v12;
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v62 + 1) + 8 * i);

        if (objc_msgSend_hasDenyListState_(v12, v16, 1, v17, v18))
        {
          uint64_t v23 = objc_msgSend_scanResultForNetworkDenyListItem(v12, v19, v20, v21, v22);
          uint64_t v28 = objc_msgSend_SSID(v23, v24, v25, v26, v27);
          uint64_t v33 = objc_msgSend_SSID(v57, v29, v30, v31, v32);
          int isEqual = objc_msgSend_isEqual_(v28, v34, (uint64_t)v33, v35, v36);

          if (isEqual)
          {
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            BOOL v41 = objc_msgSend_statesCurrent(v12, v19, v38, v39, v40);
            uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v58, (uint64_t)v66, 16);
            if (v43)
            {
              uint64_t v48 = v43;
              uint64_t v49 = *(void *)v59;
              while (2)
              {
                for (uint64_t j = 0; j != v48; ++j)
                {
                  if (*(void *)v59 != v49) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v51 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                  if (objc_msgSend_reason(v51, v44, v45, v46, v47) == 6)
                  {
                    if (v55) {
                      *uint64_t v55 = (int)objc_msgSend_reasonData(v51, v44, v45, v46, v47);
                    }
                    if (v56)
                    {
                      objc_msgSend_stateTimestamp(v51, v44, v45, v46, v47);
                      *(void *)uint64_t v56 = v53;
                    }
                    BOOL v52 = 1;
                    goto LABEL_25;
                  }
                }
                uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v58, (uint64_t)v66, 16);
                if (v48) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v62, (uint64_t)v67, 16);
    }
    while (v11);
    BOOL v52 = 0;
    BOOL v41 = v12;
    id v12 = 0;
LABEL_25:
  }
  else
  {
    id v12 = 0;
    BOOL v52 = 0;
  }

  return v52;
}

- (id)denyListedNetworkSSIDs:(unint64_t)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (!v5)
  {
    uint64_t v42 = CWFGetOSLog();
    if (v42)
    {
      uint64_t v39 = CWFGetOSLog();
    }
    else
    {
      uint64_t v39 = MEMORY[0x1E4F14500];
      id v43 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    int v56 = 136446210;
    id v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
    goto LABEL_24;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = self->_denyList;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v52, (uint64_t)v61, 16);
  if (v46)
  {
    id v7 = 0;
    uint64_t v45 = *(void *)v53;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v8;
        id v7 = *(id *)(*((void *)&v52 + 1) + 8 * v8);

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v14 = objc_msgSend_statesCurrent(v7, v10, v11, v12, v13);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v48, (uint64_t)v60, 16);
        if (v16)
        {
          uint64_t v21 = v16;
          uint64_t v22 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v49 != v22) {
                objc_enumerationMutation(v14);
              }
              if (objc_msgSend_state(*(void **)(*((void *)&v48 + 1) + 8 * i), v17, v18, v19, v20) == a3)
              {
                uint64_t v24 = objc_msgSend_scanResultForNetworkDenyListItem(v7, v17, v18, v19, v20);
                uint64_t v29 = objc_msgSend_SSID(v24, v25, v26, v27, v28);

                id v30 = [NSString alloc];
                uint64_t v33 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v29, 4, v32);
                objc_msgSend_appendFormat_(v5, v34, @"%@ ", v35, v36, v33);
              }
            }
            uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v48, (uint64_t)v60, 16);
          }
          while (v21);
        }

        uint64_t v8 = v47 + 1;
        uint64_t v9 = v7;
      }
      while (v47 + 1 != v46);
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v52, (uint64_t)v61, 16);
    }
    while (v46);
  }
  uint64_t v38 = CWFGetOSLog();
  if (v38)
  {
    uint64_t v39 = CWFGetOSLog();
  }
  else
  {
    uint64_t v39 = MEMORY[0x1E4F14500];
    id v40 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    int v56 = 136446466;
    id v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
    __int16 v58 = 2114;
    id v59 = v5;
LABEL_24:
    _os_log_send_and_compose_impl();
  }
LABEL_25:

  return v5;
}

- (id)denyList
{
  return self->_denyList;
}

- (id)batteryInfoHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryInfoHandler:(id)a3
{
}

- (id)isUserModeInteractiveHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setIsUserModeInteractiveHandler:(id)a3
{
}

- (id)denyListDidUpdateHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDenyListDidUpdateHandler:(id)a3
{
}

- (NSArray)SSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSSIDThresholds:(id)a3
{
}

- (NSArray)BSSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBSSIDThresholds:(id)a3
{
}

- (double)wowDenyListExpiry
{
  return self->_wowDenyListExpiry;
}

- (void)setWowDenyListExpiry:(double)a3
{
  self->_wowDenyListExpiry = a3;
}

- (double)networkDenyListExpiry
{
  return self->_networkDenyListExpiry;
}

- (void)setNetworkDenyListExpiry:(double)a3
{
  self->_networkDenyListExpiry = a3;
}

- (double)BSSDenyListExpiry
{
  return self->_BSSDenyListExpiry;
}

- (void)setBSSDenyListExpiry:(double)a3
{
  self->_BSSDenyListExpiry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSSIDThresholds, 0);
  objc_storeStrong((id *)&self->_SSIDThresholds, 0);
  objc_storeStrong(&self->_denyListDidUpdateHandler, 0);
  objc_storeStrong(&self->_isUserModeInteractiveHandler, 0);
  objc_storeStrong(&self->_batteryInfoHandler, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
}

@end