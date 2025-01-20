@interface ATXActionCacheReader
+ (unordered_map<NSString)getActionKeyToPredictionItemMapFromChunk:()ATXNSStringHash;
+ (void)_getActionKeyToPredictionItemMapFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6;
+ (void)_getExtraPredictionsFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6;
+ (void)_getIndexToPredictionItemMapWithChunk:(id)a3 withPredictionCount:(int64_t)a4 map:(void *)a5 abGroup:(id *)a6 assetVersion:(int64_t *)a7;
- (ATXActionCacheReader)initWithChunks:(id)a3;
- (ATXActionCacheReader)initWithData:(id)a3;
- (ATXPredictionItem)predictionItemForAction:(SEL)a3;
- (NSString)abGroup;
- (id).cxx_construct;
- (int64_t)assetVersion;
- (unordered_map<ATXAction)_getActionToIndexMap;
- (void)enumerateActionsAndPredictionItemsForConsumerSubtype:(unsigned __int8)a3 limit:(unint64_t)a4 block:(id)a5;
- (void)enumerateExtraPredictionItemsWithBlock:(id)a3;
- (void)failAndLog:(id)a3;
@end

@implementation ATXActionCacheReader

- (ATXActionCacheReader)initWithChunks:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXActionCacheReader;
  v5 = [(ATXActionCacheClientReader *)&v12 initWithChunks:v4];
  if (v5)
  {
    uint64_t v6 = [v4 count];
    if (v6 == [(ATXActionCacheClientReader *)v5 chunkCount])
    {
      v7 = (void *)MEMORY[0x1D25F6CC0]();
      [(ATXActionCacheReader *)v5 _getActionToIndexMap];
      std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::__move_assign((uint64_t)&v5->_actionToIndexMap, buf);
      std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)buf);
      v8 = [v4 objectAtIndexedSubscript:2];
      +[ATXActionCacheReader _getIndexToPredictionItemMapWithChunk:v8 withPredictionCount:v5->_actionToIndexMap.__table_.__p2_.__value_ map:&v5->_predictionItems abGroup:&v5->_abGroup assetVersion:&v5->_assetVersion];

      v9 = [v4 objectAtIndexedSubscript:3];
      +[ATXActionCacheReader _getExtraPredictionsFromChunk:v9 map:&v5->_extraPredictionItems abGroup:0 assetVersion:0];
    }
    else
    {
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXActionCacheReader initWithChunks:]((uint8_t *)buf, [v4 count], -[ATXActionCacheClientReader chunkCount](v5, "chunkCount"), v10);
      }
    }
  }

  return v5;
}

- (ATXActionCacheReader)initWithData:(id)a3
{
  id v4 = ATXCacheFileSplitChunks();
  v5 = [(ATXActionCacheReader *)self initWithChunks:v4];

  return v5;
}

- (ATXPredictionItem)predictionItemForAction:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::find<ATXAction * {__strong}>(&self->_actionToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v16);
  if (v6)
  {
    unint64_t v7 = *((int *)v6 + 6);
    begin = self->_predictionItems.__begin_;
    if (0xDAB7EC1DD3431B57 * (((char *)self->_predictionItems.__end_ - (char *)begin) >> 5) <= v7)
    {
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        objc_super v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        [(ATXActionCacheReader *)v13 predictionItemForAction:v11];
      }

      retstr->key = 0;
      retstr->score = -31337.0;
      *(_WORD *)&retstr->isMediumConfidenceForBlendingLayer = 0;
      for (uint64_t i = 16; i != 3284; i += 4)
        *(float *)((char *)&retstr->key + i) = -31337.0;
    }
    else
    {
      p_key = (id *)&begin[(int)v7].key;
      retstr->key = (NSString *)*p_key;
      memcpy(&retstr->actionHash, p_key + 1, 0xCD2uLL);
    }
  }
  else
  {
    [(ATXActionCacheReader *)self failAndLog:v16];
    retstr->key = 0;
    retstr->score = -31337.0;
    *(_WORD *)&retstr->isMediumConfidenceForBlendingLayer = 0;
    for (uint64_t j = 16; j != 3284; j += 4)
      *(float *)((char *)&retstr->key + j) = -31337.0;
  }

  return result;
}

- (void)failAndLog:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v46 = v4;
  if ([v4 isEqualToAction:v4]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v39 = v5;
  uint64_t v6 = [v4 hash];
  if (v6 == [v4 hash]) {
    unint64_t v7 = @"YES";
  }
  else {
    unint64_t v7 = @"NO";
  }
  v40 = v7;
  v41 = [v4 bundleId];
  v8 = [v4 intent];
  uint64_t v9 = [v8 _className];
  v10 = (void *)v9;
  v11 = @"No intent name";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v42 = v11;

  objc_super v12 = [v4 userActivity];
  uint64_t v13 = [v12 activityType];
  uint64_t v14 = (void *)v13;
  v15 = @"No activity type";
  if (v13) {
    v15 = (__CFString *)v13;
  }
  v43 = v15;

  next = self->_actionToIndexMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v17 = @"NO";
    do
    {
      if (!next[2]) {
        v17 = @"YES";
      }
      next = (void *)*next;
    }
    while (next);
  }
  else
  {
    v17 = @"NO";
  }
  unint64_t value = self->_actionToIndexMap.__table_.__p2_.__value_;
  uint64_t v18 = [(ATXActionCacheClientReader *)self actionsWithConsumerSubType:22 limit:0x7FFFFFFFLL];
  uint64_t v37 = [v18 count];

  v19 = [(ATXActionCacheClientReader *)self actionsWithLimit:0x7FFFFFFFLL shouldFilterRestrictedAppsAndRecentEngagements:1];
  uint64_t v36 = [v19 count];

  v20 = [(ATXActionCacheClientReader *)self actionsWithLimit:0x7FFFFFFFLL shouldFilterRestrictedAppsAndRecentEngagements:0];
  uint64_t v35 = [v20 count];

  for (uint64_t i = self->_actionToIndexMap.__table_.__p1_.__value_.__next_; i; uint64_t i = *(void **)i)
  {
    v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = *((_DWORD *)i + 6);
      v45 = [*((id *)i + 2) bundleId];
      v44 = [v4 intent];
      uint64_t v24 = [v44 _className];
      v25 = (void *)v24;
      if (v24) {
        v26 = (__CFString *)v24;
      }
      else {
        v26 = @"No intent name";
      }
      v27 = objc_msgSend(v4, "userActivity", v35);
      uint64_t v28 = [v27 activityType];
      v29 = (void *)v28;
      if (v28) {
        v30 = (__CFString *)v28;
      }
      else {
        v30 = @"No activity type";
      }
      int v31 = [*((id *)i + 2) isEqual:v46];
      uint64_t v32 = [*((id *)i + 2) hash];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v48 = v23;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v45;
      *(_WORD *)&v48[14] = 2112;
      *(void *)&v48[16] = v26;
      *(_WORD *)&v48[24] = 2112;
      *(void *)&v48[26] = v30;
      *(_WORD *)&v48[34] = 1024;
      *(_DWORD *)&v48[36] = v31;
      *(_WORD *)v49 = 2048;
      *(void *)&v49[2] = v32;
      _os_log_error_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_ERROR, "Action %d in _actionToIndexMap: bundleID: %@, Intent name: %@, activity type: %@, equal to action: %{BOOL}d, hash: %lu", buf, 0x36u);

      id v4 = v46;
    }
  }
  v33 = __atxlog_handle_default();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
    uint64_t v34 = [v4 hash];
    *(_DWORD *)buf = 138414850;
    *(void *)v48 = v39;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v40;
    *(_WORD *)&v48[18] = 2112;
    *(void *)&v48[20] = v41;
    *(_WORD *)&v48[28] = 2112;
    *(void *)&v48[30] = v42;
    *(_WORD *)&v48[38] = 2112;
    *(void *)v49 = v43;
    *(_WORD *)&v49[8] = 2048;
    uint64_t v50 = v34;
    __int16 v51 = 2048;
    unint64_t v52 = value;
    __int16 v53 = 2112;
    v54 = v17;
    __int16 v55 = 2048;
    uint64_t v56 = v37;
    __int16 v57 = 2048;
    uint64_t v58 = v36;
    __int16 v59 = 2048;
    uint64_t v60 = v35;
    _os_log_fault_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_FAULT, "Failed to find action in _secondStage. Self-equality, hash-equality: %@, %@, bundleID: %@, Intent name: %@, activity type: %@, hash: %lu, map items: %lu, nil in map: %@. lock, filtered, unfiltered: %lu %lu %lu", buf, 0x70u);
  }
}

- (void)enumerateExtraPredictionItemsWithBlock:(id)a3
{
  uint64_t v9 = (void (**)(id, ATXPredictionItem *))a3;
  p_extraPredictionItems = &self->_extraPredictionItems;
  begin = self->_extraPredictionItems.__begin_;
  end = p_extraPredictionItems->__end_;
  if (begin != end)
  {
    unint64_t v7 = v9;
    do
    {
      v8 = (void *)MEMORY[0x1D25F6CC0](v7);
      v9[2](v9, begin);
      ++begin;
    }
    while (begin != end);
  }
}

- (void)enumerateActionsAndPredictionItemsForConsumerSubtype:(unsigned __int8)a3 limit:(unint64_t)a4 block:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  if (v6 == 22)
  {
    uint64_t v9 = [(ATXActionCacheClientReader *)self actionsWithLimit:a4 shouldFilterRestrictedAppsAndRecentEngagements:0];
    v10 = [(ATXActionCacheClientReader *)self lockscreenPredictionIndicesUpToLimit:a4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke;
    v15[3] = &unk_1E68B0998;
    id v11 = v9;
    id v16 = v11;
    v17 = self;
    id v18 = v8;
    [v10 enumerateIndexesUsingBlock:v15];
  }
  else
  {
    id v11 = [(ATXActionCacheClientReader *)self actionsWithConsumerSubType:v6 limit:a4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke_23;
    v12[3] = &unk_1E68B09C0;
    v12[4] = self;
    id v13 = v8;
    char v14 = v6;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke(uint64_t a1, unint64_t a2)
{
  v11[413] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 64);
  if (0xDAB7EC1DD3431B57 * ((*(void *)(*(void *)(a1 + 40) + 72) - v5) >> 5) <= a2)
  {
    unint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      unint64_t v10 = 0xDAB7EC1DD3431B57
          * ((uint64_t)(*(void *)(*(void *)(a1 + 40) + 72) - *(void *)(*(void *)(a1 + 40) + 64)) >> 5);
      LODWORD(v11[0]) = 138412802;
      *(id *)((char *)v11 + 4) = v9;
      WORD2(v11[1]) = 2048;
      *(id *)((char *)&v11[1] + 6) = (id)a2;
      HIWORD(v11[2]) = 2048;
      v11[3] = (id)v10;
      _os_log_fault_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_FAULT, "%@ - lockscreen prediction index (%lu) is out of range of _predictionItems (%li)", (uint8_t *)v11, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = (id *)(v5 + 3296 * a2);
    v11[0] = *v6;
    memcpy(&v11[1], v6 + 1, 0xCD2uLL);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke_23(uint64_t a1, void *a2, unint64_t a3)
{
  v13[413] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
  if (0xDAB7EC1DD3431B57 * ((*(void *)(*(void *)(a1 + 32) + 72) - v6) >> 5) <= a3)
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      unint64_t v10 = NSStringFromClass(v9);
      id v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 48)];
      unint64_t v12 = 0xDAB7EC1DD3431B57
          * ((uint64_t)(*(void *)(*(void *)(a1 + 32) + 72) - *(void *)(*(void *)(a1 + 32) + 64)) >> 5);
      LODWORD(v13[0]) = 138413058;
      *(id *)((char *)v13 + 4) = v10;
      WORD2(v13[1]) = 2112;
      *(id *)((char *)&v13[1] + 6) = v11;
      HIWORD(v13[2]) = 2048;
      v13[3] = (id)a3;
      LOWORD(v13[4]) = 2048;
      *(id *)((char *)&v13[4] + 2) = (id)v12;
      _os_log_fault_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_FAULT, "%@ - %@ prediction index (%lu) is out of range of _predictionItems (%li)", (uint8_t *)v13, 0x2Au);
    }
  }
  else
  {
    unint64_t v7 = (id *)(v6 + 3296 * a3);
    v13[0] = *v7;
    memcpy(&v13[1], v7 + 1, 0xCD2uLL);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)_getExtraPredictionsFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6
{
  id v9 = a3;
  unint64_t v10 = *(id **)a4;
  for (uint64_t i = (id *)*((void *)a4 + 1); i != v10; *i)
    i -= 412;
  *((void *)a4 + 1) = v10;
  unint64_t v12 = [MEMORY[0x1E4F4B068] stringKeyWithData:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__ATXActionCacheReader__getExtraPredictionsFromChunk_map_abGroup_assetVersion___block_invoke;
  v15[3] = &__block_descriptor_40_e39_v52__0_B8__NSString_16Q24f32r_f36B44B48l;
  void v15[4] = a4;
  [v12 enumerateApps:v15];
  if (a5)
  {
    id v13 = [v12 abGroup];
    id v14 = *a5;
    *a5 = v13;
  }
  if (a6) {
    *a6 = [v12 assetVersion];
  }
}

void __79__ATXActionCacheReader__getExtraPredictionsFromChunk_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = *(char ***)(a1 + 32);
  id v12 = v10;
  memcpy(__dst, a6, sizeof(__dst));
  unint64_t v13 = (unint64_t)v11[1];
  unint64_t v14 = (unint64_t)v11[2];
  if (v13 >= v14)
  {
    unint64_t v16 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v13 - (void)*v11) >> 5);
    if (v16 + 1 > 0x13E22CBCE4A902) {
      std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v17 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v14 - (void)*v11) >> 5);
    uint64_t v18 = 2 * v17;
    if (2 * v17 <= v16 + 1) {
      uint64_t v18 = v16 + 1;
    }
    if (v17 >= 0x9F1165E725481) {
      unint64_t v19 = 0x13E22CBCE4A902;
    }
    else {
      unint64_t v19 = v18;
    }
    v32[4] = v11 + 2;
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)(v11 + 2), v19);
      uint64_t v22 = v21;
    }
    else
    {
      v20 = 0;
      uint64_t v22 = 0;
    }
    int v23 = &v20[3296 * v16];
    *(void *)int v23 = v12;
    *((void *)v23 + 1) = a5;
    memcpy(v23 + 16, __dst, 0xCC4uLL);
    *((float *)v23 + 821) = a2;
    *((_WORD *)v23 + 1644) = 0;
    v25 = *v11;
    uint64_t v24 = v11[1];
    if (v24 == *v11)
    {
      v30 = v11[1];
      v26 = v23;
    }
    else
    {
      v26 = v23;
      do
      {
        v27 = v24 - 3296;
        uint64_t v28 = *((void *)v24 - 412);
        v29 = v26 - 3288;
        v26 -= 3296;
        *((void *)v24 - 412) = 0;
        *(void *)v26 = v28;
        memcpy(v29, v24 - 3288, 0xCD2uLL);
        uint64_t v24 = v27;
      }
      while (v27 != v25);
      v30 = *v11;
      uint64_t v24 = v11[1];
    }
    v15 = v23 + 3296;
    void *v11 = v26;
    v32[0] = v30;
    v32[1] = v30;
    v11[1] = v15;
    v32[2] = v24;
    int v31 = v11[2];
    v11[2] = &v20[3296 * v22];
    v32[3] = v31;
    std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v32);
  }
  else
  {
    *(void *)unint64_t v13 = v12;
    *(void *)(v13 + 8) = a5;
    memcpy((void *)(v13 + 16), __dst, 0xCC4uLL);
    *(float *)(v13 + 3284) = a2;
    *(_WORD *)(v13 + 3288) = 0;
    v15 = (char *)(v13 + 3296);
  }
  v11[1] = v15;
}

+ (unordered_map<NSString)getActionKeyToPredictionItemMapFromChunk:()ATXNSStringHash
{
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  return (unordered_map<NSString *, ATXPredictionItem, ATXNSStringHash, ATXNSStringEqual, std::allocator<std::pair<NSString *const, ATXPredictionItem>>> *)+[ATXActionCacheReader _getActionKeyToPredictionItemMapFromChunk:a4 map:retstr abGroup:0 assetVersion:0];
}

+ (void)_getActionKeyToPredictionItemMapFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6
{
  id v9 = a3;
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::clear((uint64_t)a4);
  id v10 = [MEMORY[0x1E4F4B068] stringKeyWithData:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__ATXActionCacheReader__getActionKeyToPredictionItemMapFromChunk_map_abGroup_assetVersion___block_invoke;
  v13[3] = &__block_descriptor_40_e39_v52__0_B8__NSString_16Q24f32r_f36B44B48l;
  v13[4] = a4;
  [v10 enumerateApps:v13];
  if (a5)
  {
    id v11 = [v10 abGroup];
    id v12 = *a5;
    *a5 = v11;
  }
  if (a6) {
    *a6 = [v10 assetVersion];
  }
}

void __91__ATXActionCacheReader__getActionKeyToPredictionItemMapFromChunk_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, void *a5, const void *a6)
{
  id v15 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11[0] = v15;
  v11[1] = a5;
  float v13 = a2;
  __int16 v14 = 0;
  memcpy(v12, a6, sizeof(v12));
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,ATXPredictionItem>(v10, &v15, &v15, (uint64_t *)v11);
}

+ (void)_getIndexToPredictionItemMapWithChunk:(id)a3 withPredictionCount:(int64_t)a4 map:(void *)a5 abGroup:(id *)a6 assetVersion:(int64_t *)a7
{
  id v12 = a3;
  std::vector<ATXPredictionItem>::resize((uint64_t)a5, a4);
  float v13 = [MEMORY[0x1E4F4B068] numberKeyWithData:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__ATXActionCacheReader__getIndexToPredictionItemMapWithChunk_withPredictionCount_map_abGroup_assetVersion___block_invoke;
  v16[3] = &__block_descriptor_56_e39_v52__0_B8__NSNumber_16Q24f32r_f36B44B48l;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = a1;
  [v13 enumerateApps:v16];
  if (a6)
  {
    __int16 v14 = [v13 abGroup];
    id v15 = *a6;
    *a6 = v14;
  }
  if (a7) {
    *a7 = [v13 assetVersion];
  }
}

void __107__ATXActionCacheReader__getIndexToPredictionItemMapWithChunk_withPredictionCount_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6, char a7, char a8)
{
  v24[409] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  unint64_t v15 = [v14 integerValue];
  unint64_t v16 = v15;
  if ((int64_t)v15 >= *(void *)(a1 + 32)
    || v15 >= 0xDAB7EC1DD3431B57 * ((uint64_t)(*(void *)(*(void *)(a1 + 40) + 8) - **(void **)(a1 + 40)) >> 5))
  {
    v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = NSStringFromClass(*(Class *)(a1 + 48));
      uint64_t v22 = *(void *)(a1 + 32);
      unint64_t v23 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*(void *)(*(void *)(a1 + 40) + 8) - **(void **)(a1 + 40)) >> 5);
      LODWORD(v24[0]) = 138413058;
      *(void *)((char *)v24 + 4) = v21;
      WORD2(v24[1]) = 2048;
      *(void *)((char *)&v24[1] + 6) = v22;
      HIWORD(v24[2]) = 2048;
      v24[3] = v16;
      LOWORD(v24[4]) = 2048;
      *(void *)((char *)&v24[4] + 2) = v23;
      _os_log_fault_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_FAULT, "%@ - feedback data shouldn't have data which isn't included in the prediction set. (count: %li, index: %li, map size: %li)", (uint8_t *)v24, 0x2Au);
    }
  }
  else
  {
    memcpy(v24, a6, 0xCC4uLL);
    unint64_t v17 = *(void **)(a1 + 40);
    if (0xDAB7EC1DD3431B57 * ((uint64_t)(v17[1] - *v17) >> 5) <= v16) {
      std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v18 = *v17 + 3296 * v16;
    unint64_t v19 = *(void **)v18;
    *(void *)uint64_t v18 = &stru_1F2740B58;

    *(void *)(v18 + 8) = a5;
    memcpy((void *)(v18 + 16), v24, 0xCC4uLL);
    *(float *)(v18 + 3284) = a2;
    *(unsigned char *)(v18 + 3288) = a7;
    *(unsigned char *)(v18 + 3289) = a8;
  }
}

- (unordered_map<ATXAction)_getActionToIndexMap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  uint64_t v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ATXActionCacheClientReader *)self actionsWithLimit:0x7FFFFFFFLL shouldFilterRestrictedAppsAndRecentEngagements:0];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) predictedItem];
        std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::__emplace_unique_key_args<ATXAction * {__strong},ATXAction * {__strong},long &>((uint64_t)retstr, &v9, (uint64_t *)&v9, &v14);

        ++v14;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  return result;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
  p_extraPredictionItems = &self->_extraPredictionItems;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_extraPredictionItems);
  p_extraPredictionItems = &self->_predictionItems;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_extraPredictionItems);
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)&self->_actionToIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void)initWithChunks:(uint64_t)a3 .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "We were passed data with %lu chunks but expected %lu", buf, 0x16u);
}

- (void)predictionItemForAction:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "%@ - Index return from _actionToIndexMap is out of range of _secondStage.", buf, 0xCu);
}

@end