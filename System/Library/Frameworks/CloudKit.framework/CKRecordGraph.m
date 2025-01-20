@interface CKRecordGraph
+ (id)topologicallySortRecords:(id)a3 withError:(id *)a4;
- (BOOL)addRecords:(id)a3 error:(id *)a4;
- (CKRecordGraph)init;
- (id)description;
- (id)recordsByTopologicalSortWithError:(id *)a3;
@end

@implementation CKRecordGraph

- (BOOL)addRecords:(id)a3 error:(id *)a4
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v149 = objc_opt_new();
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v170, (uint64_t)v178, 16);
  v151 = v7;
  v142 = v8;
  if (!v10)
  {
LABEL_9:

    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    obuint64_t j = v8;
    uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v166, (uint64_t)v177, 16);
    if (!v145) {
      goto LABEL_60;
    }
    uint64_t v144 = *(void *)v167;
    v150 = v6;
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v167 != v144) {
          objc_enumerationMutation(obj);
        }
        uint64_t v146 = v31;
        v32 = *(void **)(*((void *)&v166 + 1) + 8 * v31);
        v36 = objc_msgSend_objectForKey_(v6, v29, (uint64_t)v32, v30);
        if (!v36)
        {
          v36 = objc_opt_new();
          objc_msgSend_setRecord_(v36, v37, (uint64_t)v32, v38);
          objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v36, (uint64_t)v32);
          objc_msgSend_addObject_(v149, v40, (uint64_t)v36, v41);
        }
        v147 = v36;
        v42 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v33, v34, v35);
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        v148 = v32;
        v46 = objc_msgSend_valueStore(v32, v43, v44, v45);
        v50 = objc_msgSend_allRawValues(v46, v47, v48, v49);

        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v162, (uint64_t)v176, 16);
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v163;
          id v152 = v50;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v163 != v54) {
                objc_enumerationMutation(v50);
              }
              v56 = *(void **)(*((void *)&v162 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend_addObject_(v42, v57, (uint64_t)v56, v58);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v160 = 0u;
                  long long v161 = 0u;
                  long long v158 = 0u;
                  long long v159 = 0u;
                  id v60 = v56;
                  uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v158, (uint64_t)v175, 16);
                  if (v62)
                  {
                    uint64_t v63 = v62;
                    uint64_t v64 = *(void *)v159;
                    do
                    {
                      for (uint64_t j = 0; j != v63; ++j)
                      {
                        if (*(void *)v159 != v64) {
                          objc_enumerationMutation(v60);
                        }
                        uint64_t v66 = *(void *)(*((void *)&v158 + 1) + 8 * j);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          objc_msgSend_addObject_(v42, v67, v66, v68);
                        }
                      }
                      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v67, (uint64_t)&v158, (uint64_t)v175, 16);
                    }
                    while (v63);
                  }

                  v6 = v150;
                  v7 = v151;
                  v50 = v152;
                }
              }
            }
            uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v59, (uint64_t)&v162, (uint64_t)v176, 16);
          }
          while (v53);
        }

        v72 = objc_msgSend_parent(v148, v69, v70, v71);

        if (v72)
        {
          v76 = objc_msgSend_parent(v148, v73, v74, v75);
          objc_msgSend_addObject_(v42, v77, (uint64_t)v76, v78);
        }
        v79 = objc_msgSend_share(v148, v73, v74, v75);

        if (v79)
        {
          v83 = objc_msgSend_share(v148, v80, v81, v82);
          objc_msgSend_addObject_(v42, v84, (uint64_t)v83, v85);
        }
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v153 = v42;
        uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v86, (uint64_t)&v154, (uint64_t)v174, 16);
        v91 = v147;
        if (v87)
        {
          uint64_t v92 = v87;
          uint64_t v93 = *(void *)v155;
          do
          {
            for (uint64_t k = 0; k != v92; ++k)
            {
              if (*(void *)v155 != v93) {
                objc_enumerationMutation(v153);
              }
              v95 = *(void **)(*((void *)&v154 + 1) + 8 * k);
              v96 = objc_msgSend_recordID(v95, v88, v89, v90);
              v99 = objc_msgSend_objectForKey_(v7, v97, (uint64_t)v96, v98);

              if (v99)
              {
                if (objc_msgSend_referenceAction(v95, v100, v101, v102) != 1
                  && objc_msgSend_referenceAction(v95, v103, v104, v105) != 2)
                {
                  uint64_t v107 = objc_msgSend_parent(v148, v103, v106, v105);
                  if (v95 == (void *)v107)
                  {

                    v91 = v147;
                  }
                  else
                  {
                    v111 = (void *)v107;
                    v112 = objc_msgSend_share(v148, v108, v109, v110);

                    BOOL v113 = v95 == v112;
                    v7 = v151;
                    v91 = v147;
                    if (!v113) {
                      goto LABEL_56;
                    }
                  }
                }
                v117 = objc_msgSend_objectForKey_(v6, v103, (uint64_t)v99, v105);
                if (!v117)
                {
                  v117 = objc_opt_new();
                  objc_msgSend_setRecord_(v117, v118, (uint64_t)v99, v119);
                  objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v117, (uint64_t)v99);
                  objc_msgSend_addObject_(v149, v121, (uint64_t)v117, v122);
                }
                v123 = objc_msgSend_edges(v91, v114, v115, v116);
                objc_msgSend_addObject_(v123, v124, (uint64_t)v117, v125);

                v129 = objc_msgSend_indegrees(v117, v126, v127, v128);
                objc_msgSend_addObject_(v129, v130, (uint64_t)v91, v131);
              }
LABEL_56:
            }
            uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v88, (uint64_t)&v154, (uint64_t)v174, 16);
          }
          while (v92);
        }

        uint64_t v31 = v146 + 1;
      }
      while (v146 + 1 != v145);
      uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v166, (uint64_t)v177, 16);
      if (!v145)
      {
LABEL_60:

        if (self) {
          nodes = self->_nodes;
        }
        else {
          nodes = 0;
        }
        v135 = v149;
        objc_msgSend_addObjectsFromArray_(nodes, v132, (uint64_t)v149, v133);
        sub_18B0F90E0((uint64_t)self, 0);
        BOOL v136 = 1;
        v137 = v142;
        goto LABEL_66;
      }
    }
  }
  uint64_t v14 = v10;
  uint64_t v15 = *(void *)v171;
LABEL_3:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v171 != v15) {
      objc_enumerationMutation(v8);
    }
    v17 = *(void **)(*((void *)&v170 + 1) + 8 * v16);
    v18 = objc_msgSend_recordID(v17, v11, v12, v13);
    objc_msgSend_objectForKey_(v7, v19, (uint64_t)v18, v20);
    v22 = v21 = v7;

    if (v22) {
      break;
    }
    v26 = objc_msgSend_recordID(v17, v23, v24, v25);
    objc_msgSend_setObject_forKey_(v21, v27, (uint64_t)v17, (uint64_t)v26);

    ++v16;
    v7 = v21;
    id v8 = v142;
    if (v14 == v16)
    {
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v11, (uint64_t)&v170, (uint64_t)v178, 16);
      if (!v14) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
  v135 = v149;
  if (a4)
  {
    v138 = objc_msgSend_recordID(v17, v23, v24, v25);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v139, @"CKInternalErrorDomain", 1017, @"Asked to sort multiple records with identical recordID: %@", v138);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v137 = v142;

  BOOL v136 = 0;
  v7 = v151;
LABEL_66:

  return v136;
}

- (CKRecordGraph)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKRecordGraph;
  v2 = [(CKRecordGraph *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)recordsByTopologicalSortWithError:(id *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    sortedRecords = self->_sortedRecords;
    if (sortedRecords)
    {
      objc_super v6 = sortedRecords;
      goto LABEL_33;
    }
    v7 = objc_opt_new();
    objc_msgSend_CKFilter_(self->_nodes, v8, (uint64_t)&unk_1ED7EF338, v9);
  }
  else
  {
    v7 = objc_opt_new();
    objc_msgSend_CKFilter_(0, v60, (uint64_t)&unk_1ED7EF338, v61);
  uint64_t v10 = };
  uint64_t v14 = objc_msgSend_mutableCopy(v10, v11, v12, v13);

  uint64_t v62 = a3;
  if (self) {
    objc_msgSend_removeObjectsInArray_(self->_nodes, v15, (uint64_t)v14, v16);
  }
  else {
    objc_msgSend_removeObjectsInArray_(0, v15, (uint64_t)v14, v16);
  }
  while (objc_msgSend_count(v14, v17, v18, v19))
  {
    v23 = objc_msgSend_lastObject(v14, v20, v21, v22);
    objc_msgSend_removeObject_(v14, v24, (uint64_t)v23, v25);
    v29 = objc_msgSend_record(v23, v26, v27, v28);
    objc_msgSend_insertObject_atIndex_(v7, v30, (uint64_t)v29, 0);

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v34 = objc_msgSend_edges(v23, v31, v32, v33);
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v36)
    {
      uint64_t v40 = v36;
      uint64_t v41 = *(void *)v64;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v34);
          }
          v43 = *(void **)(*((void *)&v63 + 1) + 8 * v42);
          uint64_t v44 = objc_msgSend_indegrees(v43, v37, v38, v39);
          objc_msgSend_removeObject_(v44, v45, (uint64_t)v23, v46);

          if (!objc_msgSend_indegree(v43, v47, v48, v49))
          {
            objc_msgSend_insertObject_atIndex_(v14, v37, (uint64_t)v43, 0);
            if (self) {
              objc_msgSend_removeObject_(self->_nodes, v50, (uint64_t)v43, v51);
            }
            else {
              objc_msgSend_removeObject_(0, v50, (uint64_t)v43, v51);
            }
          }
          ++v42;
        }
        while (v40 != v42);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v63, (uint64_t)v67, 16);
        uint64_t v40 = v52;
      }
      while (v52);
    }
  }
  if (self) {
    nodes = self->_nodes;
  }
  else {
    nodes = 0;
  }
  if (objc_msgSend_count(nodes, v20, v21, v22))
  {
    if (self) {
      objc_msgSend_removeAllObjects(self->_nodes, v54, v55, v56);
    }
    else {
      objc_msgSend_removeAllObjects(0, v54, v55, v56);
    }
    if (v62)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v57, @"CKInternalErrorDomain", 1017, @"Cycle detected in record graph");
      objc_super v6 = 0;
      *uint64_t v62 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = 0;
    }
  }
  else
  {
    sub_18B0F90E0((uint64_t)self, v7);
    if (self) {
      uint64_t v58 = self->_sortedRecords;
    }
    else {
      uint64_t v58 = 0;
    }
    objc_super v6 = v58;
  }

LABEL_33:

  return v6;
}

- (id)description
{
  if (self) {
    self = (CKRecordGraph *)self->_nodes;
  }
  return (id)objc_msgSend_description(self, a2, v2, v3);
}

+ (id)topologicallySortRecords:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  objc_super v6 = objc_alloc_init(CKRecordGraph);
  id v18 = 0;
  int v8 = objc_msgSend_addRecords_error_(v6, v7, (uint64_t)v5, (uint64_t)&v18);

  id v9 = v18;
  uint64_t v13 = v9;
  if (v8)
  {
    id v17 = v9;
    uint64_t v14 = objc_msgSend_recordsByTopologicalSortWithError_(v6, v10, (uint64_t)&v17, v12);
    id v15 = v17;

    uint64_t v13 = v15;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v13)
  {
    objc_msgSend_CKClientSuitableError(v13, v10, v11, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedRecords, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end