@interface GDEntityTaggingService
- (GDEntityTaggingService)initWithConfig:(id)a3 error:(id *)a4;
- (id)entitiesForTag:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (id)entitiesForTags:(id)a3 options:(id)a4 error:(id *)a5;
- (id)entityTagsForIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)entityTagsForIdentifiers:(id)a3 options:(id)a4 error:(id *)a5;
- (void)recordDirectFeedbackWithGradedTrue:(id)a3 gradedFalse:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7;
- (void)recordStatefulFeedback:(id)a3 error:(id *)a4;
@end

@implementation GDEntityTaggingService

- (void).cxx_destruct
{
}

- (void)recordStatefulFeedback:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1B2E40594;
  v15 = sub_1B2E405A4;
  id v16 = 0;
  inner = self->inner;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B2E405AC;
  v10[3] = &unk_1E60140A0;
  v10[4] = &v11;
  objc_msgSend_recordStatefulFeedbackWithFeedback_error_(inner, v8, (uint64_t)v6, (uint64_t)v10, v9);
  if (a4) {
    *a4 = (id) v12[5];
  }
  _Block_object_dispose(&v11, 8);
}

- (void)recordDirectFeedbackWithGradedTrue:(id)a3 gradedFalse:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E40594;
  v23 = sub_1B2E405A4;
  id v24 = 0;
  inner = self->inner;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E40714;
  v18[3] = &unk_1E60140A0;
  v18[4] = &v19;
  objc_msgSend_recordDirectFeedbackWithGradedTrue_gradedFalse_ignored_neverPresented_error_(inner, v17, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, v15, v18);
  if (a7) {
    *a7 = (id) v20[5];
  }
  _Block_object_dispose(&v19, 8);
}

- (id)entitiesForTags:(id)a3 options:(id)a4 error:(id *)a5
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    id v86 = v9;
    id v15 = objc_msgSend_tagThresholds(v9, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_initWithTagNameThresholds_(v10, v16, (uint64_t)v15, v17, v18);

    uint64_t v113 = 0;
    v114 = &v113;
    uint64_t v115 = 0x3032000000;
    v116 = sub_1B2E40594;
    v117 = sub_1B2E405A4;
    id v118 = 0;
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x3032000000;
    v110 = sub_1B2E40594;
    v111 = sub_1B2E405A4;
    id v112 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    inner = self->inner;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_1B2E40CF4;
    v103[3] = &unk_1E60136F8;
    v105 = &v113;
    v106 = &v107;
    v22 = v20;
    v104 = v22;
    v87 = (void *)v19;
    objc_msgSend_personEntitiesFor_options_completionHandler_(inner, v23, (uint64_t)v88, v19, (uint64_t)v103);
    id v24 = v22;
    dispatch_time_t v25 = dispatch_time(0, 5000000000);
    intptr_t v26 = dispatch_semaphore_wait(v24, v25);
    v85 = v24;

    if (v26)
    {
      if (a5)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v121 = *MEMORY[0x1E4F28568];
        v122 = @"Timed out waiting for EntityTaggingService to return.";
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v122, (uint64_t)&v121, 1, v85);
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v30, @"GDErrorDomain", 14, (uint64_t)v29);
      }
    }
    else
    {
      if (v114[5])
      {
        id v92 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        obuint64_t j = (id)v114[5];
        uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v99, (uint64_t)v120, 16, v24);
        if (v91)
        {
          uint64_t v90 = *(void *)v100;
          do
          {
            for (uint64_t i = 0; i != v91; ++i)
            {
              if (*(void *)v100 != v90) {
                objc_enumerationMutation(obj);
              }
              uint64_t v39 = *(void *)(*((void *)&v99 + 1) + 8 * i);
              v40 = objc_msgSend_objectForKey_((void *)v114[5], v36, v39, v37, v38);
              uint64_t v93 = v39;
              id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              v46 = objc_msgSend_scoredEntities(v40, v42, v43, v44, v45);
              uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v95, (uint64_t)v119, 16);
              if (v48)
              {
                uint64_t v49 = *(void *)v96;
                do
                {
                  for (uint64_t j = 0; j != v48; ++j)
                  {
                    if (*(void *)v96 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    v51 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                    v52 = [GDScoredPersonEntity alloc];
                    uint64_t v57 = objc_msgSend_idValue(v51, v53, v54, v55, v56);
                    objc_msgSend_score(v51, v58, v59, v60, v61);
                    v65 = objc_msgSend_initWithIDValue_score_(v52, v62, v57, v63, v64);
                    objc_msgSend_addObject_(v41, v66, (uint64_t)v65, v67, v68);
                  }
                  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v69, (uint64_t)&v95, (uint64_t)v119, 16);
                }
                while (v48);
              }

              v70 = [GDRankedEntityTagPersons alloc];
              uint64_t v75 = objc_msgSend_gdTag(v40, v71, v72, v73, v74);
              uint64_t v80 = objc_msgSend_inferenceEventIdValue(v40, v76, v77, v78, v79);
              v82 = objc_msgSend_initWithTag_scoredEntities_entityRelevanceInferenceEventId_(v70, v81, v75, (uint64_t)v41, v80);
              objc_msgSend_setObject_forKeyedSubscript_(v92, v83, (uint64_t)v82, v93, v84);
            }
            uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v99, (uint64_t)v120, 16);
          }
          while (v91);
        }

        goto LABEL_6;
      }
      if (a5)
      {
        id v92 = 0;
        *a5 = (id) v108[5];
        goto LABEL_6;
      }
    }
    id v92 = 0;
LABEL_6:

    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v113, 8);

LABEL_9:
    uint64_t v9 = v86;
    goto LABEL_10;
  }
  if (a5)
  {
    id v86 = v8;
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v123 = *MEMORY[0x1E4F28568];
    v124[0] = @"Error when initializing EntityTaggingService.";
    v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v124, (uint64_t)&v123, 1);
    id v92 = 0;
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v31, v33, @"GDErrorDomain", 1, (uint64_t)v87);
    goto LABEL_9;
  }
  id v92 = 0;
LABEL_10:

  return v92;
}

- (id)entityTagsForIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    id v86 = v9;
    id v15 = objc_msgSend_tagThresholds(v9, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_initWithTagNameThresholds_(v10, v16, (uint64_t)v15, v17, v18);

    uint64_t v113 = 0;
    v114 = &v113;
    uint64_t v115 = 0x3032000000;
    v116 = sub_1B2E40594;
    v117 = sub_1B2E405A4;
    id v118 = 0;
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x3032000000;
    v110 = sub_1B2E40594;
    v111 = sub_1B2E405A4;
    id v112 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    inner = self->inner;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_1B2E41360;
    v103[3] = &unk_1E60136F8;
    v105 = &v113;
    v106 = &v107;
    v22 = v20;
    v104 = v22;
    v87 = (void *)v19;
    objc_msgSend_peopleEntityTagsFor_options_completionHandler_(inner, v23, (uint64_t)v88, v19, (uint64_t)v103);
    id v24 = v22;
    dispatch_time_t v25 = dispatch_time(0, 5000000000);
    intptr_t v26 = dispatch_semaphore_wait(v24, v25);
    v85 = v24;

    if (v26)
    {
      if (a5)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v121 = *MEMORY[0x1E4F28568];
        v122 = @"Timed out waiting for EntityTaggingService to return.";
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v122, (uint64_t)&v121, 1, v85);
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v30, @"GDErrorDomain", 14, (uint64_t)v29);
      }
    }
    else
    {
      if (v114[5])
      {
        id v92 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        obuint64_t j = (id)v114[5];
        uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v99, (uint64_t)v120, 16, v24);
        if (v91)
        {
          uint64_t v90 = *(void *)v100;
          do
          {
            for (uint64_t i = 0; i != v91; ++i)
            {
              if (*(void *)v100 != v90) {
                objc_enumerationMutation(obj);
              }
              uint64_t v39 = *(void *)(*((void *)&v99 + 1) + 8 * i);
              v40 = objc_msgSend_objectForKey_((void *)v114[5], v36, v39, v37, v38);
              uint64_t v93 = v39;
              id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              v46 = objc_msgSend_scoredPersonEntityTags(v40, v42, v43, v44, v45);
              uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v95, (uint64_t)v119, 16);
              if (v48)
              {
                uint64_t v49 = *(void *)v96;
                do
                {
                  for (uint64_t j = 0; j != v48; ++j)
                  {
                    if (*(void *)v96 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    v51 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                    v52 = [GDScoredPersonEntityTagType alloc];
                    uint64_t v57 = objc_msgSend_gdTag(v51, v53, v54, v55, v56);
                    objc_msgSend_score(v51, v58, v59, v60, v61);
                    v65 = objc_msgSend_initWithTag_score_(v52, v62, v57, v63, v64);
                    objc_msgSend_addObject_(v41, v66, (uint64_t)v65, v67, v68);
                  }
                  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v69, (uint64_t)&v95, (uint64_t)v119, 16);
                }
                while (v48);
              }

              v70 = [GDRankedPersonEntityTags alloc];
              uint64_t v75 = objc_msgSend_idValue(v40, v71, v72, v73, v74);
              uint64_t v80 = objc_msgSend_inferenceEventIdValue(v40, v76, v77, v78, v79);
              v82 = objc_msgSend_initWithIDValue_scoredPersonEntityTags_entityRelevanceInferenceEventId_(v70, v81, v75, (uint64_t)v41, v80);
              objc_msgSend_setObject_forKeyedSubscript_(v92, v83, (uint64_t)v82, v93, v84);
            }
            uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v99, (uint64_t)v120, 16);
          }
          while (v91);
        }

        goto LABEL_6;
      }
      if (a5)
      {
        id v92 = 0;
        *a5 = (id) v108[5];
        goto LABEL_6;
      }
    }
    id v92 = 0;
LABEL_6:

    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v113, 8);

LABEL_9:
    uint64_t v9 = v86;
    goto LABEL_10;
  }
  if (a5)
  {
    id v86 = v8;
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v123 = *MEMORY[0x1E4F28568];
    v124[0] = @"Error when initializing EntityTaggingService.";
    v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v124, (uint64_t)&v123, 1);
    id v92 = 0;
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v31, v33, @"GDErrorDomain", 1, (uint64_t)v87);
    goto LABEL_9;
  }
  id v92 = 0;
LABEL_10:

  return v92;
}

- (id)entitiesForTag:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    id v77 = v9;
    id v15 = objc_msgSend_tagThresholds(v9, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_initWithTagNameThresholds_(v10, v16, (uint64_t)v15, v17, v18);

    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x3032000000;
    long long v96 = sub_1B2E40594;
    long long v97 = sub_1B2E405A4;
    id v98 = 0;
    uint64_t v87 = 0;
    id v88 = &v87;
    uint64_t v89 = 0x3032000000;
    uint64_t v90 = sub_1B2E40594;
    uint64_t v91 = sub_1B2E405A4;
    id v92 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    inner = self->inner;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = sub_1B2E418C4;
    v83[3] = &unk_1E60136D0;
    v85 = &v93;
    id v86 = &v87;
    v22 = v20;
    uint64_t v84 = v22;
    uint64_t v78 = (void *)v19;
    objc_msgSend_entitiesForTagWithGdEntityTagType_options_completionHandler_(inner, v23, a3, v19, (uint64_t)v83);
    id v24 = v22;
    dispatch_time_t v25 = dispatch_time(0, 5000000000);
    intptr_t v26 = dispatch_semaphore_wait(v24, v25);

    if (v26)
    {
      if (a5)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v100 = *MEMORY[0x1E4F28568];
        long long v101 = @"Timed out waiting for EntityTaggingService to return.";
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v101, (uint64_t)&v100, 1);
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v30, @"GDErrorDomain", 14, (uint64_t)v29);
      }
    }
    else
    {
      if (v94[5])
      {
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v40 = objc_msgSend_scoredEntities((void *)v94[5], v36, v37, v38, v39);
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v79, (uint64_t)v99, 16);
        if (v42)
        {
          uint64_t v43 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v80 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v46 = [GDScoredPersonEntity alloc];
              uint64_t v51 = objc_msgSend_idValue(v45, v47, v48, v49, v50);
              objc_msgSend_score(v45, v52, v53, v54, v55);
              uint64_t v59 = objc_msgSend_initWithIDValue_score_(v46, v56, v51, v57, v58);
              objc_msgSend_addObject_(v35, v60, (uint64_t)v59, v61, v62);
            }
            uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v63, (uint64_t)&v79, (uint64_t)v99, 16);
          }
          while (v42);
        }

        uint64_t v64 = [GDRankedEntityTagPersons alloc];
        uint64_t v69 = objc_msgSend_gdTag((void *)v94[5], v65, v66, v67, v68);
        uint64_t v74 = objc_msgSend_inferenceEventIdValue((void *)v94[5], v70, v71, v72, v73);
        id v31 = objc_msgSend_initWithTag_scoredEntities_entityRelevanceInferenceEventId_(v64, v75, v69, (uint64_t)v35, v74);

        goto LABEL_20;
      }
      if (a5)
      {
        id v31 = 0;
        *a5 = (id) v88[5];
        goto LABEL_20;
      }
    }
    id v31 = 0;
LABEL_20:

    _Block_object_dispose(&v87, 8);
    _Block_object_dispose(&v93, 8);

    goto LABEL_21;
  }
  if (!a5)
  {
    id v31 = 0;
    goto LABEL_22;
  }
  id v77 = v8;
  id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v102 = *MEMORY[0x1E4F28568];
  v103[0] = @"Error when initializing EntityTaggingService.";
  uint64_t v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v103, (uint64_t)&v102, 1);
  id v31 = 0;
  *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v32, v34, @"GDErrorDomain", 1, (uint64_t)v78);
LABEL_21:

  uint64_t v9 = v77;
LABEL_22:

  return v31;
}

- (id)entityTagsForIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v8 = a4;
  long long v79 = v8;
  if (self->inner)
  {
    uint64_t v9 = v8;
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    id v15 = objc_msgSend_tagThresholds(v9, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_initWithTagNameThresholds_(v10, v16, (uint64_t)v15, v17, v18);

    uint64_t v95 = 0;
    long long v96 = &v95;
    uint64_t v97 = 0x3032000000;
    id v98 = sub_1B2E40594;
    long long v99 = sub_1B2E405A4;
    id v100 = 0;
    uint64_t v89 = 0;
    uint64_t v90 = &v89;
    uint64_t v91 = 0x3032000000;
    id v92 = sub_1B2E40594;
    uint64_t v93 = sub_1B2E405A4;
    id v94 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    inner = self->inner;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = sub_1B2E41E34;
    v85[3] = &unk_1E60136A8;
    uint64_t v87 = &v95;
    id v88 = &v89;
    v22 = v20;
    id v86 = v22;
    id v77 = (void *)v19;
    objc_msgSend_personEntityTagsFor_options_completionHandler_(inner, v23, (uint64_t)v80, v19, (uint64_t)v85);
    id v24 = v22;
    dispatch_time_t v25 = dispatch_time(0, 5000000000);
    intptr_t v26 = dispatch_semaphore_wait(v24, v25);

    if (v26)
    {
      if (a5)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v102 = *MEMORY[0x1E4F28568];
        v103 = @"Timed out waiting for EntityTaggingService to return.";
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v103, (uint64_t)&v102, 1);
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v30, @"GDErrorDomain", 14, (uint64_t)v29);
      }
    }
    else
    {
      if (v96[5])
      {
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v40 = objc_msgSend_scoredPersonEntityTags((void *)v96[5], v36, v37, v38, v39);
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v81, (uint64_t)v101, 16);
        if (v42)
        {
          uint64_t v43 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v82 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              v46 = [GDScoredPersonEntityTagType alloc];
              uint64_t v51 = objc_msgSend_gdTag(v45, v47, v48, v49, v50);
              objc_msgSend_score(v45, v52, v53, v54, v55);
              uint64_t v59 = objc_msgSend_initWithTag_score_(v46, v56, v51, v57, v58);
              objc_msgSend_addObject_(v35, v60, (uint64_t)v59, v61, v62);
            }
            uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v63, (uint64_t)&v81, (uint64_t)v101, 16);
          }
          while (v42);
        }

        uint64_t v64 = [GDRankedPersonEntityTags alloc];
        uint64_t v69 = objc_msgSend_idValue((void *)v96[5], v65, v66, v67, v68);
        uint64_t v74 = objc_msgSend_inferenceEventIdValue((void *)v96[5], v70, v71, v72, v73);
        id v31 = objc_msgSend_initWithIDValue_scoredPersonEntityTags_entityRelevanceInferenceEventId_(v64, v75, v69, (uint64_t)v35, v74);

        goto LABEL_20;
      }
      if (a5)
      {
        id v31 = 0;
        *a5 = (id) v90[5];
LABEL_20:

        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(&v95, 8);

        goto LABEL_22;
      }
    }
    id v31 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v104 = *MEMORY[0x1E4F28568];
    v105[0] = @"Error when initializing EntityTaggingService.";
    uint64_t v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v105, (uint64_t)&v104, 1);
    id v31 = 0;
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v32, v34, @"GDErrorDomain", 1, (uint64_t)v78);
  }
  else
  {
    id v31 = 0;
  }
LABEL_22:

  return v31;
}

- (GDEntityTaggingService)initWithConfig:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)GDEntityTaggingService;
  v5 = [(GDEntityTaggingService *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc_init(GDEntityTagConfigurationInner);
    v7 = [GDEntityTaggingServiceInner alloc];
    uint64_t v10 = objc_msgSend_initWithEtConfig_error_(v7, v8, (uint64_t)v6, (uint64_t)a4, v9);
    inner = v5->inner;
    v5->inner = (GDEntityTaggingServiceInner *)v10;
  }
  return v5;
}

@end