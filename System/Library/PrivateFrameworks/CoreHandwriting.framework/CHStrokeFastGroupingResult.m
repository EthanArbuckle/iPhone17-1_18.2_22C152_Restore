@interface CHStrokeFastGroupingResult
- (CHStrokeFastGroupingResult)initWithFastGroupingClusters:(const void *)a3 clusteredStrokes:(id)a4 strokeProvider:(id)a5 strategyIdentifier:(id)a6 clutterFilter:(id)a7;
- (id).cxx_construct;
- (vector<CHFastGroupingCluster,)fastGroupingClusters;
@end

@implementation CHStrokeFastGroupingResult

- (CHStrokeFastGroupingResult)initWithFastGroupingClusters:(const void *)a3 clusteredStrokes:(id)a4 strokeProvider:(id)a5 strategyIdentifier:(id)a6 clutterFilter:(id)a7
{
  v11 = off_1E64E0000;
  id v12 = a4;
  id v114 = a5;
  id v113 = a6;
  id v13 = a7;
  self;
  v111 = v13;
  v115 = objc_msgSend_setWithCapacity_(MEMORY[0x1E4F1CA80], v14, 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3), v15, v16, v17);
  uint64_t v23 = *(void *)a3;
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    id v112 = v12;
    do
    {
      id v24 = v12;
      id v25 = v114;
      id v26 = v113;
      self;
      v27 = v11;
      v36 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v28, *(void *)(v23 + 56), v29, v30, v31);
      v37 = *(void **)(v23 + 40);
      if (v37 != (void *)(v23 + 48))
      {
        do
        {
          v43 = objc_msgSend_objectAtIndexedSubscript_(v24, v32, v37[4], v33, v34, v35);
          v49 = objc_msgSend_encodedStrokeIdentifier(v43, v44, v45, v46, v47, v48);
          objc_msgSend_addObject_(v36, v50, (uint64_t)v49, v51, v52, v53);

          v54 = (void *)v37[1];
          if (v54)
          {
            do
            {
              v55 = v54;
              v54 = (void *)*v54;
            }
            while (v54);
          }
          else
          {
            do
            {
              v55 = (void *)v37[2];
              BOOL v56 = *v55 == (void)v37;
              v37 = v55;
            }
            while (!v56);
          }
          v37 = v55;
        }
        while (v55 != (void *)(v23 + 48));
      }
      v11 = v27;
      v38 = sub_1C4BF7890((uint64_t)v27[170], v36, v25, v26);

      objc_msgSend_addObject_(v115, v39, (uint64_t)v38, v40, v41, v42);
      v23 += 72;
      id v12 = v112;
    }
    while (v23 != *((void *)a3 + 1));
  }
  if (v111 && objc_msgSend_highDensityStrokeCount(v111, v18, v19, v20, v21, v22) >= 1)
  {
    v62 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v63 = objc_msgSend_highDensityStrokeCount(v111, v57, v58, v59, v60, v61);
    v73 = objc_msgSend_arrayWithCapacity_(v62, v64, v63, v65, v66, v67);
    for (unint64_t i = 0; i < objc_msgSend_count(v12, v68, v69, v70, v71, v72); ++i)
    {
      v79 = objc_msgSend_objectAtIndexedSubscript_(v12, v75, i, v76, v77, v78);
      v85 = objc_msgSend_encodedStrokeIdentifier(v79, v80, v81, v82, v83, v84);
      int isHighDensityStroke = objc_msgSend_isHighDensityStroke_(v111, v86, (uint64_t)v85, v87, v88, v89);

      if (isHighDensityStroke)
      {
        v96 = objc_msgSend_encodedStrokeIdentifier(v79, v91, v92, v93, v94, v95);
        objc_msgSend_addObject_(v73, v97, (uint64_t)v96, v98, v99, v100);
      }
    }
    v101 = sub_1C4BF7890((uint64_t)v11[170], v73, v114, v113);
    objc_msgSend_addObject_(v115, v102, (uint64_t)v101, v103, v104, v105);
  }
  v116.receiver = self;
  v116.super_class = (Class)CHStrokeFastGroupingResult;
  v106 = [(CHStrokeGroupingResult *)&v116 initWithStrokeGroups:v115 createdStrokeGroups:0 deletedStrokeGroups:0];
  v107 = v106;
  if (v106)
  {
    p_fastGroupingClusters = (uint64_t *)&v106->_fastGroupingClusters;
    if (&v107->_fastGroupingClusters != a3) {
      sub_1C4BEC340(p_fastGroupingClusters, *(void *)a3, *((void *)a3 + 1), 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    }
  }

  return v107;
}

- (vector<CHFastGroupingCluster,)fastGroupingClusters
{
  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  begin = self->_fastGroupingClusters.__begin_;
  end = self->_fastGroupingClusters.__end_;
  result = (vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *)(end - begin);
  if (end != begin)
  {
    unint64_t v8 = 0x8E38E38E38E38E39 * ((uint64_t)result >> 3);
    if (v8 >= 0x38E38E38E38E38FLL) {
      sub_1C494A220();
    }
    v9 = (CHFastGroupingCluster *)operator new((size_t)result);
    retstr->__begin_ = v9;
    retstr->__end_ = v9;
    retstr->__end_cap_.__value_ = (CHFastGroupingCluster *)((char *)v9 + 72 * v8);
    result = (vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *)sub_1C4BEC1C0((uint64_t)p_end_cap, (uint64_t)begin, (uint64_t)end, (uint64_t)v9);
    retstr->__end_ = (CHFastGroupingCluster *)result;
  }
  return result;
}

- (void).cxx_destruct
{
  p_fastGroupingClusters = &self->_fastGroupingClusters;
  begin = self->_fastGroupingClusters.__begin_;
  if (begin)
  {
    end = self->_fastGroupingClusters.__end_;
    v5 = self->_fastGroupingClusters.__begin_;
    if (end != begin)
    {
      uint64_t v6 = (uint64_t)end - 32;
      do
      {
        v7 = (CHFastGroupingCluster *)(v6 - 40);
        sub_1C4999C7C(v6, *(void **)(v6 + 8));
        sub_1C494AC4C(v6 - 40, *(void **)(v6 - 32));
        v6 -= 72;
      }
      while (v7 != begin);
      v5 = p_fastGroupingClusters->__begin_;
    }
    p_fastGroupingClusters->__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end