@interface ATXAppPredictionFeedbackItem
+ (id)feedbackItemsForCacheFileData:(id)a3;
+ (id)feedbackItemsForChunks:(id)a3;
+ (id)feedbackItemsForFeedbackChunk:(id)a3;
+ (id)feedbackItemsForResponse:(id)a3;
+ (vector<ATXPredictionItem,)predictionItemsForFeedbackChunk:(id)a2;
+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheChunks:(id)a2;
+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheFileData:(id)a2;
- (ATXAppPredictionFeedbackItem)initWithBundleId:(id)a3 totalScore:(float)a4 scoreInputs:(const float *)a5;
- (NSString)bundleId;
- (const)scoreInputs;
- (float)totalScore;
- (id)description;
@end

@implementation ATXAppPredictionFeedbackItem

- (ATXAppPredictionFeedbackItem)initWithBundleId:(id)a3 totalScore:(float)a4 scoreInputs:(const float *)a5
{
  id v9 = a3;
  if (v9)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXAppPredictionFeedbackItem.mm", 32, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"ATXAppPredictionFeedbackItem.mm", 33, @"Invalid parameter not satisfying: %@", @"scoreInputs" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)ATXAppPredictionFeedbackItem;
  v10 = [(ATXAppPredictionFeedbackItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    v10->_totalScore = a4;
    memcpy(v10->_scoreInputs, a5, sizeof(v10->_scoreInputs));
  }

  return v10;
}

- (const)scoreInputs
{
  return self->_scoreInputs;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  for (unint64_t i = 0; i != 817; ++i)
  {
    objc_msgSend(v3, "appendFormat:", @" %f", self->_scoreInputs[i]);
    if (i <= 0x32F) {
      [v3 appendFormat:@", "];
    }
  }
  [v3 appendString:@" ]"];
  v5 = [NSString stringWithFormat:@"%@:\n  totalScore:  %f\n  scoreInputs: %@\n", self->_bundleId, self->_totalScore, v3];

  return v5;
}

+ (id)feedbackItemsForResponse:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [v3 cacheFileData];
  v6 = [v4 feedbackItemsForCacheFileData:v5];

  return v6;
}

+ (id)feedbackItemsForCacheFileData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = ATXCacheFileSplitChunks();
    v5 = +[ATXAppPredictionFeedbackItem feedbackItemsForChunks:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)feedbackItemsForChunks:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] < 2)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[ATXAppPredictionFeedbackItem feedbackItemsForChunks:](v8, [v3 count], v6);
    }

    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v4 = [v3 objectAtIndexedSubscript:1];
    v5 = +[ATXAppPredictionFeedbackItem feedbackItemsForFeedbackChunk:v4];
  }
  return v5;
}

+ (id)feedbackItemsForFeedbackChunk:(id)a3
{
  id v3 = [MEMORY[0x1E4F4B068] stringKeyWithData:a3];
  v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ATXAppPredictionFeedbackItem_feedbackItemsForFeedbackChunk___block_invoke;
  v7[3] = &unk_1E68B4398;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateApps:v7];

  return v5;
}

void __62__ATXAppPredictionFeedbackItem_feedbackItemsForFeedbackChunk___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v13 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  v10 = [ATXAppPredictionFeedbackItem alloc];
  *(float *)&double v11 = a2;
  v12 = [(ATXAppPredictionFeedbackItem *)v10 initWithBundleId:v13 totalScore:a6 scoreInputs:v11];
  [v9 addObject:v12];
}

+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheFileData:(id)a2
{
  ATXCacheFileSplitChunks();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheChunks:](ATXAppPredictionFeedbackItem, "predictionItemsInFeedbackChunkFromCacheChunks:");

  return result;
}

+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheChunks:(id)a2
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  if ((unint64_t)[v5 count] < 2)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheChunks:](buf, [v5 count], v7);
    }
  }
  else
  {
    v6 = [v5 objectAtIndexedSubscript:1];
    +[ATXAppPredictionFeedbackItem predictionItemsForFeedbackChunk:v6];
    std::vector<ATXPredictionItem>::__vdeallocate((id **)retstr);
    *(_OWORD *)&retstr->__begin_ = *(_OWORD *)buf;
    retstr->__end_cap_.__value_ = v11;
    double v11 = 0;
    uint64_t v9 = buf;
    memset(buf, 0, sizeof(buf));
    std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  }
  return result;
}

+ (vector<ATXPredictionItem,)predictionItemsForFeedbackChunk:(id)a2
{
  id v5 = [MEMORY[0x1E4F4B068] stringKeyWithData:a4];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x4812000000;
  uint64_t v12 = __Block_byref_object_copy__88;
  id v13 = __Block_byref_object_dispose__88;
  v14 = &unk_1D14E1507;
  memset(v15, 0, sizeof(v15));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ATXAppPredictionFeedbackItem_predictionItemsForFeedbackChunk___block_invoke;
  v8[3] = &unk_1E68B43C0;
  v8[4] = &v9;
  [v5 enumerateApps:v8];
  v6 = v10;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(retstr, (id *)v6[6], (id *)v6[7], 0xDAB7EC1DD3431B57 * ((v6[7] - v6[6]) >> 5));
  _Block_object_dispose(&v9, 8);
  objc_super v16 = (void **)v15;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v16);

  return result;
}

void __64__ATXAppPredictionFeedbackItem_predictionItemsForFeedbackChunk___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6, char a7, char a8)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  memcpy(__dst, a6, sizeof(__dst));
  v15 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
  unint64_t v16 = v15[3].u64[1];
  unint64_t v17 = v15[4].u64[0];
  if (v16 >= v17)
  {
    uint64_t v19 = v15[3].i64[0];
    unint64_t v20 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v16 - v19) >> 5);
    if (v20 + 1 > 0x13E22CBCE4A902) {
      std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v21 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v17 - v19) >> 5);
    uint64_t v22 = 2 * v21;
    if (2 * v21 <= v20 + 1) {
      uint64_t v22 = v20 + 1;
    }
    if (v21 >= 0x9F1165E725481) {
      unint64_t v23 = 0x13E22CBCE4A902;
    }
    else {
      unint64_t v23 = v22;
    }
    v39 = v15 + 4;
    if (v23)
    {
      v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)v15[4].i64, v23);
      uint64_t v26 = v25;
    }
    else
    {
      v24 = 0;
      uint64_t v26 = 0;
    }
    v27 = &v24[3296 * v20];
    *(void *)v27 = v14;
    *((void *)v27 + 1) = a5;
    memcpy(v27 + 16, __dst, 0xCC4uLL);
    *((float *)v27 + 821) = a2;
    v27[3288] = a7;
    v27[3289] = a8;
    uint64_t v29 = v15[3].i64[0];
    unint64_t v28 = v15[3].u64[1];
    if (v28 == v29)
    {
      int64x2_t v34 = vdupq_n_s64(v28);
      v30 = v27;
    }
    else
    {
      v30 = v27;
      do
      {
        unint64_t v31 = v28 - 3296;
        uint64_t v32 = *(void *)(v28 - 3296);
        v33 = v30 - 3288;
        v30 -= 3296;
        *(void *)(v28 - 3296) = 0;
        *(void *)v30 = v32;
        memcpy(v33, (const void *)(v28 - 3288), 0xCD2uLL);
        unint64_t v28 = v31;
      }
      while (v31 != v29);
      int64x2_t v34 = v15[3];
    }
    v18 = v27 + 3296;
    v15[3].i64[0] = (uint64_t)v30;
    v15[3].i64[1] = (uint64_t)(v27 + 3296);
    int64x2_t v37 = v34;
    uint64_t v35 = v15[4].i64[0];
    v15[4].i64[0] = (uint64_t)&v24[3296 * v26];
    uint64_t v38 = v35;
    uint64_t v36 = v34.i64[0];
    std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)&v36);
  }
  else
  {
    *(void *)unint64_t v16 = v14;
    *(void *)(v16 + 8) = a5;
    memcpy((void *)(v16 + 16), __dst, 0xCC4uLL);
    *(float *)(v16 + 3284) = a2;
    *(unsigned char *)(v16 + 3288) = a7;
    v18 = (char *)(v16 + 3296);
    *(unsigned char *)(v16 + 3289) = a8;
  }
  v15[3].i64[1] = (uint64_t)v18;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (float)totalScore
{
  return self->_totalScore;
}

- (void).cxx_destruct
{
}

+ (void)feedbackItemsForChunks:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "feedbackItemsForChunks received only %lu chunks", buf, 0xCu);
}

+ (void)predictionItemsInFeedbackChunkFromCacheChunks:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "predictionItemsInFeedbackChunkFromCacheChunks received only %lu chunks", buf, 0xCu);
}

@end