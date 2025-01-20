@interface CNAutocompleteRecentResult
+ (id)comparators;
+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6;
+ (id)groupResultWithDisplayName:(id)a3 date:(id)a4;
- (BOOL)completesChosenGroup;
- (BOOL)matchesSendingAddress;
- (NSDate)date;
- (void)setCompletesChosenGroup:(BOOL)a3;
- (void)setMatchesSendingAddress:(BOOL)a3;
@end

@implementation CNAutocompleteRecentResult

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = [a1 contactResultWithDisplayName:a3 value:a4 nameComponents:0 identifier:0];
  uint64_t v13 = [v10 copy];

  v14 = (void *)v12[17];
  v12[17] = v13;

  [v12 setLastSendingAddress:v11];
  return v12;
}

+ (id)groupResultWithDisplayName:(id)a3 date:(id)a4
{
  id v6 = a4;
  v7 = [a1 groupResultWithDisplayName:a3 identifier:0];
  uint64_t v8 = [v6 copy];

  v9 = (void *)v7[17];
  v7[17] = v8;

  return v7;
}

+ (id)comparators
{
  if (comparators_cn_once_token_14 != -1) {
    dispatch_once(&comparators_cn_once_token_14, &__block_literal_global_243);
  }
  v2 = (void *)comparators_cn_once_object_14;
  return v2;
}

void __41__CNAutocompleteRecentResult_comparators__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v1 = _Block_copy(sSortResultsByCategory);
  id v11 = v1;
  v2 = _Block_copy(sSortRecentResultsByCompletingChosenGroup);
  v12 = v2;
  v3 = _Block_copy(sSortResultsByPreferredDomain);
  uint64_t v13 = v3;
  v4 = _Block_copy(sSortRecentResultsBySendingAddressMatch);
  v14 = v4;
  v5 = _Block_copy(sSortRecentResultsByDate);
  v15 = v5;
  id v6 = _Block_copy(sSortResultsByDisplayName);
  v16 = v6;
  v7 = _Block_copy(sSortResultsByAddress);
  v17 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:7];
  uint64_t v9 = objc_msgSend(v0, "initWithArray:", v8, v11, v12, v13, v14, v15, v16);
  id v10 = (void *)comparators_cn_once_object_14;
  comparators_cn_once_object_14 = v9;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)matchesSendingAddress
{
  return self->_matchesSendingAddress;
}

- (void)setMatchesSendingAddress:(BOOL)a3
{
  self->_matchesSendingAddress = a3;
}

- (BOOL)completesChosenGroup
{
  return self->_completesChosenGroup;
}

- (void)setCompletesChosenGroup:(BOOL)a3
{
  self->_completesChosenGroup = a3;
}

- (void).cxx_destruct
{
}

@end