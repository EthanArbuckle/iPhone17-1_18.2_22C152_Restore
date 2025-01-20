@interface ATXBehavioralPredictionsFeatureCache
- (ATXBehavioralPredictionsFeatureCache)init;
- (ATXPredictionItem)itemForBundleId:(SEL)a3;
- (vector<ATXPredictionItem,)itemsForBundleIds:(ATXBehavioralPredictionsFeatureCache *)self;
- (void)addItem:(ATXPredictionItem *)a3 forBundleId:(id)a4;
@end

@implementation ATXBehavioralPredictionsFeatureCache

- (ATXBehavioralPredictionsFeatureCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXBehavioralPredictionsFeatureCache;
  v2 = [(ATXBehavioralPredictionsFeatureCache *)&v9 init];
  if (v2)
  {
    v3 = objc_opt_new();
    memset(v7, 0, sizeof(v7));
    int v8 = 1065353216;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__move_assign((uint64_t)v3 + 8, (uint64_t *)v7);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::~__hash_table((uint64_t)v7);
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v4;
  }
  return v2;
}

- (ATXPredictionItem)itemForBundleId:(SEL)a3
{
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0xD1012000000;
  v18 = __Block_byref_object_copy__38;
  v19 = __Block_byref_object_dispose__38;
  uint64_t v20 = 256;
  id v21 = 0;
  float v22 = -31337.0;
  __int16 v23 = 0;
  for (uint64_t i = 64; i != 3332; i += 4)
    *(float *)((char *)&v15 + i) = -31337.0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke;
  v12[3] = &unk_1E68AF5F0;
  id v13 = v6;
  v14 = &v15;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v12];
  v10 = v16;
  retstr->key = (NSString *)(id)v16[6];
  memcpy(&retstr->actionHash, v10 + 7, 0xCD2uLL);

  _Block_object_dispose(&v15, 8);
  return result;
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  v5 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v3 + 1, (id *)(a1 + 32));
  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_2((uint64_t *)(a1 + 32), v6);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    objc_storeStrong((id *)(v7 + 48), v5[3]);
    memcpy((void *)(v7 + 56), v5 + 4, 0xCD2uLL);
  }
  else
  {
    int v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_1(v4, v8);
    }
  }
}

- (void)addItem:(ATXPredictionItem *)a3 forBundleId:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __60__ATXBehavioralPredictionsFeatureCache_addItem_forBundleId___block_invoke;
  v9[3] = &unk_1F272A6F8;
  id v10 = v6;
  v11 = a3->key;
  memcpy(v12, &a3->actionHash, sizeof(v12));
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __60__ATXBehavioralPredictionsFeatureCache_addItem_forBundleId___block_invoke(id *a1, void *a2)
{
  uint64_t v3 = (uint64_t)a2 + 8;
  id v4 = a2;
  *(void *)&long long v5 = a1[4];
  *((void *)&v5 + 1) = a1[5];
  memcpy(v6, a1 + 6, sizeof(v6));
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},ATXPredictionItem>>(v3, (id *)&v5, &v5);
}

- (vector<ATXPredictionItem,)itemsForBundleIds:(ATXBehavioralPredictionsFeatureCache *)self
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    p_end_cap = &retstr->__end_cap_;
    uint64_t v35 = *(void *)v39;
    v33 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v34 = v8;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v7);
        }
        [(ATXBehavioralPredictionsFeatureCache *)self itemForBundleId:*(void *)(*((void *)&v38 + 1) + 8 * v10)];
        v11 = v36;
        if (v36)
        {
          end = retstr->__end_;
          value = retstr->__end_cap_.__value_;
          if (end >= value)
          {
            unint64_t v15 = 0xDAB7EC1DD3431B57 * (((char *)end - (char *)retstr->__begin_) >> 5);
            unint64_t v16 = v15 + 1;
            if (v15 + 1 > 0x13E22CBCE4A902) {
              std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v17 = 0xDAB7EC1DD3431B57 * (((char *)value - (char *)retstr->__begin_) >> 5);
            if (2 * v17 > v16) {
              unint64_t v16 = 2 * v17;
            }
            if (v17 >= 0x9F1165E725481) {
              unint64_t v18 = 0x13E22CBCE4A902;
            }
            else {
              unint64_t v18 = v16;
            }
            v42[4] = p_end_cap;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)p_end_cap, v18);
              uint64_t v21 = v20;
              v11 = v36;
            }
            else
            {
              v19 = 0;
              uint64_t v21 = 0;
            }
            float v22 = (ATXPredictionItem *)&v19[3296 * v15];
            v22->key = (NSString *)v11;
            memcpy(&v22->actionHash, v37, 0xCD2uLL);
            begin = retstr->__begin_;
            v24 = retstr->__end_;
            if (v24 == retstr->__begin_)
            {
              begin = retstr->__end_;
              v26 = (ATXPredictionItem *)&v19[3296 * v15];
            }
            else
            {
              id v25 = v7;
              v26 = (ATXPredictionItem *)&v19[3296 * v15];
              v27 = retstr->__end_;
              do
              {
                v28 = v27 - 1;
                key = v27[-1].key;
                p_actionHash = &v26[-1].actionHash;
                --v26;
                v27[-1].key = 0;
                v26->key = key;
                memcpy(p_actionHash, &v27[-1].actionHash, 0xCD2uLL);
                v27 = v28;
              }
              while (v28 != begin);
              id v7 = v25;
              self = v33;
            }
            v14 = v22 + 1;
            retstr->__begin_ = v26;
            retstr->__end_ = v14;
            v31 = retstr->__end_cap_.__value_;
            retstr->__end_cap_.__value_ = (ATXPredictionItem *)&v19[3296 * v21];
            v42[2] = v24;
            v42[3] = v31;
            v42[1] = begin;
            v42[0] = begin;
            std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v42);
            p_end_cap = &retstr->__end_cap_;
            uint64_t v8 = v34;
          }
          else
          {
            end->key = (NSString *)v36;
            memcpy(&end->actionHash, v37, 0xCD2uLL);
            v14 = end + 1;
          }
          retstr->__end_ = v14;
          v11 = v36;
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }

  return result;
}

- (void).cxx_destruct
{
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXBehavioralPredictionsFeatureCache: Cache miss for %@", (uint8_t *)&v3, 0xCu);
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXBehavioralPredictionsFeatureCache: Cache hit for %@", (uint8_t *)&v3, 0xCu);
}

@end