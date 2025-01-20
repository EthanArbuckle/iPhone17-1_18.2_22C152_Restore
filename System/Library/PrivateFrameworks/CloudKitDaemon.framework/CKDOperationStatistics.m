@interface CKDOperationStatistics
+ (id)CKStatusReportForStatistics:(id)a3;
- (CKDOperationMetrics)aggregateCKMetrics;
- (CKDOperationMetrics)aggregateMMCSMetrics;
- (CKDOperationStatistics)initWithOperationClassName:(id)a3;
- (NSMutableDictionary)recentErrorsByDate;
- (NSString)operationClassName;
- (id)_trimmedError:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)operationCount;
- (void)_addMetrics:(id)a3 toAggregate:(id)a4;
- (void)addOperation:(id)a3 cloudKitMetrics:(id)a4 MMCSMetrics:(id)a5;
@end

@implementation CKDOperationStatistics

- (CKDOperationStatistics)initWithOperationClassName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDOperationStatistics;
  v6 = [(CKDOperationStatistics *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationClassName, a3);
    uint64_t v8 = objc_opt_new();
    recentErrorsByDate = v7->_recentErrorsByDate;
    v7->_recentErrorsByDate = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    aggregateCKMetrics = v7->_aggregateCKMetrics;
    v7->_aggregateCKMetrics = (CKDOperationMetrics *)v10;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKDOperationStatistics alloc];
  v7 = objc_msgSend_operationClassName(self, v5, v6);
  v9 = objc_msgSend_initWithOperationClassName_(v4, v8, (uint64_t)v7);

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCE280);
  v12 = objc_msgSend_recentErrorsByDate(self, v10, v11);
  uint64_t v15 = objc_msgSend_copy(v12, v13, v14);
  v16 = (void *)v9[2];
  v9[2] = v15;

  v9[3] = objc_msgSend_operationCount(self, v17, v18);
  v21 = objc_msgSend_aggregateCKMetrics(self, v19, v20);
  uint64_t v24 = objc_msgSend_copy(v21, v22, v23);
  v25 = (void *)v9[4];
  v9[4] = v24;

  v28 = objc_msgSend_aggregateMMCSMetrics(self, v26, v27);
  uint64_t v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v9[5];
  v9[5] = v31;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCE280);
  return v9;
}

- (void)_addMetrics:(id)a3 toAggregate:(id)a4
{
  id v68 = a4;
  id v5 = a3;
  objc_msgSend_duration(v5, v6, v7);
  double v9 = v8;
  objc_msgSend_duration(v68, v10, v11);
  objc_msgSend_setDuration_(v68, v13, v14, v9 + v12);
  objc_msgSend_queueing(v5, v15, v16);
  double v18 = v17;
  objc_msgSend_queueing(v68, v19, v20);
  objc_msgSend_setQueueing_(v68, v22, v23, v18 + v21);
  objc_msgSend_executing(v5, v24, v25);
  double v27 = v26;
  objc_msgSend_executing(v68, v28, v29);
  objc_msgSend_setExecuting_(v68, v31, v32, v27 + v30);
  uint64_t v35 = objc_msgSend_bytesUploaded(v5, v33, v34);
  uint64_t v38 = objc_msgSend_bytesUploaded(v68, v36, v37);
  objc_msgSend_setBytesUploaded_(v68, v39, v38 + v35);
  uint64_t v42 = objc_msgSend_bytesDownloaded(v5, v40, v41);
  uint64_t v45 = objc_msgSend_bytesDownloaded(v68, v43, v44);
  objc_msgSend_setBytesDownloaded_(v68, v46, v45 + v42);
  uint64_t v49 = objc_msgSend_connections(v5, v47, v48);
  uint64_t v52 = objc_msgSend_connections(v68, v50, v51);
  objc_msgSend_setConnections_(v68, v53, v52 + v49);
  uint64_t v56 = objc_msgSend_connectionsCreated(v5, v54, v55);
  uint64_t v59 = objc_msgSend_connectionsCreated(v68, v57, v58);
  objc_msgSend_setConnectionsCreated_(v68, v60, v59 + v56);
  uint64_t v63 = objc_msgSend_requestCount(v5, v61, v62);

  uint64_t v66 = objc_msgSend_requestCount(v68, v64, v65);
  objc_msgSend_setRequestCount_(v68, v67, v66 + v63);
}

- (id)_trimmedError:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_domain(v4, v5, v6);
  if (objc_msgSend_isEqualToString_(v7, v8, *MEMORY[0x1E4F19C40]))
  {
    uint64_t v11 = objc_msgSend_code(v4, v9, v10);

    if (v11 == 22)
    {
      uint64_t v14 = 0;
      id v15 = v4;
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v16 = objc_msgSend_userInfo(v4, v12, v13);

  v19 = v4;
  if (v16)
  {
    uint64_t v20 = objc_msgSend_userInfo(v4, v17, v18);
    uint64_t v23 = objc_msgSend_mutableCopy(v20, v21, v22);

    uint64_t v24 = *MEMORY[0x1E4F28A50];
    double v26 = objc_msgSend_objectForKeyedSubscript_(v23, v25, *MEMORY[0x1E4F28A50]);

    if (v26)
    {
      v28 = objc_msgSend_objectForKeyedSubscript_(v23, v27, v24);
      double v30 = objc_msgSend__trimmedError_(self, v29, (uint64_t)v28);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v31, (uint64_t)v30, v24);
    }
    uint64_t v32 = *MEMORY[0x1E4F19CD8];
    v33 = objc_msgSend_objectForKeyedSubscript_(v23, v27, *MEMORY[0x1E4F19CD8]);

    if (v33)
    {
      id v69 = v4;
      uint64_t v35 = objc_opt_new();
      uint64_t v67 = v32;
      id v68 = v23;
      uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v23, v36, v32);
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v40 = objc_msgSend_allKeys(v37, v38, v39);
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v70, v74, 16);
      if (v42)
      {
        uint64_t v44 = v42;
        uint64_t v45 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v71 != v45) {
              objc_enumerationMutation(v40);
            }
            uint64_t v47 = *(void *)(*((void *)&v70 + 1) + 8 * i);
            uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v37, v43, v47);
            v50 = objc_msgSend__trimmedError_(self, v49, (uint64_t)v48);
            objc_msgSend_setObject_forKeyedSubscript_(v35, v51, (uint64_t)v50, v47);
          }
          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v70, v74, 16);
        }
        while (v44);
      }

      uint64_t v23 = v68;
      objc_msgSend_setObject_forKeyedSubscript_(v68, v52, (uint64_t)v35, v67);

      id v4 = v69;
    }
    objc_msgSend_setObject_forKeyedSubscript_(v23, v34, 0, *MEMORY[0x1E4F19DE8]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v53, 0, *MEMORY[0x1E4F19D00]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v54, 0, *MEMORY[0x1E4F19D10]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v55, 0, *MEMORY[0x1E4F19D08]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v56, 0, *MEMORY[0x1E4F19D40]);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v57 = (objc_class *)MEMORY[0x1E4F1A280];
    }
    else {
      v57 = (objc_class *)MEMORY[0x1E4F28C58];
    }
    id v58 = [v57 alloc];
    v61 = objc_msgSend_domain(v4, v59, v60);
    uint64_t v64 = objc_msgSend_code(v4, v62, v63);
    v19 = objc_msgSend_initWithDomain_code_userInfo_(v58, v65, (uint64_t)v61, v64, v23);
  }
  id v15 = v19;
  uint64_t v14 = v15;
LABEL_22:

  return v14;
}

- (void)addOperation:(id)a3 cloudKitMetrics:(id)a4 MMCSMetrics:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCE280);
  ++self->_operationCount;
  uint64_t v13 = objc_msgSend_aggregateCKMetrics(self, v11, v12);
  objc_msgSend__addMetrics_toAggregate_(self, v14, (uint64_t)v9, v13);

  if (v10)
  {
    double v17 = objc_msgSend_aggregateMMCSMetrics(self, v15, v16);

    if (!v17)
    {
      uint64_t v20 = (CKDOperationMetrics *)objc_opt_new();
      aggregateMMCSMetrics = self->_aggregateMMCSMetrics;
      self->_aggregateMMCSMetrics = v20;
    }
    uint64_t v22 = objc_msgSend_aggregateMMCSMetrics(self, v18, v19);
    objc_msgSend__addMetrics_toAggregate_(self, v23, (uint64_t)v10, v22);
  }
  uint64_t v24 = objc_msgSend_error(v8, v15, v16);

  if (v24)
  {
    double v27 = objc_msgSend_error(v8, v25, v26);
    uint64_t v29 = objc_msgSend__trimmedError_(self, v28, (uint64_t)v27);

    if (v29)
    {
      uint64_t v32 = objc_msgSend_recentErrorsByDate(self, v30, v31);
      unint64_t v35 = objc_msgSend_count(v32, v33, v34);
      uint64_t v38 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v36, v37);
      unint64_t v41 = objc_msgSend_savedErrorCount(v38, v39, v40);

      if (v35 > v41)
      {
        long long v71 = v29;
        uint64_t v44 = objc_msgSend_distantFuture(MEMORY[0x1E4F1C9C8], v42, v43);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v47 = objc_msgSend_recentErrorsByDate(self, v45, v46);
        v50 = objc_msgSend_allKeys(v47, v48, v49);

        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v72, v76, 16);
        if (v52)
        {
          uint64_t v54 = v52;
          uint64_t v55 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v73 != v55) {
                objc_enumerationMutation(v50);
              }
              v57 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              if (objc_msgSend_compare_(v57, v53, (uint64_t)v44) == -1)
              {
                id v58 = v57;

                uint64_t v44 = v58;
              }
            }
            uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v72, v76, 16);
          }
          while (v54);
        }

        v61 = objc_msgSend_recentErrorsByDate(self, v59, v60);
        objc_msgSend_setObject_forKeyedSubscript_(v61, v62, 0, v44);

        uint64_t v29 = v71;
      }
      uint64_t v63 = objc_msgSend_error(v8, v42, v43);
      uint64_t v66 = objc_msgSend_recentErrorsByDate(self, v64, v65);
      id v69 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v67, v68);
      objc_msgSend_setObject_forKeyedSubscript_(v66, v70, (uint64_t)v63, v69);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCE280);
}

+ (id)CKStatusReportForStatistics:(id)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCE280);
  v118 = v3;
  objc_msgSend_sortedArrayUsingComparator_(v3, v5, (uint64_t)&unk_1F20433B0);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v135, v140, 16);
  if (v121)
  {
    uint64_t v120 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v121; ++i)
      {
        if (*(void *)v136 != v120) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        v127 = NSString;
        uint64_t v11 = objc_msgSend_operationClassName(v10, v7, v8);
        uint64_t v125 = objc_msgSend_operationCount(v10, v12, v13);
        v130 = objc_msgSend_aggregateCKMetrics(v10, v14, v15);
        uint64_t v123 = objc_msgSend_requestCount(v130, v16, v17);
        v128 = objc_msgSend_aggregateCKMetrics(v10, v18, v19);
        objc_msgSend_duration(v128, v20, v21);
        uint64_t v23 = v22;
        v126 = objc_msgSend_aggregateCKMetrics(v10, v24, v25);
        objc_msgSend_queueing(v126, v26, v27);
        uint64_t v29 = v28;
        v124 = objc_msgSend_aggregateCKMetrics(v10, v30, v31);
        objc_msgSend_executing(v124, v32, v33);
        uint64_t v35 = v34;
        v122 = objc_msgSend_aggregateCKMetrics(v10, v36, v37);
        uint64_t v40 = objc_msgSend_bytesUploaded(v122, v38, v39);
        uint64_t v43 = objc_msgSend_aggregateCKMetrics(v10, v41, v42);
        uint64_t v46 = objc_msgSend_bytesDownloaded(v43, v44, v45);
        uint64_t v49 = objc_msgSend_aggregateCKMetrics(v10, v47, v48);
        uint64_t v52 = objc_msgSend_connections(v49, v50, v51);
        uint64_t v55 = objc_msgSend_aggregateCKMetrics(v10, v53, v54);
        uint64_t v58 = objc_msgSend_connectionsCreated(v55, v56, v57);
        uint64_t v60 = objc_msgSend_stringWithFormat_(v127, v59, @"[%@] (%lu operations, %lu requests, %0.2f total duration (%0.2fq/%0.2fe), data u/d: %lu/%lu, %lu connections (%lu created))", v11, v125, v123, v23, v29, v35, v40, v46, v52, v58);
        objc_msgSend_addObject_(v4, v61, (uint64_t)v60);

        uint64_t v64 = objc_msgSend_aggregateMMCSMetrics(v10, v62, v63);
        uint64_t v67 = v64;
        if (v64)
        {
          uint64_t v68 = NSString;
          uint64_t v69 = objc_msgSend_requestCount(v64, v65, v66);
          objc_msgSend_duration(v67, v70, v71);
          uint64_t v73 = v72;
          objc_msgSend_queueing(v67, v74, v75);
          uint64_t v77 = v76;
          objc_msgSend_executing(v67, v78, v79);
          uint64_t v81 = v80;
          uint64_t v84 = objc_msgSend_bytesUploaded(v67, v82, v83);
          uint64_t v87 = objc_msgSend_bytesDownloaded(v67, v85, v86);
          uint64_t v90 = objc_msgSend_connections(v67, v88, v89);
          uint64_t v93 = objc_msgSend_connectionsCreated(v67, v91, v92);
          v95 = objc_msgSend_stringWithFormat_(v68, v94, @"\t MMCS metrics: %lu requests, (%0.2f total duration (%0.2fq/%0.2fe), data u/d: %lu/%lu, %lu connections (%lu created))", v69, v73, v77, v81, v84, v87, v90, v93);
          objc_msgSend_addObject_(v4, v96, (uint64_t)v95);
        }
        v97 = objc_msgSend_recentErrorsByDate(v10, v65, v66);
        if (objc_msgSend_count(v97, v98, v99))
        {
          v129 = v67;
          objc_msgSend_addObject_(v4, v100, @"Recent errors: {");
          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          v103 = objc_msgSend_allKeys(v97, v101, v102);
          uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v131, v139, 16);
          if (v105)
          {
            uint64_t v107 = v105;
            uint64_t v108 = *(void *)v132;
            do
            {
              for (uint64_t j = 0; j != v107; ++j)
              {
                if (*(void *)v132 != v108) {
                  objc_enumerationMutation(v103);
                }
                uint64_t v110 = *(void *)(*((void *)&v131 + 1) + 8 * j);
                v111 = NSString;
                v112 = objc_msgSend_objectForKeyedSubscript_(v97, v106, v110);
                v114 = objc_msgSend_stringWithFormat_(v111, v113, @"\t%@ - %@", v110, v112);
                objc_msgSend_addObject_(v4, v115, (uint64_t)v114);
              }
              uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v106, (uint64_t)&v131, v139, 16);
            }
            while (v107);
          }

          objc_msgSend_addObject_(v4, v116, @"}");
          uint64_t v67 = v129;
        }
      }
      uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v135, v140, 16);
    }
    while (v121);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCE280);

  return v4;
}

- (NSString)operationClassName
{
  return self->_operationClassName;
}

- (NSMutableDictionary)recentErrorsByDate
{
  return self->_recentErrorsByDate;
}

- (unint64_t)operationCount
{
  return self->_operationCount;
}

- (CKDOperationMetrics)aggregateCKMetrics
{
  return self->_aggregateCKMetrics;
}

- (CKDOperationMetrics)aggregateMMCSMetrics
{
  return self->_aggregateMMCSMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateMMCSMetrics, 0);
  objc_storeStrong((id *)&self->_aggregateCKMetrics, 0);
  objc_storeStrong((id *)&self->_recentErrorsByDate, 0);
  objc_storeStrong((id *)&self->_operationClassName, 0);
}

@end