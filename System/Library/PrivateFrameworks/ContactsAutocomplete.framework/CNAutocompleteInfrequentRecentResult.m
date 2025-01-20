@interface CNAutocompleteInfrequentRecentResult
+ (id)comparators;
+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7;
+ (id)groupResultWithDisplayName:(id)a3 dateCount:(unint64_t)a4 date:(id)a5;
+ (unint64_t)category;
- (unint64_t)dateCount;
- (void)setDateCount:(unint64_t)a3;
@end

@implementation CNAutocompleteInfrequentRecentResult

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7
{
  id result = (id)[a1 contactResultWithDisplayName:a3 value:a4 lastSendingAddress:a5 date:a7];
  *((void *)result + 19) = a6;
  return result;
}

+ (id)groupResultWithDisplayName:(id)a3 dateCount:(unint64_t)a4 date:(id)a5
{
  id result = (id)[a1 groupResultWithDisplayName:a3 date:a5];
  *((void *)result + 19) = a4;
  return result;
}

+ (id)comparators
{
  if (comparators_cn_once_token_15 != -1) {
    dispatch_once(&comparators_cn_once_token_15, &__block_literal_global_273);
  }
  v2 = (void *)comparators_cn_once_object_15;
  return v2;
}

void __51__CNAutocompleteInfrequentRecentResult_comparators__block_invoke()
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v1 = _Block_copy(sSortResultsByCategory);
  v12[0] = v1;
  v2 = _Block_copy(sSortRecentResultsByCompletingChosenGroup);
  v12[1] = v2;
  v3 = _Block_copy(sSortResultsByPreferredDomain);
  v12[2] = v3;
  v4 = _Block_copy(sSortRecentResultsByDateCount);
  v12[3] = v4;
  v5 = _Block_copy(sSortRecentResultsBySendingAddressMatch);
  v12[4] = v5;
  v6 = _Block_copy(sSortRecentResultsByDate);
  v12[5] = v6;
  v7 = _Block_copy(sSortResultsByDisplayName);
  v12[6] = v7;
  v8 = _Block_copy(sSortResultsByAddress);
  v12[7] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];
  uint64_t v10 = [v0 initWithArray:v9];
  v11 = (void *)comparators_cn_once_object_15;
  comparators_cn_once_object_15 = v10;
}

+ (unint64_t)category
{
  return 6;
}

- (unint64_t)dateCount
{
  return self->_dateCount;
}

- (void)setDateCount:(unint64_t)a3
{
  self->_dateCount = a3;
}

@end