@interface ATXIntentStream
- (id)_getIntentEventFromBMAppIntent:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6 intentsToKeep:(id)a7;
- (id)_getIntentEventFromLinkActionRecord:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6;
- (id)_unarchiveInteractionFromBMAppIntent:(id)a3;
- (id)_uuidForBMAppIntent:(id)a3 interaction:(id)a4;
- (id)getIntentEventForSourceItemID:(id)a3 forSource:(int64_t)a4;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 INIntentFilter:(id)a8 linkActionFilter:(id)a9;
- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 limit:(unint64_t)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10;
- (unint64_t)numberOfIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (void)_enumerateIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 reversed:(BOOL)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10 block:(id)a11;
@end

@implementation ATXIntentStream

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5
{
  return [(ATXIntentStream *)self getIntentEventsBetweenStartDate:a3 endDate:a4 forSource:a5 bundleIdFilter:0 allowMissingTitles:0];
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7
{
  return [(ATXIntentStream *)self getIntentEventsBetweenStartDate:a3 endDate:a4 forSource:a5 bundleIdFilter:a6 allowMissingTitles:a7 INIntentFilter:0 linkActionFilter:0];
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 INIntentFilter:(id)a8 linkActionFilter:(id)a9
{
  return [(ATXIntentStream *)self getIntentEventsBetweenStartDate:a3 endDate:a4 forSource:a5 bundleIdFilter:a6 allowMissingTitles:a7 limit:100 INIntentFilter:a8 linkActionFilter:a9];
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 limit:(unint64_t)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  id v18 = a9;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __141__ATXIntentStream_getIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_limit_INIntentFilter_linkActionFilter___block_invoke;
  v27[3] = &unk_1E5D07688;
  id v28 = v22;
  unint64_t v29 = a8;
  id v23 = v22;
  [(ATXIntentStream *)self _enumerateIntentEventsBetweenStartDate:v21 endDate:v20 forSource:a5 bundleIdFilter:v19 allowMissingTitles:v11 reversed:1 INIntentFilter:v18 linkActionFilter:v17 block:v27];

  v24 = [v23 reverseObjectEnumerator];
  v25 = [v24 allObjects];

  return v25;
}

BOOL __141__ATXIntentStream_getIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_limit_INIntentFilter_linkActionFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 40);
}

- (unint64_t)numberOfIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ATXIntentStream_numberOfIntentEventsBetweenStartDate_endDate___block_invoke;
  v10[3] = &unk_1E5D076B0;
  v10[4] = &v11;
  [(ATXIntentStream *)self _enumerateIntentEventsBetweenStartDate:v6 endDate:v7 forSource:2 bundleIdFilter:0 allowMissingTitles:0 reversed:0 INIntentFilter:0 linkActionFilter:0 block:v10];
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __64__ATXIntentStream_numberOfIntentEventsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)_enumerateIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 reversed:(BOOL)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10 block:(id)a11
{
  BOOL v11 = a8;
  id v14 = a3;
  id v15 = a4;
  id v43 = a6;
  id v40 = a9;
  id v16 = a10;
  id v42 = a11;
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v17 = objc_alloc_init(MEMORY[0x1E4F72DF0]);
  if (v11) {
    id v18 = v15;
  }
  else {
    id v18 = v14;
  }
  v49 = v15;
  v50 = v14;
  if (v11) {
    id v19 = v14;
  }
  else {
    id v19 = v15;
  }
  v60[0] = 0;
  v47 = v17;
  id v20 = objc_msgSend(v17, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", 0, v18, v19, 0, v11, v60, v40);
  id v21 = v60[0];
  v22 = BiomeLibrary();
  id v23 = [v22 App];
  v24 = [v23 Intent];
  v25 = objc_msgSend(v24, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v18, v19, 0, 0, v11);

  if (v21 || !v20)
  {
    v27 = __atxlog_handle_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream _enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:]();
    }

    id v26 = v25;
  }
  else
  {
    id v26 = [v25 orderedMergeWithOther:v20 comparator:&__block_literal_global_41];
  }
  id v28 = v26;
  unint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
  v30 = +[ATXIntentGlobals sharedInstance];
  v31 = [v30 approvedSiriKitIntents];
  v32 = [v29 setWithArray:v31];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2;
  v57[3] = &unk_1E5D076F8;
  id v33 = v41;
  id v58 = v33;
  id v34 = v16;
  id v59 = v34;
  v35 = [v28 filterWithIsIncluded:v57];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_19;
  v51[3] = &unk_1E5D07720;
  v51[4] = self;
  int64_t v55 = a5;
  id v36 = v43;
  BOOL v56 = a7;
  id v52 = v36;
  id v53 = v32;
  id v37 = v42;
  id v54 = v37;
  id v38 = v32;
  id v39 = (id)[v35 sinkWithCompletion:&__block_literal_global_18_0 shouldContinue:v51];
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  if (!v3) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = *(void *)(a1 + 40);
      if (v4) {
        goto LABEL_4;
      }
LABEL_7:
      uint64_t v5 = 1;
      goto LABEL_12;
    }
    double v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1();
    }

LABEL_11:
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v3);
LABEL_12:

  return v5;
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_15_cold_1(v2);
    }
  }
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v5 = [v3 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) _getIntentEventFromBMAppIntent:v5 source:*(void *)(a1 + 64) bundleIdFilter:*(void *)(a1 + 40) allowMissingTitles:*(unsigned __int8 *)(a1 + 72) intentsToKeep:*(void *)(a1 + 48)];
LABEL_5:
    double v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else {
      uint64_t v8 = 1;
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) _getIntentEventFromLinkActionRecord:v5 source:*(void *)(a1 + 64) bundleIdFilter:*(void *)(a1 + 40) allowMissingTitles:*(unsigned __int8 *)(a1 + 72)];
    goto LABEL_5;
  }
  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1();
  }

  uint64_t v8 = 1;
LABEL_12:

  return v8;
}

- (id)getIntentEventForSourceItemID:(id)a3 forSource:(int64_t)a4
{
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v8 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke;
  v16[3] = &unk_1E5D07748;
  id v17 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke_2;
  v14[3] = &unk_1E5D07770;
  id v9 = v17;
  id v15 = v9;
  double v10 = [(ATXIntentStream *)self getIntentEventsBetweenStartDate:v7 endDate:v8 forSource:a4 bundleIdFilter:0 allowMissingTitles:0 limit:2 INIntentFilter:v16 linkActionFilter:v14];

  if ((unint64_t)[v10 count] >= 2)
  {
    double v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream getIntentEventForSourceItemID:forSource:]();
    }
  }
  double v12 = [v10 firstObject];

  return v12;
}

uint64_t __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 itemID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 executionUUID];
  uint64_t v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)_getIntentEventFromLinkActionRecord:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = [v10 executionUUID];
  if (v12)
  {
    uint64_t v13 = [v10 action];
    if (!v13)
    {
      id v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:]();
      }
      id v37 = 0;
      goto LABEL_50;
    }
    id v14 = [v10 predictions];
    id v15 = [v14 firstObject];

    if (!v15)
    {
      id v39 = __atxlog_handle_default();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:]();
      }
      id v37 = 0;
      goto LABEL_49;
    }
    v49 = v11;
    id v16 = [v15 displayRepresentation];
    id v17 = [v16 title];
    id v18 = objc_msgSend(v17, "atx_efficientLocalizedString");

    if (!a6 && ![v18 length])
    {
      id v38 = __atxlog_handle_default();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.9();
      }
      id v37 = 0;
      id v39 = v18;
      id v11 = v49;
      goto LABEL_48;
    }
    id v19 = [v15 displayRepresentation];
    id v20 = [v19 subtitle];
    uint64_t v48 = objc_msgSend(v20, "atx_efficientLocalizedString");

    id v21 = [v10 bundleIdentifier];
    if ([v21 length])
    {
      int v22 = [v10 source];
      if (v49 && ![v49 isEqualToString:v21])
      {
        id v28 = __atxlog_handle_default();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.8();
          id v37 = 0;
          id v39 = v18;
          id v11 = v49;
LABEL_38:
          id v38 = v48;
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
          goto LABEL_51;
        }
      }
      else
      {
        if (a4)
        {
          if (a4 == 2 || a4 == 1 && v22 != 3) {
            goto LABEL_13;
          }
        }
        else if (v22 == 3)
        {
LABEL_13:
          metadataProvider = self->_metadataProvider;
          if (!metadataProvider)
          {
            v24 = (LNMetadataProvider *)objc_alloc_init(MEMORY[0x1E4F72CE0]);
            v25 = self->_metadataProvider;
            self->_metadataProvider = v24;

            metadataProvider = self->_metadataProvider;
          }
          id v26 = [v13 identifier];
          id v50 = 0;
          uint64_t v27 = [(LNMetadataProvider *)metadataProvider actionForBundleIdentifier:v21 andActionIdentifier:v26 error:&v50];
          id v28 = v50;

          v46 = (void *)v27;
          if (v27)
          {
            v47 = [objc_alloc(MEMORY[0x1E4F302B8]) initWithAppBundleIdentifier:v21 linkAction:v13 linkActionMetadata:v27];
            if (v47)
            {
              id v29 = objc_alloc(MEMORY[0x1E4F28C18]);
              v30 = [v10 executionDate];
              v31 = [v10 executionDate];
              uint64_t v45 = [v29 initWithStartDate:v30 endDate:v31];

              LOBYTE(v43) = 0;
              v32 = [[ATXAction alloc] initWithIntent:v47 actionUUID:v12 bundleId:v21 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v43 title:v18 subtitle:v48];
              id v33 = [v10 predictions];
              id v34 = objc_msgSend(v33, "_pas_mappedArrayWithTransform:", &__block_literal_global_29);
              v44 = v32;
              [(ATXAction *)v32 setPredictableParameterCombinations:v34];

              v35 = [ATXIntentEvent alloc];
              id v36 = [v47 _className];
              id v37 = [(ATXIntentEvent *)v35 initWithBundleId:v21 intentType:v36 dateInterval:v45 action:v32];

              id v38 = v48;
              id v39 = v18;

              id v40 = (void *)v45;
            }
            else
            {
              v41 = __atxlog_handle_default();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.7((uint64_t)v21, v13);
              }
              id v37 = 0;
              id v40 = v41;
              id v39 = v18;
              id v38 = v48;
            }

            id v11 = v49;
          }
          else
          {
            v47 = __atxlog_handle_default();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.6();
            }
            id v37 = 0;
            id v39 = v18;
            id v38 = v48;
            id v11 = v49;
          }

          goto LABEL_47;
        }
        id v28 = __atxlog_handle_default();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.5(v22 == 3, a4, v28);
        }
      }
    }
    else
    {
      id v28 = __atxlog_handle_default();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.4(v13);
      }
    }
    id v37 = 0;
    id v39 = v18;
    id v11 = v49;
    goto LABEL_38;
  }
  uint64_t v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:]();
  }
  id v37 = 0;
LABEL_51:

  return v37;
}

ATXActionPredictableParameters *__96__ATXIntentStream__getIntentEventFromLinkActionRecord_source_bundleIdFilter_allowMissingTitles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 parameterIdentifiers];

  if (v3)
  {
    uint64_t v4 = [ATXActionPredictableParameters alloc];
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v6 = [v2 parameterIdentifiers];
    double v7 = (void *)[v5 initWithArray:v6];
    id v3 = [(ATXActionPredictableParameters *)v4 initWithParameterKeys:v7];
  }

  return v3;
}

- (id)_unarchiveInteractionFromBMAppIntent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = [v3 interaction];
  if (v5)
  {
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
    double v7 = v11;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:]();
      }
    }
  }
  else
  {
    double v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:]();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_uuidForBMAppIntent:(id)a3 interaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 itemID];

  if (!v8
    || (id v9 = objc_alloc(MEMORY[0x1E4F29128]),
        [v6 itemID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)[v9 initWithUUIDString:v10],
        v10,
        !v11))
  {
    if (!v7)
    {
      id v7 = [(ATXIntentStream *)self _unarchiveInteractionFromBMAppIntent:v6];
    }
    double v12 = [v7 identifier];

    if (!v12
      || (id v13 = objc_alloc(MEMORY[0x1E4F29128]),
          [v7 identifier],
          id v14 = objc_claimAutoreleasedReturnValue(),
          id v11 = (void *)[v13 initWithUUIDString:v14],
          v14,
          !v11))
    {
      id v15 = [v7 intent];
      id v11 = [v15 identifier];

      if (v11)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F29128]);
        id v17 = [v7 intent];
        id v18 = [v17 identifier];
        id v11 = (void *)[v16 initWithUUIDString:v18];
      }
    }
  }

  return v11;
}

- (id)_getIntentEventFromBMAppIntent:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6 intentsToKeep:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (![v12 intentType])
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]();
    }
    goto LABEL_7;
  }
  if ([v12 handlingStatus] == 5)
  {
    id v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]();
    }
LABEL_7:
    id v16 = 0;
    goto LABEL_70;
  }
  id v15 = [(ATXIntentStream *)self _unarchiveInteractionFromBMAppIntent:v12];
  if (!v15)
  {
    id v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]();
    }
    id v16 = 0;
    goto LABEL_69;
  }
  id v17 = [(ATXIntentStream *)self _uuidForBMAppIntent:v12 interaction:v15];
  if (!v17)
  {
    id v18 = __atxlog_handle_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.4();
    }
    goto LABEL_18;
  }
  if ([v15 direction] != 2)
  {
    if (!a6)
    {
      id v19 = [v15 intent];
      uint64_t v20 = objc_msgSend(v19, "atx_titleLengthWithoutLocalizing");

      if (!v20)
      {
        id v18 = __atxlog_handle_default();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]2();
        }
        goto LABEL_18;
      }
    }
    id v18 = [v12 intentClass];
    if (v14)
    {
      id v21 = [v15 intent];
      if ([v21 _type] == 2)
      {
      }
      else
      {
        char v22 = [v14 containsObject:v18];

        if ((v22 & 1) == 0)
        {
          v24 = __atxlog_handle_default();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]1();
          }
          id v16 = 0;
          goto LABEL_67;
        }
      }
    }
    id v23 = [v15 intent];
    v24 = [v23 _className];

    if ([v24 isEqualToString:@"INIntent"])
    {
      v25 = __atxlog_handle_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.6();
      }
      id v16 = 0;
      goto LABEL_66;
    }
    v25 = [v12 bundleID];
    if ([v25 length])
    {
      if ([MEMORY[0x1E4F93B08] isInternalBuild]
        && [v25 hasPrefix:@"appshack."])
      {
        uint64_t v26 = -[NSObject substringFromIndex:](v25, "substringFromIndex:", [@"appshack." length]);

        v25 = v26;
      }
      if (!v13 || ([v13 isEqualToString:v25] & 1) != 0)
      {
        os_log_t log = v25;
        int v27 = [v15 _donatedBySiri];
        if (v27 != [v12 donatedBySiri])
        {
          id v28 = __atxlog_handle_default();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.9();
          }
        }
        if (a4)
        {
          if (a4 == 2 || a4 == 1 && (v27 & 1) == 0)
          {
LABEL_43:
            id v50 = v24;
            id v29 = [v15 intent];
            uint64_t v30 = objc_msgSend(v29, "_intents_bundleIdForDisplay");
            v31 = (void *)v30;
            if (v30) {
              v32 = (void *)v30;
            }
            else {
              v32 = log;
            }
            v25 = v32;

            id v33 = [ATXAction alloc];
            id v34 = [v15 intent];
            LOBYTE(v48) = 0;
            uint64_t v35 = [(ATXAction *)v33 initWithIntent:v34 actionUUID:v17 bundleId:v25 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v48 title:0 subtitle:0];

            id v36 = [v15 dateInterval];
            os_log_t loga = (os_log_t)v35;
            if (!v36)
            {
              id v37 = __atxlog_handle_default();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
                -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.8();
              }

              id v38 = objc_alloc(MEMORY[0x1E4F28C18]);
              id v39 = [v12 absoluteTimestamp];
              id v40 = [v12 absoluteTimestamp];
              id v36 = (void *)[v38 initWithStartDate:v39 endDate:v40];

              uint64_t v35 = (uint64_t)loga;
            }
            v41 = [ATXIntentEvent alloc];
            v49 = [v15 intent];
            uint64_t v42 = [v49 _className];
            uint64_t v43 = v35;
            v44 = (void *)v42;
            id v16 = [(ATXIntentEvent *)v41 initWithBundleId:v25 intentType:v42 dateInterval:v36 action:v43];

            v24 = v50;
            uint64_t v45 = loga;
            goto LABEL_65;
          }
        }
        else if (v27)
        {
          goto LABEL_43;
        }
        uint64_t v45 = __atxlog_handle_default();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.7();
        }
        id v16 = 0;
        v25 = log;
        goto LABEL_65;
      }
      uint64_t v45 = __atxlog_handle_default();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:]0();
      }
    }
    else
    {
      uint64_t v45 = __atxlog_handle_default();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        [v15 intent];
        v46 = logb = v45;
        *(_DWORD *)buf = 138412802;
        int64_t v55 = v46;
        __int16 v56 = 2112;
        v57 = v24;
        __int16 v58 = 2048;
        int64_t v59 = a4;
        _os_log_error_impl(&dword_1A790D000, logb, OS_LOG_TYPE_ERROR, "Donation Processing (INIntent) - Rejected: filtered out because there was no bundleId for intent: %@, intentType: %@, intentSource: %lld", buf, 0x20u);

        uint64_t v45 = logb;
      }
    }
    id v16 = 0;
LABEL_65:

LABEL_66:
LABEL_67:

    goto LABEL_68;
  }
  id v18 = __atxlog_handle_default();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.5();
  }
LABEL_18:
  id v16 = 0;
LABEL_68:

LABEL_69:
LABEL_70:

  return v16;
}

- (void).cxx_destruct
{
}

- (void)_enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXIntentStream: could not obtain Link transcript publisher: %@", v2, v3, v4, v5, v6);
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "ATXIntentStream: Unexpected intent event body: %@", v4, v5, v6, v7, v8);
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_15_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)getIntentEventForSourceItemID:forSource:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXIntentStream: querying Biome for specific intent based on source item id %@ returned multiple events.", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Missing UUID", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Missing action", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Action not predictable", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromLinkActionRecord:(void *)a1 source:bundleIdFilter:allowMissingTitles:.cold.4(void *a1)
{
  uint8_t v6 = [a1 mangledTypeName];
  OUTLINED_FUNCTION_6_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);
}

- (void)_getIntentEventFromLinkActionRecord:(NSObject *)a3 source:bundleIdFilter:allowMissingTitles:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  HIDWORD(v3) = a2;
  OUTLINED_FUNCTION_9(&dword_1A790D000, a2, a3, "Donation Processing (Link) - Rejected: filtered out because source: %lld does not match donatedBySiri: %d", v3, HIDWORD(a2));
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Could not obtain Link action metadata: %@", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromLinkActionRecord:(uint64_t)a1 source:(void *)a2 bundleIdFilter:allowMissingTitles:.cold.7(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 identifier];
  OUTLINED_FUNCTION_6_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Rejected: filtered out bundle id %@ that doesn't match %@");
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (Link) - Nil or empty title attached to intent event -- filtering out", v2, v3, v4, v5, v6);
}

- (void)_unarchiveInteractionFromBMAppIntent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Missing interaction data", v2, v3, v4, v5, v6);
}

- (void)_unarchiveInteractionFromBMAppIntent:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Error unarchiving interaction: %@", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Unknown app intent", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Ignoring failed intent", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Error unarchiving interaction", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Unable to obtain UUID for interaction", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Rejected: INInteractionDirectionIncoming", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Rejected: type is INIntent", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Rejected: filtered out because source: %lld does not match _donatedBySiri: %d", v2, v3);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - no date interval; falling back to the date of the Biome event",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Siri donation flags do not match", v2, v3, v4, v5, v6);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Rejected: filtered out bundle ID %@ that doesn't match %@");
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.11()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "Donation Processing (INIntent) - Rejected: not in the intents to keep, %@", v1, 0xCu);
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Donation Processing (INIntent) - Nil or empty title attached to intent event -- filtering out", v2, v3, v4, v5, v6);
}

@end