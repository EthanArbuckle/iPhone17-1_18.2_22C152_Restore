@interface LBFBucket
- (LBFBucket)initWithInterval:(id)a3 endTimestamp:(id)a4 index:(unint64_t)a5;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSMutableDictionary)eventTree;
- (id)flattenEvents;
- (unint64_t)bucketIndex;
- (void)setBucketIndex:(unint64_t)a3;
- (void)setEventTree:(id)a3;
@end

@implementation LBFBucket

- (LBFBucket)initWithInterval:(id)a3 endTimestamp:(id)a4 index:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LBFBucket;
  v11 = [(LBFBucket *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startTime, a3);
    objc_storeStrong((id *)&v12->_endTime, a4);
    v12->_bucketIndex = a5;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventTree = v12->_eventTree;
    v12->_eventTree = v13;
  }
  return v12;
}

- (id)flattenEvents
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  objc_msgSend_allKeys(self->_eventTree, v2, v3, v4, v5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v63, (uint64_t)v68, 16);
  if (v57)
  {
    uint64_t v54 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v64 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v11 = objc_msgSend_objectForKey_(self->_eventTree, v7, v58, v8, v9);
        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v17 = objc_msgSend_deploymentEventsHolders(v11, v13, v14, v15, v16);
        v22 = objc_msgSend_allKeys(v17, v18, v19, v20, v21);

        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v59, (uint64_t)v67, 16);
        if (v24)
        {
          uint64_t v29 = v24;
          uint64_t v30 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v60 != v30) {
                objc_enumerationMutation(v22);
              }
              uint64_t v32 = *(void *)(*((void *)&v59 + 1) + 8 * j);
              v33 = objc_msgSend_deploymentEventsHolders(v11, v25, v26, v27, v28);
              v37 = objc_msgSend_objectForKey_(v33, v34, v32, v35, v36);

              v42 = objc_msgSend_getSortedEvents(v37, v38, v39, v40, v41);
              objc_msgSend_setObject_forKey_(v12, v43, (uint64_t)v42, v32, v44);
            }
            uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v59, (uint64_t)v67, 16);
          }
          while (v29);
        }

        objc_msgSend_setObject_forKey_(v56, v45, (uint64_t)v12, v58, v46);
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v63, (uint64_t)v68, 16);
    }
    while (v57);
  }

  v51 = objc_msgSend_copy(v56, v47, v48, v49, v50);
  return v51;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (unint64_t)bucketIndex
{
  return self->_bucketIndex;
}

- (void)setBucketIndex:(unint64_t)a3
{
  self->_bucketIndex = a3;
}

- (NSMutableDictionary)eventTree
{
  return self->_eventTree;
}

- (void)setEventTree:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTree, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end