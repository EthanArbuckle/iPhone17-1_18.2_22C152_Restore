@interface CKDZoneGatekeeperImplementation
- (BOOL)hasStatusToReport;
- (CKDZoneGatekeeperImplementation)init;
- (NSMutableArray)waiterWrappers;
- (NSMutableDictionary)zoneIDsToGateHolders;
- (id)CKStatusReportArray;
- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 completionHandler:(id)a5;
- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4;
- (void)setWaiterWrappers:(id)a3;
- (void)setZoneIDsToGateHolders:(id)a3;
@end

@implementation CKDZoneGatekeeperImplementation

- (CKDZoneGatekeeperImplementation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDZoneGatekeeperImplementation;
  v2 = [(CKDZoneGatekeeperImplementation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    zoneIDsToGateHolders = v2->_zoneIDsToGateHolders;
    v2->_zoneIDsToGateHolders = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    waiterWrappers = v2->_waiterWrappers;
    v2->_waiterWrappers = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 completionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v51 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = (id *)MEMORY[0x1E4F1A500];
  v12 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v64 = v9;
    __int16 v65 = 2112;
    uint64_t v66 = (uint64_t)v8;
    _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Registering zone gate locks for IDs %@ waiter %@", buf, 0x16u);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v13 = v9;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v58, v69, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v59 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v21 = objc_msgSend_zoneIDsToGateHolders(v10, v15, v16, v51);
        v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v20);

        if (v23)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v38 = *v11;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v48 = objc_msgSend_zoneIDsToGateHolders(v10, v39, v40);
            v50 = objc_msgSend_objectForKeyedSubscript_(v48, v49, v20);
            *(_DWORD *)buf = 138412802;
            id v64 = v8;
            __int16 v65 = 2112;
            uint64_t v66 = v20;
            __int16 v67 = 2112;
            v68 = v50;
            _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Can't immediately grant gate to %@ because zone %@ held by %@", buf, 0x20u);
          }
          v41 = [CKWaiterWrapper alloc];
          os_activity_t v42 = _os_activity_create(&dword_1C4CFF000, "CKDZoneGatekeeper", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
          v37 = objc_msgSend_initWithWaiter_zoneIDs_waitCompletedHandler_activity_(v41, v43, (uint64_t)v8, v13, v51, v42);

          v46 = objc_msgSend_waiterWrappers(v10, v44, v45);
          objc_msgSend_addObject_(v46, v47, (uint64_t)v37);

          goto LABEL_26;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v58, v69, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v24 = v13;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v54, v62, 16);
  if (v28)
  {
    uint64_t v29 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v55 != v29) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v54 + 1) + 8 * j);
        v32 = objc_msgSend_zoneIDsToGateHolders(v10, v26, v27, v51);
        objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v8, v31);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v54, v62, 16);
    }
    while (v28);
  }

  objc_msgSend_qualityOfService(v8, v34, v35);
  v36 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D92BB4;
  block[3] = &unk_1E64F0A80;
  id v53 = v51;
  dispatch_async(v36, block);

  v37 = v53;
LABEL_26:

  objc_sync_exit(v10);
}

- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  v132 = objc_opt_new();
  v133 = objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)MEMORY[0x1E4F1A550];
  BOOL v139 = v4;
  if (v4)
  {
    id v8 = [CKDDeferredRelinquishPlaceholder alloc];
    v135 = objc_msgSend_initWithExistingWaiter_(v8, v9, (uint64_t)v141);
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v10 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v174 = v141;
      _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Deferring relinquish of zone gate locks for waiter %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v130 = objc_msgSend_ckShortDescription(v141, v14, v15);
      *(_DWORD *)buf = 138412290;
      id v174 = v130;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Relinquishing zone gate locks for waiter %@", buf, 0xCu);
    }
    v135 = 0;
  }
  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  uint64_t v16 = objc_msgSend_zoneIDsToGateHolders(v6, v11, v12);
  v19 = objc_msgSend_allKeys(v16, v17, v18);
  v22 = objc_msgSend_copy(v19, v20, v21);

  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v166, v181, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v167;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v167 != v27) {
          objc_enumerationMutation(v22);
        }
        uint64_t v29 = *(void *)(*((void *)&v166 + 1) + 8 * i);
        v30 = objc_msgSend_zoneIDsToGateHolders(v6, v24, v25);
        v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, v29);

        if (objc_msgSend_isEqual_(v32, v33, (uint64_t)v141))
        {
          v37 = objc_msgSend_zoneIDsToGateHolders(v6, v34, v35);
          if (v139) {
            objc_msgSend_setObject_forKeyedSubscript_(v37, v36, (uint64_t)v135, v29);
          }
          else {
            objc_msgSend_removeObjectForKey_(v37, v36, v29);
          }
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v166, v181, 16);
    }
    while (v26);
  }

  uint64_t v40 = objc_msgSend_waiterWrappers(v6, v38, v39);
  v43 = objc_msgSend_copy(v40, v41, v42);

  uint64_t v48 = objc_msgSend_count(v43, v44, v45);
  if (v48 - 1 >= 0)
  {
    do
    {
      v49 = objc_msgSend_objectAtIndexedSubscript_(v43, v46, --v48);
      v52 = objc_msgSend_waiter(v49, v50, v51);
      int isEqual = objc_msgSend_isEqual_(v52, v53, (uint64_t)v141);

      if (isEqual)
      {
        objc_msgSend_addObject_(v132, v55, (uint64_t)v49);
        long long v58 = objc_msgSend_waiterWrappers(v6, v56, v57);
        objc_msgSend_removeObjectAtIndex_(v58, v59, v48);
      }
    }
    while (v48 > 0);
  }
  long long v60 = objc_msgSend_waiterWrappers(v6, v46, v47);
  v63 = objc_msgSend_copy(v60, v61, v62);

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  obuint64_t j = v63;
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v162, v180, 16);
  if (v65)
  {
    uint64_t v136 = *(void *)v163;
    *(void *)&long long v68 = 138412290;
    long long v131 = v68;
    do
    {
      v69 = 0;
      id v137 = (id)v65;
      do
      {
        if (*(void *)v163 != v136) {
          objc_enumerationMutation(obj);
        }
        uint64_t v70 = *(void **)(*((void *)&v162 + 1) + 8 * (void)v69);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v71 = objc_msgSend_activity(v70, v66, v67, v131);
        os_activity_scope_enter(v71, &state);

        long long v159 = 0u;
        long long v160 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        v74 = objc_msgSend_zoneIDs(v70, v72, v73);
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v157, v179, 16);
        if (v78)
        {
          uint64_t v79 = *(void *)v158;
          while (2)
          {
            for (uint64_t j = 0; j != v78; ++j)
            {
              if (*(void *)v158 != v79) {
                objc_enumerationMutation(v74);
              }
              uint64_t v81 = *(void *)(*((void *)&v157 + 1) + 8 * j);
              v82 = objc_msgSend_zoneIDsToGateHolders(v6, v76, v77);
              v84 = objc_msgSend_objectForKeyedSubscript_(v82, v83, v81);

              if (v84)
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                v105 = (id)*MEMORY[0x1E4F1A500];
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                {
                  v108 = objc_msgSend_zoneIDsToGateHolders(v6, v106, v107);
                  v110 = objc_msgSend_objectForKeyedSubscript_(v108, v109, v81);
                  *(_DWORD *)buf = 138412802;
                  id v174 = v70;
                  __int16 v175 = 2112;
                  uint64_t v176 = v81;
                  __int16 v177 = 2112;
                  v178 = v110;
                  _os_log_debug_impl(&dword_1C4CFF000, v105, OS_LOG_TYPE_DEBUG, "Can't grant gate to waiter %@ because zone %@ held by %@", buf, 0x20u);
                }
                goto LABEL_57;
              }
            }
            uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v76, (uint64_t)&v157, v179, 16);
            if (v78) {
              continue;
            }
            break;
          }
        }

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v85 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v131;
          id v174 = v70;
          _os_log_debug_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_DEBUG, "Granting gate to waiter %@", buf, 0xCu);
        }
        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        v88 = objc_msgSend_zoneIDs(v70, v86, v87);
        uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v153, v172, 16);
        if (v92)
        {
          uint64_t v93 = *(void *)v154;
          do
          {
            for (uint64_t k = 0; k != v92; ++k)
            {
              if (*(void *)v154 != v93) {
                objc_enumerationMutation(v88);
              }
              uint64_t v95 = *(void *)(*((void *)&v153 + 1) + 8 * k);
              v96 = objc_msgSend_waiter(v70, v90, v91);
              v99 = objc_msgSend_zoneIDsToGateHolders(v6, v97, v98);
              objc_msgSend_setObject_forKeyedSubscript_(v99, v100, (uint64_t)v96, v95);
            }
            uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v153, v172, 16);
          }
          while (v92);
        }

        objc_msgSend_addObject_(v133, v101, (uint64_t)v70);
        v74 = objc_msgSend_waiterWrappers(v6, v102, v103);
        objc_msgSend_removeObject_(v74, v104, (uint64_t)v70);
LABEL_57:

        os_activity_scope_leave(&state);
        v69 = (char *)v69 + 1;
      }
      while (v69 != v137);
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v162, v180, 16);
    }
    while (v65);
  }

  if (v139)
  {
    dispatch_time_t v111 = dispatch_time(0, 2000000000);
    v112 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4D93674;
    block[3] = &unk_1E64F0948;
    void block[4] = v6;
    id v152 = v135;
    dispatch_after(v111, v112, block);
  }
  objc_sync_exit(v6);

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v140 = v132;
  uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v113, (uint64_t)&v147, v171, 16);
  if (v115)
  {
    uint64_t v116 = *(void *)v148;
    do
    {
      for (uint64_t m = 0; m != v115; ++m)
      {
        if (*(void *)v148 != v116) {
          objc_enumerationMutation(v140);
        }
        objc_msgSend_invokeWaitCompletedHandler_(*(void **)(*((void *)&v147 + 1) + 8 * m), v114, 0);
      }
      uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v114, (uint64_t)&v147, v171, 16);
    }
    while (v115);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v138 = v133;
  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v118, (uint64_t)&v143, v170, 16);
  if (v121)
  {
    uint64_t v122 = *(void *)v144;
    uint64_t v123 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t n = 0; n != v121; ++n)
      {
        if (*(void *)v144 != v122) {
          objc_enumerationMutation(v138);
        }
        v125 = *(void **)(*((void *)&v143 + 1) + 8 * n);
        v126 = objc_msgSend_waiter(v125, v119, v120);
        objc_msgSend_qualityOfService(v126, v127, v128);
        v129 = CKGetGlobalQueue();
        v142[0] = v123;
        v142[1] = 3221225472;
        v142[2] = sub_1C4D93684;
        v142[3] = &unk_1E64F05C8;
        v142[4] = v125;
        dispatch_async(v129, v142);
      }
      uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v119, (uint64_t)&v143, v170, 16);
    }
    while (v121);
  }
}

- (BOOL)hasStatusToReport
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v5 = objc_msgSend_zoneIDsToGateHolders(v2, v3, v4);
  if (objc_msgSend_count(v5, v6, v7))
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = objc_msgSend_waiterWrappers(v2, v8, v9);
    BOOL v10 = objc_msgSend_count(v11, v12, v13) != 0;
  }
  objc_sync_exit(v2);

  return v10;
}

- (id)CKStatusReportArray
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v83 = v4;
  uint64_t v7 = objc_msgSend_zoneIDsToGateHolders(v4, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    objc_msgSend_addObject_(v3, v11, @"\tHeld Gates {");
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v14 = objc_msgSend_zoneIDsToGateHolders(v4, v12, v13);
    uint64_t v17 = objc_msgSend_allKeys(v14, v15, v16);

    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v92, v98, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v93 != v22) {
            objc_enumerationMutation(v17);
          }
          id v24 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_zoneIDsToGateHolders(v83, v19, v20);
          uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v24);

          uint64_t v28 = NSString;
          uint64_t v31 = objc_msgSend_ckShortDescription(v24, v29, v30);
          v34 = objc_msgSend_ckShortDescription(v27, v32, v33);
          v36 = objc_msgSend_stringWithFormat_(v28, v35, @"\t\t%@ -> %@", v31, v34);
          objc_msgSend_addObject_(v3, v37, (uint64_t)v36);
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v92, v98, 16);
      }
      while (v21);
    }

    objc_msgSend_addObject_(v3, v38, @"\t}");
  }
  else
  {
    objc_msgSend_addObject_(v3, v11, @"\tNo gates held");
  }
  v41 = objc_msgSend_waiterWrappers(v83, v39, v40);
  uint64_t v44 = objc_msgSend_count(v41, v42, v43);

  if (v44)
  {
    objc_msgSend_addObject_(v3, v45, @"\tWaiters {");
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v48 = objc_msgSend_waiterWrappers(v83, v46, v47);
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v88, v97, 16);
    if (v50)
    {
      obuint64_t j = v48;
      uint64_t v81 = *(void *)v89;
      do
      {
        uint64_t v82 = v50;
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v89 != v81) {
            objc_enumerationMutation(obj);
          }
          long long v54 = *(void **)(*((void *)&v88 + 1) + 8 * j);
          long long v55 = NSString;
          long long v56 = objc_msgSend_waiter(v54, v51, v52);
          long long v59 = objc_msgSend_ckShortDescription(v56, v57, v58);
          long long v61 = objc_msgSend_stringWithFormat_(v55, v60, @"\t\t%@ wants zone IDs {", v59);
          objc_msgSend_addObject_(v3, v62, (uint64_t)v61);

          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          uint64_t v65 = objc_msgSend_zoneIDs(v54, v63, v64);
          uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v84, v96, 16);
          if (v69)
          {
            uint64_t v70 = *(void *)v85;
            do
            {
              for (uint64_t k = 0; k != v69; ++k)
              {
                if (*(void *)v85 != v70) {
                  objc_enumerationMutation(v65);
                }
                v72 = NSString;
                uint64_t v73 = objc_msgSend_ckShortDescription(*(void **)(*((void *)&v84 + 1) + 8 * k), v67, v68);
                v75 = objc_msgSend_stringWithFormat_(v72, v74, @"\t\t\t%@,", v73);
                objc_msgSend_addObject_(v3, v76, (uint64_t)v75);
              }
              uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v67, (uint64_t)&v84, v96, 16);
            }
            while (v69);
          }

          objc_msgSend_addObject_(v3, v77, @"\t\t}");
        }
        uint64_t v48 = obj;
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v88, v97, 16);
      }
      while (v50);
    }

    objc_msgSend_addObject_(v3, v78, @"\t}");
  }
  objc_sync_exit(v83);

  return v3;
}

- (NSMutableDictionary)zoneIDsToGateHolders
{
  return self->_zoneIDsToGateHolders;
}

- (void)setZoneIDsToGateHolders:(id)a3
{
}

- (NSMutableArray)waiterWrappers
{
  return self->_waiterWrappers;
}

- (void)setWaiterWrappers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waiterWrappers, 0);
  objc_storeStrong((id *)&self->_zoneIDsToGateHolders, 0);
}

@end