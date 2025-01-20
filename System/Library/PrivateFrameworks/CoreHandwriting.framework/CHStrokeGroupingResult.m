@interface CHStrokeGroupingResult
+ (BOOL)supportsSecureCoding;
+ (id)expandedStrokeGroupClusters:(id)a3 allClusters:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToStrokeGroupingResult:(id)a3;
- (CHStrokeGroupingResult)init;
- (CHStrokeGroupingResult)initWithCoder:(id)a3;
- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5;
- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 cachedAdjacencies:(const void *)a6;
- (NSArray)strokeGroupClusters;
- (NSArray)textStrokeGroupClusters;
- (NSSet)createdStrokeGroups;
- (NSSet)deletedStrokeGroups;
- (NSSet)nontextStrokeGroups;
- (NSSet)strokeGroups;
- (NSSet)textStrokeGroups;
- (const)cachedAdjacencies;
- (id).cxx_construct;
- (id)description;
- (id)groupingResultUpdatedWithGroupReplacements:(id)a3;
- (id)strokeGroupsSortedBy:(unint64_t)a3 textGroupsOnly:(BOOL)a4;
- (id)textStrokeGroupClustersAtPosition:(CGPoint)a3 closestAbove:(id *)a4 closestBelow:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHStrokeGroupingResult

- (CHStrokeGroupingResult)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CHStrokeGroupingResult;
  v16 = [(CHStrokeGroupingResult *)&v40 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v8, v11, v12, v13, v14, v15);
    strokeGroups = v16->_strokeGroups;
    v16->_strokeGroups = (NSSet *)v17;

    uint64_t v24 = objc_msgSend_copy(v9, v19, v20, v21, v22, v23);
    createdStrokeGroups = v16->_createdStrokeGroups;
    v16->_createdStrokeGroups = (NSSet *)v24;

    uint64_t v31 = objc_msgSend_copy(v10, v26, v27, v28, v29, v30);
    deletedStrokeGroups = v16->_deletedStrokeGroups;
    v16->_deletedStrokeGroups = (NSSet *)v31;

    v38 = 0;
    unint64_t v39 = 0;
    v37 = &v38;
    p_pair1 = &v16->_cachedAdjacencies.__tree_.__pair1_;
    sub_1C49EB298((uint64_t)&v16->_cachedAdjacencies, (void *)v16->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_);
    v34 = v38;
    v16->_cachedAdjacencies.__tree_.__begin_node_ = &v38;
    v16->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_ = v34;
    unint64_t v35 = v39;
    v16->_cachedAdjacencies.__tree_.__pair3_.__value_ = v39;
    if (v35)
    {
      v34[2] = p_pair1;
      v37 = &v38;
      v38 = 0;
      unint64_t v39 = 0;
      v34 = 0;
    }
    else
    {
      v16->_cachedAdjacencies.__tree_.__begin_node_ = p_pair1;
    }
    sub_1C49EB298((uint64_t)&v37, v34);
  }

  return v16;
}

- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 cachedAdjacencies:(const void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v85.receiver = self;
  v85.super_class = (Class)CHStrokeGroupingResult;
  v18 = [(CHStrokeGroupingResult *)&v85 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v10, v13, v14, v15, v16, v17);
    uint64_t v20 = (void *)*((void *)v18 + 13);
    *((void *)v18 + 13) = v19;

    uint64_t v26 = objc_msgSend_copy(v11, v21, v22, v23, v24, v25);
    uint64_t v27 = (void *)*((void *)v18 + 14);
    *((void *)v18 + 14) = v26;

    uint64_t v33 = objc_msgSend_copy(v12, v28, v29, v30, v31, v32);
    v34 = (void *)*((void *)v18 + 15);
    *((void *)v18 + 15) = v33;

    unint64_t v35 = (void **)(v18 + 80);
    if (v18 + 80 != a6)
    {
      v38 = *(char **)a6;
      v37 = (char *)a6 + 8;
      v36 = v38;
      if (*((void *)v18 + 12))
      {
        objc_super v40 = (char **)(v18 + 88);
        uint64_t v39 = *((void *)v18 + 11);
        v41 = (char *)*((void *)v18 + 10);
        *((void *)v18 + 10) = v18 + 88;
        *(void *)(v39 + 16) = 0;
        *((void *)v18 + 11) = 0;
        *((void *)v18 + 12) = 0;
        if (*((void *)v41 + 1)) {
          v42 = (char *)*((void *)v41 + 1);
        }
        else {
          v42 = v41;
        }
        v86 = v18 + 80;
        v88 = v42;
        if (v42)
        {
          id v84 = v10;
          v43 = (char *)*((void *)v42 + 2);
          if (v43)
          {
            v44 = *(char **)v43;
            if (*(char **)v43 == v42)
            {
              *(void *)v43 = 0;
              while (1)
              {
                v83 = (char *)*((void *)v43 + 1);
                if (!v83) {
                  break;
                }
                do
                {
                  v43 = v83;
                  v83 = *(char **)v83;
                }
                while (v83);
              }
            }
            else
            {
              for (*((void *)v43 + 1) = 0; v44; v44 = (char *)*((void *)v43 + 1))
              {
                do
                {
                  v43 = v44;
                  v44 = *(char **)v44;
                }
                while (v44);
              }
            }
          }
          v87 = v43;
          if (v36 != v37)
          {
            while (1)
            {
              if (v42 != v36)
              {
                sub_1C499AD9C((uint64_t)(v42 + 32), *((void **)v36 + 4), (void *)v36 + 5);
                sub_1C4A02C90((void **)v42 + 7, *((void *)v36 + 7), *((void *)v36 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v36 + 8) - *((void *)v36 + 7)) >> 3));
                v42 = v88;
              }
              v45 = *v40;
              v46 = (char **)(v18 + 88);
              v47 = (char **)(v18 + 88);
              if (*v40)
              {
                do
                {
                  while (1)
                  {
                    v46 = (char **)v45;
                    v48 = (char *)*((void *)v45 + 4);
                    v49 = v45 + 40;
                    if (v48 == v45 + 40) {
                      break;
                    }
                    v50 = (char *)*((void *)v42 + 4);
                    while (v50 != v42 + 40)
                    {
                      unint64_t v51 = *((void *)v50 + 4);
                      unint64_t v52 = *((void *)v48 + 4);
                      if (v51 < v52) {
                        break;
                      }
                      if (v52 >= v51)
                      {
                        v53 = (char *)*((void *)v50 + 1);
                        v54 = v50;
                        if (v53)
                        {
                          do
                          {
                            v50 = v53;
                            v53 = *(char **)v53;
                          }
                          while (v53);
                        }
                        else
                        {
                          do
                          {
                            v50 = (char *)*((void *)v54 + 2);
                            BOOL v55 = *(void *)v50 == (void)v54;
                            v54 = v50;
                          }
                          while (!v55);
                        }
                        v56 = (char *)*((void *)v48 + 1);
                        if (v56)
                        {
                          do
                          {
                            v57 = v56;
                            v56 = *(char **)v56;
                          }
                          while (v56);
                        }
                        else
                        {
                          do
                          {
                            v57 = (char *)*((void *)v48 + 2);
                            BOOL v55 = *(void *)v57 == (void)v48;
                            v48 = v57;
                          }
                          while (!v55);
                        }
                        v48 = v57;
                        if (v57 != v49) {
                          continue;
                        }
                      }
                      goto LABEL_18;
                    }
                    v45 = *v46;
                    v47 = v46;
                    if (!*v46) {
                      goto LABEL_39;
                    }
                  }
LABEL_18:
                  v45 = v46[1];
                }
                while (v45);
                v47 = v46 + 1;
              }
LABEL_39:
              *(void *)v42 = 0;
              *((void *)v42 + 1) = 0;
              *((void *)v42 + 2) = v46;
              *v47 = v42;
              v58 = (void *)**v35;
              if (v58)
              {
                *unint64_t v35 = v58;
                v42 = *v47;
              }
              sub_1C4949FD4(*((uint64_t **)v18 + 11), (uint64_t *)v42);
              ++*((void *)v18 + 12);
              v42 = v87;
              v88 = v87;
              if (v87)
              {
                v43 = (char *)*((void *)v87 + 2);
                if (v43)
                {
                  v59 = *(char **)v43;
                  if (*(char **)v43 == v87)
                  {
                    *(void *)v43 = 0;
                    while (1)
                    {
                      v62 = (char *)*((void *)v43 + 1);
                      if (!v62) {
                        break;
                      }
                      do
                      {
                        v43 = v62;
                        v62 = *(char **)v62;
                      }
                      while (v62);
                    }
                  }
                  else
                  {
                    for (*((void *)v43 + 1) = 0; v59; v59 = (char *)*((void *)v43 + 1))
                    {
                      do
                      {
                        v43 = v59;
                        v59 = *(char **)v59;
                      }
                      while (v59);
                    }
                  }
                }
                v87 = v43;
                v60 = (char *)*((void *)v36 + 1);
                if (v60)
                {
                  do
                  {
LABEL_50:
                    v61 = v60;
                    v60 = *(char **)v60;
                  }
                  while (v60);
                  goto LABEL_54;
                }
              }
              else
              {
                v43 = 0;
                v60 = (char *)*((void *)v36 + 1);
                if (v60) {
                  goto LABEL_50;
                }
              }
              do
              {
                v61 = (char *)*((void *)v36 + 2);
                BOOL v55 = *(void *)v61 == (void)v36;
                v36 = v61;
              }
              while (!v55);
LABEL_54:
              if (v42)
              {
                v36 = v61;
                if (v61 != v37) {
                  continue;
                }
              }
              v63 = v86;
              sub_1C49EB298((uint64_t)v86, v42);
              if (!v43) {
                goto LABEL_68;
              }
              goto LABEL_65;
            }
          }
          v63 = v18 + 80;
          v61 = v36;
          sub_1C49EB298((uint64_t)(v18 + 80), v42);
          if (!v43) {
            goto LABEL_68;
          }
LABEL_65:
          for (i = (char *)*((void *)v43 + 2); i; i = (char *)*((void *)i + 2))
            v43 = i;
          sub_1C49EB298((uint64_t)v63, v43);
LABEL_68:
          id v10 = v84;
        }
        else
        {
          v61 = v36;
        }
        v36 = v61;
      }
      if (v36 != v37)
      {
        v65 = (uint64_t **)(v18 + 88);
        do
        {
          sub_1C49EB7EC((uint64_t)(v18 + 80), (uint64_t)(v36 + 32), (uint64_t)&v86);
          v66 = v86;
          v67 = *v65;
          v68 = (uint64_t **)(v18 + 88);
          v69 = (uint64_t **)(v18 + 88);
          if (*v65)
          {
            do
            {
              while (1)
              {
                v68 = (uint64_t **)v67;
                v70 = (uint64_t *)v67[4];
                v71 = v67 + 5;
                if (v70 == v67 + 5) {
                  break;
                }
                v72 = (void *)v86[4];
                while (v72 != v86 + 5)
                {
                  unint64_t v73 = v72[4];
                  unint64_t v74 = v70[4];
                  if (v73 < v74) {
                    break;
                  }
                  if (v74 >= v73)
                  {
                    v75 = (void *)v72[1];
                    v76 = v72;
                    if (v75)
                    {
                      do
                      {
                        v72 = v75;
                        v75 = (void *)*v75;
                      }
                      while (v75);
                    }
                    else
                    {
                      do
                      {
                        v72 = (void *)v76[2];
                        BOOL v55 = *v72 == (void)v76;
                        v76 = v72;
                      }
                      while (!v55);
                    }
                    v77 = (uint64_t *)v70[1];
                    if (v77)
                    {
                      do
                      {
                        v78 = v77;
                        v77 = (uint64_t *)*v77;
                      }
                      while (v77);
                    }
                    else
                    {
                      do
                      {
                        v78 = (uint64_t *)v70[2];
                        BOOL v55 = *v78 == (void)v70;
                        v70 = v78;
                      }
                      while (!v55);
                    }
                    v70 = v78;
                    if (v78 != v71) {
                      continue;
                    }
                  }
                  goto LABEL_75;
                }
                v67 = *v68;
                v69 = v68;
                if (!*v68) {
                  goto LABEL_96;
                }
              }
LABEL_75:
              v67 = v68[1];
            }
            while (v67);
            v69 = v68 + 1;
          }
LABEL_96:
          void *v86 = 0;
          v66[1] = 0;
          v66[2] = (uint64_t)v68;
          *v69 = v66;
          v79 = (void *)**v35;
          if (v79)
          {
            *unint64_t v35 = v79;
            v66 = *v69;
          }
          sub_1C4949FD4(*((uint64_t **)v18 + 11), v66);
          ++*((void *)v18 + 12);
          v80 = (char *)*((void *)v36 + 1);
          if (v80)
          {
            do
            {
              v81 = v80;
              v80 = *(char **)v80;
            }
            while (v80);
          }
          else
          {
            do
            {
              v81 = (char *)*((void *)v36 + 2);
              BOOL v55 = *(void *)v81 == (void)v36;
              v36 = v81;
            }
            while (!v55);
          }
          v36 = v81;
        }
        while (v81 != v37);
      }
    }
  }

  return (CHStrokeGroupingResult *)v18;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  v129 = self;
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v132 = a3;
  if (objc_msgSend_count(v132, v3, v4, v5, v6, v7))
  {
    uint64_t v13 = objc_msgSend_strokeGroups(v129, v8, v9, v10, v11, v12);
    uint64_t v19 = objc_msgSend_mutableCopy(v13, v14, v15, v16, v17, v18);

    uint64_t v30 = objc_msgSend_createdStrokeGroups(v129, v20, v21, v22, v23, v24);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_createdStrokeGroups(v129, v25, v26, v27, v28, v29);
      v37 = objc_msgSend_mutableCopy(v31, v32, v33, v34, v35, v36);
    }
    else
    {
      v37 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v25, v26, v27, v28, v29);
    }

    v49 = objc_msgSend_deletedStrokeGroups(v129, v39, v40, v41, v42, v43);
    if (v49)
    {
      v50 = objc_msgSend_deletedStrokeGroups(v129, v44, v45, v46, v47, v48);
      v130 = objc_msgSend_mutableCopy(v50, v51, v52, v53, v54, v55);
    }
    else
    {
      v130 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v44, v45, v46, v47, v48);
    }

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    objc_msgSend_strokeGroups(v129, v56, v57, v58, v59, v60);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v133, (uint64_t)v137, 16, v62);
    if (v68)
    {
      uint64_t v69 = *(void *)v134;
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v134 != v69) {
            objc_enumerationMutation(obj);
          }
          v71 = *(void **)(*((void *)&v133 + 1) + 8 * i);
          v72 = NSNumber;
          uint64_t v73 = objc_msgSend_uniqueIdentifier(v71, v63, v64, v65, v66, v67, v129);
          v78 = objc_msgSend_numberWithInteger_(v72, v74, v73, v75, v76, v77);
          v83 = objc_msgSend_objectForKeyedSubscript_(v132, v79, (uint64_t)v78, v80, v81, v82);

          v89 = objc_msgSend_strategyIdentifier(v71, v84, v85, v86, v87, v88);
          uint64_t v95 = objc_msgSend_classification(v71, v90, v91, v92, v93, v94);
          v99 = objc_msgSend_strokeGroupWithUpdatedStrategyIdentifier_classification_(v83, v96, (uint64_t)v89, v95, v97, v98);

          if (v99)
          {
            objc_msgSend_removeObject_(v19, v100, (uint64_t)v71, v101, v102, v103);
            objc_msgSend_addObject_(v19, v104, (uint64_t)v99, v105, v106, v107);
            if (objc_msgSend_containsObject_(v37, v108, (uint64_t)v71, v109, v110, v111))
            {
              objc_msgSend_removeObject_(v37, v112, (uint64_t)v71, v113, v114, v115);
              objc_msgSend_addObject_(v37, v116, (uint64_t)v99, v117, v118, v119);
            }
            else
            {
              objc_msgSend_addObject_(v130, v112, (uint64_t)v71, v113, v114, v115);
            }
          }
        }
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v133, (uint64_t)v137, 16, v67);
      }
      while (v68);
    }

    v120 = [CHStrokeGroupingResult alloc];
    uint64_t v126 = objc_msgSend_cachedAdjacencies(v129, v121, v122, v123, v124, v125);
    v38 = (CHStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v120, v127, (uint64_t)v19, (uint64_t)v37, (uint64_t)v130, v126);
  }
  else
  {
    v38 = v129;
  }

  return v38;
}

- (id)description
{
  v46.receiver = self;
  v46.super_class = (Class)CHStrokeGroupingResult;
  v3 = [(CHStrokeGroupingResult *)&v46 description];
  uint64_t v9 = objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_createdStrokeGroups(self, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_deletedStrokeGroups(self, v28, v29, v30, v31, v32);
  uint64_t v39 = objc_msgSend_count(v33, v34, v35, v36, v37, v38);
  v44 = objc_msgSend_stringByAppendingFormat_(v3, v40, @" Groups: %ld, created: %ld, deleted: %ld", v41, v42, v43, v15, v27, v39);

  return v44;
}

- (id)strokeGroupsSortedBy:(unint64_t)a3 textGroupsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  switch(a3)
  {
    case 0uLL:
      objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v6, v7, 3, v4, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 1uLL:
      if (!v4)
      {
        sub_1C49FA1D0(v6, 0, v8, v9, v10, v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedTopBottomLeftRight;
      strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedTopBottomLeftRight;
      if (strokeGroupsSortedTopBottomLeftRight) {
        goto LABEL_19;
      }
      uint64_t v16 = sub_1C49FA1D0(v6, (const char *)1, v8, v9, v10, v11);
      goto LABEL_18;
    case 2uLL:
      if (v4)
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_textStrokeGroupsSortedByWritingOrientation;
        strokeGroupsSortedTopBottomLeftRight = v6->_textStrokeGroupsSortedByWritingOrientation;
        if (strokeGroupsSortedTopBottomLeftRight) {
          goto LABEL_19;
        }
        uint64_t v16 = sub_1C49FA450(v6, (const char *)1, v8, v9, v10, v11);
      }
      else
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedByWritingOrientation;
        strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedByWritingOrientation;
        if (strokeGroupsSortedTopBottomLeftRight) {
          goto LABEL_19;
        }
        uint64_t v16 = sub_1C49FA450(v6, 0, v8, v9, v10, v11);
      }
      goto LABEL_18;
    case 3uLL:
      if (v4)
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_textStrokeGroupsSortedByCTLD;
        strokeGroupsSortedTopBottomLeftRight = v6->_textStrokeGroupsSortedByCTLD;
        if (strokeGroupsSortedTopBottomLeftRight) {
          goto LABEL_19;
        }
        uint64_t v16 = sub_1C49FAB3C(v6, 1);
      }
      else
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedByCTLD;
        strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedByCTLD;
        if (strokeGroupsSortedTopBottomLeftRight) {
          goto LABEL_19;
        }
        uint64_t v16 = sub_1C49FAB3C(v6, 0);
      }
LABEL_18:
      uint64_t v17 = *p_strokeGroupsSortedTopBottomLeftRight;
      *p_strokeGroupsSortedTopBottomLeftRight = (void *)v16;

      strokeGroupsSortedTopBottomLeftRight = *p_strokeGroupsSortedTopBottomLeftRight;
LABEL_19:
      id v12 = strokeGroupsSortedTopBottomLeftRight;
LABEL_20:
      uint64_t v13 = v12;
LABEL_21:
      objc_sync_exit(v6);

      return v13;
    default:
      uint64_t v13 = 0;
      goto LABEL_21;
  }
}

- (NSArray)strokeGroupClusters
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_strokeGroupClusters)
  {
    v3 = objc_opt_class();
    uint64_t v7 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v2, v4, 0, 0, v5, v6);
    uint64_t v12 = objc_msgSend_strokeGroupsClusteredByProximity_(v3, v8, (uint64_t)v7, v9, v10, v11);

    strokeGroupClusters = v2->_strokeGroupClusters;
    v2->_strokeGroupClusters = (NSArray *)v12;
  }
  objc_sync_exit(v2);

  uint64_t v14 = v2->_strokeGroupClusters;
  return v14;
}

- (NSArray)textStrokeGroupClusters
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeGroupClusters)
  {
    v3 = objc_alloc_init(CHCTLD);
    uint64_t v9 = objc_msgSend_textStrokeGroups(v2, v4, v5, v6, v7, v8);
    uint64_t v15 = objc_msgSend_allObjects(v9, v10, v11, v12, v13, v14);

    uint64_t v20 = objc_msgSend_strokeGroupRegions_(v3, v16, (uint64_t)v15, v17, v18, v19);

    objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22, v23, v24, v25);
    uint64_t v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v27 = v20;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v49, (uint64_t)v53, 16, v29);
    if (v30)
    {
      uint64_t v31 = *(void *)v50;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v27);
          }
          uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * v32);
          uint64_t v34 = objc_opt_class();
          uint64_t v39 = objc_msgSend_strokeGroupsClusteredByProximity_(v34, v35, v33, v36, v37, v38, (void)v49);
          objc_msgSend_addObjectsFromArray_(v26, v40, (uint64_t)v39, v41, v42, v43);

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v44, (uint64_t)&v49, (uint64_t)v53, 16, v45);
      }
      while (v30);
    }

    textStrokeGroupClusters = v2->_textStrokeGroupClusters;
    v2->_textStrokeGroupClusters = v26;
  }
  objc_sync_exit(v2);

  uint64_t v47 = v2->_textStrokeGroupClusters;
  return v47;
}

- (id)textStrokeGroupClustersAtPosition:(CGPoint)a3 closestAbove:(id *)a4 closestBelow:(id *)a5
{
  double y = a3.y;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v60 = objc_msgSend_textStrokeGroupClusters(self, a2, (uint64_t)a4, (uint64_t)a5, v5, v6, a3.x);
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v60;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v67, (uint64_t)v72, 16, v14);
  if (v17)
  {
    uint64_t v18 = *(void *)v68;
    double v19 = 1.79769313e308;
    uint64_t v20 = (CGFloat *)MEMORY[0x1E4F1DB20];
    double v21 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v68 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        CGFloat x = *v20;
        CGFloat v25 = v20[1];
        CGFloat width = v20[2];
        CGFloat height = v20[3];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v28 = v23;
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v63, (uint64_t)v71, 16, v30);
        if (v36)
        {
          uint64_t v37 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v64 != v37) {
                objc_enumerationMutation(v28);
              }
              objc_msgSend_bounds(*(void **)(*((void *)&v63 + 1) + 8 * j), v31, v32, v33, v34, v35);
              v80.origin.CGFloat x = v39;
              v80.origin.double y = v40;
              v80.size.CGFloat width = v41;
              v80.size.CGFloat height = v42;
              v74.origin.CGFloat x = x;
              v74.origin.double y = v25;
              v74.size.CGFloat width = width;
              v74.size.CGFloat height = height;
              CGRect v75 = CGRectUnion(v74, v80);
              CGFloat x = v75.origin.x;
              CGFloat v25 = v75.origin.y;
              CGFloat width = v75.size.width;
              CGFloat height = v75.size.height;
            }
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v63, (uint64_t)v71, 16, v35);
          }
          while (v36);
        }

        v76.origin.CGFloat x = x;
        v76.origin.double y = v25;
        v76.size.CGFloat width = width;
        v76.size.CGFloat height = height;
        if (CGRectGetMinY(v76) <= y)
        {
          v77.origin.CGFloat x = x;
          v77.origin.double y = v25;
          v77.size.CGFloat width = width;
          v77.size.CGFloat height = height;
          if (CGRectGetMaxY(v77) >= y) {
            objc_msgSend_addObject_(v61, v43, (uint64_t)v28, v44, v45, v46);
          }
        }
        v78.origin.CGFloat x = x;
        v78.origin.double y = v25;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v78);
        v79.origin.CGFloat x = x;
        v79.origin.double y = v25;
        v79.size.CGFloat width = width;
        v79.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v79);
        if (y - MaxY > 0.0 && y - MaxY < v21)
        {
          id v52 = v28;

          uint64_t v16 = v52;
          double v21 = y - MaxY;
        }
        double v53 = MinY - y;
        if (v53 > 0.0 && v53 < v19)
        {
          id v55 = v28;

          uint64_t v15 = v55;
          double v19 = v53;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v67, (uint64_t)v72, 16, v49);
    }
    while (v17);
  }

  if (a4) {
    *a4 = v16;
  }
  if (a5) {
    *a5 = v15;
  }
  id v56 = v61;

  return v56;
}

- (NSSet)textStrokeGroups
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeGroups)
  {
    uint64_t v8 = objc_msgSend_strokeGroups(v2, v3, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_objectsPassingTest_(v8, v9, (uint64_t)&unk_1F2013590, v10, v11, v12);

    textStrokeGroups = v2->_textStrokeGroups;
    v2->_textStrokeGroups = (NSSet *)v13;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_textStrokeGroups;
  return v15;
}

- (NSSet)nontextStrokeGroups
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_nontextStrokeGroups)
  {
    uint64_t v8 = objc_msgSend_strokeGroups(v2, v3, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_objectsPassingTest_(v8, v9, (uint64_t)&unk_1F20135B0, v10, v11, v12);

    nontextStrokeGroups = v2->_nontextStrokeGroups;
    v2->_nontextStrokeGroups = (NSSet *)v13;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_nontextStrokeGroups;
  return v15;
}

- (const)cachedAdjacencies
{
  return &self->_cachedAdjacencies;
}

+ (id)expandedStrokeGroupClusters:(id)a3 allClusters:(id)a4
{
  uint64_t v410 = *MEMORY[0x1E4F143B8];
  id v378 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v370 = v5;
  uint64_t v12 = objc_msgSend_count(v5, v7, v8, v9, v10, v11);
  v375 = objc_msgSend_dictionaryWithCapacity_(v6, v13, v12, v14, v15, v16);
  uint64_t v17 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v23 = objc_msgSend_count(v370, v18, v19, v20, v21, v22);
  v376 = objc_msgSend_dictionaryWithCapacity_(v17, v24, v23, v25, v26, v27);
  id v28 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v34 = objc_msgSend_count(v370, v29, v30, v31, v32, v33);
  v377 = objc_msgSend_dictionaryWithCapacity_(v28, v35, v34, v36, v37, v38);
  long long v403 = 0u;
  long long v404 = 0u;
  long long v401 = 0u;
  long long v402 = 0u;
  id obj = v370;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v401, (uint64_t)v409, 16, v40);
  if (v46)
  {
    uint64_t v47 = *(void *)v402;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v402 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void **)(*((void *)&v401 + 1) + 8 * i);
        long long v50 = objc_msgSend_firstObject(v49, v41, v42, v43, v44, v45);
        objc_msgSend_bounds(v50, v51, v52, v53, v54, v55);
        double rect = v56;
        double x = v57;
        double y = v59;
        double width = v61;

        long long v399 = 0u;
        long long v400 = 0u;
        long long v397 = 0u;
        long long v398 = 0u;
        id v63 = v49;
        uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v397, (uint64_t)v408, 16, v65);
        if (v71)
        {
          uint64_t v72 = *(void *)v398;
          double v73 = 0.0;
          double v74 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v71; ++j)
            {
              if (*(void *)v398 != v72) {
                objc_enumerationMutation(v63);
              }
              CGRect v76 = *(void **)(*((void *)&v397 + 1) + 8 * j);
              objc_msgSend_normalizedSize(v76, v66, v67, v68, v69, v70);
              if (v82 <= 0.0)
              {
                objc_msgSend_bounds(v76, v77, v78, v79, v80, v81);
                double v89 = v90;
              }
              else
              {
                objc_msgSend_normalizedSize(v76, v77, v78, v79, v80, v81);
                double v89 = v88;
              }
              objc_msgSend_bounds(v76, v83, v84, v85, v86, v87);
              double MinY = CGRectGetMinY(v412);
              v413.origin.double x = x;
              v413.origin.double y = y;
              v413.size.double width = width;
              v413.size.CGFloat height = rect;
              double MaxY = CGRectGetMaxY(v413);
              objc_msgSend_bounds(v76, v93, v94, v95, v96, v97);
              v422.origin.double x = v98;
              v422.origin.double y = v99;
              v422.size.double width = v100;
              v422.size.CGFloat height = v101;
              v414.origin.double x = x;
              v414.origin.double y = y;
              v414.size.double width = width;
              v414.size.CGFloat height = rect;
              CGRect v415 = CGRectUnion(v414, v422);
              double rect = v415.size.height;
              double x = v415.origin.x;
              double y = v415.origin.y;
              double width = v415.size.width;
              double v74 = v74 + v89;
              double v73 = v73 + fmax(MinY - MaxY, 0.0);
            }
            uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v397, (uint64_t)v408, 16, v70);
          }
          while (v71);
        }
        else
        {
          double v73 = 0.0;
          double v74 = 0.0;
        }

        double v117 = v74 / (double)(unint64_t)objc_msgSend_count(v63, v102, v103, v104, v105, v106);
        if ((unint64_t)objc_msgSend_count(v63, v107, v108, v109, v110, v111) < 2) {
          double v118 = v117 / 3.0;
        }
        else {
          double v118 = v73 / (double)(unint64_t)(objc_msgSend_count(v63, v112, v113, v114, v115, v116) - 1);
        }
        uint64_t v119 = objc_msgSend_ch_valueWithCGRect_(MEMORY[0x1E4F29238], v112, v113, v114, v115, v116, x, y, width, rect);
        objc_msgSend_setObject_forKeyedSubscript_(v375, v120, (uint64_t)v119, (uint64_t)v63, v121, v122);

        v128 = objc_msgSend_numberWithDouble_(NSNumber, v123, v124, v125, v126, v127, v117);
        objc_msgSend_setObject_forKeyedSubscript_(v376, v129, (uint64_t)v128, (uint64_t)v63, v130, v131);

        v137 = objc_msgSend_numberWithDouble_(NSNumber, v132, v133, v134, v135, v136, v118);
        objc_msgSend_setObject_forKeyedSubscript_(v377, v138, (uint64_t)v137, (uint64_t)v63, v139, v140);
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v401, (uint64_t)v409, 16, v45);
    }
    while (v46);
  }

  v393[0] = MEMORY[0x1E4F143A8];
  v393[1] = 3221225472;
  v393[2] = sub_1C49FC3D0;
  v393[3] = &unk_1E64E2098;
  id v141 = v375;
  id v394 = v141;
  id v367 = v376;
  id v395 = v367;
  id v369 = v377;
  id v396 = v369;
  v372 = (unsigned int (**)(void, void, void))MEMORY[0x1C8786E90](v393);
  recta = objc_msgSend_array(MEMORY[0x1E4F1CA48], v142, v143, v144, v145, v146);
  uint64_t v152 = objc_msgSend_count(obj, v147, v148, v149, v150, v151);
  if (v152 == objc_msgSend_count(v378, v153, v154, v155, v156, v157))
  {
    v163 = 0;
    id v164 = recta;
    recta = objc_msgSend_mutableCopy(v378, v158, v159, v160, v161, v162, v367);
  }
  else
  {
    long long v391 = 0u;
    long long v392 = 0u;
    long long v389 = 0u;
    long long v390 = 0u;
    id v164 = obj;
    v163 = 0;
    uint64_t v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v165, (uint64_t)&v389, (uint64_t)v407, 16, v166, v367);
    if (v171)
    {
      uint64_t v172 = *(void *)v390;
      do
      {
        for (uint64_t k = 0; k != v171; ++k)
        {
          if (*(void *)v390 != v172) {
            objc_enumerationMutation(v164);
          }
          v175 = *(void **)(*((void *)&v389 + 1) + 8 * k);
          if (objc_msgSend_containsObject_(v378, v167, (uint64_t)v175, v168, v169, v170)
            || objc_msgSend_count(recta, v167, v176, v168, v169, v170)
            && ((unsigned int (**)(void, void *, void *))v372)[2](v372, v163, v175))
          {
            objc_msgSend_addObject_(recta, v167, (uint64_t)v175, v168, v169, v170);
            id v174 = v175;

            v163 = v174;
          }
        }
        uint64_t v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v167, (uint64_t)&v389, (uint64_t)v407, 16, v170);
      }
      while (v171);
    }
  }

  uint64_t v182 = objc_msgSend_count(recta, v177, v178, v179, v180, v181);
  if (v182 == objc_msgSend_count(obj, v183, v184, v185, v186, v187))
  {
    id v193 = recta;
  }
  else
  {
    v194 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v188, v189, v190, v191, v192);
    uint64_t v205 = objc_msgSend_count(obj, v195, v196, v197, v198, v199);
    if (v205 - 1 >= 0)
    {
      do
      {
        v206 = objc_msgSend_objectAtIndexedSubscript_(obj, v200, --v205, v202, v203, v204);
        if (objc_msgSend_containsObject_(recta, v207, (uint64_t)v206, v208, v209, v210)
          || objc_msgSend_count(v194, v211, v212, v213, v214, v215)
          && ((unsigned int (**)(void, void *, void *))v372)[2](v372, v206, v163))
        {
          objc_msgSend_addObject_(v194, v211, (uint64_t)v206, v213, v214, v215);
          id v216 = v206;

          v163 = v216;
        }
      }
      while (v205 > 0);
    }
    v217 = objc_msgSend_reverseObjectEnumerator(v194, v200, v201, v202, v203, v204);
    objc_msgSend_allObjects(v217, v218, v219, v220, v221, v222);
    id v193 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGFloat v223 = *MEMORY[0x1E4F1DB20];
  CGFloat v224 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v225 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v385 = 0u;
  long long v386 = 0u;
  long long v387 = 0u;
  long long v388 = 0u;
  id v227 = v193;
  uint64_t v234 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v228, (uint64_t)&v385, (uint64_t)v406, 16, v229);
  if (v234)
  {
    uint64_t v235 = *(void *)v386;
    do
    {
      for (uint64_t m = 0; m != v234; ++m)
      {
        if (*(void *)v386 != v235) {
          objc_enumerationMutation(v227);
        }
        v237 = objc_msgSend_objectForKeyedSubscript_(v141, v230, *(void *)(*((void *)&v385 + 1) + 8 * m), v231, v232, v233);
        objc_msgSend_ch_CGRectValue(v237, v238, v239, v240, v241, v242);
        CGFloat v244 = v243;
        CGFloat v246 = v245;
        CGFloat v248 = v247;
        CGFloat v250 = v249;

        v416.origin.double x = v223;
        v416.origin.double y = v224;
        v416.size.double width = v225;
        v416.size.CGFloat height = height;
        v423.origin.double x = v244;
        v423.origin.double y = v246;
        v423.size.double width = v248;
        v423.size.CGFloat height = v250;
        CGRect v417 = CGRectUnion(v416, v423);
        CGFloat v223 = v417.origin.x;
        CGFloat v224 = v417.origin.y;
        CGFloat v225 = v417.size.width;
        CGFloat height = v417.size.height;
      }
      uint64_t v234 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v230, (uint64_t)&v385, (uint64_t)v406, 16, v233);
    }
    while (v234);
  }

  v256 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v251, v252, v253, v254, v255);
  uint64_t v262 = objc_msgSend_count(v227, v257, v258, v259, v260, v261);
  if (v262 == objc_msgSend_count(obj, v263, v264, v265, v266, v267))
  {
    id v273 = v256;
    v256 = objc_msgSend_mutableCopy(v227, v268, v269, v270, v271, v272);
  }
  else
  {
    long long v383 = 0u;
    long long v384 = 0u;
    long long v381 = 0u;
    long long v382 = 0u;
    id v273 = obj;
    uint64_t v280 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v274, (uint64_t)&v381, (uint64_t)v405, 16, v275);
    if (v280)
    {
      uint64_t v281 = *(void *)v382;
      do
      {
        for (uint64_t n = 0; n != v280; ++n)
        {
          if (*(void *)v382 != v281) {
            objc_enumerationMutation(v273);
          }
          uint64_t v283 = *(void *)(*((void *)&v381 + 1) + 8 * n);
          if (objc_msgSend_containsObject_(v227, v276, v283, v277, v278, v279)) {
            goto LABEL_58;
          }
          v284 = objc_msgSend_objectForKeyedSubscript_(v141, v276, v283, v277, v278, v279);
          objc_msgSend_ch_CGRectValue(v284, v285, v286, v287, v288, v289);
          CGFloat v291 = v290;
          CGFloat v293 = v292;
          double v295 = v294;
          double v297 = v296;

          v418.origin.double x = v223;
          v418.origin.double y = v224;
          v418.size.double width = v225;
          v418.size.CGFloat height = height;
          v424.origin.double x = v291;
          v424.origin.double y = v293;
          v424.size.double width = v295;
          v424.size.CGFloat height = v297;
          CGRect v419 = CGRectIntersection(v418, v424);
          if (v419.size.width * v419.size.height / (v295 * v297 + 1.0e-10) > 0.65) {
LABEL_58:
          }
            objc_msgSend_addObject_(v256, v276, v283, v277, v278, v279);
        }
        uint64_t v280 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v276, (uint64_t)&v381, (uint64_t)v405, 16, v279);
      }
      while (v280);
    }
  }

  if ((unint64_t)objc_msgSend_count(v378, v298, v299, v300, v301, v302) >= 2)
  {
    unint64_t v308 = 0;
    while (v308 < objc_msgSend_count(v256, v303, v304, v305, v306, v307))
    {
      v313 = objc_msgSend_objectAtIndexedSubscript_(v256, v309, v308, v310, v311, v312);
      v318 = objc_msgSend_objectForKeyedSubscript_(v141, v314, (uint64_t)v313, v315, v316, v317);
      objc_msgSend_ch_CGRectValue(v318, v319, v320, v321, v322, v323);
      CGFloat v374 = v324;
      CGFloat v371 = v325;
      double v327 = v326;
      double v329 = v328;

      unint64_t v335 = ++v308;
      while (v335 < objc_msgSend_count(v256, v330, v331, v332, v333, v334))
      {
        v340 = objc_msgSend_objectAtIndexedSubscript_(v256, v336, v335, v337, v338, v339);
        uint64_t v345 = objc_msgSend_objectForKeyedSubscript_(v141, v341, (uint64_t)v340, v342, v343, v344);
        objc_msgSend_ch_CGRectValue((void *)v345, v346, v347, v348, v349, v350);
        double v352 = v351;
        CGFloat v354 = v353;
        double v356 = v355;
        CGFloat v358 = v357;

        v420.origin.double x = v327;
        v420.origin.double y = v374;
        v420.size.double width = v329;
        v420.size.CGFloat height = v371;
        double MaxX = CGRectGetMaxX(v420);
        v421.origin.double x = v352;
        v421.origin.double y = v354;
        v421.size.double width = v356;
        v421.size.CGFloat height = v358;
        double v360 = fmin(MaxX, CGRectGetMaxX(v421)) - fmax(v327, v352);
        LOBYTE(v345) = fmin(v360 / (v329 + 1.0e-10), v360 / (v356 + 1.0e-10)) >= 0.05;

        ++v335;
        if ((v345 & 1) == 0)
        {

          objc_msgSend_removeAllObjects(v256, v361, v362, v363, v364, v365);
          goto LABEL_74;
        }
      }
    }
  }
LABEL_74:

  return v256;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_strokeGroups, @"strokeGroups", v3, v4);
}

- (CHStrokeGroupingResult)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)&v23, 3, v7, v8);
  uint64_t v14 = objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13, v23, v24);
  uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"strokeGroups", v16, v17);

  uint64_t v21 = (CHStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(self, v19, (uint64_t)v18, (uint64_t)v18, 0, v20);
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEquivalentToStrokeGroupingResult:(id)a3
{
  id v4 = (CHStrokeGroupingResult *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {

    return 1;
  }
  else
  {
    strokeGroups = self->_strokeGroups;
    objc_msgSend_strokeGroups(v4, v5, v6, v7, v8, v9);
    uint64_t v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (strokeGroups == v17)
    {
      char isEqual = 1;
    }
    else
    {
      uint64_t v18 = objc_msgSend_strokeGroups(v10, v12, v13, v14, v15, v16);
      char isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_strokeGroups, v20, v21, v22);
    }
    return isEqual;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if (!self)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (!objc_msgSend_isEquivalentToStrokeGroupingResult_(self, v5, (uint64_t)v9, v6, v7, v8))
    {
LABEL_7:
      LOBYTE(self) = 0;
      goto LABEL_16;
    }
    createdStrokeGroups = self->_createdStrokeGroups;
    objc_msgSend_createdStrokeGroups(v9, v10, v11, v12, v13, v14);
    uint64_t v21 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (createdStrokeGroups == v21)
    {
    }
    else
    {
      if (!self->_createdStrokeGroups) {
        goto LABEL_13;
      }
      uint64_t v22 = objc_msgSend_createdStrokeGroups(v9, v16, v17, v18, v19, v20);
      int isEqual = objc_msgSend_isEqual_(v22, v23, (uint64_t)self->_createdStrokeGroups, v24, v25, v26);

      if (!isEqual) {
        goto LABEL_7;
      }
    }
    deletedStrokeGroups = self->_deletedStrokeGroups;
    objc_msgSend_deletedStrokeGroups(v9, v28, v29, v30, v31, v32);
    uint64_t v21 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (deletedStrokeGroups == v21)
    {
      LOBYTE(self) = 1;
      uint64_t v21 = deletedStrokeGroups;
      goto LABEL_15;
    }
    if (self->_deletedStrokeGroups)
    {
      CGFloat v39 = objc_msgSend_deletedStrokeGroups(v9, v34, v35, v36, v37, v38);
      LOBYTE(self) = objc_msgSend_isEqual_(v39, v40, (uint64_t)self->_deletedStrokeGroups, v41, v42, v43);

LABEL_15:
      goto LABEL_16;
    }
LABEL_13:
    LOBYTE(self) = 0;
    goto LABEL_15;
  }
  LOBYTE(self) = 0;
LABEL_17:

  return (char)self;
}

- (NSSet)strokeGroups
{
  return self->_strokeGroups;
}

- (NSSet)createdStrokeGroups
{
  return self->_createdStrokeGroups;
}

- (NSSet)deletedStrokeGroups
{
  return self->_deletedStrokeGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedStrokeGroups, 0);
  objc_storeStrong((id *)&self->_createdStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroups, 0);
  sub_1C49EB298((uint64_t)&self->_cachedAdjacencies, (void *)self->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_nontextStrokeGroups, 0);
  objc_storeStrong((id *)&self->_textStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupClusters, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupClusters, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedByCTLD, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupsSortedByCTLD, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedByWritingOrientation, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupsSortedByWritingOrientation, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedTopBottomLeftRight, 0);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 10) = (char *)self + 88;
  return self;
}

@end