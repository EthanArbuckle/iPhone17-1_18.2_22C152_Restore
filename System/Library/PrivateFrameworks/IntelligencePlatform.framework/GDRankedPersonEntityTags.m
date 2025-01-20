@interface GDRankedPersonEntityTags
- (GDRankedPersonEntityTags)initWithIDValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5;
- (NSArray)scoredPersonEntityTags;
- (int64_t)entityRelevanceInferenceEventId;
- (int64_t)feedbackEventId;
- (int64_t)idValue;
- (void)setScoredPersonEntityTags:(id)a3;
@end

@implementation GDRankedPersonEntityTags

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredPersonEntityTags, 0);

  objc_storeStrong((id *)&self->inner, 0);
}

- (int64_t)entityRelevanceInferenceEventId
{
  return self->_entityRelevanceInferenceEventId;
}

- (void)setScoredPersonEntityTags:(id)a3
{
}

- (int64_t)feedbackEventId
{
  return objc_msgSend_inferenceEventIdValue(self->inner, a2, v2, v3, v4);
}

- (NSArray)scoredPersonEntityTags
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v8 = objc_msgSend_scoredPersonEntityTags(self->inner, v4, v5, v6, v7, 0);
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
        v15 = [GDScoredPersonEntityTagType alloc];
        uint64_t v20 = objc_msgSend_gdTag(v14, v16, v17, v18, v19);
        objc_msgSend_score(v14, v21, v22, v23, v24);
        v28 = objc_msgSend_initWithTag_score_(v15, v25, v20, v26, v27);
        objc_msgSend_addObject_(v3, v29, (uint64_t)v28, v30, v31);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v32, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (int64_t)idValue
{
  return objc_msgSend_idValue(self->inner, a2, v2, v3, v4);
}

- (GDRankedPersonEntityTags)initWithIDValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)GDRankedPersonEntityTags;
  uint64_t v12 = [(GDRankedPersonEntityTags *)&v53 init];
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v14 = objc_msgSend_count(v7, v8, v9, v10, v11);
    uint64_t v18 = objc_msgSend_arrayWithCapacity_(v13, v15, v14, v16, v17);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v48 = v7;
    id v19 = v7;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v49, (uint64_t)v54, 16);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v26 = [GDScoredPersonEntityTagInner alloc];
          uint64_t v31 = objc_msgSend_tag(v25, v27, v28, v29, v30);
          objc_msgSend_score(v25, v32, v33, v34, v35);
          v38 = objc_msgSend_initWithGdTag_score_inferenceEventIdValue_(v26, v36, v31, 0, v37);
          objc_msgSend_addObject_(v18, v39, (uint64_t)v38, v40, v41);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v42, (uint64_t)&v49, (uint64_t)v54, 16);
      }
      while (v22);
    }

    v43 = [GDScoreRankedPersonEntityTagsInner alloc];
    uint64_t v45 = objc_msgSend_initWithIdValue_scoredPersonEntityTags_inferenceEventIdValue_(v43, v44, a3, (uint64_t)v18, 0);
    inner = v12->inner;
    v12->inner = (GDScoreRankedPersonEntityTagsInner *)v45;

    id v7 = v48;
  }

  return v12;
}

@end