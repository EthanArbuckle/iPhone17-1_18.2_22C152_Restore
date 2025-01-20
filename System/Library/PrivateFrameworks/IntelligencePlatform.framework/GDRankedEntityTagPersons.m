@interface GDRankedEntityTagPersons
- (GDRankedEntityTagPersons)initWithTag:(int64_t)a3 scoredEntities:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5;
- (NSArray)scoredEntities;
- (int64_t)feedbackEventId;
- (int64_t)tag;
- (void)setScoredEntities:(id)a3;
@end

@implementation GDRankedEntityTagPersons

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredEntities, 0);

  objc_storeStrong((id *)&self->inner, 0);
}

- (void)setScoredEntities:(id)a3
{
}

- (int64_t)feedbackEventId
{
  return objc_msgSend_inferenceEventIdValue(self->inner, a2, v2, v3, v4);
}

- (NSArray)scoredEntities
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v8 = objc_msgSend_scoredEntities(self->inner, v4, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = [GDScoredPersonEntity alloc];
        uint64_t v20 = objc_msgSend_idValue(v14, v16, v17, v18, v19);
        objc_msgSend_score(v14, v21, v22, v23, v24);
        v28 = objc_msgSend_initWithIDValue_score_(v15, v25, v20, v26, v27);
        objc_msgSend_addObject_(v3, v29, (uint64_t)v28, v30, v31);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v32, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (int64_t)tag
{
  return objc_msgSend_gdTag(self->inner, a2, v2, v3, v4);
}

- (GDRankedEntityTagPersons)initWithTag:(int64_t)a3 scoredEntities:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)GDRankedEntityTagPersons;
  v9 = [(GDRankedEntityTagPersons *)&v46 init];
  if (v9)
  {
    int64_t v40 = a5;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v41 = v8;
    id v11 = v8;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v18 = [GDScoredPersonInner alloc];
          uint64_t v23 = objc_msgSend_idValue(v17, v19, v20, v21, v22);
          objc_msgSend_score(v17, v24, v25, v26, v27);
          uint64_t v30 = objc_msgSend_initWithIdValue_score_inferenceEventIdValue_(v18, v28, v23, 0, v29);
          objc_msgSend_addObject_(v10, v31, (uint64_t)v30, v32, v33);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v34, (uint64_t)&v42, (uint64_t)v47, 16);
      }
      while (v14);
    }

    long long v35 = [GDScoreRankedEntityTagPersonsInner alloc];
    uint64_t v37 = objc_msgSend_initWithGdTag_scoredEntities_inferenceEventIdValue_(v35, v36, a3, (uint64_t)v10, v40);
    inner = v9->inner;
    v9->inner = (GDScoreRankedEntityTagPersonsInner *)v37;

    id v8 = v41;
  }

  return v9;
}

@end