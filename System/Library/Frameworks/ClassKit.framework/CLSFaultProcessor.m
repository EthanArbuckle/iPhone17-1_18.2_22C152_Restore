@interface CLSFaultProcessor
+ (id)rootClasses;
- (BOOL)_isRootObject:(id)a3;
- (BOOL)_isRootObject:(id)a3 withRelation:(id)a4;
- (BOOL)waitUntilDone:(double)a3;
- (CLSFaultProcessor)initWithDelegate:(id)a3;
- (CLSFaultProcessorDelegate)delegate;
- (id)_childParentRelationForObject:(id)a3;
- (void)_addObject:(id)a3;
- (void)_descendIntoObject:(id)a3 idsToProcess:(id)a4 enumerationBlock:(id)a5;
- (void)_faultObjectsBatch:(id)a3;
- (void)_inGroup:(id)a3;
- (void)_insertRootObject:(id)a3;
- (void)_insertRootObjectID:(id)a3 withChildren:(id)a4;
- (void)clientRemote_deliverObject:(id)a3;
- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4;
- (void)completionNotify:(id)a3;
- (void)enumerate:(id)a3;
- (void)faultObject:(id)a3;
- (void)faultObjects:(id)a3;
@end

@implementation CLSFaultProcessor

+ (id)rootClasses
{
  if (qword_1EB5D4B28 != -1) {
    dispatch_once(&qword_1EB5D4B28, &unk_1F37A1630);
  }
  v2 = (void *)qword_1EB5D4B30;

  return v2;
}

- (CLSFaultProcessor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSFaultProcessor;
  v5 = [(CLSFaultProcessor *)&v29 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = CLSDispatchQueueName(v6, 0);
    v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_1EB5D4B40 != -1) {
      dispatch_once(&qword_1EB5D4B40, &unk_1F37A0DF0);
    }
    v12 = (id)qword_1EB5D4B38;
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2(v10, v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    group = v6->_group;
    v6->_group = (OS_dispatch_group *)v15;

    uint64_t v18 = objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E4F28E10], v17, 0, 0);
    objects = v6->_objects;
    v6->_objects = (NSMapTable *)v18;

    uint64_t v21 = objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E4F28E10], v20, 0, 0);
    relations = v6->_relations;
    v6->_relations = (NSMapTable *)v21;

    uint64_t v24 = objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E4F28E10], v23, 0, 0);
    objectsIdsByParentID = v6->_objectsIdsByParentID;
    v6->_objectsIdsByParentID = (NSMapTable *)v24;

    uint64_t v26 = objc_opt_new();
    rootObjectIDs = v6->_rootObjectIDs;
    v6->_rootObjectIDs = (NSMutableOrderedSet *)v26;
  }
  return v6;
}

- (void)faultObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v7 = objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v9, 1);

  objc_msgSend_faultObjects_(self, v8, (uint64_t)v7, v9, v10);
}

- (void)faultObjects:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DC665660;
  v7[3] = &unk_1E6C97078;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);
}

- (void)enumerate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = objc_opt_new();
  id v8 = objc_msgSend_keyEnumerator(self->_objects, v6, v7);
  v11 = objc_msgSend_allObjects(v8, v9, v10);
  objc_msgSend_addObjectsFromArray_(v5, v12, (uint64_t)v11);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  dispatch_queue_t v13 = self->_rootObjectIDs;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, v45, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E01A0360]();
        v23 = objc_msgSend_objectForKey_(self->_objects, v21, v19);
        if (v23) {
          objc_msgSend__descendIntoObject_idsToProcess_enumerationBlock_(self, v22, (uint64_t)v23, v5, v4);
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v40, v45, 16);
    }
    while (v16);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v25 = v5;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v36, v44, 16);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8 * v30);
        v32 = (void *)MEMORY[0x1E01A0360](v27);
        v34 = objc_msgSend_objectForKey_(self->_objects, v33, v31, (void)v36);
        if (v34) {
          v4[2](v4, v34);
        }

        ++v30;
      }
      while (v28 != v30);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v35, (uint64_t)&v36, v44, 16);
      uint64_t v28 = v27;
    }
    while (v27);
  }
}

- (void)_descendIntoObject:(id)a3 idsToProcess:(id)a4 enumerationBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  uint64_t v13 = objc_msgSend_identity(v8, v11, v12);
  uint64_t v16 = objc_msgSend_identity(v8, v14, v15);
  objc_msgSend_removeObject_(v9, v17, (uint64_t)v16);

  v10[2](v10, v8);
  uint64_t v31 = (void *)v13;
  objc_msgSend_objectForKey_(self->_objectsIdsByParentID, v18, v13);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v32, v36, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * v24);
        uint64_t v26 = (void *)MEMORY[0x1E01A0360]();
        uint64_t v29 = objc_msgSend_objectForKey_(self->_objects, v27, v25);
        if (v29) {
          objc_msgSend__descendIntoObject_idsToProcess_enumerationBlock_(self, v28, (uint64_t)v29, v9, v10);
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v30, (uint64_t)&v32, v36, 16);
    }
    while (v22);
  }
}

- (void)completionNotify:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DC665B18;
  v7[3] = &unk_1E6C970A0;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);
}

- (BOOL)waitUntilDone:(double)a3
{
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F37A0BB0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC665C08;
  v10[3] = &unk_1E6C95B58;
  id v11 = v5;
  id v6 = v5;
  objc_msgSend_completionNotify_(self, v7, (uint64_t)v10);
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  LOBYTE(self) = dispatch_block_wait(v6, v8) != 0;

  return (char)self;
}

- (void)_faultObjectsBatch:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v94 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = v3;
  uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v115, v122, 16);
  if (v89)
  {
    uint64_t v88 = *(void *)v116;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v116 != v88)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v91 = v5;
        uint64_t v7 = *(void **)(*((void *)&v115 + 1) + 8 * v5);
        dispatch_time_t v8 = objc_opt_class();
        if (!objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_1F37B96C0)) {
          goto LABEL_39;
        }
        id v92 = v7;
        v90 = objc_msgSend_identity(v92, v11, v12);
        v14 = objc_msgSend_objectForKey_(self->_objects, v13, (uint64_t)v90);
        BOOL v15 = v14 == 0;

        if (!v15) {
          goto LABEL_38;
        }
        objc_msgSend__addObject_(self, v16, (uint64_t)v92);
        id v19 = objc_msgSend_relations(v8, v17, v18);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v93 = v19;
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v20, (uint64_t)&v111, v121, 16);
        if (!v97) {
          goto LABEL_37;
        }
        uint64_t v96 = *(void *)v112;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v112 != v96) {
              objc_enumerationMutation(v93);
            }
            uint64_t v22 = *(void **)(*((void *)&v111 + 1) + 8 * i);
            uint64_t v23 = (void *)MEMORY[0x1E01A0360]();
            if (objc_msgSend_isFaultable(v22, v24, v25))
            {
              v98 = objc_msgSend_fromKey(v22, v26, v27);
              uint64_t v30 = objc_msgSend_valueForKey_(v92, v28, (uint64_t)v98);
              if (v30)
              {
                uint64_t v31 = objc_msgSend_objectForKey_(self->_relations, v29, (uint64_t)v30);
                if (!v31)
                {
                  uint64_t v31 = objc_opt_new();
                  objc_msgSend_setObject_forKey_(self->_relations, v32, (uint64_t)v31, v30);
                }
                long long v109 = 0u;
                long long v110 = 0u;
                long long v107 = 0u;
                long long v108 = 0u;
                id v33 = v31;
                uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v107, v120, 16);
                if (v36)
                {
                  char v37 = 0;
                  uint64_t v38 = *(void *)v108;
                  do
                  {
                    for (uint64_t j = 0; j != v36; ++j)
                    {
                      if (*(void *)v108 != v38) {
                        objc_enumerationMutation(v33);
                      }
                      long long v40 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                      if ((objc_msgSend_isInverseOfRelation_(v40, v35, (uint64_t)v22) & 1) != 0
                        || objc_msgSend_isEquivalentToRelation_(v40, v35, (uint64_t)v22))
                      {
                        char v37 = 1;
                      }
                    }
                    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v107, v120, 16);
                  }
                  while (v36);

                  if (v37)
                  {
LABEL_33:

                    goto LABEL_34;
                  }
                }
                else
                {
                }
                objc_msgSend_addObject_(v33, v41, (uint64_t)v22);
                v44 = (objc_class *)objc_msgSend_toEntity(v22, v42, v43);
                v45 = NSStringFromClass(v44);
                v47 = objc_msgSend_valueForKey_(v94, v46, (uint64_t)v45);
                BOOL v48 = v47 == 0;

                if (v48)
                {
                  v50 = objc_opt_new();
                  objc_msgSend_setValue_forKey_(v94, v51, (uint64_t)v50, v45);

                  v53 = objc_msgSend_objectForKeyedSubscript_(v94, v52, (uint64_t)v45);
                  v56 = objc_msgSend_toKey(v22, v54, v55);
                  objc_msgSend_addObject_(v53, v57, (uint64_t)v56);
                }
                v58 = objc_msgSend_objectForKeyedSubscript_(v94, v49, (uint64_t)v45);
                objc_msgSend_addObject_(v58, v59, (uint64_t)v30);

                goto LABEL_33;
              }
LABEL_34:
            }
          }
          uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v60, (uint64_t)&v111, v121, 16);
        }
        while (v97);
LABEL_37:

LABEL_38:
LABEL_39:
        uint64_t v5 = v91 + 1;
      }
      while (v91 + 1 != v89);
      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v115, v122, 16);
    }
    while (v89);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v61 = v94;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v103, v119, 16);
  if (v64)
  {
    uint64_t v99 = *(void *)v104;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v104 != v99) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = *(void *)(*((void *)&v103 + 1) + 8 * k);
        v67 = objc_msgSend_objectForKeyedSubscript_(v61, v63, v66);
        v70 = objc_msgSend_firstObject(v67, v68, v69);

        v72 = objc_msgSend_objectForKeyedSubscript_(v61, v71, v66);
        objc_msgSend_removeObjectAtIndex_(v72, v73, 0);

        v74 = (void *)MEMORY[0x1E4F28F60];
        v76 = objc_msgSend_objectForKeyedSubscript_(v61, v75, v66);
        v78 = objc_msgSend_predicateWithFormat_(v74, v77, @"%K IN %@", v70, v76);

        dispatch_group_enter((dispatch_group_t)self->_group);
        objc_initWeak(&location, self);
        v81 = objc_msgSend_delegate(self, v79, v80);
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = sub_1DC6662D0;
        v100[3] = &unk_1E6C96FA0;
        objc_copyWeak(&v101, &location);
        v83 = objc_msgSend_dataServer_(v81, v82, (uint64_t)v100);

        v85 = objc_msgSend_querySpecificationWithObjectName_predicate_(CLSQuerySpecification, v84, v66, v78);
        objc_msgSend_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_(v83, v86, (uint64_t)self, v85, 0, 1, &unk_1F37A0CF0);

        objc_destroyWeak(&v101);
        objc_destroyWeak(&location);
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v63, (uint64_t)&v103, v119, 16);
    }
    while (v64);
  }
}

- (void)_addObject:(id)a3
{
  id v21 = a3;
  uint64_t v5 = objc_msgSend__childParentRelationForObject_(self, v4, (uint64_t)v21);
  int isRootObject_withRelation = objc_msgSend__isRootObject_withRelation_(self, v6, (uint64_t)v21, v5);
  uint64_t v10 = objc_msgSend_identity(v21, v8, v9);
  objc_msgSend_setObject_forKey_(self->_objects, v11, (uint64_t)v21, v10);
  if (isRootObject_withRelation)
  {
    objc_msgSend__insertRootObject_(self, v12, (uint64_t)v21);
  }
  else
  {
    v14 = objc_msgSend_fromKey(v5, v12, v13);
    uint64_t v16 = objc_msgSend_valueForKey_(v21, v15, (uint64_t)v14);

    id v19 = objc_msgSend_objectForKey_(self->_objectsIdsByParentID, v17, (uint64_t)v16);
    if (!v19)
    {
      id v19 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_objectsIdsByParentID, v20, (uint64_t)v19, v16);
    }
    objc_msgSend_addObject_(v19, v18, (uint64_t)v10);
  }
}

- (void)_insertRootObject:(id)a3
{
  id v20 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_identity(v20, v5, v6);
  uint64_t v10 = objc_msgSend_rootClasses(CLSFaultProcessor, v8, v9);
  uint64_t v11 = objc_opt_class();
  int v13 = objc_msgSend_containsObject_(v10, v12, v11);

  if (v13)
  {
    uint64_t v16 = objc_msgSend_objectForKey_(v4->_objectsIdsByParentID, v14, (uint64_t)v7);
    if (v16) {
      objc_msgSend__insertRootObjectID_withChildren_(v4, v15, (uint64_t)v7, v16);
    }
    else {
      objc_msgSend_addObject_(v4->_rootObjectIDs, v15, (uint64_t)v7);
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    rootObjectIDs = v4->_rootObjectIDs;
    if (isKindOfClass) {
      objc_msgSend_insertObject_atIndex_(rootObjectIDs, v17, (uint64_t)v7, 0);
    }
    else {
      objc_msgSend_addObject_(rootObjectIDs, v17, (uint64_t)v7);
    }
  }

  objc_sync_exit(v4);
}

- (void)_insertRootObjectID:(id)a3 withChildren:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  dispatch_time_t v8 = self->_rootObjectIDs;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, v25, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      uint64_t v15 = 0;
      unint64_t v16 = v12 + v13;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend_containsObject_(v7, v11, *(void *)(*((void *)&v21 + 1) + 8 * v15), (void)v21))
        {
          unint64_t v16 = v13 + v15;
          goto LABEL_12;
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v21, v25, 16);
      unint64_t v13 = v16;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
LABEL_12:

  uint64_t v19 = objc_msgSend_count(self->_rootObjectIDs, v17, v18);
  if (v16 >= v19 - 1) {
    objc_msgSend_insertObject_atIndex_(self->_rootObjectIDs, v20, (uint64_t)v6, v19 - 1, (void)v21);
  }
  else {
    objc_msgSend_insertObject_atIndex_(self->_rootObjectIDs, v20, (uint64_t)v6, v16, (void)v21);
  }
}

- (BOOL)_isRootObject:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend__childParentRelationForObject_(self, v5, (uint64_t)v4);
  LOBYTE(self) = objc_msgSend__isRootObject_withRelation_(self, v7, (uint64_t)v4, v6);

  return (char)self;
}

- (BOOL)_isRootObject:(id)a3 withRelation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_rootClasses(CLSFaultProcessor, v7, v8);
  uint64_t v10 = objc_opt_class();
  char v12 = objc_msgSend_containsObject_(v9, v11, v10);

  if (v6)
  {
    uint64_t v15 = objc_msgSend_fromKey(v6, v13, v14);
    uint64_t v17 = objc_msgSend_valueForKey_(v5, v16, (uint64_t)v15);

    if (!v17) {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (id)_childParentRelationForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_opt_class();
  id v6 = objc_msgSend_relations(v3, v4, v5, 0);
  id v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v18, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v14, v18, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_inGroup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  p_queue = &self->_queue;
  queue = self->_queue;
  id v6 = p_queue[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC6669F8;
  block[3] = &unk_1E6C96FC8;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_group_async(v6, queue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)clientRemote_deliverObject:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DC666AF0;
  v7[3] = &unk_1E6C97078;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);
}

- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4
{
}

- (CLSFaultProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLSFaultProcessorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootObjectIDs, 0);
  objc_storeStrong((id *)&self->_objectsIdsByParentID, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end